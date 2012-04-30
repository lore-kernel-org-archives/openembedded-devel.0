Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOkLP-0004jm-L4
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:44:23 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so2078332wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=c4jnr1E9SR8w42sZ9Ac27Ze5HkAo6DzDC+hmDK6858A=;
	b=B2jnIqPrXQcTnoDRacMwKOT9oqDsxrtrjqUXiepWbo4DjNVj+dtrNt/+erOYY+Mx38
	Btx3XY4apwaot/aOccsylf8DTxN99DhligIZUSB7ynkb/SMeVH87l9ulEDsjIUT46a1o
	ekkV1izYVh9+UqC1Yli2QNkHzujRPtyGUksMyhTSvEyUsK1QJKn0L5xfpFvXN6iP0Xgw
	D4cAvRMxCXiGMl+W9KapRnH9UzoDjbtY862ZtNQ8NHTaHUFIcZH1hZuwF95mN/CdPV2g
	nofTeniTVtY71apHBSHd5I0VR9w85WGQqG7BeHTeYXLnuJ9DpQQbZK9yYUkqNPp8qek+
	0Wpw==
Received: by 10.216.139.67 with SMTP id b45mr5817947wej.0.1335767684385;
	Sun, 29 Apr 2012 23:34:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fz9sm26404350wib.3.2012.04.29.23.34.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:34:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 08:33:08 +0200
Message-Id: <82c5c27596d90f65a3e9b11dda8efed6342d971b.1335767139.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 11/16] gpsd: add recipe for 3.5 with negative D_P for testing
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
X-List-Received-Date: Mon, 30 Apr 2012 06:44:23 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...strptime-prototype-is-not-provided-unless.patch |   39 ++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb        |  126 ++++++++++++++++++++
 2 files changed, 165 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/0003-Revert-The-strptime-prototype-is-not-provided-unless.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/0003-Revert-The-strptime-prototype-is-not-provided-unless.patch b/meta-oe/recipes-navigation/gpsd/gpsd/0003-Revert-The-strptime-prototype-is-not-provided-unless.patch
new file mode 100644
index 0000000..c2d191c
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd/0003-Revert-The-strptime-prototype-is-not-provided-unless.patch
@@ -0,0 +1,39 @@
+From c6bb11767172407bfaaebd962b4d12cd8e8a1fb0 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 24 Apr 2012 14:57:04 +0200
+Subject: [PATCH 3/4] Revert "The strptime prototype is not provided unless
+ explicitly requested."
+
+* This reverts commit 615d3eb14ea4833ce38ea89ec385308f4f679b33.
+* with _XOPEN_SOURCE defined, we don't have
+  CLOCK_REALTIME and timespec defined and build fails:
+  | arm-oe-linux-gnueabi-gcc -march=armv4t -mthumb -mthumb-interwork -mtune=arm920t --sysroot=/OE/shr-core/tmp-eglibc/sysroots/om-gta02 -o gpsutils.os -c -O2 -pipe -g -feliminate-unused-debug-types --sysroot=/OE/shr-core/tmp-eglibc/sysroots/om-gta02 -O2 -fPIC gpsutils.c
+  | gpsutils.c: In function 'timestamp':
+  | gpsutils.c:299:22: error: storage size of 'ts' isn't known
+  | gpsutils.c:300:34: error: 'CLOCK_REALTIME' undeclared (first use in this function)
+  | gpsutils.c:300:34: note: each undeclared identifier is reported only once for each function it appears in
+  | gpsutils.c: In function 'unix_to_iso8601':
+  | gpsutils.c:385:11: warning: incompatible implicit declaration of built-in function 'snprintf' [enabled by default]
+---
+ gpsutils.c |    5 -----
+ 1 files changed, 0 insertions(+), 5 deletions(-)
+
+diff --git a/gpsutils.c b/gpsutils.c
+index 60c4ae9..a1530ec 100644
+--- a/gpsutils.c
++++ b/gpsutils.c
+@@ -3,11 +3,6 @@
+  * This file is Copyright (c) 2010 by the GPSD project
+  * BSD terms apply: see the file COPYING in the distribution root for details.
+  */
+-
+-/* The strptime prototype is not provided unless explicitly requested.
+- *  So add the define that POSIX says to to avoid: */
+-#define _XOPEN_SOURCE
+-
+ #include <stdio.h>
+ #include <time.h>
+ #include <sys/time.h>
+-- 
+1.7.8.5
+
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
new file mode 100644
index 0000000..bd65eae
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
@@ -0,0 +1,126 @@
+DESCRIPTION = "A TCP/IP Daemon simplifying the communication with GPS devices"
+SECTION = "console/network"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
+DEPENDS = "dbus dbus-glib ncurses python libusb1"
+PROVIDES = "virtual/gpsd"
+
+DEFAULT_PREFERENCE = "-1"
+SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
+  file://0001-SConstruct-respect-sysroot-setting-when-prepending-L.patch \
+  file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
+  file://0003-Revert-The-strptime-prototype-is-not-provided-unless.patch \
+  file://0004-SConstruct-remove-rpath.patch \
+  file://gpsd-default \
+  file://gpsd \
+  file://60-gpsd.rules \
+"
+SRC_URI[md5sum] = "e96881798a0ab67aa3cd5f3249f0e536"
+SRC_URI[sha256sum] = "5ebb0b00c49421eb8fbead81342e5ce63e82065e5ff27da586f10e342b999171"
+
+inherit scons update-rc.d python-dir systemd
+
+INITSCRIPT_NAME = "gpsd"
+INITSCRIPT_PARAMS = "defaults 35"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "${PN}.socket"
+
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+EXTRA_OESCONS = " \
+  sysroot=${STAGING_DIR_TARGET} \
+  libQgpsmm='false' \
+  debug='true' \
+  strip='false' \
+  systemd='true' \
+"
+# this cannot be used, because then chrpath is not found and only static lib is built
+# target=${HOST_SYS}
+
+do_compile_prepend() {
+    export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
+    export PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\" pkg-config"
+    export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
+
+    export BUILD_SYS="${BUILD_SYS}"
+    export HOST_SYS="${HOST_SYS}"
+}
+
+do_install() {
+    export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
+    export PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\" pkg-config"
+    export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
+
+    export BUILD_SYS="${BUILD_SYS}"
+    export HOST_SYS="${HOST_SYS}"
+
+    export DESTDIR="${D}"
+    # prefix is used for RPATH and DESTDIR/prefix for instalation
+    ${STAGING_BINDIR_NATIVE}/scons prefix=${prefix} install ${EXTRA_OESCONS}|| \
+      bbfatal "scons install execution failed."
+}
+
+do_install_append() {
+    install -d ${D}/${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/gpsd ${D}/${sysconfdir}/init.d/
+    install -d ${D}/${sysconfdir}/default
+    install -m 0644 ${WORKDIR}/gpsd-default ${D}/${sysconfdir}/default/gpsd.default
+
+    #support for udev
+    install -d ${D}/${sysconfdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/60-gpsd.rules ${D}/${sysconfdir}/udev/rules.d
+    install -d ${D}${base_libdir}/udev/
+    install -m 0755 ${S}/gpsd.hotplug ${D}${base_libdir}/udev/
+
+    #support for python
+    install -d ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
+    install -m 755 ${S}/gps/*.py ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
+
+    #support for systemd
+    install -d ${D}${systemd_unitdir}/system/
+    install -m 0644 ${S}/systemd/${PN}.service ${D}${systemd_unitdir}/system/${PN}.service
+    install -m 0644 ${S}/systemd/${PN}.socket ${D}${systemd_unitdir}/system/${PN}.socket
+}
+
+pkg_postinst_${PN}-conf() {
+	update-alternatives --install ${sysconfdir}/default/gpsd gpsd-defaults ${sysconfdir}/default/gpsd.default 10
+}
+
+pkg_postrm_${PN}-conf() {
+	update-alternatives --remove gpsd-defaults ${sysconfdir}/default/gpsd.default
+}
+
+PACKAGES =+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils"
+
+FILES_gpsd-dev += "${libdir}/pkgconfdir/libgpsd.pc ${libdir}/pkgconfdir/libgps.pc"
+
+FILES_python-pygps-dbg += " ${libdir}/python*/site-packages/gps/.debug"
+
+RDEPENDS_${PN} = "gpsd-gpsctl"
+RRECOMMENDS_${PN} = "gpsd-conf gpsd-udev"
+
+DESCRIPTION_gpsd-udev = "udev relevant files to use gpsd hotplugging"
+FILES_gpsd-udev = "${base_libdir}/udev ${sysconfdir}/udev/*"
+RDEPENDS_gpsd-udev += "udev gpsd-conf"
+
+DESCRIPTION_libgpsd = "C service library used for communicating with gpsd"
+FILES_libgpsd = "${libdir}/libgpsd.so.*"
+
+DESCRIPTION_libgps = "C service library used for communicating with gpsd"
+FILES_libgps = "${libdir}/libgps.so.*"
+
+DESCRIPTION_gpsd-conf = "gpsd configuration files and init scripts"
+FILES_gpsd-conf = "${sysconfdir}"
+
+DESCRIPTION_gpsd-gpsctl = "Tool for tweaking GPS modes"
+FILES_gpsd-gpsctl = "${bindir}/gpsctl"
+
+DESCRIPTION_gps-utils = "Utils used for simulating, monitoring,... a GPS"
+FILES_gps-utils = "${bindir}/*"
+RDEPENDS_gps-utils = "python-pygps"
+
+DESCRIPTION_python-pygps = "Python bindings to gpsd"
+FILES_python-pygps = "${PYTHON_SITEPACKAGES_DIR}/*"
+RDEPENDS_python-pygps = "python-core python-curses gpsd python-json"
-- 
1.7.8.6



