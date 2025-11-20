Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE4ACF887A
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:26:36 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30416.1763629508148231347
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 01:05:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=AhAWwDgM;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.33, mailfrom: divyanshu.rathore@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGv3otiwnKkkkchyKkX+dCtmSPNt1UDwWZwubbdY/PKKIHdYGAazvdsFgRijbuj1ZEC1tVfaxkiOKu2L16ip96F4/ZmaLy2frsSyxjhjINwmhV2sjMGDFK9iylKnAFnXSl3PW/E8U2nzpr4JB8Jq6XSTwPB8GRCFP09TTGZZesnH3raaSoDBULPYF8puC5tV2yshS8PAuyAsnxsAQI8b72yl98beefj2ZT8YKU69czdWG+Q17bgaKxOk9M1gs/kjcrLk7tDAACKgjZV0B8SCJFjNA42wTbOw6aUca2cb3lsIoUGOzb2HPaj6JWhS0MoHOvma5k1vjmEvfavoEugBxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpDZjrrhJKjotYg8HNcK5w/UjHUKLzFn76SvOogyNZs=;
 b=TFp4JuMiw5GfUZWjJuS+X1oBNlESTwiDlkJsLtJb3rkfwLGppt0S0GJxOgteI4RgebnpiPOyf3Kr3gUw9sjuV96DGUgycqZVvavjWTwdLN6DUFa/0Mz/Y4vDEhn+hdguN6qq3y8RGDCWDp8JiZ1KUJ6fgY3GWz5dzSRubAb15x7JOGjYO8jI1QPOU3JTxUETNBe45K2G5gF3WffNXCqaqSfgJ9f6/FbUP7OARAsj1ZbqbcRpxeFQdviqGCQazcM8+Fcp7Kmk7V3FVNOl22fqQYzHE1qJSDezpUEXnxqEmkHGGkkkZw1WWWUDWtbXgc6XOpxK6SjMNyK6RvgDUGgLvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpDZjrrhJKjotYg8HNcK5w/UjHUKLzFn76SvOogyNZs=;
 b=AhAWwDgM99yGbsdzL+25K9nOf/lCTrivfjLLqcmwAgOuw6zkWevqYEboppeyItsaYfDiP+10nrZUrdNq2baUddMNwdEZC7oDUhOxQDshumOa70oomt42U7+CwHL8nKXQeKaFyfnQd2ygvkFzwhaDco5OVrJs07wVKr4mvn1FGbGwmo17Bz5Iw44h+lq3EQzutljwTduUN1Z2ruQbAS0AoKd2snMyYjsCpyj6W8qMSfsr73H1wy8/d8zPlkkG8uTF2nkiShJ7Ww9Em1InMcH9a8WcCEwOnnqtE5pLLDmiYJXXvDVT/SaeiWpUzSN6mIyBiFCQCchZzXHmFHF+58PX0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:143::11)
 by PN2P287MB1004.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:134::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 08:50:19 +0000
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483]) by MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 08:50:19 +0000
From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Sana.Kazi@bmwtechworks.in
Subject: [meta-oe][kirkstone][PATCH 10/12] ImageMagick: Fix CVE-2025-55154
Date: Thu, 20 Nov 2025 14:19:57 +0530
Message-ID: <20251120084959.51761-10-Divyanshu.Rathore@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
References: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
X-ClientProxiedBy: MA5P287CA0130.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::12) To MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:143::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3378:EE_|PN2P287MB1004:EE_
X-MS-Office365-Filtering-Correlation-Id: 3416c5a7-acf6-4ab7-b91a-08de2811d586
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1CT95vN/9fnxI29nlNjGbta7Uk0Xf/ITucKxIdTrmv6O/ef1vyPtx+U6Fe6Z?=
 =?us-ascii?Q?n1eUzW0u0XFXnhN4fNRHSirOkaxQM5hEOl8m20P8J+YJEpPXP17yZs4ZUJA6?=
 =?us-ascii?Q?NuSUXhnQ7fss8WjQXLRZ4xLmMjjAuhNQMwftlo9BBWu3Pd5h3IE6+1Z+xvOx?=
 =?us-ascii?Q?AEU11l+UCqaVZuVExIZiYgc2QPQzE8N+qDlMqe3O1ak13etI/zV2RQSQB7CC?=
 =?us-ascii?Q?VVnz6gjl6CfXi/tmnVlReP+vgFm5o8zdDdLVtDbpoyMUcKqkjqPh1QsNqxic?=
 =?us-ascii?Q?MWNavCAioAPHMlX4SC5LVshY97/oMk8eYBmw3/4THpIked5OtUoVBVSL1lSL?=
 =?us-ascii?Q?9F+FlwXNN2lLzCMTITCbuuutIwVAB/iSXTGFK+DEMOYln8Sl00w8PIzFeH/Z?=
 =?us-ascii?Q?MwB/W6JUaLE6RZHEvpW3L0kexa3njY4f/H9WE8M+j3VfFTethH/1q3LAP1HC?=
 =?us-ascii?Q?T4dnSLW6HW4yzNYuhcG/6x7IeL3+PdTGb6ENe9/vRlNnKB2Co37n9Spsa35G?=
 =?us-ascii?Q?5otknLVAK5WQTS55TbQCNweKuH2yrRQcZ6lYNf9MIWwPbGnPgF/bUeofYt8l?=
 =?us-ascii?Q?/S00hBqy2mUTlJUeNDVHThT4GBJtHkHNuUCzjT2JfjRAA+0NGauRefe/2kYs?=
 =?us-ascii?Q?Poa6lD5TpCflSxrvXLPKq2WZJex4UeZ8uFbgiXZbQs7iULLZTOgC7hTRHAdG?=
 =?us-ascii?Q?BvTvB9Bij5tSjkZtXE3ybUZZQa/ukiVB8UsR+jDNCyV/vPEAsheZu1xWpliQ?=
 =?us-ascii?Q?aScMgs7pTQxIvc9z2Jm+F/7c6b6so7FVtq/vcE8p3RBku36wj6/916ODegtx?=
 =?us-ascii?Q?U0fSBJo8p//iYWAfTg4EPiEJcpVIBVqrE2x0V/HXCqTOoBiXzA89hkjeCOPD?=
 =?us-ascii?Q?8aPUDnhozqeLwVGKLps47vPY+OudSoy9C7mpE57Pvb+vg93ZqJpP3JQiacxt?=
 =?us-ascii?Q?aNT4faChMYjszbptWXvyzBfjKATcKyM04Z5AqNJSuoUIL2Jd/Up/IB6xf8Vq?=
 =?us-ascii?Q?lxDT5NuAd0s9he+fVhAgbn17ZXZmwWg2Vg8yfcbS9h8BXyHUQEYe+C/1gVLe?=
 =?us-ascii?Q?kQyEmh0KVckCoE32K0ALgQVwGsriFvbgeVQWarWnnD0mx7JRiJ0AKONcCK4S?=
 =?us-ascii?Q?49qfpTVMZagA6XMYEoZA+MNSv2fthSt4HqyXrb6LYlEVf934mfiaXCxAg+EF?=
 =?us-ascii?Q?0+ftXm5pXY2bx5HnpICb1J00CO8IAkv34X+ag+gzgzvFKE3ChHn7hD1Kuf+f?=
 =?us-ascii?Q?gl3kOsDQM8+xOmYpzOavGDFi52tVchTpnprOmnt7rvahTGMGEKSHQA9H5UeB?=
 =?us-ascii?Q?lHe2yMU6mEF7dz6deZ+Is1BgUgPdz/JGBP/7fUv0CnT6C4chXe0qW4Sb20NT?=
 =?us-ascii?Q?Vz8owh7RKmi+YBvmapZK3iIFrbNG/YwyfVVQBMQxs/X0lu45pFDCT9YP0P8z?=
 =?us-ascii?Q?SFhe7bpoyig8STmfOYra3T6aqJfz3ALJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3378.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ekuqH7N5WyikT99AepjWl+TCHcml/jsjTlAhzQw0Skkz+Z9sBQZMt835NMLR?=
 =?us-ascii?Q?ZE0CBi5mcSem+ZjkanDoY801izUpsW6vrGLq1RkklJpB8fDBO5oqoukN6lN7?=
 =?us-ascii?Q?lBfxHYgcr5MJQft04sYM/RXOX6D1AG3/Rug1+IlQhaCzwjokKMQX8jcLp36/?=
 =?us-ascii?Q?r//tc4w7dZsu4NrNQhfuczEElmNEvDJhXDpj0QgOwmywHUJuKHhi9w1P821d?=
 =?us-ascii?Q?7pwLXLiuwuGa6eZcyk3XZrJ60PV0woPRQvz405/ldIb3cthb+b+I+HgoSjmq?=
 =?us-ascii?Q?IAJtcGulYr+eay0NIdoH0lFc2xTvAElED1XVBPsjl/D6ay5S/LJLeoI1xtu3?=
 =?us-ascii?Q?4RZhNAsiQ/4L8uxOoBCWl0rMDvsL2nWQClaVrz2ZmFAnWfIHAd+LK0X5WpT3?=
 =?us-ascii?Q?hvcf+APUwMfjlGIQ/b1ZJ+xZIimRGhwXT3Ieuye1lNUxiEe5iV8N0PyGwrQV?=
 =?us-ascii?Q?ngxmUQXw1/v1eRrVAVWxxM8hG/LpvR6nc8QfkAXVK9ntTPomLqCtJPUTck6Q?=
 =?us-ascii?Q?tzFvBk989121x9F7WLUQvjC8LVkwc4vwbV92q1R3xkzw/PIISHWhpJyBGyqX?=
 =?us-ascii?Q?Vh6gZl22q19iDVtrelMJIOXcX+yUr06wk7Lb72cttfI3aiTJFig4lnE3YSmV?=
 =?us-ascii?Q?b1H2d8kUJ1FeDb3v/DBu1vjwKRubaSLfwRTMEQPhwnoYpI6zZJArsKOH0oOG?=
 =?us-ascii?Q?zR0FcCCukNExu/+I/uh7t+W/Oq1Wm+/msDAijuXQj5Qcr89nA+9vhLs7LNls?=
 =?us-ascii?Q?AqXVb0Bvq0TtuSEOORqr8Hiipj4PHn++SqWGcxGMyITZD04YGkpXk448k08R?=
 =?us-ascii?Q?EsrQraYzy05FV5Jnkmhj5PUH+1T3tJHiESJugkh12r75FR7l+3naqPnNGFqI?=
 =?us-ascii?Q?xE8HFb4mlFFcW5KI4i5OE2WsAEAq7RwuTrMcbpKxWayfTsluCzcFWJLyrfsq?=
 =?us-ascii?Q?ffjgaSXwjRjV3ame4rmKN4VZUHscEXcPw4+7TczUY8bMx5GfCCsqAbe7oT46?=
 =?us-ascii?Q?J26RlO0pPfcWNVUVo6kbhO6eb2gkkw7HbfsTQ6ik4xnqYH7oGl2pFgjFkKzf?=
 =?us-ascii?Q?tTE/h9R9k8twuj2lIbTcwVnIjT6OUK5KfStvFLY/RiUjkNfVFGLngdM5aU51?=
 =?us-ascii?Q?2aGPyM5W78qXGTUTEPjjZjPQmE5ox0UAJwFBULjYlV2zlalcZTKS4xTRVEoF?=
 =?us-ascii?Q?fV+FjSZfkW5WJL+P3VJI+eVa6Y2kPmXRWS+nZC7Od9B2N0IlrEDemPGFk+Jf?=
 =?us-ascii?Q?j19yPPUzdHh1Ra4J8+/ge8i+mGqImA6Aq6GmI8OhZZCGIZHJJJ+wrZnWwfOV?=
 =?us-ascii?Q?kb6yNlkjUkYPMSEy4DZy9nz6ptxbLYG9B+ItPKau1CWd/2kkIR1sPU89mHY+?=
 =?us-ascii?Q?DZwaCz1fEFLeypQq+BDFOKVMEzEIrcG+Xf8wk0OlKO/mgxroJm3l6crto0J5?=
 =?us-ascii?Q?uoMYb/u2lErtMm0wHbEBQfpgovNS8i8ro41MHmDpyOcWdTB3pGOYLX6Vdk/a?=
 =?us-ascii?Q?jmOA9EaG+F0qpesUJNhTRVck6NfWMGvauMkXG5REAb0xVgKhIWRBwJ3xAJ0L?=
 =?us-ascii?Q?oKA7Vopnikm6pYhRU/HGgKXfxeadlNWzHthOF+NDJHYh3jn3n4jzE2mFb2F9?=
 =?us-ascii?Q?jAiF3gZOZ5loQT1MyxwauGAUY8EUQdhmhDezkg5b59ijHzdN+KS+vDEstHFF?=
 =?us-ascii?Q?W7r45DQj4PJGyM1T9wRx83nS87M=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 3416c5a7-acf6-4ab7-b91a-08de2811d586
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 08:50:19.6515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qsb4CsnifvqLujlqx0kYNoKzlVdFHgQogZ1R9VSOBomtKXaostYnKPbYqaKubV7VB5arrAQ0GUtlJqPuVkx62241PIJ5YpAf9dNbfyw8Opu8znXWoOH+Xry0tWQX2L7O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1004
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 15:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121942

Backport the fix for CVE-2025-55154

Add below patch to fix
0010-ImageMagick-Fix-CVE-2025-55154.patch

Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
---
 .../0010-ImageMagick-Fix-CVE-2025-55154.patch | 84 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0010-ImageMag=
ick-Fix-CVE-2025-55154.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/0010-ImageMagick-Fix=
-CVE-2025-55154.patch b/meta-oe/recipes-support/imagemagick/files/0010-Imag=
eMagick-Fix-CVE-2025-55154.patch
new file mode 100644
index 0000000000..f8b752c274
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0010-ImageMagick-Fix-CVE-20=
25-55154.patch
@@ -0,0 +1,84 @@
+From b6192e6f3952140099372ec287e773832b511326 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Tue, 28 Oct 2025 14:12:27 +0530
+Subject: [PATCH 5/8] ImageMagick: Fix CVE-2025-55154
+
+CVE: CVE-2025-55154
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/db986e4782e9f6cc42a0e50151dc4fe43641b337]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ coders/png.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/coders/png.c b/coders/png.c
+index 343934ce8..e730edb03 100644
+--- a/coders/png.c
++++ b/coders/png.c
+@@ -6841,19 +6841,19 @@ static Image *ReadOneMNGImage(MngInfo* mng_info, c=
onst ImageInfo *image_info,
+               mng_info->magn_methy =3D 1;
+             if (mng_info->magn_methx =3D=3D 1)
+               {
+-                magnified_width=3Dmng_info->magn_ml;
++                magnified_width=3D(size_t) mng_info->magn_ml;
+=20
+                 if (image->columns > 1)
+                    magnified_width +=3D mng_info->magn_mr;
+=20
+                 if (image->columns > 2)
+-                   magnified_width +=3D (png_uint_32)
++                   magnified_width +=3D (size_t)
+                       ((image->columns-2)*(mng_info->magn_mx));
+               }
+=20
+             else
+               {
+-                magnified_width=3D(png_uint_32) image->columns;
++                magnified_width=3D(size_t) image->columns;
+=20
+                 if (image->columns > 1)
+                    magnified_width +=3D mng_info->magn_ml-1;
+@@ -6862,25 +6862,25 @@ static Image *ReadOneMNGImage(MngInfo* mng_info, c=
onst ImageInfo *image_info,
+                    magnified_width +=3D mng_info->magn_mr-1;
+=20
+                 if (image->columns > 3)
+-                   magnified_width +=3D (png_uint_32)
++                   magnified_width +=3D (size_t)
+                       ((image->columns-3)*(mng_info->magn_mx-1));
+               }
+=20
+             if (mng_info->magn_methy =3D=3D 1)
+               {
+-                magnified_height=3Dmng_info->magn_mt;
++                magnified_height=3D(size_t) mng_info->magn_mt;
+=20
+                 if (image->rows > 1)
+                    magnified_height +=3D mng_info->magn_mb;
+=20
+                 if (image->rows > 2)
+-                   magnified_height +=3D (png_uint_32)
++                   magnified_height +=3D (size_t)
+                       ((image->rows-2)*(mng_info->magn_my));
+               }
+=20
+             else
+               {
+-                magnified_height=3D(png_uint_32) image->rows;
++                magnified_height=3D(size_t) image->rows;
+=20
+                 if (image->rows > 1)
+                    magnified_height +=3D mng_info->magn_mt-1;
+@@ -6889,7 +6889,7 @@ static Image *ReadOneMNGImage(MngInfo* mng_info, con=
st ImageInfo *image_info,
+                    magnified_height +=3D mng_info->magn_mb-1;
+=20
+                 if (image->rows > 3)
+-                   magnified_height +=3D (png_uint_32)
++                   magnified_height +=3D (size_t)
+                       ((image->rows-3)*(mng_info->magn_my-1));
+               }
+=20
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/me=
ta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index bb0c148fd7..af0a3149e3 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -32,6 +32,7 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git=
;branch=3Dmain;protocol=3Dhtt
     file://0007-ImageMagick-Fix-CVE-2025-57803.patch \
     file://0008-ImageMagick-Fix-CVE-2025-57807.patch \
     file://0009-ImageMagick-Fix-CVE-2023-34151.patch \
+    file://0010-ImageMagick-Fix-CVE-2025-55154.patch \
 "
=20
 SRCREV =3D "35b4991eb0939a327f3489988c366e21068b0178"
--=20
2.34.1


