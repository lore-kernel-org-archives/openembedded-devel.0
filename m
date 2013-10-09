Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6DBDD6ADA2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2013 05:34:24 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id x10so385403pdj.29
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2013 22:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=VNJEKBpaYxJsLuszyv8XV3RDgm/KJoCJTn08kxRgdIk=;
	b=JVtP7cwmkDTuJzoRRm+cS2biCX3pkE320ToECpzwMTDSVUigZjT7pam5TmB9ZbDZFE
	MjgN6AZ/ba88fuiOUgFm+bpGQEG8IWnBBYPbuMvCXUAp5h0DRIi1HYlF3XmqHN9YOvF7
	EmNCpgYWH6NcNg2Faan8mlBS9Fa5d8T3fJjT8rp3W5AuUei0t7WQHpbUle1UgRnlVbWZ
	fqHe1B4G+8lAleqpw7opZwrttyJ5GPfE2P8HpJnKrf2VccfcQrb/0iPGmH0zlzdcF/OX
	mdlOCMsMbqyPWj2TJK/R9uO+5jyHtoQpECInJzaThwahXonyGXP4naBU53LkAj+/TeEJ
	vdIw==
X-Received: by 10.66.171.204 with SMTP id aw12mr7466208pac.7.1381296866347;
	Tue, 08 Oct 2013 22:34:26 -0700 (PDT)
Received: from archimedes.arnolds.bogus
	(dsl-66-59-252-223.static.linkline.com. [66.59.252.223])
	by mx.google.com with ESMTPSA id
	nj9sm44044920pbc.13.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Oct 2013 22:34:25 -0700 (PDT)
From: "stephen.arnold42" <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 22:33:44 -0700
Message-Id: <1381296824-30294-1-git-send-email-stephen.arnold42@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-openembedded/meta-webserver][PATCH] nginx: new recipe, updated from aging original in rpi layer (has not been scrubbed for any potential policy issues).
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Oct 2013 05:34:24 -0000

From: "stephen.arnold42" <stephen.arnold42@gmail.com>

Signed-off-by: stephen.arnold42 <stephen.arnold42@gmail.com>
---
 .../nginx/files/nginx-cross_1.4.0.diff             | 212 +++++++++++++++++++++
 .../recipes-httpd/nginx/files/nginx.conf           | 118 ++++++++++++
 .../recipes-httpd/nginx/files/nginx.init           |  52 +++++
 meta-webserver/recipes-httpd/nginx/nginx_1.4.0.bb  |  91 +++++++++
 4 files changed, 473 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/nginx-cross_1.4.0.diff
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/nginx.conf
 create mode 100755 meta-webserver/recipes-httpd/nginx/files/nginx.init
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.4.0.bb

diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx-cross_1.4.0.diff b/meta-webserver/recipes-httpd/nginx/files/nginx-cross_1.4.0.diff
new file mode 100644
index 0000000..2b2bab9
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx-cross_1.4.0.diff
@@ -0,0 +1,212 @@
+diff -uraN nginx-1.0.11.orig/auto/feature nginx-1.0.11/auto/feature
+--- nginx-1.0.11.orig/auto/feature	2011-05-11 06:50:19.000000000 -0500
++++ nginx-1.0.11/auto/feature	2011-12-27 13:56:42.323370040 -0600
+@@ -48,12 +48,20 @@
+ 
+ if [ -x $NGX_AUTOTEST ]; then
+ 
++    if [ ".$NGX_CROSS_COMPILE" = ".yes" ]; then
++        NGX_AUTOTEST_EXEC="true"
++	NGX_FOUND_MSG=" (not tested, cross compiling)"
++    else
++        NGX_AUTOTEST_EXEC="$NGX_AUTOTEST"
++	NGX_FOUND_MSG=""
++    fi
++
+     case "$ngx_feature_run" in
+ 
+         yes)
+             # /bin/sh is used to intercept "Killed" or "Abort trap" messages
+-            if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
+-                echo " found"
++            if /bin/sh -c $NGX_AUTOTEST_EXEC >> $NGX_AUTOCONF_ERR 2>&1; then
++                echo " found$NGX_FOUND_MSG"
+                 ngx_found=yes
+ 
+                 if test -n "$ngx_feature_name"; then
+@@ -67,17 +75,27 @@
+ 
+         value)
+             # /bin/sh is used to intercept "Killed" or "Abort trap" messages
+-            if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
+-                echo " found"
++            if /bin/sh -c $NGX_AUTOTEST_EXEC >> $NGX_AUTOCONF_ERR 2>&1; then
++                echo " found$NGX_FOUND_MSG"
+                 ngx_found=yes
+ 
+-                cat << END >> $NGX_AUTO_CONFIG_H
++                if [ ".$NGX_CROSS_COMPILE" = ".yes" ]; then
++                    cat << END >> $NGX_AUTO_CONFIG_H
+ 
+ #ifndef $ngx_feature_name
+-#define $ngx_feature_name  `$NGX_AUTOTEST`
++#define $ngx_feature_name  $(eval "echo \$NGX_WITH_${ngx_feature_name}")
+ #endif
+ 
+ END
++		else
++                    cat << END >> $NGX_AUTO_CONFIG_H
++
++#ifndef $ngx_feature_name
++#define $ngx_feature_name  `$NGX_AUTOTEST_EXEC`
++#endif
++
++END
++                fi
+             else
+                 echo " found but is not working"
+             fi
+@@ -85,7 +103,7 @@
+ 
+         bug)
+             # /bin/sh is used to intercept "Killed" or "Abort trap" messages
+-            if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
++            if /bin/sh -c $NGX_AUTOTEST_EXEC >> $NGX_AUTOCONF_ERR 2>&1; then
+                 echo " not found"
+ 
+             else
+diff -uraN nginx-1.0.11.orig/auto/options nginx-1.0.11/auto/options
+--- nginx-1.0.11.orig/auto/options	2011-12-14 07:34:16.000000000 -0600
++++ nginx-1.0.11/auto/options	2011-12-27 13:56:42.323370040 -0600
+@@ -289,6 +289,18 @@
+         --test-build-rtsig)              NGX_TEST_BUILD_RTSIG=YES   ;;
+         --test-build-solaris-sendfilev)  NGX_TEST_BUILD_SOLARIS_SENDFILEV=YES ;;
+ 
++        # cross compile support
++        --with-int=*)                    NGX_WITH_INT="$value"          ;;
++        --with-long=*)                   NGX_WITH_LONG="$value"         ;;
++        --with-long-long=*)              NGX_WITH_LONG_LONG="$value"    ;;
++        --with-ptr-size=*)               NGX_WITH_PTR_SIZE="$value"     ;;
++        --with-sig-atomic-t=*)           NGX_WITH_SIG_ATOMIC_T="$value" ;;
++        --with-size-t=*)                 NGX_WITH_SIZE_T="$value"       ;;
++        --with-off-t=*)                  NGX_WITH_OFF_T="$value"        ;;
++        --with-time-t=*)                 NGX_WITH_TIME_T="$value"       ;;
++        --with-sys-nerr=*)               NGX_WITH_NGX_SYS_NERR="$value" ;;
++        --with-endian=*)                 NGX_WITH_ENDIAN="$value"       ;;
++
+         *)
+             echo "$0: error: invalid option \"$option\""
+             exit 1
+@@ -434,6 +446,17 @@
+ 
+   --with-debug                       enable debug logging
+ 
++  --with-int=VALUE                   force int size
++  --with-long=VALUE                  force long size
++  --with-long-long=VALUE             force long long size
++  --with-ptr-size=VALUE              force pointer size
++  --with-sig-atomic-t=VALUE          force sig_atomic_t size
++  --with-size-t=VALUE                force size_t size
++  --with-off-t=VALUE                 force off_t size
++  --with-time-t=VALUE                force time_t size
++  --with-sys-nerr=VALUE              force sys_nerr value
++  --with-endian=VALUE                force system endianess
++
+ END
+ 
+     exit 1
+@@ -455,6 +478,8 @@
+ 
+ if [ ".$NGX_PLATFORM" = ".win32" ]; then
+     NGX_WINE=$WINE
++elif [ ! -z "$NGX_PLATFORM" ]; then
++    NGX_CROSS_COMPILE="yes"
+ fi
+ 
+ 
+diff -uraN nginx-1.0.11.orig/auto/types/sizeof nginx-1.0.11/auto/types/sizeof
+--- nginx-1.0.11.orig/auto/types/sizeof	2006-06-28 11:00:26.000000000 -0500
++++ nginx-1.0.11/auto/types/sizeof	2011-12-27 13:56:42.323370040 -0600
+@@ -11,9 +11,12 @@
+ 
+ END
+ 
+-ngx_size=
++ngx_size=$(eval "echo \$NGX_WITH_${ngx_param}")
+ 
+-cat << END > $NGX_AUTOTEST.c
++if [ ".$ngx_size" != "." ]; then
++    echo " $ngx_size bytes"
++else
++    cat << END > $NGX_AUTOTEST.c
+ 
+ #include <sys/types.h>
+ #include <sys/time.h>
+@@ -31,19 +34,20 @@
+ END
+ 
+ 
+-ngx_test="$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
+-          -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_libs"
++    ngx_test="$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
++              -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_libs"
+ 
+-eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
++    eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
+ 
+ 
+-if [ -x $NGX_AUTOTEST ]; then
+-    ngx_size=`$NGX_AUTOTEST`
+-    echo " $ngx_size bytes"
+-fi
++    if [ -x $NGX_AUTOTEST ]; then
++        ngx_size=`$NGX_AUTOTEST`
++        echo " $ngx_size bytes"
++    fi
+ 
+ 
+-rm -f $NGX_AUTOTEST
++    rm -f $NGX_AUTOTEST
++fi
+ 
+ 
+ case $ngx_size in
+diff -uraN nginx-1.0.11.orig/auto/unix nginx-1.0.11/auto/unix
+--- nginx-1.0.11.orig/auto/unix	2011-12-14 07:34:16.000000000 -0600
++++ nginx-1.0.11/auto/unix	2011-12-27 13:56:42.327370060 -0600
+@@ -393,13 +393,13 @@
+ 
+ # C types
+ 
+-ngx_type="int"; . auto/types/sizeof
++ngx_type="int"; ngx_param="INT"; . auto/types/sizeof
+ 
+-ngx_type="long"; . auto/types/sizeof
++ngx_type="long"; ngx_param="LONG"; . auto/types/sizeof
+ 
+-ngx_type="long long"; . auto/types/sizeof
++ngx_type="long long"; ngx_param="LONG_LONG"; . auto/types/sizeof
+ 
+-ngx_type="void *"; . auto/types/sizeof; ngx_ptr_size=$ngx_size
++ngx_type="void *"; ngx_param="PTR_SIZE"; . auto/types/sizeof; ngx_ptr_size=$ngx_size
+ ngx_param=NGX_PTR_SIZE; ngx_value=$ngx_size; . auto/types/value
+ 
+ 
+@@ -416,7 +416,7 @@
+ 
+ ngx_type="uint64_t"; ngx_types="u_int64_t"; . auto/types/typedef
+ 
+-ngx_type="sig_atomic_t"; ngx_types="int"; . auto/types/typedef
++ngx_type="sig_atomic_t"; ngx_param="SIG_ATOMIC_T"; ngx_types="int"; . auto/types/typedef
+ . auto/types/sizeof
+ ngx_param=NGX_SIG_ATOMIC_T_SIZE; ngx_value=$ngx_size; . auto/types/value
+ 
+@@ -432,15 +432,15 @@
+ 
+ . auto/endianess
+ 
+-ngx_type="size_t"; . auto/types/sizeof
++ngx_type="size_t"; ngx_param="SIZE_T"; . auto/types/sizeof
+ ngx_param=NGX_MAX_SIZE_T_VALUE; ngx_value=$ngx_max_value; . auto/types/value
+ ngx_param=NGX_SIZE_T_LEN; ngx_value=$ngx_max_len; . auto/types/value
+ 
+-ngx_type="off_t"; . auto/types/sizeof
++ngx_type="off_t"; ngx_param="OFF_T"; . auto/types/sizeof
+ ngx_param=NGX_MAX_OFF_T_VALUE; ngx_value=$ngx_max_value; . auto/types/value
+ ngx_param=NGX_OFF_T_LEN; ngx_value=$ngx_max_len; . auto/types/value
+ 
+-ngx_type="time_t"; . auto/types/sizeof
++ngx_type="time_t"; ngx_param="TIME_T"; . auto/types/sizeof
+ ngx_param=NGX_TIME_T_SIZE; ngx_value=$ngx_size; . auto/types/value
+ ngx_param=NGX_TIME_T_LEN; ngx_value=$ngx_max_len; . auto/types/value
+ 
diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.conf b/meta-webserver/recipes-httpd/nginx/files/nginx.conf
new file mode 100644
index 0000000..589de41
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx.conf
@@ -0,0 +1,118 @@
+
+user  www-data;
+worker_processes  1;
+
+error_log  /var/log/nginx/error.log;
+#error_log  logs/error.log  notice;
+#error_log  logs/error.log  info;
+
+pid        /var/run/nginx//nginx.pid;
+
+
+events {
+    worker_connections  1024;
+}
+
+
+http {
+    include       mime.types;
+    default_type  application/octet-stream;
+
+    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
+                      '$status $body_bytes_sent "$http_referer" '
+                      '"$http_user_agent" "$http_x_forwarded_for"';
+
+    access_log  /var/log/nginx/access.log  main;
+
+    sendfile        on;
+    #tcp_nopush     on;
+
+    #keepalive_timeout  0;
+    keepalive_timeout  65;
+
+    #gzip  on;
+
+    server {
+        listen       80;
+        server_name  localhost;
+
+        #charset koi8-r;
+
+        #access_log  logs/host.access.log  main;
+
+        location / {
+            root   /var/www//localhost/html;
+            index  index.html index.htm;
+        }
+
+        #error_page  404              /404.html;
+
+        # redirect server error pages to the static page /50x.html
+        #
+        error_page   500 502 503 504  /50x.html;
+        location = /50x.html {
+            root   /var/www/localhost/html;
+        }
+
+        # proxy the PHP scripts to Apache listening on 127.0.0.1:80
+        #
+        #location ~ \.php$ {
+        #    proxy_pass   http://127.0.0.1;
+        #}
+
+        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
+        #
+        #location ~ \.php$ {
+        #    root           html;
+        #    fastcgi_pass   127.0.0.1:9000;
+        #    fastcgi_index  index.php;
+        #    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
+        #    include        fastcgi_params;
+        #}
+
+        # deny access to .htaccess files, if Apache's document root
+        # concurs with nginx's one
+        #
+        #location ~ /\.ht {
+        #    deny  all;
+        #}
+    }
+
+
+    # another virtual host using mix of IP-, name-, and port-based configuration
+    #
+    #server {
+    #    listen       8000;
+    #    listen       somename:8080;
+    #    server_name  somename  alias  another.alias;
+
+    #    location / {
+    #        root   html;
+    #        index  index.html index.htm;
+    #    }
+    #}
+
+
+    # HTTPS server
+    #
+    #server {
+    #    listen       443;
+    #    server_name  localhost;
+
+    #    ssl                  on;
+    #    ssl_certificate      cert.pem;
+    #    ssl_certificate_key  cert.key;
+
+    #    ssl_session_timeout  5m;
+
+    #    ssl_protocols  SSLv2 SSLv3 TLSv1;
+    #    ssl_ciphers  HIGH:!aNULL:!MD5;
+    #    ssl_prefer_server_ciphers   on;
+
+    #    location / {
+    #        root   html;
+    #        index  index.html index.htm;
+    #    }
+    #}
+
+}
diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.init b/meta-webserver/recipes-httpd/nginx/files/nginx.init
new file mode 100755
index 0000000..0f38b9c
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx.init
@@ -0,0 +1,52 @@
+#! /bin/sh
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+DAEMON=/usr/sbin/nginx
+NAME=nginx
+DESC=nginx
+PID=/var/run/nginx/nginx.pid
+
+test -x $DAEMON || exit 0
+
+# Include nginx defaults if available
+if [ -f /etc/default/nginx ] ; then
+        . /etc/default/nginx
+fi
+
+set -e
+
+case "$1" in
+  start)
+        echo -n "Starting $DESC: "
+        start-stop-daemon --start --quiet --pidfile $PID \
+                --name $NAME --exec $DAEMON -- $DAEMON_OPTS
+        echo "$NAME."
+        ;;
+  stop)
+        echo -n "Stopping $DESC: "
+        start-stop-daemon -K --quiet --pidfile $PID \
+                --name $NAME
+        echo "$NAME."
+        ;;
+  restart|force-reload)
+        echo -n "Restarting $DESC: "
+        start-stop-daemon -K --quiet --pidfile $PID \
+                --name $NAME
+        sleep 1
+        start-stop-daemon --start --quiet --pidfile $PID \
+                --name $NAME --exec $DAEMON -- $DAEMON_OPTS
+        echo "$NAME."
+        ;;
+  reload)
+      echo -n "Reloading $DESC configuration: "
+      start-stop-daemon --stop --signal HUP --quiet --pidfile $PID \
+          --exec $DAEMON
+      echo "$NAME."
+      ;;
+  *)
+        N=/etc/init.d/$NAME
+        echo "Usage: $N {start|stop|restart|force-reload}" >&2
+        exit 1
+        ;;
+esac
+
+exit 0
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.4.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.4.0.bb
new file mode 100644
index 0000000..47c592f
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.4.0.bb
@@ -0,0 +1,91 @@
+DESCRIPTION = "HTTP and reverse proxy server"
+HOMEPAGE = "http://nginx.org/"
+LICENSE = "BSD"
+SECTION = "net"
+PRIORITY = "optional"
+
+DEPENDS = "libpcre gzip openssl"
+
+PR = "r4"
+
+SRC_URI = " \
+	http://nginx.org/download/nginx-${PV}.tar.gz \
+	file://nginx-cross_${PV}.diff;name=crosspatch \
+	file://nginx.conf \
+	file://nginx.init \
+"
+
+S = "${WORKDIR}/nginx-${PV}"
+
+inherit autotools update-rc.d useradd
+
+SRC_URI[md5sum] = "d496e58864ab10ed56278b7655b0d0b2"
+SRC_URI[sha256sum] = "84aeb7a131fccff036dc80283dd98c989d2844eb84359cfe7c4863475de923a9"
+SRC_URI[crosspatch.md5sum] = "707c4cdd6bb82719ea2ed50971101c21"
+SRC_URI[crosspatch.sha256sum] = "96cc3b087126caaa0951ab3e3f9f26169e9caf283dd2aeb689ed6c435070f052"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=917bfdf005ffb6fd025550414ff05a9f"
+
+CONFFILES_${PN} = "${sysconfdir}/nginx/nginx.conf \
+		${sysconfdir}/nginx/fastcgi.conf\
+		${sysconfdir}/nginx/fastcgi_params \
+		${sysconfdir}/nginx/koi-utf \
+		${sysconfdir}/nginx/koi-win \
+		${sysconfdir}/nginx/mime.types \
+		${sysconfdir}/nginx/scgi_params \
+		${sysconfdir}/nginx/uwsgi_params \
+		${sysconfdir}/nginx/win-utf \
+"
+
+INITSCRIPT_NAME = "nginx"
+INITSCRIPT_PARAMS = "defaults 92 20"
+
+do_configure () {
+	PTRSIZE=$(expr ${SITEINFO_BITS} / 8)
+
+	echo $CFLAGS
+	echo $LDFLAGS
+
+	./configure \
+	--crossbuild=Linux:${TUNE_ARCH} \
+	--with-endian=${@base_conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
+	--with-int=4 \
+	--with-long=${PTRSIZE} \
+	--with-long-long=8 \
+	--with-ptr-size=${PTRSIZE} \
+	--with-sig-atomic-t=${PTRSIZE} \
+	--with-size-t=${PTRSIZE} \
+	--with-off-t=${PTRSIZE} \
+	--with-time-t=${PTRSIZE} \
+	--with-sys-nerr=132 \
+	--conf-path=/etc/nginx/nginx.conf \
+	--http-log-path=/var/log/nginx/access.log \
+	--error-log-path=/var/log/nginx/error.log \
+	--pid-path=/var/run/nginx/nginx.pid \
+	--prefix=/usr \
+	--with-http_ssl_module \
+	--with-http_gzip_static_module
+}
+
+do_install_append () {
+    install -d ${D}${localstatedir}/www/localhost
+    mv ${D}/usr/html ${D}${localstatedir}/www/localhost/
+    chown www:www-data -R ${D}${localstatedir}
+
+    install -d ${D}${sysconfdir}/init.d
+    install -d ${D}${sysconfdir}/nginx
+    install -m 0755 ${WORKDIR}/nginx.init ${D}${sysconfdir}/init.d/nginx
+    install -m 0644 ${WORKDIR}/nginx.conf ${D}${sysconfdir}/nginx/
+
+    install -d ${D}${sysconfdir}/default/volatiles
+    echo "d www www-data 0755 ${localstatedir}/run/nginx none" \
+        > ${D}${sysconfdir}/default/volatiles/99_nginx
+}
+
+FILES_${PN} += "${localstatedir}/ /run/"
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = " \
+    --system --no-create-home \
+    --home ${localstatedir}/www/localhost \
+    --groups www-data \
+    --user-group www"
-- 
1.8.3.2


