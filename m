Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79451ECE585
	for <webhook@archiver.kernel.org>; Mon,  9 Sep 2024 18:24:26 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.37])
 by mx.groups.io with SMTP id smtpd.web11.3320.1725906257669248780
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Sep 2024 11:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=FhOV8VfO;
 spf=pass (domain: axis.com, ip: 52.101.65.37, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVtxi4o3EvUDvcaG86yliungXz/6KfaZrmlW0qls26TAEFFqC5RJD+TyzrDvRlhj8hLHf55V/xI3cDPS/fYNbWRA024kKVitl9Rw9n9OQeETJft/sOj+dmQtUvn6iBCu/MKdocT5veL5H9KGNEfo+BBRvN3rNRhdoV4QN3nTrjEbCOPR0TKg9USzabKDgI4gOHMKezgqX4kkYiH23fM0xurbNLdr7DqkNsU0rKcZnwmq0krSreCxGcfeiqot4J775B3purrZklRxHnTSn5xso7gfVEvfK9dxvhHsxqgLMOBiCYOxSI6pBBEKUnJMI4cbN2kOTLDxFKecjpJQCZ+A/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7u2JXiVWb0NnL7enpiqT2jTq7iBrOolr6QAlw9hC9Q=;
 b=qFaMggr5wTkOffpCJRRI9ZOLM8IMeKTG0tFg5tLyc0JvmTT70sj5bM259HlqeuoHYThwB4MIGl6PwFSHSaRyOWHpC9DIaJSDWG3rRHeg/je0u4JbzNsO6mR7wmz5h8+pLtvpSw2lfiZDewBBelvuTq3e2l/PlrCvWvRSscgMxAJ198emBfdzjXLa7AdykvS1i7ACw0V7/K1wxFs13ubmgFgWRYH5MoKbEypsDOD6mZiOj6+gJJBHjA3lEuLHtcRZ4/kYQ/383bYcO/dZmkJz0EqpXAcMfSA9+UJIibEe2fSMQvwDZiDXbp+uayYQCmMd0XcOQGdHZxzYNgbnpPUnkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7u2JXiVWb0NnL7enpiqT2jTq7iBrOolr6QAlw9hC9Q=;
 b=FhOV8VfO4w7psWs4VULVVcLCJaODXP6KMXRdjTjUkIUE5F5EWwqzBFv0iybzgtzQLUD/jwrenj0KzjSzg1VWawfAUj+xBCRvDd81/V3sHXTPcyJ/oDxPMt2pKf5JnmwEF0RvkIiqUPPBkxtt1WihtzeXorgqUFTi+4/LjDLjHeY=
Received: from DB9PR02CA0024.eurprd02.prod.outlook.com (2603:10a6:10:1d9::29)
 by AS4PR02MB8696.eurprd02.prod.outlook.com (2603:10a6:20b:58f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Mon, 9 Sep
 2024 18:24:11 +0000
Received: from DU2PEPF00028D13.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::f3) by DB9PR02CA0024.outlook.office365.com
 (2603:10a6:10:1d9::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23 via Frontend
 Transport; Mon, 9 Sep 2024 18:24:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D13.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 9 Sep 2024 18:24:10 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Sep
 2024 20:24:09 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Sep
 2024 20:24:09 +0200
Received: from se-intmail02x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 9 Sep 2024 20:24:09 +0200
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 64041AA
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Sep 2024 20:24:09 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 489IO9g73477537
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Sep 2024 20:24:09 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 489IO8GS3477536
	for openembedded-devel@lists.openembedded.org; Mon, 9 Sep 2024 20:24:08 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] poppler: Correct the configuration options
Date: Mon, 9 Sep 2024 20:24:04 +0200
Message-ID: <20240909182404.3477504-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D13:EE_|AS4PR02MB8696:EE_
X-MS-Office365-Filtering-Correlation-Id: e9c6ec79-8503-41f6-45d9-08dcd0fc9940
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Kv0ferUihuILHniQnb6jvS3KwtkGFapAEahJtFzaN0y4B/p3/eYB5oosV1c+?=
 =?us-ascii?Q?+iAwBaM8e4/NWAFYy7bS8jZh+r6pXxLVnbMKGXgQJGV1evt3+JsEl03FgJGZ?=
 =?us-ascii?Q?deyc/JrH+DRj1r7GWsAO3yexbZIz+2cTcPHUaQYxg+bUD19Ob2ACWMW4IoNA?=
 =?us-ascii?Q?qk0fANXXV8hS1mixL8+KzezeOy78iFtm+ICsP/Kc3vZQghT0SQBr7/1GC58s?=
 =?us-ascii?Q?rcrHVgo+Rp5vxTJh3lkfPzsU41D7710ER8oLXLGASgolzkl6U0AyU6YjYOEW?=
 =?us-ascii?Q?NJT9BDyMGD227UsRRTeQBhittl/+z5QfBr2lW1qHz3Y/CEZYVCcRDw3cfoWe?=
 =?us-ascii?Q?fKh/PAbS0mirmIkqcWAhXAx+fjfSxJw2CEf99R0DwYTI1zg6HlzB/gRDlUXu?=
 =?us-ascii?Q?Z+qiqFm4pI/DW9TWVrr6sOqBa4+pikXlhCw+dTQOEL7yajZXyxIJDxhpfmVA?=
 =?us-ascii?Q?3WA4q/AW5vMdffEXWEBxbj4PT6dzme1emop9/HoEF6sbrT/JYtVUzYVFnJ5O?=
 =?us-ascii?Q?F5TW9vkPI6mKHnWy8sYtYXuHtMXusbgABJtjLox5oI4VJC7XeZ5OVAvaFdx6?=
 =?us-ascii?Q?BEctYYm9XkRwDw39/4N8T1BwtDS6YAI1NwC/pGxEm1qFAFjLvhaoFlh3JOqw?=
 =?us-ascii?Q?Bb85gxq2zOu3VUBdwnD+EGczTvVcPRg216EBMejekhjzzrTwUBQogTP9ng48?=
 =?us-ascii?Q?gCx9w5zoSekRlme6vCnTD3bVUJcrl4QXtoMpaE0BnquCddHCHormLdTyMGRh?=
 =?us-ascii?Q?RTW/gh/Tj7mAVj5ee+Y8pEnYy84zhsSUIsRoCX6WYB+VqGpTobKwkzO9o8yq?=
 =?us-ascii?Q?GPzdKpyucqnd8PYdT76c8va9HJXl349hb2GCUgDvNqUZI4IsUYW5/8xAlDQn?=
 =?us-ascii?Q?Z+IV07z1AfKCLR8TRF10CH1yxEMomewepD8sq/sA8J+2AgXSEXNQ+wkhRo6K?=
 =?us-ascii?Q?tD9UrZGUkUFwSDIlfMsVetXK5DUU01kGbgrWVLTyEkXvUWM33JX6I/bpnn4K?=
 =?us-ascii?Q?NQVLnhygA85wMW90J132/kGKg9Fpulg9httNure6fxVe8ibIbZno+bDJLJpl?=
 =?us-ascii?Q?ZliQeWYC9XfKRzkddyKaCaCVGFgJaZjBuSLxnYiNFjYgoT+1e/NK4tQm6zZ7?=
 =?us-ascii?Q?XR9NdTrzY0d49Hdw49EujnyVpJZPmRR/1Ll9d5WBHR7Ukk1/gzXL19UxewML?=
 =?us-ascii?Q?31kaw98K092gY4n1XBsu0O0qKWWWPldpsegdbHYsFvUYKAxRmRC1BG6teGZm?=
 =?us-ascii?Q?IYQQkXPNetylk/LRvmGHmDwZS7qogRDmdT68ZKDhyyKLg2H/VJ1uX7q0K5jq?=
 =?us-ascii?Q?3vvYNq0KGrutMzaPNRVxLkkbS9OoUKnZ5YuJMVIzwCMsKJl5dg1AryphWlxv?=
 =?us-ascii?Q?OYgBFfwbKDlaDtgopzXMMI98jI7T8EF6ETawzEr/bEQau72PE7+7x+dcMSwl?=
 =?us-ascii?Q?Ve1OsCHO/ZHgV9wYLZJCGaiDcM8R8Em2?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 18:24:10.0448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c6ec79-8503-41f6-45d9-08dcd0fc9940
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8696
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Sep 2024 18:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112183

* Remove -DENABLE_ZLIB=3DON (it is no longer optional).
* Replace -DENABLE_CMS=3Dlcms2 with -DENABLE_LCMS=3DON.
* Replace the splash PACKAGECONFIG with boost (splash is no longer
  optional).
* Correct the options for the nss and tiff PACKAGECONFIGs.

This avoids the following CMake warnings:

  Manually-specified variables were not used by the project:

    ENABLE_CMS
    ENABLE_SPLASH
    ENABLE_ZLIB
    WITH_NSS3
    WITH_TIFF

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/poppler/poppler_24.09.0.bb | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/poppler/poppler_24.09.0.bb b/meta-oe/r=
ecipes-support/poppler/poppler_24.09.0.bb
index 920d13f0f6..fb6b534cf4 100644
--- a/meta-oe/recipes-support/poppler/poppler_24.09.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_24.09.0.bb
@@ -14,15 +14,15 @@ DEPENDS =3D "fontconfig zlib cairo lcms glib-2.0 glib-2=
.0-native"
=20
 inherit cmake pkgconfig gobject-introspection
=20
-PACKAGECONFIG ??=3D "jpeg openjpeg png tiff nss splash"
+PACKAGECONFIG ??=3D "boost jpeg nss openjpeg png tiff"
+PACKAGECONFIG[boost] =3D "-DENABLE_BOOST=3DON,-DENABLE_BOOST=3DOFF,boost"
 PACKAGECONFIG[jpeg] =3D "-DWITH_JPEG=3DON -DENABLE_DCTDECODER=3Dlibjpeg,-D=
WITH_JPEG=3DOFF -DENABLE_DCTDECODER=3Dnone,jpeg"
 PACKAGECONFIG[png] =3D "-DWITH_PNG=3DON,-DWITH_PNG=3DOFF,libpng"
-PACKAGECONFIG[tiff] =3D "-DWITH_TIFF=3DON,-DWITH_TIFF=3DOFF,tiff"
+PACKAGECONFIG[tiff] =3D "-DENABLE_LIBTIFF=3DON,-DENABLE_LIBTIFF=3DOFF,tiff=
"
 PACKAGECONFIG[curl] =3D "-DENABLE_LIBCURL=3DON,-DENABLE_LIBCURL=3DOFF,curl=
"
 PACKAGECONFIG[openjpeg] =3D "-DENABLE_LIBOPENJPEG=3Dopenjpeg2,-DENABLE_LIB=
OPENJPEG=3Dnone,openjpeg"
 PACKAGECONFIG[qt5] =3D "-DENABLE_QT5=3DON,-DENABLE_QT5=3DOFF,qtbase qttool=
s-native"
-PACKAGECONFIG[nss] =3D "-DWITH_NSS3=3DON,-DWITH_NSS3=3DOFF,nss"
-PACKAGECONFIG[splash] =3D "-DENABLE_SPLASH=3DON -DENABLE_BOOST=3DON,-DENAB=
LE_SPLASH=3DOFF -DENABLE_BOOST=3DOFF,boost"
+PACKAGECONFIG[nss] =3D "-DENABLE_NSS3=3DON,-DENABLE_NSS3=3DOFF,nss"
 PACKAGECONFIG[gpgme] =3D "-DENABLE_GPGME=3DON,-DENABLE_GPGME=3DOFF,gpgme"
 PACKAGECONFIG[qt6] =3D "-DENABLE_QT6=3DON,-DENABLE_QT6=3DOFF,qtbase"
=20
@@ -32,10 +32,9 @@ inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cm=
ake_qt5', '', d)}
 SECURITY_CFLAGS =3D "${SECURITY_NO_PIE_CFLAGS}"
=20
 EXTRA_OECMAKE +=3D " \
-    -DENABLE_CMS=3Dlcms2 \
+    -DENABLE_LCMS=3DON \
     -DENABLE_UNSTABLE_API_ABI_HEADERS=3DON \
     -DBUILD_GTK_TESTS=3DOFF \
-    -DENABLE_ZLIB=3DON \
     -DRUN_GPERF_IF_PRESENT=3DOFF \
     -DCMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES:PATH=3D'${STAGING_INCDIR}' \
     ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_GOBJECT_INTR=
OSPECTION=3DON', '-DENABLE_GOBJECT_INTROSPECTION=3DOFF', d)} \

