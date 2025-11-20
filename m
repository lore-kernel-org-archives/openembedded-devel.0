Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA3BCF8874
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:26:36 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30430.1763629577623277728
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 01:06:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=oVA4cewb;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.33, mailfrom: divyanshu.rathore@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQyq0iCHj58SF1Ya/Tl5ny0V03ubINtHZxCnMfZV/Zb1MhVSGJRqPB2ADw/yr67D2NZpynqtpXBNHSpxfoxVblguqjgCUrsApSgztDRdG7bxBmAMtQpfbEWnd9gxEga/KD1pqysk437673oV6+qpnXPeMSchzNba6Hih6D/0M7m4tqibZkFTK1RYblVXuA4/tAGLhqZ/hY5KxJNOzLONK3CrIab6eNVfXGdmadqKvSqQBjp0FAKg4UPpPkjzqo1T8BO7xDWRJAUZ9MyZCIK+nheRvfFlyciuzJ6bweO9xFhwrtwRacZYGS3tQ4yfEhERnjPqMEmUUhbKRKxt1D8GvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUA4pkL+ZHcgUuB6UtQ1gPXVGY6Yea0AWs6C+S/uqJ4=;
 b=PX0XP5tDd8z1zxM0wD3ygoLFaQoX0H5TMmRtI0mh5v4AnW3hBLCGkS7dxhpCDhFhQ2OWSfYTimcfThmaDcwS3QYSIAkMSpVQ0t4C+zBsHHSZlHjk9vm5RiahaBVzXIi0ULgrHwFPKdnKWAw6yPAxpxmXoe6oUqpzk2pJ8/XMle7dlWdU7G+Xwl88HFf5nNapm+o6KlqVGyy2S/P60buAqaOFLEMNiHbLqgrSpw2WzcfRYBbktsvx7YAQo3aaGlWQ7l3oeGovkn5nkBge9XZZ975VEYdCCDMGwwBFnhrLFmiEG74hREvYiu4cX53uXcGv8jxtWY9VWZsbPjVW8ObxeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUA4pkL+ZHcgUuB6UtQ1gPXVGY6Yea0AWs6C+S/uqJ4=;
 b=oVA4cewbFY86G01/qY9w1pRrc4ePx1FTKJ/hCeH04o49kf0A3UCZSFXvRJ/sAoTWVzIDZ3uyhwCFRhibKKXv/0bhSGjQSdF4r2in5H+xNGoDl8CFHC4AXFWJyz6nUiQp8oNIAe63pkKNphSG7i7+95h3665ZvGNczck+LbL3UqBXCXD4E3pNA9bq8cL0QCXIc0alv9L0f1hRkeUBfYex3AI/rW3Ju9TyZdnpHUtMrZGtVS1zgcmVar2RTkbyngW9ZhWMwSlwp1Fy84k5v7nZSG8TJIMBVoxWwKCu3/P+tD3AYaAaQAo7XGqjMq4U6SpN+p/ejqkGE+PrFhoQPEvlJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:143::11)
 by MA0P287MB1011.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 08:50:07 +0000
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483]) by MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 08:50:07 +0000
From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Sana.Kazi@bmwtechworks.in,
	Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
Subject: [meta-oe][kirkstone][PATCH 01/12] ImageMagick: Fix CVE-2025-53014
Date: Thu, 20 Nov 2025 14:19:48 +0530
Message-ID: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: MA5P287CA0130.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::12) To MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:143::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3378:EE_|MA0P287MB1011:EE_
X-MS-Office365-Filtering-Correlation-Id: cd0f311b-08a5-4653-bd01-08de2811ce36
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|52116014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JhP/Yu7Ftqcp5OdpldeX2iNE7pNodr1H419+Qx/KZgU6jk2DKzFNx6BwnZqB?=
 =?us-ascii?Q?v0oEVlZICWJo4fd4MBPjUBzOUhdfFGkEZUxSPDVxMeCHrjrWwcYZP1+XB9B7?=
 =?us-ascii?Q?eQrg7ooamehiLoPt3wnsma1NTklufiJeflEZ1xqWGes3IM1iRO3H+4+frxRX?=
 =?us-ascii?Q?+7+gBq2AeWjYI8AnfM/cljn6Py34P8hU1dOIbIvv1z5ygMP/fMfG0v7hGJEr?=
 =?us-ascii?Q?U1LLTUgKh/IfU87D5ZszVuyBFpRpVtS0pPkMt/Wp0dihWpIpttp++GW1/wgT?=
 =?us-ascii?Q?OqgHhzfmf3homiXlit8xK49XBdkzkpyUHoJtGXwDWQ0gk9tys6Y2X0j41LKN?=
 =?us-ascii?Q?MuNQYT/HjWng9+jfMXZ4iuV3Fmz7yMEtYjl1dBAIN7C/Tdftft/Y2IlSjIbW?=
 =?us-ascii?Q?Sx6npkxKNAukNSHaxeiyKL/lEwFizTh3rWn/lYzws+pbNKhsq0S6nJsBpusm?=
 =?us-ascii?Q?bo3hz6cWupflXsK4Ih1LwweEIAjvBhBLhnk+km1RBwJszHygyWftXqNVBhtl?=
 =?us-ascii?Q?3RfeaTOFGvLO27TZfkoR/uxW//7EUKXfGN5F9Vix2DhakVbcvU5e2Hgs2hKz?=
 =?us-ascii?Q?Lm1+PIZkUIqNX3zqdSHmo/NfiemLmwLAf9rtpBuU8H/BjgWvnnrNSNd60ppU?=
 =?us-ascii?Q?8XvmrwDS9XJZW4NdPO7dVakdtWAqMC8YguRy4TZUFglUq9m530WtSGjnJJly?=
 =?us-ascii?Q?Gu3nFfUxlbsE41sIX9PvwlUWB4XBKUdeGATH7nS+GerJtOb/+9iU/L1dhK2H?=
 =?us-ascii?Q?GWD5bu6FHx/mqPZXvGUhftob25ArG0pc4V4bTgI6fuUpLS6UuYecpIvJT6UB?=
 =?us-ascii?Q?MG4R14fWUsXmbcpzTmC+0KJQRaNZb4q731TvN3x/U1AYb5ySUYBxSubSO+3K?=
 =?us-ascii?Q?lCVdP6cDxgacqknXZe27lVD4kthVuA6dJeciJpmzvJECjD6F8rf4619xnh7O?=
 =?us-ascii?Q?hCy1iQ1zsOSHlhq2+1J0gKVFzJiZDNVrLkUiTEhiFFPUPcN7Vo9YF5+Qqv8E?=
 =?us-ascii?Q?v8oG9XyMfuqL+XJhdyo0Fv8O6P+SlwqEnK3QsPGL2TaQSyf9iMwCnze5Yfiq?=
 =?us-ascii?Q?oiCeqRDcs0G0LN7lWxY2K5LLGl2+IBV7lnU3nfaWIMfQ3EhUGNswmg01cPwd?=
 =?us-ascii?Q?6eZMuzAcZwDZVsymMiy0pbrmYze3aF0AmMm0Z78Zpu+8nnXBuNBhVMTEzEGT?=
 =?us-ascii?Q?AAZHACRgpxlCFVXpYs9/rSUMnw6uFruJCPsLd9A3Lzja62ARZuWSPeGYcWoN?=
 =?us-ascii?Q?3Pkq5iJdTdwRMVmR07LsIvrR/4l4T0rD3DouHwNSYNdmdJHFGqyIrIeg0A2W?=
 =?us-ascii?Q?NNTmlxO6JSicnVe2t25XSUx6gx9JuO0FXK/SMoa8R6C5QevlD0OXdF4Bbmxy?=
 =?us-ascii?Q?XbNKEluTHzzgHfGOJFg/lNCD2pTpN6ff37THaj6emgvKemF29QjUud/ZjiKC?=
 =?us-ascii?Q?eH4kfeXLl2MWjW77VLEWvlDD0QQoHdcG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3378.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(52116014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bRrwQxrbvtXl2Lg12KLPqEIMbFoShgUl4eo/rH0UMaDpderPlMwYgGnThVNH?=
 =?us-ascii?Q?ftMLq/dIxbT7VjZEvVqhi2GHoB/5D+elIamUz9lLz7bn94W2EvWIxPpKFF/T?=
 =?us-ascii?Q?XQGOIbULyfE3b57v3hWHuYAqflGlLaCLOngGoZv0YsUdH7KSBLewJ78BdSmw?=
 =?us-ascii?Q?mU8MYzIF0+W0ckhMiDu7Y6GfXgNC2EPF9L/5FZn1IOl61YHF3O3kthgAL3CD?=
 =?us-ascii?Q?5xQiNth0rAze4itogYwuAOtctUw5bToCWQ6NiiFYtCURWgTJI2uAzW+5Klu4?=
 =?us-ascii?Q?pGCSubYDM8Dt+gEhSonZJxg6Gd8f6USPHsos47AorM/wE+vPvQy3OJQSY9Sz?=
 =?us-ascii?Q?9sAWF01NeU1ixzN/1h6n9Ok8nx9QJEPygkxLsqnTt22UFAX2L69leB0gSFpe?=
 =?us-ascii?Q?yLmjeCANzeXERdHq/nSk1E9Pq4okFjfEPOAlxc1MFdOK8Qez8R3lakbrpJLv?=
 =?us-ascii?Q?Cit4qUHELubEYUTuZ2Fc71brCRHZ2sZBmps/qyyIzVBAI3xTLJg0zjDfIeac?=
 =?us-ascii?Q?uqOIPLJf9hblukPTjihrZJVdjNpe8uO90bpuKQ4LWkA/Xb1r+r3zqwyzu5MM?=
 =?us-ascii?Q?24+Hn48189lnQF4TKaZp0nM1FqhBoeEMD5uKm/wr5hMUyhw7QTfr8refih4i?=
 =?us-ascii?Q?tGonGg0vuBtotdqa/GUskqRDIZUhj53B9+sFTT/ncIm28NxEXjJ7+S3szxV3?=
 =?us-ascii?Q?OabjYFip+8Qdch5Ew3wVp/Ty2zAesUJx4DiUVSPuosnwBb0LY2Rr4JA3fmE5?=
 =?us-ascii?Q?9afpryt2q5J2U0Gj2AfmsHhSIN/ZNNs/rX/Ex6y9dTNmN7dXNUEQjnFMixRN?=
 =?us-ascii?Q?E4XXjGVzmoiSxseAVnQnVQrPyoWhXkGm8VsKQlcgCg6CF2xChAwgWUhwNOYQ?=
 =?us-ascii?Q?97q0/7nbAZuGxVTJwlIRzdkWoC/abIMtizA0eiltlzTjLA+xrcmy4otlzdD4?=
 =?us-ascii?Q?2nwWrExaHqmuq65Odjfb+Dhi/4iplROELvmpUASW2QyEUb2MC7AVjxEe1xpa?=
 =?us-ascii?Q?QwMIKrjYDPv0RA0izivVr6js6nBP5uMRot5xZqAbEVs0EiLRYUbgLl2M+C06?=
 =?us-ascii?Q?R/bQjGbF1LTF51pZIFpGW5bDkHH+xGfLIfQuErpZB9CIK8lXl/Fmdt2uQeZu?=
 =?us-ascii?Q?E4p7FjsqGdbx0spY7wjmwjJ+/UP+3aE/8MNUFu07sk+42Hy6fyQIZDJVtJ4A?=
 =?us-ascii?Q?RfyfHRiHOc5JSD3dI0p2xJPVJMM8p84Ks8GYHnZ0RuDrDuFMbS+gVbpFEpL2?=
 =?us-ascii?Q?2rZN6odcJwgJZiUlbUUmBFC98AfurxxFsd7Pr2KutZBesk6tEpwLUhHYk1jp?=
 =?us-ascii?Q?AoiU200nS47qoZ3IRFvXGEFYyn9X9wnGD14GL8bks4MDrvq14RzslrbbH8kD?=
 =?us-ascii?Q?jTJF4bmpfRjSlJK4jpa91jLOv3vYSvcyikGpSND22FobXl8/jqKLCLVcsMQl?=
 =?us-ascii?Q?7nj6HHLXfqN+eB3AMGpxhB9fQHXIqpX7fR34B6/MlUFG/NPtX9BjPrfx1u57?=
 =?us-ascii?Q?MQ78zPXuhKc3MIysoAMNiLy7M7NkgmbBaK0E0Xmou22Y0DBDlpu6GBTjORKv?=
 =?us-ascii?Q?FnPoOcP9lVAwJ6dK2v1HRxo+PgZxdh2D0XykovyWN/fh6DtK35/FhlzAX3m1?=
 =?us-ascii?Q?3I5bHlmX7HhasIJaSNKC0tQamqR4T7+NA9SlOeIewBeJVimovypZuL87DV2E?=
 =?us-ascii?Q?voAhSKEp04cxVkN7esoQ32yKg9Y=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0f311b-08a5-4653-bd01-08de2811ce36
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 08:50:07.3619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xbZ+rS5lCEBTYEpgTtTR0j2hdfpPo0OBQtnNa5/S+yF+bHIHBAiNttwyC4LFCiu0/T0tKkq0x+3u//EonByZbnrHEa1mtcd/wS9oElnw/WAwh1T1RepfzlAzXmJjtagO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1011
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 15:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121948

From: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>

Backport the fix for CVE-2025-53014

Add below patch to fix CVE-2025-53014
0001-ImageMagick-Fix-CVE-2025-53014.patch

Signed-off-by: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
---
 .../0001-ImageMagick-Fix-CVE-2025-53014.patch | 32 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0001-ImageMag=
ick-Fix-CVE-2025-53014.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/0001-ImageMagick-Fix=
-CVE-2025-53014.patch b/meta-oe/recipes-support/imagemagick/files/0001-Imag=
eMagick-Fix-CVE-2025-53014.patch
new file mode 100644
index 0000000000..1dcfa9d54e
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0001-ImageMagick-Fix-CVE-20=
25-53014.patch
@@ -0,0 +1,32 @@
+From 862fc23489af0d1ade9e1b431d057ec82763dc63 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
+Date: Mon, 29 Sep 2025 13:56:59 +0530
+Subject: [PATCH 1/6] ImageMagick: Fix CVE-2025-53014
+
+Correct out of bounds read of a single byte.
+CVE: CVE-2025-53014
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/29d82726c7ec20c07c49ba263bdcea16c2618e03.patch]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
+---
+ MagickCore/image.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/MagickCore/image.c b/MagickCore/image.c
+index 34804e522..fe2a1cb5f 100644
+--- a/MagickCore/image.c
++++ b/MagickCore/image.c
+@@ -1661,7 +1661,7 @@ MagickExport size_t InterpretImageFilename(const Ima=
geInfo *image_info,
+     q=3D(char *) p+1;
+     if (*q =3D=3D '%')
+       {
+-        p=3Dq+1;
++        p++;
+         continue;
+       }
+     field_width=3D0;
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/me=
ta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index ce5489bb3e..e0d584f165 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -23,6 +23,7 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git=
;branch=3Dmain;protocol=3Dhtt
     file://CVE-2023-1289.patch \
     file://CVE-2023-34474.patch \
     file://CVE-2023-5341.patch \
+    file://0001-ImageMagick-Fix-CVE-2025-53014.patch \
 "
=20
 SRCREV =3D "35b4991eb0939a327f3489988c366e21068b0178"
--=20
2.34.1


