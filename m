Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9299D59D9C
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 21:03:43 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14827.1765552507422520732
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 07:15:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=Feonn5ux;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.227.63, mailfrom: divyanshu.rathore@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gDPMGw9H8Ut4QqBk50Ec/xAY10fNBwZL/g7gQ5JtsewCPXT8/une4B1iuNWHBPobr3GpVolS4+NnFDYfG1u/Y3r1PEVWkxQCHV/wwLOTz8/GoY+nSe+Qf7tznLrRqfnOsCJceujCDN/F8meUC6mj4W0l0Etbj0e28tjQ8ZI+lljFJAM9wgKxJ37fyaiVcp21vYfneLe/ovwxYu7G7+okBdXU6tmblValfraHVzImiCpZUPnPs+9YbJ9J4DRj+M6qmup8CMxx1J/9Sdp0qPqOq7DYhAzz3BabbF5bQ8bdj73rgMBrOEmpCQvcfAEk/JotowRlgb7+bONYRG3Btt0UIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Edj6afTqAK9K2Re5ZHOq3FybE9LwVs0CQDmnSliA1Co=;
 b=TpoSjf26qQK7ftpyQZqSeG1RDdlcVkgOHA1LMHsB2kcCjSz0qeTCP7qcQSX4RdkO54Yv8j+2IoJvaycIYQ63jdwL8LEHKZZQPJLAj+gnsVN8L9WIRTawZlFmmz2VBgtWnx7G/8MhBbegc3xEHjDrFI1Dx967GiOqBF9CoX8hOm19Q6dQRHwePQt9k3Ad4VcwjJFVL/30f1F8ndI35grIfmjQiQwbMXgviLPpYuGM+JPs1MggEzBCvRdW07yEIWtUqDqAeFiva8bz1hQU7qWoCzhvuDPHwJlIjQfTo9TJO5wvg7uNr0aoi9FiK+odzHW/HjWOIa868ThsVjyd3DwNVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Edj6afTqAK9K2Re5ZHOq3FybE9LwVs0CQDmnSliA1Co=;
 b=Feonn5uxvYfRgWEhcAXwdDufBceCfRv2rOPkIHDuUNnRenqYrd8yJI/iO9a10fwluLy1nDEj+Ca9E5kmrMLj6ngRWg6dWwGLBe2emS6GcoyNsubYwU6Fr9txmAgJzkDDL611PRRhzfH1axtX0SWYj4rjMMw0IHlyc4G/X7qZYuoMIupxOJXOrq5IZtdQ7xP2wuJD8q3Sn48ExC9LOkvO62CxAaZlfw9F6IOZWSX+RmRfGDppbvZHYW84EoeeTRdeP37QH5CCON29xeK461BFU5PgPTuIWOl3xGTum4JLIBGsxHDT9ekbFDxo/CNsiz2I2OlLy5iIV6MGcg/jpIh4/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:143::11)
 by PN0P287MB1122.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 15:00:23 +0000
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483]) by MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 15:00:23 +0000
From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Divyanshu.Rathore@bmwtechworks.in
Subject: [meta-oe][kirkstone][PATCH v2 11/11] ImageMagick: Fix CVE-2023-34151
Date: Fri, 12 Dec 2025 20:29:47 +0530
Message-ID: <20251212145947.7434-11-Divyanshu.Rathore@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212145947.7434-1-Divyanshu.Rathore@bmwtechworks.in>
References: <20251212145947.7434-1-Divyanshu.Rathore@bmwtechworks.in>
X-ClientProxiedBy: PN0PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::14) To MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:143::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3378:EE_|PN0P287MB1122:EE_
X-MS-Office365-Filtering-Correlation-Id: db137c15-af55-4d10-71ef-08de398f2d18
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YDyrbUB1CoTJuyhfw2DFALmUShcAMvLpBjN0ptI8Tm/fGXGZ+tReXrtoog9j?=
 =?us-ascii?Q?kOS3gQsfqbleQUjBZ3CVuDxLlgJrvzIyj+uAI7kkjUA/Y7YqFermwwj/MVV4?=
 =?us-ascii?Q?bcpKIfge/EVwJIQYDgVqzkp7iZ6Gk9cUdgh8yjeFXp+O9ad3vdjTUKtAJOE2?=
 =?us-ascii?Q?2wI4W8wOEFrDlOaAsRsmMcfOwSBnp+mssRu05C2SQQuZTPh6pFay0wkhFZCo?=
 =?us-ascii?Q?Iy7BIJW3llc49SiYsRvrWE1aU49TQIfEHKqh1c5hq8MkidyA229u3Bbq+R87?=
 =?us-ascii?Q?eQl7qBL6FRralz/GVJK5vMgAeKAdC73Q4vmbvYFVoej8cL/b4k48Cn2n1wHI?=
 =?us-ascii?Q?enXLd9wkLesSOL6To06f4+p7biKpEvCSKgEM98u1SV1NVRshQbUQv97wMYaS?=
 =?us-ascii?Q?wrtTHQgCJYGPEXvW1zTulZqzgzfEXghdoAJJFktO5kl+5sMWeFRmqkBlbFoH?=
 =?us-ascii?Q?D33IzyJQD2LLbPGuDfbdrY9MlYkVtPfbWjamc+h49OWuZFizo5Gcy1+GHdnZ?=
 =?us-ascii?Q?hk4T8vITa+MjZiUlle/mXTHu53Gkpn3vt/c0hfwEOGJ3CJZw3tRZtFgMe7Do?=
 =?us-ascii?Q?d9UZvifzRBajdi0D08/ES+a4Z9ZkRBj62J9QaKdwyiWlxkWpvw8LHXJcQ9f4?=
 =?us-ascii?Q?MsJ80QifmtRDae4D4Ytdy7nDPYtBzLgxcKvTlUXouyqD6vXrVNo0kxc+FHpJ?=
 =?us-ascii?Q?nzDo95Ly02RdlwsI4xSspgcWE8Qqz9MCAuVaaS/FHdr3i8+HJmuoolWf+vXp?=
 =?us-ascii?Q?igNpKpuYqLjC0u8S5KpeuymOv5vQBHyKXY6foC+k4AFHVJLjBxWPT2Br22rl?=
 =?us-ascii?Q?6dZf8tQESiY1ae3p/gQ5008yjroeOFQB0lRp0+Rm7QtA1kcZnysQR7r17576?=
 =?us-ascii?Q?rcVD1HlwR4b88PbxDH4R7zEM+ZyAXds92mwrXmXnNpheP8ajTAMTQbo0DOEF?=
 =?us-ascii?Q?sn848okBI8sHvcoAt3pvUeaeGd2kO0zfH1nL/84D7Nw5Gba0AEziTtJrIFQF?=
 =?us-ascii?Q?VvlkQeWLEyhvRISx34T7sWGfIFvPURTFGuCosVP1AF3paXilE2C2hfxJXpHb?=
 =?us-ascii?Q?Cs9510P1O1Uf6pY6aTEuu8yJ82Ri6EUFe31UnfW6ta/kf6cwyW8TQq5P6y2O?=
 =?us-ascii?Q?LJIg0iuh7jH3AM0WL9vJkXmZvdf1+dtl6ZCifsqlBXSb7Kzef3HEnWCb+e4i?=
 =?us-ascii?Q?QXSDhagEaNPhvhoowY0YFKUGKJTIh83lNNs2zmdiYJa3VwHFbcquv9HGHw65?=
 =?us-ascii?Q?ycftcL42cr0JJllR+uWZYyLG26dbUX8kGaQfYOv/fNiJog9SbloOiD7QQX0I?=
 =?us-ascii?Q?R7rVHViQvAVd4TwfmdiWmDNmtLF/4SYU06RiREtZ7ZPjKb29ZpvKbjKKQw3w?=
 =?us-ascii?Q?0bZ0jNGfr+dWJUW6ebOsxD1cU1qSYVFfp5xRs2ypkZPYyA/SZuvvfZuKZSj3?=
 =?us-ascii?Q?Lr75MLRFUsVXfUQkawHi4zxPx+caniqrF6xvXqxQcZ+d4yLWC7vWKA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3378.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ptIp8f/bvha7uu7pNZGPDtQdSx5yR2WAaKKT3CvcfDMbkNu/XgevwONy5wfk?=
 =?us-ascii?Q?7omihFDwKIVaI8SH9UsSPHyQMfGLZXeZ8jo1iRKLyyMqMV32QhWvGpnF/zy1?=
 =?us-ascii?Q?F0tgo6PNGuQ6MJUcOIiSPT+3vjWPB69gdag026JoDQM1p+dxnmlZ7d9NgiEC?=
 =?us-ascii?Q?ojsF7ODMy+pV7IdWYtxOyaS0qAloJlseYF2sPDaK6D1MRlSCS5jMgJBBXLW0?=
 =?us-ascii?Q?mZvRPJhR8uG9FsBAPQi5mJ6ZvbTAjNb3puK8sUHqSyAeRh6IcL1542czCk4S?=
 =?us-ascii?Q?5whoR0ZYseFrstoLG9ieG69TpPTZeuCd7bp9sSq34sfcK9o0XzmF4nxxM6iL?=
 =?us-ascii?Q?6aMuiyj+JDBVQwjaJxA6kpEefnyvzqY4xtdgILlxpziA0tNivMYC4kegbIJh?=
 =?us-ascii?Q?TSvSn0yJFOslIyzgrlFPvZOj3PK+V1NWV2WXOdd5HzvC8cGJ4R00TfUVG7Lq?=
 =?us-ascii?Q?oGb+Hga0o0H6iU58JsjKZRJRC5kUg8oOPLQ31eWOm1BOP8igwQCBSSEeAt8/?=
 =?us-ascii?Q?tjtQTxJusZP1waUi1Ow5i+cvRCSMJckhqgDA4ApYo6v3by5COQFDdO4f6E7B?=
 =?us-ascii?Q?kqcld7MQz/49Y1pc4V9aK8htQwBXO3YYR0EO6LELZfhC/8QsLxNxB28eX3oh?=
 =?us-ascii?Q?4YV8/Mg9tMJwge5OUQOOYxgfGaPb9WR29zbTUPaot3iswsNHoFnz2hMYbbSg?=
 =?us-ascii?Q?je7V5kWLu4TTCcsv+1RCIWppoVbrnrX3jGR7Dv/Gq/+T4aYXSgbSkCl62RBH?=
 =?us-ascii?Q?ml/C6Vc5Rtr6OSa/wXIEzmtuB/IquOo8GAwKsQl4Ly3TNPXXnkDOGOJhqEku?=
 =?us-ascii?Q?fwGR9ssez2AVO2mz3iZsokvQoWX+5DuGi1CzM1R4YHHQP5Er4Wi3opXLx1BC?=
 =?us-ascii?Q?aCE11hmjGyxW6kSPQP5cOU3uzhBcZJmIovlFcFB5mgQvjdvi7TExzu3xlJIA?=
 =?us-ascii?Q?UUU/buhSoeXx/tlGm4VZkEiDVF4c9GayT01f4VAmiA4Iqz0HUSD3coV8h3Of?=
 =?us-ascii?Q?1vjkHfKqCUXdAEczTdcc2BMLUtKkociAyuEvUnATrh9MGQmfD4b0pmtZ2e9u?=
 =?us-ascii?Q?UzFhj4E6wESR1e1SLV0/bjhOTPMmWCARgyKnZAwgCNdINRQfWdzgTvqUQCdZ?=
 =?us-ascii?Q?T/RxztMVNi23a05fe9wKo7FwTQZYtHcqlVFxuUI0EFqpwRxCtx15+nxnuRyl?=
 =?us-ascii?Q?bBktUrtssGDTbzpdrZ8DE2TrlmodzERYnYiaICQgXUwhSq8AXwD2thyyR+fB?=
 =?us-ascii?Q?Xol9mBsoDBAOQbhwHawzCcYr1aKFeOlXBc/EFwVTzJ4kkzB9CHeFw6CTBrKC?=
 =?us-ascii?Q?KK/PyJnPmBkM9w8nNce7als7nfoQrvLqLXqbU4F2fZk3K6kpgCZEaE6VIPzA?=
 =?us-ascii?Q?mf2NgWqDy6Z4mtZnkPRjg/klHSUaWCvfGDSbuzCQ3qP4XaFHky3kDfQtIK8G?=
 =?us-ascii?Q?HX2daG7CfAf7oRvJlC2ln4t7gfZqbp+m1drpO07MCYM0UiqS5XFUJIu2F9tL?=
 =?us-ascii?Q?lAHCO37R8x8MvbBxxUlzxufEYLBZ8k4NIGTt+0Yfmj8mosM9s+RQko2sdfEp?=
 =?us-ascii?Q?gCmpCWsoZe3bixXpOpyQQQ4hK9UHclmt1Pg8X/HcJMZG3gLtHNVndLq2BJzV?=
 =?us-ascii?Q?TLm4q7lyKDUftLI66f8H878=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: db137c15-af55-4d10-71ef-08de398f2d18
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 15:00:23.4975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYJSSo7EncK9CzxJ9UHpDnbKlzAor5fl1/llOregouUbuCL0CwvKoG6kE+uvP1qQ7ZejWRID4Qzaesa0Q6hDW05/Pvk+5KOS4d5VQ5vz37ty358nlqcVjeCYbDSxyBbu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1122
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 21:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122619

Backport the fix for CVE-2023-34151

Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commi=
t/3d6d98d8a2be30d74172ab43b5b8e874d2deb158]

Add below patch to fix
0011-ImageMagick-Fix-CVE-2023-34151.patch

Add below support patch to fix
0011-ImageMagick-Add-support-patch-1-to-fix-CVE-2023-3415.patch
0011-ImageMagick-Add-support-patch-2-to-fix-CVE-2023-3415.patch
0011-ImageMagick-Add-support-patch-3-to-fix-CVE-2023-3415.patch

Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
---
 ...support-patch-1-to-fix-CVE-2023-3415.patch |  75 ++
 ...support-patch-2-to-fix-CVE-2023-3415.patch | 973 +++++++++++++++++
 ...support-patch-3-to-fix-CVE-2023-3415.patch | 977 ++++++++++++++++++
 .../0011-ImageMagick-Fix-CVE-2023-34151.patch | 314 ++++++
 .../imagemagick/imagemagick_7.0.10.bb         |   4 +
 5 files changed, 2343 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0011-ImageMag=
ick-Add-support-patch-1-to-fix-CVE-2023-3415.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0011-ImageMag=
ick-Add-support-patch-2-to-fix-CVE-2023-3415.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0011-ImageMag=
ick-Add-support-patch-3-to-fix-CVE-2023-3415.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0011-ImageMag=
ick-Fix-CVE-2023-34151.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add=
-support-patch-1-to-fix-CVE-2023-3415.patch b/meta-oe/recipes-support/image=
magick/files/0011-ImageMagick-Add-support-patch-1-to-fix-CVE-2023-3415.patc=
h
new file mode 100644
index 0000000000..de22f9f317
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-suppor=
t-patch-1-to-fix-CVE-2023-3415.patch
@@ -0,0 +1,75 @@
+From dd62bd8f2e1aa6822551c668d23b4d288390dcb7 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Mon, 21 Feb 2022 11:55:43 -0500
+Subject: [PATCH 15/18] ImageMagick: Add support patch 1 to fix CVE-2023-34=
151
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/eb0882667cddc4ea71b61a583a782c430220faf4]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ MagickCore/image-private.h | 11 +++++++++++
+ coders/txt.c               | 24 ++++++++++++------------
+ 2 files changed, 23 insertions(+), 12 deletions(-)
+
+diff --git a/MagickCore/image-private.h b/MagickCore/image-private.h
+index 40c8686d3..59b88fb6f 100644
+--- a/MagickCore/image-private.h
++++ b/MagickCore/image-private.h
+@@ -61,6 +61,17 @@ static inline ssize_t CastDoubleToLong(const double val=
ue)
+   return((ssize_t) value);
+ }
+=20
++static inline QuantumAny CastDoubleToQuantumAny(const double x)
++{
++  if (IsNaN(x) !=3D 0)
++    return(0);
++  if (x > ((double) ((QuantumAny) ~0)))
++    return((QuantumAny) ~0);
++  if (x < 0.0)
++    return(0.0);
++  return((QuantumAny) (x+0.5));
++}
++
+ static inline double DegreesToRadians(const double degrees)
+ {
+   return((double) (MagickPI*degrees/180.0));
+diff --git a/coders/txt.c b/coders/txt.c
+index b9bd08ce5..f8312a4fd 100644
+--- a/coders/txt.c
++++ b/coders/txt.c
+@@ -564,18 +564,18 @@ static Image *ReadTXTImage(const ImageInfo *image_in=
fo,ExceptionInfo *exception)
+             green+=3D(range+1)/2.0;
+             blue+=3D(range+1)/2.0;
+           }
+-        pixel.red=3D(MagickRealType) ScaleAnyToQuantum((QuantumAny)
+-          MagickMax(red+0.5,0.0),range);
+-        pixel.green=3D(MagickRealType) ScaleAnyToQuantum((QuantumAny)
+-          MagickMax(green+0.5,0.0),range);
+-        pixel.blue=3D(MagickRealType) ScaleAnyToQuantum((QuantumAny)
+-          MagickMax(blue+0.5,0.0),range);
+-        pixel.black=3D(MagickRealType) ScaleAnyToQuantum((QuantumAny)
+-          MagickMax(black+0.5,0.0),range);
+-        pixel.alpha=3D(MagickRealType) ScaleAnyToQuantum((QuantumAny)
+-          MagickMax(alpha+0.5,0.0),range);
+-        q=3DGetAuthenticPixels(image,CastDoubleToLong(x_offset),
+-          CastDoubleToLong(y_offset),1,1,exception);
++        pixel.red=3D(MagickRealType) ScaleAnyToQuantum(CastDoubleToQuantu=
mAny(
++          red),range);
++        pixel.green=3D(MagickRealType) ScaleAnyToQuantum(CastDoubleToQuan=
tumAny(
++          green),range);
++        pixel.blue=3D(MagickRealType) ScaleAnyToQuantum(CastDoubleToQuant=
umAny(
++          blue),range);
++        pixel.black=3D(MagickRealType) ScaleAnyToQuantum(CastDoubleToQuan=
tumAny(
++          black),range);
++        pixel.alpha=3D(MagickRealType) ScaleAnyToQuantum(CastDoubleToQuan=
tumAny(
++          alpha),range);
++        q=3DGetAuthenticPixels(image,CastDoubleToLong(x_offset),CastDoubl=
eToLong(
++          y_offset),1,1,exception);
+         if (q =3D=3D (Quantum *) NULL)
+           {
+             status=3DMagickFalse;
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add=
-support-patch-2-to-fix-CVE-2023-3415.patch b/meta-oe/recipes-support/image=
magick/files/0011-ImageMagick-Add-support-patch-2-to-fix-CVE-2023-3415.patc=
h
new file mode 100644
index 0000000000..7d73ba08c1
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-suppor=
t-patch-2-to-fix-CVE-2023-3415.patch
@@ -0,0 +1,973 @@
+From 95a74f9639872c667213b9ce201c1a388d538d30 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Tue, 2 Dec 2025 14:02:56 +0530
+Subject: [PATCH 16/18] ImageMagick: Add support patch 2 to fix CVE-2023-34=
151
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/f7b5682435d37ad5ea8142d69629c93228e6376d]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ MagickCore/annotate.c       |  8 ++---
+ MagickCore/draw.c           | 60 ++++++++++++++++++-------------------
+ MagickCore/effect.c         |  8 ++---
+ MagickCore/gem.c            |  2 +-
+ MagickCore/geometry.c       | 24 +++++++--------
+ MagickCore/image-private.h  | 37 ++++++++++++++++-------
+ MagickCore/image.c          | 20 ++++++-------
+ MagickCore/pixel.c          | 36 +++++++++++-----------
+ MagickCore/property.c       |  4 +--
+ MagickCore/shear.c          | 22 +++++++-------
+ MagickCore/studio.h         |  2 --
+ MagickCore/transform.c      |  4 +--
+ MagickCore/visual-effects.c | 40 ++++++++++++-------------
+ MagickWand/drawing-wand.c   |  8 ++---
+ MagickWand/studio.h         |  2 --
+ coders/histogram.c          |  6 ++--
+ coders/jpeg.c               |  3 +-
+ coders/png.c                | 12 ++++----
+ coders/tiff.c               |  4 +--
+ coders/txt.c                |  4 +--
+ 20 files changed, 159 insertions(+), 147 deletions(-)
+
+diff --git a/MagickCore/annotate.c b/MagickCore/annotate.c
+index 4be938be5..14f8d05d8 100644
+--- a/MagickCore/annotate.c
++++ b/MagickCore/annotate.c
+@@ -1734,8 +1734,8 @@ static MagickBooleanType RenderFreetype(Image *image=
,const DrawInfo *draw_info,
+=20
+           if (status =3D=3D MagickFalse)
+             continue;
+-          x_offset=3DCastDoubleToLong(ceil(point.x-0.5));
+-          y_offset=3DCastDoubleToLong(ceil(point.y+y-0.5));
++          x_offset=3DCastDoubleToSSizeT(ceil(point.x-0.5));
++          y_offset=3DCastDoubleToSSizeT(ceil(point.y+y-0.5));
+           if ((y_offset < 0) || (y_offset >=3D (ssize_t) image->rows))
+             continue;
+           q=3D(Quantum *) NULL;
+@@ -1750,7 +1750,7 @@ static MagickBooleanType RenderFreetype(Image *image=
,const DrawInfo *draw_info,
+           n=3Dy*bitmap->bitmap.pitch;
+           for (x=3D0; x < (ssize_t) bitmap->bitmap.width; x++, n++)
+           {
+-            x_offset=3DCastDoubleToLong(ceil(point.x+x-0.5));
++            x_offset=3DCastDoubleToSSizeT(ceil(point.x+x-0.5));
+             if ((x_offset < 0) || (x_offset >=3D (ssize_t) image->columns=
))
+               {
+                 if (q !=3D (Quantum *) NULL)
+@@ -2102,7 +2102,7 @@ static MagickBooleanType RenderPostscript(Image *ima=
ge,
+       crop_info=3DGetImageBoundingBox(annotate_image,exception);
+       crop_info.height=3D(size_t) ((resolution.y/DefaultResolution)*
+         ExpandAffine(&draw_info->affine)*draw_info->pointsize+0.5);
+-      crop_info.y=3DCastDoubleToLong(ceil((resolution.y/DefaultResolution=
)*
++      crop_info.y=3DCastDoubleToSSizeT(ceil((resolution.y/DefaultResoluti=
on)*
+         extent.y/8.0-0.5));
+       (void) FormatLocaleString(geometry,MagickPathExtent,
+         "%.20gx%.20g%+.20g%+.20g",(double) crop_info.width,(double)
+diff --git a/MagickCore/draw.c b/MagickCore/draw.c
+index facea115e..02df7d231 100644
+--- a/MagickCore/draw.c
++++ b/MagickCore/draw.c
+@@ -1233,8 +1233,8 @@ MagickExport MagickBooleanType DrawAffineImage(Image=
 *image,
+   edge.y2=3DMagickMin(max.y,(double) image->rows-1.0);
+   inverse_affine=3DInverseAffineMatrix(affine);
+   GetPixelInfo(image,&zero);
+-  start=3DCastDoubleToLong(ceil(edge.y1-0.5));
+-  stop=3DCastDoubleToLong(floor(edge.y2+0.5));
++  start=3DCastDoubleToSSizeT(ceil(edge.y1-0.5));
++  stop=3DCastDoubleToSSizeT(floor(edge.y2+0.5));
+   source_view=3DAcquireVirtualCacheView(source,exception);
+   image_view=3DAcquireAuthenticCacheView(image,exception);
+ #if defined(MAGICKCORE_OPENMP_SUPPORT)
+@@ -1267,16 +1267,16 @@ MagickExport MagickBooleanType DrawAffineImage(Ima=
ge *image,
+     inverse_edge=3DAffineEdge(source,&inverse_affine,(double) y,&edge);
+     if (inverse_edge.x2 < inverse_edge.x1)
+       continue;
+-    q=3DGetCacheViewAuthenticPixels(image_view,CastDoubleToLong(
+-      ceil(inverse_edge.x1-0.5)),y,(size_t) CastDoubleToLong(floor(
++    q=3DGetCacheViewAuthenticPixels(image_view,CastDoubleToSSizeT(
++      ceil(inverse_edge.x1-0.5)),y,(size_t) CastDoubleToSSizeT(floor(
+       inverse_edge.x2+0.5)-ceil(inverse_edge.x1-0.5)+1),1,exception);
+     if (q =3D=3D (Quantum *) NULL)
+       continue;
+     pixel=3Dzero;
+     composite=3Dzero;
+     x_offset=3D0;
+-    for (x=3DCastDoubleToLong(ceil(inverse_edge.x1-0.5));
+-         x <=3D CastDoubleToLong(floor(inverse_edge.x2+0.5)); x++)
++    for (x=3DCastDoubleToSSizeT(ceil(inverse_edge.x1-0.5));
++         x <=3D CastDoubleToSSizeT(floor(inverse_edge.x2+0.5)); x++)
+     {
+       point.x=3D(double) x*inverse_affine.sx+y*inverse_affine.ry+
+         inverse_affine.tx;
+@@ -2090,8 +2090,8 @@ MagickExport MagickBooleanType DrawGradientImage(Ima=
ge *image,
+         case UndefinedSpread:
+         case PadSpread:
+         {
+-          if ((x !=3D CastDoubleToLong(ceil(gradient_vector->x1-0.5))) ||
+-              (y !=3D CastDoubleToLong(ceil(gradient_vector->y1-0.5))))
++          if ((x !=3D CastDoubleToSSizeT(ceil(gradient_vector->x1-0.5))) =
||
++              (y !=3D CastDoubleToSSizeT(ceil(gradient_vector->y1-0.5))))
+             {
+               offset=3DGetStopColorOffset(gradient,x,y);
+               if (gradient->type !=3D RadialGradient)
+@@ -2118,8 +2118,8 @@ MagickExport MagickBooleanType DrawGradientImage(Ima=
ge *image,
+         }
+         case ReflectSpread:
+         {
+-          if ((x !=3D CastDoubleToLong(ceil(gradient_vector->x1-0.5))) ||
+-              (y !=3D CastDoubleToLong(ceil(gradient_vector->y1-0.5))))
++          if ((x !=3D CastDoubleToSSizeT(ceil(gradient_vector->x1-0.5))) =
||
++              (y !=3D CastDoubleToSSizeT(ceil(gradient_vector->y1-0.5))))
+             {
+               offset=3DGetStopColorOffset(gradient,x,y);
+               if (gradient->type !=3D RadialGradient)
+@@ -2160,8 +2160,8 @@ MagickExport MagickBooleanType DrawGradientImage(Ima=
ge *image,
+=20
+           antialias=3DMagickFalse;
+           repeat=3D0.0;
+-          if ((x !=3D CastDoubleToLong(ceil(gradient_vector->x1-0.5))) ||
+-              (y !=3D CastDoubleToLong(ceil(gradient_vector->y1-0.5))))
++          if ((x !=3D CastDoubleToSSizeT(ceil(gradient_vector->x1-0.5))) =
||
++              (y !=3D CastDoubleToSSizeT(ceil(gradient_vector->y1-0.5))))
+             {
+               offset=3DGetStopColorOffset(gradient,x,y);
+               if (gradient->type =3D=3D LinearGradient)
+@@ -3457,21 +3457,21 @@ static MagickBooleanType RenderMVGContent(Image *i=
mage,
+                 (void) GetNextToken(q,&q,extent,token);
+                 (void) CopyMagickString(name,token,MagickPathExtent);
+                 (void) GetNextToken(q,&q,extent,token);
+-                bounds.x=3DCastDoubleToLong(ceil(GetDrawValue(token,
++                bounds.x=3DCastDoubleToSSizeT(ceil(GetDrawValue(token,
+                   &next_token)-0.5));
+                 if (token =3D=3D next_token)
+                   ThrowPointExpectedException(token,exception);
+                 (void) GetNextToken(q,&q,extent,token);
+                 if (*token =3D=3D ',')
+                   (void) GetNextToken(q,&q,extent,token);
+-                bounds.y=3DCastDoubleToLong(ceil(GetDrawValue(token,
++                bounds.y=3DCastDoubleToSSizeT(ceil(GetDrawValue(token,
+                   &next_token)-0.5));
+                 if (token =3D=3D next_token)
+                   ThrowPointExpectedException(token,exception);
+                 (void) GetNextToken(q,&q,extent,token);
+                 if (*token =3D=3D ',')
+                   (void) GetNextToken(q,&q,extent,token);
+-                bounds.width=3D(size_t) CastDoubleToLong(floor(GetDrawVal=
ue(
++                bounds.width=3D(size_t) CastDoubleToSSizeT(floor(GetDrawV=
alue(
+                   token,&next_token)+0.5));
+                 if (token =3D=3D next_token)
+                   ThrowPointExpectedException(token,exception);
+@@ -3882,28 +3882,28 @@ static MagickBooleanType RenderMVGContent(Image *i=
mage,
+         if (LocaleCompare("viewbox",keyword) =3D=3D 0)
+           {
+             (void) GetNextToken(q,&q,extent,token);
+-            graphic_context[n]->viewbox.x=3DCastDoubleToLong(ceil(
++            graphic_context[n]->viewbox.x=3DCastDoubleToSSizeT(ceil(
+               GetDrawValue(token,&next_token)-0.5));
+             if (token =3D=3D next_token)
+               ThrowPointExpectedException(token,exception);
+             (void) GetNextToken(q,&q,extent,token);
+             if (*token =3D=3D ',')
+               (void) GetNextToken(q,&q,extent,token);
+-            graphic_context[n]->viewbox.y=3DCastDoubleToLong(ceil(
++            graphic_context[n]->viewbox.y=3DCastDoubleToSSizeT(ceil(
+               GetDrawValue(token,&next_token)-0.5));
+             if (token =3D=3D next_token)
+               ThrowPointExpectedException(token,exception);
+             (void) GetNextToken(q,&q,extent,token);
+             if (*token =3D=3D ',')
+               (void) GetNextToken(q,&q,extent,token);
+-            graphic_context[n]->viewbox.width=3D(size_t) CastDoubleToLong=
(
++            graphic_context[n]->viewbox.width=3D(size_t) CastDoubleToSSiz=
eT(
+               floor(GetDrawValue(token,&next_token)+0.5));
+             if (token =3D=3D next_token)
+               ThrowPointExpectedException(token,exception);
+             (void) GetNextToken(q,&q,extent,token);
+             if (*token =3D=3D ',')
+               (void) GetNextToken(q,&q,extent,token);
+-            graphic_context[n]->viewbox.height=3D(size_t) CastDoubleToLon=
g(
++            graphic_context[n]->viewbox.height=3D(size_t) CastDoubleToSSi=
zeT(
+               floor(GetDrawValue(token,&next_token)+0.5));
+             if (token =3D=3D next_token)
+               ThrowPointExpectedException(token,exception);
+@@ -5017,8 +5017,8 @@ static MagickBooleanType DrawPolygonPrimitive(Image =
*image,
+         GetPixelInfo(image,&pixel);
+         for ( ; x <=3D stop_x; x++)
+         {
+-          if ((x =3D=3D CastDoubleToLong(ceil(primitive_info->point.x-0.5=
))) &&
+-              (y =3D=3D CastDoubleToLong(ceil(primitive_info->point.y-0.5=
))))
++          if ((x =3D=3D CastDoubleToSSizeT(ceil(primitive_info->point.x-0=
.5))) &&
++              (y =3D=3D CastDoubleToSSizeT(ceil(primitive_info->point.y-0=
.5))))
+             {
+               GetFillColor(draw_info,x-start_x,y-start_y,&pixel,exception=
);
+               SetPixelViaPixelInfo(image,&pixel,q);
+@@ -5164,8 +5164,8 @@ static void LogPrimitiveInfo(const PrimitiveInfo *pr=
imitive_info)
+     coordinates,
+     y;
+=20
+-  x=3DCastDoubleToLong(ceil(primitive_info->point.x-0.5));
+-  y=3DCastDoubleToLong(ceil(primitive_info->point.y-0.5));
++  x=3DCastDoubleToSSizeT(ceil(primitive_info->point.x-0.5));
++  y=3DCastDoubleToSSizeT(ceil(primitive_info->point.y-0.5));
+   switch (primitive_info->primitive)
+   {
+     case AlphaPrimitive:
+@@ -5278,8 +5278,8 @@ MagickExport MagickBooleanType DrawPrimitive(Image *=
image,
+       status&=3DSetImageMask(image,CompositePixelMask,draw_info->composit=
e_mask,
+         exception);
+     }
+-  x=3DCastDoubleToLong(ceil(primitive_info->point.x-0.5));
+-  y=3DCastDoubleToLong(ceil(primitive_info->point.y-0.5));
++  x=3DCastDoubleToSSizeT(ceil(primitive_info->point.x-0.5));
++  y=3DCastDoubleToSSizeT(ceil(primitive_info->point.y-0.5));
+   image_view=3DAcquireAuthenticCacheView(image,exception);
+   switch (primitive_info->primitive)
+   {
+@@ -5557,8 +5557,8 @@ MagickExport MagickBooleanType DrawPrimitive(Image *=
image,
+       composite_images=3DDestroyImageList(composite_images);
+       (void) SetImageProgressMonitor(composite_image,(MagickProgressMonit=
or)
+         NULL,(void *) NULL);
+-      x1=3DCastDoubleToLong(ceil(primitive_info[1].point.x-0.5));
+-      y1=3DCastDoubleToLong(ceil(primitive_info[1].point.y-0.5));
++      x1=3DCastDoubleToSSizeT(ceil(primitive_info[1].point.x-0.5));
++      y1=3DCastDoubleToSSizeT(ceil(primitive_info[1].point.y-0.5));
+       if (((x1 !=3D 0L) && (x1 !=3D (ssize_t) composite_image->columns)) =
||
+           ((y1 !=3D 0L) && (y1 !=3D (ssize_t) composite_image->rows)))
+         {
+@@ -6167,7 +6167,7 @@ static MagickBooleanType TraceArcPath(MVGInfo *mvg_i=
nfo,const PointInfo start,
+   else
+     if ((theta > 0.0) && (sweep =3D=3D MagickFalse))
+       theta-=3D2.0*MagickPI;
+-  arc_segments=3D(size_t) CastDoubleToLong(ceil(fabs((double) (theta/(0.5=
*
++  arc_segments=3D(size_t) CastDoubleToSSizeT(ceil(fabs((double) (theta/(0=
.5*
+     MagickPI+MagickEpsilon)))));
+   status=3DMagickTrue;
+   p=3Dprimitive_info;
+@@ -7517,7 +7517,7 @@ static PrimitiveInfo *TraceStrokePolygon(const DrawI=
nfo *draw_info,
+           theta.q=3Datan2(box_q[2].y-center.y,box_q[2].x-center.x);
+           if (theta.q < theta.p)
+             theta.q+=3D2.0*MagickPI;
+-          arc_segments=3D(size_t) CastDoubleToLong(ceil((double) ((theta.
++          arc_segments=3D(size_t) CastDoubleToSSizeT(ceil((double) ((thet=
a.
+             q-theta.p)/(2.0*sqrt(PerceptibleReciprocal(mid))))));
+           CheckPathExtent(MaxStrokePad,arc_segments+MaxStrokePad);
+           stroke_q[q].x=3Dbox_q[1].x;
+@@ -7590,7 +7590,7 @@ static PrimitiveInfo *TraceStrokePolygon(const DrawI=
nfo *draw_info,
+           theta.q=3Datan2(box_p[2].y-center.y,box_p[2].x-center.x);
+           if (theta.p < theta.q)
+             theta.p+=3D2.0*MagickPI;
+-          arc_segments=3D(size_t) CastDoubleToLong(ceil((double) ((theta.=
p-
++          arc_segments=3D(size_t) CastDoubleToSSizeT(ceil((double) ((thet=
a.p-
+             theta.q)/(2.0*sqrt((double) (1.0/mid))))));
+           CheckPathExtent(arc_segments+MaxStrokePad,MaxStrokePad);
+           stroke_p[p++]=3Dbox_p[1];
+diff --git a/MagickCore/effect.c b/MagickCore/effect.c
+index bfb1363f2..a37a1999e 100644
+--- a/MagickCore/effect.c
++++ b/MagickCore/effect.c
+@@ -288,7 +288,7 @@ MagickExport Image *AdaptiveBlurImage(const Image *ima=
ge,const double radius,
+         center,
+         j;
+=20
+-      j=3DCastDoubleToLong(ceil((double) width*(1.0-QuantumScale*
++      j=3DCastDoubleToSSizeT(ceil((double) width*(1.0-QuantumScale*
+         GetPixelIntensity(edge_image,r))-0.5));
+       if (j < 0)
+         j=3D0;
+@@ -609,7 +609,7 @@ MagickExport Image *AdaptiveSharpenImage(const Image *=
image,const double radius,
+         center,
+         j;
+=20
+-      j=3DCastDoubleToLong(ceil((double) width*(1.0-QuantumScale*
++      j=3DCastDoubleToSSizeT(ceil((double) width*(1.0-QuantumScale*
+         GetPixelIntensity(edge_image,r))-0.5));
+       if (j < 0)
+         j=3D0;
+@@ -2402,9 +2402,9 @@ MagickExport Image *MotionBlurImage(const Image *ima=
ge,const double radius,
+   point.y=3D(double) width*cos(DegreesToRadians(angle));
+   for (i=3D0; i < (ssize_t) width; i++)
+   {
+-    offset[i].x=3DCastDoubleToLong(ceil((double) (i*point.y)/
++    offset[i].x=3DCastDoubleToSSizeT(ceil((double) (i*point.y)/
+       hypot(point.x,point.y)-0.5));
+-    offset[i].y=3DCastDoubleToLong(ceil((double) (i*point.x)/
++    offset[i].y=3DCastDoubleToSSizeT(ceil((double) (i*point.x)/
+       hypot(point.x,point.y)-0.5));
+   }
+   /*
+diff --git a/MagickCore/gem.c b/MagickCore/gem.c
+index 2c5911f67..4eb8c3fc5 100644
+--- a/MagickCore/gem.c
++++ b/MagickCore/gem.c
+@@ -692,7 +692,7 @@ MagickPrivate void ConvertHWBToRGB(const double hue,co=
nst double whiteness,
+       *blue=3DQuantumRange*v;
+       return;
+     }
+-  i=3DCastDoubleToLong(floor(6.0*hue));
++  i=3DCastDoubleToSSizeT(floor(6.0*hue));
+   f=3D6.0*hue-i;
+   if ((i & 0x01) !=3D 0)
+     f=3D1.0-f;
+diff --git a/MagickCore/geometry.c b/MagickCore/geometry.c
+index 5c6e2ad69..dd46a96fc 100644
+--- a/MagickCore/geometry.c
++++ b/MagickCore/geometry.c
+@@ -241,7 +241,7 @@ MagickExport MagickStatusType GetGeometry(const char *=
geometry,ssize_t *x,
+               if (LocaleNCompare(p,"0x",2) =3D=3D 0)
+                 *width=3D(size_t) strtol(p,&p,10);
+               else
+-                *width=3D((size_t) floor(StringToDouble(p,&p)+0.5)) & 0x7=
fffffff;
++                *width=3DCastDoubleToSizeT(StringToDouble(p,&p));
+             }
+           if (p !=3D q)
+             flags|=3DWidthValue;
+@@ -260,7 +260,7 @@ MagickExport MagickStatusType GetGeometry(const char *=
geometry,ssize_t *x,
+               */
+               q=3Dp;
+               if (height !=3D (size_t *) NULL)
+-                *height=3D((size_t) floor(StringToDouble(p,&p)+0.5)) & 0x=
7fffffff;
++                *height=3DCastDoubleToSizeT(StringToDouble(p,&p));
+               if (p !=3D q)
+                 flags|=3DHeightValue;
+             }
+@@ -279,7 +279,7 @@ MagickExport MagickStatusType GetGeometry(const char *=
geometry,ssize_t *x,
+       }
+       q=3Dp;
+       if (x !=3D (ssize_t *) NULL)
+-        *x=3D((ssize_t) ceil(StringToDouble(p,&p)-0.5)) & 0x7fffffff;
++        *x=3DCastDoubleToSSizeT(StringToDouble(p,&p));
+       if (p !=3D q)
+         {
+           flags|=3DXValue;
+@@ -300,7 +300,7 @@ MagickExport MagickStatusType GetGeometry(const char *=
geometry,ssize_t *x,
+       }
+       q=3Dp;
+       if (y !=3D (ssize_t *) NULL)
+-        *y=3D((ssize_t) ceil(StringToDouble(p,&p)-0.5)) & 0x7fffffff;
++        *y=3DCastDoubleToSSizeT(StringToDouble(p,&p));
+       if (p !=3D q)
+         {
+           flags|=3DYValue;
+@@ -1285,8 +1285,8 @@ MagickExport MagickStatusType ParseGravityGeometry(c=
onst Image *image,
+       scale.y=3Dgeometry_info.sigma;
+       if ((status & SigmaValue) =3D=3D 0)
+         scale.y=3Dscale.x;
+-      region_info->width=3D(size_t) floor((scale.x*image->columns/100.0)+=
0.5);
+-      region_info->height=3D(size_t) floor((scale.y*image->rows/100.0)+0.=
5);
++      region_info->width=3DCastDoubleToSizeT(scale.x*image->columns/100.0=
);
++      region_info->height=3DCastDoubleToSizeT(scale.y*image->rows/100.0);
+     }
+   if ((flags & AspectRatioValue) !=3D 0)
+     {
+@@ -1308,13 +1308,13 @@ MagickExport MagickStatusType ParseGravityGeometry=
(const Image *image,
+       if (geometry_ratio >=3D image_ratio)
+         {
+           region_info->width=3Dimage->columns;
+-          region_info->height=3D(size_t) floor((double) (image->rows*imag=
e_ratio/
+-            geometry_ratio)+0.5);
++          region_info->height=3DCastDoubleToSizeT((double) image->rows*im=
age_ratio/
++            geometry_ratio);
+         }
+       else
+         {
+-          region_info->width=3D(size_t) floor((double) (image->columns*
+-            geometry_ratio/image_ratio)+0.5);
++          region_info->width=3DCastDoubleToSizeT((double) image->columns*
++            geometry_ratio/image_ratio);
+           region_info->height=3Dimage->rows;
+         }
+     }
+@@ -1450,8 +1450,8 @@ MagickExport MagickStatusType ParseMetaGeometry(cons=
t char *geometry,ssize_t *x,
+         }
+       else
+         {
+-          *width=3D(size_t) floor((double) (PerceptibleReciprocal(
+-            image_ratio)*former_width*geometry_ratio)+0.5);
++          *width=3DCastDoubleToSizeT(PerceptibleReciprocal(
++            image_ratio)*former_width*geometry_ratio);
+           *height=3Dformer_height;
+         }
+       former_width=3D(*width);
+diff --git a/MagickCore/image-private.h b/MagickCore/image-private.h
+index 59b88fb6f..694c19d54 100644
+--- a/MagickCore/image-private.h
++++ b/MagickCore/image-private.h
+@@ -41,6 +41,9 @@ extern "C" {
+ #define MagickSQ1_2  0.70710678118654752440084436210484903928483593768847
+ #define MagickSQ2    1.41421356237309504880168872420969807856967187537695
+ #define MagickSQ2PI  2.50662827463100024161235523934010416269302368164062
++#define MAGICK_SIZE_MAX  (SIZE_MAX)
++#define MAGICK_SSIZE_MAX  (SSIZE_MAX)
++#define MAGICK_SSIZE_MIN  (-(SSIZE_MAX)-1)
+ #define MatteColor  "#bdbdbd"  /* gray */
+ #define PSDensityGeometry  "72.0x72.0"
+ #define PSPageGeometry  "612x792"
+@@ -50,17 +53,6 @@ extern "C" {
+ #define UndefinedCompressionQuality  0UL
+ #define UndefinedTicksPerSecond  100L
+=20
+-static inline ssize_t CastDoubleToLong(const double value)
+-{
+-  if (IsNaN(value) !=3D 0)
+-    return(0);
+-  if (value > (double) MAGICK_SSIZE_MAX)
+-    return((ssize_t) MAGICK_SSIZE_MAX);
+-  if (value < (double) MAGICK_SSIZE_MIN)
+-    return((ssize_t) MAGICK_SSIZE_MIN);
+-  return((ssize_t) value);
+-}
+-
+ static inline QuantumAny CastDoubleToQuantumAny(const double x)
+ {
+   if (IsNaN(x) !=3D 0)
+@@ -72,6 +64,29 @@ static inline QuantumAny CastDoubleToQuantumAny(const d=
ouble x)
+   return((QuantumAny) (x+0.5));
+ }
+=20
++static inline size_t CastDoubleToSizeT(const double x)
++{
++  if (IsNaN(x) !=3D 0)
++    return(0);
++  if (x > ((double) MAGICK_SIZE_MAX+0.5))
++    return((size_t) MAGICK_SIZE_MAX);
++  return((size_t) floor(x+0.5));
++}
++
++static inline ssize_t CastDoubleToSSizeT(const double x)
++{
++  if (IsNaN(x) !=3D 0)
++    return(0);
++  if (x > ((double) MAGICK_SSIZE_MAX+0.5))
++    return((ssize_t) MAGICK_SSIZE_MAX);
++  if (x < ((double) MAGICK_SSIZE_MIN-0.5))
++    return((ssize_t) MAGICK_SSIZE_MIN);
++  if (x >=3D 0.0)
++    return((ssize_t) floor(x+0.5));
++  return((ssize_t) ceil(x-0.5));
++}
++
++
+ static inline double DegreesToRadians(const double degrees)
+ {
+   return((double) (MagickPI*degrees/180.0));
+diff --git a/MagickCore/image.c b/MagickCore/image.c
+index 3e6fdd114..7b8caa0d2 100644
+--- a/MagickCore/image.c
++++ b/MagickCore/image.c
+@@ -282,21 +282,21 @@ MagickExport Image *AcquireImage(const ImageInfo *im=
age_info,
+       if ((flags & GreaterValue) !=3D 0)
+         {
+           if ((double) image->delay > floor(geometry_info.rho+0.5))
+-            image->delay=3D(size_t) CastDoubleToLong(floor(
++            image->delay=3D(size_t) CastDoubleToSSizeT(floor(
+               geometry_info.rho+0.5));
+         }
+       else
+         if ((flags & LessValue) !=3D 0)
+           {
+             if ((double) image->delay < floor(geometry_info.rho+0.5))
+-              image->ticks_per_second=3DCastDoubleToLong(floor(
++              image->ticks_per_second=3DCastDoubleToSSizeT(floor(
+                 geometry_info.sigma+0.5));
+           }
+         else
+-          image->delay=3D(size_t) CastDoubleToLong(floor(
++          image->delay=3D(size_t) CastDoubleToSSizeT(floor(
+             geometry_info.rho+0.5));
+       if ((flags & SigmaValue) !=3D 0)
+-        image->ticks_per_second=3DCastDoubleToLong(floor(
++        image->ticks_per_second=3DCastDoubleToSSizeT(floor(
+           geometry_info.sigma+0.5));
+     }
+   option=3DGetImageOption(image_info,"dispose");
+@@ -881,18 +881,18 @@ MagickExport Image *CloneImage(const Image *image,co=
nst size_t columns,
+   scale=3D1.0;
+   if (image->columns !=3D 0)
+     scale=3D(double) columns/(double) image->columns;
+-  clone_image->page.width=3D(size_t) CastDoubleToLong(floor(scale*
++  clone_image->page.width=3D(size_t) CastDoubleToSSizeT(floor(scale*
+     image->page.width+0.5));
+-  clone_image->page.x=3DCastDoubleToLong(ceil(scale*image->page.x-0.5));
+-  clone_image->tile_offset.x=3DCastDoubleToLong(ceil(scale*
++  clone_image->page.x=3DCastDoubleToSSizeT(ceil(scale*image->page.x-0.5))=
;
++  clone_image->tile_offset.x=3DCastDoubleToSSizeT(ceil(scale*
+     image->tile_offset.x-0.5));
+   scale=3D1.0;
+   if (image->rows !=3D 0)
+     scale=3D(double) rows/(double) image->rows;
+-  clone_image->page.height=3D(size_t) CastDoubleToLong(floor(scale*
++  clone_image->page.height=3D(size_t) CastDoubleToSSizeT(floor(scale*
+     image->page.height+0.5));
+-  clone_image->page.y=3DCastDoubleToLong(ceil(scale*image->page.y-0.5));
+-  clone_image->tile_offset.y=3DCastDoubleToLong(ceil(scale*
++  clone_image->page.y=3DCastDoubleToSSizeT(ceil(scale*image->page.y-0.5))=
;
++  clone_image->tile_offset.y=3DCastDoubleToSSizeT(ceil(scale*
+     image->tile_offset.y-0.5));
+   clone_image->cache=3DClonePixelCache(image->cache);
+   if (SetImageExtent(clone_image,columns,rows,exception) =3D=3D MagickFal=
se)
+diff --git a/MagickCore/pixel.c b/MagickCore/pixel.c
+index 5c1c5296f..c2aea7c1d 100644
+--- a/MagickCore/pixel.c
++++ b/MagickCore/pixel.c
+@@ -4515,8 +4515,8 @@ MagickExport MagickBooleanType InterpolatePixelChann=
el(
+   status=3DMagickTrue;
+   *pixel=3D0.0;
+   traits=3DGetPixelChannelTraits(image,channel);
+-  x_offset=3DCastDoubleToLong(floor(x));
+-  y_offset=3DCastDoubleToLong(floor(y));
++  x_offset=3DCastDoubleToSSizeT(floor(x));
++  y_offset=3DCastDoubleToSSizeT(floor(y));
+   interpolate=3Dmethod;
+   if (interpolate =3D=3D UndefinedInterpolatePixel)
+     interpolate=3Dimage->interpolate;
+@@ -4533,8 +4533,8 @@ MagickExport MagickBooleanType InterpolatePixelChann=
el(
+       if (interpolate =3D=3D Average9InterpolatePixel)
+         {
+           count=3D3;
+-          x_offset=3DCastDoubleToLong(floor(x+0.5)-1.0);
+-          y_offset=3DCastDoubleToLong(floor(y+0.5)-1.0);
++          x_offset=3DCastDoubleToSSizeT(floor(x+0.5)-1.0);
++          y_offset=3DCastDoubleToSSizeT(floor(y+0.5)-1.0);
+         }
+       else
+         if (interpolate =3D=3D Average16InterpolatePixel)
+@@ -4717,8 +4717,8 @@ MagickExport MagickBooleanType InterpolatePixelChann=
el(
+     }
+     case NearestInterpolatePixel:
+     {
+-      x_offset=3DCastDoubleToLong(floor(x+0.5));
+-      y_offset=3DCastDoubleToLong(floor(y+0.5));
++      x_offset=3DCastDoubleToSSizeT(floor(x+0.5));
++      y_offset=3DCastDoubleToSSizeT(floor(y+0.5));
+       p=3DGetCacheViewVirtualPixels(image_view,x_offset,y_offset,1,1,exce=
ption);
+       if (p =3D=3D (const Quantum *) NULL)
+         {
+@@ -4935,8 +4935,8 @@ MagickExport MagickBooleanType InterpolatePixelChann=
els(
+   assert(source->signature =3D=3D MagickCoreSignature);
+   assert(source_view !=3D (CacheView *) NULL);
+   status=3DMagickTrue;
+-  x_offset=3DCastDoubleToLong(floor(x));
+-  y_offset=3DCastDoubleToLong(floor(y));
++  x_offset=3DCastDoubleToSSizeT(floor(x));
++  y_offset=3DCastDoubleToSSizeT(floor(y));
+   interpolate=3Dmethod;
+   if (interpolate =3D=3D UndefinedInterpolatePixel)
+     interpolate=3Dsource->interpolate;
+@@ -4953,8 +4953,8 @@ MagickExport MagickBooleanType InterpolatePixelChann=
els(
+       if (interpolate =3D=3D Average9InterpolatePixel)
+         {
+           count=3D3;
+-          x_offset=3DCastDoubleToLong(floor(x+0.5)-1.0);
+-          y_offset=3DCastDoubleToLong(floor(y+0.5)-1.0);
++          x_offset=3DCastDoubleToSSizeT(floor(x+0.5)-1.0);
++          y_offset=3DCastDoubleToSSizeT(floor(y+0.5)-1.0);
+         }
+       else
+         if (interpolate =3D=3D Average16InterpolatePixel)
+@@ -5218,8 +5218,8 @@ MagickExport MagickBooleanType InterpolatePixelChann=
els(
+     }
+     case NearestInterpolatePixel:
+     {
+-      x_offset=3DCastDoubleToLong(floor(x+0.5));
+-      y_offset=3DCastDoubleToLong(floor(y+0.5));
++      x_offset=3DCastDoubleToSSizeT(floor(x+0.5));
++      y_offset=3DCastDoubleToSSizeT(floor(y+0.5));
+       p=3DGetCacheViewVirtualPixels(source_view,x_offset,y_offset,1,1,exc=
eption);
+       if (p =3D=3D (const Quantum *) NULL)
+         {
+@@ -5502,8 +5502,8 @@ MagickExport MagickBooleanType InterpolatePixelInfo(=
const Image *image,
+   assert(image->signature =3D=3D MagickCoreSignature);
+   assert(image_view !=3D (CacheView *) NULL);
+   status=3DMagickTrue;
+-  x_offset=3DCastDoubleToLong(floor(x));
+-  y_offset=3DCastDoubleToLong(floor(y));
++  x_offset=3DCastDoubleToSSizeT(floor(x));
++  y_offset=3DCastDoubleToSSizeT(floor(y));
+   interpolate=3Dmethod;
+   if (interpolate =3D=3D UndefinedInterpolatePixel)
+     interpolate=3Dimage->interpolate;
+@@ -5522,8 +5522,8 @@ MagickExport MagickBooleanType InterpolatePixelInfo(=
const Image *image,
+       if (interpolate =3D=3D Average9InterpolatePixel)
+         {
+           count=3D3;
+-          x_offset=3DCastDoubleToLong(floor(x+0.5)-1.0);
+-          y_offset=3DCastDoubleToLong(floor(y+0.5)-1.0);
++          x_offset=3DCastDoubleToSSizeT(floor(x+0.5)-1.0);
++          y_offset=3DCastDoubleToSSizeT(floor(y+0.5)-1.0);
+         }
+       else if (interpolate =3D=3D Average16InterpolatePixel)
+         {
+@@ -5847,8 +5847,8 @@ MagickExport MagickBooleanType InterpolatePixelInfo(=
const Image *image,
+     }
+     case NearestInterpolatePixel:
+     {
+-      x_offset=3DCastDoubleToLong(floor(x+0.5));
+-      y_offset=3DCastDoubleToLong(floor(y+0.5));
++      x_offset=3DCastDoubleToSSizeT(floor(x+0.5));
++      y_offset=3DCastDoubleToSSizeT(floor(y+0.5));
+       p=3DGetCacheViewVirtualPixels(image_view,x_offset,y_offset,1,1,exce=
ption);
+       if (p =3D=3D (const Quantum *) NULL)
+         {
+diff --git a/MagickCore/property.c b/MagickCore/property.c
+index 1b42adaee..b13fa7a17 100644
+--- a/MagickCore/property.c
++++ b/MagickCore/property.c
+@@ -4372,13 +4372,13 @@ MagickExport MagickBooleanType SetImageProperty(Im=
age *image,
+             if ((flags & LessValue) !=3D 0)
+               {
+                 if ((double) image->delay < floor(geometry_info.rho+0.5))
+-                  image->delay=3DCastDoubleToLong(
++                  image->delay=3DCastDoubleToSSizeT(
+                     floor(geometry_info.sigma+0.5));
+               }
+             else
+               image->delay=3D(size_t) floor(geometry_info.rho+0.5);
+           if ((flags & SigmaValue) !=3D 0)
+-            image->ticks_per_second=3DCastDoubleToLong(floor(
++            image->ticks_per_second=3DCastDoubleToSSizeT(floor(
+               geometry_info.sigma+0.5));
+           return(MagickTrue);
+         }
+diff --git a/MagickCore/shear.c b/MagickCore/shear.c
+index 05703ca34..62a98013e 100644
+--- a/MagickCore/shear.c
++++ b/MagickCore/shear.c
+@@ -163,10 +163,10 @@ static MagickBooleanType CropToFitImage(Image **imag=
e,
+     if (max.y < extent[i].y)
+       max.y=3Dextent[i].y;
+   }
+-  geometry.x=3DCastDoubleToLong(ceil(min.x-0.5));
+-  geometry.y=3DCastDoubleToLong(ceil(min.y-0.5));
+-  geometry.width=3D(size_t) CastDoubleToLong(floor(max.x-min.x+0.5));
+-  geometry.height=3D(size_t) CastDoubleToLong(floor(max.y-min.y+0.5));
++  geometry.x=3DCastDoubleToSSizeT(ceil(min.x-0.5));
++  geometry.y=3DCastDoubleToSSizeT(ceil(min.y-0.5));
++  geometry.width=3D(size_t) CastDoubleToSSizeT(floor(max.x-min.x+0.5));
++  geometry.height=3D(size_t) CastDoubleToSSizeT(floor(max.y-min.y+0.5));
+   page=3D(*image)->page;
+   (void) ParseAbsoluteGeometry("0x0+0+0",&(*image)->page);
+   crop_image=3DCropImage(*image,&geometry,exception);
+@@ -1217,7 +1217,7 @@ static MagickBooleanType XShearImage(Image *image,co=
nst double degrees,
+         displacement*=3D(-1.0);
+         direction=3DLEFT;
+       }
+-    step=3DCastDoubleToLong(floor((double) displacement));
++    step=3DCastDoubleToSSizeT(floor((double) displacement));
+     area=3D(double) (displacement-step);
+     step++;
+     pixel=3Dbackground;
+@@ -1434,7 +1434,7 @@ static MagickBooleanType YShearImage(Image *image,co=
nst double degrees,
+         displacement*=3D(-1.0);
+         direction=3DUP;
+       }
+-    step=3DCastDoubleToLong(floor((double) displacement));
++    step=3DCastDoubleToSSizeT(floor((double) displacement));
+     area=3D(double) (displacement-step);
+     step++;
+     pixel=3Dbackground;
+@@ -1617,11 +1617,11 @@ MagickExport Image *ShearImage(const Image *image,=
const double x_shear,
+   /*
+     Compute image size.
+   */
+-  bounds.width=3Dimage->columns+CastDoubleToLong(floor(fabs(shear.x)*
++  bounds.width=3Dimage->columns+CastDoubleToSSizeT(floor(fabs(shear.x)*
+     image->rows+0.5));
+-  bounds.x=3DCastDoubleToLong(ceil((double) image->columns+((fabs(shear.x=
)*
++  bounds.x=3DCastDoubleToSSizeT(ceil((double) image->columns+((fabs(shear=
.x)*
+     image->rows)-image->columns)/2.0-0.5));
+-  bounds.y=3DCastDoubleToLong(ceil((double) image->rows+((fabs(shear.y)*
++  bounds.y=3DCastDoubleToSSizeT(ceil((double) image->rows+((fabs(shear.y)=
*
+     bounds.width)-image->rows)/2.0-0.5));
+   /*
+     Surround image with border.
+@@ -1770,9 +1770,9 @@ MagickExport Image *ShearRotateImage(const Image *im=
age,const double degrees,
+   bounds.height=3D(size_t) floor(fabs((double) bounds.width*shear.y)+heig=
ht+0.5);
+   shear_width=3D(size_t) floor(fabs((double) bounds.height*shear.x)+
+     bounds.width+0.5);
+-  bounds.x=3DCastDoubleToLong(floor((double) ((shear_width > bounds.width=
) ?
++  bounds.x=3DCastDoubleToSSizeT(floor((double) ((shear_width > bounds.wid=
th) ?
+     width : bounds.width-shear_width+2)/2.0+0.5));
+-  bounds.y=3DCastDoubleToLong(floor(((double) bounds.height-height+2)/2.0=
+0.5));
++  bounds.y=3DCastDoubleToSSizeT(floor(((double) bounds.height-height+2)/2=
.0+0.5));
+   /*
+     Surround image with a border.
+   */
+diff --git a/MagickCore/studio.h b/MagickCore/studio.h
+index fbdcc2d00..a0e8a9a1a 100644
+--- a/MagickCore/studio.h
++++ b/MagickCore/studio.h
+@@ -350,8 +350,6 @@ extern int vsnprintf(char *,size_t,const char *,va_lis=
t);
+   Magick defines.
+ */
+ #define MagickMaxRecursionDepth  600
+-#define MAGICK_SSIZE_MAX  (SSIZE_MAX)
+-#define MAGICK_SSIZE_MIN  (-(SSIZE_MAX)-1)
+ #define Swap(x,y) ((x)^=3D(y), (y)^=3D(x), (x)^=3D(y))
+ #if defined(_MSC_VER)
+ # define DisableMSCWarning(nr) __pragma(warning(push)) \
+diff --git a/MagickCore/transform.c b/MagickCore/transform.c
+index 385d5eb68..6afe0a3de 100644
+--- a/MagickCore/transform.c
++++ b/MagickCore/transform.c
+@@ -773,8 +773,8 @@ static inline ssize_t PixelRoundOffset(double x)
+     Round the fraction to nearest integer.
+   */
+   if ((x-floor(x)) < (ceil(x)-x))
+-    return(CastDoubleToLong(floor(x)));
+-  return(CastDoubleToLong(ceil(x)));
++    return(CastDoubleToSSizeT(floor(x)));
++  return(CastDoubleToSSizeT(ceil(x)));
+ }
+=20
+ MagickExport Image *CropImageToTiles(const Image *image,
+diff --git a/MagickCore/visual-effects.c b/MagickCore/visual-effects.c
+index 789660231..069904a08 100644
+--- a/MagickCore/visual-effects.c
++++ b/MagickCore/visual-effects.c
+@@ -1439,8 +1439,8 @@ static MagickBooleanType PlasmaImageProxy(Image *ima=
ge,CacheView *image_view,
+       */
+       depth--;
+       attenuate++;
+-      x_mid=3DCastDoubleToLong(ceil((segment->x1+segment->x2)/2-0.5));
+-      y_mid=3DCastDoubleToLong(ceil((segment->y1+segment->y2)/2-0.5));
++      x_mid=3DCastDoubleToSSizeT(ceil((segment->x1+segment->x2)/2-0.5));
++      y_mid=3DCastDoubleToSSizeT(ceil((segment->y1+segment->y2)/2-0.5));
+       local_info=3D(*segment);
+       local_info.x2=3D(double) x_mid;
+       local_info.y2=3D(double) y_mid;
+@@ -1463,8 +1463,8 @@ static MagickBooleanType PlasmaImageProxy(Image *ima=
ge,CacheView *image_view,
+         &local_info,attenuate,depth,exception);
+       return(status =3D=3D 0 ? MagickFalse : MagickTrue);
+     }
+-  x_mid=3DCastDoubleToLong(ceil((segment->x1+segment->x2)/2-0.5));
+-  y_mid=3DCastDoubleToLong(ceil((segment->y1+segment->y2)/2-0.5));
++  x_mid=3DCastDoubleToSSizeT(ceil((segment->x1+segment->x2)/2-0.5));
++  y_mid=3DCastDoubleToSSizeT(ceil((segment->y1+segment->y2)/2-0.5));
+   if ((fabs(segment->x1-x_mid) < MagickEpsilon) &&
+       (fabs(segment->x2-x_mid) < MagickEpsilon) &&
+       (fabs(segment->y1-y_mid) < MagickEpsilon) &&
+@@ -1481,10 +1481,10 @@ static MagickBooleanType PlasmaImageProxy(Image *i=
mage,CacheView *image_view,
+       /*
+         Left pixel.
+       */
+-      x=3DCastDoubleToLong(ceil(segment->x1-0.5));
+-      u=3DGetCacheViewVirtualPixels(u_view,x,CastDoubleToLong(ceil(
++      x=3DCastDoubleToSSizeT(ceil(segment->x1-0.5));
++      u=3DGetCacheViewVirtualPixels(u_view,x,CastDoubleToSSizeT(ceil(
+         segment->y1-0.5)),1,1,exception);
+-      v=3DGetCacheViewVirtualPixels(v_view,x,CastDoubleToLong(ceil(
++      v=3DGetCacheViewVirtualPixels(v_view,x,CastDoubleToSSizeT(ceil(
+         segment->y2-0.5)),1,1,exception);
+       q=3DQueueCacheViewAuthenticPixels(image_view,x,y_mid,1,1,exception)=
;
+       if ((u =3D=3D (const Quantum *) NULL) || (v =3D=3D (const Quantum *=
) NULL) ||
+@@ -1504,10 +1504,10 @@ static MagickBooleanType PlasmaImageProxy(Image *i=
mage,CacheView *image_view,
+           /*
+             Right pixel.
+           */
+-          x=3DCastDoubleToLong(ceil(segment->x2-0.5));
+-          u=3DGetCacheViewVirtualPixels(u_view,x,CastDoubleToLong(ceil(
++          x=3DCastDoubleToSSizeT(ceil(segment->x2-0.5));
++          u=3DGetCacheViewVirtualPixels(u_view,x,CastDoubleToSSizeT(ceil(
+             segment->y1-0.5)),1,1,exception);
+-          v=3DGetCacheViewVirtualPixels(v_view,x,CastDoubleToLong(ceil(
++          v=3DGetCacheViewVirtualPixels(v_view,x,CastDoubleToSSizeT(ceil(
+             segment->y2-0.5)),1,1,exception);
+           q=3DQueueCacheViewAuthenticPixels(image_view,x,y_mid,1,1,except=
ion);
+           if ((u =3D=3D (const Quantum *) NULL) || (v =3D=3D (const Quant=
um *) NULL) ||
+@@ -1533,10 +1533,10 @@ static MagickBooleanType PlasmaImageProxy(Image *i=
mage,CacheView *image_view,
+           /*
+             Bottom pixel.
+           */
+-          y=3DCastDoubleToLong(ceil(segment->y2-0.5));
+-          u=3DGetCacheViewVirtualPixels(u_view,CastDoubleToLong(ceil(
++          y=3DCastDoubleToSSizeT(ceil(segment->y2-0.5));
++          u=3DGetCacheViewVirtualPixels(u_view,CastDoubleToSSizeT(ceil(
+             segment->x1-0.5)),y,1,1,exception);
+-          v=3DGetCacheViewVirtualPixels(v_view,CastDoubleToLong(ceil(
++          v=3DGetCacheViewVirtualPixels(v_view,CastDoubleToSSizeT(ceil(
+             segment->x2-0.5)),y,1,1,exception);
+           q=3DQueueCacheViewAuthenticPixels(image_view,x_mid,y,1,1,except=
ion);
+           if ((u =3D=3D (const Quantum *) NULL) || (v =3D=3D (const Quant=
um *) NULL) ||
+@@ -1557,10 +1557,10 @@ static MagickBooleanType PlasmaImageProxy(Image *i=
mage,CacheView *image_view,
+           /*
+             Top pixel.
+           */
+-          y=3DCastDoubleToLong(ceil(segment->y1-0.5));
+-          u=3DGetCacheViewVirtualPixels(u_view,CastDoubleToLong(ceil(
++          y=3DCastDoubleToSSizeT(ceil(segment->y1-0.5));
++          u=3DGetCacheViewVirtualPixels(u_view,CastDoubleToSSizeT(ceil(
+             segment->x1-0.5)),y,1,1,exception);
+-          v=3DGetCacheViewVirtualPixels(v_view,CastDoubleToLong(ceil(
++          v=3DGetCacheViewVirtualPixels(v_view,CastDoubleToSSizeT(ceil(
+             segment->x2-0.5)),y,1,1,exception);
+           q=3DQueueCacheViewAuthenticPixels(image_view,x_mid,y,1,1,except=
ion);
+           if ((u =3D=3D (const Quantum *) NULL) || (v =3D=3D (const Quant=
um *) NULL) ||
+@@ -1583,11 +1583,11 @@ static MagickBooleanType PlasmaImageProxy(Image *i=
mage,CacheView *image_view,
+       /*
+         Middle pixel.
+       */
+-      x=3DCastDoubleToLong(ceil(segment->x1-0.5));
+-      y=3DCastDoubleToLong(ceil(segment->y1-0.5));
++      x=3DCastDoubleToSSizeT(ceil(segment->x1-0.5));
++      y=3DCastDoubleToSSizeT(ceil(segment->y1-0.5));
+       u=3DGetCacheViewVirtualPixels(u_view,x,y,1,1,exception);
+-      x=3DCastDoubleToLong(ceil(segment->x2-0.5));
+-      y=3DCastDoubleToLong(ceil(segment->y2-0.5));
++      x=3DCastDoubleToSSizeT(ceil(segment->x2-0.5));
++      y=3DCastDoubleToSSizeT(ceil(segment->y2-0.5));
+       v=3DGetCacheViewVirtualPixels(v_view,x,y,1,1,exception);
+       q=3DQueueCacheViewAuthenticPixels(image_view,x_mid,y_mid,1,1,except=
ion);
+       if ((u =3D=3D (const Quantum *) NULL) || (v =3D=3D (const Quantum *=
) NULL) ||
+diff --git a/MagickWand/drawing-wand.c b/MagickWand/drawing-wand.c
+index cc1fbc640..002798ba0 100644
+--- a/MagickWand/drawing-wand.c
++++ b/MagickWand/drawing-wand.c
+@@ -4285,10 +4285,10 @@ WandExport MagickBooleanType DrawPushPattern(Drawi=
ngWand *wand,
+     x,y,width,height);
+   wand->indent_depth++;
+   wand->pattern_id=3DAcquireString(pattern_id);
+-  wand->pattern_bounds.x=3DCastDoubleToLong(ceil(x-0.5));
+-  wand->pattern_bounds.y=3DCastDoubleToLong(ceil(y-0.5));
+-  wand->pattern_bounds.width=3D(size_t) CastDoubleToLong(floor(width+0.5)=
);
+-  wand->pattern_bounds.height=3D(size_t) CastDoubleToLong(floor(height+0.=
5));
++  wand->pattern_bounds.x=3DCastDoubleToSSizeT(ceil(x-0.5));
++  wand->pattern_bounds.y=3DCastDoubleToSSizeT(ceil(y-0.5));
++  wand->pattern_bounds.width=3D(size_t) CastDoubleToSSizeT(floor(width+0.=
5));
++  wand->pattern_bounds.height=3D(size_t) CastDoubleToSSizeT(floor(height+=
0.5));
+   wand->pattern_offset=3Dwand->mvg_length;
+   return(MagickTrue);
+ }
+diff --git a/MagickWand/studio.h b/MagickWand/studio.h
+index 3dcb4d304..4daf7e894 100644
+--- a/MagickWand/studio.h
++++ b/MagickWand/studio.h
+@@ -305,8 +305,6 @@ extern int vsnprintf(char *,size_t,const char *,va_lis=
t);
+ /*
+   Magick defines.
+ */
+-#define MAGICK_SSIZE_MAX  (SSIZE_MAX)
+-#define MAGICK_SSIZE_MIN  (-(SSIZE_MAX)-1)
+ #if defined(_MSC_VER)
+ # define DisableMSCWarning(nr) __pragma(warning(push)) \
+   __pragma(warning(disable:nr))
+diff --git a/coders/histogram.c b/coders/histogram.c
+index 0df364c12..15ee9772d 100644
+--- a/coders/histogram.c
++++ b/coders/histogram.c
+@@ -295,7 +295,7 @@ static MagickBooleanType WriteHISTOGRAMImage(const Ima=
geInfo *image_info,
+       break;
+     if ((GetPixelRedTraits(image) & UpdatePixelTrait) !=3D 0)
+       {
+-        y=3DCastDoubleToLong(ceil((double) histogram_image->rows-scale*
++        y=3DCastDoubleToSSizeT(ceil((double) histogram_image->rows-scale*
+           histogram[x].red-0.5));
+         r=3Dq+y*GetPixelChannels(histogram_image);
+         for ( ; y < (ssize_t) histogram_image->rows; y++)
+@@ -306,7 +306,7 @@ static MagickBooleanType WriteHISTOGRAMImage(const Ima=
geInfo *image_info,
+       }
+     if ((GetPixelGreenTraits(image) & UpdatePixelTrait) !=3D 0)
+       {
+-        y=3DCastDoubleToLong(ceil((double) histogram_image->rows-scale*
++        y=3DCastDoubleToSSizeT(ceil((double) histogram_image->rows-scale*
+           histogram[x].green-0.5));
+         r=3Dq+y*GetPixelChannels(histogram_image);
+         for ( ; y < (ssize_t) histogram_image->rows; y++)
+@@ -317,7 +317,7 @@ static MagickBooleanType WriteHISTOGRAMImage(const Ima=
geInfo *image_info,
+       }
+     if ((GetPixelBlueTraits(image) & UpdatePixelTrait) !=3D 0)
+       {
+-        y=3DCastDoubleToLong(ceil((double) histogram_image->rows-scale*
++        y=3DCastDoubleToSSizeT(ceil((double) histogram_image->rows-scale*
+           histogram[x].blue-0.5));
+         r=3Dq+y*GetPixelChannels(histogram_image);
+         for ( ; y < (ssize_t) histogram_image->rows; y++)
+diff --git a/coders/jpeg.c b/coders/jpeg.c
+index db385358b..d779644ab 100644
+--- a/coders/jpeg.c
++++ b/coders/jpeg.c
+@@ -2325,7 +2325,8 @@ static MagickBooleanType WriteJPEGImage_(const Image=
Info *image_info,
+   if (image->debug !=3D MagickFalse)
+     (void) LogMagickEvent(CoderEvent,GetMagickModule(),
+       "Image resolution: %.20g,%.20g",image->resolution.x,image->resoluti=
on.y);
+-  if ((image->resolution.x !=3D 0.0) && (image->resolution.y !=3D 0.0))
++  if ((image->resolution.x >=3D 0) && (image->resolution.x < (double) SHR=
T_MAX) &&
++      (image->resolution.y >=3D 0) && (image->resolution.y < (double) SHR=
T_MAX))
+     {
+       /*
+         Set image resolution.
+diff --git a/coders/png.c b/coders/png.c
+index e730edb03..6f88e9cdc 100644
+--- a/coders/png.c
++++ b/coders/png.c
+@@ -10020,23 +10020,23 @@ static MagickBooleanType WriteOnePNGImage(MngInf=
o *mng_info,
+         {
+           ping_pHYs_unit_type=3DPNG_RESOLUTION_METER;
+           ping_pHYs_x_resolution=3D
+-             (png_uint_32) ((100.0*image->resolution.x+0.5)/2.54);
++             (png_uint_32) CastDoubleToSizeT((100.0*image->resolution.x+0=
.5)/2.54);
+           ping_pHYs_y_resolution=3D
+-             (png_uint_32) ((100.0*image->resolution.y+0.5)/2.54);
++             (png_uint_32) CastDoubleToSizeT((100.0*image->resolution.y+0=
.5)/2.54);
+         }
+=20
+       else if (image->units =3D=3D PixelsPerCentimeterResolution)
+         {
+           ping_pHYs_unit_type=3DPNG_RESOLUTION_METER;
+-          ping_pHYs_x_resolution=3D(png_uint_32) (100.0*image->resolution=
.x+0.5);
+-          ping_pHYs_y_resolution=3D(png_uint_32) (100.0*image->resolution=
.y+0.5);
++          ping_pHYs_x_resolution=3D(png_uint_32) CastDoubleToSizeT(100.0*=
image->resolution.x+0.5);
++          ping_pHYs_y_resolution=3D(png_uint_32) CastDoubleToSizeT(100.0*=
image->resolution.y+0.5);
+         }
+=20
+       else
+         {
+           ping_pHYs_unit_type=3DPNG_RESOLUTION_UNKNOWN;
+-          ping_pHYs_x_resolution=3D(png_uint_32) image->resolution.x;
+-          ping_pHYs_y_resolution=3D(png_uint_32) image->resolution.y;
++          ping_pHYs_x_resolution=3D(png_uint_32) CastDoubleToSizeT(image-=
>resolution.x);
++          ping_pHYs_y_resolution=3D(png_uint_32) CastDoubleToSizeT(image-=
>resolution.y);
+         }
+=20
+       if (logging !=3D MagickFalse)
+diff --git a/coders/tiff.c b/coders/tiff.c
+index 68a6d5b09..a0bdd6313 100644
+--- a/coders/tiff.c
++++ b/coders/tiff.c
+@@ -1506,9 +1506,9 @@ static Image *ReadTIFFImage(const ImageInfo *image_i=
nfo,
+     if ((TIFFGetFieldDefaulted(tiff,TIFFTAG_XPOSITION,&x_position,sans) =
=3D=3D 1) &&
+         (TIFFGetFieldDefaulted(tiff,TIFFTAG_YPOSITION,&y_position,sans) =
=3D=3D 1))
+       {
+-        image->page.x=3DCastDoubleToLong(ceil(x_position*
++        image->page.x=3DCastDoubleToSSizeT(ceil(x_position*
+           image->resolution.x-0.5));
+-        image->page.y=3DCastDoubleToLong(ceil(y_position*
++        image->page.y=3DCastDoubleToSSizeT(ceil(y_position*
+           image->resolution.y-0.5));
+       }
+     if (TIFFGetFieldDefaulted(tiff,TIFFTAG_ORIENTATION,&orientation,sans)=
 =3D=3D 1)
+diff --git a/coders/txt.c b/coders/txt.c
+index f8312a4fd..91323583d 100644
+--- a/coders/txt.c
++++ b/coders/txt.c
+@@ -273,7 +273,7 @@ static Image *ReadTEXTImage(const ImageInfo *image_inf=
o,
+       draw_info=3DDestroyDrawInfo(draw_info);
+       ThrowReaderException(TypeError,"UnableToGetTypeMetrics");
+     }
+-  page.y=3DCastDoubleToLong(ceil((double) page.y+metrics.ascent-0.5));
++  page.y=3DCastDoubleToSSizeT(ceil((double) page.y+metrics.ascent-0.5));
+   (void) FormatLocaleString(geometry,MagickPathExtent,"%gx%g%+g%+g",(doub=
le)
+     image->columns,(double) image->rows,(double) page.x,(double) page.y);
+   (void) CloneString(&draw_info->geometry,geometry);
+@@ -574,7 +574,7 @@ static Image *ReadTXTImage(const ImageInfo *image_info=
,ExceptionInfo *exception)
+           black),range);
+         pixel.alpha=3D(MagickRealType) ScaleAnyToQuantum(CastDoubleToQuan=
tumAny(
+           alpha),range);
+-        q=3DGetAuthenticPixels(image,CastDoubleToLong(x_offset),CastDoubl=
eToLong(
++        q=3DGetAuthenticPixels(image,CastDoubleToSSizeT(x_offset),CastDou=
bleToSSizeT(
+           y_offset),1,1,exception);
+         if (q =3D=3D (Quantum *) NULL)
+           {
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add=
-support-patch-3-to-fix-CVE-2023-3415.patch b/meta-oe/recipes-support/image=
magick/files/0011-ImageMagick-Add-support-patch-3-to-fix-CVE-2023-3415.patc=
h
new file mode 100644
index 0000000000..f96f5b3da9
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Add-suppor=
t-patch-3-to-fix-CVE-2023-3415.patch
@@ -0,0 +1,977 @@
+From 1743c78786aac899134a2b2484d802e6adde3ac4 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Tue, 2 Dec 2025 20:41:36 +0530
+Subject: [PATCH 17/18] ImageMagick: Add support patch 3 to fix CVE-2023-34=
151
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/4daec2d748cb2f7540ca0d3f694fb2384b0a5601]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ MagickCore/annotate.c       |  8 ++---
+ MagickCore/draw.c           | 60 +++++++++++++++----------------
+ MagickCore/effect.c         |  8 ++---
+ MagickCore/gem.c            |  2 +-
+ MagickCore/geometry.c       | 18 +++++-----
+ MagickCore/image-private.h  | 70 +++++++++++++++++++++++++------------
+ MagickCore/image.c          | 20 +++++------
+ MagickCore/pixel.c          | 36 +++++++++----------
+ MagickCore/property.c       |  4 +--
+ MagickCore/shear.c          | 22 ++++++------
+ MagickCore/transform.c      |  4 +--
+ MagickCore/visual-effects.c | 40 ++++++++++-----------
+ MagickWand/drawing-wand.c   |  8 ++---
+ coders/histogram.c          |  6 ++--
+ coders/icon.c               |  1 +
+ coders/pcl.c                |  4 +--
+ coders/tiff.c               |  4 +--
+ coders/txt.c                |  4 +--
+ configure                   |  8 ++---
+ 19 files changed, 177 insertions(+), 150 deletions(-)
+
+diff --git a/MagickCore/annotate.c b/MagickCore/annotate.c
+index 14f8d05d8..4be938be5 100644
+--- a/MagickCore/annotate.c
++++ b/MagickCore/annotate.c
+@@ -1734,8 +1734,8 @@ static MagickBooleanType RenderFreetype(Image *image=
,const DrawInfo *draw_info,
+=20
+           if (status =3D=3D MagickFalse)
+             continue;
+-          x_offset=3DCastDoubleToSSizeT(ceil(point.x-0.5));
+-          y_offset=3DCastDoubleToSSizeT(ceil(point.y+y-0.5));
++          x_offset=3DCastDoubleToLong(ceil(point.x-0.5));
++          y_offset=3DCastDoubleToLong(ceil(point.y+y-0.5));
+           if ((y_offset < 0) || (y_offset >=3D (ssize_t) image->rows))
+             continue;
+           q=3D(Quantum *) NULL;
+@@ -1750,7 +1750,7 @@ static MagickBooleanType RenderFreetype(Image *image=
,const DrawInfo *draw_info,
+           n=3Dy*bitmap->bitmap.pitch;
+           for (x=3D0; x < (ssize_t) bitmap->bitmap.width; x++, n++)
+           {
+-            x_offset=3DCastDoubleToSSizeT(ceil(point.x+x-0.5));
++            x_offset=3DCastDoubleToLong(ceil(point.x+x-0.5));
+             if ((x_offset < 0) || (x_offset >=3D (ssize_t) image->columns=
))
+               {
+                 if (q !=3D (Quantum *) NULL)
+@@ -2102,7 +2102,7 @@ static MagickBooleanType RenderPostscript(Image *ima=
ge,
+       crop_info=3DGetImageBoundingBox(annotate_image,exception);
+       crop_info.height=3D(size_t) ((resolution.y/DefaultResolution)*
+         ExpandAffine(&draw_info->affine)*draw_info->pointsize+0.5);
+-      crop_info.y=3DCastDoubleToSSizeT(ceil((resolution.y/DefaultResoluti=
on)*
++      crop_info.y=3DCastDoubleToLong(ceil((resolution.y/DefaultResolution=
)*
+         extent.y/8.0-0.5));
+       (void) FormatLocaleString(geometry,MagickPathExtent,
+         "%.20gx%.20g%+.20g%+.20g",(double) crop_info.width,(double)
+diff --git a/MagickCore/draw.c b/MagickCore/draw.c
+index 02df7d231..facea115e 100644
+--- a/MagickCore/draw.c
++++ b/MagickCore/draw.c
+@@ -1233,8 +1233,8 @@ MagickExport MagickBooleanType DrawAffineImage(Image=
 *image,
+   edge.y2=3DMagickMin(max.y,(double) image->rows-1.0);
+   inverse_affine=3DInverseAffineMatrix(affine);
+   GetPixelInfo(image,&zero);
+-  start=3DCastDoubleToSSizeT(ceil(edge.y1-0.5));
+-  stop=3DCastDoubleToSSizeT(floor(edge.y2+0.5));
++  start=3DCastDoubleToLong(ceil(edge.y1-0.5));
++  stop=3DCastDoubleToLong(floor(edge.y2+0.5));
+   source_view=3DAcquireVirtualCacheView(source,exception);
+   image_view=3DAcquireAuthenticCacheView(image,exception);
+ #if defined(MAGICKCORE_OPENMP_SUPPORT)
+@@ -1267,16 +1267,16 @@ MagickExport MagickBooleanType DrawAffineImage(Ima=
ge *image,
+     inverse_edge=3DAffineEdge(source,&inverse_affine,(double) y,&edge);
+     if (inverse_edge.x2 < inverse_edge.x1)
+       continue;
+-    q=3DGetCacheViewAuthenticPixels(image_view,CastDoubleToSSizeT(
+-      ceil(inverse_edge.x1-0.5)),y,(size_t) CastDoubleToSSizeT(floor(
++    q=3DGetCacheViewAuthenticPixels(image_view,CastDoubleToLong(
++      ceil(inverse_edge.x1-0.5)),y,(size_t) CastDoubleToLong(floor(
+       inverse_edge.x2+0.5)-ceil(inverse_edge.x1-0.5)+1),1,exception);
+     if (q =3D=3D (Quantum *) NULL)
+       continue;
+     pixel=3Dzero;
+     composite=3Dzero;
+     x_offset=3D0;
+-    for (x=3DCastDoubleToSSizeT(ceil(inverse_edge.x1-0.5));
+-         x <=3D CastDoubleToSSizeT(floor(inverse_edge.x2+0.5)); x++)
++    for (x=3DCastDoubleToLong(ceil(inverse_edge.x1-0.5));
++         x <=3D CastDoubleToLong(floor(inverse_edge.x2+0.5)); x++)
+     {
+       point.x=3D(double) x*inverse_affine.sx+y*inverse_affine.ry+
+         inverse_affine.tx;
+@@ -2090,8 +2090,8 @@ MagickExport MagickBooleanType DrawGradientImage(Ima=
ge *image,
+         case UndefinedSpread:
+         case PadSpread:
+         {
+-          if ((x !=3D CastDoubleToSSizeT(ceil(gradient_vector->x1-0.5))) =
||
+-              (y !=3D CastDoubleToSSizeT(ceil(gradient_vector->y1-0.5))))
++          if ((x !=3D CastDoubleToLong(ceil(gradient_vector->x1-0.5))) ||
++              (y !=3D CastDoubleToLong(ceil(gradient_vector->y1-0.5))))
+             {
+               offset=3DGetStopColorOffset(gradient,x,y);
+               if (gradient->type !=3D RadialGradient)
+@@ -2118,8 +2118,8 @@ MagickExport MagickBooleanType DrawGradientImage(Ima=
ge *image,
+         }
+         case ReflectSpread:
+         {
+-          if ((x !=3D CastDoubleToSSizeT(ceil(gradient_vector->x1-0.5))) =
||
+-              (y !=3D CastDoubleToSSizeT(ceil(gradient_vector->y1-0.5))))
++          if ((x !=3D CastDoubleToLong(ceil(gradient_vector->x1-0.5))) ||
++              (y !=3D CastDoubleToLong(ceil(gradient_vector->y1-0.5))))
+             {
+               offset=3DGetStopColorOffset(gradient,x,y);
+               if (gradient->type !=3D RadialGradient)
+@@ -2160,8 +2160,8 @@ MagickExport MagickBooleanType DrawGradientImage(Ima=
ge *image,
+=20
+           antialias=3DMagickFalse;
+           repeat=3D0.0;
+-          if ((x !=3D CastDoubleToSSizeT(ceil(gradient_vector->x1-0.5))) =
||
+-              (y !=3D CastDoubleToSSizeT(ceil(gradient_vector->y1-0.5))))
++          if ((x !=3D CastDoubleToLong(ceil(gradient_vector->x1-0.5))) ||
++              (y !=3D CastDoubleToLong(ceil(gradient_vector->y1-0.5))))
+             {
+               offset=3DGetStopColorOffset(gradient,x,y);
+               if (gradient->type =3D=3D LinearGradient)
+@@ -3457,21 +3457,21 @@ static MagickBooleanType RenderMVGContent(Image *i=
mage,
+                 (void) GetNextToken(q,&q,extent,token);
+                 (void) CopyMagickString(name,token,MagickPathExtent);
+                 (void) GetNextToken(q,&q,extent,token);
+-                bounds.x=3DCastDoubleToSSizeT(ceil(GetDrawValue(token,
++                bounds.x=3DCastDoubleToLong(ceil(GetDrawValue(token,
+                   &next_token)-0.5));
+                 if (token =3D=3D next_token)
+                   ThrowPointExpectedException(token,exception);
+                 (void) GetNextToken(q,&q,extent,token);
+                 if (*token =3D=3D ',')
+                   (void) GetNextToken(q,&q,extent,token);
+-                bounds.y=3DCastDoubleToSSizeT(ceil(GetDrawValue(token,
++                bounds.y=3DCastDoubleToLong(ceil(GetDrawValue(token,
+                   &next_token)-0.5));
+                 if (token =3D=3D next_token)
+                   ThrowPointExpectedException(token,exception);
+                 (void) GetNextToken(q,&q,extent,token);
+                 if (*token =3D=3D ',')
+                   (void) GetNextToken(q,&q,extent,token);
+-                bounds.width=3D(size_t) CastDoubleToSSizeT(floor(GetDrawV=
alue(
++                bounds.width=3D(size_t) CastDoubleToLong(floor(GetDrawVal=
ue(
+                   token,&next_token)+0.5));
+                 if (token =3D=3D next_token)
+                   ThrowPointExpectedException(token,exception);
+@@ -3882,28 +3882,28 @@ static MagickBooleanType RenderMVGContent(Image *i=
mage,
+         if (LocaleCompare("viewbox",keyword) =3D=3D 0)
+           {
+             (void) GetNextToken(q,&q,extent,token);
+-            graphic_context[n]->viewbox.x=3DCastDoubleToSSizeT(ceil(
++            graphic_context[n]->viewbox.x=3DCastDoubleToLong(ceil(
+               GetDrawValue(token,&next_token)-0.5));
+             if (token =3D=3D next_token)
+               ThrowPointExpectedException(token,exception);
+             (void) GetNextToken(q,&q,extent,token);
+             if (*token =3D=3D ',')
+               (void) GetNextToken(q,&q,extent,token);
+-            graphic_context[n]->viewbox.y=3DCastDoubleToSSizeT(ceil(
++            graphic_context[n]->viewbox.y=3DCastDoubleToLong(ceil(
+               GetDrawValue(token,&next_token)-0.5));
+             if (token =3D=3D next_token)
+               ThrowPointExpectedException(token,exception);
+             (void) GetNextToken(q,&q,extent,token);
+             if (*token =3D=3D ',')
+               (void) GetNextToken(q,&q,extent,token);
+-            graphic_context[n]->viewbox.width=3D(size_t) CastDoubleToSSiz=
eT(
++            graphic_context[n]->viewbox.width=3D(size_t) CastDoubleToLong=
(
+               floor(GetDrawValue(token,&next_token)+0.5));
+             if (token =3D=3D next_token)
+               ThrowPointExpectedException(token,exception);
+             (void) GetNextToken(q,&q,extent,token);
+             if (*token =3D=3D ',')
+               (void) GetNextToken(q,&q,extent,token);
+-            graphic_context[n]->viewbox.height=3D(size_t) CastDoubleToSSi=
zeT(
++            graphic_context[n]->viewbox.height=3D(size_t) CastDoubleToLon=
g(
+               floor(GetDrawValue(token,&next_token)+0.5));
+             if (token =3D=3D next_token)
+               ThrowPointExpectedException(token,exception);
+@@ -5017,8 +5017,8 @@ static MagickBooleanType DrawPolygonPrimitive(Image =
*image,
+         GetPixelInfo(image,&pixel);
+         for ( ; x <=3D stop_x; x++)
+         {
+-          if ((x =3D=3D CastDoubleToSSizeT(ceil(primitive_info->point.x-0=
.5))) &&
+-              (y =3D=3D CastDoubleToSSizeT(ceil(primitive_info->point.y-0=
.5))))
++          if ((x =3D=3D CastDoubleToLong(ceil(primitive_info->point.x-0.5=
))) &&
++              (y =3D=3D CastDoubleToLong(ceil(primitive_info->point.y-0.5=
))))
+             {
+               GetFillColor(draw_info,x-start_x,y-start_y,&pixel,exception=
);
+               SetPixelViaPixelInfo(image,&pixel,q);
+@@ -5164,8 +5164,8 @@ static void LogPrimitiveInfo(const PrimitiveInfo *pr=
imitive_info)
+     coordinates,
+     y;
+=20
+-  x=3DCastDoubleToSSizeT(ceil(primitive_info->point.x-0.5));
+-  y=3DCastDoubleToSSizeT(ceil(primitive_info->point.y-0.5));
++  x=3DCastDoubleToLong(ceil(primitive_info->point.x-0.5));
++  y=3DCastDoubleToLong(ceil(primitive_info->point.y-0.5));
+   switch (primitive_info->primitive)
+   {
+     case AlphaPrimitive:
+@@ -5278,8 +5278,8 @@ MagickExport MagickBooleanType DrawPrimitive(Image *=
image,
+       status&=3DSetImageMask(image,CompositePixelMask,draw_info->composit=
e_mask,
+         exception);
+     }
+-  x=3DCastDoubleToSSizeT(ceil(primitive_info->point.x-0.5));
+-  y=3DCastDoubleToSSizeT(ceil(primitive_info->point.y-0.5));
++  x=3DCastDoubleToLong(ceil(primitive_info->point.x-0.5));
++  y=3DCastDoubleToLong(ceil(primitive_info->point.y-0.5));
+   image_view=3DAcquireAuthenticCacheView(image,exception);
+   switch (primitive_info->primitive)
+   {
+@@ -5557,8 +5557,8 @@ MagickExport MagickBooleanType DrawPrimitive(Image *=
image,
+       composite_images=3DDestroyImageList(composite_images);
+       (void) SetImageProgressMonitor(composite_image,(MagickProgressMonit=
or)
+         NULL,(void *) NULL);
+-      x1=3DCastDoubleToSSizeT(ceil(primitive_info[1].point.x-0.5));
+-      y1=3DCastDoubleToSSizeT(ceil(primitive_info[1].point.y-0.5));
++      x1=3DCastDoubleToLong(ceil(primitive_info[1].point.x-0.5));
++      y1=3DCastDoubleToLong(ceil(primitive_info[1].point.y-0.5));
+       if (((x1 !=3D 0L) && (x1 !=3D (ssize_t) composite_image->columns)) =
||
+           ((y1 !=3D 0L) && (y1 !=3D (ssize_t) composite_image->rows)))
+         {
+@@ -6167,7 +6167,7 @@ static MagickBooleanType TraceArcPath(MVGInfo *mvg_i=
nfo,const PointInfo start,
+   else
+     if ((theta > 0.0) && (sweep =3D=3D MagickFalse))
+       theta-=3D2.0*MagickPI;
+-  arc_segments=3D(size_t) CastDoubleToSSizeT(ceil(fabs((double) (theta/(0=
.5*
++  arc_segments=3D(size_t) CastDoubleToLong(ceil(fabs((double) (theta/(0.5=
*
+     MagickPI+MagickEpsilon)))));
+   status=3DMagickTrue;
+   p=3Dprimitive_info;
+@@ -7517,7 +7517,7 @@ static PrimitiveInfo *TraceStrokePolygon(const DrawI=
nfo *draw_info,
+           theta.q=3Datan2(box_q[2].y-center.y,box_q[2].x-center.x);
+           if (theta.q < theta.p)
+             theta.q+=3D2.0*MagickPI;
+-          arc_segments=3D(size_t) CastDoubleToSSizeT(ceil((double) ((thet=
a.
++          arc_segments=3D(size_t) CastDoubleToLong(ceil((double) ((theta.
+             q-theta.p)/(2.0*sqrt(PerceptibleReciprocal(mid))))));
+           CheckPathExtent(MaxStrokePad,arc_segments+MaxStrokePad);
+           stroke_q[q].x=3Dbox_q[1].x;
+@@ -7590,7 +7590,7 @@ static PrimitiveInfo *TraceStrokePolygon(const DrawI=
nfo *draw_info,
+           theta.q=3Datan2(box_p[2].y-center.y,box_p[2].x-center.x);
+           if (theta.p < theta.q)
+             theta.p+=3D2.0*MagickPI;
+-          arc_segments=3D(size_t) CastDoubleToSSizeT(ceil((double) ((thet=
a.p-
++          arc_segments=3D(size_t) CastDoubleToLong(ceil((double) ((theta.=
p-
+             theta.q)/(2.0*sqrt((double) (1.0/mid))))));
+           CheckPathExtent(arc_segments+MaxStrokePad,MaxStrokePad);
+           stroke_p[p++]=3Dbox_p[1];
+diff --git a/MagickCore/effect.c b/MagickCore/effect.c
+index a37a1999e..bfb1363f2 100644
+--- a/MagickCore/effect.c
++++ b/MagickCore/effect.c
+@@ -288,7 +288,7 @@ MagickExport Image *AdaptiveBlurImage(const Image *ima=
ge,const double radius,
+         center,
+         j;
+=20
+-      j=3DCastDoubleToSSizeT(ceil((double) width*(1.0-QuantumScale*
++      j=3DCastDoubleToLong(ceil((double) width*(1.0-QuantumScale*
+         GetPixelIntensity(edge_image,r))-0.5));
+       if (j < 0)
+         j=3D0;
+@@ -609,7 +609,7 @@ MagickExport Image *AdaptiveSharpenImage(const Image *=
image,const double radius,
+         center,
+         j;
+=20
+-      j=3DCastDoubleToSSizeT(ceil((double) width*(1.0-QuantumScale*
++      j=3DCastDoubleToLong(ceil((double) width*(1.0-QuantumScale*
+         GetPixelIntensity(edge_image,r))-0.5));
+       if (j < 0)
+         j=3D0;
+@@ -2402,9 +2402,9 @@ MagickExport Image *MotionBlurImage(const Image *ima=
ge,const double radius,
+   point.y=3D(double) width*cos(DegreesToRadians(angle));
+   for (i=3D0; i < (ssize_t) width; i++)
+   {
+-    offset[i].x=3DCastDoubleToSSizeT(ceil((double) (i*point.y)/
++    offset[i].x=3DCastDoubleToLong(ceil((double) (i*point.y)/
+       hypot(point.x,point.y)-0.5));
+-    offset[i].y=3DCastDoubleToSSizeT(ceil((double) (i*point.x)/
++    offset[i].y=3DCastDoubleToLong(ceil((double) (i*point.x)/
+       hypot(point.x,point.y)-0.5));
+   }
+   /*
+diff --git a/MagickCore/gem.c b/MagickCore/gem.c
+index 4eb8c3fc5..2c5911f67 100644
+--- a/MagickCore/gem.c
++++ b/MagickCore/gem.c
+@@ -692,7 +692,7 @@ MagickPrivate void ConvertHWBToRGB(const double hue,co=
nst double whiteness,
+       *blue=3DQuantumRange*v;
+       return;
+     }
+-  i=3DCastDoubleToSSizeT(floor(6.0*hue));
++  i=3DCastDoubleToLong(floor(6.0*hue));
+   f=3D6.0*hue-i;
+   if ((i & 0x01) !=3D 0)
+     f=3D1.0-f;
+diff --git a/MagickCore/geometry.c b/MagickCore/geometry.c
+index dd46a96fc..e9a5981bd 100644
+--- a/MagickCore/geometry.c
++++ b/MagickCore/geometry.c
+@@ -241,7 +241,7 @@ MagickExport MagickStatusType GetGeometry(const char *=
geometry,ssize_t *x,
+               if (LocaleNCompare(p,"0x",2) =3D=3D 0)
+                 *width=3D(size_t) strtol(p,&p,10);
+               else
+-                *width=3DCastDoubleToSizeT(StringToDouble(p,&p));
++                *width=3DCastDoubleToUnsigned(StringToDouble(p,&p));
+             }
+           if (p !=3D q)
+             flags|=3DWidthValue;
+@@ -260,7 +260,7 @@ MagickExport MagickStatusType GetGeometry(const char *=
geometry,ssize_t *x,
+               */
+               q=3Dp;
+               if (height !=3D (size_t *) NULL)
+-                *height=3DCastDoubleToSizeT(StringToDouble(p,&p));
++                *height=3DCastDoubleToUnsigned(StringToDouble(p,&p));
+               if (p !=3D q)
+                 flags|=3DHeightValue;
+             }
+@@ -279,7 +279,7 @@ MagickExport MagickStatusType GetGeometry(const char *=
geometry,ssize_t *x,
+       }
+       q=3Dp;
+       if (x !=3D (ssize_t *) NULL)
+-        *x=3DCastDoubleToSSizeT(StringToDouble(p,&p));
++        *x=3DCastDoubleToLong(StringToDouble(p,&p));
+       if (p !=3D q)
+         {
+           flags|=3DXValue;
+@@ -300,7 +300,7 @@ MagickExport MagickStatusType GetGeometry(const char *=
geometry,ssize_t *x,
+       }
+       q=3Dp;
+       if (y !=3D (ssize_t *) NULL)
+-        *y=3DCastDoubleToSSizeT(StringToDouble(p,&p));
++        *y=3DCastDoubleToLong(StringToDouble(p,&p));
+       if (p !=3D q)
+         {
+           flags|=3DYValue;
+@@ -1285,8 +1285,8 @@ MagickExport MagickStatusType ParseGravityGeometry(c=
onst Image *image,
+       scale.y=3Dgeometry_info.sigma;
+       if ((status & SigmaValue) =3D=3D 0)
+         scale.y=3Dscale.x;
+-      region_info->width=3DCastDoubleToSizeT(scale.x*image->columns/100.0=
);
+-      region_info->height=3DCastDoubleToSizeT(scale.y*image->rows/100.0);
++      region_info->width=3DCastDoubleToUnsigned(scale.x*image->columns/10=
0.0);
++      region_info->height=3DCastDoubleToUnsigned(scale.y*image->rows/100.=
0);
+     }
+   if ((flags & AspectRatioValue) !=3D 0)
+     {
+@@ -1308,12 +1308,12 @@ MagickExport MagickStatusType ParseGravityGeometry=
(const Image *image,
+       if (geometry_ratio >=3D image_ratio)
+         {
+           region_info->width=3Dimage->columns;
+-          region_info->height=3DCastDoubleToSizeT((double) image->rows*im=
age_ratio/
++          region_info->height=3DCastDoubleToUnsigned((double) image->rows=
*image_ratio/
+             geometry_ratio);
+         }
+       else
+         {
+-          region_info->width=3DCastDoubleToSizeT((double) image->columns*
++          region_info->width=3DCastDoubleToUnsigned((double) image->colum=
ns*
+             geometry_ratio/image_ratio);
+           region_info->height=3Dimage->rows;
+         }
+@@ -1450,7 +1450,7 @@ MagickExport MagickStatusType ParseMetaGeometry(cons=
t char *geometry,ssize_t *x,
+         }
+       else
+         {
+-          *width=3DCastDoubleToSizeT(PerceptibleReciprocal(
++          *width=3DCastDoubleToUnsigned(PerceptibleReciprocal(
+             image_ratio)*former_width*geometry_ratio);
+           *height=3Dformer_height;
+         }
+diff --git a/MagickCore/image-private.h b/MagickCore/image-private.h
+index 694c19d54..8ce0208d5 100644
+--- a/MagickCore/image-private.h
++++ b/MagickCore/image-private.h
+@@ -53,40 +53,66 @@ extern "C" {
+ #define UndefinedCompressionQuality  0UL
+ #define UndefinedTicksPerSecond  100L
+=20
+-static inline QuantumAny CastDoubleToQuantumAny(const double x)
++static inline ssize_t CastDoubleToLong(const double x)
+ {
+   if (IsNaN(x) !=3D 0)
+-    return(0);
+-  if (x > ((double) ((QuantumAny) ~0)))
+-    return((QuantumAny) ~0);
+-  if (x < 0.0)
+-    return(0.0);
+-  return((QuantumAny) (x+0.5));
++    {
++      errno=3DERANGE;
++      return(0);
++    }
++  if (floor(x) > ((double) MAGICK_SSIZE_MAX-1))
++    {
++      errno=3DERANGE;
++      return((ssize_t) MAGICK_SSIZE_MAX);
++    }
++  if (ceil(x) < ((double) MAGICK_SSIZE_MIN+1))
++    {
++      errno=3DERANGE;
++      return((ssize_t) MAGICK_SSIZE_MIN);
++    }
++  return((ssize_t) x);
+ }
+=20
+-static inline size_t CastDoubleToSizeT(const double x)
++static inline QuantumAny CastDoubleToQuantumAny(const double x)
+ {
+   if (IsNaN(x) !=3D 0)
+-    return(0);
+-  if (x > ((double) MAGICK_SIZE_MAX+0.5))
+-    return((size_t) MAGICK_SIZE_MAX);
+-  return((size_t) floor(x+0.5));
++    {
++      errno=3DERANGE;
++      return(0);
++    }
++  if (x > ((double) ((QuantumAny) ~0)))
++    {
++      errno=3DERANGE;
++      return((QuantumAny) ~0);
++    }
++  if (x < 0.0)
++    {
++      errno=3DERANGE;
++      return((QuantumAny) 0);
++    }
++  return((QuantumAny) (x+0.5));
+ }
+=20
+-static inline ssize_t CastDoubleToSSizeT(const double x)
++static inline size_t CastDoubleToUnsigned(const double x)
+ {
+   if (IsNaN(x) !=3D 0)
+-    return(0);
+-  if (x > ((double) MAGICK_SSIZE_MAX+0.5))
+-    return((ssize_t) MAGICK_SSIZE_MAX);
+-  if (x < ((double) MAGICK_SSIZE_MIN-0.5))
+-    return((ssize_t) MAGICK_SSIZE_MIN);
+-  if (x >=3D 0.0)
+-    return((ssize_t) floor(x+0.5));
+-  return((ssize_t) ceil(x-0.5));
++    {
++      errno=3DERANGE;
++      return(0);
++    }
++  if (floor(x) > ((double) MAGICK_SSIZE_MAX-1))
++    {
++      errno=3DERANGE;
++      return((size_t) MAGICK_SIZE_MAX);
++    }
++  if (ceil(x) < 0.0)
++    {
++      errno=3DERANGE;
++      return(0);
++    }
++  return((size_t) x);
+ }
+=20
+-
+ static inline double DegreesToRadians(const double degrees)
+ {
+   return((double) (MagickPI*degrees/180.0));
+diff --git a/MagickCore/image.c b/MagickCore/image.c
+index 7b8caa0d2..3e6fdd114 100644
+--- a/MagickCore/image.c
++++ b/MagickCore/image.c
+@@ -282,21 +282,21 @@ MagickExport Image *AcquireImage(const ImageInfo *im=
age_info,
+       if ((flags & GreaterValue) !=3D 0)
+         {
+           if ((double) image->delay > floor(geometry_info.rho+0.5))
+-            image->delay=3D(size_t) CastDoubleToSSizeT(floor(
++            image->delay=3D(size_t) CastDoubleToLong(floor(
+               geometry_info.rho+0.5));
+         }
+       else
+         if ((flags & LessValue) !=3D 0)
+           {
+             if ((double) image->delay < floor(geometry_info.rho+0.5))
+-              image->ticks_per_second=3DCastDoubleToSSizeT(floor(
++              image->ticks_per_second=3DCastDoubleToLong(floor(
+                 geometry_info.sigma+0.5));
+           }
+         else
+-          image->delay=3D(size_t) CastDoubleToSSizeT(floor(
++          image->delay=3D(size_t) CastDoubleToLong(floor(
+             geometry_info.rho+0.5));
+       if ((flags & SigmaValue) !=3D 0)
+-        image->ticks_per_second=3DCastDoubleToSSizeT(floor(
++        image->ticks_per_second=3DCastDoubleToLong(floor(
+           geometry_info.sigma+0.5));
+     }
+   option=3DGetImageOption(image_info,"dispose");
+@@ -881,18 +881,18 @@ MagickExport Image *CloneImage(const Image *image,co=
nst size_t columns,
+   scale=3D1.0;
+   if (image->columns !=3D 0)
+     scale=3D(double) columns/(double) image->columns;
+-  clone_image->page.width=3D(size_t) CastDoubleToSSizeT(floor(scale*
++  clone_image->page.width=3D(size_t) CastDoubleToLong(floor(scale*
+     image->page.width+0.5));
+-  clone_image->page.x=3DCastDoubleToSSizeT(ceil(scale*image->page.x-0.5))=
;
+-  clone_image->tile_offset.x=3DCastDoubleToSSizeT(ceil(scale*
++  clone_image->page.x=3DCastDoubleToLong(ceil(scale*image->page.x-0.5));
++  clone_image->tile_offset.x=3DCastDoubleToLong(ceil(scale*
+     image->tile_offset.x-0.5));
+   scale=3D1.0;
+   if (image->rows !=3D 0)
+     scale=3D(double) rows/(double) image->rows;
+-  clone_image->page.height=3D(size_t) CastDoubleToSSizeT(floor(scale*
++  clone_image->page.height=3D(size_t) CastDoubleToLong(floor(scale*
+     image->page.height+0.5));
+-  clone_image->page.y=3DCastDoubleToSSizeT(ceil(scale*image->page.y-0.5))=
;
+-  clone_image->tile_offset.y=3DCastDoubleToSSizeT(ceil(scale*
++  clone_image->page.y=3DCastDoubleToLong(ceil(scale*image->page.y-0.5));
++  clone_image->tile_offset.y=3DCastDoubleToLong(ceil(scale*
+     image->tile_offset.y-0.5));
+   clone_image->cache=3DClonePixelCache(image->cache);
+   if (SetImageExtent(clone_image,columns,rows,exception) =3D=3D MagickFal=
se)
+diff --git a/MagickCore/pixel.c b/MagickCore/pixel.c
+index c2aea7c1d..5c1c5296f 100644
+--- a/MagickCore/pixel.c
++++ b/MagickCore/pixel.c
+@@ -4515,8 +4515,8 @@ MagickExport MagickBooleanType InterpolatePixelChann=
el(
+   status=3DMagickTrue;
+   *pixel=3D0.0;
+   traits=3DGetPixelChannelTraits(image,channel);
+-  x_offset=3DCastDoubleToSSizeT(floor(x));
+-  y_offset=3DCastDoubleToSSizeT(floor(y));
++  x_offset=3DCastDoubleToLong(floor(x));
++  y_offset=3DCastDoubleToLong(floor(y));
+   interpolate=3Dmethod;
+   if (interpolate =3D=3D UndefinedInterpolatePixel)
+     interpolate=3Dimage->interpolate;
+@@ -4533,8 +4533,8 @@ MagickExport MagickBooleanType InterpolatePixelChann=
el(
+       if (interpolate =3D=3D Average9InterpolatePixel)
+         {
+           count=3D3;
+-          x_offset=3DCastDoubleToSSizeT(floor(x+0.5)-1.0);
+-          y_offset=3DCastDoubleToSSizeT(floor(y+0.5)-1.0);
++          x_offset=3DCastDoubleToLong(floor(x+0.5)-1.0);
++          y_offset=3DCastDoubleToLong(floor(y+0.5)-1.0);
+         }
+       else
+         if (interpolate =3D=3D Average16InterpolatePixel)
+@@ -4717,8 +4717,8 @@ MagickExport MagickBooleanType InterpolatePixelChann=
el(
+     }
+     case NearestInterpolatePixel:
+     {
+-      x_offset=3DCastDoubleToSSizeT(floor(x+0.5));
+-      y_offset=3DCastDoubleToSSizeT(floor(y+0.5));
++      x_offset=3DCastDoubleToLong(floor(x+0.5));
++      y_offset=3DCastDoubleToLong(floor(y+0.5));
+       p=3DGetCacheViewVirtualPixels(image_view,x_offset,y_offset,1,1,exce=
ption);
+       if (p =3D=3D (const Quantum *) NULL)
+         {
+@@ -4935,8 +4935,8 @@ MagickExport MagickBooleanType InterpolatePixelChann=
els(
+   assert(source->signature =3D=3D MagickCoreSignature);
+   assert(source_view !=3D (CacheView *) NULL);
+   status=3DMagickTrue;
+-  x_offset=3DCastDoubleToSSizeT(floor(x));
+-  y_offset=3DCastDoubleToSSizeT(floor(y));
++  x_offset=3DCastDoubleToLong(floor(x));
++  y_offset=3DCastDoubleToLong(floor(y));
+   interpolate=3Dmethod;
+   if (interpolate =3D=3D UndefinedInterpolatePixel)
+     interpolate=3Dsource->interpolate;
+@@ -4953,8 +4953,8 @@ MagickExport MagickBooleanType InterpolatePixelChann=
els(
+       if (interpolate =3D=3D Average9InterpolatePixel)
+         {
+           count=3D3;
+-          x_offset=3DCastDoubleToSSizeT(floor(x+0.5)-1.0);
+-          y_offset=3DCastDoubleToSSizeT(floor(y+0.5)-1.0);
++          x_offset=3DCastDoubleToLong(floor(x+0.5)-1.0);
++          y_offset=3DCastDoubleToLong(floor(y+0.5)-1.0);
+         }
+       else
+         if (interpolate =3D=3D Average16InterpolatePixel)
+@@ -5218,8 +5218,8 @@ MagickExport MagickBooleanType InterpolatePixelChann=
els(
+     }
+     case NearestInterpolatePixel:
+     {
+-      x_offset=3DCastDoubleToSSizeT(floor(x+0.5));
+-      y_offset=3DCastDoubleToSSizeT(floor(y+0.5));
++      x_offset=3DCastDoubleToLong(floor(x+0.5));
++      y_offset=3DCastDoubleToLong(floor(y+0.5));
+       p=3DGetCacheViewVirtualPixels(source_view,x_offset,y_offset,1,1,exc=
eption);
+       if (p =3D=3D (const Quantum *) NULL)
+         {
+@@ -5502,8 +5502,8 @@ MagickExport MagickBooleanType InterpolatePixelInfo(=
const Image *image,
+   assert(image->signature =3D=3D MagickCoreSignature);
+   assert(image_view !=3D (CacheView *) NULL);
+   status=3DMagickTrue;
+-  x_offset=3DCastDoubleToSSizeT(floor(x));
+-  y_offset=3DCastDoubleToSSizeT(floor(y));
++  x_offset=3DCastDoubleToLong(floor(x));
++  y_offset=3DCastDoubleToLong(floor(y));
+   interpolate=3Dmethod;
+   if (interpolate =3D=3D UndefinedInterpolatePixel)
+     interpolate=3Dimage->interpolate;
+@@ -5522,8 +5522,8 @@ MagickExport MagickBooleanType InterpolatePixelInfo(=
const Image *image,
+       if (interpolate =3D=3D Average9InterpolatePixel)
+         {
+           count=3D3;
+-          x_offset=3DCastDoubleToSSizeT(floor(x+0.5)-1.0);
+-          y_offset=3DCastDoubleToSSizeT(floor(y+0.5)-1.0);
++          x_offset=3DCastDoubleToLong(floor(x+0.5)-1.0);
++          y_offset=3DCastDoubleToLong(floor(y+0.5)-1.0);
+         }
+       else if (interpolate =3D=3D Average16InterpolatePixel)
+         {
+@@ -5847,8 +5847,8 @@ MagickExport MagickBooleanType InterpolatePixelInfo(=
const Image *image,
+     }
+     case NearestInterpolatePixel:
+     {
+-      x_offset=3DCastDoubleToSSizeT(floor(x+0.5));
+-      y_offset=3DCastDoubleToSSizeT(floor(y+0.5));
++      x_offset=3DCastDoubleToLong(floor(x+0.5));
++      y_offset=3DCastDoubleToLong(floor(y+0.5));
+       p=3DGetCacheViewVirtualPixels(image_view,x_offset,y_offset,1,1,exce=
ption);
+       if (p =3D=3D (const Quantum *) NULL)
+         {
+diff --git a/MagickCore/property.c b/MagickCore/property.c
+index b13fa7a17..1b42adaee 100644
+--- a/MagickCore/property.c
++++ b/MagickCore/property.c
+@@ -4372,13 +4372,13 @@ MagickExport MagickBooleanType SetImageProperty(Im=
age *image,
+             if ((flags & LessValue) !=3D 0)
+               {
+                 if ((double) image->delay < floor(geometry_info.rho+0.5))
+-                  image->delay=3DCastDoubleToSSizeT(
++                  image->delay=3DCastDoubleToLong(
+                     floor(geometry_info.sigma+0.5));
+               }
+             else
+               image->delay=3D(size_t) floor(geometry_info.rho+0.5);
+           if ((flags & SigmaValue) !=3D 0)
+-            image->ticks_per_second=3DCastDoubleToSSizeT(floor(
++            image->ticks_per_second=3DCastDoubleToLong(floor(
+               geometry_info.sigma+0.5));
+           return(MagickTrue);
+         }
+diff --git a/MagickCore/shear.c b/MagickCore/shear.c
+index 62a98013e..05703ca34 100644
+--- a/MagickCore/shear.c
++++ b/MagickCore/shear.c
+@@ -163,10 +163,10 @@ static MagickBooleanType CropToFitImage(Image **imag=
e,
+     if (max.y < extent[i].y)
+       max.y=3Dextent[i].y;
+   }
+-  geometry.x=3DCastDoubleToSSizeT(ceil(min.x-0.5));
+-  geometry.y=3DCastDoubleToSSizeT(ceil(min.y-0.5));
+-  geometry.width=3D(size_t) CastDoubleToSSizeT(floor(max.x-min.x+0.5));
+-  geometry.height=3D(size_t) CastDoubleToSSizeT(floor(max.y-min.y+0.5));
++  geometry.x=3DCastDoubleToLong(ceil(min.x-0.5));
++  geometry.y=3DCastDoubleToLong(ceil(min.y-0.5));
++  geometry.width=3D(size_t) CastDoubleToLong(floor(max.x-min.x+0.5));
++  geometry.height=3D(size_t) CastDoubleToLong(floor(max.y-min.y+0.5));
+   page=3D(*image)->page;
+   (void) ParseAbsoluteGeometry("0x0+0+0",&(*image)->page);
+   crop_image=3DCropImage(*image,&geometry,exception);
+@@ -1217,7 +1217,7 @@ static MagickBooleanType XShearImage(Image *image,co=
nst double degrees,
+         displacement*=3D(-1.0);
+         direction=3DLEFT;
+       }
+-    step=3DCastDoubleToSSizeT(floor((double) displacement));
++    step=3DCastDoubleToLong(floor((double) displacement));
+     area=3D(double) (displacement-step);
+     step++;
+     pixel=3Dbackground;
+@@ -1434,7 +1434,7 @@ static MagickBooleanType YShearImage(Image *image,co=
nst double degrees,
+         displacement*=3D(-1.0);
+         direction=3DUP;
+       }
+-    step=3DCastDoubleToSSizeT(floor((double) displacement));
++    step=3DCastDoubleToLong(floor((double) displacement));
+     area=3D(double) (displacement-step);
+     step++;
+     pixel=3Dbackground;
+@@ -1617,11 +1617,11 @@ MagickExport Image *ShearImage(const Image *image,=
const double x_shear,
+   /*
+     Compute image size.
+   */
+-  bounds.width=3Dimage->columns+CastDoubleToSSizeT(floor(fabs(shear.x)*
++  bounds.width=3Dimage->columns+CastDoubleToLong(floor(fabs(shear.x)*
+     image->rows+0.5));
+-  bounds.x=3DCastDoubleToSSizeT(ceil((double) image->columns+((fabs(shear=
.x)*
++  bounds.x=3DCastDoubleToLong(ceil((double) image->columns+((fabs(shear.x=
)*
+     image->rows)-image->columns)/2.0-0.5));
+-  bounds.y=3DCastDoubleToSSizeT(ceil((double) image->rows+((fabs(shear.y)=
*
++  bounds.y=3DCastDoubleToLong(ceil((double) image->rows+((fabs(shear.y)*
+     bounds.width)-image->rows)/2.0-0.5));
+   /*
+     Surround image with border.
+@@ -1770,9 +1770,9 @@ MagickExport Image *ShearRotateImage(const Image *im=
age,const double degrees,
+   bounds.height=3D(size_t) floor(fabs((double) bounds.width*shear.y)+heig=
ht+0.5);
+   shear_width=3D(size_t) floor(fabs((double) bounds.height*shear.x)+
+     bounds.width+0.5);
+-  bounds.x=3DCastDoubleToSSizeT(floor((double) ((shear_width > bounds.wid=
th) ?
++  bounds.x=3DCastDoubleToLong(floor((double) ((shear_width > bounds.width=
) ?
+     width : bounds.width-shear_width+2)/2.0+0.5));
+-  bounds.y=3DCastDoubleToSSizeT(floor(((double) bounds.height-height+2)/2=
.0+0.5));
++  bounds.y=3DCastDoubleToLong(floor(((double) bounds.height-height+2)/2.0=
+0.5));
+   /*
+     Surround image with a border.
+   */
+diff --git a/MagickCore/transform.c b/MagickCore/transform.c
+index 6afe0a3de..385d5eb68 100644
+--- a/MagickCore/transform.c
++++ b/MagickCore/transform.c
+@@ -773,8 +773,8 @@ static inline ssize_t PixelRoundOffset(double x)
+     Round the fraction to nearest integer.
+   */
+   if ((x-floor(x)) < (ceil(x)-x))
+-    return(CastDoubleToSSizeT(floor(x)));
+-  return(CastDoubleToSSizeT(ceil(x)));
++    return(CastDoubleToLong(floor(x)));
++  return(CastDoubleToLong(ceil(x)));
+ }
+=20
+ MagickExport Image *CropImageToTiles(const Image *image,
+diff --git a/MagickCore/visual-effects.c b/MagickCore/visual-effects.c
+index 069904a08..789660231 100644
+--- a/MagickCore/visual-effects.c
++++ b/MagickCore/visual-effects.c
+@@ -1439,8 +1439,8 @@ static MagickBooleanType PlasmaImageProxy(Image *ima=
ge,CacheView *image_view,
+       */
+       depth--;
+       attenuate++;
+-      x_mid=3DCastDoubleToSSizeT(ceil((segment->x1+segment->x2)/2-0.5));
+-      y_mid=3DCastDoubleToSSizeT(ceil((segment->y1+segment->y2)/2-0.5));
++      x_mid=3DCastDoubleToLong(ceil((segment->x1+segment->x2)/2-0.5));
++      y_mid=3DCastDoubleToLong(ceil((segment->y1+segment->y2)/2-0.5));
+       local_info=3D(*segment);
+       local_info.x2=3D(double) x_mid;
+       local_info.y2=3D(double) y_mid;
+@@ -1463,8 +1463,8 @@ static MagickBooleanType PlasmaImageProxy(Image *ima=
ge,CacheView *image_view,
+         &local_info,attenuate,depth,exception);
+       return(status =3D=3D 0 ? MagickFalse : MagickTrue);
+     }
+-  x_mid=3DCastDoubleToSSizeT(ceil((segment->x1+segment->x2)/2-0.5));
+-  y_mid=3DCastDoubleToSSizeT(ceil((segment->y1+segment->y2)/2-0.5));
++  x_mid=3DCastDoubleToLong(ceil((segment->x1+segment->x2)/2-0.5));
++  y_mid=3DCastDoubleToLong(ceil((segment->y1+segment->y2)/2-0.5));
+   if ((fabs(segment->x1-x_mid) < MagickEpsilon) &&
+       (fabs(segment->x2-x_mid) < MagickEpsilon) &&
+       (fabs(segment->y1-y_mid) < MagickEpsilon) &&
+@@ -1481,10 +1481,10 @@ static MagickBooleanType PlasmaImageProxy(Image *i=
mage,CacheView *image_view,
+       /*
+         Left pixel.
+       */
+-      x=3DCastDoubleToSSizeT(ceil(segment->x1-0.5));
+-      u=3DGetCacheViewVirtualPixels(u_view,x,CastDoubleToSSizeT(ceil(
++      x=3DCastDoubleToLong(ceil(segment->x1-0.5));
++      u=3DGetCacheViewVirtualPixels(u_view,x,CastDoubleToLong(ceil(
+         segment->y1-0.5)),1,1,exception);
+-      v=3DGetCacheViewVirtualPixels(v_view,x,CastDoubleToSSizeT(ceil(
++      v=3DGetCacheViewVirtualPixels(v_view,x,CastDoubleToLong(ceil(
+         segment->y2-0.5)),1,1,exception);
+       q=3DQueueCacheViewAuthenticPixels(image_view,x,y_mid,1,1,exception)=
;
+       if ((u =3D=3D (const Quantum *) NULL) || (v =3D=3D (const Quantum *=
) NULL) ||
+@@ -1504,10 +1504,10 @@ static MagickBooleanType PlasmaImageProxy(Image *i=
mage,CacheView *image_view,
+           /*
+             Right pixel.
+           */
+-          x=3DCastDoubleToSSizeT(ceil(segment->x2-0.5));
+-          u=3DGetCacheViewVirtualPixels(u_view,x,CastDoubleToSSizeT(ceil(
++          x=3DCastDoubleToLong(ceil(segment->x2-0.5));
++          u=3DGetCacheViewVirtualPixels(u_view,x,CastDoubleToLong(ceil(
+             segment->y1-0.5)),1,1,exception);
+-          v=3DGetCacheViewVirtualPixels(v_view,x,CastDoubleToSSizeT(ceil(
++          v=3DGetCacheViewVirtualPixels(v_view,x,CastDoubleToLong(ceil(
+             segment->y2-0.5)),1,1,exception);
+           q=3DQueueCacheViewAuthenticPixels(image_view,x,y_mid,1,1,except=
ion);
+           if ((u =3D=3D (const Quantum *) NULL) || (v =3D=3D (const Quant=
um *) NULL) ||
+@@ -1533,10 +1533,10 @@ static MagickBooleanType PlasmaImageProxy(Image *i=
mage,CacheView *image_view,
+           /*
+             Bottom pixel.
+           */
+-          y=3DCastDoubleToSSizeT(ceil(segment->y2-0.5));
+-          u=3DGetCacheViewVirtualPixels(u_view,CastDoubleToSSizeT(ceil(
++          y=3DCastDoubleToLong(ceil(segment->y2-0.5));
++          u=3DGetCacheViewVirtualPixels(u_view,CastDoubleToLong(ceil(
+             segment->x1-0.5)),y,1,1,exception);
+-          v=3DGetCacheViewVirtualPixels(v_view,CastDoubleToSSizeT(ceil(
++          v=3DGetCacheViewVirtualPixels(v_view,CastDoubleToLong(ceil(
+             segment->x2-0.5)),y,1,1,exception);
+           q=3DQueueCacheViewAuthenticPixels(image_view,x_mid,y,1,1,except=
ion);
+           if ((u =3D=3D (const Quantum *) NULL) || (v =3D=3D (const Quant=
um *) NULL) ||
+@@ -1557,10 +1557,10 @@ static MagickBooleanType PlasmaImageProxy(Image *i=
mage,CacheView *image_view,
+           /*
+             Top pixel.
+           */
+-          y=3DCastDoubleToSSizeT(ceil(segment->y1-0.5));
+-          u=3DGetCacheViewVirtualPixels(u_view,CastDoubleToSSizeT(ceil(
++          y=3DCastDoubleToLong(ceil(segment->y1-0.5));
++          u=3DGetCacheViewVirtualPixels(u_view,CastDoubleToLong(ceil(
+             segment->x1-0.5)),y,1,1,exception);
+-          v=3DGetCacheViewVirtualPixels(v_view,CastDoubleToSSizeT(ceil(
++          v=3DGetCacheViewVirtualPixels(v_view,CastDoubleToLong(ceil(
+             segment->x2-0.5)),y,1,1,exception);
+           q=3DQueueCacheViewAuthenticPixels(image_view,x_mid,y,1,1,except=
ion);
+           if ((u =3D=3D (const Quantum *) NULL) || (v =3D=3D (const Quant=
um *) NULL) ||
+@@ -1583,11 +1583,11 @@ static MagickBooleanType PlasmaImageProxy(Image *i=
mage,CacheView *image_view,
+       /*
+         Middle pixel.
+       */
+-      x=3DCastDoubleToSSizeT(ceil(segment->x1-0.5));
+-      y=3DCastDoubleToSSizeT(ceil(segment->y1-0.5));
++      x=3DCastDoubleToLong(ceil(segment->x1-0.5));
++      y=3DCastDoubleToLong(ceil(segment->y1-0.5));
+       u=3DGetCacheViewVirtualPixels(u_view,x,y,1,1,exception);
+-      x=3DCastDoubleToSSizeT(ceil(segment->x2-0.5));
+-      y=3DCastDoubleToSSizeT(ceil(segment->y2-0.5));
++      x=3DCastDoubleToLong(ceil(segment->x2-0.5));
++      y=3DCastDoubleToLong(ceil(segment->y2-0.5));
+       v=3DGetCacheViewVirtualPixels(v_view,x,y,1,1,exception);
+       q=3DQueueCacheViewAuthenticPixels(image_view,x_mid,y_mid,1,1,except=
ion);
+       if ((u =3D=3D (const Quantum *) NULL) || (v =3D=3D (const Quantum *=
) NULL) ||
+diff --git a/MagickWand/drawing-wand.c b/MagickWand/drawing-wand.c
+index 002798ba0..cc1fbc640 100644
+--- a/MagickWand/drawing-wand.c
++++ b/MagickWand/drawing-wand.c
+@@ -4285,10 +4285,10 @@ WandExport MagickBooleanType DrawPushPattern(Drawi=
ngWand *wand,
+     x,y,width,height);
+   wand->indent_depth++;
+   wand->pattern_id=3DAcquireString(pattern_id);
+-  wand->pattern_bounds.x=3DCastDoubleToSSizeT(ceil(x-0.5));
+-  wand->pattern_bounds.y=3DCastDoubleToSSizeT(ceil(y-0.5));
+-  wand->pattern_bounds.width=3D(size_t) CastDoubleToSSizeT(floor(width+0.=
5));
+-  wand->pattern_bounds.height=3D(size_t) CastDoubleToSSizeT(floor(height+=
0.5));
++  wand->pattern_bounds.x=3DCastDoubleToLong(ceil(x-0.5));
++  wand->pattern_bounds.y=3DCastDoubleToLong(ceil(y-0.5));
++  wand->pattern_bounds.width=3D(size_t) CastDoubleToLong(floor(width+0.5)=
);
++  wand->pattern_bounds.height=3D(size_t) CastDoubleToLong(floor(height+0.=
5));
+   wand->pattern_offset=3Dwand->mvg_length;
+   return(MagickTrue);
+ }
+diff --git a/coders/histogram.c b/coders/histogram.c
+index 15ee9772d..0df364c12 100644
+--- a/coders/histogram.c
++++ b/coders/histogram.c
+@@ -295,7 +295,7 @@ static MagickBooleanType WriteHISTOGRAMImage(const Ima=
geInfo *image_info,
+       break;
+     if ((GetPixelRedTraits(image) & UpdatePixelTrait) !=3D 0)
+       {
+-        y=3DCastDoubleToSSizeT(ceil((double) histogram_image->rows-scale*
++        y=3DCastDoubleToLong(ceil((double) histogram_image->rows-scale*
+           histogram[x].red-0.5));
+         r=3Dq+y*GetPixelChannels(histogram_image);
+         for ( ; y < (ssize_t) histogram_image->rows; y++)
+@@ -306,7 +306,7 @@ static MagickBooleanType WriteHISTOGRAMImage(const Ima=
geInfo *image_info,
+       }
+     if ((GetPixelGreenTraits(image) & UpdatePixelTrait) !=3D 0)
+       {
+-        y=3DCastDoubleToSSizeT(ceil((double) histogram_image->rows-scale*
++        y=3DCastDoubleToLong(ceil((double) histogram_image->rows-scale*
+           histogram[x].green-0.5));
+         r=3Dq+y*GetPixelChannels(histogram_image);
+         for ( ; y < (ssize_t) histogram_image->rows; y++)
+@@ -317,7 +317,7 @@ static MagickBooleanType WriteHISTOGRAMImage(const Ima=
geInfo *image_info,
+       }
+     if ((GetPixelBlueTraits(image) & UpdatePixelTrait) !=3D 0)
+       {
+-        y=3DCastDoubleToSSizeT(ceil((double) histogram_image->rows-scale*
++        y=3DCastDoubleToLong(ceil((double) histogram_image->rows-scale*
+           histogram[x].blue-0.5));
+         r=3Dq+y*GetPixelChannels(histogram_image);
+         for ( ; y < (ssize_t) histogram_image->rows; y++)
+diff --git a/coders/icon.c b/coders/icon.c
+index 2ccbc82b1..f54225ff9 100644
+--- a/coders/icon.c
++++ b/coders/icon.c
+@@ -227,6 +227,7 @@ static Image *ReadICONImage(const ImageInfo *image_inf=
o,
+       image=3DDestroyImageList(image);
+       return((Image *) NULL);
+     }
++  (void) memset(&icon_file,0,sizeof(icon_file));
+   icon_file.reserved=3D(short) ReadBlobLSBShort(image);
+   icon_file.resource_type=3D(short) ReadBlobLSBShort(image);
+   icon_file.count=3D(short) ReadBlobLSBShort(image);
+diff --git a/coders/pcl.c b/coders/pcl.c
+index 8197a0c39..8056ae0c9 100644
+--- a/coders/pcl.c
++++ b/coders/pcl.c
+@@ -294,8 +294,8 @@ static Image *ReadPCLImage(const ImageInfo *image_info=
,ExceptionInfo *exception)
+     /*
+       Set PCL render geometry.
+     */
+-    width=3D(size_t) floor(bounds.x2-bounds.x1+0.5);
+-    height=3D(size_t) floor(bounds.y2-bounds.y1+0.5);
++    width=3D(size_t) CastDoubleToLong(floor(bounds.x2-bounds.x1+0.5));
++    height=3D(size_t) CastDoubleToLong(floor(bounds.y2-bounds.y1+0.5));
+     if (width > page.width)
+       page.width=3Dwidth;
+     if (height > page.height)
+diff --git a/coders/tiff.c b/coders/tiff.c
+index a0bdd6313..68a6d5b09 100644
+--- a/coders/tiff.c
++++ b/coders/tiff.c
+@@ -1506,9 +1506,9 @@ static Image *ReadTIFFImage(const ImageInfo *image_i=
nfo,
+     if ((TIFFGetFieldDefaulted(tiff,TIFFTAG_XPOSITION,&x_position,sans) =
=3D=3D 1) &&
+         (TIFFGetFieldDefaulted(tiff,TIFFTAG_YPOSITION,&y_position,sans) =
=3D=3D 1))
+       {
+-        image->page.x=3DCastDoubleToSSizeT(ceil(x_position*
++        image->page.x=3DCastDoubleToLong(ceil(x_position*
+           image->resolution.x-0.5));
+-        image->page.y=3DCastDoubleToSSizeT(ceil(y_position*
++        image->page.y=3DCastDoubleToLong(ceil(y_position*
+           image->resolution.y-0.5));
+       }
+     if (TIFFGetFieldDefaulted(tiff,TIFFTAG_ORIENTATION,&orientation,sans)=
 =3D=3D 1)
+diff --git a/coders/txt.c b/coders/txt.c
+index 91323583d..f8312a4fd 100644
+--- a/coders/txt.c
++++ b/coders/txt.c
+@@ -273,7 +273,7 @@ static Image *ReadTEXTImage(const ImageInfo *image_inf=
o,
+       draw_info=3DDestroyDrawInfo(draw_info);
+       ThrowReaderException(TypeError,"UnableToGetTypeMetrics");
+     }
+-  page.y=3DCastDoubleToSSizeT(ceil((double) page.y+metrics.ascent-0.5));
++  page.y=3DCastDoubleToLong(ceil((double) page.y+metrics.ascent-0.5));
+   (void) FormatLocaleString(geometry,MagickPathExtent,"%gx%g%+g%+g",(doub=
le)
+     image->columns,(double) image->rows,(double) page.x,(double) page.y);
+   (void) CloneString(&draw_info->geometry,geometry);
+@@ -574,7 +574,7 @@ static Image *ReadTXTImage(const ImageInfo *image_info=
,ExceptionInfo *exception)
+           black),range);
+         pixel.alpha=3D(MagickRealType) ScaleAnyToQuantum(CastDoubleToQuan=
tumAny(
+           alpha),range);
+-        q=3DGetAuthenticPixels(image,CastDoubleToSSizeT(x_offset),CastDou=
bleToSSizeT(
++        q=3DGetAuthenticPixels(image,CastDoubleToLong(x_offset),CastDoubl=
eToLong(
+           y_offset),1,1,exception);
+         if (q =3D=3D (Quantum *) NULL)
+           {
+diff --git a/configure b/configure
+index 0b3c67e72..85aade112 100755
+--- a/configure
++++ b/configure
+@@ -4552,7 +4552,7 @@ MAGICK_PATCHLEVEL_VERSION=3D62
+=20
+ MAGICK_VERSION=3D7.0.10-62
+=20
+-MAGICK_GIT_REVISION=3D18417:ff04e172d:20210207
++MAGICK_GIT_REVISION=3Dfecfed4d0:20230414
+=20
+=20
+ # Substitute library versioning
+@@ -25948,9 +25948,9 @@ ac_compiler_gnu=3D$ac_cv_cxx_compiler_gnu
+=20
+      cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+-       int f(int  x){return 1;}
+-                        int f(char x){return 1;}
+-                        int f(bool x){return 1;}
++       int f(int  x){return x;}
++                        int f(char x){return x =3D=3D '\1' ? 1 : 0;}
++                        int f(bool x){return x ? 1 : 0;}
+ int
+ main ()
+ {
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Fix=
-CVE-2023-34151.patch b/meta-oe/recipes-support/imagemagick/files/0011-Imag=
eMagick-Fix-CVE-2023-34151.patch
new file mode 100644
index 0000000000..d0edd01f13
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0011-ImageMagick-Fix-CVE-20=
23-34151.patch
@@ -0,0 +1,314 @@
+From 3fb6d745e0817dd4c7ec31e929bfade8a7506bf5 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Tue, 2 Dec 2025 21:55:47 +0530
+Subject: [PATCH 18/18] ImageMagick: Fix CVE-2023-34151
+
+CVE: CVE-2023-34151
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/3d6d98d8a2be30d74172ab43b5b8e874d2deb158]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ MagickCore/annotate.c       |  4 ++--
+ MagickCore/draw.c           |  2 +-
+ MagickCore/geometry.c       |  4 ++--
+ MagickCore/shear.c          |  6 +++---
+ MagickCore/visual-effects.c |  4 ++--
+ coders/caption.c            | 10 +++++-----
+ coders/label.c              | 10 +++++-----
+ coders/pcl.c                |  4 ++--
+ coders/pdf.c                |  4 ++--
+ coders/png.c                | 12 ++++++------
+ coders/ps.c                 |  4 ++--
+ coders/ps2.c                |  4 ++--
+ coders/ps3.c                |  4 ++--
+ coders/svg.c                |  4 ++--
+ 14 files changed, 38 insertions(+), 38 deletions(-)
+
+diff --git a/MagickCore/annotate.c b/MagickCore/annotate.c
+index 4be938be5..3e8f3aa1b 100644
+--- a/MagickCore/annotate.c
++++ b/MagickCore/annotate.c
+@@ -336,7 +336,7 @@ MagickExport MagickBooleanType AnnotateImage(Image *im=
age,
+     (void) CloneString(&annotate->text,textlist[i]);
+     if ((metrics.width =3D=3D 0) || (annotate->gravity !=3D NorthWestGrav=
ity))
+       (void) GetTypeMetrics(image,annotate,&metrics,exception);
+-    height=3D(size_t) floor(metrics.ascent-metrics.descent+0.5);
++    height=3DCastDoubleToUnsigned(metrics.ascent-metrics.descent+0.5);
+     if (height =3D=3D 0)
+       height=3Ddraw_info->pointsize;
+     height+=3D(size_t) floor(draw_info->interline_spacing+0.5);
+@@ -626,7 +626,7 @@ MagickExport ssize_t FormatMagickCaption(Image *image,=
DrawInfo *draw_info,
+     status=3DGetTypeMetrics(image,draw_info,metrics,exception);
+     if (status =3D=3D MagickFalse)
+       break;
+-    width=3D(size_t) floor(metrics->width+draw_info->stroke_width+0.5);
++    width=3DCastDoubleToUnsigned(metrics->width+draw_info->stroke_width+0=
.5);
+     if (width <=3D image->columns)
+       continue;
+     if (s !=3D (char *) NULL)
+diff --git a/MagickCore/draw.c b/MagickCore/draw.c
+index facea115e..54286130a 100644
+--- a/MagickCore/draw.c
++++ b/MagickCore/draw.c
+@@ -3478,7 +3478,7 @@ static MagickBooleanType RenderMVGContent(Image *ima=
ge,
+                 (void) GetNextToken(q,&q,extent,token);
+                 if (*token =3D=3D ',')
+                   (void) GetNextToken(q,&q,extent,token);
+-                bounds.height=3D(size_t) floor(GetDrawValue(token,&next_t=
oken)+
++                bounds.height=3DCastDoubleToUnsigned(GetDrawValue(token,&=
next_token)+
+                   0.5);
+                 if (token =3D=3D next_token)
+                   ThrowPointExpectedException(token,exception);
+diff --git a/MagickCore/geometry.c b/MagickCore/geometry.c
+index e9a5981bd..885493b94 100644
+--- a/MagickCore/geometry.c
++++ b/MagickCore/geometry.c
+@@ -1424,8 +1424,8 @@ MagickExport MagickStatusType ParseMetaGeometry(cons=
t char *geometry,ssize_t *x,
+       scale.y=3Dgeometry_info.sigma;
+       if ((percent_flags & SigmaValue) =3D=3D 0)
+         scale.y=3Dscale.x;
+-      *width=3D(size_t) floor(scale.x*former_width/100.0+0.5);
+-      *height=3D(size_t) floor(scale.y*former_height/100.0+0.5);
++      *width=3DCastDoubleToUnsigned (scale.x*former_width/100.0+0.5);
++      *height=3DCastDoubleToUnsigned (scale.y*former_height/100.0+0.5);
+       former_width=3D(*width);
+       former_height=3D(*height);
+     }
+diff --git a/MagickCore/shear.c b/MagickCore/shear.c
+index 05703ca34..a4c75431f 100644
+--- a/MagickCore/shear.c
++++ b/MagickCore/shear.c
+@@ -1766,9 +1766,9 @@ MagickExport Image *ShearRotateImage(const Image *im=
age,const double degrees,
+   */
+   width=3Dintegral_image->columns;
+   height=3Dintegral_image->rows;
+-  bounds.width=3D(size_t) floor(fabs((double) height*shear.x)+width+0.5);
+-  bounds.height=3D(size_t) floor(fabs((double) bounds.width*shear.y)+heig=
ht+0.5);
+-  shear_width=3D(size_t) floor(fabs((double) bounds.height*shear.x)+
++  bounds.width=3DCastDoubleToUnsigned(fabs((double) height*shear.x)+width=
+0.5);
++  bounds.height=3DCastDoubleToUnsigned(fabs((double) bounds.width*shear.y=
)+height+0.5);
++  shear_width=3DCastDoubleToUnsigned(fabs((double) bounds.height*shear.x)=
+
+     bounds.width+0.5);
+   bounds.x=3DCastDoubleToLong(floor((double) ((shear_width > bounds.width=
) ?
+     width : bounds.width-shear_width+2)/2.0+0.5));
+diff --git a/MagickCore/visual-effects.c b/MagickCore/visual-effects.c
+index 789660231..3f5a5ee5e 100644
+--- a/MagickCore/visual-effects.c
++++ b/MagickCore/visual-effects.c
+@@ -2062,8 +2062,8 @@ MagickExport Image *ShadowImage(const Image *image,c=
onst double alpha,
+     (void) SetImageColorspace(clone_image,sRGBColorspace,exception);
+   (void) SetImageVirtualPixelMethod(clone_image,EdgeVirtualPixelMethod,
+     exception);
+-  border_info.width=3D(size_t) floor(2.0*sigma+0.5);
+-  border_info.height=3D(size_t) floor(2.0*sigma+0.5);
++  border_info.width=3DCastDoubleToUnsigned(2.0*sigma+0.5);
++  border_info.height=3DCastDoubleToUnsigned(2.0*sigma+0.5);
+   border_info.x=3D0;
+   border_info.y=3D0;
+   (void) QueryColorCompliance("none",AllCompliance,&clone_image->border_c=
olor,
+diff --git a/coders/caption.c b/coders/caption.c
+index 67a3fb48c..cff07fd10 100644
+--- a/coders/caption.c
++++ b/coders/caption.c
+@@ -155,7 +155,7 @@ static Image *ReadCAPTIONImage(const ImageInfo *image_=
info,
+     return(DestroyImageList(image));
+   (void) SetImageProperty(image,"caption",caption,exception);
+   draw_info=3DCloneDrawInfo(image_info,(DrawInfo *) NULL);
+-  width=3D(size_t) floor(draw_info->pointsize*strlen(caption)+0.5);
++  width=3DCastDoubleToUnsigned(draw_info->pointsize*strlen(caption)+0.5);
+   if (AcquireMagickResource(WidthResource,width) =3D=3D MagickFalse)
+     {
+       caption=3DDestroyString(caption);
+@@ -249,8 +249,8 @@ static Image *ReadCAPTIONImage(const ImageInfo *image_=
info,
+             status=3DGetMultilineTypeMetrics(image,draw_info,&metrics,exc=
eption);
+             if (status =3D=3D MagickFalse)
+               break;
+-            width=3D(size_t) floor(metrics.width+draw_info->stroke_width+=
0.5);
+-            height=3D(size_t) floor(metrics.height+draw_info->interline_s=
pacing+
++            width=3DCastDoubleToUnsigned(metrics.width+draw_info->stroke_=
width+0.5);
++            height=3DCastDoubleToUnsigned(metrics.height+draw_info->inter=
line_spacing+
+               draw_info->stroke_width+0.5);
+             if ((image->columns !=3D 0) && (image->rows !=3D 0))
+               {
+@@ -279,8 +279,8 @@ static Image *ReadCAPTIONImage(const ImageInfo *image_=
info,
+         status=3DGetMultilineTypeMetrics(image,draw_info,&metrics,excepti=
on);
+         if (status =3D=3D MagickFalse)
+           break;
+-        width=3D(size_t) floor(metrics.width+draw_info->stroke_width+0.5)=
;
+-        height=3D(size_t) floor(metrics.height+draw_info->interline_spaci=
ng+
++        width=3DCastDoubleToUnsigned(metrics.width+draw_info->stroke_widt=
h+0.5);
++        height=3DCastDoubleToUnsigned(metrics.height+draw_info->interline=
_spacing+
+           draw_info->stroke_width+0.5);
+         if ((image->columns !=3D 0) && (image->rows !=3D 0))
+           {
+diff --git a/coders/label.c b/coders/label.c
+index b6c25036f..cd76961f7 100644
+--- a/coders/label.c
++++ b/coders/label.c
+@@ -135,7 +135,7 @@ static Image *ReadLABELImage(const ImageInfo *image_in=
fo,
+     return(DestroyImageList(image));
+   (void) SetImageProperty(image,"label",label,exception);
+   draw_info=3DCloneDrawInfo(image_info,(DrawInfo *) NULL);
+-  width=3D(size_t) floor(draw_info->pointsize*strlen(label)+0.5);
++  width=3DCastDoubleToUnsigned(draw_info->pointsize*strlen(label)+0.5);
+   if (AcquireMagickResource(WidthResource,width) =3D=3D MagickFalse)
+     {
+       label=3DDestroyString(label);
+@@ -174,8 +174,8 @@ static Image *ReadLABELImage(const ImageInfo *image_in=
fo,
+           status=3DGetMultilineTypeMetrics(image,draw_info,&metrics,excep=
tion);
+           if (status =3D=3D MagickFalse)
+             break;
+-          width=3D(size_t) floor(metrics.width+draw_info->stroke_width+0.=
5);
+-          height=3D(size_t) floor(metrics.height+draw_info->stroke_width+=
0.5);
++          width=3DCastDoubleToUnsigned(metrics.width+draw_info->stroke_wi=
dth+0.5);
++          height=3DCastDoubleToUnsigned(metrics.height+draw_info->stroke_=
width+0.5);
+           if ((image->columns !=3D 0) && (image->rows !=3D 0))
+             {
+               if ((width >=3D image->columns) && (height >=3D image->rows=
))
+@@ -204,8 +204,8 @@ static Image *ReadLABELImage(const ImageInfo *image_in=
fo,
+           status=3DGetMultilineTypeMetrics(image,draw_info,&metrics,excep=
tion);
+           if (status =3D=3D MagickFalse)
+             break;
+-          width=3D(size_t) floor(metrics.width+draw_info->stroke_width+0.=
5);
+-          height=3D(size_t) floor(metrics.height+draw_info->stroke_width+=
0.5);
++          width=3DCastDoubleToUnsigned(metrics.width+draw_info->stroke_wi=
dth+0.5);
++          height=3DCastDoubleToUnsigned(metrics.height+draw_info->stroke_=
width+0.5);
+           if ((image->columns !=3D 0) && (image->rows !=3D 0))
+             {
+               if ((width < image->columns) && (height < image->rows))
+diff --git a/coders/pcl.c b/coders/pcl.c
+index 8056ae0c9..d6b9ed75f 100644
+--- a/coders/pcl.c
++++ b/coders/pcl.c
+@@ -333,8 +333,8 @@ static Image *ReadPCLImage(const ImageInfo *image_info=
,ExceptionInfo *exception)
+     image->resolution.x,image->resolution.y);
+   if (image_info->ping !=3D MagickFalse)
+     (void) FormatLocaleString(density,MagickPathExtent,"2.0x2.0");
+-  page.width=3D(size_t) floor(page.width*image->resolution.x/delta.x+0.5)=
;
+-  page.height=3D(size_t) floor(page.height*image->resolution.y/delta.y+0.=
5);
++  page.width=3DCastDoubleToUnsigned(page.width*image->resolution.x/delta.=
x+0.5);
++  page.height=3DCastDoubleToUnsigned(page.height*image->resolution.y/delt=
a.y+0.5);
+   (void) FormatLocaleString(options,MagickPathExtent,"-g%.20gx%.20g ",(do=
uble)
+     page.width,(double) page.height);
+   image=3DDestroyImage(image);
+diff --git a/coders/pdf.c b/coders/pdf.c
+index 7792d417a..3e8b3c182 100644
+--- a/coders/pdf.c
++++ b/coders/pdf.c
+@@ -1605,9 +1605,9 @@ static MagickBooleanType WritePDFImage(const ImageIn=
fo *image_info,Image *image,
+     (void) ParseMetaGeometry(page_geometry,&geometry.x,&geometry.y,
+       &geometry.width,&geometry.height);
+     scale.x=3D(double) (geometry.width*delta.x)/resolution.x;
+-    geometry.width=3D(size_t) floor(scale.x+0.5);
++    geometry.width=3DCastDoubleToUnsigned(scale.x+0.5);
+     scale.y=3D(double) (geometry.height*delta.y)/resolution.y;
+-    geometry.height=3D(size_t) floor(scale.y+0.5);
++    geometry.height=3DCastDoubleToUnsigned(scale.y+0.5);
+     (void) ParseAbsoluteGeometry(page_geometry,&media_info);
+     (void) ParseGravityGeometry(image,page_geometry,&page_info,exception)=
;
+     if (image->gravity !=3D UndefinedGravity)
+diff --git a/coders/png.c b/coders/png.c
+index 6f88e9cdc..6dedf2849 100644
+--- a/coders/png.c
++++ b/coders/png.c
+@@ -10020,23 +10020,23 @@ static MagickBooleanType WriteOnePNGImage(MngInf=
o *mng_info,
+         {
+           ping_pHYs_unit_type=3DPNG_RESOLUTION_METER;
+           ping_pHYs_x_resolution=3D
+-             (png_uint_32) CastDoubleToSizeT((100.0*image->resolution.x+0=
.5)/2.54);
++             (png_uint_32) CastDoubleToUnsigned((100.0*image->resolution.=
x+0.5)/2.54);
+           ping_pHYs_y_resolution=3D
+-             (png_uint_32) CastDoubleToSizeT((100.0*image->resolution.y+0=
.5)/2.54);
++             (png_uint_32) CastDoubleToUnsigned((100.0*image->resolution.=
y+0.5)/2.54);
+         }
+=20
+       else if (image->units =3D=3D PixelsPerCentimeterResolution)
+         {
+           ping_pHYs_unit_type=3DPNG_RESOLUTION_METER;
+-          ping_pHYs_x_resolution=3D(png_uint_32) CastDoubleToSizeT(100.0*=
image->resolution.x+0.5);
+-          ping_pHYs_y_resolution=3D(png_uint_32) CastDoubleToSizeT(100.0*=
image->resolution.y+0.5);
++          ping_pHYs_x_resolution=3D(png_uint_32) CastDoubleToUnsigned(100=
.0*image->resolution.x+0.5);
++          ping_pHYs_y_resolution=3D(png_uint_32) CastDoubleToUnsigned(100=
.0*image->resolution.y+0.5);
+         }
+=20
+       else
+         {
+           ping_pHYs_unit_type=3DPNG_RESOLUTION_UNKNOWN;
+-          ping_pHYs_x_resolution=3D(png_uint_32) CastDoubleToSizeT(image-=
>resolution.x);
+-          ping_pHYs_y_resolution=3D(png_uint_32) CastDoubleToSizeT(image-=
>resolution.y);
++          ping_pHYs_x_resolution=3D(png_uint_32) CastDoubleToUnsigned(ima=
ge->resolution.x);
++          ping_pHYs_y_resolution=3D(png_uint_32) CastDoubleToUnsigned(ima=
ge->resolution.y);
+         }
+=20
+       if (logging !=3D MagickFalse)
+diff --git a/coders/ps.c b/coders/ps.c
+index 3c18e5a92..9b3f3da88 100644
+--- a/coders/ps.c
++++ b/coders/ps.c
+@@ -1483,9 +1483,9 @@ static MagickBooleanType WritePSImage(const ImageInf=
o *image_info,Image *image,
+     (void) ParseMetaGeometry(page_geometry,&geometry.x,&geometry.y,
+       &geometry.width,&geometry.height);
+     scale.x=3DPerceptibleReciprocal(resolution.x)*geometry.width*delta.x;
+-    geometry.width=3D(size_t) floor(scale.x+0.5);
++    geometry.width=3DCastDoubleToUnsigned(scale.x+0.5);
+     scale.y=3DPerceptibleReciprocal(resolution.y)*geometry.height*delta.y=
;
+-    geometry.height=3D(size_t) floor(scale.y+0.5);
++    geometry.height=3DCastDoubleToUnsigned(scale.y+0.5);
+     (void) ParseAbsoluteGeometry(page_geometry,&media_info);
+     (void) ParseGravityGeometry(image,page_geometry,&page_info,exception)=
;
+     if (image->gravity !=3D UndefinedGravity)
+diff --git a/coders/ps2.c b/coders/ps2.c
+index 31e7f75c7..2e713c64a 100644
+--- a/coders/ps2.c
++++ b/coders/ps2.c
+@@ -533,9 +533,9 @@ static MagickBooleanType WritePS2Image(const ImageInfo=
 *image_info,Image *image,
+     (void) ParseMetaGeometry(page_geometry,&geometry.x,&geometry.y,
+       &geometry.width,&geometry.height);
+     scale.x=3DPerceptibleReciprocal(resolution.x)*geometry.width*delta.x;
+-    geometry.width=3D(size_t) floor(scale.x+0.5);
++    geometry.width=3DCastDoubleToUnsigned(scale.x+0.5);
+     scale.y=3DPerceptibleReciprocal(resolution.y)*geometry.height*delta.y=
;
+-    geometry.height=3D(size_t) floor(scale.y+0.5);
++    geometry.height=3DCastDoubleToUnsigned(scale.y+0.5);
+     (void) ParseAbsoluteGeometry(page_geometry,&media_info);
+     (void) ParseGravityGeometry(image,page_geometry,&page_info,exception)=
;
+     if (image->gravity !=3D UndefinedGravity)
+diff --git a/coders/ps3.c b/coders/ps3.c
+index 62f47c439..beb007587 100644
+--- a/coders/ps3.c
++++ b/coders/ps3.c
+@@ -980,9 +980,9 @@ static MagickBooleanType WritePS3Image(const ImageInfo=
 *image_info,Image *image,
+     (void) ParseMetaGeometry(page_geometry,&geometry.x,&geometry.y,
+       &geometry.width,&geometry.height);
+     scale.x=3DPerceptibleReciprocal(resolution.x)*geometry.width*delta.x;
+-    geometry.width=3D(size_t) floor(scale.x+0.5);
++    geometry.width=3DCastDoubleToUnsigned(scale.x+0.5);
+     scale.y=3DPerceptibleReciprocal(resolution.y)*geometry.height*delta.y=
;
+-    geometry.height=3D(size_t) floor(scale.y+0.5);
++    geometry.height=3DCastDoubleToUnsigned(scale.y+0.5);
+     (void) ParseAbsoluteGeometry(page_geometry,&media_info);
+     (void) ParseGravityGeometry(image,page_geometry,&page_info,exception)=
;
+     if (image->gravity !=3D UndefinedGravity)
+diff --git a/coders/svg.c b/coders/svg.c
+index 8f80d83e3..5caf8afe7 100644
+--- a/coders/svg.c
++++ b/coders/svg.c
+@@ -2520,10 +2520,10 @@ static void SVGStartElement(void *context,const xm=
lChar *name,
+             svg_info->view_box=3Dsvg_info->bounds;
+           svg_info->width=3D0;
+           if (svg_info->bounds.width > 0.0)
+-            svg_info->width=3D(size_t) floor(svg_info->bounds.width+0.5);
++            svg_info->width=3DCastDoubleToUnsigned(svg_info->bounds.width=
+0.5);
+           svg_info->height=3D0;
+           if (svg_info->bounds.height > 0.0)
+-            svg_info->height=3D(size_t) floor(svg_info->bounds.height+0.5=
);
++            svg_info->height=3DCastDoubleToUnsigned(svg_info->bounds.heig=
ht+0.5);
+           (void) FormatLocaleFile(svg_info->file,"viewbox 0 0 %.20g %.20g=
\n",
+             (double) svg_info->width,(double) svg_info->height);
+           sx=3DPerceptibleReciprocal(svg_info->view_box.width)*svg_info->=
width;
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/me=
ta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index ecd4d85b3a..95820cd6b2 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -39,6 +39,10 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.gi=
t;branch=3Dmain;protocol=3Dhtt
     file://0010-ImageMagick-Add-support-patch-3-to-fix-CVE-2025-5529.patch=
 \
     file://0010-ImageMagick-Fix-CVE-2025-55298-1.patch \
     file://0010-ImageMagick-Fix-CVE-2025-55298-2.patch \
+    file://0011-ImageMagick-Add-support-patch-1-to-fix-CVE-2023-3415.patch=
 \
+    file://0011-ImageMagick-Add-support-patch-2-to-fix-CVE-2023-3415.patch=
 \
+    file://0011-ImageMagick-Add-support-patch-3-to-fix-CVE-2023-3415.patch=
 \
+    file://0011-ImageMagick-Fix-CVE-2023-34151.patch \
 "
=20
 SRCREV =3D "35b4991eb0939a327f3489988c366e21068b0178"
--=20
2.34.1


