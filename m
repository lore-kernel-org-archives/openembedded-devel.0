Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1C9CE6DEF2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 09:29:24 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id y10so21994246pdj.37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2013 01:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=Vn4eD2e66G9XunhObZa+tEdGXmOHXuSsgXMMhJb1fPM=;
	b=ij2FPmh9ZqbbkCx7662m+INMEKBl44+xCmCZnTfwb+Z6N6bGYkzQGX1rH1IqTJr3Fb
	uGWYzknBAjPYJnihAgc+mrD62fNEJWqjZGyTLSfqY4Av82hOrBJ/zwxPHUtzVaip+HlF
	9awD46fhllwmV6x7yXegQueVdO02KNHxKbjJgOWXFDW0bKi9Xz47fbbWpQsTV2wHCrg/
	+tWxW/yhh6zqxCyvw6XkEeaPBFQXBf4FTe0aZlEvS9iREqHUzNcTgpuK8L3N8U1UUVpA
	A2RVu2mrRqcvtoGYeIysufxp2Yb7Nbug1sJmK75j+kdjSNamtV202xLRc/pvLrbZy5bJ
	Dv0g==
X-Received: by 10.68.129.99 with SMTP id nv3mr44845919pbb.40.1386149362810;
	Wed, 04 Dec 2013 01:29:22 -0800 (PST)
Received: from ghoda.gateway.pace.com
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	er3sm135937709pbb.40.2013.12.04.01.29.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 01:29:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Dec 2013 01:29:21 -0800
Message-Id: <1386149361-28076-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [meta-webserver][PATCH V3] nginx: new recipe
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
X-List-Received-Date: Wed, 04 Dec 2013 09:29:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "stephen.arnold42" <stephen.arnold42@gmail.com>

Initial recipe created by Steve Arnold.  Original build patch and 1.0.10
recipe graciously contributed by bencoh (in #oe on irc.freenode.net).
New recipe and init script contributed by this author.  Built and
tested on master branches using author's fork of meta-raspberrypi.

Signed-off-by: stephen.arnold42 <stephen.arnold42@gmail.com>
Signed-off-by: Sébastien Mennetrier <s.mennetrier@innotis.org
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-httpd/nginx/files/nginx-cross.patch    |  217 ++++++++++++++++++++
 .../recipes-httpd/nginx/files/nginx-volatile.conf  |    2 +
 .../recipes-httpd/nginx/files/nginx.conf           |  118 +++++++++++
 .../recipes-httpd/nginx/files/nginx.init           |   52 +++++
 meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb  |  120 +++++++++++
 5 files changed, 509 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/nginx-cross.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/nginx-volatile.conf
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/nginx.conf
 create mode 100755 meta-webserver/recipes-httpd/nginx/files/nginx.init
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb

diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx-cross.patch b/meta-webserver/recipes-httpd/nginx/files/nginx-cross.patch
new file mode 100644
index 0000000..5f899a1
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx-cross.patch
@@ -0,0 +1,217 @@
+We do not have capability to run binaries when cross compiling
+
+Upstream-Status: Pending
+
+
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
diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx-volatile.conf b/meta-webserver/recipes-httpd/nginx/files/nginx-volatile.conf
new file mode 100644
index 0000000..93f3c66
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/nginx-volatile.conf
@@ -0,0 +1,2 @@
+d www www-data 0755 /run/nginx none
+d root root 0755 /var/log/nginx none
diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.conf b/meta-webserver/recipes-httpd/nginx/files/nginx.conf
new file mode 100644
index 0000000..fb7e4b6
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
+pid        /run/nginx/nginx.pid;
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
+            root   /var/www/localhost/html;
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
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb
new file mode 100644
index 0000000..ea2c8bb
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb
@@ -0,0 +1,120 @@
+SUMMARY = "HTTP and reverse proxy server"
+
+DESCRIPTION = "Nginx is a web server and a reverse proxy server for \
+HTTP, SMTP, POP3 and IMAP protocols, with a strong focus on high  \
+concurrency, performance and low memory usage."
+
+HOMEPAGE = "http://nginx.org/"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=917bfdf005ffb6fd025550414ff05a9f"
+SECTION = "net"
+
+DEPENDS = "libpcre gzip openssl"
+
+SRC_URI = " \
+	http://nginx.org/download/nginx-${PV}.tar.gz \
+	file://nginx-cross.patch \
+	file://nginx.conf \
+	file://nginx.init \
+	file://nginx-volatile.conf \
+"
+SRC_URI[md5sum] = "5dfaba1cbeae9087f3949860a02caa9f"
+SRC_URI[sha256sum] = "7c989a58e5408c9593da0bebcd0e4ffc3d892d1316ba5042ddb0be5b0b4102b9"
+
+inherit update-rc.d useradd
+
+do_configure () {
+	if [ "${SITEINFO_BITS}" = "64" ]; then
+		PTRSIZE=8
+	else
+		PTRSIZE=4
+	fi
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
+	--conf-path=${sysconfdir}/nginx/nginx.conf \
+	--http-log-path=${localstatedir}/log/nginx/access.log \
+	--error-log-path=${localstatedir}/log/nginx/error.log \
+	--pid-path=/run/nginx/nginx.pid \
+	--prefix=${prefix} \
+	--with-http_ssl_module \
+	--with-http_gzip_static_module
+}
+
+do_install () {
+	oe_runmake 'DESTDIR=${D}' install
+	rm -fr ${D}${localstatedir}/run ${D}/run
+	if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+		install -d ${D}${sysconfdir}/tmpfiles.d
+		echo "d /run/${BPN} - - - -" \
+		     > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
+	fi
+	install -d ${D}${sysconfdir}/${BPN}
+	ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
+	install -d ${D}${localstatedir}/www/localhost
+	mv ${D}/usr/html ${D}${localstatedir}/www/localhost/
+	chown www:www-data -R ${D}${localstatedir}
+
+	install -d ${D}${sysconfdir}/init.d
+	cat ${WORKDIR}/nginx.init | \
+		sed -e 's,/usr/sbin/,${sbindir}/,g' \
+		-e 's,/etc/,${sysconfdir}/,g' > ${D}/${sysconfdir}/init.d/nginx
+	chmod 755 ${D}/${sysconfdir}/init.d/nginx
+
+	install -d ${D}${sysconfdir}/nginx
+	cat ${WORKDIR}/nginx.conf | \
+		sed -e 's,/var/,${localstatedir}/,g' > ${D}/${sysconfdir}/nginx/nginx.conf
+	chmod 644 ${D}/${sysconfdir}/nginx/nginx.conf
+	install -d ${D}${sysconfdir}/nginx/sites-enabled
+
+	install -d ${D}${sysconfdir}/default/volatiles
+	cat ${WORKDIR}/nginx-volatile.conf | \
+		sed -e 's,/var/,${localstatedir}/,g' > ${D}${sysconfdir}/default/volatiles/99_nginx
+	chmod 644 ${D}${sysconfdir}/default/volatiles/99_nginx
+}
+
+pkg_postinst_${PN} () {
+	if [ -z "$D" ]; then
+		if type systemd-tmpfiles 2>/dev/null; then
+			systemd-tmpfiles --create
+		elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
+			${sysconfdir}/init.d/populate-volatile.sh update
+		fi
+	fi
+}
+
+FILES_${PN} += "${localstatedir}/"
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
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = " \
+    --system --no-create-home \
+    --home ${localstatedir}/www/localhost \
+    --groups www-data \
+    --user-group www"
-- 
1.7.10.4


