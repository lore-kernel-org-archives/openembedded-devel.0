Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75B6C433F5
	for <webhook@archiver.kernel.org>; Sun,  9 Oct 2022 07:46:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.525.1665301606826087096
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Oct 2022 00:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=WICQHufQ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=7281c5a22f=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id
 2997j2M2008456
	for <openembedded-devel@lists.openembedded.org>; Sun, 9 Oct 2022 07:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=yncmUEOvfCazhpuMmsCVd6mG1uewDBFnQAk/9fiBxGc=;
 b=WICQHufQUV9xy2Yw0noSmajPJaLXSPG4KamZPODdbUgnb17u7HifFf7jIAvsVHuzCIZt
 T1IO8Vy9oc5QueIW4YkBXgKzoYZJL8jL+kHFWSQpuL9NA5f3f/HpTgIR/5cpahiOGwIH
 krEQjvZS7CA+JafM1dM9zcA+iaeU8ieFmNXbusy4WdgopXPgZmy+ZWM6IwyYBCE945FG
 gMdjEk5MTSh2+t4t7EcEEDQB1BEKE5Zv0Uxg3ZZa9Aah8YiHQzBvWrW0Sioc2gwlRTLk
 PgGBmfAEqyVUi+NP/DwIrf7r1Etux2p0nf8621guJF6GWPcYg5F7x88Zdtay/TfjLxkE xQ==
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com
 [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k2ybs0qy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Oct 2022 07:46:45 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 9 Oct 2022 00:46:44 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 9 Oct 2022 00:46:43 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mariadb: not use qemu to run cross-compiled binaries
Date: Sun, 9 Oct 2022 15:46:42 +0800
Message-ID: <20221009074642.2087773-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: uigIi9DNCHjYIMlLQR1tEbkbeLmQKCGx
X-Proofpoint-GUID: uigIi9DNCHjYIMlLQR1tEbkbeLmQKCGx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-07_04,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210090050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Oct 2022 07:46:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99109

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
---
 .../mysql/mariadb-native_10.8.3.bb            |  4 +-
 meta-oe/recipes-dbs/mysql/mariadb.inc         | 20 +++---
 ...Lists.txt-fix-gen_lex_hash-not-found.patch | 69 +++++++++++++++++++
 .../mysql/mariadb/cross-compiling.patch       | 34 +++++++++
 meta-oe/recipes-dbs/mysql/mariadb_10.8.3.bb   |  4 +-
 5 files changed, 116 insertions(+), 15 deletions(-)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.8.3.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.8.3.bb
index e38726d3f..17a06349b 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb-native_10.8.3.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb-native_10.8.3.bb
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
index 7bd4ac0ba..2ef0d1aa3 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -19,6 +19,8 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://ssize_t.patch \
            file://mm_malloc.patch \
            file://sys_futex.patch \
+           file://cross-compiling.patch \
+           file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
 
@@ -61,6 +63,8 @@ FILES:${PN}-setupdb = "${sysconfdir}/init.d/install_db \
                        "
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} lz4 openssl"
+EXTRA_OEMAKE = "'GEN_LEX_HASH=${STAGING_BINDIR_NATIVE}/gen_lex_hash'"
+
 PACKAGECONFIG:class-native = ""
 PACKAGECONFIG[pam] = ",-DWITHOUT_AUTH_PAM=TRUE,libpam"
 PACKAGECONFIG[valgrind] = "-DWITH_VALGRIND=TRUE,-DWITH_VALGRIND=FALSE,valgrind"
@@ -94,9 +98,9 @@ EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
                  -DINSTALL_SYSCONFDIR:PATH=${sysconfdir} \
                  -DMYSQL_DATADIR:PATH=/var/mysql \
                  -DCAT_EXECUTABLE=`which cat` \
+                 -DSTACK_DIRECTION=1 \
                  -DCMAKE_AR:FILEPATH=${AR}"
 
-EXTRA_OECMAKE:prepend:class-target = "-DCMAKE_CROSSCOMPILING_EMULATOR=${WORKDIR}/qemuwrapper "
 
 # With Ninja it fails with:
 # make: *** No rule to make target `install'.  Stop.
@@ -120,18 +124,12 @@ do_generate_toolchain_file:append:class-native () {
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
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.8.3.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.8.3.bb
index 20bb5fc1f..87faabfa2 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb_10.8.3.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb_10.8.3.bb
@@ -1,8 +1,6 @@
 require mariadb.inc
 
-inherit qemu
-
-DEPENDS += "qemu-native bison-native boost libpcre2 curl ncurses \
+DEPENDS += "mariadb-native bison-native boost libpcre2 curl ncurses \
             zlib libaio libedit libevent libxml2 gnutls fmt lzo zstd"
 
 PROVIDES += "mysql5 libmysqlclient"
-- 
2.25.1


