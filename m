Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC72ECCFA0D
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 00:02:01 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3279.1762387311713806800
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 16:01:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=coq5bfsG;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.66, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M04sak4VQML6jcdOzwgjBGYs0kT57QkOXrVX2M2jLEfW36MY8c21TKLPf3hxlxuuqllhw3o7YtfAWT+Vcdbp1UEuegiSSVJNSDN8VjcPX8bqtG03Z0wUZmepgzgx7fVkiZ7mJ6/uIIfUdOTr7AzekAnNAQGybN6luT6znXxRTh9DQYNADybV4yXfKx63TnV4GtW2HKpO9j931KJ5E51sC7tv8YqGROt0Wl9ojE6PIbuGgbslw0gtIAt60c2OgfL0BPqvOUSJJQDSkkGsYQkalOhb+SFOXA44H/jux9Lc0TlxHrJNb1Xt9aN2bzW74RME8APlwj1ytp7BHFOuz200gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXvR61Ax46csygxUbICz20tyQAOBT1h7hK8yPOKAShM=;
 b=mm/mYJoOb1QYwR9fMXJY9M2rgSI3I5DQbarBINw9ro/E1wOePBkoNJsQshAj4Fi1SlBN5NiPrp7wZGYzeNhROdw4p2WQVOaFRMaVyuA4nAs8CCiUUJCpgZl1IfZNSJS+8A4Kfd8Ssf5b+Mmh+DpsB6TTi6KQ9X0HRAZY1mMaGEnk1UG7iKX3cIEG8mTYMQSSmShMvZ9Ivjh5Pr4hT2RkckkpiG6wNke78IcPQ2QLPI0j/YF8W5zZGmlUXa6qniP0gBc6XLaufgTa1yp8sqprRTVuf3GCxCV0xc8Mv7TRr+/hrRAPrs5fptywjXRqAZ/DmzRqHLhtX2yPx49jfOM3ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXvR61Ax46csygxUbICz20tyQAOBT1h7hK8yPOKAShM=;
 b=coq5bfsGoCjh4hKaA9eWEGwhBIBm1baJL8/hpmeEe9TnqNZsGY3+Pw/SBl/FHkWrONNXwCpk55R78kuruO5QeXKl9xE7y4GH66CzkXXw7IrwaozjerTTLUGnv9i8ZhVxF6iVE1zHKHYG/Qro/qv97JfkeDazVMpTJcY8CG5yFQg=
Received: from DS7PR03CA0034.namprd03.prod.outlook.com (2603:10b6:5:3b5::9) by
 SJ0PR10MB4687.namprd10.prod.outlook.com (2603:10b6:a03:2d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Thu, 6 Nov
 2025 00:01:49 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:5:3b5:cafe::c5) by DS7PR03CA0034.outlook.office365.com
 (2603:10b6:5:3b5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.9 via Frontend Transport; Thu, 6
 Nov 2025 00:01:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 00:01:49 +0000
Received: from DLEE115.ent.ti.com (157.170.170.26) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20; Wed, 5 Nov
 2025 18:01:46 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 5
 Nov 2025 18:01:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 5 Nov 2025 18:01:46 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A601kgF295247;
	Wed, 5 Nov 2025 18:01:46 -0600
From: <rs@ti.com>
To: <anuj.mittal@intel.com>
CC: <Openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][scarthgap][PATCH] glm: add nativesdk to BBCLASSEXTEND
Date: Wed, 5 Nov 2025 17:59:08 -0600
Message-ID: <20251105235907.567327-2-rs@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|SJ0PR10MB4687:EE_
X-MS-Office365-Filtering-Correlation-Id: add3cde0-1725-4d5b-4bd0-08de1cc7aedc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|34020700016|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VvUknq3dhetE8orp8+pL9Blpa8VIoFn3T+uZnFEDOjyD2sM50N3OjBH67pjF?=
 =?us-ascii?Q?X8EzlphMDzJdpB9R80990+pILo1DuaxuZiQZLgFndlhi5DOUVal9W4TFXCSz?=
 =?us-ascii?Q?Q4b44eeKS0abZc4eNINiOrXmOI8bkPdV8SwVSBgHewxH/24t1czRwWGo9sb/?=
 =?us-ascii?Q?k6tFq+Ri+XjgGLcIAwBDwbdpLs8GpQHRWokOpH6mZ5yDjum/tKRGf51wUZSs?=
 =?us-ascii?Q?XbOf/pzrHxrRbbXyzWIIS+OpYXlP8gAoQu2QvXMMMzudMiVgCdqt4vjwlSLa?=
 =?us-ascii?Q?tTTMVIdA+6vMAO3MA07cyia15G243rGdu3vPs6Sx5YSlTiZe+C7Ll4sWBm79?=
 =?us-ascii?Q?2EBka9/mhXEYZcLFFK/FPvkN/hMigN10oPz3IsBAfbciY08aQd+BSA4Hihcj?=
 =?us-ascii?Q?qH/FmsDlig/obvMYwB6LQWmZSR1s81WE4GzWdgmx8DacAS4BJ4js8FwI3/0y?=
 =?us-ascii?Q?6cpELw/gZzQp2f/2TK6LlsCrjsnuoyMxaTn74GWim5J6xxnxkVzDdlnvbtdz?=
 =?us-ascii?Q?kb9rB8UMILmIFzVjvEhjIC5evZ7wRH768iADfD15nLdeiyTrIVHYL8l7FBOV?=
 =?us-ascii?Q?dQLyA0+jwfwCarUUEFtY5vko8iYxOzlxvRvZwOs9V9fm3Hs+1OKrTmkp3g6i?=
 =?us-ascii?Q?hwIxI6sNFftnrAPUZzR3h8GZU3cvP+fRuQYbuRaGnMEFFPVrKpz9vXKagxtX?=
 =?us-ascii?Q?nh6Gi1LzAZdtCoBAq6AZClprCx4s14HgBhkGbJ6GcKUdcoUDo/5wZ1kXgzHJ?=
 =?us-ascii?Q?SKQUEfs+bdyJE+yqUVC0Imf0s6eTjwpeGLRZklC5L8GG1tMtzVnbfqNFzSIH?=
 =?us-ascii?Q?VnUgU6knVSWUXb3W8eJwOpjI+1wFJKwp0mq+ba0eJgxn+3aQDLCUMmLFMg8P?=
 =?us-ascii?Q?7pIFzyHH7AW4PVLm8NNbUAD9f66InXp/JZcs31w28jz0UtmEw6sXcXDoJ0r7?=
 =?us-ascii?Q?tnufqwPffxnAHOpuyLQK5ID9rXUYvGcC54GIgDNsFb7TGHXJYxVOtBBrO1ec?=
 =?us-ascii?Q?KGtP8dBcww/Q9OTubNTSvdaBWmCIxTFjoJHrMYfpreSVwkp+78jOQEggWn1S?=
 =?us-ascii?Q?S1BE/pBw/8TggLjN2N8gYQwGCjgEUtyeuBKqkYT+PKgBjm98qlvzIpFTIKWY?=
 =?us-ascii?Q?z82ZvduGxRHgIwMspAmubpqfJrPxzC3R3Cml/0jWfFUC6ESJNUrbY1x5R35j?=
 =?us-ascii?Q?VUGBTYGzYx+ZeTGVq2rzrfXlOR2H2sbHFXCjesB10leCb1rKsO7dpC0K9w9b?=
 =?us-ascii?Q?XenlFOYV2wkrBu0QYg1XGD8aoNfKcFgrCiqEwFI1ea9ZjdY/udJofiWACZYk?=
 =?us-ascii?Q?fnNTbVbyw2OiAuocQ/Muw4le2LXrDQji+OBVHjkcsv+5VfbiVZ/FR77b8F+L?=
 =?us-ascii?Q?3tqjyB0FP3B+aSypATP1qf5LLqcpIZG5+5PZITVw5sgagKm9w6YSKZ8IShzt?=
 =?us-ascii?Q?fL1xDI1j0gMf6ihbxODSaDcCG4f5NmnrPd32oiXCZBHYS2DEcg3D67CTU/g0?=
 =?us-ascii?Q?LXhQdqBhLnpQehW0pMXfP3cGbsSTu/XeEXHzcTq9SbKQ9GYPXDhJmfA4hySP?=
 =?us-ascii?Q?4qj+KIvO92i+M1VHyhA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(34020700016)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 00:01:49.0212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: add3cde0-1725-4d5b-4bd0-08de1cc7aedc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4687
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Nov 2025 00:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121352

From: Randolph Sapp <rs@ti.com>

This is a header only package. It may be useful to the native machine
but it is definitely useful for the nativesdk machine.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---

Backport this quick modification to the BBCLASSEXTEND for glm since it was
requested. If it's too late for this type of change feel free to let me kno=
w.
We'll carry it on our end if necessary.

 meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb b/meta-oe/recipes-=
graphics/glm/glm_0.9.9.8.bb
index dd520b245e..a7d27f7fcc 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
@@ -38,4 +38,4 @@ do_install() {
=20
 RDEPENDS:${PN}-dev =3D ""
=20
-BBCLASSEXTEND =3D "native"
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.51.1


