Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJW0D-0002sT-RJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 21:20:23 +0200
Received: by mail-yw0-f47.google.com with SMTP id 8so2079853ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 12:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=quBU2L4DyW+a4dtHAiOeyUJXbVQboRmvcgB2NkrLT9g=;
	b=vOqOs7EdMNx0lDl6tOtj3ReTvVeS2LR+Ne1tBnPC03jbSTl1SQ3vDHmYnqgmHcFISS
	SpmFknaF29NtlKYW23CzdmU2dxNIEgHoUIKzgtFX5gHmSzXHG6ivZsAQP7XSj0uQAOtj
	t6+8+cnsAfod/pGs+3qkZYjm2xyVu9XHeApxM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=BioQIaIFsB/SdG4DcvPq8CCzJP2fnuHim06FnlQYaxOYePS0d3cP5EjeerVGiixzXf
	0bFdRtHndVRfklxFiQLfgBXS3vEtfwDb46eWrI1pPbrN4xSZxrYvMjPfqGp19zrDPKa8
	IrOl6Zv/ijwKsgnedb/yrSc2L8ZJKlFsELtPk=
Received: by 10.151.40.16 with SMTP id s16mr5715046ybj.123.1304968659258;
	Mon, 09 May 2011 12:17:39 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c3sm1123219ybn.24.2011.05.09.12.17.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2011 12:17:37 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2011 19:16:54 +0000
Message-Id: <1304968617-4949-9-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304968617-4949-1-git-send-email-otavio@ossystems.com.br>
References: <1304968617-4949-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v4 09/12] qt4: drop 4.6 versions
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
X-List-Received-Date: Mon, 09 May 2011 19:20:23 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 ...detection-and-initial-blend-function-.patch.swp |  Bin 16384 -> 0 bytes
 meta-oe/recipes-qt/qt4/qt-4.6.3.inc                |   56 ------------
 .../0006-freetype-host-includes.patch              |   20 -----
 .../qt4/qt4-embedded-4.6.3/0008-qt-lib-infix.patch |   32 -------
 .../0010-no-simpledecoration-example.patch         |   11 ---
 .../recipes-qt/qt4/qt4-embedded-4.6.3/linux.conf   |   54 ------------
 meta-oe/recipes-qt/qt4/qt4-embedded_4.6.3.bb       |    9 --
 meta-oe/recipes-qt/qt4/qt4-tools-native_4.6.3.bb   |   11 ---
 .../recipes-qt/qt4/qt4-tools-nativesdk_4.6.3.bb    |    6 --
 meta-oe/recipes-qt/qt4/qt4-tools-sdk_4.6.3.bb      |   90 --------------------
 .../recipes-qt/qt4/qt4-x11-free-4.6.3/linux.conf   |   54 ------------
 meta-oe/recipes-qt/qt4/qt4-x11-free_4.6.3.bb       |    6 --
 12 files changed, 0 insertions(+), 349 deletions(-)
 delete mode 100644 meta-oe/recipes-qt/qt4/qt-4.6.0/.1165-NEON-configure-detection-and-initial-blend-function-.patch.swp
 delete mode 100644 meta-oe/recipes-qt/qt4/qt-4.6.3.inc
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded-4.6.3/0006-freetype-host-includes.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded-4.6.3/0008-qt-lib-infix.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded-4.6.3/0010-no-simpledecoration-example.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded-4.6.3/linux.conf
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded_4.6.3.bb
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-tools-native_4.6.3.bb
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-tools-nativesdk_4.6.3.bb
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-tools-sdk_4.6.3.bb
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free-4.6.3/linux.conf
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free_4.6.3.bb

diff --git a/meta-oe/recipes-qt/qt4/qt-4.6.0/.1165-NEON-configure-detection-and-initial-blend-function-.patch.swp b/meta-oe/recipes-qt/qt4/qt-4.6.0/.1165-NEON-configure-detection-and-initial-blend-function-.patch.swp
deleted file mode 100644
index 5a11254f65420e59bfc4e9ebaf0ee32b12638a2c..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 16384
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
NMaJ{pus5<B_8;X>rThQ@

diff --git a/meta-oe/recipes-qt/qt4/qt-4.6.3.inc b/meta-oe/recipes-qt/qt4/qt-4.6.3.inc
deleted file mode 100644
index a41b483..0000000
--- a/meta-oe/recipes-qt/qt4/qt-4.6.3.inc
+++ /dev/null
@@ -1,56 +0,0 @@
-LICENSE = "LGPLv2.1 | GPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
-                    file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
-                    file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
-
-SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
-           file://0001-cross-compile.patch \
-           file://0002-fix-resinit-declaration.patch \
-           file://0004-no-qmake.patch \
-           file://0006-freetype-host-includes.patch \
-           file://0008-qt-lib-infix.patch \
-           file://0009-support-2bpp.patch \
-           file://0010-no-simpledecoration-example.patch \
-           file://fix-config-tests.patch \
-           file://qt-config.patch \
-           file://g++.conf \
-           file://linux.conf \
-           file://hack-out-pg_config.patch \
-           file://mips-relocate.patch \
-           "
-
-SRC_URI[md5sum] = "5c69f16d452b0bb3d44bc3c10556c072"
-SRC_URI[sha256sum] = "f4e0ada8d4d516bbb8600a3ee7d9046c9c79e38cd781df9ffc46d8f16acd1768"
-
-S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
-
-do_configure_prepend() {
-    for pro in $(find ${S} -name "*.pro") ; do
-        sed -i 's:$$QT_BUILD_TREE/bin/lrelease:${OE_QMAKE_LRELEASE}:g' $pro
-    done
-
-    sed -i s:SEDME:${S}: ${WORKDIR}/linux.conf
-    sed -i \
-    -e /QMAKE_MOC\ /d \
-    -e /QMAKE_UIC\ /d \
-    -e /QMAKE_UIC3\ /d \
-    -e /QMAKE_RCC\ /d \
-    ${S}/configure
-}
-
-do_configure_append() {
-    sed -e '/QMAKE_TARGET /d' -e '/TARGET /d' -i ${S}/translations/Makefile
-}
-
-QT_GLFLAGS ?= ""
-QT_CONFIG_FLAGS += " -no-rpath -qt3support -reduce-relocations -silent ${QT_GLFLAGS}"
-
-do_compile() {
-    # Fixup missing wsegl header in some SGX SDKs
-    if ! [ -e ${STAGING_INCDIR}/wsegl.h ] ; then
-        cp src/3rdparty/powervr/wsegl.h src/plugins/gfxdrivers/powervr/QWSWSEGL/
-    fi
-
-    unset CFLAGS CXXFLAGS
-    oe_runmake ${EXTRA_ENV}
-}
diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded-4.6.3/0006-freetype-host-includes.patch b/meta-oe/recipes-qt/qt4/qt4-embedded-4.6.3/0006-freetype-host-includes.patch
deleted file mode 100644
index 987c425..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-embedded-4.6.3/0006-freetype-host-includes.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-From c9ab62bd9a56643574b3ae6e59e0ca776d4860d2 Mon Sep 17 00:00:00 2001
-From: Michael Krelin <hacker@klever.net>
-Date: Mon, 4 Jun 2007 14:48:50 +0200
-Subject: [PATCH] freetype host includes
-
----
- config.tests/unix/freetype/freetype.pri |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-Index: qt-embedded-linux-opensource-src-4.5.0/config.tests/unix/freetype/freetype.pri
-===================================================================
---- qt-embedded-linux-opensource-src-4.5.0.orig/config.tests/unix/freetype/freetype.pri	2009-02-25 22:32:32.000000000 +0100
-+++ qt-embedded-linux-opensource-src-4.5.0/config.tests/unix/freetype/freetype.pri	2009-03-26 17:14:16.000000000 +0100
-@@ -1,5 +1,5 @@
- !cross_compile {
--    TRY_INCLUDEPATHS = /include /usr/include $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
-+    TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
-     # LSB doesn't allow using headers from /include or /usr/include
-     linux-lsb-g++:TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$QMAKE_INCDIR_X11 $$INCLUDEPATH
-     for(p, TRY_INCLUDEPATHS) {
diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded-4.6.3/0008-qt-lib-infix.patch b/meta-oe/recipes-qt/qt4/qt4-embedded-4.6.3/0008-qt-lib-infix.patch
deleted file mode 100644
index 61e60a0..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-embedded-4.6.3/0008-qt-lib-infix.patch
+++ /dev/null
@@ -1,32 +0,0 @@
---- /tmp/uitools.prf	2009-12-01 18:38:22.000000000 +0100
-+++ qt-everywhere-opensource-src-4.6.0/mkspecs/features/uitools.prf	2009-12-01 18:58:16.000000000 +0100
-@@ -3,11 +3,11 @@
- 
- # Include the correct version of the UiLoader library
- symbian: QTUITOOLS_LINKAGE = -lQtUiTools.lib
--else: QTUITOOLS_LINKAGE = -lQtUiTools
-+else: QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}
- 
- CONFIG(debug, debug|release) {
--    mac: QTUITOOLS_LINKAGE = -lQtUiTools_debug
--    win32: QTUITOOLS_LINKAGE = -lQtUiToolsd
-+    mac: QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}_debug
-+    win32: QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}d
- }
- LIBS += $$QTUITOOLS_LINKAGE
- 
---- /tmp/uitools.pro	2009-12-01 18:40:28.000000000 +0100
-+++ qt-everywhere-opensource-src-4.6.0/tools/designer/src/uitools/uitools.pro	2009-12-01 18:59:18.000000000 +0100
-@@ -1,5 +1,5 @@
- TEMPLATE = lib
--TARGET = $$qtLibraryTarget(QtUiTools)
-+TARGET = QtUiTools
- QT += xml
- CONFIG += qt staticlib
- DESTDIR = ../../../../lib
-@@ -43,3 +43,5 @@
-    QMAKE_PKGCONFIG_DESTDIR = pkgconfig
-    QMAKE_PKGCONFIG_REQUIRES += QtXml
- }
-+
-+TARGET = $$qtLibraryTarget($$TARGET$$QT_LIBINFIX) #do this towards the end
diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded-4.6.3/0010-no-simpledecoration-example.patch b/meta-oe/recipes-qt/qt4/qt4-embedded-4.6.3/0010-no-simpledecoration-example.patch
deleted file mode 100644
index fce5bba..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-embedded-4.6.3/0010-no-simpledecoration-example.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- /tmp/qws.pro	2009-12-10 19:30:08.000000000 +0100
-+++ qt-everywhere-opensource-src-4.6.0/examples/qws/qws.pro	2009-12-10 19:30:21.000000000 +0100
-@@ -1,7 +1,7 @@
- TEMPLATE      = subdirs
- # no /dev/fbX
- !qnx:!vxworks:SUBDIRS = framebuffer
--SUBDIRS      += mousecalibration simpledecoration
-+SUBDIRS      += mousecalibration
- 
- # install
- sources.files = $$SOURCES $$HEADERS $$RESOURCES $$FORMS README *.pro
diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded-4.6.3/linux.conf b/meta-oe/recipes-qt/qt4/qt4-embedded-4.6.3/linux.conf
deleted file mode 100644
index 68ae80b..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-embedded-4.6.3/linux.conf
+++ /dev/null
@@ -1,54 +0,0 @@
-#
-# qmake configuration for common linux
-#
-
-QMAKE_CFLAGS_THREAD	+= -D_REENTRANT
-QMAKE_CXXFLAGS_THREAD	+= $$QMAKE_CFLAGS_THREAD
-
-QMAKE_INCDIR          =
-QMAKE_LIBDIR          =
-QMAKE_INCDIR_X11      =
-QMAKE_LIBDIR_X11      =
-QMAKE_INCDIR_QT       = $(OE_QMAKE_INCDIR_QT)
-QMAKE_LIBDIR_QT       = $(OE_QMAKE_LIBDIR_QT)
-QMAKE_INCDIR_OPENGL   =
-QMAKE_LIBDIR_OPENGL   =
-
-
-QMAKE_LIBS            = -Wl,-rpath-link,SEDME/lib -lglib-2.0
-QMAKE_LIBS_DYNLOAD    = -ldl
-QMAKE_LIBS_X11        = $(OE_QMAKE_LIBS_X11)
-QMAKE_LIBS_X11SM      = $(OE_QMAKE_LIBS_X11SM)
-QMAKE_LIBS_NIS        = -lnsl
-QMAKE_LIBS_OPENGL     = -lGLU -lGL
-QMAKE_LIBS_OPENGL_QT  = -lGL
-QMAKE_LIBS_THREAD     = -lpthread
-
-QMAKE_MOC             = $(OE_QMAKE_MOC)
-QMAKE_UIC             = $(OE_QMAKE_UIC)
-QMAKE_UIC3            = $(OE_QMAKE_UIC3)
-QMAKE_RCC             = $(OE_QMAKE_RCC)
-QMAKE_QDBUSCPP2XML    = $(OE_QMAKE_QDBUSCPP2XML)
-QMAKE_QDBUSXML2CPP    = $(OE_QMAKE_QDBUSXML2CPP)
-
-QMAKE_AR              = $(OE_QMAKE_AR) cqs
-QMAKE_OBJCOPY         = ${OBJCOPY}
-QMAKE_RANLIB          =
-
-QMAKE_TAR             = tar -cf
-QMAKE_GZIP            = gzip -9f
-
-QMAKE_COPY            = cp -f
-QMAKE_COPY_FILE       = $(COPY)
-QMAKE_COPY_DIR        = $(COPY) -r
-QMAKE_MOVE            = mv -f
-QMAKE_DEL_FILE        = rm -f
-QMAKE_DEL_DIR         = rmdir
-QMAKE_STRIP           = $(OE_QMAKE_STRIP)
-QMAKE_STRIPFLAGS_LIB += --strip-unneeded
-QMAKE_CHK_DIR_EXISTS  = test -d
-QMAKE_MKDIR           = mkdir -p
-QMAKE_INSTALL_FILE    = install -m 644 -p
-QMAKE_INSTALL_PROGRAM = install -m 755 -p
-
-include(unix.conf)
diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.6.3.bb b/meta-oe/recipes-qt/qt4/qt4-embedded_4.6.3.bb
deleted file mode 100644
index dd662aa..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-embedded_4.6.3.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require qt-${PV}.inc
-require qt4-embedded.inc
-
-SRC_URI += "file://qthelp-lib-qtclucene.patch"
-
-PR = "${INC_PR}.1"
-
-QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
-
diff --git a/meta-oe/recipes-qt/qt4/qt4-tools-native_4.6.3.bb b/meta-oe/recipes-qt/qt4/qt4-tools-native_4.6.3.bb
deleted file mode 100644
index dae8cd1..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-tools-native_4.6.3.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require qt4-tools-native.inc
-
-PR = "${INC_PR}.0"
-
-EXTRA_OECONF += " -no-fast -silent -no-rpath"
-
-TOBUILD := "src/tools/bootstrap ${TOBUILD}"
-
-SRC_URI[md5sum] = "5c69f16d452b0bb3d44bc3c10556c072"
-SRC_URI[sha256sum] = "f4e0ada8d4d516bbb8600a3ee7d9046c9c79e38cd781df9ffc46d8f16acd1768"
-
diff --git a/meta-oe/recipes-qt/qt4/qt4-tools-nativesdk_4.6.3.bb b/meta-oe/recipes-qt/qt4/qt4-tools-nativesdk_4.6.3.bb
deleted file mode 100644
index d64542b..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-tools-nativesdk_4.6.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require qt4-tools-nativesdk.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "5c69f16d452b0bb3d44bc3c10556c072"
-SRC_URI[sha256sum] = "f4e0ada8d4d516bbb8600a3ee7d9046c9c79e38cd781df9ffc46d8f16acd1768"
diff --git a/meta-oe/recipes-qt/qt4/qt4-tools-sdk_4.6.3.bb b/meta-oe/recipes-qt/qt4/qt4-tools-sdk_4.6.3.bb
deleted file mode 100644
index 5913507..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-tools-sdk_4.6.3.bb
+++ /dev/null
@@ -1,90 +0,0 @@
-DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
-DEPENDS = "zlib-native dbus-native"
-SECTION = "libs"
-HOMEPAGE = "http://www.trolltech.com"
-PRIORITY = "optional"
-LICENSE = "LGPLv2.1 GPLv3"
-
-PR = "r1"
-
-DEFAULT_PREFERENCE = "-1"
-inherit nativesdk
-
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
-           file://configure-lflags.patch \
-           file://compile.test-lflags.patch \
-           file://qt-config.patch \
-           file://g++.conf \
-           file://linux.conf"
-
-S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
-
-
-# FIXME: make it work with "${STAGING_BINDIR_NATIVE}/pkg-config --cflags dbus-1"
-EXTRA_OECONF = "-prefix ${prefix} \
-                -qt-libjpeg -qt-gif -system-zlib \
-                -no-libjpeg -no-libpng \
-                -no-accessibility \
-                -no-cups \
-                -no-exceptions  \
-                -no-nas-sound \
-                -no-nis \
-                -verbose -release -fast -static \
-                -qt3support \
-                -I${STAGING_DIR_NATIVE}/usr/include \
-                -I${STAGING_DIR_NATIVE}/usr/include/freetype2 \
-                -I${STAGING_DIR_NATIVE}/usr/include/dbus-1.0 \
-                -I${STAGING_DIR_NATIVE}/usr/lib/dbus-1.0/include"
-
-# yank default -e, otherwise we get the following error:
-# moc_qbuffer.cpp: No such file or directory
-EXTRA_OEMAKE = " "
-
-do_configure() {
-   (echo o; echo yes) | ./configure ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
-}
-
-TOBUILD = "\
-  src/tools/bootstrap \
-  src/tools/moc \
-  src/corelib \
-  src/sql \
-  src/dbus \
-  src/qt3support \
-  src/xml \
-  src/tools/uic \
-  src/tools/rcc \
-  src/network \
-  src/gui \
-  src/tools/uic3 \
-  tools/linguist/lrelease \
-  tools/linguist/lupdate \
-  tools/qdbus \
-"
-
-do_compile() {
-    for i in ${TOBUILD}; do
-        cd ${S}/$i && oe_runmake CC="${CC}" CXX="${CXX}"
-    done
-}
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 bin/qmake ${D}${bindir}/qmake2
-    for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do
-        install -m 0755 bin/${i} ${D}${bindir}/${i}4
-    done
-
-	(cd ${D}${bindir}; \
-	ln -s qmake2 qmake; \
-	for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do \
-		ln -s ${i}4 ${i}; \
-	done)
-
-	# make a symbolic link to mkspecs for compatibility with Nokia's SDK
-	# and QTCreator
-	(cd ${D}${bindir}/..; ln -s ${TARGET_SYS}/usr/share/qtopia/mkspecs mkspecs;)
-}
-
-SRC_URI[md5sum] = "5c69f16d452b0bb3d44bc3c10556c072"
-SRC_URI[sha256sum] = "f4e0ada8d4d516bbb8600a3ee7d9046c9c79e38cd781df9ffc46d8f16acd1768"
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free-4.6.3/linux.conf b/meta-oe/recipes-qt/qt4/qt4-x11-free-4.6.3/linux.conf
deleted file mode 100644
index 68ae80b..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-x11-free-4.6.3/linux.conf
+++ /dev/null
@@ -1,54 +0,0 @@
-#
-# qmake configuration for common linux
-#
-
-QMAKE_CFLAGS_THREAD	+= -D_REENTRANT
-QMAKE_CXXFLAGS_THREAD	+= $$QMAKE_CFLAGS_THREAD
-
-QMAKE_INCDIR          =
-QMAKE_LIBDIR          =
-QMAKE_INCDIR_X11      =
-QMAKE_LIBDIR_X11      =
-QMAKE_INCDIR_QT       = $(OE_QMAKE_INCDIR_QT)
-QMAKE_LIBDIR_QT       = $(OE_QMAKE_LIBDIR_QT)
-QMAKE_INCDIR_OPENGL   =
-QMAKE_LIBDIR_OPENGL   =
-
-
-QMAKE_LIBS            = -Wl,-rpath-link,SEDME/lib -lglib-2.0
-QMAKE_LIBS_DYNLOAD    = -ldl
-QMAKE_LIBS_X11        = $(OE_QMAKE_LIBS_X11)
-QMAKE_LIBS_X11SM      = $(OE_QMAKE_LIBS_X11SM)
-QMAKE_LIBS_NIS        = -lnsl
-QMAKE_LIBS_OPENGL     = -lGLU -lGL
-QMAKE_LIBS_OPENGL_QT  = -lGL
-QMAKE_LIBS_THREAD     = -lpthread
-
-QMAKE_MOC             = $(OE_QMAKE_MOC)
-QMAKE_UIC             = $(OE_QMAKE_UIC)
-QMAKE_UIC3            = $(OE_QMAKE_UIC3)
-QMAKE_RCC             = $(OE_QMAKE_RCC)
-QMAKE_QDBUSCPP2XML    = $(OE_QMAKE_QDBUSCPP2XML)
-QMAKE_QDBUSXML2CPP    = $(OE_QMAKE_QDBUSXML2CPP)
-
-QMAKE_AR              = $(OE_QMAKE_AR) cqs
-QMAKE_OBJCOPY         = ${OBJCOPY}
-QMAKE_RANLIB          =
-
-QMAKE_TAR             = tar -cf
-QMAKE_GZIP            = gzip -9f
-
-QMAKE_COPY            = cp -f
-QMAKE_COPY_FILE       = $(COPY)
-QMAKE_COPY_DIR        = $(COPY) -r
-QMAKE_MOVE            = mv -f
-QMAKE_DEL_FILE        = rm -f
-QMAKE_DEL_DIR         = rmdir
-QMAKE_STRIP           = $(OE_QMAKE_STRIP)
-QMAKE_STRIPFLAGS_LIB += --strip-unneeded
-QMAKE_CHK_DIR_EXISTS  = test -d
-QMAKE_MKDIR           = mkdir -p
-QMAKE_INSTALL_FILE    = install -m 644 -p
-QMAKE_INSTALL_PROGRAM = install -m 755 -p
-
-include(unix.conf)
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.6.3.bb b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.6.3.bb
deleted file mode 100644
index 8cf5449..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.6.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require qt-${PV}.inc
-require qt4-x11-free.inc
-
-PR = "${INC_PR}.0"
-
-QT_CONFIG_FLAGS += " -xrandr "
-- 
1.7.2.5



