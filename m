Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CAAA76C230
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Mar 2019 05:29:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x255TM6B030319
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Mar 2019 21:29:32 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 4 Mar 2019 21:28:59 -0800
From: <mingli.yu@windriver.com>
To: <raj.khem@gmail.com>, <randy.macleod@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Mar 2019 21:28:58 -0800
Message-ID: <20190305052859.14220-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] mariadb: Upgrade to 10.3.13
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Mar 2019 05:29:59 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Per https://mariadb.org/about/maintenance-policy/,
mariadb 5.5.x series only supported until next year
April 2020, so upgrade it to 10.3.13.

Remove some deprecated patches, add some
new patches to fix build failure and rework
two patches to avoid fuzz warnings.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ve_5.5.62.bb => mariadb-native_10.3.13.bb} |   1 +
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  29 ++--
 .../0001-disable-ucontext-on-musl.patch       |   8 +-
 .../mariadb/change-cc-to-cc-version.patch     |  26 ---
 .../configure.cmake-fix-valgrind.patch        |  27 ++-
 .../mariadb/fix-a-building-failure.patch      |  16 +-
 .../mysql/mariadb/fix-cmake-module-path.patch |  29 ----
 .../mariadb/fix-mysqlclient-r-version.patch   | 160 ------------------
 .../mysql/mariadb/remove-bad-path.patch       |  18 --
 ...Lists.txt-fix-gen_lex_hash-not-found.patch |  65 +++++++
 ...akeLists.txt-fix-do_populate_sysroot.patch |  34 ++++
 .../{mariadb_5.5.62.bb => mariadb_10.3.13.bb} |   2 +-
 12 files changed, 145 insertions(+), 270 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_5.5.62.bb => mariadb-native_10.3.13.bb} (88%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/change-cc-to-cc-version.patch
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/fix-cmake-module-path.patch
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/fix-mysqlclient-r-version.patch
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/remove-bad-path.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_5.5.62.bb => mariadb_10.3.13.bb} (88%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_5.5.62.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.3.13.bb
similarity index 88%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_5.5.62.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.3.13.bb
index 4ce960d7d..e1a038dfa 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb-native_5.5.62.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb-native_10.3.13.bb
@@ -13,6 +13,7 @@ do_install() {
 
     install -d ${D}${bindir}
     install -m 0755 sql/gen_lex_hash ${D}${bindir}/
+    install -m 0755 sql/gen_lex_token ${D}${bindir}/
     install -m 0755 extra/comp_err ${D}${bindir}/
     install -m 0755 scripts/comp_sql ${D}${bindir}/
 }
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 8ca5b2ba4..65f98bd3b 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -4,10 +4,7 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "https://downloads.mariadb.org/f/${BP}/source/${BP}.tar.gz \
-           file://fix-cmake-module-path.patch \
-           file://remove-bad-path.patch \
-           file://fix-mysqlclient-r-version.patch \
+SRC_URI = "https://downloads.mariadb.org/interstitial/${BPN}-${PV}/source/${BPN}-${PV}.tar.gz \
            file://my.cnf \
            file://mysqld.service \
            file://install_db.service \
@@ -15,11 +12,12 @@ SRC_URI = "https://downloads.mariadb.org/f/${BP}/source/${BP}.tar.gz \
            file://mysql-systemd-start \
            file://configure.cmake-fix-valgrind.patch \
            file://fix-a-building-failure.patch \
-           file://change-cc-to-cc-version.patch \
+           file://support-files-CMakeLists.txt-fix-do_populate_sysroot.patch \
+           file://sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
            file://0001-disable-ucontext-on-musl.patch \
           "
-SRC_URI[md5sum] = "6375d577e9539b839f44d857e70f82b9"
-SRC_URI[sha256sum] = "56a365af71b8a9ec8bfee0801e2dec95011da8ee7507986ca329be11296411db"
+SRC_URI[md5sum] = "603ce42e35b9a688f2cca05275acb5cb"
+SRC_URI[sha256sum] = "b2aa857ef5b84f85a7ea60a1eac7b34c0ca5151c71a0d44ce2d7fb028d71459a"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
@@ -120,6 +118,11 @@ do_compile_prepend_class-target () {
             echo "#endif" >>${B}/include/openssl/kssl.h
         fi
     fi
+    # workaround to handle out-of-source build from source package
+    yacc_files="sql_yacc.hh sql_yacc.cc sql_yacc_ora.hh sql_yacc_ora.cc"
+    for yacc_file in ${yacc_files}; do
+        cp ${S}/sql/${yacc_file} ${B}/sql/${yacc_file}
+    done
 }
 
 SYSROOT_PREPROCESS_FUNCS += "mariadb_sysroot_preprocess"
@@ -181,13 +184,13 @@ RDEPENDS_${PN}-client = "perl perl-module-getopt-long perl-module-file-temp \
 RDEPENDS_${PN}-server = "perl perl-module-getopt-long perl-module-data-dumper \
     perl-module-file-basename perl-module-file-path perl-module-sys-hostname \
     perl-module-file-copy perl-module-file-temp perl-module-posix \
-    ${PN}-client libdbi-perl libdbd-mysql-perl"
+    ${PN}-client ${PN}-setupdb libdbi-perl libdbd-mysql-perl"
 RDEPENDS_${PN}-leftovers = "perl perl-module-cwd perl-module-benchmark perl-module-getopt-long \
     perl-module-posix perl-module-data-dumper perl-module-sigtrap perl-module-threads \
     perl-module-threads-shared perl-module-io-socket perl-module-sys-hostname perl-module-file-copy \
     perl-module-file-spec perl-module-file-find perl-module-file-basename perl-module-file-path \
     perl-module-constant perl-module-lib perl-module-file-temp perl-module-file-spec-functions \
-    perl-module-io-socket-inet perl-module-io-select"
+    perl-module-io-socket-inet perl-module-io-select bash"
 RDEPENDS_${PN}-setupdb = "coreutils"
 
 # Allow old code to link to the backward compatible library
@@ -195,10 +198,12 @@ RDEPENDS_libmysqlclient-dev = "libmysqlclient-r-dev"
 
 FILES_libmysqlclient = "\
     ${libdir}/libmysqlclient.so.* \
+    ${libdir}/libmariadb.so.* \
     ${sysconfdir}/my.cnf.d/client.cnf"
 FILES_libmysqlclient-dev = " \
     ${includedir}/mysql/ \
     ${libdir}/libmysqlclient.so \
+    ${libdir}/libmariadb.so \
     ${sysconfdir}/aclocal \
     ${bindir}/mysql_config"
 FILES_libmysqlclient-staticdev = "\
@@ -215,9 +220,11 @@ FILES_libmysqlclient-r-dev = "\
 FILES_libmysqlclient-r-staticdev = "${libdir}/libmysqlclient_r.a"
 
 FILES_libmysqld = "\
-    ${libdir}/libmysqld.so.*"
+    ${libdir}/libmysqld.so.* \
+    ${libdir}/libmariadbd.so.*"
 FILES_libmysqld-dev = "\
-    ${libdir}/libmysqld.so"
+    ${libdir}/libmysqld.so \
+    ${libdir}/libmariadbd.so"
 
 FILES_${PN}-client = "\
     ${bindir}/myisam_ftdump \
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-disable-ucontext-on-musl.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-disable-ucontext-on-musl.patch
index 60e9199f9..daf2432a5 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-disable-ucontext-on-musl.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-disable-ucontext-on-musl.patch
@@ -1,4 +1,4 @@
-From 5bc3e7ef9700d12054e0125a126f1bb093f01ef9 Mon Sep 17 00:00:00 2001
+From b658bdb38b7ff6a78915fd0ac390fc224e4006cb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 26 Mar 2017 14:30:33 -0700
 Subject: [PATCH] disable ucontext on musl
@@ -6,12 +6,13 @@ Subject: [PATCH] disable ucontext on musl
 musl does not have *contex() APIs even though it has ucontext.h header
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  include/my_context.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/include/my_context.h b/include/my_context.h
-index dd44103..9b28c17 100644
+index ea0e3496..4c9b37dc 100644
 --- a/include/my_context.h
 +++ b/include/my_context.h
 @@ -31,7 +31,7 @@
@@ -23,6 +24,3 @@ index dd44103..9b28c17 100644
  #define MY_CONTEXT_USE_UCONTEXT
  #else
  #define MY_CONTEXT_DISABLE
--- 
-2.12.1
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/change-cc-to-cc-version.patch b/meta-oe/recipes-dbs/mysql/mariadb/change-cc-to-cc-version.patch
deleted file mode 100644
index 02bda24f7..000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/change-cc-to-cc-version.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-mariadb: replace the CC with CC_VERSION and CXX with CXX_VERSION
-
-mysqlbug.sh is a bug report script. It makes a report with the build information,
-including gcc version. The CC is the local path of gcc, which is useless for bug
-report, and the path may expose private information, so change it to CC_VERSION.
-
-Upstream-Status: Pending
-
-Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-================================
-diff --git a/scripts/mysqlbug.sh.old b/scripts/mysqlbug.sh
-index e9df210..d4b8d53 100644
---- a/scripts/mysqlbug.sh.old
-+++ b/scripts/mysqlbug.sh
-@@ -24,8 +24,8 @@ VERSION="@VERSION@@MYSQL_SERVER_SUFFIX@"
- COMPILATION_COMMENT="@COMPILATION_COMMENT@"
- BUGmysql="maria-developers@lists.launchpad.net"
- # This is set by configure
--COMP_CALL_INFO="CC='@SAVE_CC@'  CFLAGS='@SAVE_CFLAGS@'  CXX='@SAVE_CXX@'  CXXFLAGS='@SAVE_CXXFLAGS@'  LDFLAGS='@SAVE_LDFLAGS@'  ASFLAGS='@SAVE_ASFLAGS@'"
--COMP_RUN_INFO="CC='@CC@'  CFLAGS='@CFLAGS@'  CXX='@CXX@'  CXXFLAGS='@CXXFLAGS@'  LDFLAGS='@LDFLAGS@'  ASFLAGS='@ASFLAGS@'"
-+COMP_CALL_INFO="CC='@CC_VERSION@'  CFLAGS='@SAVE_CFLAGS@'  CXX='@CXX_VERSION@'  CXXFLAGS='@SAVE_CXXFLAGS@'  LDFLAGS='@SAVE_LDFLAGS@'  ASFLAGS='@SAVE_ASFLAGS@'"
-+COMP_RUN_INFO="CC='@CC_VERSION@'  CFLAGS='@CFLAGS@'  CXX='@CXX_VERSION@'  CXXFLAGS='@CXXFLAGS@'  LDFLAGS='@LDFLAGS@'  ASFLAGS='@ASFLAGS@'"
- CONFIGURE_LINE="@CONF_COMMAND@"
- 
- LIBC_INFO=""
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/configure.cmake-fix-valgrind.patch b/meta-oe/recipes-dbs/mysql/mariadb/configure.cmake-fix-valgrind.patch
index e97def602..ac9427958 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/configure.cmake-fix-valgrind.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/configure.cmake-fix-valgrind.patch
@@ -1,6 +1,6 @@
-From 5effba0d7d47071a3f1bca56823190d5a95bb1a6 Mon Sep 17 00:00:00 2001
+From 24e2b0edc2612acefcc48414bb6f0aeb086061a9 Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
-Date: Wed, 12 Nov 2014 03:09:10 -0500
+Date: Tue, 26 Feb 2019 23:57:06 -0800
 Subject: [PATCH] configure.cmake: fix valgrind
 
 Check valgrind headers only if WITH_VALGRIND is set.
@@ -15,27 +15,26 @@ PACKAGECONFIG to decide if valgrind is needed or not.
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
 ---
- configure.cmake | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ configure.cmake | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
 
 diff --git a/configure.cmake b/configure.cmake
-index 0bd7bbe..51a098f 100644
+index 3cfc4b31..d017b3b3 100644
 --- a/configure.cmake
 +++ b/configure.cmake
-@@ -1047,10 +1047,10 @@ MARK_AS_ADVANCED(WITH_ATOMIC_LOCKS MY_ATOMIC_MODE_RWLOCK MY_ATOMIC_MODE_DUMMY)
+@@ -930,10 +930,9 @@ HAVE_GCC_C11_ATOMICS)
  
  IF(WITH_VALGRIND)
    SET(HAVE_valgrind 1)
-+  CHECK_INCLUDE_FILES("valgrind/memcheck.h;valgrind/valgrind.h"
-+  HAVE_VALGRIND)
- ENDIF()
- 
+-ENDIF()
+-
 -CHECK_INCLUDE_FILES("valgrind/memcheck.h;valgrind/valgrind.h" 
--  HAVE_VALGRIND)
++  CHECK_INCLUDE_FILES("valgrind/memcheck.h;valgrind/valgrind.h"
+   HAVE_VALGRIND_MEMCHECK_H)
++ENDIF()
  
  #--------------------------------------------------------------------
  # Check for IPv6 support
--- 
-2.0.0
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch b/meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
index 0c4e10237..9149ee21f 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
@@ -1,4 +1,7 @@
-[PATCH] fix a building failure
+From 1b2b6a61c9f82157cd2e0c3744f6c07e07aeb0bd Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 4 Mar 2019 01:11:30 -0800
+Subject: [PATCH] fix a building failure
 
 Upstream-Status: Inappropriate [configuration]
 
@@ -6,17 +9,18 @@ building failed since native does not generate import_executables.cmake
 In fact, our building system will export the needed commands
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
  CMakeLists.txt | 5 -----
  1 file changed, 5 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index c1ce1c5..83b3a7e 100644
+index fc30750..4f9110e 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -350,11 +350,6 @@ MYSQL_CHECK_READLINE()
+@@ -347,11 +347,6 @@ CHECK_PCRE()
  
- CHECK_JEMALLOC()
+ CHECK_SYSTEMD()
  
 -IF(CMAKE_CROSSCOMPILING)
 -  SET(IMPORT_EXECUTABLES "IMPORTFILE-NOTFOUND" CACHE FILEPATH "Path to import_executables.cmake from a native build")
@@ -24,8 +28,8 @@ index c1ce1c5..83b3a7e 100644
 -ENDIF()
 -
  #
- # Setup maintainer mode options by the end. Platform checks are
+ # Setup maintainer mode options. Platform checks are
  # not run with the warning options as to not perturb fragile checks
 -- 
-1.9.1
+2.17.1
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/fix-cmake-module-path.patch b/meta-oe/recipes-dbs/mysql/mariadb/fix-cmake-module-path.patch
deleted file mode 100644
index 8d9f558d0..000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/fix-cmake-module-path.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Avoid CMAKE_MODULE_PATH being overwritten
-
-OE-Core's setting of CMAKE_MODULE_PATH stomps on MariaDB's value unless
-we set it after setting the project name.
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-Upstream-Status: Inappropriate [working around OE-Core bug]
-
---- mariadb/CMakeLists.txt	2014-07-17 11:01:07.676353047 +0100
-+++ mariadb/CMakeLists.txt	2014-07-17 11:01:31.299353107 +0100
-@@ -28,8 +28,6 @@
- 
- MESSAGE(STATUS "Running cmake version ${CMAKE_VERSION}")
- 
--SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake)
--
- # Distinguish between community and non-community builds, with the
- # default being a community build. This does not impact the feature
- # set that will be compiled in; it's merely provided as a hint to
-@@ -77,6 +75,8 @@
- ENDIF()
- PROJECT(${MYSQL_PROJECT_NAME})
- 
-+SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake)
-+
- IF(BUILD_CONFIG)
-   INCLUDE(
-   ${CMAKE_SOURCE_DIR}/cmake/build_configurations/${BUILD_CONFIG}.cmake)
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/fix-mysqlclient-r-version.patch b/meta-oe/recipes-dbs/mysql/mariadb/fix-mysqlclient-r-version.patch
deleted file mode 100644
index a519e4292..000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/fix-mysqlclient-r-version.patch
+++ /dev/null
@@ -1,160 +0,0 @@
-From 6db2a606196fb38a6d106dc409eee1cb9a40a440 Mon Sep 17 00:00:00 2001
-From: Tor Didriksen <tor.didriksen@oracle.com>
-Date: Mon, 24 Jun 2013 17:15:35 +0200
-Subject: [PATCH] Bug#16809055 MYSQL 5.6 AND 5.7 STILL USE LIBMYSQLCLIENT.SO.18
-
-With this patch, the libmysql/ directory contains:
-libmysqlclient.a
-libmysqlclient_r.a -> libmysqlclient.a
-libmysqlclient_r.so -> libmysqlclient.so*
-libmysqlclient_r.so.18 -> libmysqlclient.so.18*
-libmysqlclient_r.so.18.1.0 -> libmysqlclient.so.18.1.0*
-libmysqlclient.so -> libmysqlclient.so.18*
-libmysqlclient.so.18 -> libmysqlclient.so.18.1.0*
-libmysqlclient.so.18.1.0*
-
-This fixes libmysqlclient_r symlinks pointing to the unversioned
-libmysqlclient.so symlink (leading to package QA errors since the
-libmysqlclient-r package ends up depending on libmysqlclient-dev).
-
-Borrowed from MySQL 5.6 tree at https://github.com/percona/mysql/
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
----
- cmake/install_macros.cmake | 25 +++++++++++++++----------
- libmysql/CMakeLists.txt    | 34 +++++++++++++++++++++++++++-------
- 2 files changed, 42 insertions(+), 17 deletions(-)
-
-diff --git a/cmake/install_macros.cmake b/cmake/install_macros.cmake
-index b8efdf8..a0d0e68 100644
---- a/cmake/install_macros.cmake
-+++ b/cmake/install_macros.cmake
-@@ -1,4 +1,4 @@
--# Copyright (c) 2009, 2011, Oracle and/or its affiliates. All rights reserved.
-+# Copyright (c) 2009, 2013, Oracle and/or its affiliates. All rights reserved.
- # 
- # This program is free software; you can redistribute it and/or modify
- # it under the terms of the GNU General Public License as published by
-@@ -167,28 +167,33 @@ ENDFUNCTION()
- 
- 
- # Install symbolic link to CMake target. 
--# the link is created in the same directory as target
--# and extension will be the same as for target file.
--MACRO(INSTALL_SYMLINK linkname target destination component)
-+# We do 'cd path; ln -s target_name link_name'
-+# We also add an INSTALL target for "${path}/${link_name}"
-+MACRO(INSTALL_SYMLINK target target_name link_name destination component)
- IF(UNIX)
-   GET_TARGET_PROPERTY(location ${target} LOCATION)
-   GET_FILENAME_COMPONENT(path ${location} PATH)
--  GET_FILENAME_COMPONENT(name ${location} NAME)
--  SET(output ${path}/${linkname})
-+  MESSAGE(STATUS "target ${target}")
-+  MESSAGE(STATUS "link_name ${link_name}")
-+  MESSAGE(STATUS "target_name ${target_name}")
-+  MESSAGE(STATUS "path ${path}")
-+  MESSAGE(STATUS "")
-+
-+  SET(output ${path}/${link_name})
-   ADD_CUSTOM_COMMAND(
-     OUTPUT ${output}
-     COMMAND ${CMAKE_COMMAND} ARGS -E remove -f ${output}
-     COMMAND ${CMAKE_COMMAND} ARGS -E create_symlink 
--      ${name} 
--      ${linkname}
-+      ${target_name} 
-+      ${link_name}
-     WORKING_DIRECTORY ${path}
-     DEPENDS ${target}
-     )
-   
--  ADD_CUSTOM_TARGET(symlink_${linkname}
-+  ADD_CUSTOM_TARGET(symlink_${link_name}
-     ALL
-     DEPENDS ${output})
--  SET_TARGET_PROPERTIES(symlink_${linkname} PROPERTIES CLEAN_DIRECT_OUTPUT 1)
-+  SET_TARGET_PROPERTIES(symlink_${link_name} PROPERTIES CLEAN_DIRECT_OUTPUT 1)
-   IF(CMAKE_GENERATOR MATCHES "Xcode")
-     # For Xcode, replace project config with install config
-     STRING(REPLACE "${CMAKE_CFG_INTDIR}" 
-diff --git a/libmysql/CMakeLists.txt b/libmysql/CMakeLists.txt
-index be5760f..96286ff 100644
---- a/libmysql/CMakeLists.txt
-+++ b/libmysql/CMakeLists.txt
-@@ -433,6 +433,12 @@ IF(MSVC)
-  INSTALL_DEBUG_TARGET(clientlib DESTINATION ${INSTALL_LIBDIR}/debug)
- ENDIF()
- 
-+MACRO(GET_TARGET_NAME target out_name)
-+  GET_TARGET_PROPERTY(location ${target} LOCATION)
-+  GET_FILENAME_COMPONENT(name ${location} NAME)
-+  SET(${out_name} ${name})
-+ENDMACRO()
-+
- IF(UNIX)
-   MACRO(GET_VERSIONED_LIBNAME LIBNAME EXTENSION VERSION OUTNAME)
-     SET(DOT_VERSION ".${VERSION}")
-@@ -445,7 +451,13 @@ IF(UNIX)
-       SET(${OUTNAME} ${LIBNAME}${EXTENSION}${DOT_VERSION})
-     ENDIF() 
-   ENDMACRO()
--  INSTALL_SYMLINK(${CMAKE_STATIC_LIBRARY_PREFIX}mysqlclient_r.a mysqlclient ${INSTALL_LIBDIR} Development)
-+ENDIF()
-+
-+IF(UNIX)
-+  GET_TARGET_NAME(mysqlclient lib_name)
-+  INSTALL_SYMLINK(mysqlclient
-+    ${lib_name} ${CMAKE_STATIC_LIBRARY_PREFIX}mysqlclient_r.a
-+    ${INSTALL_LIBDIR} Development)
- ENDIF()
- 
- IF(NOT DISABLE_SHARED)
-@@ -456,10 +468,9 @@ IF(NOT DISABLE_SHARED)
-     # libtool compatability
-     IF(CMAKE_SYSTEM_NAME MATCHES "FreeBSD" OR APPLE)
-       SET(OS_SHARED_LIB_VERSION "${SHARED_LIB_MAJOR_VERSION}")
--    ELSEIF(CMAKE_SYSTEM_NAME MATCHES "HP-UX")
--      SET(OS_SHARED_LIB_VERSION "${SHARED_LIB_MAJOR_VERSION}.0")
-     ELSE()
--      SET(OS_SHARED_LIB_VERSION "${SHARED_LIB_MAJOR_VERSION}.0.0")
-+      SET(OS_SHARED_LIB_VERSION
-+        "${SHARED_LIB_MAJOR_VERSION}.${SHARED_LIB_MINOR_VERSION}.0")
-     ENDIF()
-     # Name of shared library is mysqlclient on Unix
-     SET_TARGET_PROPERTIES(libmysql PROPERTIES 
-@@ -482,8 +493,13 @@ IF(NOT DISABLE_SHARED)
-       "${CMAKE_SHARED_LIBRARY_SUFFIX}"
-       ""
-       linkname)
--    INSTALL_SYMLINK(${linkname} libmysql ${INSTALL_LIBDIR} SharedLibraries)
--    SET(OS_SHARED_LIB_SYMLINKS "${SHARED_LIB_MAJOR_VERSION}" "${OS_SHARED_LIB_VERSION}")
-+    GET_TARGET_NAME(libmysql lib_name)
-+    GET_FILENAME_COMPONENT(lib_name_we ${lib_name} NAME_WE)
-+    INSTALL_SYMLINK(libmysql
-+      ${lib_name} ${linkname}
-+      ${INSTALL_LIBDIR} SharedLibraries)
-+    SET(OS_SHARED_LIB_SYMLINKS
-+      "${SHARED_LIB_MAJOR_VERSION}" "${OS_SHARED_LIB_VERSION}")
-     LIST(REMOVE_DUPLICATES OS_SHARED_LIB_SYMLINKS)
-     FOREACH(ver ${OS_SHARED_LIB_SYMLINKS})
-       GET_VERSIONED_LIBNAME(
-@@ -491,7 +507,11 @@ IF(NOT DISABLE_SHARED)
-         "${CMAKE_SHARED_LIBRARY_SUFFIX}"
-         "${ver}"
-         linkname)
--      INSTALL_SYMLINK(${linkname} libmysql ${INSTALL_LIBDIR} SharedLibraries)
-+      GET_VERSIONED_LIBNAME(
-+        ${lib_name_we} "${CMAKE_SHARED_LIBRARY_SUFFIX}" "${ver}" lib_name_ver)
-+      INSTALL_SYMLINK(libmysql
-+        ${lib_name_ver} ${linkname}
-+        ${INSTALL_LIBDIR} SharedLibraries)
-     ENDFOREACH()
-   ENDIF()
- ENDIF()
--- 
-2.0.3
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/remove-bad-path.patch b/meta-oe/recipes-dbs/mysql/mariadb/remove-bad-path.patch
deleted file mode 100644
index ff26b0b86..000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/remove-bad-path.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Remove host path from include directories
-
-Naturally this breaks cross-compilation if present.
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
---- mariadb-5.5.38/storage/tokudb/ft-index/CMakeLists.txt	2014-07-17 14:37:04.529327998 +0100
-+++ mariadb-5.5.38/storage/tokudb/ft-index/CMakeLists.txt	2014-07-17 14:43:56.991337895 +0100
-@@ -39,7 +39,6 @@
- 
- ## default includes and libraries
- include_directories(SYSTEM
--  /usr/local/include
-   ${ZLIB_INCLUDE_DIRS}
-   )
- 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch b/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
new file mode 100644
index 000000000..afc1be47b
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
@@ -0,0 +1,65 @@
+From 796464015bffe6e0beca9e1c355b223512803c3e Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 27 Feb 2019 23:01:00 -0800
+Subject: [PATCH] sql/CMakeLists.txt: fix gen_lex_hash not found
+
+Fix the below do_compile issue in cross-compiling env.
+| make[2]: *** No rule to make target '/build/tmp/work/aarch64-poky-linux/mariadb/10.3.13-r0/mariadb-10.3.13/sql/gen_lex_hash', needed by 'sql/lex_hash.h'.  Stop.
+| make[2]: *** No rule to make target '/build/tmp/work/aarch64-poky-linux/mariadb/10.3.13-r0/mariadb-10.3.13/sql/gen_lex_token', needed by 'sql/lex_token.h'.  Stop.
+
+Upstream-Status: Inappropriate [oe build specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
+---
+ sql/CMakeLists.txt | 30 ++++++++++++++++++++----------
+ 1 file changed, 20 insertions(+), 10 deletions(-)
+
+diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
+index c6910f46..bf51f4cb 100644
+--- a/sql/CMakeLists.txt
++++ b/sql/CMakeLists.txt
+@@ -50,11 +50,16 @@ ${WSREP_INCLUDES}
+ 
+ 
+ 
+-ADD_CUSTOM_COMMAND(
+-  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
+-  COMMAND gen_lex_token > lex_token.h
+-  DEPENDS gen_lex_token
+-)
++IF(NOT CMAKE_CROSSCOMPILING)
++  ADD_CUSTOM_COMMAND(
++   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
++   COMMAND gen_lex_token > lex_token.h
++   DEPENDS gen_lex_token)
++ELSE()
++  ADD_CUSTOM_COMMAND(
++   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
++   COMMAND gen_lex_token > lex_token.h)
++ENDIF()
+ 
+ ADD_DEFINITIONS(-DMYSQL_SERVER -DHAVE_EVENT_SCHEDULER)
+ 
+@@ -370,11 +375,16 @@ IF(NOT CMAKE_CROSSCOMPILING)
+   ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)
+ ENDIF()
+ 
+-ADD_CUSTOM_COMMAND(
+-  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
+-  COMMAND gen_lex_hash > lex_hash.h
+-  DEPENDS gen_lex_hash
+-)
++IF(NOT CMAKE_CROSSCOMPILING)
++  ADD_CUSTOM_COMMAND(
++   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
++   COMMAND gen_lex_hash > lex_hash.h
++   DEPENDS gen_lex_hash)
++ELSE()
++  ADD_CUSTOM_COMMAND(
++   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
++   COMMAND gen_lex_hash > lex_hash.h)
++ENDIF()
+ 
+ MYSQL_ADD_EXECUTABLE(mysql_tzinfo_to_sql tztime.cc COMPONENT Server)
+ SET_TARGET_PROPERTIES(mysql_tzinfo_to_sql PROPERTIES COMPILE_FLAGS "-DTZINFO2SQL")
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch b/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch
new file mode 100644
index 000000000..4f9a4e9b0
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/support-files-CMakeLists.txt-fix-do_populate_sysroot.patch
@@ -0,0 +1,34 @@
+From 4ac5b555d058d4d489f25a3806a787b7b2465d09 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 27 Feb 2019 22:41:26 -0800
+Subject: [PATCH] support-files/CMakeLists.txt: fix do_populate_sysroot issue
+
+Comment out the logic which for suse as it introduces
+below do_populate_sysroot error:
+ERROR: mariadb-native-10.3.13-r0 do_populate_sysroot: sstate found an absolute path symlink /build/tmp/work/x86_64-linux/mariadb-native/10.3.13-r0/sysroot-destdir/build/tmp/work/x86_64-linux/mariadb-native/10.3.13-r0/recipe-sysroot-native/usr/sbin/rcmysql pointing at /build/tmp/work/x86_64-linux/mariadb-native/10.3.13-r0/recipe-sysroot-native/etc/init.d/mysql. Please replace this with a relative link.
+
+Upstream-Status: Inappropriate[oe build specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
+---
+ support-files/CMakeLists.txt | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/support-files/CMakeLists.txt b/support-files/CMakeLists.txt
+index b5767432..56733de1 100644
+--- a/support-files/CMakeLists.txt
++++ b/support-files/CMakeLists.txt
+@@ -165,12 +165,5 @@ IF(UNIX)
+       INSTALL(FILES rpm/enable_encryption.preset DESTINATION ${INSTALL_SYSCONF2DIR}
+               COMPONENT IniFiles)
+     ENDIF()
+-
+-    # This is for SuSE:
+-    INSTALL(CODE "EXECUTE_PROCESS(COMMAND ${CMAKE_COMMAND} -E create_symlink
+-                   ${INSTALL_SYSCONFDIR}/init.d/mysql
+-                   ${INSTALL_SBINDIR}/rcmysql
+-                   WORKING_DIRECTORY \$ENV{DESTDIR}${prefix})"
+-                   COMPONENT SupportFiles)
+   ENDIF(INSTALL_SYSCONFDIR)
+ ENDIF()
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_5.5.62.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.3.13.bb
similarity index 88%
rename from meta-oe/recipes-dbs/mysql/mariadb_5.5.62.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.3.13.bb
index d7895732a..4782f2b84 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb_5.5.62.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb_10.3.13.bb
@@ -2,7 +2,7 @@ require mariadb.inc
 
 EXTRA_OECMAKE += "-DSTACK_DIRECTION=-1"
 
-DEPENDS += "mariadb-native ncurses zlib readline libaio libevent"
+DEPENDS += "mariadb-native bison-native openssl ncurses zlib readline libaio libevent"
 
 PROVIDES += "mysql5 libmysqlclient"
 
-- 
2.17.1


