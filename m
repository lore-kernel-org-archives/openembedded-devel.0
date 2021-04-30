Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web09.6067.1619747104341938506
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Apr 2021 18:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ixc8PMi6;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id k26-20020a4adfba0000b02901f992c7ec7bso1691223ook.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Apr 2021 18:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/+jGA8TQbxP2Xjb9lZCt117HIsAI4eWvSk3fT5jgUII=;
        b=ixc8PMi6UFiv9nP5qELlYjap5tf2NI7Pln4XnSLUeEcFBn1e5D0DPSA8zqOKCak3PQ
         LmUVIxUU3SN6SG0WkAiL2xNaJChQzLHWLaG2dBgqlqdpp13K2277uvu48cf3F4jJI6kb
         nQYuhOhoUC5A3PQ2dh6Uexs5Yqt1w+FB8ZsKR7jsfx7J8mR1YqHEIQw5L7ckZ9C6XU12
         WrTu4z/AXN8EMshU5zxB+9Ht388UtVkWY4fS7/ot2rX+fsk8IMm0iRR34cFlL8NUl9jc
         XdOGtsPILEFccWyJcGPpIxly/GhiBM3yxhF25qT4rk6CfRNwwyrJ2yhQWFtMj3UzXcpb
         CbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/+jGA8TQbxP2Xjb9lZCt117HIsAI4eWvSk3fT5jgUII=;
        b=KxuD5Jqvz+Uri/zKDOlMVdG9J9XVkBNftCQm9M25glFDI8ZwbgvSQmJ+80T1DuJNab
         KSjgamxOzCSAYnarhBb00zvTZ9zEytf+KNiuQQJqYkLWrk35AKCCfUZ4+VmfhLwB61Fh
         iZiFmrP0VoFID1+3K24pSdWq0UcbCD1uUT/A+04FCKFQfInolzHf5sms31sq9vIbQZh2
         P2VQj1v5WPn0xFG5oXZlkR+rdnaFnWNoNCRv5nJJ0CGT1EY8MftQHSX0l6/tDpGw5wUq
         Upp98pxz1TTXjLPfT9bF/yfoinrRBeNe+xcm/+Xhvt4dTdecl47IPKNLzSx9l7UNYTsO
         9J9w==
X-Gm-Message-State: AOAM531sC5W95bed/zknEOmcTeUa855GNArviP2Q86IL3PweHFIVbiGQ
	F+Z4x3QYjVYsSQda6jfM0R24hZLCRX22Mg==
X-Google-Smtp-Source: ABdhPJyeD/VkHr5+bt95MpltfqhgkhZ7FtE0NZfwWB71htDVlqWMimo7J7m6tRqRte6EOAC6RtkM2w==
X-Received: by 2002:a4a:48c2:: with SMTP id p185mr2321973ooa.73.1619747103109;
        Thu, 29 Apr 2021 18:45:03 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:a862:d97f:9823:714e])
        by smtp.gmail.com with ESMTPSA id v3sm392513oov.47.2021.04.29.18.45.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 18:45:02 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH] nostromo: remove recipe
Date: Thu, 29 Apr 2021 18:45:01 -0700
Message-Id: <20210430014501.28271-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hosting site seems to be dead so remove recipe.
http://www.nazgul.ch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...dd-possibility-to-override-variables.patch | 145 ------------------
 .../recipes-httpd/nostromo/files/nhttpd.conf  |  55 -------
 .../recipes-httpd/nostromo/files/nostromo     |  34 ----
 .../nostromo/files/tmpfiles.conf              |   1 -
 .../recipes-httpd/nostromo/files/volatiles    |   2 -
 .../recipes-httpd/nostromo/nostromo_1.9.9.bb  |  64 --------
 6 files changed, 301 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nostromo/files/0001-GNUmakefile-add-possibility-to-override-variables.patch
 delete mode 100644 meta-webserver/recipes-httpd/nostromo/files/nhttpd.conf
 delete mode 100644 meta-webserver/recipes-httpd/nostromo/files/nostromo
 delete mode 100644 meta-webserver/recipes-httpd/nostromo/files/tmpfiles.conf
 delete mode 100644 meta-webserver/recipes-httpd/nostromo/files/volatiles
 delete mode 100644 meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb

diff --git a/meta-webserver/recipes-httpd/nostromo/files/0001-GNUmakefile-add-possibility-to-override-variables.patch b/meta-webserver/recipes-httpd/nostromo/files/0001-GNUmakefile-add-possibility-to-override-variables.patch
deleted file mode 100644
index 8cd4682355..0000000000
--- a/meta-webserver/recipes-httpd/nostromo/files/0001-GNUmakefile-add-possibility-to-override-variables.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From 7fa0d31ec5c0be9dca84a03851b2d44f61527ec8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
-Date: Sun, 4 Dec 2011 16:01:04 +0100
-Subject: [PATCH] GNUmakefile: add possibility to override variables
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-this is useful for cross compilation
-
-Signed-off-by: Eric Bénard <eric@eukrea.com>
----
-Upstream-Status: Inappropriate [embedded specific]
- src/libbsd/GNUmakefile |   10 +++++-----
- src/libmy/GNUmakefile  |   26 +++++++++++++-------------
- src/nhttpd/GNUmakefile |   12 ++++++------
- src/tools/GNUmakefile  |    8 ++++----
- 4 files changed, 28 insertions(+), 28 deletions(-)
-
-diff --git a/src/libbsd/GNUmakefile b/src/libbsd/GNUmakefile
-index e2d01a3..b034bc6 100644
---- a/src/libbsd/GNUmakefile
-+++ b/src/libbsd/GNUmakefile
-@@ -1,12 +1,12 @@
--CCFLAGS = -O2 -pipe -Wall -Werror -Wstrict-prototypes -c
-+CFLAGS := -O2 -pipe -Wall -Werror -Wstrict-prototypes -c
- 
- libbsd.a:	strlcpy.o strlcat.o
--		ar -r libbsd.a strlcpy.o strlcat.o
--		ranlib libbsd.a
-+		$(AR) -r libbsd.a strlcpy.o strlcat.o
-+		$(RANLIB) libbsd.a
- 
- strlcpy.o:	strlcpy.c
--		cc ${CCFLAGS} strlcpy.c
-+		$(CC) $(CFLAGS) strlcpy.c
- strlcat.o:	strlcat.c
--		cc ${CCFLAGS} strlcat.c
-+		$(CC) $(CFLAGS) strlcat.c
- clean:
- 		rm -f libbsd.a *.o
-diff --git a/src/libmy/GNUmakefile b/src/libmy/GNUmakefile
-index ce90dd9..891ffea 100644
---- a/src/libmy/GNUmakefile
-+++ b/src/libmy/GNUmakefile
-@@ -1,30 +1,30 @@
--CCFLAGS = -O2 -Wall -Werror -Wstrict-prototypes -c
-+CFLAGS := -O2 -Wall -Werror -Wstrict-prototypes -c
- 
- libmy.a:	strcutl.o strcutw.o strcuts.o strcuti.o strcutf.o flog.o flogd.o fparse.o strlower.o strb64d.o
--		ar -r libmy.a strcutl.o strcutw.o strcuts.o strcuti.o strcutf.o flog.o flogd.o fparse.o strlower.o strb64d.o
--		ranlib libmy.a
-+		$(AR) -r libmy.a strcutl.o strcutw.o strcuts.o strcuti.o strcutf.o flog.o flogd.o fparse.o strlower.o strb64d.o
-+		$(RANLIB) libmy.a
- 
- strcutl.o:	strcutl.c
--		cc ${CCFLAGS} strcutl.c
-+		$(CC) $(CFLAGS) strcutl.c
- strcutw.o:	strcutw.c
--		cc ${CCFLAGS} strcutw.c
-+		$(CC) $(CFLAGS) strcutw.c
- strcuts.o:	strcuts.c
--		cc ${CCFLAGS} strcuts.c
-+		$(CC) $(CFLAGS) strcuts.c
- strcuti.o:	strcuti.c
--		cc ${CCFLAGS} strcuti.c
-+		$(CC) $(CFLAGS) strcuti.c
- strcutf.o:	strcutf.c
--		cc ${CCFLAGS} strcutf.c
-+		$(CC) $(CFLAGS) strcutf.c
- strlower.o:	strlower.c
--		cc ${CCFLAGS} strlower.c
-+		$(CC) $(CFLAGS) strlower.c
- strb64d.o:	strb64d.c
--		cc ${CCFLAGS} strb64d.c
-+		$(CC) $(CFLAGS) strb64d.c
- 
- flog.o:		flog.c
--		cc ${CCFLAGS} flog.c
-+		$(CC) $(CFLAGS) flog.c
- flogd.o:	flogd.c
--		cc ${CCFLAGS} flogd.c
-+		$(CC) $(CFLAGS) flogd.c
- fparse.o:	fparse.c
--		cc ${CCFLAGS} fparse.c
-+		$(CC) $(CFLAGS) fparse.c
- 
- clean:
- 		rm -f libmy.a *.o
-diff --git a/src/nhttpd/GNUmakefile b/src/nhttpd/GNUmakefile
-index f6d12de..9524911 100644
---- a/src/nhttpd/GNUmakefile
-+++ b/src/nhttpd/GNUmakefile
-@@ -1,20 +1,20 @@
- #	$nostromo: GNUmakefile,v 1.6 2016/04/12 19:02:06 hacki Exp $
- 
--CCFLAGS = -O2 -pipe -Wall -Wstrict-prototypes -c
-+CFLAGS := -O2 -pipe -Wall -Wstrict-prototypes -c
- 
- nhttpd:	main.o http.o sys.o
--	cc -L../libmy -L../libbsd -o nhttpd main.o http.o sys.o -lmy -lbsd -lssl -lcrypt
--	strip nhttpd
-+	$(CC) -L../libmy -L../libbsd -o nhttpd main.o http.o sys.o -lmy -lbsd -lssl -lcrypt
-+#	$(STRIP) nhttpd
- 	nroff -Tascii -c -mandoc nhttpd.8 > nhttpd.cat8
- 
- main.o:	main.c
--	cc ${CCFLAGS} main.c
-+	$(CC) $(CFLAGS) main.c
- 
- http.o:	http.c
--	cc ${CCFLAGS} http.c
-+	$(CC) $(CFLAGS) http.c
- 
- sys.o:	sys.c
--	cc ${CCFLAGS} sys.c
-+	$(CC) $(CFLAGS) sys.c
- 
- clean:
- 	rm -f nhttpd nhttpd.cat8 *.o
-diff --git a/src/tools/GNUmakefile b/src/tools/GNUmakefile
-index 15bea61..663ddb5 100644
---- a/src/tools/GNUmakefile
-+++ b/src/tools/GNUmakefile
-@@ -1,13 +1,13 @@
- #	$nostromo: GNUmakefile,v 1.3 2016/04/12 19:02:58 hacki Exp $
- 
--CCFLAGS = -O2 -pipe -Wall -Werror -Wstrict-prototypes -c
-+CFLAGS = -O2 -pipe -Wall -Werror -Wstrict-prototypes
- 
- crypt:		crypt.o
--		cc -L../libbsd -o crypt crypt.o -lcrypt -lbsd
--		strip crypt
-+		$(CC) $(CFLAGS) -L../libbsd -o crypt crypt.o -lcrypt -lbsd
-+#		$(STRIP) crypt
- 
- crypt.o:	crypt.c
--		cc ${CCFLAGS} crypt.c
-+		$(CC) $(CFLAGS) -c crypt.c
- 
- clean:
- 		rm -f crypt *.o
--- 
-1.7.6.4
-
diff --git a/meta-webserver/recipes-httpd/nostromo/files/nhttpd.conf b/meta-webserver/recipes-httpd/nostromo/files/nhttpd.conf
deleted file mode 100644
index 6674bb696c..0000000000
--- a/meta-webserver/recipes-httpd/nostromo/files/nhttpd.conf
+++ /dev/null
@@ -1,55 +0,0 @@
-# MAIN [MANDATORY]
-
-servername		localhost
-#servername		www.nazgul.ch:8080
-serverlisten		*
-#serverlisten		81.221.21.250 127.0.0.1 ::1
-serveradmin		webmaster@localhost
-serverroot		/var/nostromo
-servermimes		/var/nostromo/conf/mimes
-docroot			/var/nostromo/htdocs
-docindex		index.html
-
-# LOGS [OPTIONAL]
-
-logpid			/var/run/nostromo/nhttpd.pid
-#logaccess		/var/log/nostromo/access_log
-
-# SETUID [RECOMMENDED]
-
-user			www-data
-
-# BASIC AUTHENTICATION [OPTIONAL]
-
-#htaccess		.htaccess
-#htpasswd		/var/nostromo/conf/.htpasswd
-#htpasswd		+bsdauth
-#htpasswd		+bsdauthnossl
-
-# SSL [OPTIONAL]
-
-#sslport		443
-#sslcert		/etc/ssl/server.crt
-#sslcertkey		/etc/ssl/server.key
-
-# CUSTOM RESPONSES [OPTIONAL]
-#
-# The custom responses are searched in the corresponding document root.
-
-#custom_401		custom_401.html
-#custom_403		custom_403.html
-#custom_404		custom_404.html
-
-# ALIASES [OPTIONAL]
-
-/icons			/var/nostromo/icons
-
-# VIRTUAL HOSTS [OPTIONAL]
-
-#www.rahel.ch		/var/nostromo/htdocs/www.rahel.ch
-#www.rahel.ch:8080	/var/nostromo/htdocs/www.rahel.ch
-
-# HOMEDIRS [OPTIONAL]
-
-#homedirs		/home
-#homedirs_public	public_www
diff --git a/meta-webserver/recipes-httpd/nostromo/files/nostromo b/meta-webserver/recipes-httpd/nostromo/files/nostromo
deleted file mode 100644
index 8a28868829..0000000000
--- a/meta-webserver/recipes-httpd/nostromo/files/nostromo
+++ /dev/null
@@ -1,34 +0,0 @@
-#!/bin/sh
-
-PATH=/sbin:/bin:/usr/sbin:/usr/bin
-DAEMON=nhttpd
-NAME=nhttpd
-DESC="Nostromo Web Server"
-OPTS="-c /etc/nhttpd.conf"
-
-case "$1" in
-  start)
-	echo -n "Starting $DESC: "
-	start-stop-daemon --start -x "$DAEMON" -- $OPTS
-	echo "$NAME."
-	;;
-  stop)
-	echo -n "Stopping $DESC: "
-	start-stop-daemon --stop -x "$DAEMON"
-	echo "$NAME."
-	;;
-  restart|force-reload)
-	echo -n "Restarting $DESC: "
-	start-stop-daemon --stop -x "$DAEMON"
-	sleep 1
-	start-stop-daemon --start -x "$DAEMON" -- $OPTS
-	echo "$NAME."
-	;;
-  *)
-	N=/etc/init.d/$NAME
-	echo "Usage: $N {start|stop|restart|force-reload}" >&2
-	exit 1
-	;;
-esac
-
-exit 0
diff --git a/meta-webserver/recipes-httpd/nostromo/files/tmpfiles.conf b/meta-webserver/recipes-httpd/nostromo/files/tmpfiles.conf
deleted file mode 100644
index b7a9f4886e..0000000000
--- a/meta-webserver/recipes-httpd/nostromo/files/tmpfiles.conf
+++ /dev/null
@@ -1 +0,0 @@
-d /run/nostromo - www-data www-data -
diff --git a/meta-webserver/recipes-httpd/nostromo/files/volatiles b/meta-webserver/recipes-httpd/nostromo/files/volatiles
deleted file mode 100644
index 40924960c6..0000000000
--- a/meta-webserver/recipes-httpd/nostromo/files/volatiles
+++ /dev/null
@@ -1,2 +0,0 @@
-d www-data www-data 0775 /var/run/nostromo none
-d www-data www-data 0775 /var/log/nostromo none
diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb
deleted file mode 100644
index e726c9ac66..0000000000
--- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.9.bb
+++ /dev/null
@@ -1,64 +0,0 @@
-SUMMARY = "A simple, fast and secure HTTP server"
-HOMEPAGE = "http://www.nazgul.ch/dev_nostromo.html"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://src/nhttpd/main.c;beginline=2;endline=14;md5=0bb3711a867b9704d3bfabcf5529b64e"
-
-SRC_URI = "http://www.nazgul.ch/dev/${BPN}-${PV}.tar.gz \
-           file://0001-GNUmakefile-add-possibility-to-override-variables.patch \
-           file://nhttpd.conf \
-           file://volatiles \
-           file://tmpfiles.conf \
-           file://nostromo \
-"
-
-SRC_URI[md5sum] = "a054eb8e09560082793aaad676e33bd3"
-SRC_URI[sha256sum] = "1fad0a28d934835b582cedc98857e12e5adb991b14b87b52b39e6a501f4a9486"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-DEPENDS = "openssl groff-native base-passwd virtual/crypt"
-
-inherit update-rc.d
-
-INITSCRIPT_NAME = "nostromo"
-INITSCRIPT_PARAMS = "defaults 70"
-
-do_compile() {
-    oe_runmake
-}
-
-do_install() {
-    install -d ${D}/${sbindir}
-    install -m 0755 src/nhttpd/nhttpd ${D}/${sbindir}/nhttpd
-    install -m 0755 src/tools/crypt ${D}/${sbindir}/crypt
-    install -d ${D}/${mandir}/man8
-    install -m 0444 src/nhttpd/nhttpd.8 ${D}/${mandir}/man8/nhttpd.8
-    install -d ${D}${localstatedir}/nostromo/conf
-    install -d ${D}${localstatedir}/nostromo/htdocs/cgi-bin
-    install -d ${D}${localstatedir}/nostromo/icons
-    install -d ${D}${sysconfdir}/init.d
-    install -m 0644 conf/mimes ${D}${localstatedir}/nostromo/conf/mimes
-    install -m 0644 ${WORKDIR}/nhttpd.conf ${D}${sysconfdir}
-    install -m 0755 ${WORKDIR}/nostromo ${D}${sysconfdir}/init.d
-    install -D -m 0644 ${WORKDIR}/volatiles ${D}${sysconfdir}/default/volatiles/nostromo
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        install -D -m 0644 ${WORKDIR}/tmpfiles.conf ${D}${sysconfdir}/tmpfiles.d/nostromo.conf
-    fi
-    install -m 0644 htdocs/index.html ${D}${localstatedir}/nostromo/htdocs/index.html
-    install -m 0644 htdocs/nostromo.gif ${D}${localstatedir}/nostromo/htdocs/nostromo.gif
-    install -m 0644 icons/dir.gif ${D}${localstatedir}/nostromo/icons/dir.gif
-    install -m 0644 icons/file.gif ${D}${localstatedir}/nostromo/icons/file.gif
-    chown -R www-data:www-data ${D}/${localstatedir}/nostromo
-}
-
-CONFFILES_${PN} += "/var/nostromo/conf/mimes ${sysconfdir}/nhttpd.conf"
-
-pkg_postinst_${PN} () {
-    if [ -z "$D" ]; then
-        if [ -e /sys/fs/cgroup/systemd ]; then
-            systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/nostromo.conf
-        elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
-            ${sysconfdir}/init.d/populate-volatile.sh update
-        fi
-    fi
-}
-- 
2.17.1

