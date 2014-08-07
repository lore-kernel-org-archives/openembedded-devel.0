Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0629D65D53
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Aug 2014 13:32:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Aug 2014 06:32:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,818,1400050800"; d="scan'208";a="573116925"
Received: from bidesilv-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.223])
	by fmsmga001.fm.intel.com with ESMTP; 07 Aug 2014 06:32:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Aug 2014 14:31:55 +0100
Message-Id: <1407418315-15620-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <20140806192249.GP14848@jama>
References: <20140806192249.GP14848@jama>
Subject: [meta-oe][PATCH v2] mariadb: update to 5.5.38
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
X-List-Received-Date: Thu, 07 Aug 2014 13:32:19 -0000

* Upstream switched from autotools to cmake
* Separate build dir and parallel make now work
* Library versioning no longer used for plugins; other libtool cruft
  gone
* Proper upstream initscript
* Plugins moved from client library package to mariadb-server package
  (matches how Fedora packages these)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---

Changes since v1:
* Add readline and libaio to DEPENDS
* Disable usage of boost

(Also updated on the branch)

 ...b-native_5.1.67.bb => mariadb-native_5.5.38.bb} |   5 +-
 .../mysql/mariadb/Makefile.am.patch                |  19 -
 .../mariadb/avoid-plugin-options-warnings.patch    |  17 -
 .../mysql/mariadb/configure-ps-cache-check.patch   |  27 --
 .../mysql/mariadb/configure.in.patch               |  13 -
 .../mysql/mariadb/fix-cmake-module-path.patch      |  29 ++
 .../mysql/mariadb/fix-cve-2013-1861-1.patch        | 174 ---------
 .../mysql/mariadb/fix-cve-2013-1861-2.patch        | 257 -------------
 .../mysql/mariadb/fix-link-error-ub1310.patch      |  37 --
 .../mysql/mariadb/fix-mysqlclient-r-version.patch  | 161 ++++++++
 .../mysql/mariadb/fix_host_path.patch              |  37 --
 .../recipes-support/mysql/mariadb/misc.m4.patch    |  13 -
 meta-oe/recipes-support/mysql/mariadb/my.cnf       |   1 +
 meta-oe/recipes-support/mysql/mariadb/mysqld.sh    |  24 --
 .../recipes-support/mysql/mariadb/plug.in.patch    | 405 ---------------------
 .../mysql/mariadb/remove-bad-path.patch            |  18 +
 ...orage-forbids-absolute-addresses-on-IA-32.patch |  44 ---
 .../mariadb/zlib-let-libdir-configurable.patch     |  63 ----
 .../mysql/{mariadb_5.1.67.bb => mariadb_5.5.38.bb} |   4 +-
 .../{mariadb_5.1.67.inc => mariadb_5.5.38.inc}     | 114 +++---
 20 files changed, 275 insertions(+), 1187 deletions(-)
 rename meta-oe/recipes-support/mysql/{mariadb-native_5.1.67.bb => mariadb-native_5.5.38.bb} (71%)
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/Makefile.am.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/avoid-plugin-options-warnings.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/configure-ps-cache-check.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/configure.in.patch
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-cmake-module-path.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-cve-2013-1861-1.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-cve-2013-1861-2.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-link-error-ub1310.patch
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-mysqlclient-r-version.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/fix_host_path.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/misc.m4.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/mysqld.sh
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/plug.in.patch
 create mode 100644 meta-oe/recipes-support/mysql/mariadb/remove-bad-path.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/storage-forbids-absolute-addresses-on-IA-32.patch
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/zlib-let-libdir-configurable.patch
 rename meta-oe/recipes-support/mysql/{mariadb_5.1.67.bb => mariadb_5.5.38.bb} (86%)
 rename meta-oe/recipes-support/mysql/{mariadb_5.1.67.inc => mariadb_5.5.38.inc} (67%)

diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb b/meta-oe/recipes-support/mysql/mariadb-native_5.5.38.bb
similarity index 71%
rename from meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
rename to meta-oe/recipes-support/mysql/mariadb-native_5.5.38.bb
index 942afcc..9148dee 100644
--- a/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
+++ b/meta-oe/recipes-support/mysql/mariadb-native_5.5.38.bb
@@ -7,14 +7,13 @@ DEPENDS = "ncurses-native zlib-native"
 RDEPENDS_${PN} = ""
 PACKAGES = ""
 EXTRA_OEMAKE = ""
-EXTRA_OECONF = " --with-embedded-server "
 
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
-    mv -f ${D}${libdir}/mysql/* ${D}${libdir}
-    rmdir ${D}${libdir}/mysql
 
     install -d ${D}${bindir}
     install -m 0755 sql/gen_lex_hash ${D}${bindir}/
+    install -m 0755 extra/comp_err ${D}${bindir}/
+    install -m 0755 scripts/comp_sql ${D}${bindir}/
 }
 
diff --git a/meta-oe/recipes-support/mysql/mariadb/Makefile.am.patch b/meta-oe/recipes-support/mysql/mariadb/Makefile.am.patch
deleted file mode 100644
index 33fd17a..0000000
--- a/meta-oe/recipes-support/mysql/mariadb/Makefile.am.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Index: mysql-5.1.40/sql/Makefile.am
-===================================================================
---- mysql-5.1.40.orig/sql/Makefile.am
-+++ mysql-5.1.40/sql/Makefile.am
-@@ -174,10 +174,10 @@ link_sources:
- # This generates lex_hash.h
- # NOTE Built sources should depend on their sources not the tool
- # this avoid the rebuild of the built files in a source dist
--lex_hash.h:	gen_lex_hash.cc lex.h
--		$(MAKE) $(AM_MAKEFLAGS) gen_lex_hash$(EXEEXT)
--		./gen_lex_hash$(EXEEXT) > $@-t
--		$(MV) $@-t $@
-+GEN_LEX_HASH = ./gen_lex_hash$(EXEEXT)
-+
-+lex_hash.h:	gen_lex_hash$(EXEEXT)
-+		$(GEN_LEX_HASH) > $@
- 
- # For testing of udf_example.so
- udf_example_la_SOURCES= udf_example.c
diff --git a/meta-oe/recipes-support/mysql/mariadb/avoid-plugin-options-warnings.patch b/meta-oe/recipes-support/mysql/mariadb/avoid-plugin-options-warnings.patch
deleted file mode 100644
index 84ff6f0..0000000
--- a/meta-oe/recipes-support/mysql/mariadb/avoid-plugin-options-warnings.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Tell autoconf about with-plugin option to avoid warnings like:
-configure: WARNING: unrecognized options: --with-plugin-maria
-
-Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
-
-Index: mariadb-5.1.67/config/ac-macros/plugins.m4
-===================================================================
---- mariadb-5.1.67.orig/config/ac-macros/plugins.m4
-+++ mariadb-5.1.67/config/ac-macros/plugins.m4
-@@ -38,6 +38,7 @@ AC_DEFUN([_MYSQL_PLUGIN],[
-   _MYSQL_PLUGAPPEND([__mysql_plugin_list__],[$1])
-   m4_define([MYSQL_PLUGIN_NAME_]AS_TR_CPP([$1]), [$3])
-   m4_define([MYSQL_PLUGIN_DESC_]AS_TR_CPP([$1]), [$4])
-+  m4_ifdef([_AC_ENABLE_IF], [_AC_ENABLE_IF([with],[plugin-$1])])
-   _MYSQL_PLUGAPPEND_META([$1], $5)
-   ifelse(m4_bregexp(__mysql_include__,[/plug\.in$]),-1,[],[
-      MYSQL_PLUGIN_DIRECTORY([$1],
diff --git a/meta-oe/recipes-support/mysql/mariadb/configure-ps-cache-check.patch b/meta-oe/recipes-support/mysql/mariadb/configure-ps-cache-check.patch
deleted file mode 100644
index 3b5b3fd..0000000
--- a/meta-oe/recipes-support/mysql/mariadb/configure-ps-cache-check.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Index: mysql-4.1.22/configure.in
-===================================================================
---- mysql-4.1.22.orig/configure.in	2009-01-28 16:33:28.000000000 +0000
-+++ mysql-4.1.22/configure.in	2009-01-28 16:43:26.000000000 +0000
-@@ -471,8 +471,8 @@
- 
- # Lock for PS
- AC_PATH_PROG(PS, ps, ps)
--AC_MSG_CHECKING("how to check if pid exists")
--PS=$ac_cv_path_PS
-+AC_CACHE_CHECK([how to check if pid exists], [ac_cv_FIND_PROC],
-+[
- # Linux style
- if $PS p $$ 2> /dev/null | grep $0 > /dev/null
- then
-@@ -511,8 +511,9 @@
-       AC_MSG_ERROR([Could not find the right ps switches. Which OS is this ?. See the Installation chapter in the Reference Manual.])
-   esac
- fi
--AC_SUBST(FIND_PROC)
--AC_MSG_RESULT("$FIND_PROC")
-+ac_cv_FIND_PROC="$FIND_PROC"
-+])
-+AC_SUBST([FIND_PROC], [$ac_cv_FIND_PROC])
- 
- # Check if a pid is valid
- AC_PATH_PROG(KILL, kill, kill)
diff --git a/meta-oe/recipes-support/mysql/mariadb/configure.in.patch b/meta-oe/recipes-support/mysql/mariadb/configure.in.patch
deleted file mode 100644
index 6fe2dfa..0000000
--- a/meta-oe/recipes-support/mysql/mariadb/configure.in.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: mysql-5.1.40/configure.in
-===================================================================
---- mysql-5.1.40.orig/configure.in
-+++ mysql-5.1.40/configure.in
-@@ -226,8 +226,6 @@ else
-   AC_PATH_PROG(AS, as, as)
- fi
- 
--# Still need ranlib for readline; local static use only so no libtool.
--AC_PROG_RANLIB
- # We use libtool
- #AC_LIBTOOL_WIN32_DLL
- AC_PROG_LIBTOOL
diff --git a/meta-oe/recipes-support/mysql/mariadb/fix-cmake-module-path.patch b/meta-oe/recipes-support/mysql/mariadb/fix-cmake-module-path.patch
new file mode 100644
index 0000000..8d9f558
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/fix-cmake-module-path.patch
@@ -0,0 +1,29 @@
+Avoid CMAKE_MODULE_PATH being overwritten
+
+OE-Core's setting of CMAKE_MODULE_PATH stomps on MariaDB's value unless
+we set it after setting the project name.
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+Upstream-Status: Inappropriate [working around OE-Core bug]
+
+--- mariadb/CMakeLists.txt	2014-07-17 11:01:07.676353047 +0100
++++ mariadb/CMakeLists.txt	2014-07-17 11:01:31.299353107 +0100
+@@ -28,8 +28,6 @@
+ 
+ MESSAGE(STATUS "Running cmake version ${CMAKE_VERSION}")
+ 
+-SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake)
+-
+ # Distinguish between community and non-community builds, with the
+ # default being a community build. This does not impact the feature
+ # set that will be compiled in; it's merely provided as a hint to
+@@ -77,6 +75,8 @@
+ ENDIF()
+ PROJECT(${MYSQL_PROJECT_NAME})
+ 
++SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake)
++
+ IF(BUILD_CONFIG)
+   INCLUDE(
+   ${CMAKE_SOURCE_DIR}/cmake/build_configurations/${BUILD_CONFIG}.cmake)
diff --git a/meta-oe/recipes-support/mysql/mariadb/fix-cve-2013-1861-1.patch b/meta-oe/recipes-support/mysql/mariadb/fix-cve-2013-1861-1.patch
deleted file mode 100644
index df2e708..0000000
--- a/meta-oe/recipes-support/mysql/mariadb/fix-cve-2013-1861-1.patch
+++ /dev/null
@@ -1,174 +0,0 @@
-From 24404044ad4c28026e400e1fcd85358f2060aa96 Mon Sep 17 00:00:00 2001
-From: Alexey Botchkov <holyfoot@askmonty.org>
-Date: Sun, 10 Mar 2013 23:08:05 +0400
-Subject: [PATCH] MDEV-4252 geometry query crashes server.       The bug was
- found by Alyssa Milburn.       If the number of points of a geometry feature
- read from       binary representation is greater than 0x10000000, then      
- the (uint32) (num_points * 16) will cut the higher byte,       which leads to
- various errors.       Fixed by additional check if (num_points >
- max_n_points).
-
-Upstream-Status: Backport
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
----
- mysql-test/r/gis.result |  3 +++
- mysql-test/t/gis.test   |  1 +
- sql/spatial.cc          | 27 ++++++++++++++++++---------
- sql/spatial.h           |  9 +++++----
- 4 files changed, 27 insertions(+), 13 deletions(-)
-
-diff --git a/mysql-test/r/gis.result b/mysql-test/r/gis.result
-index 8dad72f..69e73d0 100644
---- a/mysql-test/r/gis.result
-+++ b/mysql-test/r/gis.result
-@@ -1087,4 +1087,7 @@ NULL
- #
- SELECT GEOMETRYCOLLECTION((SELECT @@OLD));
- ERROR 22007: Illegal non geometric '' value found during parsing
-+select astext(0x0100000000030000000100000000000010);
-+astext(0x0100000000030000000100000000000010)
-+NULL
- End of 5.1 tests
-diff --git a/mysql-test/t/gis.test b/mysql-test/t/gis.test
-index abda3e9..cc5d158 100644
---- a/mysql-test/t/gis.test
-+++ b/mysql-test/t/gis.test
-@@ -826,5 +826,6 @@ SELECT ISCLOSED(CONVERT(CONCAT('     ', 0x2), BINARY(20)));
- --error ER_ILLEGAL_VALUE_FOR_TYPE
- SELECT GEOMETRYCOLLECTION((SELECT @@OLD));
- 
-+select astext(0x0100000000030000000100000000000010);
- 
- --echo End of 5.1 tests
-diff --git a/sql/spatial.cc b/sql/spatial.cc
-index eec028e..94d0238 100644
---- a/sql/spatial.cc
-+++ b/sql/spatial.cc
-@@ -556,7 +556,7 @@ bool Gis_line_string::get_data_as_wkt(String *txt, const char **end) const
-   n_points= uint4korr(data);
-   data += 4;
- 
--  if (n_points < 1 ||
-+  if (n_points < 1 || n_points > max_n_points ||
-       no_data(data, SIZEOF_STORED_DOUBLE * 2 * n_points) ||
-       txt->reserve(((MAX_DIGITS_IN_DOUBLE + 1)*2 + 1) * n_points))
-     return 1;
-@@ -594,7 +594,8 @@ int Gis_line_string::geom_length(double *len) const
-     return 1;
-   n_points= uint4korr(data);
-   data+= 4;
--  if (n_points < 1 || no_data(data, SIZEOF_STORED_DOUBLE * 2 * n_points))
-+  if (n_points < 1 || n_points > max_n_points ||
-+      no_data(data, SIZEOF_STORED_DOUBLE * 2 * n_points))
-     return 1;
- 
-   get_point(&prev_x, &prev_y, data);
-@@ -628,7 +629,7 @@ int Gis_line_string::is_closed(int *closed) const
-     return 0;
-   }
-   data+= 4;
--  if (n_points == 0 ||
-+  if (n_points == 0 || n_points > max_n_points ||
-       no_data(data, SIZEOF_STORED_DOUBLE * 2 * n_points))
-     return 1;
- 
-@@ -798,7 +799,8 @@ bool Gis_polygon::get_data_as_wkt(String *txt, const char **end) const
-       return 1;
-     n_points= uint4korr(data);
-     data+= 4;
--    if (no_data(data, (SIZEOF_STORED_DOUBLE*2) * n_points) ||
-+    if (n_points > max_n_points ||
-+        no_data(data, (SIZEOF_STORED_DOUBLE*2) * n_points) ||
- 	txt->reserve(2 + ((MAX_DIGITS_IN_DOUBLE + 1) * 2 + 1) * n_points))
-       return 1;
-     txt->qs_append('(');
-@@ -852,7 +854,8 @@ int Gis_polygon::area(double *ar, const char **end_of_data) const
-     if (no_data(data, 4))
-       return 1;
-     n_points= uint4korr(data);
--    if (no_data(data, (SIZEOF_STORED_DOUBLE*2) * n_points))
-+    if (n_points > max_n_points ||
-+        no_data(data, (SIZEOF_STORED_DOUBLE*2) * n_points))
-       return 1;
-     get_point(&prev_x, &prev_y, data+4);
-     data+= (4+SIZEOF_STORED_DOUBLE*2);
-@@ -888,7 +891,8 @@ int Gis_polygon::exterior_ring(String *result) const
-   n_points= uint4korr(data);
-   data+= 4;
-   length= n_points * POINT_DATA_SIZE;
--  if (no_data(data, length) || result->reserve(1+4+4+ length))
-+  if (n_points > max_n_points ||
-+      no_data(data, length) || result->reserve(1+4+4+ length))
-     return 1;
- 
-   result->q_append((char) wkb_ndr);
-@@ -973,7 +977,8 @@ int Gis_polygon::centroid_xy(double *x, double *y) const
-       return 1;
-     org_n_points= n_points= uint4korr(data);
-     data+= 4;
--    if (no_data(data, (SIZEOF_STORED_DOUBLE*2) * n_points))
-+    if (n_points > max_n_points ||
-+        no_data(data, (SIZEOF_STORED_DOUBLE*2) * n_points))
-       return 1;
-     get_point(&prev_x, &prev_y, data);
-     data+= (SIZEOF_STORED_DOUBLE*2);
-@@ -1260,7 +1265,8 @@ bool Gis_multi_line_string::get_data_as_wkt(String *txt,
-       return 1;
-     n_points= uint4korr(data + WKB_HEADER_SIZE);
-     data+= WKB_HEADER_SIZE + 4;
--    if (no_data(data, n_points * (SIZEOF_STORED_DOUBLE*2)) ||
-+    if (n_points > max_n_points ||
-+        no_data(data, n_points * (SIZEOF_STORED_DOUBLE*2)) ||
- 	txt->reserve(2 + ((MAX_DIGITS_IN_DOUBLE + 1) * 2 + 1) * n_points))
-       return 1;
-     txt->qs_append('(');
-@@ -1521,7 +1527,8 @@ bool Gis_multi_polygon::get_data_as_wkt(String *txt, const char **end) const
-         return 1;
-       uint32 n_points= uint4korr(data);
-       data+= 4;
--      if (no_data(data, (SIZEOF_STORED_DOUBLE * 2) * n_points) ||
-+      if (n_points > max_n_points ||
-+          no_data(data, (SIZEOF_STORED_DOUBLE * 2) * n_points) ||
- 	  txt->reserve(2 + ((MAX_DIGITS_IN_DOUBLE + 1) * 2 + 1) * n_points,
- 		       512))
- 	return 1;
-@@ -1604,6 +1611,8 @@ int Gis_multi_polygon::geometry_n(uint32 num, String *result) const
-       if (no_data(data, 4))
- 	return 1;
-       n_points= uint4korr(data);
-+      if (n_points > max_n_points)
-+        return 1;
-       data+= 4 + POINT_DATA_SIZE * n_points;
-     }
-   } while (--num);
-diff --git a/sql/spatial.h b/sql/spatial.h
-index 20b3856..7d25425 100644
---- a/sql/spatial.h
-+++ b/sql/spatial.h
-@@ -197,6 +197,11 @@ struct MBR
- class Geometry
- {
- public:
-+  // Maximum number of points in feature that can fit into String
-+  static const uint32 max_n_points=
-+    (uint32) (UINT_MAX32 - WKB_HEADER_SIZE - 4 /* n_points */) /
-+    POINT_DATA_SIZE;
-+public:
-   Geometry() {}                               /* Remove gcc warning */
-   virtual ~Geometry() {}                        /* Remove gcc warning */
-   static void *operator new(size_t size, void *buffer)
-@@ -379,10 +384,6 @@ class Gis_point: public Geometry
- 
- class Gis_line_string: public Geometry
- {
--  // Maximum number of points in LineString that can fit into String
--  static const uint32 max_n_points=
--    (uint32) (UINT_MAX32 - WKB_HEADER_SIZE - 4 /* n_points */) /
--    POINT_DATA_SIZE;
- public:
-   Gis_line_string() {}                        /* Remove gcc warning */
-   virtual ~Gis_line_string() {}               /* Remove gcc warning */
--- 
-1.8.1.6
-
diff --git a/meta-oe/recipes-support/mysql/mariadb/fix-cve-2013-1861-2.patch b/meta-oe/recipes-support/mysql/mariadb/fix-cve-2013-1861-2.patch
deleted file mode 100644
index c35cdfb..0000000
--- a/meta-oe/recipes-support/mysql/mariadb/fix-cve-2013-1861-2.patch
+++ /dev/null
@@ -1,257 +0,0 @@
-From 9f714cdd3bf4bd8ee06cd38dcd2c6e8990a4ec48 Mon Sep 17 00:00:00 2001
-From: Alexey Botchkov <holyfoot@askmonty.org>
-Date: Mon, 18 Mar 2013 17:58:00 +0400
-Subject: [PATCH] MDEV-4252 geometry query crashes server.     Additional fixes
- for possible overflows in length-related     calculations in 'spatial'
- implementations.     Checks added to the ::get_data_size() methods.    
- max_n_points decreased to occupy less 2G size. An     object of that size is
- practically inoperable anyway.
-
-Upstream-Status: Backport
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
----
- mysql-test/r/gis.result | 12 +++++++++
- mysql-test/t/gis.test   |  6 +++++
- sql/spatial.cc          | 67 ++++++++++++++++++++++++++++++++++---------------
- sql/spatial.h           |  2 +-
- 4 files changed, 66 insertions(+), 21 deletions(-)
-
-diff --git a/mysql-test/r/gis.result b/mysql-test/r/gis.result
-index 69e73d0..7566f0b 100644
---- a/mysql-test/r/gis.result
-+++ b/mysql-test/r/gis.result
-@@ -1087,7 +1087,19 @@ NULL
- #
- SELECT GEOMETRYCOLLECTION((SELECT @@OLD));
- ERROR 22007: Illegal non geometric '' value found during parsing
-+#
-+# MDEV-4252 geometry query crashes server
-+#
- select astext(0x0100000000030000000100000000000010);
- astext(0x0100000000030000000100000000000010)
- NULL
-+select envelope(0x0100000000030000000100000000000010);
-+envelope(0x0100000000030000000100000000000010)
-+NULL
-+select geometryn(0x0100000000070000000100000001030000000200000000000000ffff0000, 1);
-+geometryn(0x0100000000070000000100000001030000000200000000000000ffff0000, 1)
-+NULL
-+select geometryn(0x0100000000070000000100000001030000000200000000000000ffffff0f, 1);
-+geometryn(0x0100000000070000000100000001030000000200000000000000ffffff0f, 1)
-+NULL
- End of 5.1 tests
-diff --git a/mysql-test/t/gis.test b/mysql-test/t/gis.test
-index cc5d158..c42541e 100644
---- a/mysql-test/t/gis.test
-+++ b/mysql-test/t/gis.test
-@@ -826,6 +826,12 @@ SELECT ISCLOSED(CONVERT(CONCAT('     ', 0x2), BINARY(20)));
- --error ER_ILLEGAL_VALUE_FOR_TYPE
- SELECT GEOMETRYCOLLECTION((SELECT @@OLD));
- 
-+--echo #
-+--echo # MDEV-4252 geometry query crashes server
-+--echo #
- select astext(0x0100000000030000000100000000000010);
-+select envelope(0x0100000000030000000100000000000010);
-+select geometryn(0x0100000000070000000100000001030000000200000000000000ffff0000, 1);
-+select geometryn(0x0100000000070000000100000001030000000200000000000000ffffff0f, 1);
- 
- --echo End of 5.1 tests
-diff --git a/sql/spatial.cc b/sql/spatial.cc
-index 94d0238..5a4b768 100644
---- a/sql/spatial.cc
-+++ b/sql/spatial.cc
-@@ -394,18 +394,19 @@ const char *Geometry::append_points(String *txt, uint32 n_points,
- const char *Geometry::get_mbr_for_points(MBR *mbr, const char *data,
- 					 uint offset) const
- {
--  uint32 points;
-+  uint32 n_points;
-   /* read number of points */
-   if (no_data(data, 4))
-     return 0;
--  points= uint4korr(data);
-+  n_points= uint4korr(data);
-   data+= 4;
- 
--  if (no_data(data, (SIZEOF_STORED_DOUBLE * 2 + offset) * points))
-+  if (n_points > max_n_points ||
-+      no_data(data, (POINT_DATA_SIZE + offset) * n_points))
-     return 0;
- 
-   /* Calculate MBR for points */
--  while (points--)
-+  while (n_points--)
-   {
-     data+= offset;
-     mbr->add_xy(data, data + SIZEOF_STORED_DOUBLE);
-@@ -484,9 +485,12 @@ const Geometry::Class_info *Gis_point::get_class_info() const
- 
- uint32 Gis_line_string::get_data_size() const 
- {
--  if (no_data(m_data, 4))
-+  uint32 n_points, size;
-+  if (no_data(m_data, 4) ||
-+      (n_points= uint4korr(m_data)) > max_n_points ||
-+      no_data(m_data, (size= 4 + n_points * POINT_DATA_SIZE)))
-     return GET_SIZE_ERROR;
--  return 4 + uint4korr(m_data) * POINT_DATA_SIZE;
-+  return size;
- }
- 
- 
-@@ -665,6 +669,9 @@ int Gis_line_string::end_point(String *result) const
-   if (no_data(m_data, 4))
-     return 1;
-   n_points= uint4korr(m_data);
-+  if (n_points == 0 || n_points > max_n_points ||
-+      no_data(m_data, POINT_DATA_SIZE * n_points))
-+    return 1;
-   return create_point(result, m_data + 4 + (n_points - 1) * POINT_DATA_SIZE);
- }
- 
-@@ -674,11 +681,14 @@ int Gis_line_string::point_n(uint32 num, String *result) const
-   uint32 n_points;
-   if (no_data(m_data, 4))
-     return 1;
-+  num--;
-   n_points= uint4korr(m_data);
--  if ((uint32) (num - 1) >= n_points) // means (num > n_points || num < 1)
-+  if (num >= n_points ||
-+      num > max_n_points || // means (num > n_points || num < 1)
-+      no_data(m_data, num * POINT_DATA_SIZE))
-     return 1;
- 
--  return create_point(result, m_data + 4 + (num - 1) * POINT_DATA_SIZE);
-+  return create_point(result, m_data + 4 + num*POINT_DATA_SIZE);
- }
- 
- const Geometry::Class_info *Gis_line_string::get_class_info() const
-@@ -692,6 +702,7 @@ const Geometry::Class_info *Gis_line_string::get_class_info() const
- uint32 Gis_polygon::get_data_size() const 
- {
-   uint32 n_linear_rings;
-+  uint32 n_points;
-   const char *data= m_data;
- 
-   if (no_data(data, 4))
-@@ -701,10 +712,13 @@ uint32 Gis_polygon::get_data_size() const
- 
-   while (n_linear_rings--)
-   {
--    if (no_data(data, 4))
-+    if (no_data(data, 4) ||
-+        (n_points= uint4korr(data)) > max_n_points)
-       return GET_SIZE_ERROR;
--    data+= 4 + uint4korr(data)*POINT_DATA_SIZE;
-+    data+= 4 + n_points*POINT_DATA_SIZE;
-   }
-+  if (no_data(data, 0))
-+    return GET_SIZE_ERROR;
-   return (uint32) (data - m_data);
- }
- 
-@@ -1037,9 +1051,14 @@ const Geometry::Class_info *Gis_polygon::get_class_info() const
- 
- uint32 Gis_multi_point::get_data_size() const 
- {
--  if (no_data(m_data, 4))
--    return GET_SIZE_ERROR;
--  return 4 + uint4korr(m_data)*(POINT_DATA_SIZE + WKB_HEADER_SIZE);
-+  uint32 n_points;
-+  uint32 size;
-+
-+  if (no_data(m_data, 4) ||
-+      (n_points= uint4korr(m_data)) > max_n_points ||
-+      no_data(m_data, (size= 4 + n_points*(POINT_DATA_SIZE + WKB_HEADER_SIZE))))
-+     return GET_SIZE_ERROR;
-+  return size;
- }
- 
- 
-@@ -1107,7 +1126,8 @@ bool Gis_multi_point::get_data_as_wkt(String *txt, const char **end) const
-     return 1;
- 
-   n_points= uint4korr(m_data);
--  if (no_data(m_data+4,
-+  if (n_points > max_n_points ||
-+      no_data(m_data+4,
- 	      n_points * (SIZEOF_STORED_DOUBLE * 2 + WKB_HEADER_SIZE)) ||
-       txt->reserve(((MAX_DIGITS_IN_DOUBLE + 1) * 2 + 1) * n_points))
-     return 1;
-@@ -1160,6 +1180,7 @@ const Geometry::Class_info *Gis_multi_point::get_class_info() const
- uint32 Gis_multi_line_string::get_data_size() const 
- {
-   uint32 n_line_strings;
-+  uint32 n_points;
-   const char *data= m_data;
- 
-   if (no_data(data, 4))
-@@ -1169,11 +1190,13 @@ uint32 Gis_multi_line_string::get_data_size() const
- 
-   while (n_line_strings--)
-   {
--    if (no_data(data, WKB_HEADER_SIZE + 4))
-+    if (no_data(data, WKB_HEADER_SIZE + 4) ||
-+        (n_points= uint4korr(data + WKB_HEADER_SIZE)) > max_n_points)
-       return GET_SIZE_ERROR;
--    data+= (WKB_HEADER_SIZE + 4 + uint4korr(data + WKB_HEADER_SIZE) *
--	    POINT_DATA_SIZE);
-+    data+= (WKB_HEADER_SIZE + 4 + n_points*POINT_DATA_SIZE);
-   }
-+  if (no_data(data, 0))
-+    return GET_SIZE_ERROR;
-   return (uint32) (data - m_data);
- }
- 
-@@ -1327,7 +1350,7 @@ int Gis_multi_line_string::geometry_n(uint32 num, String *result) const
-       return 1;
-     n_points= uint4korr(data + WKB_HEADER_SIZE);
-     length= WKB_HEADER_SIZE + 4+ POINT_DATA_SIZE * n_points;
--    if (no_data(data, length))
-+    if (n_points > max_n_points || no_data(data, length))
-       return 1;
-     if (!--num)
-       break;
-@@ -1407,6 +1430,7 @@ const Geometry::Class_info *Gis_multi_line_string::get_class_info() const
- uint32 Gis_multi_polygon::get_data_size() const 
- {
-   uint32 n_polygons;
-+  uint32 n_points;
-   const char *data= m_data;
- 
-   if (no_data(data, 4))
-@@ -1425,11 +1449,14 @@ uint32 Gis_multi_polygon::get_data_size() const
- 
-     while (n_linear_rings--)
-     {
--      if (no_data(data, 4))
-+      if (no_data(data, 4) ||
-+          (n_points= uint4korr(data)) > max_n_points)
- 	return GET_SIZE_ERROR;
--      data+= 4 + uint4korr(data) * POINT_DATA_SIZE;
-+      data+= 4 + n_points * POINT_DATA_SIZE;
-     }
-   }
-+  if (no_data(data, 0))
-+    return GET_SIZE_ERROR;
-   return (uint32) (data - m_data);
- }
- 
-diff --git a/sql/spatial.h b/sql/spatial.h
-index 7d25425..d7632c1 100644
---- a/sql/spatial.h
-+++ b/sql/spatial.h
-@@ -199,7 +199,7 @@ class Geometry
- public:
-   // Maximum number of points in feature that can fit into String
-   static const uint32 max_n_points=
--    (uint32) (UINT_MAX32 - WKB_HEADER_SIZE - 4 /* n_points */) /
-+    (uint32) (INT_MAX32 - WKB_HEADER_SIZE - 4 /* n_points */) /
-     POINT_DATA_SIZE;
- public:
-   Geometry() {}                               /* Remove gcc warning */
--- 
-1.8.1.6
-
diff --git a/meta-oe/recipes-support/mysql/mariadb/fix-link-error-ub1310.patch b/meta-oe/recipes-support/mysql/mariadb/fix-link-error-ub1310.patch
deleted file mode 100644
index a528ea7..0000000
--- a/meta-oe/recipes-support/mysql/mariadb/fix-link-error-ub1310.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-mariadb-native: fix link error on Ubuntu 13.10
-
-Below errors only occurs on Ubuntu 13.10:
-
-$arch-linux-libtool: link: g++ ... -o .libs/mysqltest_embedded \
-    ../../libmysqld/.libs/libmysqld.so -ldl
-
-    ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlopen'
-    ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlclose'
-    ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlerror'
-    ../../libmysqld/.libs/libmysqld.so: undefined reference to `dlsym'
-
-GCC/ld verion on the host:
-    gcc (Ubuntu/Linaro 4.8.1-10ubuntu8) 4.8.1
-    GNU ld (GNU Binutils for Ubuntu) 2.23.52.20130913
-
-This is a strange behavior on Ub13.10, it fails even '-ldl' in the
-link command line. Below fix will append '-ldl' to dependency_libs
-in libmysqld.la.
-
-Upstream-Status: Submitted [https://mariadb.atlassian.net/browse/MDEV-5362]
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-================================================
-diff --git a/libmysqld/Makefile.am b/libmysqld/Makefile.am
-index 7a2c92e..eee501e 100644
---- a/libmysqld/Makefile.am
-+++ b/libmysqld/Makefile.am
-@@ -92,7 +92,7 @@ INC_LIB=	$(top_builddir)/regex/libregex.la \
-                 @ndbcluster_libs@ @NDB_SCI_LIBS@ \
- 		@mysql_embedded_plugin_libs@ \
- 		$(libevent_inc_libs) \
--		$(yassl_inc_libs)
-+		$(yassl_inc_libs) @LIBDL@
- 
- if HAVE_YASSL
- yassl_inc_libs=	$(top_builddir)/extra/yassl/src/libyassl.la \
diff --git a/meta-oe/recipes-support/mysql/mariadb/fix-mysqlclient-r-version.patch b/meta-oe/recipes-support/mysql/mariadb/fix-mysqlclient-r-version.patch
new file mode 100644
index 0000000..7516619
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/fix-mysqlclient-r-version.patch
@@ -0,0 +1,161 @@
+From 6db2a606196fb38a6d106dc409eee1cb9a40a440 Mon Sep 17 00:00:00 2001
+From: Tor Didriksen <tor.didriksen@oracle.com>
+Date: Mon, 24 Jun 2013 17:15:35 +0200
+Subject: [PATCH] Bug#16809055 MYSQL 5.6 AND 5.7 STILL USE LIBMYSQLCLIENT.SO.18
+
+With this patch, the libmysql/ directory contains:
+libmysqlclient.a
+libmysqlclient_r.a -> libmysqlclient.a
+libmysqlclient_r.so -> libmysqlclient.so*
+libmysqlclient_r.so.18 -> libmysqlclient.so.18*
+libmysqlclient_r.so.18.1.0 -> libmysqlclient.so.18.1.0*
+libmysqlclient.so -> libmysqlclient.so.18*
+libmysqlclient.so.18 -> libmysqlclient.so.18.1.0*
+libmysqlclient.so.18.1.0*
+
+This fixes libmysqlclient_r symlinks pointing to the unversioned
+libmysqlclient.so symlink (leading to package QA errors since the
+libmysqlclient-r package ends up depending on libmysqlclient-dev).
+
+Borrowed from MySQL 5.6 tree at https://github.com/percona/mysql/
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+---
+ cmake/install_macros.cmake | 25 +++++++++++++++----------
+ cmake/mysql_version.cmake  |  3 ++-
+ libmysql/CMakeLists.txt    | 36 ++++++++++++++++++++++++++++--------
+ 3 files changed, 45 insertions(+), 19 deletions(-)
+
+diff --git a/cmake/install_macros.cmake b/cmake/install_macros.cmake
+index b8efdf8..a0d0e68 100644
+--- a/cmake/install_macros.cmake
++++ b/cmake/install_macros.cmake
+@@ -1,4 +1,4 @@
+-# Copyright (c) 2009, 2011, Oracle and/or its affiliates. All rights reserved.
++# Copyright (c) 2009, 2013, Oracle and/or its affiliates. All rights reserved.
+ # 
+ # This program is free software; you can redistribute it and/or modify
+ # it under the terms of the GNU General Public License as published by
+@@ -111,28 +111,33 @@ FUNCTION(INSTALL_SCRIPT)
+ ENDFUNCTION()
+ 
+ # Install symbolic link to CMake target. 
+-# the link is created in the same directory as target
+-# and extension will be the same as for target file.
+-MACRO(INSTALL_SYMLINK linkname target destination component)
++# We do 'cd path; ln -s target_name link_name'
++# We also add an INSTALL target for "${path}/${link_name}"
++MACRO(INSTALL_SYMLINK target target_name link_name destination component)
+ IF(UNIX)
+   GET_TARGET_PROPERTY(location ${target} LOCATION)
+   GET_FILENAME_COMPONENT(path ${location} PATH)
+-  GET_FILENAME_COMPONENT(name ${location} NAME)
+-  SET(output ${path}/${linkname})
++  MESSAGE(STATUS "target ${target}")
++  MESSAGE(STATUS "link_name ${link_name}")
++  MESSAGE(STATUS "target_name ${target_name}")
++  MESSAGE(STATUS "path ${path}")
++  MESSAGE(STATUS "")
++
++  SET(output ${path}/${link_name})
+   ADD_CUSTOM_COMMAND(
+     OUTPUT ${output}
+     COMMAND ${CMAKE_COMMAND} ARGS -E remove -f ${output}
+     COMMAND ${CMAKE_COMMAND} ARGS -E create_symlink 
+-      ${name} 
+-      ${linkname}
++      ${target_name} 
++      ${link_name}
+     WORKING_DIRECTORY ${path}
+     DEPENDS ${target}
+     )
+   
+-  ADD_CUSTOM_TARGET(symlink_${linkname}
++  ADD_CUSTOM_TARGET(symlink_${link_name}
+     ALL
+     DEPENDS ${output})
+-  SET_TARGET_PROPERTIES(symlink_${linkname} PROPERTIES CLEAN_DIRECT_OUTPUT 1)
++  SET_TARGET_PROPERTIES(symlink_${link_name} PROPERTIES CLEAN_DIRECT_OUTPUT 1)
+   IF(CMAKE_GENERATOR MATCHES "Xcode")
+     # For Xcode, replace project config with install config
+     STRING(REPLACE "${CMAKE_CFG_INTDIR}" 
+diff --git a/libmysql/CMakeLists.txt b/libmysql/CMakeLists.txt
+index be5760f..96286ff 100644
+--- a/libmysql/CMakeLists.txt
++++ b/libmysql/CMakeLists.txt
+@@ -180,6 +180,12 @@ IF(MSVC)
+  INSTALL_DEBUG_TARGET(mysqlclient DESTINATION ${INSTALL_LIBDIR}/debug)
+ ENDIF()
+ 
++MACRO(GET_TARGET_NAME target out_name)
++  GET_TARGET_PROPERTY(location ${target} LOCATION)
++  GET_FILENAME_COMPONENT(name ${location} NAME)
++  SET(${out_name} ${name})
++ENDMACRO()
++
+ IF(UNIX)
+   MACRO(GET_VERSIONED_LIBNAME LIBNAME EXTENSION VERSION OUTNAME)
+     SET(DOT_VERSION ".${VERSION}")
+@@ -192,7 +198,13 @@ IF(UNIX)
+       SET(${OUTNAME} ${LIBNAME}${EXTENSION}${DOT_VERSION})
+     ENDIF() 
+   ENDMACRO()
+-  INSTALL_SYMLINK(${CMAKE_STATIC_LIBRARY_PREFIX}mysqlclient_r.a mysqlclient ${INSTALL_LIBDIR} Development)
++ENDIF()
++
++IF(UNIX)
++  GET_TARGET_NAME(mysqlclient lib_name)
++  INSTALL_SYMLINK(mysqlclient
++    ${lib_name} ${CMAKE_STATIC_LIBRARY_PREFIX}mysqlclient_r.a
++    ${INSTALL_LIBDIR} Development)
+ ENDIF()
+ 
+ IF(NOT DISABLE_SHARED)
+@@ -205,10 +217,9 @@ IF(NOT DISABLE_SHARED)
+     # libtool compatability
+     IF(CMAKE_SYSTEM_NAME MATCHES "FreeBSD" OR APPLE)
+       SET(OS_SHARED_LIB_VERSION "${SHARED_LIB_MAJOR_VERSION}")
+-    ELSEIF(CMAKE_SYSTEM_NAME MATCHES "HP-UX")
+-      SET(OS_SHARED_LIB_VERSION "${SHARED_LIB_MAJOR_VERSION}.0")
+     ELSE()
+-      SET(OS_SHARED_LIB_VERSION "${SHARED_LIB_MAJOR_VERSION}.0.0")
++      SET(OS_SHARED_LIB_VERSION
++        "${SHARED_LIB_MAJOR_VERSION}.${SHARED_LIB_MINOR_VERSION}.0")
+     ENDIF()
+     # Name of shared library is mysqlclient on Unix
+     SET_TARGET_PROPERTIES(libmysql PROPERTIES 
+@@ -239,8 +250,13 @@ IF(NOT DISABLE_SHARED)
+       "${CMAKE_SHARED_LIBRARY_SUFFIX}"
+       ""
+       linkname)
+-    INSTALL_SYMLINK(${linkname} libmysql ${INSTALL_LIBDIR} SharedLibraries)
+-    SET(OS_SHARED_LIB_SYMLINKS "${SHARED_LIB_MAJOR_VERSION}" "${OS_SHARED_LIB_VERSION}")
++    GET_TARGET_NAME(libmysql lib_name)
++    GET_FILENAME_COMPONENT(lib_name_we ${lib_name} NAME_WE)
++    INSTALL_SYMLINK(libmysql
++      ${lib_name} ${linkname}
++      ${INSTALL_LIBDIR} SharedLibraries)
++    SET(OS_SHARED_LIB_SYMLINKS
++      "${SHARED_LIB_MAJOR_VERSION}" "${OS_SHARED_LIB_VERSION}")
+     LIST(REMOVE_DUPLICATES OS_SHARED_LIB_SYMLINKS)
+     FOREACH(ver ${OS_SHARED_LIB_SYMLINKS})
+       GET_VERSIONED_LIBNAME(
+@@ -248,7 +264,11 @@ IF(NOT DISABLE_SHARED)
+         "${CMAKE_SHARED_LIBRARY_SUFFIX}"
+         "${ver}"
+         linkname)
+-      INSTALL_SYMLINK(${linkname} libmysql ${INSTALL_LIBDIR} SharedLibraries)
++      GET_VERSIONED_LIBNAME(
++        ${lib_name_we} "${CMAKE_SHARED_LIBRARY_SUFFIX}" "${ver}" lib_name_ver)
++      INSTALL_SYMLINK(libmysql
++        ${lib_name_ver} ${linkname}
++        ${INSTALL_LIBDIR} SharedLibraries)
+     ENDFOREACH()
+   ENDIF()
+ ENDIF()
+-- 
+2.0.3
+
diff --git a/meta-oe/recipes-support/mysql/mariadb/fix_host_path.patch b/meta-oe/recipes-support/mysql/mariadb/fix_host_path.patch
deleted file mode 100644
index 4f69cd5..0000000
--- a/meta-oe/recipes-support/mysql/mariadb/fix_host_path.patch
+++ /dev/null
@@ -1,37 +0,0 @@
---- mysql-4.1.22/configure.in.old	2008-09-18 20:11:15.000000000 -0500
-+++ mysql-4.1.22/configure.in	2008-09-18 20:12:28.000000000 -0500
-@@ -456,9 +456,9 @@ else
-   fi
- fi
- 
--AC_SUBST(HOSTNAME)
--AC_SUBST(PERL)
--AC_SUBST(PERL5)
-+AC_SUBST(HOSTNAME,/bin/hostname)
-+AC_SUBST(PERL,$(bindir)/perl)
-+AC_SUBST(PERL5,$(bindir)/perl)
- 
- # for build ndb docs
- 
-@@ -516,16 +516,17 @@ AC_MSG_RESULT("$FIND_PROC")
- 
- # Check if a pid is valid
- AC_PATH_PROG(KILL, kill, kill)
-+AC_SUBST(KILL,/bin/kill)
- AC_MSG_CHECKING("for kill switches")
--if $ac_cv_path_KILL -0 $$
-+if $KILL -0 $$
- then
--  CHECK_PID="$ac_cv_path_KILL -0 \$\$PID > /dev/null 2> /dev/null"
-+  CHECK_PID="$KILL -0 \$\$PID > /dev/null 2> /dev/null"
- elif kill -s 0 $$
- then
--  CHECK_PID="$ac_cv_path_KILL -s 0 \$\$PID > /dev/null 2> /dev/null"
-+  CHECK_PID="$KILL -s 0 \$\$PID > /dev/null 2> /dev/null"
- else
-   AC_MSG_WARN([kill -0 to check for pid seems to fail])
--    CHECK_PID="$ac_cv_path_KILL -s SIGCONT \$\$PID > /dev/null 2> /dev/null"
-+    CHECK_PID="$KILL -s SIGCONT \$\$PID > /dev/null 2> /dev/null"
- fi
- AC_SUBST(CHECK_PID)
- AC_MSG_RESULT("$CHECK_PID")
diff --git a/meta-oe/recipes-support/mysql/mariadb/misc.m4.patch b/meta-oe/recipes-support/mysql/mariadb/misc.m4.patch
deleted file mode 100644
index 7b0acff..0000000
--- a/meta-oe/recipes-support/mysql/mariadb/misc.m4.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: mysql-5.1.40/config/ac-macros/misc.m4
-===================================================================
---- mysql-5.1.40.orig/config/ac-macros/misc.m4
-+++ mysql-5.1.40/config/ac-macros/misc.m4
-@@ -476,7 +476,7 @@ AC_DEFUN([MYSQL_STACK_DIRECTION],
-  {
-    exit (find_stack_direction() < 0);
-  }], ac_cv_c_stack_direction=1, ac_cv_c_stack_direction=-1,
--   ac_cv_c_stack_direction=)])
-+   ac_cv_c_stack_direction=0)])
-  AC_DEFINE_UNQUOTED(STACK_DIRECTION, $ac_cv_c_stack_direction)
- ])dnl
- 
diff --git a/meta-oe/recipes-support/mysql/mariadb/my.cnf b/meta-oe/recipes-support/mysql/mariadb/my.cnf
index d174381..f2c9b90 100644
--- a/meta-oe/recipes-support/mysql/mariadb/my.cnf
+++ b/meta-oe/recipes-support/mysql/mariadb/my.cnf
@@ -17,5 +17,6 @@ datadir 					= /var/mysql
 skip-external-locking
 skip-networking
 ignore-builtin-innodb
+default-storage-engine				= myisam
 bind-address					= localhost
 
diff --git a/meta-oe/recipes-support/mysql/mariadb/mysqld.sh b/meta-oe/recipes-support/mysql/mariadb/mysqld.sh
deleted file mode 100644
index 479ebdb..0000000
--- a/meta-oe/recipes-support/mysql/mariadb/mysqld.sh
+++ /dev/null
@@ -1,24 +0,0 @@
-# MySQL init script
-
-. /etc/default/rcS
-
-case "$1" in
-	start)
-		/usr/bin/mysqld_safe &
-		;;
-	stop)
-		if test -f /var/lib/mysql/mysqld.pid ; then
-			PID=`cat /var/lib/mysql/mysqld.pid`
-			kill $PID
-		fi
-		;;
-	restart)
-		$0 stop
-		$0 start
-		;;
-	*)
-		echo "Usage: /etc/init.d/mysqld {start|stop|restart}"
-		;;
-esac
-
-exit 0
diff --git a/meta-oe/recipes-support/mysql/mariadb/plug.in.patch b/meta-oe/recipes-support/mysql/mariadb/plug.in.patch
deleted file mode 100644
index 156fd10..0000000
--- a/meta-oe/recipes-support/mysql/mariadb/plug.in.patch
+++ /dev/null
@@ -1,405 +0,0 @@
-diff --git a/storage/innodb_plugin/plug.in b/storage/innodb_plugin/plug.in
-index 7650251..3cc22c5 100644
---- a/storage/innodb_plugin/plug.in
-+++ b/storage/innodb_plugin/plug.in
-@@ -56,180 +56,10 @@ MYSQL_PLUGIN_ACTIONS(innodb_plugin,  [
-   esac
-   AC_SUBST(INNODB_DYNAMIC_CFLAGS)
- 
--  AC_MSG_CHECKING(whether GCC atomic builtins are available)
--  # either define HAVE_IB_GCC_ATOMIC_BUILTINS or not
--  AC_TRY_RUN(
--    [
--      int main()
--      {
--	long	x;
--	long	y;
--	long	res;
--	char	c;
--
--	x = 10;
--	y = 123;
--	res = __sync_bool_compare_and_swap(&x, x, y);
--	if (!res || x != y) {
--          return(1);
--        }
--
--	x = 10;
--	y = 123;
--	res = __sync_bool_compare_and_swap(&x, x + 1, y);
--	if (res || x != 10) {
--          return(1);
--        }
--
--	x = 10;
--	y = 123;
--	res = __sync_add_and_fetch(&x, y);
--	if (res != 123 + 10 || x != 123 + 10) {
--	  return(1);
--	}
--
--	c = 10;
--	res = __sync_lock_test_and_set(&c, 123);
--	if (res != 10 || c != 123) {
--	  return(1);
--	}
--
--	return(0);
--      }
--    ],
--    [
--      AC_DEFINE([HAVE_IB_GCC_ATOMIC_BUILTINS], [1],
--                [GCC atomic builtins are available])
--      AC_MSG_RESULT(yes)
--    ],
--    [
--      AC_MSG_RESULT(no)
--    ]
--  )
--
--  AC_MSG_CHECKING(whether pthread_t can be used by GCC atomic builtins)
--  # either define HAVE_IB_ATOMIC_PTHREAD_T_GCC or not
--  AC_TRY_RUN(
--    [
--      #include <pthread.h>
--      #include <string.h>
--
--      int main(int argc, char** argv) {
--        pthread_t       x1;
--        pthread_t       x2;
--        pthread_t       x3;
--
--	memset(&x1, 0x0, sizeof(x1));
--	memset(&x2, 0x0, sizeof(x2));
--	memset(&x3, 0x0, sizeof(x3));
--
--        __sync_bool_compare_and_swap(&x1, x2, x3);
--
--        return(0);
--      }
--    ],
--    [
--      AC_DEFINE([HAVE_IB_ATOMIC_PTHREAD_T_GCC], [1],
--                [pthread_t can be used by GCC atomic builtins])
--      AC_MSG_RESULT(yes)
--    ],
--    [
--      AC_MSG_RESULT(no)
--    ]
--  )
--
--  AC_MSG_CHECKING(whether Solaris libc atomic functions are available)
--  # Define HAVE_IB_SOLARIS_ATOMICS if _all_ of the following
--  # functions are present.
--  AC_CHECK_FUNCS(atomic_add_long_nv \
--		 atomic_cas_32 \
--		 atomic_cas_64 \
--		 atomic_cas_ulong \
--		 atomic_swap_uchar)
--
--  if test "${ac_cv_func_atomic_add_long_nv}" = "yes" -a \
--          "${ac_cv_func_atomic_cas_32}" = "yes" -a \
--          "${ac_cv_func_atomic_cas_64}" = "yes" -a \
--          "${ac_cv_func_atomic_cas_ulong}" = "yes" -a \
--          "${ac_cv_func_atomic_swap_uchar}" = "yes" ; then
--
--    AC_DEFINE([HAVE_IB_SOLARIS_ATOMICS], [1],
--      [Define to 1 if Solaris libc atomic functions are available]
--    )
--  fi
--
--  AC_MSG_CHECKING(whether pthread_t can be used by Solaris libc atomic functions)
--  # either define HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS or not
--  AC_TRY_RUN(
--    [
--      #include <pthread.h>
--      #include <string.h>
--
--      int main(int argc, char** argv) {
--        pthread_t       x1;
--        pthread_t       x2;
--        pthread_t       x3;
--
--        memset(&x1, 0x0, sizeof(x1));
--        memset(&x2, 0x0, sizeof(x2));
--        memset(&x3, 0x0, sizeof(x3));
--
--        if (sizeof(pthread_t) == 4) {
--        
--          atomic_cas_32(&x1, x2, x3);
--        
--        } else if (sizeof(pthread_t) == 8) {
--        
--          atomic_cas_64(&x1, x2, x3);
--        
--        } else {
--        
--          return(1);
--        }
--
--	return(0);
--      }
--    ],
--    [
--      AC_DEFINE([HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS], [1],
--                [pthread_t can be used by solaris atomics])
--      AC_MSG_RESULT(yes)
--    ],
--    [
--      AC_MSG_RESULT(no)
--    ]
--  )
--
-   # this is needed to know which one of atomic_cas_32() or atomic_cas_64()
-   # to use in the source
-   AC_CHECK_SIZEOF([pthread_t], [], [#include <pthread.h>])
- 
--  # Check for x86 PAUSE instruction
--  AC_MSG_CHECKING(for x86 PAUSE instruction)
--  # We have to actually try running the test program, because of a bug
--  # in Solaris on x86_64, where it wrongly reports that PAUSE is not
--  # supported when trying to run an application. See
--  # http://bugs.opensolaris.org/bugdatabase/printableBug.do?bug_id=6478684
--  # We use ib_ prefix to avoid collisoins if this code is added to
--  # mysql's configure.in.
--  AC_TRY_RUN(
--    [
--      int main() {
--        __asm__ __volatile__ ("pause");
--        return(0);
--      }
--    ],
--    [
--      AC_DEFINE([HAVE_IB_PAUSE_INSTRUCTION], [1], [Does x86 PAUSE instruction exist])
--      AC_MSG_RESULT(yes)
--    ],
--    [
--      AC_MSG_RESULT(no)
--    ],
--    [
--      AC_MSG_RESULT(no)
--    ]
--  )
-   ])
- 
- # vim: set ft=config:
-diff --git a/storage/xtradb/plug.in b/storage/xtradb/plug.in
-index 3fadacc..a33f4dc 100644
---- a/storage/xtradb/plug.in
-+++ b/storage/xtradb/plug.in
-@@ -56,215 +56,10 @@ MYSQL_PLUGIN_ACTIONS(xtradb,  [
-   esac
-   AC_SUBST(INNODB_DYNAMIC_CFLAGS)
- 
--  AC_MSG_CHECKING(whether GCC atomic builtins are available)
--  # either define HAVE_IB_GCC_ATOMIC_BUILTINS or not
--  AC_TRY_RUN(
--    [
--      int main()
--      {
--	long	x;
--	long	y;
--	long	res;
--	char	c;
--
--	x = 10;
--	y = 123;
--	res = __sync_bool_compare_and_swap(&x, x, y);
--	if (!res || x != y) {
--          return(1);
--        }
--
--	x = 10;
--	y = 123;
--	res = __sync_bool_compare_and_swap(&x, x + 1, y);
--	if (res || x != 10) {
--          return(1);
--        }
--
--	x = 10;
--	y = 123;
--	res = __sync_add_and_fetch(&x, y);
--	if (res != 123 + 10 || x != 123 + 10) {
--	  return(1);
--	}
--
--	c = 10;
--	res = __sync_lock_test_and_set(&c, 123);
--	if (res != 10 || c != 123) {
--	  return(1);
--	}
--	return(0);
--      }
--    ],
--    [
--      AC_DEFINE([HAVE_IB_GCC_ATOMIC_BUILTINS], [1],
--                [GCC atomic builtins are available])
--      AC_MSG_RESULT(yes)
--    ],
--    [
--      AC_MSG_RESULT(no)
--    ]
--  )
--
--  AC_MSG_CHECKING(whether GCC 64-bit atomic builtins are available)
--  # either define HAVE_IB_GCC_ATOMIC_BUILTINS_64 or not
--  AC_TRY_RUN(
--    [
--      #include <stdint.h>
--      int main()
--      {
--        int64_t x, y, res;
--
--	x = 10;
--	y = 123;
--	res = __sync_bool_compare_and_swap(&x, x, y);
--	if (!res || x != y) {
--	  return(1);
--	}
--
--	x = 10;
--	y = 123;
--	res = __sync_add_and_fetch(&x, y);
--	if (res != 123 + 10 || x != 123 + 10) {
--	  return(1);
--	}
--
--	return(0);
--      }
--    ],
--    [
--      AC_DEFINE([HAVE_IB_GCC_ATOMIC_BUILTINS_64], [1],
--                [GCC 64-bit atomic builtins are available])
--      AC_MSG_RESULT(yes)
--    ],
--    [
--      AC_MSG_RESULT(no)
--    ]
--  )
--
--  AC_MSG_CHECKING(whether pthread_t can be used by GCC atomic builtins)
--  # either define HAVE_IB_ATOMIC_PTHREAD_T_GCC or not
--  AC_TRY_RUN(
--    [
--      #include <pthread.h>
--      #include <string.h>
--
--      int main(int argc, char** argv) {
--        pthread_t       x1;
--        pthread_t       x2;
--        pthread_t       x3;
--
--	memset(&x1, 0x0, sizeof(x1));
--	memset(&x2, 0x0, sizeof(x2));
--	memset(&x3, 0x0, sizeof(x3));
--
--        __sync_bool_compare_and_swap(&x1, x2, x3);
--
--        return(0);
--      }
--    ],
--    [
--      AC_DEFINE([HAVE_IB_ATOMIC_PTHREAD_T_GCC], [1],
--                [pthread_t can be used by GCC atomic builtins])
--      AC_MSG_RESULT(yes)
--    ],
--    [
--      AC_MSG_RESULT(no)
--    ]
--  )
--
--  AC_MSG_CHECKING(whether Solaris libc atomic functions are available)
--  # Define HAVE_IB_SOLARIS_ATOMICS if _all_ of the following
--  # functions are present.
--  AC_CHECK_FUNCS(atomic_add_long_nv \
--		 atomic_cas_32 \
--		 atomic_cas_64 \
--		 atomic_cas_ulong \
--		 atomic_swap_uchar)
--
--  if test "${ac_cv_func_atomic_add_long_nv}" = "yes" -a \
--          "${ac_cv_func_atomic_cas_32}" = "yes" -a \
--          "${ac_cv_func_atomic_cas_64}" = "yes" -a \
--          "${ac_cv_func_atomic_cas_ulong}" = "yes" -a \
--          "${ac_cv_func_atomic_swap_uchar}" = "yes" ; then
--
--    AC_DEFINE([HAVE_IB_SOLARIS_ATOMICS], [1],
--      [Define to 1 if Solaris libc atomic functions are available]
--    )
--  fi
--
--  AC_MSG_CHECKING(whether pthread_t can be used by Solaris libc atomic functions)
--  # either define HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS or not
--  AC_TRY_RUN(
--    [
--      #include <pthread.h>
--      #include <string.h>
--
--      int main(int argc, char** argv) {
--        pthread_t       x1;
--        pthread_t       x2;
--        pthread_t       x3;
--
--        memset(&x1, 0x0, sizeof(x1));
--        memset(&x2, 0x0, sizeof(x2));
--        memset(&x3, 0x0, sizeof(x3));
--
--        if (sizeof(pthread_t) == 4) {
--        
--          atomic_cas_32(&x1, x2, x3);
--        
--        } else if (sizeof(pthread_t) == 8) {
--        
--          atomic_cas_64(&x1, x2, x3);
--        
--        } else {
--        
--          return(1);
--        }
--
--	return(0);
--      }
--    ],
--    [
--      AC_DEFINE([HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS], [1],
--                [pthread_t can be used by solaris atomics])
--      AC_MSG_RESULT(yes)
--    ],
--    [
--      AC_MSG_RESULT(no)
--    ]
--  )
--
-   # this is needed to know which one of atomic_cas_32() or atomic_cas_64()
-   # to use in the source
-   AC_CHECK_SIZEOF([pthread_t], [], [#include <pthread.h>])
- 
--  # Check for x86 PAUSE instruction
--  AC_MSG_CHECKING(for x86 PAUSE instruction)
--  # We have to actually try running the test program, because of a bug
--  # in Solaris on x86_64, where it wrongly reports that PAUSE is not
--  # supported when trying to run an application. See
--  # http://bugs.opensolaris.org/bugdatabase/printableBug.do?bug_id=6478684
--  # We use ib_ prefix to avoid collisoins if this code is added to
--  # mysql's configure.in.
--  AC_TRY_RUN(
--    [
--      int main() {
--        __asm__ __volatile__ ("pause");
--        return(0);
--      }
--    ],
--    [
--      AC_DEFINE([HAVE_IB_PAUSE_INSTRUCTION], [1], [Does x86 PAUSE instruction exist])
--      AC_MSG_RESULT(yes)
--    ],
--    [
--      AC_MSG_RESULT(no)
--    ],
--    [
--      AC_MSG_RESULT(no)
--    ]
--  )
-   ])
- 
- # vim: set ft=config:
diff --git a/meta-oe/recipes-support/mysql/mariadb/remove-bad-path.patch b/meta-oe/recipes-support/mysql/mariadb/remove-bad-path.patch
new file mode 100644
index 0000000..ff26b0b
--- /dev/null
+++ b/meta-oe/recipes-support/mysql/mariadb/remove-bad-path.patch
@@ -0,0 +1,18 @@
+Remove host path from include directories
+
+Naturally this breaks cross-compilation if present.
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+--- mariadb-5.5.38/storage/tokudb/ft-index/CMakeLists.txt	2014-07-17 14:37:04.529327998 +0100
++++ mariadb-5.5.38/storage/tokudb/ft-index/CMakeLists.txt	2014-07-17 14:43:56.991337895 +0100
+@@ -39,7 +39,6 @@
+ 
+ ## default includes and libraries
+ include_directories(SYSTEM
+-  /usr/local/include
+   ${ZLIB_INCLUDE_DIRS}
+   )
+ 
diff --git a/meta-oe/recipes-support/mysql/mariadb/storage-forbids-absolute-addresses-on-IA-32.patch b/meta-oe/recipes-support/mysql/mariadb/storage-forbids-absolute-addresses-on-IA-32.patch
deleted file mode 100644
index 0530cd9..0000000
--- a/meta-oe/recipes-support/mysql/mariadb/storage-forbids-absolute-addresses-on-IA-32.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-storage: forbids absolute addresses on IA-32
-
-The shared lib has relocations in .text
-...
-WARNING: QA Issue: ELF binary '/usr/lib/plugin/ha_xtradb.so.0.0.0' has relocations in .text
-WARNING: QA Issue: ELF binary '/usr/lib/plugin/ha_innodb_plugin.so.0.0.0' has relocations in .text
-...
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- storage/innodb_plugin/plug.in |    2 +-
- storage/xtradb/plug.in        |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/storage/innodb_plugin/plug.in b/storage/innodb_plugin/plug.in
---- a/storage/innodb_plugin/plug.in
-+++ b/storage/innodb_plugin/plug.in
-@@ -50,7 +50,7 @@ MYSQL_PLUGIN_ACTIONS(innodb_plugin,  [
- 		;;
- 	*86)
- 		# Use absolute addresses on IA-32
--		INNODB_DYNAMIC_CFLAGS="$INNODB_DYNAMIC_CFLAGS -prefer-non-pic"
-+		# INNODB_DYNAMIC_CFLAGS="$INNODB_DYNAMIC_CFLAGS -prefer-non-pic"
- 		;;
-   esac
-   AC_SUBST(INNODB_DYNAMIC_CFLAGS)
-diff --git a/storage/xtradb/plug.in b/storage/xtradb/plug.in
-index a33f4dc..4c186fd 100644
---- a/storage/xtradb/plug.in
-+++ b/storage/xtradb/plug.in
-@@ -51,7 +51,7 @@ MYSQL_PLUGIN_ACTIONS(xtradb,  [
- 		;;
- 	*86)
- 		# Use absolute addresses on IA-32
--		INNODB_DYNAMIC_CFLAGS="$INNODB_DYNAMIC_CFLAGS -prefer-non-pic"
-+		# INNODB_DYNAMIC_CFLAGS="$INNODB_DYNAMIC_CFLAGS -prefer-non-pic"
- 		;;
-   esac
-   AC_SUBST(INNODB_DYNAMIC_CFLAGS)
--- 
-1.7.9.5
-
diff --git a/meta-oe/recipes-support/mysql/mariadb/zlib-let-libdir-configurable.patch b/meta-oe/recipes-support/mysql/mariadb/zlib-let-libdir-configurable.patch
deleted file mode 100644
index 880c2a7..0000000
--- a/meta-oe/recipes-support/mysql/mariadb/zlib-let-libdir-configurable.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-zlib: let lib dir configurable
-
-The zlib were found in $mysql_zlib_dir/lib, and the
-search will fail if zlib in $mysql_zlib_dir/lib64.
-
-Let lib dir configurable rather than hardcode.
-
-Upstream-Status: Pending
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- config/ac-macros/zlib.m4 | 12 ++++++------
- configure.in             |  8 ++++++++
- 2 files changed, 14 insertions(+), 6 deletions(-)
-
-diff --git a/config/ac-macros/zlib.m4 b/config/ac-macros/zlib.m4
---- a/config/ac-macros/zlib.m4
-+++ b/config/ac-macros/zlib.m4
-@@ -106,17 +106,17 @@ case $SYSTEM_TYPE in
-         ;;
-       *)
-         # Test for libz using all known library file endings
--        if test \( -f "$mysql_zlib_dir/lib/libz.a"  -o \
--                   -f "$mysql_zlib_dir/lib/libz.so" -o \
--                   -f "$mysql_zlib_dir/lib/libz.sl" -o \
--                   -f "$mysql_zlib_dir/lib/libz.dylib" \) \
-+        if test \( -f "$mysql_zlib_dir/$base_libdir/libz.a"  -o \
-+                   -f "$mysql_zlib_dir/$base_libdir/libz.so" -o \
-+                   -f "$mysql_zlib_dir/$base_libdir/libz.sl" -o \
-+                   -f "$mysql_zlib_dir/$base_libdir/libz.dylib" \) \
-                 -a -f "$mysql_zlib_dir/include/zlib.h"; then
-           ZLIB_INCLUDES="-I$mysql_zlib_dir/include"
--          ZLIB_LIBS="-L$mysql_zlib_dir/lib -lz"
-+          ZLIB_LIBS="-L$mysql_zlib_dir/$base_libdir -lz"
-           MYSQL_CHECK_ZLIB_DIR
-         fi
-         if test "x$mysql_cv_compress" != "xyes"; then 
--          AC_MSG_ERROR([headers or binaries were not found in $mysql_zlib_dir/{include,lib}])
-+          AC_MSG_ERROR([headers or binaries were not found in $mysql_zlib_dir/{include,$base_libdir}])
-         fi
-         ;;
-     esac
-diff --git a/configure.in b/configure.in
-index 2c6c08e..193b59a 100644
---- a/configure.in
-+++ b/configure.in
-@@ -104,6 +104,14 @@ AC_SUBST(SHARED_LIB_MAJOR_VERSION)
- AC_SUBST(SHARED_LIB_VERSION)
- AC_SUBST(AVAILABLE_LANGUAGES)
- 
-+AC_ARG_WITH([baselib-dir],
-+            AC_HELP_STRING([--baselib-dir=DIR],
-+                           [Provide MySQL with a custom location of
-+                           baselib dir. Given DIR, such as zlib binary is
-+                           assumed to be in $zlib-dir/$DIR.]),
-+            [base_libdir=${withval}],
-+            [base_libdir="lib"])
-+
- # Check whether a debug mode should be enabled.
- AC_ARG_WITH([debug],
-     AS_HELP_STRING([--with-debug@<:@=full@:>@],
--- 
-1.8.1.2
-
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb b/meta-oe/recipes-support/mysql/mariadb_5.5.38.bb
similarity index 86%
rename from meta-oe/recipes-support/mysql/mariadb_5.1.67.bb
rename to meta-oe/recipes-support/mysql/mariadb_5.5.38.bb
index 6ad1fe6..fee5b62 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb
+++ b/meta-oe/recipes-support/mysql/mariadb_5.5.38.bb
@@ -1,6 +1,8 @@
 require ${PN}_${PV}.inc
 
-DEPENDS += "mariadb-native ncurses zlib"
+EXTRA_OECMAKE += "-DSTACK_DIRECTION=-1"
+
+DEPENDS += "mariadb-native ncurses zlib readline libaio"
 
 PROVIDES += "mysql5"
 
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc b/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc
similarity index 67%
rename from meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
rename to meta-oe/recipes-support/mysql/mariadb_5.5.38.inc
index 0c83c71..11b4046 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
+++ b/meta-oe/recipes-support/mysql/mariadb_5.5.38.inc
@@ -4,31 +4,21 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "http://mirrors.coreix.net/mariadb/mariadb-${PV}/kvm-tarbake-jaunty-x86/mariadb-${PV}.tar.gz \
-           file://configure.in.patch \
-           file://plug.in.patch \
-           file://misc.m4.patch \
-           file://Makefile.am.patch \
-           file://fix_host_path.patch \
-           file://configure-ps-cache-check.patch \
-           file://fix-cve-2013-1861-1.patch \
-           file://fix-cve-2013-1861-2.patch \
-           file://zlib-let-libdir-configurable.patch \
-           file://storage-forbids-absolute-addresses-on-IA-32.patch \
+SRC_URI = "http://mirror.stshosting.co.uk/mariadb/mariadb-${PV}/source/mariadb-${PV}.tar.gz \
+           file://fix-cmake-module-path.patch \
+           file://remove-bad-path.patch \
+           file://fix-mysqlclient-r-version.patch \
            file://my.cnf \
-           file://mysqld.sh \
-           file://avoid-plugin-options-warnings.patch \
-           file://fix-link-error-ub1310.patch \
           "
 
-SRC_URI[md5sum] = "44c331fa91943155e4796f89e17a0612"
-SRC_URI[sha256sum] = "33471e9275c9b03919cabc38eb39f807d645adabf6a1a18f2e41ed73f47677c8"
+SRC_URI[md5sum] = "fa9ba00b084b95a45fab70860c412f10"
+SRC_URI[sha256sum] = "efc839e6627064b3b5c6c39854198f0d34907f48937804758d4c09c7717be8d3"
 
 S = "${WORKDIR}/mariadb-${PV}"
 
 BINCONFIG_GLOB = "mysql_config"
 
-inherit autotools-brokensep binconfig update-rc.d useradd
+inherit cmake gettext binconfig update-rc.d useradd
 
 INITSCRIPT_PACKAGES = "${PN}-server"
 INITSCRIPT_NAME = "mysqld"
@@ -38,29 +28,40 @@ USERADD_PACKAGES = "${PN}-server"
 USERADD_PARAM_${PN}-server = "--system --home-dir /var/mysql -g nogroup --shell /bin/false mysql"
 
 
-export ac_cv_path_PS="/bin/ps"
-export ac_cv_FIND_PROC="/bin/ps p \$\$PID | grep -v grep | grep mysqld > /dev/null"
-PARALLEL_MAKE = " "
 EXTRA_OEMAKE = "'GEN_LEX_HASH=${STAGING_BINDIR_NATIVE}/gen_lex_hash'"
-EXTRA_OECONF = "--with-atomic-ops=up \
-                --with-embedded-server \
-                --sysconfdir=/etc/mysql \
-                --localstatedir=/var/mysql \
-                --disable-dependency-tracking \
-                --without-debug \
-                --with-low-memory \
-                --without-query-cache \
-                --without-plugin-maria \
-                --without-man \
-                --without-docs \
-                --with-zlib-dir=${STAGING_EXECPREFIXDIR} \
-                --with-baselib-dir=${base_libdir} \
-                --with-pic \
-                "
 
-do_configure_append() {
-    sed -i /comp_err/d ${B}/sql/share/Makefile
+python __anonymous() {
+    # This is a pain but it's the only way to pass these in since
+    # MariaDB's cmake scripts insist on prepending the prefix to the
+    # specified values for INSTALL_*
+    localdata = d.createCopy()
+    localdata.setVar('prefix', '')
+    localdata.setVar('exec_prefix', '')
+    d.setVar('bindir_noprefix', localdata.getVar('bindir', True).lstrip('/'))
+    d.setVar('sbindir_noprefix', localdata.getVar('sbindir', True).lstrip('/'))
+    d.setVar('datadir_noprefix', localdata.getVar('datadir', True).lstrip('/'))
+    d.setVar('libdir_noprefix', localdata.getVar('libdir', True).lstrip('/'))
+}
+
+EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
+                 -DWITH_JEMALLOC=no \
+                 -DWITHOUT_TOKUDB=true \
+                 -DCMAKE_DISABLE_FIND_PACKAGE_Boost=TRUE \
+                 -DWITH_PIC=ON \
+                 -DINSTALL_DOCDIR:PATH=${datadir_noprefix}/doc/${BPN} \
+                 -DINSTALL_BINDIR:PATH=${bindir_noprefix} \
+                 -DINSTALL_SBINDIR:PATH=${sbindir_noprefix} \
+                 -DINSTALL_SCRIPTDIR:PATH=${bindir_noprefix} \
+                 -DINSTALL_LIBDIR:PATH=${libdir_noprefix} \
+                 -DINSTALL_PLUGINDIR:PATH=${libdir_noprefix}/plugin \
+                 -DINSTALL_SYSCONFDIR:PATH=${sysconfdir} \
+                 -DINSTALL_MYSQLSHAREDIR:PATH=${datadir_noprefix}/mysql \
+                 -DINSTALL_SUPPORTFILESDIR:PATH=${datadir_noprefix}/mysql-support-files \
+                 -DMYSQL_DATADIR:PATH=/var/mysql \
+                 -DCAT_EXECUTABLE=`which cat` \
+                 -DCMAKE_AR:FILEPATH=${AR}"
 
+do_configure_append() {
     # handle distros with different values of ${libexecdir}
     libexecdir2=`echo ${libexecdir} | sed -e 's+/usr/++g'`
     sed -i -e "s:/libexec:/$libexecdir2:g" ${S}/scripts/mysql_install_db.sh
@@ -68,6 +69,20 @@ do_configure_append() {
     sed -i -e "s:/libexec:/$libexecdir2:g" ${S}/scripts/mysqld_safe.sh
 }
 
+do_generate_toolchain_file_append_class-native () {
+    # If these are set cmake will assume we're cross-compiling, which will
+    # result in certain things we want being disabled
+    sed -i "/set( CMAKE_SYSTEM_NAME/d" ${WORKDIR}/toolchain.cmake
+    sed -i "/set( CMAKE_SYSTEM_PROCESSOR/d" ${WORKDIR}/toolchain.cmake
+}
+
+do_compile_prepend_class-target () {
+    # These need to be in-tree or make will think they need to be built,
+    # and since we're cross-compiling that is disabled
+    cp ${STAGING_BINDIR_NATIVE}/comp_err ${S}/extra
+    cp ${STAGING_BINDIR_NATIVE}/comp_sql ${S}/scripts
+}
+
 SYSROOT_PREPROCESS_FUNCS += "mariadb_sysroot_preprocess"
 
 # We need to append this so it runs *after* binconfig's preprocess function
@@ -82,13 +97,10 @@ mariadb_sysroot_preprocess () {
 
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
-    mv -f ${D}${libdir}/mysql/* ${D}${libdir}
-    rmdir ${D}${libdir}/mysql
-    find ${D}${libdir} -name '*.la'|xargs sed -i 's#${libdir}/mysql#${libdir}#'
 
-    install -d ${D}/etc/init.d
-    install -m 0644 ${WORKDIR}/my.cnf ${D}/etc/
-    install -m 0755 ${WORKDIR}/mysqld.sh ${D}/etc/init.d/mysqld
+    install -d ${D}/${sysconfdir}/init.d
+    install -m 0644 ${WORKDIR}/my.cnf ${D}/${sysconfdir}/
+    mv ${D}/${sysconfdir}/init.d/mysql ${D}/${sysconfdir}/init.d/mysqld
 }
 
 pkg_postinst_${PN}-server () {
@@ -102,7 +114,7 @@ pkg_postinst_${PN}-server () {
     mkdir /var/lib/mysql
     chown mysql.nogroup /var/lib/mysql
 
-    mysql_install_db
+    mysql_install_db --basedir=${prefix} --user=mysql
 
 }
 
@@ -130,19 +142,14 @@ RDEPENDS_${PN}-leftovers = "perl perl-module-cwd perl-module-benchmark perl-modu
     perl-module-io-socket-inet perl-module-io-select"
 
 FILES_libmysqlclient = "\
-    ${libdir}/libmysqlclient.so.* \
-    ${libdir}/plugin/*.so.*"
+    ${libdir}/libmysqlclient.so.*"
 FILES_libmysqlclient-dev = " \
     ${includedir}/mysql/ \
     ${libdir}/libmysqlclient.so \
-    ${libdir}/libmysqlclient.la \
-    ${libdir}/plugin/*.so \
-    ${libdir}/plugin/*.la \
     ${sysconfdir}/aclocal \
     ${bindir}/mysql_config"
 FILES_libmysqlclient-staticdev = "\
-    ${libdir}/*.a \
-    ${libdir}/plugin/*.a"
+    ${libdir}/*.a"
 FILES_libmysqlclient-dbg = "${libdir}/plugin/.debug/ \
     /usr/mysql-test/lib/My/SafeProcess/.debug/my_safe_process"
 
@@ -153,8 +160,7 @@ INSANE_SKIP_libmysqlclient_append_i586 = " textrel"
 
 FILES_libmysqlclient-r = "${libdir}/libmysqlclient_r.so.*"
 FILES_libmysqlclient-r-dev = "\
-    ${libdir}/libmysqlclient_r.so \
-    ${libdir}/libmysqlclient_r.la"
+    ${libdir}/libmysqlclient_r.so"
 FILES_libmysqlclient-r-staticdev = "${libdir}/libmysqlclient_r.a"
 FILES_libmysqlclient-r-dbg = "${libdir}/plugin/.debuglibmysqlclient_r.so.*"
 
@@ -199,6 +205,7 @@ FILES_${PN}-server = "\
     ${bindir}/mysql_setpermission \
     ${bindir}/mysql_tzinfo_to_sql \
     ${bindir}/mysql_upgrade \
+    ${bindir}/mysql_plugin \
     ${bindir}/mysql_zap \
     ${bindir}/mysqlbinlog \
     ${bindir}/mysqld_multi \
@@ -225,6 +232,7 @@ FILES_${PN}-server = "\
     ${sbindir}/ndb_cpcd \
     ${sbindir}/ndbd \
     ${sbindir}/ndb_mgmd \
+    ${libdir}/plugin/*.so \
     ${datadir}/mysql/ \
     ${localstatedir}/mysql/ \
     ${sysconfdir}/init.d \
-- 
1.9.3


