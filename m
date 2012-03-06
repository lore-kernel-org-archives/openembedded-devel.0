Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jluebbe@lasnet.de>) id 1S4sBW-0000lT-6k
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 12:04:02 +0100
Received: from [89.204.154.91] (helo=polaris.fritz.box)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1S4rlC-0006KD-Vx by authid <polaris@lasnet.de> with
	srv_auth_cram_md5 for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2012 11:36:56 +0100
From: Jan Luebbe <jluebbe@debian.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2012 11:36:13 +0100
Message-Id: <1331030173-21724-3-git-send-email-jluebbe@debian.org>
X-Mailer: git-send-email 1.7.9.1
In-Reply-To: <1331030173-21724-1-git-send-email-jluebbe@debian.org>
References: <1331030173-21724-1-git-send-email-jluebbe@debian.org>
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.2.5
Subject: [PATCH 3/3] libspatialite: add recipe
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
X-List-Received-Date: Tue, 06 Mar 2012 11:04:02 -0000

Signed-off-by: Jan Luebbe <jluebbe@debian.org>
---
 .../libspatialite/libspatialite.inc                |   16 ++
 .../fix-the-configure-script-and-freexl.patch      |  200 ++++++++++++++++++++
 .../libspatialite/libspatialite_3.0.1.bb           |    9 +
 3 files changed, 225 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/libspatialite/libspatialite.inc
 create mode 100644 meta-oe/recipes-navigation/libspatialite/libspatialite/fix-the-configure-script-and-freexl.patch
 create mode 100644 meta-oe/recipes-navigation/libspatialite/libspatialite_3.0.1.bb

diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite.inc b/meta-oe/recipes-navigation/libspatialite/libspatialite.inc
new file mode 100644
index 0000000..f51b3a5
--- /dev/null
+++ b/meta-oe/recipes-navigation/libspatialite/libspatialite.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "Library extending the SQLite core to support fully fledged Spatial SQL capabilities"
+HOMEPAGE = "https://www.gaia-gis.it/fossil/libspatialite/"
+SECTION = "libs"
+DEPENDS = "proj geos"
+
+INC_PR = "r0"
+
+LICENSE = "MPLv1.1 GPLv2+ LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0e92e1a36cc384b60f5b31dde0bdd39e"
+
+SRC_URI = "http://www.gaia-gis.it/gaia-sins/libspatialite-sources/libspatialite-${PV}.tar.gz"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--enable-freexl=no"
+
diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite/fix-the-configure-script-and-freexl.patch b/meta-oe/recipes-navigation/libspatialite/libspatialite/fix-the-configure-script-and-freexl.patch
new file mode 100644
index 0000000..0cd0c3f
--- /dev/null
+++ b/meta-oe/recipes-navigation/libspatialite/libspatialite/fix-the-configure-script-and-freexl.patch
@@ -0,0 +1,200 @@
+From upstream fossil repo, extracted via git, dropping configure.ac for amalgamation
+
+From: sandro <sandro>
+Date: Sat, 21 Jan 2012 16:53:28 +0000
+Subject: [PATCH] fixing the ./configure script: --enable-geocallbacks=no is
+ the new default and fixing some flaws for
+ --enable-freexl=no
+
+---
+ configure                   |   20 ++++++++++----------
+ configure.ac                |   20 ++++++++++----------
+ src/shapefiles/shapefiles.c |    2 ++
+ 4 files changed, 32 insertions(+), 30 deletions(-)
+
+diff --git a/configure b/configure
+index e8cf620..917bfca 100755
+--- a/configure
++++ b/configure
+@@ -1410,7 +1410,7 @@ Optional Features:
+                           optimize for fast installation [default=yes]
+   --disable-libtool-lock  avoid locking (might break parallel builds)
+   --enable-mathsql        enables SQL math functions [default=yes]
+-  --enable-geocallbacks   enables geometry callbacks [default=yes]
++  --enable-geocallbacks   enables geometry callbacks [default=no]
+   --enable-proj           enables PROJ.4 inclusion [default=yes]
+   --enable-geos           enables GEOS inclusion [default=yes]
+   --enable-geosadvanced   enables GEOS advanced features [default=yes]
+@@ -16980,7 +16980,7 @@ ac_config_files="$ac_config_files Makefile src/Makefile src/headers/Makefile src
+ if test "${enable_mathsql+set}" = set; then :
+   enableval=$enable_mathsql;
+ else
+-  mathsql=yes
++  enable_mathsql=yes
+ fi
+ 
+ if test x"$enable_mathsql" != "xno"; then
+@@ -16998,10 +16998,10 @@ fi
+ if test "${enable_geocallbacks+set}" = set; then :
+   enableval=$enable_geocallbacks;
+ else
+-  geocallbacks=yes
++  enable_geocallbacks=no
+ fi
+ 
+-if test x"$enable_geocallbacks" != "xno"; then
++if test x"$enable_geocallbacks" == "xyes"; then
+   OMIT_GEOCALLBACKS_FLAGS=
+   { $as_echo "$as_me:${as_lineno-$LINENO}: checking for sqlite3_rtree_geometry_callback in -lsqlite3" >&5
+ $as_echo_n "checking for sqlite3_rtree_geometry_callback in -lsqlite3... " >&6; }
+@@ -17063,7 +17063,7 @@ fi
+ if test "${enable_proj+set}" = set; then :
+   enableval=$enable_proj;
+ else
+-  proj=yes
++  enable_proj=yes
+ fi
+ 
+ if test x"$enable_proj" != "xno"; then
+@@ -17153,7 +17153,7 @@ fi
+ if test "${enable_geos+set}" = set; then :
+   enableval=$enable_geos;
+ else
+-  geos=yes
++  enable_geos=yes
+ fi
+ 
+ if test x"$enable_geos" != "xno"; then
+@@ -17237,7 +17237,7 @@ fi
+ if test "${enable_geosadvanced+set}" = set; then :
+   enableval=$enable_geosadvanced;
+ else
+-  geosadvanced=yes
++  enable_geosadvanced=yes
+ fi
+ 
+   if test x"$enable_geosadvanced" != "xno"; then
+@@ -17316,7 +17316,7 @@ fi
+ if test "${enable_iconv+set}" = set; then :
+   enableval=$enable_iconv;
+ else
+-  geos=yes
++  enable_iconv=yes
+ fi
+ 
+ if test x"$enable_iconv" != "xno"; then
+@@ -17579,7 +17579,7 @@ fi
+ if test "${enable_freexl+set}" = set; then :
+   enableval=$enable_freexl;
+ else
+-  proj=yes
++  enable_freexl=yes
+ fi
+ 
+ if test x"$enable_freexl" != "xno"; then
+@@ -17669,7 +17669,7 @@ fi
+ if test "${enable_epsg+set}" = set; then :
+   enableval=$enable_epsg;
+ else
+-  epsg=yes
++  enable_epsg=yes
+ fi
+ 
+ if test x"$enable_epsg" != "xno"; then
+diff --git a/configure.ac b/configure.ac
+index 216cc9f..69cb6c5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -79,7 +79,7 @@ AC_CONFIG_FILES([Makefile \
+ #
+ AC_ARG_ENABLE(mathsql, [AS_HELP_STRING(
+   [--enable-mathsql], [enables SQL math functions [default=yes]])],
+-  [], [mathsql=yes])
++  [], [enable_mathsql=yes])
+ if test x"$enable_mathsql" != "xno"; then
+   OMIT_MATHSQL_FLAGS=
+ else
+@@ -92,9 +92,9 @@ AC_SUBST(OMIT_MATHSQL_FLAGS)
+ #   --enable-geocallbacks
+ #
+ AC_ARG_ENABLE(geocallbacks, [AS_HELP_STRING(
+-  [--enable-geocallbacks], [enables geometry callbacks [default=yes]])],
+-  [], [geocallbacks=yes])
+-if test x"$enable_geocallbacks" != "xno"; then
++  [--enable-geocallbacks], [enables geometry callbacks [default=no]])],
++  [], [enable_geocallbacks=no])
++if test x"$enable_geocallbacks" == "xyes"; then
+   OMIT_GEOCALLBACKS_FLAGS=
+   AC_CHECK_LIB(sqlite3,sqlite3_rtree_geometry_callback,,AC_MSG_ERROR([obsolete 'libsqlite3' (< v.3.7.3). please retry specifying: --disable-geocallbacks]),-lm)
+ else
+@@ -108,7 +108,7 @@ AC_SUBST(OMIT_GEOCALLBACKS_FLAGS)
+ #
+ AC_ARG_ENABLE(proj, [AS_HELP_STRING(
+   [--enable-proj], [enables PROJ.4 inclusion [default=yes]])],
+-  [], [proj=yes])
++  [], [enable_proj=yes])
+ if test x"$enable_proj" != "xno"; then
+   OMIT_PROJ_FLAGS=
+   AC_CHECK_HEADERS(proj_api.h,, [AC_MSG_ERROR([cannot find proj_api.h, bailing out])])
+@@ -124,7 +124,7 @@ AC_SUBST(OMIT_PROJ_FLAGS)
+ #
+ AC_ARG_ENABLE(geos, [AS_HELP_STRING(
+   [--enable-geos], [enables GEOS inclusion [default=yes]])],
+-  [], [geos=yes])
++  [], [enable_geos=yes])
+ if test x"$enable_geos" != "xno"; then
+   OMIT_GEOS_FLAGS=
+   AC_CHECK_HEADERS(geos_c.h,, [AC_MSG_ERROR([cannot find geos_c.h, bailing out])])
+@@ -134,7 +134,7 @@ if test x"$enable_geos" != "xno"; then
+   #
+   AC_ARG_ENABLE(geosadvanced, [AS_HELP_STRING(
+ 	  [--enable-geosadvanced], [enables GEOS advanced features [default=yes]])],
+-	  [], [geosadvanced=yes])
++	  [], [enable_geosadvanced=yes])
+   if test x"$enable_geosadvanced" != "xno"; then
+ 	  GEOSADVANCED_FLAGS=-DGEOS_ADVANCED
+ 	  AC_SEARCH_LIBS(GEOSCoveredBy,geos_c,,AC_MSG_ERROR([obsolete 'libgeos_c' (< v.3.3.0). please retry specifying: --disable-geosadvanced.]),-lm -lgeos)
+@@ -152,7 +152,7 @@ AC_SUBST(OMIT_GEOS_FLAGS)
+ #
+ AC_ARG_ENABLE(iconv, [AS_HELP_STRING(
+   [--enable-iconv], [enables ICONV inclusion [default=yes]])],
+-  [], [geos=yes])
++  [], [enable_iconv=yes])
+ if test x"$enable_iconv" != "xno"; then
+   OMIT_ICONV_FLAGS=
+   AC_CHECK_HEADERS(iconv.h,, [AC_MSG_ERROR([cannot find iconv.h, bailing out])])
+@@ -172,7 +172,7 @@ AC_SUBST(OMIT_ICONV_FLAGS)
+ #
+ AC_ARG_ENABLE(freexl, [AS_HELP_STRING(
+   [--enable-freexl], [enables FreeXL inclusion [default=yes]])],
+-  [], [proj=yes])
++  [], [enable_freexl=yes])
+ if test x"$enable_freexl" != "xno"; then
+   OMIT_FREEXL_FLAGS=
+   AC_CHECK_HEADERS(freexl.h,, [AC_MSG_ERROR([cannot find freexl.h, bailing out])])
+@@ -188,7 +188,7 @@ AC_SUBST(OMIT_FREEXL_FLAGS)
+ #
+ AC_ARG_ENABLE(epsg, [AS_HELP_STRING(
+   [--enable-epsg], [enables full EPSG dataset support [default=yes]])],
+-  [], [epsg=yes])
++  [], [enable_epsg=yes])
+ if test x"$enable_epsg" != "xno"; then
+   OMIT_EPSG_FLAGS=
+ else
+diff --git a/src/shapefiles/shapefiles.c b/src/shapefiles/shapefiles.c
+index 4bf5fd0..09e3cd3 100644
+--- a/src/shapefiles/shapefiles.c
++++ b/src/shapefiles/shapefiles.c
+@@ -62,7 +62,9 @@ the terms of any one of the MPL, the GPL or the LGPL.
+ #include <spatialite/gaiageo.h>
+ #include <spatialite.h>
+ 
++#ifndef OMIT_FREEXL
+ #include <freexl.h>
++#endif
+ 
+ #if defined(_WIN32) && !defined(__MINGW32__)
+ #define strcasecmp	_stricmp
+-- 
+1.7.9.1
+
diff --git a/meta-oe/recipes-navigation/libspatialite/libspatialite_3.0.1.bb b/meta-oe/recipes-navigation/libspatialite/libspatialite_3.0.1.bb
new file mode 100644
index 0000000..1cb72e8
--- /dev/null
+++ b/meta-oe/recipes-navigation/libspatialite/libspatialite_3.0.1.bb
@@ -0,0 +1,9 @@
+require libspatialite.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "450d1a0d9da1bd9f770b7db3f2509f69"
+SRC_URI[sha256sum] = "4983d6584069fd5ff0cfcccccee1015088dab2db177c0dc7050ce8306b68f8e6"
+
+SRC_URI =+ "file://fix-the-configure-script-and-freexl.patch"
+
-- 
1.7.9.1



