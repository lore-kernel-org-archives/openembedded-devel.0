Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E934CC61DC2
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 12:20:34 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35140.1787833234071218528
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 05:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=SvkGamBr;
 spf=pass (domain: est.tech, ip: 52.101.66.10, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBUSKO7IJwvZKSCBWN/qzrybbX3+OFplEcfnLQ4RMqtKPDz7HtGao5v/UrOxep0/5FUsoAmeKZBSw7ogilxnAqHV6/Epu1mkZb/gST9aGcZ8/r6NgnzFVXTBA+g1YS58nohZmGrjBQBHeg+oX4F90IdjzIpcD51uSDM9H41VPvPF7fxEbTQe4deJoHfcNpPGzAWXAqjNoq0U4CXlPaKAM/pHcOu2Vfk/lAD7RWLegOwKkIAOv2bATOuXK7pbbdYRmpzJzYzzWCI1q84PfZQL20tSOkhCvqCrhGPze+ViGtHW8G9DCodhvt7C2qEgGANgaD2iGDOKtO5GnOCS/LYNrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NFk1DgqmtsmzZ9Uve4ib3M9I+LsAxXRyj4PbLC/PaA=;
 b=VSFSPdke3ow3p064Sd6mZaT/W58XnZQoo+iUB5n1l5gFDr21TGwL90P142WXZtjKCV286BvastWNrqwrbfvO2JbOCWynrtH5QXpypE7fPIgq/pUlXtV96UQSBZ3vVVO+YvtLjXFI5g9l5r/woC6alEhcRaB8fgvMa55K7DtgEo1AYRonsjes/L8/K0PkZ2KW3Miq1AEzfnf112piTwLzM8sAzQ/g625ToyHnXCNnUw6lKpbZxiWFHJoyqny0wUyu4lsz5xo6NmTFOahzFqji8QemlvyrfbxtawANX6maRCJ2b8MNSxIJTIgXOZl6JVT9hjID4E5hsI3N7AqUY8Il6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NFk1DgqmtsmzZ9Uve4ib3M9I+LsAxXRyj4PbLC/PaA=;
 b=SvkGamBrNmy9CCiIhYV3NoRCc5kdEMscleyYedu2o0CIyZMFLhL70Krq/VB9haEy7WIWEPx47o8GLw8v6U5r0XTJGj8o8deEJVF39hlmWPp0ED+tdMj1WXOuKjT5DrfnmnTN/7MsFvF1vEcf1A5NxaMivEwgcTMtP3K7eRrNc94ThHOaHQeH+zjFkQ0TUeWzP9W+g8Wwarspz+XodUGcNmX/YpVaXB6re5jIGFQcTOc0f1zVK0XuquW40RWRZ/OtiQLbiy8xMqm2gTH/Pgpv3qMhaUch3T/eXvNNnH+WPJcKgMcqzslrBefJw+knspAi9m1PrZLvL9e2FSDKyzxG9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VI1P189MB2564.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:1c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 12:20:28 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 12:20:28 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] doxygen: upgrade 1.17.0 -> 1.18.0
Date: Thu, 27 Aug 2026 14:20:23 +0200
Message-ID: <20260827122023.76593-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZP191CA0013.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::10) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VI1P189MB2564:EE_
X-MS-Office365-Filtering-Correlation-Id: 212f904a-186f-4cca-efa2-08df043594d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|11063799006|6133799003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ckhsvqiQUzbvGDB4ERRxnVvQsQ9CJOlYbyMCdTJJHtUUq9kcuH07sEAK6ZR2WXKUW9QNVlsQREvjTvt/zxr7PzlWlLVsE4xivywzjmZ6BdDadoCzemCx9pU24hxr+O11+N97xWMsWgTot2RIIcEzcCGZ45D66K9OQsAjD6iBAtGdaqzqlMXEBtKjye8j47MkDwD8LPkSBVepRdR2ikvK7vFrWoMHTZl1g0Bt1mFgYWJPmamz8mAfT5FOREtwoQWMWM8sukGDX4GlQfTLWkrgHSUPnXssXYpcy+acKIR/yFFGBLjv8mXPpxIM3sIa2Uc/8wkrogjGGxmSajxu/uE+848xds1uP9fvYUZUKIuxlq/WyfJxhZh822rdAh0sB0V8PwHHsG0IZA27ARMWrlDixPd4i9PMvBIWNb2XAKHx3iYoCkg3LVc2mQ/jSIlfyJkAoRbFbXWT/+goX5+zui8a4dL2a/gVmGBWOXWqimbKwQON7BIRtSCt1pxTierHSJXThQmLD5wjMWlTqFJUz1em+4NZoW6o7xMqzcQxii9m97fKtAG5hkR5+5gDx4+kha0Jw0pp2XVMgN2zlH2CkVQVDDAXjpiExRPiy8sdh2QVfpfRxVWCCAczfTufEkjdkJJ5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(6133799003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?P+3NyE4lmw0yNw1C6t/fD+e06shsv2DKAxau7dTimbR4s5xeE07rCeYc/xCb?=
 =?us-ascii?Q?me3b7RHBnjVAxMc7wfZtGScJdn53zHIMzVXdjoxAnJvlsNSB17VcSvxgkQLs?=
 =?us-ascii?Q?/LqYaLNLm2jRNP8gnGMDKvBMsF1u6oRJZv/AaD/8panc/gLWbOzEbgI2PKdw?=
 =?us-ascii?Q?8PPo/2IOmBlAzRmtDIPvhi28AX5rliTBZqD44jHRsi4ThcpnKeOaaj/+v9m7?=
 =?us-ascii?Q?BrPtumEPpHAcrnE4QkkohjJweZL0nPLFBoG4UtmJHct2xgxxin0peTnr73RB?=
 =?us-ascii?Q?15GbBc69iltmeRat6h17016s3o8l1mcVIJ7a0Xw/82FBflx4Jb3rCGx/xe1I?=
 =?us-ascii?Q?9PLDiMS6BLC/WFLZaB/JTquCzpogSs6e0iOOFkAWyWvmgp5cDzYa7/kUszTe?=
 =?us-ascii?Q?NkYpu6TJxsVZOn6JwPvnGOxShrIxaui3bcYXFaocOroKxTcedoFuyTXf+GTP?=
 =?us-ascii?Q?Lnl7Qj7L5VQCrF1+cQ0eFFCIKXYZOvcbTzPMlAh2lZgNbJAJr5QJNYkFRkJJ?=
 =?us-ascii?Q?GcrSdAEWYPXvznjCWiEY8ydcOO/8TO0Ab9gfpz71/LfDGnvtjF4ifs8Ncyj7?=
 =?us-ascii?Q?waAwrFI62woFc7jKuzj0Yq2qh3wny735lqxKS5FRJiGjYeVEZVKSW46Qx2/r?=
 =?us-ascii?Q?lVjhdwNCxJOMw/chhkGGz2WDQtpezsTLnui6jsqUOx14r8KNBVL8+r7iWzFb?=
 =?us-ascii?Q?uOL3x/hnEUxZTl04LSegOYbQPwTQPs289Qqt6HPGZ38D0hFiaL66kTAVfSuk?=
 =?us-ascii?Q?LiUS7pLCDM7Bl9sz95i/ptgKqyzhqUAsQobrlljKC4FKUUOi5V/xbiCoBcgA?=
 =?us-ascii?Q?KzBtHmjTgL/d7zWbaMHsxWxwQEtXwZj9LmkCyBfIAYviys4Sf8u6ohtL5nPH?=
 =?us-ascii?Q?sShdQldkwwlgHSQOhhezyYaho5pfiqRy/v53P6cyeUhGpsxdLMdnpsDnZnky?=
 =?us-ascii?Q?02hyBl9bjXv70vI6ZQc/LPfQRNvW8Q3VNeomCBeX0uBddSisYa78/eC701V4?=
 =?us-ascii?Q?bWms8IkEzpdbL1Z/o/i/9mCfhP7Zl5EiSykAwakUKQ9G+Hi7hdWxGH7pkeoo?=
 =?us-ascii?Q?T1WEgvTwmKnD8XKe+LTSqtUiEa0GNnazzhFCYgqIUeX2B6TZX4Yi4Cisi3hG?=
 =?us-ascii?Q?Pf5GHilhVkEq5j0p4TidkiN0UcHmAbs8y5aanqWrBxOOt9oVL1f237LNOz07?=
 =?us-ascii?Q?MH083Ou30sLcHlfvDgY+jpidaRnJe5NqL5oO9QzO/atVWqBf1py9E+Wt1crG?=
 =?us-ascii?Q?Oc44ZB7RLa8VfzDbRQf9fMb+p658+JfeQO3Yfq8tBycbX5GZpAvYLl1t6bo6?=
 =?us-ascii?Q?W3yMXQsrc0Eqywiw0HLBLnxDiBV2fXjX6712qLXDt/4jhl8eeJsXfPki3JTS?=
 =?us-ascii?Q?Ib467BHv4xeI75LNoEGtVnHpoyINFrKbAXw2yM5fSEcf+LVZ9r8k8ji53rFD?=
 =?us-ascii?Q?iaimZ6tD9Rh7uyLyVUsopBg4oN7FPupYcIF8phAYdCnzmkr/zIkV/HTMH0kZ?=
 =?us-ascii?Q?pwssxYgO+3UVIoxy+I5drBSwXxgTr1+Vz3IOTMaib0gMODyvwAnVrQbflCQs?=
 =?us-ascii?Q?7YzmRyMn+o3B2ikVTlcl4zCUTE/FjnJdL0rYIWPP6S0KYT38EM4JzQA7umfg?=
 =?us-ascii?Q?KkvbV3eunh3ydcZQGdH/3qtMtoyc5H6kg1/rvBV06LgZqxTiVXo5zJr4gyEE?=
 =?us-ascii?Q?Gi8HY4xzNu9JqzEWczktZROx4vfcmsZCSpnFKFEMgGfXnhv0Jri3z4WIw9iy?=
 =?us-ascii?Q?pF2ygwS5oQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 212f904a-186f-4cca-efa2-08df043594d0
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 12:20:28.7163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GgMQ9JbbHbwczJwjTJsKxddRC2vnUdaxV463gRBhlP8LF2eY1C9YDGuogyGvTxzxnYlGFJSUe2d30GGVfQJILo7CA0WkKKPztCwyX+KcFsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P189MB2564
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 12:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129533

Release info: https://www.doxygen.nl/manual/changelog.html#log_1_18_0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../doxygen/{doxygen_1.17.0.bb =3D> doxygen_1.18.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/doxygen/{doxygen_1.17.0.bb =3D> doxygen_1.=
18.0.bb} (96%)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.17.0.bb b/meta-oe/r=
ecipes-devtools/doxygen/doxygen_1.18.0.bb
similarity index 96%
rename from meta-oe/recipes-devtools/doxygen/doxygen_1.17.0.bb
rename to meta-oe/recipes-devtools/doxygen/doxygen_1.18.0.bb
index 70537fab15..0ee18042e3 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.17.0.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.18.0.bb
@@ -10,7 +10,7 @@ SRC_URI =3D "\
     git://github.com/doxygen/doxygen.git;branch=3Dmaster;protocol=3Dhttps =
\
 "
=20
-SRCREV =3D "65a43c0aba45cc23b3ca11b6b5334d4eea931726"
+SRCREV =3D "8e760943e5d9581a444cf327f43a0b4d20d29482"
=20
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "Release_(?P<pver>\d+(\_\d+)+)"

