Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id EAD2976243
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jul 2015 10:00:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98979980"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Jul 2015 18:04:17 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6S9wor5025175
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jul 2015 17:58:50 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 28 Jul 2015 18:00:40 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Jul 2015 18:00:35 +0800
Message-ID: <1438077635-1903-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH] polkit: 0.112 -> 0.113
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
X-List-Received-Date: Tue, 28 Jul 2015 10:00:46 -0000
Content-Type: text/plain

Remove 0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch,
it is not needed anymore.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 ...c-Check-only-for-libsystemd-not-libsystem.patch | 39 ------------------
 meta-oe/recipes-extended/polkit/polkit_0.112.bb    | 47 ----------------------
 meta-oe/recipes-extended/polkit/polkit_0.113.bb    | 45 +++++++++++++++++++++
 3 files changed, 45 insertions(+), 86 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
 delete mode 100644 meta-oe/recipes-extended/polkit/polkit_0.112.bb
 create mode 100644 meta-oe/recipes-extended/polkit/polkit_0.113.bb

diff --git a/meta-oe/recipes-extended/polkit/polkit/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch b/meta-oe/recipes-extended/polkit/polkit/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
deleted file mode 100644
index b9334a8..0000000
--- a/meta-oe/recipes-extended/polkit/polkit/0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 56cadbc45c5ef98a7b775638d2109c4a09a58c06 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 22 Feb 2014 18:09:57 +0100
-Subject: [PATCH] configure.ac: Check only for libsystemd not libsystemd-login
-
-* they were merged into libsystemd in systemd-209
-
-Upstream-Status: Pending (it would need to be conditional on systemd version for upstream to accept this)
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index a7b0148..64d513d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -196,7 +196,7 @@ AC_ARG_ENABLE([libsystemd-login],
-               [enable_libsystemd_login=auto])
- if test "$enable_libsystemd_login" != "no"; then
-   PKG_CHECK_MODULES(LIBSYSTEMD_LOGIN,
--                    [libsystemd-login],
-+                    [libsystemd],
-                     have_libsystemd_login=yes,
-                     have_libsystemd_login=no)
-   if test "$have_libsystemd_login" = "yes"; then
-@@ -223,7 +223,7 @@ AS_IF([test "x$cross_compiling" != "xyes" ], [
-       AS_IF([test "$enable_libsystemd_login" = "no" ], [
-         AC_MSG_WARN([ConsoleKit requested but system appears to use systemd])
-       ], [
--        AC_MSG_ERROR([ConsoleKit autoconfigured, but systemd is in use (missing libsystemd-login pkg-config?)])
-+        AC_MSG_ERROR([ConsoleKit autoconfigured, but systemd is in use (missing libsystemd pkg-config?)])
-       ])
-     ])
-   ])
--- 
-1.8.5.3
-
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.112.bb b/meta-oe/recipes-extended/polkit/polkit_0.112.bb
deleted file mode 100644
index f20e1a4..0000000
--- a/meta-oe/recipes-extended/polkit/polkit_0.112.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-SUMMARY = "PolicyKit Authorization Framework"
-DESCRIPTION = "The polkit package is an application-level toolkit for defining and handling the policy that allows unprivileged processes to speak to privileged processes."
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/polkit"
-LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
-                    file://src/polkit/polkit.h;beginline=1;endline=20;md5=0a8630b0133176d0504c87a0ded39db4"
-
-DEPENDS = "expat glib-2.0 intltool-native gobject-introspection-stub mozjs"
-
-inherit autotools gtk-doc pkgconfig useradd systemd
-
-PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
-                 ${@base_contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)}"
-
-PACKAGECONFIG[pam] = "--with-authfw=pam,--with-authfw=shadow,libpam,libpam"
-PACKAGECONFIG[systemd] = "--enable-libsystemd-login=yes --with-systemdsystemunitdir=${systemd_unitdir}/system/,--enable-libsystemd-login=no --with-systemdsystemunitdir=,systemd"
-# there is no --enable/--disable option for consolekit and it's not picked by shlibs, so add it to RDEPENDS
-PACKAGECONFIG[consolekit] = ",,,consolekit"
-
-PAM_SRC_URI = "file://polkit-1_pam.patch"
-SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
-           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
-           file://0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch \
-           file://0001-do-not-hardcoded-libdir.patch \
-"
-
-SRC_URI[md5sum] = "b0f2fa00a55f47c6a5d88e9b73f80127"
-SRC_URI[sha256sum] = "d695f43cba4748a822fbe864dd32c4887c5da1c71694a47693ace5e88fcf6af6"
-
-EXTRA_OECONF = "--with-os-type=moblin --disable-man-pages --disable-introspection"
-
-PACKAGES =+ "${PN}-examples"
-
-FILES_${PN} += " \
-    ${libdir}/${BPN}-1 \
-    ${datadir}/dbus-1 \
-    ${datadir}/${BPN}-1 \
-"
-FILES_${PN}-dbg += "${libdir}/${BPN}-1/.debug"
-
-FILES_${PN}-examples = "${bindir}/*example*"
-
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/${BPN}-1 polkitd"
-
-SYSTEMD_SERVICE_${PN} = "${BPN}.service"
-SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.113.bb b/meta-oe/recipes-extended/polkit/polkit_0.113.bb
new file mode 100644
index 0000000..29e8896
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit_0.113.bb
@@ -0,0 +1,45 @@
+SUMMARY = "PolicyKit Authorization Framework"
+DESCRIPTION = "The polkit package is an application-level toolkit for defining and handling the policy that allows unprivileged processes to speak to privileged processes."
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/polkit"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
+                    file://src/polkit/polkit.h;beginline=1;endline=20;md5=0a8630b0133176d0504c87a0ded39db4"
+
+DEPENDS = "expat glib-2.0 intltool-native gobject-introspection-stub mozjs"
+
+inherit autotools gtk-doc pkgconfig useradd systemd
+
+PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                 ${@base_contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)}"
+
+PACKAGECONFIG[pam] = "--with-authfw=pam,--with-authfw=shadow,libpam,libpam"
+PACKAGECONFIG[systemd] = "--enable-libsystemd-login=yes --with-systemdsystemunitdir=${systemd_unitdir}/system/,--enable-libsystemd-login=no --with-systemdsystemunitdir=,systemd"
+# there is no --enable/--disable option for consolekit and it's not picked by shlibs, so add it to RDEPENDS
+PACKAGECONFIG[consolekit] = ",,,consolekit"
+
+PAM_SRC_URI = "file://polkit-1_pam.patch"
+SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
+           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+           file://0001-do-not-hardcoded-libdir.patch \
+"
+SRC_URI[md5sum] = "4b77776c9e4f897dcfe03b2c34198edf"
+SRC_URI[sha256sum] = "e1c095093c654951f78f8618d427faf91cf62abdefed98de40ff65eca6413c81"
+
+EXTRA_OECONF = "--with-os-type=moblin --disable-man-pages --disable-introspection"
+
+PACKAGES =+ "${PN}-examples"
+
+FILES_${PN} += " \
+    ${libdir}/${BPN}-1 \
+    ${datadir}/dbus-1 \
+    ${datadir}/${BPN}-1 \
+"
+FILES_${PN}-dbg += "${libdir}/${BPN}-1/.debug"
+
+FILES_${PN}-examples = "${bindir}/*example*"
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/${BPN}-1 polkitd"
+
+SYSTEMD_SERVICE_${PN} = "${BPN}.service"
+SYSTEMD_AUTO_ENABLE = "disable"
-- 
1.8.4.2


