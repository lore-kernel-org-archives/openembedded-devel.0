Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD0EC38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 20:28:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5355.1675196909323237581
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 12:28:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cKuanOJO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1395f88de3=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30VJfY9F005232
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 20:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=GbCMJae43FkSh6gFkT1pZxA433hWAr2AU5vUqcij0IQ=;
 b=cKuanOJOt4QVu0orR08HrWsgP3es6p/dYdycTlcBEKK8DSnejz1oyeUA1jEU60R32HaH
 XU566w31cefgXqu1x/WpmUwXR9NljM32rWIv7o6reQW5iCmWuBWLgDNkbuVsKv4nCkrE
 47jbpGl3bsmENHaFcMYhrseqwstgEAgBshSKQxauuFVLyBTI3xFCqp1cRLNzrNE1/269
 FCrw5aNNPrAKRAAlkJ+W0PdNdgyTxT1fhsA0NT0bZTymNThX3N2puQzGEI2Tg72CUVb0
 pk9KQmm/UYsJeZI655sO5VAWL5OaRNK5EYV8T3NBhA3uFAeiB0Y2Jcr1CN7lAsSA59OR /g== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nctpaunu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 20:28:28 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 31 Jan 2023 12:28:27 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 31 Jan 2023 12:28:27 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] python3-pillow: add ptest support
Date: Tue, 31 Jan 2023 12:28:27 -0800
Message-ID: <20230131202827.3537236-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: YuSvxPkVff1-rSrtiY3hetFVNmdf7CP7
X-Proofpoint-ORIG-GUID: YuSvxPkVff1-rSrtiY3hetFVNmdf7CP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310177
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 20:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100888

Add initial pillow ptest support.

The ptest result is:
   ====== 3600 passed  324 skipped, 2 xfailed, 1 xpassed in 62.41s (0:01:02) ======
for qemux86-64 with 2 GB RAM.

The skipped tests as summarized with:
   # ptest-runner python3-pillow | tee log
   # grep SKIPP log  | cut -d"(" -f2- | cut -d")" -f1 | cut -d" " -f1 | sort | uniq -c| sort -n | tail -4
     12 webp
     13 Tk
     14 Qt
     84 raqm
Webp was explicityly disabled in 2018 in:
   6cb4e90fc python3-pillow: add 5.4.1
I didn't test Tk or Qt and there isn't yet a recipe for libraqm:
   https://github.com/HOST-Oman/libraqm
a library that encapsulates the logic for complex text layout.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../python/python3-pillow/run-ptest           |  3 +++
 .../python/python3-pillow_9.4.0.bb            | 22 ++++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-pillow/run-ptest b/meta-python/recipes-devtools/python/python3-pillow/run-ptest
new file mode 100644
index 000000000..3385d6893
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
index 403a987d1..68c81029c 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
@@ -8,10 +8,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bc416d18f294943285560364be7cbec1"
 SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
+           file://run-ptest \
            "
 SRCREV ?= "82541b6dec8452cb612067fcebba1c5a1a2bfdc8"
 
-inherit setuptools3
+inherit setuptools3 ptest
 
 PIP_INSTALL_PACKAGE = "Pillow"
 PIP_INSTALL_DIST_PATH = "${S}/dist"
@@ -31,12 +32,31 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-numbers \
 "
 
+RDEPENDS:${PN}-ptest += " \
+    bash \
+    ghostscript \
+    jpeg-tools \
+    libwebp \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-image \
+    ${PYTHON_PN}-mmap \
+    ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-pytest-timeout \
+    ${PYTHON_PN}-resource \
+    tk \
+"
+
 CVE_PRODUCT = "pillow"
 
 S = "${WORKDIR}/git"
 
 RPROVIDES:${PN} += "python3-imaging"
 
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/Tests
+        cp -rf ${S}/Tests ${D}${PTEST_PATH}/
+}
+
 BBCLASSEXTEND = "native"
 
 SRCREV = "a5bbab1c1e63b439de191ef2040173713b26d2da"
-- 
2.39.0


