Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A7BC3DA4B
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 12:18:08 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.70])
 by mx.groups.io with SMTP id smtpd.web10.36640.1721045880400478918
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 05:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arri.de header.s=selector1 header.b=Dxyq4ar5;
 spf=pass (domain: arri.de, ip: 40.107.249.70, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWAqIZomCfcJ8i1UF6PPDeHJaIYXEqTXNK7WCMU7ofo8YaSPXPr3wqTqLfmNPwPFBXAeMmsHeZ4T3dQNQbqL0rzNlLZJ+f/zlEM8a0y2tKR8CGytFfbJPD/lnsL80KD3lMceUoBTke5qGnmSiQJxExTsDoN4RvBfvDPAn88W4YOMe8h1OzJuDEXZyKtYvQJ16BOW6NiWo9fr38FQJ628ZSfjme8+5B6TqfrSxRSd8cHSiSbm39Kv3LPMjdNEas8TMKfl6bnQdi+1iNb+/dC1854e2rqQ6/hxl/E6PgZbK7dTx0QPRafF5SzRJvetdZcCOObqEBZirYkH8mdwfMS5BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niOk6tvzH7XXZROeAW/kp4SnSN+fr09/vIzMfdd1lYo=;
 b=TO8f08YJ9va6IXoCFUUcjJMAaIGzZMK52m1+WveWWODwkWg/GIlwLCvvoH6Wo5pDVDVOizcwt0js7ssxcJij0w1neW7qH6AO0TfNNY9Zp/vHHpJO1vpQO7Mu4N66B05mgkX2228SfDGWkCYgb52chB0zMZxJBactCtg08cdAMhCO/a1VlCL4royjoPbgkUJH0Lj60ZatjnVR/gT15StWYibU76o+MQmmor0SjULFeNn5dYyHsT+5ZQF9E0kD19bjIXCsbE8MOFKNT9UoQF1XW6GTuR38DVBAUIMP7/HCv2kNp0n3hB3YW71/iZECbnXhCPdvqF4Iv2i+tM85T1UepQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arri.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niOk6tvzH7XXZROeAW/kp4SnSN+fr09/vIzMfdd1lYo=;
 b=Dxyq4ar51val3+BT/MZV/bpbA7dfH+swul8B5orcs+wYL2494Z0b5MZ1JWf90ts+hiJ5BMMvw40qRu0F3X3hAmBZwKvchR26LqoAF7t/QTF78GQoSG3AUD6k5qujrZhSjDKB/MmS60spK1fCO5NXysPkUoHiigCs0rGHHh4uka0=
Received: from DU2PR04CA0072.eurprd04.prod.outlook.com (2603:10a6:10:232::17)
 by DBAPR07MB6645.eurprd07.prod.outlook.com (2603:10a6:10:180::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.13; Mon, 15 Jul
 2024 12:17:56 +0000
Received: from DB3PEPF0000885C.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::32) by DU2PR04CA0072.outlook.office365.com
 (2603:10a6:10:232::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28 via Frontend
 Transport; Mon, 15 Jul 2024 12:17:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DB3PEPF0000885C.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Mon, 15 Jul 2024 12:17:56 +0000
Received: from N9W6SW14.arri.de (10.30.4.252) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Mon, 15 Jul
 2024 14:17:55 +0200
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][RFC PATCH] include-what-you-use: new recipe
Date: Mon, 15 Jul 2024 14:17:43 +0200
Message-ID: <20240715121744.18888-1-ceggers@arri.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.30.4.252]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885C:EE_|DBAPR07MB6645:EE_
X-MS-Office365-Filtering-Correlation-Id: f91c3225-2f71-407e-7d91-08dca4c828d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rlql8WkgNNOPQjVJWGtVus21ay/fW6fg5EYTuy3jmCB4jTNrRl3KZ45kgwW4?=
 =?us-ascii?Q?IXAS0gR1rwSm26Q9s32B1ABeTap83pRP0Sai/1xgTgEejf52yko7FERllLKL?=
 =?us-ascii?Q?OrZEEBknU+ZpUODjofOaonP3ycl86iJMyGSpgrEbiM10aPdLBUb6/Q1K4iLa?=
 =?us-ascii?Q?LH33TXsJgalupsPhQ7TAsrxjLOUxNkhghBMbkOkS8swbd9ElOoa04wcuB1/+?=
 =?us-ascii?Q?Byc9epcRcEzANkWqP6pFqZL3CoAWhMcB3iiC7JK/0ePM0ytyabyeC6rOEVG4?=
 =?us-ascii?Q?4DBrRZ3iq74qSgY8p1IKc1SNKAaEsxP9xbWjbzwRYYbBOWU793qLLyhpQn95?=
 =?us-ascii?Q?xSMJ5vfNigKGof6KnbwLBNQgsatDvHSOfsmbzeb2bciwfcebRWFIcLc4mgGN?=
 =?us-ascii?Q?uIrdahkWww7Pd1YyKgBzyeAxA8ltQC7Y+LRbEusfRUGoP45tRArczPH4cbwj?=
 =?us-ascii?Q?+kWG7Yhj1jUZVARDbrWekl6tFqCzAtkBPH1wIoIRJOjlYPe9cy4sRT9xaKaS?=
 =?us-ascii?Q?fMQmYd8kBMImh4SMjF6yvcPktXhR1zzHB+Bcj+uHsMAR2bKgRj4SfllQ/NIT?=
 =?us-ascii?Q?EzaBOQYdnkByPEhsbV65ODX34daxzDuHCWjGgE0/QDKnKlPmao57Ld+RkiIP?=
 =?us-ascii?Q?Qv+1npaywKhc7HQzyqqEOCX0qIog4NR2t5Oc91k+4cUDhhkwXS4nE+lL6wCU?=
 =?us-ascii?Q?gTy3hTDV+gt23KVsOc7haWZLagz9DcIFj+dA6CdGa8kz0zy/es3IK1cdnUyy?=
 =?us-ascii?Q?tLQ8z68mTgi2Foux7VLkbzw9zEMFtt8G+68wcvGT1YNGclExiAI2US42YzuV?=
 =?us-ascii?Q?WS8027ZrGwdNQMVUylGT5l2oTVfDnY6O28cg1oZbrow7JkdBSVR/WXjDfDLY?=
 =?us-ascii?Q?vKk+QO0z5EdhRLQ0imMtcuViG6QCrXRui5JYNqJc3J7JG0mg1n5qLZroVWU5?=
 =?us-ascii?Q?zECnoNeFW31L/OFnZJJjnU4WOv5zghgk/SPyWvTw3nI1cBksZz+7Kb2d158D?=
 =?us-ascii?Q?bCeJyUNATDFFpClIueaL3Lpv0Dc7rT0+4zZoD6PBbga0R3o8jEJqJjhmrsHA?=
 =?us-ascii?Q?97gOjdDqv5gNIojxkRbZzp/UKePs81o3N1/44DUc+UoSTVEkHaR3XUAIxwWO?=
 =?us-ascii?Q?FGFzwN+awgGSBMtc2lMM/aaDY4mIVfndYFfM6PBWx6Wxgc8+D2AFcdQ7ChTD?=
 =?us-ascii?Q?PUSQESRm3c1U84SmzMa49xxdW3KEliY7M6u1oJw2dPWtz67Ib1mLHToiZpbF?=
 =?us-ascii?Q?qwt1KRjDMIACPZYv4HWkGXZgo4ozLk+a4h3cgByPmuZP8r5dPsEtUCMl7QXW?=
 =?us-ascii?Q?F3/MHHx+goXMeIyQRR7vfP99O3urAxl8MailMxjAg6sL3nPfTO91vJy/r5Da?=
 =?us-ascii?Q?k73rUh+Uw2idBZgAzbwm6GqxkVPs?=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 12:17:56.4375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f91c3225-2f71-407e-7d91-08dca4c828d1
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB6645
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 12:18:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111360

Based on proposal send previously here:
https://lists.yoctoproject.org/g/yocto/topic/recipe_for/83279588

This recipe depends on meta-clang, so should it be added to that layer?

Unfortunately the 'include-what-you-use' (iwyu) tool doesn't work yet.
Although I have installed nativesdk-clang (via CLANGSDK =3D "1") and
nativesdk-include-what-you-use packages, the C++ standard headers are
not found:

include-what-you-use --sysroot=3D/opt/poky/5.0.2/sysroots/cortexa7t2hf-neon=
-vfpv4-poky-linux-musleabi impl/Fdt.cpp
impl/Fdt.cpp:9:10: fatal error: 'cerrno' file not found
    9 | #include <cerrno>
      |          ^~~~~~~~

As iwyu uses Clang and I have no experience working with it, this is
probably only a beginner mistake. Can Clang use the C++ headers provided
by libstdc++, or do I need to install further packages?

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 .../include-what-you-use_git.bb               | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/include-what-you-use/include-w=
hat-you-use_git.bb

diff --git a/meta-oe/recipes-devtools/include-what-you-use/include-what-you=
-use_git.bb b/meta-oe/recipes-devtools/include-what-you-use/include-what-yo=
u-use_git.bb
new file mode 100644
index 000000000000..e7df6a834a34
--- /dev/null
+++ b/meta-oe/recipes-devtools/include-what-you-use/include-what-you-use_gi=
t.bb
@@ -0,0 +1,22 @@
+LICENSE =3D "NCSA"
+LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D59d01ad98720f3c50d6a8a0ef31=
08c88 \
+                    file://iwyu-check-license-header.py;md5=3D7bdb74983116=
3fbe9232b3cb7186116f"
+
+SRC_URI =3D "git://github.com/include-what-you-use/include-what-you-use.gi=
t;protocol=3Dhttps;branch=3Dclang_18"
+
+PV =3D "0.22+git${SRCPV}"
+SRCREV =3D "377eaef70cdda47368939f4d9beabfabe3f628f0"
+
+S =3D "${WORKDIR}/git"
+
+DEPENDS =3D "clang"
+
+inherit cmake python3native
+
+EXTRA_OECMAKE:append:class-nativesdk =3D " \
+	-DCMAKE_SKIP_RPATH:BOOL=3DON \
+	"
+
+FILES:${PN} +=3D "${datadir}/${BPN}"
+
+BBCLASSEXTEND =3D "nativesdk"
--=20
2.44.1


