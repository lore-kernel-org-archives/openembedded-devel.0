Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360D1C636CC
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 23:08:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9447.1675206534119212988
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 15:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=pAB2Hwgh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1395f88de3=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30VMn9Pb023756
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 23:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=T3i6xpHhiqbqGR6FHX2m+C0V2vh2o5rZ+6F+MDcccKo=;
 b=pAB2HwghXZptMlEYjQQcsL9oTy3Q0POL6j7WglFUZk1D+Y1bE1kVeMw6Yhd8ESRQVsWQ
 F1U6yCGhXRKrzG5mBKSj32eOZ+I6ATzv8xyIDsYzFl09GX7yYGhVXtysBfcIVsgWzLFO
 KMf86LbcgyO0rrhZvijiAoq6pLv5jTaMS1ubWpuhSWmK/BA8kbwzgA/xs67lRI+/ccGL
 RMkt5o5cTmlqrxFMB1M3xeXeBGhpfGWjOeTQVNC2TRssjDS27KKocerljTAMIbQ1uWFl
 zp22VdcE6PXbPBKMiraRp5MpZ0rzi2blWhDn6xVgBGLVamEhvwgzu340k6wgSSV16fpV lw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nctpausud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 23:08:53 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 31 Jan 2023 15:08:51 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 31 Jan 2023 15:08:51 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][kirkstone][PATCH 1/6] python3-pillow: upgrade 9.0.1 -> 9.1.1
Date: Tue, 31 Jan 2023 15:08:46 -0800
Message-ID: <20230131230851.2785067-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: FEeW8Hiy5Pi-3x77OVHapC37WgtSD8PR
X-Proofpoint-ORIG-GUID: FEeW8Hiy5Pi-3x77OVHapC37WgtSD8PR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310199
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 23:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100890

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-pillow_9.0.1.bb => python3-pillow_9.1.1.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_9.0.1.bb => python3-pillow_9.1.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.0.1.bb b/meta-python/recipes-devtools/python/python3-pillow_9.1.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pillow_9.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pillow_9.1.1.bb
index fb86322f7..00df22a3d 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.1.1.bb
@@ -5,10 +5,10 @@ HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ad081a0aede51e89f8da13333a8fb849"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=9.0.x;protocol=https \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=9.1.x;protocol=https \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
-"
+           "
 SRCREV ?= "82541b6dec8452cb612067fcebba1c5a1a2bfdc8"
 
 inherit setuptools3
@@ -39,4 +39,4 @@ RPROVIDES:${PN} += "python3-imaging"
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "6deac9e3a23caffbfdd75c00d3f0a1cd36cdbd5d"
+SRCREV = "0f44136e720cd3b2db72bdf29614897b7aa3e868"
-- 
2.39.0


