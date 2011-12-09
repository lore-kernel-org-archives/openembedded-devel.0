Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RZ4ro-0003ZU-He
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 19:08:16 +0100
Received: by ghrr13 with SMTP id r13so2606785ghr.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2011 10:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=ocxY1Nffa5ksICz3mIUDWV3CUNTu9F+tBOIyttblqJk=;
	b=FYk4OheHaLWux1xLPZ15R6HiJtWCbWTSvvr21FMRd+Uh+4LgJX+B5UoVJwTUxSqwTI
	Icf7s2KbLI53jYQrk4z3vjtnMzfnUJ13vD79nchxk3c7o/LL4kh/YPlFwM4Tq7QmiCB9
	ETmAtrtGdnnnf4dDEAEBWa3oCOqmpANMPRkaI=
Received: by 10.236.131.97 with SMTP id l61mr13880383yhi.52.1323453685056;
	Fri, 09 Dec 2011 10:01:25 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id f17sm25807387ang.20.2011.12.09.10.01.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 10:01:24 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Dec 2011 18:01:14 +0000
Message-Id: <126734ab37e3b7aeafbe780438412ae03e6d713f.1323453661.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323453661.git.otavio@ossystems.com.br>
References: <cover.1323453661.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/1] connman: convert to bbappend as 0.78 has been moved to OE-Core
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
X-List-Received-Date: Fri, 09 Dec 2011 18:08:16 -0000

---
 meta-oe/recipes-connectivity/connman/connman.inc   |   98 --------------------
 .../recipes-connectivity/connman/connman/connman   |   42 ---------
 .../recipes-connectivity/connman/connman_0.78.bb   |   33 -------
 .../connman/connman_0.78.bbappend                  |   13 +++
 4 files changed, 13 insertions(+), 173 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/connman/connman.inc
 delete mode 100755 meta-oe/recipes-connectivity/connman/connman/connman
 delete mode 100644 meta-oe/recipes-connectivity/connman/connman_0.78.bb
 create mode 100644 meta-oe/recipes-connectivity/connman/connman_0.78.bbappend

diff --git a/meta-oe/recipes-connectivity/connman/connman.inc b/meta-oe/recipes-connectivity/connman/connman.inc
deleted file mode 100644
index 88b2e51..0000000
--- a/meta-oe/recipes-connectivity/connman/connman.inc
+++ /dev/null
@@ -1,98 +0,0 @@
-SUMMARY = "A daemon for managing internet connections within embedded devices"
-DESCRIPTION = "The ConnMan project provides a daemon for managing \
-internet connections within embedded devices running the Linux \
-operating system.  The Connection Manager is designed to be slim and \
-to use as few resources as possible, so it can be easily integrated. \
-It is a fully modular system that can be extended, through plug-ins, \
-to support all kinds of wired or wireless technologies. Also, \
-configuration methods, like DHCP and domain name resolving, are \
-implemented using plug-ins."
-HOMEPAGE = "http://connman.net/"
-BUGTRACKER = "http://bugs.meego.com/buglist.cgi?quicksearch=connman"
-LICENSE  = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
-                    file://src/main.c;beginline=1;endline=20;md5=4b55b550fa6b33cc2055ef30dd262b3e"
-
-# we need to define the depends here, the dynamic stuff is too late
-DEPENDS  = "dbus glib-2.0 ppp busybox dhcp resolvconf iptables gnutls ntp \
-            ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)} \
-            ${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
-            "
-
-EXTRA_OECONF += "\
-    ac_cv_path_WPASUPPLICANT=/usr/sbin/wpa_supplicant \
-    ac_cv_path_DHCLIENT=/sbin/dhclient \
-    ac_cv_path_UDHCPC=/sbin/udhcpc \
-    ac_cv_path_RESOLVCONF=/sbin/resolvconf \
-    ac_cv_path_PPPD=/usr/sbin/pppd \
-    --with-systemdunitdir=${base_libdir}/systemd/system/ \
-"
-
-INITSCRIPT_NAME = "connman"
-INITSCRIPT_PARAMS = "start 05 5 2 . stop 22 0 1 6 ."
-
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE_${PN}-systemd = "connman.service"
-
-PARALLEL_MAKE = ""
-
-inherit autotools pkgconfig update-rc.d systemd
-
-do_configure_append() {
-	ln -sf . include/connman
-}
-
-do_compile_append() {
-	sed -i -e s:deny:allow:g src/connman-dbus.conf
-}
-
-do_install_append() {
-	install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/connman ${D}${sysconfdir}/init.d/connman
-
-	install -d ${D}${bindir}
-	install -m 0755 ${S}/tools/*-test ${D}${bindir}
-	install -m 0755 ${S}/tools/wispr ${D}${bindir}
-}
-
-python populate_packages_prepend() {
-	depmap = dict( pppd="ppp", udhcp="busybox connman-scripts", dhclient="dhcp-client", wifi="wpa-supplicant", resolvconf="resolvconf", bluetooth="bluez4", ntpd="ntp", ofono="ofono" )
-	packages = []
-	hook = lambda file,pkg,b,c,d:packages.append((file,pkg))
-	plugin_dir = bb.data.expand('${libdir}/connman/plugins/', d)
-	plugin_name = bb.data.expand('${PN}-plugin-%s', d)
-	do_split_packages(d, plugin_dir, '^(.*).so$', plugin_name, '${PN} plugin for %s', extra_depends='', hook=hook )
-	for (file, package) in packages:
-		plugintype = package.split( '-' )[-1]
-		if plugintype in depmap:
-			rdepends = bb.data.getVar( "RDEPENDS_%s" % package, d )
-			bb.note( "Adding rdependency on %s to package %s" % ( depmap[plugintype], package ) )
-			bb.data.setVar("RDEPENDS_%s" % package, depmap[plugintype], d)
-}
-
-PACKAGES_DYNAMIC = "${PN}-plugin-*"
-
-PACKAGES =+ "${PN}-scripts ${PN}-tools ${PN}-tests"
-
-FILES_${PN}-tools = "${bindir}/wispr"
-FILES_${PN}-tests = "${bindir}/*-test"
-FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
-            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
-            ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* ${datadir}/${PN} \
-            ${datadir}/pixmaps ${datadir}/applications \
-            ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
-            ${libdir}/bonobo/servers \
-            ${datadir}/dbus-1/system-services/*"
-
-PACKAGES =+ "${PN}-systemd"
-# Package up systemd files
-FILES_${PN}-systemd += "${base_libdir}/systemd"
-RDEPENDS_${PN}-systemd += "${PN}"
-
-# Needed when using DNS proxy feature
-RRECOMMENDS_${PN} += "dnsmasq-dbus"
-
-FILES_${PN}-scripts += "${libdir}/connman/scripts"
-FILES_${PN}-dbg += "${libdir}/connman/*/.debug"
-FILES_${PN}-dev += "${libdir}/connman/*/*.la"
-
diff --git a/meta-oe/recipes-connectivity/connman/connman/connman b/meta-oe/recipes-connectivity/connman/connman/connman
deleted file mode 100755
index f8154f6..0000000
--- a/meta-oe/recipes-connectivity/connman/connman/connman
+++ /dev/null
@@ -1,42 +0,0 @@
-#!/bin/sh
-
-DAEMON=/usr/sbin/connmand
-PIDFILE=/var/run/connmand.pid
-DESC="Connection Manager"
-
-if [ -f /etc/default/connman ] ; then
-	. /etc/default/connman
-fi
-
-set -e
-
-do_start() {
-	$DAEMON
-}
-
-do_stop() {
-	start-stop-daemon --stop --name connmand --quiet
-}
-
-case "$1" in
-  start)
-	echo "Starting $DESC"
-	do_start
-	;;
-  stop)
-	echo "Stopping $DESC"
-	do_stop
-	;;
-  restart|force-reload)
-	echo "Restarting $DESC"
-	do_stop
-	sleep 1
-	do_start
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart|force-reload}" >&2
-	exit 1
-	;;
-esac
-
-exit 0
diff --git a/meta-oe/recipes-connectivity/connman/connman_0.78.bb b/meta-oe/recipes-connectivity/connman/connman_0.78.bb
deleted file mode 100644
index f486f95..0000000
--- a/meta-oe/recipes-connectivity/connman/connman_0.78.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-require connman.inc
-
-EXTRA_OECONF += "\
-  --disable-gtk-doc \
-  --enable-debug \
-  --enable-threads \
-  --enable-loopback \
-  --enable-ethernet \
-  ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi', '--disable-wifi', d)} \
-  ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
-  --enable-ofono \
-  --enable-tools \
-  --disable-polkit \
-  --enable-client \
-  --enable-fake \
-  --enable-ntpd \
-  --with-ntpd=${bindir}/ntpd \
-"
-
-S = "${WORKDIR}/git"
-
-# 0.78 tag
-SRCREV = "02f5d5fe2d7c71514a6387ba2b772b42d8e8d297"
-
-SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
-            file://connman"
-
-# alg-test doesn't build, so disable that and test for if_alg.h as this header is only in 2.6.39
-do_configure_prepend() {
-	sed -i 's:tools/alg-test ::g' Makefile.am
-	sed -i 's:AC_CHECK_HEADERS(linux/if_alg.h, dummy=yes,::g;
-	        s:AC_MSG_ERROR(User-space algorithm header files are required))::g' configure.ac
-}
diff --git a/meta-oe/recipes-connectivity/connman/connman_0.78.bbappend b/meta-oe/recipes-connectivity/connman/connman_0.78.bbappend
new file mode 100644
index 0000000..9a01d3d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/connman/connman_0.78.bbappend
@@ -0,0 +1,13 @@
+inherit systemd
+
+EXTRA_OECONF += "--with-systemdunitdir=${base_libdir}/systemd/system/"
+
+PR .= ".meta-oe.1"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE_${PN}-systemd = "connman.service"
+
+# systemd files
+PACKAGES =+ "${PN}-systemd"
+FILES_${PN}-systemd += "${base_libdir}/systemd"
+RDEPENDS_${PN}-systemd += "${PN}"
-- 
1.7.2.5



