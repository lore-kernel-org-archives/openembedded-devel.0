Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8D34173D97
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 19:17:00 +0000 (UTC)
Received: by wizk4 with SMTP id k4so157794445wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 12:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PXcHTi/MjF4zmNDXWeqGINWgwxVc8x8xULxH54eQt2U=;
	b=Bj5W8E6i6fLSf8X5Yhs2i4prOMdKgu7LLvSp8ijksGqXWv11zvw/TofM4nwwFuhdET
	4wqFJVp3H4v4k6fAJjXhONCGd88+XxpZLwwnl5gtgZHBdEHwm5wzIobl160E4DjD/flX
	6nmpzPabSSDHMOAi72qRiHnfwcpuI39zk5cBRTfcN7vwLkaSJMv70tdmu7Mo+/gxq2If
	A5nV8V79sb2oYelkNEXTWxD6a5yLuSkvd2SoS2gFe/Ksi2kEDR2uV3irQs9bCCr9Pkyk
	WPTjkHGi9GMyHfItUI0P6I0ivJTBuUcu9ysSHYvRkZhpmdtJBrqQ4Jm4ya/Cqbdg4INq
	TM8w==
X-Received: by 10.180.99.2 with SMTP id em2mr55854722wib.59.1432840620540;
	Thu, 28 May 2015 12:17:00 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id n6sm4341759wic.16.2015.05.28.12.16.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 May 2015 12:16:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 May 2015 21:17:18 +0200
Message-Id: <1432840638-26579-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.1
In-Reply-To: <20150528132002.GG2383@jama>
References: <20150528132002.GG2383@jama>
Subject: [WIP][meta-qt5][PATCHv2] qt5: merge .inc and _git.bb files
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
X-List-Received-Date: Thu, 28 May 2015 19:17:03 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase.inc      | 272 -------------------------------
 recipes-qt/qt5/nativesdk-qtbase_git.bb   | 258 ++++++++++++++++++++++++++++-
 recipes-qt/qt5/nativesdk-qttools.inc     |  34 ----
 recipes-qt/qt5/nativesdk-qttools_git.bb  |  48 +++++-
 recipes-qt/qt5/qt3d.inc                  |  16 --
 recipes-qt/qt5/qt3d_git.bb               |  18 +-
 recipes-qt/qt5/qt5-git.inc               |  10 +-
 recipes-qt/qt5/qt5.inc                   |   1 -
 recipes-qt/qt5/qtbase-native.inc         | 109 -------------
 recipes-qt/qt5/qtbase-native_git.bb      | 107 ++++++++++--
 recipes-qt/qt5/qtbase.inc                | 261 -----------------------------
 recipes-qt/qt5/qtbase_git.bb             | 255 ++++++++++++++++++++++++++++-
 recipes-qt/qt5/qtconnectivity.inc        |  15 --
 recipes-qt/qt5/qtconnectivity_git.bb     |  22 ++-
 recipes-qt/qt5/qtdeclarative.inc         |  20 ---
 recipes-qt/qt5/qtdeclarative_git.bb      |  28 +++-
 recipes-qt/qt5/qtenginio.inc             |   8 -
 recipes-qt/qt5/qtenginio_git.bb          |  11 +-
 recipes-qt/qt5/qtgraphicaleffects.inc    |   9 -
 recipes-qt/qt5/qtgraphicaleffects_git.bb |  17 +-
 recipes-qt/qt5/qtimageformats.inc        |  21 ---
 recipes-qt/qt5/qtimageformats_git.bb     |  28 +++-
 recipes-qt/qt5/qtlocation.inc            |  23 ---
 recipes-qt/qt5/qtlocation_git.bb         |  30 +++-
 recipes-qt/qt5/qtmultimedia.inc          |  27 ---
 recipes-qt/qt5/qtmultimedia_git.bb       |  35 +++-
 recipes-qt/qt5/qtquick1.inc              |   9 -
 recipes-qt/qt5/qtquick1_git.bb           |  17 +-
 recipes-qt/qt5/qtquickcontrols.inc       |   8 -
 recipes-qt/qt5/qtquickcontrols_git.bb    |  15 +-
 recipes-qt/qt5/qtscript.inc              |  17 --
 recipes-qt/qt5/qtscript_git.bb           |  26 ++-
 recipes-qt/qt5/qtsensors.inc             |   7 -
 recipes-qt/qt5/qtsensors_git.bb          |  15 +-
 recipes-qt/qt5/qtserialport.inc          |  15 --
 recipes-qt/qt5/qtserialport_git.bb       |  19 ++-
 recipes-qt/qt5/qtsvg.inc                 |   4 -
 recipes-qt/qt5/qtsvg_git.bb              |  13 +-
 recipes-qt/qt5/qtsystems.inc             |  23 ---
 recipes-qt/qt5/qtsystems_git.bb          |  26 ++-
 recipes-qt/qt5/qttools-native.inc        |  15 --
 recipes-qt/qt5/qttools-native_git.bb     |  29 +++-
 recipes-qt/qt5/qttools.inc               |  16 --
 recipes-qt/qt5/qttools_git.bb            |  30 +++-
 recipes-qt/qt5/qttranslations.inc        |  91 -----------
 recipes-qt/qt5/qttranslations_git.bb     |  94 ++++++++++-
 recipes-qt/qt5/qtwayland-native.inc      |  24 ---
 recipes-qt/qt5/qtwayland-native_git.bb   |  27 ++-
 recipes-qt/qt5/qtwayland.inc             |  31 ----
 recipes-qt/qt5/qtwayland_git.bb          |  36 +++-
 recipes-qt/qt5/qtwebchannel.inc          |  11 --
 recipes-qt/qt5/qtwebchannel_git.bb       |  14 +-
 recipes-qt/qt5/qtwebengine.inc           |  69 --------
 recipes-qt/qt5/qtwebengine_git.bb        |  72 +++++++-
 recipes-qt/qt5/qtwebkit-examples.inc     |  17 --
 recipes-qt/qt5/qtwebkit-examples_git.bb  |  21 ++-
 recipes-qt/qt5/qtwebkit.inc              |  61 -------
 recipes-qt/qt5/qtwebkit_git.bb           |  64 +++++++-
 recipes-qt/qt5/qtwebsockets.inc          |  10 --
 recipes-qt/qt5/qtwebsockets_git.bb       |  12 +-
 recipes-qt/qt5/qtx11extras.inc           |   6 -
 recipes-qt/qt5/qtx11extras_git.bb        |  13 +-
 recipes-qt/qt5/qtxmlpatterns.inc         |   4 -
 recipes-qt/qt5/qtxmlpatterns_git.bb      |  13 +-
 64 files changed, 1342 insertions(+), 1335 deletions(-)
 delete mode 100644 recipes-qt/qt5/nativesdk-qtbase.inc
 delete mode 100644 recipes-qt/qt5/nativesdk-qttools.inc
 delete mode 100644 recipes-qt/qt5/qt3d.inc
 delete mode 100644 recipes-qt/qt5/qtbase-native.inc
 delete mode 100644 recipes-qt/qt5/qtbase.inc
 delete mode 100644 recipes-qt/qt5/qtconnectivity.inc
 delete mode 100644 recipes-qt/qt5/qtdeclarative.inc
 delete mode 100644 recipes-qt/qt5/qtenginio.inc
 delete mode 100644 recipes-qt/qt5/qtgraphicaleffects.inc
 delete mode 100644 recipes-qt/qt5/qtimageformats.inc
 delete mode 100644 recipes-qt/qt5/qtlocation.inc
 delete mode 100644 recipes-qt/qt5/qtmultimedia.inc
 delete mode 100644 recipes-qt/qt5/qtquick1.inc
 delete mode 100644 recipes-qt/qt5/qtquickcontrols.inc
 delete mode 100644 recipes-qt/qt5/qtscript.inc
 delete mode 100644 recipes-qt/qt5/qtsensors.inc
 delete mode 100644 recipes-qt/qt5/qtserialport.inc
 delete mode 100644 recipes-qt/qt5/qtsvg.inc
 delete mode 100644 recipes-qt/qt5/qtsystems.inc
 delete mode 100644 recipes-qt/qt5/qttools-native.inc
 delete mode 100644 recipes-qt/qt5/qttools.inc
 delete mode 100644 recipes-qt/qt5/qttranslations.inc
 delete mode 100644 recipes-qt/qt5/qtwayland-native.inc
 delete mode 100644 recipes-qt/qt5/qtwayland.inc
 delete mode 100644 recipes-qt/qt5/qtwebchannel.inc
 delete mode 100644 recipes-qt/qt5/qtwebengine.inc
 delete mode 100644 recipes-qt/qt5/qtwebkit-examples.inc
 delete mode 100644 recipes-qt/qt5/qtwebkit.inc
 delete mode 100644 recipes-qt/qt5/qtwebsockets.inc
 delete mode 100644 recipes-qt/qt5/qtx11extras.inc
 delete mode 100644 recipes-qt/qt5/qtxmlpatterns.inc

diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
deleted file mode 100644
index 35953bb..0000000
--- a/recipes-qt/qt5/nativesdk-qtbase.inc
+++ /dev/null
@@ -1,272 +0,0 @@
-DESCRIPTION = "SDK version of Qt/[X11|Mac|Embedded]"
-DEPENDS = "nativesdk-zlib nativesdk-dbus qtbase-native"
-SECTION = "libs"
-HOMEPAGE = "http://qt-project.org"
-
-QT_MODULE = "qtbase"
-
-require nativesdk-qt5.inc
-
-# it's already included with newer oe-core, but include it here for dylan
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/qtbase:"
-
-# common for qtbase-native, qtbase-nativesdk and qtbase
-SRC_URI += "\
-    file://0001-Add-linux-oe-g-platform.patch \
-    file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
-    file://0003-Add-external-hostbindir-option.patch \
-    file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
-    file://0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
-    file://0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
-    file://0007-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
-    file://0009-QOpenGLPaintDevice-sub-area-support.patch \
-    file://0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch \
-"
-
-# common for qtbase-native and nativesdk-qtbase
-SRC_URI += " \
-    file://0011-Always-build-uic.patch \
-    file://0012-Add-external-hostbindir-option-for-native-sdk.patch \
-"
-
-# specific for nativesdk-qtbase
-SRC_URI += " \
-    file://0013-configure-preserve-built-qmake-and-swap-with-native-.patch \
-"
-
-# CMake's toolchain configuration of nativesdk-qtbase
-SRC_URI += " \
-    file://OEQt5Toolchain.cmake \
-"
-
-PACKAGES = "${PN}-tools-dbg ${PN}-tools-dev ${PN}-tools-staticdev ${PN}-tools"
-
-PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
-
-FILES_${PN}-tools-dev = " \
-    ${includedir} \
-    ${FILES_SOLIBSDEV} ${libdir}/*.la \
-    ${OE_QMAKE_PATH_ARCHDATA}/mkspecs \
-"
-
-FILES_${PN}-tools-staticdev = " \
-    ${libdir}/libQt5Bootstrap.a \
-"
-
-FILES_${PN}-tools-dbg = " \
-    ${libdir}/.debug \
-    ${OE_QMAKE_PATH_BINS}/.debug \
-"
-
-FILES_${PN}-tools = " \
-    ${libdir}/lib*${SOLIBS} \
-    ${OE_QMAKE_PATH_BINS}/* \
-    ${SDKPATHNATIVE}/environment-setup.d \
-    ${datadir}/cmake \
-"
-
-# qttools binaries are placed in a subdir of bin in order to avoid
-# collisions with qt4. This would trigger debian.bbclass to rename the
-# package, since it doesn't detect binaries in subdirs. Explicitly
-# disable package auto-renaming for the tools-package.
-DEBIAN_NOAUTONAME_${PN}-tools = "1"
-
-QT_CONFIG_FLAGS += " \
-    -shared \
-    -silent \
-    -no-pch \
-    -no-rpath \
-    -pkg-config \
-    ${EXTRA_OECONF} \
-"
-
-# qtbase is exception, as these are used as install path for sysroots
-OE_QMAKE_PATH_HOST_DATA = "${libdir}/${QT_DIR_NAME}"
-OE_QMAKE_PATH_HOST_LIBS = "${libdir}"
-
-do_generate_qt_config_file() {
-    cat > ${QT_CONF_PATH} <<EOF
-[Paths]
-Prefix = ${OE_QMAKE_PATH_PREFIX}
-Headers = ${OE_QMAKE_PATH_HEADERS}
-Libraries = ${OE_QMAKE_PATH_LIBS}
-ArchData = ${OE_QMAKE_PATH_ARCHDATA}
-Data = ${OE_QMAKE_PATH_DATA}
-Binaries = ${OE_QMAKE_PATH_BINS}
-LibraryExecutables = ${OE_QMAKE_PATH_LIBEXECS}
-Plugins = ${OE_QMAKE_PATH_PLUGINS}
-Imports = ${OE_QMAKE_PATH_IMPORTS}
-Qml2Imports = ${OE_QMAKE_PATH_QML}
-Translations = ${OE_QMAKE_PATH_TRANSLATIONS}
-Documentation = ${OE_QMAKE_PATH_DOCS}
-Settings = ${OE_QMAKE_PATH_SETTINGS}
-Examples = ${OE_QMAKE_PATH_EXAMPLES}
-Tests = ${OE_QMAKE_PATH_TESTS}
-HostBinaries = ${OE_QMAKE_PATH_HOST_BINS}
-HostData = ${OE_QMAKE_PATH_HOST_DATA}
-HostLibraries = ${OE_QMAKE_PATH_HOST_LIBS}
-HostSpec = ${OE_QMAKESPEC}
-TartgetSpec = ${OE_XQMAKESPEC}
-ExternalHostBinaries = ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}
-Sysroot =
-EOF
-}
-
-do_generate_qt_config_file_append() {
-    cat >> ${QT_CONF_PATH} <<EOF
-
-[EffectivePaths]
-Prefix=..
-EOF
-}
-
-# qtbase is exception, we need to use mkspecs from ${S}
-QMAKE_MKSPEC_PATH = "${B}"
-
-# qtbase is exception, configure script is using our get(X)QEvalMakeConf and setBootstrapEvalVariable functions to read it from shell
-export OE_QMAKE_COMPILER
-export OE_QMAKE_CC
-export OE_QMAKE_CFLAGS
-export OE_QMAKE_CXX
-export OE_QMAKE_CXXFLAGS
-export OE_QMAKE_LINK
-export OE_QMAKE_LDFLAGS
-export OE_QMAKE_AR
-export OE_QMAKE_STRIP
-
-# another exception is that we need to run bin/qmake, because EffectivePaths are relative to qmake location
-OE_QMAKE_QMAKE_ORIG = "${STAGING_BINDIR_NATIVE}/${QT_DIR_NAME}/qmake"
-OE_QMAKE_QMAKE = "bin/qmake"
-
-do_configure() {
-    # we need symlink in path relative to source, because
-    # EffectivePaths:Prefix is relative to qmake location
-    # Also, configure expects qmake-native to swap with real one
-    if [ ! -e ${B}/bin/qmake-native ]; then
-        mkdir ${B}/bin
-        ln -sf ${OE_QMAKE_QMAKE_ORIG} ${B}/bin/qmake-native
-    fi
-
-    ${S}/configure -v \
-        -opensource -confirm-license \
-        -sysroot ${STAGING_DIR_NATIVE} \
-        -no-gcc-sysroot \
-        -system-zlib \
-        -no-libjpeg \
-        -no-libpng \
-        -no-gif \
-        -no-accessibility \
-        -no-cups \
-        -no-nis \
-        -no-gui \
-        -no-qml-debug \
-        -no-sql-mysql \
-        -no-sql-sqlite \
-        -no-opengl \
-        -no-openssl \
-        -no-xcb \
-        -verbose \
-        -release \
-        -prefix ${OE_QMAKE_PATH_PREFIX} \
-        -bindir ${OE_QMAKE_PATH_BINS} \
-        -libdir ${OE_QMAKE_PATH_LIBS} \
-        -datadir ${OE_QMAKE_PATH_DATA} \
-        -sysconfdir ${OE_QMAKE_PATH_SETTINGS} \
-        -docdir ${OE_QMAKE_PATH_DOCS} \
-        -headerdir ${OE_QMAKE_PATH_HEADERS} \
-        -archdatadir ${OE_QMAKE_PATH_ARCHDATA} \
-        -libexecdir ${OE_QMAKE_PATH_LIBEXECS} \
-        -plugindir ${OE_QMAKE_PATH_PLUGINS} \
-        -importdir ${OE_QMAKE_PATH_IMPORTS} \
-        -qmldir ${OE_QMAKE_PATH_QML} \
-        -translationdir ${OE_QMAKE_PATH_TRANSLATIONS} \
-        -testsdir ${OE_QMAKE_PATH_TESTS} \
-        -hostbindir ${OE_QMAKE_PATH_HOST_BINS} \
-        -hostdatadir ${OE_QMAKE_PATH_HOST_DATA} \
-        -external-hostbindir ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \
-        -no-glib \
-        -no-iconv \
-        -silent \
-        -nomake examples \
-        -nomake tests \
-        -nomake libs \
-        -no-compile-examples \
-        -no-rpath \
-        -platform ${OE_QMAKESPEC} \
-        -xplatform linux-oe-g++ \
-        ${QT_CONFIG_FLAGS}
-
-    bin/qmake ${OE_QMAKE_DEBUG_OUTPUT} ${S} -o Makefile || die "Configuring qt with qmake failed. EXTRA_OECONF was ${EXTRA_OECONF}"
-}
-
-# Set the EXTRA_QTLIB variable to e.g. Xml, in order to not remove libQt5Xml.so.*
-EXTRA_QTLIB ?= ""
-
-python __anonymous () {
-    templibs = ""
-    for e in d.getVar("EXTRA_QTLIB", True).split():
-        templibs = "%s -not -name 'libQt5%s.so*' -and" % (templibs, e)
-    d.setVar("QTLIBSPRESERVE", templibs)
-}
-
-do_install() {
-    # Fix install paths for all
-    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE},(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
-
-    oe_runmake install INSTALL_ROOT=${D}
-
-    # replace the native qmake installed above with nativesdk version
-    rm -rf ${D}${OE_QMAKE_PATH_HOST_BINS}/qmake
-    install -m 755 ${B}/bin/qmake-real ${D}${OE_QMAKE_PATH_HOST_BINS}/qmake
-
-    # for modules which are still using syncqt and call qtPrepareTool(QMAKE_SYNCQT, syncqt)
-    # e.g. qt3d, qtwayland
-    ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
-
-    # remove things unused in nativesdk, we need the headers, Qt5Core
-    # and Qt5Bootstrap.
-    rm -rf ${D}${datadir} \
-           ${D}/${OE_QMAKE_PATH_PLUGINS} \
-           ${D}${libdir}/cmake \
-           ${D}${libdir}/pkgconfig
-    find ${D}${libdir} -maxdepth 1 -name 'lib*' -and -not -type d -and \
-                                   -not -name 'libQt5Core.so*' -and \
-                                   ${QTLIBSPRESERVE} \
-                                   -not -name 'libQt5Bootstrap.a' \
-                                   -exec rm '{}' ';'
-
-    # Install CMake's toolchain configuration
-    mkdir -p ${D}${datadir}/cmake/OEToolchainConfig.cmake.d/
-    install -m 644 ${WORKDIR}/OEQt5Toolchain.cmake ${D}${datadir}/cmake/OEToolchainConfig.cmake.d/
-}
-
-do_generate_qt_environment_file() {
-    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d/
-    script=${D}${SDKPATHNATIVE}/environment-setup.d/qt5.sh
-
-    echo 'export PATH=${OE_QMAKE_PATH_HOST_BINS}:$PATH' > $script
-    echo 'export OE_QMAKE_CFLAGS="$CFLAGS"' >> $script
-    echo 'export OE_QMAKE_CXXFLAGS="$CXXFLAGS"' >> $script
-    echo 'export OE_QMAKE_LDFLAGS="$LDFLAGS"' >> $script
-    echo 'export OE_QMAKE_CC=$CC' >> $script
-    echo 'export OE_QMAKE_CXX=$CXX' >> $script
-    echo 'export OE_QMAKE_LINK=$CXX' >> $script
-    echo 'export OE_QMAKE_AR=$AR' >> $script
-    echo 'export QT_CONF_PATH=${OE_QMAKE_PATH_HOST_BINS}/qt.conf' >> $script
-    echo 'export OE_QMAKE_LIBDIR_QT=`qmake -query QT_INSTALL_LIBS`' >> $script
-    echo 'export OE_QMAKE_INCDIR_QT=`qmake -query QT_INSTALL_HEADERS`' >> $script
-    echo 'export OE_QMAKE_MOC=${OE_QMAKE_PATH_HOST_BINS}/moc' >> $script
-    echo 'export OE_QMAKE_UIC=${OE_QMAKE_PATH_HOST_BINS}/uic' >> $script
-    echo 'export OE_QMAKE_RCC=${OE_QMAKE_PATH_HOST_BINS}/rcc' >> $script
-    echo 'export OE_QMAKE_QDBUSCPP2XML=${OE_QMAKE_PATH_HOST_BINS}/qdbuscpp2xml' >> $script
-    echo 'export OE_QMAKE_QDBUSXML2CPP=${OE_QMAKE_PATH_HOST_BINS}/qdbusxml2cpp' >> $script
-    echo 'export OE_QMAKE_QT_CONFIG=`qmake -query QT_INSTALL_LIBS`/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
-    echo 'export OE_QMAKE_PATH_HOST_BINS=${OE_QMAKE_PATH_HOST_BINS}' >> $script
-    echo 'export QMAKESPEC=`qmake -query QT_INSTALL_LIBS`/${QT_DIR_NAME}/mkspecs/linux-oe-g++' >> $script
-
-    # Use relocable sysroot
-    sed -i -e 's:${SDKPATHNATIVE}:$OECORE_NATIVE_SYSROOT:g' $script
-}
-
-addtask generate_qt_environment_file after do_install before do_package
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 1b566c2..6506928 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -1,10 +1,24 @@
-require qt5-git.inc
-require ${PN}.inc
+DESCRIPTION = "SDK version of Qt/[X11|Mac|Embedded]"
+DEPENDS = "nativesdk-zlib nativesdk-dbus qtbase-native"
+SECTION = "libs"
+HOMEPAGE = "http://qt-project.org"
 
-SRC_URI = "\
-    ${QT_GIT}/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
+    file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
+QT_MODULE = "qtbase"
+
+require nativesdk-qt5.inc
+require qt5-git.inc
+
+# it's already included with newer oe-core, but include it here for dylan
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/qtbase:"
+
 # common for qtbase-native, qtbase-nativesdk and qtbase
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
@@ -35,9 +49,235 @@ SRC_URI += " \
     file://OEQt5Toolchain.cmake \
 "
 
-SRCREV = "f58e882b7594c59b6050d3c87562fcf836d10f60"
+PACKAGES = "${PN}-tools-dbg ${PN}-tools-dev ${PN}-tools-staticdev ${PN}-tools"
+
+PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
+
+FILES_${PN}-tools-dev = " \
+    ${includedir} \
+    ${FILES_SOLIBSDEV} ${libdir}/*.la \
+    ${OE_QMAKE_PATH_ARCHDATA}/mkspecs \
+"
+
+FILES_${PN}-tools-staticdev = " \
+    ${libdir}/libQt5Bootstrap.a \
+"
+
+FILES_${PN}-tools-dbg = " \
+    ${libdir}/.debug \
+    ${OE_QMAKE_PATH_BINS}/.debug \
+"
+
+FILES_${PN}-tools = " \
+    ${libdir}/lib*${SOLIBS} \
+    ${OE_QMAKE_PATH_BINS}/* \
+    ${SDKPATHNATIVE}/environment-setup.d \
+    ${datadir}/cmake \
+"
+
+# qttools binaries are placed in a subdir of bin in order to avoid
+# collisions with qt4. This would trigger debian.bbclass to rename the
+# package, since it doesn't detect binaries in subdirs. Explicitly
+# disable package auto-renaming for the tools-package.
+DEBIAN_NOAUTONAME_${PN}-tools = "1"
+
+QT_CONFIG_FLAGS += " \
+    -shared \
+    -silent \
+    -no-pch \
+    -no-rpath \
+    -pkg-config \
+    ${EXTRA_OECONF} \
+"
+
+# qtbase is exception, as these are used as install path for sysroots
+OE_QMAKE_PATH_HOST_DATA = "${libdir}/${QT_DIR_NAME}"
+OE_QMAKE_PATH_HOST_LIBS = "${libdir}"
+
+do_generate_qt_config_file() {
+    cat > ${QT_CONF_PATH} <<EOF
+[Paths]
+Prefix = ${OE_QMAKE_PATH_PREFIX}
+Headers = ${OE_QMAKE_PATH_HEADERS}
+Libraries = ${OE_QMAKE_PATH_LIBS}
+ArchData = ${OE_QMAKE_PATH_ARCHDATA}
+Data = ${OE_QMAKE_PATH_DATA}
+Binaries = ${OE_QMAKE_PATH_BINS}
+LibraryExecutables = ${OE_QMAKE_PATH_LIBEXECS}
+Plugins = ${OE_QMAKE_PATH_PLUGINS}
+Imports = ${OE_QMAKE_PATH_IMPORTS}
+Qml2Imports = ${OE_QMAKE_PATH_QML}
+Translations = ${OE_QMAKE_PATH_TRANSLATIONS}
+Documentation = ${OE_QMAKE_PATH_DOCS}
+Settings = ${OE_QMAKE_PATH_SETTINGS}
+Examples = ${OE_QMAKE_PATH_EXAMPLES}
+Tests = ${OE_QMAKE_PATH_TESTS}
+HostBinaries = ${OE_QMAKE_PATH_HOST_BINS}
+HostData = ${OE_QMAKE_PATH_HOST_DATA}
+HostLibraries = ${OE_QMAKE_PATH_HOST_LIBS}
+HostSpec = ${OE_QMAKESPEC}
+TartgetSpec = ${OE_XQMAKESPEC}
+ExternalHostBinaries = ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}
+Sysroot =
+EOF
+}
+
+do_generate_qt_config_file_append() {
+    cat >> ${QT_CONF_PATH} <<EOF
 
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
-                    file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+[EffectivePaths]
+Prefix=..
+EOF
+}
+
+# qtbase is exception, we need to use mkspecs from ${S}
+QMAKE_MKSPEC_PATH = "${B}"
+
+# qtbase is exception, configure script is using our get(X)QEvalMakeConf and setBootstrapEvalVariable functions to read it from shell
+export OE_QMAKE_COMPILER
+export OE_QMAKE_CC
+export OE_QMAKE_CFLAGS
+export OE_QMAKE_CXX
+export OE_QMAKE_CXXFLAGS
+export OE_QMAKE_LINK
+export OE_QMAKE_LDFLAGS
+export OE_QMAKE_AR
+export OE_QMAKE_STRIP
+
+# another exception is that we need to run bin/qmake, because EffectivePaths are relative to qmake location
+OE_QMAKE_QMAKE_ORIG = "${STAGING_BINDIR_NATIVE}/${QT_DIR_NAME}/qmake"
+OE_QMAKE_QMAKE = "bin/qmake"
+
+do_configure() {
+    # we need symlink in path relative to source, because
+    # EffectivePaths:Prefix is relative to qmake location
+    # Also, configure expects qmake-native to swap with real one
+    if [ ! -e ${B}/bin/qmake-native ]; then
+        mkdir ${B}/bin
+        ln -sf ${OE_QMAKE_QMAKE_ORIG} ${B}/bin/qmake-native
+    fi
+
+    ${S}/configure -v \
+        -opensource -confirm-license \
+        -sysroot ${STAGING_DIR_NATIVE} \
+        -no-gcc-sysroot \
+        -system-zlib \
+        -no-libjpeg \
+        -no-libpng \
+        -no-gif \
+        -no-accessibility \
+        -no-cups \
+        -no-nis \
+        -no-gui \
+        -no-qml-debug \
+        -no-sql-mysql \
+        -no-sql-sqlite \
+        -no-opengl \
+        -no-openssl \
+        -no-xcb \
+        -verbose \
+        -release \
+        -prefix ${OE_QMAKE_PATH_PREFIX} \
+        -bindir ${OE_QMAKE_PATH_BINS} \
+        -libdir ${OE_QMAKE_PATH_LIBS} \
+        -datadir ${OE_QMAKE_PATH_DATA} \
+        -sysconfdir ${OE_QMAKE_PATH_SETTINGS} \
+        -docdir ${OE_QMAKE_PATH_DOCS} \
+        -headerdir ${OE_QMAKE_PATH_HEADERS} \
+        -archdatadir ${OE_QMAKE_PATH_ARCHDATA} \
+        -libexecdir ${OE_QMAKE_PATH_LIBEXECS} \
+        -plugindir ${OE_QMAKE_PATH_PLUGINS} \
+        -importdir ${OE_QMAKE_PATH_IMPORTS} \
+        -qmldir ${OE_QMAKE_PATH_QML} \
+        -translationdir ${OE_QMAKE_PATH_TRANSLATIONS} \
+        -testsdir ${OE_QMAKE_PATH_TESTS} \
+        -hostbindir ${OE_QMAKE_PATH_HOST_BINS} \
+        -hostdatadir ${OE_QMAKE_PATH_HOST_DATA} \
+        -external-hostbindir ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \
+        -no-glib \
+        -no-iconv \
+        -silent \
+        -nomake examples \
+        -nomake tests \
+        -nomake libs \
+        -no-compile-examples \
+        -no-rpath \
+        -platform ${OE_QMAKESPEC} \
+        -xplatform linux-oe-g++ \
+        ${QT_CONFIG_FLAGS}
+
+    bin/qmake ${OE_QMAKE_DEBUG_OUTPUT} ${S} -o Makefile || die "Configuring qt with qmake failed. EXTRA_OECONF was ${EXTRA_OECONF}"
+}
+
+# Set the EXTRA_QTLIB variable to e.g. Xml, in order to not remove libQt5Xml.so.*
+EXTRA_QTLIB ?= ""
+
+python __anonymous () {
+    templibs = ""
+    for e in d.getVar("EXTRA_QTLIB", True).split():
+        templibs = "%s -not -name 'libQt5%s.so*' -and" % (templibs, e)
+    d.setVar("QTLIBSPRESERVE", templibs)
+}
+
+do_install() {
+    # Fix install paths for all
+    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE},(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
+
+    oe_runmake install INSTALL_ROOT=${D}
+
+    # replace the native qmake installed above with nativesdk version
+    rm -rf ${D}${OE_QMAKE_PATH_HOST_BINS}/qmake
+    install -m 755 ${B}/bin/qmake-real ${D}${OE_QMAKE_PATH_HOST_BINS}/qmake
+
+    # for modules which are still using syncqt and call qtPrepareTool(QMAKE_SYNCQT, syncqt)
+    # e.g. qt3d, qtwayland
+    ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
+
+    # remove things unused in nativesdk, we need the headers, Qt5Core
+    # and Qt5Bootstrap.
+    rm -rf ${D}${datadir} \
+           ${D}/${OE_QMAKE_PATH_PLUGINS} \
+           ${D}${libdir}/cmake \
+           ${D}${libdir}/pkgconfig
+    find ${D}${libdir} -maxdepth 1 -name 'lib*' -and -not -type d -and \
+                                   -not -name 'libQt5Core.so*' -and \
+                                   ${QTLIBSPRESERVE} \
+                                   -not -name 'libQt5Bootstrap.a' \
+                                   -exec rm '{}' ';'
+
+    # Install CMake's toolchain configuration
+    mkdir -p ${D}${datadir}/cmake/OEToolchainConfig.cmake.d/
+    install -m 644 ${WORKDIR}/OEQt5Toolchain.cmake ${D}${datadir}/cmake/OEToolchainConfig.cmake.d/
+}
+
+do_generate_qt_environment_file() {
+    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d/
+    script=${D}${SDKPATHNATIVE}/environment-setup.d/qt5.sh
+
+    echo 'export PATH=${OE_QMAKE_PATH_HOST_BINS}:$PATH' > $script
+    echo 'export OE_QMAKE_CFLAGS="$CFLAGS"' >> $script
+    echo 'export OE_QMAKE_CXXFLAGS="$CXXFLAGS"' >> $script
+    echo 'export OE_QMAKE_LDFLAGS="$LDFLAGS"' >> $script
+    echo 'export OE_QMAKE_CC=$CC' >> $script
+    echo 'export OE_QMAKE_CXX=$CXX' >> $script
+    echo 'export OE_QMAKE_LINK=$CXX' >> $script
+    echo 'export OE_QMAKE_AR=$AR' >> $script
+    echo 'export QT_CONF_PATH=${OE_QMAKE_PATH_HOST_BINS}/qt.conf' >> $script
+    echo 'export OE_QMAKE_LIBDIR_QT=`qmake -query QT_INSTALL_LIBS`' >> $script
+    echo 'export OE_QMAKE_INCDIR_QT=`qmake -query QT_INSTALL_HEADERS`' >> $script
+    echo 'export OE_QMAKE_MOC=${OE_QMAKE_PATH_HOST_BINS}/moc' >> $script
+    echo 'export OE_QMAKE_UIC=${OE_QMAKE_PATH_HOST_BINS}/uic' >> $script
+    echo 'export OE_QMAKE_RCC=${OE_QMAKE_PATH_HOST_BINS}/rcc' >> $script
+    echo 'export OE_QMAKE_QDBUSCPP2XML=${OE_QMAKE_PATH_HOST_BINS}/qdbuscpp2xml' >> $script
+    echo 'export OE_QMAKE_QDBUSXML2CPP=${OE_QMAKE_PATH_HOST_BINS}/qdbusxml2cpp' >> $script
+    echo 'export OE_QMAKE_QT_CONFIG=`qmake -query QT_INSTALL_LIBS`/${QT_DIR_NAME}/mkspecs/qconfig.pri' >> $script
+    echo 'export OE_QMAKE_PATH_HOST_BINS=${OE_QMAKE_PATH_HOST_BINS}' >> $script
+    echo 'export QMAKESPEC=`qmake -query QT_INSTALL_LIBS`/${QT_DIR_NAME}/mkspecs/linux-oe-g++' >> $script
+
+    # Use relocable sysroot
+    sed -i -e 's:${SDKPATHNATIVE}:$OECORE_NATIVE_SYSROOT:g' $script
+}
+
+addtask generate_qt_environment_file after do_install before do_package
+
+SRCREV = "f58e882b7594c59b6050d3c87562fcf836d10f60"
diff --git a/recipes-qt/qt5/nativesdk-qttools.inc b/recipes-qt/qt5/nativesdk-qttools.inc
deleted file mode 100644
index c67f9cd..0000000
--- a/recipes-qt/qt5/nativesdk-qttools.inc
+++ /dev/null
@@ -1,34 +0,0 @@
-DEPENDS = "nativesdk-qtbase qtbase-native"
-
-QT_MODULE = "qttools"
-
-require nativesdk-qt5.inc
-
-# it's already included with newer oe-core, but include it here for dylan
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/qttools:"
-
-SRC_URI += "file://0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch"
-
-PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
-
-FILES_${PN}-dbg = " \
-    ${OE_QMAKE_PATH_BINS}/.debug \
-"
-
-FILES_${PN} = " \
-    ${OE_QMAKE_PATH_BINS}/* \
-"
-
-do_configure() {
-    ${OE_QMAKE_QMAKE} ${OE_QMAKE_DEBUG_OUTPUT} -r ${S} CONFIG+=linguistonly
-}
-
-do_install() {
-    # Fix install paths for all
-    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_HOST},(INSTALL_ROOT),g"
-
-    oe_runmake install INSTALL_ROOT=${D}
-
-    # remove things unused in nativesdk
-    rm -rf ${D}${libdir}
-}
diff --git a/recipes-qt/qt5/nativesdk-qttools_git.bb b/recipes-qt/qt5/nativesdk-qttools_git.bb
index bbaafc5..7380a4e 100644
--- a/recipes-qt/qt5/nativesdk-qttools_git.bb
+++ b/recipes-qt/qt5/nativesdk-qttools_git.bb
@@ -1,9 +1,45 @@
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
+    file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+"
+
+QT_MODULE = "qttools"
+
+DEPENDS = "nativesdk-qtbase qtbase-native"
+
+require nativesdk-qt5.inc
 require qt5-git.inc
-require ${PN}.inc
 
-SRCREV = "7f5b11a4a6357d2969e5b24bfb25c47aeb3d99f5"
+# it's already included with newer oe-core, but include it here for dylan
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/qttools:"
+
+SRC_URI += "file://0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch"
+
+PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
+
+FILES_${PN}-dbg = " \
+    ${OE_QMAKE_PATH_BINS}/.debug \
+"
 
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
-                    file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+FILES_${PN} = " \
+    ${OE_QMAKE_PATH_BINS}/* \
+"
+
+do_configure() {
+    ${OE_QMAKE_QMAKE} ${OE_QMAKE_DEBUG_OUTPUT} -r ${S} CONFIG+=linguistonly
+}
+
+do_install() {
+    # Fix install paths for all
+    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_HOST},(INSTALL_ROOT),g"
+
+    oe_runmake install INSTALL_ROOT=${D}
+
+    # remove things unused in nativesdk
+    rm -rf ${D}${libdir}
+}
+
+SRCREV = "7f5b11a4a6357d2969e5b24bfb25c47aeb3d99f5"
diff --git a/recipes-qt/qt5/qt3d.inc b/recipes-qt/qt5/qt3d.inc
deleted file mode 100644
index 74c4cad..0000000
--- a/recipes-qt/qt5/qt3d.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-require qt5.inc
-
-DEPENDS += "qtdeclarative"
-
-LICENSE = "GFDL-1.3 & LGPL-2.1 & DIGIA-TPLA-2.4 | GPL-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.PREVIEW.COMMERCIAL;md5=9d94dadfab8b246782ffea02082ee13a \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-"
-
-FILES_${PN}-qmlplugins += " \
-    ${OE_QMAKE_PATH_QML}/*/*/*.bez \
-    ${OE_QMAKE_PATH_QML}/*/*/*.obj \
-"
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index c6f970e..3bebcb5 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -1,5 +1,21 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
+
+LICENSE = "GFDL-1.3 & LGPL-2.1 & DIGIA-TPLA-2.4 | GPL-3.0"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.PREVIEW.COMMERCIAL;md5=9d94dadfab8b246782ffea02082ee13a \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+"
+
+DEPENDS = "nativesdk-qtbase qtbase-native qtdeclarative"
+
+FILES_${PN}-qmlplugins += " \
+    ${OE_QMAKE_PATH_QML}/*/*/*.bez \
+    ${OE_QMAKE_PATH_QML}/*/*/*.obj \
+"
 
 QT_MODULE_BRANCH = "dev"
 
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index f25de9b..2e77d45 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -4,18 +4,10 @@
 QT_MODULE_BRANCH ?= "5.4"
 
 # each module needs to define valid SRCREV
-SRC_URI += " \
+SRC_URI = " \
     ${QT_GIT}/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
 "
 
 S = "${WORKDIR}/git"
 
 PV = "5.4.1+git${SRCPV}"
-
-DEFAULT_PREFERENCE = "-1"
-
-LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index 0d7269c..2fc5367 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -32,7 +32,6 @@ python __anonymous() {
             d.setVar("PACKAGE_ARCH", tarch)
 }
 
-
 # Regenerate header files when they are included in source tarball
 # Otherwise cmake files don't set PRIVATE_HEADERS correctly
 do_configure_prepend() {
diff --git a/recipes-qt/qt5/qtbase-native.inc b/recipes-qt/qt5/qtbase-native.inc
deleted file mode 100644
index 4af0c0a..0000000
--- a/recipes-qt/qt5/qtbase-native.inc
+++ /dev/null
@@ -1,109 +0,0 @@
-DESCRIPTION = "Native version of Qt/[X11|Mac|Embedded]"
-DEPENDS = "zlib-native dbus-native"
-SECTION = "libs"
-HOMEPAGE = "http://qt-project.org"
-
-QT_MODULE = "qtbase"
-
-require qt5-native.inc
-
-# common for qtbase-native, qtbase-nativesdk and qtbase
-SRC_URI += "\
-    file://0001-Add-linux-oe-g-platform.patch \
-    file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
-    file://0003-Add-external-hostbindir-option.patch \
-    file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
-    file://0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
-    file://0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
-    file://0007-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
-    file://0009-QOpenGLPaintDevice-sub-area-support.patch \
-    file://0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch \
-"
-
-# common for qtbase-native and nativesdk-qtbase
-SRC_URI += " \
-    file://0011-Always-build-uic.patch \
-    file://0012-Add-external-hostbindir-option-for-native-sdk.patch \
-"
-
-CLEANBROKEN = "1"
-
-QT_CONF_PATH = "${B}/qt.conf"
-
-do_generate_qt_config_file() {
-    :
-}
-
-EXTRA_OECONF = " \
-    -prefix ${prefix} \
-    -sysroot ${STAGING_DIR_NATIVE} \
-    -no-gcc-sysroot \
-    -system-zlib \
-    -no-libjpeg \
-    -no-libpng \
-    -no-gif \
-    -no-accessibility \
-    -no-cups \
-    -no-nis \
-    -no-gui \
-    -no-qml-debug \
-    -no-sql-mysql \
-    -no-sql-sqlite \
-    -no-opengl \
-    -no-openssl \
-    -no-xcb \
-    -no-icu \
-    -verbose \
-    -release \
-    -prefix ${OE_QMAKE_PATH_PREFIX} \
-    -bindir ${OE_QMAKE_PATH_BINS} \
-    -libdir ${OE_QMAKE_PATH_LIBS} \
-    -headerdir ${OE_QMAKE_PATH_HEADERS} \
-    -archdatadir ${OE_QMAKE_PATH_ARCHDATA} \
-    -datadir ${OE_QMAKE_PATH_DATA} \
-    -docdir ${OE_QMAKE_PATH_DOCS} \
-    -sysconfdir ${OE_QMAKE_PATH_SETTINGS} \
-    -no-glib \
-    -no-iconv \
-    -silent \
-    -nomake examples \
-    -nomake tests \
-    -no-rpath \
-    -platform linux-oe-g++ \
-"
-
-# qtbase is exception, configure script is using our get(X)QEvalMakeConf and setBootstrapEvalVariable functions to read it from shell
-export OE_QMAKE_COMPILER
-export OE_QMAKE_CC
-export OE_QMAKE_CFLAGS
-export OE_QMAKE_CXX
-export OE_QMAKE_CXXFLAGS
-export OE_QMAKE_LINK
-export OE_QMAKE_LDFLAGS
-export OE_QMAKE_AR
-export OE_QMAKE_STRIP
-
-do_configure_prepend() {
-    MAKEFLAGS="${PARALLEL_MAKE}" ${S}/configure -opensource -confirm-license ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
-    bin/qmake ${OE_QMAKE_DEBUG_OUTPUT} ${S} -o Makefile || die "Configuring qt with qmake failed. EXTRA_OECONF was ${EXTRA_OECONF}"
-}
-
-do_install() {
-    # Fix install paths for all
-    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE},(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
-
-    oe_runmake install INSTALL_ROOT=${D}
-
-    if [ -d ${D}${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE} ] ; then
-        echo "Some files are installed in wrong directory ${D}${STAGING_DIR_NATIVE}"
-        cp -ra ${D}${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE}/* ${D}${STAGING_DIR_NATIVE}
-        rm -rf ${D}${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE}
-        # remove empty dirs
-        TMP=`dirname ${D}/${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE}`
-        while test ${TMP} != ${D}${STAGING_DIR_NATIVE}; do
-            rmdir ${TMP}
-            TMP=`dirname ${TMP}`;
-        done
-    fi
-}
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 8ba9170..8163bd2 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -1,10 +1,20 @@
-require qt5-git.inc
-require ${PN}.inc
-
-SRC_URI = "\    
-    ${QT_GIT}/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
+DESCRIPTION = "Native version of Qt/[X11|Mac|Embedded]"
+DEPENDS = "zlib-native dbus-native"
+SECTION = "libs"
+HOMEPAGE = "http://qt-project.org"
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
+    file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
+QT_MODULE = "qtbase"
+
+require qt5-native.inc
+require qt5-git.inc
+
 # common for qtbase-native, qtbase-nativesdk and qtbase
 SRC_URI += "\
     file://0001-Add-linux-oe-g-platform.patch \
@@ -25,15 +35,90 @@ SRC_URI += " \
     file://0012-Add-external-hostbindir-option-for-native-sdk.patch \
 "
 
-do_install_append() {
+
+CLEANBROKEN = "1"
+
+QT_CONF_PATH = "${B}/qt.conf"
+
+do_generate_qt_config_file() {
+    :
+}
+
+EXTRA_OECONF = " \
+    -prefix ${prefix} \
+    -sysroot ${STAGING_DIR_NATIVE} \
+    -no-gcc-sysroot \
+    -system-zlib \
+    -no-libjpeg \
+    -no-libpng \
+    -no-gif \
+    -no-accessibility \
+    -no-cups \
+    -no-nis \
+    -no-gui \
+    -no-qml-debug \
+    -no-sql-mysql \
+    -no-sql-sqlite \
+    -no-opengl \
+    -no-openssl \
+    -no-xcb \
+    -no-icu \
+    -verbose \
+    -release \
+    -prefix ${OE_QMAKE_PATH_PREFIX} \
+    -bindir ${OE_QMAKE_PATH_BINS} \
+    -libdir ${OE_QMAKE_PATH_LIBS} \
+    -headerdir ${OE_QMAKE_PATH_HEADERS} \
+    -archdatadir ${OE_QMAKE_PATH_ARCHDATA} \
+    -datadir ${OE_QMAKE_PATH_DATA} \
+    -docdir ${OE_QMAKE_PATH_DOCS} \
+    -sysconfdir ${OE_QMAKE_PATH_SETTINGS} \
+    -no-glib \
+    -no-iconv \
+    -silent \
+    -nomake examples \
+    -nomake tests \
+    -no-rpath \
+    -platform linux-oe-g++ \
+"
+
+# qtbase is exception, configure script is using our get(X)QEvalMakeConf and setBootstrapEvalVariable functions to read it from shell
+export OE_QMAKE_COMPILER
+export OE_QMAKE_CC
+export OE_QMAKE_CFLAGS
+export OE_QMAKE_CXX
+export OE_QMAKE_CXXFLAGS
+export OE_QMAKE_LINK
+export OE_QMAKE_LDFLAGS
+export OE_QMAKE_AR
+export OE_QMAKE_STRIP
+
+do_configure_prepend() {
+    MAKEFLAGS="${PARALLEL_MAKE}" ${S}/configure -opensource -confirm-license ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
+    bin/qmake ${OE_QMAKE_DEBUG_OUTPUT} ${S} -o Makefile || die "Configuring qt with qmake failed. EXTRA_OECONF was ${EXTRA_OECONF}"
+}
+
+do_install() {
+    # Fix install paths for all
+    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE},(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
+
+    oe_runmake install INSTALL_ROOT=${D}
+
+    if [ -d ${D}${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE} ] ; then
+        echo "Some files are installed in wrong directory ${D}${STAGING_DIR_NATIVE}"
+        cp -ra ${D}${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE}/* ${D}${STAGING_DIR_NATIVE}
+        rm -rf ${D}${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE}
+        # remove empty dirs
+        TMP=`dirname ${D}/${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE}`
+        while test ${TMP} != ${D}${STAGING_DIR_NATIVE}; do
+            rmdir ${TMP}
+            TMP=`dirname ${TMP}`;
+        done
+    fi
+
     # for modules which are still using syncqt and call qtPrepareTool(QMAKE_SYNCQT, syncqt)
     # e.g. qt3d, qtwayland
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
 SRCREV = "f58e882b7594c59b6050d3c87562fcf836d10f60"
-
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
-                    file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
deleted file mode 100644
index d2654ef..0000000
--- a/recipes-qt/qt5/qtbase.inc
+++ /dev/null
@@ -1,261 +0,0 @@
-require qt5.inc
-
-# common for qtbase-native, qtbase-nativesdk and qtbase
-SRC_URI += "\
-    file://0001-Add-linux-oe-g-platform.patch \
-    file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
-    file://0003-Add-external-hostbindir-option.patch \
-    file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
-    file://0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
-    file://0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
-    file://0007-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
-    file://0009-QOpenGLPaintDevice-sub-area-support.patch \
-    file://0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch \
-"
-
-# specific for qtbase
-SRC_URI += "\
-    file://0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
-    file://0012-Set-paths-for-target-properly.patch \
-"
-
-DEPENDS += "qtbase-native"
-
-# LGPL-3.0 is used only in src/plugins/platforms/android/extract.cpp
-
-# for syncqt
-RDEPENDS_${PN}-tools += "perl"
-
-# separate some parts of PACKAGECONFIG which are often changed
-# be aware that you need to add icu to build qtwebkit, default
-# PACKAGECONFIG is kept rather minimal for people who don't need
-# stuff like webkit (and it's easier to add options than remove)
-
-PACKAGECONFIG_GL ?= "${@base_contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)}"
-PACKAGECONFIG_FB ?= "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
-PACKAGECONFIG_X11 ?= "${@base_contains('DISTRO_FEATURES', 'x11', 'xcb xvideo xsync xshape xrender xrandr xfixes xinput2 xinput xinerama xcursor gtkstyle xkb', '', d)}"
-PACKAGECONFIG_FONTS ?= ""
-PACKAGECONFIG_SYSTEM ?= "jpeg libpng zlib"
-PACKAGECONFIG_MULTIMEDIA ?= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
-PACKAGECONFIG_DISTRO ?= ""
-# Either release or debug, can be overridden in bbappends
-PACKAGECONFIG_RELEASE ?= "release"
-# This is in qt5.inc, because qtwebkit-examples are using it to enable ca-certificates dependency
-# PACKAGECONFIG_OPENSSL ?= "openssl"
-PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs"
-
-PACKAGECONFIG ?= " \
-    ${PACKAGECONFIG_RELEASE} \
-    ${PACKAGECONFIG_DEFAULT} \
-    ${PACKAGECONFIG_OPENSSL} \
-    ${PACKAGECONFIG_GL} \
-    ${PACKAGECONFIG_FB} \
-    ${PACKAGECONFIG_X11} \
-    ${PACKAGECONFIG_FONTS} \
-    ${PACKAGECONFIG_SYSTEM} \
-    ${PACKAGECONFIG_MULTIMEDIA} \
-    ${PACKAGECONFIG_DISTRO} \
-"
-
-PACKAGECONFIG[release] = "-release,-debug"
-PACKAGECONFIG[developer] = "-developer-build"
-PACKAGECONFIG[sm] = "-sm,-no-sm"
-PACKAGECONFIG[tests] = "-make tests,-nomake tests"
-PACKAGECONFIG[examples] = "-make examples -compile-examples,-nomake examples"
-PACKAGECONFIG[tools] = "-make tools,-nomake tools"
-# only for completeness, configure will add libs even if you try to explicitly remove it
-PACKAGECONFIG[libs] = "-make libs,-nomake libs"
-# accessibility is required to compile qtquickcontrols
-PACKAGECONFIG[accessibility] = "-accessibility,-no-accessibility"
-PACKAGECONFIG[glib] = "-glib,-no-glib,glib-2.0"
-# use either system freetype or bundled freetype, if you disable freetype completely
-# fontdatabases/basic/qbasicfontdatabase.cpp will fail to build and system freetype
-# works only together with fontconfig
-PACKAGECONFIG[freetype] = "-system-freetype,-freetype,freetype"
-PACKAGECONFIG[jpeg] = "-system-libjpeg,-no-libjpeg,jpeg"
-PACKAGECONFIG[libpng] = "-system-libpng,-no-libpng,libpng"
-PACKAGECONFIG[zlib] = "-system-zlib,-qt-zlib,zlib"
-PACKAGECONFIG[pcre] = "-system-pcre,-qt-pcre,pcre"
-PACKAGECONFIG[gl] = "-opengl desktop -no-eglfs,,virtual/libgl"
-PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl"
-PACKAGECONFIG[tslib] = "-tslib,-no-tslib,tslib"
-PACKAGECONFIG[cups] = "-cups,-no-cups,cups"
-PACKAGECONFIG[dbus] = "-dbus,-no-dbus,dbus"
-PACKAGECONFIG[xcb] = "-xcb -xcb-xlib -system-xcb,-no-xcb,libxcb xcb-util-wm xcb-util-image xcb-util-keysyms xcb-util-renderutil"
-PACKAGECONFIG[sql-ibase] = "-sql-ibase,-no-sql-ibase"
-PACKAGECONFIG[sql-mysql] = "-sql-mysql,-no-sql-mysql,mysql5"
-PACKAGECONFIG[sql-psql] = "-sql-psql,-no-sql-psql,postgresql"
-PACKAGECONFIG[sql-odbc] = "-sql-odbc,-no-sql-odbc"
-PACKAGECONFIG[sql-oci] = "-sql-oci,-no-sql-oci"
-PACKAGECONFIG[sql-tds] = "-sql-tds,-no-sql-tds"
-PACKAGECONFIG[sql-db2] = "-sql-db2,-no-sql-db2"
-PACKAGECONFIG[sql-sqlite2] = "-sql-sqlite2,-no-sql-sqlite2,sqlite"
-PACKAGECONFIG[sql-sqlite] = "-sql-sqlite,-no-sql-sqlite,sqlite3"
-PACKAGECONFIG[xcursor] = "-xcursor,-no-xcursor,libxcursor"
-PACKAGECONFIG[xinerama] = "-xinerama,-no-xinerama,libxinerama"
-PACKAGECONFIG[xinput] = "-xinput,-no-xinput"
-PACKAGECONFIG[xinput2] = "-xinput2,-no-xinput2,libxi"
-PACKAGECONFIG[xfixes] = "-xfixes,-no-xfixes,libxfixes"
-PACKAGECONFIG[xrandr] = "-xrandr,-no-xrandr,libxrandr"
-PACKAGECONFIG[xrender] = "-xrender,-no-xrender,libxrender"
-PACKAGECONFIG[xshape] = "-xshape,-no-xshape"
-PACKAGECONFIG[xsync] = "-xsync,-no-xsync"
-PACKAGECONFIG[xvideo] = "-xvideo,-no-xvideo"
-PACKAGECONFIG[openvg] = "-openvg,-no-openvg"
-PACKAGECONFIG[iconv] = "-iconv,-no-iconv,virtual/libiconv"
-PACKAGECONFIG[xkb] = "-xkb,-no-xkb -no-xkbcommon,libxkbcommon"
-PACKAGECONFIG[evdev] = "-evdev,-no-evdev"
-PACKAGECONFIG[mtdev] = "-mtdev,-no-mtdev,mtdev"
-# depends on glib
-PACKAGECONFIG[fontconfig] = "-fontconfig,-no-fontconfig,fontconfig"
-PACKAGECONFIG[gtkstyle] = "-gtkstyle,-no-gtkstyle,gtk+"
-PACKAGECONFIG[directfb] = "-directfb,-no-directfb,directfb"
-PACKAGECONFIG[linuxfb] = "-linuxfb,-no-linuxfb"
-PACKAGECONFIG[mitshm] = "-mitshm,-no-mitshm,mitshm"
-PACKAGECONFIG[kms] = "-kms,-no-kms,virtual/mesa virtual/egl"
-# needed for qtwebkit
-PACKAGECONFIG[icu] = "-icu,-no-icu,icu"
-PACKAGECONFIG[udev] = "-libudev,-no-libudev,udev"
-# use -openssl-linked here to ensure that RDEPENDS for libcrypto and libssl are detected
-PACKAGECONFIG[openssl] = "-openssl-linked,-no-openssl,openssl"
-PACKAGECONFIG[alsa] = "-alsa,-no-alsa,alsa-lib"
-PACKAGECONFIG[pulseaudio] = "-pulseaudio,-no-pulseaudio,pulseaudio"
-PACKAGECONFIG[nis] = "-nis,-no-nis"
-PACKAGECONFIG[widgets] = "-widgets,-no-widgets"
-
-QT_CONFIG_FLAGS += " \
-    -shared \
-    -silent \
-    -no-pch \
-    -no-rpath \
-    -pkg-config \
-    ${EXTRA_OECONF} \
-"
-
-do_generate_qt_config_file_append() {
-    cat >> ${QT_CONF_PATH} <<EOF
-
-[EffectivePaths]
-Prefix=..
-EOF
-}
-
-# qtbase is exception, we need to use mkspecs from ${S}
-QMAKE_MKSPEC_PATH = "${B}"
-
-# another exception is that we need to run bin/qmake, because EffectivePaths are relative to qmake location
-OE_QMAKE_QMAKE_ORIG = "${STAGING_BINDIR_NATIVE}/${QT_DIR_NAME}/qmake"
-OE_QMAKE_QMAKE = "bin/qmake"
-
-# qtbase is exception, configure script is using our get(X)QEvalMakeConf and setBootstrapEvalVariable functions to read it from shell
-export OE_QMAKE_COMPILER
-export OE_QMAKE_CC
-export OE_QMAKE_CFLAGS
-export OE_QMAKE_CXX
-export OE_QMAKE_CXXFLAGS
-export OE_QMAKE_LINK
-export OE_QMAKE_LDFLAGS
-export OE_QMAKE_AR
-export OE_QMAKE_STRIP
-
-do_configure() {
-    # we need symlink in path relative to source, because
-    # EffectivePaths:Prefix is relative to qmake location
-    if [ ! -e ${B}/bin/qmake ]; then
-        mkdir ${B}/bin
-        ln -sf ${OE_QMAKE_QMAKE_ORIG} ${B}/bin/qmake
-    fi
-
-    ${S}/configure -v \
-        -opensource -confirm-license \
-        -sysroot ${STAGING_DIR_TARGET} \
-        -no-gcc-sysroot \
-        -prefix ${OE_QMAKE_PATH_PREFIX} \
-        -bindir ${OE_QMAKE_PATH_BINS} \
-        -libdir ${OE_QMAKE_PATH_LIBS} \
-        -datadir ${OE_QMAKE_PATH_DATA} \
-        -sysconfdir ${OE_QMAKE_PATH_SETTINGS} \
-        -docdir ${OE_QMAKE_PATH_DOCS} \
-        -headerdir ${OE_QMAKE_PATH_HEADERS} \
-        -archdatadir ${OE_QMAKE_PATH_ARCHDATA} \
-        -libexecdir ${OE_QMAKE_PATH_LIBEXECS} \
-        -plugindir ${OE_QMAKE_PATH_PLUGINS} \
-        -importdir ${OE_QMAKE_PATH_IMPORTS} \
-        -qmldir ${OE_QMAKE_PATH_QML} \
-        -translationdir ${OE_QMAKE_PATH_TRANSLATIONS} \
-        -testsdir ${OE_QMAKE_PATH_TESTS} \
-        -examplesdir ${OE_QMAKE_PATH_EXAMPLES} \
-        -hostbindir ${OE_QMAKE_PATH_HOST_BINS} \
-        -hostdatadir ${OE_QMAKE_PATH_HOST_DATA} \
-        -external-hostbindir ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \
-        -platform ${OE_QMAKESPEC} \
-        -xplatform linux-oe-g++ \
-        ${QT_CONFIG_FLAGS}
-
-    qmake5_base_do_configure
-}
-
-do_compile_append() {
-    # copy corelib/3rdparty/qmake sources required by qmake -> ${B}
-    cp -ra ${S}/src/corelib ${B}/src
-    cp -ra ${S}/src/3rdparty ${B}/src
-    cp -ra ${S}/qmake ${B}
-    cp ${S}/.qmake.conf ${B}/qmake
-    cd ${B}/qmake
-    # align qt5 tools source path to ${S}
-    sed -i 's:\.\./tools:${S}/tools:g' qmake.pro
-    ../${OE_QMAKE_QMAKE}
-    oe_runmake CC="${CC}" CXX="${CXX}"
-}
-
-do_install_append() {
-    install -m 0755 ${B}/qmake/bin/qmake ${D}/${bindir}/${QT_DIR_NAME}
-
-    ### Fix up the binaries to the right location
-    ### TODO: FIX
-    # install fonts manually if they are missing
-    if [ ! -d ${D}/${OE_QMAKE_PATH_LIBS}/fonts ]; then
-        cp -a ${S}/lib/fonts ${D}/${OE_QMAKE_PATH_LIBS}
-        chown -R root:root ${D}/${OE_QMAKE_PATH_LIBS}/fonts
-    fi
-
-    # Remove example.pro file as it is useless
-    rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro	
-
-    # Remove macx-ios-clang directory because /usr/lib/qt5/mkspecs/macx-ios-clang/rename_main.sh:#!/bin/bash
-    # triggers QA Issue: qtbase-mkspecs requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
-    rm -rf ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/macx-ios-clang
-}
-
-PACKAGES =. " \
-    ${PN}-fonts \
-    ${PN}-fonts-ttf-vera \
-    ${PN}-fonts-ttf-dejavu \
-    ${PN}-fonts-pfa \
-    ${PN}-fonts-pfb \
-    ${PN}-fonts-qpf \
-"
-
-RRECOMMENDS_${PN}-fonts = " \
-    ${PN}-fonts-ttf-vera \
-    ${PN}-fonts-ttf-dejavu \
-    ${PN}-fonts-pfa \
-    ${PN}-fonts-pfb \
-    ${PN}-fonts-qpf \
-"
-
-ALLOW_EMPTY_${PN}-fonts = "1"
-
-FILES_${PN}-fonts-ttf-vera       = "${OE_QMAKE_PATH_LIBS}/fonts/Vera*.ttf"
-FILES_${PN}-fonts-ttf-dejavu     = "${OE_QMAKE_PATH_LIBS}/fonts/DejaVu*.ttf"
-FILES_${PN}-fonts-pfa            = "${OE_QMAKE_PATH_LIBS}/fonts/*.pfa"
-FILES_${PN}-fonts-pfb            = "${OE_QMAKE_PATH_LIBS}/fonts/*.pfb"
-FILES_${PN}-fonts-qpf            = "${OE_QMAKE_PATH_LIBS}/fonts/*.qpf*"
-FILES_${PN}-fonts                = "${OE_QMAKE_PATH_LIBS}/fonts/README \
-                                    ${OE_QMAKE_PATH_LIBS}/fonts/fontdir"
-
-sysroot_stage_dirs_append() {
-    # $to is 2nd parameter passed to sysroot_stage_dir, e.g. ${SYSROOT_DESTDIR} passed from sysroot_stage_all
-    rm -rf $to${OE_QMAKE_PATH_LIBS}/fonts
-}
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index ed6878c..44295a0 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -1,8 +1,12 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
 
-SRC_URI = "\
-    ${QT_GIT}/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
+    file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
 
 # common for qtbase-native, qtbase-nativesdk and qtbase
@@ -25,9 +29,244 @@ SRC_URI += "\
     file://0012-Set-paths-for-target-properly.patch \
 "
 
-SRCREV = "f58e882b7594c59b6050d3c87562fcf836d10f60"
+DEPENDS += "qtbase-native"
+
+# LGPL-3.0 is used only in src/plugins/platforms/android/extract.cpp
+
+# for syncqt
+RDEPENDS_${PN}-tools += "perl"
+
+# separate some parts of PACKAGECONFIG which are often changed
+# be aware that you need to add icu to build qtwebkit, default
+# PACKAGECONFIG is kept rather minimal for people who don't need
+# stuff like webkit (and it's easier to add options than remove)
+
+PACKAGECONFIG_GL ?= "${@base_contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)}"
+PACKAGECONFIG_FB ?= "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
+PACKAGECONFIG_X11 ?= "${@base_contains('DISTRO_FEATURES', 'x11', 'xcb xvideo xsync xshape xrender xrandr xfixes xinput2 xinput xinerama xcursor gtkstyle xkb', '', d)}"
+PACKAGECONFIG_FONTS ?= ""
+PACKAGECONFIG_SYSTEM ?= "jpeg libpng zlib"
+PACKAGECONFIG_MULTIMEDIA ?= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
+PACKAGECONFIG_DISTRO ?= ""
+# Either release or debug, can be overridden in bbappends
+PACKAGECONFIG_RELEASE ?= "release"
+# This is in qt5.inc, because qtwebkit-examples are using it to enable ca-certificates dependency
+# PACKAGECONFIG_OPENSSL ?= "openssl"
+PACKAGECONFIG_DEFAULT ?= "dbus udev evdev widgets tools libs"
+
+PACKAGECONFIG ?= " \
+    ${PACKAGECONFIG_RELEASE} \
+    ${PACKAGECONFIG_DEFAULT} \
+    ${PACKAGECONFIG_OPENSSL} \
+    ${PACKAGECONFIG_GL} \
+    ${PACKAGECONFIG_FB} \
+    ${PACKAGECONFIG_X11} \
+    ${PACKAGECONFIG_FONTS} \
+    ${PACKAGECONFIG_SYSTEM} \
+    ${PACKAGECONFIG_MULTIMEDIA} \
+    ${PACKAGECONFIG_DISTRO} \
+"
+
+PACKAGECONFIG[release] = "-release,-debug"
+PACKAGECONFIG[developer] = "-developer-build"
+PACKAGECONFIG[sm] = "-sm,-no-sm"
+PACKAGECONFIG[tests] = "-make tests,-nomake tests"
+PACKAGECONFIG[examples] = "-make examples -compile-examples,-nomake examples"
+PACKAGECONFIG[tools] = "-make tools,-nomake tools"
+# only for completeness, configure will add libs even if you try to explicitly remove it
+PACKAGECONFIG[libs] = "-make libs,-nomake libs"
+# accessibility is required to compile qtquickcontrols
+PACKAGECONFIG[accessibility] = "-accessibility,-no-accessibility"
+PACKAGECONFIG[glib] = "-glib,-no-glib,glib-2.0"
+# use either system freetype or bundled freetype, if you disable freetype completely
+# fontdatabases/basic/qbasicfontdatabase.cpp will fail to build and system freetype
+# works only together with fontconfig
+PACKAGECONFIG[freetype] = "-system-freetype,-freetype,freetype"
+PACKAGECONFIG[jpeg] = "-system-libjpeg,-no-libjpeg,jpeg"
+PACKAGECONFIG[libpng] = "-system-libpng,-no-libpng,libpng"
+PACKAGECONFIG[zlib] = "-system-zlib,-qt-zlib,zlib"
+PACKAGECONFIG[pcre] = "-system-pcre,-qt-pcre,pcre"
+PACKAGECONFIG[gl] = "-opengl desktop -no-eglfs,,virtual/libgl"
+PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl"
+PACKAGECONFIG[tslib] = "-tslib,-no-tslib,tslib"
+PACKAGECONFIG[cups] = "-cups,-no-cups,cups"
+PACKAGECONFIG[dbus] = "-dbus,-no-dbus,dbus"
+PACKAGECONFIG[xcb] = "-xcb -xcb-xlib -system-xcb,-no-xcb,libxcb xcb-util-wm xcb-util-image xcb-util-keysyms xcb-util-renderutil"
+PACKAGECONFIG[sql-ibase] = "-sql-ibase,-no-sql-ibase"
+PACKAGECONFIG[sql-mysql] = "-sql-mysql,-no-sql-mysql,mysql5"
+PACKAGECONFIG[sql-psql] = "-sql-psql,-no-sql-psql,postgresql"
+PACKAGECONFIG[sql-odbc] = "-sql-odbc,-no-sql-odbc"
+PACKAGECONFIG[sql-oci] = "-sql-oci,-no-sql-oci"
+PACKAGECONFIG[sql-tds] = "-sql-tds,-no-sql-tds"
+PACKAGECONFIG[sql-db2] = "-sql-db2,-no-sql-db2"
+PACKAGECONFIG[sql-sqlite2] = "-sql-sqlite2,-no-sql-sqlite2,sqlite"
+PACKAGECONFIG[sql-sqlite] = "-sql-sqlite,-no-sql-sqlite,sqlite3"
+PACKAGECONFIG[xcursor] = "-xcursor,-no-xcursor,libxcursor"
+PACKAGECONFIG[xinerama] = "-xinerama,-no-xinerama,libxinerama"
+PACKAGECONFIG[xinput] = "-xinput,-no-xinput"
+PACKAGECONFIG[xinput2] = "-xinput2,-no-xinput2,libxi"
+PACKAGECONFIG[xfixes] = "-xfixes,-no-xfixes,libxfixes"
+PACKAGECONFIG[xrandr] = "-xrandr,-no-xrandr,libxrandr"
+PACKAGECONFIG[xrender] = "-xrender,-no-xrender,libxrender"
+PACKAGECONFIG[xshape] = "-xshape,-no-xshape"
+PACKAGECONFIG[xsync] = "-xsync,-no-xsync"
+PACKAGECONFIG[xvideo] = "-xvideo,-no-xvideo"
+PACKAGECONFIG[openvg] = "-openvg,-no-openvg"
+PACKAGECONFIG[iconv] = "-iconv,-no-iconv,virtual/libiconv"
+PACKAGECONFIG[xkb] = "-xkb,-no-xkb -no-xkbcommon,libxkbcommon"
+PACKAGECONFIG[evdev] = "-evdev,-no-evdev"
+PACKAGECONFIG[mtdev] = "-mtdev,-no-mtdev,mtdev"
+# depends on glib
+PACKAGECONFIG[fontconfig] = "-fontconfig,-no-fontconfig,fontconfig"
+PACKAGECONFIG[gtkstyle] = "-gtkstyle,-no-gtkstyle,gtk+"
+PACKAGECONFIG[directfb] = "-directfb,-no-directfb,directfb"
+PACKAGECONFIG[linuxfb] = "-linuxfb,-no-linuxfb"
+PACKAGECONFIG[mitshm] = "-mitshm,-no-mitshm,mitshm"
+PACKAGECONFIG[kms] = "-kms,-no-kms,virtual/mesa virtual/egl"
+# needed for qtwebkit
+PACKAGECONFIG[icu] = "-icu,-no-icu,icu"
+PACKAGECONFIG[udev] = "-libudev,-no-libudev,udev"
+# use -openssl-linked here to ensure that RDEPENDS for libcrypto and libssl are detected
+PACKAGECONFIG[openssl] = "-openssl-linked,-no-openssl,openssl"
+PACKAGECONFIG[alsa] = "-alsa,-no-alsa,alsa-lib"
+PACKAGECONFIG[pulseaudio] = "-pulseaudio,-no-pulseaudio,pulseaudio"
+PACKAGECONFIG[nis] = "-nis,-no-nis"
+PACKAGECONFIG[widgets] = "-widgets,-no-widgets"
+
+QT_CONFIG_FLAGS += " \
+    -shared \
+    -silent \
+    -no-pch \
+    -no-rpath \
+    -pkg-config \
+    ${EXTRA_OECONF} \
+"
+
+do_generate_qt_config_file_append() {
+    cat >> ${QT_CONF_PATH} <<EOF
+
+[EffectivePaths]
+Prefix=..
+EOF
+}
+
+# qtbase is exception, we need to use mkspecs from ${S}
+QMAKE_MKSPEC_PATH = "${B}"
+
+# another exception is that we need to run bin/qmake, because EffectivePaths are relative to qmake location
+OE_QMAKE_QMAKE_ORIG = "${STAGING_BINDIR_NATIVE}/${QT_DIR_NAME}/qmake"
+OE_QMAKE_QMAKE = "bin/qmake"
+
+# qtbase is exception, configure script is using our get(X)QEvalMakeConf and setBootstrapEvalVariable functions to read it from shell
+export OE_QMAKE_COMPILER
+export OE_QMAKE_CC
+export OE_QMAKE_CFLAGS
+export OE_QMAKE_CXX
+export OE_QMAKE_CXXFLAGS
+export OE_QMAKE_LINK
+export OE_QMAKE_LDFLAGS
+export OE_QMAKE_AR
+export OE_QMAKE_STRIP
+
+do_configure() {
+    # we need symlink in path relative to source, because
+    # EffectivePaths:Prefix is relative to qmake location
+    if [ ! -e ${B}/bin/qmake ]; then
+        mkdir ${B}/bin
+        ln -sf ${OE_QMAKE_QMAKE_ORIG} ${B}/bin/qmake
+    fi
 
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
-                    file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+    ${S}/configure -v \
+        -opensource -confirm-license \
+        -sysroot ${STAGING_DIR_TARGET} \
+        -no-gcc-sysroot \
+        -prefix ${OE_QMAKE_PATH_PREFIX} \
+        -bindir ${OE_QMAKE_PATH_BINS} \
+        -libdir ${OE_QMAKE_PATH_LIBS} \
+        -datadir ${OE_QMAKE_PATH_DATA} \
+        -sysconfdir ${OE_QMAKE_PATH_SETTINGS} \
+        -docdir ${OE_QMAKE_PATH_DOCS} \
+        -headerdir ${OE_QMAKE_PATH_HEADERS} \
+        -archdatadir ${OE_QMAKE_PATH_ARCHDATA} \
+        -libexecdir ${OE_QMAKE_PATH_LIBEXECS} \
+        -plugindir ${OE_QMAKE_PATH_PLUGINS} \
+        -importdir ${OE_QMAKE_PATH_IMPORTS} \
+        -qmldir ${OE_QMAKE_PATH_QML} \
+        -translationdir ${OE_QMAKE_PATH_TRANSLATIONS} \
+        -testsdir ${OE_QMAKE_PATH_TESTS} \
+        -examplesdir ${OE_QMAKE_PATH_EXAMPLES} \
+        -hostbindir ${OE_QMAKE_PATH_HOST_BINS} \
+        -hostdatadir ${OE_QMAKE_PATH_HOST_DATA} \
+        -external-hostbindir ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS} \
+        -platform ${OE_QMAKESPEC} \
+        -xplatform linux-oe-g++ \
+        ${QT_CONFIG_FLAGS}
+
+    qmake5_base_do_configure
+}
+
+do_compile_append() {
+    # copy corelib/3rdparty/qmake sources required by qmake -> ${B}
+    cp -ra ${S}/src/corelib ${B}/src
+    cp -ra ${S}/src/3rdparty ${B}/src
+    cp -ra ${S}/qmake ${B}
+    cp ${S}/.qmake.conf ${B}/qmake
+    cd ${B}/qmake
+    # align qt5 tools source path to ${S}
+    sed -i 's:\.\./tools:${S}/tools:g' qmake.pro
+    ../${OE_QMAKE_QMAKE}
+    oe_runmake CC="${CC}" CXX="${CXX}"
+}
+
+do_install_append() {
+    install -m 0755 ${B}/qmake/bin/qmake ${D}/${bindir}/${QT_DIR_NAME}
+
+    ### Fix up the binaries to the right location
+    ### TODO: FIX
+    # install fonts manually if they are missing
+    if [ ! -d ${D}/${OE_QMAKE_PATH_LIBS}/fonts ]; then
+        cp -a ${S}/lib/fonts ${D}/${OE_QMAKE_PATH_LIBS}
+        chown -R root:root ${D}/${OE_QMAKE_PATH_LIBS}/fonts
+    fi
+
+    # Remove example.pro file as it is useless
+    rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro	
+
+    # Remove macx-ios-clang directory because /usr/lib/qt5/mkspecs/macx-ios-clang/rename_main.sh:#!/bin/bash
+    # triggers QA Issue: qtbase-mkspecs requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
+    rm -rf ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/macx-ios-clang
+}
+
+PACKAGES =. " \
+    ${PN}-fonts \
+    ${PN}-fonts-ttf-vera \
+    ${PN}-fonts-ttf-dejavu \
+    ${PN}-fonts-pfa \
+    ${PN}-fonts-pfb \
+    ${PN}-fonts-qpf \
+"
+
+RRECOMMENDS_${PN}-fonts = " \
+    ${PN}-fonts-ttf-vera \
+    ${PN}-fonts-ttf-dejavu \
+    ${PN}-fonts-pfa \
+    ${PN}-fonts-pfb \
+    ${PN}-fonts-qpf \
+"
+
+ALLOW_EMPTY_${PN}-fonts = "1"
+
+FILES_${PN}-fonts-ttf-vera       = "${OE_QMAKE_PATH_LIBS}/fonts/Vera*.ttf"
+FILES_${PN}-fonts-ttf-dejavu     = "${OE_QMAKE_PATH_LIBS}/fonts/DejaVu*.ttf"
+FILES_${PN}-fonts-pfa            = "${OE_QMAKE_PATH_LIBS}/fonts/*.pfa"
+FILES_${PN}-fonts-pfb            = "${OE_QMAKE_PATH_LIBS}/fonts/*.pfb"
+FILES_${PN}-fonts-qpf            = "${OE_QMAKE_PATH_LIBS}/fonts/*.qpf*"
+FILES_${PN}-fonts                = "${OE_QMAKE_PATH_LIBS}/fonts/README \
+                                    ${OE_QMAKE_PATH_LIBS}/fonts/fontdir"
+
+sysroot_stage_dirs_append() {
+    # $to is 2nd parameter passed to sysroot_stage_dir, e.g. ${SYSROOT_DESTDIR} passed from sysroot_stage_all
+    rm -rf $to${OE_QMAKE_PATH_LIBS}/fonts
+}
+
+SRCREV = "f58e882b7594c59b6050d3c87562fcf836d10f60"
diff --git a/recipes-qt/qt5/qtconnectivity.inc b/recipes-qt/qt5/qtconnectivity.inc
deleted file mode 100644
index ab8d31e..0000000
--- a/recipes-qt/qt5/qtconnectivity.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-require qt5.inc
-
-DEPENDS += "qtbase qtdeclarative"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[bluez4] = "OE_BLUEZ_ENABLED,,bluez4"
-
-do_configure_prepend() {
-    export QMAKE_CACHE_EVAL="CONFIG+=${EXTRA_OECONF}"
-    # disable bluez test if it isn't enabled by PACKAGECONFIG
-    sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
-}
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 0e62a23..8ed64fb 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -1,4 +1,24 @@
+require qt5.inc
 require qt5-git.inc
-require ${BPN}.inc
+
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+"
+
+DEPENDS += "qtbase qtdeclarative"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[bluez4] = "OE_BLUEZ_ENABLED,,bluez4"
+
+do_configure_prepend() {
+    export QMAKE_CACHE_EVAL="CONFIG+=${EXTRA_OECONF}"
+    # disable bluez test if it isn't enabled by PACKAGECONFIG
+    sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
+}
 
 SRCREV = "b4bf23453e65995bdd8827b6e146edd5cafeddc3"
diff --git a/recipes-qt/qt5/qtdeclarative.inc b/recipes-qt/qt5/qtdeclarative.inc
deleted file mode 100644
index 10487ca..0000000
--- a/recipes-qt/qt5/qtdeclarative.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-require qt5.inc
-
-SRC_URI += " \
-    file://0001-qmltestexample-fix-link.patch \
-"
-
-# There are no LGPLv3-only licensed files in this component.
-
-DEPENDS += "qtbase"
-
-PACKAGECONFIG ??= "qtxmlpatterns"
-PACKAGECONFIG[qtxmlpatterns] = ",,qtxmlpatterns"
-
-do_configure_prepend() {
-    # disable qtxmlpatterns test if it isn't enabled by PACKAGECONFIG
-    sed -e 's/^\(qtHaveModule(xmlpatterns)\)/OE_QTXMLPATTERNS_ENABLED:\1/' -i ${S}/src/imports/imports.pro
-    sed -e 's/^\(!qtHaveModule(xmlpatterns)\)/!OE_QTXMLPATTERNS_ENABLED|\1/' -i ${S}/tests/auto/quick/quick.pro
-}
-
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index caa851a..5f628c2 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -1,4 +1,30 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
+
+# There are no LGPLv3-only licensed files in this component.
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+"
+
+DEPENDS += "qtbase"
+
+SRC_URI += " \
+    file://0001-qmltestexample-fix-link.patch \
+"
+
+PACKAGECONFIG ??= "qtxmlpatterns"
+PACKAGECONFIG[qtxmlpatterns] = ",,qtxmlpatterns"
+
+do_configure_prepend() {
+    # disable qtxmlpatterns test if it isn't enabled by PACKAGECONFIG
+    sed -e 's/^\(qtHaveModule(xmlpatterns)\)/OE_QTXMLPATTERNS_ENABLED:\1/' -i ${S}/src/imports/imports.pro
+    sed -e 's/^\(!qtHaveModule(xmlpatterns)\)/!OE_QTXMLPATTERNS_ENABLED|\1/' -i ${S}/tests/auto/quick/quick.pro
+}
+
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
 SRCREV = "2b3c2339616680537145a9cc2e7567575add1abb"
diff --git a/recipes-qt/qt5/qtenginio.inc b/recipes-qt/qt5/qtenginio.inc
deleted file mode 100644
index 687b414..0000000
--- a/recipes-qt/qt5/qtenginio.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-require qt5.inc
-
-DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
-
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6"
-LICENSE = "BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index 9e2c703..2f13a2b 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -1,5 +1,14 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
+
+LICENSE = "BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+"
+
+DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
 QT_MODULE_BRANCH = "1.1"
 SRCREV = "30ee95cd19f9a435ce337b4f651175ed2e8ba2e5"
diff --git a/recipes-qt/qt5/qtgraphicaleffects.inc b/recipes-qt/qt5/qtgraphicaleffects.inc
deleted file mode 100644
index 9b862cf..0000000
--- a/recipes-qt/qt5/qtgraphicaleffects.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-require qt5.inc
-
-DEPENDS += "qtdeclarative"
-
-RDEPENDS_${PN}-dev = ""
-
-# There are no LGPLv3-only licensed files in this component.
-# There are no GPLv2 licensed files in this component.
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index cf2498b..d7f0e87 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -1,4 +1,19 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
+
+# There are no LGPLv3-only licensed files in this component.
+# There are no GPLv2 licensed files in this component.
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+"
+
+DEPENDS += "qtdeclarative"
+
+RDEPENDS_${PN}-dev = ""
 
 SRCREV = "6eef4b5fa1836c9cb7ebc5dcb269a8d3114eb6c3"
diff --git a/recipes-qt/qt5/qtimageformats.inc b/recipes-qt/qt5/qtimageformats.inc
deleted file mode 100644
index 94c3a9d..0000000
--- a/recipes-qt/qt5/qtimageformats.inc
+++ /dev/null
@@ -1,21 +0,0 @@
-require qt5.inc
-
-DEPENDS += "qtbase"
-ALLOW_EMPTY_${PN} = "1"
-
-SRC_URI += "file://0001-qtimageformats.pro-Make-the-dependencies-determinist.patch"
-
-PACKAGECONFIG ?= "libtiff"
-# Currently we don't have recipe for libmng, but lock it anyway so qtimageformats stay deterministic even when libmng is introduced
-PACKAGECONFIG[jasper] = ",,jasper"
-PACKAGECONFIG[libmng] = ",,libmng"
-PACKAGECONFIG[libtiff] = ",,tiff"
-PACKAGECONFIG[libwebp] = ",,libwebp"
-
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libmng', 'CONFIG+=OE_LIBMNG_ENABLED', '', d)}"
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'jasper', 'CONFIG+=OE_JASPER_ENABLED', '', d)}"
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 149148e..bd2f893 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -1,4 +1,30 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
+
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+"
+
+DEPENDS += "qtbase"
+ALLOW_EMPTY_${PN} = "1"
+
+SRC_URI += "file://0001-qtimageformats.pro-Make-the-dependencies-determinist.patch"
+
+PACKAGECONFIG ?= "libtiff"
+# Currently we don't have recipe for libmng, but lock it anyway so qtimageformats stay deterministic even when libmng is introduced
+PACKAGECONFIG[jasper] = ",,jasper"
+PACKAGECONFIG[libmng] = ",,libmng"
+PACKAGECONFIG[libtiff] = ",,tiff"
+PACKAGECONFIG[libwebp] = ",,libwebp"
+
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libmng', 'CONFIG+=OE_LIBMNG_ENABLED', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'jasper', 'CONFIG+=OE_JASPER_ENABLED', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
 
 SRCREV = "98f83553e9fe2aa5fc54b32513af6ba3aa60a07b"
diff --git a/recipes-qt/qt5/qtlocation.inc b/recipes-qt/qt5/qtlocation.inc
deleted file mode 100644
index 7941240..0000000
--- a/recipes-qt/qt5/qtlocation.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-require qt5.inc
-
-DEPENDS += "qtbase qt3d"
-# qtsystems qtmultimedia
-
-PACKAGECONFIG ??= ""
-# older geoclue 0.x is needed
-PACKAGECONFIG[geoclue] = "OE_GEOCLUE_ENABLED,,gconf geoclue"
-PACKAGECONFIG[gypsy] = "OE_GYPSY_ENABLED,,gconf gypsy"
-
-do_configure_prepend() {
-    # disable geoclue tests if it isn't enabled by PACKAGECONFIG
-    sed -i -e 's/^\(qtCompileTest(geoclue)\)/OE_GEOCLUE_ENABLED:\1/' ${S}/qtlocation.pro
-    sed -i -e 's/^\(qtCompileTest(geoclue-satellite)\)/OE_GEOCLUE_ENABLED:\1/' ${S}/qtlocation.pro
-    # disable gypsy test if it isn't enabled by PACKAGECONFIG
-    sed -i -e 's/^\(qtCompileTest(gypsy)\)/OE_GYPSY_ENABLED:\1/' ${S}/qtlocation.pro
-}
-
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 75b4f72..7ff4c3d 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -1,4 +1,32 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
+
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+"
+
+DEPENDS += "qtbase qt3d"
+# qtsystems qtmultimedia
+
+PACKAGECONFIG ??= ""
+# older geoclue 0.x is needed
+PACKAGECONFIG[geoclue] = "OE_GEOCLUE_ENABLED,,gconf geoclue"
+PACKAGECONFIG[gypsy] = "OE_GYPSY_ENABLED,,gconf gypsy"
+
+do_configure_prepend() {
+    # disable geoclue tests if it isn't enabled by PACKAGECONFIG
+    sed -i -e 's/^\(qtCompileTest(geoclue)\)/OE_GEOCLUE_ENABLED:\1/' ${S}/qtlocation.pro
+    sed -i -e 's/^\(qtCompileTest(geoclue-satellite)\)/OE_GEOCLUE_ENABLED:\1/' ${S}/qtlocation.pro
+    # disable gypsy test if it isn't enabled by PACKAGECONFIG
+    sed -i -e 's/^\(qtCompileTest(gypsy)\)/OE_GYPSY_ENABLED:\1/' ${S}/qtlocation.pro
+}
+
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
 
 SRCREV = "b13fec3c7ed08b7d0e79c08312a3c3285eb20ef3"
diff --git a/recipes-qt/qt5/qtmultimedia.inc b/recipes-qt/qt5/qtmultimedia.inc
deleted file mode 100644
index bb53b9c..0000000
--- a/recipes-qt/qt5/qtmultimedia.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-require qt5.inc
-
-# There are no LGPLv3-only licensed files in this component.
-
-DEPENDS += "qtdeclarative"
-
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
-PACKAGECONFIG[alsa] = ",,alsa-lib"
-PACKAGECONFIG[pulseaudio] = ",,pulseaudio"
-PACKAGECONFIG[openal] = ",,openal-soft"
-PACKAGECONFIG[gstreamer] = ",,gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-PACKAGECONFIG[gstreamer010] = ",,gstreamer gst-plugins-base gst-plugins-bad"
-
-EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'alsa', '', 'CONFIG+=done_config_alsa', d)}"
-EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', '', 'CONFIG+=done_config_pulseaudio', d)}"
-EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'openal', '', 'CONFIG+=done_config_openal', d)}"
-
-# Handles GStreamer support
-EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'gstreamer', 'GST_VERSION=1.0', '', d)}"
-EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'gstreamer010', 'GST_VERSION=0.10', '', d)}"
-# Disable GStreamer if completely disabled
-EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains_any('PACKAGECONFIG', 'gstreamer gstreamer010', '', 'CONFIG+=done_config_gstreamer', d)}"
-
-SRC_URI += "\
-    file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
-"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 1795169..66bba54 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -1,4 +1,37 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
+
+# There are no LGPLv3-only licensed files in this component.
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+"
+
+DEPENDS += "qtdeclarative"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
+PACKAGECONFIG[alsa] = ",,alsa-lib"
+PACKAGECONFIG[pulseaudio] = ",,pulseaudio"
+PACKAGECONFIG[openal] = ",,openal-soft"
+PACKAGECONFIG[gstreamer] = ",,gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
+PACKAGECONFIG[gstreamer010] = ",,gstreamer gst-plugins-base gst-plugins-bad"
+
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'alsa', '', 'CONFIG+=done_config_alsa', d)}"
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', '', 'CONFIG+=done_config_pulseaudio', d)}"
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'openal', '', 'CONFIG+=done_config_openal', d)}"
+
+# Handles GStreamer support
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'gstreamer', 'GST_VERSION=1.0', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'gstreamer010', 'GST_VERSION=0.10', '', d)}"
+# Disable GStreamer if completely disabled
+EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains_any('PACKAGECONFIG', 'gstreamer gstreamer010', '', 'CONFIG+=done_config_gstreamer', d)}"
+
+SRC_URI += "\
+    file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
+"
 
 SRCREV = "6fe3061c1f6b7438d20c7bfb92c7652cedc5b049"
diff --git a/recipes-qt/qt5/qtquick1.inc b/recipes-qt/qt5/qtquick1.inc
deleted file mode 100644
index c3ae7cf..0000000
--- a/recipes-qt/qt5/qtquick1.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-require qt5.inc
-
-DEPENDS += "qtscript qtsvg qtxmlpatterns qtwebkit"
-# qttools
-
-# There are no LGPLv3-only licensed files in this component.
-# There are no GPLv2 licensed files in this component.
-# Note that some files are LGPL-2.1 only without Digia-Qt-LGPL-Exception-1.1.
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 7cc23d5..a90d2e3 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -1,4 +1,19 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
+
+# There are no LGPLv3-only licensed files in this component.
+# There are no GPLv2 licensed files in this component.
+# Note that some files are LGPL-2.1 only without Digia-Qt-LGPL-Exception-1.1.
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+"
+
+DEPENDS += "qtscript qtsvg qtxmlpatterns qtwebkit"
+# qttools
 
 SRCREV = "c78f720de6de9340492f8395109252919283a955"
diff --git a/recipes-qt/qt5/qtquickcontrols.inc b/recipes-qt/qt5/qtquickcontrols.inc
deleted file mode 100644
index 89bda5e..0000000
--- a/recipes-qt/qt5/qtquickcontrols.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-require qt5.inc
-
-DEPENDS += "qtdeclarative"
-
-RDEPENDS_${PN}-dev = ""
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index ddc4ccf..5afb31a 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -1,4 +1,17 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
+
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+"
+
+DEPENDS += "qtdeclarative"
+
+RDEPENDS_${PN}-dev = ""
 
 SRCREV = "de9145dcd904068256e28e130fdfda2e8014efe8"
diff --git a/recipes-qt/qt5/qtscript.inc b/recipes-qt/qt5/qtscript.inc
deleted file mode 100644
index 5a534f0..0000000
--- a/recipes-qt/qt5/qtscript.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-require qt5.inc
-
-# qemuarm build fails with:
-# /OE/build/oe-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtscript/5.4.1+gitAUTOINC+822df36f25-r0/git/src/3rdparty/javascriptcore/JavaScriptCore/assembler/AssemblerBuffer.h: In member function 'void QTJSC::AssemblerBuffer::putInt64Unchecked(int64_t)':
-#/OE/build/oe-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtscript/5.4.1+gitAUTOINC+822df36f25-r0/git/src/3rdparty/javascriptcore/JavaScriptCore/assembler/AssemblerBuffer.h:106:58: warning: cast from 'char*' to 'int64_t* {aka long long int*}' increases required alignment of target type [-Wcast-align]
-#             *reinterpret_cast<int64_t*>(&m_buffer[m_size]) = value;
-#                                                          ^
-#{standard input}: Assembler messages:
-#{standard input}:22: Error: selected processor does not support Thumb mode `stmdb sp!,{r1-r3}'
-#{standard input}:23: Error: selected processor does not support Thumb mode `stmdb sp!,{r4-r8,lr}'
-#{standard input}:30: Error: lo register required -- `ldmia sp!,{r4-r8,lr}'
-#{standard input}:43: Error: lo register required -- `ldmia sp!,{r4-r8,lr}'
-ARM_INSTRUCTION_SET = "arm"
-
-# There are no LGPLv3-only licensed files in this component.
-# Note that some files are LGPL-2.1 only without Digia-Qt-LGPL-Exception-1.1.
-DEPENDS += "qtbase"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 4b99e38..489be2e 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -1,4 +1,28 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
+
+# There are no LGPLv3-only licensed files in this component.
+# Note that some files are LGPL-2.1 only without Digia-Qt-LGPL-Exception-1.1.
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+"
+
+# qemuarm build fails with:
+# /OE/build/oe-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtscript/5.4.1+gitAUTOINC+822df36f25-r0/git/src/3rdparty/javascriptcore/JavaScriptCore/assembler/AssemblerBuffer.h: In member function 'void QTJSC::AssemblerBuffer::putInt64Unchecked(int64_t)':
+#/OE/build/oe-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtscript/5.4.1+gitAUTOINC+822df36f25-r0/git/src/3rdparty/javascriptcore/JavaScriptCore/assembler/AssemblerBuffer.h:106:58: warning: cast from 'char*' to 'int64_t* {aka long long int*}' increases required alignment of target type [-Wcast-align]
+#             *reinterpret_cast<int64_t*>(&m_buffer[m_size]) = value;
+#                                                          ^
+#{standard input}: Assembler messages:
+#{standard input}:22: Error: selected processor does not support Thumb mode `stmdb sp!,{r1-r3}'
+#{standard input}:23: Error: selected processor does not support Thumb mode `stmdb sp!,{r4-r8,lr}'
+#{standard input}:30: Error: lo register required -- `ldmia sp!,{r4-r8,lr}'
+#{standard input}:43: Error: lo register required -- `ldmia sp!,{r4-r8,lr}'
+ARM_INSTRUCTION_SET = "arm"
+
+DEPENDS += "qtbase"
 
 SRCREV = "822df36f252c5a16cdf82f5666f36e7011df46c4"
diff --git a/recipes-qt/qt5/qtsensors.inc b/recipes-qt/qt5/qtsensors.inc
deleted file mode 100644
index 88c5e78..0000000
--- a/recipes-qt/qt5/qtsensors.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-require qt5.inc
-
-DEPENDS += "qtbase qtdeclarative"
-
-# There are no LGPLv3-only licensed files in this component.
-# There are no GPLv2 licensed files in this component.
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 982b2f7..31131d8 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -1,4 +1,17 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
+
+# There are no LGPLv3-only licensed files in this component.
+# There are no GPLv2 licensed files in this component.
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+"
+
+DEPENDS += "qtbase qtdeclarative"
 
 SRCREV = "26c99a8f7832a5549d315ad434e038ae3964e224"
diff --git a/recipes-qt/qt5/qtserialport.inc b/recipes-qt/qt5/qtserialport.inc
deleted file mode 100644
index c9877c6..0000000
--- a/recipes-qt/qt5/qtserialport.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-require qt5.inc
-
-SRC_URI += " \
-    file://0001-Unix-Clear-serial_struct-instances.patch \
-"
-
-DEPENDS += "qtbase"
-
-# text of LGPL_EXCEPTION.txt and LICENSE.FDL is slightly different than what
-# other qt* components use :/
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=eb6c371255e1262c55ae9b652a90b528 \
-                    file://LICENSE.FDL;md5=3801d7932fdc07fd9efe89f9854a6caa"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index a4e471b..e95d564 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -1,4 +1,21 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
+
+# text of LGPL_EXCEPTION.txt and LICENSE.FDL is slightly different than what
+# other qt* components use :/
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+    file://LGPL_EXCEPTION.txt;md5=eb6c371255e1262c55ae9b652a90b528 \
+    file://LICENSE.FDL;md5=3801d7932fdc07fd9efe89f9854a6caa \
+"
+
+SRC_URI += " \
+    file://0001-Unix-Clear-serial_struct-instances.patch \
+"
+
+DEPENDS += "qtbase"
 
 SRCREV = "b84fe7eb3d6d977a347bfbb82da724409b2eda69"
diff --git a/recipes-qt/qt5/qtsvg.inc b/recipes-qt/qt5/qtsvg.inc
deleted file mode 100644
index ce2eee4..0000000
--- a/recipes-qt/qt5/qtsvg.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-require qt5.inc
-
-# There are no LGPLv3-only licensed files in this component.
-DEPENDS += "qtbase"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index b9e57f5..89f0815 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -1,4 +1,15 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
+
+# There are no LGPLv3-only licensed files in this component.
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+"
+
+DEPENDS += "qtbase"
 
 SRCREV = "1fb79c9f2b50294b989cf2bdd8bfaaf0a458e2a8"
diff --git a/recipes-qt/qt5/qtsystems.inc b/recipes-qt/qt5/qtsystems.inc
deleted file mode 100644
index e9b14ae..0000000
--- a/recipes-qt/qt5/qtsystems.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-require qt5.inc
-
-DEPENDS += "qtbase qtdeclarative udev gconf"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[bluez4] = "OE_BLUEZ_ENABLED,,bluez4"
-
-do_configure_prepend() {
-    export QMAKE_CACHE_EVAL="CONFIG+=${EXTRA_OECONF}"
-    # disable bluez test if it isn't enabled by PACKAGECONFIG
-    sed -i 's/^    qtCompileTest(bluez)/    OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtsystems.pro
-}
-
-do_install_append() {
-    # Remove example.pro file as it is useless
-    rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro	
-}
-
-LICENSE = "GFDL-1.3 & LGPL-2.1 | GPL-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index ea253d6..edc0360 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -1,5 +1,29 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
+
+LICENSE = "GFDL-1.3 & LGPL-2.1 | GPL-3.0"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+"
+
+DEPENDS += "qtbase qtdeclarative udev gconf"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[bluez4] = "OE_BLUEZ_ENABLED,,bluez4"
+
+do_configure_prepend() {
+    export QMAKE_CACHE_EVAL="CONFIG+=${EXTRA_OECONF}"
+    # disable bluez test if it isn't enabled by PACKAGECONFIG
+    sed -i 's/^    qtCompileTest(bluez)/    OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtsystems.pro
+}
+
+do_install_append() {
+    # Remove example.pro file as it is useless
+    rm -f ${D}${OE_QMAKE_PATH_EXAMPLES}/examples.pro	
+}
 
 QT_MODULE_BRANCH = "dev"
 
diff --git a/recipes-qt/qt5/qttools-native.inc b/recipes-qt/qt5/qttools-native.inc
deleted file mode 100644
index 03b88cd..0000000
--- a/recipes-qt/qt5/qttools-native.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DEPENDS = "qtbase-native"
-
-QT_MODULE = "qttools"
-
-require qt5-native.inc
-
-SRC_URI += "file://0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch"
-
-do_configure() {
-    ${OE_QMAKE_QMAKE} ${OE_QMAKE_DEBUG_OUTPUT} -r ${S} CONFIG+=linguistonly
-}
-
-do_install() {
-    oe_runmake install INSTALL_ROOT=${D}
-}
diff --git a/recipes-qt/qt5/qttools-native_git.bb b/recipes-qt/qt5/qttools-native_git.bb
index bbaafc5..219fc2e 100644
--- a/recipes-qt/qt5/qttools-native_git.bb
+++ b/recipes-qt/qt5/qttools-native_git.bb
@@ -1,9 +1,26 @@
+DEPENDS = "qtbase-native"
+
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
+    file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+"
+
+QT_MODULE = "qttools"
+
+require qt5-native.inc
 require qt5-git.inc
-require ${PN}.inc
 
-SRCREV = "7f5b11a4a6357d2969e5b24bfb25c47aeb3d99f5"
+SRC_URI += "file://0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch"
 
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
-                    file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+do_configure() {
+    ${OE_QMAKE_QMAKE} ${OE_QMAKE_DEBUG_OUTPUT} -r ${S} CONFIG+=linguistonly
+}
+
+do_install() {
+    oe_runmake install INSTALL_ROOT=${D}
+}
+
+SRCREV = "7f5b11a4a6357d2969e5b24bfb25c47aeb3d99f5"
diff --git a/recipes-qt/qt5/qttools.inc b/recipes-qt/qt5/qttools.inc
deleted file mode 100644
index 97717ae..0000000
--- a/recipes-qt/qt5/qttools.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-require qt5.inc
-
-DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
-
-SRC_URI += " \
-    file://0002-assistant-help-fix-linking-of-dependent-libraries.patch \
-    file://0003-add-noqtwebkit-configuration.patch \
-"
-
-FILES_${PN}-tools += "${datadir}/${QT_DIR_NAME}/phrasebooks"
-FILES_${PN}-examples = "${datadir}/${QT_DIR_NAME}/examples"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
-
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index bbaafc5..4ba2b8a 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -1,9 +1,27 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
 
-SRCREV = "7f5b11a4a6357d2969e5b24bfb25c47aeb3d99f5"
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
+    file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+"
+
+DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
+
+SRC_URI += " \
+    file://0002-assistant-help-fix-linking-of-dependent-libraries.patch \
+    file://0003-add-noqtwebkit-configuration.patch \
+"
+
+FILES_${PN}-tools += "${datadir}/${QT_DIR_NAME}/phrasebooks"
+FILES_${PN}-examples = "${datadir}/${QT_DIR_NAME}/examples"
 
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
-                    file://LICENSE.LGPLv3;md5=ffcfac38a32c9ebdb8ff768fa1702478 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
+
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
+
+SRCREV = "7f5b11a4a6357d2969e5b24bfb25c47aeb3d99f5"
diff --git a/recipes-qt/qt5/qttranslations.inc b/recipes-qt/qt5/qttranslations.inc
deleted file mode 100644
index 45f7609..0000000
--- a/recipes-qt/qt5/qttranslations.inc
+++ /dev/null
@@ -1,91 +0,0 @@
-require qt5.inc
-
-DEPENDS += "qtbase qttools-native"
-
-LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6"
-LICENSE = "(LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
-
-PACKAGES =. " \
-    ${PN}-assistant \
-    ${PN}-designer \
-    ${PN}-linguist \
-    ${PN}-qmlviewer \
-    ${PN}-qtconnectivity \
-    ${PN}-qtmultimedia \
-    ${PN}-qtlocation \
-    ${PN}-qtdeclarative \
-    ${PN}-qtquickcontrols \
-    ${PN}-qtxmlpatterns \
-    ${PN}-qtconfig \
-    ${PN}-qtquick1 \
-    ${PN}-qtscript \
-    ${PN}-qtbase \
-    ${PN}-qthelp \
-    ${PN}-qt \
-"
-
-FILES_${PN}-assistant = " \
-    ${OE_QMAKE_PATH_TRANSLATIONS}/assistant_*.qm \
-"
-
-FILES_${PN}-designer = " \
-    ${OE_QMAKE_PATH_TRANSLATIONS}/designer_*.qm \
-"
-
-FILES_${PN}-linguist = " \
-    ${OE_QMAKE_PATH_TRANSLATIONS}/linguist_*.qm \
-"
-
-FILES_${PN}-qmlviewer = " \
-    ${OE_QMAKE_PATH_TRANSLATIONS}/qmlviewer_*.qm \
-"
-
-FILES_${PN}-qtconnectivity = " \
-    ${OE_QMAKE_PATH_TRANSLATIONS}/qtconnectivity_*.qm \
-"
-
-FILES_${PN}-qtmultimedia = " \
-    ${OE_QMAKE_PATH_TRANSLATIONS}/qtmultimedia_*.qm \
-"
-
-FILES_${PN}-qtlocation = " \
-    ${OE_QMAKE_PATH_TRANSLATIONS}/qtlocation_*.qm \
-"
-
-FILES_${PN}-qtdeclarative = " \
-    ${OE_QMAKE_PATH_TRANSLATIONS}/qtdeclarative_*.qm \
-"
-
-FILES_${PN}-qtquickcontrols = " \
-    ${OE_QMAKE_PATH_TRANSLATIONS}/qtquickcontrols_*.qm \
-"
-
-FILES_${PN}-qtxmlpatterns = " \
-    ${OE_QMAKE_PATH_TRANSLATIONS}/qtxmlpatterns_*.qm \
-"
-
-FILES_${PN}-qtconfig = " \
-    ${OE_QMAKE_PATH_TRANSLATIONS}/qtconfig_*.qm \
-"
-
-FILES_${PN}-qtquick1 = " \
-    ${OE_QMAKE_PATH_TRANSLATIONS}/qtquick1_*.qm \
-"
-
-FILES_${PN}-qtscript = " \
-    ${OE_QMAKE_PATH_TRANSLATIONS}/qtscript_*.qm \
-"
-
-FILES_${PN}-qtbase = " \
-    ${OE_QMAKE_PATH_TRANSLATIONS}/qtbase_*.qm \
-"
-
-FILES_${PN}-qthelp = " \
-    ${OE_QMAKE_PATH_TRANSLATIONS}/qt_help_*.qm \
-"
-
-FILES_${PN}-qt = " \
-    ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
-"
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index a16b6ff..b5fd345 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -1,4 +1,96 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
+
+LICENSE = "(LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+"
+
+DEPENDS += "qtbase qttools-native"
+
+PACKAGES =. " \
+    ${PN}-assistant \
+    ${PN}-designer \
+    ${PN}-linguist \
+    ${PN}-qmlviewer \
+    ${PN}-qtconnectivity \
+    ${PN}-qtmultimedia \
+    ${PN}-qtlocation \
+    ${PN}-qtdeclarative \
+    ${PN}-qtquickcontrols \
+    ${PN}-qtxmlpatterns \
+    ${PN}-qtconfig \
+    ${PN}-qtquick1 \
+    ${PN}-qtscript \
+    ${PN}-qtbase \
+    ${PN}-qthelp \
+    ${PN}-qt \
+"
+
+FILES_${PN}-assistant = " \
+    ${OE_QMAKE_PATH_TRANSLATIONS}/assistant_*.qm \
+"
+
+FILES_${PN}-designer = " \
+    ${OE_QMAKE_PATH_TRANSLATIONS}/designer_*.qm \
+"
+
+FILES_${PN}-linguist = " \
+    ${OE_QMAKE_PATH_TRANSLATIONS}/linguist_*.qm \
+"
+
+FILES_${PN}-qmlviewer = " \
+    ${OE_QMAKE_PATH_TRANSLATIONS}/qmlviewer_*.qm \
+"
+
+FILES_${PN}-qtconnectivity = " \
+    ${OE_QMAKE_PATH_TRANSLATIONS}/qtconnectivity_*.qm \
+"
+
+FILES_${PN}-qtmultimedia = " \
+    ${OE_QMAKE_PATH_TRANSLATIONS}/qtmultimedia_*.qm \
+"
+
+FILES_${PN}-qtlocation = " \
+    ${OE_QMAKE_PATH_TRANSLATIONS}/qtlocation_*.qm \
+"
+
+FILES_${PN}-qtdeclarative = " \
+    ${OE_QMAKE_PATH_TRANSLATIONS}/qtdeclarative_*.qm \
+"
+
+FILES_${PN}-qtquickcontrols = " \
+    ${OE_QMAKE_PATH_TRANSLATIONS}/qtquickcontrols_*.qm \
+"
+
+FILES_${PN}-qtxmlpatterns = " \
+    ${OE_QMAKE_PATH_TRANSLATIONS}/qtxmlpatterns_*.qm \
+"
+
+FILES_${PN}-qtconfig = " \
+    ${OE_QMAKE_PATH_TRANSLATIONS}/qtconfig_*.qm \
+"
+
+FILES_${PN}-qtquick1 = " \
+    ${OE_QMAKE_PATH_TRANSLATIONS}/qtquick1_*.qm \
+"
+
+FILES_${PN}-qtscript = " \
+    ${OE_QMAKE_PATH_TRANSLATIONS}/qtscript_*.qm \
+"
+
+FILES_${PN}-qtbase = " \
+    ${OE_QMAKE_PATH_TRANSLATIONS}/qtbase_*.qm \
+"
+
+FILES_${PN}-qthelp = " \
+    ${OE_QMAKE_PATH_TRANSLATIONS}/qt_help_*.qm \
+"
+
+FILES_${PN}-qt = " \
+    ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
+"
 
 SRCREV = "1224b6890e0b0971e5eeea9f52d806f1890de0ed"
diff --git a/recipes-qt/qt5/qtwayland-native.inc b/recipes-qt/qt5/qtwayland-native.inc
deleted file mode 100644
index b6af19e..0000000
--- a/recipes-qt/qt5/qtwayland-native.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-require qt5-native.inc
-
-QT_MODULE = "${BPN}"
-
-DEPENDS = "qtbase-native wayland-native"
-
-SRC_URI += " \
-    file://0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch \
-"
-
-do_configure() {
-    ${OE_QMAKE_QMAKE} ${OE_QMAKE_DEBUG_OUTPUT} -r ${S}/src/qtwaylandscanner
-}
-
-do_install() {
-    oe_runmake install INSTALL_ROOT=${D}
-}
-
-# There are no LGPLv3-only licensed files in this component.
-LICENSE = "BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index 3be3e51..3ae35b4 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -1,4 +1,29 @@
+require qt5-native.inc
 require qt5-git.inc
-require ${PN}.inc
+
+# There are no LGPLv3-only licensed files in this component.
+LICENSE = "BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+"
+
+QT_MODULE = "${BPN}"
+
+DEPENDS = "qtbase-native wayland-native"
+
+SRC_URI += " \
+    file://0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch \
+"
+
+do_configure() {
+    ${OE_QMAKE_QMAKE} ${OE_QMAKE_DEBUG_OUTPUT} -r ${S}/src/qtwaylandscanner
+}
+
+do_install() {
+    oe_runmake install INSTALL_ROOT=${D}
+}
 
 SRCREV = "d5e7965a87d81e2d7157c785403b0aba681de62a"
diff --git a/recipes-qt/qt5/qtwayland.inc b/recipes-qt/qt5/qtwayland.inc
deleted file mode 100644
index d126b04..0000000
--- a/recipes-qt/qt5/qtwayland.inc
+++ /dev/null
@@ -1,31 +0,0 @@
-require qt5.inc
-
-# wayland-native is already in wayland DEPENDS, but add it here
-# explicitly, because it's native wayland-scanner we're looking for
-# libxkbcommon isn't mandatory make it easier to remove by .bbappend
-# (e.g. for building qtwayland with danny which doesn't have libxkbcommon in oe-core).
-XKB_DEPENDS = "libxkbcommon xproto"
-DEPENDS += "qtbase qtdeclarative wayland wayland-native qtwayland-native ${XKB_DEPENDS}"
-
-QT_WAYLAND_CONFIG ?= "wayland-compositor"
-QT_WAYLAND_DEFINES ?= ""
-QT_WAYLAND_BUILD_PARTS ?= "examples"
-
-EXTRA_QMAKEVARS_PRE += "CONFIG+=${QT_WAYLAND_CONFIG}"
-EXTRA_QMAKEVARS_PRE += "DEFINES+=${QT_WAYLAND_DEFINES}"
-EXTRA_QMAKEVARS_PRE += "QT_BUILD_PARTS+=${QT_WAYLAND_BUILD_PARTS}"
-
-FILES_${PN}-plugins += " \
-    ${OE_QMAKE_PATH_PLUGINS}/*/*/*${SOLIBSDEV} \
-"
-
-FILES_${PN}-plugins-dbg += " \
-    ${OE_QMAKE_PATH_PLUGINS}/*/*/.debug/* \
-"
-
-# There are no LGPLv3-only licensed files in this component.
-LICENSE = "BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
-                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
-                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 93ef54a..7f1388d 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -1,7 +1,37 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
 
-SRCREV = "d5e7965a87d81e2d7157c785403b0aba681de62a"
+# There are no LGPLv3-only licensed files in this component.
+LICENSE = "BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+"
+
+# wayland-native is already in wayland DEPENDS, but add it here
+# explicitly, because it's native wayland-scanner we're looking for
+# libxkbcommon isn't mandatory make it easier to remove by .bbappend
+# (e.g. for building qtwayland with danny which doesn't have libxkbcommon in oe-core).
+XKB_DEPENDS = "libxkbcommon xproto"
+DEPENDS += "qtbase qtdeclarative wayland wayland-native qtwayland-native ${XKB_DEPENDS}"
+
+QT_WAYLAND_CONFIG ?= "wayland-compositor"
+QT_WAYLAND_DEFINES ?= ""
+QT_WAYLAND_BUILD_PARTS ?= "examples"
+
+EXTRA_QMAKEVARS_PRE += "CONFIG+=${QT_WAYLAND_CONFIG}"
+EXTRA_QMAKEVARS_PRE += "DEFINES+=${QT_WAYLAND_DEFINES}"
+EXTRA_QMAKEVARS_PRE += "QT_BUILD_PARTS+=${QT_WAYLAND_BUILD_PARTS}"
+
+FILES_${PN}-plugins += " \
+    ${OE_QMAKE_PATH_PLUGINS}/*/*/*${SOLIBSDEV} \
+"
+
+FILES_${PN}-plugins-dbg += " \
+    ${OE_QMAKE_PATH_PLUGINS}/*/*/.debug/* \
+"
 
 SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
@@ -14,3 +44,5 @@ do_install_append() {
     install ${B}/include/QtCompositor/${QT_VERSION}/QtCompositor/private/qwayland-server-*.h ${D}${OE_QMAKE_PATH_QT_HEADERS}/QtCompositor/${QT_VERSION}/QtCompositor/private
     install ${B}/include/QtCompositor/${QT_VERSION}/QtCompositor/private/*protocol*.h ${D}${OE_QMAKE_PATH_QT_HEADERS}/QtCompositor/${QT_VERSION}/QtCompositor/private
 }
+
+SRCREV = "d5e7965a87d81e2d7157c785403b0aba681de62a"
diff --git a/recipes-qt/qt5/qtwebchannel.inc b/recipes-qt/qt5/qtwebchannel.inc
deleted file mode 100644
index f31a4b9..0000000
--- a/recipes-qt/qt5/qtwebchannel.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-require qt5.inc
-
-DEPENDS += "qtdeclarative qtwebsockets"
-
-# There are no LGPLv3-only licensed files in this component.
-# There are no GPLv2 licensed files in this component.
-LIC_FILES_CHKSUM = "file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
-                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
-                    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-"
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index 30fcde8..a800883 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -1,4 +1,16 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
+
+# There are no LGPLv3-only licensed files in this component.
+# There are no GPLv2 licensed files in this component.
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+"
+
+DEPENDS += "qtdeclarative qtwebsockets"
 
 SRCREV = "358e5acba3154a8ab4b53b22797c2c1eae4707dc"
diff --git a/recipes-qt/qt5/qtwebengine.inc b/recipes-qt/qt5/qtwebengine.inc
deleted file mode 100644
index 4a5b0e8..0000000
--- a/recipes-qt/qt5/qtwebengine.inc
+++ /dev/null
@@ -1,69 +0,0 @@
-SUMMARY = "QtWebEngine combines the power of Chromium and Qt"
-LICENSE = "LGPL-3.0 & BSD"
-LIC_FILES_CHKSUM = " \
-    file://src/core/browser_context_qt.cpp;md5=91895ac1852e1b07202d9716194e8dd8;beginline=1;endline=35 \
-    file://src/3rdparty/chromium/LICENSE;md5=537e0b52077bf0a616d0a0c8a79bc9d5 \
-    file://LICENSE.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-"
-DEPENDS += " \
-    ninja-native \
-    qtbase qtdeclarative qtxmlpatterns qtquickcontrols \
-    libdrm fontconfig pixman openssl pango cairo icu pciutils \
-    libcap \
-"
-
-COMPATIBLE_MACHINE = "(-)"
-COMPATIBLE_MACHINE_i586 = "(.*)"
-COMPATIBLE_MACHINE_x86-64 = "(.*)"
-COMPATIBLE_MACHINE_armv6 = "(.*)"
-COMPATIBLE_MACHINE_armv7a = "(.*)"
-
-inherit qmake5
-inherit gettext
-inherit pythonnative
-inherit perlnative
-
-require recipes-qt/qt5/qt5.inc
-
-# To avoid trouble start with not separated build directory
-SEPB = "${S}"
-B = "${SEPB}"
-
-# Project ERROR: Missing CMake tests. Either create tests in tests/auto/cmake, or disable cmake config file creation with CONFIG-=create_cmake.
-EXTRA_QMAKEVARS_POST += "CONFIG-=create_cmake"
-
-export NINJA_PATH="${STAGING_BINDIR_NATIVE}/ninja"
-
-do_configure() {
-    # replace LD with CXX, to workaround a possible gyp inheritssue?
-    export LD="${CXX}"
-    export CC="${CC}"
-    export CXX="${CXX}"
-    export CC_host="gcc"
-    export CXX_host="g++"
-    export QMAKE_MAKE_ARGS="${EXTRA_OEMAKE}"
-
-    # qmake can't find the OE_QMAKE_* variables on it's own so directly passing them as
-    # arguments here
-    ${OE_QMAKE_QMAKE} -r ${EXTRA_QMAKEVARS_PRE} QTWEBENGINE_ROOT="${S}" \
-        QMAKE_CXX="${OE_QMAKE_CXX}" QMAKE_CC="${OE_QMAKE_CC}" \
-        QMAKE_LINK="${OE_QMAKE_LINK}" \
-        QMAKE_CFLAGS="${OE_QMAKE_CFLAGS}" \
-        QMAKE_CXXFLAGS="${OE_QMAKE_CXXFLAGS}" \
-        QMAKE_AR="${OE_QMAKE_AR}" \
-        -after ${EXTRA_QMAKEVARS_POST}
-}
-
-do_install_append() {
-    rmdir ${D}${OE_QMAKE_PATH_PLUGINS}/${BPN} ${D}${OE_QMAKE_PATH_PLUGINS} || true
-}
-PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
-
-# for /usr/share/qt5/qtwebengine_resources.pak
-FILES_${PN} += "${OE_QMAKE_PATH_QT_TRANSLATIONS} ${OE_QMAKE_PATH_QT_DATA}"
-
-RDEPENDS_${PN}-examples += " \
-    ${PN}-qmlplugins \
-    qtquickcontrols-qmlplugins \
-    qtdeclarative-qmlplugins \
-"
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 81c5333..c14a556 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -1,5 +1,75 @@
+SUMMARY = "QtWebEngine combines the power of Chromium and Qt"
+
+LICENSE = "LGPL-3.0 & BSD"
+LIC_FILES_CHKSUM = " \
+    file://src/core/browser_context_qt.cpp;md5=91895ac1852e1b07202d9716194e8dd8;beginline=1;endline=35 \
+    file://src/3rdparty/chromium/LICENSE;md5=537e0b52077bf0a616d0a0c8a79bc9d5 \
+    file://LICENSE.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+"
+
+DEPENDS += " \
+    ninja-native \
+    qtbase qtdeclarative qtxmlpatterns qtquickcontrols \
+    libdrm fontconfig pixman openssl pango cairo icu pciutils \
+    libcap \
+"
+
+COMPATIBLE_MACHINE = "(-)"
+COMPATIBLE_MACHINE_i586 = "(.*)"
+COMPATIBLE_MACHINE_x86-64 = "(.*)"
+COMPATIBLE_MACHINE_armv6 = "(.*)"
+COMPATIBLE_MACHINE_armv7a = "(.*)"
+
+inherit qmake5
+inherit gettext
+inherit pythonnative
+inherit perlnative
+
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
+
+# To avoid trouble start with not separated build directory
+SEPB = "${S}"
+B = "${SEPB}"
+
+# Project ERROR: Missing CMake tests. Either create tests in tests/auto/cmake, or disable cmake config file creation with CONFIG-=create_cmake.
+EXTRA_QMAKEVARS_POST += "CONFIG-=create_cmake"
+
+export NINJA_PATH="${STAGING_BINDIR_NATIVE}/ninja"
+
+do_configure() {
+    # replace LD with CXX, to workaround a possible gyp inheritssue?
+    export LD="${CXX}"
+    export CC="${CC}"
+    export CXX="${CXX}"
+    export CC_host="gcc"
+    export CXX_host="g++"
+    export QMAKE_MAKE_ARGS="${EXTRA_OEMAKE}"
+
+    # qmake can't find the OE_QMAKE_* variables on it's own so directly passing them as
+    # arguments here
+    ${OE_QMAKE_QMAKE} -r ${EXTRA_QMAKEVARS_PRE} QTWEBENGINE_ROOT="${S}" \
+        QMAKE_CXX="${OE_QMAKE_CXX}" QMAKE_CC="${OE_QMAKE_CC}" \
+        QMAKE_LINK="${OE_QMAKE_LINK}" \
+        QMAKE_CFLAGS="${OE_QMAKE_CFLAGS}" \
+        QMAKE_CXXFLAGS="${OE_QMAKE_CXXFLAGS}" \
+        QMAKE_AR="${OE_QMAKE_AR}" \
+        -after ${EXTRA_QMAKEVARS_POST}
+}
+
+do_install_append() {
+    rmdir ${D}${OE_QMAKE_PATH_PLUGINS}/${BPN} ${D}${OE_QMAKE_PATH_PLUGINS} || true
+}
+PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
+
+# for /usr/share/qt5/qtwebengine_resources.pak
+FILES_${PN} += "${OE_QMAKE_PATH_QT_TRANSLATIONS} ${OE_QMAKE_PATH_QT_DATA}"
+
+RDEPENDS_${PN}-examples += " \
+    ${PN}-qmlplugins \
+    qtquickcontrols-qmlplugins \
+    qtdeclarative-qmlplugins \
+"
 
 QT_MODULE_BRANCH = "5.4"
 QT_MODULE_BRANCH_CHROMIUM = "37.0.2062-based"
diff --git a/recipes-qt/qt5/qtwebkit-examples.inc b/recipes-qt/qt5/qtwebkit-examples.inc
deleted file mode 100644
index 317fabb..0000000
--- a/recipes-qt/qt5/qtwebkit-examples.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-require qt5.inc
-
-# There are no LGPLv3-only licensed files in this component.
-# There are no GPLv2 licensed files in this component.
-LIC_FILES_CHKSUM = "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
-                    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://examples/webkitwidgets/scroller/wheel/main.cpp;endline=112;md5=6f92d041824c63426993c8ce3ae0eb77 \
-                    file://examples/webkitwidgets/imageanalyzer/imageanalyzer.cpp;endline=223;md5=13ffb472fefe4bdf6464954a22251f35"
-
-SRC_URI += " \
-    file://0001-qtwebkit-examples-enable-building-examples-by-defaul.patch \
-"
-
-DEPENDS += "qtwebkit"
-RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
-RDEPENDS_${PN}-examples += "${@base_contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', '', d)}"
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 7225ae5..7ae9fc7 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -1,4 +1,23 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
+
+# There are no LGPLv3-only licensed files in this component.
+# There are no GPLv2 licensed files in this component.
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+    file://examples/webkitwidgets/scroller/wheel/main.cpp;endline=112;md5=6f92d041824c63426993c8ce3ae0eb77 \
+    file://examples/webkitwidgets/imageanalyzer/imageanalyzer.cpp;endline=223;md5=13ffb472fefe4bdf6464954a22251f35 \
+"
+
+SRC_URI += " \
+    file://0001-qtwebkit-examples-enable-building-examples-by-defaul.patch \
+"
+
+DEPENDS += "qtwebkit"
+RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
+RDEPENDS_${PN}-examples += "${@base_contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', '', d)}"
 
 SRCREV = "734663277730bc20dacf0a6b07427002a53cc107"
diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
deleted file mode 100644
index 38f2b2b..0000000
--- a/recipes-qt/qt5/qtwebkit.inc
+++ /dev/null
@@ -1,61 +0,0 @@
-require qt5.inc
-
-LICENSE = "BSD & LGPLv2+ | GPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
-                    file://Source/WebCore/rendering/RenderApplet.h;endline=22;md5=fb9694013ad71b78f8913af7a5959680 \
-                    file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
-                    file://Source/JavaScriptCore/parser/Parser.h;endline=21;md5=bd69f72183a7af673863f057576e21ee"
-
-DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt leveldb"
-
-# qemuarm build fails with:
-# | {standard input}: Assembler messages:
-# | {standard input}:106: Error: invalid immediate: 983040 is out of range
-# | {standard input}:106: Error: value of 983040 too large for field of 2 bytes at 146
-ARM_INSTRUCTION_SET = "arm"
-
-SRC_URI += "\
-    file://0001-qtwebkit-fix-QA-issue-bad-RPATH.patch \
-    file://0002-Remove-TEXTREL-tag-in-x86.patch \
-"
-
-PACKAGECONFIG ??= "gstreamer qtlocation qtmultimedia qtsensors qtwebchannel"
-PACKAGECONFIG[gstreamer] = "OE_GSTREAMER_ENABLED,,gstreamer1.0 gstreamer1.0-plugins-base"
-PACKAGECONFIG[gstreamer010] = "OE_GSTREAMER010_ENABLED,,gstreamer gst-plugins-base"
-PACKAGECONFIG[qtlocation] = "OE_QTLOCATION_ENABLED,,qtlocation"
-PACKAGECONFIG[qtmultimedia] = "OE_QTMULTIMEDIA_ENABLED,,qtmultimedia"
-PACKAGECONFIG[qtsensors] = "OE_QTSENSORS_ENABLED,,qtsensors"
-PACKAGECONFIG[qtwebchannel] = "OE_QTWEBCHANNEL_ENABLED,,qtwebchannel"
-PACKAGECONFIG[libwebp] = "OE_LIBWEBP_ENABLED,,libwebp"
-
-do_configure_prepend() {
-    export QMAKE_CACHE_EVAL="CONFIG+=${EXTRA_OECONF}"
-    # disable gstreamer-1.0 test if it isn't enabled by PACKAGECONFIG
-    sed -e 's/\s\(packagesExist(".*\<gstreamer-1.0\>.*")\)/ OE_GSTREAMER_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
-    # disable gstreamer-0.10 test if it isn't enabled by PACKAGECONFIG
-    sed -e 's/\s\(packagesExist(".*\<gstreamer-0.10\>.*")\)/ OE_GSTREAMER010_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
-    # disable qtlocation test if it isn't enabled by PACKAGECONFIG
-    sed -e 's/\s\(qtHaveModule(positioning)\)/ OE_QTLOCATION_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
-    # disable qtmultimedia test if it isn't enabled by PACKAGECONFIG
-    sed -e 's/(video):\(qtHaveModule(multimediawidgets)\)/(video):OE_QTMULTIMEDIA_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
-    # disable qtsensors test if it isn't enabled by PACKAGECONFIG
-    sed -e 's/\s\(qtHaveModule(sensors)\)/ OE_QTSENSORS_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
-    # disable qtwebchannel test if it isn't enabled by PACKAGECONFIG
-    sed -e 's/\s\(qtHaveModule(webchannel)\)/ OE_QTWEBCHANNEL_ENABLED:\1/' -i ${S}/Source/WebKit2/Target.pri
-    sed -e 's/\s\(qtHaveModule(webchannel)\)/ OE_QTWEBCHANNEL_ENABLED:\1/' -i ${S}/Source/WebKit2/WebKit2.pri
-    # disable libwebp test if it isn't enabled by PACKAGECONFIG
-    sed -e 's/\s\(config_libwebp: \)/ OE_LIBWEBP_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
-}
-
-# qtwebkit gets terribly big when linking with all debug info, disable by default
-QTWEBKIT_DEBUG = "QMAKE_CFLAGS+=-g0 QMAKE_CXXFLAGS+=-g0"
-EXTRA_QMAKEVARS_PRE += "${QTWEBKIT_DEBUG}"
-
-# remove default ${PN}-examples-dbg ${PN}-examples set in qt5.inc, because it conflicts with ${PN} from separate webkit-examples recipe
-PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN} ${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs "
-
-# make sure rb files are used from sysroot, not from host
-# ruby-1.9.3-always-use-i386.patch is doing target_cpu=`echo $target_cpu | sed s/i.86/i386/`
-# we need to replace it too (a bit longer version without importing re)
-RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
-export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 3d39178..085f35d 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -1,4 +1,66 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
+
+LICENSE = "BSD & LGPLv2+ | GPL-2.0"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+    file://Source/WebCore/rendering/RenderApplet.h;endline=22;md5=fb9694013ad71b78f8913af7a5959680 \
+    file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
+    file://Source/JavaScriptCore/parser/Parser.h;endline=21;md5=bd69f72183a7af673863f057576e21ee \
+"
+
+DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt leveldb"
+
+# qemuarm build fails with:
+# | {standard input}: Assembler messages:
+# | {standard input}:106: Error: invalid immediate: 983040 is out of range
+# | {standard input}:106: Error: value of 983040 too large for field of 2 bytes at 146
+ARM_INSTRUCTION_SET = "arm"
+
+SRC_URI += "\
+    file://0001-qtwebkit-fix-QA-issue-bad-RPATH.patch \
+    file://0002-Remove-TEXTREL-tag-in-x86.patch \
+"
+
+PACKAGECONFIG ??= "gstreamer qtlocation qtmultimedia qtsensors qtwebchannel"
+PACKAGECONFIG[gstreamer] = "OE_GSTREAMER_ENABLED,,gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[gstreamer010] = "OE_GSTREAMER010_ENABLED,,gstreamer gst-plugins-base"
+PACKAGECONFIG[qtlocation] = "OE_QTLOCATION_ENABLED,,qtlocation"
+PACKAGECONFIG[qtmultimedia] = "OE_QTMULTIMEDIA_ENABLED,,qtmultimedia"
+PACKAGECONFIG[qtsensors] = "OE_QTSENSORS_ENABLED,,qtsensors"
+PACKAGECONFIG[qtwebchannel] = "OE_QTWEBCHANNEL_ENABLED,,qtwebchannel"
+PACKAGECONFIG[libwebp] = "OE_LIBWEBP_ENABLED,,libwebp"
+
+do_configure_prepend() {
+    export QMAKE_CACHE_EVAL="CONFIG+=${EXTRA_OECONF}"
+    # disable gstreamer-1.0 test if it isn't enabled by PACKAGECONFIG
+    sed -e 's/\s\(packagesExist(".*\<gstreamer-1.0\>.*")\)/ OE_GSTREAMER_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
+    # disable gstreamer-0.10 test if it isn't enabled by PACKAGECONFIG
+    sed -e 's/\s\(packagesExist(".*\<gstreamer-0.10\>.*")\)/ OE_GSTREAMER010_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
+    # disable qtlocation test if it isn't enabled by PACKAGECONFIG
+    sed -e 's/\s\(qtHaveModule(positioning)\)/ OE_QTLOCATION_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
+    # disable qtmultimedia test if it isn't enabled by PACKAGECONFIG
+    sed -e 's/(video):\(qtHaveModule(multimediawidgets)\)/(video):OE_QTMULTIMEDIA_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
+    # disable qtsensors test if it isn't enabled by PACKAGECONFIG
+    sed -e 's/\s\(qtHaveModule(sensors)\)/ OE_QTSENSORS_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
+    # disable qtwebchannel test if it isn't enabled by PACKAGECONFIG
+    sed -e 's/\s\(qtHaveModule(webchannel)\)/ OE_QTWEBCHANNEL_ENABLED:\1/' -i ${S}/Source/WebKit2/Target.pri
+    sed -e 's/\s\(qtHaveModule(webchannel)\)/ OE_QTWEBCHANNEL_ENABLED:\1/' -i ${S}/Source/WebKit2/WebKit2.pri
+    # disable libwebp test if it isn't enabled by PACKAGECONFIG
+    sed -e 's/\s\(config_libwebp: \)/ OE_LIBWEBP_ENABLED:\1/' -i ${S}/Tools/qmake/mkspecs/features/features.prf
+}
+
+# qtwebkit gets terribly big when linking with all debug info, disable by default
+QTWEBKIT_DEBUG = "QMAKE_CFLAGS+=-g0 QMAKE_CXXFLAGS+=-g0"
+EXTRA_QMAKEVARS_PRE += "${QTWEBKIT_DEBUG}"
+
+# remove default ${PN}-examples-dbg ${PN}-examples set in qt5.inc, because it conflicts with ${PN} from separate webkit-examples recipe
+PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN} ${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs "
+
+# make sure rb files are used from sysroot, not from host
+# ruby-1.9.3-always-use-i386.patch is doing target_cpu=`echo $target_cpu | sed s/i.86/i386/`
+# we need to replace it too (a bit longer version without importing re)
+RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
+export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
 
 SRCREV = "738ad7e37c66f2afdbc7a77aff3ab7fa510361a2"
diff --git a/recipes-qt/qt5/qtwebsockets.inc b/recipes-qt/qt5/qtwebsockets.inc
deleted file mode 100644
index 5fb149a..0000000
--- a/recipes-qt/qt5/qtwebsockets.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-require qt5.inc
-
-DEPENDS += "qtbase qtdeclarative"
-
-LICENSE = "GFDL-1.3 & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c \
-                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
-                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
-                    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
-"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 4c96e25..9cd69b1 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -1,4 +1,14 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
+
+LICENSE = "GFDL-1.3 & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE;md5=4fbd65380cdd255951079008b364516c \
+    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+"
+
+DEPENDS += "qtbase qtdeclarative"
 
 SRCREV = "5b469aa3c4d6b9c68feb9cf92d03614077518894"
diff --git a/recipes-qt/qt5/qtx11extras.inc b/recipes-qt/qt5/qtx11extras.inc
deleted file mode 100644
index 40e1d5c..0000000
--- a/recipes-qt/qt5/qtx11extras.inc
+++ /dev/null
@@ -1,6 +0,0 @@
-require qt5.inc
-
-DEPENDS += "qtbase"
-
-LICENSE += "| GPL-2.0"
-LIC_FILES_CHKSUM += "file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index 63ccdcb..d286570 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -1,4 +1,15 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
+
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+"
+
+DEPENDS += "qtbase"
 
 SRCREV = "bcc86311359e138ecc3a8fc1ce6eee1cda2ec0f5"
diff --git a/recipes-qt/qt5/qtxmlpatterns.inc b/recipes-qt/qt5/qtxmlpatterns.inc
deleted file mode 100644
index ce2eee4..0000000
--- a/recipes-qt/qt5/qtxmlpatterns.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-require qt5.inc
-
-# There are no LGPLv3-only licensed files in this component.
-DEPENDS += "qtbase"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 3bdbbdc..8b58c5a 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -1,4 +1,15 @@
+require qt5.inc
 require qt5-git.inc
-require ${PN}.inc
+
+# There are no LGPLv3-only licensed files in this component.
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+"
+
+DEPENDS += "qtbase"
 
 SRCREV = "db784fb1c01ca2a0e7ada2c407cd1aab3aa98fee"
-- 
2.4.1


