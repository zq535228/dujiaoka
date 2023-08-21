FROM ioiox/php-nginx:7.4-alpine

WORKDIR /
COPY ./conf/default.conf /opt/docker/etc/nginx/vhost.conf
COPY ./conf/dujiao.conf /opt/docker/etc/supervisor.d/

COPY . /dujiaoka
WORKDIR /dujiaoka

RUN [ "sh", "-c", "composer install --ignore-platform-reqs" ]
RUN [ "sh", "-c", "chmod -R 777 /dujiaoka" ]

