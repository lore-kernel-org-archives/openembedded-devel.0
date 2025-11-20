Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D83CF8865
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:26:36 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30081.1763628751698612110
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 00:52:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=n/r0D/Aj;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.227.41, mailfrom: divyanshu.rathore@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHC5cPvYfsOzraqfnrHmAxGp1vpmIZenwyIxyG3bceQ/zO3WMHraAdayMlrHwFu4w5lm200lD6m7U30XkBdcpjl6bD4fdBjRjc6FLeUryfhmmeSWTnsrwibxyTMFKk6d6WwdVgdki4Jpx/YznVkIiU+sdCF4Xq5bug/99FLBZnpodT+uX2lk2uCimDrgGxlUZfhk8CPtjehA4vfXgT2knyMF92UQTp7/45BTZXRQinwgXUPtPsjJBfnlDa5WeCyoDuyTzsSOIzMOP7ijeD8kemSMBxfWAqJs9MsoRhWLcpxHILMJtmGd4M8E4sAf76hdoDCh1JNJfpBbfkcXjEfPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qM6FPLuXwm0vdWFq4ICsPi7C3yCRSXTuSpYi37WNrM=;
 b=HUB6rWhKykeHWjQFrZgfBTtmBxaAifAik71br+Q55bdFC/mIf1oAa5+xv7SWRgvkO7u3bjRf70wprQ57/dr/CjWlM/AgspT+Jrp6LjaW6oUm3T+JWHITMHlO/eAImqqsRrSk2RW7NyzD/JAhL+chjCpHSQtOcmz/oZKogiF5FBGNf2/crpT+UX8TyFf8rJ+woRAUZ8p/wB5JFIGEFLRN/lsU0SSsNy+fgMf7UQlLL9ZSY2ZvXVhqHNeHu1pMyiQCj8ir065XO16uHO9Av2YS+3NZOabhICF1E01Jxk0VfVm6SRSoaR0RnGkUMzGsFauiTtLcPLL43XWWA8iIFVolZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qM6FPLuXwm0vdWFq4ICsPi7C3yCRSXTuSpYi37WNrM=;
 b=n/r0D/AjHcY/uHP497GQ/XEH+o1XbnqlXWl2YFRno8J3bG+8aeLkrnz3uiI4fwIkybDN2xwEuemIZ7trD3EeMXeHpvo+p2wblktgC0qHIkQskJpo2c4iApMuP8Mn9QfAfVkjsXwK9wOT7MafPrdo7RNS8BgN7tBr/SrthiQrKtmwd2g5AvdAJpmBAn1CUNL7WgjJVasUIzdUS0df8j6rhwEuJyxu1lqFoqKcH6lr1jJMpT//Fiw3KYkFU4HBX30wBkKHsZkoV6BpGxXdvBwDzC3EhKQsGITIh5GB/qQeNyWtiKSf3y7IbDsZxZZAe5F/nc46cPsWlzU/7RQkVsRv9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:143::11)
 by MA0P287MB1011.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 08:50:15 +0000
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483]) by MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 08:50:15 +0000
From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Sana.Kazi@bmwtechworks.in
Subject: [meta-oe][kirkstone][PATCH 07/12] ImageMagick: Fix CVE-2025-57803
Date: Thu, 20 Nov 2025 14:19:54 +0530
Message-ID: <20251120084959.51761-7-Divyanshu.Rathore@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
References: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
X-ClientProxiedBy: MA5P287CA0130.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::12) To MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:143::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3378:EE_|MA0P287MB1011:EE_
X-MS-Office365-Filtering-Correlation-Id: 18c87933-3756-4256-a93f-08de2811d340
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|52116014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mUZ4bshjFHLAKx8XAm5FalSEC4yHTdurkeRDeWvEFsM/eqNR+CAg4Os/xV1/?=
 =?us-ascii?Q?Mk82mLq5504eqkJZ4TcpCplVvS6KZjNifi0MxeOwg7RRIcga98s5gvZkX8XR?=
 =?us-ascii?Q?hvooFhATvZCWJcYc6jQtVTCIoz1L1DEuQYPn3pQnPCYbsbqp40AwXBPSllax?=
 =?us-ascii?Q?uJx+Ld106LG5GMeGDAI0rnZhpja/gdRCGN4HD+xMkAFOZbihq24CU3E/Jk2m?=
 =?us-ascii?Q?SHYs6kYK7KOOwDV1lufDH1oaz7gdh+U1rbjuHjEGYomM7tIi55toyKaHI6sz?=
 =?us-ascii?Q?d6bLdpgnO5ZrCWpkdskwbx+abci3fFAhOnlH1bYbjxCUqI3wtTQFK5Qwyetk?=
 =?us-ascii?Q?XD4b6VcfNyxL08GOvj6mdaM2UPJ5gI5e7lOgWyZ395QbKcuopaGPe5nXxC+m?=
 =?us-ascii?Q?nuqZh4NsksazS4CG7gwV9ry/+QTq+aWjII2RLa3lqwUULX1L8b7+KaAeDPLi?=
 =?us-ascii?Q?yoX2pZQcbbfRi+vGcCXwTdfCFFtkDMx+s2zbllDUxpmzUl1AvMYin7L8bWbp?=
 =?us-ascii?Q?JOy+O8pb3lFlTYntg7sND9SYfo9o130USxRG3BTupwMhfe72zWjIt2IlM6KS?=
 =?us-ascii?Q?KPpeyEn0eho0G/2AibucI7wCxlCF2HuAzSzmPWTAcmyZF6qidAXofC95Y6/A?=
 =?us-ascii?Q?FynrN09TZVBPDRj5MIA2ESEIhmxdXuGQcNDJ6a/EPhBVoYp2l3ebZdstW3cW?=
 =?us-ascii?Q?Ug2K/A7+09fv3nb50KDp/EoIm/L/qCpUbJCmDDdt+R5NNDCwbC002GGH/qVs?=
 =?us-ascii?Q?5nbgLbu88Y/kUyW3Xl18f5gBboXOwUr4swtRjjz7AldwYjQ4NvpYmoioyWXx?=
 =?us-ascii?Q?BI511V6ZphdKxGGKrn5cScV9FjlGuVeC+Jbdh6HSNsFCGM+kZApotFG4BbAe?=
 =?us-ascii?Q?I/XQ/jFc6vZCkflZyj/A3Wfc4XfYisWzbfIfmTH+Tj7NG61FymOBLJLpQ71k?=
 =?us-ascii?Q?G9rR2Yx9vyfxiUCZ3wURKZkEmDfQHFDFz4HOXMxN584AHL7xduaxGWixRich?=
 =?us-ascii?Q?MzqT+Bw5VoDnIp240Ws48Uhb6j/2jorCU74d1KyABLyigZ1YEJDYgbGhBqzM?=
 =?us-ascii?Q?L6ZYfpF6npXqWZ5wVdma26Y267RftDDDv1+8USpylJGOMrzz9+lRe/R0ARDc?=
 =?us-ascii?Q?E5Sr0+3311mE+7OQTulVdCOBAvn5Ragwgpvoe71JoEdSTiGueU5GqqnWQ1TP?=
 =?us-ascii?Q?ioIfG5Yjpw7R5eAWFmkGxO8tb3ONquiN/vVJZfPBBVs6GYhEd3OC2xahpYN8?=
 =?us-ascii?Q?1MSHCl6dhGxZ0m+C7F3AvutIsnVP3N5N/hWhpAoOKQFJZvHEwwD+dC90lN4J?=
 =?us-ascii?Q?SHrvOJkRm0sQkTNwjyIA/HEwhKEsXsn8rIXMatw2SowlHQiJvDlNdJ16Nat7?=
 =?us-ascii?Q?UvZ6ZvFqp6wi7FjGyWTXInCZSSQor/JfW+sBaReFdU5JQSCXjyb5okdVw1i1?=
 =?us-ascii?Q?c0PRk0IsTwPyF8/xF8QScI8FHcr2SL05?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3378.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(52116014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N9zHwIxwNoyEtQTfksKXM0lAmpDzt5k7O88SAUlXI5Qz+rU6FCxYfNyqtD0d?=
 =?us-ascii?Q?cWdWjWRNE+LnsUL8AnFTvwcM999WLQK7jC3+E94XcGLhRB+ec0/U1yB8LoTD?=
 =?us-ascii?Q?g+2VhocMwiwebEmnmTnyMbfhQN59ub+/wu3gaDKeFRqivc/NEwJWnYrVTW56?=
 =?us-ascii?Q?iLMrN+txaKY5fSf590hAjBWTPyvmpPaReu2EfshdGaE/WTz+/Qi1c2CrMUAT?=
 =?us-ascii?Q?6CLuzpmssLwg+dh9GDvFHtC5jyB0LMEuJegPCFHAX0R/CMDGVFhnJxm3CsS3?=
 =?us-ascii?Q?73oIhVPMu5wC7b0szF7Dbc1YqNDvTCMlGwos0QtssbHiL6Tye3jlJ4C4eTxi?=
 =?us-ascii?Q?zqxiD7do1Y0BaqeqedOyGSX23aXJFGu9bmrbHKCaXlzCPVoM8TWLxgfYkrfn?=
 =?us-ascii?Q?V4YJQlLx4Rx1Bynf75lZaHlaFjY41J6D8GkaW7pl4q/9hlL65pU4T5dvhHBP?=
 =?us-ascii?Q?kWxe09KCAhuaashtg3us4qxx27Ks/u6kHePTylYK5uoTvbH3j+jGKBPKKhh+?=
 =?us-ascii?Q?DuPSkELRKzGDd0d83D1qhp1vQUJ9EaTPFXSuosAtaHvblnNo2XsRGi0w52vF?=
 =?us-ascii?Q?SP4A04r3aMAVIETgdWq/fU+72iTImI8LlPrVS2PFxXXNB7KPGkmxh4yLcdxH?=
 =?us-ascii?Q?nN5xFk8F7nd0GxN8tZq9u+aYpIDtqPZ/8X4E+0G8jgBn2JTl33MyxbsA9/po?=
 =?us-ascii?Q?h+KNYLSv8icyChtr3eRzZw6uLoZNulFjla3XiBM0l7DweoTPwIJDb/tukR4D?=
 =?us-ascii?Q?04Tvr7sKE+lznLS5EwrynzuYhUQHQE/puAW3mq3T5ARxGiwqzFukIZjXOvfE?=
 =?us-ascii?Q?3Jjn3R1Jr7M/pwVIROTmzY0IYwnd76EsY4H9GE6xfEZDCaKdytfJtbOdJNWx?=
 =?us-ascii?Q?beCH8qV76YUS0LNU4T4EbYHfeYkSNmPhKRxxj5BFPlsPgCAWI+YPswQmoAt0?=
 =?us-ascii?Q?lz260j3+IYXD/FJD4+qUEdRyPPtlBlSUMMhW7EmtY63JlaNNb544ocmjxzp6?=
 =?us-ascii?Q?lDnkian4cWzFG90ZU7U0D1NXNykt4rtrSuwSPnA7fvvZkXP47+6zW1sYQ4Qp?=
 =?us-ascii?Q?mz7XppnpwE80I25l0HlbON+Sm4fZ29p3rQnTMYIN7gLQ/dbsz8aH/BrZ5sWW?=
 =?us-ascii?Q?KVB1g8VbhqA6rnB377nbCxPnymS+yDMI2S0LgrNaULUBCi5+uREtMNxb76Pv?=
 =?us-ascii?Q?fQQ2wVBsxonoYv1gtbQ9/WkTc2K+t8Iy7umB4tyZXqey9itjoLuP0dmtWbim?=
 =?us-ascii?Q?2hVEnoRqa4cqpF5/OKA1ZD9TA9zih+bk2JrImU6gXe6lDd7qTSYiYQNbWnct?=
 =?us-ascii?Q?ZGPh6pkJdCerckGV9m3aS2aj57sbZAER48TvAZkX3MV1ek5h4n/llBy1Bhe0?=
 =?us-ascii?Q?0SkGlwaxenn3516ropu/Wi4d88WVgHAS6+1mt/dKgqyFP/65Ly95Yvb/0Yij?=
 =?us-ascii?Q?jejWXo1gcyGXDX3syHjLNccgwryEVCzpbvDEZEJM+ibYWfJaBMgbYTjGI1EB?=
 =?us-ascii?Q?QeGkvfvtcLwwzq4TVrYMd8ijLuQKgD32DvYW216JYg4KLSoP2MaCqG/LbhH9?=
 =?us-ascii?Q?h+uRFtHnQa/lx4RsXnTi5jkG0Lid2k2zPmjPShh8TRuESPqsRtyZMft2EAPP?=
 =?us-ascii?Q?aC9UKVXjopVEA124zlRKLl+2ZNf9Oj/y9WiF/DfbR7FLJjegzh0sgXE52uEA?=
 =?us-ascii?Q?fmySOvryX0+1OrF8zh42nyOqWeY=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c87933-3756-4256-a93f-08de2811d340
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 08:50:15.8044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hl8uztdgE3BQSdX2uQ3MQ2DEGD5vcbsxxNWna5QiuvXWLeilIpq0/KU0EEzhyk+kWTGJ12zyf3+0z+EwB8VaVbpa53OT56Wny2IHZMX9y6nQ4HYZdmiOG+VeahCCx332
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1011
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 15:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121938

Backport the fix for CVE-2025-57803

Add below patch to fix
0007-ImageMagick-Fix-CVE-2025-57803.patch

Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
---
 .../0007-ImageMagick-Fix-CVE-2025-57803.patch | 87 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0007-ImageMag=
ick-Fix-CVE-2025-57803.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/0007-ImageMagick-Fix=
-CVE-2025-57803.patch b/meta-oe/recipes-support/imagemagick/files/0007-Imag=
eMagick-Fix-CVE-2025-57803.patch
new file mode 100644
index 0000000000..77660e998c
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0007-ImageMagick-Fix-CVE-20=
25-57803.patch
@@ -0,0 +1,87 @@
+From 13bce1a21fff8cd8eb1dcde5f3571945b0b6d447 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Thu, 23 Oct 2025 23:41:32 +0530
+Subject: [PATCH 1/8] ImageMagick: Fix CVE-2025-57803
+
+CVE: CVE-2025-57803
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/2c55221f4d38193adcb51056c14cf238fbcc35d7.patch]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ coders/bmp.c | 31 +++++++++++++++++++------------
+ 1 file changed, 19 insertions(+), 12 deletions(-)
+
+diff --git a/coders/bmp.c b/coders/bmp.c
+index a46448a95..beff10bb5 100644
+--- a/coders/bmp.c
++++ b/coders/bmp.c
+@@ -507,6 +507,11 @@ static MagickBooleanType IsBMP(const unsigned char *m=
agick,const size_t length)
+ %
+ */
+=20
++static inline MagickBooleanType BMPOverflowCheck(size_t x,size_t y)
++{
++  return((y !=3D 0) && (x > 4294967295UL/y) ? MagickTrue : MagickFalse);
++}
++
+ static Image *ReadBMPImage(const ImageInfo *image_info,ExceptionInfo *exc=
eption)
+ {
+   BMPInfo
+@@ -546,6 +551,7 @@ static Image *ReadBMPImage(const ImageInfo *image_info=
,ExceptionInfo *exception)
+   size_t
+     bit,
+     bytes_per_line,
++    extent,
+     length;
+=20
+   ssize_t
+@@ -968,18 +974,24 @@ static Image *ReadBMPImage(const ImageInfo *image_in=
fo,ExceptionInfo *exception)
+       ThrowReaderException(CorruptImageError,"ImproperImageHeader");
+     if (bmp_info.compression =3D=3D BI_RLE4)
+       bmp_info.bits_per_pixel<<=3D1;
+-    bytes_per_line=3D4*((image->columns*bmp_info.bits_per_pixel+31)/32);
+-    length=3D(size_t) bytes_per_line*image->rows;
++    extent=3Dimage->columns*bmp_info.bits_per_pixel;
++    bytes_per_line=3D4*((extent+31)/32);
++    if (BMPOverflowCheck(bytes_per_line,image->rows) !=3D MagickFalse)
++      ThrowReaderException(CorruptImageError,"InsufficientImageDataInFile=
");
++    length=3Dbytes_per_line*image->rows;
+     if ((MagickSizeType) (length/256) > blob_size)
+       ThrowReaderException(CorruptImageError,"InsufficientImageDataInFile=
");
++    extent=3DMagickMax(bytes_per_line,image->columns+1UL);
++    if ((BMPOverflowCheck(image->rows,extent) !=3D MagickFalse) ||
++        (BMPOverflowCheck(extent,sizeof(*pixels)) !=3D MagickFalse))
++      ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed");
++    pixel_info=3DAcquireVirtualMemory(image->rows,extent*sizeof(*pixels))=
;
++    if (pixel_info =3D=3D (MemoryInfo *) NULL)
++          ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed=
");
++        pixels=3D(unsigned char *) GetVirtualMemoryBlob(pixel_info);
+     if ((bmp_info.compression =3D=3D BI_RGB) ||
+         (bmp_info.compression =3D=3D BI_BITFIELDS))
+       {
+-        pixel_info=3DAcquireVirtualMemory(image->rows,
+-          MagickMax(bytes_per_line,image->columns+256UL)*sizeof(*pixels))=
;
+-        if (pixel_info =3D=3D (MemoryInfo *) NULL)
+-          ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed=
");
+-        pixels=3D(unsigned char *) GetVirtualMemoryBlob(pixel_info);
+         if (image->debug !=3D MagickFalse)
+           (void) LogMagickEvent(CoderEvent,GetMagickModule(),
+             "  Reading pixels (%.20g bytes)",(double) length);
+@@ -996,11 +1008,6 @@ static Image *ReadBMPImage(const ImageInfo *image_in=
fo,ExceptionInfo *exception)
+         /*
+           Convert run-length encoded raster pixels.
+         */
+-        pixel_info=3DAcquireVirtualMemory(image->rows,
+-          MagickMax(bytes_per_line,image->columns+256UL)*sizeof(*pixels))=
;
+-        if (pixel_info =3D=3D (MemoryInfo *) NULL)
+-          ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed=
");
+-        pixels=3D(unsigned char *) GetVirtualMemoryBlob(pixel_info);
+         status=3DDecodeImage(image,bmp_info.compression,pixels,
+           image->columns*image->rows);
+         if (status =3D=3D MagickFalse)
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/me=
ta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index e9b125e71f..e1519b13fa 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -29,6 +29,7 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git=
;branch=3Dmain;protocol=3Dhtt
     file://0004-ImageMagick-Fix-CVE-2025-55005.patch \
     file://0005-ImageMagick-Fix-CVE-2025-53019.patch \
     file://0006-ImageMagick-Fix-CVE-2025-55004.patch \
+    file://0007-ImageMagick-Fix-CVE-2025-57803.patch \
 "
=20
 SRCREV =3D "35b4991eb0939a327f3489988c366e21068b0178"
--=20
2.34.1


