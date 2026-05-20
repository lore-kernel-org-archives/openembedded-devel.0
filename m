Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA08ECD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 05:13:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3966.1779246031777386294
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 20:00:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jrpNQ+mW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9600a93cd2=shilong.jiao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K1EfQl982009
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 20:00:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=hPoK+KVFcNJkPQCLj9fq
	UkNO00hK/GRntbvS0OhVyJQ=; b=jrpNQ+mWrJcTYGG7VtJAzlfdaT3efxmY6DYq
	pZ2rS9k+pZyOzQ2oh8wEseh/jbeHMwtswqdPRdPAWr5cCvz9ZQ8lzNr1BL2M/QBl
	fMeZd6zdyfmaJ436QecOchGhQ6PSJjRG6PX/3/fwiJ1q+CD4sVyVT6BHdLUOyDF4
	XYqVmkG3+YnS1MIe5nIxX/n+1t94MdBS5WtCkyTWO/3TB09NvYi27AEfo85TyQVl
	GJv03LxhauD42wkvfk4QOmlyxUA1pfVpScY1Zi2PdFLmKtIx0t53Yqd4HaL21MKP
	yKi023bf3NLVJg+uEeC/St9pubT0ZJeq4tsrdskKA+WnnKXEDA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3gcf7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 20:00:31 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 19 May 2026 20:00:30 -0700
Received: from pek-lpgtest26.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 19 May 2026 20:00:30 -0700
From: Shilong.Jiao@eng.windriver.com
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] openjpeg: add ptest support
Date: Wed, 20 May 2026 11:00:29 +0800
Message-ID: <20260520030029.2998426-1-Shilong.Jiao@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-GUID: PVH85357Rd9_ZxpCABTFQ7R13mpvALsF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDAyNyBTYWx0ZWRfXwtZqRFOwpXlB
 2QWj7Epl0k/cM95mrw1rQQIA3hF/dNBKQUwh7OnbKyhu9hciRVxgd3/GOal5alvqZF45obNUtvV
 51icgN2yUfFeNeDz//PgLd8OyI6gv5UD2dCOpdchJ6aNlG/a6fFvcEtpRGt+lnyaXvMVoUIjfyu
 vLp2YuYewxh+ALMEHI/297HOsyoz9orbnF6o1HtUQq3wWaoVx1kPevEKXsKVXau4IxHZJXsV+l3
 KfHwgbwN38q0d4ockpwar1k0GsTEGB1eshMjDtAStveKfXsJWbCbKTyi05ul8HMqZO8qgRpLtk3
 z/KcN/QWqHpBxAswaShy0t4FAMPNLkhlTrGmyYr8edCOXpv2hhv/QuVXYLM4fJo/ehkAgyyqLp3
 P/Ga6/N+bTkeFXsSsN88l8j/4hmmv+B3cZMxMlvDWL2k7HsPqfpq4Vq82yV1Lkeqht+Zs8K3IKw
 SIaI4BN55ofoFmmNcCw==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0d23cf cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=rfn4jPsQoTi1yZ_K8qUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: PVH85357Rd9_ZxpCABTFQ7R13mpvALsF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1011 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200027
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 05:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127106

From: sjiao <Shilong.Jiao@windriver.com>

Add ptest support to enable runtime testing of openjpeg library.
Only unit tests are included, excluding tests that require external
data files (NR-/CONF-/ETS-/testjp2).

Tested on intel-x86-64: all 29 unit tests passed.

Signed-off-by: sjiao <Shilong.Jiao@windriver.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 .../openjpeg/openjpeg/run-ptest               |  4 +++
 .../openjpeg/openjpeg_2.5.4.bb                | 36 ++++++++++++++++++-
 3 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 528ce16191..a9cbaf6982 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -50,6 +50,7 @@ PTESTS_FAST_META_OE = "\
     nlohmann-json \
     nodejs \
     onig \
+    openjpeg \
     oprofile \
     pegtl \
     pv \
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/run-ptest b/meta-oe/recipes-graphics/openjpeg/openjpeg/run-ptest
new file mode 100644
index 0000000000..a161244fbd
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+# Only run unit tests, exclude nonregression and conformance tests that need external data files
+ctest -E "(NR-|CONF-|ETS-|testjp2)" -V | sed -u 's/\*\*\*/ /g' | awk '/Test +#/{gsub(/Passed/,"PASS"); gsub(/Failed/,"FAIL"); gsub(/Skipped/,"SKIP"); print $6": "$4; fflush();}'
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
index 968b7a0a5c..0fe7a75e52 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
@@ -9,14 +9,48 @@ SRC_URI = "git://github.com/uclouvain/openjpeg.git;branch=master;protocol=https
            file://0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
            file://CVE-2023-39327.patch \
            file://CVE-2026-6192.patch \
+           file://run-ptest \
            "
 SRCREV = "6c4a29b00211eb0430fa0e5e890f1ce5c80f409f"
 
-inherit cmake
+inherit cmake ptest
 
 # for multilib
 EXTRA_OECMAKE += "-DOPENJPEG_INSTALL_LIB_DIR=${@d.getVar('baselib').replace('/', '')}"
 
+EXTRA_OECMAKE += "${@bb.utils.contains('PTEST_ENABLED', '1', '-DBUILD_TESTING=ON', '', d)}"
+
 FILES:${PN} += "${libdir}/openjpeg*"
 
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+
+    # Install test binaries only
+    if [ -d ${B}/bin ]; then
+        install -d ${D}${PTEST_PATH}/bin
+        find ${B}/bin -maxdepth 1 -type f -executable ! -name "*.so*" \
+            -exec install -m 0755 {} ${D}${PTEST_PATH}/bin/ \;
+    fi
+
+    # Install CTest configuration files with proper structure
+    if [ -d ${B}/tests ]; then
+        cp -r ${B}/tests ${D}${PTEST_PATH}/
+    fi
+    if [ -f ${B}/CTestTestfile.cmake ]; then
+        install -m 0644 ${B}/CTestTestfile.cmake ${D}${PTEST_PATH}/
+    fi
+
+    # Fix all build paths in cmake files to point to ptest installation
+    find ${D}${PTEST_PATH} \( -name "*.cmake" -o -name "*.ctest" \) -type f -exec sed -i \
+        -e "s#${B}/bin#${PTEST_PATH}/bin#g" \
+        -e "s#${B}#${PTEST_PATH}#g" \
+        -e "s#${S}#${PTEST_PATH}#g" \
+        -e "s#${TMPDIR}#/tmp#g" \
+        -e "s#${STAGING_DIR_NATIVE}##g" \
+        -e "s#/tmp/work/[^/]*/[^/]*/[^/]*/recipe-sysroot-native/usr/bin/cmake#/usr/bin/cmake#g" \
+        {} +
+}
+
+RDEPENDS:${PN}-ptest += "${PN} bash cmake"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.53.0


