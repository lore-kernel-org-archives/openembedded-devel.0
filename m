Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E6CC369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 15:12:07 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.43])
 by mx.groups.io with SMTP id smtpd.web11.42578.1745334717916823467
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 08:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=DBhLHanx;
 spf=pass (domain: axis.com, ip: 40.107.20.43, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hiuZ6LvD+lwICuT4CI7mfH/9Hnm1xl5YSn/i8QYnreCSbkwRbZanI7Wwk9I7MLhVi0ndvnOguY/N2nHBdpKRIssIrZBFRdR6++3nOfWtsQCFdvi8J5NClin42a7WFlMQoa4l5aq7JFMCzD2vGM4PTJMXfMvhIWIBY9UUk63YSrcpj2cZvNQkXL+uLgRcqFEj9Ocf4Hgh6UNJSWbh0tlu9sOgp1KY5QNECQG/qYu0pxTwH4ovFSEyVEsIk1lWLYKGItinN8KbfRgFHg9ocHA0lWfrpxY49jjbAN4MERHeXd8RnIrTHHGvhYXtmnSnODOw6tmLpet50bJ8mdBf63xLiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUms4b9LbynqfbXQ4/SFeCsDruZp/x2gUibPxgV9LuU=;
 b=Az2FBv2kP+wo/CI26XpqLNv+/0LRQFS2f2AV5KsZq4pQIqScFu9lETovrMMJ7vPdcl5vE4NCI47BIRnGMHHdpG4ehrzSiO6oC5Vvo3KFk02nSxVbylybMIfAMfWP9ijpx9/PSdWbOiux2jjnaXYLrHZU+Uh7P40687n6U+oChC4nDP/VOG+dZEreGDeBXfreNeeGzTBddTtG7SdacuOhp0dzZeqZl/UfVKuVwQRAlrYf5mpqThrcfm2d/vTAnVJlZaDvRglUlVXBe3EbpEjlKKMkmJGQcSqbcsf2Heg5RsoR0dmYfSdzCZ4cFHJu0sBGjTjfG7wxsZyKUxEooi9Atg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pUms4b9LbynqfbXQ4/SFeCsDruZp/x2gUibPxgV9LuU=;
 b=DBhLHanxFmSAlrSwovOhpXf4eRpE+f8mTbEpr5MQBdtO/DOoy4OQ/i7qjBpufuLVCgBbTILIFcXti8nJZI5hcEgfchlWLJkpKXN832xrpPPk/uXdA/zZEWDyuyHRAeGs2uVgiA5/Ydn6OuacFCzV4+h4SD/U3qk91ZyoafSw5nk=
Received: from DU7P250CA0017.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::20)
 by PAWPR02MB8960.eurprd02.prod.outlook.com (2603:10a6:102:334::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.14; Tue, 22 Apr
 2025 15:11:54 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::4d) by DU7P250CA0017.outlook.office365.com
 (2603:10a6:10:54f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 22 Apr 2025 15:11:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 15:11:53 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 22 Apr
 2025 17:11:53 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 22 Apr 2025 17:11:53 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 4AE5E1C3
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:11:53 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 53MFBrOR303252
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:11:53 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 53MFBq70303248
	for openembedded-devel@lists.openembedded.org; Tue, 22 Apr 2025 17:11:52 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][walnascar][PATCH] meta-networking/README.md: Correct the branch for dependent layers
Date: Tue, 22 Apr 2025 17:11:50 +0200
Message-ID: <20250422151150.303223-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0C:EE_|PAWPR02MB8960:EE_
X-MS-Office365-Filtering-Correlation-Id: 71fee86a-e8fa-403c-02d8-08dd81b00400
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6qVZHTR7T+SMQDpjm5Y9cf4DSnzlJ4CzeUEXRs0tBblh7w1rXUS5TdTjAryN?=
 =?us-ascii?Q?lGgjt25NH3gHaAjVUH5orCxB0kEb1mm2rg7NIUE0L0pPGgaMMCpEcskRfpnC?=
 =?us-ascii?Q?XBo0qSqR6lQDqfNHgM5u4G4/OWtT32Yb79K4dDHYfm+xF5saqHlZuCN0oydX?=
 =?us-ascii?Q?0HnjbmMC9j2MBwA6WESfg1oBlCjfQVlnna8bNyRLF2qLTKr/NTT/ckVr4jcf?=
 =?us-ascii?Q?/uQ/H/L6pwy+s9PbZRLQ3lzUnMsOydfVwYWl5pS6QeSqI0DC0rzNvqpim9fC?=
 =?us-ascii?Q?2Sd/+ZWVW2oNoLUEDyl+GrZyF5MwNiXuJnpPdN09thAGGSqP0lCcyK8UVmJ+?=
 =?us-ascii?Q?dm/yIS6kfacphu1GGeWOdVbXYu48H5E3hO+W6RZCzmzYLR78JQ0qnTIksFfm?=
 =?us-ascii?Q?AkEGWG1zgKKXY4VCREdCQnHNA+6cAfcBYcco6y3EWgKYJW4FLtVypuXiKJCE?=
 =?us-ascii?Q?QlzZHhmv91utMnXQtV5kDhS1XUvfMTMl6khxuEnvqAPtFfDwaC8Jk4+qGSPs?=
 =?us-ascii?Q?U9seWSsz99gH1Zt5kGSlICtoFQjs6NO9VtxzY/xo2wSjYC3xHRXCfW2Qr2vI?=
 =?us-ascii?Q?4f3LTylfytVHiJMfnY9HYuKbdRBxvsMRU03XPLMKon+T2ALERC1QqFV17+21?=
 =?us-ascii?Q?SqF+NxFoduGMIPD7FTTP+kc4u4SE25O82Z1/PteJkQ3LxCykZEtII8PirxH5?=
 =?us-ascii?Q?tK5dmMIBqRrmXPKmpnX3FDQaG/ktFH5evjcFw4YvN60e5wqzlybxetgz0h3E?=
 =?us-ascii?Q?xJqV5OSV9kJsI+zCyR59BLEsTZt9nSF4RKXz92zV1R5idLvNL1tcD2YitgRd?=
 =?us-ascii?Q?DoentIbLaaPoxv3dVGqDYk7yuh0OHyeL4Q0uF4LL6/MBUlYKkor496Ncp7Nh?=
 =?us-ascii?Q?w8UefH6O6d6DlnDXA+6MFQe3ONPFKPJBrCYTkwQa7OfF8GxRc9WRO1mGbfSV?=
 =?us-ascii?Q?BfgU0zAy/V0AhhfAocQE8GSFmiGhvKIDptHPUFRMnWLl2HB7AOvssNEOpdMj?=
 =?us-ascii?Q?KpF0YU2nF4kjgtQFxkaUh2n+46zLBH4fI5oYI38mSbbToScxCogfLQxbBkow?=
 =?us-ascii?Q?igL4UJl6U9CLGkEcfwQwSgAJ5rdv/1XUgScyblnvcFaVaTTpYYAWMom14339?=
 =?us-ascii?Q?B6IHzYJvhjXZd4wnIUL/JV534hLX7j7PizsXT2XxQJhrpfGe5sEniYA7lvvS?=
 =?us-ascii?Q?5ofiawy1fSTM7et3uaaO2uDS9HBu/S6yOgfhguaGvDde2LkydMSLHRaePrG3?=
 =?us-ascii?Q?Yl/OCVO2WKJzIq1xS83bNqtOya612piZqaUk/L6zdEk+Rp8PozcjyNeWBwLL?=
 =?us-ascii?Q?hdQiddXS05u/JtcZHdt5r47EEuhzPlty6f7833SZfaqBL0GlQBpquqZqxlAs?=
 =?us-ascii?Q?rKij5zLYeiOYfECpd4hh4ATo+2PJQ9AtqQpK3+eAc11xSRX1nHRXIMzlbWab?=
 =?us-ascii?Q?bkM5d1OUXUjZctGCyEqPiSGR/RQZPitbhhvfs62pIXywgi0IcgAJeSWDjtho?=
 =?us-ascii?Q?+YC6/BvX2WesXKVYscPbPmwPsHAVrYJuTqKZ?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 15:11:53.7346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71fee86a-e8fa-403c-02d8-08dd81b00400
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB8960
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 15:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117060

This was missed in commit 0d2d2d193a1619b6dbebaf335f1ef785478049e3.

Change-Id: I82f45cb39cfd26870e51be2ee09211bb5cc6c904
---
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

