Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80A9CF6495
	for <webhook@archiver.kernel.org>; Sun, 29 Sep 2024 08:11:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.28925.1727597476777509001
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Sep 2024 01:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=00029a088b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48T796Yo010029
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Sep 2024 08:11:16 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41x710h57k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Sep 2024 08:11:15 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 29 Sep 2024 01:11:14 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 29 Sep 2024 01:11:13 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] rocksdb: Add ptest support
Date: Sun, 29 Sep 2024 16:11:12 +0800
Message-ID: <20240929081112.3517541-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: BASvWa4q3GI1KI0t0JdKEqypgbydiQ1s
X-Proofpoint-ORIG-GUID: BASvWa4q3GI1KI0t0JdKEqypgbydiQ1s
X-Authority-Analysis: v=2.4 cv=efNvfKEH c=1 sm=1 tr=0 ts=66f90ba3 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=5JFTKrNOCoxVx0i3B3gA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-29_05,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409290060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Sep 2024 08:11:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112550

From: Mingli Yu <mingli.yu@windriver.com>

 # ./run-ptest
PASS: agg_merge_test
PASS: cache_test
PASS: db_basic_test
PASS: env_basic_test
PASS: testutil_test

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 ...ake-the-test-discovery-occur-on-targ.patch | 42 +++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/files/run-ptest   | 12 ++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb  | 21 +++++++++-
 4 files changed, 74 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-CMakeLists.txt-Make-the-test-discovery-occur-on-targ.patch
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 9a5b07d88..ff48e9d14 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -54,6 +54,7 @@ PTESTS_SLOW_META_OE = "\
     fftw \
     libusb-compat \
     rsyslog \
+    rocksdb \
     mariadb \
     poco \
     re2 \
diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-CMakeLists.txt-Make-the-test-discovery-occur-on-targ.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-CMakeLists.txt-Make-the-test-discovery-occur-on-targ.patch
new file mode 100644
index 000000000..b0a949fe3
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-CMakeLists.txt-Make-the-test-discovery-occur-on-targ.patch
@@ -0,0 +1,42 @@
+From 9abf6cd09c60f0be9a85c055dfdf43698f057f73 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 25 Sep 2024 13:47:37 +0800
+Subject: [PATCH] CMakeLists.txt: Make the test discovery occur on target
+
+Set DISCOVERY_MODE to PRE_TEST to delay test discovery until just
+prior to test execution on the target to fix the build failure as
+the default POST_BUILD behavior is not desirable in cross-compiling
+env.
+
+/build/tmp/work/core2-64-wrs-linux/rocksdb/9.0.0/build/env_basic_test: error while loading shared libraries: libgflags.so.2.2: cannot open shared object file: No such file or directory
+CMake Error at /build/tmp/work/core2-64-wrs-linux/rocksdb/9.0.0/recipe-sysroot-native/usr/share/cmake-3.30/Modules/GoogleTestAddTests.cmake:112 (message):
+  Error running test executable.
+
+    Path: '/build/tmp/work/core2-64-wrs-linux/rocksdb/9.0.0/build/env_basic_test'
+    Working directory: '/build/tmp/work/core2-64-wrs-linux/rocksdb/9.0.0/build'
+    Result: 127
+    Output:
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 403ad1243..f34397798 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1502,7 +1502,7 @@ if(WITH_TESTS)
+       )
+       target_link_libraries(${exename}${ARTIFACT_SUFFIX} testutillib${ARTIFACT_SUFFIX} testharness gtest ${THIRDPARTY_LIBS} ${ROCKSDB_LIB})
+       if(NOT "${exename}" MATCHES "db_sanity_test")
+-        gtest_discover_tests(${exename} DISCOVERY_TIMEOUT 120)
++        gtest_discover_tests(${exename} DISCOVERY_TIMEOUT 120 DISCOVERY_MODE PRE_TEST)
+         add_dependencies(rocksdb_check ${exename}${ARTIFACT_SUFFIX})
+       endif()
+   endforeach(sourcefile ${TESTS})
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-dbs/rocksdb/files/run-ptest b/meta-oe/recipes-dbs/rocksdb/files/run-ptest
new file mode 100644
index 000000000..45406fdfa
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+ptestdir=$(dirname "$(readlink -f "$0")")
+cd "$ptestdir"/tests || exit
+
+for test in *_test; do
+    if ./${test} >/dev/null 2>&1; then
+        echo "PASS: ${test}"
+    else
+        echo "FAIL: ${test}"
+    fi
+done
+
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
index fae54fdba..57d163bfc 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
@@ -18,6 +18,8 @@ SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH};protocol=htt
            file://0006-Implement-timer-for-arm-v6.patch \
            file://0007-Fix-declaration-scope-of-LE_LOAD32-in-crc32c.patch \
            file://static_library_as_option.patch \
+           file://0001-CMakeLists.txt-Make-the-test-discovery-occur-on-targ.patch \
+           file://run-ptest \
           "
 
 SRC_URI:append:riscv32 = " file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch"
@@ -27,7 +29,7 @@ SRC_URI:remove:toolchain-clang:riscv32 = "file://0001-replace-old-sync-with-new-
 
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit cmake ptest
 
 PACKAGECONFIG ??= "bzip2 zlib lz4 gflags"
 PACKAGECONFIG[bzip2] = "-DWITH_BZ2=ON,-DWITH_BZ2=OFF,bzip2"
@@ -40,7 +42,7 @@ PACKAGECONFIG[gflags] = "-DWITH_GFLAGS=ON,-DWITH_GFLAGS=OFF,gflags"
 # Tools and tests currently don't compile on armv5 so we disable them
 EXTRA_OECMAKE = "\
     -DPORTABLE=ON \
-    -DWITH_TESTS=OFF \
+    -DWITH_TESTS=${@bb.utils.contains("DISTRO_FEATURES", "ptest", "ON", "OFF", d)} \
     -DWITH_BENCHMARK_TOOLS=OFF \
     -DWITH_TOOLS=OFF \
     -DFAIL_ON_WARNINGS=OFF \
@@ -54,6 +56,21 @@ do_install:append() {
     sed -i "s#${RECIPE_SYSROOT}##g" ${D}${libdir}/cmake/rocksdb/RocksDBTargets.cmake
 }
 
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    # only cover the basic test as all the tests need to take about 6 hours
+    # time ./run-ptest
+    # real    356m32.956s
+    # user    252m32.004s
+    # sys 178m50.246s
+    install -m 0755 ${B}/env_basic_test ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/db_basic_test ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/agg_merge_test ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/testutil_test ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/cache_test ${D}${PTEST_PATH}/tests/
+}
+
 # Need toku_time_now() implemented for ppc/musl
 # see utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
 COMPATIBLE_HOST:libc-musl:powerpc = "null"
+COMPATIBLE_HOST:armv5 = 'null'
-- 
2.34.1


