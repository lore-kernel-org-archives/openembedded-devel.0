Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925EACF8869
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:26:36 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30423.1763629551121970004
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 01:05:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=gcf/bAFo;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.227.25, mailfrom: divyanshu.rathore@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQOsBeuXCVYV9MxCJt6znI8uJvxpBpzhErNYDlZMqpETK1bXcpkFd1i2p4qZaLvcNkGWy8fNWhXEeqBDRJ9DKasIn/7CC+olKk+AvHEQ8QNJcSudoodGMCdueVvoA4v5Crcwg6+N6wosKtAZhaU6nXq9QWMN5QZESQjnXsc4vpAan+Ynk3n56/CYXMvwkOLy96cDUJhSH0+Aufe9qfaVzbeH3WCMemBnvAENLz+MmK8HD2cK49mrrR0PRXh6NFB0eGIOgLkTKkRQn2rWojRcZu5V4kVcy/vPHHrZKqGDLV8m5MHgP1x0szz0SPFAdSgVEK6xyUfzJ+UX3zvjvEW3Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfxW7OHXA9jp5LV5jKjGJLp2iblPuPby+7A+S2nLH8U=;
 b=EgDzjD335XGf6n3yZ6suSfsqBah/i4hqOlQwfbf6NVL7XJOkKJiEhMAQmD1Z9D6b5Ezna/GGCP/Bjr5CsMMzQDK6VKvcbi2LhEMm7SD0nkcnU7WNvXgwrrwBUWguByUppURUFnPAuIbp1yy7yM1DC0DjVZjICQSjnvfNgIik4SwmmsQLa8XHkPSimc19VeNZXJi5DTuJYoF+ih3yja5EnXWozpSRDDF4AMGP7E8vZFqB8IRp2LHfIUUy7Fb+UfVYFwf/bG/+BT5UOF6yBrO/6KOFDfXfxYbMt/J22LVVIqZlxjn8WtXCRQ93KUSCyTXRm1oyCFVmUue3zbSXcs1VFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PfxW7OHXA9jp5LV5jKjGJLp2iblPuPby+7A+S2nLH8U=;
 b=gcf/bAFo9FjAHvFtx1czj1tdllYi/j9kcqTDy4NaJR0/5VUd9msDcSLXa/KBm0xq6jjzsmcj0Tz0KUEMJWa+LNRdAsVaq/H7f4953U9Ak4DR/HiORtsytJazG8cCpTutlhZZx9zN2lNni0YHHEHXQ1aJJys2Rt6nw+kEFKqA8Pgv9pamxDYbpYpPWy34zGWjvLT+FA0nufpAVIs6ACCOg2qsCeMw0Ud84sj6eY1xaTCKGNEZN8zYtFmItCfpoNvIq/gf4fEEuU3Qlxb0nbfasujRx9gxH94R33kYhxZkZOq0AO2+tcKH5Fysof0WAQTvdUuvw0orvEdlLtSKqNuOTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:143::11)
 by MA0P287MB1011.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 08:50:14 +0000
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483]) by MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 08:50:14 +0000
From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Sana.Kazi@bmwtechworks.in,
	Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
Subject: [meta-oe][kirkstone][PATCH 06/12] ImageMagick: Fix CVE-2025-55004
Date: Thu, 20 Nov 2025 14:19:53 +0530
Message-ID: <20251120084959.51761-6-Divyanshu.Rathore@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
References: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
X-ClientProxiedBy: MA5P287CA0130.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::12) To MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:143::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3378:EE_|MA0P287MB1011:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c6efe43-db3b-4fda-3ec0-08de2811d27f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|52116014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9ZtPm1cGqZImeVsEwV4ElXRguUzz5XMbBSaudmJv+W+WHevfdxD6b+lw0k7m?=
 =?us-ascii?Q?pKTDokhr0hI1JXIA8BphLXcW4qLvrxnhv6YIvRGAhG/v8MaduapY1aqICZqc?=
 =?us-ascii?Q?t89N6UN40SF8PzQPLHXS4//YedSiS5Yun8F9Ej/I7QdsWOaBlK5e/EjGDenR?=
 =?us-ascii?Q?vKB1dS/fwji5E+M8BXbMf0qTg/Fi48A0tNIdQ1Qce5TX9u8LF3zYGvjJoHMy?=
 =?us-ascii?Q?QUbL1I420flywTUduuJ7hDQN1g1IHPOG/W8v8mkV8CvcnY3W+aItoS4D09Xv?=
 =?us-ascii?Q?UNXf5ETj7gF9CExZNueYtXzgt3lEQ/3jVDmYQJp60k5bT3q8m6hdZDdjg9ho?=
 =?us-ascii?Q?jRVM2FiKBeJDPZfeA4hkFKi1L4yQ3IgKl4NZfl873x0MhlEMtC018i0NIIWC?=
 =?us-ascii?Q?d+DspkMhWNvLx1jP03sfYct4aRcekU55abIW5KeBns2zu5Wmj5g4hwprEovw?=
 =?us-ascii?Q?gldOz1rscXWhH3Ji7psyB17hQfRbE47bDq4dwg9g3glhgl5MQDQEJaktZENt?=
 =?us-ascii?Q?a+vhgXZJseZQVvfSKE6Ym3xghlfBDjRUslLXoFlDXbN3UI3bk8PESHFmDAZc?=
 =?us-ascii?Q?kGZt8nR+Y45m2f3cZEgETAgC5uT3hImo1kzkCNc+SgpTUNbubztqMYe90ohU?=
 =?us-ascii?Q?BiMEdVb1zMlvduDxm2vE5hnNifaKDA7uKQXlKIcsHfS3ac+D1N4qLaXbXMdJ?=
 =?us-ascii?Q?Kw8YHOs9FL1WezgCnZ6FuR1D7yFkMGtk3b8xQnEpJ2F++tvb7uRL/r1Sfo5Q?=
 =?us-ascii?Q?OumF+7+1nmCDEpQL/yf6zdrA+0xhwY4qkpJSrto7f8mAkJGiPOAziecnnr0F?=
 =?us-ascii?Q?T1Iv1WkGRSaGt/jerYNxNXL5ACJQfTmcw3rZrn8waihXlmr12U3gbigmvPn0?=
 =?us-ascii?Q?ehDeefxEt2d+m+P77IhKTEmv1C80OufeIh6eP6Hbc6IU74uhJX/wado/FNrj?=
 =?us-ascii?Q?3l/sLfCOXuAw/CHfhadQ5ShUOJ3QTzzzsPY4GOO3sg8fmHha3a0mxlzasQoq?=
 =?us-ascii?Q?Z5HZJ+hzK1o5TUmgETs4ZebahCk2PpPdf4/mlpUVoP6dGPo12WawXHklhHMS?=
 =?us-ascii?Q?YlQqKqmep4NMn2CkV7uYOt0ciJwGrA6vzYjL35DW10UoDxM+NuNX9keN6lgl?=
 =?us-ascii?Q?SW8WmnnzrV0vVf1tB9xlPuxBFjaLj61QYmK7A4I2kdOutiZ1Y4upfjxuifnV?=
 =?us-ascii?Q?g+9uuTpBPoJVwZhz5C1YwkezrbZ4AaSEc9xQTAEt2UJi0B7SAxIP2RWYPkU7?=
 =?us-ascii?Q?uC/tO5/3I8YpfYc/Z2JA/+rEsTCm65NiLSa3viYxkcP2Sp0g1gSYlxNGxrer?=
 =?us-ascii?Q?aPILpugE4WOU1u4jrv1U3J5wdyuZMFQLRHUlt8pjw+/repUFMPeKPBVSY91m?=
 =?us-ascii?Q?CeNOPGgnvgoBMavUMF1rtG9KOLymQUQ0zrVKYF5SlZvMpTrrr5vzCCNVn0F6?=
 =?us-ascii?Q?FHqUIewf0c/SojFG3hiPbi6uD0YuTi8n?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3378.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(52116014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VRSZtpf8iaM3swhAxeGciuPc7R5VMkDfnc0BVmVAW96yRgneII5rKIak1fiP?=
 =?us-ascii?Q?lgoYeBLX7TfgFUj5N5zZAKfy1t0tJXJdl9rcbsCIBJijBEzLTi0MuAKfn+8x?=
 =?us-ascii?Q?+9bi8Tcc/mAPic3G0QMFU17dw4dvPgPEleiPZCv7hfBwIRjjfvJdt9IsRc64?=
 =?us-ascii?Q?g/GUCtMhb0PL6aZwz3pyRwjCOJBJ3or9vEFmBMrA7+QvQmNZCGr7Ex/bqTgQ?=
 =?us-ascii?Q?76oFSRI0ek/TEHgWRCVz50Q5cT2p7XiBHtRsWThma7k5tpzi0HbQYdD7a5Z9?=
 =?us-ascii?Q?di4v6qgdV77CK5JfWH44T2SoA2DkQSuUoVGiRwleOvQqsuTTLMrrpPLN20k7?=
 =?us-ascii?Q?7lLNJWLvJbcYQhX9kvr6BiNJJo7qtlTqHzyzP9PCIJ9n/6CilolCyRN70K1y?=
 =?us-ascii?Q?VPkpbkl+lhM1HTZSiAFWPTJOeh4Qxd6KvadB8ltCkhkt4AndC5lApgu8H+hS?=
 =?us-ascii?Q?1Day7O2qNqOpJSf1AQ+Mmga8PoG7WJrQDj1pYjdaWNJS7ddeg3LLJO8jZXKP?=
 =?us-ascii?Q?cVJ/R3ubZC6q1RQzI7VYDGsHRZ0ZivP/SbrT8LPrUeCFdne6U/ye3sLF5yLG?=
 =?us-ascii?Q?f16AwgqeHFFG6k2dwznKJpUC+HI/TjlrcFmMIFzKrlT7biX/Xxb91bSEPuyY?=
 =?us-ascii?Q?8Z6KiBfzDuEf+h0NpyPkO1CR5i50DEPQZ/B9ugHehDVtMPrVrAWTHLjWcO2D?=
 =?us-ascii?Q?qCvMK4Zvwc7itaTIxuOc4XqCqHiptewdqc6lZ+B+cdRiySDNgWkuDqTazmC7?=
 =?us-ascii?Q?c+NvubrPSJjY0ow0IW18OORoGUvTktaQMEpNKJWXho+ZPmRg/9hTE13D01VC?=
 =?us-ascii?Q?8e3G9Lt6I/6gPP0HRet2TCZzPxTlNBEUGoJM6u9R2dQR2v9zYFBgEYcbPTsV?=
 =?us-ascii?Q?9riE/Yo4GhiTNufbi7ZHxU0F2KKOjvA8b4YJKVr47JeH4dcmkO+LNsdxnDeo?=
 =?us-ascii?Q?AOcCCOdPRk3kT1XYH62hAEQFoqPWlj7B/XEVwZfJ3N1xo62WeUFtMCyk/kZB?=
 =?us-ascii?Q?68YkTC5WGO9/SJ5wtVl9CQ51LdswKZZkvmEfbGwoCsBMlo7JoQTQfJI/taTw?=
 =?us-ascii?Q?oBInZ9SC7EmlURZ4t+LrfwkvqYeUjVoWaYDrBL73P5DjOZ//O6vrc+qmZREN?=
 =?us-ascii?Q?QnbApB+fuQ66FOGiAvEqDYUJFVCPk/Hn8uPte9bBrGo/z3wnaGiQaOTUU6UK?=
 =?us-ascii?Q?yLachZj1XKAwtryGnl5gCPLRw7AbLL/J8eb0BwvTJH9wduz+XXpJNscs4tSJ?=
 =?us-ascii?Q?SNGGhZ+G/Y/6j8ZLEBKTjO+Z0AwqBevLTV940SCytwlRDMkBSDVSpxeNdPug?=
 =?us-ascii?Q?EDqxFymI3pYGOMPE+rriy+7bjoM5V5OYnhln27aiFeItmSGZqZ0u3vVLc/mz?=
 =?us-ascii?Q?39aL819i7NQiNalc74qDzcdTWYY5Xojrcl66bxf3ET8uG7Rl/CFjZnB+SBel?=
 =?us-ascii?Q?/LblUekBj0YckvFIuaImgqzPzRuPYuJ117o68/4srKTAH4hkEslABnKvcP0w?=
 =?us-ascii?Q?lm0zq5Y2GZEOVyg5e/ao8xfDz3P09fzlXvdmJ93kFV181XgwK+5D1MHTCdm1?=
 =?us-ascii?Q?Ra+8IYmJgCY1xLu4njGp1NUUvUCjhtRmLDghg65cP9m5ftcsDZE8cooa6Hyj?=
 =?us-ascii?Q?LhqoHiUBd0WkZHdh/6cWPUwaw9u77lUbNRM+E57M7aUwIEEi8Funa1gwJjkV?=
 =?us-ascii?Q?Tj3eaomjttbxkbtSUqBXBIP91ZY=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c6efe43-db3b-4fda-3ec0-08de2811d27f
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 08:50:14.5174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndKb/WKEqxneN9uFZKftS9eSXFsUZNGPVL9gSCAkYtGO+4Ba51LFYb01A3gCXKpyik0ttsHv7dJpQ/p+01q7VzubH/r4W69WyuQLgTOUzOtNshdGrRAVdZdKt6G6qKqR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1011
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 15:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121943

From: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>

Backport the fix for CVE-2025-55004

Add below patch to fix
0006-ImageMagick-Fix-CVE-2025-55004.patch

Signed-off-by: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
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
index 0000000000..34765ed194
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0006-ImageMagick-Fix-CVE-20=
25-55004.patch
@@ -0,0 +1,67 @@
+From 1d8878f2010eec5aa1feb22640af37ce66a1199b Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Tue, 28 Oct 2025 13:55:50 +0530
+Subject: [PATCH 4/8] ImageMagick: Fix CVE-2025-55004
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
+=20
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
+=20
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
index 829ab2e525..e9b125e71f 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -28,6 +28,7 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git=
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


