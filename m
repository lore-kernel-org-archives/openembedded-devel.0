Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B1D0C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 11:59:01 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.50])
 by mx.groups.io with SMTP id smtpd.web11.9426.1739447932347538851
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Feb 2025 03:58:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=hX3c9REe;
 spf=pass (domain: de.bosch.com, ip: 40.107.247.50, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekRJQI4nCWGsgbnvNF4+gZx5Q64QzvaSrlyBbLNBFZyuhR+6QiyyWs02JUUj58idwLedqPvqsRtrbyAiV5xGEFIGmwqHf314u9mL2iBzByVruhTvAM1x44iR3JGE8+reOrtGMz71dEUM/r/8vrazjFHxB6B7tbI77BxUBjc+J+7ydN9JUbadIgYkdOs0JjXSgp7eLScYsawB4V6vr59ft0W+BgTgNAFPdoIcWlGBT/xm3C/W6X16mpAn8czWII3b2coQU6V3Wi0CU+pjK6N0lxuD7eGeUhK7a7kpEzPHRevF6tAHhX/mmy09BDL2wsLLKnluY2zLUploRbX6ERMgew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THFFFX/tJYDipOBWBRz9y9Tk+UKyLEfuHVgZ6NBmANs=;
 b=XX0qoaFdTit++qrUaLnRWuUinOzyU11rosgwb644EWdm2QhQ4YSlvkPPnMi2doVB6TyG7HsZwyOuzfsm4p74N4XiMvSZxte8V58i3mFzvjsD03YtiScBYUppg12ldzxCK9WFTrXhKe+QyOeoujYkoOZd/w+x6O/MTzOMRSIh/TX4F7+TIFHHLM8hhz6sJARGTpcbOEBaQ6uS/QHKUJnrDMzc6z+rxN+gM+q2SxaT+qArFj3bQyrOYH+9v+h2pGuMdezNqN0xG9rbCqySwooaZ3HD5eW47BJYLlaLPtQFz8ZwiOthLIBRSi+p+stny+c6vFSGDQWaihu8XsbQev7Uqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THFFFX/tJYDipOBWBRz9y9Tk+UKyLEfuHVgZ6NBmANs=;
 b=hX3c9REegeetPIYEJ6N9RzPzURe2qSGv/iiZlRp8m3qMaM43NRduQ51qPgAo63tdG/iFxhr1TateqS8sACOgaKzu/lhG4N9w2Y10K/xBM1tChDu7QhE8Wnib9Iew0UFV3emEe3IF7sibWhEUOKMZ45r03ekqhX62cAcPDIX/vbb45j+0+EDd35Qg8LfETL5mj2W1epDVeJI2S2PFaXrqkCx/CKzIKY4tGIjFg86qsUoGtdddtXnTfFo3rPyWy6TS94OeyG2r6GsgTH0Rp05k4NqBA6f/MyQSqi8i7ve0a/IrTa74HW1/MT9vJYIDrgPYqboakJ5Yt/AxAlTKMYg2Uw==
Received: from AS9PR06CA0250.eurprd06.prod.outlook.com (2603:10a6:20b:45f::8)
 by VI1PR10MB3309.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:13b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.9; Thu, 13 Feb
 2025 11:58:48 +0000
Received: from AMS0EPF000001A3.eurprd05.prod.outlook.com
 (2603:10a6:20b:45f:cafe::14) by AS9PR06CA0250.outlook.office365.com
 (2603:10a6:20b:45f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.16 via Frontend Transport; Thu,
 13 Feb 2025 11:58:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AMS0EPF000001A3.mail.protection.outlook.com (10.167.16.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10 via Frontend Transport; Thu, 13 Feb 2025 11:58:47 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 13 Feb
 2025 12:58:47 +0100
Received: from GRB-C-0009M.ot.de.bosch.com (10.139.217.196) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.43; Thu, 13 Feb 2025 12:58:46 +0100
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <wangmy@fujitsu.com>, <socketcan@hartkopp.net>,
	<mkl@blackshift.org>, Mark Jonas <mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH 0/2] Update can-utils to 2025.01
Date: Thu, 13 Feb 2025 12:58:24 +0100
Message-ID: <20250213115826.38194-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A3:EE_|VI1PR10MB3309:EE_
X-MS-Office365-Filtering-Correlation-Id: c8be1f45-915d-4f41-6559-08dd4c25c642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bnK0LEQ5T7iG8jEzvLmtQpYH4wfGu9vQ69fxpf/h8z4XpDWR5eBDM33gabXW?=
 =?us-ascii?Q?L6x3lLBnYX4a7YtN1V5F0OX54ngGQXYcul5mszLvyFUHqhzAmn1kLU4hyvlI?=
 =?us-ascii?Q?4mfj7u358A1SFmB5UBdpxzxLlRO2OXk5Zwaq8uzPjD+poN3uUO7Kb4+e+IRz?=
 =?us-ascii?Q?jAKk7BVmvSanI/qn8vXWJ8DScTgpK6H3AhyvIoFuOrswqZ9NnYnN//0PukSJ?=
 =?us-ascii?Q?Tfdog9KkVFm7A++9Gyg0drTJIBsMCkaS3ppvGRRig74Te7FKDtZjd2EMiMLX?=
 =?us-ascii?Q?423/Ru2xFqaGuc5Jh1XpX0T+nMLjHQ9XzbroDOHyZAF0SopADRKrkX+dPdjj?=
 =?us-ascii?Q?9OQWL2LGFt1plzG4m3BeG2YWbq5TT+pIXIjBK8COQDK7qw34J7zOWf03YhIX?=
 =?us-ascii?Q?z1G5JR2reHJIkXI3swWapdD4prqxSj2fWfkRR6FTEKlqkkA25CzqNxRcaSdU?=
 =?us-ascii?Q?qe8eDG+N1LQ8DXTwuRdkZZXkTb9n8JYIiR0clWoVqzHiIlYwfQwa2psxhae0?=
 =?us-ascii?Q?WUvpGqIZlzM152lxi0Ugg138vnD0MvjjmWNqiT/sLyRpIvi1Ht7R8tAHiy34?=
 =?us-ascii?Q?3cZ3NCK+WUJgz/UF3PbNfzTF9StxxppQMI9Snp7eN3ZIW6iI5ZkQja8oULlI?=
 =?us-ascii?Q?mpjYhzXcpXwMniUdmqsovtVwwW7qrJB8M+n8uF8tgg+cIRG1tdLkprEFqpM7?=
 =?us-ascii?Q?kgwY0VWX7jpK+9Ax0H/cd6W6F88qAzahHpxSSVXsxr1O21wgZ4adDSR32Fyp?=
 =?us-ascii?Q?k6PWo7kOZW/cVKNSV8hj0ixQX1iE/BkKz6LbTlk00RTYmBddelNvrrKH32jw?=
 =?us-ascii?Q?VaGade6GZYWDWfsfvM5DISKS6iDq74jt97n9wIUK0+pFR5ZGk612AE89WD0O?=
 =?us-ascii?Q?6yCaacYcUFQOiWuP8P/AWlsvJ+HKR4ggMzwJJdiEqsJnl+oFlO76V3+qHnkT?=
 =?us-ascii?Q?XnVDs8bwZQ4dExrkMAogiVNfW6fYR4Gm59C1G1TPK3Bh8CrCpLlUgSlkmYXJ?=
 =?us-ascii?Q?K+pPvWJZhMggVk03oLpqzeJ5EZ2V69CT7TB7Cn78HyksZfmjesDLO2nG3BgQ?=
 =?us-ascii?Q?fuMdlz3cAhncnS5+H7Wp0nbtxpHQKdu9l5H0ZbTVIhX5VTC4Uc6JkJxkDcob?=
 =?us-ascii?Q?BG0A6ojWieISUd9tw+G6r+XsiD3UFiMr6lTOHpRtJhVFk5TQSyILVYQLMhMG?=
 =?us-ascii?Q?v2ifOIwyOWvLOX4c0iL2Dx7LTgWMkdH1IEQzCjttvEXWUApN9jej6+Vighc4?=
 =?us-ascii?Q?o4EN13gYYiHzeo2xcXJ++ULHIPCia/9Q7iSB3WBYKprcKrcT/cxEjXQnmDl4?=
 =?us-ascii?Q?lhL8h0BRFowczKk8o74Q2L3u+FSvkqhW5o7t4VmPqMNHQgsPwfKPv81hhUr0?=
 =?us-ascii?Q?8a/XHlMcR4sE1a4du9PlmPN/kT++xeUa2yX29ZdN3UjECvGBk6HkDd3pFxPV?=
 =?us-ascii?Q?TfeJt9d+/3Lnv1CDIrPfLf8/RfVORBVeKKmQPaI/78yOcOy8unPj9vByGf1w?=
 =?us-ascii?Q?4YAsWrpuHRrrj1k=3D?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 11:58:47.9594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8be1f45-915d-4f41-6559-08dd4c25c642
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3309
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 11:59:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115463

From: Mark Jonas <mark.jonas@de.bosch.com>

- Update can-utils to version 2025.01
- Split out the mcp251fd tools to into a can-utils-mcp251fd package

Ricardo Simoes (2):
  can-utils: Upgrade 2023.03 -> 2025.01
  can-utils: Split mcp251fd* into sub-package

 ...-utils_2023.03.bb =3D> can-utils_2025.01.bb} | 43 ++++++++++++++-----
 1 file changed, 33 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-extended/socketcan/{can-utils_2023.03.bb =3D> can-u=
tils_2025.01.bb} (69%)

--=20
2.34.1


