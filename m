Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 81C2973CBD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 05:31:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t985VeFu014812
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 7 Oct 2015 22:31:40 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 7 Oct 2015 22:31:39 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 8 Oct 2015 01:31:36 -0400
Message-ID: <7a05c6fd97d6097b095ca64ab436c6c5c0c0a58e.1444282133.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1444282133.git.wenzong.fan@windriver.com>
References: <cover.1444282133.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2][meta-oe] swig: remove package
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
X-List-Received-Date: Thu, 08 Oct 2015 05:31:42 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

swig 3.0.6 has been moved to oe-croe:
  66923c6776da13bd4513a73c3f7c5e60d74eb0f3

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-oe/recipes-devtools/swig/swig.inc             | 63 --------------------
 ...lf-exe-for-swig-swiglib-on-non-Win32-plat.patch | 69 ----------------------
 ...nfigure-use-pkg-config-for-pcre-detection.patch | 64 --------------------
 meta-oe/recipes-devtools/swig/swig_3.0.6.bb        |  8 ---
 4 files changed, 204 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/swig/swig.inc
 delete mode 100644 meta-oe/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
 delete mode 100644 meta-oe/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
 delete mode 100644 meta-oe/recipes-devtools/swig/swig_3.0.6.bb

diff --git a/meta-oe/recipes-devtools/swig/swig.inc b/meta-oe/recipes-devtools/swig/swig.inc
deleted file mode 100644
index 9821fa5..0000000
--- a/meta-oe/recipes-devtools/swig/swig.inc
+++ /dev/null
@@ -1,63 +0,0 @@
-DESCRIPTION = "SWIG - Simplified Wrapper and Interface Generator"
-HOMEPAGE = "http://swig.sourceforge.net/"
-LICENSE = "BSD & GPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e7807a6282784a7dde4c846626b08fc6 \
-                    file://LICENSE-GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LICENSE-UNIVERSITIES;md5=8ce9dcc8f7c994de4a408b205c72ba08"
-
-SECTION = "devel"
-
-DEPENDS = "libpcre python"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
-
-inherit autotools pythonnative
-
-EXTRA_OECONF = " \
-    --with-python=${PYTHON} \
-    --without-allegrocl \
-    --without-android \
-    --without-boost \
-    --without-chicken \
-    --without-clisp \
-    --without-csharp \
-    --without-d \
-    --without-gcj \
-    --without-go \
-    --without-guile \
-    --without-java \
-    --without-lua \
-    --without-mzscheme \
-    --without-ocaml \
-    --without-octave \
-    --without-perl5 \
-    --without-pike \
-    --without-php \
-    --without-python3 \
-    --without-r \
-    --without-ruby \
-    --without-tcl \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-
-do_configure() {
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/Tools/config
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/Tools/config
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
-    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
-    oe_runconf
-}
-
-do_install_append_class-nativesdk() {
-    cd ${D}${bindir}
-    ln -s swig swig2.0
-}
-
-def swiglib_relpath(d):
-    swiglib = d.getVar('datadir', True) + "/" + d.getVar('BPN', True) + "/" + d.getVar('PV', True)
-    return os.path.relpath(swiglib, d.getVar('bindir', True))
-
-do_install_append_class-native() {
-    create_wrapper ${D}${bindir}/swig SWIG_LIB='`dirname $''realpath`'/${@swiglib_relpath(d)}
-}
diff --git a/meta-oe/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch b/meta-oe/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
deleted file mode 100644
index 81df3e2..0000000
--- a/meta-oe/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From a4a0440a644c6c5e5da096efe3cf05ba309a284f Mon Sep 17 00:00:00 2001
-From: "NODA, Kai" <nodakai@gmail.com>
-Date: Sun, 22 Apr 2012 17:01:02 +0900
-Subject: [PATCH] Use /proc/self/exe for "swig -swiglib" on non-Win32
- platforms.
-
-If it wasn't found, then fall back to a fixed string just as before.
-
-Upstream-Status: Submitted
-http://sourceforge.net/mailarchive/message.php?msg_id=29179733
-
----
- Source/Modules/main.cxx |   24 ++++++++++++++++++++++--
- 1 file changed, 22 insertions(+), 2 deletions(-)
-
-diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
-index d2f5d3b..cbb0a12 100644
---- a/Source/Modules/main.cxx
-+++ b/Source/Modules/main.cxx
-@@ -26,6 +26,11 @@ char cvsroot_main_cxx[] = "$Id$";
- #include "cparse.h"
- #include <ctype.h>
- #include <limits.h>		// for INT_MAX
-+#ifndef _WIN32
-+#include <cstddef>
-+#include <unistd.h>		// for readlink
-+#include <sys/stat.h>		// for stat
-+#endif
- 
- // Global variables
- 
-@@ -902,9 +907,9 @@ int SWIG_main(int argc, char *argv[], Language *l) {
- 
-   // Check for SWIG_LIB environment variable
-   if ((c = getenv("SWIG_LIB")) == (char *) 0) {
-+    char *p;
- #if defined(_WIN32)
-     char buf[MAX_PATH];
--    char *p;
-     if (!(GetModuleFileName(0, buf, MAX_PATH) == 0 || (p = strrchr(buf, '\\')) == 0)) {
-       *(p + 1) = '\0';
-       SwigLib = NewStringf("%sLib", buf); // Native windows installation path
-@@ -914,7 +919,22 @@ int SWIG_main(int argc, char *argv[], Language *l) {
-     if (Len(SWIG_LIB_WIN_UNIX) > 0)
-       SwigLibWinUnix = NewString(SWIG_LIB_WIN_UNIX); // Unix installation path using a drive letter (for msys/mingw)
- #else
--    SwigLib = NewString(SWIG_LIB);
-+    char buf[PATH_MAX];
-+    if (0 < ::readlink("/proc/self/exe", buf, sizeof(buf)) &&
-+        (p = ::strstr(buf, "/bin/swig"))) {
-+        int major, minor, patch;
-+        const int ret = ::sscanf(VERSION, "%d.%d.%d", &major, &minor, &patch);
-+        if (3 == ret) {
-+            const ::ptrdiff_t dir_part_len = p - buf;
-+            ::snprintf(p, PATH_MAX - dir_part_len, "/share/swig/%d.%d.%d", major, minor, patch);
-+            struct ::stat stat_res;
-+            if (0 == ::stat(buf, &stat_res) && S_ISDIR(stat_res.st_mode)) {
-+                SwigLib = NewString(buf);
-+            }
-+        }
-+    }
-+    if (NULL == SwigLib)
-+        SwigLib = NewString(SWIG_LIB);
- #endif
-   } else {
-     SwigLib = NewString(c);
--- 
-1.7.9.5
-
diff --git a/meta-oe/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch b/meta-oe/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
deleted file mode 100644
index 1b1128a..0000000
--- a/meta-oe/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 5c4d6d8538994d5fe9b3b46bfafaf0a605e3bda6 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen.kooi@linaro.org>
-Date: Tue, 17 Jun 2014 08:18:17 +0200
-Subject: [PATCH] configure: use pkg-config for pcre detection
-
-Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
-Upstream-Status: pending
----
- configure.ac | 38 +++++++-------------------------------
- 1 file changed, 7 insertions(+), 31 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0c984b7..6edcec1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -70,38 +70,14 @@ AC_MSG_RESULT([$with_pcre])
- 
- dnl To make configuring easier, check for a locally built PCRE using the Tools/pcre-build.sh script
- if test x"${with_pcre}" = xyes ; then
--  AC_MSG_CHECKING([whether to use local PCRE])
--  local_pcre_config=no
--  if test -z $PCRE_CONFIG; then
--    if test -f `pwd`/pcre/pcre-swig-install/bin/pcre-config; then
--      PCRE_CONFIG=`pwd`/pcre/pcre-swig-install/bin/pcre-config
--      local_pcre_config=$PCRE_CONFIG
--    fi
--  fi
--  AC_MSG_RESULT([$local_pcre_config])
--fi
--AS_IF([test "x$with_pcre" != xno],
--  [AX_PATH_GENERIC([pcre],
--    [], dnl Minimal version of PCRE we need -- accept any
--    [], dnl custom sed script for version parsing is not needed
--    [AC_DEFINE([HAVE_PCRE], [1], [Define if you have PCRE library])
--     LIBS="$LIBS $PCRE_LIBS"
--     CPPFLAGS="$CPPFLAGS $PCRE_CFLAGS"
--    ],
--    [AC_MSG_FAILURE([
--        Cannot find pcre-config script from PCRE (Perl Compatible Regular Expressions)
--        library package. This dependency is needed for configure to complete,
--        Either:
--        - Install the PCRE developer package on your system (preferred approach).
--        - Download the PCRE source tarball, build and install on your system
--          as you would for any package built from source distribution.
--        - Use the Tools/pcre-build.sh script to build PCRE just for SWIG to statically
--          link against. Run 'Tools/pcre-build.sh --help' for instructions.
--          (quite easy and does not require privileges to install PCRE on your system)
--        - Use configure --without-pcre to disable regular expressions support in SWIG
--          (not recommended).])
--    ])
-+  PKG_CHECK_MODULES([PCRE], [libpcre], [
-+    AC_DEFINE([HAVE_PCRE], [1], [Define if you have PCRE library])
-+    LIBS="$LIBS $PCRE_LIBS"
-+    CPPFLAGS="$CPPFLAGS $PCRE_CFLAGS"
-+  ], [
-+    AC_MSG_WARN([$PCRE_PKG_ERRORS])
-   ])
-+fi
- 
- 
- dnl CCache
--- 
-1.9.3
-
diff --git a/meta-oe/recipes-devtools/swig/swig_3.0.6.bb b/meta-oe/recipes-devtools/swig/swig_3.0.6.bb
deleted file mode 100644
index 2a0917e..0000000
--- a/meta-oe/recipes-devtools/swig/swig_3.0.6.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch \
-            file://0001-configure-use-pkg-config-for-pcre-detection.patch \
-           "
-SRC_URI[md5sum] = "df43ae271642bcfa61c1e59f970f9963"
-SRC_URI[sha256sum] = "c67f63ea11956106e4cda66416d5020330dc4ce2ee45057d39a9494ce33eca05"
-
-- 
1.9.1


