Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web12.487.1618864094803817029
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Apr 2021 13:28:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1lYaV9-0001Te-V4; Mon, 19 Apr 2021 22:28:11 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1lYaV9-000119-2V; Mon, 19 Apr 2021 22:28:11 +0200
From: =?UTF-8?B?VWxyaWNoIMOWbG1hbm4=?= <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [meta-oe][PATCH] v4l-utils: fix reproducibility
Date: Mon, 19 Apr 2021 22:28:01 +0200
Message-Id: <20210419202801.3834-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add upstream patches [1] & [2] to automatically detect the availability of
systemd and (currently) never install '50-rc_keymap.conf' at all as the
prerequisite would be the ability to compile BPF programs which is not supported
in this recipe (at least not now).

Previously if your distro was not systemd based the existance of the host
system's path "/lib/systemd/system" decided if '50-rc_keymap.conf' was installed
or not.

[1] https://git.linuxtv.org/v4l-utils.git/commit/?id=3f61e353424fb9ea3dce742022b94dfd7ea1ed9f
[2] https://git.linuxtv.org/v4l-utils.git/commit/?id=01f2c6c58e6f4441df7df8e27eb7919f1f01e310

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 ...c-autodetect-availability-of-systemd.patch | 45 +++++++++++++++++++
 ...ct-installation-of-50-rc_keymap.conf.patch | 38 ++++++++++++++++
 .../v4l2apps/v4l-utils_1.20.0.bb              | 11 ++---
 3 files changed, 89 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0008-configure.ac-autodetect-availability-of-systemd.patch
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0009-keytable-restrict-installation-of-50-rc_keymap.conf.patch

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0008-configure.ac-autodetect-availability-of-systemd.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0008-configure.ac-autodetect-availability-of-systemd.patch
new file mode 100644
index 000000000000..a24b967e2497
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0008-configure.ac-autodetect-availability-of-systemd.patch
@@ -0,0 +1,45 @@
+From 3f61e353424fb9ea3dce742022b94dfd7ea1ed9f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
+Date: Thu, 4 Mar 2021 14:23:39 +0100
+Subject: [PATCH] configure.ac: autodetect availability of systemd
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Import systemd's official suggestion [1] how this should be handled in packages
+using autoconf. A side effect of this is the removal of the hardcoded fallback
+path "/lib/systemd/system" which leaks build host information when cross
+compiling v4l-utils and therefore defeats reproducible builds.
+
+[1] https://www.freedesktop.org/software/systemd/man/daemon.html#Installing%20systemd%20Service%20Files
+
+Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
+Signed-off-by: Sean Young <sean@mess.org>
+---
+ configure.ac | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 727730c5ccf4..8470116df4b1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -388,7 +388,15 @@ AC_ARG_WITH(udevdir,
+ AC_ARG_WITH(systemdsystemunitdir,
+ 	AS_HELP_STRING([--with-systemdsystemunitdir=DIR], [set systemd system unit directory]),
+ 	[],
+-	[with_systemdsystemunitdir=`$PKG_CONFIG --variable=systemdsystemunitdir systemd || echo /lib/systemd/system`])
++	[with_systemdsystemunitdir=auto])
++AS_IF([test "x$with_systemdsystemunitdir" = "xyes" -o "x$with_systemdsystemunitdir" = "xauto"],
++      [def_systemdsystemunitdir=$($PKG_CONFIG --variable=systemdsystemunitdir systemd)
++       AS_IF([test "x$def_systemdsystemunitdir" = "x"],
++             [AS_IF([test "x$with_systemdsystemunitdir" = "xyes"],
++                    [AC_MSG_ERROR([systemd support requested but pkg-config unable to query systemd package])])
++              with_systemdsystemunitdir=no],
++             [with_systemdsystemunitdir="$def_systemdsystemunitdir"])])
++AM_CONDITIONAL([HAVE_SYSTEMD], [test "x$with_systemdsystemunitdir" != "xno"])
+ 
+ # Generic check: works with most distributions
+ def_gconv_dir=`for i in /lib64 /usr/lib64 /usr/local/lib64 /lib /usr/lib /usr/local/lib; do if @<:@ -d \$i/gconv @:>@; then echo \$i/gconv; break; fi; done`
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0009-keytable-restrict-installation-of-50-rc_keymap.conf.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0009-keytable-restrict-installation-of-50-rc_keymap.conf.patch
new file mode 100644
index 000000000000..866eda54ddf4
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0009-keytable-restrict-installation-of-50-rc_keymap.conf.patch
@@ -0,0 +1,38 @@
+From 01f2c6c58e6f4441df7df8e27eb7919f1f01e310 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
+Date: Thu, 4 Mar 2021 14:23:40 +0100
+Subject: [PATCH] keytable: restrict installation of 50-rc_keymap.conf
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+It is only needed if BPF is effectively used and the package is compiled for a
+systemd based target.
+
+Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
+Signed-off-by: Sean Young <sean@mess.org>
+---
+ utils/keytable/Makefile.am | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/utils/keytable/Makefile.am b/utils/keytable/Makefile.am
+index c5eb414acf2f..eee61f0e0551 100644
+--- a/utils/keytable/Makefile.am
++++ b/utils/keytable/Makefile.am
+@@ -3,9 +3,13 @@ man_MANS = ir-keytable.1 rc_keymap.5
+ sysconf_DATA = rc_maps.cfg
+ keytablesystem_DATA = $(srcdir)/rc_keymaps/*
+ udevrules_DATA = 70-infrared.rules
++if WITH_BPF
++if HAVE_SYSTEMD
+ if HAVE_UDEVDSYSCALLFILTER
+ systemdsystemunit_DATA = 50-rc_keymap.conf
+ endif
++endif
++endif
+ 
+ ir_keytable_SOURCES = keytable.c parse.h ir-encode.c ir-encode.h toml.c toml.h keymap.c keymap.h
+ 
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
index 3e92d49b4fbb..2261feb56c20 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.20.0.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=48da9957849056017dc568bbc43d8975 \
 PROVIDES = "libv4l media-ctl"
 
 DEPENDS = "jpeg \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
+           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 DEPENDS_append_libc-musl = " argp-standalone"
 DEPENDS_append_class-target = " udev"
 LDFLAGS_append = " -pthread"
@@ -21,13 +22,14 @@ SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2 \
            file://export-mediactl-headers.patch \
            file://0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch \
            file://0007-Do-not-use-getsubopt.patch \
+           file://0008-configure.ac-autodetect-availability-of-systemd.patch \
+           file://0009-keytable-restrict-installation-of-50-rc_keymap.conf.patch \
            "
 SRC_URI[md5sum] = "46f9e2c0b2fdccd009da2f7e1aa87894"
 SRC_URI[sha256sum] = "956118713f7ccb405c55c7088a6a2490c32d54300dd9a30d8d5008c28d3726f7"
 
 EXTRA_OECONF = "--disable-qv4l2 --enable-shared --with-udevdir=${base_libdir}/udev \
-                --disable-v4l2-compliance-32 --disable-v4l2-ctl-32 \
-                --with-systemdsystemunitdir=${systemd_system_unitdir}"
+                --disable-v4l2-compliance-32 --disable-v4l2-ctl-32"
 
 VIRTUAL-RUNTIME_ir-keytable-keymaps ?= "rc-keymaps"
 
@@ -37,8 +39,7 @@ RPROVIDES_${PN}-dbg += "libv4l-dbg"
 
 FILES_media-ctl = "${bindir}/media-ctl ${libdir}/libmediactl.so.*"
 
-FILES_ir-keytable = "${bindir}/ir-keytable ${base_libdir}/udev/rules.d/*-infrared.rules \
-                     ${systemd_system_unitdir}/systemd-udevd.service.d/50-rc_keymap.conf"
+FILES_ir-keytable = "${bindir}/ir-keytable ${base_libdir}/udev/rules.d/*-infrared.rules"
 RDEPENDS_ir-keytable += "${VIRTUAL-RUNTIME_ir-keytable-keymaps}"
 
 FILES_rc-keymaps = "${sysconfdir}/rc* ${base_libdir}/udev/rc*"
-- 
2.29.2

