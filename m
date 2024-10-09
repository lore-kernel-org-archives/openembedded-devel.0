Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A48CF0431
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 02:05:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6176.1728439534535391673
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Oct 2024 19:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=00128846ac=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4990Z2iW029332
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Oct 2024 02:05:33 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 422ve8uxb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 02:05:33 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 19:05:32 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 19:05:31 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][kirkstone][PATCH] rocksdb: Add ptest support
Date: Wed, 9 Oct 2024 10:05:30 +0800
Message-ID: <20241009020530.3661267-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=CPp4XgrD c=1 sm=1 tr=0 ts=6705e4ed cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=DAUX931o1VcA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=U4igMV0RIKkNl1ilDZAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 5okXzSp_4QZFnrTAYg0cZ6tRohxXhwM5
X-Proofpoint-GUID: 5okXzSp_4QZFnrTAYg0cZ6tRohxXhwM5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_01,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 impostorscore=0
 suspectscore=0 phishscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2409260000
 definitions=main-2410090012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 02:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112722

From: Mingli Yu <mingli.yu@windriver.com>

 # ./run-ptest
PASS: arena_test
PASS: cache_test
PASS: db_basic_test
PASS: env_basic_test
PASS: testutil_test

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-dbs/rocksdb/files/run-ptest   | 12 ++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb | 19 +++++++++++++++++--
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/run-ptest

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
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
index 2ad2d38a5..8164f856e 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH};protocol=htt
            file://ppc64.patch \
            file://mips.patch \
            file://arm.patch \
+           file://run-ptest \
           "
 
 SRC_URI:append:riscv32 = " file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch"
@@ -27,7 +28,7 @@ SRC_URI:remove:toolchain-clang:riscv32 = "file://0001-replace-old-sync-with-new-
 
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit cmake ptest
 
 PACKAGECONFIG ??= "bzip2 zlib lz4 gflags"
 PACKAGECONFIG[bzip2] = "-DWITH_BZ2=ON,-DWITH_BZ2=OFF,bzip2"
@@ -40,7 +41,7 @@ PACKAGECONFIG[gflags] = "-DWITH_GFLAGS=ON,-DWITH_GFLAGS=OFF,gflags"
 # Tools and tests currently don't compile on armv5 so we disable them
 EXTRA_OECMAKE = "\
     -DPORTABLE=ON \
-    -DWITH_TESTS=OFF \
+    -DWITH_TESTS=${@bb.utils.contains("DISTRO_FEATURES", "ptest", "ON", "OFF", d)} \
     -DWITH_BENCHMARK_TOOLS=OFF \
     -DWITH_TOOLS=OFF \
     -DFAIL_ON_WARNINGS=OFF \
@@ -52,7 +53,21 @@ do_install:append() {
 }
 
 LDFLAGS:append:riscv64 = " -pthread"
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    # only cover the basic test as all the tests need to take about 6 hours
+    # time ./run-ptest
+    # real    356m32.956s
+    # user    252m32.004s
+    # sys 178m50.246s
+    install -m 0755 ${B}/env_basic_test ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/db_basic_test ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/arena_test ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/testutil_test ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/cache_test ${D}${PTEST_PATH}/tests/
+}
 
 # Need toku_time_now() implemented for ppc/musl
 # see utilities/transactions/lock/range/range_tree/lib/portability/toku_time.h
 COMPATIBLE_HOST:libc-musl:powerpc = "null"
+COMPATIBLE_HOST:armv5 = 'null'
-- 
2.34.1


