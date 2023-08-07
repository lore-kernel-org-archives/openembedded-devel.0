Return-Path: <chi.xu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F242C001DB
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 07:37:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.29366.1691393864938653133
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Aug 2023 00:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=C5cs9/us;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7583d95a37=chi.xu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3776fwdB012061
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Aug 2023 00:37:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=saTah
	SLBR/YzKe3x8kV79vkYK5qroGlDeOoy85c78fY=; b=C5cs9/usuF6kSMOsh0jub
	X+go/3SAs+Go1PW07D8KGfwdPDV7QWf2MIrp8oG5r3NCGLV14of88QzK/oaEr4eG
	LmZWg7a0q6+bBfQG7r0ewl7qGWzacdOwSienLsuuiG0MMJUnWaBCVVeimOCzWBTN
	teZrz1XLP3v9AXeCGk4kuVuCo6uTag7PHtooaLA5Asuq7Zf7gff+qHD7i66qSpS5
	Wf1/7S/acjPJCBBPop+7eHxmVY2fqgMaso6qMRqIX0k6bdRnEJ3vUvxbSAFoB/Cl
	hzMu0dNePqiangl5c0Q8h3v7opk8SiJ0J+fqFHtc1Qhr9mIYbJSUxfd1vgqBRHQc
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s9hq098ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Aug 2023 00:37:44 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 00:37:43 -0700
Received: from pek-lpgtest18.wrs.com (128.224.179.191) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Mon, 7 Aug 2023 00:37:43 -0700
From: Chi Xu <chi.xu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] lapack: Add ptest support
Date: Mon, 7 Aug 2023 15:37:42 +0800
Message-ID: <20230807073742.2633376-1-chi.xu@windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: qIOKv640Om6Y0i1SuMQ-W4J9HsNUMfrp
X-Proofpoint-GUID: qIOKv640Om6Y0i1SuMQ-W4J9HsNUMfrp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_06,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1011 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2308070070
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Aug 2023 07:37:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104300

103 test cases in all.
Test results on qemu with kvm:
root@qemux86-64:~# ptest-runner lapack
START: ptest-runner
2023-08-07T07:10
BEGIN: /usr/lib64/lapack/ptest
PASS: BLAS-xblat1s
PASS: BLAS-xblat2s
...
PASS: LAPACK-xeigtstz_lse_in
PASS: LAPACK-xlintstds_dstest_in
PASS: LAPACK-xlintstzc_zctest_in
DURATION: 55
END: /usr/lib64/lapack/ptest
2023-08-07T07:11
STOP: ptest-runner
TOTAL: 1 FAIL: 0

If build lapack with lapacke, following test cases will be
included in ptest.
PASS: example_DGESV_rowmajor
PASS: example_DGESV_colmajor
PASS: example_DGELS_rowmajor
PASS: example_DGELS_colmajor

Signed-off-by: Chi Xu <chi.xu@windriver.com>
---
 .../recipes-devtools/lapack/lapack/run-ptest  |  3 ++
 .../recipes-devtools/lapack/lapack_3.10.1.bb  | 40 +++++++++++++++++--
 2 files changed, 39 insertions(+), 4 deletions(-)
 create mode 100755 meta-oe/recipes-devtools/lapack/lapack/run-ptest

diff --git a/meta-oe/recipes-devtools/lapack/lapack/run-ptest b/meta-oe/recipes-devtools/lapack/lapack/run-ptest
new file mode 100755
index 0000000000..8bd5fd1efb
--- /dev/null
+++ b/meta-oe/recipes-devtools/lapack/lapack/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+ctest --force-new-ctest-process | sed -u 's/\*\*\*/   /g' | awk '/Test +#/{gsub(/Passed/,"PASS"); gsub(/Failed/,"FAIL"); gsub(/Skipped/,"SKIP"); print $6": "$4; fflush();}'
diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.10.1.bb b/meta-oe/recipes-devtools/lapack/lapack_3.10.1.bb
index 15f394e13e..787ace440c 100644
--- a/meta-oe/recipes-devtools/lapack/lapack_3.10.1.bb
+++ b/meta-oe/recipes-devtools/lapack/lapack_3.10.1.bb
@@ -11,17 +11,49 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a32c99f24d097c72d1857e533b55642b"
 #FORTRAN:forcevariable = ",fortran"
 #RUNTIMETARGET:append:pn-gcc-runtime = " libquadmath"
 
-DEPENDS = "libgfortran"
+DEPENDS = "libgfortran \
+           ${@bb.utils.contains('PTEST_ENABLED', '1', 'rsync-native', '', d)} \
+          "
+RDEPENDS:${PN}-ptest += "cmake"
 
 SRCREV = "32b062a33352e05771dcc01b981ebe961bf2e42f"
-SRC_URI = "git://github.com/Reference-LAPACK/lapack.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/Reference-LAPACK/lapack.git;protocol=https;branch=master \
+           ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)} \
+          "
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[lapacke] = "-DLAPACKE=ON,-DLAPACKE=OFF"
 
-EXTRA_OECMAKE = " -DBUILD_SHARED_LIBS=ON "
+EXTRA_OECMAKE = " -DBUILD_SHARED_LIBS=ON \
+                  ${@bb.utils.contains('PTEST_ENABLED', '1', ' -DBUILD_TESTING=ON', '', d)} \
+                "
 OECMAKE_GENERATOR = "Unix Makefiles"
 
-inherit cmake pkgconfig
+inherit cmake pkgconfig ptest
 EXCLUDE_FROM_WORLD = "1"
+
+do_install_ptest () {
+    rsync -a ${B}/TESTING ${D}${PTEST_PATH} \
+          --exclude CMakeFiles \
+          --exclude cmake_install.cmake \
+          --exclude Makefile
+    rsync -a ${B}/BLAS ${D}${PTEST_PATH} \
+          --exclude CMakeFiles \
+          --exclude cmake_install.cmake \
+          --exclude Makefile
+    rsync -a ${B}/LAPACKE ${D}${PTEST_PATH} \
+          --exclude CMakeFiles \
+          --exclude cmake_install.cmake \
+          --exclude Makefile
+    cp -r ${B}/bin ${D}${PTEST_PATH}
+    cp -r ${B}/lapack_testing.py ${D}${PTEST_PATH}
+    cp ${B}/CTestTestfile.cmake ${D}${PTEST_PATH}
+    cp ${S}/TESTING/*.in ${S}/TESTING/runtest.cmake ${D}${PTEST_PATH}/TESTING
+    cp ${S}/BLAS/TESTING/*.in ${D}${PTEST_PATH}/BLAS/TESTING
+    sed -i -e 's#${B}#${PTEST_PATH}#g' `find ${D}${PTEST_PATH} -name CTestTestfile.cmake`
+    sed -i -e 's#${S}#${PTEST_PATH}#g' `find ${D}${PTEST_PATH} -name CTestTestfile.cmake`
+    sed -i -e 's#${RECIPE_SYSROOT_NATIVE}##g' `find ${D}${PTEST_PATH} -name CTestTestfile.cmake`
+    sed -i -e 's#${PYTHON}#/usr/bin/python3#g' `find ${D}${PTEST_PATH} -name CTestTestfile.cmake`
+    sed -i -e 's#${WORKDIR}##g' `find ${D}${PTEST_PATH} -name CTestTestfile.cmake`
+}
-- 
2.35.5


