Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5269CC54E49
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 06:14:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.92442.1709532871327255244
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Mar 2024 22:14:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BqlNUklz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=379381a8da=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4244QN4U013831
	for <openembedded-devel@lists.openembedded.org>; Mon, 4 Mar 2024 06:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=8fapm
	LLqpsxGlM4pJRzH2N/SjGpyxp06GsOMd3SjHPM=; b=BqlNUklzYJGnUEqtBGkKg
	RhDDlUdUvt+3f6vDodapC9KAKM5hx8Hh/q0TPzGo+Qk7BJ4u3Li7pwyrRHH0rWIg
	HVK3k0EDV0HiMuwJ4dIyIoaDmsZqxkw1K6TJG00xiw93NMaAdRAyZCXa1xrx4doQ
	9H/c0PMXIK8kbd6Icq176ynIwj8MhPSfSKvFc48G9FgaIoCx4FUswj5wPbwE/HaL
	QJ60Ixylhkkn3auRfX5BrDalTYh3frvy/8lfJU2w2wE2lOCvdYscuylJpSdPZ0nG
	yZjlVd1Mz9ztXWpqkh7WxOmNBX0wDYIa2Pg5UAxHg2VV8wqLRUqsAgUtCeFEcLzB
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wku369dcr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 04 Mar 2024 06:14:30 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 3 Mar 2024 22:14:29 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sun, 3 Mar 2024 22:14:28 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] nlohmann-json: Upgrade to 3.11.3
Date: Mon, 4 Mar 2024 14:14:27 +0800
Message-ID: <20240304061427.3252728-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: x7iHdOnYo24r2lgYst3-4ffimwvEUnFO
X-Proofpoint-GUID: x7iHdOnYo24r2lgYst3-4ffimwvEUnFO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-04_02,2024-03-01_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403040045
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Mar 2024 06:14:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109095

From: Mingli Yu <mingli.yu@windriver.com>

Remove two backported patches and the ptest output as below.
 # ./run-ptest
PASS: test-algorithms_cpp11
PASS: test-allocator_cpp11
PASS: test-alt-string_cpp11
PASS: test-assert_macro_cpp11
PASS: test-binary_formats_cpp11
PASS: test-bjdata_cpp11
PASS: test-bson_cpp11
PASS: test-byte_container_with_subtype_cpp11
PASS: test-capacity_cpp11
PASS: test-cbor_cpp11
PASS: test-class_const_iterator_cpp11
PASS: test-class_iterator_cpp11
PASS: test-class_lexer_cpp11
PASS: test-class_parser_cpp11
PASS: test-comparison_cpp11
PASS: test-comparison_cpp20
PASS: test-comparison_legacy_cpp11
PASS: test-comparison_legacy_cpp20
PASS: test-concepts_cpp11
PASS: test-constructor1_cpp11
PASS: test-constructor2_cpp11
PASS: test-convenience_cpp11
PASS: test-conversions_cpp11
PASS: test-conversions_cpp17
PASS: test-custom-base-class_cpp11
[snip]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...tors-define-missing-rebind-type-3895.patch | 61 -------------------
 ...tors2-use-std-ranges-equals-for-rang.patch | 31 ----------
 ...json_3.11.2.bb => nlohmann-json_3.11.3.bb} |  4 +-
 3 files changed, 1 insertion(+), 95 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nlohmann-json/files/0001-custom-allocators-define-missing-rebind-type-3895.patch
 delete mode 100644 meta-oe/recipes-devtools/nlohmann-json/files/0001-tests-unit-iterators2-use-std-ranges-equals-for-rang.patch
 rename meta-oe/recipes-devtools/nlohmann-json/{nlohmann-json_3.11.2.bb => nlohmann-json_3.11.3.bb} (86%)

diff --git a/meta-oe/recipes-devtools/nlohmann-json/files/0001-custom-allocators-define-missing-rebind-type-3895.patch b/meta-oe/recipes-devtools/nlohmann-json/files/0001-custom-allocators-define-missing-rebind-type-3895.patch
deleted file mode 100644
index d964586c1..000000000
--- a/meta-oe/recipes-devtools/nlohmann-json/files/0001-custom-allocators-define-missing-rebind-type-3895.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 6cec5aefc97ad219b6fd5a4132f88f7c8f6800ee Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Wed, 8 Mar 2023 11:31:56 +0000
-Subject: [PATCH] custom allocators: define missing 'rebind' type (#3895)
-
-Upstream-Status: Backport [https://github.com/nlohmann/json/commit/6cec5aefc97ad219b6fd5a4132f88f7c8f6800ee]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- tests/src/unit-allocator.cpp   | 9 +++++++++
- tests/src/unit-regression2.cpp | 9 +++++++++
- 2 files changed, 18 insertions(+)
-
-diff --git a/tests/src/unit-allocator.cpp b/tests/src/unit-allocator.cpp
-index 76e3b03f..f2e63552 100644
---- a/tests/src/unit-allocator.cpp
-+++ b/tests/src/unit-allocator.cpp
-@@ -20,11 +20,20 @@ struct bad_allocator : std::allocator<T>
- {
-     using std::allocator<T>::allocator;
- 
-+    bad_allocator() = default;
-+    template<class U> bad_allocator(const bad_allocator<U>& /*unused*/) { }
-+
-     template<class... Args>
-     void construct(T* /*unused*/, Args&& ... /*unused*/)
-     {
-         throw std::bad_alloc();
-     }
-+
-+    template <class U>
-+    struct rebind
-+    {
-+        using other = bad_allocator<U>;
-+    };
- };
- } // namespace
- 
-diff --git a/tests/src/unit-regression2.cpp b/tests/src/unit-regression2.cpp
-index 2bb9b32e..dbafb436 100644
---- a/tests/src/unit-regression2.cpp
-+++ b/tests/src/unit-regression2.cpp
-@@ -189,6 +189,15 @@ class my_allocator : public std::allocator<T>
- {
-   public:
-     using std::allocator<T>::allocator;
-+
-+    my_allocator() = default;
-+    template<class U> my_allocator(const my_allocator<U>& /*unused*/) { }
-+
-+    template <class U>
-+    struct rebind
-+    {
-+        using other = my_allocator<U>;
-+    };
- };
- 
- /////////////////////////////////////////////////////////////////////
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/nlohmann-json/files/0001-tests-unit-iterators2-use-std-ranges-equals-for-rang.patch b/meta-oe/recipes-devtools/nlohmann-json/files/0001-tests-unit-iterators2-use-std-ranges-equals-for-rang.patch
deleted file mode 100644
index 463912e4b..000000000
--- a/meta-oe/recipes-devtools/nlohmann-json/files/0001-tests-unit-iterators2-use-std-ranges-equals-for-rang.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 660d0b58565073975d6f5d94365d6cbf150a4cf8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Arsen=20Arsenovi=C4=87?= <arsen@aarsen.me>
-Date: Sun, 5 Mar 2023 14:11:22 +0100
-Subject: [PATCH] tests/unit-iterators2: use std::ranges::equals for range
- comparisons (#3950)
-
-Closes https://github.com/nlohmann/json/issues/3927
-
-Upstream-Status: Backport [https://github.com/nlohmann/json/commit/660d0b58565073975d6f5d94365d6cbf150a4cf8]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- tests/src/unit-iterators2.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/src/unit-iterators2.cpp b/tests/src/unit-iterators2.cpp
-index 27926084..72a5d9dc 100644
---- a/tests/src/unit-iterators2.cpp
-+++ b/tests/src/unit-iterators2.cpp
-@@ -943,7 +943,7 @@ TEST_CASE("iterators 2")
-                 json j_expected{5, 4, 3, 2, 1};
- 
-                 auto reversed = j | std::views::reverse;
--                CHECK(reversed == j_expected);
-+                CHECK(std::ranges::equal(reversed, j_expected));
-             }
- 
-             SECTION("transform")
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.3.bb
similarity index 86%
rename from meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
rename to meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.3.bb
index 350932388..194e80546 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.3.bb
@@ -8,12 +8,10 @@ CVE_PRODUCT = "json-for-modern-cpp"
 
 SRC_URI = "git://github.com/nlohmann/json.git;branch=develop;protocol=https \
            git://github.com/nlohmann/json_test_data.git;destsuffix=git/json_test_data;name=json-test-data;branch=master;protocol=https \
-           file://0001-custom-allocators-define-missing-rebind-type-3895.patch \
-           file://0001-tests-unit-iterators2-use-std-ranges-equals-for-rang.patch \
            file://run-ptest \
 "
 
-SRCREV = "bc889afb4c5bf1c0d8ee29ef35eaaf4c8bef8a5d"
+SRCREV = "9cca280a4d0ccf0c08f47a99aa71d1b0e52f8d03"
 SRCREV_json-test-data = "a1375cea09d27cc1c4cadb8d00470375b421ac37"
 
 SRCREV_FORMAT .= "_json-test-data"
-- 
2.25.1


