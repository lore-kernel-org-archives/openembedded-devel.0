Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8468C021B8
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 03:46:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.238.1740455159194101934
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Feb 2025 19:45:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4151a86dad=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P2j2T0003825
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Feb 2025 19:45:58 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44yeyqjpre-11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Feb 2025 19:45:58 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 24 Feb 2025 19:45:57 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 24 Feb 2025 19:45:57 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] conf/layer.conf: meta-clang -> clang-layer
Date: Mon, 24 Feb 2025 19:45:56 -0800
Message-ID: <20250225034557.2148517-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=AbBLH2XG c=1 sm=1 tr=0 ts=67bd3cf6 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=t7CeM3EgAAAA:8 a=9THFzh-WzwZFKe0WqawA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: RvnIBF9FYLdtwx2mbisld46wXhrkTapp
X-Proofpoint-GUID: RvnIBF9FYLdtwx2mbisld46wXhrkTapp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_01,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=779
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502250023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 03:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115556

From: Robert Yang <liezhi.yang@windriver.com>

It should be clang-layer, not meta-clang.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/conf/layer.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 42fff2ce18..b75a3ccaf9 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -26,8 +26,8 @@ BBFILE_PRIORITY_openembedded-layer = "5"
 # only activates content when identified layers are present,
 # to ensure yocto compatibility check pass
 BBFILES_DYNAMIC += " \
-    meta-clang:${LAYERDIR}/dynamic-layers/clang-layer/recipes-*/*/*.bb \
-    meta-clang:${LAYERDIR}/dynamic-layers/clang-layer/recipes-*/*/*.bbappend \
+    clang-layer:${LAYERDIR}/dynamic-layers/clang-layer/recipes-*/*/*.bb \
+    clang-layer:${LAYERDIR}/dynamic-layers/clang-layer/recipes-*/*/*.bbappend \
     meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
     meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bbappend \
     multimedia-layer:${LAYERDIR}/dynamic-layers/multimedia-layer/recipes-*/*/*.bb \
-- 
2.25.1


