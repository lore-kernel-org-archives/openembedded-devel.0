Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEDB1C54E67
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 18:18:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.17798.1711477120275606871
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Mar 2024 11:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WV2rwT7W;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3815b0b2f8=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42QBhdFo007466
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 11:18:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=vO4IV
	42fDn3Ck6N9wVPo6W9xpW+oJeZNmitc/yIV48U=; b=WV2rwT7WQriBzLGM3mmW0
	ZBWCfySkuxLfUueHKTYGSWeZTBEw/caIHtb8g1VcjLueBq2fVKZ+dX9B2pln/Nsr
	Qh26sBiT7g1TY7phvKiaeWFZSaGDtFoggi/g31XkrisdV/00LnxzbIp6vxkL/uRs
	EyCfqW367lTOh0CkKzGkgcFEw/REVmzQMXR2u2U0nYx/J1IUA1ufkn0hkB5YqXzx
	1ONx/PLMkSnDC1kmg4IRJRvYdJQp/VHhQlPOrDVepC1WKsh3Nl2ro7nM4aQaZPc3
	iCZ0yioSqpgRNt5MlNfvvofgTn1e9y52/FTjrrM+5okySIuTYczB0ZHxi2XgLUBj
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x1xkguu11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 11:18:39 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 26 Mar 2024 11:18:39 -0700
Received: from pop-os.wrs.com (172.25.44.5) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.37 via Frontend
 Transport; Tue, 26 Mar 2024 11:18:38 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] nftables: Add DESCRIPTION and HOMEPAGE
Date: Tue, 26 Mar 2024 14:18:38 -0400
Message-ID: <20240326181838.3853211-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: NyrFbg7AIGj1ksx-rP0aPt1wqhnTtwLe
X-Proofpoint-GUID: NyrFbg7AIGj1ksx-rP0aPt1wqhnTtwLe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_07,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=887 phishscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403260130
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 18:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109624

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Add DESCRIPTION and HOMEPAGE.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-networking/recipes-filter/nftables/nftables_1.0.9.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
index 43d606f5d..906d1b4f6 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
@@ -1,4 +1,9 @@
 SUMMARY = "Netfilter Tables userspace utillites"
+DESCRIPTION = "nftables replaces the popular {ip,ip6,arp,eb}tables. \
+               This software provides an in-kernel packet classification framework \
+               that is based on a network-specific Virtual Machine (VM), \
+               nft, a userspace command line tool and libnftables, a high-level userspace library."
+HOMEPAGE = "https://netfilter.org/projects/nftables"
 SECTION = "net"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=81ec33bb3e47b460fc993ac768c74b62"
-- 
2.34.1


