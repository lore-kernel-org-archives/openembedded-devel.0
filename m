Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0743AC54E41
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 03:21:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14896.1709781670380248647
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 19:21:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=F1lNU2V/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3796958646=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42720QAH028158
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 Mar 2024 03:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=U94qtGErpCCuLF+GLMAsnA832MXhHyOKQFHCn7x9SPQ=; b=
	F1lNU2V/VutQn3zzTx6QlUkp1bPzjstDiA7oIFE8StwSN789q7pXeB9NWgc8DdwF
	ZcoX8gxjaqu7Wyn1t+n/nNH1m5VdBvUYG+IYPN1NsOT/Pl5+Zy0QWPtaQouQP9xJ
	iPPr9MWKbjv/ceNm48IlLnqgw/bxQV7qc4qdA4Qu1pFfBOK5W/VCh28XN/4VSnvx
	7PmTWr258Rw6p3cSeQIq0eBHsAgI6qMR2lh7ti0K3yZJOJdiHFukxQrylQIRCNEc
	SjnRhcj2B4iyoZWR5936OeK9klPu3/UerGXHgrn8jG6xFaZ0i4HWwbE70cbf8Si0
	tpMoM+ce/ZpP9nwpeUrsew==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wku36cnj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 03:21:09 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 19:21:08 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 19:21:07 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] re2: Upgrade 2023.03.01 -> 2024.03.01
Date: Thu, 7 Mar 2024 11:21:05 +0800
Message-ID: <20240307032105.1806173-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240307032105.1806173-1-mingli.yu@windriver.com>
References: <20240307032105.1806173-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 23PUJSc9ut1eJTRfBxgYtvIXHsvR0kTJ
X-Proofpoint-GUID: 23PUJSc9ut1eJTRfBxgYtvIXHsvR0kTJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_14,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403070020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 03:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109188

From: Mingli Yu <mingli.yu@windriver.com>

1, Add abseil-cpp, gtest and benchmark to DEPENDS to fix the below
kind configure error.

CMake Error at CMakeLists.txt:81 (find_package):
  By not providing "Findabsl.cmake" in CMAKE_MODULE_PATH this project has
  asked CMake to find a package configuration file provided by "absl", but
  CMake did not find one.

  Could not find a package configuration file provided by "absl" with any of
  the following names:

    abslConfig.cmake
    absl-config.cmake

2, Install libtesting.so to target to fix the below QA issue.
ERROR: re2-2024.03.01-r0 do_package_qa: QA Issue: /usr/lib64/re2/ptest/string_generator_test contained in package re2-ptest requires libtesting.so()(64bit), but no providers found in RDEPENDS:re2-ptest? [file-rdeps]

3, Add abseil-cpp-dev to RDEPENDS to fix the below QA issue.
ERROR: re2-2024.03.01-r0 do_package_qa: QA Issue: re2 rdepends on abseil-cpp-dev [dev-deps]

4, The ptest output as below:
 # ./run-ptest
PASS: charclass_test
PASS: compile_test
PASS: filtered_re2_test
PASS: mimics_pcre_test
PASS: parse_test
PASS: possible_match_test
PASS: re2_test
PASS: re2_arg_test
PASS: regexp_test
PASS: required_prefix_test
PASS: search_test
PASS: set_test
PASS: simplify_test
PASS: string_generator_test
PASS: dfa_test
PASS: exhaustive1_test
PASS: exhaustive2_test
PASS: exhaustive3_test
PASS: exhaustive_test
PASS: random_test

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../re2/{re2_2023.03.01.bb => re2_2024.03.01.bb}    | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/re2/{re2_2023.03.01.bb => re2_2024.03.01.bb} (62%)

diff --git a/meta-oe/recipes-support/re2/re2_2023.03.01.bb b/meta-oe/recipes-support/re2/re2_2024.03.01.bb
similarity index 62%
rename from meta-oe/recipes-support/re2/re2_2023.03.01.bb
rename to meta-oe/recipes-support/re2/re2_2024.03.01.bb
index fe210d510..192fe265f 100644
--- a/meta-oe/recipes-support/re2/re2_2023.03.01.bb
+++ b/meta-oe/recipes-support/re2/re2_2024.03.01.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/google/re2/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b5c31eb512bdf3cb11ffd5713963760"
 
-# tag 2023-03-01
-SRCREV = "241e2e430836e80f93d704d1f06cd3e7fe3100f5"
+# tag 2024-03-01
+SRCREV = "2d866a3d0753f4f4fce93cccc6c59c4b052d7db4"
 
 SRC_URI = "git://github.com/google/re2.git;branch=main;protocol=https \
            ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)} \
@@ -12,12 +12,17 @@ SRC_URI = "git://github.com/google/re2.git;branch=main;protocol=https \
 
 S = "${WORKDIR}/git"
 
+DEPENDS = "abseil-cpp ${@bb.utils.contains('PTEST_ENABLED', '1', 'gtest googlebenchmark', '', d)}"
+
 inherit cmake ptest
 RDEPENDS:${PN}-ptest += "cmake sed"
+RDEPENDS:${PN} += "abseil-cpp-dev"
+
+INSANE_SKIP:${PN} += "dev-deps"
 
 EXTRA_OECMAKE += " \
 	-DBUILD_SHARED_LIBS=ON \
-        ${@bb.utils.contains('PTEST_ENABLED', '1', '-DRE2_BUILD_TESTING=ON', '-DRE2_BUILD_TESTING=OFF', d)} \
+	${@bb.utils.contains('PTEST_ENABLED', '1', '-DRE2_BUILD_TESTING=ON', '-DRE2_BUILD_TESTING=OFF', d)} \
 "
 
 do_install_ptest () {
@@ -25,6 +30,8 @@ do_install_ptest () {
     cp -r ${B}/CTestTestfile.cmake ${D}${PTEST_PATH}
     sed -i -e 's#${B}#${PTEST_PATH}#g' `find ${D}${PTEST_PATH} -name CTestTestfile.cmake`
     sed -i -e 's#${S}#${PTEST_PATH}#g' `find ${D}${PTEST_PATH} -name CTestTestfile.cmake`
+    # ERROR: re2-2024.03.01-r0 do_package_qa: QA Issue: /usr/lib64/re2/ptest/string_generator_test contained in package re2-ptest requires libtesting.so()(64bit), but no providers found in RDEPENDS:re2-ptest? [file-rdeps]
+    cp -r ${B}/libtesting.so ${D}${PTEST_PATH}
 }
 
 # ignore .so in /usr/lib64
-- 
2.25.1


