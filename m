Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9788C71130
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 05:18:31 +0000 (UTC)
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.web11.4137.1751924390959874930
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 14:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=b7b1S7c+;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=SZFCGNCf;
 spf=pass (domain: garmin.com, ip: 205.220.165.212, mailfrom: prvs=028352addd=colin.mcallister@garmin.com)
Received: from pps.filterd (m0220295.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567K2Gw5028545
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Jul 2025 16:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps1; bh=lwk42
	2bz1hG55X1N+RWpW7wrTqQNms7pOfnCI/4x58w=; b=b7b1S7c+AXHNb+l+YWFDr
	NAhtyh7nn0U0PUXJ2xI+/BAl996hnyJv5VZr8PSp3e/96CBc57Fpab5J/Z4ifODk
	1kPRYj8qA8xx88Auz7ialkH2l5GDFkgvifJiIi+Vlv8FDHKP32MCKYjwyV2a/c4i
	zpO61mGeY2QDwWlh9LoDu6VxUXS2nLH1+4zOx94clT/0OK7ZoZKToBeCRrj4WrZ9
	qtOlSbmJEFlam/ltU9S6V72IvRf6Yzo2Yr2yR8u1sdqmvDfGSJcjmi/1aTHJpDap
	kWJWsP19CZtjcmQEpU1Rj9vJlr/wM5uqY11ZPgl/YIbhnqK6maGn+OJRzQMdLa0C
	Q==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2113.outbound.protection.outlook.com [40.107.101.113])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 47rce0sdd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 16:39:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPRe7lCqEbnafkZsDhuOsC2F7VgFjVPGZ+8vzlbviO9CD4CrRygSP3hHgalEgiLQQ4cuzATq7H62QR5ixwXOdbia+WFfNVytvmBaZtorrmgg5kEg2uljKJ0WfSC4lFzi+/xTxpKKDZHyaqet45hGEYYP6S/guNPEENe4Eo4/uu+ojpLqYtADFCjGUdBPSxCeGztSw+PhHlOVCNdHyYoCTPQDUDl/dynaWknTwvtEJhvjCihQcsQzA0ty4hoTyeFsD2MF6GtV3Wy75v4Xm67puPafGHv7BtyfhADvwlf7b50oGxlJa45OnE6F0irNi43cIuhPG/A8mMIMuQ77jk+QMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwk422bz1hG55X1N+RWpW7wrTqQNms7pOfnCI/4x58w=;
 b=iG7IhT+Vq6A6o2adet5mlHms31pPLY4itATK8/1/NuZ9tYKLdxr8US0XMFAmZ/z28hdRjCpOjxg4S3qCJKg022cNipZqpkWiLld+Xw/U++AJ+j+ng70HR4JOOyoORemOG7UOmpD66gPpe2pZJx1qkhBzGjav9uGSbKj/TfsYKdYrH4SVx0dXPrP43r450IELjf9UuD4+NnEN4whyPRu3OlBz5puB887N+ZNBeAgrKAQRIctgFq5jk8ESsX6a3yjHYuLcor9a1XchaWjKSByDmo2y9zAOvSP1D72Wkrim9pzPEYQscRyw7ZFVsmX9cMnsY3XaOrslfA74jLmUfMZlQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=garmin.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwk422bz1hG55X1N+RWpW7wrTqQNms7pOfnCI/4x58w=;
 b=SZFCGNCfGOiakJfxVxgXw/RpyyqcyUxISKkfNzdJT4ZbDshQV5sSaT2K9vp+VK68uhHNUgY5BkvNHWTCCnLaIYDAWhEBvF+ssBYLtd/X9qcut211ecj2xego7FoQqzXVmC+eAA24PQKvvnEIIUwufGBchrqbVhPSvLXgMN8bbH91BiakjjRmWcdPkGYXfmbhKneFI2/kogs6vRdlTd++TzwqEjNawsZzkhJf8doLM5SL2Y9q16YvZHbPDZvLwny9wUkyP75y+0Id+YDRS1N6+gAY0Xp2sFFx99EHNB0tXHID7mjvj/XZ9HiwqTwI2XSMoKjZoE5NWivRhoicxpzqBA==
Received: from SA9PR13CA0100.namprd13.prod.outlook.com (2603:10b6:806:24::15)
 by PH7PR04MB8454.namprd04.prod.outlook.com (2603:10b6:510:2b5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Mon, 7 Jul
 2025 21:39:48 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10b6:806:24:cafe::89) by SA9PR13CA0100.outlook.office365.com
 (2603:10b6:806:24::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.20 via Frontend Transport; Mon,
 7 Jul 2025 21:39:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Mon, 7 Jul 2025 21:39:46 +0000
Received: from cv1wpa-exmb7.ad.garmin.com (10.5.144.77) by cv1wpa-edge1
 (10.60.4.252) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 7 Jul 2025
 16:39:44 -0500
Received: from cv1wpa-exmb2.ad.garmin.com (10.5.144.72) by
 cv1wpa-exmb7.ad.garmin.com (10.5.144.77) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.34; Mon, 7 Jul 2025 16:39:45 -0500
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 CV1WPA-EXMB2.ad.garmin.com (10.5.144.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Jul 2025 16:39:45 -0500
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.71) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Jul 2025 16:39:45 -0500
From: "Colin McAllister" <colin.mcallister@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Subject: [meta-oe][kirkstone][PATCH v2 1/1] jq: Fix CVEs
Date: Mon, 7 Jul 2025 16:39:43 -0500
Message-ID: <20250707213943.2687128-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707205243.2576093-1-colin.mcallister@garmin.com>
References: <20250707205243.2576093-1-colin.mcallister@garmin.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|PH7PR04MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a41dc9-fc34-4229-ae43-08ddbd9ecb2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0UYHj7cIm3AQ47CWj48z7zpUEuIvSPpFRW369CrdCPST55+xT1Dbxx6i8H5j?=
 =?us-ascii?Q?E47zHUHKySzjX5gaCqZaGs27z+n2xs6M2sSsCkLNi7ua5lmq+X2HU/lMnw7D?=
 =?us-ascii?Q?+JL6xcSlFmjb6WdEm9l1a4iZhKE9JJKRR5vtqrdzZweteWJGrpDYMUu0wa5x?=
 =?us-ascii?Q?sU42ikqifUsy/ZjcOpz5yuVI855+IB2dzarEcCOvo+WydtkAdmMDbEipCEVj?=
 =?us-ascii?Q?H3ih3zrgIZfn9GsFNSRaA9D90d7jAejEirAx9nOEuWVtwxHGV2oHFIaNK2YK?=
 =?us-ascii?Q?PmhN2yDbTy87s48bGJfrtB15paTAFLQZN3cBGW8r9KX9OciXG+KPyj9mHLBY?=
 =?us-ascii?Q?RLfZSbxLLcRkQwsYxHMgitIKC/sYvvKXf6ws0CLjLhXifcta5JYaO8Iror7U?=
 =?us-ascii?Q?M4Er3DF8qZ4myudyKGy0sLhseaNpj+bI9hsZZHw+kcILG71DBU2kpjvAmn+9?=
 =?us-ascii?Q?pgqv2hGvjYqyDZvDFGSE7PFhG+XxH/mSsGlSN7x4Qy8hCUEjti++rx0RsvST?=
 =?us-ascii?Q?zzbYSiGK0K4PXutyyNiI0TeU1+NJ8BOcQNz8nc9X9rODAGaXf599StlBKc+v?=
 =?us-ascii?Q?6kVTDW3VjAXFDVWmrxRsD0uQpbbvMveLa/SM8ldQ4R9yLNX5Av2JbJr/EgFT?=
 =?us-ascii?Q?bw63tjK9Pg3sZ+dqzYgOQkO/1CO9RYdW4VJ9faXDFKMh+qkFvUoVZBChpRnH?=
 =?us-ascii?Q?oeF6Bg1lxOVwG6IhgiYUbagVLHJ/keaNru43fqBxwyeQDVpeqtcYk2pdP4av?=
 =?us-ascii?Q?Azx+gBGHz2Q2gXzGn4qA495I9cDrV1XTXvelVrEJyYoGrmMcW2kmq7TSTFqC?=
 =?us-ascii?Q?RcaHcwWTxt5n3DxMYp9i3K+p8Yu4TQgu8aK0gR96WlBvqd5PzXT0apUK/MQB?=
 =?us-ascii?Q?XFiFWNy9JBeQySySQwO4Z/QdH71scLyNpBlWPVoLSxhdXJAwbAl/jobEK1Sk?=
 =?us-ascii?Q?Lol5VfLNF79srIBlrre9icC0R4YnWV9EQNTFZ1In3mKKY/P0AvylhGzcenvw?=
 =?us-ascii?Q?mLjicpdxCekaOa6pTIXUD/uV/3N4JSAu3FiRtzP07aYY6Len/cWtGT2m9thH?=
 =?us-ascii?Q?X6snvOWO8JnaP1cmBT4V+BfTWwbeAliUJ5l/SrD72A+6xGnbMEAudimkbzKR?=
 =?us-ascii?Q?69xi9nbKDFWDtK1Y7leX0TQIOotxfrGTVynfxmEzCsvr/I1vHkbnFsxp5MIt?=
 =?us-ascii?Q?V0rFRPSrzTK2UlK4ASn4AdaJmN9ZVBD9AH+55AYbzpGJF390SeAFq47Gsgw5?=
 =?us-ascii?Q?vPB+jKrOouPFGQZ7xJ6+HGe7QR3scgK/P5JGveitOnoAKY8fI99BwEmUOhua?=
 =?us-ascii?Q?Va/hDAE2k2gH7UnSFBH8gOyUq9WiCus5QI2+CjoT07AltkYcoVzh2Mb3NKSu?=
 =?us-ascii?Q?OiiVhMXYNH9w1JRd/++5XGZu2ZAWcmORGm9UZMOk74/sNWkhCp2mECO/29B9?=
 =?us-ascii?Q?w4tDFPylpy+K9+Hp6Gvv34Dna31Lsh2hYOYryUNFYcb6/Dv++O5sZSK4N1s+?=
 =?us-ascii?Q?NFQOBgsUkGy6EKFwBeKhbNujuRszKaMbsk6RuRHV3S7OYrPiPTr5gMOrfg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 21:39:46.6176
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a41dc9-fc34-4229-ae43-08ddbd9ecb2a
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR04MB8454
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDE0NiBTYWx0ZWRfX0UH1qamAU+Tf 7BDesDlaOu6QSLcOs8iZqUej/e25qcTpfXhrz6tIkanEOsY+frO3WI0QCOmTlQ0iGjGJzz0KcKm AROhaUM31i8KgQSGaFb2mk+PjbPiPjrfwGQmTkct1+STY2ik4K+Ipr0fHGZ70lSCcDkcENBjhGP
 KBMYLhsjU3y+A3AZ0zDd5Blv9k7QLmAW6USZjm3ijK3BHZstfMqdc9u8pVJY+Arkf+VUtfvq4uc 9k8vpIyCM1syuRePIiWfOWlFJBoI3M7f4Ks6cWVfpyu0W4BIpjBuQTvHwAfBDu29FJo2Jy2YBK2 pMFYrNAcHEtEVfXxR0SueRsg4CzDTtaAtNAc/iEjXnwCpxrgdUNLP6i5B3TT4JD8VZX9omSrC3n
 h049E7RvRtMRuustupGZ/lAZDW5XyyqGIhCHgbQY6PKA/nMjNVDLABUShSggC/4fh0tymgJJ
X-Proofpoint-GUID: Ew4nAajooGCLoGM9rlufx1wFbRIWu4Mo
X-Authority-Analysis: v=2.4 cv=asqyCTZV c=1 sm=1 tr=0 ts=686c3ea6 cx=c_pps a=Ztrme8kyfIlQy6zXeYdROA==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10 a=qm69fr9Wx_0A:10 a=NEAV23lmAAAA:8 a=NbHB2C0EAAAA:8 a=3V5AN9CWQ5oYIMVHn_4A:9 cc=ntf
X-Proofpoint-ORIG-GUID: Ew4nAajooGCLoGM9rlufx1wFbRIWu4Mo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_05,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=notification
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507070146
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 05:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118298

Adds backported patches to fix CVE-2024-23339, CVE-2024-53427, and
CVE-2025-48060.

Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Change-Id: Ibc2db956b7fd5d0388dbed1a81ddf9aa58431fb1
---
Updated patch to include a fix for CVE-2024-53427.

Also, just as a note, all of these patches were verified with the jq test suite
that can be ran with `make check`. Verified on x86_64.

 .../jq/jq/CVE-2024-23337.patch                | 219 ++++++++++++++++++
 .../jq/jq/CVE-2024-53427-01.patch             |  69 ++++++
 .../jq/jq/CVE-2024-53427-02.patch             |  56 +++++
 .../jq/jq/CVE-2025-48060.patch                |  46 ++++
 meta-oe/recipes-devtools/jq/jq_git.bb         |   8 +-
 5 files changed, 397 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2024-53427-01.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2024-53427-02.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch
new file mode 100644
index 0000000000..87e639aad7
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2024-23337.patch
@@ -0,0 +1,219 @@
+From 35cde320ac7ee9ad6da5ce422922fafe592c4c60 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Wed, 21 May 2025 07:45:00 +0900
+Subject: [PATCH 1/2] Fix signed integer overflow in jvp_array_write and
+ jvp_object_rehash
+
+This commit fixes signed integer overflow and SEGV issues on growing
+arrays and objects. The size of arrays and objects is now limited to
+`536870912` (`0x20000000`). This fixes CVE-2024-23337 and fixes #3262.
+
+CVE: CVE-2024-23337
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/de21386681c0df0104a99d9d09db23a9b2a78b1e]
+Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
+---
+ src/jv.c      | 45 ++++++++++++++++++++++++++++++++++++---------
+ src/jv_aux.c  |  9 +++++----
+ tests/jq.test |  4 ++++
+ 3 files changed, 45 insertions(+), 13 deletions(-)
+
+diff --git a/src/jv.c b/src/jv.c
+index 9784b22..33ccee9 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -1006,6 +1006,11 @@ jv jv_array_set(jv j, int idx, jv val) {
+     jv_free(val);
+     return jv_invalid_with_msg(jv_string("Out of bounds negative array index"));
+   }
++  if (idx > (INT_MAX >> 2) - jvp_array_offset(j)) {
++    jv_free(j);
++    jv_free(val);
++    return jv_invalid_with_msg(jv_string("Array index too large"));
++  }
+   // copy/free of val,j coalesced
+   jv* slot = jvp_array_write(&j, idx);
+   jv_free(*slot);
+@@ -1025,6 +1030,7 @@ jv jv_array_concat(jv a, jv b) {
+   // FIXME: could be faster
+   jv_array_foreach(b, i, elem) {
+     a = jv_array_append(a, elem);
++    if (!jv_is_valid(a)) break;
+   }
+   jv_free(b);
+   return a;
+@@ -1296,6 +1302,7 @@ jv jv_string_indexes(jv j, jv k) {
+     p = jstr;
+     while ((p = _jq_memmem(p, (jstr + jlen) - p, idxstr, idxlen)) != NULL) {
+       a = jv_array_append(a, jv_number(p - jstr));
++      if (!jv_is_valid(a)) break;
+       p += idxlen;
+     }
+   }
+@@ -1318,14 +1325,17 @@ jv jv_string_split(jv j, jv sep) {
+ 
+   if (seplen == 0) {
+     int c;
+-    while ((jstr = jvp_utf8_next(jstr, jend, &c)))
++    while ((jstr = jvp_utf8_next(jstr, jend, &c))) {
+       a = jv_array_append(a, jv_string_append_codepoint(jv_string(""), c));
++      if (!jv_is_valid(a)) break;
++    }
+   } else {
+     for (p = jstr; p < jend; p = s + seplen) {
+       s = _jq_memmem(p, jend - p, sepstr, seplen);
+       if (s == NULL)
+         s = jend;
+       a = jv_array_append(a, jv_string_sized(p, s - p));
++      if (!jv_is_valid(a)) break;
+       // Add an empty string to denote that j ends on a sep
+       if (s + seplen == jend && seplen != 0)
+         a = jv_array_append(a, jv_string(""));
+@@ -1343,8 +1353,10 @@ jv jv_string_explode(jv j) {
+   const char* end = i + len;
+   jv a = jv_array_sized(len);
+   int c;
+-  while ((i = jvp_utf8_next(i, end, &c)))
++  while ((i = jvp_utf8_next(i, end, &c))) {
+     a = jv_array_append(a, jv_number(c));
++    if (!jv_is_valid(a)) break;
++  }
+   jv_free(j);
+   return a;
+ }
+@@ -1617,10 +1629,13 @@ static void jvp_object_free(jv o) {
+   }
+ }
+ 
+-static jv jvp_object_rehash(jv object) {
++static int jvp_object_rehash(jv *objectp) {
++  jv object = *objectp;
+   assert(JVP_HAS_KIND(object, JV_KIND_OBJECT));
+   assert(jvp_refcnt_unshared(object.u.ptr));
+   int size = jvp_object_size(object);
++  if (size > INT_MAX >> 2)
++    return 0;
+   jv new_object = jvp_object_new(size * 2);
+   for (int i=0; i<size; i++) {
+     struct object_slot* slot = jvp_object_get_slot(object, i);
+@@ -1633,7 +1648,8 @@ static jv jvp_object_rehash(jv object) {
+   }
+   // references are transported, just drop the old table
+   jv_mem_free(jvp_object_ptr(object));
+-  return new_object;
++  *objectp = new_object;
++  return 1;
+ }
+ 
+ static jv jvp_object_unshare(jv object) {
+@@ -1662,27 +1678,32 @@ static jv jvp_object_unshare(jv object) {
+   return new_object;
+ }
+ 
+-static jv* jvp_object_write(jv* object, jv key) {
++static int jvp_object_write(jv* object, jv key, jv **valpp) {
+   *object = jvp_object_unshare(*object);
+   int* bucket = jvp_object_find_bucket(*object, key);
+   struct object_slot* slot = jvp_object_find_slot(*object, key, bucket);
+   if (slot) {
+     // already has the key
+     jvp_string_free(key);
+-    return &slot->value;
++    *valpp = &slot->value;
++    return 1;
+   }
+   slot = jvp_object_add_slot(*object, key, bucket);
+   if (slot) {
+     slot->value = jv_invalid();
+   } else {
+-    *object = jvp_object_rehash(*object);
++    if (!jvp_object_rehash(object)) {
++      *valpp = NULL;
++      return 0;
++    }
+     bucket = jvp_object_find_bucket(*object, key);
+     assert(!jvp_object_find_slot(*object, key, bucket));
+     slot = jvp_object_add_slot(*object, key, bucket);
+     assert(slot);
+     slot->value = jv_invalid();
+   }
+-  return &slot->value;
++  *valpp = &slot->value;
++  return 1;
+ }
+ 
+ static int jvp_object_delete(jv* object, jv key) {
+@@ -1783,7 +1804,11 @@ jv jv_object_set(jv object, jv key, jv value) {
+   assert(JVP_HAS_KIND(object, JV_KIND_OBJECT));
+   assert(JVP_HAS_KIND(key, JV_KIND_STRING));
+   // copy/free of object, key, value coalesced
+-  jv* slot = jvp_object_write(&object, key);
++  jv* slot;
++  if (!jvp_object_write(&object, key, &slot)) {
++    jv_free(object);
++    return jv_invalid_with_msg(jv_string("Object too big"));
++  }
+   jv_free(*slot);
+   *slot = value;
+   return object;
+@@ -1808,6 +1833,7 @@ jv jv_object_merge(jv a, jv b) {
+   assert(JVP_HAS_KIND(a, JV_KIND_OBJECT));
+   jv_object_foreach(b, k, v) {
+     a = jv_object_set(a, k, v);
++    if (!jv_is_valid(a)) break;
+   }
+   jv_free(b);
+   return a;
+@@ -1827,6 +1853,7 @@ jv jv_object_merge_recursive(jv a, jv b) {
+       jv_free(elem);
+       a = jv_object_set(a, k, v);
+     }
++    if (!jv_is_valid(a)) break;
+   }
+   jv_free(b);
+   return a;
+diff --git a/src/jv_aux.c b/src/jv_aux.c
+index 994285a..0753aef 100644
+--- a/src/jv_aux.c
++++ b/src/jv_aux.c
+@@ -162,18 +162,19 @@ jv jv_set(jv t, jv k, jv v) {
+         if (slice_len < insert_len) {
+           // array is growing
+           int shift = insert_len - slice_len;
+-          for (int i = array_len - 1; i >= end; i--) {
++          for (int i = array_len - 1; i >= end && jv_is_valid(t); i--) {
+             t = jv_array_set(t, i + shift, jv_array_get(jv_copy(t), i));
+           }
+         } else if (slice_len > insert_len) {
+           // array is shrinking
+           int shift = slice_len - insert_len;
+-          for (int i = end; i < array_len; i++) {
++          for (int i = end; i < array_len && jv_is_valid(t); i++) {
+             t = jv_array_set(t, i - shift, jv_array_get(jv_copy(t), i));
+           }
+-          t = jv_array_slice(t, 0, array_len - shift);
++          if (jv_is_valid(t))
++            t = jv_array_slice(t, 0, array_len - shift);
+         }
+-        for (int i=0; i < insert_len; i++) {
++        for (int i = 0; i < insert_len && jv_is_valid(t); i++) {
+           t = jv_array_set(t, start + i, jv_array_get(jv_copy(v), i));
+         }
+         jv_free(v);
+diff --git a/tests/jq.test b/tests/jq.test
+index 2d5c36b..c6c6ee5 100644
+--- a/tests/jq.test
++++ b/tests/jq.test
+@@ -186,6 +186,10 @@ null
+ [0,1,2]
+ [0,5,2]
+ 
++try (.[999999999] = 0) catch .
++null
++"Array index too large"
++
+ #
+ # Multiple outputs, iteration
+ #
+-- 
+2.49.0
+
diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2024-53427-01.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2024-53427-01.patch
new file mode 100644
index 0000000000..dbced0a1a3
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2024-53427-01.patch
@@ -0,0 +1,69 @@
+From 4240af6a20465894dce871707271e11a05432dac Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Sun, 16 Feb 2025 22:08:36 +0900
+Subject: [PATCH 1/2] fix: `jv_number_value` should cache the double value of
+ literal numbers (#3245)
+
+The code of `jv_number_value` is intended to cache the double value of
+literal numbers, but it does not work because it accepts the `jv` struct
+by value. This patch fixes the behavior by checking if the double value
+is `NaN`, which indicates the unconverted value. This patch improves the
+performance of major use cases; e.g. `range(1000000)` runs 25% faster.
+
+CVE: CVE-2024-53427
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/b86ff49f46a4a37e5a8e75a140cb5fd6e1331384]
+Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
+---
+ src/jv.c | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/src/jv.c b/src/jv.c
+index 4d7bba1..9051f65 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -209,9 +209,6 @@ enum {
+   JVP_NUMBER_DECIMAL = 1
+ };
+ 
+-#define JV_NUMBER_SIZE_INIT      (0)
+-#define JV_NUMBER_SIZE_CONVERTED (1)
+-
+ #define JVP_FLAGS_NUMBER_NATIVE       JVP_MAKE_FLAGS(JV_KIND_NUMBER, JVP_MAKE_PFLAGS(JVP_NUMBER_NATIVE, 0))
+ #define JVP_FLAGS_NUMBER_NATIVE_STR   JVP_MAKE_FLAGS(JV_KIND_NUMBER, JVP_MAKE_PFLAGS(JVP_NUMBER_NATIVE, 1))
+ #define JVP_FLAGS_NUMBER_LITERAL      JVP_MAKE_FLAGS(JV_KIND_NUMBER, JVP_MAKE_PFLAGS(JVP_NUMBER_DECIMAL, 1))
+@@ -619,8 +616,12 @@ static jv jvp_literal_number_new(const char * literal) {
+     jv_mem_free(n);
+     return JV_INVALID;
+   }
++  if (decNumberIsNaN(&n->num_decimal)) {
++    jv_mem_free(n);
++    return jv_number(NAN);
++  }
+ 
+-  jv r = {JVP_FLAGS_NUMBER_LITERAL, 0, 0, JV_NUMBER_SIZE_INIT, {&n->refcnt}};
++  jv r = {JVP_FLAGS_NUMBER_LITERAL, 0, 0, 0, {&n->refcnt}};
+   return r;
+ }
+ 
+@@ -719,9 +720,8 @@ double jv_number_value(jv j) {
+   if (JVP_HAS_FLAGS(j, JVP_FLAGS_NUMBER_LITERAL)) {
+     jvp_literal_number* n = jvp_literal_number_ptr(j);
+ 
+-    if (j.size != JV_NUMBER_SIZE_CONVERTED) {
++    if (isnan(n->num_double)) {
+       n->num_double = jvp_literal_number_to_double(j);
+-      j.size = JV_NUMBER_SIZE_CONVERTED;
+     }
+ 
+     return n->num_double;
+@@ -755,6 +755,7 @@ int jvp_number_is_nan(jv n) {
+   } else {
+     return n.u.number != n.u.number;
+   }
++  return isnan(n.u.number);
+ }
+ 
+ int jvp_number_cmp(jv a, jv b) {
+-- 
+2.49.0
+
diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2024-53427-02.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2024-53427-02.patch
new file mode 100644
index 0000000000..f650d28c85
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2024-53427-02.patch
@@ -0,0 +1,56 @@
+From aea65caf03c129f3303d044044d2d1105be81b71 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Wed, 5 Mar 2025 07:43:54 +0900
+Subject: [PATCH 2/2] Reject NaN with payload while parsing JSON
+
+This commit drops support for parsing NaN with payload in JSON like
+`NaN123` and fixes CVE-2024-53427. Other JSON extensions like `NaN` and
+`Infinity` are still supported. Fixes #3023, fixes #3196, fixes #3246.
+
+CVE: CVE-2024-53427
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/a09a4dfd55e6c24d04b35062ccfe4509748b1dd3]
+Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
+---
+ src/jv.c      |  5 +++++
+ tests/jq.test | 12 ++++++++++++
+ 2 files changed, 17 insertions(+)
+
+diff --git a/src/jv.c b/src/jv.c
+index 9051f65..4da5ba8 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -617,6 +617,11 @@ static jv jvp_literal_number_new(const char * literal) {
+     return JV_INVALID;
+   }
+   if (decNumberIsNaN(&n->num_decimal)) {
++    // Reject NaN with payload.
++    if (n->num_decimal.digits > 1 || *n->num_decimal.lsu != 0) {
++      jv_mem_free(n);
++      return JV_INVALID;
++    }
+     jv_mem_free(n);
+     return jv_number(NAN);
+   }
+diff --git a/tests/jq.test b/tests/jq.test
+index f783493..0ab21ef 100644
+--- a/tests/jq.test
++++ b/tests/jq.test
+@@ -1724,3 +1724,15 @@ false
+ try 0[implode] catch .
+ []
+ "Cannot index number with string \"\""
++
++# NaN with payload is not parsed
++.[] | try (fromjson | isnan) catch .
++["NaN","-NaN","NaN1","NaN10","NaN100","NaN1000","NaN10000","NaN100000"]
++true
++true
++"Invalid numeric literal at EOF at line 1, column 4 (while parsing 'NaN1')"
++"Invalid numeric literal at EOF at line 1, column 5 (while parsing 'NaN10')"
++"Invalid numeric literal at EOF at line 1, column 6 (while parsing 'NaN100')"
++"Invalid numeric literal at EOF at line 1, column 7 (while parsing 'NaN1000')"
++"Invalid numeric literal at EOF at line 1, column 8 (while parsing 'NaN10000')"
++"Invalid numeric literal at EOF at line 1, column 9 (while parsing 'NaN100000')"
+-- 
+2.49.0
+
diff --git a/meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch b/meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch
new file mode 100644
index 0000000000..909a4963c9
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/CVE-2025-48060.patch
@@ -0,0 +1,46 @@
+From 9e23fd7e88bb2d76ddf3fbfc805199f848cd1b92 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Sat, 31 May 2025 11:46:40 +0900
+Subject: [PATCH 2/2] Fix heap buffer overflow when formatting an empty string
+
+The `jv_string_empty` did not properly null-terminate the string data,
+which could lead to a heap buffer overflow. The test case of
+GHSA-p7rr-28xf-3m5w (`0[""*0]`) was fixed by the commit dc849e9bb74a,
+but another case (`0[[]|implode]`) was still vulnerable. This commit
+ensures string data is properly null-terminated, and fixes CVE-2025-48060.
+
+CVE: CVE-2025-48060
+Upstream-Status: Backport [https://github.com/jqlang/jq/commit/c6e041699d8cd31b97375a2596217aff2cfca85b]
+Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
+---
+ src/jv.c      | 1 +
+ tests/jq.test | 4 ++++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/src/jv.c b/src/jv.c
+index 33ccee9..4d7bba1 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -1131,6 +1131,7 @@ static jv jvp_string_empty_new(uint32_t length) {
+   jvp_string* s = jvp_string_alloc(length);
+   s->length_hashed = 0;
+   memset(s->data, 0, length);
++  s->data[length] = 0;
+   jv r = {JVP_FLAGS_STRING, 0, 0, 0, {&s->refcnt}};
+   return r;
+ }
+diff --git a/tests/jq.test b/tests/jq.test
+index c6c6ee5..f783493 100644
+--- a/tests/jq.test
++++ b/tests/jq.test
+@@ -1720,3 +1720,7 @@ false
+ . |= try . catch .
+ 1
+ 1
++
++try 0[implode] catch .
++[]
++"Cannot index number with string \"\""
+-- 
+2.49.0
+
diff --git a/meta-oe/recipes-devtools/jq/jq_git.bb b/meta-oe/recipes-devtools/jq/jq_git.bb
index 8b0218c83e..d36723cff4 100644
--- a/meta-oe/recipes-devtools/jq/jq_git.bb
+++ b/meta-oe/recipes-devtools/jq/jq_git.bb
@@ -9,7 +9,13 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2814b59e00e7918c864fa3b6bbe049b4"
 
 PV = "1.6+git${SRCPV}"
-SRC_URI = "git://github.com/stedolan/jq;protocol=https;branch=master"
+SRC_URI = " \
+    git://github.com/stedolan/jq;protocol=https;branch=master \
+    file://CVE-2024-23337.patch \
+    file://CVE-2025-48060.patch \
+    file://CVE-2024-53427-01.patch \
+    file://CVE-2024-53427-02.patch \
+    "
 SRCREV = "a9f97e9e61a910a374a5d768244e8ad63f407d3e"
 S = "${WORKDIR}/git"
 
-- 
2.49.0


