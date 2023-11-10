Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C25CBC4167D
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 11:52:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.25665.1699617164104803669
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Nov 2023 03:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iqiXAF20;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96782874e7=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AABf3rR010455
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 03:52:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=L4+Nz
	qJZl+n5aC3mIrZgyYCNiPySYds6nro5Ay/y6Qs=; b=iqiXAF20keGZEoTYl+dZd
	6tsngxLLi7GA2JANzOkANdqUTo+2KWCYpgybEBWbB0TVGwaFdRXOWv773tNbLw6H
	OS8HqJ5uec13QkUH9OF5pIfd1RPEECsukSesdBPwYe2poZuSSB/uC7x9FAokuTgq
	kghWxQ+ucTnEtbj2UK9BcLVWDhDvKRacALmhtydMu3YggTNF2FlJK8hJ03Vcha5h
	MeuoTfZL0REHxVMeCTvIqBEPd5brwIQ/mo62yv8cy4C9PjwLeA3EbIAfmDU6koji
	7ywge1/OK19hSibMJ8dW/74iPTVTMKEOAvbuajqVEiT4qBdLimB7U5rwJ0g/sljC
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w2t30qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 03:52:43 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 10 Nov 2023 03:52:46 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Fri, 10 Nov 2023 03:52:45 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2 1/2] nlohmann-json: Add ptest support
Date: Fri, 10 Nov 2023 19:52:40 +0800
Message-ID: <20231110115241.3613778-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: FXyfgphzE8-1ciNx5eOs2bKlD6x5Qx5k
X-Proofpoint-ORIG-GUID: FXyfgphzE8-1ciNx5eOs2bKlD6x5Qx5k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_08,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 phishscore=0 bulkscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311100097
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 11:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106543

From: Mingli Yu <mingli.yu@windriver.com>

* Backport 2 patches [1] [2] to fix the build failure under tests dir.

* Fetch the test data during do_fetch phase to avoid internet access
during test as some tests need test data.
 # ./run-ptest
PASS: test-algorithms_cpp11
PASS: test-allocator_cpp11
PASS: test-alt-string_cpp11
PASS: test-assert_macro_cpp11
PASS: test-binary_formats_cpp11
[snip]
PASS: test-unicode5_cpp11
PASS: test-user_defined_input_cpp11
PASS: test-windows_h_cpp11
PASS: test-wstring_cpp11

[1] https://github.com/nlohmann/json/commit/6cec5aefc97ad219b6fd5a4132f88f7c8f6800ee
[2] https://github.com/nlohmann/json/commit/660d0b58565073975d6f5d94365d6cbf150a4cf8

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...tors-define-missing-rebind-type-3895.patch | 61 +++++++++++++++++++
 ...tors2-use-std-ranges-equals-for-rang.patch | 31 ++++++++++
 .../nlohmann-json/files/run-ptest             | 12 ++++
 .../nlohmann-json/nlohmann-json_3.11.2.bb     | 22 ++++++-
 4 files changed, 123 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/nlohmann-json/files/0001-custom-allocators-define-missing-rebind-type-3895.patch
 create mode 100644 meta-oe/recipes-devtools/nlohmann-json/files/0001-tests-unit-iterators2-use-std-ranges-equals-for-rang.patch
 create mode 100755 meta-oe/recipes-devtools/nlohmann-json/files/run-ptest

diff --git a/meta-oe/recipes-devtools/nlohmann-json/files/0001-custom-allocators-define-missing-rebind-type-3895.patch b/meta-oe/recipes-devtools/nlohmann-json/files/0001-custom-allocators-define-missing-rebind-type-3895.patch
new file mode 100644
index 000000000..d964586c1
--- /dev/null
+++ b/meta-oe/recipes-devtools/nlohmann-json/files/0001-custom-allocators-define-missing-rebind-type-3895.patch
@@ -0,0 +1,61 @@
+From 6cec5aefc97ad219b6fd5a4132f88f7c8f6800ee Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Wed, 8 Mar 2023 11:31:56 +0000
+Subject: [PATCH] custom allocators: define missing 'rebind' type (#3895)
+
+Upstream-Status: Backport [https://github.com/nlohmann/json/commit/6cec5aefc97ad219b6fd5a4132f88f7c8f6800ee]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tests/src/unit-allocator.cpp   | 9 +++++++++
+ tests/src/unit-regression2.cpp | 9 +++++++++
+ 2 files changed, 18 insertions(+)
+
+diff --git a/tests/src/unit-allocator.cpp b/tests/src/unit-allocator.cpp
+index 76e3b03f..f2e63552 100644
+--- a/tests/src/unit-allocator.cpp
++++ b/tests/src/unit-allocator.cpp
+@@ -20,11 +20,20 @@ struct bad_allocator : std::allocator<T>
+ {
+     using std::allocator<T>::allocator;
+ 
++    bad_allocator() = default;
++    template<class U> bad_allocator(const bad_allocator<U>& /*unused*/) { }
++
+     template<class... Args>
+     void construct(T* /*unused*/, Args&& ... /*unused*/)
+     {
+         throw std::bad_alloc();
+     }
++
++    template <class U>
++    struct rebind
++    {
++        using other = bad_allocator<U>;
++    };
+ };
+ } // namespace
+ 
+diff --git a/tests/src/unit-regression2.cpp b/tests/src/unit-regression2.cpp
+index 2bb9b32e..dbafb436 100644
+--- a/tests/src/unit-regression2.cpp
++++ b/tests/src/unit-regression2.cpp
+@@ -189,6 +189,15 @@ class my_allocator : public std::allocator<T>
+ {
+   public:
+     using std::allocator<T>::allocator;
++
++    my_allocator() = default;
++    template<class U> my_allocator(const my_allocator<U>& /*unused*/) { }
++
++    template <class U>
++    struct rebind
++    {
++        using other = my_allocator<U>;
++    };
+ };
+ 
+ /////////////////////////////////////////////////////////////////////
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/nlohmann-json/files/0001-tests-unit-iterators2-use-std-ranges-equals-for-rang.patch b/meta-oe/recipes-devtools/nlohmann-json/files/0001-tests-unit-iterators2-use-std-ranges-equals-for-rang.patch
new file mode 100644
index 000000000..463912e4b
--- /dev/null
+++ b/meta-oe/recipes-devtools/nlohmann-json/files/0001-tests-unit-iterators2-use-std-ranges-equals-for-rang.patch
@@ -0,0 +1,31 @@
+From 660d0b58565073975d6f5d94365d6cbf150a4cf8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Arsen=20Arsenovi=C4=87?= <arsen@aarsen.me>
+Date: Sun, 5 Mar 2023 14:11:22 +0100
+Subject: [PATCH] tests/unit-iterators2: use std::ranges::equals for range
+ comparisons (#3950)
+
+Closes https://github.com/nlohmann/json/issues/3927
+
+Upstream-Status: Backport [https://github.com/nlohmann/json/commit/660d0b58565073975d6f5d94365d6cbf150a4cf8]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tests/src/unit-iterators2.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/src/unit-iterators2.cpp b/tests/src/unit-iterators2.cpp
+index 27926084..72a5d9dc 100644
+--- a/tests/src/unit-iterators2.cpp
++++ b/tests/src/unit-iterators2.cpp
+@@ -943,7 +943,7 @@ TEST_CASE("iterators 2")
+                 json j_expected{5, 4, 3, 2, 1};
+ 
+                 auto reversed = j | std::views::reverse;
+-                CHECK(reversed == j_expected);
++                CHECK(std::ranges::equal(reversed, j_expected));
+             }
+ 
+             SECTION("transform")
+-- 
+2.25.1
+
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
diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
index 74e40942a..694d632cb 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
@@ -7,22 +7,38 @@ LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=f969127d7b7ed0a8a63c2bbeae002588"
 CVE_PRODUCT = "json-for-modern-cpp"
 
 SRC_URI = "git://github.com/nlohmann/json.git;branch=develop;protocol=https \
-           "
+           git://github.com/nlohmann/json_test_data.git;destsuffix=git/json_test_data;name=json-test-data;branch=master;protocol=https \
+           file://0001-custom-allocators-define-missing-rebind-type-3895.patch \
+           file://0001-tests-unit-iterators2-use-std-ranges-equals-for-rang.patch \
+           file://run-ptest \
+"
 
 SRCREV = "bc889afb4c5bf1c0d8ee29ef35eaaf4c8bef8a5d"
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
+    cp -r ${B}/tests/test-* ${D}${PTEST_PATH}/tests
+}
+
+
 # other packages commonly reference the file directly as "json.hpp"
 # create symlink to allow this usage
 do_install:append() {
-- 
2.25.1


