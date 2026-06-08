Return-Path: <zeming.liu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D921ECD8C92
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 02:41:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45671.1780886467167940772
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jun 2026 19:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=orcAAQJr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=06195fa49a=zeming.liu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6581MbHN3258779
	for <openembedded-devel@lists.openembedded.org>; Sun, 7 Jun 2026 19:41:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=NSME22pInhIdjtNia9Gs
	/mcj4gO2egYL7JYzSq6reVc=; b=orcAAQJrgHVoWtl8WnQK+TwppZzMUMF6v4r8
	1pF2NxNOv3rdInYHLD7LvYuEQA8lJ5CcXMfpuIyhTg/gZTcpohHjjiZrveGR63cN
	uPgD5fm80mESMLMi9Z3AWqId4YqVWrUDoQKQ3fV0UAWo53Bb0/OVM7yb5CyG+xKA
	HmIC89fBxUPw8u8Ne7NBRr1QtaNn/QXDkB3zebZ3wmG5EVugxVsv/hDV8VnXUp07
	QI6Y6u5kLbzXLtXbq8nAx+19b5wWFS5pkATHog3+evE//NzWu0tiRMzbC3dTmHO2
	l2Yasfc3PTdLBRMB7QSh6CQvdy4hnSFnKSfV+4MSSOiNrzO79Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4emk2gsqe1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jun 2026 19:41:06 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 7 Jun 2026 19:41:05 -0700
Received: from pek-lpgtest20.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 7 Jun 2026 19:41:05 -0700
From: Zeming LIU <zeming.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] Add ptest support for googletest
Date: Mon, 8 Jun 2026 10:41:04 +0800
Message-ID: <20260608024104.3167248-1-zeming.liu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=VZHH+lp9 c=1 sm=1 tr=0 ts=6a262bc2 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=NrnYaHKmP-iorIhI7WIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAyMiBTYWx0ZWRfX2G+H0aqJ+c7Z
 XtTpwj/CSbK4LEn26UpQ9WHccODJl13T+aETm7XutTrFxwaiHbB7UD64cLmai8bOTpPYUinXc/L
 z3hJZyy/z9bUOGkm2L8eMqfgW4T3xPpkrOtA6cU7gxvYH+AOZwhOp3NMCCmSroMixJbLJBxmism
 5HvshtTCdCY3tcIzabtqD6Te52ks7tbYXQlP8UM88hmnyL1We34i0MbW37i1Sga4qPRppwlEj/b
 PwBazSc8zdCWfKu/ZD1d8ueWqZpSXMnGIYtkNIhzn8COr11zy/O6FlAPK6nynpzNqoynvayNBvK
 B3gWwxFXimJTCmTmPqyt71/LSab+eIsPyNcNb0Ker2b8k75sEfHVeRIv32nH7uwwdb3DKBnQOpd
 X72xvQWELldTXoF3Ljsqded4XvSY10U/nXaArabBRjCUuYE4JNsIR/KiV01ZfUKe6ouRLqdnpL6
 NwDuk5lKrFNS/oQAC3A==
X-Proofpoint-GUID: x11f0kAo8LG9vOwq3hK2-O7tDnXVsEBH
X-Proofpoint-ORIG-GUID: x11f0kAo8LG9vOwq3hK2-O7tDnXVsEBH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080022
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 02:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127419

Test result:
root@qemux86-64:~# ptest-runner googletest
START: ptest-runner
2026-06-08T02:33
BEGIN: /usr/lib/googletest/ptest
PASS: gmock-actions_test
PASS: gmock-cardinalities_test
PASS: gmock_ex_test
PASS: gmock-function-mocker_test
PASS: gmock-internal-utils_test
PASS: gmock-matchers-arithmetic_test
PASS: gmock-matchers-comparisons_test
PASS: gmock-matchers-containers_test
PASS: gmock-matchers-misc_test
PASS: gmock-more-actions_test
PASS: gmock-nice-strict_test
PASS: gmock-port_test
PASS: gmock-spec-builders_test
PASS: gmock_link_test
PASS: gmock_test
PASS: gmock_stress_test
PASS: gmock-more-actions_no_exception_test
PASS: gmock_no_rtti_test
PASS: googletest-death-test-test
PASS: gtest_environment_test
PASS: googletest-filepath-test
PASS: googletest-listener-test
PASS: gtest_main_unittest
PASS: googletest-message-test
PASS: gtest_no_test_unittest
PASS: googletest-options-test
PASS: googletest-param-test-test
PASS: googletest-port-test
PASS: gtest_pred_impl_unittest
PASS: gtest_premature_exit_test
PASS: googletest-printers-test
PASS: gtest_prod_test
PASS: gtest_repeat_test
PASS: gtest_sole_header_test
PASS: gtest_stress_test
PASS: googletest-test-part-test
PASS: gtest_throw_on_failure_ex_test
PASS: gtest-typed-test_test
PASS: gtest_unittest
PASS: gtest-unittest-api_test
PASS: gtest_skip_in_environment_setup_test
PASS: gtest_skip_test
PASS: gtest-death-test_ex_nocatch_test
PASS: gtest-death-test_ex_catch_test
PASS: gtest_no_rtti_unittest
PASS: googletest-break-on-failure-unittest
PASS: gtest_skip_check_output_test
PASS: gtest_skip_environment_check_output_test
PASS: googletest-catch-exceptions-test
PASS: googletest-color-test
PASS: googletest-env-var-test
PASS: googletest-filter-unittest
PASS: gtest_help_test
PASS: googletest-list-tests-unittest
PASS: googletest-output-test
PASS: googletest-shuffle-test
PASS: googletest-throw-on-failure-test
PASS: googletest-uninitialized-test
PASS: gtest_list_output_unittest
PASS: gtest_xml_outfiles_test
PASS: googletest-json-outfiles-test
PASS: gtest_xml_output_unittest
PASS: googletest-json-output-unittest
DURATION: 16
END: /usr/lib/googletest/ptest
2026-06-08T02:34
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Zeming LIU <zeming.liu@windriver.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 .../recipes-test/googletest/files/run-ptest   |  3 ++
 .../googletest/googletest_1.17.0.bb           | 44 ++++++++++++++++++-
 3 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-test/googletest/files/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index f43bdf3c70..0467d1f424 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -23,6 +23,7 @@ PTESTS_FAST_META_OE = "\
     function2 \
     fwupd \
     gcab \
+    googletest \
     hunspell \
     imagemagick \
     jemalloc \
diff --git a/meta-oe/recipes-test/googletest/files/run-ptest b/meta-oe/recipes-test/googletest/files/run-ptest
new file mode 100644
index 0000000000..da46c68550
--- /dev/null
+++ b/meta-oe/recipes-test/googletest/files/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+ctest | sed -u 's/\*\*\*/   /g' | awk '/Test +#/{gsub(/Passed/,"PASS"); gsub(/Failed/,"FAIL"); gsub(/Skipped/,"SKIP"); print $6": "$4; fflush();}'
diff --git a/meta-oe/recipes-test/googletest/googletest_1.17.0.bb b/meta-oe/recipes-test/googletest/googletest_1.17.0.bb
index c8ed80053d..4d5340b994 100644
--- a/meta-oe/recipes-test/googletest/googletest_1.17.0.bb
+++ b/meta-oe/recipes-test/googletest/googletest_1.17.0.bb
@@ -7,15 +7,20 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
 PROVIDES += "gmock gtest"
 
 SRC_URI = "git://github.com/google/googletest.git;branch=v1.17.x;protocol=https \
+           file://run-ptest \
           "
 SRCREV = "52eb8108c5bdec04579160ae17225d66034bd723"
 
-inherit cmake pkgconfig
+inherit cmake pkgconfig ptest
 
 # allow for shared libraries, but do not default to them
 #
 PACKAGECONFIG[shared] = "-DBUILD_SHARED_LIBS=ON,-DBUILD_SHARED_LIBS=OFF,,"
 
+EXTRA_OECMAKE += "${@bb.utils.contains('PTEST_ENABLED', '1', '-Dgtest_build_tests=ON -Dgmock_build_tests=ON', '', d)}"
+
+DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'rsync-native', '', d)}"
+
 CXXFLAGS:append = " -fPIC"
 
 ALLOW_EMPTY:${PN} = "1"
@@ -35,3 +40,40 @@ do_configure:prepend() {
     # there isn't python in HOSTTOOLS so "env python" fails
     sed -i 's@^#!/usr/bin/env python$@#!/usr/bin/env python3@g' ${S}/googlemock/test/*py ${S}/googletest/test/*py
 }
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/lib
+
+    ptest_libs="libshared_gmock_main.so \
+                libgtest_dll.so \
+                libgmock_main_no_exception.so \
+                libgtest_main_no_exception.so \
+                libgtest_no_exception.so \
+                libgtest_main_no_rtti.so \
+               "
+    for i in ${ptest_libs}; do
+        [ -f ${B}/lib/${i} ] && install -m 0755 ${B}/lib/${i} ${D}${PTEST_PATH}/lib
+    done
+
+    rsync -a ${B}/googletest ${D}${PTEST_PATH} \
+          --exclude CMakeFiles \
+          --exclude cmake_install.cmake \
+          --exclude Makefile \
+          --exclude generated
+    install -d ${D}${PTEST_PATH}/googletest/test
+    cp ${S}/googletest/test/*.py ${D}${PTEST_PATH}/googletest/test
+    cp ${S}/googletest/test/*.txt ${D}${PTEST_PATH}/googletest/test
+    rsync -a ${B}/googlemock ${D}${PTEST_PATH} \
+          --exclude CMakeFiles \
+          --exclude cmake_install.cmake \
+          --exclude Makefile \
+          --exclude generated
+    cp ${B}/CTestTestfile.cmake ${D}${PTEST_PATH}
+    sed -i -e 's#${B}#${PTEST_PATH}#g' `find ${D}${PTEST_PATH} -name CTestTestfile.cmake`
+    sed -i -e 's#${S}#${PTEST_PATH}#g' `find ${D}${PTEST_PATH} -name CTestTestfile.cmake`
+    sed -i -e 's#${RECIPE_SYSROOT_NATIVE}##g' `find ${D}${PTEST_PATH} -name CTestTestfile.cmake`
+    sed -i -e 's#${PYTHON}#/usr/bin/python3#g' `find ${D}${PTEST_PATH} -name CTestTestfile.cmake`
+    sed -i -e 's#${WORKDIR}##g' `find ${D}${PTEST_PATH} -name CTestTestfile.cmake`
+}
+
+RDEPENDS:${PN}-ptest += "cmake sed python3-datetime python3-difflib python3-json python3-xml python3-misc python3-unittest"
-- 
2.34.1


