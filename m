Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF50C36005
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 08:00:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.42816.1745827042314841147
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 00:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=621356262f=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S5kAPW015836
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 07:57:21 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq1apdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 07:57:21 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 28 Apr 2025 00:57:20 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 28 Apr 2025 00:57:19 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2] nlohmann-json: Upgrade 3.11.3 -> 3.12.0
Date: Mon, 28 Apr 2025 15:57:18 +0800
Message-ID: <20250428075718.1066078-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=KsNN2XWN c=1 sm=1 tr=0 ts=680f34e1 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=bbPXFDumAAAA:8 a=t7CeM3EgAAAA:8 a=_C9ktzeRd-OSxzL0VEoA:9 a=IHPS2YvyXuyKKQCJkhva:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: VotYL-XBP1BIyck03_9EyOLrTnq3Ur5K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA2NSBTYWx0ZWRfX2LBqlcvKwHVK 3Y7J5SDtyKqgcQbrNgvaEBmeiF4k+zyYa8wbIyGLrFjIUubfYdlm3zG3TYS5umeBR+mYaEVFIrF +P8qezm9Kncn8Vjhb0F3aQ9QMtmBXgFRUYtTmaZmGFRSm4PBx/z91Qarr1OsIPI0FMV4f55xJEn
 2G8qxqIprEGCd5T6B0QkEaR2YEXcQa7GEhR4wa1C2ctQ3RQZvea0U/Hf/rGZ5qLale/DDyH+e8s 2Bib93eZpoGH7jsd0iDslDa/5qkXeCzc5ve9xDlXw/XtyvWQTuN+z2GlOeglQ3U8DtCIG8tJc93 pZTojn2rllB253z8VnbQ2QxYVirOr9PeK/9e+CEI0WdliZx6RIr3VF1IP6hhShlWIf9Zdrd3Th2
 f2hEdOUTBouuC3yJraMjAMn0PWni8yJHKoWeQMb/njUYW09dIlTxaEXm6kVtASD/+N9+1OaG
X-Proofpoint-GUID: VotYL-XBP1BIyck03_9EyOLrTnq3Ur5K
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504280065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 08:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117190

From: Mingli Yu <mingli.yu@windriver.com>

* License-Update:
Copyright year updated to 2025

* It seems snprintf in glibc is locale-aware. And it will format
floating-point numbers according to the locale when the numeric
locale is set (e.g., de_DE).
  But in musl, snprintf does not respect locale settings for number
formatting. It will always use a period as the decimal separator
regardless of the locale set.
 So exclude TEST CASE "locale-dependent test (LC_NUMERIC=de_DE)" [1]
right now and add the case back once the issue resolved by upstream.
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
[snip]

[1] https://github.com/nlohmann/json/issues/4767

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-devtools/nlohmann-json/files/run-ptest    | 6 +++++-
 .../{nlohmann-json_3.11.3.bb => nlohmann-json_3.12.0.bb}  | 8 ++++----
 2 files changed, 9 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/nlohmann-json/{nlohmann-json_3.11.3.bb => nlohmann-json_3.12.0.bb} (82%)

diff --git a/meta-oe/recipes-devtools/nlohmann-json/files/run-ptest b/meta-oe/recipes-devtools/nlohmann-json/files/run-ptest
index 2f00267d50..d39ee6df8f 100755
--- a/meta-oe/recipes-devtools/nlohmann-json/files/run-ptest
+++ b/meta-oe/recipes-devtools/nlohmann-json/files/run-ptest
@@ -3,7 +3,11 @@
 cd tests
 for atest in test-* ; do
     rm -rf tests.log
-    ./${atest} > tests.log 2>&1
+    if [ ${atest} = "test-locale-cpp_cpp11" ]; then
+        ./${atest} --test-case-exclude="locale-dependent test (LC_NUMERIC=de_DE)" > tests.log 2>&1
+    else
+        ./${atest} > tests.log 2>&1
+    fi
     if [ $? = 0 ] ; then
         echo "PASS: ${atest}"
     else
diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.3.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
similarity index 82%
rename from meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.3.bb
rename to meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
index 194e80546e..58567a781e 100644
--- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.3.bb
+++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.12.0.bb
@@ -2,16 +2,16 @@ SUMMARY = "JSON for modern C++"
 HOMEPAGE = "https://nlohmann.github.io/json/"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=f969127d7b7ed0a8a63c2bbeae002588"
+LIC_FILES_CHKSUM = "file://LICENSE.MIT;md5=3b489645de9825cca5beeb9a7e18b6eb"
 
 CVE_PRODUCT = "json-for-modern-cpp"
 
-SRC_URI = "git://github.com/nlohmann/json.git;branch=develop;protocol=https \
+SRC_URI = "git://github.com/nlohmann/json.git;branch=master;protocol=https \
            git://github.com/nlohmann/json_test_data.git;destsuffix=git/json_test_data;name=json-test-data;branch=master;protocol=https \
            file://run-ptest \
 "
 
-SRCREV = "9cca280a4d0ccf0c08f47a99aa71d1b0e52f8d03"
+SRCREV = "55f93686c01528224f448c19128836e7df245f72"
 SRCREV_json-test-data = "a1375cea09d27cc1c4cadb8d00470375b421ac37"
 
 SRCREV_FORMAT .= "_json-test-data"
@@ -25,7 +25,7 @@ EXTRA_OECMAKE += "${@bb.utils.contains('PTEST_ENABLED', '1', '-DJSON_BuildTests=
 # nlohmann-json is a header only C++ library, so the main package will be empty.
 ALLOW_EMPTY:${PN} = "1"
 RDEPENDS:${PN}-dev = ""
-RDEPENDS:${PN}-ptest = "perl"
+RDEPENDS:${PN}-ptest = "perl locale-base-de-de"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


