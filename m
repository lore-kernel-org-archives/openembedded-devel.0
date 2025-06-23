Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C404C7EE30
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 09:22:08 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.13])
 by mx.groups.io with SMTP id smtpd.web10.15615.1750670524149955947
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 02:22:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=YtDBKzKR;
 spf=pass (domain: axis.com, ip: 52.101.71.13, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RRNh65wCLWTKmYrgVvcR/51Yvo5Mmy+LnVrARe0bPdtkuZh9wCn6c8t1a/W5F6q3Wk5TDDW+r7uriSAl0zvUfB8Qh4xPgE0VTH1MFUgpE9A4bxXt7VZBwl+inbz98zP1Qqh8YSChStKEBVnUvtLX+UENh/Y3jWmIze+I+/8EM1LR+K9OmlzSXcpW+gko8wwmVVvNgJcTBF6RhkMQNj31LYSvKDwCdOeSRNuvAVf34AXMpm6TMOa6sZsjS5S7PYvN3kZg4pfOLuCJ+orjWXh285AKQ9E0HP+Cq0yEg26QbrZTZN+0/NWWtausEeaAcrVIb5ZIHg6YKREuOcfEWwq1DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKh95LvJLB3n/koXZ0FiW0EwrwegLuevn58sT1PwP8Y=;
 b=vneeR1DEm71UgcyGAaathwhOnYEY9wa2olbqIVy92pTz23Ym75HjNIfQKqlXaFiBSe0/eyjmBpL2L7ehi4d8/yUHq1Wk6CneeuQM5AsJLX8tgfJZ62AijBa3VQzBHhm8zqjaYRBJaxsv317cS8Bk+sYufp/IEiROb2GYdDVv5JsCvSlSnWwOTVsk0TEbi2DRNMUE7XU+4NDwvJYqKmvN60Xr04ryOtwMxfey8XleEOuiEwHnuIFgx3q74JxJ5goktF2XBGkxYEMGnQmyf3GqECvOxBT3S/duqiSoFJd6bpGACQnfgwS8GdPx6s6WbNSWfoGTN3HYanpfp7FPL3eWrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKh95LvJLB3n/koXZ0FiW0EwrwegLuevn58sT1PwP8Y=;
 b=YtDBKzKRO88lXVeMO99t4+t8HlLiCfQUiPGo9iRLIeBD7+ne/roPLnf90Ya7rs+va7pPpUw/i0AwvuAb35VxwzsP8xeNP1QzXno2HgzUqES1LuvwFhnisiSg5IO/UQR8oMAAYzGbgV4UjLig2tr8kq7nhM6ZtfHPASM/nB1LMxE=
Received: from DUZPR01CA0224.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::20) by AS8PR02MB7366.eurprd02.prod.outlook.com
 (2603:10a6:20b:3f5::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 09:21:57 +0000
Received: from DU2PEPF00028D13.eurprd03.prod.outlook.com
 (2603:10a6:10:4b4:cafe::3e) by DUZPR01CA0224.outlook.office365.com
 (2603:10a6:10:4b4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Mon,
 23 Jun 2025 09:22:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D13.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Mon, 23 Jun 2025 09:21:56 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 23 Jun
 2025 11:21:56 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 23 Jun
 2025 11:21:56 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 23 Jun 2025 11:21:56 +0200
Received: from pc50740-2234.se.axis.com (pc50740-2234.se.axis.com [10.94.131.4])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 8B318299C
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 11:21:55 +0200 (CEST)
Received: by pc50740-2234.se.axis.com (Postfix, from userid 21184)
	id 26F852597689; Mon, 23 Jun 2025 11:21:56 +0200 (CEST)
From: Christian Lindeberg <christli@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] influxdb: Do not skip it anymore
Date: Mon, 23 Jun 2025 11:21:56 +0200
Message-ID: <20250623092156.2261942-1-christli@axis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D13:EE_|AS8PR02MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: d466c48f-75bf-4588-0cab-08ddb2376652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0kjg/BmeQ7S32UALEmAAB7ALzGr0B+NLfUew5uSxRj6lrqhKusixkdqp09Bb?=
 =?us-ascii?Q?VdODp8lekUW1o7tDFDjpG3X5dkhsG34BezUNqJVhuOj/Tr+QRgoEoccutE19?=
 =?us-ascii?Q?gciRYYavGmymcWbq3scPlGP/57oxdpXqX2/xVd62uOh5bqEMKavHM26eyLrd?=
 =?us-ascii?Q?EZko0aDdUSgMvpgBmTtxnerHaZ7WfWlq6XoGgJyhVJiKD7fLmriL9qiR7sSL?=
 =?us-ascii?Q?Dz3bObZ0S0+ciSLOtU1ZL2IxqBFd4yAi/b3lPUbYHBa2fojafnTFTJKLKLCC?=
 =?us-ascii?Q?FGh2O0MweOkqo24+HXA2UFu97v4JYcRcsWzRE9k39yqKXnQ+j3gfU0IFekWI?=
 =?us-ascii?Q?lqKOsKa/uP+PmuP35Fx0nDBY2yDu6yi5YZZA6HNgK3MhDRpHOkcOV2zKQtrY?=
 =?us-ascii?Q?nCbN6iWpgTCumIZUlwTCX5yILhI8UfryNsP+GKby4zSWBUzRVaHNWtsXrF3q?=
 =?us-ascii?Q?qvb3nU9jrFYOIOrouluT6Q1x2nlpleR0fkuwn0yYh+ZjDFJXkwwVMCncpnZl?=
 =?us-ascii?Q?puAPisFh+lXHzPtntnFoyF8YG9W/nIHyluuJEajvSU8vFmTbmp/1qK6FRCgN?=
 =?us-ascii?Q?v4+Vxlis9xkRQX/dX9puIWFNTomP9CnuYYsY6ObCp0vYk7mS0wewQuuN39Gb?=
 =?us-ascii?Q?j1Baza9qdkQW2Sxac2kIdY4O8TZk8tX+spToE4jf6VhM4fBh9snEzqRCtihT?=
 =?us-ascii?Q?hvp2dZTvGKvXPlyv1gFVA7GNGck2fC8HJEdSeZjj++rF5HMO50hlRLpM6oUK?=
 =?us-ascii?Q?dECIqqSMxJ5GDNsNQ+9oGdshfPRd/xjAZ3Q8SBR0ECklpuJ5sdZnifbjRKRU?=
 =?us-ascii?Q?LZCSyRFWIEIiolGTmg67KL3+DNLGNv4bjjafexFwn5val3MMuNNOCRnIq6xl?=
 =?us-ascii?Q?EMOnoLm6C4NrLIElTNjKK3r/wz5Td4LeVPB+uS2bHsiFDjIc5lZI+k/w1B1S?=
 =?us-ascii?Q?lJj3nsOpT03fzlG1YecQ5e9+bkidHd3dZfDSKS/j7uJEiAKIM+1EoFbpjR2Z?=
 =?us-ascii?Q?mLyUXM7UwVL+AajzHIV00pZ6AL/p8AXyyZKnJFJYWdbNyyl34KSdptSoJBdT?=
 =?us-ascii?Q?e73BgUeo8FW72CD8sISvnt+QNnJVM7DoOgIlqjvra1VLeZgifqxqhj3oiFfb?=
 =?us-ascii?Q?zAxuEnGtQi33IMNzIakVwwM1QZkPXmWDvuH2QAn/JP2jWiIcA3LFPSAK4t5A?=
 =?us-ascii?Q?MRbanPHNdN5c2jQLiFtjuGzXnaZxhwIv8hAzjyCiI50rvK5ZXSvGGe9DyUPt?=
 =?us-ascii?Q?YEBQFUjEmVYvh8vz7NOxOqnxiGb7BTOBehUo+/RXq+nc7SG5pBpWdY1gcHjJ?=
 =?us-ascii?Q?UUCqzXDdV71lgFplw4JydLG8jaj2IFk96Ecnzp5AzWYDrFlXnIi8eH969jq6?=
 =?us-ascii?Q?YjAFsEFqOkk54hfUX16e3QzqXModuYQ2tpHMso18DBjPyucaHdTSLxViiU4p?=
 =?us-ascii?Q?5zkrvxidc21OkUIP7mpe+0pfzUYK9HIc/2ulgP1AMj8KOK+2N8MtMOlZaULv?=
 =?us-ascii?Q?7zEjax6C1uTHlVVMgsNP4JuzsLC6FWHtLQhR?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 09:21:56.5590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d466c48f-75bf-4588-0cab-08ddb2376652
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7366
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 09:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118068

The network access during compile task has been resolved now.

Change-Id: Id7a8510ae1095a2430d26015bdd6cc54b633781f
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/m=
eta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 2055a0ff91..1d6c45c518 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -201,6 +201,7 @@ RDEPENDS:packagegroup-meta-oe-crypto =3D "\
 RDEPENDS:packagegroup-meta-oe-crypto:remove:riscv32 =3D "botan"
=20
 RDEPENDS:packagegroup-meta-oe-dbs =3D "\
+    influxdb \
     leveldb \
     libdbi \
     lmdb \
--=20
2.39.5


