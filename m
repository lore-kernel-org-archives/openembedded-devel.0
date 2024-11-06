Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B530AD59F42
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 15:46:27 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.58])
 by mx.groups.io with SMTP id smtpd.web10.48965.1730907977988348345
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Nov 2024 07:46:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arri.de header.s=selector1 header.b=B2VeP0PO;
 spf=pass (domain: arri.de, ip: 40.107.241.58, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtSOUA30uDdIOo5FGnMoUYbiq4AX9+VYZRAJ7joy8kBjAJLjT6F9tzYGcd6icygTG2g4vhBbHq6NS+tiiIOPvBLXflpbuLIkc8JJsDELnzW5t0sLM9ALZzqM+FBiCkzBgvAWyol/0/L7uvcTUxwmlQobmfI/Z3Cr8su7WkehevOJX5dJfWDAtQQenRsW14BnejLeRBB7qWdrWc+pK7HxfMdm2MJvSYPW2InJHgzszP+gFmoYqFxnJRl6k++dREzb+vg9Vqg9TIX4KcC1m85P+eDHVHf3UQ72VI6SFhHoz0vxy5Nfm/Wx5X4P05VV/6u1r1vygP3Uyhn7ZwGZ1ifItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q51Ij+Vw6DQvEHiFnFTXdt7J/aakv2De+h0ePjQzoZQ=;
 b=AB1DbVTMSwCWGZ74R73fIPurw2eIYBzYKppt6LNfTLE8DDw4TeNjZLVtzRfGJaHBXDw/B8FtCy+hYE4uDzZ3tesLaAle8HYSNV8DGRlOrnzljNjkJFAoSn79KLsFqjiigPCHiXatFx0ZJO+R0cTlcWGf4KzHR5flF87BKikYGawJ7qeuctwYMCg3JwpN7oHTUjDrqwkVRo++HONRZe0CeicmVD6VB8wJSm5/c3ZsQnBNx0IrtUUXNlJNXFCUSNN2fyQpmMn9UvNda9GN1tNBclezitb+XL3TQZKa23QnrKjDz3ZQC+QB9SizPJflQhNc84PBZHiM9ghsX3AI/slsKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arri.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q51Ij+Vw6DQvEHiFnFTXdt7J/aakv2De+h0ePjQzoZQ=;
 b=B2VeP0PO3ha7XCnvWJkBcDarEBn9gJtMlz8Fi89Fglm96TwYZ3aVS8hSaPI1u75+VMu8x1UBKeR0gdP+AHlQdxtoQ+0Ve0p2bfw270e5SOyIFv/MU3IMVgeWZyUupl1Pxk45ilYWBwuobN2cJSfi9sqIor+d/245Y9O9bW3qiM4=
Received: from AM0PR02CA0102.eurprd02.prod.outlook.com (2603:10a6:208:154::43)
 by GVXPR07MB9702.eurprd07.prod.outlook.com (2603:10a6:150:110::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 15:46:03 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:208:154:cafe::42) by AM0PR02CA0102.outlook.office365.com
 (2603:10a6:208:154::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Wed, 6 Nov 2024 15:46:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 15:46:02 +0000
Received: from N9W6SW14.arri.de (10.30.4.236) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Wed, 6 Nov
 2024 16:46:02 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-oe][PATCH] protobuf: conditionally depend on ${PN}-compiler
Date: Wed, 6 Nov 2024 16:45:34 +0100
Message-ID: <20241106154534.7025-1-ceggers@arri.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.30.4.236]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AF:EE_|GVXPR07MB9702:EE_
X-MS-Office365-Filtering-Correlation-Id: d197bd59-8eeb-49ce-6aa8-08dcfe7a1e51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yPHoMPIuhgv3eCgOjqfoy1IcTlejIDfx8ZL6M7LttyHg7KuIEgTt1/e/k/bi?=
 =?us-ascii?Q?gXUmDbmV6foEUHLTA+1/7o5D3/VzrWrSP4EHWO/sg05DQF15FxgEVEDBBQLn?=
 =?us-ascii?Q?Abqhi3cYs0qkSLbRoUqFexsxUT/opMc0yMz/gWCn6niV7XEHyymsLGZ+O4hU?=
 =?us-ascii?Q?rW4/f+eN619REEfiYVnqp5mjLQSa8E4ANom0Bv0lSIvMBsKFLWpS+2CYPR5g?=
 =?us-ascii?Q?rf3jP5/ne+M1Mbg73aGIrNMCwN6e1MfcCfSJa1P0zcZmO1RXM71X/XTYlL3U?=
 =?us-ascii?Q?PWgLMtbEysi7YR+awgflgceMNTY7v35IifwxsNgJPMFMikH0aBCtv++Cyt7q?=
 =?us-ascii?Q?0sVme8+1v/Ywem9KazSLL6YPIbJt28P5G+6GoGSJbXklG6aPXzrFY5aFDAtT?=
 =?us-ascii?Q?9DsYnDJsFPeiKxpu/aUNPXm5IoACvJYvdh4Mejyy4MRQmXwJyPUcZhbqrP70?=
 =?us-ascii?Q?cJTUhrrOqedF0t5//0y4PNjyWw7D8Gsu/7uppwW1TKDjCbnlQcW++UYLXKPZ?=
 =?us-ascii?Q?Ve1yXOhoVLGkh0dyrQYqrxLFrai+KHpjgvzdHz+kRjfM+8nH68+i+hRtYRjG?=
 =?us-ascii?Q?Xsc0T/BWzLlaYKYwfwp8sm6FwTaZxEUVPVdMU9jZl68hdDXg6rzy7w6BPe27?=
 =?us-ascii?Q?vd36D9wjS2aY1BDEkuoMMc8dwbS42QmeSw+zByrzfrzt1J6PeZUq5G4GPm3k?=
 =?us-ascii?Q?8hMkfLuwBpmpRZuQzEJ6Xr2NwU7rny3zkuXDkWGM1wxlcmFdb5O1X5tCuG4T?=
 =?us-ascii?Q?wCkJs7EPoAwqTLx7BjLZWDfRA2xnJ9whcOQ6m/ELbTspnV/X3W8N6OuJXkkf?=
 =?us-ascii?Q?bO5egsMCgw9ZJVV2keHjQtqA3tysBjhNurYT8WX3l4EheAJuAlODf0BvGWmm?=
 =?us-ascii?Q?Fr/SVGUYenxg/LVbmYOpLeVG30p8O3HzsudaucrPtO015S+42aUmXCuUC+Q1?=
 =?us-ascii?Q?GiFUooL1rV4GRLNZ1zCImzW0x4Rh6diUjtcpOVB+qBkYRS2qHWX7OJBVZxSG?=
 =?us-ascii?Q?PIs/VIL/+YYe3p1TQEQOWIzEqxZQhdKrW7IN17WnHGlRv1PEXGxfNTuUSC7x?=
 =?us-ascii?Q?l7ZRSex4huc5gcslyWf3uKZdgMfnlHWyY+j1fah2KtUuKHeVXZgfs3XlyzjA?=
 =?us-ascii?Q?iv2yABERAaaIOqF89ippq4eoLClppGvFdBjVkMY8g5dTU4jdL3Wt35OS1Ch+?=
 =?us-ascii?Q?ieK0AVdi2npKp/9pozckHwFLCpVpaRqXMGaf/dqgYcfxvnV1LTwSAe6p+FZA?=
 =?us-ascii?Q?41QekEHM5taLgT3A/ocxtSb9LyBi5GDHwz1VmVtBm36rJq4WcM8wrEGkezzf?=
 =?us-ascii?Q?eg/09uXyshBFoBpu4WKOQRd9xqXXYXCmYfN41gxXIm2+kN8sztJBU3W4V2/e?=
 =?us-ascii?Q?i3xl+D91fZnM6HKzI57VO+kjM6eO7pHGTtrYHxpeBDXhS8qoMw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 15:46:02.7416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d197bd59-8eeb-49ce-6aa8-08dcfe7a1e51
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR07MB9702
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 15:46:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113741

If ${PN}-compiler is not build due to PACKAGECONFIG, we shouldn't depend
on it.  Otherwise installation on -dev package fails during
populate_sdk.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb b/meta-oe=
/recipes-devtools/protobuf/protobuf_4.25.5.bb
index d5fd90137071..89e1071b59dc 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
@@ -109,7 +109,7 @@ SYSROOT_DIRS +=3D "${bindir}"
 RDEPENDS:${PN} =3D "abseil-cpp"
 RDEPENDS:${PN}-lite =3D "abseil-cpp"
 RDEPENDS:${PN}-compiler =3D "${PN}"
-RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
+RDEPENDS:${PN}-dev +=3D "${@bb.utils.contains('PACKAGECONFIG', 'compiler',=
 '${PN}-compiler', '', d)}"
 RDEPENDS:${PN}-ptest =3D "bash ${@bb.utils.contains('PACKAGECONFIG', 'pyth=
on', 'python3-protobuf', '', d)}"
=20
 MIPS_INSTRUCTION_SET =3D "mips"
--=20
2.43.0


