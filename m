Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C2A6C36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 04:05:13 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.71])
 by mx.groups.io with SMTP id smtpd.web10.4928.1743221104163848040
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Mar 2025 21:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=g5ys62Da;
 spf=pass (domain: axis.com, ip: 40.107.20.71, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPPNRa7SV3wvhLR7SWlLYebZyCb2TnsAvjK/LMrLiRgZ+qHJeORaPQJxJ/3Eoaj9CuXczqEsCeDYEfVmEEsXWB8ax26SOln+e2xREIhFhLIQ8CSdOmMjlAMdXM/KEXbNiDqAiMjF+DLeKL9QZOPAeQTCQSfVvHAv0vdKVuRdBENnzx6bAWP4cdLCAuR4DUB6mIeobsrR5vZy959XOT5MkmdbgtCx2KxSswy0D8VHNrMQRDDBjqMr6RycWEIPXQ8V7xfsUcsnOtfXnWp10GzrkcGoNrj0BuiQMuDLtQcnBO9w1pBO1xaGDzzfESCsR9Uyl6RxBgpcL0fkul8m24iEEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2uDdMYsHvzxFbkTrWszfH/vihkd8TBUdGLZFe/G++4g=;
 b=En1xnYLCmztsHSnbT0V9E9ys+9Eobgy34aeqcu6TG4KTQ9DJz+wvrBqnD4hE4g1TgD3Fzmhlw1Uq8HlJoilTlObgprUbz+ASFsIjHIPft7hXGee5/qVSjCUdpSRLtIGln3+72wDtN+tsHDAVxOgORRZza1dX/j/gdWy+hlI3Y9fluEWwupckqBVlghJdz8HQ0YwZItSzLVem9zQmfdfLPNNjIC1HYv1ClUklGoSdzY3MpRr4f+vekOjkOkZvi+t/CYjEsGVXf/TvQLDtQXg6Mu+IHQCMAmWTUZXmKvfuccMBYSik0ibWmH0hRR3g5jIqtv+KVLnAhAnV5nxhHOEHlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2uDdMYsHvzxFbkTrWszfH/vihkd8TBUdGLZFe/G++4g=;
 b=g5ys62DaqprIJQ8bOEoTLR/kRs+G1T2OZBtbHJKYYKrgCful1p7vqNK2zTxBONR+s9XgRdDu0CC4bPEBbUhRW1g5s4hGmvj+qIXDGRnE+DesCIkHBAG+VDp3fBJOSzOh80EIlalBmWno9br1AupX7haX2MrF0L46Tl9FLEA6jE0=
Received: from AM0PR10CA0111.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::28)
 by PA4PR02MB7006.eurprd02.prod.outlook.com (2603:10a6:102:be::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.49; Sat, 29 Mar
 2025 04:04:59 +0000
Received: from AMS0EPF0000019C.eurprd05.prod.outlook.com
 (2603:10a6:208:e6:cafe::c6) by AM0PR10CA0111.outlook.office365.com
 (2603:10a6:208:e6::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.46 via Frontend Transport; Sat,
 29 Mar 2025 04:04:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF0000019C.mail.protection.outlook.com (10.167.16.248) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Sat, 29 Mar 2025 04:04:57 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Sat, 29 Mar
 2025 05:04:55 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Sat, 29 Mar
 2025 05:04:55 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Sat, 29 Mar 2025 05:04:55 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id F3C3C2A4
	for <openembedded-devel@lists.openembedded.org>; Sat, 29 Mar 2025 05:04:54 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 52T44snq2340616
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 29 Mar 2025 05:04:54 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 52T44sZx2340613
	for openembedded-devel@lists.openembedded.org; Sat, 29 Mar 2025 05:04:54 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] opencl-headers: Install development files
Date: Sat, 29 Mar 2025 05:04:44 +0100
Message-ID: <20250329040445.2340565-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019C:EE_|PA4PR02MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: 771ab010-1c1a-4f29-1327-08dd6e76deaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Q8DZlF7a1yqflVkmyrywtW9EyweaQT1tVXbqq2B3X/zBnp/WtlyaObDdE0MP?=
 =?us-ascii?Q?BRyBnOMkFqL332d+XSgcDUqwCaMWSmmXMlJl/Cp+vY0quv7AB0+rxsA2QPPn?=
 =?us-ascii?Q?cw8VgymMvD924Y5xMSfK5/SHPklWETGH5UIZC/pwau6TMNgpntY9t6lFODPH?=
 =?us-ascii?Q?8YSalVvQ1D9Qwe2Ime8htJqDc6G8rVIxMtnT1GkN1vkj3h6XAoW0MkyIjCMM?=
 =?us-ascii?Q?Zv5g0iyOEr7Laeg0N8jqM9/4d1PrG0PoUXO+izaPlFYjxjAu+SDm/rbFda46?=
 =?us-ascii?Q?cOhB/uOI1QBgSV3XFNQXKw73+IgXOm8N5FZpMxDCm5G2KcY49S8ULa8gPaNh?=
 =?us-ascii?Q?7N3dFqG5NefJYVScFn4uNgXd2p4gnePq8Oade/++Tlkle5mzp13ov0kiqY88?=
 =?us-ascii?Q?PjKtEOvVYVST2+yXuVUlvGje1eSDCDjBlKpyhRPmrp6E7K9xTZbh2wlcoraJ?=
 =?us-ascii?Q?U3dAVNyyHwCHonNFSVvcuhHIV0ePWJCCaocaIJ0BlLQuIyoY9MKRdze6ypgV?=
 =?us-ascii?Q?RSWJ/KzoVsDRsVoHP2+QcEroZvKqkigvpW+2io9VXSVVo1dSNjwyb/SMYqlG?=
 =?us-ascii?Q?ZrB9IRU1gvfUo9KOady7RwOEN/i35kWsu56EwORkskL3IdZZAor1h82I3bWa?=
 =?us-ascii?Q?wiuH6KARfizXv32octPog4JQvahfd2UHrM6jYNg/dNB7IPzzCDVzi5isS9Bv?=
 =?us-ascii?Q?/UzR7TWuHp0kwOy3y0rgWjLRNZENIuCA1B5NWmw9dyn4Bp5pXDDQSAYkorTT?=
 =?us-ascii?Q?sUZa6GxvZJsIeY5Bq5uXO2cUwl/62Fst+lkV2fttyGNJm66hyy6Pp+odYOLX?=
 =?us-ascii?Q?ppN/i9YqoZo2yI3JNMADtZlOZI/PSNInXwK390Ym/EPayA2eRF90AkGSv5EC?=
 =?us-ascii?Q?j4Ha60cLzzJd3fhZXUIaOAHLyZ/92xOLQGAq3iIiCSQ7Ef5h62zujvALzRll?=
 =?us-ascii?Q?aIho0LYTzUxpJ+UWgQQEOoag7JF8u94oqDqrBIPQZbjKD4P/NxHWDXGHI0N7?=
 =?us-ascii?Q?G2y45kmIkrlwn7HJEYWxO2ZwxWd8GbVbsb1bi/dAOTKhKzbxpEaB37XYt2M5?=
 =?us-ascii?Q?ow4IkoOIK27gDf3VHT2GTj0xlLIx0l2aNclTEaSDp+4TycuT6VdxR0hMZweZ?=
 =?us-ascii?Q?b0/BPHIZrKu192VrakLqj3Sf1r1WBx6uhcV2eZo/jLnaFUuU7LDlcxw5uDTX?=
 =?us-ascii?Q?gscFf3+yIk/ssj5uDscc8rSouWNo/M08x/H5VV3YRHerX7Hdor+VU6bQFKIZ?=
 =?us-ascii?Q?IGbgxaI46gZrqtPXwEovdvaWQlgolPLlFD+1HpjXtv9ftYr5ANw7//RxAhMq?=
 =?us-ascii?Q?fU3WOkcEQgM98djfEdPuWT34v+1ya7NRkIu0E5yzKyWRbObRjYwGi8d8f/sw?=
 =?us-ascii?Q?j/6BBxQABMrR0kjsm+4fjvUT0on3zSWFMguzB3rqdyV/I9sHYVW/WaDOlPIk?=
 =?us-ascii?Q?wh+1lDkxp8P8QHpMsHwhKOeSG2bYOD5hvp/i0H/6L8DMHr8FqjQBVttpPbLo?=
 =?us-ascii?Q?CBF5SC8MdfSP/mo=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 04:04:57.6893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 771ab010-1c1a-4f29-1327-08dd6e76deaa
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB7006
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Mar 2025 04:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116366

This installs cmake and pkgconfig files so that other recipes can find
the header files.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-core/opencl/opencl-headers_2024.05.08.bb   | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-core/opencl/opencl-headers_2024.05.08.bb b/met=
a-oe/recipes-core/opencl/opencl-headers_2024.05.08.bb
index 01e83c812c..8663b818e3 100644
--- a/meta-oe/recipes-core/opencl/opencl-headers_2024.05.08.bb
+++ b/meta-oe/recipes-core/opencl/opencl-headers_2024.05.08.bb
@@ -8,12 +8,10 @@ S =3D "${WORKDIR}/git"
 SRCREV =3D "8275634cf9ec31b6484c2e6be756237cb583999d"
 SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=3Dmai=
n;protocol=3Dhttps"
=20
-do_configure[noexec] =3D "1"
-do_compile[noexec] =3D "1"
+inherit cmake
+
+EXTRA_OECMAKE =3D "-DBUILD_TESTING=3DOFF"
+
 ALLOW_EMPTY:${PN} =3D "1"
=20
-do_install () {
-	install -d ${D}${includedir}/CL/
-	install -m 0644 ${S}/CL/*.h ${D}${includedir}/CL
-}
 BBCLASSEXTEND =3D "native nativesdk"

