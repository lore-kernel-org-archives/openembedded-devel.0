Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 472 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 09 Aug 2017 20:54:34 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 486EC600EB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 20:54:34 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 19C874CA26
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 22:46:42 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Aug 2017 22:46:13 +0200
Message-Id: <1502311573-14071-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-qt5][PATCH] gstreamer1.0-plugins-bad: add qt5 packageconfig
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Aug 2017 20:54:35 -0000

This adds a new command line switch to the configure script to make sure
moc, uic, rcc are searched in the right native sysroot path

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 ...dd-cmdline-argument-for-setting-host-path.patch | 34 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_%.bbappend  |  6 ++++
 2 files changed, 40 insertions(+)
 create mode 100644 recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-configure-Add-cmdline-argument-for-setting-host-path.patch
 create mode 100644 recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend

diff --git a/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-configure-Add-cmdline-argument-for-setting-host-path.patch b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-configure-Add-cmdline-argument-for-setting-host-path.patch
new file mode 100644
index 0000000..ba51945
--- /dev/null
+++ b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-configure-Add-cmdline-argument-for-setting-host-path.patch
@@ -0,0 +1,34 @@
+From 5c01d6effe44a8364c03194decfe82d1e4f2071e Mon Sep 17 00:00:00 2001
+From: Carlos Rafael Giani <dv@pseudoterminal.org>
+Date: Wed, 9 Aug 2017 22:15:31 +0200
+Subject: [PATCH] configure: Add cmdline argument for setting host path prefix
+
+Upstream-Status: Pending
+
+Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
+---
+ configure.ac | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 9c789d0..4a2c8b6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2963,6 +2963,14 @@ AG_GST_CHECK_FEATURE(QT, [Qt elements], qt, [
+   PKG_CHECK_MODULES(QT, Qt5Core Qt5Gui Qt5Qml Qt5Quick >= 5.4.0, [
+       QT_PATH=`$PKG_CONFIG --variable=exec_prefix Qt5Core`
+       QT_HOST_PATH=`$PKG_CONFIG --variable=host_bins Qt5Core`
++      AC_ARG_WITH([qt-target-path-prefix],
++        AS_HELP_STRING([--with-qt-target-path-prefix],[Qt target path prefix to use])
++      )
++      AC_ARG_WITH([qt-host-path-prefix],
++        AS_HELP_STRING([--with-qt-host-path-prefix],[Qt host path prefix to use]),
++        [AS_IF([test "x$with_qt_host_path_prefix" != "x"],
++               [QT_HOST_PATH="$with_qt_host_path_prefix/$QT_HOST_PATH"])]
++      )
+       AC_PATH_PROGS(MOC, [moc-qt5 moc], moc, ["${QT_HOST_PATH}" "${QT_PATH}/bin"])
+       AC_PATH_PROGS(RCC, [rcc-qt5 rcc], rcc, ["${QT_HOST_PATH}" "${QT_PATH}/bin"])
+       AC_PATH_PROGS(UIC, [uic-qt5 uic], uic, ["${QT_HOST_PATH}" "${QT_PATH}/bin"])
+-- 
+2.7.4
+
diff --git a/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend
new file mode 100644
index 0000000..8ac7ba1
--- /dev/null
+++ b/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_%.bbappend
@@ -0,0 +1,6 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://0001-configure-Add-cmdline-argument-for-setting-host-path.patch"
+
+# NOTE: the GStreamer Qt5 plugin needs OpenGL
+PACKAGECONFIG[qt5] = '--enable-qt --with-qt-host-path-prefix="${RECIPE_SYSROOT_NATIVE}",--disable-qt,qtbase qtdeclarative qtbase-native'
-- 
2.7.4


