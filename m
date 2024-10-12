Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B09DECF2566
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 10:01:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7890.1728727311220101123
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Oct 2024 03:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0015263500=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49CA1kmu023806
	for <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 03:01:51 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 427md4g394-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 03:01:50 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 12 Oct 2024 03:01:49 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sat, 12 Oct 2024 03:01:49 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/3] tomlplusplus: Add ptest support
Date: Sat, 12 Oct 2024 18:01:46 +0800
Message-ID: <20241012100147.618578-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241012100147.618578-1-mingli.yu@windriver.com>
References: <20241012100147.618578-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -dwB4E2Kxw30yGYvBiyi2mjan1s97fiP
X-Authority-Analysis: v=2.4 cv=d6CnygjE c=1 sm=1 tr=0 ts=670a490e cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=DAUX931o1VcA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=zHmZo43F6q6Oa3eal2wA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: -dwB4E2Kxw30yGYvBiyi2mjan1s97fiP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-12_06,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2410120071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 10:01:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112828

From: Mingli Yu <mingli.yu@windriver.com>

 # ./run-ptest
PASS: tomlplusplus_odr_test
PASS: tomlplusplus_tests

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../recipes-devtools/tomlplusplus/files/run-ptest | 12 ++++++++++++
 .../tomlplusplus/tomlplusplus_git.bb              | 15 +++++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100755 meta-oe/recipes-devtools/tomlplusplus/files/run-ptest

diff --git a/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest b/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
new file mode 100755
index 000000000..4f682c5eb
--- /dev/null
+++ b/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+
+cd tests
+for atest in tomlplusplus_* ; do
+    rm -rf tests.log
+    ./${atest} > tests.log 2>&1
+    if [ $? = 0 ] ; then
+        echo "PASS: ${atest}"
+    else
+        echo "FAIL: ${atest}"
+    fi
+done
diff --git a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
index 0e8202bdc..245c309a2 100644
--- a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
+++ b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://github.com/marzer/tomlplusplus"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=90960f22c10049c117d56ed2ee5ee167"
 
-SRC_URI = "git://github.com/marzer/tomlplusplus.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/marzer/tomlplusplus.git;protocol=https;branch=master \
+           file://run-ptest \
+"
 
 PV = "3.4.0"
 SRCREV = "30172438cee64926dc41fdd9c11fb3ba5b2ba9de"
@@ -11,4 +13,13 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "cmake-native"
 
-inherit meson
+inherit meson ptest
+
+EXTRA_OEMESON += "-Dbuild_tests=${@bb.utils.contains("DISTRO_FEATURES", "ptest", "true", "false", d)} \
+"
+
+do_install_ptest () {
+    install -d ${D}${PTEST_PATH}/tests
+    cp ${B}/tests/tomlplusplus_odr_test ${D}${PTEST_PATH}/tests
+    cp ${B}/tests/tomlplusplus_tests ${D}${PTEST_PATH}/tests
+}
-- 
2.34.1


