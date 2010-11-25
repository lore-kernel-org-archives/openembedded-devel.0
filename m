Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PLdhd-0002TN-Nf
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 16:25:46 +0100
Received: (qmail 24257 invoked by uid 503); 25 Nov 2010 15:28:48 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 25 Nov 2010 15:28:47 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 25 Nov 2010 17:24:24 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 25 Nov 2010 17:24:23 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Nov 2010 16:21:19 +0100
Message-Id: <1290698481-17446-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1290698481-17446-1-git-send-email-eric@eukrea.com>
References: <1290698481-17446-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9198320764597546314
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.27.225
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/4] qt4.6: remove 4.6.2
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
X-List-Received-Date: Thu, 25 Nov 2010 15:25:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/qt4/qt-4.6.2.inc                           |   72 -----------------
 .../0006-freetype-host-includes.patch              |   20 -----
 .../qt4/qt4-embedded-4.6.2/0008-qt-lib-infix.patch |   32 --------
 .../0010-no-simpledecoration-example.patch         |   11 ---
 recipes/qt4/qt4-embedded-4.6.2/linux.conf          |   54 ------------
 .../qt4/qt4-embedded-gles-4.6.2/cursor-hack.diff   |   34 --------
 recipes/qt4/qt4-embedded-gles_4.6.2.bb             |   14 ---
 recipes/qt4/qt4-embedded_4.6.2.bb                  |    7 --
 recipes/qt4/qt4-tools-native_4.6.2.bb              |   12 ---
 recipes/qt4/qt4-tools-sdk_4.6.2.bb                 |   85 --------------------
 .../qt4/qt4-x11-free-4.6.2/0008-qt-lib-infix.patch |   32 --------
 .../0010-no-simpledecoration-example.patch         |   11 ---
 recipes/qt4/qt4-x11-free-4.6.2/linux.conf          |   54 ------------
 recipes/qt4/qt4-x11-free-gles_4.6.2.bb             |   17 ----
 recipes/qt4/qt4-x11-free_4.6.2.bb                  |   11 ---
 15 files changed, 0 insertions(+), 466 deletions(-)
 delete mode 100644 recipes/qt4/qt-4.6.2.inc
 delete mode 100644 recipes/qt4/qt4-embedded-4.6.2/0006-freetype-host-includes.patch
 delete mode 100644 recipes/qt4/qt4-embedded-4.6.2/0008-qt-lib-infix.patch
 delete mode 100644 recipes/qt4/qt4-embedded-4.6.2/0010-no-simpledecoration-example.patch
 delete mode 100644 recipes/qt4/qt4-embedded-4.6.2/linux.conf
 delete mode 100644 recipes/qt4/qt4-embedded-gles-4.6.2/cursor-hack.diff
 delete mode 100644 recipes/qt4/qt4-embedded-gles_4.6.2.bb
 delete mode 100644 recipes/qt4/qt4-embedded_4.6.2.bb
 delete mode 100644 recipes/qt4/qt4-tools-native_4.6.2.bb
 delete mode 100644 recipes/qt4/qt4-tools-sdk_4.6.2.bb
 delete mode 100644 recipes/qt4/qt4-x11-free-4.6.2/0008-qt-lib-infix.patch
 delete mode 100644 recipes/qt4/qt4-x11-free-4.6.2/0010-no-simpledecoration-example.patch
 delete mode 100644 recipes/qt4/qt4-x11-free-4.6.2/linux.conf
 delete mode 100644 recipes/qt4/qt4-x11-free-gles_4.6.2.bb
 delete mode 100644 recipes/qt4/qt4-x11-free_4.6.2.bb

diff --git a/recipes/qt4/qt-4.6.2.inc b/recipes/qt4/qt-4.6.2.inc
deleted file mode 100644
index c4c86d2..0000000
--- a/recipes/qt4/qt-4.6.2.inc
+++ /dev/null
@@ -1,72 +0,0 @@
-DEFAULT_PREFERENCE = "-1"
-
-FILESPATHPKG .= ":qt-${PV}"
-
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
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
-           "
-
-# Set necessary variables in the profile
-SRC_URI += "file://qte.sh"
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
-
-do_install_append() {
-	install -d ${D}${bindir}
-	for i in rcc uic moc ; do
-		install -m 0755 ${S}/bin/$i ${D}${bindir}/
-	done
-
-	#Append an E to the qtdemo file
-	if [ -n "${QT_LIBINFIX}" ] ; then
-		mv ${D}${bindir}/qtdemo ${D}${bindir}/qtdemo${QT_LIBINFIX}
-	fi
-}
-
-LICENSE = "LGPLv2.1 GPLv3"
-SRC_URI += " \
-            file://hack-out-pg_config.patch"
-
-SRC_URI[md5sum] = "eb651ee4b157c01696aa56777fc6e0e5"
-SRC_URI[sha256sum] = "176f51ddb06dce67ab4b2efc6b327dc21ed8f764c5d97acc15ff1f907c2affae"
diff --git a/recipes/qt4/qt4-embedded-4.6.2/0006-freetype-host-includes.patch b/recipes/qt4/qt4-embedded-4.6.2/0006-freetype-host-includes.patch
deleted file mode 100644
index 987c425..0000000
--- a/recipes/qt4/qt4-embedded-4.6.2/0006-freetype-host-includes.patch
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
diff --git a/recipes/qt4/qt4-embedded-4.6.2/0008-qt-lib-infix.patch b/recipes/qt4/qt4-embedded-4.6.2/0008-qt-lib-infix.patch
deleted file mode 100644
index 61e60a0..0000000
--- a/recipes/qt4/qt4-embedded-4.6.2/0008-qt-lib-infix.patch
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
diff --git a/recipes/qt4/qt4-embedded-4.6.2/0010-no-simpledecoration-example.patch b/recipes/qt4/qt4-embedded-4.6.2/0010-no-simpledecoration-example.patch
deleted file mode 100644
index fce5bba..0000000
--- a/recipes/qt4/qt4-embedded-4.6.2/0010-no-simpledecoration-example.patch
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
diff --git a/recipes/qt4/qt4-embedded-4.6.2/linux.conf b/recipes/qt4/qt4-embedded-4.6.2/linux.conf
deleted file mode 100644
index 68ae80b..0000000
--- a/recipes/qt4/qt4-embedded-4.6.2/linux.conf
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
diff --git a/recipes/qt4/qt4-embedded-gles-4.6.2/cursor-hack.diff b/recipes/qt4/qt4-embedded-gles-4.6.2/cursor-hack.diff
deleted file mode 100644
index e297e52..0000000
--- a/recipes/qt4/qt4-embedded-gles-4.6.2/cursor-hack.diff
+++ /dev/null
@@ -1,34 +0,0 @@
-Patch originally done by Bin Liu, rediffed by Koen Kooi for Qt 4.6.2
-
-This patch is a first step to get a working cursor when using the powervr driver, it flickers when hovering over a QGLWidget, but still better than no cursor at all
-
---- /tmp/pvreglscreen.cpp	2010-04-19 09:30:32.000000000 +0200
-+++ qt-everywhere-opensource-src-4.6.2/src/plugins/gfxdrivers/powervr/pvreglscreen/pvreglscreen.cpp	2010-04-19 09:31:30.000000000 +0200
-@@ -85,6 +85,9 @@
- bool PvrEglScreen::initDevice()
- {
-     openTty();
-+#ifndef QT_NO_QWS_CURSOR
-+    QScreenCursor::initSoftwareCursor();
-+#endif
-     return true;
- }
- 
---- /tmp/qwindowsystem_qws.cpp	2010-04-19 09:32:47.000000000 +0200
-+++ qt-everywhere-opensource-src-4.6.2/src/gui/embedded/qwindowsystem_qws.cpp	2010-04-19 09:33:30.000000000 +0200
-@@ -3501,7 +3501,6 @@
-         }
- 
- #ifdef QT_QWS_CLIENTBLIT
--#ifdef QT_NO_QWS_CURSOR
-         // This optimization only really works when there isn't a crazy cursor
-         // wizzing around.
-         QRegion directPaint = (r - transparentRegion); // in gloal coords
-@@ -3513,7 +3512,6 @@
-                                          QWSRegionEvent::DirectPaint, id);
-         }
- #endif
--#endif
-     }
- 
-     if (doLock)
diff --git a/recipes/qt4/qt4-embedded-gles_4.6.2.bb b/recipes/qt4/qt4-embedded-gles_4.6.2.bb
deleted file mode 100644
index 0b047fc..0000000
--- a/recipes/qt4/qt4-embedded-gles_4.6.2.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require qt4-embedded.inc
-PR = "${INC_PR}.8"
-
-PROVIDES += "qt4-embedded"
-QT_GLFLAGS = "-opengl es2 -depths 16,24,32  -plugin-gfx-powervr"
-
-require qt-${PV}.inc
-
-SRC_URI += "file://cursor-hack.diff"
-
-FILESPATHPKG .= ":qt4-embedded-${PV}:qt4-embedded"
-
-DEPENDS += "virtual/egl"
-require recipes/egl/egl.inc
diff --git a/recipes/qt4/qt4-embedded_4.6.2.bb b/recipes/qt4/qt4-embedded_4.6.2.bb
deleted file mode 100644
index 13f3f00..0000000
--- a/recipes/qt4/qt4-embedded_4.6.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require qt4-embedded.inc
-
-PR = "${INC_PR}.1"
-
-QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
-
-require qt-${PV}.inc
diff --git a/recipes/qt4/qt4-tools-native_4.6.2.bb b/recipes/qt4/qt4-tools-native_4.6.2.bb
deleted file mode 100644
index b3103b9..0000000
--- a/recipes/qt4/qt4-tools-native_4.6.2.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DEFAULT_PREFERENCE = "-1"
-
-require qt4-tools-native.inc
-LICENSE = "LGPLv2.1 GPLv3"
-PR = "${INC_PR}.0"
-
-EXTRA_OECONF += " -no-fast -silent -no-rpath"
-
-TOBUILD := "src/tools/bootstrap ${TOBUILD}"
-
-SRC_URI[md5sum] = "eb651ee4b157c01696aa56777fc6e0e5"
-SRC_URI[sha256sum] = "176f51ddb06dce67ab4b2efc6b327dc21ed8f764c5d97acc15ff1f907c2affae"
diff --git a/recipes/qt4/qt4-tools-sdk_4.6.2.bb b/recipes/qt4/qt4-tools-sdk_4.6.2.bb
deleted file mode 100644
index faf0567..0000000
--- a/recipes/qt4/qt4-tools-sdk_4.6.2.bb
+++ /dev/null
@@ -1,85 +0,0 @@
-DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
-DEPENDS = "zlib-native dbus-native"
-SECTION = "libs"
-HOMEPAGE = "http://www.trolltech.com"
-PRIORITY = "optional"
-LICENSE = "LGPLv2.1 GPLv3"
-
-DEFAULT_PREFERENCE = "-1"
-inherit sdk
-
-PR = "r1"
-
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
-           file://configure-lflags.patch \
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
-}
-
-
-SRC_URI[md5sum] = "eb651ee4b157c01696aa56777fc6e0e5"
-SRC_URI[sha256sum] = "176f51ddb06dce67ab4b2efc6b327dc21ed8f764c5d97acc15ff1f907c2affae"
diff --git a/recipes/qt4/qt4-x11-free-4.6.2/0008-qt-lib-infix.patch b/recipes/qt4/qt4-x11-free-4.6.2/0008-qt-lib-infix.patch
deleted file mode 100644
index 61e60a0..0000000
--- a/recipes/qt4/qt4-x11-free-4.6.2/0008-qt-lib-infix.patch
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
diff --git a/recipes/qt4/qt4-x11-free-4.6.2/0010-no-simpledecoration-example.patch b/recipes/qt4/qt4-x11-free-4.6.2/0010-no-simpledecoration-example.patch
deleted file mode 100644
index fce5bba..0000000
--- a/recipes/qt4/qt4-x11-free-4.6.2/0010-no-simpledecoration-example.patch
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
diff --git a/recipes/qt4/qt4-x11-free-4.6.2/linux.conf b/recipes/qt4/qt4-x11-free-4.6.2/linux.conf
deleted file mode 100644
index 68ae80b..0000000
--- a/recipes/qt4/qt4-x11-free-4.6.2/linux.conf
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
diff --git a/recipes/qt4/qt4-x11-free-gles_4.6.2.bb b/recipes/qt4/qt4-x11-free-gles_4.6.2.bb
deleted file mode 100644
index b7cbde5..0000000
--- a/recipes/qt4/qt4-x11-free-gles_4.6.2.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require qt4-x11-free.inc
-PR = "${INC_PR}.7"
-
-QT_GLFLAGS = "-opengl es2 -depths 16,24,32 "
-
-require qt-${PV}.inc
-
-QT_CONFIG_FLAGS += " \
- -no-embedded \
- -xrandr \
- -x11"
-
-FILESPATHPKG .= ":qt4-x11-free-${PV}:qt4-x11-free"
-
-DEPENDS += "virtual/egl"
-require recipes/egl/egl.inc
-PROVIDES += "qt4-x11-free"
diff --git a/recipes/qt4/qt4-x11-free_4.6.2.bb b/recipes/qt4/qt4-x11-free_4.6.2.bb
deleted file mode 100644
index 53efd7c..0000000
--- a/recipes/qt4/qt4-x11-free_4.6.2.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require qt4-x11-free.inc
-PR = "${INC_PR}.2"
-
-QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
-
-require qt-${PV}.inc
-
-QT_CONFIG_FLAGS += " \
- -no-embedded \
- -xrandr \
- -x11"
-- 
1.6.3.3



