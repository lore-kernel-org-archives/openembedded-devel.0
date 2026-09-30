Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80653CA5FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 14:35:24 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14985.1790778919852528629
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 07:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=qxkX/6tI;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=oSM+qnjH;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE1OqW3057493
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 09:35:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=wP+ZGYoNrsdcW3jPU2mkdjZf9aSAw/s29un/2D3KX
	IA=; b=qxkX/6tIw6SrgBw9jQbXwiz3CRV0wsY2RpvOpEIWdQp2uO+e6qx7a31J3
	a/R88ypAgslzBDsOinfby2VMBV8pmypySZXxYmiQsoOF3kLVU+2byzh3GQJoW7uv
	OAH9vVMexeS2AWiKWwgkulysk7clNjlL5Ii0YIrCGFZkR19/Gnjy9rMCG8YY5Jd2
	r4DLBG1KE/A6+sV8p46d58YMSU0rxOYQU5FmQCdqcooBpZOJIb9yKZzOBcB4LjHF
	EXJPaC09MExwlh+XH3w6KJy6EFJdJGBL3B3+RLFdY64xGHaG0T+f4u3CipHj2XYT
	IKJ7kP8A7USE1yp+JJSykoj03BG4A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013005.outbound.protection.outlook.com [40.93.201.5])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0m9fdytg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 09:35:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lf357MAtxzoWqKCzV7e8W7XUxNilRDGauVpJvtZiKJKpHgk8WX9FA2o6IUQewI0OnmPbKNUmafPkmRJJ/i8OflNNeTLWe/kVRpd+go031rrvlAlUzzBL1e8VrTx7dMSfnzQl93sQKN98n/y76vjP8PXAi2+tMC/KB5AzYnNbgVA2WLRbxqQMeccPM1e52MUfh8Mbriuo7UvURVz/J4fDz8QLPUydSLvBBUtMMZWlsj3THB843J3nkqe5uRdXoYXJWMTgJ7XoEJyKURFt4L1ZbLkDiccKW/v+aklzb7SCmiBMYASRoVeSw+Y+hes8SFumUwMzxffOU9dbe+KzBwKXEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wP+ZGYoNrsdcW3jPU2mkdjZf9aSAw/s29un/2D3KXIA=;
 b=LW8gDQo4JT2hzDloOOgLW2aT7mo0nGaWvLjH9ds1lSTQN3Ok7ZTZinY6fuhPrA6D0NH+TPuP467gkZ2ZVcdLAtObJwjkzSt90fg9Sam9tpL/ZED1invVOXL0EJ57mik2Ic3l0+9mjnrdm9xLuoEnuHzfkTqc6mfbNrxclFQMBGXGizBBFQ6Vzo41145gh6BiOrJFWB6LZH/aMilSjvb/ddRk2R6jR+XbrAdGCvgTMe84kaS4xZbxmSgEp7SfXPczcHF8YSYPiQHqZh5/9DSFWoUWGqY53NuuFJtT5j4ibtq6ilJ34hF9Zxle5oK6+glYiXp7SUTLNRmN5npP0d7lDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wP+ZGYoNrsdcW3jPU2mkdjZf9aSAw/s29un/2D3KXIA=;
 b=oSM+qnjHwgy31Jfjo6iuiPdp7xLZ0Pf+g59KPU3dmUWdgeeD5TcJ8bES+RYbpYnJ+o+jjobAvYS/kQ+eN+/1jCNLxGWlzhvHsyXa4dF6CajpPW3xIUkm9HyJJisSBmq6WqrBTm2LiFHfGzoJcLx5opY5NIsJ+lb+R4wB/v018B0=
Received: from CH2PR16CA0019.namprd16.prod.outlook.com (2603:10b6:610:50::29)
 by DM3PPF83BEC1808.namprd10.prod.outlook.com (2603:10b6:f:fc00::c33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 14:35:13 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:50:cafe::4e) by CH2PR16CA0019.outlook.office365.com
 (2603:10b6:610:50::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 14:35:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 14:35:13 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 09:34:57 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 09:34:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 09:34:57 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UEYvM5049316
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 09:34:57 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1xBvOb-00000000jjy-1DNE
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Sep 2026 09:34:57 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH 4/4] libnetfilter-log: Move protocol=https into SRC_URI
Date: Wed, 30 Sep 2026 09:34:57 -0500
Message-ID: <20260930143457.175793-5-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930143457.175793-1-reatmon@ti.com>
References: <20260930143457.175793-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|DM3PPF83BEC1808:EE_
X-MS-Office365-Filtering-Correlation-Id: 61004a4e-ffed-4590-f2d9-08df1f0009a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|22082099003|18002099003|3023799007|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	e/AURBHpg560NfSPEsNjMgbrb1yKm0Bm8SsxwaQof9gwBixboORjNAtqFqn24mGgI5Bj2F77qqB745XMq0q5JExut72e6sUdLkxzCFELxmhTCf9m7/NAxmWAH7N0d0r4+kEzAS8y0UhjiwNr4aCF7OXU8B++67bteRBbgjKM8kBiDrLKk4MQsm0XS+nwcQMDrf/ndMqEJKsz8SWRnbbna7PzwlJ/DhYhVD2Cji291XomZ+uTnrzFcdDtbqYk+cwSkt4YqtjSDgQedjGf4F8USnDrvi/ayLVkZA14PjlJMXxS6y6fhyvgmDGjkwxIvkGaWCgD7oyX5GIYCBCY4+yFuiMHSDVa34+a/kSw7Z3Lm9y8aWuEBIhwjlfLr9zAoC5HNjNMF5xCLxibdkyd6tBg31QLdPIoEtfIUcOHxmfKtFuitjFLtBNTD/CDI9wt1PvuADmwVjyvEV1F4VjLU47XdlOK5qFzcGAmkw6uLGGcfiq+N5ubA9eA/JHaWldD8W4TDuxmPY87KFTxlVCCdOj3aHdIwWercvbTIxlQ+uOQvzz48t4mz5iModOqdKARvAOvGcVC+DvL+XyfCM7YEd1ARNAwFwzX8FgB69I96/7iz0oq7lJ2PvZe92gwNd5Wdd0GGxDqtFgSDxYMamg7MRRamA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(22082099003)(18002099003)(3023799007)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6RoBx3msQ5JXg7lRgAgjkSOR3F2PPXEJ3VgdEyjJ/WkznbHQypwKWQrKJwD8U2tl5aWjMRynN+q/JoCBDbtedXy7GqbdRBlIB3lRS5YrH8B+zYAFVGVrqXkhqg+9crVtLlyoXQ81MxIf3CMt63CZwijyay7qXuY6gWN8AyRqKmMppARbeZjDlsDdH7SQ0qR5yUJDs+GTm2g1/BoynL5UGv7tDcHSeAn8tHbRSeJI0YK6cdnIudJgyAlY/ksdATPGqv3GhO7DQ22NXmU29Q60HWeCBoOm+IDTapX93+4gvj3qkl69CtPEQvChI877eQ84plN9kM0GRqJ/nfFsbNjpU0IZ1sVPuJ0NpC0qnXDrF8bGxhGfXU5zunPJBQuLjx336RsTOs1aHHREjRaTOh8nDWpg1Psve7WxPsLVuzgW/N9uaM3o/YvEQUGu3anqXk7Q
X-Exchange-RoutingPolicyChecked: 
	S3gJjsGcv7A1qiFzlAc2ZWh5uFoiZMv0r9ZkUQbKIKllaBCRfC9kAOI/MfFOeJvnDaD1bKtgGLO6dim1bpmeE08AnYSq6+VPe1I25/dbliHlvQ60ts4qWqiGbKhR2yB1sDIoG91oFFuysMxIE4ebsyffHa+OCCZqfn9RehcLWvK2zBwUtNeMHKpbOvtCCAzj/oFOcfJ8zbUuoq+mwPCz5PPCcFKXLp+/00tIBx91TN5A4+98gM3fLc769bk+HbNpk01HYEbHW0XP2D8uiFQ8vwGKBygwdGh8KIQH37uQ0ysJfJLKPvUWs4qXfXIsPYK9g9j3F/Roj7Eparev7HUpmg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:35:13.1344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61004a4e-ffed-4590-f2d9-08df1f0009a7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF83BEC1808
X-Authority-Analysis: v=2.4 cv=VfRir1p9 c=1 sm=1 tr=0 ts=6abd1e26 cx=c_pps
 a=l4G2nZJL/liaK5VsxlxrQQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=3HDBlxybAAAA:8 a=sozttTNsAAAA:8
 a=RDLy3qvQYJE9ZMczDtwA:9 a=laEoCiVfU_Unz3mSdgXN:22
X-Proofpoint-GUID: MuyKyfKhl1RF_cArtlSICqO_ITMTmE0F
X-Proofpoint-ORIG-GUID: MuyKyfKhl1RF_cArtlSICqO_ITMTmE0F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NyBTYWx0ZWRfXygtSCJ05XQD8
 c4vS5Com8Lhc5RvhbkHFXSMOAn+bRuoT3ZzbDDtMUyksm//o/SNGg782Na68BTlNvW/sSGS0WeG
 JvUDy3aHxrSPmMhHPEgEy0ivMsBTDRO7SDvHWYKYAfEcjosy9GjHdyMJD4AME9eHQcn/RnGM/Fc
 E2wZEzQ76Bpx/spSoLJk49/BTPhEsSj8sfVjlwmWLPAR5OhdL7lGuZ3tNNQvjyZuAf4wbizb2Cq
 xBV8ArcHgBmMiu5RXBSYhg1l4U5kjscCbxWq5zTPhEkMYbY8ujVr1xuThvAB1Hb3oCvhUF2DjRc
 FhEs5QSBL7uHXj9JmRm7SR9fxku+i8lsgtBGIECKTay20PyVwt+PuiHdVDmsTDyLA+HtJVPR0bM
 oMAzGh5zm4ajf9FRBVDekO2lpkG+WStBRQt8W4aR3Gc/4JmBoRYiWxkSnNZOEiLryt8xSdYSdse
 jxOn/WqSrp0jfEcWMOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NyBTYWx0ZWRfXyHALt4KyQJzg
 aO6noiYSxEIIQ3ZErWA1Fl3oXb2wO9NFG4KGNab8A6YMXFZihB71Piyyc5ZxNrDbg1oYWTkFlA0
 TiwD5tPL9/F3OW8wzfkIMld/LbngA94=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300057
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 14:35:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130527

Move the protocol=https into the SRC_URI so that both mirrors use it
instead of the git protocol.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb
index 5082ed0134..3ed8fc8f6a 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "libnfnetlink libmnl"
 SRCREV = "b0e4be94c0b8f68d4e912402b93a130063c34e17"
 
-SRC_URI = "git://git.netfilter.org/libnetfilter_log;branch=master"
+SRC_URI = "git://git.netfilter.org/libnetfilter_log;protocol=https;branch=master"
 
 # See https://www.netfilter.org/mirrors.html#git
-PREMIRRORS:append = " git://git.netfilter.org/libnetfilter_log git://repo.or.cz/libnetfilter_log.git;protocol=https"
+PREMIRRORS:append = " git://git.netfilter.org/libnetfilter_log git://repo.or.cz/libnetfilter_log.git"
 
 
 inherit autotools pkgconfig
-- 
2.43.0


