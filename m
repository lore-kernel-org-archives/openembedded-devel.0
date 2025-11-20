Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE83CF887B
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:26:36 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30081.1763628751698612110
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 00:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=znFadXyr;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.227.41, mailfrom: divyanshu.rathore@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqWpHaetX9ApY7VkhTZcEPMC9lmsLbo95dVZ/6ZF1FROSishmk99I3GsdLeKv4AvZ/9m8BnshB9ShVOl/ATTwa2mQ1MuQ5ACj/C6tDg39m6+IlhLHd4XGiuqSw+Lfbt7C2yL92aL74y4z9R+tW8g6X+YEJw/6NxL+8l7ESfIPKKWmSEeCqROJ3Tr+A+cYcbeVA/XW4IyrslVspkJ7LIxhmWgYi+n5rAzR5eUBtwly9koJgzw/zhFqPuVowWNAgGaOw3aMXHykhfKIHBekzg1roRUAzqJyw3TuG9qy46WHBjcUWjqod3AkwHH5u/2QfYfK709L8gVXvs2y1vwDRrbYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8T//vs1vDhIrVXAI5t80S9mNr+72xagDryJZrHEvDFE=;
 b=IknFUEH1utw9n94C64h0dYqCeWLBgsrEjXySaoGlSRogbArWu+d1Syw7btEKDA7zxudlHLJS6HYKmhioxmsUjf3YvOmj8ArK+JSwCwGzg8oN6FIO1HWqIDxxSxZNUz9NHSqBAe0Ja/m4zRKQZvioUmWvwlAeHl1YmpiqSD5fHO3zVW11kp0rqSLa5cyFvHSf5I23llelFZzVrj6iYXXRfT9dke3EB3YfV0n+YVelfO7cByxrDTWVC+TieaieCJzmf3xo/qMxvCQMbKIyYd9qJrgmk0f19PBQSWTWQjIxWlSVK6YITDqzFNhStpixzXlQ0CttogCqvjVltpjmoorEWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8T//vs1vDhIrVXAI5t80S9mNr+72xagDryJZrHEvDFE=;
 b=znFadXyrMSfK+tPc5lqe4mlFaoDPlpXskNWNfPseKEaj0Vz0SFFsQMiIbHXglC4Xz/5XdfUx7afd0f9a+BkptEqkYYUGSEnFeMtKamBmOVuNZPYCXagMEFHODjH1B7x4L8WxQPTaIcmvJGMBnwc7oMqEQ8uLzwE1Le1shUGa2DCMbnM9aLE8l4alpNTK1NXayw0v/k19q7K+P4IBqirraX/aeSaWN8QXf0Bvr6lN3haFYAgrhnkfguYt3jTyVRY4F5yPN9BQlmpYoR48DcSbPVv07+FhDYceLL5nFxbj8FZFVFvI9idpxbS8HtEMGXTb6If2+nVAwkjH8f5uAOyBIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:143::11)
 by MA0P287MB1011.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 08:50:18 +0000
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483]) by MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 08:50:18 +0000
From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Sana.Kazi@bmwtechworks.in
Subject: [meta-oe][kirkstone][PATCH 09/12] ImageMagick: Fix CVE-2023-34151
Date: Thu, 20 Nov 2025 14:19:56 +0530
Message-ID: <20251120084959.51761-9-Divyanshu.Rathore@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
References: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
X-ClientProxiedBy: MA5P287CA0130.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::12) To MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:143::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3378:EE_|MA0P287MB1011:EE_
X-MS-Office365-Filtering-Correlation-Id: f8f1937b-3458-4833-16f1-08de2811d4c6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|52116014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5mu3c7jY4v5OZnJnKCIpNsDd4PPZsY7laYCgDN+lyqpVqEpuPDAFH5bAuvYT?=
 =?us-ascii?Q?S0HjWJlnooDCpCBRDEp6SuqAssKwCX40sVeLe5yqld1SAtZc/CSlPPSUEJOS?=
 =?us-ascii?Q?PAD1CI/BzKGGXR3yZyGTx4JbJ2gIvxiwSV9OOnequVpiJa701wX6gMT4hXvK?=
 =?us-ascii?Q?wUQc6rCsDQC62980IYuBKCzoxtZjMs/CbK7ImAlhqkT+pZE7wVY7WzCPKDpo?=
 =?us-ascii?Q?R2sbgEamMll6hY//Xj/I/MSv0CNA9cdMuIegi3NDfBtuSdHv83oatZrmWdmA?=
 =?us-ascii?Q?MdyMqMqku+U8XUGkuHnLwc9UJMx4ZURSGMPienQklpLEF/YZ5Zl7X8ybezuv?=
 =?us-ascii?Q?BScOC9WrpxPuAw+Cuxx1cWzysgUFvsnEtxwDrnmCjrJrg5Pp4jhlyDGjXoEn?=
 =?us-ascii?Q?rkdorBsDZh0xns/Q3P+Uo1qskJQ+0zFYixZ1QAuRPAt1ZaBZ0ZZ/TSRJsDuF?=
 =?us-ascii?Q?TtiLY2Z/rooC0hUfZlUap7SXcSbejc6zoX9JPXGsmP/2vztXZpQLM/G6GNGl?=
 =?us-ascii?Q?WF0muKv78WR/i2O7IcJyUBRuHogZcPGQQkHmQ7XOLa/d+Ds31q25OuftXSP9?=
 =?us-ascii?Q?0OsJBCL5W/ETW2EYrLzsdJ0kjLv0+d14kOx+NpHpV97KnxQt11lTX5l5YdBT?=
 =?us-ascii?Q?b1p5KXs7/qxls7hcG3TZyxRo1v9brux6FmGkuTW1KzS4n0K8zpXyYyaKorPP?=
 =?us-ascii?Q?sLVZPZquJDbyIPapP60Pyh/tcCNarMileP6zHYJ8/vX5KvMewWN+UaEEmw+H?=
 =?us-ascii?Q?b5CvGBD5H1S4doxqA2Nbn2VWKr29kzGcUZbtHtDuUaGh4eqtxeq51Cg50TC8?=
 =?us-ascii?Q?8SjEAvEWNat40rQXZJuwl3D7RpbAYc2/hl4RgAwNyd/TLCEthmPusIs/trv5?=
 =?us-ascii?Q?lUk/9bxC5iJB1W06B3RnLSzJEzrbt+XUc1OZa8CDXy2jBLBBtthD9wVTYfXT?=
 =?us-ascii?Q?IdoeqzRzUK09zZ3UWCgrmCZ+8m9yroWhr2fFofHzwMO1ssXOoO1a4R1GjwPu?=
 =?us-ascii?Q?4g1A3sKv1L6RTVT/1owCuKerMvmVvVWP5ig6bMwIUWH/O4RiEuoO/33lgsz7?=
 =?us-ascii?Q?MGVPw44jMJNq/4pVZPTELQrCimCWfE4kGmp7Q+dTQNhObLoaepO271dDbaAH?=
 =?us-ascii?Q?tailymwLwqgL0b+8jYIBCjnX0dY+5VMXJvalvve7no0MR6UlDyOfP8ANu1+r?=
 =?us-ascii?Q?5v3v1+z0jQlolZ9qq+Bq6JlthHUfu4GDsBecP7SmvSC3nU5XZX/q5hX+Z7/P?=
 =?us-ascii?Q?6WaCMyuSf0uSxCWdq05udxm4NEljS89zUnWyx4qbGEj/JFRHMGhAAeTKPFd3?=
 =?us-ascii?Q?O3t6nLHZF1PeXH2lBJ0ASF3w9EeZsuu0JTOWX2hjHn4QaW+ozbwIglhPjA4q?=
 =?us-ascii?Q?xLhjFmOq4H71ieh/n/O93q3MuOPw9XDhOj9NVa3JcGn4UPqpd/bMVRmOy17P?=
 =?us-ascii?Q?vL1F5q+ZVL75RYNskO/wVwSYWctEBeh8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3378.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(52116014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?663B5WEbK/1UVEb0UzB5vY0+HRu7CTDItynUqkfG9coV6QwOOtzQQRGB7wCU?=
 =?us-ascii?Q?OUWxM6bJ0F/XGn0xO4/Qlw0d+A/SWBB2W7RtZMMUvNHPpGbjBzxIJeA1bnzy?=
 =?us-ascii?Q?9rHeNkbuWBNzxkLeVXkftWd6/YkQkxHUnAP/BqwWJ+h6bbvFD7YRFfmtibaU?=
 =?us-ascii?Q?cBqMhwngRMUrGcKmUqm55rH7UXq/VfaJOR6LJLu2flZFfumP+OkrMS8xBknF?=
 =?us-ascii?Q?+7pphHrc30pbYpHSaZQvzNomq89o35JVWrRGwZRKtG1M/q6ykDtDGxs1r/fs?=
 =?us-ascii?Q?gTAQhNdH0wKjcVAh1haxDgFJ6gB4gcaf0+OmlU2UPv4gXSULxN6ZAkg82RAj?=
 =?us-ascii?Q?mMzfMzsUkFEOtFyJvahr+CGdpUnE2w4GdUtnK61wRWlaxBY9RMNorMirqtOW?=
 =?us-ascii?Q?yTpKXHiVoSy8WNrR+6TVjS71xf2kyDvtbzCCurxXNlGznhopjybcFETeu3pB?=
 =?us-ascii?Q?0snhxms6osv3dX9RUbXagmfwyx+P05E8zownhEVbI2KgGA3e3+yvb+xTXqF1?=
 =?us-ascii?Q?360n2MjQtu/BRZPrPkUfSh5pXSx5z3qyvv+Hds8fzdygTLkFf7OwD0pDOvSx?=
 =?us-ascii?Q?P6ypTVSBDlcyBc0T9pFID5y0N2M3+Ya8dU34xLrBGtXUbJw2Ja+Fz0Oenhzl?=
 =?us-ascii?Q?RArtjFV66o3Y8tc3aXyg0RJJpSIIAwDC4IFykGJsGroc6eK52XqdF5gZv+n5?=
 =?us-ascii?Q?FMQ6QuX/Je97S8MZhpL1dO8Nmsk0CBEUdTzkbaLcN6ffpIT5g0hK4yC/fMr4?=
 =?us-ascii?Q?gRH5cWTqjEOz89S5MIKKO79AxKGd+Jzi63zXpR2oDHA3DIO2g0ebFU6yJmVG?=
 =?us-ascii?Q?3/Lpd/eGJRJdhuI01yo4J1qfN6SRrEDLRE6AGnArLgpSaWJpBG57YXBOzQIo?=
 =?us-ascii?Q?3bGkpb0Nr3qsjxVvFg5x303ZQ7J8guBcrdYu+WoauClV37XfjVXtXvqJPxAf?=
 =?us-ascii?Q?QEaGvNxqcJJyB0fYyMrP2v8A32DHtYJ+l4pn1eRHz+BXwJLXgpy0cjVj73id?=
 =?us-ascii?Q?BH9ctDrrqHCSS6sZ622uBGt6RCscEsquQt6QogWdJiorg6aa+cz6cubVU2ve?=
 =?us-ascii?Q?XJjz/QXyXnB4LYa7NFAtjHoN3brMaV1G36xNo6PoXvyvSO7zwp2cMyue+taG?=
 =?us-ascii?Q?vrC4eDzTtSSXxFOJFN/5O6aNLy+7OVb7w/2uSmKFX5RNEwXc6mk72LDPgdrJ?=
 =?us-ascii?Q?hnnKIIGt+zBZnWOLEUcuqLJwYRBOYvNz1ArnTBdxXEbz4iWEZC1W/7u53ljL?=
 =?us-ascii?Q?fgXs6u6CpxJ3zudUc1541zcGLCgC1DL3aB7ubGT4BLK+fwDWJTHHvlBqsj4y?=
 =?us-ascii?Q?lcLtrSaUGa3ow/j/Yu20QyrnWHpUSAyGOCsy0WWOoNj+qIYkZE9JJE2wqdaU?=
 =?us-ascii?Q?V1kdjrP0qu2nQQNN44Klq4Www25QPmCo5/uadRhVTIcpahz4orOcG3aE84Pb?=
 =?us-ascii?Q?561OEE/irbhgInKFDc9msEyqytXg8T2NizDlN+/Ckx2EJl+a4S8xP/fEm++/?=
 =?us-ascii?Q?S8uh02d2KjQKYla9/cBOiWVICwDFP377vaDSD0tpb49BPnbvwolZ99PGKMz2?=
 =?us-ascii?Q?pg/+NIeLYANzRltMBuT5pAW0WrLUTiF1u9MWeKhe1TOY2NsXSL91gX5MibsV?=
 =?us-ascii?Q?pWfDSEGVuVEi39yIVDVufXJj4+jC7yzdQZNIkNe95HBMu/5Z0ayT/1syavNV?=
 =?us-ascii?Q?Gw0yGyS6TPjDNjPZTj5K0IYsVHI=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f1937b-3458-4833-16f1-08de2811d4c6
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 08:50:18.3736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8vQe76ResWDYikXq+9vi6spZAABilxJAJX8d6Hsr4B1pSz/j4NSx8FzX81H9F0w4y/oCTPJQy9yHc5ahllVJuDNfBkgreftS8QMP1t+tCatIKEObCkPRvuBM9fmtzQY9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1011
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 15:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121939

Backport the fix for CVE-2023-34151

Add below patch to fix
0009-ImageMagick-Fix-CVE-2023-34151.patch

Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
---
 .../0009-ImageMagick-Fix-CVE-2023-34151.patch | 287 ++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |   1 +
 2 files changed, 288 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0009-ImageMag=
ick-Fix-CVE-2023-34151.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/0009-ImageMagick-Fix=
-CVE-2023-34151.patch b/meta-oe/recipes-support/imagemagick/files/0009-Imag=
eMagick-Fix-CVE-2023-34151.patch
new file mode 100644
index 0000000000..dd4802d75f
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0009-ImageMagick-Fix-CVE-20=
23-34151.patch
@@ -0,0 +1,287 @@
+From 338a66fd7b9ec918d4a9d31dcce4a7ca04df51bf Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Fri, 24 Oct 2025 16:17:41 +0530
+Subject: [PATCH 3/8] ImageMagick: Fix CVE-2023-34151
+
+CVE: CVE-2023-34151
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/3d6d98d8a2be30d74172ab43b5b8e874d2deb158]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ MagickCore/annotate.c       |  4 ++--
+ MagickCore/draw.c           |  2 +-
+ MagickCore/geometry.c       |  6 +++---
+ MagickCore/shear.c          |  6 +++---
+ MagickCore/visual-effects.c |  4 ++--
+ coders/caption.c            | 10 +++++-----
+ coders/label.c              | 10 +++++-----
+ coders/pcl.c                |  4 ++--
+ coders/pdf.c                |  4 ++--
+ coders/ps.c                 |  4 ++--
+ coders/ps2.c                |  4 ++--
+ coders/ps3.c                |  4 ++--
+ coders/svg.c                |  4 ++--
+ 13 files changed, 33 insertions(+), 33 deletions(-)
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
+index 5c6e2ad69..6541db8f4 100644
+--- a/MagickCore/geometry.c
++++ b/MagickCore/geometry.c
+@@ -1424,8 +1424,8 @@ MagickExport MagickStatusType ParseMetaGeometry(cons=
t char *geometry,ssize_t *x,
+       scale.y=3Dgeometry_info.sigma;
+       if ((percent_flags & SigmaValue) =3D=3D 0)
+         scale.y=3Dscale.x;
+-      *width=3D(size_t) floor(scale.x*former_width/100.0+0.5);
+-      *height=3D(size_t) floor(scale.y*former_height/100.0+0.5);
++      *width=3DCastDoubleToUnsigned(scale.x*former_width/100.0+0.5);
++      *height=3DCastDoubleToUnsigned(scale.y*former_height/100.0+0.5);
+       former_width=3D(*width);
+       former_height=3D(*height);
+     }
+@@ -1445,7 +1445,7 @@ MagickExport MagickStatusType ParseMetaGeometry(cons=
t char *geometry,ssize_t *x,
+       if (geometry_ratio >=3D image_ratio)
+         {
+           *width=3Dformer_width;
+-          *height=3D(size_t) floor((double) (PerceptibleReciprocal(
++          *height=3DCastDoubleToUnsigned((double) (PerceptibleReciprocal(
+             geometry_ratio)*former_height*image_ratio)+0.5);
+         }
+       else
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
+index 8197a0c39..375c8e781 100644
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
index 905af46f11..bb0c148fd7 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -31,6 +31,7 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git=
;branch=3Dmain;protocol=3Dhtt
     file://0006-ImageMagick-Fix-CVE-2025-55004.patch \
     file://0007-ImageMagick-Fix-CVE-2025-57803.patch \
     file://0008-ImageMagick-Fix-CVE-2025-57807.patch \
+    file://0009-ImageMagick-Fix-CVE-2023-34151.patch \
 "
=20
 SRCREV =3D "35b4991eb0939a327f3489988c366e21068b0178"
--=20
2.34.1


