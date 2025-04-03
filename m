Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D230DC36014
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 21:23:55 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.35])
 by mx.groups.io with SMTP id smtpd.web11.6936.1743715432583850147
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 14:23:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=jJzwY++o;
 spf=pass (domain: axis.com, ip: 52.101.66.35, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPwF7HLXf66+Q3KElkCsS/POAuuwCmMhYWEpLVw1QCFFu9G3MZG0AIF+gdaVie9i02gsTE8E6ZtWQmjE6e8igtH8xiv5M4yDqsZnu1ahlDLbAmJKLM7KpvgjS0dXOZC6TCmK44N3MHz+QH0mmTgMx/yVvkLpxvDa27G7i8hevTk6Erd2RN+SPQhAmR6HQAfMpgkpWcIzd0G3YdnzdBT5zPQ+lyWCIgnJd5+XGw7UnMX2bXU1Jo279jF2QXVdjQc+AJ92Q11pwXPffjcSU6qkypExJtE19EI0+n++WbddNQbMPg7DJn4fCLzY1bf4ZA+YzOF2JawZPVCv/1sEjU0Kzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhiYps+TgQtwQLHmMElt/YzPL0t4Yf/nPOBkkUr0MBs=;
 b=agd9xtNdwIBW4I7jpcNVYgg37wMVlwWa99qYh9eCluzobwXCUcs5wH6Zb2LNFrMhhERXtTshKy9KG6NrMMUCX+8i1uGm/nbIU0Bkh6Do8pgxNAKjJLT4YKM5VywS22hrIoYxH+UCpN61E0nI8ofwiCKa3+POPSxtZ0gPTYFVAPk0T/7YkHuLpPPbRRLTSJ7n0ooE1lxOGxJEP4TQw1UD19NB6LrtrpCtjiem3yZ2hW2/fh5C+KEDSqhK/i2PBEyQRT4GzR0gM8HmwaeJuDrDszC8AjbeVAzVHwMe52rnZCnYPV+txO4o2WdW8PV2Tyj37rJsVy8Hwu+nTrHJGgkpng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhiYps+TgQtwQLHmMElt/YzPL0t4Yf/nPOBkkUr0MBs=;
 b=jJzwY++ow/wklzRathwGONGLBbWu6S9I0hop1Q0V1TCu9jwN/IZq+qIcGD3vofEVANzWuWfTvVnhLaHW+GzcWXE8suzGY7A+xXXn66Ij8JXKSEeP5jX3ap+R39g4MRI+WLfr0zGH0sOTj6bE+mCINlo7x3J+8mPkvCrmQ6+n8Z0=
Received: from DUZPR01CA0126.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::20) by VI1PR02MB6127.eurprd02.prod.outlook.com
 (2603:10a6:800:178::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 21:23:47 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::43) by DUZPR01CA0126.outlook.office365.com
 (2603:10a6:10:4bc::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.26 via Frontend Transport; Thu,
 3 Apr 2025 21:23:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 21:23:46 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 3 Apr
 2025 23:23:45 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 3 Apr 2025 23:23:45 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 98168132
	for <openembedded-devel@lists.openembedded.org>; Thu,  3 Apr 2025 23:23:45 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 533LNjBn3580581
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Apr 2025 23:23:45 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 533LNjeV3580580
	for openembedded-devel@lists.openembedded.org; Thu, 3 Apr 2025 23:23:45 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/1] ne10: Avoid requesting an executable stack
Date: Thu, 3 Apr 2025 23:23:42 +0200
Message-ID: <20250403212342.3580553-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0D:EE_|VI1PR02MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: 90e91aa7-a107-4777-9073-08dd72f5d155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?h9XsPf7RScjbVoGfhSF63kWXZjhaP6IotUJGH2Yvk+XhPQWqS3ivmJ2cHIR1?=
 =?us-ascii?Q?fqlj+mmR2GxlwXw9Nmcix8QaJ/Gh2grAolzkoaMjX5szkwtIf1V4/e/L/jDl?=
 =?us-ascii?Q?s88pT0QGWB647tTVyZ7J9CKLhNajGxF1q+Z/TmtEoRs9zE2HUx9YlMH57SJz?=
 =?us-ascii?Q?sP6jVd0vRmTHlswzUxIU01xpJggre0/Hv/KItVxQUP8OdNpx/oclMiquUeQu?=
 =?us-ascii?Q?ZzFpLewAqdePdnuNfKgrlyUvMbIMJFTpCoNFfXUIkwYdU9+bRkzIRyOB5RZZ?=
 =?us-ascii?Q?4w84y2rrqSRS3P21U/j7CoZ8/HErtIZQ3hq4kUmtHEkLvX2NMi9tflEmYrFA?=
 =?us-ascii?Q?SDZNmd5A5puL2QaXBVTMv7AH0fu6WQvf8ZX7qqHkNuOp/vCngQ6NDoEoLM0D?=
 =?us-ascii?Q?FK37oukQctuC7cYDykFpJxMoqJiWL2D+tnp2BaXQDwfYVp0+lHOQTDMrxEDs?=
 =?us-ascii?Q?uewTapZmvuIWIWTUzf4gcvuIf9f+Z0X53Dr6U4JoMGk5bGCP6x3V783suPFr?=
 =?us-ascii?Q?TLlzGnzeATR/ihM9DnLRmnYvSVqf3+MHX2Y1JucE8TZ6qebW0V6MgOLREdKu?=
 =?us-ascii?Q?ZavACq+0GPWlB+XkxY8iTm8/72IuDKT4z7JoipT4o/NfoB3UZ07UVHuJosEr?=
 =?us-ascii?Q?gg3KEiVl6dc8fSOduNRM06JIYKFoTjCYrQsMXnIcgog3U06T+UjMukoOpDhY?=
 =?us-ascii?Q?yyWW1q0/6RHC4u+sB25q3d+uDNViClfXonLg9p3id03NuHLVxGdqiJKem/wH?=
 =?us-ascii?Q?EBYCgS6eTX+DZcw9Za3L2FKJkEFzuJaS9lFjT/MURjmRwDh0wiILGdpG+flL?=
 =?us-ascii?Q?kSWXJo7onkeB0Op1D4058VOucbdvyzO06LcinyJ0AUasZ1U4RX7eJjZCjkQc?=
 =?us-ascii?Q?wgwBqBALwnGyMrunJLrXucclCpAKBZYBQB5zzVlZ/qBoR2BZNdslexB/NsnE?=
 =?us-ascii?Q?b0zvukICWcf62z0bO+y0K9bkH3dseNGR4Zb0Sno1QbQGirj5t+kNf4Jf2NTZ?=
 =?us-ascii?Q?Uz/oS0XY0Q8BQN+fK2rfGPiAG43iajDDrrHxwiPQisXv2qcBfhF3piQ0rep9?=
 =?us-ascii?Q?TxMSXMbs+gm9Z+DhU/QdJ/bTMLoHjIi99X+tINcn+/ivMokOo/y7SnOb5y6K?=
 =?us-ascii?Q?c/6xsZv7okGtePzuysUxbL0D6DgAz5IpKyVZU2NbJMphKKg4FMhbJsMC7c2o?=
 =?us-ascii?Q?RF+z8w/u8auvVxY8JJeaDSCEUrMD3RADKuESNhDaugPVcJdbphY9SbRizBIc?=
 =?us-ascii?Q?iBQLTHm097ZghE3GxGosZrfgVbY4tgsqdArGt7AbLGtVJz/WQWiZ9QVy5cWm?=
 =?us-ascii?Q?LvWgvN01cXYGGQTsK7sHCV7QC/t0okWHXIawUlG5JXzZEYr/xDAbpJMPTpBN?=
 =?us-ascii?Q?VYyXdltQ7PKrOO348DW65ZPAvqLrYEGmTOp6oQxN4JkjPdTwjdEzF2qZFkVl?=
 =?us-ascii?Q?zE1A7OAmO/5SjOIrERbzc5PrT05MGbh6fZ+fa3DBXMYXr56oFesbRTuiDUib?=
 =?us-ascii?Q?Z4ncg2vOAmrlaDU=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 21:23:46.0296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e91aa7-a107-4777-9073-08dd72f5d155
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6127
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 21:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116548

This avoids warnings like:

  ld: warning: NE10_physics.neon.s.o: missing .note.GNU-stack section
  implies executable stack
  ld: NOTE: This behaviour is deprecated and will be removed in a future
  version of the linker

With glibc 2.41, the need for an executable stack lead to errors like
this in runtime:

  [ ERR     ] foo@0[984]: [setup-script: /usr/share/foo/foo.enc] sol:
  runtime error: libNE10.so.10: cannot enable executable stack as shared
  object requires: Invalid argument

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/ne10/ne10_1.2.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes-s=
upport/ne10/ne10_1.2.1.bb
index b10c23984d..39ff7ab969 100644
--- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
+++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
@@ -26,6 +26,7 @@ NE10_TARGET_ARCH:armv7a =3D "${@bb.utils.contains("TUNE_F=
EATURES","neon","armv7","
 NE10_TARGET_ARCH:armv7ve =3D "${@bb.utils.contains("TUNE_FEATURES","neon",=
"armv7","",d)}"
=20
 EXTRA_OECMAKE =3D '-DGNULINUX_PLATFORM=3DON -DNE10_BUILD_SHARED=3DON -DNE1=
0_LINUX_TARGET_ARCH=3D"${NE10_TARGET_ARCH}"'
+CFLAGS +=3D "-Wa,--noexecstack"
=20
 do_install() {
     install -d ${D}${libdir}

