Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A683C5321D
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 15:34:55 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.137])
 by mx.groups.io with SMTP id smtpd.web10.22922.1724254486631365030
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Aug 2024 08:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=PH7qrNXX;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.137, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kS827mwNbec+7v8WkS3dw+HbIulLXEkhFFlNTR5jO5iJLLkc9DtHBwH7akL3JIZERxCgZMN9ucDXEmYihB+JK9+/fAiekX+VsLRZV9zm2JaJXcwHwf3iX5hl/cUGReO60tEfwIJ+B2trOCUy+PUC9Q4cW505C3cy0nR2t3ordRAbBJl4Q+vuV6vNWw75GMDkHUdFDstl8vdYZgoNbRRZ2u4YOqiJKkyDozG9DiFlAZFIjVK0rQdEsjvDYBUv+8M6KdUErMhTrcLqen2j42aoWQv3E6RHCGAA3qa2wPr+iyL6olgD89u2k0+ls2F3Xdov0suKotcLo44y3tVDEzQPFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBjWsW4E2+XlOoFuayCu03LtrE01jYVAQwkUMskDBqU=;
 b=liRn4USoxggunxo6SisxWJr3h1iWEXfH/IaRUDknSOxsHOPnDNiA4i4eE3s7twvt/oSqtb5Ztfcr4JeOXAvwtxdiwdTdrQF2wyBnlnpn7QtkZnW8ArwuKhikbMSprnPHc3xpps/xKGfUw3ApYMh0SPXMrbagIJ9zQGtMWnIsiR8iEMMLMSiEmlmTmOKXFIlkva/kI99h+1Lfl4YVrwWc2SEiMUOLvtjQJsBdB/GziVNQ57Vj4ppI1roPNR1CFGNmsnO6zxhQb7RDvWGiGiiD+UGmnaYul2VWjJcORlNWtHYkYeKCGAO1wM41eSLNbs9jBOeo7yKsF+DmlVC53kBAFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBjWsW4E2+XlOoFuayCu03LtrE01jYVAQwkUMskDBqU=;
 b=PH7qrNXXVNpr/TsgNXNOAiZP2RpZntRhuPtCGXe+NjN5xJkjRylesdQ8m6iBcaAzDwsaJ5ewdvRGvodgC12nmCuNa3CsG2efhkAgWz3JX5K1aat7kmIm/Suuq2lKdDp8OprFpbj8WVur1qZePAI85VRZSsDrZ00lrf6AzK/N8p/2cq8xH41P+RSfklfurqVkKSo9enCJSDMLi4k7uuJ4cLRUbwObvOwbgU6KTxHEelbkgvN8r425GEkHJG47GyXk7rsZZH+jprMk1Ifwqx40qFD0Tz9wwkuuhcB+I7BD0QWCgCsAIgfzJ9CnIU4YqJUYQgD7qIh94g1rcpVM4P04UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI0PR06MB9635.eurprd06.prod.outlook.com (2603:10a6:800:231::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 15:34:44 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 15:34:44 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][master][scarthgap][PATCH v2 4/5] opensc: Fix LICENSE declaration
Date: Wed, 21 Aug 2024 15:34:15 +0000
Message-ID: <20240821153416.650175-4-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240821153416.650175-1-niko.mauno@vaisala.com>
References: <20240821153416.650175-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0071.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:a::6)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VI0PR06MB9635:EE_
X-MS-Office365-Filtering-Correlation-Id: fe4e28ff-12fe-4e04-c64e-08dcc1f6c80b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/BpZ5jzs0znPasdgYhqcKmAW5no1q3+Zb57LL6Rl32H0Z1U35ELYjHNSemaQ?=
 =?us-ascii?Q?z/Z+PMaH8WPTvgE9DP6u2uEgGJzhr/fnsaRf0+8/Z/xMGD8KB4HtJf0JiKgY?=
 =?us-ascii?Q?Js6I4MMHGTv8vcu/G1NpqrP6IGwNUoXRNF/SUDAB1m1uDAOVBpe8RiICVtq0?=
 =?us-ascii?Q?AHONTYkCv4obziRVbnsp8g4aETojyVjzWzHFhpmuJRTN+jl45WUIY67IdcL7?=
 =?us-ascii?Q?uOFe3NJ+I2oP4Uic9c7Jpq4Liunisu/sgbyx1W8s4s5rPFMrigrVmbJf7lUU?=
 =?us-ascii?Q?qd6OTLNfOiXOMAFoX2gZC9P7mpgrYdtZYBw1rQDCJZQB2N08sUNuMgk3iprj?=
 =?us-ascii?Q?aIn1P9o4ChHRmCqury/KQtIHeeb+5hFPTMNwkYwTLWBdRD4ltRRfPNWlobra?=
 =?us-ascii?Q?fonFhPaI8gz1L/pddDdYmJK74gUAnvDzUaTXmQzezwpFyZPX9mstuxe8lSWH?=
 =?us-ascii?Q?WT7jOJ5omYc3J/5PehREKgif/s0VNL/eUQf+fo8jDWKUXRT4qmocCz98QBhb?=
 =?us-ascii?Q?XO5Ft7BqdzbZE9vgKGxx62YxkDg2dpu1wR6Dycjdi8lirQU+tpoKjYFj5pPb?=
 =?us-ascii?Q?hBjLYl0VBBX0spz1BLZn1PHlZ7+5Ua7pegI0mMa6IPWnNVWylHA8wvL+nCu7?=
 =?us-ascii?Q?x6l54cSZTknAnHXOV0EBuHONm1kOjdo6eKFD3igQIessnPqGYBoxYqIEXZEu?=
 =?us-ascii?Q?PvkNXROMe0vcYFCVJM0Igkxv5Uepdh2V04/rVZY1M21s98EEzHJkhOsSWg/z?=
 =?us-ascii?Q?T0BsSDsOA3u9wyf8iFc908WxjFpA9zFLGVTP2yJZlrlaQ8wyVc7Fb0IjHQQ7?=
 =?us-ascii?Q?53a5FDGsBWWCjlmw6+5YNU6+XmNmMKASBtcTQxLbNl4osf173R0JovkweB6R?=
 =?us-ascii?Q?bZEYcR9welbcvsc3RMCqQL3GA7BHjRs6s3pETD0XFqsstKCJviyoiTFTd9l3?=
 =?us-ascii?Q?ub2bFgymXfYFqWxBMEiK7g8/u6dJOR1fe4O8lfgEVhGqYWZOxMs77fhNC0dm?=
 =?us-ascii?Q?uo1MV0+aTvjCS2rZYrST0o/lC/5bGTjCSAuQhl35/0WXuJETuG7owRYDFwLC?=
 =?us-ascii?Q?NxMVXKDM9ciCzWGxiQtCvDau5RzoAxxr+8yA5mE3RaTG+tWRv622F6wOThtH?=
 =?us-ascii?Q?Vt5NpSEUOiZDrRCIvVcZjG0ISMnMjhBFRXkJXFQ83RR9PbnCg4/fo1xtFMyt?=
 =?us-ascii?Q?253L99b3JHudb+T/rS6wG0NTT0lerDqSbszIqi+Z/qET2rTZtML1Ahv4OYKO?=
 =?us-ascii?Q?TkWpYdkET1pBhVqDxlcxGwHNiKT5tTJuVtIbnP8X7TzkmZeVpMbBKZrLb3EK?=
 =?us-ascii?Q?cKWBZTGDMgzXQjfI9XmHDMBI8YPwGS/ZxoiKZgVi9EBMnbwHu69t0IfmCxSX?=
 =?us-ascii?Q?7XHAVS8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tnRkngtV/5rf6GU5QjB3eIC/DVS+LFZzoWcPGnKGzd9Bwi9qkcaHgtp/3hnw?=
 =?us-ascii?Q?tUi7wJ4EPR7Qd/BNIz9eY8hCUZe4ljoODxQNZwTxetRMrybrA58D2I8JO3w9?=
 =?us-ascii?Q?WOFwbVtT7x3pMuQxmJAa4EP53FcS9lADWPosrad2MVwF+zAmcZXreQ9fkn85?=
 =?us-ascii?Q?bLTISdJHjYzo0HPmao4KwPvHvf10yAkTyA3C3bfRJ/ouLW7hRFFG2ibPhjtY?=
 =?us-ascii?Q?YDsG2mc4VJSxUQ9QUEb8eZ68cpmBJLdIy9jXnkWSdj4qlypft5LkzaluSOe/?=
 =?us-ascii?Q?1dSrmfTluqLqA05FA2oNS3qkxaniVio3PTy31RaxA5sfzPmNFBBs9Q21gwfi?=
 =?us-ascii?Q?kPqNiQM3YGosQ35+RrIyg5c1bdcQA0KTQbo2BaOL8NPkno2z06lukdKfoUC8?=
 =?us-ascii?Q?wz1PL+Phd977z48JfxlPDroS0sosbOBVsLhalQSTX+AKKwBKOpB/grOySJEO?=
 =?us-ascii?Q?fuGMvErw/4kVhPC+AibOxDA1DcppS5OSv6k/xTGID2tWVbv2PG73QR4/XNQa?=
 =?us-ascii?Q?IhQ0oT5A6LA6qlQ92Tol/86EwG8HMXkqqIf/YIYdNDlc86qOHTA/+h7EAfwY?=
 =?us-ascii?Q?UrE3xe07UNvhuAjosyMsIAxFzVFjbZTw/f51bW1RN9+uBu3o8dAUzNyG3EjW?=
 =?us-ascii?Q?GHm4sr58zgguG4NlcUzFPaPaax8RbJYi1o9/SN8SDZrgSID16yOIOS2b+6rM?=
 =?us-ascii?Q?AWC0hBfELtPUoyuhRyEQGFbbY/CkQsu9+2u84mwCKwhLny6zr8z3fO7VTc/m?=
 =?us-ascii?Q?KmPploD+HOO3q4P1bpnrX6vdep5+uIgGEZwWC9tnepWZqBckKs2UrzMpSnT9?=
 =?us-ascii?Q?ISYQl6nNuu0pZXO2U50zcGaUD2dZxW/o4oH+d4Q+p77Gd0Am6pCfSunsdAJ4?=
 =?us-ascii?Q?HsTXe51jD/TmrP7ThCfgXkOPWLuErC7tnVi6HGKEP7HnRpWKxFYYyePZoazs?=
 =?us-ascii?Q?7hKax6IWLBgEFt0VrYyJJjaSsJ2ZhKb6gWgIsBuWcKZ7oG9q4pKn21A5Mlpa?=
 =?us-ascii?Q?98bORGk9KJe7pR23pVR/PuiPmgr2DACARbXk0UtKCTGw4IuTvXo7QZ6rsyfc?=
 =?us-ascii?Q?jAmtaV+AalCR6RCEH0ugkA0wMZhWxV9/g46WA6ZWTFegwNbYmHl6TPdhOEIL?=
 =?us-ascii?Q?Rj3ISDhw4syEpq4rBZ6CJ06U8sAhop/7Xh4a3EcTEIbovyZbMOzMX+uMuolh?=
 =?us-ascii?Q?NO4ipUzD6es073/0TSWxbBCaDX1GOs4Vbjf+QuXFiRlzC0p3VgQrmISFLAS9?=
 =?us-ascii?Q?qPJ41l+bNL2C0BDu1TN5IQiE7pHM0lKNZQdxMjcwtnMpMQ3jDnlTA/kOdJ4N?=
 =?us-ascii?Q?dT1V9HJS7NSzj6KNx5PNbv7+PK2ikNmgxl51MoT4ZpVVwnpxduKcoXAk+bFP?=
 =?us-ascii?Q?ej7pwciDxUpJ2VOXDuHjG9tvvIhbPh08J7C8oRdJVPKd9bpy7jwTVh0n/5j1?=
 =?us-ascii?Q?15tzipiTc70fe5Tl9+Nvrsc8seubsvXQGBKMHM858ZdnU/rA2yL3lRIxj3kR?=
 =?us-ascii?Q?JSThvQVJDNMyTAm2vPIDnMzSqO/7En+B442Y1Yb6WyLXHBF/1mPhIbMYSCN1?=
 =?us-ascii?Q?P0kya2dto855fJDyrUhdPTHbvQXayg8sH4R+6owqoyHb5DhCrj7M7TkehzQ5?=
 =?us-ascii?Q?kA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe4e28ff-12fe-4e04-c64e-08dcc1f6c80b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 15:34:44.3472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5TaiGBmrusJF6mihh4cmyf/wgNK1utvHT4+3q/Z6GZX9QyMYku+FoEbDtOntsnIXMyttuePBmbroNnH2IMXgcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9635
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 15:34:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111893

According to https://github.com/OpenSC/OpenSC/wiki#license OpenSC is
licensed under LGPL-2.1 or later, which seems to be affirmed also by
the comments in the source code files, as well as the COPYING file.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-support/opensc/opensc_0.25.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb b/meta-oe/reci=
pes-support/opensc/opensc_0.25.1.bb
index 40a8dc320..1a31cdbda 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
@@ -8,7 +8,7 @@ eID cards have also been confirmed to work."
=20
 HOMEPAGE =3D "https://github.com/OpenSC/OpenSC/wiki"
 SECTION =3D "System Environment/Libraries"
-LICENSE =3D "LGPL-2.0-or-later"
+LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcb8aedd3bced19bd8026d96a8b6876d=
7"
=20
 #v0.21.0
--=20
2.39.2


