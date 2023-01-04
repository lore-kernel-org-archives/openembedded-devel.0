Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9796C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 09:44:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8313.1672825461927076830
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jan 2023 01:44:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=036884e4d1=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3049Ffmn001930;
	Wed, 4 Jan 2023 09:44:20 GMT
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mtaa2j9ax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 04 Jan 2023 09:44:20 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 4 Jan 2023 01:44:19 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 4 Jan 2023 01:44:18 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [kirkstone][meta-oe][PATCH v2 1/2] mariadb: not use qemu to run cross-compiled binaries
Date: Wed, 4 Jan 2023 17:44:16 +0800
Message-ID: <20230104094417.3142002-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <914f48f2-c27b-78af-a953-ffc2f667f2b4@gmail.com>
References: <914f48f2-c27b-78af-a953-ffc2f667f2b4@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: D64x9EWUpagGcYgAdnSpR-zKXY2vDr22
X-Proofpoint-GUID: D64x9EWUpagGcYgAdnSpR-zKXY2vDr22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_05,2023-01-03_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301040080
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 09:44:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100393

From: Mingli Yu <mingli.yu@windriver.com>

The build fails when use qemu to run build for amd64 as below:

 | make  -f libmariadb/libmariadb/CMakeFiles/mariadbclient.dir/build.make libmariadb/libmariadb/CMakeFiles/mariadbclient.dir/depend
 | make  -f libmariadb/libmariadb/CMakeFiles/libmariadb.dir/build.make libmariadb/libmariadb/CMakeFiles/libmariadb.dir/depend
 | make[2]: Entering directory '/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build'
 | cd /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build && /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/recipe-sysroot-native/usr/bin/cmake -E cmake_depends "Unix Makefiles" /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/mariadb-10.7.4 /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/mariadb-10.7.4/libmariadb/libmariadb /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build/libmariadb/libmariadb /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build/libmariadb/libmariadb/CMakeFiles/mariadbclient.dir/DependInfo.cmake --color=
 | make[2]: Leaving directory '/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build'
 | make  -f libmariadb/libmariadb/CMakeFiles/mariadbclient.dir/build.make libmariadb/libmariadb/CMakeFiles/mariadbclient.dir/build
 | Illegal instruction (core dumped)
 | make[2]: *** [sql/CMakeFiles/GenServerSource.dir/build.make:76: sql/lex_hash.h] Error 132
 | make[2]: *** Deleting file 'sql/lex_hash.h'
 | make[2]: Entering directory '/build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build'
 | [  8%] Linking C static library libmariadbclient.a
 | cd /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/build/libmariadb/libmariadb && /build/tmp-glibc/work/dbfp5-wrs-linux/mariadb/10.7.4-r0/recipe-sysroot-native/usr/bin/cmake -P CMakeFiles/mariadbclient.dir/cmake_clean_target.cmake
 | Illegal instruction (core dumped)
 | Illegal instruction (core dumped)
 | make[2]: *** [scripts/CMakeFiles/GenFixPrivs.dir/build.make:78: scripts/mysql_fix_privilege_tables_sql.c] Error 132

So don't use qemu to run cross-compiled binaries.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4facf6815c4d10a4c7a373d81056af2533d0df12)
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../mysql/mariadb-native_10.7.4.bb            |  4 +-
 meta-oe/recipes-dbs/mysql/mariadb.inc         | 20 +++---
 ...Lists.txt-fix-gen_lex_hash-not-found.patch | 69 +++++++++++++++++++
 .../mysql/mariadb/cross-compiling.patch       | 34 +++++++++
 meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb   |  4 +-
 5 files changed, 116 insertions(+), 15 deletions(-)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.7.4.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.7.4.bb
index e38726d3f..17a06349b 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb-native_10.7.4.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb-native_10.7.4.bb
@@ -2,7 +2,9 @@ require mariadb.inc
 inherit native
 
 PROVIDES += "mysql5-native"
-DEPENDS = "ncurses-native zlib-native bison-native libpcre2-native"
+DEPENDS = "ncurses-native zlib-native bison-native libpcre2-native \
+gnutls-native fmt-native \
+"
 
 RDEPENDS:${PN} = ""
 PACKAGES = ""
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 922373b63..23322cf74 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -20,6 +20,8 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://mm_malloc.patch \
            file://sys_futex.patch \
            file://mariadb-openssl3.patch \
+           file://cross-compiling.patch \
+           file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
 
@@ -61,6 +63,8 @@ FILES:${PN}-setupdb = "${sysconfdir}/init.d/install_db \
                        ${bindir}/mysql-systemd-start \
                        "
 
+EXTRA_OEMAKE = "'GEN_LEX_HASH=${STAGING_BINDIR_NATIVE}/gen_lex_hash'"
+
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} openssl"
 PACKAGECONFIG:class-native = ""
 PACKAGECONFIG[pam] = ",-DWITHOUT_AUTH_PAM=TRUE,libpam"
@@ -95,9 +99,9 @@ EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
                  -DINSTALL_SYSCONFDIR:PATH=${sysconfdir} \
                  -DMYSQL_DATADIR:PATH=/var/mysql \
                  -DCAT_EXECUTABLE=`which cat` \
+                 -DSTACK_DIRECTION=1 \
                  -DCMAKE_AR:FILEPATH=${AR}"
 
-EXTRA_OECMAKE:prepend:class-target = "-DCMAKE_CROSSCOMPILING_EMULATOR=${WORKDIR}/qemuwrapper "
 
 # With Ninja it fails with:
 # make: *** No rule to make target `install'.  Stop.
@@ -121,18 +125,12 @@ do_generate_toolchain_file:append:class-native () {
     sed -i "/set( CMAKE_SYSTEM_PROCESSOR/d" ${WORKDIR}/toolchain.cmake
 }
 
-do_configure:prepend:class-target () {
-	# Write out a qemu wrapper that will be used by cmake
-	# so that it can run target helper binaries through that.
-	qemu_binary="${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
-	cat > ${WORKDIR}/qemuwrapper << EOF
-#!/bin/sh
-$qemu_binary "\$@"
-EOF
-	chmod +x ${WORKDIR}/qemuwrapper
-}
 
 do_compile:prepend:class-target () {
+    # These need to be in-tree or make will think they need to be built,
+    # and since we're cross-compiling that is disabled
+    cp ${STAGING_BINDIR_NATIVE}/comp_err ${S}/extra
+    cp ${STAGING_BINDIR_NATIVE}/comp_sql ${S}/scripts
     if [ "${@bb.utils.contains('PACKAGECONFIG', 'krb5', 'yes', 'no', d)}" = "no" ]; then
         if ! [ -e ${B}/include/openssl/kssl.h ] ; then
             mkdir -p ${B}/include/openssl
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
new file mode 100644
index 000000000..456a2bad6
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
@@ -0,0 +1,69 @@
+From f92f657973997df30afdb0032c88ad3a14ead46b Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Fri, 23 Sep 2022 15:48:21 +0800
+Subject: [PATCH] sql/CMakeLists.txt: fix gen_lex_hash not found
+
+Fix the below do_compile issue in cross-compiling env.
+| make[2]: *** No rule to make target '/build/tmp/work/aarch64-poky-linux/mariadb/10.3.13-r0/mariadb-10.3.13/sql/gen_lex_hash', needed by 'sql/lex_hash.h'.  Stop.
+| make[2]: *** No rule to make target '/build/tmp/work/aarch64-poky-linux/mariadb/10.3.13-r0/mariadb-10.3.13/sql/gen_lex_token', needed by 'sql/lex_token.h'.  Stop.
+
+Upstream-Status: Inappropriate [oe build specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ sql/CMakeLists.txt | 30 ++++++++++++++++++++++--------
+ 1 file changed, 22 insertions(+), 8 deletions(-)
+
+diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
+index 241b482..27a3991 100644
+--- a/sql/CMakeLists.txt
++++ b/sql/CMakeLists.txt
+@@ -60,11 +60,18 @@ ${CMAKE_BINARY_DIR}/sql
+ ${CMAKE_SOURCE_DIR}/tpool
+ )
+ 
+-ADD_CUSTOM_COMMAND(
+-  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
+-  COMMAND gen_lex_token > lex_token.h
+-  DEPENDS gen_lex_token
++IF(NOT CMAKE_CROSSCOMPILING)
++  ADD_CUSTOM_COMMAND(
++    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
++    COMMAND gen_lex_token > lex_token.h
++    DEPENDS gen_lex_token
++)
++ELSE()
++  ADD_CUSTOM_COMMAND(
++    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
++    COMMAND gen_lex_token > lex_token.h
+ )
++ENDIF()
+ 
+ FIND_PACKAGE(BISON 2.4)
+ 
+@@ -372,11 +379,18 @@ IF(NOT CMAKE_CROSSCOMPILING OR DEFINED CMAKE_CROSSCOMPILING_EMULATOR)
+   ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)
+ ENDIF()
+ 
+-ADD_CUSTOM_COMMAND(
+-  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
+-  COMMAND gen_lex_hash > lex_hash.h
+-  DEPENDS gen_lex_hash
++IF(NOT CMAKE_CROSSCOMPILING)
++  ADD_CUSTOM_COMMAND(
++    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
++    COMMAND gen_lex_hash > lex_hash.h
++    DEPENDS gen_lex_hash
++)
++ELSE()
++  ADD_CUSTOM_COMMAND(
++    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
++    COMMAND gen_lex_hash > lex_hash.h
+ )
++ENDIF()
+ 
+ MYSQL_ADD_EXECUTABLE(mariadb-tzinfo-to-sql tztime.cc)
+ SET_TARGET_PROPERTIES(mariadb-tzinfo-to-sql PROPERTIES COMPILE_FLAGS "-DTZINFO2SQL")
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch b/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
new file mode 100644
index 000000000..d0d6e3c73
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
@@ -0,0 +1,34 @@
+From 80be37351d995654f86b838f6b5ed47e8a90261b Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Fri, 23 Sep 2022 12:05:17 +0800
+Subject: [PATCH] CMakeLists.txt: not include import_executables.cmake
+
+building failed since native does not generate import_executables.cmake
+In fact, our building system will export the needed commands.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ CMakeLists.txt | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f9e2b1b..34924ba 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -394,11 +394,6 @@ CHECK_LIBFMT()
+ ADD_SUBDIRECTORY(tpool)
+ CHECK_SYSTEMD()
+ 
+-IF(CMAKE_CROSSCOMPILING AND NOT DEFINED CMAKE_CROSSCOMPILING_EMULATOR)
+-  SET(IMPORT_EXECUTABLES "IMPORTFILE-NOTFOUND" CACHE FILEPATH "Path to import_executables.cmake from a native build")
+-  INCLUDE(${IMPORT_EXECUTABLES})
+-ENDIF()
+-
+ #
+ # Setup maintainer mode options. Platform checks are
+ # not run with the warning options as to not perturb fragile checks
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb
index c800c4c56..8dba5c858 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb
@@ -1,8 +1,6 @@
 require mariadb.inc
 
-inherit qemu
-
-DEPENDS += "qemu-native bison-native boost libpcre2 curl ncurses \
+DEPENDS += "mariadb-native bison-native boost libpcre2 curl ncurses \
             zlib libaio libedit libevent libxml2 gnutls fmt lzo"
 
 PROVIDES += "mysql5 libmysqlclient"
-- 
2.25.1


