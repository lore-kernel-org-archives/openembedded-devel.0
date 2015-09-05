Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id CF8887705A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Sep 2015 00:29:00 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so25378741igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Sep 2015 17:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/p3chMP8+/DhVuSklZUbJElfGqeOIbjAyLHm67zQ1Io=;
	b=fd/bxNSmn+rh84TYAqgluIwAlqsfK7+k3UOSFiCCPzLTBH1c7F5QwdQ+ytu7s9GFCl
	mxXQtAGgaIeiETjZUYCqq34ObH3sCOEwJjfOx2/zfCKfLfrMutDlAI4GZKkzr+IzqMKA
	+LtD7WNZKPB9Nm4il0n9usOfb1+EExQ65xnLsvrl6RetB42mtY65JlMD3c9LmMKlXm8A
	b6Ms0odMpO8OtDVt0/dHjaEXBS4wPQrtRfCiWU8pnLM8skvXjjgCPlsQzDVGtd2aUgKb
	PF9wPqQA1qXlGjeG5QX/v29NotNSHIA4VzHV7AZv1Z2URoljpcXfFd9YiIVXtupiwa6Z
	8uxg==
X-Received: by 10.50.6.50 with SMTP id x18mr12267732igx.12.1441412940927;
	Fri, 04 Sep 2015 17:29:00 -0700 (PDT)
Received: from localhost.localdomain (s206-116-3-180.bc.hsia.telus.net.
	[206.116.3.180]) by smtp.gmail.com with ESMTPSA id
	c64sm2541968ioc.13.2015.09.04.17.29.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Sep 2015 17:29:00 -0700 (PDT)
From: Adam YH Lee <adam.yh.lee@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Sep 2015 17:28:30 -0700
Message-Id: <1441412911-29933-2-git-send-email-adam.yh.lee@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1441412911-29933-1-git-send-email-adam.yh.lee@gmail.com>
References: <1441412911-29933-1-git-send-email-adam.yh.lee@gmail.com>
Subject: [meta-qt5 1/2] Remove double slash when QT_DIR_NAME is empty
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
X-List-Received-Date: Sat, 05 Sep 2015 00:29:02 -0000

When `QT_DIR_NAME` is defined as an empty string (default is "qt5"),
package.bbclass will throw lots of QA warnings because now the paths contain
double slashes ("//").

We can address these warnings by explicitly defining a slash in the
variable itself.

Signed-off-by: Adam YH Lee <adam.yh.lee@gmail.com>
---
 classes/populate_sdk_qt5.bbclass              |  2 +-
 classes/qmake5_base.bbclass                   |  6 ++---
 classes/qmake5_paths.bbclass                  | 34 +++++++++++++--------------
 recipes-qt/maliit/maliit-framework-qt5_git.bb |  4 ++--
 recipes-qt/qt5/nativesdk-qtbase_git.bb        |  8 +++----
 recipes-qt/qt5/qt5-creator_3.3.1.bb           | 20 ++++++++--------
 recipes-qt/qt5/qtbase_git.bb                  |  4 ++--
 recipes-qt/qt5/qttools_git.bb                 |  4 ++--
 8 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/classes/populate_sdk_qt5.bbclass b/classes/populate_sdk_qt5.bbclass
index 79df489..8ebab9b 100644
--- a/classes/populate_sdk_qt5.bbclass
+++ b/classes/populate_sdk_qt5.bbclass
@@ -9,7 +9,7 @@ inherit qmake5_paths
 create_sdk_files_prepend () {
     # make a symbolic link to mkspecs for compatibility with QTCreator
     (cd ${SDK_OUTPUT}/${SDKPATHNATIVE}; \
-         ln -sf ${SDKTARGETSYSROOT}${libdir}/${QT_DIR_NAME}/mkspecs mkspecs;)
+         ln -sf ${SDKTARGETSYSROOT}${libdir}${QT_DIR_NAME}/mkspecs mkspecs;)
 
     # Generate a qt.conf file to be deployed with the SDK
     qtconf=${SDK_OUTPUT}/${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/qt.conf
diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index 44575c4..841f413 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -1,6 +1,6 @@
 # This is useful for target recipes to reference native mkspecs
-QMAKE_MKSPEC_PATH_NATIVE = "${STAGING_LIBDIR_NATIVE}/${QT_DIR_NAME}"
-QMAKE_MKSPEC_PATH_TARGET = "${STAGING_LIBDIR}/${QT_DIR_NAME}"
+QMAKE_MKSPEC_PATH_NATIVE = "${STAGING_LIBDIR_NATIVE}${QT_DIR_NAME}"
+QMAKE_MKSPEC_PATH_TARGET = "${STAGING_LIBDIR}${QT_DIR_NAME}"
 
 QMAKE_MKSPEC_PATH = "${QMAKE_MKSPEC_PATH_TARGET}"
 QMAKE_MKSPEC_PATH_class-native = "${QMAKE_MKSPEC_PATH_NATIVE}"
@@ -40,7 +40,7 @@ EXTRA_OEMAKE = " \
 
 OE_QMAKESPEC = "${QMAKE_MKSPEC_PATH_NATIVE}/mkspecs/${OE_QMAKE_PLATFORM_NATIVE}"
 OE_XQMAKESPEC = "${QMAKE_MKSPEC_PATH}/mkspecs/${OE_QMAKE_PLATFORM}"
-OE_QMAKE_QMAKE = "${STAGING_BINDIR_NATIVE}/${QT_DIR_NAME}/qmake"
+OE_QMAKE_QMAKE = "${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/qmake"
 OE_QMAKE_COMPILER = "${CC}"
 OE_QMAKE_CC = "${CC}"
 OE_QMAKE_CFLAGS = "${CFLAGS}"
diff --git a/classes/qmake5_paths.bbclass b/classes/qmake5_paths.bbclass
index 8f91e93..45d3fbe 100644
--- a/classes/qmake5_paths.bbclass
+++ b/classes/qmake5_paths.bbclass
@@ -2,40 +2,40 @@
 # about conflicts with qt4, then you can add qmake5_paths.bbclass
 # to your distro layer and flatten all QT_DIR_NAME directories
 
-QT_DIR_NAME ?= "qt5"
+QT_DIR_NAME ?= "/qt5"
 
 OE_QMAKE_PATH_PREFIX = "${prefix}"
-OE_QMAKE_PATH_HEADERS = "${includedir}/${QT_DIR_NAME}"
+OE_QMAKE_PATH_HEADERS = "${includedir}${QT_DIR_NAME}"
 OE_QMAKE_PATH_LIBS = "${libdir}"
 OE_QMAKE_PATH_ARCHDATA = "${libdir}"
 OE_QMAKE_PATH_DATA = "${datadir}"
 OE_QMAKE_PATH_BINS = "${bindir}"
-OE_QMAKE_PATH_LIBEXECS = "${libdir}/${QT_DIR_NAME}/libexec"
-OE_QMAKE_PATH_PLUGINS = "${libdir}/${QT_DIR_NAME}/plugins"
-OE_QMAKE_PATH_IMPORTS = "${libdir}/${QT_DIR_NAME}/imports"
-OE_QMAKE_PATH_QML = "${libdir}/${QT_DIR_NAME}/qml"
+OE_QMAKE_PATH_LIBEXECS = "${libdir}${QT_DIR_NAME}/libexec"
+OE_QMAKE_PATH_PLUGINS = "${libdir}${QT_DIR_NAME}/plugins"
+OE_QMAKE_PATH_IMPORTS = "${libdir}${QT_DIR_NAME}/imports"
+OE_QMAKE_PATH_QML = "${libdir}${QT_DIR_NAME}/qml"
 OE_QMAKE_PATH_TRANSLATIONS = "${datadir}/translations"
 OE_QMAKE_PATH_DOCS = "${docdir}"
 OE_QMAKE_PATH_SETTINGS = "${sysconfdir}"
 OE_QMAKE_PATH_EXAMPLES = "${datadir}/examples"
 OE_QMAKE_PATH_TESTS = "${datadir}/tests"
 OE_QMAKE_PATH_HOST_PREFIX = ""
-OE_QMAKE_PATH_HOST_BINS = "${bindir}/${QT_DIR_NAME}"
+OE_QMAKE_PATH_HOST_BINS = "${bindir}${QT_DIR_NAME}"
 OE_QMAKE_PATH_HOST_DATA = "${QMAKE_MKSPEC_PATH_TARGET}"
 OE_QMAKE_PATH_HOST_LIBS = "${STAGING_LIBDIR}"
-OE_QMAKE_PATH_EXTERNAL_HOST_BINS = "${STAGING_BINDIR_NATIVE}/${QT_DIR_NAME}"
+OE_QMAKE_PATH_EXTERNAL_HOST_BINS = "${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}"
 
 # for qt5 components we're using QT_DIR_NAME subdirectory in more
 # variables, because we don't want conflicts with qt4
 # This block is usefull for components which install their
 # own files without QT_DIR_NAME but need to reference paths e.g. 
 # with QT headers
-OE_QMAKE_PATH_QT_HEADERS = "${includedir}/${QT_DIR_NAME}"
-OE_QMAKE_PATH_QT_ARCHDATA = "${libdir}/${QT_DIR_NAME}"
-OE_QMAKE_PATH_QT_DATA = "${datadir}/${QT_DIR_NAME}"
-OE_QMAKE_PATH_QT_BINS = "${bindir}/${QT_DIR_NAME}"
-OE_QMAKE_PATH_QT_TRANSLATIONS = "${datadir}/${QT_DIR_NAME}/translations"
-OE_QMAKE_PATH_QT_DOCS = "${docdir}/${QT_DIR_NAME}"
-OE_QMAKE_PATH_QT_SETTINGS = "${sysconfdir}/${QT_DIR_NAME}"
-OE_QMAKE_PATH_QT_EXAMPLES = "${datadir}/${QT_DIR_NAME}/examples"
-OE_QMAKE_PATH_QT_TESTS = "${datadir}/${QT_DIR_NAME}/tests"
+OE_QMAKE_PATH_QT_HEADERS = "${includedir}${QT_DIR_NAME}"
+OE_QMAKE_PATH_QT_ARCHDATA = "${libdir}${QT_DIR_NAME}"
+OE_QMAKE_PATH_QT_DATA = "${datadir}${QT_DIR_NAME}"
+OE_QMAKE_PATH_QT_BINS = "${bindir}${QT_DIR_NAME}"
+OE_QMAKE_PATH_QT_TRANSLATIONS = "${datadir}${QT_DIR_NAME}/translations"
+OE_QMAKE_PATH_QT_DOCS = "${docdir}${QT_DIR_NAME}"
+OE_QMAKE_PATH_QT_SETTINGS = "${sysconfdir}${QT_DIR_NAME}"
+OE_QMAKE_PATH_QT_EXAMPLES = "${datadir}${QT_DIR_NAME}/examples"
+OE_QMAKE_PATH_QT_TESTS = "${datadir}${QT_DIR_NAME}/tests"
diff --git a/recipes-qt/maliit/maliit-framework-qt5_git.bb b/recipes-qt/maliit/maliit-framework-qt5_git.bb
index 490670d..83da8ca 100644
--- a/recipes-qt/maliit/maliit-framework-qt5_git.bb
+++ b/recipes-qt/maliit/maliit-framework-qt5_git.bb
@@ -63,8 +63,8 @@ EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
 
 do_install_append() {
     #Fix absolute paths
-    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${libdir}/${QT_DIR_NAME}/mkspecs/features/maliit-framework.prf
-    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${libdir}/${QT_DIR_NAME}/mkspecs/features/maliit-plugins.prf
+    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${libdir}${QT_DIR_NAME}/mkspecs/features/maliit-framework.prf
+    sed -i -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ${D}/${libdir}${QT_DIR_NAME}/mkspecs/features/maliit-plugins.prf
 
     install -d ${D}${datadir}/applications
     install -m 644 ${WORKDIR}/maliit-server.desktop ${D}${datadir}/applications
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index ce5e97f..600aeef 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -91,7 +91,7 @@ QT_CONFIG_FLAGS += " \
 "
 
 # qtbase is exception, as these are used as install path for sysroots
-OE_QMAKE_PATH_HOST_DATA = "${libdir}/${QT_DIR_NAME}"
+OE_QMAKE_PATH_HOST_DATA = "${libdir}${QT_DIR_NAME}"
 OE_QMAKE_PATH_HOST_LIBS = "${libdir}"
 
 do_generate_qt_config_file() {
@@ -145,7 +145,7 @@ export OE_QMAKE_AR
 export OE_QMAKE_STRIP
 
 # another exception is that we need to run bin/qmake, because EffectivePaths are relative to qmake location
-OE_QMAKE_QMAKE_ORIG = "${STAGING_BINDIR_NATIVE}/${QT_DIR_NAME}/qmake"
+OE_QMAKE_QMAKE_ORIG = "${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/qmake"
 OE_QMAKE_QMAKE = "bin/qmake"
 
 do_configure() {
@@ -270,9 +270,9 @@ do_generate_qt_environment_file() {
     echo 'export OE_QMAKE_RCC=${OE_QMAKE_PATH_HOST_BINS}/rcc' >> $script
     echo 'export OE_QMAKE_QDBUSCPP2XML=${OE_QMAKE_PATH_HOST_BINS}/qdbuscpp2xml' >> $script
     echo 'export OE_QMAKE_QDBUSXML2CPP=${OE_QMAKE_PATH_HOST_BINS}/qdbusxml2cpp' >> $script
-    echo 'export OE_QMAKE_QT_CONFIG=`qmake -query QT_INSTALL_LIBS`/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
+    echo 'export OE_QMAKE_QT_CONFIG=`qmake -query QT_INSTALL_LIBS`${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
     echo 'export OE_QMAKE_PATH_HOST_BINS=${OE_QMAKE_PATH_HOST_BINS}' >> $script
-    echo 'export QMAKESPEC=`qmake -query QT_INSTALL_LIBS`/${QT_DIR_NAME}/mkspecs/linux-oe-g++' >> $script
+    echo 'export QMAKESPEC=`qmake -query QT_INSTALL_LIBS`${QT_DIR_NAME}/mkspecs/linux-oe-g++' >> $script
 
     # Use relocable sysroot
     sed -i -e 's:${SDKPATHNATIVE}:$OECORE_NATIVE_SYSROOT:g' $script
diff --git a/recipes-qt/qt5/qt5-creator_3.3.1.bb b/recipes-qt/qt5/qt5-creator_3.3.1.bb
index 8f993ca..eda0e4e 100644
--- a/recipes-qt/qt5/qt5-creator_3.3.1.bb
+++ b/recipes-qt/qt5/qt5-creator_3.3.1.bb
@@ -28,7 +28,7 @@ SRC_URI[sha256sum] = "afefb73a05cdc36cdfb8a760c2b39eb6c366a22ef47c7d365d446092dd
 
 S = "${WORKDIR}/qt-creator-opensource-src-${PV}"
 
-EXTRA_QMAKEVARS_PRE += "IDE_LIBRARY_BASENAME=${baselib}/${QT_DIR_NAME}"
+EXTRA_QMAKEVARS_PRE += "IDE_LIBRARY_BASENAME=${baselib}${QT_DIR_NAME}"
 
 do_configure_prepend() {
     # causes gcc infinite loop with 4.9.x for arm targets similar to
@@ -38,11 +38,11 @@ do_configure_prepend() {
 
 do_configure_append() {
     # Find native tools
-    sed -i 's:${STAGING_BINDIR}.*/lrelease:${STAGING_BINDIR_NATIVE}/${QT_DIR_NAME}/lrelease:g' ${B}/share/qtcreator/translations/Makefile
-    sed -i 's:${STAGING_BINDIR}.*/qdoc:${STAGING_BINDIR_NATIVE}/${QT_DIR_NAME}/qdoc:g' ${B}/Makefile
+    sed -i 's:${STAGING_BINDIR}.*/lrelease:${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/lrelease:g' ${B}/share/qtcreator/translations/Makefile
+    sed -i 's:${STAGING_BINDIR}.*/qdoc:${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/qdoc:g' ${B}/Makefile
 
     # see qtbase-native.inc
-    # sed -i 's:QT_INSTALL_DOCS=${docdir}:QT_INSTALL_DOCS=${STAGING_DATADIR_NATIVE}/${QT_DIR_NAME}/doc:g' ${B}/Makefile
+    # sed -i 's:QT_INSTALL_DOCS=${docdir}:QT_INSTALL_DOCS=${STAGING_DATADIR_NATIVE}${QT_DIR_NAME}/doc:g' ${B}/Makefile
 }
 
 do_compile_append() {
@@ -56,22 +56,22 @@ do_install() {
     # install desktop and ensure that qt-creator finds qmake
     install -d ${D}${datadir}/applications
     install -m 0644 ${WORKDIR}/qtcreator.desktop.in ${D}${datadir}/applications/qtcreator.desktop
-    sed -i 's:@QT5_QMAKE@:${bindir}/${QT_DIR_NAME}:g' ${D}${datadir}/applications/qtcreator.desktop
+    sed -i 's:@QT5_QMAKE@:${bindir}${QT_DIR_NAME}:g' ${D}${datadir}/applications/qtcreator.desktop
 }
 
 FILES_${PN} += " \
     ${datadir}/qtcreator \
     ${datadir}/icons \
-    ${libdir}/${QT_DIR_NAME}/qtcreator \
+    ${libdir}${QT_DIR_NAME}/qtcreator \
 "
 FILES_${PN}-dbg += " \
-    ${libdir}/${QT_DIR_NAME}/qtcreator/.debug \
-    ${libdir}/${QT_DIR_NAME}/qtcreator/plugins/.debug \
-    ${libdir}/${QT_DIR_NAME}/qtcreator/plugins/qbs/plugins/.debug \
+    ${libdir}${QT_DIR_NAME}/qtcreator/.debug \
+    ${libdir}${QT_DIR_NAME}/qtcreator/plugins/.debug \
+    ${libdir}${QT_DIR_NAME}/qtcreator/plugins/qbs/plugins/.debug \
 "
 
 FILES_${PN}-dev += " \
-    ${libdir}/${QT_DIR_NAME}/qtcreator/*${SOLIBSDEV} \
+    ${libdir}${QT_DIR_NAME}/qtcreator/*${SOLIBSDEV} \
 "
 
 RDEPENDS_${PN} += "perl"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index ec6ea17..284b7b9 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -154,7 +154,7 @@ EOF
 QMAKE_MKSPEC_PATH = "${B}"
 
 # another exception is that we need to run bin/qmake, because EffectivePaths are relative to qmake location
-OE_QMAKE_QMAKE_ORIG = "${STAGING_BINDIR_NATIVE}/${QT_DIR_NAME}/qmake"
+OE_QMAKE_QMAKE_ORIG = "${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/qmake"
 OE_QMAKE_QMAKE = "bin/qmake"
 
 # qtbase is exception, configure script is using our get(X)QEvalMakeConf and setBootstrapEvalVariable functions to read it from shell
@@ -219,7 +219,7 @@ do_compile_append() {
 }
 
 do_install_append() {
-    install -m 0755 ${B}/qmake/bin/qmake ${D}/${bindir}/${QT_DIR_NAME}
+    install -m 0755 ${B}/qmake/bin/qmake ${D}/${bindir}${QT_DIR_NAME}
 
     ### Fix up the binaries to the right location
     ### TODO: FIX
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index a4f63c7..2d8d6cc 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -16,8 +16,8 @@ SRC_URI += " \
     file://0003-add-noqtwebkit-configuration.patch \
 "
 
-FILES_${PN}-tools += "${datadir}/${QT_DIR_NAME}/phrasebooks"
-FILES_${PN}-examples = "${datadir}/${QT_DIR_NAME}/examples"
+FILES_${PN}-tools += "${datadir}${QT_DIR_NAME}/phrasebooks"
+FILES_${PN}-examples = "${datadir}${QT_DIR_NAME}/examples"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
-- 
2.1.4


