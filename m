Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ECDAC07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 05:47:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7195.1700027243986195707
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 21:47:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=swRor87W;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9683a85f5a=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AF5Z1mY023581
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 05:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=f1TN6
	Iv1nodbgAiCdW3rCvuf2cH7fy/gIwn6bI0ZiYQ=; b=swRor87WvXuNd03Lp/umi
	v6wTKZ76xPQKr1yzgMyIUSDsF8+E7kEvLCrjJDNSX0IDj8cyhwWrnN7DrS8/L8v4
	pBd+QXPahuGfIKd5OKXOgy41+jZbbx6FS/+Q+4sX5BCGKjLn2ZX/f8u9BYEEEtyV
	/tQ0LbU8VW/S9L1S+EekneE4teH61vRbd9OgbciEAkQLeSTTivUP50CIubdFRK9G
	x98Qe5JLTUXr30ZxVKV9Kn4LunYPAr62IpGwbKQFJOCOMRWlialv1TZ8N/wC/X11
	jbOTWaaVxxnJ7fYWw48ckRfCHke2syZW/OOyTbCFlow0a+5aADpQtzGuW1hK/XTe
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ua0k6bbqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 05:47:22 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 21:47:26 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 21:47:25 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][kirkstone][PATCH] nlohmann-json: Add ptest support
Date: Wed, 15 Nov 2023 13:47:20 +0800
Message-ID: <20231115054720.2285476-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: vXAJqVusS11PsJefjZgZ44d0vSRXjGCD
X-Proofpoint-ORIG-GUID: vXAJqVusS11PsJefjZgZ44d0vSRXjGCD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_04,2023-11-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=987 spamscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311150043
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 05:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106731

From: Mingli Yu <mingli.yu@windriver.com>

* Fetch the test data during do_fetch phase to avoid internet access
during test as some tests need test data.
 # ./run-ptest
PASS: test-algorithms
PASS: test-allocator
PASS: test-alt-string
PASS: test-assert_macro
PASS: test-bson
PASS: test-byte_container_with_subtype
PASS: test-capacity
PASS: test-cbor
PASS: test-class_const_iterator
PASS: test-class_iterator
PASS: test-class_lexer
PASS: test-class_parser
PASS: test-comparison
PASS: test-concepts
PASS: test-constructor1
PASS: test-constructor2
PASS: test-convenience
PASS: test-conversions
PASS: test-conversions_cpp17
PASS: test-deserialization
PASS: test-diagnostics
PASS: test-disabled_exceptions
PASS: test-element_access1
PASS: test-element_access2
PASS: test-hash
PASS: test-inspection
PASS: test-items
PASS: test-items_cpp17
PASS: test-iterators1
PASS: test-iterators2
PASS: test-json_patch
PASS: test-json_pointer
PASS: test-large_json
PASS: test-merge_patch
PASS: test-meta
PASS: test-modifiers
PASS: test-msgpack
PASS: test-noexcept
PASS: test-ordered_json
PASS: test-ordered_map
PASS: test-pointer_access
PASS: test-readme
PASS: test-reference_access
PASS: test-regression1
PASS: test-regression1_cpp17
PASS: test-regression2
PASS: test-regression2_cpp17
PASS: test-serialization
PASS: test-testsuites
PASS: test-to_chars
PASS: test-ubjson
PASS: test-udt
PASS: test-udt_macro
PASS: test-unicode1
PASS: test-unicode2
PASS: test-unicode3
PASS: test-unicode4
PASS: test-unicode5
PASS: test-user_defined_input
PASS: test-wstring

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../nlohmann-json/files/run-ptest             | 12 +++++++++++
 .../nlohmann-json/nlohmann-json_3.10.5.bb     | 20 ++++++++++++++++---
 2 files changed, 29 insertions(+), 3 deletions(-)
 create mode 100755 meta-oe/recipes-devtools/nlohmann-json/files/run-ptest

diff --git a/meta-oe/recipes-devtools/nlohmann-json/files/run-ptest b/meta-oe/recipes-devtools/nlohmann-json/files/run-ptest
new file mode 100755
index 000000000..2f00267d5
--- /dev/null
+++ b/meta-oe/recipes-devtools/nlohmann-json/files/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+cd tests
+for atest in test-* ; do
+    rm -rf tests.log
+    ./${atest} > tests.log 2>&1
+    if [ $? = 0 ] ; then
+        echo "PASS: ${atest}"
+    else
+        echo "FAIL: ${atest}"
+    fi
+done
diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb
index 7a1a7a9db..8c4594914 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.10.5.bb
@@ -7,22 +7,36 @@ LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=f969127d7b7ed0a8a63c2bbeae002588"
 CVE_PRODUCT = "json-for-modern-cpp"
 
 SRC_URI = "git://github.com/nlohmann/json.git;branch=develop;protocol=https \
-           "
+           git://github.com/nlohmann/json_test_data.git;destsuffix=git/json_test_data;name=json-test-data;branch=master;protocol=https \
+           file://run-ptest \
+"
 
 SRCREV = "4f8fba14066156b73f1189a2b8bd568bde5284c5"
+SRCREV_json-test-data = "a1375cea09d27cc1c4cadb8d00470375b421ac37"
+
+SRCREV_FORMAT = "json-test-data"
 
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit cmake ptest
 
-EXTRA_OECMAKE += "-DJSON_BuildTests=OFF"
+EXTRA_OECMAKE += "${@bb.utils.contains('PTEST_ENABLED', '1', '-DJSON_BuildTests=ON -DJSON_TestDataDirectory=${PTEST_PATH}/json_test_data', '-DJSON_BuildTests=OFF', d)}"
 
 # nlohmann-json is a header only C++ library, so the main package will be empty.
 ALLOW_EMPTY:${PN} = "1"
 RDEPENDS:${PN}-dev = ""
+RDEPENDS:${PN}-ptest = "perl"
 
 BBCLASSEXTEND = "native nativesdk"
 
+
+do_install_ptest () {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -r ${S}/json_test_data/ ${D}${PTEST_PATH}/
+    cp -r ${B}/test/test-* ${D}${PTEST_PATH}/tests
+}
+
+
 # other packages commonly reference the file directly as "json.hpp"
 # create symlink to allow this usage
 do_install:append() {
-- 
2.25.1


