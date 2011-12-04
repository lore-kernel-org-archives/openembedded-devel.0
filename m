Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RXIoK-0006bJ-WE
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Dec 2011 21:37:21 +0100
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 0B26BA6611;
	Sun,  4 Dec 2011 21:30:30 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Dec 2011 21:30:26 +0100
Message-Id: <1323030626-564-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <jbgcgc$tmh$1@dough.gmane.org>
References: <jbgcgc$tmh$1@dough.gmane.org>
MIME-Version: 1.0
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe v4] add nostromo webserver
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Dec 2011 20:37:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

this recipe was imported from OE-classic and upgraded to latest
version

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 ...ile-add-possibility-to-override-variables.patch |  141 ++++++++++++++=
++++++
 .../recipes-extended/nostromo/files/nhttpd.conf    |   55 ++++++++
 meta-oe/recipes-extended/nostromo/files/nostromo   |   34 +++++
 meta-oe/recipes-extended/nostromo/files/volatiles  |    2 +
 .../recipes-extended/nostromo/nostromo_1.9.5.bb    |   51 +++++++
 5 files changed, 283 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/nostromo/files/0001-GNUmakef=
ile-add-possibility-to-override-variables.patch
 create mode 100644 meta-oe/recipes-extended/nostromo/files/nhttpd.conf
 create mode 100644 meta-oe/recipes-extended/nostromo/files/nostromo
 create mode 100644 meta-oe/recipes-extended/nostromo/files/volatiles
 create mode 100644 meta-oe/recipes-extended/nostromo/nostromo_1.9.5.bb

diff --git a/meta-oe/recipes-extended/nostromo/files/0001-GNUmakefile-add=
-possibility-to-override-variables.patch b/meta-oe/recipes-extended/nostr=
omo/files/0001-GNUmakefile-add-possibility-to-override-variables.patch
new file mode 100644
index 0000000..7cf011b
--- /dev/null
+++ b/meta-oe/recipes-extended/nostromo/files/0001-GNUmakefile-add-possib=
ility-to-override-variables.patch
@@ -0,0 +1,141 @@
+From 7fa0d31ec5c0be9dca84a03851b2d44f61527ec8 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Eric=3D20B=3DC3=3DA9nard?=3D <eric@eukrea.com>
+Date: Sun, 4 Dec 2011 16:01:04 +0100
+Subject: [PATCH] GNUmakefile: add possibility to override variables
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+this is useful for cross compilation
+
+Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
+---
+Upstream-Status: Inappropriate [embedded specific]
+ src/libbsd/GNUmakefile |   10 +++++-----
+ src/libmy/GNUmakefile  |   26 +++++++++++++-------------
+ src/nhttpd/GNUmakefile |   12 ++++++------
+ src/tools/GNUmakefile  |    8 ++++----
+ 4 files changed, 28 insertions(+), 28 deletions(-)
+
+diff --git a/src/libbsd/GNUmakefile b/src/libbsd/GNUmakefile
+index e2d01a3..b034bc6 100644
+--- a/src/libbsd/GNUmakefile
++++ b/src/libbsd/GNUmakefile
+@@ -1,12 +1,12 @@
+-CCFLAGS =3D -O2 -pipe -Wall -Werror -Wstrict-prototypes -c
++CFLAGS :=3D -O2 -pipe -Wall -Werror -Wstrict-prototypes -c
+=20
+ libbsd.a:	strlcpy.o strlcat.o
+-		ar -r libbsd.a strlcpy.o strlcat.o
+-		ranlib libbsd.a
++		$(AR) -r libbsd.a strlcpy.o strlcat.o
++		$(RANLIB) libbsd.a
+=20
+ strlcpy.o:	strlcpy.c
+-		cc ${CCFLAGS} strlcpy.c
++		$(CC) $(CFLAGS) strlcpy.c
+ strlcat.o:	strlcat.c
+-		cc ${CCFLAGS} strlcat.c
++		$(CC) $(CFLAGS) strlcat.c
+ clean:
+ 		rm -f libbsd.a *.o
+diff --git a/src/libmy/GNUmakefile b/src/libmy/GNUmakefile
+index ce90dd9..891ffea 100644
+--- a/src/libmy/GNUmakefile
++++ b/src/libmy/GNUmakefile
+@@ -1,30 +1,30 @@
+-CCFLAGS =3D -O2 -Wall -Werror -Wstrict-prototypes -c
++CFLAGS :=3D -O2 -Wall -Werror -Wstrict-prototypes -c
+=20
+ libmy.a:	strcutl.o strcutw.o strcuts.o strcuti.o strcutf.o flog.o flogd=
.o fparse.o strlower.o strb64d.o
+-		ar -r libmy.a strcutl.o strcutw.o strcuts.o strcuti.o strcutf.o flog.=
o flogd.o fparse.o strlower.o strb64d.o
+-		ranlib libmy.a
++		$(AR) -r libmy.a strcutl.o strcutw.o strcuts.o strcuti.o strcutf.o fl=
og.o flogd.o fparse.o strlower.o strb64d.o
++		$(RANLIB) libmy.a
+=20
+ strcutl.o:	strcutl.c
+-		cc ${CCFLAGS} strcutl.c
++		$(CC) $(CFLAGS) strcutl.c
+ strcutw.o:	strcutw.c
+-		cc ${CCFLAGS} strcutw.c
++		$(CC) $(CFLAGS) strcutw.c
+ strcuts.o:	strcuts.c
+-		cc ${CCFLAGS} strcuts.c
++		$(CC) $(CFLAGS) strcuts.c
+ strcuti.o:	strcuti.c
+-		cc ${CCFLAGS} strcuti.c
++		$(CC) $(CFLAGS) strcuti.c
+ strcutf.o:	strcutf.c
+-		cc ${CCFLAGS} strcutf.c
++		$(CC) $(CFLAGS) strcutf.c
+ strlower.o:	strlower.c
+-		cc ${CCFLAGS} strlower.c
++		$(CC) $(CFLAGS) strlower.c
+ strb64d.o:	strb64d.c
+-		cc ${CCFLAGS} strb64d.c
++		$(CC) $(CFLAGS) strb64d.c
+=20
+ flog.o:		flog.c
+-		cc ${CCFLAGS} flog.c
++		$(CC) $(CFLAGS) flog.c
+ flogd.o:	flogd.c
+-		cc ${CCFLAGS} flogd.c
++		$(CC) $(CFLAGS) flogd.c
+ fparse.o:	fparse.c
+-		cc ${CCFLAGS} fparse.c
++		$(CC) $(CFLAGS) fparse.c
+=20
+ clean:
+ 		rm -f libmy.a *.o
+diff --git a/src/nhttpd/GNUmakefile b/src/nhttpd/GNUmakefile
+index f6d12de..9524911 100644
+--- a/src/nhttpd/GNUmakefile
++++ b/src/nhttpd/GNUmakefile
+@@ -1,18 +1,18 @@
+-CCFLAGS =3D -O2 -pipe -Wall -Wstrict-prototypes -c
++CFLAGS :=3D -O2 -pipe -Wall -Wstrict-prototypes -c
+=20
+ nhttpd:	main.o http.o sys.o
+-	cc -L../libmy -L../libbsd -o nhttpd main.o http.o sys.o -lmy -lbsd -ls=
sl -lcrypt
+-	strip nhttpd
++	$(CC) -L../libmy -L../libbsd -o nhttpd main.o http.o sys.o -lmy -lbsd =
-lssl -lcrypt
++#	$(STRIP) nhttpd
+ 	nroff -Tascii -c -mandoc nhttpd.8 > nhttpd.cat8
+=20
+ main.o:	main.c
+-	cc ${CCFLAGS} main.c
++	$(CC) $(CFLAGS) main.c
+=20
+ http.o:	http.c
+-	cc ${CCFLAGS} http.c
++	$(CC) $(CFLAGS) http.c
+=20
+ sys.o:	sys.c
+-	cc ${CCFLAGS} sys.c
++	$(CC) $(CFLAGS) sys.c
+=20
+ clean:
+ 	rm -f nhttpd nhttpd.cat8 *.o
+diff --git a/src/tools/GNUmakefile b/src/tools/GNUmakefile
+index 15bea61..663ddb5 100644
+--- a/src/tools/GNUmakefile
++++ b/src/tools/GNUmakefile
+@@ -1,11 +1,11 @@
+-CCFLAGS =3D -O2 -pipe -Wall -Werror -Wstrict-prototypes -c
++CCFLAGS :=3D -O2 -pipe -Wall -Werror -Wstrict-prototypes
+=20
+ crypt:		crypt.o
+-		cc -o crypt crypt.o -lcrypt
+-		strip crypt
++		$(CC) $(CFLAGS) -o crypt crypt.o -lcrypt
++#		$(STRIP) crypt
+=20
+ crypt.o:	crypt.c
+-		cc ${CCFLAGS} crypt.c
++		$(CC) $(CFLAGS) -c crypt.c
+=20
+ clean:
+ 		rm -f crypt *.o
+--=20
+1.7.6.4
+
diff --git a/meta-oe/recipes-extended/nostromo/files/nhttpd.conf b/meta-o=
e/recipes-extended/nostromo/files/nhttpd.conf
new file mode 100644
index 0000000..6674bb6
--- /dev/null
+++ b/meta-oe/recipes-extended/nostromo/files/nhttpd.conf
@@ -0,0 +1,55 @@
+# MAIN [MANDATORY]
+
+servername		localhost
+#servername		www.nazgul.ch:8080
+serverlisten		*
+#serverlisten		81.221.21.250 127.0.0.1 ::1
+serveradmin		webmaster@localhost
+serverroot		/var/nostromo
+servermimes		/var/nostromo/conf/mimes
+docroot			/var/nostromo/htdocs
+docindex		index.html
+
+# LOGS [OPTIONAL]
+
+logpid			/var/run/nostromo/nhttpd.pid
+#logaccess		/var/log/nostromo/access_log
+
+# SETUID [RECOMMENDED]
+
+user			www-data
+
+# BASIC AUTHENTICATION [OPTIONAL]
+
+#htaccess		.htaccess
+#htpasswd		/var/nostromo/conf/.htpasswd
+#htpasswd		+bsdauth
+#htpasswd		+bsdauthnossl
+
+# SSL [OPTIONAL]
+
+#sslport		443
+#sslcert		/etc/ssl/server.crt
+#sslcertkey		/etc/ssl/server.key
+
+# CUSTOM RESPONSES [OPTIONAL]
+#
+# The custom responses are searched in the corresponding document root.
+
+#custom_401		custom_401.html
+#custom_403		custom_403.html
+#custom_404		custom_404.html
+
+# ALIASES [OPTIONAL]
+
+/icons			/var/nostromo/icons
+
+# VIRTUAL HOSTS [OPTIONAL]
+
+#www.rahel.ch		/var/nostromo/htdocs/www.rahel.ch
+#www.rahel.ch:8080	/var/nostromo/htdocs/www.rahel.ch
+
+# HOMEDIRS [OPTIONAL]
+
+#homedirs		/home
+#homedirs_public	public_www
diff --git a/meta-oe/recipes-extended/nostromo/files/nostromo b/meta-oe/r=
ecipes-extended/nostromo/files/nostromo
new file mode 100644
index 0000000..8a28868
--- /dev/null
+++ b/meta-oe/recipes-extended/nostromo/files/nostromo
@@ -0,0 +1,34 @@
+#!/bin/sh
+
+PATH=3D/sbin:/bin:/usr/sbin:/usr/bin
+DAEMON=3Dnhttpd
+NAME=3Dnhttpd
+DESC=3D"Nostromo Web Server"
+OPTS=3D"-c /etc/nhttpd.conf"
+
+case "$1" in
+  start)
+	echo -n "Starting $DESC: "
+	start-stop-daemon --start -x "$DAEMON" -- $OPTS
+	echo "$NAME."
+	;;
+  stop)
+	echo -n "Stopping $DESC: "
+	start-stop-daemon --stop -x "$DAEMON"
+	echo "$NAME."
+	;;
+  restart|force-reload)
+	echo -n "Restarting $DESC: "
+	start-stop-daemon --stop -x "$DAEMON"
+	sleep 1
+	start-stop-daemon --start -x "$DAEMON" -- $OPTS
+	echo "$NAME."
+	;;
+  *)
+	N=3D/etc/init.d/$NAME
+	echo "Usage: $N {start|stop|restart|force-reload}" >&2
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/meta-oe/recipes-extended/nostromo/files/volatiles b/meta-oe/=
recipes-extended/nostromo/files/volatiles
new file mode 100644
index 0000000..4092496
--- /dev/null
+++ b/meta-oe/recipes-extended/nostromo/files/volatiles
@@ -0,0 +1,2 @@
+d www-data www-data 0775 /var/run/nostromo none
+d www-data www-data 0775 /var/log/nostromo none
diff --git a/meta-oe/recipes-extended/nostromo/nostromo_1.9.5.bb b/meta-o=
e/recipes-extended/nostromo/nostromo_1.9.5.bb
new file mode 100644
index 0000000..a368887
--- /dev/null
+++ b/meta-oe/recipes-extended/nostromo/nostromo_1.9.5.bb
@@ -0,0 +1,51 @@
+HOMEPAGE =3D "http://www.nazgul.ch/dev_nostromo.html"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://src/nhttpd/main.c;beginline=3D2;endline=3D1=
4;md5=3De5ec3fa723b29b7d59d205afd8d36938"
+
+SRC_URI =3D "http://www.nazgul.ch/dev/${PN}-${PV}.tar.gz \
+           file://0001-GNUmakefile-add-possibility-to-override-variables=
.patch \
+           file://nhttpd.conf \
+           file://volatiles \
+           file://nostromo \
+           "
+
+TARGET_CC_ARCH +=3D "${LDFLAGS}"
+
+DEPENDS =3D "openssl"
+
+inherit update-rc.d
+
+INITSCRIPT_NAME =3D "nostromo"
+INITSCRIPT_PARAMS =3D "defaults 70"
+
+do_compile() {
+    oe_runmake
+}
+
+do_install() {
+    install -d ${D}/${sbindir}
+    install -m 0755 src/nhttpd/nhttpd ${D}/${sbindir}/nhttpd
+    install -m 0755 src/tools/crypt ${D}/${sbindir}/crypt
+    install -d ${D}/${mandir}/man8
+    install -m 0444 src/nhttpd/nhttpd.8 ${D}/${mandir}/man8/nhttpd.8
+    install -d ${D}${localstatedir}/nostromo/conf
+    install -d ${D}${localstatedir}/nostromo/htdocs/cgi-bin
+    install -d ${D}${localstatedir}/nostromo/icons
+    install -d ${D}${localstatedir}/log/nostromo
+    install -d ${D}${localstatedir}/run/nostromo
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0644 conf/mimes ${D}${localstatedir}/nostromo/conf/mimes
+    install -m 0644 ${WORKDIR}/nhttpd.conf ${D}${sysconfdir}
+    install -m 0755 ${WORKDIR}/nostromo ${D}${sysconfdir}/init.d
+    install -c -D -m 644 ${WORKDIR}/volatiles ${D}${sysconfdir}/default/=
volatiles/nostromo
+    install -m 0644 htdocs/index.html ${D}${localstatedir}/nostromo/htdo=
cs/index.html
+    install -m 0644 htdocs/nostromo.gif ${D}${localstatedir}/nostromo/ht=
docs/nostromo.gif
+    install -m 0644 icons/dir.gif ${D}${localstatedir}/nostromo/icons/di=
r.gif
+    install -m 0644 icons/file.gif ${D}${localstatedir}/nostromo/icons/f=
ile.gif
+    chown -R www-data:www-data ${D}/${localstatedir}/nostromo ${D}/${loc=
alstatedir}/log/nostromo ${D}/${localstatedir}/run/nostromo
+}
+
+SRC_URI[md5sum] =3D "dc6cfd6b5aae04c370c7f818fa7bde55"
+SRC_URI[sha256sum] =3D "5f62578285e02449406b46cf06a7888fe3dc4a90bedf58cc=
18523bad62f6b914"
+
+CONFFILES_${PN} +=3D "/var/nostromo/conf/mimes ${sysconfdir}/nhttpd.conf=
"
--=20
1.7.6.4



