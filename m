Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f53.google.com (mail-yw1-f53.google.com
	[209.85.161.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9507D7BDA1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2019 14:26:14 +0000 (UTC)
Received: by mail-yw1-f53.google.com with SMTP id p65so5301263ywe.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2019 06:26:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SWcbO9KVMFV881yWHSgZX8gcazYqsKsdg0mYvi0NSAQ=;
	b=YbXok9iV83256h5/ykBBZHgYLSm42m/0iBYQHhwi73wKk5BVFPT6q4Fi7Z7PN5TrrX
	6YwU3pKwonEiRUwehPHr2sjuin8AmMltVI/Wedmn6dHSfnHdU3ZxKk7pordpjvR7pTNG
	S46I9LwQmj6VbsU00nYwH6vtxue2HQ8mP1NdDH9E4TSBcoSCt3gG7WYy/TgZKUi3a6QZ
	asv/LrqvTTLBrhbeIYEJeXA8SmcS9gifFh8u9ccVj0wooI1jl/LuPKP+0Eqx+ucOhJUp
	n64uCdwwIiGRrhVFptvf31kePvviCYCLiivx1bCX1yehWdXIyKsOPbFNeeahdKYN1LcV
	Qj+w==
X-Gm-Message-State: AJcUukdB926P3UZT5OvQnfQM8kHCFYJgkL6LvckxSM1waM6Auwur4f4Q
	7loZ/CIegclDi5+LouJRcxbTZRnm
X-Google-Smtp-Source: ALg8bN51tpMY9ZwYl3vYrAjew0LCFe24/hwkB3B7z8Bn/KhlCr969Aw6lL5Km8krcmlms+wai6Ap1w==
X-Received: by 2002:a81:a705:: with SMTP id e5mr18294013ywh.111.1547821575371; 
	Fri, 18 Jan 2019 06:26:15 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	b144sm2618229ywa.33.2019.01.18.06.26.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Jan 2019 06:26:14 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jan 2019 14:26:11 +0000
Message-Id: <20190118142611.21544-2-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190118142611.21544-1-git@andred.net>
References: <20190118142611.21544-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 2/2] nginx: configuration update
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jan 2019 14:26:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Restructure the main configuration file to simplify custom configuration:
* support inclusion of configuration fragments from subdirectories:
  - /etc/nginx/modules-enabled/*.conf
  - /etc/nginx/conf.d/*.conf
  - /etc/nginx/sites-enabled/*
* default site (port 80):
  - move into /etc/nginx/sites-available/default_server
    and enable via symlink in /etc/nginx/sites-enabled/
  - listen on IPv6
  - drop unneeded example fragments
* configure and enable gzip
* update TLS settings to drop SSLv3 and enable TLSv1.3 for some safer
  defaults
* update remaining bits to follow Debian standard configuration
  https://salsa.debian.org/nginx-team/nginx/blob/62a54a8ba66ee6cc1b4f8a33dab9a6f27a3fdac4/debian/conf/nginx.conf
* drop unneeded example configuration bits from /etc/nginx/*.default

These changes, in particular the configuration fragment
support allow to easily customise nginx based on individual
requirements.
In addition, it is now possible for other recipes / packages
to drop fragments into the respective directories in /etc/nginx
without having to meddle with /etc/nginx/nginx.conf

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 .../nginx/files/default_server.site           |  14 ++
 .../recipes-httpd/nginx/files/nginx.conf      | 139 +++++-------------
 meta-webserver/recipes-httpd/nginx/nginx.inc  |  14 ++
 3 files changed, 62 insertions(+), 105 deletions(-)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/default_server.site

diff --git a/meta-webserver/recipes-httpd/nginx/files/default_server.site b/meta-webserver/recipes-httpd/nginx/files/default_server.site
new file mode 100644
index 000000000..7a8a215cf
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/default_server.site
@@ -0,0 +1,14 @@
+# Default server configuration
+server {
+    listen 80 default_server;
+    listen [::]:80 default_server;
+
+    root /var/www/localhost/html;
+
+    index index.html index.htm;
+
+    server_name _;
+
+    # redirect server error pages to the static page /50x.html
+    error_page 500 502 503 504 /50x.html;
+}
diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.conf b/meta-webserver/recipes-httpd/nginx/files/nginx.conf
index 69d3a2adc..6d219422b 100644
--- a/meta-webserver/recipes-httpd/nginx/files/nginx.conf
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx.conf
@@ -1,118 +1,47 @@
-
 user  www;
-worker_processes  1;
-
-error_log  /var/log/nginx/error.log;
-#error_log  logs/error.log  notice;
-#error_log  logs/error.log  info;
-
-pid        /run/nginx/nginx.pid;
-
+worker_processes 1;
+pid /run/nginx/nginx.pid;
+include /etc/nginx/modules-enabled/*.conf;
 
 events {
-    worker_connections  1024;
+    worker_connections 768;
+    # multi_accept on;
 }
 
-
 http {
-    include       mime.types;
+    # Basic Settings
+    sendfile on;
+    tcp_nopush on;
+    tcp_nodelay on;
+    keepalive_timeout 65;
+    types_hash_max_size 2048;
+    # server_tokens off;
+
+    # server_names_hash_bucket_size 64;
+    # server_name_in_redirect off;
+
+    include       /etc/nginx/mime.types;
     default_type  application/octet-stream;
 
-    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
-                      '$status $body_bytes_sent "$http_referer" '
-                      '"$http_user_agent" "$http_x_forwarded_for"';
-
-    access_log  /var/log/nginx/access.log  main;
-
-    sendfile        on;
-    #tcp_nopush     on;
-
-    #keepalive_timeout  0;
-    keepalive_timeout  65;
-
-    #gzip  on;
-
-    server {
-        listen       80;
-        server_name  localhost;
-
-        #charset koi8-r;
-
-        #access_log  logs/host.access.log  main;
-
-        location / {
-            root   /var/www/localhost/html;
-            index  index.html index.htm;
-        }
-
-        #error_page  404              /404.html;
-
-        # redirect server error pages to the static page /50x.html
-        #
-        error_page   500 502 503 504  /50x.html;
-        location = /50x.html {
-            root   /var/www/localhost/html;
-        }
-
-        # proxy the PHP scripts to Apache listening on 127.0.0.1:80
-        #
-        #location ~ \.php$ {
-        #    proxy_pass   http://127.0.0.1;
-        #}
-
-        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
-        #
-        #location ~ \.php$ {
-        #    root           html;
-        #    fastcgi_pass   127.0.0.1:9000;
-        #    fastcgi_index  index.php;
-        #    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
-        #    include        fastcgi_params;
-        #}
-
-        # deny access to .htaccess files, if Apache's document root
-        # concurs with nginx's one
-        #
-        #location ~ /\.ht {
-        #    deny  all;
-        #}
-    }
-
-
-    # another virtual host using mix of IP-, name-, and port-based configuration
-    #
-    #server {
-    #    listen       8000;
-    #    listen       somename:8080;
-    #    server_name  somename  alias  another.alias;
-
-    #    location / {
-    #        root   html;
-    #        index  index.html index.htm;
-    #    }
-    #}
-
-
-    # HTTPS server
-    #
-    #server {
-    #    listen       443;
-    #    server_name  localhost;
-
-    #    ssl                  on;
-    #    ssl_certificate      cert.pem;
-    #    ssl_certificate_key  cert.key;
+    # SSL Settings
+    ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE
+    ssl_prefer_server_ciphers on;
 
-    #    ssl_session_timeout  5m;
+    ## Logging
+    access_log /var/log/nginx/access.log;
+    error_log /var/log/nginx/error.log;
 
-    #    ssl_protocols  SSLv2 SSLv3 TLSv1;
-    #    ssl_ciphers  HIGH:!aNULL:!MD5;
-    #    ssl_prefer_server_ciphers   on;
+    ## Gzip settings
+    gzip  on;
 
-    #    location / {
-    #        root   html;
-    #        index  index.html index.htm;
-    #    }
-    #}
+    gzip_vary on;
+    gzip_proxied any;
+    gzip_comp_level 6;
+    gzip_buffers 16 8k;
+    gzip_http_version 1.1;
+    gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;
 
+    ## Virtual Host Configs
+    include /etc/nginx/conf.d/*.conf;
+    include /etc/nginx/sites-enabled/*;
 }
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index ea1c1f782..522942504 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -16,6 +16,7 @@ SRC_URI = " \
     file://nginx-cross.patch \
     file://0001-Allow-the-overriding-of-the-endianness-via-the-confi.patch \
     file://nginx.conf \
+    file://default_server.site \
     file://nginx.init \
     file://nginx-volatile.conf \
     file://nginx.service \
@@ -102,15 +103,28 @@ do_install () {
 
     install -d ${D}${sysconfdir}/nginx
     install -m 0644 ${WORKDIR}/nginx.conf ${D}${sysconfdir}/nginx/nginx.conf
+    sed -i 's,/etc/,${sysconfdir}/,g' ${D}${sysconfdir}/nginx/nginx.conf
     sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/nginx/nginx.conf
     sed -i 's/^user.*/user ${NGINX_USER};/g' ${D}${sysconfdir}/nginx/nginx.conf
+    install -Dm 0644 ${WORKDIR}/default_server.site ${D}${sysconfdir}/nginx/sites-available/default_server
+    sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/nginx/sites-available/default_server
     install -d ${D}${sysconfdir}/nginx/sites-enabled
+    ln -s ../sites-available/default_server ${D}${sysconfdir}/nginx/sites-enabled/
 
     install -d ${D}${sysconfdir}/default/volatiles
     install -m 0644 ${WORKDIR}/nginx-volatile.conf ${D}${sysconfdir}/default/volatiles/99_nginx
     sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/default/volatiles/99_nginx
     sed -i 's,@NGINX_USER@,${NGINX_USER},g' ${D}${sysconfdir}/default/volatiles/99_nginx
 
+    # cleanup configuration folder
+    rm ${D}${sysconfdir}/nginx/*.default
+
+    # add additional configuration folders
+    install -d ${D}${sysconfdir}/nginx/modules-available
+    install -d ${D}${sysconfdir}/nginx/modules-enabled
+    install -d ${D}${sysconfdir}/nginx/server-conf.d
+    install -d ${D}${sysconfdir}/nginx/conf.d
+
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};then
         install -d ${D}${systemd_unitdir}/system
         install -m 0644 ${WORKDIR}/nginx.service ${D}${systemd_unitdir}/system/
-- 
2.20.1


