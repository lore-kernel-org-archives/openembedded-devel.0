Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1689C0219D
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 00:10:15 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.55])
 by mx.groups.io with SMTP id smtpd.web11.311.1739232613751146113
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 16:10:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=BtPvweAr;
 spf=pass (domain: axis.com, ip: 40.107.159.55, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqLsq2wsH1QVe96AMfW1hIor1sHGqtdkn+uIxzTBceHxh4TjAh4XUgt4clU/e+i5duoHGWyPxqLSSyzkrlowOLDbP+9CByXTcz6NzoWgV2UJLlQFCZeuxIK4ojIoZEHDWyN4PMyzxMKrUWjG8eVn7cuup1GNhs2SbNNou4SWtdFUMf+/N8A5J3lFBrTJ1OrqKxtvVprWnoaUNX5uwGR/MvZ71TwZgU+bDq462oz7eFUT7JQ/ubTPAuWszBL1bgxOkuC89G6do9sDObGAhF49HPvQrULzq8f+bcULfVo9rLAYXvuR4UFYej6nhUmRK/PaZkeOM9WBFbexe4KysxbOIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYvQahW8YM+C8a4+5WGEVftXDBhZJVPfs6mYOUWn5S4=;
 b=L8IdB1+Q9tVIM3medQ6a0Wsx5xcLKAgUYbz54qZ7C6GALjEfo3jGcj7lyhqUtaVWJsWMcW9GheW1n6v3F94hr//85VLL18zraMhoYT38EwCWWObOCafcsgmyDtNcJCJvlpVNKhQbOmfknSn0A59/ACIeXKQeCBmdpO5Q1trZsXFBF7jsBt0kFaTqoz2/u3mtWbi7AG/rqrjz2RT8vwoEu9iip5asBR/whoaHok9ut6qlixPcWrQ+hNXrigaq3Bkyyg1TFIgNY7ZJ7Hi+sYVGW2SRRtgvIuXn+Xz9Sek+32ObDrzled4STh6Po0ivNPDLXy1SPQ1ZutEOQisplC1fHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYvQahW8YM+C8a4+5WGEVftXDBhZJVPfs6mYOUWn5S4=;
 b=BtPvweArb9IW86utDmzp93LtT4Ga6ruEgDB8ORE4wYoj4AX1FLOVGWHKDbbJVmdnmnUMLotD4Rv2YgkOtUgLXdIKpDBMcwM0NQMxlKii3Y/PxAkyF8ugH03CMptFntPZ8xfgvsyEshwwTBDuEtu4Syl+1lltjfMVypPoafnl56k=
Received: from AS4P250CA0026.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::14)
 by DB8PR02MB5897.eurprd02.prod.outlook.com (2603:10a6:10:119::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 00:10:09 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::64) by AS4P250CA0026.outlook.office365.com
 (2603:10a6:20b:5e3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Tue,
 11 Feb 2025 00:10:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.10 via Frontend Transport; Tue, 11 Feb 2025 00:10:08 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 11 Feb
 2025 01:10:07 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 11 Feb 2025 01:10:07 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 51D4C1A5
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 01:10:07 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 51B0A7dG4179003
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 01:10:07 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 51B0A7Wb4179002
	for openembedded-devel@lists.openembedded.org; Tue, 11 Feb 2025 01:10:07 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [styhead][meta-oe][PATCH 5/5] licenses/MINPACK: Remove
Date: Tue, 11 Feb 2025 01:09:58 +0100
Message-ID: <20250211000958.4178887-6-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250211000958.4178887-1-pkj@axis.com>
References: <20250211000958.4178887-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5D:EE_|DB8PR02MB5897:EE_
X-MS-Office365-Filtering-Correlation-Id: d39a07ae-60c7-4567-860f-08dd4a307209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QdQmGiOfSKuf7fVqn+fM3MaD1O/8uSxATxkfyepxOyomx+ohN19OiWSOfegS?=
 =?us-ascii?Q?2irpWpX417Fl2uGRIBd+6e0/rBtiyj2XsnXT4Fshb/8mCQ4fdm3M+bmWDyUq?=
 =?us-ascii?Q?aCEo6JxQCNnYLMej4BZJCKrU3n5Mef/vic18vhkdhbn5Z6tGzQXr/YhhgpB7?=
 =?us-ascii?Q?n8QgDWx9lp11HHaKpvyBsBzb97CFaojEVdaiLU8wGOmze84GeBGMM6gNB/hQ?=
 =?us-ascii?Q?KoL9oX/kzJu67IdCcXK8ybiGqHei8ZoHrsYWpZLlpcDPPUZZCfZ4mfKL8YR0?=
 =?us-ascii?Q?E3Npmpv2e1w+985yrHt+jOnCeH17/0XzQpMpOyXO4ZWL8PQPmz2Un39Y7em7?=
 =?us-ascii?Q?PyZjLUebYQQTPx7zxykvXLUTYRa0btxe5BqaKNyW8fssWY+ibAzNHxrxQQNS?=
 =?us-ascii?Q?CtJ/6YImuFSN+BibcJMz+JYU1isiQynTStTXj+Dnmx0I1wNuhUgHxmoTB+cF?=
 =?us-ascii?Q?09NTaJcE024aEp9+QJHu3OVfmy3uE6ayv8UTfDKzZfew9uyMfG4H8G3cyC+G?=
 =?us-ascii?Q?Lb9NOBoARjrJRs9xpuioUViuIePv6uDDMntJWLwcHOP5TUby6Lpd32Zg3RgW?=
 =?us-ascii?Q?lqqlMm14TUhVzPZ7uLd3GnGL52JnNSatjTfImwA5ryHv/ICYBiEtSxR3d/b1?=
 =?us-ascii?Q?VVEivBVs3ltDkee8UNTIw76O9nA+FV9OgauYEXmZ9RoWN4LLYNABBfTvVK07?=
 =?us-ascii?Q?nzZ/Ocmbo3pR4FPx+SS7/iOM3xLQnQZddz2rZdZaXca8wcaECJnttTXW8bR/?=
 =?us-ascii?Q?ILjTB0rbjzi545ILOUNKuFOB+Q4ZkqPHTGOw09IhkJGCTQEDr815YaGEAFfT?=
 =?us-ascii?Q?fV+y9idxe4OnHRBuXnsyfUOhv4DpEExDaJbmC9NK1wM7bjo4czyB2BdnQ5DD?=
 =?us-ascii?Q?YyB9+1ZcxlIh1hgcUx5f53Lo2ljJuNJgqF++f9B4kUdSyptufbvDffYpoCK7?=
 =?us-ascii?Q?gFN6YiFn91NpZLLtQwn/m0FZEersSzRj5ZAEqiAjnrqm5aYLVQ6E0Cx4OR91?=
 =?us-ascii?Q?pmJ+EvogRnN5cUKxvCsyttuIS+//AdeylZvpmq3mOizJ4zDR3GPFzmXMhu7n?=
 =?us-ascii?Q?XeOA6/YIeOe/xiVz2vjbBo91+qN2TUqVbJyYdosBuPZmIgo93QF43z6pYZAg?=
 =?us-ascii?Q?khoO1bIIfLK0kTzIN/W1DZOy47EyA9vtu4ueaX1bcCpaiHKWcf1uefwd6OIp?=
 =?us-ascii?Q?GkVFqQt34ax4KQpD/s/EJiawSpylHMSmUj/kjFI4mLGfOqt6TUFObQK/EUe/?=
 =?us-ascii?Q?U9hVZMyyEMyRtwZjvf+DMSdU2GzCdsO6R2z9l+JzOGgP4UCJMYeEnxymJ7XW?=
 =?us-ascii?Q?jhRBZZCJHLILPjazeXEIZs1oaRzHVfKlmhcSD5Mqo3IGc7oMomS0Y5twgzQR?=
 =?us-ascii?Q?gRFQhaCO2QGL8giQA8tw4Hol00pzbkMiBX68Mh2E3Tija64vOh2Mil9kWpKM?=
 =?us-ascii?Q?jNGWnAOgUYHG4q8S0RwYgYVLyvY0qQL6+dpMU5KkfOn8hAVaKyfRBegy6DEO?=
 =?us-ascii?Q?e5Dm+ezTm6E6Tn4=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 00:10:08.8122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d39a07ae-60c7-4567-860f-08dd4a307209
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5897
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 00:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115414

The libeigen recipe, which was the only user of this license file, now
uses the Minpack license from OE-Core instead.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/licenses/MINPACK | 51 ----------------------------------------
 1 file changed, 51 deletions(-)
 delete mode 100644 meta-oe/licenses/MINPACK

diff --git a/meta-oe/licenses/MINPACK b/meta-oe/licenses/MINPACK
deleted file mode 100644
index 132cc3f33f..0000000000
--- a/meta-oe/licenses/MINPACK
+++ /dev/null
@@ -1,51 +0,0 @@
-Minpack Copyright Notice (1999) University of Chicago.  All rights reserve=
d
-
-Redistribution and use in source and binary forms, with or
-without modification, are permitted provided that the
-following conditions are met:
-
-1. Redistributions of source code must retain the above
-copyright notice, this list of conditions and the following
-disclaimer.
-
-2. Redistributions in binary form must reproduce the above
-copyright notice, this list of conditions and the following
-disclaimer in the documentation and/or other materials
-provided with the distribution.
-
-3. The end-user documentation included with the
-redistribution, if any, must include the following
-acknowledgment:
-
-   "This product includes software developed by the
-   University of Chicago, as Operator of Argonne National
-   Laboratory.
-
-Alternately, this acknowledgment may appear in the software
-itself, if and wherever such third-party acknowledgments
-normally appear.
-
-4. WARRANTY DISCLAIMER. THE SOFTWARE IS SUPPLIED "AS IS"
-WITHOUT WARRANTY OF ANY KIND. THE COPYRIGHT HOLDER, THE
-UNITED STATES, THE UNITED STATES DEPARTMENT OF ENERGY, AND
-THEIR EMPLOYEES: (1) DISCLAIM ANY WARRANTIES, EXPRESS OR
-IMPLIED, INCLUDING BUT NOT LIMITED TO ANY IMPLIED WARRANTIES
-OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE
-OR NON-INFRINGEMENT, (2) DO NOT ASSUME ANY LEGAL LIABILITY
-OR RESPONSIBILITY FOR THE ACCURACY, COMPLETENESS, OR
-USEFULNESS OF THE SOFTWARE, (3) DO NOT REPRESENT THAT USE OF
-THE SOFTWARE WOULD NOT INFRINGE PRIVATELY OWNED RIGHTS, (4)
-DO NOT WARRANT THAT THE SOFTWARE WILL FUNCTION
-UNINTERRUPTED, THAT IT IS ERROR-FREE OR THAT ANY ERRORS WILL
-BE CORRECTED.
-
-5. LIMITATION OF LIABILITY. IN NO EVENT WILL THE COPYRIGHT
-HOLDER, THE UNITED STATES, THE UNITED STATES DEPARTMENT OF
-ENERGY, OR THEIR EMPLOYEES: BE LIABLE FOR ANY INDIRECT,
-INCIDENTAL, CONSEQUENTIAL, SPECIAL OR PUNITIVE DAMAGES OF
-ANY KIND OR NATURE, INCLUDING BUT NOT LIMITED TO LOSS OF
-PROFITS OR LOSS OF DATA, FOR ANY REASON WHATSOEVER, WHETHER
-SUCH LIABILITY IS ASSERTED ON THE BASIS OF CONTRACT, TORT
-(INCLUDING NEGLIGENCE OR STRICT LIABILITY), OR OTHERWISE,
-EVEN IF ANY OF SAID PARTIES HAS BEEN WARNED OF THE
-POSSIBILITY OF SUCH LOSS OR DAMAGES.

