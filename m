Return-Path: <sebmennetrier@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id BCBD56DF41
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Dec 2013 10:04:45 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id qd12so26340388ieb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Dec 2013 02:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=02OVrkbSnhcEoihh3IT47osBUyQQEBvp+guz55Tz+8o=;
	b=whHXb16C4lJPHxRYcpYWGCW/0p7tlkcNv3wPfDAF+WDxVK+XpRMWs4EtvxQ6qZV0GV
	GO+Y+h3dz6IXebn4QqtD9UVaM9IXHXj5pBX6/xJmYbWpqzjrcEp7K3mFUZ0G22QxOrzQ
	SesCHHqhBiIwCVYGnPXh0Z6qFE7CN+1fdi6nViXibjbh2ZysGyajO00xDH5/MybCpGIU
	VpD3MwqBd6oqb88M5veQGdr0bJRKmRF1kCTtc39tTwLE5bbm79zyea6XyX2RFW5LoXmd
	tB4MkCrs4Tv8pxcXFv6Oqm6mlqAB9xLntRN5El/24wfjo2kGQ0Thyjv4hDllG97WXPE/
	6cZA==
MIME-Version: 1.0
X-Received: by 10.50.221.99 with SMTP id qd3mr195047igc.49.1386151485054; Wed,
	04 Dec 2013 02:04:45 -0800 (PST)
Sender: sebmennetrier@gmail.com
Received: by 10.43.141.70 with HTTP; Wed, 4 Dec 2013 02:04:44 -0800 (PST)
In-Reply-To: <1386149361-28076-1-git-send-email-raj.khem@gmail.com>
References: <1386149361-28076-1-git-send-email-raj.khem@gmail.com>
Date: Wed, 4 Dec 2013 11:04:44 +0100
X-Google-Sender-Auth: 3kmT75oVzAsNyNiukjfQa0wXLu8
Message-ID: <CABgO3_OwBouh52i8BtKzADfDrFpTG8Dz5wmpOdx+g67X1D76xg@mail.gmail.com>
From: Sebastien MENNETRIER <s.mennetrier@innotis.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-webserver][PATCH V3] nginx: new recipe
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
X-List-Received-Date: Wed, 04 Dec 2013 10:04:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2013/12/4 Khem Raj <raj.khem@gmail.com>

> From: "stephen.arnold42" <stephen.arnold42@gmail.com>
>
> Initial recipe created by Steve Arnold.  Original build patch and 1.0.10
> recipe graciously contributed by bencoh (in #oe on irc.freenode.net).
> New recipe and init script contributed by this author.  Built and
> tested on master branches using author's fork of meta-raspberrypi.
>
> Signed-off-by: stephen.arnold42 <stephen.arnold42@gmail.com>
> Signed-off-by: S=E9bastien Mennetrier <s.mennetrier@innotis.org
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-httpd/nginx/files/nginx-cross.patch    |  217
> ++++++++++++++++++++
>  .../recipes-httpd/nginx/files/nginx-volatile.conf  |    2 +
>  .../recipes-httpd/nginx/files/nginx.conf           |  118 +++++++++++
>  .../recipes-httpd/nginx/files/nginx.init           |   52 +++++
>  meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb  |  120 +++++++++++
>  5 files changed, 509 insertions(+)
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/nginx-cross.patch
>  create mode 100644
> meta-webserver/recipes-httpd/nginx/files/nginx-volatile.conf
>  create mode 100644 meta-webserver/recipes-httpd/nginx/files/nginx.conf
>  create mode 100755 meta-webserver/recipes-httpd/nginx/files/nginx.init
>  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb
>
> diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx-cross.patch
> b/meta-webserver/recipes-httpd/nginx/files/nginx-cross.patch
> new file mode 100644
> index 0000000..5f899a1
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/nginx/files/nginx-cross.patch
> @@ -0,0 +1,217 @@
> +We do not have capability to run binaries when cross compiling
> +
> +Upstream-Status: Pending
> +
> +
> +diff -uraN nginx-1.0.11.orig/auto/feature nginx-1.0.11/auto/feature
> +--- nginx-1.0.11.orig/auto/feature     2011-05-11 06:50:19.000000000 -05=
00
> ++++ nginx-1.0.11/auto/feature  2011-12-27 13:56:42.323370040 -0600
> +@@ -48,12 +48,20 @@
> +
> + if [ -x $NGX_AUTOTEST ]; then
> +
> ++    if [ ".$NGX_CROSS_COMPILE" =3D ".yes" ]; then
> ++        NGX_AUTOTEST_EXEC=3D"true"
> ++      NGX_FOUND_MSG=3D" (not tested, cross compiling)"
> ++    else
> ++        NGX_AUTOTEST_EXEC=3D"$NGX_AUTOTEST"
> ++      NGX_FOUND_MSG=3D""
> ++    fi
> ++
> +     case "$ngx_feature_run" in
> +
> +         yes)
> +             # /bin/sh is used to intercept "Killed" or "Abort trap"
> messages
> +-            if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
> +-                echo " found"
> ++            if /bin/sh -c $NGX_AUTOTEST_EXEC >> $NGX_AUTOCONF_ERR 2>&1;
> then
> ++                echo " found$NGX_FOUND_MSG"
> +                 ngx_found=3Dyes
> +
> +                 if test -n "$ngx_feature_name"; then
> +@@ -67,17 +75,27 @@
> +
> +         value)
> +             # /bin/sh is used to intercept "Killed" or "Abort trap"
> messages
> +-            if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
> +-                echo " found"
> ++            if /bin/sh -c $NGX_AUTOTEST_EXEC >> $NGX_AUTOCONF_ERR 2>&1;
> then
> ++                echo " found$NGX_FOUND_MSG"
> +                 ngx_found=3Dyes
> +
> +-                cat << END >> $NGX_AUTO_CONFIG_H
> ++                if [ ".$NGX_CROSS_COMPILE" =3D ".yes" ]; then
> ++                    cat << END >> $NGX_AUTO_CONFIG_H
> +
> + #ifndef $ngx_feature_name
> +-#define $ngx_feature_name  `$NGX_AUTOTEST`
> ++#define $ngx_feature_name  $(eval "echo \$NGX_WITH_${ngx_feature_name}"=
)
> + #endif
> +
> + END
> ++              else
> ++                    cat << END >> $NGX_AUTO_CONFIG_H
> ++
> ++#ifndef $ngx_feature_name
> ++#define $ngx_feature_name  `$NGX_AUTOTEST_EXEC`
> ++#endif
> ++
> ++END
> ++                fi
> +             else
> +                 echo " found but is not working"
> +             fi
> +@@ -85,7 +103,7 @@
> +
> +         bug)
> +             # /bin/sh is used to intercept "Killed" or "Abort trap"
> messages
> +-            if /bin/sh -c $NGX_AUTOTEST >> $NGX_AUTOCONF_ERR 2>&1; then
> ++            if /bin/sh -c $NGX_AUTOTEST_EXEC >> $NGX_AUTOCONF_ERR 2>&1;
> then
> +                 echo " not found"
> +
> +             else
> +diff -uraN nginx-1.0.11.orig/auto/options nginx-1.0.11/auto/options
> +--- nginx-1.0.11.orig/auto/options     2011-12-14 07:34:16.000000000 -06=
00
> ++++ nginx-1.0.11/auto/options  2011-12-27 13:56:42.323370040 -0600
> +@@ -289,6 +289,18 @@
> +         --test-build-rtsig)              NGX_TEST_BUILD_RTSIG=3DYES   ;=
;
> +         --test-build-solaris-sendfilev)
>  NGX_TEST_BUILD_SOLARIS_SENDFILEV=3DYES ;;
> +
> ++        # cross compile support
> ++        --with-int=3D*)                    NGX_WITH_INT=3D"$value"
>  ;;
> ++        --with-long=3D*)                   NGX_WITH_LONG=3D"$value"
> ;;
> ++        --with-long-long=3D*)              NGX_WITH_LONG_LONG=3D"$value=
"
>  ;;
> ++        --with-ptr-size=3D*)               NGX_WITH_PTR_SIZE=3D"$value"
> ;;
> ++        --with-sig-atomic-t=3D*)           NGX_WITH_SIG_ATOMIC_T=3D"$va=
lue"
> ;;
> ++        --with-size-t=3D*)                 NGX_WITH_SIZE_T=3D"$value"
> ;;
> ++        --with-off-t=3D*)                  NGX_WITH_OFF_T=3D"$value"
>  ;;
> ++        --with-time-t=3D*)                 NGX_WITH_TIME_T=3D"$value"
> ;;
> ++        --with-sys-nerr=3D*)               NGX_WITH_NGX_SYS_NERR=3D"$va=
lue"
> ;;
> ++        --with-endian=3D*)                 NGX_WITH_ENDIAN=3D"$value"
> ;;
> ++
> +         *)
> +             echo "$0: error: invalid option \"$option\""
> +             exit 1
> +@@ -434,6 +446,17 @@
> +
> +   --with-debug                       enable debug logging
> +
> ++  --with-int=3DVALUE                   force int size
> ++  --with-long=3DVALUE                  force long size
> ++  --with-long-long=3DVALUE             force long long size
> ++  --with-ptr-size=3DVALUE              force pointer size
> ++  --with-sig-atomic-t=3DVALUE          force sig_atomic_t size
> ++  --with-size-t=3DVALUE                force size_t size
> ++  --with-off-t=3DVALUE                 force off_t size
> ++  --with-time-t=3DVALUE                force time_t size
> ++  --with-sys-nerr=3DVALUE              force sys_nerr value
> ++  --with-endian=3DVALUE                force system endianess
> ++
> + END
> +
> +     exit 1
> +@@ -455,6 +478,8 @@
> +
> + if [ ".$NGX_PLATFORM" =3D ".win32" ]; then
> +     NGX_WINE=3D$WINE
> ++elif [ ! -z "$NGX_PLATFORM" ]; then
> ++    NGX_CROSS_COMPILE=3D"yes"
> + fi
> +
> +
> +diff -uraN nginx-1.0.11.orig/auto/types/sizeof
> nginx-1.0.11/auto/types/sizeof
> +--- nginx-1.0.11.orig/auto/types/sizeof        2006-06-28
> 11:00:26.000000000 -0500
> ++++ nginx-1.0.11/auto/types/sizeof     2011-12-27 13:56:42.323370040 -06=
00
> +@@ -11,9 +11,12 @@
> +
> + END
> +
> +-ngx_size=3D
> ++ngx_size=3D$(eval "echo \$NGX_WITH_${ngx_param}")
> +
> +-cat << END > $NGX_AUTOTEST.c
> ++if [ ".$ngx_size" !=3D "." ]; then
> ++    echo " $ngx_size bytes"
> ++else
> ++    cat << END > $NGX_AUTOTEST.c
> +
> + #include <sys/types.h>
> + #include <sys/time.h>
> +@@ -31,19 +34,20 @@
> + END
> +
> +
> +-ngx_test=3D"$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
> +-          -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT $ngx_feature_lib=
s"
> ++    ngx_test=3D"$CC $CC_TEST_FLAGS $CC_AUX_FLAGS \
> ++              -o $NGX_AUTOTEST $NGX_AUTOTEST.c $NGX_LD_OPT
> $ngx_feature_libs"
> +
> +-eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
> ++    eval "$ngx_test >> $NGX_AUTOCONF_ERR 2>&1"
> +
> +
> +-if [ -x $NGX_AUTOTEST ]; then
> +-    ngx_size=3D`$NGX_AUTOTEST`
> +-    echo " $ngx_size bytes"
> +-fi
> ++    if [ -x $NGX_AUTOTEST ]; then
> ++        ngx_size=3D`$NGX_AUTOTEST`
> ++        echo " $ngx_size bytes"
> ++    fi
> +
> +
> +-rm -f $NGX_AUTOTEST
> ++    rm -f $NGX_AUTOTEST
> ++fi
> +
> +
> + case $ngx_size in
> +diff -uraN nginx-1.0.11.orig/auto/unix nginx-1.0.11/auto/unix
> +--- nginx-1.0.11.orig/auto/unix        2011-12-14 07:34:16.000000000 -06=
00
> ++++ nginx-1.0.11/auto/unix     2011-12-27 13:56:42.327370060 -0600
> +@@ -393,13 +393,13 @@
> +
> + # C types
> +
> +-ngx_type=3D"int"; . auto/types/sizeof
> ++ngx_type=3D"int"; ngx_param=3D"INT"; . auto/types/sizeof
> +
> +-ngx_type=3D"long"; . auto/types/sizeof
> ++ngx_type=3D"long"; ngx_param=3D"LONG"; . auto/types/sizeof
> +
> +-ngx_type=3D"long long"; . auto/types/sizeof
> ++ngx_type=3D"long long"; ngx_param=3D"LONG_LONG"; . auto/types/sizeof
> +
> +-ngx_type=3D"void *"; . auto/types/sizeof; ngx_ptr_size=3D$ngx_size
> ++ngx_type=3D"void *"; ngx_param=3D"PTR_SIZE"; . auto/types/sizeof;
> ngx_ptr_size=3D$ngx_size
> + ngx_param=3DNGX_PTR_SIZE; ngx_value=3D$ngx_size; . auto/types/value
> +
> +
> +@@ -416,7 +416,7 @@
> +
> + ngx_type=3D"uint64_t"; ngx_types=3D"u_int64_t"; . auto/types/typedef
> +
> +-ngx_type=3D"sig_atomic_t"; ngx_types=3D"int"; . auto/types/typedef
> ++ngx_type=3D"sig_atomic_t"; ngx_param=3D"SIG_ATOMIC_T"; ngx_types=3D"int=
"; .
> auto/types/typedef
> + . auto/types/sizeof
> + ngx_param=3DNGX_SIG_ATOMIC_T_SIZE; ngx_value=3D$ngx_size; . auto/types/=
value
> +
> +@@ -432,15 +432,15 @@
> +
> + . auto/endianess
> +
> +-ngx_type=3D"size_t"; . auto/types/sizeof
> ++ngx_type=3D"size_t"; ngx_param=3D"SIZE_T"; . auto/types/sizeof
> + ngx_param=3DNGX_MAX_SIZE_T_VALUE; ngx_value=3D$ngx_max_value; .
> auto/types/value
> + ngx_param=3DNGX_SIZE_T_LEN; ngx_value=3D$ngx_max_len; . auto/types/valu=
e
> +
> +-ngx_type=3D"off_t"; . auto/types/sizeof
> ++ngx_type=3D"off_t"; ngx_param=3D"OFF_T"; . auto/types/sizeof
> + ngx_param=3DNGX_MAX_OFF_T_VALUE; ngx_value=3D$ngx_max_value; .
> auto/types/value
> + ngx_param=3DNGX_OFF_T_LEN; ngx_value=3D$ngx_max_len; . auto/types/value
> +
> +-ngx_type=3D"time_t"; . auto/types/sizeof
> ++ngx_type=3D"time_t"; ngx_param=3D"TIME_T"; . auto/types/sizeof
> + ngx_param=3DNGX_TIME_T_SIZE; ngx_value=3D$ngx_size; . auto/types/value
> + ngx_param=3DNGX_TIME_T_LEN; ngx_value=3D$ngx_max_len; . auto/types/valu=
e
> +
> diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx-volatile.conf
> b/meta-webserver/recipes-httpd/nginx/files/nginx-volatile.conf
> new file mode 100644
> index 0000000..93f3c66
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/nginx/files/nginx-volatile.conf
> @@ -0,0 +1,2 @@
> +d www www-data 0755 /run/nginx none
> +d root root 0755 /var/log/nginx none
> diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.conf
> b/meta-webserver/recipes-httpd/nginx/files/nginx.conf
> new file mode 100644
> index 0000000..fb7e4b6
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/nginx/files/nginx.conf
> @@ -0,0 +1,118 @@
> +
> +user  www-data;
> +worker_processes  1;
> +
> +error_log  /var/log/nginx/error.log;
> +#error_log  logs/error.log  notice;
> +#error_log  logs/error.log  info;
> +
> +pid        /run/nginx/nginx.pid;
> +
> +
> +events {
> +    worker_connections  1024;
> +}
> +
> +
> +http {
> +    include       mime.types;
> +    default_type  application/octet-stream;
> +
> +    log_format  main  '$remote_addr - $remote_user [$time_local]
> "$request" '
> +                      '$status $body_bytes_sent "$http_referer" '
> +                      '"$http_user_agent" "$http_x_forwarded_for"';
> +
> +    access_log  /var/log/nginx/access.log  main;
> +
> +    sendfile        on;
> +    #tcp_nopush     on;
> +
> +    #keepalive_timeout  0;
> +    keepalive_timeout  65;
> +
> +    #gzip  on;
> +
> +    server {
> +        listen       80;
> +        server_name  localhost;
> +
> +        #charset koi8-r;
> +
> +        #access_log  logs/host.access.log  main;
> +
> +        location / {
> +            root   /var/www/localhost/html;
> +            index  index.html index.htm;
> +        }
> +
> +        #error_page  404              /404.html;
> +
> +        # redirect server error pages to the static page /50x.html
> +        #
> +        error_page   500 502 503 504  /50x.html;
> +        location =3D /50x.html {
> +            root   /var/www/localhost/html;
> +        }
> +
> +        # proxy the PHP scripts to Apache listening on 127.0.0.1:80
> +        #
> +        #location ~ \.php$ {
> +        #    proxy_pass   http://127.0.0.1;
> +        #}
> +
> +        # pass the PHP scripts to FastCGI server listening on
> 127.0.0.1:9000
> +        #
> +        #location ~ \.php$ {
> +        #    root           html;
> +        #    fastcgi_pass   127.0.0.1:9000;
> +        #    fastcgi_index  index.php;
> +        #    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_nam=
e;
> +        #    include        fastcgi_params;
> +        #}
> +
> +        # deny access to .htaccess files, if Apache's document root
> +        # concurs with nginx's one
> +        #
> +        #location ~ /\.ht {
> +        #    deny  all;
> +        #}
> +    }
> +
> +
> +    # another virtual host using mix of IP-, name-, and port-based
> configuration
> +    #
> +    #server {
> +    #    listen       8000;
> +    #    listen       somename:8080;
> +    #    server_name  somename  alias  another.alias;
> +
> +    #    location / {
> +    #        root   html;
> +    #        index  index.html index.htm;
> +    #    }
> +    #}
> +
> +
> +    # HTTPS server
> +    #
> +    #server {
> +    #    listen       443;
> +    #    server_name  localhost;
> +
> +    #    ssl                  on;
> +    #    ssl_certificate      cert.pem;
> +    #    ssl_certificate_key  cert.key;
> +
> +    #    ssl_session_timeout  5m;
> +
> +    #    ssl_protocols  SSLv2 SSLv3 TLSv1;
> +    #    ssl_ciphers  HIGH:!aNULL:!MD5;
> +    #    ssl_prefer_server_ciphers   on;
> +
> +    #    location / {
> +    #        root   html;
> +    #        index  index.html index.htm;
> +    #    }
> +    #}
> +
> +}
> diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.init
> b/meta-webserver/recipes-httpd/nginx/files/nginx.init
> new file mode 100755
> index 0000000..0f38b9c
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/nginx/files/nginx.init
> @@ -0,0 +1,52 @@
> +#! /bin/sh
> +PATH=3D/sbin:/bin:/usr/sbin:/usr/bin
> +DAEMON=3D/usr/sbin/nginx
> +NAME=3Dnginx
> +DESC=3Dnginx
> +PID=3D/var/run/nginx/nginx.pid
> +
> +test -x $DAEMON || exit 0
> +
> +# Include nginx defaults if available
> +if [ -f /etc/default/nginx ] ; then
> +        . /etc/default/nginx
> +fi
> +
> +set -e
> +
> +case "$1" in
> +  start)
> +        echo -n "Starting $DESC: "
> +        start-stop-daemon --start --quiet --pidfile $PID \
> +                --name $NAME --exec $DAEMON -- $DAEMON_OPTS
> +        echo "$NAME."
> +        ;;
> +  stop)
> +        echo -n "Stopping $DESC: "
> +        start-stop-daemon -K --quiet --pidfile $PID \
> +                --name $NAME
> +        echo "$NAME."
> +        ;;
> +  restart|force-reload)
> +        echo -n "Restarting $DESC: "
> +        start-stop-daemon -K --quiet --pidfile $PID \
> +                --name $NAME
> +        sleep 1
> +        start-stop-daemon --start --quiet --pidfile $PID \
> +                --name $NAME --exec $DAEMON -- $DAEMON_OPTS
> +        echo "$NAME."
> +        ;;
> +  reload)
> +      echo -n "Reloading $DESC configuration: "
> +      start-stop-daemon --stop --signal HUP --quiet --pidfile $PID \
> +          --exec $DAEMON
> +      echo "$NAME."
> +      ;;
> +  *)
> +        N=3D/etc/init.d/$NAME
> +        echo "Usage: $N {start|stop|restart|force-reload}" >&2
> +        exit 1
> +        ;;
> +esac
> +
> +exit 0
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bbb/meta-webs=
erver/recipes-httpd/nginx/
> nginx_1.4.4.bb
> new file mode 100644
> index 0000000..ea2c8bb
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.4.4.bb
> @@ -0,0 +1,120 @@
> +SUMMARY =3D "HTTP and reverse proxy server"
> +
> +DESCRIPTION =3D "Nginx is a web server and a reverse proxy server for \
> +HTTP, SMTP, POP3 and IMAP protocols, with a strong focus on high  \
> +concurrency, performance and low memory usage."
> +
> +HOMEPAGE =3D "http://nginx.org/"
> +LICENSE =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D917bfdf005ffb6fd025550414ff05=
a9f"
> +SECTION =3D "net"
> +
> +DEPENDS =3D "libpcre gzip openssl"
> +
> +SRC_URI =3D " \
> +       http://nginx.org/download/nginx-${PV}.tar.gz \
> +       file://nginx-cross.patch \
> +       file://nginx.conf \
> +       file://nginx.init \
> +       file://nginx-volatile.conf \
> +"
> +SRC_URI[md5sum] =3D "5dfaba1cbeae9087f3949860a02caa9f"
> +SRC_URI[sha256sum] =3D
> "7c989a58e5408c9593da0bebcd0e4ffc3d892d1316ba5042ddb0be5b0b4102b9"
> +
> +inherit update-rc.d useradd
> +
> +do_configure () {
> +       if [ "${SITEINFO_BITS}" =3D "64" ]; then
> +               PTRSIZE=3D8
> +       else
> +               PTRSIZE=3D4
> +       fi
> +
> +       echo $CFLAGS
> +       echo $LDFLAGS
> +
> +       ./configure \
> +       --crossbuild=3DLinux:${TUNE_ARCH} \
> +       --with-endian=3D${@base_conditional('SITEINFO_ENDIANNESS', 'le',
> 'little', 'big', d)} \
> +       --with-int=3D4 \
> +       --with-long=3D${PTRSIZE} \
> +       --with-long-long=3D8 \
> +       --with-ptr-size=3D${PTRSIZE} \
> +       --with-sig-atomic-t=3D${PTRSIZE} \
> +       --with-size-t=3D${PTRSIZE} \
> +       --with-off-t=3D${PTRSIZE} \
> +       --with-time-t=3D${PTRSIZE} \
> +       --with-sys-nerr=3D132 \
> +       --conf-path=3D${sysconfdir}/nginx/nginx.conf \
> +       --http-log-path=3D${localstatedir}/log/nginx/access.log \
> +       --error-log-path=3D${localstatedir}/log/nginx/error.log \
> +       --pid-path=3D/run/nginx/nginx.pid \
> +       --prefix=3D${prefix} \
> +       --with-http_ssl_module \
> +       --with-http_gzip_static_module
> +}
> +
> +do_install () {
> +       oe_runmake 'DESTDIR=3D${D}' install
> +       rm -fr ${D}${localstatedir}/run ${D}/run
> +       if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false'=
,
> d)}; then
> +               install -d ${D}${sysconfdir}/tmpfiles.d
> +               echo "d /run/${BPN} - - - -" \
> +                    > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
> +       fi
> +       install -d ${D}${sysconfdir}/${BPN}
> +       ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
> +       install -d ${D}${localstatedir}/www/localhost
> +       mv ${D}/usr/html ${D}${localstatedir}/www/localhost/
> +       chown www:www-data -R ${D}${localstatedir}
> +
> +       install -d ${D}${sysconfdir}/init.d
> +       cat ${WORKDIR}/nginx.init | \
> +               sed -e 's,/usr/sbin/,${sbindir}/,g' \
> +               -e 's,/etc/,${sysconfdir}/,g' >
> ${D}/${sysconfdir}/init.d/nginx
> +       chmod 755 ${D}/${sysconfdir}/init.d/nginx
>

Hi Raj,

In previous comments from Koen and Paul on my patches, they said that we
must use "sed -i" after installing files because "sed -e" and piping are
not easy to understand. (
http://lists.openembedded.org/pipermail/openembedded-devel/2013-December/09=
3327.html
)
So I used "install" then "sed -i" in my last patch for this reason. Maybe
you should copying this in your merge...


> +
> +       install -d ${D}${sysconfdir}/nginx
> +       cat ${WORKDIR}/nginx.conf | \
> +               sed -e 's,/var/,${localstatedir}/,g' >
> ${D}/${sysconfdir}/nginx/nginx.conf
> +       chmod 644 ${D}/${sysconfdir}/nginx/nginx.conf
> +       install -d ${D}${sysconfdir}/nginx/sites-enabled
> +
> +       install -d ${D}${sysconfdir}/default/volatiles
> +       cat ${WORKDIR}/nginx-volatile.conf | \
> +               sed -e 's,/var/,${localstatedir}/,g' >
> ${D}${sysconfdir}/default/volatiles/99_nginx
> +       chmod 644 ${D}${sysconfdir}/default/volatiles/99_nginx
> +}
> +
> +pkg_postinst_${PN} () {
> +       if [ -z "$D" ]; then
> +               if type systemd-tmpfiles 2>/dev/null; then
> +                       systemd-tmpfiles --create
> +               elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; th=
en
> +                       ${sysconfdir}/init.d/populate-volatile.sh update
> +               fi
> +       fi
> +}
> +
> +FILES_${PN} +=3D "${localstatedir}/"
> +
> +CONFFILES_${PN} =3D "${sysconfdir}/nginx/nginx.conf \
> +               ${sysconfdir}/nginx/fastcgi.conf\
> +               ${sysconfdir}/nginx/fastcgi_params \
> +               ${sysconfdir}/nginx/koi-utf \
> +               ${sysconfdir}/nginx/koi-win \
> +               ${sysconfdir}/nginx/mime.types \
> +               ${sysconfdir}/nginx/scgi_params \
> +               ${sysconfdir}/nginx/uwsgi_params \
> +               ${sysconfdir}/nginx/win-utf \
> +"
> +
> +INITSCRIPT_NAME =3D "nginx"
> +INITSCRIPT_PARAMS =3D "defaults 92 20"
> +
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM_${PN} =3D " \
> +    --system --no-create-home \
> +    --home ${localstatedir}/www/localhost \
> +    --groups www-data \
> +    --user-group www"
> --
> 1.7.10.4
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

