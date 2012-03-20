Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S9vz1-00014z-Bm
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2012 11:08:03 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Mar 2012 02:59:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="119471958"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.195])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2012 02:59:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Mar 2012 09:59:05 +0000
Message-Id: <0e00dc65ee5db62c533dee48f1a4cd375db36a8d.1332237450.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1332237450.git.paul.eggleton@linux.intel.com>
References: <cover.1332237450.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1332237450.git.paul.eggleton@linux.intel.com>
References: <cover.1332237450.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe] [PATCH 2/2] qmake2: remove
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
X-List-Received-Date: Tue, 20 Mar 2012 10:08:04 -0000

qmake is now provided by the qt4-x11-tools package in OE-Core (and has
RPROVIDES + RREPLACES), so remove this recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-qt/qt4/qmake2-sdk/linux-oe-qmake.conf  |    1 -
 meta-oe/recipes-qt/qt4/qmake2.inc                  |   72 ---------
 .../recipes-qt/qt4/qmake2/0001-fix-mkspecs.patch   |  152 --------------------
 meta-oe/recipes-qt/qt4/qmake2/linux-oe-qmake.conf  |    1 -
 meta-oe/recipes-qt/qt4/qmake2/qmake-hack.diff      |   15 --
 meta-oe/recipes-qt/qt4/qmake2/qt-config.patch      |   21 ---
 .../recipes-qt/qt4/qmake2/use-lflags-last.patch    |   22 ---
 meta-oe/recipes-qt/qt4/qmake2_2.10a.bb             |   60 --------
 8 files changed, 0 insertions(+), 344 deletions(-)
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2-sdk/linux-oe-qmake.conf
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2.inc
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2/0001-fix-mkspecs.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2/linux-oe-qmake.conf
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2/qmake-hack.diff
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2/qt-config.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2/use-lflags-last.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qmake2_2.10a.bb

diff --git a/meta-oe/recipes-qt/qt4/qmake2-sdk/linux-oe-qmake.conf b/meta-oe/recipes-qt/qt4/qmake2-sdk/linux-oe-qmake.conf
deleted file mode 100644
index f58481a..0000000
--- a/meta-oe/recipes-qt/qt4/qmake2-sdk/linux-oe-qmake.conf
+++ /dev/null
@@ -1 +0,0 @@
-include(../linux-g++/qmake.conf)
diff --git a/meta-oe/recipes-qt/qt4/qmake2.inc b/meta-oe/recipes-qt/qt4/qmake2.inc
deleted file mode 100644
index 6ede742..0000000
--- a/meta-oe/recipes-qt/qt4/qmake2.inc
+++ /dev/null
@@ -1,72 +0,0 @@
-DESCRIPTION = "TrollTech Makefile Generator"
-HOMEPAGE = "http://www.trolltech.com"
-SECTION = "devel"
-LICENSE = "LGPLv2.1 | GPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
-                    file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
-                    file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
-PR = "r12"
-
-# We call 'moc' during the build 
-DEPENDS = "qt4-tools-native"
-
-QTVER = "qt-everywhere-opensource-src-${QTVERSION}"
-
-SRC_URI = "http://get.qt.nokia.com/qt/source/${QTVER}.tar.gz \
-           file://0001-fix-mkspecs.patch \
-           file://qt-config.patch \
-           file://use-lflags-last.patch \
-           file://linux-oe-qmake.conf"
-S = "${WORKDIR}/${QTVER}"
-
-inherit autotools  
-
-CROSSHACK = "true"
-CROSSHACK_virtclass-native = ""
-CROSSHACK_virtclass-nativesdk = ""
-
-export CROSSHACK
-export QTDIR = "${S}"
-EXTRA_OEMAKE = "-e"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-do_configure() {
-
-    # Make sure we regenerate all Makefiles 
-    find ${S} -name "Makefile" | xargs rm
-    # Install the OE build templates
-    for template in linux-oe-g++ linux-uclibc-oe-g++ linux-gnueabi-oe-g++ linux-uclibceabi-oe-g++ default
-    do
-        install -d ${S}/mkspecs/$template
-		rm -f ${S}/mkspecs/$template/qmake.conf
-        install -m 0644 ${WORKDIR}/linux-oe-qmake.conf ${S}/mkspecs/$template/qmake.conf
-        ln -sf ../linux-g++/qplatformdefs.h ${S}/mkspecs/$template/qplatformdefs.h
-    done
-
-    QMAKESPEC=
-    PLATFORM=${HOST_OS}-oe-g++
-    export PLATFORM
-    export OE_QMAKE_CC="${CC}"
-    export OE_QMAKE_CFLAGS="${CFLAGS}"
-    export OE_QMAKE_CXX="${CXX}"
-    export OE_QMAKE_CXXFLAGS="-fno-exceptions -fno-rtti ${CXXFLAGS}"
-    export OE_QMAKE_LDFLAGS="${LDFLAGS}"
-    export OE_QMAKE_LINK="${CCLD}"
-    export OE_QMAKE_AR="${AR}"
-    export OE_QMAKE_STRIP="${STRIP}"
-    export OE_QMAKE_UIC="${STAGING_BINDIR_NATIVE}/uic4"
-    export OE_QMAKE_MOC="${STAGING_BINDIR_NATIVE}/moc4"
-    export QMAKE_MOC="${STAGING_BINDIR_NATIVE}/moc4"
-    export OE_QMAKE_RCC="${STAGING_BINDIR_NATIVE}/rcc4"
-    export QMAKE_RCC="${STAGING_BINDIR_NATIVE}/rcc4"
-    export OE_QMAKE_QMAKE="${STAGING_BINDIR_NATIVE}/qmake"
-    export OE_QMAKE_RPATH="-Wl,-rpath-link,"
-    (echo o; echo yes) | ./configure -prefix ${STAGING_DIR_NATIVE}/qt4 ${EXTRA_OECONF} || die "Configuring qt failed"
-}
-
-do_compile() {
-    :
-}
-
-FILES_${PN} += "${datadir}/qt4/"
diff --git a/meta-oe/recipes-qt/qt4/qmake2/0001-fix-mkspecs.patch b/meta-oe/recipes-qt/qt4/qmake2/0001-fix-mkspecs.patch
deleted file mode 100644
index e36c554..0000000
--- a/meta-oe/recipes-qt/qt4/qmake2/0001-fix-mkspecs.patch
+++ /dev/null
@@ -1,152 +0,0 @@
-From 04f1a1d766de39797362cd748299bd29251f6cfc Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Sun, 19 Jun 2011 19:50:05 +0200
-Subject: [PATCH] fix mkspecs for OE usage
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- mkspecs/common/g++.conf   |   32 +++++++++++++++++++-------------
- mkspecs/common/linux.conf |   33 +++++++++++++++++++--------------
- 2 files changed, 38 insertions(+), 27 deletions(-)
-
-diff --git a/mkspecs/common/g++.conf b/mkspecs/common/g++.conf
-index 0d511fc..80f925c 100644
---- a/mkspecs/common/g++.conf
-+++ b/mkspecs/common/g++.conf
-@@ -2,13 +2,13 @@
- # qmake configuration for common gcc
- #
- 
--QMAKE_CC		= gcc
--QMAKE_CFLAGS		+= -pipe
-+QMAKE_CC       = $(OE_QMAKE_CC)
-+QMAKE_CFLAGS       += -pipe $(OE_QMAKE_CFLAGS)
-+QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO += $(OE_QMAKE_CFLAGS)
- QMAKE_CFLAGS_DEPS	+= -M
- QMAKE_CFLAGS_WARN_ON	+= -Wall -W
- QMAKE_CFLAGS_WARN_OFF	+= -w
--QMAKE_CFLAGS_RELEASE	+= -O2
--QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO += -O2 -g
-+QMAKE_CFLAGS_RELEASE	+=
- QMAKE_CFLAGS_DEBUG	+= -g
- QMAKE_CFLAGS_SHLIB	+= -fPIC
- QMAKE_CFLAGS_STATIC_LIB	+= -fPIC
-@@ -17,8 +17,8 @@ QMAKE_CFLAGS_HIDESYMS   += -fvisibility=hidden
- QMAKE_CFLAGS_PRECOMPILE += -x c-header -c ${QMAKE_PCH_INPUT} -o ${QMAKE_PCH_OUTPUT}
- QMAKE_CFLAGS_USE_PRECOMPILE += -include ${QMAKE_PCH_OUTPUT_BASE}
- 
--QMAKE_CXX		= g++
--QMAKE_CXXFLAGS		+= $$QMAKE_CFLAGS
-+QMAKE_CXX      = $(OE_QMAKE_CXX)
-+QMAKE_CXXFLAGS     += $$QMAKE_CFLAGS $(OE_QMAKE_CXXFLAGS)
- QMAKE_CXXFLAGS_DEPS	+= $$QMAKE_CFLAGS_DEPS
- QMAKE_CXXFLAGS_WARN_ON	+= $$QMAKE_CFLAGS_WARN_ON
- QMAKE_CXXFLAGS_WARN_OFF	+= $$QMAKE_CFLAGS_WARN_OFF
-@@ -32,12 +32,12 @@ QMAKE_CXXFLAGS_HIDESYMS += $$QMAKE_CFLAGS_HIDESYMS -fvisibility-inlines-hidden
- QMAKE_CXXFLAGS_PRECOMPILE += -x c++-header -c ${QMAKE_PCH_INPUT} -o ${QMAKE_PCH_OUTPUT}
- QMAKE_CXXFLAGS_USE_PRECOMPILE = $$QMAKE_CFLAGS_USE_PRECOMPILE
- 
--QMAKE_LINK		= g++
--QMAKE_LINK_SHLIB	= g++
--QMAKE_LINK_C		= gcc
--QMAKE_LINK_C_SHLIB	= gcc
--QMAKE_LFLAGS		+=
--QMAKE_LFLAGS_RELEASE	+= -Wl,-O1
-+QMAKE_LINK     = $(OE_QMAKE_LINK)
-+QMAKE_LINK_SHLIB   = $(OE_QMAKE_LINK)
-+QMAKE_LINK_C		= $(OE_QMAKE_LINK)
-+QMAKE_LINK_C_SHLIB	= $(OE_QMAKE_LINK)
-+QMAKE_LFLAGS       += $(OE_QMAKE_LDFLAGS)
-+QMAKE_LFLAGS_RELEASE	+=
- QMAKE_LFLAGS_DEBUG	+=
- QMAKE_LFLAGS_APP	+=
- QMAKE_LFLAGS_SHLIB	+= -shared
-@@ -45,10 +45,16 @@ QMAKE_LFLAGS_PLUGIN	+= $$QMAKE_LFLAGS_SHLIB
- QMAKE_LFLAGS_SONAME	+= -Wl,-soname,
- QMAKE_LFLAGS_THREAD	+=
- QMAKE_LFLAGS_NOUNDEF	+= -Wl,--no-undefined
--QMAKE_LFLAGS_RPATH	= -Wl,-rpath,
-+QMAKE_LFLAGS_RPATH        = -Wl,-rpath-link,
- 
- QMAKE_PCH_OUTPUT_EXT    = .gch
- 
- # -Bsymbolic-functions (ld) support
- QMAKE_LFLAGS_BSYMBOLIC_FUNC = -Wl,-Bsymbolic-functions
- QMAKE_LFLAGS_DYNAMIC_LIST = -Wl,--dynamic-list,
-+
-+# some linking helper...
-+CONFIG += rpath_libdirs
-+
-+# for the SDK
-+isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG = $(OE_QMAKE_QT_CONFIG)
-diff --git a/mkspecs/common/linux.conf b/mkspecs/common/linux.conf
-index 4fbe2dc..a541355 100644
---- a/mkspecs/common/linux.conf
-+++ b/mkspecs/common/linux.conf
-@@ -7,25 +7,26 @@ QMAKE_CXXFLAGS_THREAD	+= $$QMAKE_CFLAGS_THREAD
- 
- QMAKE_INCDIR          =
- QMAKE_LIBDIR          =
--QMAKE_INCDIR_X11      = /usr/X11R6/include
--QMAKE_LIBDIR_X11      = /usr/X11R6/lib
--QMAKE_INCDIR_QT       = $$[QT_INSTALL_HEADERS]
--QMAKE_LIBDIR_QT       = $$[QT_INSTALL_LIBS]
--QMAKE_INCDIR_OPENGL   = /usr/X11R6/include
--QMAKE_LIBDIR_OPENGL   = /usr/X11R6/lib
-+QMAKE_INCDIR_X11      =
-+QMAKE_LIBDIR_X11      =
-+QMAKE_INCDIR_QT       = $(OE_QMAKE_INCDIR_QT)
-+QMAKE_LIBDIR_QT       = $(OE_QMAKE_LIBDIR_QT)
-+QMAKE_INCDIR_OPENGL   =
-+QMAKE_LIBDIR_OPENGL   =
- QMAKE_INCDIR_OPENGL_ES1 = $$QMAKE_INCDIR_OPENGL
- QMAKE_LIBDIR_OPENGL_ES1 = $$QMAKE_LIBDIR_OPENGL
- QMAKE_INCDIR_OPENGL_ES2 = $$QMAKE_INCDIR_OPENGL
- QMAKE_LIBDIR_OPENGL_ES2 = $$QMAKE_LIBDIR_OPENGL
--QMAKE_INCDIR_EGL      = 
-+QMAKE_INCDIR_EGL      =
- QMAKE_LIBDIR_EGL      =
--QMAKE_INCDIR_OPENVG   = 
-+QMAKE_INCDIR_OPENVG   =
- QMAKE_LIBDIR_OPENVG   =
- 
-+
- QMAKE_LIBS            =
- QMAKE_LIBS_DYNLOAD    = -ldl
--QMAKE_LIBS_X11        = -lXext -lX11 -lm
--QMAKE_LIBS_X11SM      = -lSM -lICE
-+QMAKE_LIBS_X11        = $(OE_QMAKE_LIBS_X11)
-+QMAKE_LIBS_X11SM      = $(OE_QMAKE_LIBS_X11SM)
- QMAKE_LIBS_NIS        = -lnsl
- QMAKE_LIBS_EGL        = -lEGL
- QMAKE_LIBS_OPENGL     = -lGLU -lGL
-@@ -35,10 +36,14 @@ QMAKE_LIBS_OPENGL_ES2 = -lGLESv2
- QMAKE_LIBS_OPENVG     = -lOpenVG
- QMAKE_LIBS_THREAD     = -lpthread
- 
--QMAKE_MOC             = $$[QT_INSTALL_BINS]/moc
--QMAKE_UIC             = $$[QT_INSTALL_BINS]/uic
-+QMAKE_MOC             = $(OE_QMAKE_MOC)
-+QMAKE_UIC             = $(OE_QMAKE_UIC)
-+QMAKE_UIC3            = $(OE_QMAKE_UIC3)
-+QMAKE_RCC             = $(OE_QMAKE_RCC)
-+QMAKE_QDBUSCPP2XML    = $(OE_QMAKE_QDBUSCPP2XML)
-+QMAKE_QDBUSXML2CPP    = $(OE_QMAKE_QDBUSXML2CPP)
- 
--QMAKE_AR              = ar cqs
-+QMAKE_AR              = $(OE_QMAKE_AR) cqs
- QMAKE_OBJCOPY         = objcopy
- QMAKE_RANLIB          =
- 
-@@ -51,7 +56,7 @@ QMAKE_COPY_DIR        = $(COPY) -r
- QMAKE_MOVE            = mv -f
- QMAKE_DEL_FILE        = rm -f
- QMAKE_DEL_DIR         = rmdir
--QMAKE_STRIP           = strip
-+QMAKE_STRIP           = $(OE_QMAKE_STRIP)
- QMAKE_STRIPFLAGS_LIB += --strip-unneeded
- QMAKE_CHK_DIR_EXISTS  = test -d
- QMAKE_MKDIR           = mkdir -p
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-qt/qt4/qmake2/linux-oe-qmake.conf b/meta-oe/recipes-qt/qt4/qmake2/linux-oe-qmake.conf
deleted file mode 100644
index f58481a..0000000
--- a/meta-oe/recipes-qt/qt4/qmake2/linux-oe-qmake.conf
+++ /dev/null
@@ -1 +0,0 @@
-include(../linux-g++/qmake.conf)
diff --git a/meta-oe/recipes-qt/qt4/qmake2/qmake-hack.diff b/meta-oe/recipes-qt/qt4/qmake2/qmake-hack.diff
deleted file mode 100644
index 290f540..0000000
--- a/meta-oe/recipes-qt/qt4/qmake2/qmake-hack.diff
+++ /dev/null
@@ -1,15 +0,0 @@
---- /tmp/configure	2010-02-10 15:41:58.000000000 +0100
-+++ qt-embedded-linux-opensource-src-4.4.3/configure	2010-02-10 15:42:01.000000000 +0100
-@@ -3946,6 +3946,12 @@
-     [ '!' -z "$QCONFIG_H" ] && mv -f "$QCONFIG_H" "$QMAKE_QCONFIG_H" #move qmake's qconfig.h to qconfig.h.qmake
-     [ '!' -z "$OLD_QCONFIG_H" ] && mv -f "${OLD_QCONFIG_H}.old" "$OLD_QCONFIG_H" #put back qconfig.h
-     [ "$QMAKE_BUILD_ERROR" = "yes" ] && exit 2
-+
-+# OE
-+if [ x$CROSSHACK = xtrue ] ; then
-+	echo "Exiting now, since we have what we want: a qmake binary"
-+	exit 0
-+fi
- fi # Build qmake
- 
- #-------------------------------------------------------------------------------
diff --git a/meta-oe/recipes-qt/qt4/qmake2/qt-config.patch b/meta-oe/recipes-qt/qt4/qmake2/qt-config.patch
deleted file mode 100644
index 3aa041a..0000000
--- a/meta-oe/recipes-qt/qt4/qmake2/qt-config.patch
+++ /dev/null
@@ -1,21 +0,0 @@
---- /tmp/qlibraryinfo.cpp	2008-08-02 17:16:41.000000000 +0200
-+++ qt-embedded-linux-opensource-src-4.4.1/src/corelib/global/qlibraryinfo.cpp	2008-08-02 17:17:42.000000000 +0200
-@@ -47,6 +47,7 @@
- QT_BEGIN_NAMESPACE
- extern QString qmake_libraryInfoFile();
- QT_END_NAMESPACE
-+#include <stdlib.h>
- #else
- # include "qcoreapplication.h"
- #endif
-@@ -113,6 +114,10 @@
- #ifdef QT_BUILD_QMAKE
-     if(!QFile::exists(qtconfig))
-         qtconfig = qmake_libraryInfoFile();
-+    if (!QFile::exists(qtconfig)) {
-+        QByteArray config = getenv("QT_CONF_PATH");
-+        qtconfig = config;
-+    }
- #else
-     if (!QFile::exists(qtconfig) && QCoreApplication::instance()) {
- #ifdef Q_OS_MAC
diff --git a/meta-oe/recipes-qt/qt4/qmake2/use-lflags-last.patch b/meta-oe/recipes-qt/qt4/qmake2/use-lflags-last.patch
deleted file mode 100644
index 4197dbb..0000000
--- a/meta-oe/recipes-qt/qt4/qmake2/use-lflags-last.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Index: qtopia-core-opensource-src-4.3.1/qmake/generators/unix/unixmake2.cpp
-===================================================================
---- qtopia-core-opensource-src-4.3.1.orig/qmake/generators/unix/unixmake2.cpp	2007-10-07 13:45:26.000000000 +0200
-+++ qtopia-core-opensource-src-4.3.1/qmake/generators/unix/unixmake2.cpp	2007-10-07 13:57:09.000000000 +0200
-@@ -416,7 +416,7 @@
-                 t << "\n\t" << mkdir_p_asstring(destdir) << "\n\t";
-             if(!project->isEmpty("QMAKE_PRE_LINK"))
-                 t << var("QMAKE_PRE_LINK") << "\n\t";
--            t << "$(LINK) $(LFLAGS) -o $(TARGET) " << incr_deps << " " << incr_objs << " $(OBJCOMP) $(LIBS)";
-+            t << "$(LINK) -o $(TARGET) " << incr_deps << " " << incr_objs << " $(OBJCOMP) $(LIBS) $(LFLAGS)";
-             if(!project->isEmpty("QMAKE_POST_LINK"))
-                 t << "\n\t" << var("QMAKE_POST_LINK");
-             t << endl << endl;
-@@ -430,7 +430,7 @@
-                 t << mkdir_p_asstring(destdir) << "\n\t";
-             if(!project->isEmpty("QMAKE_PRE_LINK"))
-                 t << var("QMAKE_PRE_LINK") << "\n\t";
--            t << "$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(OBJCOMP) $(LIBS)";
-+            t << "$(LINK) -o $(TARGET) $(OBJECTS) $(OBJCOMP) $(LIBS) $(LFLAGS)";
-             if(!project->isEmpty("QMAKE_POST_LINK"))
-                 t << "\n\t" << var("QMAKE_POST_LINK");
-             t << endl << endl;
diff --git a/meta-oe/recipes-qt/qt4/qmake2_2.10a.bb b/meta-oe/recipes-qt/qt4/qmake2_2.10a.bb
deleted file mode 100644
index b75ce7e..0000000
--- a/meta-oe/recipes-qt/qt4/qmake2_2.10a.bb
+++ /dev/null
@@ -1,60 +0,0 @@
-QTVERSION="4.7.3"
-FILESDIR += "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/qmake2"
-
-BBCLASSEXTEND = "native nativesdk"
-
-require ${PN}.inc
-
-SRC_URI += "file://qmake-hack.diff"
-
-do_install() {
-    install -d ${D}/${bindir}
-    install -m 0755 bin/qmake ${D}/${bindir}/qmake2
-    install -m 0755 bin/qmake ${D}/${bindir}/qmake-qt4
-    install -d ${D}/${datadir}/qt4
-    install -d ${D}/${datadir}/qtopia
-
-    script="${D}/${datadir}/qtopia/environment-setup"
-    touch $script
-    echo 'export QT_DIR_NAME=qtopia' >> $script
-    echo 'export QT_LIBINFIX=E' >> $script
-    echo 'export OE_QMAKE_AR=ar' >> $script
-    echo 'export OE_QMAKE_CC=gcc' >> $script
-    echo 'export OE_QMAKE_CXX=g++' >> $script
-    echo 'export OE_QMAKE_LINK=g++' >> $script
-    echo 'export OE_QMAKE_LIBDIR_QT=${libdir}' >> $script
-    echo 'export OE_QMAKE_INCDIR_QT=${includedir}/qtopia' >> $script
-    echo 'export OE_QMAKE_MOC=${bindir}/moc' >> $script
-    echo 'export OE_QMAKE_UIC=${bindir}/uic' >> $script
-    echo 'export OE_QMAKE_UIC3=${bindir}/uic3' >> $script
-    echo 'export OE_QMAKE_RCC=${bindir}/rcc' >> $script
-    echo 'export OE_QMAKE_QDBUSCPP2XML=${bindir}/qdbuscpp2xml' >> $script
-    echo 'export OE_QMAKE_QDBUSXML2CPP=${bindir}/qdbusxml2cpp' >> $script
-    echo 'export OE_QMAKE_QT_CONFIG=${datadir}/qtopia/mkspecs/qconfig.pri' >> $script
-    echo 'export QMAKESPEC=${datadir}/qtopia/mkspecs/linux-g++' >> $script
-
-    script="${D}/${datadir}/qt4/environment-setup"
-    touch $script
-    echo 'export OE_QMAKE_AR=ar' >> $script
-    echo 'export OE_QMAKE_CC=gcc' >> $script
-    echo 'export OE_QMAKE_CXX=g++' >> $script
-    echo 'export OE_QMAKE_LINK=g++' >> $script
-    echo 'export OE_QMAKE_LIBDIR_QT=${libdir}' >> $script
-    echo 'export OE_QMAKE_INCDIR_QT=${includedir}/qt4' >> $script
-    echo 'export OE_QMAKE_MOC=${bindir}/moc' >> $script
-    echo 'export OE_QMAKE_UIC=${bindir}/uic' >> $script
-    echo 'export OE_QMAKE_UIC3=${bindir}/uic3' >> $script
-    echo 'export OE_QMAKE_RCC=${bindir}/rcc' >> $script
-    echo 'export OE_QMAKE_QDBUSCPP2XML=${bindir}/qdbuscpp2xml' >> $script
-    echo 'export OE_QMAKE_QDBUSXML2CPP=${bindir}/qdbusxml2cpp' >> $script
-    echo 'export OE_QMAKE_QT_CONFIG=${datadir}/qt4/mkspecs/qconfig.pri' >> $script
-    echo 'export QMAKESPEC=${datadir}/qt4/mkspecs/linux-g++' >> $script
-
-    chmod 0755 ${D}${datadir}/qt*/environment-setup
-}
-
-FILES_${PN} += "${datadir}/qt*/environment-setup"
-
-
-SRC_URI[md5sum] = "9a639aec44a1e4c70040117183d247a3"
-SRC_URI[sha256sum] = "05d06b93f95092f1318634fca24f0c2d0a1252c9f1dc2fbb427b07e8ecbb4f39"
-- 
1.7.5.4



