Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F183CD1280
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 07:16:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.31605.1711523799180340896
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Mar 2024 00:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nggb52Y+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3816ddbad4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42R6dWt1009668
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 00:16:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=PL0o8
	6dskbKUFJVWooGcRZiTJnQ6FjH7aDzw4xMzE/A=; b=nggb52Y+hPYADnzZuFWNL
	iWuHTC0BcM1/lyQWoM6QNuFGBGhYD/A7XOLm3uIHR8Q0mzaldsEM6Wfog4njo8yG
	ZoWKBhcxeKz3v24YiPCsw/2n/JT906tdb6iHO0qmfutTExSU4hVTh4qopqM/VOsQ
	TcVbJc3SLiQyKwRvoWTjBKKW7Ci8oh2kE9ZvKN91npiIFBARWRhlASkd7WxOuPoG
	yMBs+p0tmmaAsR5vJr5zOreVYYRNC/kvkh/aIZNSbPkTzJTDpdDHNXER3ZbnV2qx
	Jh2ELYy6Xv0dlOyeHrv/ixAuH5NK6oZjVaOf9j1uMvSXNx/SSvhw3zmPMQiBJJH6
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x1xkgvgqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 00:16:38 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 27 Mar 2024 00:16:37 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Wed, 27 Mar 2024 00:16:37 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][kirkstone][PATCH 1/3] python3-pyyaml-include: add initial recipe for version 1.3.2
Date: Wed, 27 Mar 2024 15:16:34 +0800
Message-ID: <20240327071636.2207445-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: N-Ktk6sldWLgSyvzLuFGwr9NlqVZiD5L
X-Proofpoint-GUID: N-Ktk6sldWLgSyvzLuFGwr9NlqVZiD5L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-27_04,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403270048
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 07:16:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109636

From: Derek Straka <derek@asterius.io>

Add a recipe for the pyyaml-include package that extends PyYAML to include
YAML files within YAML files.  Add a ptest to run the unit tests and include
the tests as part of the package lists in meta-python

Signed-off-by: Derek Straka <derek@asterius.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bf011a9f5e89186b338b6a335d10ef84929be0ce)
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../python/python3-pyyaml-include/run-ptest   |  3 ++
 .../python/python3-pyyaml-include_1.3.2.bb    | 28 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100755 meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest b/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest
new file mode 100755
index 000000000..3385d6893
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
new file mode 100644
index 000000000..9bfaa2194
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Extending PyYAML with a custom constructor for including YAML files within YAML files"
+HOMEPAGE = "https://github.com/tanbro/pyyaml-include"
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+SRCREV = "36b6975aa8fc7a6cbf37de40aa2ed6d996b2f7be"
+
+SRC_URI = " \
+            git://github.com/tanbro/pyyaml-include;protocol=https;branch=main \
+            file://run-ptest \
+          "
+
+S = "${WORKDIR}/git"
+
+inherit python_setuptools_build_meta ptest
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-pyyaml \
+"
+RDEPENDS:${PN}-ptest += " \
+    ${PYTHON_PN}-pytest \
+"
+
-- 
2.25.1


