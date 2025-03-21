Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CDEC35FF3
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 06:20:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15101.1742538049417118768
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 23:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51750190cc=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L5vNq7004034
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 06:20:48 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d0h96vct-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 06:20:48 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 20 Mar 2025 23:20:47 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 20 Mar 2025 23:20:47 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] minizip-ng: Add ptest support
Date: Fri, 21 Mar 2025 14:20:45 +0800
Message-ID: <20250321062045.4022628-2-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250321062045.4022628-1-mingli.yu@eng.windriver.com>
References: <20250321062045.4022628-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: kal94ZZQCied5wMxCwAh4XnFuzsEq4cr
X-Authority-Analysis: v=2.4 cv=ROOzH5i+ c=1 sm=1 tr=0 ts=67dd0540 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=L8Ve_Kb_qJm9cpV1tHEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: kal94ZZQCied5wMxCwAh4XnFuzsEq4cr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_02,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503210044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 06:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116165

From: Mingli Yu <mingli.yu@windriver.com>

 # ./run-ptest
[==========] Running 55 tests from 6 test suites.
[----------] Global test environment set-up.
[----------] 22 tests from crypt
PASS:  crypt.rand
PASS:  crypt.sha1
PASS:  crypt.sha224
PASS:  crypt.sha256
PASS:  crypt.sha384
PASS:  crypt.sha512
PASS:  crypt.aes128
PASS:  crypt.aes128_cbc
PASS:  crypt.aes128_gcm
PASS:  crypt.aes194
PASS:  crypt.aes256
PASS:  crypt.hmac_sha1
PASS:  crypt.hmac_sha1_short_password
PASS:  crypt.hmac_sha256
PASS:  crypt.pbkdf2
PASS:  crypt.pbkdf2_long_odd_password
PASS:  crypt.pbkdf2_short_password
PASS:  crypt.pbkdf2_rfc6070_v1
PASS:  crypt.pbkdf2_rfc6070_v2
PASS:  crypt.pbkdf2_rfc6070_v3
PASS:  crypt.pbkdf2_rfc6070_v4
PASS:  crypt.pbkdf2_rfc6070_v5
[----------] 1 test from os
PASS:  os.utf8_unicode_string
[----------] 2 tests from encrypt
PASS:  encrypt.pkcrypt
PASS:  encrypt.aes
[----------] 2 tests from stream
bzip compressed from 877 to 505
bzip uncompressed from 505 to 877
PASS:  stream.bzip
lzma compressed from 877 to 526
lzma uncompressed from 526 to 877
PASS:  stream.lzma
[----------] 20 tests from os/path_resolve
PASS:  os/path_resolve.os/0
PASS:  os/path_resolve.os/1
PASS:  os/path_resolve.os/2
PASS:  os/path_resolve.os/3
PASS:  os/path_resolve.os/4
PASS:  os/path_resolve.os/5
PASS:  os/path_resolve.os/6
PASS:  os/path_resolve.os/7
PASS:  os/path_resolve.os/8
PASS:  os/path_resolve.os/9
PASS:  os/path_resolve.os/10
PASS:  os/path_resolve.os/11
PASS:  os/path_resolve.os/12
PASS:  os/path_resolve.os/13
PASS:  os/path_resolve.os/14
PASS:  os/path_resolve.os/15
PASS:  os/path_resolve.os/16
PASS:  os/path_resolve.os/17
PASS:  os/path_resolve.os/18
PASS:  os/path_resolve.os/19
[----------] 8 tests from stream/stream_find
PASS:  stream/stream_find.find/0
PASS:  stream/stream_find.find/1
PASS:  stream/stream_find.find/2
PASS:  stream/stream_find.find/3
PASS:  stream/stream_find.find/4
PASS:  stream/stream_find.find/5
PASS:  stream/stream_find.find/6
PASS:  stream/stream_find.find/7
[----------] Global test environment tear-down
[==========] 55 tests from 6 test suites ran.
[  PASSED  ] 55 tests.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../recipes-core/minizip-ng/minizip-ng/run-ptest |  3 +++
 .../recipes-core/minizip-ng/minizip-ng_4.0.8.bb  | 16 +++++++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-core/minizip-ng/minizip-ng/run-ptest

diff --git a/meta-oe/recipes-core/minizip-ng/minizip-ng/run-ptest b/meta-oe/recipes-core/minizip-ng/minizip-ng/run-ptest
new file mode 100644
index 0000000000..9c2dc81e35
--- /dev/null
+++ b/meta-oe/recipes-core/minizip-ng/minizip-ng/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+cd tests && ./gtest_minizip --gtest_print_time=0 | sed -E  '/^\[ RUN/d ; s/\[       OK \]/PASS: / ; s/\[ DISABLED \]/SKIP: / ; s/\[ FAILED \]/FAIL: /'
diff --git a/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb b/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
index 19dc16cb67..ffc46a2f06 100644
--- a/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
+++ b/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
@@ -6,7 +6,9 @@ SECTION = "libs"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36964f044224efeedd694983c34e716f"
 
-SRC_URI = "git://github.com/zlib-ng/minizip-ng.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/zlib-ng/minizip-ng.git;protocol=https;branch=master \
+           file://run-ptest \
+"
 
 SRCREV = "55db144e03027b43263e5ebcb599bf0878ba58de"
 
@@ -14,15 +16,16 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "xz openssl bzip2"
 
-inherit cmake pkgconfig
+inherit cmake pkgconfig ptest
 
 EXTRA_OECMAKE = "-DMZ_FORCE_FETCH_LIBS=OFF \
                  -DBUILD_SHARED_LIBS=ON \
 "
 
-PACKAGECONFIG ??= "zlib"
+PACKAGECONFIG ??= "zlib ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'test', '', d)}"
 PACKAGECONFIG[zlib] = "-DMZ_ZLIB=ON,-DMZ_ZLIB=OFF, zlib"
 PACKAGECONFIG[zlib-ng] = "-DMZ_ZLIB=ON,-DMZ_ZLIB=OFF, zlib-ng"
+PACKAGECONFIG[test] = "-DMZ_BUILD_TESTS=ON -DMZ_BUILD_UNIT_TESTS=ON, -DMZ_BUILD_TESTS=OFF -DMZ_BUILD_UNIT_TESTS=OFF, googletest"
 
 
 do_install:append () {
@@ -30,3 +33,10 @@ do_install:append () {
     sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/minizip/minizip.cmake
 }
 
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp ${B}/test/gtest_minizip ${D}${PTEST_PATH}/tests
+    # encrypt and stream test need the LICENSE file
+    cp ${S}/LICENSE ${D}${PTEST_PATH}/tests
+}
+
-- 
2.34.1


