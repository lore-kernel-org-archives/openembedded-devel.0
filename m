Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60166C369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 11:47:50 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.84])
 by mx.groups.io with SMTP id smtpd.web11.14983.1746013661501354858
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Apr 2025 04:47:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=a0tu0n9G;
 spf=pass (domain: axis.com, ip: 40.107.22.84, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EK/MEXcwgZnByx1FKmIG+gAQKuMmOGVLyPIMifGBSspFQB0FuY4wHVDaRADYmYUNEtZ7+MEcGQdK3K0vHwjoa8lfR7QIbWenrBe+Nk8RHSa5gqXyEn4zx/EtLXsCggxdlmGQ3o9D2uzgZB17/Di/+Nc9T5BsbkQxSvqYwlwg7YzGgM3X/aigkBP+xPMLGAIEoWHy2BAK+PdzqnpjLcdZTQFglL0nnjisM/jdiD12CHc5YBk6pNGmZg9Wh5DTm4mHqMzZkoh29b6GuuTtc+aGo6Z0QuVSl4oqg4IsHbLM74l+aILEJcyeXF0vn40lshKISQLwPZMyzQzle4AUxywctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHzQQE7le00np605cadYyV4ueAr1vCfQsWtb6hb6wTQ=;
 b=yE5Hi6mLbRmOVvAsZeF3mOzyCFyTD78NeX9tVf4h7tb/nkn5X1sbStpHpIXVUGq0CkmIJ7KTf1hO0XUZrpTuZ6HBNC/MIvDQJIyDd3GGGlczy+ugPsuK7yVFmpQn3IonZuEbbqeb0NLr1sV8CmGSSOAK+R4yuj6MmDAcXxQAGjcop1CmyrB8lAse10/RzgE8cPY41UDMT1uV0mpdCS/Auv0IFEGK0PaLH/3tCSrvdLloYw75bkCEePnLRvd92GAKsESNPxnem9gF6XJMI62QaaKYfZBSRqsST5yeqS7pRHd49k5qL3rqeAA4pMSWWt0XCvaqzxtu3olbn/csupyD4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHzQQE7le00np605cadYyV4ueAr1vCfQsWtb6hb6wTQ=;
 b=a0tu0n9GutIgOzf2onOMX55ZR8JQl+3gEMwwYMxoAVPuBsD2ZGafOcnzMvkHMxllEJ58v+Ace/XKNWV59GAqgrCwUvF1iYJvBcUkYwjOiF8Z+6fwqEZv8GC9DRfiL2yvs9yXRBtrbfwLyNfwHUg33CsG9uV7/oZ5zj2N3dWLVLs=
Received: from AS4P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::15)
 by AS4PR02MB8407.eurprd02.prod.outlook.com (2603:10a6:20b:51a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.18; Wed, 30 Apr
 2025 11:47:34 +0000
Received: from AM3PEPF0000A791.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::11) by AS4P191CA0005.outlook.office365.com
 (2603:10a6:20b:5d5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Wed,
 30 Apr 2025 11:47:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A791.mail.protection.outlook.com (10.167.16.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 11:47:33 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 30 Apr
 2025 13:47:32 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Wed, 30 Apr
 2025 13:47:32 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Wed, 30 Apr 2025 13:47:32 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id A923D98B
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 13:47:32 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 53UBlWsW3001358
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 13:47:32 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 53UBlWlW3001357
	for openembedded-devel@lists.openembedded.org; Wed, 30 Apr 2025 13:47:32 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-multimedia][walnascar][PATCHv2] meta-networking/README.md: Correct the branch for dependent layers
Date: Wed, 30 Apr 2025 13:47:27 +0200
Message-ID: <20250430114727.3001336-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A791:EE_|AS4PR02MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e7c937-3e0c-484c-1bed-08dd87dccb73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qab3CGmRLMXM0lN9h9KedsYR9gpazobNN4iaIs6PlBaZSw+PDBxeq96xP9BD?=
 =?us-ascii?Q?XDUjZuygtBd2Fm7I4jDIgcSeo11VWVP6kOtfLBrLF6oCH/4H6A5GiZw6wuuP?=
 =?us-ascii?Q?JrnoOwxnCdy+5lyjdREwMEaMcBZYVTnDOjwBGJjj+QXIFNv2I0KYRyhc5uJB?=
 =?us-ascii?Q?A+aMTLsy6PDUSfjhgnC4fL+0vB3l9x9dIagTcR3QudCnvF8vHizTAA9nyQEx?=
 =?us-ascii?Q?LnIQoORdgONoYHDehAYqwygbU6cuO8ls8cJJURg5c8NvY1Q/DtOwn5srkdnF?=
 =?us-ascii?Q?hD5G4BUPLuBgdoCifN3G7exKdzdAc8QCEl0DcbcTyblMu16str6A4DFe8CsI?=
 =?us-ascii?Q?g9MA6JADzKV2v+PPBwEFVAmzX67LmqL1unbLAUXXZk5Fl7cxj0BaskPgbCxV?=
 =?us-ascii?Q?mYnh7kaT6pcWR8C3SkjS3AmWj6nSAQzW28eJISn350q/5KjG9mtyEwodB5lp?=
 =?us-ascii?Q?zV80GGyw4fPpkQcqvOgcdy8jKnplzOEcRzVbCuR0gLJ2NKvgKDWjAGT/ub+r?=
 =?us-ascii?Q?t83Kunl3l3yS9uBU2sXhjRmXLe4cvZ2bCd2X06NYnJqVG3YAB3MUAc23R06d?=
 =?us-ascii?Q?3HamsUnWJ9F/ZaomGx+cZ8tcSEeFRtFirJ3dl3bpM6XT4M1Kq+rVtVX5qCIj?=
 =?us-ascii?Q?HbPLXQNAoQgfUCN/Ta4R/11h3wFCIAfIHiX8wE/WdlHVfnxH33BWkyLssFiU?=
 =?us-ascii?Q?xlJTGCeCr+YYvalYftEBpq5b7mJau5s5nyf0AnhwZSPH/jAw9AunY/MHbyFf?=
 =?us-ascii?Q?nXG6Jjs2U1zTCTfbKh8jHaPJmMzMghJ+09Xd4x/RW6t9v6v0aouXTKJOckAV?=
 =?us-ascii?Q?xizIFJOIi81sLMAXck69TU8AWSzWeLgP6Z42AyIzUN/JvI0mZoP/pQStWTcb?=
 =?us-ascii?Q?FQ2dDMZY1BnHBN4C5LITFeEAiGY6xUCR73APFvzSWrgpYC2fTgcUtdmu1Lxn?=
 =?us-ascii?Q?I4kKAVjFPita91TDP01ao2/pfO1kDN1Id9ImzNg3L/N0C4Anl+FXy0lxXdIn?=
 =?us-ascii?Q?Y1ewfFsvgUf5YOcipnYso2P03W8CefZBaRd2REXCqSIR8IPjhhO18/cM69CK?=
 =?us-ascii?Q?qXG+To4h3IZmPEFwuHG3YzH2DAMiIMx8Gro8bcVPnnUMwZ4obI/6KKtVdv5a?=
 =?us-ascii?Q?WeHZgm0uz2EmDr4lrY0Bxw+Do5f7cZKzFRBPxNOy9dl2Z+5JHCBSD83UiIEq?=
 =?us-ascii?Q?c4ElfMM0U8gM1ZHuS4+Nu3+3/5QOlBKoa8kDhhC7SL++o+Qp9GsGFxhJ9k4e?=
 =?us-ascii?Q?XtYYR515oJPWj9QPclhizqvhXMkDPv7HSWT8jRJ5lCF6HyXRb34/b4sfpjhi?=
 =?us-ascii?Q?/Iyd83z3y0zTmMIYYi7aajjE1FNAPLxQ/e6LlpUfF/uTXGO5TOWJGy/kPoRx?=
 =?us-ascii?Q?TCnf9P6S0YXaJy1LPBDCDWw8qN/88tq12Lj+kpWmeNbJje9LOTP4nEd6hlJp?=
 =?us-ascii?Q?4+3u6hNe8jwX8pz8AgS9dqQiQ2FwfW++fmGKcHOetZUqpMEfu+LJJwgLk1TO?=
 =?us-ascii?Q?uE89LXKuC+ThSRLg0+e3EcInMVuLK8J94+Md?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 11:47:33.1936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e7c937-3e0c-484c-1bed-08dd87dccb73
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8407
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Apr 2025 11:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117251

This was missed in commit 0d2d2d193a1619b6dbebaf335f1ef785478049e3.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2:
* Added my Signed-off-by.
* Removed unintentional Change-Id.

 meta-networking/README.md | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/README.md b/meta-networking/README.md
index ef7933e319..4f9a14b8ce 100644
--- a/meta-networking/README.md
+++ b/meta-networking/README.md
@@ -18,17 +18,17 @@ Dependencies
 This layer depends on:
=20
 URI: git://git.openembedded.org/openembedded-core
-branch: Scarthgap
+branch: walnascar
=20
 For some recipes, the meta-oe layer is required:
=20
 URI: git://git.openembedded.org/meta-openembedded
 subdirectory: meta-oe
-branch: Scarthgap
+branch: walnascar
=20
 URI: git://git.openembedded.org/meta-openembedded
 subdirectory: meta-python
-branch: Scarthgap
+branch: walnascar
=20
 Maintenance
 -----------

