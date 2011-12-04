Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RXEun-0003dc-H5
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Dec 2011 17:27:53 +0100
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id A81EBA6ACA;
	Sun,  4 Dec 2011 17:20:18 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Dec 2011 17:20:14 +0100
Message-Id: <1323015614-1952-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <jbb875$apq$1@dough.gmane.org>
References: <jbb875$apq$1@dough.gmane.org>
MIME-Version: 1.0
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe v3] add nostromo webserver
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
X-List-Received-Date: Sun, 04 Dec 2011 16:27:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

this recipe was imported from OE-classic and upgraded to latest
version

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../recipes-extended/nostromo/files/nhttpd.conf    |   55 ++++++++++++++=
++++++
 meta-oe/recipes-extended/nostromo/files/nostromo   |   34 ++++++++++++
 meta-oe/recipes-extended/nostromo/files/volatiles  |    2 +
 .../recipes-extended/nostromo/nostromo_1.9.5.bb    |   54 ++++++++++++++=
+++++
 4 files changed, 145 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/nostromo/files/nhttpd.conf
 create mode 100644 meta-oe/recipes-extended/nostromo/files/nostromo
 create mode 100644 meta-oe/recipes-extended/nostromo/files/volatiles
 create mode 100644 meta-oe/recipes-extended/nostromo/nostromo_1.9.5.bb

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
index 0000000..ee326d2
--- /dev/null
+++ b/meta-oe/recipes-extended/nostromo/nostromo_1.9.5.bb
@@ -0,0 +1,54 @@
+HOMEPAGE =3D "http://www.nazgul.ch/dev_nostromo.html"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://src/nhttpd/main.c;beginline=3D2;endline=3D1=
4;md5=3De5ec3fa723b29b7d59d205afd8d36938"
+
+SRC_URI =3D "http://www.nazgul.ch/dev/${PN}-${PV}.tar.gz \
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
+}
+
+pkg_postinst_${PN}_prepend() {
+    chown -R www-data:www-data  ${localstatedir}/nostromo ${localstatedi=
r}/log/nostromo ${localstatedir}/run/nostromo
+    /etc/init.d/populate-volatile.sh update
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



