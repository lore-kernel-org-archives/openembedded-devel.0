Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3C1C36010
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 04:05:13 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.42])
 by mx.groups.io with SMTP id smtpd.web11.4994.1743221102293482687
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Mar 2025 21:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Usb3B39v;
 spf=pass (domain: axis.com, ip: 52.101.72.42, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SKEfTQ9Jfl8FMo3yMMKz5iAn8a3eP6IH7MyUXINbXUYLSHPuby8vc4RB+LZXoXSq8FnAnYU+oHM2iC/jo27diWy+ABxatodLMiFPlIyex+6P7oeWmWfIi9D4+52DfEdvQyNLFHupmBQXZ18e3OuYnSmQHVT0sd9JeuZx/YhkpfaVj7HsdvBR4Le8hDRFL0nQfehTPIpMz1SmHpPFSmm/KN7HOCl8VLtrxZW6MhYDTni3O78GuUAAq/Rp4jomiI/+Zmwd9JEFaL3BNqHhHqf/rsMTfu8VrDHc1pJ66SEcIV1KIRB3qC0xO13MH1P/Ylrhybp1mMslC+8DhjP3W9pAnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWemxParj6lEr7AggLpKuugMDbwE5FGMgVh5H01q2po=;
 b=BJSFe4IcC9YISdruMWN9guw+pKXirlEFzVHnVWSvhhfgdtdkS9/MNT/Zj+EnjOqCTaAMoc3POK05mKgjjSBRjqOW3j0k8NJcpa+ypXY680qLNiGkB59MoaM0Xuw/igcadHHofV/waLOFdMVSNaP83XtytNbRwbr8Git62WYlFFUSQPPSrGWWTgKJFdYC4E+FojLcgJKN2iYBd7gfAwzc0FWID81+CAS5IB4LcLbdk0VvjBwkNIEzIo+wS3V0kIGIJyvvs9g/d6TUuQs/Sf9f1J0P4aFt89Jkdi0BcR7b6pLGY7Md7eZFytVfK9ITJSZbnGPyceoihmAIvs6dxUeuyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWemxParj6lEr7AggLpKuugMDbwE5FGMgVh5H01q2po=;
 b=Usb3B39vHKAJBEMu1CntV/qrpJGD32jqj2nhkTI29OlkZrGkZFqWsrRyOUSL7DYQcxe7SIngONdgRA8c1t45BTvX/RHQNVEKanJ6POIltrnw4t9E6L7qtgrKrtDpXlvTH6NmpxqYiLIwyNzxxnA3LHJS1e3InJCv8rD3LAUo8qg=
Received: from AM0PR10CA0122.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::39)
 by AS8PR02MB9601.eurprd02.prod.outlook.com (2603:10a6:20b:5a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.51; Sat, 29 Mar
 2025 04:04:57 +0000
Received: from AMS0EPF0000019C.eurprd05.prod.outlook.com
 (2603:10a6:208:e6:cafe::40) by AM0PR10CA0122.outlook.office365.com
 (2603:10a6:208:e6::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.46 via Frontend Transport; Sat,
 29 Mar 2025 04:04:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF0000019C.mail.protection.outlook.com (10.167.16.248) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Sat, 29 Mar 2025 04:04:55 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Sat, 29 Mar
 2025 05:04:55 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Sat, 29 Mar 2025 05:04:55 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 1D187CE
	for <openembedded-devel@lists.openembedded.org>; Sat, 29 Mar 2025 05:04:55 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 52T44t0F2340620
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 29 Mar 2025 05:04:55 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 52T44tZf2340619
	for openembedded-devel@lists.openembedded.org; Sat, 29 Mar 2025 05:04:55 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] opencl-clhpp: Update to 2024.05.08
Date: Sat, 29 Mar 2025 05:04:45 +0100
Message-ID: <20250329040445.2340565-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250329040445.2340565-1-pkj@axis.com>
References: <20250329040445.2340565-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019C:EE_|AS8PR02MB9601:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec3f0f5-be74-4989-e76b-08dd6e76dd59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?M1/u9op170IZ/mRHBvJQeuFM5WXUuti94WH/Tj8KOSGWRnuSiyiaXs6E4xIQ?=
 =?us-ascii?Q?DC4IxFnv0YdUYDjXSk5+OtOBO0LGWurNOD1c02xeLJ+9BPn/pfqCm0Wz6JpS?=
 =?us-ascii?Q?toZ5xZ5VRNnmh6CeohjCRVZ+I2zCHrW8DOEL/1FBqORSRZsN1jdaT+cRDOLZ?=
 =?us-ascii?Q?OXwaDjrd0y1SzErJhPUDiB63NOcBp2/tHWfWtyGJyKtUzeELwbsvmNTy8WsO?=
 =?us-ascii?Q?xhWtT4kvaBzToGeCw+JU2oyGbFvKyqhQycoyT+inu2so2i/NBcWo4Svs7TN0?=
 =?us-ascii?Q?DwVDQMYM2xoeusMQcEm/WZMnvwklqIzmOtxInW6+HlMJ4b7WUjnCCTKFZEwe?=
 =?us-ascii?Q?HlSsEDAE0ZNYFJaa35d+okFDAvzf6DF84Y0ECdVwP6rLGK3TbzBHwZBMkPVu?=
 =?us-ascii?Q?KDyWd5D0dPOjbo0Or1/1MH6jrGQa9XNz1kZXNgDMRY1R0FN2dBThQVnhztEc?=
 =?us-ascii?Q?TrdX+YkJNCcH63AM4nSR4WUFF1Y0YpVlLcaTN1Z6BF9NP7izRLrm2cM3SocR?=
 =?us-ascii?Q?4mvR5ehOfv7agTTuHRS/zAKUN2vbyX8Y1LtTIkk9Ea3RMneem5by/TUe0WcU?=
 =?us-ascii?Q?0yKysBZqjrsD+5tGsljwZWnLvIU04ZZjQnTVOG27f3MqMlCsPDb9S/hR+ay+?=
 =?us-ascii?Q?ihuAWbDGlz7fPlf6DDPDXWC/n5Kgt7Wt7wG0AR1TVAUPWYLUTqqlMgzU/jM4?=
 =?us-ascii?Q?/lkD4CQDGlEErZ2xUCwQW5DItVzB9qvqOykt+yzwi5RbMPl7mHSJnpn9Kvjo?=
 =?us-ascii?Q?jXU8kdNRDKvzR5TRRKJ8A9VV5CAy3/c2zMFYVKdm2Z0pJpo0qBYg+rfG5eP+?=
 =?us-ascii?Q?p0whyQMWf9MU/HmWIe8aXc0s25NRgJluPkj9XsgnVF+ieGif333pZAMtMvaR?=
 =?us-ascii?Q?Np93b9gXFbCuyKHpl3JyFJzWZ/LLioBThLZY9sLKmqrS1hXGcS3/VxxI2sBA?=
 =?us-ascii?Q?IOoc2+WPjqmVO7SFCIJ9xIRogU5hSTLVuspYRz4rKZIgcaRDtYxNAwFOUcsU?=
 =?us-ascii?Q?SUD4DhZt+sqeAfgkQnVimegng8pJC/QZuqh0MsOcADWgpGlg8gywQKTcU6lh?=
 =?us-ascii?Q?bIRu5xsluJDi1M7j/lgAAFmkC6e8OV3MHt1Zv59Rn8+zvOkPW8ib/RosfuXe?=
 =?us-ascii?Q?Uldgz8DH9PKl2zKvAKXTPjvNLZ8VnJ2i5mZZwN5f7srb4GfHXpQjQTplSJs8?=
 =?us-ascii?Q?V3Op7HXYt8lOUy0hdPCXsPYKwePyzDmyQtMO3aQJTcoorlbCYc/F/2HsL76E?=
 =?us-ascii?Q?/9NwYelWdXUQbwGFZwhItC9gN7cfDRU+k00SPoKaSe3z8CaydswlJWZhCsj7?=
 =?us-ascii?Q?L0a0LRHkcRlnHceBG0oG4MQv3xrLGqI8JmUFKKE+nq9VTy6mA76Xr2t2Klk2?=
 =?us-ascii?Q?hq9vJMCkz1rFsoAMp4XG+4aCLpVlE2KtGb8NVaDhyPTCfrz5rkVe0UrulufU?=
 =?us-ascii?Q?ZY5wnFRpQOdkeKJW4Ji7t/rRuPIu6bcIs/hD5BAuG8v4PsMmFnK31tf2QjvV?=
 =?us-ascii?Q?AzK3CJHFEl0VgiY=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2025 04:04:55.4862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec3f0f5-be74-4989-e76b-08dd6e76dd59
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9601
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Mar 2025 04:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116365

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...opencl-clhpp_git.bb =3D> opencl-clhpp_2024.05.08.bb} | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-core/opencl/{opencl-clhpp_git.bb =3D> opencl-clhpp_=
2024.05.08.bb} (81%)

diff --git a/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb b/meta-oe/reci=
pes-core/opencl/opencl-clhpp_2024.05.08.bb
similarity index 81%
rename from meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
rename to meta-oe/recipes-core/opencl/opencl-clhpp_2024.05.08.bb
index 23007d7cca..25e7fd633f 100644
--- a/meta-oe/recipes-core/opencl/opencl-clhpp_git.bb
+++ b/meta-oe/recipes-core/opencl/opencl-clhpp_2024.05.08.bb
@@ -1,13 +1,14 @@
 SUMMARY  =3D "OpenCL API C++ bindings"
 DESCRIPTION =3D "OpenCL API C++ bindings from Khronos"
=20
-SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=3Dhtt=
ps;branch=3Dmain"
-
 LICENSE  =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc3c=
6bd57"
=20
-PV =3D "2.0.16+git"
-SRCREV =3D "1df82b9749739f2681081092ae163bb0f0d40f66"
+DEPENDS =3D "opencl-headers"
+
+SRCREV =3D "0bdbbfe5ecda42cff50c96cc5e33527f42fcbd45"
+
+SRC_URI =3D "git://github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=3Dhtt=
ps;branch=3Dmain"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -16,7 +17,7 @@ inherit cmake
 EXTRA_OECMAKE =3D " \
                   -DBUILD_DOCS=3DOFF \
                   -DBUILD_EXAMPLES=3DOFF \
-                  -DBUILD_TESTS=3DOFF \
+                  -DBUILD_TESTING=3DOFF \
                   "
=20
 # Headers only so PN is empty

