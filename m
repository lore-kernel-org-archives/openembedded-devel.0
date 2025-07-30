Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A1AC87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 08:35:48 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.126])
 by mx.groups.io with SMTP id smtpd.web10.30506.1753864546515553457
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 01:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=D30y2qJt;
 spf=pass (domain: phytec.de, ip: 40.107.20.126, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AdM3IElKGxAi1C3w8CFHPCCXVeK1VQJzz37pWNqRzF08fbF6Ul2lrLCAG83b51xf0MJ5sCV5hwdBEjtg2WEjtA45TdVxqjhgsT51zgnu4DbehxMRcWvfNQgQ5y8m7oi76zkezt/xkMf6MqrIQBXlkM7aaZlagcbQqCZpKDLcGV6ZK3XIIuunUYSBBbhfv0y3tWZ23yCdtRsIeUSWptwrSdoBZnI7hKg3tXsNOE9mqG0Xq0jGDmnKVG8cursNsvYtm7zaPBqkwpcbKFjX2XVDdfo0pV2wr/g2iYJCBb6JsAaK8O4G078JRazVfrBC8boUtLWndqYTld1BjGAYzdb07g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLQBhgQhbuLaAzZyYsYZFMCT8kGqQMlWvCCS3Pn6SKo=;
 b=jC7aOnr6pOhjd92Y3mP3uu4mdNfbvXPBdLi7YAoFxvYHLhzmOeubcGVfBdxv+a3b21RyxtXS2piRMTP2QTd7S9rJ9a4B8Cxjre/66xZav5+57Od8MHGlqA0J6HZgUn3IBYtqbCYX27OVj5qKEhYDSlvZFjair4gAQbdJg7Tk0m5bgq/nNitNbzIYU9fXs8kzkLWO8eTWWGKfpO7PNroHc+H6t6o/ekgSLShBVgW72CCpLosgbdFb8+H6k5BbPtrupfFjavLi2Ix2+4/xhScXU1/8OWynJAsG9wZHmF1qwvEWpmXD3xkbFnU5zRlmMdiSAEfuBhEnZ6JTUnEL0r9oJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLQBhgQhbuLaAzZyYsYZFMCT8kGqQMlWvCCS3Pn6SKo=;
 b=D30y2qJtexu5iXyvvfb5pXTsetw/sDzRJt5dRKozO/rNiP+uLqVV2Qn+UmTDAQJcXt7KrEgOnhh04cy8L6iWg0BxjtAb5TVDTCKX5fc3L9vZOz2vFjG+SrHbP0g/VWZ4Vj0gYt5YgGQTV29dDQzzHH6JU9FXpRoqi1h+yIN7LVtCJYFaikK8vwkNKetxYsxgCF/EVUhIC7ae7B9Ib+VUPUsMv7nz1vuRt0Po7SlVKnesYgsmod0Rhlxt/hiIxp4/SqQC+IjP8ZljFMb+45pI3mKH/AxapOSwlvv0+P9ryQZiPEbIoXtHuHm7TWtFma0L7vtjfQsCW4UMq3srq57BHg==
Received: from AS8P189CA0009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::19)
 by AS2P195MB2323.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:590::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Wed, 30 Jul
 2025 08:35:41 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:31f:cafe::22) by AS8P189CA0009.outlook.office365.com
 (2603:10a6:20b:31f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.12 via Frontend Transport; Wed,
 30 Jul 2025 08:35:41 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Wed, 30 Jul 2025 08:35:41 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 30 Jul
 2025 10:35:41 +0200
Received: from augenblix2.phytec.de (172.25.0.51) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 30 Jul
 2025 10:35:40 +0200
From: Martin Schwan <m.schwan@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] linuxptp: Add systemd instance specifier for ptp4l dependency
Date: Wed, 30 Jul 2025 10:35:31 +0200
Message-ID: <20250730083531.1363074-1-m.schwan@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|AS2P195MB2323:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e2699c-4716-40e7-8490-08ddcf44118d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oyeHHQfmGSqKzmhMzgMszHZ9NBiIMvtp+hD/6xbmLZrW3hkdi5eMR1VqMSAA?=
 =?us-ascii?Q?SLYDGFntjRg6WbZ7XQfyerxJ1n6BcuW4s7+N0+nh9vpV3yGhdJmw9uDXuk+r?=
 =?us-ascii?Q?5Xg3CnFYFbgvUGKWihaeeSn3UGXxMS70ziWiQyZH4y1qhiFNtkbvkuQDcK8Z?=
 =?us-ascii?Q?irnddvwvFBfH09JyQIaeHAs7brSzM7HhhFAwu1DKb+2GSXtIQEi7PXOOAkcp?=
 =?us-ascii?Q?bH2y0TSLphCfDpMst/NFRDDHmhfDT9TUCI4bofulaiaXK4k5RJ8BN5lExmZ7?=
 =?us-ascii?Q?R/bpt8zj1TynrTr5xK0CNs7jLdXcBcd4ieKV8Eabj48hM531I5boJwfxmB9Q?=
 =?us-ascii?Q?HV681JUmgZtmVeL/xAbsG/88FLFJ7uUq4Sr28UR/hM9Je7YnRuILpp4Fn4wA?=
 =?us-ascii?Q?Y/X46bHUqOi2xRYgLbh7rcwrW+m6JyGP9JHGwnPo1KS00qlIvcUxgdhO+NK/?=
 =?us-ascii?Q?XBJ/E+jqvbjtu/e/xpZHwahzdHHmj5pNXXZd4rThVJYXsDH44o1mHq9ICPNS?=
 =?us-ascii?Q?O5VPo25F1i7feU9z4wg6GaeT4YYu93ZQOuZFeglyHf6kmnH3Mxf0USot1qXW?=
 =?us-ascii?Q?9idD22k96iIY0SHqedQOKAJAtS3cA8nKisYD5ACCnDz1VEPeowgldi+39rDT?=
 =?us-ascii?Q?8vWoOC6JPp3f+GzFoLcEcGUPeDteJxg12xjDP8yRKiYE5m4aMd8j4u0vMy5w?=
 =?us-ascii?Q?s+EJlkRH/SZazQEJGP/FbG6UkgXGQDP6sQtKMz1fBtcykaC4Wbu/KamdfYSC?=
 =?us-ascii?Q?RcNTMrCyL2TIfW3l+Fmqa6S5V32bfS3ybGChgZDkBCfQ3VjFEEWHeCSrL9df?=
 =?us-ascii?Q?1KHSmIlwXf0+m4wseCjsJPi+B0i5r+DDOLcWGJxdAJlQCwVH+da8h9KU+YQm?=
 =?us-ascii?Q?sCtde7OAFtI/v84hpU15DLuS3uJa1m4/MOqIOJts7WSIx1z1xw36SsuxK0Fz?=
 =?us-ascii?Q?ZROBrycDedxiVWZBdopriB0lhmC5JaJuSDsT7w1E4BIFy9PC0kEsaL5abXWl?=
 =?us-ascii?Q?I6ZgIdg2YR0+Faq0y+W6sgsOskqeusDkgiqw+2U8HiLBpUxgJPK7HP8TYLkG?=
 =?us-ascii?Q?abaPMo3/w1ei3QQDAhoMhUIR2Dk2KBL6Wk4EMMIDncb99YyN9o0B8yJser3a?=
 =?us-ascii?Q?BYZwgfHh2/p3HsTCSh5STdGY1a56imnYrtbgcAxDz16snfKCmCcJ8IPeA9/x?=
 =?us-ascii?Q?jMefESc4JlobapomB78yas62Xipl37G0pGuDmT7rBPRarbvD0BaRF/CS53X3?=
 =?us-ascii?Q?rDsJIeAUug7E6UqG4nfwrpUKrGG21BMwx509arAZpMjf0708p8OLYWAJnuNP?=
 =?us-ascii?Q?YVwYaf5/FU7cSJON02P/OtMm7rFXoPygT2V0pU8c30L5GH23fi/xdyvMZbWW?=
 =?us-ascii?Q?ai3H9tx1lz8y3lfiKid8bwaQb2TPaBnha9i6wyzij95g2NxkuR+zH8pyO+ph?=
 =?us-ascii?Q?q5aIeHmgU6ikoaJW0jsvUO1TM+d22QNxnMEVcd3/iiyRz2u9EW3jkv1NCAMH?=
 =?us-ascii?Q?JSK/r7gqg66GNASWcmlDxs1yga7UlO3WL/OD?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 08:35:41.5247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e2699c-4716-40e7-8490-08ddcf44118d
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P195MB2323
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 08:35:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118766

Add the instance specifier to the ptp4l dependency for the phc2sys
service, so the corresponding service is automatically started
correctly. This fixes the following error messages, when starting the
phc2sys@... service:

    Failed to restart phc2sys@eth0.service: Unit ptp4l.service not found.

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
 .../linuxptp/linuxptp/systemd/phc2sys@.service.in             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2sys=
@.service.in b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2s=
ys@.service.in
index f66dd2d010..7d1d975ea3 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2sys@.servi=
ce.in
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2sys@.servi=
ce.in
@@ -1,8 +1,8 @@
 [Unit]
 Description=3DSynchronize system clock or PTP hardware clock (PHC)
 Documentation=3Dman:phc2sys
-Requires=3Dptp4l.service
-After=3Dptp4l.service
+Requires=3Dptp4l@%i.service
+After=3Dptp4l@%i.service
 Before=3Dtime-sync.target
=20
 [Service]
--=20
2.25.1


