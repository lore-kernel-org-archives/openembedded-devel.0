Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 84E5F72858
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2015 16:40:54 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id D9475D40051;
	Tue, 20 Jan 2015 17:40:54 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 89822D40348;
	Tue, 20 Jan 2015 17:40:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.2
Received: from rhein2.am93.sysmocom.de
	(ip5b41c286.dynamic.kabel-deutschland.de [91.65.194.134])
	by mail.familie-heinold.de (Postfix) with ESMTPSA;
	Tue, 20 Jan 2015 17:40:52 +0100 (CET)
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Jan 2015 17:40:46 +0100
Message-Id: <1421772046-14566-2-git-send-email-henning@itconsulting-heinold.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1421772046-14566-1-git-send-email-henning@itconsulting-heinold.de>
References: <1421772046-14566-1-git-send-email-henning@itconsulting-heinold.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [meta-oe][PATCH] libspatialite: Upgrade to version 4.2.0
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
X-List-Received-Date: Tue, 20 Jan 2015 16:41:03 -0000

From: Holger Hans Peter Freyther <holger@moiji-mobile.com>

Package the new sqlite3 plugin into a new package and skip
the dev-so qa issue. Add some extra depends that are now used
by the library.

The patch was adapted for meta-openembedded by Henning Heinold, setting
the upstream status for the geos-config.patch

Signed-off-by: Henning Heinold <henning@itconsulting-heinold.de>
---
 .../libspatialite-4.2.0/geos-config.patch          |  17 ++
 .../libspatialite/libspatialite.inc                |   7 +-
 .../fix-the-configure-script-and-freexl.patch      | 200 ---------------------
 .../libspatialite/libspatialite_3.0.1.bb           |   9 -
 .../libspatialite/libspatialite_4.2.0.bb           |   8 +
 5 files changed, 31 insertions(+), 210 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/libspatialite/libspatialite-4.2.0/geos-config.patch
 delete mode 100644 meta-oe/recipes-navigation/libspatialite/libspatialite/fix-the-configure-script-and-freexl.patch
 delete mode 100644 meta-oe/recipes-navigation/libspatialite/libspatialite_3.0.1.bb
 create mode 100644 meta-oe/recipes-navigation/libspatialite/libspatialite_4.2.0.bb

diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite-4.2.0/geos-config.patch b/meta-oe/recipes-navigation/libspatialite/libspatialite-4.2.0/geos-config.patch
new file mode 100644
index 0000000..28bd7da
--- /dev/null
+++ b/meta-oe/recipes-navigation/libspatialite/libspatialite-4.2.0/geos-config.patch
@@ -0,0 +1,17 @@
+https://www.gaia-gis.it/fossil/libspatialite/tktview?name=abeeaad448
+
+Upstream-Status: Submitted [rpm5-devel@rpm5.org]
+
+Index: libspatialite-4.2.0/configure.ac
+===================================================================
+--- libspatialite-4.2.0.orig/configure.ac
++++ libspatialite-4.2.0/configure.ac
+@@ -260,7 +260,7 @@ if test x"$enable_geos" != "xno"; then
+   fi
+   # Extract the linker and include flags
+   GEOS_LDFLAGS=`$GEOSCONFIG --ldflags`
+-  GEOS_CFLAGS=-I`$GEOSCONFIG --includes`
++  GEOS_CFLAGS=`$GEOSCONFIG --cflags`
+   AC_SUBST([GEOS_LDFLAGS])
+   AC_SUBST([GEOS_CFLAGS])	
+   # Ensure that we can parse geos_c.h
diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite.inc b/meta-oe/recipes-navigation/libspatialite/libspatialite.inc
index b5c3879..fa397b6 100644
--- a/meta-oe/recipes-navigation/libspatialite/libspatialite.inc
+++ b/meta-oe/recipes-navigation/libspatialite/libspatialite.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "Library extending the SQLite core to support fully fledged Spatial SQL capabilities"
 HOMEPAGE = "https://www.gaia-gis.it/fossil/libspatialite/"
 SECTION = "libs"
-DEPENDS = "proj geos sqlite3"
+DEPENDS = "proj geos sqlite3 libxml2 zlib"
 
 INC_PR = "r0"
 
@@ -14,3 +14,8 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "--enable-freexl=no"
 
+
+# A plugins for SQLite3
+PACKAGES += "${PN}-plugin"
+INSANE_SKIP_${PN}-plugin = "dev-so"
+FILES_${PN}-plugin += "${libdir}/mod_*"
diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite/fix-the-configure-script-and-freexl.patch b/meta-oe/recipes-navigation/libspatialite/libspatialite/fix-the-configure-script-and-freexl.patch
deleted file mode 100644
index 0cd0c3f..0000000
--- a/meta-oe/recipes-navigation/libspatialite/libspatialite/fix-the-configure-script-and-freexl.patch
+++ /dev/null
@@ -1,200 +0,0 @@
-From upstream fossil repo, extracted via git, dropping configure.ac for amalgamation
-
-From: sandro <sandro>
-Date: Sat, 21 Jan 2012 16:53:28 +0000
-Subject: [PATCH] fixing the ./configure script: --enable-geocallbacks=no is
- the new default and fixing some flaws for
- --enable-freexl=no
-
----
- configure                   |   20 ++++++++++----------
- configure.ac                |   20 ++++++++++----------
- src/shapefiles/shapefiles.c |    2 ++
- 4 files changed, 32 insertions(+), 30 deletions(-)
-
-diff --git a/configure b/configure
-index e8cf620..917bfca 100755
---- a/configure
-+++ b/configure
-@@ -1410,7 +1410,7 @@ Optional Features:
-                           optimize for fast installation [default=yes]
-   --disable-libtool-lock  avoid locking (might break parallel builds)
-   --enable-mathsql        enables SQL math functions [default=yes]
--  --enable-geocallbacks   enables geometry callbacks [default=yes]
-+  --enable-geocallbacks   enables geometry callbacks [default=no]
-   --enable-proj           enables PROJ.4 inclusion [default=yes]
-   --enable-geos           enables GEOS inclusion [default=yes]
-   --enable-geosadvanced   enables GEOS advanced features [default=yes]
-@@ -16980,7 +16980,7 @@ ac_config_files="$ac_config_files Makefile src/Makefile src/headers/Makefile src
- if test "${enable_mathsql+set}" = set; then :
-   enableval=$enable_mathsql;
- else
--  mathsql=yes
-+  enable_mathsql=yes
- fi
- 
- if test x"$enable_mathsql" != "xno"; then
-@@ -16998,10 +16998,10 @@ fi
- if test "${enable_geocallbacks+set}" = set; then :
-   enableval=$enable_geocallbacks;
- else
--  geocallbacks=yes
-+  enable_geocallbacks=no
- fi
- 
--if test x"$enable_geocallbacks" != "xno"; then
-+if test x"$enable_geocallbacks" == "xyes"; then
-   OMIT_GEOCALLBACKS_FLAGS=
-   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sqlite3_rtree_geometry_callback in -lsqlite3" >&5
- $as_echo_n "checking for sqlite3_rtree_geometry_callback in -lsqlite3... " >&6; }
-@@ -17063,7 +17063,7 @@ fi
- if test "${enable_proj+set}" = set; then :
-   enableval=$enable_proj;
- else
--  proj=yes
-+  enable_proj=yes
- fi
- 
- if test x"$enable_proj" != "xno"; then
-@@ -17153,7 +17153,7 @@ fi
- if test "${enable_geos+set}" = set; then :
-   enableval=$enable_geos;
- else
--  geos=yes
-+  enable_geos=yes
- fi
- 
- if test x"$enable_geos" != "xno"; then
-@@ -17237,7 +17237,7 @@ fi
- if test "${enable_geosadvanced+set}" = set; then :
-   enableval=$enable_geosadvanced;
- else
--  geosadvanced=yes
-+  enable_geosadvanced=yes
- fi
- 
-   if test x"$enable_geosadvanced" != "xno"; then
-@@ -17316,7 +17316,7 @@ fi
- if test "${enable_iconv+set}" = set; then :
-   enableval=$enable_iconv;
- else
--  geos=yes
-+  enable_iconv=yes
- fi
- 
- if test x"$enable_iconv" != "xno"; then
-@@ -17579,7 +17579,7 @@ fi
- if test "${enable_freexl+set}" = set; then :
-   enableval=$enable_freexl;
- else
--  proj=yes
-+  enable_freexl=yes
- fi
- 
- if test x"$enable_freexl" != "xno"; then
-@@ -17669,7 +17669,7 @@ fi
- if test "${enable_epsg+set}" = set; then :
-   enableval=$enable_epsg;
- else
--  epsg=yes
-+  enable_epsg=yes
- fi
- 
- if test x"$enable_epsg" != "xno"; then
-diff --git a/configure.ac b/configure.ac
-index 216cc9f..69cb6c5 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -79,7 +79,7 @@ AC_CONFIG_FILES([Makefile \
- #
- AC_ARG_ENABLE(mathsql, [AS_HELP_STRING(
-   [--enable-mathsql], [enables SQL math functions [default=yes]])],
--  [], [mathsql=yes])
-+  [], [enable_mathsql=yes])
- if test x"$enable_mathsql" != "xno"; then
-   OMIT_MATHSQL_FLAGS=
- else
-@@ -92,9 +92,9 @@ AC_SUBST(OMIT_MATHSQL_FLAGS)
- #   --enable-geocallbacks
- #
- AC_ARG_ENABLE(geocallbacks, [AS_HELP_STRING(
--  [--enable-geocallbacks], [enables geometry callbacks [default=yes]])],
--  [], [geocallbacks=yes])
--if test x"$enable_geocallbacks" != "xno"; then
-+  [--enable-geocallbacks], [enables geometry callbacks [default=no]])],
-+  [], [enable_geocallbacks=no])
-+if test x"$enable_geocallbacks" == "xyes"; then
-   OMIT_GEOCALLBACKS_FLAGS=
-   AC_CHECK_LIB(sqlite3,sqlite3_rtree_geometry_callback,,AC_MSG_ERROR([obsolete 'libsqlite3' (< v.3.7.3). please retry specifying: --disable-geocallbacks]),-lm)
- else
-@@ -108,7 +108,7 @@ AC_SUBST(OMIT_GEOCALLBACKS_FLAGS)
- #
- AC_ARG_ENABLE(proj, [AS_HELP_STRING(
-   [--enable-proj], [enables PROJ.4 inclusion [default=yes]])],
--  [], [proj=yes])
-+  [], [enable_proj=yes])
- if test x"$enable_proj" != "xno"; then
-   OMIT_PROJ_FLAGS=
-   AC_CHECK_HEADERS(proj_api.h,, [AC_MSG_ERROR([cannot find proj_api.h, bailing out])])
-@@ -124,7 +124,7 @@ AC_SUBST(OMIT_PROJ_FLAGS)
- #
- AC_ARG_ENABLE(geos, [AS_HELP_STRING(
-   [--enable-geos], [enables GEOS inclusion [default=yes]])],
--  [], [geos=yes])
-+  [], [enable_geos=yes])
- if test x"$enable_geos" != "xno"; then
-   OMIT_GEOS_FLAGS=
-   AC_CHECK_HEADERS(geos_c.h,, [AC_MSG_ERROR([cannot find geos_c.h, bailing out])])
-@@ -134,7 +134,7 @@ if test x"$enable_geos" != "xno"; then
-   #
-   AC_ARG_ENABLE(geosadvanced, [AS_HELP_STRING(
- 	  [--enable-geosadvanced], [enables GEOS advanced features [default=yes]])],
--	  [], [geosadvanced=yes])
-+	  [], [enable_geosadvanced=yes])
-   if test x"$enable_geosadvanced" != "xno"; then
- 	  GEOSADVANCED_FLAGS=-DGEOS_ADVANCED
- 	  AC_SEARCH_LIBS(GEOSCoveredBy,geos_c,,AC_MSG_ERROR([obsolete 'libgeos_c' (< v.3.3.0). please retry specifying: --disable-geosadvanced.]),-lm -lgeos)
-@@ -152,7 +152,7 @@ AC_SUBST(OMIT_GEOS_FLAGS)
- #
- AC_ARG_ENABLE(iconv, [AS_HELP_STRING(
-   [--enable-iconv], [enables ICONV inclusion [default=yes]])],
--  [], [geos=yes])
-+  [], [enable_iconv=yes])
- if test x"$enable_iconv" != "xno"; then
-   OMIT_ICONV_FLAGS=
-   AC_CHECK_HEADERS(iconv.h,, [AC_MSG_ERROR([cannot find iconv.h, bailing out])])
-@@ -172,7 +172,7 @@ AC_SUBST(OMIT_ICONV_FLAGS)
- #
- AC_ARG_ENABLE(freexl, [AS_HELP_STRING(
-   [--enable-freexl], [enables FreeXL inclusion [default=yes]])],
--  [], [proj=yes])
-+  [], [enable_freexl=yes])
- if test x"$enable_freexl" != "xno"; then
-   OMIT_FREEXL_FLAGS=
-   AC_CHECK_HEADERS(freexl.h,, [AC_MSG_ERROR([cannot find freexl.h, bailing out])])
-@@ -188,7 +188,7 @@ AC_SUBST(OMIT_FREEXL_FLAGS)
- #
- AC_ARG_ENABLE(epsg, [AS_HELP_STRING(
-   [--enable-epsg], [enables full EPSG dataset support [default=yes]])],
--  [], [epsg=yes])
-+  [], [enable_epsg=yes])
- if test x"$enable_epsg" != "xno"; then
-   OMIT_EPSG_FLAGS=
- else
-diff --git a/src/shapefiles/shapefiles.c b/src/shapefiles/shapefiles.c
-index 4bf5fd0..09e3cd3 100644
---- a/src/shapefiles/shapefiles.c
-+++ b/src/shapefiles/shapefiles.c
-@@ -62,7 +62,9 @@ the terms of any one of the MPL, the GPL or the LGPL.
- #include <spatialite/gaiageo.h>
- #include <spatialite.h>
- 
-+#ifndef OMIT_FREEXL
- #include <freexl.h>
-+#endif
- 
- #if defined(_WIN32) && !defined(__MINGW32__)
- #define strcasecmp	_stricmp
--- 
-1.7.9.1
-
diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite_3.0.1.bb b/meta-oe/recipes-navigation/libspatialite/libspatialite_3.0.1.bb
deleted file mode 100644
index 1cb72e8..0000000
--- a/meta-oe/recipes-navigation/libspatialite/libspatialite_3.0.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require libspatialite.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "450d1a0d9da1bd9f770b7db3f2509f69"
-SRC_URI[sha256sum] = "4983d6584069fd5ff0cfcccccee1015088dab2db177c0dc7050ce8306b68f8e6"
-
-SRC_URI =+ "file://fix-the-configure-script-and-freexl.patch"
-
diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite_4.2.0.bb b/meta-oe/recipes-navigation/libspatialite/libspatialite_4.2.0.bb
new file mode 100644
index 0000000..74a77e8
--- /dev/null
+++ b/meta-oe/recipes-navigation/libspatialite/libspatialite_4.2.0.bb
@@ -0,0 +1,8 @@
+require libspatialite.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "83305ed694a77152120d1f74c5151779"
+SRC_URI[sha256sum] = "9f138a6854740c7827fdee53845eb1485fce3e805a7aa9fc9151f8046ebd312d"
+
+SRC_URI += "file://geos-config.patch"
-- 
1.9.1

