Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B102ECF8871
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 15:26:36 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30438.1763629637392236504
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 01:07:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=uYflnOLz;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.29, mailfrom: divyanshu.rathore@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhhe1q3K0K7fy4vNCUnGYWpv1LVdAZ7odajHBGajYrNAwSce9cd63D7JylMyTcWR+q20PlBVsRTOAePcRg81x8V7tm5yYs/zdnWD04VD91owOdc9wU4ZlO4m47NmEV619r+Mzp2okrp+ikfXLodFDy1DV3iTaiG4TL7GF86F3vxQdAg/kbA/9lEKZhY4frxSQ5jYyKJteaIiCaIzQmeY5L8vG2twAy8ahBhuR50vWiR0L505vGLz2i7hbXKS/4/lBgUv3Pa2CYuYVfTaOtavyaGrgm4jqZh5sS1k/4mp7EcF6yhKpvF2Eis3GIOEOW80zl0wcdC2nA1j6XxZH3s0lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QbfrGUX8BAj5k6cc7JklEYcYq4M7CwXhj8dvezuMSV8=;
 b=oSrwvTs9VWdFtXVJPjijFRxMZlIWILPYSm8KmLP/keZ77kcjw8+8XdVkaZiESsMTrtK0eDPHLOfQ2mZG7sfCF/j5WjvJTJWzlm7OMUpI1AzHXWIYrfT34dlGLsKIeVwr1Hf/4HPi/dQnhf5jj1tm5kHTH0S7N2YzJxGDjaBhqyXFnA5gjxTu19EndiJoN54k2axYeXak1zPv7f2soaoCwhXrs/r56CJuiWk+9+KytF0eA5zJhdSoiuqp0QLGHsZPQXg3ntT/mHNP/XUh7XKheFCaZwk+APVeycIO16OIZeuITczBcs1PkJrWRjqDDHz+G1QJ1rwp8kFRgd5Ew2Tyxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbfrGUX8BAj5k6cc7JklEYcYq4M7CwXhj8dvezuMSV8=;
 b=uYflnOLzmH0xzdTXMeGV/Q1WWZt3bAsihUVujGF7/J6W2zPf5z00o8gWvPftPcPpMXM75FWjOc7AYGYr5SJ+DlmGlI6gzFCHYB/76s5cYOsOoJUtKOnE7T9suHnFLU3BIyvJH4UQv0aGG2ztuSSFfceI8Eq99NJiA3LTS8Q+T2QoDbN3grro8mCA6UJ/LkMV/W7Te3y2WOm3yqKWZGIBilkD9sXbL+QhLs6nrnu0cdxjUYxJcROMjsdnL70CvZVKHEEvuzixh71GroHhI3LbuGEYzAaNMYJSnq5l9dflMDMjU2DibnkhObmr0DSwcpYrF6+bQ929y7Rx3qZBsCfyZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:143::11)
 by MA0P287MB1011.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 08:50:17 +0000
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483]) by MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 08:50:17 +0000
From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Sana.Kazi@bmwtechworks.in
Subject: [meta-oe][kirkstone][PATCH 08/12] ImageMagick: Fix CVE-2025-57807
Date: Thu, 20 Nov 2025 14:19:55 +0530
Message-ID: <20251120084959.51761-8-Divyanshu.Rathore@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
References: <20251120084959.51761-1-Divyanshu.Rathore@bmwtechworks.in>
X-ClientProxiedBy: MA5P287CA0130.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::12) To MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:143::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3378:EE_|MA0P287MB1011:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c6a4bfc-6b7e-4b8a-243e-08de2811d40d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|52116014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ai1ScqJtEvig0xCn4VwXoOBq6F5XWxi9bwKYqFZwUDaRYnJ8JCcZKbGF0xRz?=
 =?us-ascii?Q?nPKo2R83IhXzeDLiqDqahuPrefdsLnQj11NDTLrA/ZiKaozF92HTyT6WsZpX?=
 =?us-ascii?Q?eZ5HHk6+spVRLezsQur7lyetmzVbkouKz+ZSbrqrxE8Oye4WdkXKjOXh2J8x?=
 =?us-ascii?Q?F8FuCFbfbqGOhZ6rMnLb02j3UzE50LPNCiKk8WyQHPbc7iX4+zaTlbcs2FR5?=
 =?us-ascii?Q?KwjVzKBD8rNBCtNyYD2GKvwxvIN/j7Y4mPymUky7S3MAweb69WQpBCadhf+A?=
 =?us-ascii?Q?256YQujq2KKBzn7MhgkVHbHQl1jrf0WCxuOQANFmek+61tOqwt7rs0zst85N?=
 =?us-ascii?Q?YYrg+WGd+sACmQ22zum+EqB3wisfAm+wmeXXjIEoeafZO06JetL2udfEJPew?=
 =?us-ascii?Q?h5UD7OI2JzdloGNuj1j7fbPrHP/KdSTGO8fBKS1XK8nHm6NTR4jx2Yxi4mke?=
 =?us-ascii?Q?VYf9Y32MTEKnQgkb4nmzL8cmVGYih2LJjNGNfV98q0H2iPe1o9ECoc15ac+/?=
 =?us-ascii?Q?qdK8DyyymN1g2NEUSNr8ltBkHwtqURR+ux526kuEN1amO6QmLf9mffGBVgb+?=
 =?us-ascii?Q?veiujBreVxbp3df9iNKs65tzPDPQbaGtWlTeCQR2ziC5RzpEBvXmKlaNSatp?=
 =?us-ascii?Q?DxVEs2A8t5eI5j4z7DzMpueiSb+2au8LAgMlvTrPWfAc4IFXMRtsnZY7px0n?=
 =?us-ascii?Q?D88MY2Oq5KMmvit0LvyP8ZoEhTJi7JhY2XCNpdJrL4GuN+yFYmfh4BVpQUY4?=
 =?us-ascii?Q?/UHRca7KG0SH4T5CL06OZxjmIh6cgaZK0PQlSz3zYnOUwgOHCzg8zwCVeMB7?=
 =?us-ascii?Q?66grlv4k6D+ewxLf7vRnuM+Y6mcXAITzaNTia/58s8qJn4oCCUTqrZHRzpuF?=
 =?us-ascii?Q?MAm+/giR2nOseGWc8gl4iuM6uw0mk63pO0q7+Y/+ts75u9HxySYpBOspPp7t?=
 =?us-ascii?Q?/kRv64uENA9pDwbAdGDD6dHQ4F0YaP9L7c1lS3qVUqbnikNK1gi5/rTZTec2?=
 =?us-ascii?Q?MVwPzKNxiIY+wI8T5SkI9uq5fd13tmNrUPQgShza2A7nll41zVKR77bhdyGZ?=
 =?us-ascii?Q?MhS7LqwMgJJDGGM/cbaFvo7OVWcf7+0eAU+ForVexXAHN2Ci45RsC65sMG4X?=
 =?us-ascii?Q?Ypk+KDPdrCyj/lIzYn4Oiip3UKSzxT/0l8Sa+IsTq84tSuw6xMW/nQ5Qmcdh?=
 =?us-ascii?Q?wqsOdEXQZ0AkH/jyVMrsdfFZ/hUud69ZDViDB80ZwQKm6i0v1o59Dv8qXDR/?=
 =?us-ascii?Q?rkSYnB+9+yt2fvehfGTr7eugYubPcVqQK+ydVPAWIQR7t/cIGHxBzDfqdhPE?=
 =?us-ascii?Q?dK4f9ngi41Rpfdh2h/bR8J3clsPoMpAns1TJ+jyv2/aeOengU75b8+dOVGDL?=
 =?us-ascii?Q?SBcBVYAGrXHdqIg3RWAR2Xug2EmpULPGiT8p0o2avWUf5GqVcH1KuAnG1lsI?=
 =?us-ascii?Q?bWEAtLhZBVFLjefjYFkYT+O4ODfQ4VEX?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3378.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(52116014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QGz9cu2S+4WIUYJjfzNnrgbuAu3NsLej26lUowy541YM+E2mBoK4r6RarGCp?=
 =?us-ascii?Q?7EOk6X6iAtuItm3WKa4DUDxs0Sgaq32ecEKj1vrRRNPwmuzBltXE9JnEy9KM?=
 =?us-ascii?Q?MVJAnUNr1GSpg3Q11Qo5TgtGZfStzPf/2uQ/tG9K2Z3Y8a2OdmlMp9wuuIWO?=
 =?us-ascii?Q?4c363WU+wCSJV/nGRGlDbgOfCe7rPmsxkAH4/nEjUxhCp6ToZxHk87PScB5B?=
 =?us-ascii?Q?jqmReSyfprgYZa6nG6Gb8vaKdAsFqlZAE06rXUqSiMT/6TshVg0RL8LiLaIW?=
 =?us-ascii?Q?Ajbk4Tjh8t4IvJCE/68s0lVZJhVc2A0BOxTl1WQVpNFGXNhRnircx5hlIm9g?=
 =?us-ascii?Q?GQ65x4rd3w7V/AqbQLHLU7TPVWv4dBRXcO7r0mDFq3V3ICjek3T8yRJ+rCrC?=
 =?us-ascii?Q?VO/S8rgVIco528BENEwatPklWs8B11oZ+VCIDkciYdjFF5HbRpxKIzdGOMEX?=
 =?us-ascii?Q?WkgzcbJ5O3k/GKatdCw6oQTg7Oawx55EyFSlHCFI6FAYr9qjc7p5JUDi5ZVs?=
 =?us-ascii?Q?hXgf0HMZYYNlSdTyBbd3eklDFGLgVvEn3Bkq1VaRdpT45+GtY4QOf30llm2X?=
 =?us-ascii?Q?1prJTTapvk7vjquXAiDNhVNQVuWXVvo4KnlcluQaKK6fvXtHo5r1l9dFi3Sf?=
 =?us-ascii?Q?43oFgTHHf05YXFpaTsRu220cDxmnA1Z+WLtfZNJ1YJIlvGqsPyAQWRV42Eb+?=
 =?us-ascii?Q?4SPXqJSP+umXWIANf83UzhHRAGY72gia/CDU5k+JruS6JNg3pGm95pEFPGlt?=
 =?us-ascii?Q?D+ZJr4N/UXeRp+lA+l1/h5BXLbfto12YhAkCugcuqqD6QF3pvLxjztY0ezox?=
 =?us-ascii?Q?DeozvZKdavINYkZG2QqNapReNfcp92GHTlEHk91MDKQaOowN9HFV+bI/dtzS?=
 =?us-ascii?Q?E5dxjdvc+LeEXjnFq1jphvBUsKItFnlqI+elzXEujmKz6lCq1zA8SaFTUIWb?=
 =?us-ascii?Q?jOl6ujxSs84Ga3iw+jifOB40sQCcfVBmbLEDIECCZGoTxtOw3MOt/uzvl3Vz?=
 =?us-ascii?Q?o+wFLKxozSQ5VmxnhTjp8mTmgU7L7qLQZ+oXpvJm1u6Pymc5KWQUAunXaZkx?=
 =?us-ascii?Q?ZUUWexLFJMi2qr2O7vXpzAqwmSOQzm9BS0zsXpT3sFHGyA04dc7rF81G1XbF?=
 =?us-ascii?Q?3VLb7hToLXsZHvXXTT8+y//CgqD3HXYnoo8a0ngeiqhxRvZwVX8rd65w/gsx?=
 =?us-ascii?Q?LCOQCjW5wQySfCM3m5VlIZv2Nxj/7mj9yoGPrIYiBWYbTLKN/TegxpDmHChs?=
 =?us-ascii?Q?HG3XRaXVrzb1Y6WO3gVFyjQUApTAcE/ZhuUg3EV6nZIq9EU8FqMDNqGP0RLO?=
 =?us-ascii?Q?w532o/qJmrf/77FdNarh/Goa+IqlZUq7NNYu6UV/q4HU9vNIFFCSNcJ+Pr93?=
 =?us-ascii?Q?qfYvAN6R07QOz1MMPorW6s3S0CJGATpIG4187WjOjuysFn/vIajuIXt1Q0BY?=
 =?us-ascii?Q?4bxWGOUdQRrusrlIw0tyXXsVDJKNFJMX/PoRmcLt+xR0L3T7nLeudf5MRe2t?=
 =?us-ascii?Q?9bbQ6AhW6+CQ0rRXysLR6LISZL09zThyE5RqsbFO1KmcRYGoYV1GKaMEvvHD?=
 =?us-ascii?Q?nqK/n5qsOIj7FfUoRjHiznyYHWrZPi0Q/4MDHjBSoDj7UFLWmwKRk35cNPqq?=
 =?us-ascii?Q?6oWBt0pJTG4nCsupaAfMmukBdM3okQl1f38i/TV+OccvwjaO0nEF45xzvCbo?=
 =?us-ascii?Q?IhxG6LJ0MBVNNMs+zmcg4yqEzbM=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c6a4bfc-6b7e-4b8a-243e-08de2811d40d
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 08:50:17.1338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jdmsCJM5Mm22XitCIE491TSH9yEkW6LV5VbySffCWTtBPJUKkyCMBSKYDMZQc5CQ2gg2sWxS+mssfWpd515q4+A4Qmaflc73BJPuRXZ0jxwvQlywxlnqgVekf+xLfL3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1011
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 15:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121949

Backport the fix for CVE-2025-57807

Add below patch to fix
0008-ImageMagick-Fix-CVE-2025-57807.patch

Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
---
 .../0008-ImageMagick-Fix-CVE-2025-57807.patch | 51 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0008-ImageMag=
ick-Fix-CVE-2025-57807.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/0008-ImageMagick-Fix=
-CVE-2025-57807.patch b/meta-oe/recipes-support/imagemagick/files/0008-Imag=
eMagick-Fix-CVE-2025-57807.patch
new file mode 100644
index 0000000000..a09113fe36
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0008-ImageMagick-Fix-CVE-20=
25-57807.patch
@@ -0,0 +1,51 @@
+From 0d258139d51628d53493cf5dc15e1fa9f3077bd3 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Fri, 24 Oct 2025 12:37:14 +0530
+Subject: [PATCH 2/8] ImageMagick: Fix CVE-2025-57807
+
+CVE: CVE-2025-57807
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/077a417a19a5ea8c85559b602754a5b928eef23e]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ MagickCore/blob.c | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/MagickCore/blob.c b/MagickCore/blob.c
+index 6a15d4808..38af749fe 100644
+--- a/MagickCore/blob.c
++++ b/MagickCore/blob.c
+@@ -1598,7 +1598,7 @@ static inline ssize_t WriteBlobStream(Image *image,c=
onst size_t length,
+   extent=3D(MagickSizeType) (blob_info->offset+(MagickOffsetType) length)=
;
+   if (extent >=3D blob_info->extent)
+     {
+-      extent=3Dblob_info->extent+blob_info->quantum+length;
++      extent+=3Dblob_info->quantum+length;
+       blob_info->quantum<<=3D1;
+       if (SetBlobExtent(image,extent) =3D=3D MagickFalse)
+         return(0);
+@@ -5774,12 +5774,15 @@ MagickExport ssize_t WriteBlob(Image *image,const =
size_t length,
+     }
+     case BlobStream:
+     {
+-      if ((blob_info->offset+(MagickOffsetType) length) >=3D
+-          (MagickOffsetType) blob_info->extent)
++      MagickSizeType
++        extent;
++
++      extent=3D(MagickSizeType) (blob_info->offset+(MagickOffsetType) len=
gth);
++      if (extent >=3D blob_info->extent)
+         {
+           if (blob_info->mapped !=3D MagickFalse)
+             return(0);
+-          blob_info->extent+=3Dlength+blob_info->quantum;
++          blob_info->extent=3Dextent+blob_info->quantum+length;
+           blob_info->quantum<<=3D1;
+           blob_info->data=3D(unsigned char *) ResizeQuantumMemory(
+             blob_info->data,blob_info->extent+1,sizeof(*blob_info->data))=
;
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/me=
ta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index e1519b13fa..905af46f11 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -30,6 +30,7 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git=
;branch=3Dmain;protocol=3Dhtt
     file://0005-ImageMagick-Fix-CVE-2025-53019.patch \
     file://0006-ImageMagick-Fix-CVE-2025-55004.patch \
     file://0007-ImageMagick-Fix-CVE-2025-57803.patch \
+    file://0008-ImageMagick-Fix-CVE-2025-57807.patch \
 "
=20
 SRCREV =3D "35b4991eb0939a327f3489988c366e21068b0178"
--=20
2.34.1


