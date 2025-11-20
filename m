Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA56CCF887D
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:26:36 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30081.1763628751698612110
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 00:52:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=WNb9WH92;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.227.41, mailfrom: divyanshu.rathore@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2OMBf/wJTEqr+bMeA1zSqSdBZ6UABcJjjf1JVvmiinxwTNSPFPKNdJSXDZTEOxssF1kNmfDIq63zMFwEGSzsXCq1YfrmDaJ/ZQ/2CW7T429H2zkzPm3EqJZC4RWb7Xw3ODywUm/+sfzXvzNMPWY3OsFfpdmtdYg6H2H4wszPYx8DD59Vg3RMvlKECsfpClePBq+u3jcQ1vGVtaay+8MEHOE57dIJ95RGO6tBVY/EfepAeubDe8ET2z5AnFSMYOumSMt3/hEmoW9mvyKCq3OvA/SY0ysEAv/XTwEUB9hd0OM1/+K/0dYHw/dvkZc7UgGyTmEJhByjY0uEHh+6//0rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtabBPxa3cK+YZNewMul1837ya0UaCRbh5LAmCnin0k=;
 b=nVz+pn0AOPVgA7O6+k/h/Rf1PwACPzGvkPm60ESl4FVD1TIOWoL/c+kPYFkaWy40+VC1VCLenu/h1qbIIVd3WHKHAIGy819t/CLCs3aAWQc58diF3Aex0D3nRDy/aMEP8YkvGZMHqk/Qf+NmsnBuPeTZLcf3ALny2tH+H9mebFTdnd420JUkQCJQVHr+1ZOknETOQIPcFE10YVCgMZfcQGhjMnMoto+sX2C/1LV51dSApilOzgRK/MePhzn30EmI3UqLW/lhbfSiQj8Rfd+weFVdBAM9b4QV8+NwcCaw4PG+AIFhPSl82rDdKbXyD8eQSvpUEIF5Fq7Ubrp3BnPQMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtabBPxa3cK+YZNewMul1837ya0UaCRbh5LAmCnin0k=;
 b=WNb9WH92zbNKZnCmOpwWZbhj3x88sidyBo5oyYtnA+Fa0Eeamw7dY5Tqkl6x4jKNeRiArVWq0d9oRvKmot+8+5MHTKmPyZNx90QJbGEk7pQY1EHy3BH+CYqA+MKgT5cA2mE7wlnreump5rx/INhQsKJBb3pUFd/4s9LAlIm+hCQhuZuQDd5hsNDBdtJGHAwMFeA6AlRDGwrZzhgOH4jtub8dG3Xr+byaFyWVhALrMBjchDiaSKoNwN0Aa5yceQuLHAM+nySVgzRKCFT9so0SaYD58OK7nZlDParRIrI2iuGJJJmiLXBJXk3ykkEkoh6SCM/XhXWmwEaXWgyAkgWd9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:143::11)
 by MA0P287MB1011.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 08:50:11 +0000
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483]) by MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 08:50:11 +0000
From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Sana.Kazi@bmwtechworks.in,
	Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
Subject: [meta-oe][kirkstone][PATCH 04/12] ImageMagick: Fix CVE-2025-55005
Date: Thu, 20 Nov 2025 14:19:51 +0530
Message-ID: <20251120084959.51761-4-Divyanshu.Rathore@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
References: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
X-ClientProxiedBy: MA5P287CA0130.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::12) To MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:143::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3378:EE_|MA0P287MB1011:EE_
X-MS-Office365-Filtering-Correlation-Id: e2af79cd-c4b5-4304-119a-08de2811d0cd
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|52116014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bDDx3qTAGrpehbOGfNtegOQBTFcHrdQXq/65fT7O6IZwRSXhea7f715CUga5?=
 =?us-ascii?Q?BC4R+3E+cUh1ZsbuR1uNWZ5qjmvvhVqEPl1QsLLrCldujr1sXucZ+of4akur?=
 =?us-ascii?Q?ToPKIIW4r/iCpIaR+/31C/23+4KXsUc66TucZ/JvSeIJQ1oxVOnPWwhvjdPo?=
 =?us-ascii?Q?baaa4FJtgx5OnZ+FFBVz2QF4FyDeG9Ban+fNoohHYGN7fcSRUhTh/f/lHoJM?=
 =?us-ascii?Q?XuAjVB6VDOChQXVcuXAeQKEopA6lRhfGoswOtsF0Qbmgs8jeQLoRgjSiiWbZ?=
 =?us-ascii?Q?wsv/YY35xW0u9535/xlI622CJh/ra0839WUQMYiZrZ4sfPvOAAhS/xejOU0W?=
 =?us-ascii?Q?Qc+iXiAc5LL+vYVKMVRn2bXw16NC0LfANjx8RhVU1wx1Pp06BGT5hkpDlb40?=
 =?us-ascii?Q?mIKyItyHXA2re1ZXTLE02/2keEHh2tfPV9YGaUUqCRX7UpdoqxcG3MqH1h0X?=
 =?us-ascii?Q?zE3o1/PQ3OVNgzTXQgUHqgcvEPDwS0f/5EM95VkZgC5wDI3Tg+hM+QsgYOpb?=
 =?us-ascii?Q?h0K0KUJgpIwXiQ7Ukuk3OSzN2Zj2pzyNRBOuQRcwOL8iLTlL1cEcQo58oZSW?=
 =?us-ascii?Q?gVSOm4VI5BcRMmnWhAwJ+ruuLJ92Bw5BR1JZDlVKIs4DfGmz1ytq8cnXTsjH?=
 =?us-ascii?Q?Iie4OyhHsp+xp0vMbSbcQpqTcoWykyaASYgNRuYupTPus3ximZLi3g+dANgy?=
 =?us-ascii?Q?zysKQpDD6Fvd+E0sp65aCXAOpfmyFSFKiLmZMhCY18cYrwLANT8QZol1KaUs?=
 =?us-ascii?Q?vdKP6fBtdn7A7Hcr/XpiAhGBCOmyhp0NrE0VB4RZfbz2ZK2ye0br+qROKK2M?=
 =?us-ascii?Q?e2mf4roGhrOMMRc9ZrSOCeYLxOZlJ3EjEQ2wM77kiIbRTK7rEx6WNS6jPCcx?=
 =?us-ascii?Q?H45XbMpmyR7uuBrahGBfUZceSTyIlP2yuiSFIIcWRt6kewmJ1Rs5BUwym4rZ?=
 =?us-ascii?Q?Z4hedY4pAFc613LSi3EnB6/cmv44BVIgIScmYpd5NDyWFMDvlOdxb8cw6e5e?=
 =?us-ascii?Q?7C9WzVQVS6JAVvpkmcO9jxlLCS4mfo+39TFupGPCVuMYpjws9alwHObZR4Yr?=
 =?us-ascii?Q?VLoQzOeKIEHg8LTaxhBUiC1+kii/WEyX7XY9WZrQSaY8zuexTHiVsQrpkcGE?=
 =?us-ascii?Q?Y+KFax8uFh96TZNYFKaH9ZfQyNz1VK6PzHhAFa5h1m+Kr3L80GObsO10/Bax?=
 =?us-ascii?Q?gtaH6SlQfPqcV8EWa0+woRRKbSPn++yPUiMpuVuMfY3OWum+sbWczQcy6OLN?=
 =?us-ascii?Q?ad4UZX6nvLgzPA8ACoEPTadVqJA1Zl7Dva3f6q4ooV7ZLuEDIL401mvoce31?=
 =?us-ascii?Q?dHBtsRghwQTpFw0JKewzUSxv9AwxRleyA344GTL6znQn41aMJFCR/sAQnJzM?=
 =?us-ascii?Q?o+JC3PsDpvYThEzt5Aj9snaT7cxPHPHmI++QqqbrkyTjYF5v4qXoDPoFlox/?=
 =?us-ascii?Q?baOiXIQvUydbzB0TyLGb9nrcIOa0Zi9p?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3378.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(52116014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?29WHAc78OBkZiV0uLfUVkdJDxLcq2xPAMcSMAwE2tjMskv5g1140dVWKX22v?=
 =?us-ascii?Q?sHgBs9Aqmy719u7MNt5J5/NC+elB8McbzEH6ZQxEyTFJ0cnfakcSWY2/F7xY?=
 =?us-ascii?Q?+QxFMngW8XtWt0djXHfK63Jo5YQY2/tv667raz44UPo+CzlI40/27jEbpGMb?=
 =?us-ascii?Q?iq16+KPlJCtKJotEMvqTXTvHp9rilf8sCEnY/Kws6x77SjqfWOdWKM67gKKc?=
 =?us-ascii?Q?SYXKgOXcb+lHQ5FMMbnYNreGa1b9/eBlmmF6x/yv3g+jO93799h6rcsWdVbN?=
 =?us-ascii?Q?2mDQFNvoOyWV+GpiofolxWGxh5n7KvsLdwUyAQ/NvignXkvYQt+RbLQcazCK?=
 =?us-ascii?Q?/nkXJ/jKVc5lemVoARx2HwwcFrr/2TMHO0yHVna7dZ4UKbFIuD5g9HqpTSE+?=
 =?us-ascii?Q?VLn7jiarlPYbbqRGKNjMziu/FLy2AdPXXBh3YC+QOk/aIhAet+elFFuORpPf?=
 =?us-ascii?Q?Nc3HrZ1UUO/Sp9HV5jtHcEOHnItF7Jxm5Qb16lRVxYFp9Ul1HIXR0gWJ5B0X?=
 =?us-ascii?Q?Ryksw5htyzqJY+BzaWff4mWX3WXq0Us62Wm8RFIqd0tXjNWnQDOWYHDtRWz/?=
 =?us-ascii?Q?i1I6QlL6/IWucgwHSRUJHnLd5quxgAUFRoTomx4GL9TBgJKEGaImTPh8tAhF?=
 =?us-ascii?Q?k6QrXqTA0CEakumvru1KQxjErN9n2r9vsIdJlk4rds2pOYLnArOw576JA+2u?=
 =?us-ascii?Q?ysTaRnxCupj69mjLSZy06haL/RqIQYHiSojdRsSLfdERrsXIc/ck2hvlQusv?=
 =?us-ascii?Q?JkQ/jsTAmPGpLftDoiqewat7VO7jS401eGvx/s73OsP7XyfHIxGKeSsFg/XY?=
 =?us-ascii?Q?3S1csN307KiNFS6RvtDtZbEgmdL1/4tNsEPVdwgH5x1+6qg8KiO1CL1BxC4e?=
 =?us-ascii?Q?Tyu+fxSo5tzNhJznnP7Ljzg/5ZeMnet+Fah3ILzETE/42gVPVXygBe4EDCjU?=
 =?us-ascii?Q?r3QUHFj+i3DAitKEvg6L6QucaBYb+hb52hGF4PIss6HpF27QvSn1Ijbfz+ag?=
 =?us-ascii?Q?ER5SK+jCN0s7Ge4LEBnoBleacc0wNsRuXLlylUncFMpTdQOK6BPKSodb+lKF?=
 =?us-ascii?Q?ZwxQ1QxtYdeSVDTV61GnMhz/AEtBjGYLQs+oihjumx+FNLLm/Xa7DDTZpqtu?=
 =?us-ascii?Q?3RbYOfl2R9yf1O99poU3dsNzXz1UYVCCjKi36YtqCPzhs7mftrlGz3+VeHOl?=
 =?us-ascii?Q?g42UeWoki3aQJ/iGeOJghNnzHszSdWoiPzBjuyK9YHvb9ZIdMjrFWKHCxxw7?=
 =?us-ascii?Q?88awSPH0rsl3vJ5aNuQpF/rcmhuI89jqFOocR/DcYe/NB1ptXRbiDn++XYHt?=
 =?us-ascii?Q?1S+MevJKxymNYGDx71wrYK3MWw0tfl0Z5PaKszX3J5ly1ghxrBXusqVJGfMS?=
 =?us-ascii?Q?At6DL+V+zlba9ejGlHk0rtJ/efdE+xMxw2Wsm2Bi7adoeNBc4TcYUxrM6nz7?=
 =?us-ascii?Q?NiTVqFqPa6rImqACED739eXou/1++BqjI8LijtC7dJ/1orr8KxGSogqBgRVl?=
 =?us-ascii?Q?AOaXiFq5+B47zoSlOd6h8y5QXAMJ4UsTg6NwPI8lV52PmNppZw4SiAEQw9zX?=
 =?us-ascii?Q?a1dnpMtxZXfb6TShwchYmAZBJ9R3iYrgE2kHdAHuqPggvdgQ9zj56FcMisKN?=
 =?us-ascii?Q?t0jIH7r1Csw7MuYH+2OXP7jy1cJCRk287KKOHEDWLhCm8NfGf2J1JhyzSoTb?=
 =?us-ascii?Q?Wkv8NLMLUqS8cGOeKuEMAAEttUg=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: e2af79cd-c4b5-4304-119a-08de2811d0cd
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 08:50:11.6897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S54MUOmVJxxyQSS5IqWV/s4ZbeDx+UcifZqv/jER7ZrWOpO2ehG5R69Nddv9DhWHLOcT7GDleAxRlwTAjvwIIhDMiain3IXsrtJcAlgbSIlE3PtKaUCoI4/8Tm8CIiA9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1011
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 15:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121940

From: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>

Backport the fix for CVE-2025-55005

Add below patch to fix
0004-ImageMagick-Fix-CVE-2025-55005.patch

Signed-off-by: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
---
 .../0004-ImageMagick-Fix-CVE-2025-55005.patch | 40 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0004-ImageMag=
ick-Fix-CVE-2025-55005.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/0004-ImageMagick-Fix=
-CVE-2025-55005.patch b/meta-oe/recipes-support/imagemagick/files/0004-Imag=
eMagick-Fix-CVE-2025-55005.patch
new file mode 100644
index 0000000000..dba99452ae
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0004-ImageMagick-Fix-CVE-20=
25-55005.patch
@@ -0,0 +1,40 @@
+From 5e055e54cd9707e965fc9e7f4d87f47faa6c0074 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
+Date: Fri, 3 Oct 2025 17:40:59 +0530
+Subject: [PATCH 4/6] ImageMagick: Fix CVE-2025-55005
+
+CVE: CVE-2025-55005
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/b68bb6d3cfe472d5bd9329b4172e2e4f63d90a57]
+Reference: https://github.com/ImageMagick/ImageMagick/security/advisories/=
GHSA-v393-38qx-v8fp
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
+---
+ MagickCore/colorspace.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/MagickCore/colorspace.c b/MagickCore/colorspace.c
+index 2ffc72f88..0aeba03f8 100644
+--- a/MagickCore/colorspace.c
++++ b/MagickCore/colorspace.c
+@@ -2493,10 +2493,16 @@ static MagickBooleanType TransformsRGBImage(Image =
*image,
+       value=3DGetImageProperty(image,"reference-black",exception);
+       if (value !=3D (const char *) NULL)
+         reference_black=3DStringToDouble(value,(char **) NULL);
++      if (reference_black > 1024.0)
++        reference_black=3D1024.0;
+       reference_white=3DReferenceWhite;
+       value=3DGetImageProperty(image,"reference-white",exception);
+       if (value !=3D (const char *) NULL)
+         reference_white=3DStringToDouble(value,(char **) NULL);
++      if (reference_white > 1024.0)
++        reference_white=3D1024.0;
++      if (reference_black > reference_white)
++        reference_black=3Dreference_white;
+       logmap=3D(Quantum *) AcquireQuantumMemory((size_t) MaxMap+1UL,
+         sizeof(*logmap));
+       if (logmap =3D=3D (Quantum *) NULL)
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/me=
ta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index f41e471f0e..224f55d03b 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -26,6 +26,7 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git=
;branch=3Dmain;protocol=3Dhtt
     file://0001-ImageMagick-Fix-CVE-2025-53014.patch \
     file://0002-ImageMagick-Fix-CVE-2025-53101.patch \
     file://0003-ImageMagick-Fix-CVE-2025-55160.patch \
+    file://0004-ImageMagick-Fix-CVE-2025-55005.patch \
 "
=20
 SRCREV =3D "35b4991eb0939a327f3489988c366e21068b0178"
--=20
2.34.1


