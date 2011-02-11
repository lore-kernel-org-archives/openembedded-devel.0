Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PnsSr-0001B3-Iy
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 13:51:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 51E93314D9FD;
	Fri, 11 Feb 2011 13:50:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id QFhF6uWw49ja; Fri, 11 Feb 2011 13:49:59 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 075C3314D9FA;
	Fri, 11 Feb 2011 13:49:58 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 11 Feb 2011 12:49:57 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Feb 2011 12:49:56 +0000
Message-Id: <1297428596-27694-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1297428596-27694-1-git-send-email-obi@opendreambox.org>
References: <1297428596-27694-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [PATCH 2/2] busybox: create busybox-inetd package
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
X-List-Received-Date: Fri, 11 Feb 2011 12:51:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

* Create package if CONFIG_INETD=3Dy.
* Use update-alternatives with priority 50.
* Install initscript and inetd.conf.
* RPROVIDE inetd

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
CC: Eric B=C3=A9nard <eric@eukrea.com>
---
 recipes/busybox/busybox.inc      |   45 ++++++++++++++++++++++++++++++++=
++++-
 recipes/busybox/busybox_1.1x.inc |    2 +
 recipes/busybox/files/inetd      |   33 +++++++++++++++++++++++++++
 recipes/busybox/files/inetd.conf |   20 ++++++++++++++++
 4 files changed, 98 insertions(+), 2 deletions(-)
 create mode 100755 recipes/busybox/files/inetd
 create mode 100644 recipes/busybox/files/inetd.conf

diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index 03efc99..9c0bddc 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -11,7 +11,7 @@ LICENSE =3D "GPLv2"
 SECTION =3D "base"
 PRIORITY =3D "required"
=20
-INC_PR =3D "r41"
+INC_PR =3D "r42"
=20
 SRC_URI =3D "\
   file://busybox-cron \
@@ -22,6 +22,8 @@ SRC_URI =3D "\
   file://hwclock.sh \
   file://hwclock-default \
   file://ifupdown-spurious-environ.patch \
+  file://inetd \
+  file://inetd.conf \
   file://mount.busybox \
   file://passwd \
   file://shadow \
@@ -35,7 +37,7 @@ SRC_URI_append_nylon =3D " file://xargs-double-size.pat=
ch"
=20
 export EXTRA_CFLAGS =3D "${CFLAGS}"
 EXTRA_OEMAKE_append =3D " CROSS=3D${HOST_PREFIX}"
-PACKAGES =3D+ "${PN}-mountall ${PN}-httpd ${PN}-syslog ${PN}-udhcpd"
+PACKAGES =3D+ "${PN}-mountall ${PN}-httpd ${PN}-inetd ${PN}-syslog ${PN}=
-udhcpd"
 PACKAGES =3D+ "${PN}-passwd ${PN}-shadow"
=20
 # We need this RRECOMMENDS_${PN} because libc dlopens libgcc
@@ -49,7 +51,11 @@ RDEPENDS_${PN} +=3D "${PN}-mountall"
 # Make busybox recommend busybox-syslog for those images that expect it
 RRECOMMENDS_${PN} +=3D "libgcc ${PN}-syslog"
=20
+RPROVIDES_${PN}-inetd =3D "inetd"
+
 FILES_${PN}-httpd =3D "${sysconfdir}/init.d/busybox-httpd /srv/www"
+FILES_${PN}-inetd =3D "${sysconfdir}/init.d/inetd.${PN} \
+                     ${sysconfdir}/inetd.conf"
 FILES_${PN}-passwd =3D "${sysconfdir}/passwd.${PN}"
 FILES_${PN}-shadow =3D "${sysconfdir}/shadow.${PN}"
 FILES_${PN}-syslog =3D "${sysconfdir}/init.d/syslog.${PN} \
@@ -62,14 +68,17 @@ FILES_${PN} +=3D "${datadir}/udhcpc"
 # update-rc.d and update-alternatives is important (see below)
 INITSCRIPT_PACKAGES =3D "${PN}-httpd ${PN}-udhcpd"
 INITSCRIPT_NAME_${PN}-httpd =3D "busybox-httpd"
+INITSCRIPT_NAME_${PN}-inetd =3D "inetd"
 INITSCRIPT_NAME_${PN}-syslog =3D "syslog"
 INITSCRIPT_NAME_${PN}-udhcpd =3D "busybox-udhcpd"
+CONFFILES_${PN}-inetd =3D "${sysconfdir}/inetd.conf"
 CONFFILES_${PN}-syslog =3D "${sysconfdir}/default/busybox-syslog"
=20
 # This disables the syslog startup links in slugos (see slugos-init)
 INITSCRIPT_PARAMS_${PN}-syslog_slugos =3D "start 20 ."
=20
 RDEPENDS_${PN}-httpd +=3D "${PN}"
+RDEPENDS_${PN}-inetd +=3D "${PN}"
 RDEPENDS_${PN}-passwd +=3D "${PN}"
 RDEPENDS_${PN}-shadow +=3D "${PN}-passwd"
 RDEPENDS_${PN}-syslog +=3D "${PN}"
@@ -224,6 +233,10 @@ do_install () {
 		install -d ${D}${sysconfdir}/default
 		install -m 644 ${WORKDIR}/mountall ${D}${sysconfdir}/default/mountall.=
${PN}
 	fi
+	if grep "CONFIG_INETD=3Dy" ${WORKDIR}/defconfig; then
+		install -m 0755 ${WORKDIR}/inetd ${D}${sysconfdir}/init.d/inetd.${PN}
+		install -m 0644 ${WORKDIR}/inetd.conf ${D}${sysconfdir}/
+	fi
=20
 	install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
 }
@@ -292,6 +305,34 @@ pkg_prerm_${PN}-shadow () {
 	update-alternatives --remove default_shadow shadow.${PN}
 }
=20
+pkg_postinst_${PN}-inetd () {
+	update-alternatives --install ${sysconfdir}/init.d/inetd inetd-init ine=
td.${PN} 50
+
+	[ -n "$D" ] && OPT=3D"-r $D" || OPT=3D"-s"
+	# remove all rc.d-links potentially created from alternative
+	# inetd packages before creating new ones
+	update-rc.d $OPT -f inetd remove
+	update-rc.d $OPT inetd start 20 2 3 4 5 . stop 90 0 1 6 .
+}
+
+pkg_prerm_${PN}-inetd () {
+	if test "x$D" =3D "x"; then
+		if test "$1" =3D "upgrade" -o "$1" =3D "remove"; then
+			/etc/init.d/inetd stop
+		fi
+	fi
+
+	update-alternatives --remove inetd-init inetd.${PN}
+}
+
+pkg_postrm_${PN}-inetd () {
+	if test "$1" =3D "remove" -o "$1" =3D "purge"; then
+		if ! test -e "/etc/init.d/inetd"; then
+			[ -n "$D" ] && OPT=3D"-r $D" || OPT=3D"-s"
+			update-rc.d $OPT inetd remove
+		fi
+	fi
+}
=20
 pkg_postinst_${PN}-syslog () {
 	update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init s=
yslog.${PN} 50
diff --git a/recipes/busybox/busybox_1.1x.inc b/recipes/busybox/busybox_1=
.1x.inc
index 1078aac..763b324 100644
--- a/recipes/busybox/busybox_1.1x.inc
+++ b/recipes/busybox/busybox_1.1x.inc
@@ -15,6 +15,8 @@ SRC_URI =3D "\
   file://default.script file://simple.script \
   file://hwclock.sh \
   file://hwclock-default \
+  file://inetd \
+  file://inetd.conf \
   file://mount.busybox \
   file://mountall \
   file://passwd \
diff --git a/recipes/busybox/files/inetd b/recipes/busybox/files/inetd
new file mode 100755
index 0000000..cf50bcd
--- /dev/null
+++ b/recipes/busybox/files/inetd
@@ -0,0 +1,33 @@
+#!/bin/sh
+#
+# start/stop inetd super server.
+
+if ! [ -x /usr/sbin/inetd ]; then
+	exit 0
+fi
+
+case "$1" in
+    start)
+	echo -n "Starting internet superserver:"
+	echo -n " inetd" ; start-stop-daemon -S -x /usr/sbin/inetd > /dev/null
+	echo "."
+	;;
+    stop)
+	echo -n "Stopping internet superserver:"
+	echo -n " inetd" ; start-stop-daemon -K -x /usr/sbin/inetd > /dev/null
+	echo "."
+	;;
+    restart)
+	echo -n "Restarting internet superserver:"
+	echo -n " inetd "
+	killall -HUP inetd
+	echo "."
+	;;
+    *)
+	echo "Usage: /etc/init.d/inetd {start|stop|restart}"
+	exit 1
+	;;
+esac
+
+exit 0
+
diff --git a/recipes/busybox/files/inetd.conf b/recipes/busybox/files/ine=
td.conf
new file mode 100644
index 0000000..b02fe85
--- /dev/null
+++ b/recipes/busybox/files/inetd.conf
@@ -0,0 +1,20 @@
+# /etc/inetd.conf:  see inetd(8) for further informations.
+#
+# Internet server configuration database
+#
+# If you want to disable an entry so it isn't touched during
+# package updates just comment it out with a single '#' character.
+#
+# <service_name> <sock_type> <proto> <flags> <user> <server_path> <args>
+#
+#:INTERNAL: Internal services
+#echo		stream	tcp	nowait	root	internal
+#echo		dgram	udp	wait	root	internal
+#chargen	stream	tcp	nowait	root	internal
+#chargen	dgram	udp	wait	root	internal
+#discard		stream	tcp	nowait	root	internal
+#discard		dgram	udp	wait	root	internal
+#daytime		stream	tcp	nowait	root	internal
+#daytime	dgram	udp	wait	root	internal
+#time		stream	tcp	nowait	root	internal
+#time		dgram	udp	wait	root	internal
--=20
1.7.2.3



