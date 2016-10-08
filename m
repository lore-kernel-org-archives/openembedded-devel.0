Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 358 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 08 Oct 2016 14:17:04 UTC
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id A99616074F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Oct 2016 14:17:04 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id BF866B825E5; Sat,  8 Oct 2016 16:11:02 +0200 (CEST)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Oct 2016 16:11:02 +0200
Message-Id: <1475935862-13831-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
Subject: [meta-qt5][PATCH] qt5: Use existing variables for paths of host tools
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
X-List-Received-Date: Sat, 08 Oct 2016 14:17:07 -0000

Makes it possible to install qmake into ${bindir} without setting
QT_DIR_NAME = "".

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 classes/qmake5_base.bbclass            | 2 +-
 recipes-qt/qt5/nativesdk-qtbase_git.bb | 2 +-
 recipes-qt/qt5/qt5-creator_3.5.1.bb    | 6 +++---
 recipes-qt/qt5/qtbase_git.bb           | 4 ++--
 recipes-qt/qt5/qtdeclarative_git.bb    | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index c2a8498..57fea0e 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -32,7 +32,7 @@ EXTRA_OEMAKE = " \
 
 OE_QMAKESPEC = "${QMAKE_MKSPEC_PATH_NATIVE}/mkspecs/${OE_QMAKE_PLATFORM_NATIVE}"
 OE_XQMAKESPEC = "${QMAKE_MKSPEC_PATH}/mkspecs/${OE_QMAKE_PLATFORM}"
-OE_QMAKE_QMAKE = "${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/qmake"
+OE_QMAKE_QMAKE = "${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qmake"
 OE_QMAKE_COMPILER = "${CC}"
 OE_QMAKE_CC = "${CC}"
 OE_QMAKE_CFLAGS = "${CFLAGS}"
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index ee65b07..0f79994 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -142,7 +142,7 @@ export OE_QMAKE_AR
 export OE_QMAKE_STRIP
 
 # another exception is that we need to run bin/qmake, because EffectivePaths are relative to qmake location
-OE_QMAKE_QMAKE_ORIG = "${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/qmake"
+OE_QMAKE_QMAKE_ORIG := "${OE_QMAKE_QMAKE}"
 OE_QMAKE_QMAKE = "bin/qmake"
 
 do_configure() {
diff --git a/recipes-qt/qt5/qt5-creator_3.5.1.bb b/recipes-qt/qt5/qt5-creator_3.5.1.bb
index 2d8cee9..f4ba858 100644
--- a/recipes-qt/qt5/qt5-creator_3.5.1.bb
+++ b/recipes-qt/qt5/qt5-creator_3.5.1.bb
@@ -32,8 +32,8 @@ EXTRA_QMAKEVARS_PRE += "IDE_LIBRARY_BASENAME=${baselib}${QT_DIR_NAME}"
 
 do_configure_append() {
     # Find native tools
-    sed -i 's:${STAGING_BINDIR}.*/lrelease:${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/lrelease:g' ${B}/share/qtcreator/translations/Makefile
-    sed -i 's:${STAGING_BINDIR}.*/qdoc:${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/qdoc:g' ${B}/Makefile
+    sed -i 's:${STAGING_BINDIR}.*/lrelease:${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/lrelease:g' ${B}/share/qtcreator/translations/Makefile
+    sed -i 's:${STAGING_BINDIR}.*/qdoc:${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qdoc:g' ${B}/Makefile
 
     # see qtbase-native.inc
     # sed -i 's:QT_INSTALL_DOCS=${docdir}:QT_INSTALL_DOCS=${STAGING_DATADIR_NATIVE}${QT_DIR_NAME}/doc:g' ${B}/Makefile
@@ -50,7 +50,7 @@ do_install() {
     # install desktop and ensure that qt-creator finds qmake
     install -d ${D}${datadir}/applications
     install -m 0644 ${WORKDIR}/qtcreator.desktop.in ${D}${datadir}/applications/qtcreator.desktop
-    sed -i 's:@QT5_QMAKE@:${bindir}${QT_DIR_NAME}:g' ${D}${datadir}/applications/qtcreator.desktop
+    sed -i 's:@QT5_QMAKE@:${OE_QMAKE_PATH_QT_BINS}:g' ${D}${datadir}/applications/qtcreator.desktop
 }
 
 FILES_${PN} += " \
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index e532cdd..bfe3af5 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -151,7 +151,7 @@ EOF
 QMAKE_MKSPEC_PATH = "${B}"
 
 # another exception is that we need to run bin/qmake, because EffectivePaths are relative to qmake location
-OE_QMAKE_QMAKE_ORIG = "${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/qmake"
+OE_QMAKE_QMAKE_ORIG := "${OE_QMAKE_QMAKE}"
 OE_QMAKE_QMAKE = "bin/qmake"
 
 # qtbase is exception, configure script is using our get(X)QEvalMakeConf and setBootstrapEvalVariable functions to read it from shell
@@ -206,7 +206,7 @@ do_install_append() {
     # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or directory"
     touch ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/oe-device-extra.pri
 
-    install -m 0755 ${B}/bin/qmake-target ${D}/${bindir}${QT_DIR_NAME}/qmake
+    install -m 0755 ${B}/bin/qmake-target ${D}${OE_QMAKE_PATH_QT_BINS}/qmake
 
     ### Fix up the binaries to the right location
     ### TODO: FIX
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index aabadc0..497735a 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -19,7 +19,7 @@ SRC_URI += " \
     file://0003-Workaround-crashes-in-QtQml-code-related-to-dead-sto.patch \
 "
 
-EXTRA_OEMAKE += "QMAKE_SYNCQT=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/syncqt"
+EXTRA_OEMAKE += "QMAKE_SYNCQT=${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/syncqt"
 
 PACKAGECONFIG ??= "qtxmlpatterns"
 PACKAGECONFIG[qtxmlpatterns] = ",,qtxmlpatterns"
@@ -30,7 +30,7 @@ do_configure_prepend() {
     sed -e 's/^\(!qtHaveModule(xmlpatterns)\)/!OE_QTXMLPATTERNS_ENABLED|\1/' -i ${S}/tests/auto/quick/quick.pro
 
     #set the path for syncqt properly
-    echo "QT_TOOL.syncqt.binary = \"${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/syncqt\"" > ${B}/.qmake.cache
+    echo "QT_TOOL.syncqt.binary = \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/syncqt\"" > ${B}/.qmake.cache
 }
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
-- 
2.7.4


