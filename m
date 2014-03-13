Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 505416EE45
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 14:18:36 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Mar 2014 15:18:33 +0100
Message-Id: <1394720313-23766-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH v2] libconnman-qt: update to 1.0.50+git80ac184
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
X-List-Received-Date: Thu, 13 Mar 2014 14:18:40 -0000

Allows to install versions for Qt4/X11 and Qt4/Embedded into
the same filesystem by overriding the target name.

This version also removes a superflous .pc file from ${libdir}.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
v2: Fix libconnman-qte linker error when building the qml plugin.
    There was no response about the patch from upstream yet.

 meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc |  7 ++--
 ...n.pro-fix-build-with-custom-target-suffix.patch | 42 ++++++++++++++++++++++
 .../recipes-qt/libconnman-qt/libconnman-qte_git.bb |  2 ++
 3 files changed, 47 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-qt/libconnman-qt/libconnman-qte/plugin.pro-fix-build-with-custom-target-suffix.patch

diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
index 77e70e8..3f91be2 100644
--- a/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
+++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qt.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/nemomobile/libconnman-qt"
 SECTION = "qt/lib"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://libconnman-qt/clockmodel.h;endline=8;md5=ea9f724050803f15d2d900ce3c5dac88"
-SRCREV = "ddbeaf72b4d3c49285b0513b28948edacfc40b51"
-PV = "1.0.46+git${SRCPV}"
+SRCREV = "80ac184d859ea90c026403f5a520644945a5081a"
+PV = "1.0.50+git${SRCPV}"
 
 SRC_URI = "git://github.com/nemomobile/libconnman-qt.git;branch=master"
 
@@ -12,7 +12,7 @@ S = "${WORKDIR}/git"
 
 inherit pkgconfig
 
-EXTRA_QMAKEVARS_PRE += "CONFIG+=notests"
+EXTRA_QMAKEVARS_PRE += "CONFIG+=notests TARGET_SUFFIX=${QT_DIR_NAME}"
 
 do_configure_prepend() {
     # Hack *.pro variables
@@ -37,7 +37,6 @@ FILES_${PN}-dev = " \
     ${libdir}/libconnman-qt*${SOLIBSDEV} \
     ${libdir}/libconnman-qt*.prl \
     ${libdir}/pkgconfig/connman-qt*.pc \
-    ${libdir}/connman-qt*.pc \
 "
 FILES_${PN}-plugin = " \
     ${PLUGINS_TARGET}/qmldir \
diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qte/plugin.pro-fix-build-with-custom-target-suffix.patch b/meta-oe/recipes-qt/libconnman-qt/libconnman-qte/plugin.pro-fix-build-with-custom-target-suffix.patch
new file mode 100644
index 0000000..3ff68c8
--- /dev/null
+++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qte/plugin.pro-fix-build-with-custom-target-suffix.patch
@@ -0,0 +1,42 @@
+Upstream-Status: Submitted [https://github.com/nemomobile/libconnman-qt/pull/105]
+
+From 48da520b971af69d22e691a0ef6ff1c3ce901f0d Mon Sep 17 00:00:00 2001
+From: Andreas Oberritter <obi@opendreambox.org>
+Date: Tue, 11 Mar 2014 21:55:37 +0100
+Subject: [PATCH] plugin.pro: fix build with custom target suffix
+
+This went unnoticed because of a previously installed libconnman-qt4.
+
+Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+---
+ plugin/plugin.pro | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/plugin/plugin.pro b/plugin/plugin.pro
+index c9534cf..9cdaa63 100644
+--- a/plugin/plugin.pro
++++ b/plugin/plugin.pro
+@@ -8,14 +8,18 @@ INCLUDEPATH += ../libconnman-qt
+ LIBS += -L../libconnman-qt
+ QT -= gui
+ 
++isEmpty(TARGET_SUFFIX) {
++    TARGET_SUFFIX = qt$$QT_MAJOR_VERSION
++}
++
++LIBS += -l$$qtLibraryTarget(connman-$$TARGET_SUFFIX)
++
+ equals(QT_MAJOR_VERSION, 4): {
+     QT += declarative
+-    LIBS += -lconnman-qt4
+ }
+ 
+ equals(QT_MAJOR_VERSION, 5): {
+     QT += qml
+-    LIBS += -lconnman-qt5
+     OTHER_FILES += plugin.json qmldirs
+ }
+ 
+-- 
+1.8.3.2
+
diff --git a/meta-oe/recipes-qt/libconnman-qt/libconnman-qte_git.bb b/meta-oe/recipes-qt/libconnman-qt/libconnman-qte_git.bb
index 7ee4bdb..9d44957 100644
--- a/meta-oe/recipes-qt/libconnman-qt/libconnman-qte_git.bb
+++ b/meta-oe/recipes-qt/libconnman-qt/libconnman-qte_git.bb
@@ -1,3 +1,5 @@
 inherit qt4e
 
 require libconnman-qt.inc
+
+SRC_URI += "file://plugin.pro-fix-build-with-custom-target-suffix.patch"
-- 
1.8.3.2


