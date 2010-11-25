Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PLdha-0002T5-DJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 16:25:40 +0100
Received: (qmail 24254 invoked by uid 503); 25 Nov 2010 15:28:48 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 25 Nov 2010 15:28:47 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 25 Nov 2010 17:24:24 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 25 Nov 2010 17:24:24 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Nov 2010 16:21:21 +0100
Message-Id: <1290698481-17446-4-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1290698481-17446-3-git-send-email-eric@eukrea.com>
References: <1290698481-17446-1-git-send-email-eric@eukrea.com>
	<1290698481-17446-2-git-send-email-eric@eukrea.com>
	<1290698481-17446-3-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9198602239574256972
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
Subject: [PATCH 4/4] qt4.7 : remove 4.7.0
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
X-List-Received-Date: Thu, 25 Nov 2010 15:25:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

now that 4.7.1 is here and default for Angstrom, SHR and minimal

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/qt4/qt-4.7.0.inc                           |   72 --------------------
 .../0001-Added-Openembedded-crossarch-option.patch |   44 ------------
 recipes/qt4/qt-4.7.0/g++.conf                      |   60 ----------------
 recipes/qt4/qt-4.7.0/hack-out-pg2-4.7.0.patch      |   19 -----
 recipes/qt4/qt-4.7.0/linux.conf                    |   66 ------------------
 recipes/qt4/qt4-embedded_4.7.0.bb                  |   14 ----
 recipes/qt4/qt4-tools-native_4.7.0.bb              |   22 ------
 recipes/qt4/qt4-tools-sdk_4.7.0.bb                 |    8 --
 recipes/qt4/qt4-x11-free-gles_4.7.0.bb             |   17 -----
 recipes/qt4/qt4-x11-free_4.7.0.bb                  |   15 ----
 10 files changed, 0 insertions(+), 337 deletions(-)
 delete mode 100644 recipes/qt4/qt-4.7.0.inc
 delete mode 100644 recipes/qt4/qt-4.7.0/0001-Added-Openembedded-crossarch-option.patch
 delete mode 100644 recipes/qt4/qt-4.7.0/g++.conf
 delete mode 100644 recipes/qt4/qt-4.7.0/hack-out-pg2-4.7.0.patch
 delete mode 100644 recipes/qt4/qt-4.7.0/linux.conf
 delete mode 100644 recipes/qt4/qt4-embedded_4.7.0.bb
 delete mode 100644 recipes/qt4/qt4-tools-native_4.7.0.bb
 delete mode 100644 recipes/qt4/qt4-tools-sdk_4.7.0.bb
 delete mode 100644 recipes/qt4/qt4-x11-free-gles_4.7.0.bb
 delete mode 100644 recipes/qt4/qt4-x11-free_4.7.0.bb

diff --git a/recipes/qt4/qt-4.7.0.inc b/recipes/qt4/qt-4.7.0.inc
deleted file mode 100644
index ba2b25a..0000000
--- a/recipes/qt4/qt-4.7.0.inc
+++ /dev/null
@@ -1,72 +0,0 @@
-DEFAULT_PREFERENCE = "-1"
-LICENSE = "LGPLv2.1 GPLv3"
-
-FILESPATHPKG =. "qt-${PV}:"
-
-SRC_URI = "\
-	ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
-	file://0004-no-qmake.patch \
-    file://hack-out-pg2-4.7.0.patch \
-	file://0006-freetype-host-includes.patch \
-	file://0001-Added-Openembedded-crossarch-option.patch \
-	file://g++.conf \
-	file://linux.conf \
-           "
-# Set necessary variables in the profile
-SRC_URI += "file://qte.sh"
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
-
-do_install_append() {
-	install -d ${D}${bindir}
-	for i in rcc uic moc ; do
-		install -m 0755 ${S}/bin/$i ${D}${bindir}/
-	done
-
-        #Append an E to the qtdemo file
-        if [ -n "${QT_LIBINFIX}" ] ; then
-                mv ${D}${bindir}/qtdemo ${D}${bindir}/qtdemo${QT_LIBINFIX}
-        fi
-}
-
-SRC_URI[md5sum] = "3a2f25b9b115037277f4fb759194a7a5"
-SRC_URI[sha256sum] = "e05256d560ca7d674cd4310bb791748900ad14ad662cbfe22b6d72ada43e7955"
-
diff --git a/recipes/qt4/qt-4.7.0/0001-Added-Openembedded-crossarch-option.patch b/recipes/qt4/qt-4.7.0/0001-Added-Openembedded-crossarch-option.patch
deleted file mode 100644
index 71a04a5..0000000
--- a/recipes/qt4/qt-4.7.0/0001-Added-Openembedded-crossarch-option.patch
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
diff --git a/recipes/qt4/qt-4.7.0/g++.conf b/recipes/qt4/qt-4.7.0/g++.conf
deleted file mode 100644
index 80f925c..0000000
--- a/recipes/qt4/qt-4.7.0/g++.conf
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
diff --git a/recipes/qt4/qt-4.7.0/hack-out-pg2-4.7.0.patch b/recipes/qt4/qt-4.7.0/hack-out-pg2-4.7.0.patch
deleted file mode 100644
index 5c588ff..0000000
--- a/recipes/qt4/qt-4.7.0/hack-out-pg2-4.7.0.patch
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
diff --git a/recipes/qt4/qt-4.7.0/linux.conf b/recipes/qt4/qt-4.7.0/linux.conf
deleted file mode 100644
index a541355..0000000
--- a/recipes/qt4/qt-4.7.0/linux.conf
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
diff --git a/recipes/qt4/qt4-embedded_4.7.0.bb b/recipes/qt4/qt4-embedded_4.7.0.bb
deleted file mode 100644
index 7e3d4b8..0000000
--- a/recipes/qt4/qt4-embedded_4.7.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DEFAULT_PREFERENCE = "-1"
-
-require qt4-embedded.inc
-
-PR = "${INC_PR}.1"
-
-QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
-
-require qt-${PV}.inc
-
-QT_CONFIG_FLAGS += " \
- -exceptions \
-"
-
diff --git a/recipes/qt4/qt4-tools-native_4.7.0.bb b/recipes/qt4/qt4-tools-native_4.7.0.bb
deleted file mode 100644
index 35c8ced..0000000
--- a/recipes/qt4/qt4-tools-native_4.7.0.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DEFAULT_PREFERENCE = "-1"
-
-require qt4-tools-native.inc
-LICENSE = "LGPLv2.1 GPLv3"
-
-PR = "${INC_PR}.2"
-
-# Find the g++.conf/linux.conf in the right directory.
-FILESPATHPKG =. "qt-${PV}:"
-SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
-           file://qt-config.patch \
-           file://g++.conf \
-           file://linux.conf"
-S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
-
-EXTRA_OECONF += " -no-fast -silent -no-rpath"
-
-TOBUILD := "src/tools/bootstrap ${TOBUILD}"
-
-SRC_URI[md5sum] = "3a2f25b9b115037277f4fb759194a7a5"
-SRC_URI[sha256sum] = "e05256d560ca7d674cd4310bb791748900ad14ad662cbfe22b6d72ada43e7955"
-
diff --git a/recipes/qt4/qt4-tools-sdk_4.7.0.bb b/recipes/qt4/qt4-tools-sdk_4.7.0.bb
deleted file mode 100644
index f224a95..0000000
--- a/recipes/qt4/qt4-tools-sdk_4.7.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require qt4-tools-sdk.inc
-
-PR = "${INC_PR}.2"
-
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI[md5sum] = "3a2f25b9b115037277f4fb759194a7a5"
-SRC_URI[sha256sum] = "e05256d560ca7d674cd4310bb791748900ad14ad662cbfe22b6d72ada43e7955"
diff --git a/recipes/qt4/qt4-x11-free-gles_4.7.0.bb b/recipes/qt4/qt4-x11-free-gles_4.7.0.bb
deleted file mode 100644
index 04419c0..0000000
--- a/recipes/qt4/qt4-x11-free-gles_4.7.0.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require qt4-x11-free.inc
-PR = "${INC_PR}.1"
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
diff --git a/recipes/qt4/qt4-x11-free_4.7.0.bb b/recipes/qt4/qt4-x11-free_4.7.0.bb
deleted file mode 100644
index 79a765e..0000000
--- a/recipes/qt4/qt4-x11-free_4.7.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DEFAULT_PREFERENCE = "-1"
-
-require qt4-x11-free.inc
-
-PR = "${INC_PR}.0"
-
-QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
-
-require qt-${PV}.inc
-
-QT_CONFIG_FLAGS += " \
- -no-embedded \
- -xrandr \
- -x11"
-
-- 
1.6.3.3



