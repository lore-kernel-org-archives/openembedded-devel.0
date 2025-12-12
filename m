Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E92D59D9F
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 21:03:43 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14828.1765552511015311504
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 07:15:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=DS/y+tpH;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.227.66, mailfrom: divyanshu.rathore@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgE95Tq9kGViZXwh5yYcAC3GKlmn2w1NNOCxH+sa76lDc8otKq29W2g8p+uyCqPykjHhqzbjpSWQnNKho8M05H52b5bCEtvAnBSpUH32UU+1CtLE7Rlh6bl8a17l8k/5ez2ox7BiRQ4YSFnU3dyVbALuwK+ebbHrqk71Ib1cBLRUS3Z1LRDiWeTzDr0H7LWuQhH7GNOZIsRQ69eAfkRV4JYTHH+XznoAjW0+dpXFvEpF+2YesRWiMde8v18I/HJtXGOYolP2qMLYrRmPD0VZNY/U9zVOSUaZCH6mKcGTsFrscposz8C7Y0FrtO84VURw3Z+M1tlfsywCZHiKgarrNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdyEtyqUtTfOmfYJsMbvdrDMhwj/0A0gus+bZkkBeBY=;
 b=LuPT/E1y1BYFCQ2OeDCHBxn875V5xzoFp7nFLXwWVpYW3N82czvGt9PBhq8MyOa9zN3iT0Jdy+4pcb4ekqkhCC85XV4ZupBeeIuJIjZMvGxtn4sBs4yx3pcMJ08S9ZnWAnBlHwr/GMb+nSCA7rVZdMMmt/OeQXxl6AkBs1TjO6iSjVJQU9VkiNtj9i9xlI64b1TvqrlpHruxqMydk/aFmc2PESTE+XLjKS9ktQShSegdS3VTQ3/KuVmL4O7UwNv1wNFFOKJzQ2RccGBN3ltfIFKL+ohhDW/yBEgm2b8LX0R1T9Gpa8uzWFuuylAfa2RRJNkabVDEDBfJszhIeJLeaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdyEtyqUtTfOmfYJsMbvdrDMhwj/0A0gus+bZkkBeBY=;
 b=DS/y+tpHe2F27cM/WGUXjIqnC/Aykr3/xWJR5n+BQP6Gj8vE5zzu5p6VMyyOAfk/3yahphsiIgCvazOJUhBX6ID3npUNYO0kF4qBMj28LV81xM2a4dMZ7kg/VgfcIrjPPwJLU3im9ZOD+77XKudp/TH0Q7sPCG2bXnBTrOWfVqUm8qwLkrVM9ZQwWSms+fo2t0sRMAw01TzFPza2sS6Pa/g61y40SSCNHjfsohFXvDI/3XiV3hCmkTwFpX2JWChlIWCAEC9H5wz6eFRNRyZJrgYfnjcY75IadDXzUO15kmtZ7D93HBxMJROLvEh+B+YuPiqtHd0ujtKmYUH/waN2dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:143::11)
 by PN0P287MB1122.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 15:00:16 +0000
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483]) by MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 15:00:16 +0000
From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Divyanshu.Rathore@bmwtechworks.in
Subject: [meta-oe][kirkstone][PATCH v2 06/11] ImageMagick: Fix CVE-2025-55004
Date: Fri, 12 Dec 2025 20:29:42 +0530
Message-ID: <20251212145947.7434-6-Divyanshu.Rathore@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212145947.7434-1-Divyanshu.Rathore@bmwtechworks.in>
References: <20251212145947.7434-1-Divyanshu.Rathore@bmwtechworks.in>
X-ClientProxiedBy: PN0PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::14) To MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:143::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3378:EE_|PN0P287MB1122:EE_
X-MS-Office365-Filtering-Correlation-Id: b0d3a7b0-ce0b-42c6-3ad1-08de398f28da
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qcWMFCSgD9DLAzchptBMo4HsfY3u3Y4ktFKu4T6CmP9e4eBCDUdWuqhUR1gx?=
 =?us-ascii?Q?ASCGMvWBYQVMCBjFK8+Lb+5N5GbxkjhCLcTTWBE+wICgL10SSK0dNpzv9fG/?=
 =?us-ascii?Q?vbtgevlOdITzKCVUfeJ+lhZNq4u4F9GguPBY9b+aRBkS65nh7uM/x9zOljbi?=
 =?us-ascii?Q?ZlBJlVB8BfQ5pn9HMLPfOW3LVDrK11N6S2uYhpHbTdcyTHGTvmlQfPd24jnd?=
 =?us-ascii?Q?Dob8BHhejILUeXd0aoDyaZoHJR1JKZfJKfLm2StbTnJ2TtNWg8TUlvXW4d5o?=
 =?us-ascii?Q?mZFigeGT3oYgnfmbJw1Gnqq1887+Oc1BV4TiSs2zyGukmboVQucrIFBz4tzj?=
 =?us-ascii?Q?DQw+gsttdZo91rZba3NSS22v6aDSb9ab/iKhcInTbOiyMrBJpt2P42jVx37o?=
 =?us-ascii?Q?DMBspIuu98lDN9R10Xqk0hRdO9fo+lHCxrLgf2ZBv0IDG9Ur9tSDj8RjQAlB?=
 =?us-ascii?Q?Ix9OsvAuOwDcpCleuuBPBLwEYRP3aDY/BrEBFxzyLY2XRq0RcqUtP+jY+lV1?=
 =?us-ascii?Q?btLqbeKSvxlQIMKmrztAUbaosk6tDFgvotHYGuGfburunHAlHJbWu3XIjTMK?=
 =?us-ascii?Q?X8qoJ7ToIY4rb10DV+EMaS2rO0NBp29RYCupL3C60M9AwZoQYNtjc3Nn6qU+?=
 =?us-ascii?Q?Fikn/dhYAC22OHJlKdXagtR9OKr0v3Iwi9Htjb50ZkAy75VkwA0K82/eglDR?=
 =?us-ascii?Q?VsHM+FJ8oRF2I9LQLMefiDVLkdrVZ6iu1K07JC9P5EGjYgIeK3NduXI5sgQd?=
 =?us-ascii?Q?GgZcxKmsEPTOuX559jnhTISwj3LtMnVevkCbPDrVOuZxosXNnYDiU488oAXx?=
 =?us-ascii?Q?e+UOcWZELxLLG8Tu5e0Tf443rSBOieks+NfZ3DPv5iBibdHY2XKFXDARchjC?=
 =?us-ascii?Q?f0LfOP7qkjhPWWFYfeeRWZIaw9PSg9LiVp3AJzktJqbNSd+h0XLo7WwD3LbD?=
 =?us-ascii?Q?cTF8Qr64RAE84gbWE5OS+pfOylyEaaj/dfAkxjsWrhJcPD2s3lMsbhTo46CH?=
 =?us-ascii?Q?LVy4OidJ67Q1rCPJf6aLcYVL+eQMHsusZD/oTKOuJ5tSqIBRVwgb6JCFc8TS?=
 =?us-ascii?Q?ZN7QPFVODHzu5JfkFDzEisMsD9ns+v4hkTo+eMBBO5Kn9ZcVs17d0khW4aiR?=
 =?us-ascii?Q?wB9/1uSasTedJ4g0c1QnKwlJTQcTqe7fv4i9bMPCE4BA6fsqHM+foOwiska5?=
 =?us-ascii?Q?q5JCfSHhWam+vDgGx0DdFFOB/vmzJTYqNaLgw475eMMjJYuATxuK9biD9bPB?=
 =?us-ascii?Q?MWg1RMRS+D56alNm7mWDknR+8s6kaxoOg+V0Tb8WsjTMiSzWrtvMoytDfvUt?=
 =?us-ascii?Q?/gQutPnao/GgXSMD2rHcgBQZV2jwTmQmV2oz7V8tU9YMLouL/CbPk/G+9EUS?=
 =?us-ascii?Q?40bW/0EhsLsc8DSu2Z9vHYNEijbuaLPXfytSzrH6bcSI93Krt84bX3Ec1fhD?=
 =?us-ascii?Q?C3CveRVDr6peQeXb9MhQ9d9voymXY7HcIEV0FyibBRo3FF6OT42Blg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3378.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UNlyoole50mHhIN4umy7dnNIgAuYAX17WNKzpCmW/dBQJR6d6/MKkhE2ddYd?=
 =?us-ascii?Q?ZGCXTLbwD1t8hXrYpaeER74vV+zLqemNxjdsJMIc1hpzzuUrIofSSAZGdfRI?=
 =?us-ascii?Q?6Jn/OzDc1BriNbgvG8GFl3VNHztvGWeV3u30Q7DXEB85cEQ3XKiILJ5vPLmI?=
 =?us-ascii?Q?aLn7GApZrJGUYqH17MEMUrC3zGY/jWtSS7m02zIhF0eVMitaxqPaiyT+hRN1?=
 =?us-ascii?Q?zMLfOmvUozetTZFVDWb9oKugLMbutlLF95N12VZSCDAlFJN3d4ttg/7dRvtR?=
 =?us-ascii?Q?K4PYNgS06wTdqJnTtK17dU4skZsRpMWdbPmJZsehuJUCGtoCoc4YlDXmU2PJ?=
 =?us-ascii?Q?wCJpqT7d13V4cteAOCNllAKIDejZCMF9jemUV+2j0079OgSjfMURBmXUPaYV?=
 =?us-ascii?Q?Is7dZNtO5jQZn675IyzgHUMj59hXmyulyEF0KmX0QPsLKK1OuTfVg8s4cBsR?=
 =?us-ascii?Q?44FII6N4bB8uVkS2Tb6blamPheINtXqk8jsqJMDue0RFFpABH/AO4NVFsaQX?=
 =?us-ascii?Q?MnJS2xStq+2Xog9XVKbA/rIZlQnOVl1xsengX/XZH0hMzxDnqkerDo07oTOS?=
 =?us-ascii?Q?IBhJtDcM0J75TzZ32j0bN6ThhcO9DGzaIVyoUFRshu2G5KUYd34gTHqKmBTZ?=
 =?us-ascii?Q?ixDSPwDBZTgfaIQxR8dgZxt+FIgpTBUQeHcdRt5n1W87ImSdf38nz5S+V9wd?=
 =?us-ascii?Q?N2twQmdeasJUItQNVUpE3L5ohndABcKdpyibafI5HPwNhsXz8kfBWqBb1qAW?=
 =?us-ascii?Q?IQT2wFVwaiBlOr3M7oevZIqa62dQVgYdgTqlsAbpN8gE30NGkGdtonXoFJR7?=
 =?us-ascii?Q?PdLhMNxoFQSj4FyBmwHzpwVvEOf6D9TKRTpTz+jur+KMLWyaKoauAXnZMqbp?=
 =?us-ascii?Q?jZ+EPicyFhUgI8ZMf1cehX3PhAiKvrEwgBUB9mVZXzCCCHLCL2qhHT+waC0o?=
 =?us-ascii?Q?G4QkO4KzbSPsTaSZlIoHjt6Z2ngQXjvmkMm9HZqFBqa1IImrBUxpO6zYKJO8?=
 =?us-ascii?Q?fC8q6X7MfLjgZbusUCIFDLO0dFHJ4yGJ6X525vnwYV5UTHyNLetkuYdC0NZA?=
 =?us-ascii?Q?0TIXPD8wX5+rhh/Ddk+ZbyLGBY0W+GMyjxdgwqcaAaM6IslAFPaKyxmiZnjB?=
 =?us-ascii?Q?5dqqVOnGG4TX3XAIvzzWEFsmBl9JXcuuqcAi5vH3EPIKorjtPlj4/5A5n/Py?=
 =?us-ascii?Q?5ar+R7qjguQANv3CofnNiKiFCcmPfV/YO08Sjx1EWWIv8cjyk9npumcHmvXC?=
 =?us-ascii?Q?BNgZzx9dojyvi7VhtbP+PJ36JUnRM/+DeDD05WsUrp7ioBR0PxtnhdhkF1X1?=
 =?us-ascii?Q?HLTKxhuP/V5S0YIf0psxXSoB9lKh9Uwni6Wi+YpKGhpFhwDnJ79aNtZUWkvN?=
 =?us-ascii?Q?kijQBqAXVcnQxEXCdHJ60JBFQFsDgSnOKsW1/xdYQW3tNCebYgeshSPZlHqN?=
 =?us-ascii?Q?J1dTtGh/o8JPph7mTQ/z+r3Bs2ygK5de/JfsYm9sSA2mQJ4ZEHG7SUv6eRY3?=
 =?us-ascii?Q?PuFxbBaqQPGshlYlXIxMlKCNj+d59FctwIq8kbXaDhnJ2KEcewwlyCaKaM1N?=
 =?us-ascii?Q?Mi5unQZoP/sEQloRLHYEVmCiZYWnpcalmuexMh1hqPXpt32SKph93n/31IFE?=
 =?us-ascii?Q?u9Y3biBHdoYX6utgKx1LqmQ=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d3a7b0-ce0b-42c6-3ad1-08de398f28da
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 15:00:16.2644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6W/4URK9La8Z/bVY9y0CiCJo76TkqVlPp66Ep0m5DvL+xDdUgSAeCjf7sOEe9xCZBu/nPTgjlVeYEA0pY8RcosiA0vlhEd2G0SzcjMku+PZKB8UCk/gP3SuMiyVnPZ2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1122
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 21:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122620

Backport the fix for CVE-2025-55004

Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commi=
t/55d97055e00a7bc7ae2776c99824002fbb4a72aa]

Add below patch to fix
0006-ImageMagick-Fix-CVE-2025-55004.patch

Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
---
 .../0006-ImageMagick-Fix-CVE-2025-55004.patch | 67 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0006-ImageMag=
ick-Fix-CVE-2025-55004.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/0006-ImageMagick-Fix=
-CVE-2025-55004.patch b/meta-oe/recipes-support/imagemagick/files/0006-Imag=
eMagick-Fix-CVE-2025-55004.patch
new file mode 100644
index 0000000000..59805b6a69
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0006-ImageMagick-Fix-CVE-20=
25-55004.patch
@@ -0,0 +1,67 @@
+From 13089a79a67ed0f1408fdee09f89e6e2497f10c6 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Tue, 28 Oct 2025 13:55:50 +0530
+Subject: [PATCH 06/18] ImageMagick: Fix CVE-2025-55004
+
+CVE: CVE-2025-55004
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/55d97055e00a7bc7ae2776c99824002fbb4a72aa]
+Reference: https://github.com/ImageMagick/ImageMagick/security/advisories/=
GHSA-cjc8-g9w8-chfw
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ coders/png.c | 29 ++++++++++-------------------
+ 1 file changed, 10 insertions(+), 19 deletions(-)
+
+diff --git a/coders/png.c b/coders/png.c
+index dbab45e60..343934ce8 100644
+--- a/coders/png.c
++++ b/coders/png.c
+@@ -5113,33 +5113,24 @@ static Image *ReadOneJNGImage(MngInfo *m
+       jng_image=3DReadImage(alpha_image_info,exception);
+
+       if (jng_image !=3D (Image *) NULL)
+-        for (y=3D0; y < (ssize_t) image->rows; y++)
+         {
+-          s=3DGetVirtualPixels(jng_image,0,y,image->columns,1,exception);
+-          q=3DGetAuthenticPixels(image,0,y,image->columns,1,exception);
+-          if ((s =3D=3D (const Quantum *)  NULL) || (q =3D=3D (Quantum *)=
 NULL))
+-            break;
++          image->alpha_trait=3DBlendPixelTrait;
++          for (y=3D0; y < (ssize_t) image->rows; y++)
++          {
++            s=3DGetVirtualPixels(jng_image,0,y,image->columns,1,exception=
);
++            q=3DGetAuthenticPixels(image,0,y,image->columns,1,exception);
++            if ((s =3D=3D (const Quantum *)  NULL) || (q =3D=3D (Quantum =
*) NULL))
++              break;
+
+-          if (image->alpha_trait !=3D UndefinedPixelTrait)
+             for (x=3D(ssize_t) image->columns; x !=3D 0; x--)
+             {
+               SetPixelAlpha(image,GetPixelRed(jng_image,s),q);
+               q+=3DGetPixelChannels(image);
+               s+=3DGetPixelChannels(jng_image);
+             }
+-
+-          else
+-            for (x=3D(ssize_t) image->columns; x !=3D 0; x--)
+-            {
+-              SetPixelAlpha(image,GetPixelRed(jng_image,s),q);
+-              if (GetPixelAlpha(image,q) !=3D OpaqueAlpha)
+-                image->alpha_trait=3DBlendPixelTrait;
+-              q+=3DGetPixelChannels(image);
+-              s+=3DGetPixelChannels(jng_image);
+-            }
+-
+-          if (SyncAuthenticPixels(image,exception) =3D=3D MagickFalse)
+-            break;
++            if (SyncAuthenticPixels(image,exception) =3D=3D MagickFalse)
++              break;
++          }
+         }
+       (void) RelinquishUniqueFileResource(alpha_image->filename);
+       alpha_image=3DDestroyImageList(alpha_image);
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/me=
ta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index c40aef1b46..c209faa29c 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -29,6 +29,7 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git=
;branch=3Dmain;protocol=3Dhtt
     file://0003-ImageMagick-Fix-CVE-2025-55160.patch \
     file://0004-ImageMagick-Fix-CVE-2025-55005.patch \
     file://0005-ImageMagick-Fix-CVE-2025-53019.patch \
+    file://0006-ImageMagick-Fix-CVE-2025-55004.patch \
 "
=20
 SRCREV =3D "35b4991eb0939a327f3489988c366e21068b0178"
--=20
2.34.1


