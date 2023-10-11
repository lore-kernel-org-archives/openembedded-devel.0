Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63FAACDB47E
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 21:48:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.29233.1697060886437963713
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Oct 2023 14:48:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KCuKdNc2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8648ebce54=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39BLbQmL021148
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 14:48:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=PWOGf
	VOnvCAacLDhZLGih2o3BgKivK2Yc+0TIci4/ZQ=; b=KCuKdNc2UaiusRdnTL85J
	3aS10Krvu2Xn2pxKh46hf3Wx4pxIzgOx+T7CvBmLX5LAbOFMgWiqki208Oh17L0z
	911oq8w+51kgL4ZfN1Buo/Xt77OKXied1/UJNk7PH+i9MMIIQ6S4lvtaMJByFLmr
	FFpOHluONIix1s4jqbnG+EGpj+SMYsNDE46CRhhRz6w98SZVGoNvsM4wP0tZppFX
	fZw3fbzKSyzeHjPy6oJQ0mgmLAVq6Mv9XLhhU2epHrrQyyEypmiEEEknFIp0xSWa
	gRQIzzUwao6AsQr4svosxbMrUZ5KPErhrpmuPLNJW2kFaGYSbVvexG10V8zvHk24
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tnhq4rw3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 14:48:06 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 14:48:04 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 14:48:04 -0700
From: <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-python][PATCH 1/1] python3-pynacl: add RCONFLICTS with python3-nacl
Date: Wed, 11 Oct 2023 14:48:05 -0700
Message-ID: <20231011214805.3584711-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: zRTWCmLpVZydnKQEpkNHOI56sRm1eApA
X-Proofpoint-ORIG-GUID: zRTWCmLpVZydnKQEpkNHOI56sRm1eApA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_17,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=576 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310110192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 21:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105440

From: Joe Slater <joe.slater@windriver.com>

python3-nacl is in the meta-virtualization layer.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb b/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
index 6e53461979..5a8ed131af 100644
--- a/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pynacl_1.5.0.bb
@@ -10,6 +10,10 @@ PYPI_PACKAGE = "PyNaCl"
 
 inherit pypi python_setuptools_build_meta
 
+# in meta-virtualization layer
+#
+RCONFLICTS:${PN} = "python3-nacl"
+
 DEPENDS += "\
     ${PYTHON_PN}-cffi-native \
     libsodium \
-- 
2.25.1


