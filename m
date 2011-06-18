Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QY0mA-0006tJ-4f
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Jun 2011 21:01:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jun 2011 11:58:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,386,1304319600"; d="scan'208";a="17843545"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.16.245])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2011 11:57:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jun 2011 19:57:52 +0100
Message-Id: <8bfe76e6787a8e10decb430cebebb89031e3e081.1308417391.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1308417391.git.paul.eggleton@linux.intel.com>
References: <cover.1308417391.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1308417391.git.paul.eggleton@linux.intel.com>
References: <cover.1308417391.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe] [PATCH 1/3] qt4: replace recipes with bbappends
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
X-List-Received-Date: Sat, 18 Jun 2011 19:01:49 -0000

The only functional difference between these recipes and the ones in
oe-core is the addition of PostgreSQL, MySQL and SQLite 2 drivers. Now
that we have QT_SQL_DRIVER_FLAGS in the oe-core Qt4 recipes we can
replace the overlayed recipes with bbappends which enable the drivers
using this variable.

(Note: there is no bbappend for qt4-tools-native as this does not build
the SQL drivers.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-qt/qt4/files/0001-cross-compile.patch  |   36 ---
 .../recipes-qt/qt4/files/0001-fix-mkspecs.patch    |  102 -------
 .../qt4/files/0002-fix-resinit-declaration.patch   |   22 --
 meta-oe/recipes-qt/qt4/files/0004-no-qmake.patch   |   26 --
 .../qt4/files/0006-freetype-host-includes.patch    |   24 --
 .../recipes-qt/qt4/files/0008-qt-lib-infix.patch   |   36 ---
 .../recipes-qt/qt4/files/0009-support-2bpp.patch   |  299 -------------------
 .../files/0010-no-simpledecoration-example.patch   |   14 -
 meta-oe/recipes-qt/qt4/files/common.pro            |  108 -------
 .../recipes-qt/qt4/files/compile.test-lflags.patch |   13 -
 .../recipes-qt/qt4/files/configure-lflags.patch    |   13 -
 meta-oe/recipes-qt/qt4/files/configure-paths.patch |   21 --
 .../recipes-qt/qt4/files/fix-config-tests.patch    |   36 ---
 meta-oe/recipes-qt/qt4/files/g++.conf              |   53 ----
 .../recipes-qt/qt4/files/hack-out-pg_config.patch  |   30 --
 meta-oe/recipes-qt/qt4/files/linux-oe-qmake.conf   |   82 -----
 meta-oe/recipes-qt/qt4/files/linux.conf            |   54 ----
 meta-oe/recipes-qt/qt4/files/mips-relocate.patch   |   28 --
 .../recipes-qt/qt4/files/qmake-exists-check.patch  |   18 --
 meta-oe/recipes-qt/qt4/files/qmake-hack.diff       |   15 -
 meta-oe/recipes-qt/qt4/files/qt-config.patch       |   24 --
 meta-oe/recipes-qt/qt4/files/qte.sh                |    7 -
 .../qt4/files/qthelp-lib-qtclucene.patch           |   86 ------
 meta-oe/recipes-qt/qt4/files/use-lflags-last.patch |   22 --
 meta-oe/recipes-qt/qt4/qt-4.7.2.inc                |   58 ----
 .../0001-Added-Openembedded-crossarch-option.patch |   44 ---
 meta-oe/recipes-qt/qt4/qt-4.7.2/g++.conf           |   60 ----
 .../qt4/qt-4.7.2/hack-out-pg2-4.7.0.patch          |   19 --
 meta-oe/recipes-qt/qt4/qt-4.7.2/linux.conf         |   66 ----
 meta-oe/recipes-qt/qt4/qt4-embedded.inc            |   34 ---
 .../qt4-embedded/0006-freetype-host-includes.patch |   20 --
 meta-oe/recipes-qt/qt4/qt4-embedded_4.7.2.bb       |   10 -
 meta-oe/recipes-qt/qt4/qt4-embedded_4.7.3.bbappend |    5 +
 meta-oe/recipes-qt/qt4/qt4-tools-native.inc        |   77 -----
 meta-oe/recipes-qt/qt4/qt4-tools-native_4.7.2.bb   |   13 -
 meta-oe/recipes-qt/qt4/qt4-tools-nativesdk.inc     |  111 -------
 .../recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb    |    6 -
 meta-oe/recipes-qt/qt4/qt4-x11-free.inc            |   20 --
 .../qt4/qt4-x11-free/0003-no-tools.patch           |   18 --
 .../qt4-x11-free/0006-freetype-host-includes.patch |   20 --
 .../qt4-x11-free/0007-openssl-host-includes.patch  |   20 --
 .../qt4/qt4-x11-free/0008-qt-lib-infix.patch       |   34 ---
 meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.2.bb       |   12 -
 meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.3.bbappend |    5 +
 meta-oe/recipes-qt/qt4/qt4.inc                     |  314 --------------------
 meta-oe/recipes-qt/qt4/qt4_arch.inc                |   25 --
 46 files changed, 10 insertions(+), 2150 deletions(-)
 delete mode 100644 meta-oe/recipes-qt/qt4/files/0001-cross-compile.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/0001-fix-mkspecs.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/0002-fix-resinit-declaration.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/0004-no-qmake.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/0006-freetype-host-includes.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/0008-qt-lib-infix.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/0009-support-2bpp.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/0010-no-simpledecoration-example.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/common.pro
 delete mode 100644 meta-oe/recipes-qt/qt4/files/compile.test-lflags.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/configure-lflags.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/configure-paths.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/fix-config-tests.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/g++.conf
 delete mode 100644 meta-oe/recipes-qt/qt4/files/hack-out-pg_config.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/linux-oe-qmake.conf
 delete mode 100644 meta-oe/recipes-qt/qt4/files/linux.conf
 delete mode 100644 meta-oe/recipes-qt/qt4/files/mips-relocate.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/qmake-exists-check.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/qmake-hack.diff
 delete mode 100644 meta-oe/recipes-qt/qt4/files/qt-config.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/qte.sh
 delete mode 100644 meta-oe/recipes-qt/qt4/files/qthelp-lib-qtclucene.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/files/use-lflags-last.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qt-4.7.2.inc
 delete mode 100644 meta-oe/recipes-qt/qt4/qt-4.7.2/0001-Added-Openembedded-crossarch-option.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qt-4.7.2/g++.conf
 delete mode 100644 meta-oe/recipes-qt/qt4/qt-4.7.2/hack-out-pg2-4.7.0.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qt-4.7.2/linux.conf
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded.inc
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded/0006-freetype-host-includes.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded_4.7.2.bb
 create mode 100644 meta-oe/recipes-qt/qt4/qt4-embedded_4.7.3.bbappend
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-tools-native.inc
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-tools-native_4.7.2.bb
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-tools-nativesdk.inc
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free.inc
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free/0003-no-tools.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free/0006-freetype-host-includes.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free/0007-openssl-host-includes.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free/0008-qt-lib-infix.patch
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.2.bb
 create mode 100644 meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.3.bbappend
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4.inc
 delete mode 100644 meta-oe/recipes-qt/qt4/qt4_arch.inc

diff --git a/meta-oe/recipes-qt/qt4/files/0001-cross-compile.patch b/meta-oe/recipes-qt/qt4/files/0001-cross-compile.patch
deleted file mode 100644
index 053be06..0000000
--- a/meta-oe/recipes-qt/qt4/files/0001-cross-compile.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Add configure option "crossarch" for cross compiling
-
-Ported from OE by: Yu Ke <ke.yu@intel.com>
-
-Index: qt-embedded-linux-opensource-src-4.4.3/configure
-===================================================================
---- qt-embedded-linux-opensource-src-4.4.3.orig/configure	2009-03-26 17:02:45.000000000 +0100
-+++ qt-embedded-linux-opensource-src-4.4.3/configure	2009-03-26 17:03:43.000000000 +0100
-@@ -726,7 +726,7 @@
-             UNKNOWN_ARG=yes
-         fi
-         ;;
--    -prefix|-docdir|-headerdir|-plugindir|-datadir|-libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-platform|-xplatform|-buildkey|-sdk|-arch|-host-arch|-mysql_config)
-+    -prefix|-docdir|-headerdir|-plugindir|-datadir|-libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-platform|-xplatform|-buildkey|-sdk|-arch|-host-arch|-mysql_config|-crossarch)
-         VAR=`echo $1 | sed "s,^-\(.*\),\1,"`
-         shift
-         VAL="$1"
-@@ -1143,6 +1143,9 @@
-     xplatform)
-         XPLATFORM="$VAL"
-         ;;
-+	crossarch)
-+		CROSSARCH="$VAL"
-+		;;
-     debug-and-release)
-         if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
-             CFG_DEBUG_RELEASE="$VAL"
-@@ -2405,6 +2408,8 @@
-     CFG_ARCH=$CFG_HOST_ARCH
- fi
- 
-+CFG_ARCH="$CROSSARCH"
-+
- if [ -d "$relpath/src/corelib/arch/$CFG_ARCH" ]; then
-     if [ "$OPT_VERBOSE" = "yes" ]; then
-         echo "    '$CFG_ARCH' is supported"
diff --git a/meta-oe/recipes-qt/qt4/files/0001-fix-mkspecs.patch b/meta-oe/recipes-qt/qt4/files/0001-fix-mkspecs.patch
deleted file mode 100644
index 0fccb57..0000000
--- a/meta-oe/recipes-qt/qt4/files/0001-fix-mkspecs.patch
+++ /dev/null
@@ -1,102 +0,0 @@
---- /tmp/g++.conf	2008-07-08 10:32:18.000000000 +0200
-+++ qt-embedded-linux-opensource-src-4.4.0/mkspecs/common/g++.conf	2008-07-08 10:34:15.000000000 +0200
-@@ -2,12 +2,12 @@
- # qmake configuration for common gcc
- #
- 
--QMAKE_CC		= gcc
--QMAKE_CFLAGS		+= -pipe
-+QMAKE_CC       = $(OE_QMAKE_CC)
-+QMAKE_CFLAGS       += -pipe $(OE_QMAKE_CFLAGS)
- QMAKE_CFLAGS_DEPS	+= -M
- QMAKE_CFLAGS_WARN_ON	+= -Wall -W
- QMAKE_CFLAGS_WARN_OFF	+= -w
--QMAKE_CFLAGS_RELEASE	+= -O2
-+QMAKE_CFLAGS_RELEASE	+= 
- QMAKE_CFLAGS_DEBUG	+= -g
- QMAKE_CFLAGS_SHLIB	+= -fPIC
- QMAKE_CFLAGS_STATIC_LIB	+= -fPIC
-@@ -16,8 +16,8 @@
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
-@@ -30,9 +30,9 @@
- QMAKE_CXXFLAGS_PRECOMPILE += -x c++-header -c ${QMAKE_PCH_INPUT} -o ${QMAKE_PCH_OUTPUT}
- QMAKE_CXXFLAGS_USE_PRECOMPILE = $$QMAKE_CFLAGS_USE_PRECOMPILE
- 
--QMAKE_LINK		= g++
--QMAKE_LINK_SHLIB	= g++
--QMAKE_LFLAGS		+=
-+QMAKE_LINK     = $(OE_QMAKE_LINK)
-+QMAKE_LINK_SHLIB   = $(OE_QMAKE_LINK)
-+QMAKE_LFLAGS       += $(OE_QMAKE_LDFLAGS)
- QMAKE_LFLAGS_RELEASE	+=
- QMAKE_LFLAGS_DEBUG	+=
- QMAKE_LFLAGS_APP	+=
-@@ -41,7 +41,7 @@
- QMAKE_LFLAGS_SONAME	+= -Wl,-soname,
- QMAKE_LFLAGS_THREAD	+=
- QMAKE_LFLAGS_NOUNDEF	+= -Wl,--no-undefined
--QMAKE_RPATH		= -Wl,-rpath,
-+QMAKE_RPATH        = -Wl,-rpath-link,
- 
- QMAKE_PCH_OUTPUT_EXT    = .gch
- 
---- /tmp/linux.conf	2008-07-08 10:32:18.000000000 +0200
-+++ qt-embedded-linux-opensource-src-4.4.0/mkspecs/common/linux.conf	2008-07-08 10:38:37.000000000 +0200
-@@ -7,26 +7,28 @@
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
-+
- 
- QMAKE_LIBS            =
- QMAKE_LIBS_DYNLOAD    = -ldl
--QMAKE_LIBS_X11        = -lXext -lX11 -lm
--QMAKE_LIBS_X11SM      = -lSM -lICE
-+QMAKE_LIBS_X11        = $(OE_QMAKE_LIBS_X11)
-+QMAKE_LIBS_X11SM      = $(OE_QMAKE_LIBS_X11SM)
- QMAKE_LIBS_NIS        = -lnsl
- QMAKE_LIBS_OPENGL     = -lGLU -lGL
- QMAKE_LIBS_OPENGL_QT  = -lGL
- QMAKE_LIBS_THREAD     = -lpthread
- 
--QMAKE_MOC             = $$[QT_INSTALL_BINS]/moc
--QMAKE_UIC             = $$[QT_INSTALL_BINS]/uic
-+QMAKE_MOC             = $(OE_QMAKE_MOC)
-+QMAKE_UIC             = $(OE_QMAKE_UIC)
-+QMAKE_RCC             = $(OE_QMAKE_RCC)
- 
--QMAKE_AR              = ar cqs
-+QMAKE_AR              = $(OE_QMAKE_AR) cqs
- QMAKE_OBJCOPY         = objcopy
- QMAKE_RANLIB          =
- 
-@@ -39,7 +40,7 @@
- QMAKE_MOVE            = mv -f
- QMAKE_DEL_FILE        = rm -f
- QMAKE_DEL_DIR         = rmdir
--QMAKE_STRIP           = strip
-+QMAKE_STRIP           = $(OE_QMAKE_STRIP)
- QMAKE_STRIPFLAGS_LIB += --strip-unneeded
- QMAKE_CHK_DIR_EXISTS  = test -d
- QMAKE_MKDIR           = mkdir -p
diff --git a/meta-oe/recipes-qt/qt4/files/0002-fix-resinit-declaration.patch b/meta-oe/recipes-qt/qt4/files/0002-fix-resinit-declaration.patch
deleted file mode 100644
index be4d5c0..0000000
--- a/meta-oe/recipes-qt/qt4/files/0002-fix-resinit-declaration.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From acfeb18aa94bad6b2066e91cd15570889baaa252 Mon Sep 17 00:00:00 2001
-From: Michael Krelin <hacker@klever.net>
-Date: Sat, 2 Jun 2007 16:04:01 +0200
-Subject: [PATCH] fix resinit declaration
-
----
- src/qt3support/network/q3dns.cpp |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-Index: qt-embedded-linux-opensource-src-4.4.3/src/qt3support/network/q3dns.cpp
-===================================================================
---- qt-embedded-linux-opensource-src-4.4.3.orig/src/qt3support/network/q3dns.cpp	2008-09-27 11:01:28.000000000 +0200
-+++ qt-embedded-linux-opensource-src-4.4.3/src/qt3support/network/q3dns.cpp	2009-03-26 17:04:05.000000000 +0100
-@@ -44,7 +44,7 @@
- # include <netinet/in.h>
- # include <arpa/nameser.h>
- # include <resolv.h>
--extern "C" int res_init();
-+extern "C" int res_init() throw();
- #endif
- 
- // POSIX Large File Support redefines open -> open64
diff --git a/meta-oe/recipes-qt/qt4/files/0004-no-qmake.patch b/meta-oe/recipes-qt/qt4/files/0004-no-qmake.patch
deleted file mode 100644
index a58b19f..0000000
--- a/meta-oe/recipes-qt/qt4/files/0004-no-qmake.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From f5a73ce944240de9013cc23288c115e8213add5e Mon Sep 17 00:00:00 2001
-From: Michael Krelin <hacker@klever.net>
-Date: Sat, 2 Jun 2007 16:06:59 +0200
-Subject: [PATCH] no qmake
-
-qmake is already built in qt4-tools-native, so disable it
-
-Ported from OE by: Yu Ke <ke.yu@intel.com>
-
----
- configure |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-Index: qt-embedded-linux-opensource-src-4.4.3/configure
-===================================================================
---- qt-embedded-linux-opensource-src-4.4.3.orig/configure	2009-03-26 17:03:43.000000000 +0100
-+++ qt-embedded-linux-opensource-src-4.4.3/configure	2009-03-26 17:04:17.000000000 +0100
-@@ -3786,7 +3786,7 @@
- }
- 
- # build qmake
--if true; then ###[ '!' -f "$outpath/bin/qmake" ];
-+if false; then ###[ '!' -f "$outpath/bin/qmake" ];
-     echo "Creating qmake. Please wait..."
- 
-     OLD_QCONFIG_H=
diff --git a/meta-oe/recipes-qt/qt4/files/0006-freetype-host-includes.patch b/meta-oe/recipes-qt/qt4/files/0006-freetype-host-includes.patch
deleted file mode 100644
index 081d899..0000000
--- a/meta-oe/recipes-qt/qt4/files/0006-freetype-host-includes.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From c9ab62bd9a56643574b3ae6e59e0ca776d4860d2 Mon Sep 17 00:00:00 2001
-From: Michael Krelin <hacker@klever.net>
-Date: Mon, 4 Jun 2007 14:48:50 +0200
-Subject: [PATCH] freetype host includes
-
-Host include path should not be used in corss compiling case.
-
-Ported from OE by: Yu Ke <ke.yu@intel.com>
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
diff --git a/meta-oe/recipes-qt/qt4/files/0008-qt-lib-infix.patch b/meta-oe/recipes-qt/qt4/files/0008-qt-lib-infix.patch
deleted file mode 100644
index a1b8912..0000000
--- a/meta-oe/recipes-qt/qt4/files/0008-qt-lib-infix.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Add lib infix to distinguish different qt compile version: e.g. "E" for embedded, "" for X11
-
-Ported from OE by: Yu Ke <ke.yu@intel.com>
-
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
diff --git a/meta-oe/recipes-qt/qt4/files/0009-support-2bpp.patch b/meta-oe/recipes-qt/qt4/files/0009-support-2bpp.patch
deleted file mode 100644
index cf44ea8..0000000
--- a/meta-oe/recipes-qt/qt4/files/0009-support-2bpp.patch
+++ /dev/null
@@ -1,299 +0,0 @@
-Add 2bpp support
-
-Ported from OE by: Yu Ke <ke.yu@intel.com>
-
-diff -urN qt-embedded-linux-opensource-src-4.4.3.orig/configure qt-embedded-linux-opensource-src-4.4.3/configure
---- qt-embedded-linux-opensource-src-4.4.3.orig/configure	2008-09-27 11:01:23.000000000 +0200
-+++ qt-embedded-linux-opensource-src-4.4.3/configure	2009-01-14 14:30:53.000000000 +0100
-@@ -5045,6 +5045,7 @@
-     echo "Choose pixel-depths to support:"
-     echo
-     echo "   1. 1bpp, black/white"
-+    echo "   2. 2bpp, grayscale"
-     echo "   4. 4bpp, grayscale"
-     echo "   8. 8bpp, paletted"
-     echo "  12. 12bpp, rgb 4-4-4"
-@@ -5063,11 +5064,11 @@
- fi
- if [ -n "$CFG_QWS_DEPTHS" -a "$PLATFORM_QWS" = "yes" ]; then
-     if [ "$CFG_QWS_DEPTHS" = "all" ]; then
--        CFG_QWS_DEPTHS="1 4 8 12 15 16 18 24 32 generic"
-+        CFG_QWS_DEPTHS="1 2 4 8 12 15 16 18 24 32 generic"
-     fi
-     for D in `echo "$CFG_QWS_DEPTHS" | sed -e 's/,/ /g'`; do
- 	case $D in
--	    1|4|8|12|15|16|18|24|32) QCONFIG_FLAGS="$QCONFIG_FLAGS QT_QWS_DEPTH_$D";;
-+	    1|2|4|8|12|15|16|18|24|32) QCONFIG_FLAGS="$QCONFIG_FLAGS QT_QWS_DEPTH_$D";;
- 	    generic) QCONFIG_FLAGS="$QCONFIG_FLAGS QT_QWS_DEPTH_GENERIC";;
- 	esac
-     done
-diff -urN qt-embedded-linux-opensource-src-4.4.3.orig/src/gui/embedded/qscreenlinuxfb_qws.cpp qt-embedded-linux-opensource-src-4.4.3/src/gui/embedded/qscreenlinuxfb_qws.cpp
---- qt-embedded-linux-opensource-src-4.4.3.orig/src/gui/embedded/qscreenlinuxfb_qws.cpp	2008-09-27 11:01:28.000000000 +0200
-+++ qt-embedded-linux-opensource-src-4.4.3/src/gui/embedded/qscreenlinuxfb_qws.cpp	2009-01-14 17:22:34.000000000 +0100
-@@ -404,8 +404,8 @@
-         setupOffScreen();
- 
-     // Now read in palette
--    if((vinfo.bits_per_pixel==8) || (vinfo.bits_per_pixel==4)) {
--        screencols= (vinfo.bits_per_pixel==8) ? 256 : 16;
-+    if((vinfo.bits_per_pixel==8) || (vinfo.bits_per_pixel==4) || (vinfo.bits_per_pixel==2)) {
-+        screencols= 1 << vinfo.bits_per_pixel;
-         int loopc;
-         fb_cmap startcmap;
-         startcmap.start=0;
-diff -urN qt-embedded-linux-opensource-src-4.4.3.orig/src/gui/embedded/qscreen_qws.cpp qt-embedded-linux-opensource-src-4.4.3/src/gui/embedded/qscreen_qws.cpp
---- qt-embedded-linux-opensource-src-4.4.3.orig/src/gui/embedded/qscreen_qws.cpp	2008-09-27 11:01:28.000000000 +0200
-+++ qt-embedded-linux-opensource-src-4.4.3/src/gui/embedded/qscreen_qws.cpp	2009-01-14 17:22:44.000000000 +0100
-@@ -444,6 +444,58 @@
- }
- #endif // QT_QWS_DEPTH_4
- 
-+#ifdef QT_QWS_DEPTH_2
-+static inline void qt_rectfill_gray2(quint8 *dest, quint8 value,
-+                                     int x, int y, int width, int height,
-+                                     int stride)
-+{
-+    const int pixelsPerByte = 4;
-+    const int alignWidth = qMin(width, (4 - (x & 3)) & 3);
-+    const int doAlign = (alignWidth > 0 ? 1 : 0);
-+    const int alignStart = pixelsPerByte - 1 - (x & 3);
-+    const int alignStop = alignStart - (alignWidth - 1);
-+    const quint8 alignMask = ((1 << (2 * alignWidth)) - 1) << (2 * alignStop);
-+    const int tailWidth = (width - alignWidth) & 3;
-+    const int doTail = (tailWidth > 0 ? 1 : 0);
-+    const quint8 tailMask = (1 << (2 * (pixelsPerByte - tailWidth))) - 1;
-+    const int width8 = (width - alignWidth) / pixelsPerByte;
-+
-+    dest += y * stride + x / pixelsPerByte;
-+    stride -= (doAlign + width8);
-+
-+    for (int j = 0; j < height; ++j) {
-+        if (doAlign) {
-+            *dest = (*dest & ~alignMask) | (value & alignMask);
-+            ++dest;
-+        }
-+        if (width8) {
-+            qt_memfill<quint8>(dest, value, width8);
-+            dest += width8;
-+        }
-+        if (doTail)
-+            *dest = (*dest & tailMask) | (value & ~tailMask);
-+        dest += stride;
-+    }
-+}
-+
-+static void solidFill_gray2(QScreen *screen, const QColor &color,
-+                            const QRegion &region)
-+{
-+    quint8 *dest = reinterpret_cast<quint8*>(screen->base());
-+    const quint8 c = qGray(color.rgba()) >> 6;
-+    const quint8 c8 = (c << 6) | (c << 4) | (c << 2) | c;
-+
-+    const int stride = screen->linestep();
-+    const QVector<QRect> rects = region.rects();
-+
-+    for (int i = 0; i < rects.size(); ++i) {
-+        const QRect r = rects.at(i);
-+        qt_rectfill_gray2(dest, c8, r.x(), r.y(), r.width(), r.height(),
-+                          stride);
-+    }
-+}
-+#endif // QT_QWS_DEPTH_2
-+
- #ifdef QT_QWS_DEPTH_1
- static inline void qt_rectfill_mono(quint8 *dest, quint8 value,
-                                     int x, int y, int width, int height,
-@@ -551,6 +603,11 @@
-         screen->d_ptr->solidFill = solidFill_gray4;
-         break;
- #endif
-+#ifdef QT_QWS_DEPTH_2
-+    case 2:
-+        screen->d_ptr->solidFill = solidFill_gray2;
-+        break;
-+#endif
- #ifdef QT_QWS_DEPTH_1
-     case 1:
-         screen->d_ptr->solidFill = solidFill_mono;
-@@ -958,6 +1015,149 @@
- }
- #endif // QT_QWS_DEPTH_4
- 
-+#ifdef QT_QWS_DEPTH_2
-+
-+struct qgray2 { quint8 dummy; } Q_PACKED;
-+
-+template <typename SRC>
-+static inline quint8 qt_convertToGray2(SRC color);
-+
-+template <>
-+inline quint8 qt_convertToGray2(quint32 color)
-+{
-+    return qGray(color) >> 6;
-+}
-+
-+template <>
-+inline quint8 qt_convertToGray2(quint16 color)
-+{
-+    const int r = (color & 0xf800) >> 11;
-+    const int g = (color & 0x07e0) >> 6; // only keep 5 bit
-+    const int b = (color & 0x001f);
-+    return (r * 11 + g * 16 + b * 5) >> 8;
-+}
-+
-+template <>
-+inline quint8 qt_convertToGray2(qrgb444 color)
-+{
-+    return qt_convertToGray2(quint32(color));
-+}
-+
-+template <>
-+inline quint8 qt_convertToGray2(qargb4444 color)
-+{
-+    return qt_convertToGray2(quint32(color));
-+}
-+
-+template <typename SRC>
-+static inline void qt_rectconvert_gray2(qgray2 *dest2, const SRC *src,
-+                                        int x, int y, int width, int height,
-+                                        int dstStride, int srcStride)
-+{
-+    const int pixelsPerByte = 4;
-+    quint8 *dest8 = reinterpret_cast<quint8*>(dest2)
-+                    + y * dstStride + x / pixelsPerByte;
-+    const int alignWidth = qMin(width, (4 - (x & 3)) & 3);
-+    const int doAlign = (alignWidth > 0 ? 1 : 0);
-+    const int alignStart = pixelsPerByte - 1 - (x & 3);
-+    const int alignStop = alignStart - (alignWidth - 1);
-+    const quint8 alignMask = ((1 << (2 * alignWidth)) - 1) << (2 * alignStop);
-+    const int tailWidth = (width - alignWidth) & 3;
-+    const int doTail = (tailWidth > 0 ? 1 : 0);
-+    const quint8 tailMask = (1 << (2 * (pixelsPerByte - tailWidth))) - 1;
-+    const int width8 = (width - alignWidth) / pixelsPerByte;
-+
-+    srcStride = srcStride / sizeof(SRC) - (width8 * pixelsPerByte + alignWidth);
-+    dstStride -= (width8 + doAlign);
-+
-+    for (int j = 0;  j < height; ++j) {
-+        if (doAlign) {
-+            quint8 d = *dest8 & ~alignMask;
-+            for (int i = alignStart; i >= alignStop; --i)
-+                d |= qt_convertToGray2<SRC>(*src++) << (2 * i);
-+            *dest8++ = d;
-+        }
-+        for (int i = 0; i < width8; ++i) {
-+            *dest8 = (qt_convertToGray2<SRC>(src[0]) << 6)
-+                     | (qt_convertToGray2<SRC>(src[1]) << 4)
-+                     | (qt_convertToGray2<SRC>(src[2]) << 2)
-+                     | (qt_convertToGray2<SRC>(src[3]));
-+            src += 4;
-+            ++dest8;
-+        }
-+        if (doTail) {
-+            quint8 d = *dest8 & tailMask;
-+            switch (tailWidth) {
-+            case 3: d |= qt_convertToGray2<SRC>(src[2]) << 2;
-+            case 2: d |= qt_convertToGray2<SRC>(src[1]) << 4;
-+            case 1: d |= qt_convertToGray2<SRC>(src[0]) << 6;
-+            }
-+            *dest8 = d;
-+        }
-+
-+        dest8 += dstStride;
-+        src += srcStride;
-+    }
-+}
-+
-+template <>
-+void qt_rectconvert(qgray2 *dest, const quint32 *src,
-+                    int x, int y, int width, int height,
-+                    int dstStride, int srcStride)
-+{
-+    qt_rectconvert_gray2<quint32>(dest, src, x, y, width, height,
-+                                  dstStride, srcStride);
-+}
-+
-+template <>
-+void qt_rectconvert(qgray2 *dest, const quint16 *src,
-+                    int x, int y, int width, int height,
-+                    int dstStride, int srcStride)
-+{
-+    qt_rectconvert_gray2<quint16>(dest, src, x, y, width, height,
-+                                  dstStride, srcStride);
-+}
-+
-+template <>
-+void qt_rectconvert(qgray2 *dest, const qrgb444 *src,
-+                    int x, int y, int width, int height,
-+                    int dstStride, int srcStride)
-+{
-+    qt_rectconvert_gray2<qrgb444>(dest, src, x, y, width, height,
-+                                  dstStride, srcStride);
-+}
-+
-+template <>
-+void qt_rectconvert(qgray2 *dest, const qargb4444 *src,
-+                    int x, int y, int width, int height,
-+                    int dstStride, int srcStride)
-+{
-+    qt_rectconvert_gray2<qargb4444>(dest, src, x, y, width, height,
-+                                    dstStride, srcStride);
-+}
-+
-+static void blit_2(QScreen *screen, const QImage &image,
-+                   const QPoint &topLeft, const QRegion &region)
-+{
-+    switch (image.format()) {
-+    case QImage::Format_ARGB32_Premultiplied:
-+        blit_template<qgray2, quint32>(screen, image, topLeft, region);
-+        return;
-+    case QImage::Format_RGB16:
-+        blit_template<qgray2, quint16>(screen, image, topLeft, region);
-+        return;
-+    case QImage::Format_RGB444:
-+        blit_template<qgray2, qrgb444>(screen, image, topLeft, region);
-+        return;
-+    case QImage::Format_ARGB4444_Premultiplied:
-+        blit_template<qgray2, qargb4444>(screen, image, topLeft, region);
-+        return;
-+    default:
-+        qCritical("blit_2(): Image format %d not supported!", image.format());
-+    }
-+}
-+#endif // QT_QWS_DEPTH_2
-+
- #ifdef QT_QWS_DEPTH_1
- 
- struct qmono { quint8 dummy; } Q_PACKED;
-@@ -1206,6 +1406,11 @@
-         screen->d_ptr->blit = blit_4;
-         break;
- #endif
-+#ifdef QT_QWS_DEPTH_2
-+    case 2:
-+        screen->d_ptr->blit = blit_2;
-+        break;
-+#endif
- #ifdef QT_QWS_DEPTH_1
-     case 1:
-         screen->d_ptr->blit = blit_1;
-@@ -2056,6 +2261,8 @@
-         }
-     } else if (d == 4) {
-         ret = qGray(r, g, b) >> 4;
-+    } else if (d == 2) {
-+        ret = qGray(r, g, b) >> 6;
-     } else if (d == 1) {
-         ret = qGray(r, g, b) >= 128;
-     } else {
-@@ -2126,6 +2333,10 @@
-     } else if(d==1) {
-         return true;
- #endif
-+#ifdef QT_QWS_DEPTH_2
-+    } else if(d==2) {
-+        return true;
-+#endif
- #ifdef QT_QWS_DEPTH_4
-     } else if(d==4) {
-         return true;
diff --git a/meta-oe/recipes-qt/qt4/files/0010-no-simpledecoration-example.patch b/meta-oe/recipes-qt/qt4/files/0010-no-simpledecoration-example.patch
deleted file mode 100644
index e527369..0000000
--- a/meta-oe/recipes-qt/qt4/files/0010-no-simpledecoration-example.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-
-Ported from OE by: Yu Ke <ke.yu@intel.com>
-
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
diff --git a/meta-oe/recipes-qt/qt4/files/common.pro b/meta-oe/recipes-qt/qt4/files/common.pro
deleted file mode 100644
index 382d93f..0000000
--- a/meta-oe/recipes-qt/qt4/files/common.pro
+++ /dev/null
@@ -1,108 +0,0 @@
-#====================================================================================
-# common.pro (C) 2004 Michael 'Mickey' Lauer <mickey@Vanille.de>
-#====================================================================================
-#
-# Purpose: This file contains qmake scope rules of common usage
-#
-# Example: When building a qmake based application using libsdl,
-#          use CONFIG+=sdl to add the proper include and library
-#          paths and definitions to the resulting Makefile
-#
-#
-# General problem: One has to decide between evaluation at makefile generation time
-#                  and evaluation at makefile processing time.
-#                  The following example illustrates the difference:
-#
-# Evaluation at makefile processing time:
-#
-# sdl {
-#     QMAKE_CFLAGS    += `sdl-config --cflags`
-#     LIBS            += `sdl-config --libs`
-# }
-#
-# Evalutation at makefile generation time:
-#
-# sdl {
-#     QMAKE_CFLAGS    += $$system( sdl-config --cflags )
-#     LIBS            += `sdl-config --libs`
-# }
-#
-# For now I use version 2 which is a bit faster
-# See the fine qmake manual for more details
-#
-#
-
-#=============================================================================
-# pthread scope for multithreaded applications
-#
-
-pthread {
-    LIBS += -lpthread
-}
-
-#=============================================================================
-# sdl scopes for applications using the Simple Direct Media Layer (SDL)
-#
-
-sdl {
-    QMAKE_CXXFLAGS  += $$system( sdl-config --cflags )
-    DEFINES         += USE_SDL QTOPIA
-    LIBS            += $$system( sdl-config --libs )
-}
-
-sdl-mixer {
-    LIBS            += -lSDL_mixer
-}
-
-sdl-image {
-    LIBS            += -lSDL_image
-}
-
-sdl-font {
-    LIBS            += -lSDL_ttf
-}
-
-#=============================================================================
-#
-#
-
-opie {
-    DEFINES         += QWS
-}
-
-opiecore {
-    LIBS            += -lopiecore2
-}
-
-opieui {
-    CONFIG          += opiecore
-    LIBS            += -lopieui2
-}
-
-opienet {
-    CONFIG          += opiecore
-    LIBS            += -lopienet2
-}
-
-opiepim {
-    CONFIG          += opiecore
-    LIBS            += -lopiepim2
-}
-
-opiedb {
-    CONFIG          += opiecore
-    LIBS            += -lopiedb2
-}
-
-opiemm {
-    CONFIG          += opiecore
-    LIBS            += -lopiemm2
-}
-
-#=============================================================================
-#
-#
-
-#=============================================================================
-#
-#
diff --git a/meta-oe/recipes-qt/qt4/files/compile.test-lflags.patch b/meta-oe/recipes-qt/qt4/files/compile.test-lflags.patch
deleted file mode 100644
index e4b256b..0000000
--- a/meta-oe/recipes-qt/qt4/files/compile.test-lflags.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: qt-everywhere-opensource-src-4.6.3/config.tests/unix/compile.test
-===================================================================
---- qt-everywhere-opensource-src-4.6.3.orig/config.tests/unix/compile.test	2010-06-02 06:03:18.000000000 +0400
-+++ qt-everywhere-opensource-src-4.6.3/config.tests/unix/compile.test	2010-10-04 17:35:07.587783460 +0400
-@@ -11,7 +11,7 @@
- EXE=`basename "$6"`
- DESCRIPTION=$7
- shift 7
--LFLAGS=""
-+LFLAGS="$LDFLAGS"
- INCLUDEPATH=""
- CXXFLAGS=""
- MAC_ARCH_CXXFLAGS=""
diff --git a/meta-oe/recipes-qt/qt4/files/configure-lflags.patch b/meta-oe/recipes-qt/qt4/files/configure-lflags.patch
deleted file mode 100644
index df19549..0000000
--- a/meta-oe/recipes-qt/qt4/files/configure-lflags.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: qtopia-core-opensource-src-4.3.3/configure
-===================================================================
---- qtopia-core-opensource-src-4.3.3.orig/configure	2008-01-14 08:53:51.000000000 +0000
-+++ qtopia-core-opensource-src-4.3.3/configure	2008-01-14 08:54:07.000000000 +0000
-@@ -447,7 +447,7 @@
- # initalize variables
- #-------------------------------------------------------------------------------
- 
--SYSTEM_VARIABLES="CC CXX CFLAGS CXXFLAGS LDFLAGS"
-+SYSTEM_VARIABLES="CC CXX CFLAGS CXXFLAGS LDFLAGS LFLAGS"
- for varname in $SYSTEM_VARIABLES; do
-     cmd=`echo \
- 'if [ -n "\$'${varname}'" ]; then
diff --git a/meta-oe/recipes-qt/qt4/files/configure-paths.patch b/meta-oe/recipes-qt/qt4/files/configure-paths.patch
deleted file mode 100644
index c9259a1..0000000
--- a/meta-oe/recipes-qt/qt4/files/configure-paths.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Index: qt-everywhere-opensource-src-4.6.3/configure
-===================================================================
---- qt-everywhere-opensource-src-4.6.3.orig/configure	2011-01-10 15:47:37.100607001 +0000
-+++ qt-everywhere-opensource-src-4.6.3/configure	2011-01-10 15:49:14.576606999 +0000
-@@ -7198,11 +7198,11 @@
- QMAKE_MOC_SRC    = \$\$QT_BUILD_TREE/src/moc
- 
- #local paths that cannot be queried from the QT_INSTALL_* properties while building QTDIR
--QMAKE_MOC        = \$\$QT_BUILD_TREE/bin/moc
--QMAKE_UIC        = \$\$QT_BUILD_TREE/bin/uic
--QMAKE_UIC3       = \$\$QT_BUILD_TREE/bin/uic3
--QMAKE_RCC        = \$\$QT_BUILD_TREE/bin/rcc
--QMAKE_QDBUSXML2CPP = \$\$QT_BUILD_TREE/bin/qdbusxml2cpp
-+QMAKE_MOC        = \${OE_QMAKE_MOC}
-+QMAKE_UIC        = \${OE_QMAKE_UIC}
-+QMAKE_UIC3       = \${OE_QMAKE_UIC3}
-+QMAKE_RCC        = \${OE_QMAKE_RCC}
-+QMAKE_QDBUSXML2CPP = \${OE_QMAKE_QDBUSXML2CPP}
- QMAKE_INCDIR_QT  = \$\$QT_BUILD_TREE/include
- QMAKE_LIBDIR_QT  = \$\$QT_BUILD_TREE/lib
- 
diff --git a/meta-oe/recipes-qt/qt4/files/fix-config-tests.patch b/meta-oe/recipes-qt/qt4/files/fix-config-tests.patch
deleted file mode 100644
index 2105455..0000000
--- a/meta-oe/recipes-qt/qt4/files/fix-config-tests.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Fix invocation in case of "ccache some-compiler-gcc". As the command "ccache some-compiler-gcc" will not exist but "ccache" will.
-
-both visibility and relocs were affected.
-
-Ported from OE by: Yu Ke <ke.yu@intel.com>
-
-Index: qt-x11-opensource-src-4.5.2/config.tests/unix/bsymbolic_functions.test
-===================================================================
---- qt-x11-opensource-src-4.5.2.orig/config.tests/unix/bsymbolic_functions.test 2009-08-01 08:01:11.000000000 +0200
-+++ qt-x11-opensource-src-4.5.2/config.tests/unix/bsymbolic_functions.test      2009-08-01 08:01:16.000000000 +0200
-@@ -8,7 +8,7 @@
- int main() { return 0; }
- EOF
- 
--"$COMPILER" -o libtest.so -shared -Wl,-Bsymbolic-functions -fPIC bsymbolic_functions.c >/dev/null 2>&1 && BSYMBOLIC_FUNCTIONS_SUPPORT=yes
-+$COMPILER -o libtest.so -shared -Wl,-Bsymbolic-functions -fPIC bsymbolic_functions.c >/dev/null 2>&1 && BSYMBOLIC_FUNCTIONS_SUPPORT=yes
- rm -f bsymbolic_functions.c libtest.so
- 
- # done
-Index: qt-x11-opensource-src-4.5.2/config.tests/unix/fvisibility.test
-===================================================================
---- qt-x11-opensource-src-4.5.2.orig/config.tests/unix/fvisibility.test 2009-06-20 06:57:50.000000000 +0200
-+++ qt-x11-opensource-src-4.5.2/config.tests/unix/fvisibility.test      2009-08-01 07:59:05.000000000 +0200
-@@ -15,9 +15,9 @@
- EOF
- 
-     if [ "$VERBOSE" = "yes" ] ; then
--        "$COMPILER" -c -fvisibility=hidden fvisibility.c && FVISIBILITY_SUPPORT=yes
-+        $COMPILER -c -fvisibility=hidden fvisibility.c && FVISIBILITY_SUPPORT=yes
-     else
--        "$COMPILER" -c -fvisibility=hidden fvisibility.c >/dev/null 2>&1 && FVISIBILITY_SUPPORT=yes
-+        $COMPILER -c -fvisibility=hidden fvisibility.c >/dev/null 2>&1 && FVISIBILITY_SUPPORT=yes
-     fi
-     rm -f fvisibility.c fvisibility.o
- }
-
diff --git a/meta-oe/recipes-qt/qt4/files/g++.conf b/meta-oe/recipes-qt/qt4/files/g++.conf
deleted file mode 100644
index 4cd76e6..0000000
--- a/meta-oe/recipes-qt/qt4/files/g++.conf
+++ /dev/null
@@ -1,53 +0,0 @@
-#
-# qmake configuration for common gcc
-#
-
-QMAKE_CC       = $(OE_QMAKE_CC)
-QMAKE_CFLAGS       += -pipe $(OE_QMAKE_CFLAGS)
-QMAKE_CFLAGS_DEPS	+= -M
-QMAKE_CFLAGS_WARN_ON	+= -Wall -W
-QMAKE_CFLAGS_WARN_OFF	+= -w
-QMAKE_CFLAGS_RELEASE	+= 
-QMAKE_CFLAGS_DEBUG	+= -g
-QMAKE_CFLAGS_SHLIB	+= -fPIC
-QMAKE_CFLAGS_STATIC_LIB	+= -fPIC
-QMAKE_CFLAGS_YACC	+= -Wno-unused -Wno-parentheses
-QMAKE_CFLAGS_HIDESYMS   += -fvisibility=hidden
-QMAKE_CFLAGS_PRECOMPILE += -x c-header -c ${QMAKE_PCH_INPUT} -o ${QMAKE_PCH_OUTPUT}
-QMAKE_CFLAGS_USE_PRECOMPILE += -include ${QMAKE_PCH_OUTPUT_BASE}
-
-QMAKE_CXX      = $(OE_QMAKE_CXX)
-QMAKE_CXXFLAGS     += $$QMAKE_CFLAGS $(OE_QMAKE_CXXFLAGS)
-QMAKE_CXXFLAGS_DEPS	+= $$QMAKE_CFLAGS_DEPS
-QMAKE_CXXFLAGS_WARN_ON	+= $$QMAKE_CFLAGS_WARN_ON
-QMAKE_CXXFLAGS_WARN_OFF	+= $$QMAKE_CFLAGS_WARN_OFF
-QMAKE_CXXFLAGS_RELEASE	+= $$QMAKE_CFLAGS_RELEASE
-QMAKE_CXXFLAGS_DEBUG	+= $$QMAKE_CFLAGS_DEBUG
-QMAKE_CXXFLAGS_SHLIB	+= $$QMAKE_CFLAGS_SHLIB
-QMAKE_CXXFLAGS_STATIC_LIB += $$QMAKE_CFLAGS_STATIC_LIB
-QMAKE_CXXFLAGS_YACC	+= $$QMAKE_CFLAGS_YACC
-QMAKE_CXXFLAGS_HIDESYMS += $$QMAKE_CFLAGS_HIDESYMS -fvisibility-inlines-hidden
-QMAKE_CXXFLAGS_PRECOMPILE += -x c++-header -c ${QMAKE_PCH_INPUT} -o ${QMAKE_PCH_OUTPUT}
-QMAKE_CXXFLAGS_USE_PRECOMPILE = $$QMAKE_CFLAGS_USE_PRECOMPILE
-
-QMAKE_LINK     = $(OE_QMAKE_LINK)
-QMAKE_LINK_SHLIB   = $(OE_QMAKE_LINK)
-QMAKE_LFLAGS       += $(OE_QMAKE_LDFLAGS)
-QMAKE_LFLAGS_RELEASE	+=
-QMAKE_LFLAGS_DEBUG	+=
-QMAKE_LFLAGS_APP	+=
-QMAKE_LFLAGS_SHLIB	+= -shared
-QMAKE_LFLAGS_PLUGIN	+= $$QMAKE_LFLAGS_SHLIB
-QMAKE_LFLAGS_SONAME	+= -Wl,-soname,
-QMAKE_LFLAGS_THREAD	+=
-QMAKE_LFLAGS_NOUNDEF	+= -Wl,--no-undefined
-QMAKE_RPATH        = -Wl,-rpath-link,
-
-QMAKE_PCH_OUTPUT_EXT    = .gch
-
-# -Bsymbolic-functions (ld) support
-QMAKE_LFLAGS_BSYMBOLIC_FUNC = -Wl,-Bsymbolic-functions
-QMAKE_LFLAGS_DYNAMIC_LIST = -Wl,--dynamic-list,
-
-# for the SDK
-isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG = $(OE_QMAKE_QT_CONFIG)
diff --git a/meta-oe/recipes-qt/qt4/files/hack-out-pg_config.patch b/meta-oe/recipes-qt/qt4/files/hack-out-pg_config.patch
deleted file mode 100644
index 650ed77..0000000
--- a/meta-oe/recipes-qt/qt4/files/hack-out-pg_config.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Hack to not use the pg_config of the host system which will add /usr/include
-
-pg_config is a native binary so using that when cross compiling
-will always fail.  The commented out fix would do, but for OE
-our -platform and -xplatform is the same so we are actually not
-really cross compiling. Just comment out the test, we are passing
-the location to the postgres headers and if they are okay we
-will padd.
-
-Ported from OE by: Yu Ke <ke.yu@intel.com>
-
-Index: qt-embedded-linux-opensource-src-4.5.2/configure
-===================================================================
---- qt-embedded-linux-opensource-src-4.5.2.orig/configure	2009-08-10 03:03:04.000000000 +0200
-+++ qt-embedded-linux-opensource-src-4.5.2/configure	2009-08-10 03:58:11.000000000 +0200
-@@ -4401,10 +4402,10 @@
-             ;;
-         psql)
-             if [ "$CFG_SQL_psql" != "no" ]; then
--                if "$WHICH" pg_config >/dev/null 2>&1; then
--                    QT_CFLAGS_PSQL=`pg_config --includedir 2>/dev/null`
--                    QT_LFLAGS_PSQL=`pg_config --libdir 2>/dev/null`
--                fi
-+#                if [ "$QT_CROSS_COMPILE" = "no" ] && "$WHICH" pg_config >/dev/null 2>&1; then
-+#                    QT_CFLAGS_PSQL=`pg_config --includedir 2>/dev/null`
-+#                    QT_LFLAGS_PSQL=`pg_config --libdir 2>/dev/null`
-+#                fi
-                 [ -z "$QT_CFLAGS_PSQL" ] || QT_CFLAGS_PSQL="-I$QT_CFLAGS_PSQL"
-                 [ -z "$QT_LFLAGS_PSQL" ] || QT_LFLAGS_PSQL="-L$QT_LFLAGS_PSQL"
-                 if "$unixtests/compile.test" "$XQMAKESPEC" "$QMAKE_CONFIG" $OPT_VERBOSE "$relpath" "$outpath" config.tests/unix/psql "PostgreSQL" $QT_LFLAGS_PSQL $L_FLAGS $QT_CFLAGS_PSQL $I_FLAGS $l_FLAGS $MAC_ARCHS_COMMANDLINE; then
diff --git a/meta-oe/recipes-qt/qt4/files/linux-oe-qmake.conf b/meta-oe/recipes-qt/qt4/files/linux-oe-qmake.conf
deleted file mode 100644
index 205b693..0000000
--- a/meta-oe/recipes-qt/qt4/files/linux-oe-qmake.conf
+++ /dev/null
@@ -1,82 +0,0 @@
-#
-# qmake configuration for linux-oe-g++ / OpenEmbedded Build System / http://openembedded.org
-#
-
-MAKEFILE_GENERATOR	= UNIX
-TEMPLATE		= app
-CONFIG			+= qt warn_on release
-
-QMAKE_CC		= $(OE_QMAKE_CC)
-QMAKE_LEX		= flex
-QMAKE_LEXFLAGS		=
-QMAKE_YACC		= yacc
-QMAKE_YACCFLAGS		= -d
-QMAKE_CFLAGS		= -pipe $(OE_QMAKE_CFLAGS) $(CFLAGS_EXTRA)
-QMAKE_CFLAGS_WARN_ON	= -Wall -W
-QMAKE_CFLAGS_WARN_OFF	=
-QMAKE_CFLAGS_RELEASE	= $(if $(CFLAGS_RELEASE),$(CFLAGS_RELEASE), -O2)
-QMAKE_CFLAGS_DEBUG	= -g
-QMAKE_CFLAGS_SHLIB	= -fPIC
-QMAKE_CFLAGS_YACC	= -Wno-unused -Wno-parentheses
-QMAKE_CFLAGS_THREAD	= -D_REENTRANT
-
-QMAKE_CXX		= $(OE_QMAKE_CXX)
-QMAKE_CXXFLAGS		= $$QMAKE_CFLAGS $(OE_QMAKE_CXXFLAGS) $(CXXFLAGS_EXTRA)
-QMAKE_CXXFLAGS_WARN_ON	= $$QMAKE_CFLAGS_WARN_ON
-QMAKE_CXXFLAGS_WARN_OFF	= $$QMAKE_CFLAGS_WARN_OFF
-QMAKE_CXXFLAGS_RELEASE	= $$QMAKE_CFLAGS_RELEASE
-QMAKE_CXXFLAGS_DEBUG	= $$QMAKE_CFLAGS_DEBUG
-QMAKE_CXXFLAGS_SHLIB	= $$QMAKE_CFLAGS_SHLIB
-QMAKE_CXXFLAGS_YACC	= $$QMAKE_CFLAGS_YACC
-QMAKE_CXXFLAGS_THREAD	= $$QMAKE_CFLAGS_THREAD
-
-QMAKE_INCDIR		=
-QMAKE_LIBDIR		=
-QMAKE_INCDIR_X11	= 
-QMAKE_LIBDIR_X11	= 
-QMAKE_INCDIR_QT		= $(OE_QMAKE_INCDIR_QT)
-QMAKE_LIBDIR_QT		= $(OE_QMAKE_LIBDIR_QT)
-QMAKE_INCDIR_OPENGL	=
-QMAKE_LIBDIR_OPENGL	=
-
-QMAKE_LINK		= $(OE_QMAKE_LINK)
-QMAKE_LINK_SHLIB	= $(OE_QMAKE_LINK)
-QMAKE_LFLAGS		= $(OE_QMAKE_LDFLAGS) $(LFLAGS_EXTRA)
-QMAKE_LFLAGS_RELEASE	=
-QMAKE_LFLAGS_DEBUG	=
-QMAKE_LFLAGS_SHLIB      = -shared
-QMAKE_LFLAGS_PLUGIN     = $$QMAKE_LFLAGS_SHLIB
-QMAKE_LFLAGS_SONAME     = -Wl,-soname,
-QMAKE_LFLAGS_THREAD     =
-QMAKE_RPATH             = -Wl,-rpath-link,
-
-QMAKE_LIBS		= $(LIBS_EXTRA)
-QMAKE_LIBS_DYNLOAD      = -ldl
-QMAKE_LIBS_X11		= $(OE_QMAKE_LIBS_X11)
-QMAKE_LIBS_X11SM	= 
-QMAKE_LIBS_QT		= -l$(OE_QMAKE_LIBS_QT)
-QMAKE_LIBS_QT_THREAD    = -l$(OE_QMAKE_LIBS_QT)-mt
-QMAKE_LIBS_OPENGL	= $(OE_QMAKE_LIBS_OPENGL)
-QMAKE_LIBS_OPENGL_QT	= $(OE_QMAKE_LIBS_OPENGL_QT)
-QMAKE_LIBS_THREAD       = -lpthread
-
-QMAKE_MOC		= $(OE_QMAKE_MOC)
-QMAKE_UIC		= $(OE_QMAKE_UIC)
-
-QMAKE_AR		= $(OE_QMAKE_AR) cqs
-QMAKE_RANLIB		=
-
-QMAKE_TAR		= tar -cf
-QMAKE_GZIP		= gzip -9f
-
-QMAKE_COPY		= cp -f
-QMAKE_COPY_FILE         = $(COPY)
-QMAKE_COPY_DIR          = $(COPY) -r
-QMAKE_MOVE		= mv -f
-QMAKE_DEL_FILE		= rm -f
-QMAKE_DEL_DIR		= rmdir
-QMAKE_STRIP             = $(OE_QMAKE_STRIP)
-QMAKE_STRIPFLAGS_LIB	+= --strip-unneeded
-QMAKE_CHK_DIR_EXISTS	= test -d
-QMAKE_MKDIR		= mkdir -p
-
diff --git a/meta-oe/recipes-qt/qt4/files/linux.conf b/meta-oe/recipes-qt/qt4/files/linux.conf
deleted file mode 100644
index 90b8d65..0000000
--- a/meta-oe/recipes-qt/qt4/files/linux.conf
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
-QMAKE_LIBS            =
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
-QMAKE_OBJCOPY         = objcopy
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
diff --git a/meta-oe/recipes-qt/qt4/files/mips-relocate.patch b/meta-oe/recipes-qt/qt4/files/mips-relocate.patch
deleted file mode 100644
index 2fde9a0..0000000
--- a/meta-oe/recipes-qt/qt4/files/mips-relocate.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Disable the LDFLAGS "-Bsymbolic-functions" for mips
-
-"-Bsymbolic-functions" flag makes ld to bind the global function symbol of shared library at compiling time, thus reduce the runtime relocation cost.
-
-However, this flag in binutil 2.20 cause QT4 mips building failure, which is "final link failed: Bad value" error in libQtWebKit.so linking stage. If downgrad to binutil 2.19, this error disappears. further investigation showes commit http://sourceware.org/cgi-bin/cvsweb.cgi/src/ld/scripttempl/mips.sc.diff?r1=1.2&r2=1.3&cvsroot=src cause this error.
-
-So this patch disable this flag for QT4 mips. If future binutils version fix this issue, this patch can be safely removed.
-
-Signed-off-by: Yu Ke <ke.yu@intel.com>
-
-diff --git a/configure b/configure
-index ca14279..5db9926 100755
---- a/configure
-+++ b/configure
-@@ -3035,6 +3035,13 @@ if [ "$CFG_REDUCE_RELOCATIONS" != "no" ]; then
-     fi
- fi
- 
-+# Temporily disable -Bsymbolic-functions for mips, because libQtWebKit can not pass the build
-+# if has -Bsymbolic-functions and binutil 2.20
-+# -Bsymbolic-functions is OK in binutil 2.19
-+if [ "$CFG_ARCH" = "mips" ]; then
-+    CFG_REDUCE_RELOCATIONS=no
-+fi
-+
- # auto-detect GNU make support
- if [ "$CFG_USE_GNUMAKE" = "auto" ] && "$MAKE" -v | grep "GNU Make" >/dev/null 2>&1; then
-    CFG_USE_GNUMAKE=yes
diff --git a/meta-oe/recipes-qt/qt4/files/qmake-exists-check.patch b/meta-oe/recipes-qt/qt4/files/qmake-exists-check.patch
deleted file mode 100644
index cc73837..0000000
--- a/meta-oe/recipes-qt/qt4/files/qmake-exists-check.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-qt4-tools-nativesdk: avoid rebuilding qmake
-
-qt4-tools-nativesdk patch to avoids building qmake in configure if it already exists 
-(as it will, since we symlink it in from the native sysroot in do_configure)
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
---- qt-everywhere-opensource-src-4.6.3.orig/configure	2011-01-10 12:01:56.260607001 +0000
-+++ qt-everywhere-opensource-src-4.6.3/configure	2011-01-10 12:02:20.584607015 +0000
-@@ -4286,7 +4286,7 @@
- }
- 
- # build qmake
--if true; then ###[ '!' -f "$outpath/bin/qmake" ];
-+if [ '!' -f "$outpath/bin/qmake" ]; then
-     echo "Creating qmake. Please wait..."
- 
-     OLD_QCONFIG_H=
diff --git a/meta-oe/recipes-qt/qt4/files/qmake-hack.diff b/meta-oe/recipes-qt/qt4/files/qmake-hack.diff
deleted file mode 100644
index 290f540..0000000
--- a/meta-oe/recipes-qt/qt4/files/qmake-hack.diff
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
diff --git a/meta-oe/recipes-qt/qt4/files/qt-config.patch b/meta-oe/recipes-qt/qt4/files/qt-config.patch
deleted file mode 100644
index a31e7b3..0000000
--- a/meta-oe/recipes-qt/qt4/files/qt-config.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-
-Ported from OE by: Yu Ke <ke.yu@intel.com>
-
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
-+        qtconfig = QFile::decodeName(config);
-+    }
- #else
-     if (!QFile::exists(qtconfig) && QCoreApplication::instance()) {
- #ifdef Q_OS_MAC
diff --git a/meta-oe/recipes-qt/qt4/files/qte.sh b/meta-oe/recipes-qt/qt4/files/qte.sh
deleted file mode 100644
index 21d6ecb..0000000
--- a/meta-oe/recipes-qt/qt4/files/qte.sh
+++ /dev/null
@@ -1,7 +0,0 @@
-#!/bin/sh
-
-if [ -e /dev/input/touchscreen0 ]
-then
-    QWS_MOUSE_PROTO=Tslib:/dev/input/touchscreen0
-    export QWS_MOUSE_PROTO
-fi
diff --git a/meta-oe/recipes-qt/qt4/files/qthelp-lib-qtclucene.patch b/meta-oe/recipes-qt/qt4/files/qthelp-lib-qtclucene.patch
deleted file mode 100644
index 1d250d8..0000000
--- a/meta-oe/recipes-qt/qt4/files/qthelp-lib-qtclucene.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-qt-embedded: fix linker error in do_compile
-
-This patch ensures that we link to libQtCLucene where required (i.e. when 
-linking to libQtHelp) avoiding a linker error.
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-Index: qt-everywhere-opensource-src-4.6.3/demos/qtdemo/qtdemo.pro
-===================================================================
---- qt-everywhere-opensource-src-4.6.3.orig/demos/qtdemo/qtdemo.pro	2011-01-11 16:06:47.382828004 +0000
-+++ qt-everywhere-opensource-src-4.6.3/demos/qtdemo/qtdemo.pro	2011-01-11 16:10:06.906828001 +0000
-@@ -76,3 +76,10 @@
- sources.files = $$SOURCES $$HEADERS $$FORMS $$RESOURCES qtdemo.pro images xml *.ico *.icns *.rc *.plist
- sources.path = $$[QT_INSTALL_DEMOS]/qtdemo
- 
-+qclucene = QtCLucene$${QT_LIBINFIX}
-+if(!debug_and_release|build_pass):CONFIG(debug, debug|release) {
-+    mac:qclucene = $${qclucene}_debug
-+    win32:qclucene = $${qclucene}d
-+}
-+linux-lsb-g++:LIBS_PRIVATE += --lsb-shared-libs=$$qclucene
-+LIBS_PRIVATE += -l$$qclucene
-Index: qt-everywhere-opensource-src-4.6.3/examples/help/contextsensitivehelp/contextsensitivehelp.pro
-===================================================================
---- qt-everywhere-opensource-src-4.6.3.orig/examples/help/contextsensitivehelp/contextsensitivehelp.pro	2011-01-11 16:05:56.598828002 +0000
-+++ qt-everywhere-opensource-src-4.6.3/examples/help/contextsensitivehelp/contextsensitivehelp.pro	2011-01-11 16:09:57.762828002 +0000
-@@ -18,3 +18,11 @@
- INSTALLS += target sources
- 
- symbian: include($$QT_SOURCE_TREE/examples/symbianpkgrules.pri)
-+
-+qclucene = QtCLucene$${QT_LIBINFIX}
-+if(!debug_and_release|build_pass):CONFIG(debug, debug|release) {
-+    mac:qclucene = $${qclucene}_debug
-+    win32:qclucene = $${qclucene}d
-+}
-+linux-lsb-g++:LIBS_PRIVATE += --lsb-shared-libs=$$qclucene
-+LIBS_PRIVATE += -l$$qclucene
-Index: qt-everywhere-opensource-src-4.6.3/tools/assistant/tools/assistant/assistant.pro
-===================================================================
---- qt-everywhere-opensource-src-4.6.3.orig/tools/assistant/tools/assistant/assistant.pro	2011-01-11 14:56:50.902828001 +0000
-+++ qt-everywhere-opensource-src-4.6.3/tools/assistant/tools/assistant/assistant.pro	2011-01-11 16:09:39.914828003 +0000
-@@ -85,3 +85,11 @@
-         DEFINES += USE_STATIC_SQLITE_PLUGIN
-     }
- }
-+
-+qclucene = QtCLucene$${QT_LIBINFIX}
-+if(!debug_and_release|build_pass):CONFIG(debug, debug|release) {
-+    mac:qclucene = $${qclucene}_debug
-+    win32:qclucene = $${qclucene}d
-+}
-+linux-lsb-g++:LIBS_PRIVATE += --lsb-shared-libs=$$qclucene
-+LIBS_PRIVATE += -l$$qclucene
-Index: qt-everywhere-opensource-src-4.6.3/tools/assistant/tools/qcollectiongenerator/qcollectiongenerator.pro
-===================================================================
---- qt-everywhere-opensource-src-4.6.3.orig/tools/assistant/tools/qcollectiongenerator/qcollectiongenerator.pro	2011-01-11 14:56:50.918828002 +0000
-+++ qt-everywhere-opensource-src-4.6.3/tools/assistant/tools/qcollectiongenerator/qcollectiongenerator.pro	2011-01-11 16:09:44.538828001 +0000
-@@ -12,3 +12,11 @@
-            main.cpp
- 
- HEADERS += ../shared/helpgenerator.h
-+
-+qclucene = QtCLucene$${QT_LIBINFIX}
-+if(!debug_and_release|build_pass):CONFIG(debug, debug|release) {
-+    mac:qclucene = $${qclucene}_debug
-+    win32:qclucene = $${qclucene}d
-+}
-+linux-lsb-g++:LIBS_PRIVATE += --lsb-shared-libs=$$qclucene
-+LIBS_PRIVATE += -l$$qclucene
-Index: qt-everywhere-opensource-src-4.6.3/tools/assistant/tools/qhelpgenerator/qhelpgenerator.pro
-===================================================================
---- qt-everywhere-opensource-src-4.6.3.orig/tools/assistant/tools/qhelpgenerator/qhelpgenerator.pro	2011-01-11 14:56:50.930828002 +0000
-+++ qt-everywhere-opensource-src-4.6.3/tools/assistant/tools/qhelpgenerator/qhelpgenerator.pro	2011-01-11 16:09:50.274828003 +0000
-@@ -12,3 +12,11 @@
-            main.cpp
- 
- HEADERS += ../shared/helpgenerator.h
-+
-+qclucene = QtCLucene$${QT_LIBINFIX}
-+if(!debug_and_release|build_pass):CONFIG(debug, debug|release) {
-+    mac:qclucene = $${qclucene}_debug
-+    win32:qclucene = $${qclucene}d
-+}
-+linux-lsb-g++:LIBS_PRIVATE += --lsb-shared-libs=$$qclucene
-+LIBS_PRIVATE += -l$$qclucene
diff --git a/meta-oe/recipes-qt/qt4/files/use-lflags-last.patch b/meta-oe/recipes-qt/qt4/files/use-lflags-last.patch
deleted file mode 100644
index 4197dbb..0000000
--- a/meta-oe/recipes-qt/qt4/files/use-lflags-last.patch
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
diff --git a/meta-oe/recipes-qt/qt4/qt-4.7.2.inc b/meta-oe/recipes-qt/qt4/qt-4.7.2.inc
deleted file mode 100644
index ed62bd3..0000000
--- a/meta-oe/recipes-qt/qt4/qt-4.7.2.inc
+++ /dev/null
@@ -1,58 +0,0 @@
-LICENSE = "LGPLv2.1 | GPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
-                    file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
-                    file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
-
-FILESPATH =. "${FILE_DIRNAME}/qt-${PV}:"
-
-SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
-           file://0004-no-qmake.patch \
-           file://hack-out-pg2-4.7.0.patch \
-           file://0006-freetype-host-includes.patch \
-           file://0001-Added-Openembedded-crossarch-option.patch \
-           file://g++.conf \
-           file://linux.conf \
-           "
-
-SRC_URI[md5sum] = "66b992f5c21145df08c99d21847f4fdb"
-SRC_URI[sha256sum] = "d4783b524b90bcd270ccf6e7a30d5fb51696c47eb5de49ebc2d553cd3eb49336"
-
-S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
-
-FILES_${QT_BASE_NAME}-tools                += "${bindir}/qml"
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
-QT_CONFIG_FLAGS += " -xmlpatterns -no-rpath -qt3support -reduce-relocations -silent ${QT_GLFLAGS}"
-
-do_compile() {
-    # Fixup missing wsegl header in some SGX SDKs
-    if ! [ -e ${STAGING_INCDIR}/wsegl.h ] ; then
-        cp src/3rdparty/powervr/wsegl.h src/plugins/gfxdrivers/powervr/QWSWSEGL/
-    fi
-
-    unset CFLAGS CXXFLAGS
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/rcc4 ${S}/bin/rcc
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/moc4 ${S}/bin/moc
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/uic4 ${S}/bin/uic
-    install -m 0755 ${STAGING_BINDIR_NATIVE}/lrelease4 ${S}/bin/lrelease
-
-    oe_runmake ${EXTRA_ENV}
-}
diff --git a/meta-oe/recipes-qt/qt4/qt-4.7.2/0001-Added-Openembedded-crossarch-option.patch b/meta-oe/recipes-qt/qt4/qt-4.7.2/0001-Added-Openembedded-crossarch-option.patch
deleted file mode 100644
index 71a04a5..0000000
--- a/meta-oe/recipes-qt/qt4/qt-4.7.2/0001-Added-Openembedded-crossarch-option.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From b1ba119f6a824dc01bd42ee00dba4a1653867b72 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Matthias=20G=C3=BCnther?= <matgnt@gmail.com>
-Date: Wed, 12 May 2010 16:52:45 +0200
-Subject: [PATCH 1/9] Added Openembedded "-crossarch" option
-
----
- configure |    7 ++++++-
- 1 files changed, 6 insertions(+), 1 deletions(-)
-
-diff --git a/configure b/configure
-index facd192..9d15136 100755
---- a/configure
-+++ b/configure
-@@ -954,7 +954,7 @@ while [ "$#" -gt 0 ]; do
-         shift
-         VAL=$1
-         ;;
--    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-platform|-xplatform|-buildkey|-sdk|-arch|-host-arch|-mysql_config)
-+    -prefix|-docdir|-headerdir|-plugindir|-importdir|-datadir|-libdir|-bindir|-translationdir|-sysconfdir|-examplesdir|-demosdir|-depths|-make|-nomake|-platform|-xplatform|-buildkey|-sdk|-arch|-host-arch|-mysql_config|-crossarch)
-         VAR=`echo $1 | sed "s,^-\(.*\),\1,"`
-         shift
-         VAL="$1"
-@@ -1443,6 +1443,9 @@ while [ "$#" -gt 0 ]; do
-     xplatform)
-         XPLATFORM="$VAL"
-         ;;
-+	crossarch)
-+		CROSSARCH="$VAL"
-+		;;
-     debug-and-release)
-         if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
-             CFG_DEBUG_RELEASE="$VAL"
-@@ -2918,6 +2921,8 @@ elif [ "$PLATFORM_MAC" = "yes" ] || [ -z "$CFG_ARCH" ]; then
-     CFG_ARCH=$CFG_HOST_ARCH
- fi
- 
-+CFG_ARCH="$CROSSARCH"
-+
- if [ -d "$relpath/src/corelib/arch/$CFG_ARCH" ]; then
-     if [ "$OPT_VERBOSE" = "yes" ]; then
-         echo "    '$CFG_ARCH' is supported"
--- 
-1.7.0.4
-
diff --git a/meta-oe/recipes-qt/qt4/qt-4.7.2/g++.conf b/meta-oe/recipes-qt/qt4/qt-4.7.2/g++.conf
deleted file mode 100644
index 80f925c..0000000
--- a/meta-oe/recipes-qt/qt4/qt-4.7.2/g++.conf
+++ /dev/null
@@ -1,60 +0,0 @@
-#
-# qmake configuration for common gcc
-#
-
-QMAKE_CC       = $(OE_QMAKE_CC)
-QMAKE_CFLAGS       += -pipe $(OE_QMAKE_CFLAGS)
-QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO += $(OE_QMAKE_CFLAGS)
-QMAKE_CFLAGS_DEPS	+= -M
-QMAKE_CFLAGS_WARN_ON	+= -Wall -W
-QMAKE_CFLAGS_WARN_OFF	+= -w
-QMAKE_CFLAGS_RELEASE	+=
-QMAKE_CFLAGS_DEBUG	+= -g
-QMAKE_CFLAGS_SHLIB	+= -fPIC
-QMAKE_CFLAGS_STATIC_LIB	+= -fPIC
-QMAKE_CFLAGS_YACC	+= -Wno-unused -Wno-parentheses
-QMAKE_CFLAGS_HIDESYMS   += -fvisibility=hidden
-QMAKE_CFLAGS_PRECOMPILE += -x c-header -c ${QMAKE_PCH_INPUT} -o ${QMAKE_PCH_OUTPUT}
-QMAKE_CFLAGS_USE_PRECOMPILE += -include ${QMAKE_PCH_OUTPUT_BASE}
-
-QMAKE_CXX      = $(OE_QMAKE_CXX)
-QMAKE_CXXFLAGS     += $$QMAKE_CFLAGS $(OE_QMAKE_CXXFLAGS)
-QMAKE_CXXFLAGS_DEPS	+= $$QMAKE_CFLAGS_DEPS
-QMAKE_CXXFLAGS_WARN_ON	+= $$QMAKE_CFLAGS_WARN_ON
-QMAKE_CXXFLAGS_WARN_OFF	+= $$QMAKE_CFLAGS_WARN_OFF
-QMAKE_CXXFLAGS_RELEASE	+= $$QMAKE_CFLAGS_RELEASE
-QMAKE_CXXFLAGS_RELEASE_WITH_DEBUGINFO += $$QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO
-QMAKE_CXXFLAGS_DEBUG	+= $$QMAKE_CFLAGS_DEBUG
-QMAKE_CXXFLAGS_SHLIB	+= $$QMAKE_CFLAGS_SHLIB
-QMAKE_CXXFLAGS_STATIC_LIB += $$QMAKE_CFLAGS_STATIC_LIB
-QMAKE_CXXFLAGS_YACC	+= $$QMAKE_CFLAGS_YACC
-QMAKE_CXXFLAGS_HIDESYMS += $$QMAKE_CFLAGS_HIDESYMS -fvisibility-inlines-hidden
-QMAKE_CXXFLAGS_PRECOMPILE += -x c++-header -c ${QMAKE_PCH_INPUT} -o ${QMAKE_PCH_OUTPUT}
-QMAKE_CXXFLAGS_USE_PRECOMPILE = $$QMAKE_CFLAGS_USE_PRECOMPILE
-
-QMAKE_LINK     = $(OE_QMAKE_LINK)
-QMAKE_LINK_SHLIB   = $(OE_QMAKE_LINK)
-QMAKE_LINK_C		= $(OE_QMAKE_LINK)
-QMAKE_LINK_C_SHLIB	= $(OE_QMAKE_LINK)
-QMAKE_LFLAGS       += $(OE_QMAKE_LDFLAGS)
-QMAKE_LFLAGS_RELEASE	+=
-QMAKE_LFLAGS_DEBUG	+=
-QMAKE_LFLAGS_APP	+=
-QMAKE_LFLAGS_SHLIB	+= -shared
-QMAKE_LFLAGS_PLUGIN	+= $$QMAKE_LFLAGS_SHLIB
-QMAKE_LFLAGS_SONAME	+= -Wl,-soname,
-QMAKE_LFLAGS_THREAD	+=
-QMAKE_LFLAGS_NOUNDEF	+= -Wl,--no-undefined
-QMAKE_LFLAGS_RPATH        = -Wl,-rpath-link,
-
-QMAKE_PCH_OUTPUT_EXT    = .gch
-
-# -Bsymbolic-functions (ld) support
-QMAKE_LFLAGS_BSYMBOLIC_FUNC = -Wl,-Bsymbolic-functions
-QMAKE_LFLAGS_DYNAMIC_LIST = -Wl,--dynamic-list,
-
-# some linking helper...
-CONFIG += rpath_libdirs
-
-# for the SDK
-isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG = $(OE_QMAKE_QT_CONFIG)
diff --git a/meta-oe/recipes-qt/qt4/qt-4.7.2/hack-out-pg2-4.7.0.patch b/meta-oe/recipes-qt/qt4/qt-4.7.2/hack-out-pg2-4.7.0.patch
deleted file mode 100644
index 5c588ff..0000000
--- a/meta-oe/recipes-qt/qt4/qt-4.7.2/hack-out-pg2-4.7.0.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Index: qt-everywhere-opensource-src-4.7.0/configure
-===================================================================
---- qt-everywhere-opensource-src-4.7.0.orig/configure	2010-09-22 15:43:51.191162141 -0400
-+++ qt-everywhere-opensource-src-4.7.0/configure	2010-09-22 15:44:35.179981232 -0400
-@@ -4921,10 +4921,10 @@
-         psql)
-             if [ "$CFG_SQL_psql" != "no" ]; then
-                 # Be careful not to use native pg_config when cross building.
--                if [ "$XPLATFORM_MINGW" != "yes" ] && "$WHICH" pg_config >/dev/null 2>&1; then
--                    QT_CFLAGS_PSQL=`pg_config --includedir 2>/dev/null`
--                    QT_LFLAGS_PSQL=`pg_config --libdir 2>/dev/null`
--                fi
-+#                if [ "$XPLATFORM_MINGW" != "yes" ] && "$WHICH" pg_config >/dev/null 2>&1; then
-+#                    QT_CFLAGS_PSQL=`pg_config --includedir 2>/dev/null`
-+#                    QT_LFLAGS_PSQL=`pg_config --libdir 2>/dev/null`
-+#                fi
-                 [ -z "$QT_CFLAGS_PSQL" ] || QT_CFLAGS_PSQL="-I$QT_CFLAGS_PSQL"
-                 [ -z "$QT_LFLAGS_PSQL" ] || QT_LFLAGS_PSQL="-L$QT_LFLAGS_PSQL"
-                 # But, respect PSQL_LIBS if set
diff --git a/meta-oe/recipes-qt/qt4/qt-4.7.2/linux.conf b/meta-oe/recipes-qt/qt4/qt-4.7.2/linux.conf
deleted file mode 100644
index a541355..0000000
--- a/meta-oe/recipes-qt/qt4/qt-4.7.2/linux.conf
+++ /dev/null
@@ -1,66 +0,0 @@
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
-QMAKE_INCDIR_OPENGL_ES1 = $$QMAKE_INCDIR_OPENGL
-QMAKE_LIBDIR_OPENGL_ES1 = $$QMAKE_LIBDIR_OPENGL
-QMAKE_INCDIR_OPENGL_ES2 = $$QMAKE_INCDIR_OPENGL
-QMAKE_LIBDIR_OPENGL_ES2 = $$QMAKE_LIBDIR_OPENGL
-QMAKE_INCDIR_EGL      =
-QMAKE_LIBDIR_EGL      =
-QMAKE_INCDIR_OPENVG   =
-QMAKE_LIBDIR_OPENVG   =
-
-
-QMAKE_LIBS            =
-QMAKE_LIBS_DYNLOAD    = -ldl
-QMAKE_LIBS_X11        = $(OE_QMAKE_LIBS_X11)
-QMAKE_LIBS_X11SM      = $(OE_QMAKE_LIBS_X11SM)
-QMAKE_LIBS_NIS        = -lnsl
-QMAKE_LIBS_EGL        = -lEGL
-QMAKE_LIBS_OPENGL     = -lGLU -lGL
-QMAKE_LIBS_OPENGL_QT  = -lGL
-QMAKE_LIBS_OPENGL_ES1 = -lGLES_CM
-QMAKE_LIBS_OPENGL_ES2 = -lGLESv2
-QMAKE_LIBS_OPENVG     = -lOpenVG
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
-QMAKE_OBJCOPY         = objcopy
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
diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded.inc b/meta-oe/recipes-qt/qt4/qt4-embedded.inc
deleted file mode 100644
index 2ed1819..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-embedded.inc
+++ /dev/null
@@ -1,34 +0,0 @@
-DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is the embedded version."
-SECTION = "libs"
-LICENSE = "LGPLv2.1 | GPLv3"
-PRIORITY = "optional"
-HOMEPAGE = "http://qt.nokia.com"
-DEPENDS += "directfb tslib"
-INC_PR = "r26"
-
-QT_BASE_NAME ?= "qt4-embedded"
-QT_BASE_LIB  ?= "libqt-embedded"
-
-# Set necessary variables in the profile
-SRC_URI += "file://qte.sh"
-
-QT_CONFIG_FLAGS += " \
-    -embedded ${QT_ARCH} \
-    -qtlibinfix ${QT_LIBINFIX} \
-    -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc -plugin-gfx-directfb \
-    -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb -qt-mouse-linuxinput \
-    -qt-kbd-tty \
-    -DQT_KEYPAD_NAVIGATION \
-    "
-
-require qt4.inc
-
-do_install_append() {
-    install -d ${D}${sysconfdir}/profile.d/
-    install -m 0755 ${WORKDIR}/qte.sh ${D}${sysconfdir}/profile.d/
-}
-
-FILES_${PN} += " ${sysconfdir}/profile.d/qte.sh"
-
-inherit qt4e
-
diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded/0006-freetype-host-includes.patch b/meta-oe/recipes-qt/qt4/qt4-embedded/0006-freetype-host-includes.patch
deleted file mode 100644
index 987c425..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-embedded/0006-freetype-host-includes.patch
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
diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.7.2.bb b/meta-oe/recipes-qt/qt4/qt4-embedded_4.7.2.bb
deleted file mode 100644
index c3f6713..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-embedded_4.7.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require qt-${PV}.inc
-require qt4-embedded.inc
-
-PR = "${INC_PR}.1"
-
-QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
-
-QT_CONFIG_FLAGS += " \
- -exceptions \
-"
diff --git a/meta-oe/recipes-qt/qt4/qt4-embedded_4.7.3.bbappend b/meta-oe/recipes-qt/qt4/qt4-embedded_4.7.3.bbappend
new file mode 100644
index 0000000..9b4ede4
--- /dev/null
+++ b/meta-oe/recipes-qt/qt4/qt4-embedded_4.7.3.bbappend
@@ -0,0 +1,5 @@
+DEPENDS += "mysql5 postgresql sqlite"
+QT_SQL_DRIVER_FLAGS = "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql -plugin-sql-sqlite2 -plugin-sql-sqlite"
+QT_CONFIG_FLAGS += "-I${STAGING_INCDIR}/mysql \
+                    -I${STAGING_INCDIR}/postgresql"
+
diff --git a/meta-oe/recipes-qt/qt4/qt4-tools-native.inc b/meta-oe/recipes-qt/qt4/qt4-tools-native.inc
deleted file mode 100644
index 9114e7d..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-tools-native.inc
+++ /dev/null
@@ -1,77 +0,0 @@
-DESCRIPTION = "Native tools for Qt/[X11|Mac|Embedded] version 4.x"
-DEPENDS = "zlib-native dbus-native"
-SECTION = "libs"
-HOMEPAGE = "http://qt.nokia.com"
-PRIORITY = "optional"
-
-LICENSE = "LGPLv2.1 | GPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
-                    file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
-                    file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
-
-INC_PR = "r11"
-
-inherit native
-
-SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
-           file://qt-config.patch \
-           file://g++.conf \
-           file://linux.conf"
-S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
-
-EXTRA_OECONF = "-prefix ${prefix} \
-                -L ${STAGING_LIBDIR_NATIVE} \
-                -I ${STAGING_INCDIR_NATIVE} \
-                -qt-libjpeg -qt-gif -system-zlib \
-                -no-libjpeg -no-libpng -no-libmng -no-libtiff \
-                -no-accessibility \
-                -no-cups \
-                -no-exceptions  \
-                -no-nas-sound \
-                -no-nis -no-openssl \
-                -verbose -release -static \
-                -embedded -no-freetype -no-glib -no-iconv \
-                -qt3support"
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
-  src/tools/moc \
-  src/corelib \
-  src/sql \
-  src/dbus \
-  src/qt3support \
-  src/xml \
-  src/tools/uic \
-  src/tools/rcc \
-  src/network \
-  tools/linguist/lrelease \
-  tools/linguist/lupdate \
-"
-
-do_compile() {
-    for i in ${TOBUILD}; do
-        cd ${S}/$i && oe_runmake CC="${CC}" CXX="${CXX}"
-    done
-}
-
-do_install() {
-    install -d ${D}${bindir}/
-    install -m 0755 bin/qmake ${D}${bindir}/qmake2
-    for i in moc uic rcc lrelease lupdate; do
-        install -m 0755 bin/${i} ${D}${bindir}/${i}4
-    done
-    
-    install -d ${D}${datadir}/qt4/
-    cp -PfR mkspecs ${D}${datadir}/qt4/
-    ln -sf linux-g++ ${D}${datadir}/qt4/mkspecs/${BUILD_OS}-oe-g++
-    cp -f ${WORKDIR}/g++.conf ${WORKDIR}/linux.conf ${D}${datadir}/qt4/mkspecs/common/
-
-    install -m 0644 tools/porting/src/q3porting.xml ${D}${datadir}/qt4/
-}
diff --git a/meta-oe/recipes-qt/qt4/qt4-tools-native_4.7.2.bb b/meta-oe/recipes-qt/qt4/qt4-tools-native_4.7.2.bb
deleted file mode 100644
index d3c0eda..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-tools-native_4.7.2.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require qt4-tools-native.inc
-
-PR = "${INC_PR}.0"
-
-# Find the g++.conf/linux.conf in the right directory.
-FILESPATHPKG =. "qt-${PV}:"
-
-EXTRA_OECONF += " -no-fast -silent -no-rpath"
-
-TOBUILD := "src/tools/bootstrap ${TOBUILD}"
-
-SRC_URI[md5sum] = "66b992f5c21145df08c99d21847f4fdb"
-SRC_URI[sha256sum] = "d4783b524b90bcd270ccf6e7a30d5fb51696c47eb5de49ebc2d553cd3eb49336"
diff --git a/meta-oe/recipes-qt/qt4/qt4-tools-nativesdk.inc b/meta-oe/recipes-qt/qt4/qt4-tools-nativesdk.inc
deleted file mode 100644
index f273c9f..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-tools-nativesdk.inc
+++ /dev/null
@@ -1,111 +0,0 @@
-DESCRIPTION = "SDK tools for Qt/[X11|Mac|Embedded] version 4.x"
-DEPENDS = "zlib-nativesdk dbus-nativesdk libx11-nativesdk qt4-tools-native"
-SECTION = "libs"
-HOMEPAGE = "http://qt.nokia.com"
-PRIORITY = "optional"
-LICENSE = "LGPLv2.1 | GPLv3"
-
-INC_PR = "r3"
-
-FILESPATHPKG =. "qt-${PV}:"
-inherit nativesdk qmake2
-
-SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
-           file://configure-lflags.patch \
-           file://compile.test-lflags.patch \
-           file://qt-config.patch \
-           file://qmake-exists-check.patch \
-           file://configure-paths.patch \
-           file://g++.conf \
-           file://linux.conf"
-
-S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
-
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
-                    file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
-                    file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
-
-# FIXME: make it work with "${STAGING_BINDIR_NATIVE}/pkg-config --cflags dbus-1"
-EXTRA_OECONF = "-prefix ${prefix} \
-                -qt-libjpeg -qt-gif -system-zlib \
-                -no-libjpeg -no-libpng -no-libmng -no-libtiff \
-                -no-accessibility \
-                -no-cups \
-                -no-exceptions  \
-                -no-nas-sound \
-                -no-nis -no-openssl \
-                -verbose -release -fast -static \
-                -platform ${TARGET_OS}-oe-g++ \
-                -xplatform ${TARGET_OS}-oe-g++ \
-                -embedded -no-freetype -no-glib -no-iconv \
-                -qt3support \
-                -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include \
-                -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/freetype2 \
-                -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/dbus-1.0 \
-                -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/lib/dbus-1.0/include \
-                -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/c++ \
-                -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/c++/${TARGET_SYS} \
-                -L${STAGING_DIR_HOST}${SDKPATHNATIVE}/lib \
-                -L${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/lib"
-
-# yank default -e, otherwise we get the following error:
-# moc_qbuffer.cpp: No such file or directory
-EXTRA_OEMAKE = " "
-
-do_configure() {
-    if [ ! -e bin/qmake ]; then
-        ln -sf ${STAGING_BINDIR_NATIVE}/qmake2 bin/qmake
-    fi
-
-    if [ ! -e mkspecs/${TARGET_OS}-oe-g++ ]; then
-        ln -sf linux-g++ mkspecs/${TARGET_OS}-oe-g++
-    fi
-
-    cp ../g++.conf mkspecs/common
-    cp ../linux.conf mkspecs/common
-
-    (echo o; echo yes) | ./configure ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
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
-    (cd ${D}${bindir}; \
-    ln -s qmake2 qmake; \
-    for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do \
-        ln -s ${i}4 ${i}; \
-    done)
-
-    # make a symbolic link to mkspecs for compatibility with Nokia's SDK
-    # and QTCreator
-    (cd ${D}${bindir}/..; ln -s ${TARGET_SYS}/usr/share/qtopia/mkspecs mkspecs;)
-}
-
diff --git a/meta-oe/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb b/meta-oe/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb
deleted file mode 100644
index a917ac4..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require qt4-tools-nativesdk.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "66b992f5c21145df08c99d21847f4fdb"
-SRC_URI[sha256sum] = "d4783b524b90bcd270ccf6e7a30d5fb51696c47eb5de49ebc2d553cd3eb49336"
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free.inc b/meta-oe/recipes-qt/qt4/qt4-x11-free.inc
deleted file mode 100644
index 057a129..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-x11-free.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-require qt4.inc
-
-DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is the X11 version."
-HOMEPAGE = "http://qt.nokia.com"
-SECTION = "x11/libs"
-PRIORITY = "optional"
-DEPENDS += "virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
-
-INC_PR = "r21"
-
-QT_GLFLAGS ?= "-no-opengl"
-QT_GLFLAGS_qemux86 = "-opengl"
-QT_GLFLAGS_emenlow = "-opengl"
-QT_GLFLAGS_atom-pc = "-opengl"
-QT_CONFIG_FLAGS += "-no-xinerama -no-xkb ${QT_GLFLAGS}"
-QT_BASE_NAME ?= "qt4"
-QT_BASE_LIB  ?= "libqt"
-
-inherit qt4x11
-
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free/0003-no-tools.patch b/meta-oe/recipes-qt/qt4/qt4-x11-free/0003-no-tools.patch
deleted file mode 100644
index 3829ffc..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-x11-free/0003-no-tools.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Index: qt-embedded-linux-opensource-src-4.5.0/src/src.pro
-===================================================================
---- qt-embedded-linux-opensource-src-4.5.0.orig/src/src.pro	2009-02-25 22:32:41.000000000 +0100
-+++ qt-embedded-linux-opensource-src-4.5.0/src/src.pro	2009-03-26 17:11:07.000000000 +0100
-@@ -6,12 +6,9 @@
- wince*:{
-   SRC_SUBDIRS += src_corelib src_xml src_gui src_sql src_network src_script src_testlib
- } else {
--    SRC_SUBDIRS += src_tools_bootstrap src_tools_moc src_tools_rcc src_tools_uic src_corelib src_xml src_network src_gui src_sql src_script src_testlib
-+    SRC_SUBDIRS += src_corelib src_xml src_network src_gui src_sql src_script src_testlib
-     contains(QT_CONFIG, qt3support): SRC_SUBDIRS += src_qt3support
-     contains(QT_CONFIG, dbus):SRC_SUBDIRS += src_dbus
--    !cross_compile {
--        contains(QT_CONFIG, qt3support): SRC_SUBDIRS += src_tools_uic3
--    }
- }
- win32:!contains(QT_EDITION, OpenSource|Console): {
-     SRC_SUBDIRS += src_activeqt
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free/0006-freetype-host-includes.patch b/meta-oe/recipes-qt/qt4/qt4-x11-free/0006-freetype-host-includes.patch
deleted file mode 100644
index 987c425..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-x11-free/0006-freetype-host-includes.patch
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
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free/0007-openssl-host-includes.patch b/meta-oe/recipes-qt/qt4/qt4-x11-free/0007-openssl-host-includes.patch
deleted file mode 100644
index 3409cc0..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-x11-free/0007-openssl-host-includes.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-From d45943adb443ad4b85ca4504952dee743c675e1e Mon Sep 17 00:00:00 2001
-From: Michael Krelin <hacker@klever.net>
-Date: Mon, 4 Jun 2007 14:58:34 +0200
-Subject: [PATCH] openssl host includes
-
----
- config.tests/unix/openssl/openssl.pri |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-Index: qt-embedded-linux-opensource-src-4.5.0/config.tests/unix/openssl/openssl.pri
-===================================================================
---- qt-embedded-linux-opensource-src-4.5.0.orig/config.tests/unix/openssl/openssl.pri	2009-02-25 22:32:32.000000000 +0100
-+++ qt-embedded-linux-opensource-src-4.5.0/config.tests/unix/openssl/openssl.pri	2009-03-26 17:16:28.000000000 +0100
-@@ -1,5 +1,5 @@
- !cross_compile {
--    TRY_INCLUDEPATHS = /include /usr/include /usr/local/include $$QMAKE_INCDIR $$INCLUDEPATH
-+    TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$INCLUDEPATH
-     # LSB doesn't allow using headers from /include or /usr/include
-     linux-lsb-g++:TRY_INCLUDEPATHS = $$QMAKE_INCDIR $$INCLUDEPATH
-     for(p, TRY_INCLUDEPATHS) {
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free/0008-qt-lib-infix.patch b/meta-oe/recipes-qt/qt4/qt4-x11-free/0008-qt-lib-infix.patch
deleted file mode 100644
index 3efaff3..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-x11-free/0008-qt-lib-infix.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Index: qt-embedded-linux-opensource-src-4.5.0/mkspecs/features/uitools.prf
-===================================================================
---- qt-embedded-linux-opensource-src-4.5.0.orig/mkspecs/features/uitools.prf	2009-02-25 22:32:34.000000000 +0100
-+++ qt-embedded-linux-opensource-src-4.5.0/mkspecs/features/uitools.prf	2009-03-26 17:17:27.000000000 +0100
-@@ -2,10 +2,10 @@
- qt:load(qt)
- 
- # Include the correct version of the UiLoader library
--QTUITOOLS_LINKAGE = -lQtUiTools
-+QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}
- CONFIG(debug, debug|release) {
--    mac: QTUITOOLS_LINKAGE = -lQtUiTools_debug
--    win32: QTUITOOLS_LINKAGE = -lQtUiToolsd
-+    mac: QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}_debug
-+    win32: QTUITOOLS_LINKAGE = -lQtUiTools$${QT_LIBINFIX}d
- }
- LIBS += $$QTUITOOLS_LINKAGE
- 
-Index: qt-embedded-linux-opensource-src-4.5.0/tools/designer/src/uitools/uitools.pro
-===================================================================
---- qt-embedded-linux-opensource-src-4.5.0.orig/tools/designer/src/uitools/uitools.pro	2009-02-25 22:32:42.000000000 +0100
-+++ qt-embedded-linux-opensource-src-4.5.0/tools/designer/src/uitools/uitools.pro	2009-03-26 17:17:27.000000000 +0100
-@@ -1,5 +1,5 @@
- TEMPLATE = lib
--TARGET = $$qtLibraryTarget(QtUiTools)
-+TARGET = QtUiTools
- QT += xml
- CONFIG += qt staticlib
- DESTDIR = ../../../../lib
-@@ -39,3 +39,4 @@
-    QMAKE_PKGCONFIG_REQUIRES += QtXml
- }
- 
-+TARGET = $$qtLibraryTarget($$TARGET$$QT_LIBINFIX) #do this towards the end
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.2.bb b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.2.bb
deleted file mode 100644
index 75c6314..0000000
--- a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.2.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require qt4-x11-free.inc
-require qt-${PV}.inc
-
-PR = "${INC_PR}.1"
-
-QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
-
-QT_CONFIG_FLAGS += " \
- -no-embedded \
- -xrandr \
- -x11"
-
diff --git a/meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.3.bbappend b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.3.bbappend
new file mode 100644
index 0000000..9b4ede4
--- /dev/null
+++ b/meta-oe/recipes-qt/qt4/qt4-x11-free_4.7.3.bbappend
@@ -0,0 +1,5 @@
+DEPENDS += "mysql5 postgresql sqlite"
+QT_SQL_DRIVER_FLAGS = "-no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql -plugin-sql-sqlite2 -plugin-sql-sqlite"
+QT_CONFIG_FLAGS += "-I${STAGING_INCDIR}/mysql \
+                    -I${STAGING_INCDIR}/postgresql"
+
diff --git a/meta-oe/recipes-qt/qt4/qt4.inc b/meta-oe/recipes-qt/qt4/qt4.inc
deleted file mode 100644
index 98d55b1..0000000
--- a/meta-oe/recipes-qt/qt4/qt4.inc
+++ /dev/null
@@ -1,314 +0,0 @@
-inherit qmake_base
-
-DEPENDS += "qt4-tools-native freetype jpeg libpng zlib dbus openssl glib-2.0 gstreamer gst-plugins-base mysql5 postgresql sqlite sqlite3"
-
-require qt4_arch.inc
-QT_ARCH := "${@qt_arch(d)}"
-QT_ENDIAN = "${@qt_endian(d)}"
-
-QT_DISTRO_FLAGS ?= "-no-accessibility -no-sm"
-QT_DISTRO_FLAGS_poky-lsb = "-sm"
-
-QT_CONFIG_FLAGS += "-release -no-cups -reduce-relocations \
-                    -shared -no-nas-sound -no-nis \
-                    -qt-gif -system-libjpeg -system-libpng -system-zlib \
-                    -no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql -plugin-sql-sqlite -plugin-sql-sqlite3 \
-                    -no-pch -qdbus -stl -glib -phonon -webkit \
-                    ${QT_DISTRO_FLAGS} "
-
-EXTRA_OEMAKE = "-e"
-
-EXTRA_ENV = 'QMAKE="${STAGING_BINDIR_NATIVE}/qmake2 -after \
-             INCPATH+=${STAGING_INCDIR}/freetype2 LIBS+=-L${STAGING_LIBDIR}" \
-             QMAKESPEC="${QMAKESPEC}" LINK="${CXX} -Wl,-rpath-link,${STAGING_LIBDIR}" \
-             AR="${TARGET_PREFIX}ar cqs" \
-             MOC="${STAGING_BINDIR_NATIVE}/moc4" UIC="${STAGING_BINDIR_NATIVE}/uic4" MAKE="make -e"'
-
-export QT_CONF_PATH="${WORKDIR}/qt.conf"
-
-# Library packages
-QT_LIB_NAMES = "Qt3Support QtAssistantClient QtCLucene QtCore QtDBus QtDesigner QtDesignerComponents QtGui QtHelp QtNetwork QtOpenGL QtScript QtScriptTools QtSql QtSvg QtTest QtUiTools QtWebKit QtXml QtXmlPatterns phonon QtMultimedia QtOpenVG QtMediaServices QtDeclarative"
-
-QT_EXTRA_LIBS = "pvrQWSWSEGL"
-
-python __anonymous () {
-    import bb
-
-    lib_packages = []
-    dev_packages = []
-    dbg_packages = []
-    for name in bb.data.getVar("QT_LIB_NAMES", d, 1).split():
-        pkg = "${QT_BASE_LIB}" + name.lower().replace("qt", "").replace("_", "-") + "4"
-        # NOTE: the headers for QtAssistantClient are different
-        incname = name.replace("QtAssistantClient", "QtAssistant")
-        bb.data.setVar("FILES_%s" % pkg, "${libdir}/lib%(name)s${QT_LIBINFIX}.so.*" % locals(), d)
-        bb.data.setVar("FILES_%s-dev" % pkg, """${libdir}/lib%(name)s${QT_LIBINFIX}.prl
-                  ${libdir}/lib%(name)s${QT_LIBINFIX}.a
-                  ${libdir}/lib%(name)s${QT_LIBINFIX}.la
-                  ${libdir}/lib%(name)s${QT_LIBINFIX}.so
-                  ${includedir}/${QT_DIR_NAME}/%(incname)s
-                  ${libdir}/pkgconfig/%(name)s${QT_LIBINFIX}.pc""" % locals(), d)
-        bb.data.setVar("FILES_%s-dbg" % pkg, "${libdir}/.debug/lib%(name)s${QT_LIBINFIX}.so.*" % locals(), d)
-        lib_packages.append(pkg)
-        dev_packages.append("%s-dev" % pkg)
-        dbg_packages.append("%s-dbg" % pkg)
-    for name in bb.data.getVar("OTHER_PACKAGES", d, 1).split():
-        dbg_packages.append("%s-dbg" % name)
-
-    for name in bb.data.getVar("QT_EXTRA_LIBS", d, 1).split():
-        pkg = "${QT_BASE_LIB}" + name.lower().replace("qt", "").replace("_", "-") + "4"
-        bb.data.setVar("FILES_%s" % pkg, "${libdir}/lib%(name)s.so.*" % locals(), d)
-        bb.data.setVar("FILES_%s-dev" % pkg, """${libdir}/lib%(name)s.prl
-                  ${libdir}/lib%(name)s.a
-                  ${libdir}/lib%(name)s.la
-                  ${libdir}/lib%(name)s.so
-                  ${includedir}/${QT_DIR_NAME}/%(incname)s
-                  ${libdir}/pkgconfig/%(name)s.pc""" % locals(), d)
-        bb.data.setVar("FILES_%s-dbg" % pkg, "${libdir}/.debug/lib%(name)s.so.*" % locals(), d)
-        lib_packages.append(pkg)
-        dev_packages.append("%s-dev" % pkg)
-        dbg_packages.append("%s-dbg" % pkg)
-
-    bb.data.setVar("LIB_PACKAGES", " ".join(lib_packages), d)
-    bb.data.setVar("DEV_PACKAGES", " ".join(dev_packages), d)
-    bb.data.setVar("DBG_PACKAGES", " ".join(dbg_packages), d)
-}
-
-OTHER_PACKAGES = "\
-             ${QT_BASE_NAME}-tools \
-             ${QT_BASE_NAME}-assistant \
-             ${QT_BASE_NAME}-common \
-             ${QT_BASE_NAME}-dbus \
-             ${QT_BASE_NAME}-demos \
-             ${QT_BASE_NAME}-designer \
-             ${QT_BASE_NAME}-examples \
-             ${QT_BASE_NAME}-fonts \
-             ${QT_BASE_NAME}-fonts-ttf-vera \
-             ${QT_BASE_NAME}-fonts-ttf-dejavu \
-             ${QT_BASE_NAME}-fonts-pfa \
-             ${QT_BASE_NAME}-fonts-pfb \
-             ${QT_BASE_NAME}-fonts-qpf \
-             ${QT_BASE_NAME}-linguist \
-             ${QT_BASE_NAME}-makeqpf \
-             ${QT_BASE_NAME}-mkspecs \
-             ${QT_BASE_NAME}-pixeltool \
-             ${QT_BASE_NAME}-qmlviewer \
-             ${QT_BASE_NAME}-xmlpatterns \
-             ${QT_BASE_NAME}-qt3to4"
-
-PACKAGES += "${LIB_PACKAGES} ${DEV_PACKAGES} ${DBG_PACKAGES} ${OTHER_PACKAGES}"
-PACKAGES_DYNAMIC = "${QT_BASE_NAME}-plugin-* ${QT_BASE_NAME}-translation-* ${QT_BASE_NAME}-fonts-*"
-
-ALLOW_EMPTY_${PN} = "1"
-ALLOW_EMPTY_${QT_BASE_NAME}-fonts = "1"
-FILES_${PN}     = ""
-FILES_${PN}-dev = "${includedir}/${QT_DIR_NAME}/Qt/*"
-FILES_${PN}-dbg = ""
-RRECOMMENDS_${PN} = "${LIB_PACKAGES} ${OTHER_PACKAGES}"
-RRECOMMENDS_${PN}-dev = "${DEV_PACKAGES}"
-RRECOMMENDS_${PN}-dbg = "${DBG_PACKAGES}"
-RRECOMMENDS_${QT_BASE_NAME}-fonts = " \
-             ${QT_BASE_NAME}-fonts-ttf-vera \
-             ${QT_BASE_NAME}-fonts-ttf-dejavu \
-             ${QT_BASE_NAME}-fonts-pfa \
-             ${QT_BASE_NAME}-fonts-pfb \
-             ${QT_BASE_NAME}-fonts-qpf"
-RRECOMMENDS_${QT_BASE_NAME}-demos += " \
-            ${QT_BASE_NAME}-fonts \
-            ${QT_BASE_NAME}-examples \
-            ${QT_BASE_NAME}-plugin-sqldriver-sqlite \
-            ${QT_BASE_NAME}-plugin-imageformat-jpeg \
-            ${QT_BASE_NAME}-assistant \
-            ${PN}-doc"
-RRECOMMENDS_${QT_BASE_NAME}-examples += " \
-            ${QT_BASE_NAME}-plugin-sqldriver-sqlite \
-            ${QT_BASE_NAME}-plugin-imageformat-jpeg"
-
-FILES_${QT_BASE_NAME}-tools                = "${bindir}/uic* ${bindir}/moc ${bindir}/rcc ${bindir}/qttracereplay ${bindir}/qdoc*"
-FILES_${QT_BASE_NAME}-tools-dbg            = "${bindir}/.debug/uic* ${bindir}/.debug/moc ${bindir}/.debug/rcc ${bindir}/.debug/qttracereplay ${bindir}/.debug/qdoc*"
-FILES_${QT_BASE_NAME}-assistant            = "${bindir}/*assistant* ${bindir}/qcollectiongenerator ${bindir}/qhelpconverter ${bindir}/qhelpgenerator"
-FILES_${QT_BASE_NAME}-assistant-dbg        = "${bindir}/.debug/*assistant* ${bindir}/.debug/qcollectiongenerator ${bindir}/.debug/qhelpconverter ${bindir}/.debug/qhelpgenerator"
-FILES_${QT_BASE_NAME}-common               = "${bindir}/qtconfig"
-FILES_${QT_BASE_NAME}-common-dbg           = "${bindir}/.debug/qtconfig"
-FILES_${QT_BASE_NAME}-dbus                 = "${bindir}/qdbus ${bindir}/qdbusxml2cpp ${bindir}/qdbuscpp2xml ${bindir}/qdbusviewer"
-FILES_${QT_BASE_NAME}-dbus-dbg             = "${bindir}/.debug/qdbus ${bindir}/.debug/qdbusxml2cpp ${bindir}/.debug/qdbuscpp2xml ${bindir}/.debug/qdbusviewer"
-FILES_${QT_BASE_NAME}-demos                = "${bindir}/qtdemo* ${bindir}/${QT_DIR_NAME}/demos/*"
-FILES_${QT_BASE_NAME}-demos-dbg            = "${bindir}/.debug/qtdemo* ${bindir}/${QT_DIR_NAME}/demos/.debug/*  ${bindir}/${QT_DIR_NAME}/demos/*/.debug  ${bindir}/${QT_DIR_NAME}/demos/*/*/.debug  ${bindir}/${QT_DIR_NAME}/demos/*/*/*/.debug"
-FILES_${QT_BASE_NAME}-designer             = "${bindir}/*designer*"
-FILES_${QT_BASE_NAME}-designer-dbg         = "${bindir}/.debug/*designer*"
-FILES_${QT_BASE_NAME}-examples             = "${bindir}/${QT_DIR_NAME}/examples/*"
-FILES_${QT_BASE_NAME}-examples-dbg         = "${bindir}/${QT_DIR_NAME}/examples/.debug ${bindir}/${QT_DIR_NAME}/examples/*/.debug ${bindir}/${QT_DIR_NAME}/examples/*/*/.debug ${bindir}/${QT_DIR_NAME}/examples/*/*/*/.debug ${bindir}/${QT_DIR_NAME}/examples/*/*/*/*/.debug ${bindir}/${QT_DIR_NAME}/examples/declarative/*/*/*/*/*/.debug/* ${bindir}/${QT_DIR_NAME}/examples/declarative/*/*/*/*/.debug/*"
-FILES_${QT_BASE_NAME}-fonts-ttf-vera       = "${libdir}/fonts/Vera*.ttf"
-FILES_${QT_BASE_NAME}-fonts-ttf-dejavu     = "${libdir}/fonts/DejaVu*.ttf"
-FILES_${QT_BASE_NAME}-fonts-pfa            = "${libdir}/fonts/*.pfa"
-FILES_${QT_BASE_NAME}-fonts-pfb            = "${libdir}/fonts/*.pfb"
-FILES_${QT_BASE_NAME}-fonts-qpf            = "${libdir}/fonts/*.qpf"
-FILES_${QT_BASE_NAME}-linguist             = "${bindir}/*linguist* ${bindir}/lrelease ${bindir}/lupdate ${bindir}/lconvert ${bindir}/qm2ts"
-FILES_${QT_BASE_NAME}-linguist-dbg         = "${bindir}/.debug/*linguist* ${bindir}/.debug/lrelease ${bindir}/.debug/lupdate ${bindir}/.debug/lconvert ${bindir}/.debug/qm2ts"
-FILES_${QT_BASE_NAME}-pixeltool            = "${bindir}/pixeltool"
-FILES_${QT_BASE_NAME}-pixeltool-dbg        = "${bindir}/.debug/pixeltool"
-FILES_${QT_BASE_NAME}-qt3to4               = "${bindir}/qt3to4 ${datadir}/${QT_DIR_NAME}/q3porting.xml"
-FILES_${QT_BASE_NAME}-qt3to4-dbg           = "${bindir}/.debug/qt3to4"
-FILES_${QT_BASE_NAME}-qmlviewer            = "${bindir}/qmlviewer"
-FILES_${QT_BASE_NAME}-qmlviewer-dbg        = "${bindir}/.debug/qmlviewer"
-FILES_${QT_BASE_NAME}-makeqpf              = "${bindir}/makeqpf"
-FILES_${QT_BASE_NAME}-makeqpf-dbg          = "${bindir}/.debug/makeqpf"
-FILES_${QT_BASE_NAME}-mkspecs              = "${datadir}/${QT_DIR_NAME}/mkspecs/*"
-FILES_${QT_BASE_NAME}-xmlpatterns          = "${bindir}/xmlpatterns*"
-FILES_${QT_BASE_NAME}-xmlpatterns-dbg      = "${bindir}/.debug/xmlpatterns*"
-
-
-do_configure() {
-    unset QMAKESPEC
-    unset QTDIR
-
-    if [ ! -e bin/qmake ]; then
-        ln -sf ${STAGING_BINDIR_NATIVE}/qmake2 bin/qmake
-    fi
-
-    if [ ! -e mkspecs/${TARGET_OS}-oe-g++ ]; then
-        ln -sf linux-g++ mkspecs/${TARGET_OS}-oe-g++
-    fi
-
-    cp -f ${WORKDIR}/g++.conf ${WORKDIR}/linux.conf mkspecs/common/
-
-    echo "[Paths]"                                 > $QT_CONF_PATH
-    echo "Prefix=${prefix}/"                      >> $QT_CONF_PATH
-    echo "Documentation=${docdir}/${QT_DIR_NAME}" >> $QT_CONF_PATH
-    echo "Headers=${includedir}/${QT_DIR_NAME}"   >> $QT_CONF_PATH
-    echo "Libraries=${libdir}"                    >> $QT_CONF_PATH
-    echo "Binaries=${bindir}"                     >> $QT_CONF_PATH
-    echo "Plugins=${libdir}/${QT_DIR_NAME}/plugins" >> $QT_CONF_PATH
-    echo "Data=${datadir}/${QT_DIR_NAME}"         >> $QT_CONF_PATH
-    echo "Translations=${datadir}/${QT_DIR_NAME}/translations" >> $QT_CONF_PATH
-    echo "Settings=${sysconfdir}/${QT_DIR_NAME}"  >> $QT_CONF_PATH
-    echo "Examples=${bindir}/${QT_DIR_NAME}/examples" >> $QT_CONF_PATH
-    echo "Demos=${bindir}/${QT_DIR_NAME}/demos"   >> $QT_CONF_PATH
-
-    ${EXTRA_QMAKE_MUNGE}|| true
-
-    (echo o; echo yes) | ./configure -v \
-            -prefix ${prefix}/ \
-            -bindir ${bindir} \
-            -libdir ${libdir} \
-            -datadir ${datadir}/${QT_DIR_NAME} \
-            -sysconfdir ${sysconfdir}/${QT_DIR_NAME} \
-            -docdir ${docdir}/${QT_DIR_NAME} \
-            -headerdir ${includedir}/${QT_DIR_NAME} \
-            -plugindir ${libdir}/${QT_DIR_NAME}/plugins \
-            -translationdir ${datadir}/${QT_DIR_NAME}/translations \
-            -examplesdir ${bindir}/${QT_DIR_NAME}/examples \
-            -demosdir ${bindir}/${QT_DIR_NAME}/demos \
-            -platform ${TARGET_OS}-oe-g++ \
-            -xplatform ${TARGET_OS}-oe-g++ \
-            ${QT_ENDIAN} \
-            -crossarch ${QT_ARCH} \
-            ${QT_CONFIG_FLAGS} -no-fast \
-            -L${STAGING_LIBDIR} -I${STAGING_INCDIR} \
-            -I${STAGING_INCDIR}/freetype2 \
-            -I${STAGING_INCDIR}/mysql \
-            -I${STAGING_INCDIR}/postgresql
-}
-
-python populate_packages_prepend() {
-        translation_dir = bb.data.expand('${datadir}/${QT_DIR_NAME}/translations/', d)
-        translation_name = bb.data.expand('${QT_BASE_NAME}-translation-%s', d)
-        do_split_packages(d, translation_dir, '^(assistant|designer|linguist|qt|qtconfig|qvfb)_(.*)\.qm$', translation_name, '${PN} translation for %s', extra_depends='' )
- 
-        phrasebook_dir = bb.data.expand('${datadir}/${QT_DIR_NAME}/phrasebooks/', d)
-        phrasebook_name = bb.data.expand('${QT_BASE_NAME}-phrasebook-%s', d)
-        do_split_packages(d, phrasebook_dir, '^(.*)\.qph$', phrasebook_name, '${PN} phrasebook for %s', extra_depends='' )
- 
-        # Package all the plugins and their -dbg version and create a meta package
-        import os
-        def qtopia_split(path, name, glob):
-                """
-                Split the package into a normal and -dbg package and then add the
-                new packages to the meta package.
-                """
-                plugin_dir = bb.data.expand('${libdir}/${QT_DIR_NAME}/plugins/%s/' % path, d)
-                if not os.path.exists("%s%s" % (bb.data.expand('${D}',d), plugin_dir)):
-                        bb.note("The path does not exist:", bb.data.expand('${D}', d), plugin_dir)
-                        return
- 
-                plugin_name = bb.data.expand('${QT_BASE_NAME}-plugin-%s-%%s' % name, d)
-                dev_packages = []
-                dev_hook = lambda file,pkg,b,c,d:dev_packages.append((file,pkg))
-                do_split_packages(d, plugin_dir, glob, plugin_name, '${PN} %s for %%s' % name, extra_depends='', hook=dev_hook)
-                # Create a -dbg package as well
-                plugin_dir_dbg = bb.data.expand('${libdir}/${QT_DIR_NAME}/plugins/%s/.debug' % path, d)
-                packages = bb.data.getVar('PACKAGES',d)
-                for (file,package) in dev_packages:
-                        packages = "%s %s-dbg" % (packages, package)
-                        file_name = os.path.join(plugin_dir_dbg, os.path.basename(file))
-                        bb.data.setVar("FILES_%s-dbg" % package, file_name, d)
-                        bb.data.setVar("DESCRIPTION_%s-dbg" % package, "${PN} %s for %s" % (name, package), d)
-
-                bb.data.setVar('PACKAGES', packages, d)
- 
-        qtopia_split('accessible',    'accessible',    '^libq(.*)\.so$')
-        qtopia_split('codecs',        'codec',         '^libq(.*)\.so$')
-        qtopia_split('decorations',   'decoration',    '^libqdecoration(.*)\.so$')
-        qtopia_split('designer',      'designer',      '^lib(.*)\.so$')
-        qtopia_split('gfxdrivers',    'gfxdriver',     '^libq(.*)\.so$')
-        qtopia_split('graphicssystems','graphicssystems', '^libq(.*)\.so$')
-        qtopia_split('mousedrivers',  'mousedriver',   '^libq(.*)mousedriver\.so$')
-        qtopia_split('iconengines',   'iconengine',    '^libq(.*)\.so$')
-        qtopia_split('imageformats',  'imageformat',   '^libq(.*)\.so$')
-        qtopia_split('inputmethods',  'inputmethod',   '^libq(.*)\.so$')
-        qtopia_split('sqldrivers',    'sqldriver',     '^libq(.*)\.so$')
-        qtopia_split('script',        'script',        '^libqtscript(.*)\.so$')
-        qtopia_split('styles',        'style',         '^libq(.*)\.so$')
-        qtopia_split('phonon_backend','phonon-backend','^libphonon_(.*)\.so$')
-        qtopia_split('bearer',        'bearer',        '^libq(.*)bearer\.so$')
-}
-
-do_install() {
-    oe_runmake install INSTALL_ROOT=${D}
-
-    # These are host binaries, we should only use them in staging
-    rm -rf ${D}/${bindir}/qmake
-
-    # fix pkgconfig, libtool and prl files
-    sed -i -e s#-L${S}/lib##g \
-           -e s#-L${STAGING_LIBDIR}##g \
-           -e 's#STAGING_LIBDIR}#libdir}'#g \ 
-           -e s#-L${libdir}##g \
-           -e s#'$(OE_QMAKE_LIBS_X11)'#"${OE_QMAKE_LIBS_X11}"#g \
-           -e s#" -Wl,-rpath-link,${S}/lib"##g \
-           -e s#" -Wl,-rpath-link,${libdir}"##g \
-           -e 's#I/usr/include#Iincludedir}#g' \ 
-           -e 's#Iin#I${in#g' \
-           ${D}${libdir}/*.la ${D}${libdir}/*.prl ${D}${libdir}/pkgconfig/*.pc
-
-    sed -i -e s#" -Wl,-rpath-link,${S}/lib"##g \
-            ${D}${datadir}/${QT_DIR_NAME}/mkspecs/common/linux.conf
-
-    # fix pkgconfig files
-    sed -i -e s#"moc_location=.*$"#"moc_location=${bindir}/moc4"# \
-           -e s#"uic_location=.*$"#"uic_location=${bindir}/uic4"# \
-           ${D}${libdir}/pkgconfig/*.pc
-    for name in ${QT_LIB_NAMES}; do
-        sed -i -e /Requires/s#"${name}"#"${name}${QT_LIBINFIX}"#g ${D}${libdir}/pkgconfig/*.pc
-    done
-
-    # QT abuses $includedir to point to its headers, which breaks pkgconfig sysroot, so manually fix it up here:
-    for pc in ${D}${libdir}/pkgconfig/*.pc ; do
-        sed -i -e "s:prefix}include/${QT_BASE_NAME}/$(basename $pc .pc):prefix}/include:" \
-               -e "s,Cflags: ,Cflags: -IP{includedir}/${QT_BASE_NAME}/$(basename $pc .pc) ," \
-               -e 's:IP{:I${:g' $pc
-    done
-
-    install -d ${D}/${libdir}/fonts
-    touch ${D}/${libdir}/fonts/fontdir
-
-    install -d ${D}${bindir}
-    for i in rcc uic moc ; do
-        install -m 0755 ${S}/bin/$i ${D}${bindir}/
-    done
-
-    #Append an E to the qtdemo file
-    if [ -n "${QT_LIBINFIX}" ] ; then
-        mv ${D}${bindir}/qtdemo ${D}${bindir}/qtdemo${QT_LIBINFIX}
-    fi
-}
diff --git a/meta-oe/recipes-qt/qt4/qt4_arch.inc b/meta-oe/recipes-qt/qt4/qt4_arch.inc
deleted file mode 100644
index 7f4be63..0000000
--- a/meta-oe/recipes-qt/qt4/qt4_arch.inc
+++ /dev/null
@@ -1,25 +0,0 @@
-inherit siteinfo
-
-ARM_INSTRUCTION_SET = "arm"
-
-def qt_arch(d):
-    import bb, re
-    arch = bb.data.getVar('TARGET_ARCH', d, 1)
-    if re.match("^i.86$", arch):
-        arch = "i386"
-    elif re.match("^arm.*", arch):
-        arch = "arm"
-    elif arch == "x86_64":
-        arch = "x86"
-    elif arch == "mipsel":
-        arch = "mips"
-    return arch
-
-def qt_endian(d):
-    import bb
-    if bb.data.getVar('SITEINFO_ENDIANESS', d, True) == "le":
-        return "-little-endian"
-    elif bb.data.getVar('SITEINFO_ENDIANESS', d, True) == "be":
-        return "-big-endian"
-    else:
-        assert False
-- 
1.7.4.1



