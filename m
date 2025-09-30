Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D60CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 07:18:50 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.67])
 by mx.groups.io with SMTP id smtpd.web11.10620.1759303127181661610
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 00:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=SAvdaquw;
 spf=pass (domain: axis.com, ip: 40.107.162.67, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MsuyDq3A5bxtsx4MCR7nMbBJsg7Y0xh9Ccj/1SiTRs5H5NEvKcJa4O/GR3ixv2WWGQKXP6OeSpdc4z5pKOTt4suo2+ciML5bzVieGFN1HwYMOFqTfTdNWwJ/P7i1aoQkXgiIGQ0bDc5+1tNVGo70rV2BMsAXOUkYFnWz5SxEhx1jGDDPyYP+9TdneAT0DopkEYTB2sHk6PwbxBGlpmDy8eOAy+Zfqu0S7xtPp1EmjtPv6ZGGb8HrkkzpWcH2LFyUb3Rcm0br8rfoN6CahmxYRD6H9naSUGuHmHxlZHScISq5M5r2I301M0z/q53lNMIlo2NXq6ATkoddzZjrWz4yqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0BJvMT2/onLj7GKILHDaDFwlHI26lTDzzk+RpAC9Z4=;
 b=ig24/81+yEUvVGXg3CMhry2W4dWHB+Pg7XnczMwrx04+BQk838R8cSvAT4gqDYLOKbf9eukLEsM3LkYbXou9qcGW16jQk+DCkoQLnij4BirddO2l/FwSEqVWQ7yMFV4h7jr61b+hu3ttWCFOah7r74pmsbJ8q/4oSApe0SolPL+D14WpdngTX7XlzOsBzSn1+CTp4tbsj1Jz4MVrFAxoUJ7DfaR3uHPyZgVtAlLYsncU7Dp3UbMKfWOV4QwHwKX0CvSku2km6h4jJqOMavS+BavIsvvTXVsBlTqXc0ErESzouQUBO3M16q1L9yhHPZ84eu0X8VL9Z19JKIiry9t5aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0BJvMT2/onLj7GKILHDaDFwlHI26lTDzzk+RpAC9Z4=;
 b=SAvdaquwRFIBqBg16B+dUTEWxV+Y5H5iCCq347Cz1ii7wFA00wvXfY9G7opXZUzeUzECTrEjpKNpNAIT6boIzuYRMivhGGRspXUT+tgL4HVioPkkbafKj3hq/4pnUaRx7A3LDqaLfJl6WqvJlRI4V12nCt4gL46+/cL3AyZ+W4E=
Received: from DUZPR01CA0106.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::14) by PAVPR02MB10414.eurprd02.prod.outlook.com
 (2603:10a6:102:32c::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Wed, 1 Oct
 2025 07:18:40 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::cc) by DUZPR01CA0106.outlook.office365.com
 (2603:10a6:10:4bb::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Wed,
 1 Oct 2025 07:18:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9182.15 via Frontend Transport; Wed, 1 Oct 2025 07:18:39 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Tue, 30 Sep
 2025 21:46:22 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Tue, 30 Sep
 2025 21:46:22 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 30 Sep 2025 21:46:22 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 68876706
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 21:46:22 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 8D80E1294AB; Tue, 30 Sep 2025 21:46:21 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][walnascar][PATCH 1/2] glog: Support building for native
Date: Tue, 30 Sep 2025 21:46:18 +0200
Message-ID: <20250930194619.2348187-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8D:EE_|PAVPR02MB10414:EE_
X-MS-Office365-Filtering-Correlation-Id: f0b7c164-aff5-4b18-25d0-08de00babecd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KVXncvM48aFGqcK47xF62Dh5mjQJ78uAGQe4ox4A2PtSyOkI+aO+QnjiN3vj?=
 =?us-ascii?Q?wtbH7GH8AZcJyQ9KI3D7NjD2+iVqvLS74r4+FxZkYsMZL1zENLGPRiNnEwyh?=
 =?us-ascii?Q?zLxmff6r1lWxwZBoSTugpO9q+emt/ov+oRC0JUTgE0rrGi54pI2g3AjdpwaE?=
 =?us-ascii?Q?4JjATvmsife0+HNTKf6z8kdhzZLqK7SWpS3jXkS1devg11cfSCUzOYIRV1aH?=
 =?us-ascii?Q?5ZZ9q3pmR7ocIRMncDQ4dxsFmRP/RPYzs992dfqR8JeAdJgYKO3xTMmFGCwt?=
 =?us-ascii?Q?jD74QrZMf3Vi3EUTRAGQVRBX0Z6HR5la8a/E2EbVw9zzqxtuYTkvyXScpy2I?=
 =?us-ascii?Q?lqS486sSuP/5NcJ63R9zmR04sVjEKyn/RAfXho7wtgvo1bk5UbjcLlRf3kAl?=
 =?us-ascii?Q?2pDiey6aw9H2wT0hlGV3zxUp2Fn4thdiB5zM8CgwEhSFMiLfqAH1s7DtIjgq?=
 =?us-ascii?Q?u7MWnwQLje/Wj0dSMRejrY47dusm0C8zJNXlSFSv9IPnaL640mlZ/zQkVyRQ?=
 =?us-ascii?Q?srRSbpRew+Nffu+CT1ZmCeIbSTQWYRyl2MqVhlQhp8Kn8bpp6JCh1yh5eHFT?=
 =?us-ascii?Q?3VvCd5kp/33VDD5BXTk+Dilr8P24CYkPrpxRcV5lBVlzTwB+HEPQnjgo0I0V?=
 =?us-ascii?Q?5Z7hdXw410MtUcSNsTewKWnCf583KNBt7sBYy62+FZ30YMVPNnxxjD0/nA7w?=
 =?us-ascii?Q?c0mDJr0lePUHQ3QUmQ77I6ahHxVPhKHQHNIKRoRUmt7+p0Yffv89amP5Pfly?=
 =?us-ascii?Q?q48enUfFPJXwtpCLt1hQ08NlXlepsRGJZ6JgyZmBB2V6waYWTbWmI4QOxekg?=
 =?us-ascii?Q?UhHu4DrOEOjyxKts00ZPl5Cq2d5rE9vmnapMNW5EY2d2A+oUdXkeNNATLBt7?=
 =?us-ascii?Q?JGiilPotOnG0780eIr8Du4BejmODp1rHOoCdsJkivDuNrvHzjAswCYY75Yzs?=
 =?us-ascii?Q?rohnygCuN6mSR8hrNcd6REW5icHWA6K5Wc2BLs8E7OcRw/IbU4budLJL/58U?=
 =?us-ascii?Q?yBw8tyHDhHr15+BFeLb4vNf+ISGQ0QAg0f+FxIUmidTsyLHjSWF5JxLAzlE5?=
 =?us-ascii?Q?kfzhv7870lclJFGwKDQFO7YwxgxL3XH1Tf3dlbY0KUC7DggvlsKBjk5RF97T?=
 =?us-ascii?Q?5ZgkFmp1crm8Q1yyhi25BFl8p1XKDtysdsO1oxE+QcWux88H7UAM6ujG6fv6?=
 =?us-ascii?Q?Hz1KmXWW6DlXcrHaJCnc43rYDNPMZ2xFvjG7+MuboBqwwNod+KlSx9+1TEy/?=
 =?us-ascii?Q?hTf9zZEsRIlvTUmvGCgNoLeGjvRC9S1IZ05Vjl8+cq6M7iFQHSKadoSPWvvK?=
 =?us-ascii?Q?EOwOM7fUzpogNdxOmNOtE95aS7Tcf1Fpp1bMkY5zeq/bbZIJ8+wtWEs0luHI?=
 =?us-ascii?Q?s0LiX4lusbUnw+BQRmgxoOqzOT4C4qgf4gcy2EMX+OGgQqvUX76pxN463l3G?=
 =?us-ascii?Q?WxqkAnh4rl/yVZnhzIcu1KqZsD0G+otpG/ALB1kVdRj6K3si6QrxfFVXzmPm?=
 =?us-ascii?Q?8q70ryO0od6suUzXG49LewD/xw9T3/3RNluwEr6N6C3Aq8cggc3CN8UKhCxO?=
 =?us-ascii?Q?/Va2cOIhdetlIoO0lp8=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 07:18:39.7754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b7c164-aff5-4b18-25d0-08de00babecd
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB10414
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 07:18:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120090

This is needed to build opencv-native.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/glog/glog_0.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/glog/glog_0.7.1.bb b/meta-oe/recipes-s=
upport/glog/glog_0.7.1.bb
index 586afcad53..71e51f86b1 100644
--- a/meta-oe/recipes-support/glog/glog_0.7.1.bb
+++ b/meta-oe/recipes-support/glog/glog_0.7.1.bb
@@ -40,3 +40,5 @@ do_configure:append() {
 }
=20
 FILES:${PN}-dev +=3D "${datadir}/${BPN}/cmake"
+
+BBCLASSEXTEND =3D "native"

