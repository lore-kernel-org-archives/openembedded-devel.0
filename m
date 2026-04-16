Return-Path: <zeming.liu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7F1F433DC
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 02:53:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4571.1776307989086321187
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 19:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WES9Ip3R;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8566fadb3a=zeming.liu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FMtXLt3844160
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 02:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=P4WrpvcKHlcfzHbtZvht
	01C+dpmMIvE/DG3ufAGWvFE=; b=WES9Ip3RuPlD0BG+TM/tXl9dR3cue1OTh/Ih
	ZH5lr8zIkd8GgrJ7RXS0/ehDRfAyNLNGumrUmUKOUz9wbVuqcnCEvvsGOVs1QYJc
	DN+oxbegSTH9tWaiuT2oxqonTmGTAztu6ZQrPMvkvs8TG5825CaPmMSx2gq3qGLm
	SMCriDjcNmUu+Y6EW4A39W6oIKuUDaRutnWEjWkzSLxoVQJ1g76hKKK4dB3a4HmF
	pXkGUm/ewaac6musFEM9zQfji10tiXVglhm7mubtbUPVeIYUCjgoA0SKyuymdWXn
	nLmtZXNR68ZB5+hSTstMs5RwUjQP4u3XAwbAia+ftsYYpYMVfA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh87ab152-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 02:53:07 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 15 Apr 2026 19:53:06 -0700
Received: from pek-lpgtest20.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 15 Apr 2026 19:53:06 -0700
From: Zeming LIU <zeming.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][master][PATCH] jsoncpp: add ptest support
Date: Thu, 16 Apr 2026 10:53:05 +0800
Message-ID: <20260416025305.807890-1-zeming.liu@windriver.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: DCwbT_BOqxyyTwQR5jBGiubVpVqqP64L
X-Authority-Analysis: v=2.4 cv=Q4jiJY2a c=1 sm=1 tr=0 ts=69e04f13 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=PdApA3IHArU3VhI-AhoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: DCwbT_BOqxyyTwQR5jBGiubVpVqqP64L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDAyNSBTYWx0ZWRfX0FfQz+/zL2mu
 Eb4iKGXWMo2VUCTzWc/FhCYSMFjV2Yl8UeWZNYTKc9SN8jo4DNUtqBSLV75sPdGtMn0jrsmgPn2
 A0NmU1FzK6Sm/Q7cj8AZfooC0oomZ9VTfkkraSfnhRRMvF7qDDPI0YtNOYiU7mi2tGjVrND/b9q
 LK758gh7UVEIleuTHdgbYNw45e3WRVVRnxSjH7/QtnyqnlvQF+WnGCzWHx6Ni4S9326OpBVzpnM
 cPqI/b3m37pIfF8tVftHQClvzndsqL+6KfGlvtjm+AOKboRFjO1s+vPD7REqrKpzNRHZqtmPESh
 MOnzdhikoiTqlHAyg1Rpl+XvNisyi8irfCzo7a91MdlBoHzBfaN2r1fC3BFB4ilpaOq339W/0rJ
 3jnc6KLQfwfVXF9COBLYaneuy8mtwi/cetj48xwju6++Me9urhpdgKA5PoDtj3GvQVkb7MxNaTc
 OOO/0sR03cghaXPDheA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160025
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 02:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126376

Add ptest support for jsoncpp to enable automated testing of the
JSON C++ library functionality.

Note:
- Tested on: WRLinux master-wr (based on meta-openembedded master)
- jsoncpp version: 1.9.7
- Unable to test on pure upstream due to poky/meta-oe branch mismatch

Test Result:
root@qemux86-64:~# ptest-runner jsoncpp
START: ptest-runner
2026-04-15T14:04
BEGIN: /usr/lib64/jsoncpp/ptest
PASS: jsoncpp_readerwriter
PASS: jsoncpp_readerwriter_json_checker
PASS: jsoncpp_test
DURATION: 122
END: /usr/lib64/jsoncpp/ptest
2026-04-15T14:06
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Zeming LIU <zeming.liu@windriver.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 .../recipes-devtools/jsoncpp/files/run-ptest  |  4 +++
 .../recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb | 34 +++++++++++++++----
 3 files changed, 33 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/jsoncpp/files/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index ca800f12fa..b0147b3f95 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -73,6 +73,7 @@ PTESTS_SLOW_META_OE = "\
     c-ares \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'freerdp', '', d)} \
     fftw \
+    jsoncpp \
     libusb-compat \
     mariadb \
     postgresql \
diff --git a/meta-oe/recipes-devtools/jsoncpp/files/run-ptest b/meta-oe/recipes-devtools/jsoncpp/files/run-ptest
new file mode 100644
index 0000000000..2cb892b187
--- /dev/null
+++ b/meta-oe/recipes-devtools/jsoncpp/files/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+cd src
+ctest --force-new-ctest-process | sed -u 's/\*\*\*/   /g' | awk '/Test +#/{gsub(/Passed/,"PASS"); gsub(/Failed/,"FAIL"); gsub(/Skipped/,"SKIP"); print $6": "$4; fflush();}'
diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
index b70a84304f..797f093f33 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
@@ -14,11 +14,33 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d73c165a0f9e86a1342f32d19ec5926"
 PE = "1"
 
 SRCREV = "3455302847cf1e4671f1d8f5fa953fd46a7b1404"
-SRC_URI = "git://github.com/open-source-parsers/jsoncpp;branch=master;protocol=https;tag=${PV}"
-
-
-inherit cmake
-
-EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DBUILD_OBJECT_LIBS=OFF -DJSONCPP_WITH_TESTS=OFF"
+SRC_URI = "git://github.com/open-source-parsers/jsoncpp;branch=master;protocol=https;tag=${PV} \
+           file://run-ptest \
+           "
+
+inherit cmake ptest
+
+EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DBUILD_OBJECT_LIBS=OFF \
+                  ${@bb.utils.contains('PTEST_ENABLED', '1', '-DJSONCPP_WITH_TESTS=ON -DJSONCPP_WITH_POST_BUILD_UNITTEST=OFF', '-DJSONCPP_WITH_TESTS=OFF', d)} \
+                  "
+
+DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'rsync-native', '', d)}"
+RDEPENDS:${PN}-ptest += "cmake python3-core"
+
+do_install_ptest () {
+    cp -r ${B}/bin ${D}${PTEST_PATH}
+    cp -r ${S}/test ${D}${PTEST_PATH}
+    
+    rsync -a ${B}/src ${D}${PTEST_PATH} \
+          --exclude CMakeFiles \
+          --exclude cmake_install.cmake \
+          --exclude Makefile \
+          --exclude generated
+    sed -i -e 's#${B}#${PTEST_PATH}#g' `find ${D}${PTEST_PATH} -name CTestTestfile.cmake`
+    sed -i -e 's#${S}#${PTEST_PATH}#g' `find ${D}${PTEST_PATH} -name CTestTestfile.cmake`
+    sed -i -e 's#${RECIPE_SYSROOT_NATIVE}##g' `find ${D}${PTEST_PATH} -name CTestTestfile.cmake`
+    sed -i -e 's#${PYTHON}#/usr/bin/python3#g' `find ${D}${PTEST_PATH} -name CTestTestfile.cmake`
+    sed -i -e 's#${WORKDIR}##g' `find ${D}${PTEST_PATH} -name CTestTestfile.cmake`
+}
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.51.2


