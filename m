Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950F6CA5FC7
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 14:35:24 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14986.1790778922798219604
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 07:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=NjSIUP5h;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=E4VlSDLU;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE1KSW3057453
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 09:35:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=CzOpkiVzbSbU/jT4hv2KlpvCqOYzGq9I94J7A8RZj
	WA=; b=NjSIUP5hmVfr/6Ofo5poyssBP5oNoRl3kwLLsEtJKOJ6+08/WH5pyebM9
	zHzysBJEL67xZeGFTsb4+aco/YmZ8E/O6WIRh+FOswEqPx1zqvQpJd6+L0kiL+sg
	BAnMNjGVa+MoZJeTOJm/pIJ26aO3H0katGlYE9Mp8jWeHa3nM/eEGjha+sl4ZKWV
	tsBBV4Ob1dehuQ/AcP6K0VEq9UuJOpmhw85dhYzlcvxCKiY3VUqKJM8+ahSOD5Av
	FHI/F6aSGDE7S+NXIlf79rBwe41nMl4lzNlTQM9/BBUWlkMDXwdYrYeezEx+LkLj
	gkaSyXQiC7h/ld6Y6UW6m6CqZ9Abw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012014.outbound.protection.outlook.com [52.101.48.14])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0m9fdyup-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 09:35:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6gwOMjU2iL5xK4lI9SV7CCuzLIJDOuUopjH/n23txCQ8NtKRVG1woNw2YvSUQNV3uZMTd3LKsNt7VXzB3s99SlG2sRvmA5N9bgmvPyXYPs7V3mMAedHjAu9ZfKPoC5KJjGKaVaRL/vq7fbXFAveng4LtxMLt5ftawrS/4WDCT3X1LQg5y9RCrzQWHcCk9BGkkeFm7J47Mq7OYkvcLAYQALEMA5FnjZmC76HV8yk5CVwhkuc3+pRrVeF0pbCBFPbSo3V8BbNyq9FYY09rkysJqUwInvTL9ghdjexnvyLy/MK2IHN8RsFGvW3jMwGxaR50/8+Mu2Ai8YgzT6o+uzgZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzOpkiVzbSbU/jT4hv2KlpvCqOYzGq9I94J7A8RZjWA=;
 b=uKbc4FS7UyiLVuAkd/5zR4oSPXCWoHqOZiUuSiE2OQ6xX0RJVacAreCZUk79d+qf5qzrRvoeShkfKUGQhPTjwW5493SPVBBYu96ucx4TezhCNrdnxZjuQIU8ZtSgEyeYC2e8U3u9aCtC5EBbCn4MW27dA7Nm9RPcsl/9a2pT1MblrU1VZlmPLeRKnoS1AYvF/SHfmYs4XFzimvdiGgMNDaUVBnCMCq5Y9xqMD5D9xyAOPgYA4MqJDYyPd0Loddd+/i/SpYvadO+JmTzvE/gmcKlELha4JeZAMprabF/TBCgbnl7HU+0zy3PpnLSp9V0Evqwvm6b3rClqnIy3yhiPeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzOpkiVzbSbU/jT4hv2KlpvCqOYzGq9I94J7A8RZjWA=;
 b=E4VlSDLU5G6dBR6x0rYV5wfs/QiMc0E8H01L0VIqVjIUwjJk4fhDI3+VmR8M3UkkMzmNipJKsUceoV9Y3m6YbLUoed/44EO5Bfltt0TSXdNUFtFEyzCXA6ml5pjTsJsjhIzBIaZzJU1aAD9YFnIR5rzM3+xlsKeEiB3I9ZIt/9s=
Received: from MN0P221CA0006.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::12)
 by DS0PR10MB7127.namprd10.prod.outlook.com (2603:10b6:8:df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 14:35:13 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:208:52a:cafe::a) by MN0P221CA0006.outlook.office365.com
 (2603:10b6:208:52a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 14:35:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 14:35:13 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 09:34:57 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 09:34:57 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 09:34:57 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UEYvmq049313
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 09:34:57 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1xBvOb-00000000jjs-18Pd
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Sep 2026 09:34:57 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH 3/4] libnetfilter-queue: Move protocol=https into SRC_URI
Date: Wed, 30 Sep 2026 09:34:56 -0500
Message-ID: <20260930143457.175793-4-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930143457.175793-1-reatmon@ti.com>
References: <20260930143457.175793-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|DS0PR10MB7127:EE_
X-MS-Office365-Filtering-Correlation-Id: a33143a9-1355-4ffd-40e0-08df1f0009f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|56012099006|10067099003|18002099003|22082099003|6133799003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	XhRljeVduMoa/n4Qw0oCZG8opYgNTu1Rkntay7CJvNL2RjS419z8p6rmXo1g82VvekETIi3ceFPIoUgxRaW3dsuVEPNs+5CrtNkglGoOtWvWmK193cd90JzzviI1O9aAq+mnTBZZkPt0oLcacD3g9Gdr0oI/Q9Z/fqQOXtB704ujOJYOugqG+rgRZ4UCUpB2r/2X0wzTwN8WuaMxP0eA8/+uXt9mnnpR7klM2F74nkwx9+nbSvjsEHdbD/t7lZJ8buwh47EOpK0NxbEOrihISeZFc6lJLIDc6hrJMpTSxl5JAtS94II7iJICwDot6Vi8cTq3cQmxuAVkrKkHl9BqUjZQ3lwJxzDBpstn/7CZHUZc2kSKlbfigbjycqfEuVlvUADoL5f8TAjFMAO+W5q5s+NstRFmGMfaTCTIpcNQ0TQM15CYFE3oGaIGmDXu5jU4QF4fiuNH+U4vgd5h/hrwFim78KneM8ExthNcTPkoquhRCie/SY9PPHinYsjSNwcW3gtsoOpjwmCRSXo/afELbY09PEKwCISJqUmoGOHHgbkdUESDYxBhuRpvmYaf/sAU1jYyJmqd7T3DbIxxQ/pCkWMrEvlHYvpMdpFNOEDXwaNBl5rWk0gp2xVhSMpb5Hm3ID2gYbyliMkEwiyoHzA1Ww==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mR9R2Bkrjau6uUEbYbTTWs+nD0emk2TeU3aBmNa1/E3PaCjWJv8yHPj4PEiRW7A8X7QXzjNjRds9EecBRYxA5Ih714ubY4dVAJUp/NjUzgfgNS975AFVZzzKhT9/7X3HleJU88SlaXcrxkHdWlMjraN9fdnh0PIPL2QkBVWCO4Xr1he+vLwKh+fHmbV+A/1hNeD6MebOPjZLyWBUHCTsPgmPQhsGckMd9uWxIlARapxtuxxmo41OVexhCP/LN7RquYcAcqXYuP/W99xh3thVq9rXQ4C0E7W65CaZQkBdo2bpNSmKWjy/2m7aYWILCHwROGvdvJKlAASQMYC4Gc0/Mb+IOmUKuxTKzEgkWBHhw2tbqvPRjwM0sjaUHu3snmeapixgr0nQ/sAdweu5iNFCfPZMmjB6C5p7tGSnKCJP1B5GHdpSZtdZVfMylizmOV7x
X-Exchange-RoutingPolicyChecked: 
	luK7vkYroH7yVNyHUO0z0lyaJpr2SgKfInGz96yf4M6XYuTWp/CvV3x8lZMGJGKbSdto27BJvQ2EWU2k7C8hlR7nxtEyBUyGsj6V83meLCY1ur/nGVsHVYRxJ1/0v7Vi4nHcgLBlSwz4mKSDtOfWIYoh9XFkeotvwcRujOjEJpxBBDreTwrtBhjcEC/QO5pmQ2kvMXuiOCIXebtL1bLUfFUMKnXIVnbLnA+BOSSjTC6VTJlZzu9nSdsLo+btBLONS5UG0yV2to/Nw/j2Us+WCsBvbUZOqguHJaHqQ0htUg6OC6dwzaMo8+R6J0lBepWi1DX3/7pydScmyqE4ri4aVg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:35:13.6385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a33143a9-1355-4ffd-40e0-08df1f0009f8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7127
X-Authority-Analysis: v=2.4 cv=VfRir1p9 c=1 sm=1 tr=0 ts=6abd1e29 cx=c_pps
 a=gI/9N9KNcdRJH0Veu/zMvA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=3HDBlxybAAAA:8 a=sozttTNsAAAA:8
 a=qisqCEN-_qMEkj1_3BYA:9 a=laEoCiVfU_Unz3mSdgXN:22
X-Proofpoint-GUID: mMbKxDZrecvI9jAg9flTzXfuX1m-wc0M
X-Proofpoint-ORIG-GUID: mMbKxDZrecvI9jAg9flTzXfuX1m-wc0M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NyBTYWx0ZWRfX614YiTuwfDfh
 HDEI2Aq4h5sYRjAd0gqLIImryEMPLsHCDaaxZO4bSLUmS0sDfgEGRNTdOt6rCWD+kQ4Q29GOZZn
 7eLMBE32I2GcCR4qLJ0ilK2brD73mCooxO81KJbRn5c7AQ8g4jboOgYMHxvP1zP1DGz8DRC2Tfu
 OJxsgkCvDEKPt1Z4Ru1x5RBa9RU9rPLddYNoalgo7bTPFMlUSBEw0LHPfvhcQHv/pcQN9mMSiUG
 cSHhskpXpXtPBoHmKWePC0YfdFViCm4KP1teCvLM3LUb8uASs+Bu6sCfJjGiQda3R2vJM4rkViS
 RgIS6Hn9nfNfbNkL8R4x1FdHcxNtc/hLqzz8fQgZ2AX/UVRI2PGcz+Ef+zVMyJKyrJJXF94l5zl
 bW2K+hPb37G07Yj6Z9yy1caKJy9ANVhTcqXVkeMM+7ki5Usluq7C7jP1E7D3Y2bjiK1TWmr7mbn
 oEuu0ycLJUB67f08PNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NyBTYWx0ZWRfX1KY8rQFhutcm
 5MWo+Zhkg3MMvLXlST7pkWxKh+QQJpV62weB6CtYYyLXxhSsfo6gV/8ZcZBaVqoAOBXMViYc5F0
 s2DvQAIAOMuJ3bgABYBzPOxAxa6yvO4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300057
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 14:35:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130528

Move the protocol=https into the SRC_URI so that both mirrors use it
instead of the git protocol.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb
index 6c8731b4cd..8395fb3e54 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb
@@ -8,11 +8,11 @@ DEPENDS = "libnfnetlink libmnl"
 
 SRCREV = "2ff321690b8dafeca99ee8e9cafac71e36f292b9"
 
-SRC_URI = "git://git.netfilter.org/libnetfilter_queue;branch=master \
+SRC_URI = "git://git.netfilter.org/libnetfilter_queue;protocol=https;branch=master \
            "
 
 # See https://www.netfilter.org/mirrors.html#git
-PREMIRRORS:append = " git://git.netfilter.org/libnetfilter_queue git://repo.or.cz/libnetfilter_queue.git;protocol=https"
+PREMIRRORS:append = " git://git.netfilter.org/libnetfilter_queue git://repo.or.cz/libnetfilter_queue.git"
 
 
 inherit autotools pkgconfig
-- 
2.43.0


