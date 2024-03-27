Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC08C47DD9
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 07:16:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.31606.1711523800943072641
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Mar 2024 00:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Z84vTNj6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3816ddbad4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42R6ffnQ002188
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 07:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=j63qItmLXc2ugtSaZWf90hZqs6aT20PhqazFRqfQ5pk=; b=
	Z84vTNj62vzODyV3wNDi61b08ZnIZppHq2Y6q1OCUKBaM2IFLGU6AHVYON5ra8/+
	IU4vhCgpVp6dEXD1R+I1OkP42dAW0+PwzR8KN/SaLvRlztG2cIspVg0FGugf+VSN
	kUbFDQb4UVX2Jg+N+IA4E+oDTh5HjYiV4jcp8hiRKyY8pZq50pnsrkv4czt1Wi3w
	YCzE2CoowOZ9wTofV6YrEcPGIbHZjtKn8iFZvvan5JoGzCWlIwk38HsFajAUhyvz
	JPPjN7x0c2vBfcHb6p3voxQ4k2PoUGMp/ogz9qVwQTVrjaH0WTb2bs/ufgcPCo6B
	4E74srC5hw9HLGru3frnxg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x1p26mvpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 07:16:40 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 27 Mar 2024 00:16:38 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Wed, 27 Mar 2024 00:16:38 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][kirkstone][PATCH 2/3] python3-pyyaml-include: switch to pytest --automake
Date: Wed, 27 Mar 2024 15:16:35 +0800
Message-ID: <20240327071636.2207445-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240327071636.2207445-1-mingli.yu@windriver.com>
References: <20240327071636.2207445-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -agYjaX0prFFJOLQ4RcDkY2jclV1A3Ei
X-Proofpoint-GUID: -agYjaX0prFFJOLQ4RcDkY2jclV1A3Ei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-27_04,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 adultscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403270048
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 07:16:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109637

From: Tim Orling <ticotimo@gmail.com>

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 182f31a182f6572a3538b875cec7ee761e2da1e6)
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../python/python3-pyyaml-include/run-ptest                | 2 +-
 .../python/python3-pyyaml-include_1.3.2.bb                 | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest b/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest
index 3385d6893..8d2017d39 100755
--- a/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pyyaml-include/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
index 9bfaa2194..3a5bd99a7 100644
--- a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Extending PyYAML with a custom constructor for including YAML files w
 HOMEPAGE = "https://github.com/tanbro/pyyaml-include"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
-DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native"
 SRCREV = "36b6975aa8fc7a6cbf37de40aa2ed6d996b2f7be"
 
 SRC_URI = " \
@@ -20,9 +20,10 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN} += " \
-    ${PYTHON_PN}-pyyaml \
+    python3-pyyaml \
 "
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
-- 
2.25.1


