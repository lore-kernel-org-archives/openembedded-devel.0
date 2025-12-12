Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DBED59F41
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 21:03:43 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14851.1765552567321600913
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 07:16:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=vs38j31L;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.36, mailfrom: divyanshu.rathore@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4m1ufmbiQtMyOPBOoI7eftp3foVBuclf++qI7F3IKa/iPlymxuKT0Y8aSs8LDmfCtA/AyBwPdV9x9xo4frBXo3l8y2+WQ64pX8uQjtMP/U2zMZ3CthPT99AFaa760/toTPpFf5r6QXfsuoaRWvDWEnx1oM+qviU0eGFHeGPFY4yt6J+J/ieWg1gBHa4mAK7QbjWULWTkEF1YNbgBSdSF6th8UKKxwb3AzCr0SMeXjtnt44BPywmGY2YDEJCIJCtA7ijTtHNEbIyXsKXW1KxrO1deyq7quiljBot41mLTojG/Z9S/8x7tpSG7iMulXRh6MLMmW5eBUjFt657mcrBGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqZDe7eroLCppubu9zswbGmbE8pE3AWlf5hmhb+bzhM=;
 b=pfmmyCVpZFJ35roHQcquqJt2sATtm3335hvd+0IEu10QLpQ2tjJSOP9dgouiSek2lfm0d4jIpBdQQJvEA2Szd62MLvx2dUrlE+bPKbeB0trN3fUd1X+8HDo8QLExy0zZCPKGEvP1vrXZkRiRJYdEG+TqowdT6+uX3aT1idcfzJw9aXQhAUrqzK7l1uWiR6vnK/bKtFe4LwY15AHf8DpvsolLeRPi82HuYPAPvQIRDgiIzVVro18ZNI2ouWIcgwMa06V8niByy+o2IhYD0EyVTYUif+2OMd5vpX4ou4OQw8zAY84/FRwEscsb39GwNqy/GJvHTRvrw+Kw9E/zKP8VkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqZDe7eroLCppubu9zswbGmbE8pE3AWlf5hmhb+bzhM=;
 b=vs38j31L2Fi/mgjp0duX18d1STp77oXmG3x9dtlT4k9jR1X/7ak4b2WNZu7vUWq6Ao9LHbx6PtBXPNtySXOspxzdDORcYWe4oe7XKBJRfx4WQ6aH/UIhwC7GAnY+6d54FA2yh8MWZBKv9dA/Ro/Y/e2PPSG/DXJ1atIR/zrUv7Z6QgRSxgpftH0oGtcr3/A2UxkKQnZD7gHDNUmy34AT7J7XyG4hT77v9po6RfdVbM/i3i4RwTuEBEOBzBbJygAF1VqUnBAgZRx1UaA3SHWEx+pFnZqeVpfkYNXayVAYG0PnVT1vqxdMNoMChpI09376y+O9KcWJkFV0ArnkmBylWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:143::11)
 by PN0P287MB1122.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 15:00:15 +0000
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483]) by MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 15:00:15 +0000
From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Divyanshu.Rathore@bmwtechworks.in
Subject: [meta-oe][kirkstone][PATCH v2 05/11] ImageMagick: Fix CVE-2025-53019
Date: Fri, 12 Dec 2025 20:29:41 +0530
Message-ID: <20251212145947.7434-5-Divyanshu.Rathore@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212145947.7434-1-Divyanshu.Rathore@bmwtechworks.in>
References: <20251212145947.7434-1-Divyanshu.Rathore@bmwtechworks.in>
X-ClientProxiedBy: PN0PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::14) To MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:143::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3378:EE_|PN0P287MB1122:EE_
X-MS-Office365-Filtering-Correlation-Id: f4cafedd-ddbb-4bb0-0d18-08de398f283b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?p5Ps5BQQk/ZZpy19VFkComJ8wnMv1STrmNXgT9+0dAzbc+uNuALQ7BD5b5q0?=
 =?us-ascii?Q?m/EibpklWYJI+D0340W3zi1y+U01y72cIjSvT1dY/9GLYB5eae/xV5DqvCjG?=
 =?us-ascii?Q?Y4sSC8iXkqHEhxjAR/WXG7QLUNa31m/9AeT0dx9yKr7aL2jbThe6zwnB2cLG?=
 =?us-ascii?Q?1GAJZqnsEsbG4FUiSM1w7DX/yOws04lNUw62UvjwoImgL7ZyF1Z58hDkURZZ?=
 =?us-ascii?Q?bS0Lu/0oH1Vos4CC0BsDlG7hHX2NliK7n1RFym36roMPL2vDKPKp+PCibTCB?=
 =?us-ascii?Q?ZEcX5RWoP64s3g38drk15h9lt03CPb7lxlPbuNIVcSpQTrG1U62BqiJYTiyz?=
 =?us-ascii?Q?U+G+0VQIPVhBMx2+C71eBoaAzkQmQ8xb+AmkvImnlkIBj7VOKoWv7Ns9kONd?=
 =?us-ascii?Q?C3BOtAKLDXhLko7Gh/Y8jKxpduV89w1e/4GCRyTVD7Wti+lSz/ow5cL6OowZ?=
 =?us-ascii?Q?qVIcUUm2A9ge8AVIMnYlgKlIRLtEvGVMbO0WJXFr4sfrHaYdSETxXNSguN51?=
 =?us-ascii?Q?m4k+QlS1KBfpMy+5RxLg5DKjd0W/s/AbOsj1nzNUVNnL+oMaRzJxd3cNfXR1?=
 =?us-ascii?Q?e6NyYxG9uV82ig3Vu6NTO7w1iDl2Da9o1rPABOwE0JRiYscJ1ja4W5BgGCQS?=
 =?us-ascii?Q?vf9BfKhlgvXOxHt9jRgAtExcQXBzJ2zIgInCVsPJOR0h2vck9qOIRvIyYAXw?=
 =?us-ascii?Q?l/addZumA7QFxRm2Gn8qZimbGF88JqvJUCK1qNuoHvG8iqMgxBlhp4Vr4mRS?=
 =?us-ascii?Q?WXkdND1A6sH9buMLC3oStYmt6QRKm8vjHrGJDudiQY7/KtVm3/HWIO4DyLD8?=
 =?us-ascii?Q?LxWYho7Sa+xeGgIBVL9s7qydXVA48ZqTMPaxf7Ki9v4EvKV0pLNtDohhA2CQ?=
 =?us-ascii?Q?gMfk7Tuz/YPIGqmqXO0kehUkqImxS/XqXnbGMTVGf+HRwtZzYIsTmynpdtKr?=
 =?us-ascii?Q?oItCiT5auaS/kxQGBINIZXYtAKAwF4yYJQ+wTt6u23RY228A+zvayfOvjp1N?=
 =?us-ascii?Q?CNM8HGruXjmAPGXrCDgW/ZZ0jTbtplWHPGrf44dgUEqjajKGWrn3khtEfk6T?=
 =?us-ascii?Q?bh4szu08ipeSniR5c8UI+zhY8ibjOvhUl5dJK5jJjd1RuMaUFqb5QKLb5rdl?=
 =?us-ascii?Q?Ydfuc1satElSS8HTWDVXU6RlyTIVL2KK9i7pBR1XpIMISb5zGYmKUGhI2dyZ?=
 =?us-ascii?Q?5cDI4b7aapcOJKV82GwQeud6vft7dHz9/SvPlpwyNRL/tc0CCu7mgILQQgaV?=
 =?us-ascii?Q?+/YOZnrA1YrzBK8k7oJX1YVrauH5k0IJoT8HN7vzjexAwUDroJaT/21FbLYN?=
 =?us-ascii?Q?fJsFDIN5lq0mDg5/cnG88huYmiPY3fy8NbWWTnuhCuQ2k6I09/2iKOLLQUn5?=
 =?us-ascii?Q?aju0jKzAkeq5pfl12DfH0E9Z0k7OtIWIw3PXTp6VQr8sMJ+ULnMRMwdHRHJn?=
 =?us-ascii?Q?UjvhwTah7gVBJUlnPSF0z/VYQ5R3fVNZ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3378.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/PW8TQNW3f74kNLHtBbGnfoudOkYGtc2vOWpIBOmPB5a+gWSAsBMzS9V57oe?=
 =?us-ascii?Q?xy/ZBSDMLh2h1L4GKpbA4gRyEC1AMWX9O8ji7KZOXkD9kFlXzJeY8rN9K2zg?=
 =?us-ascii?Q?gUVHX4LpMudx4SlofRdW/nVcpmv37pTjVCZK66zONYAwxfO7PzuP+fWGf20P?=
 =?us-ascii?Q?UPxKw3cEqkQRb+9KG8JzG/sUBgONd9tKAwcsfuPyPnO/Gdc309dh6n3Q9PxV?=
 =?us-ascii?Q?2096n4pX6nmPIIFrIr2obMY6Q/93n0Ni1ApQdgDNCravtBHkD40InKWESmWA?=
 =?us-ascii?Q?fzBZnLFqkdyZbtyOSLZx/RMy3+l+tcv4BkYmgQB6c8dn0E4irCOaTQgCHgy1?=
 =?us-ascii?Q?E8leI9XQRJaAZ/NwwMFQTuhD8TNJyjMXUGSNNnGMMzlhBRXzJTGNmk50D/9F?=
 =?us-ascii?Q?zj0QjJJOy8LeHvER2W9DxOSn9wRee5FdOs5KUX2wJB++SosTXrQwoTnKh4CT?=
 =?us-ascii?Q?pP0pxPx7mdZvYzK2t27NTY8iSAgDllnhZCZnpJeCeNnm2PfKEXWGbjH2PYdu?=
 =?us-ascii?Q?hDdU8dps0PA1SY10zqmOcmf/SLe+rtC0/UJRbrXe9TphB6K8r5udl6kGD+hb?=
 =?us-ascii?Q?IPkj0IeKAxRUzADhClkwi33N2JwxpmofYQPOx4c10FcKXN85HFToCAs7tlcq?=
 =?us-ascii?Q?f+bhtU8LTwJCXueZnx5cZkM8m3m+EuNNfD67J5JCE849Z21F/8VuuUYvvJdr?=
 =?us-ascii?Q?PeFKOBfUDQyT2GUW62yy9DyTmvRJxqjM4PlS62fKmcGUDoMJnxPTmgUUk7o+?=
 =?us-ascii?Q?bbukka7CjI+Dqf47NOE/eySUzhJaRyex/jHc+cVF2DU8T/sT2pcb0EQlOktd?=
 =?us-ascii?Q?twc1FwbD/Nunga0mA7Qw5gCrKsc7JcaqdplPWf14vBe9w0wYLQ7MYhsV/JZ+?=
 =?us-ascii?Q?1+q+djyIyYwUO7gqcP94AJ6QQJsdVzT141jFhb4mAPiPHN5+MeGsMGqUzb7g?=
 =?us-ascii?Q?Rie9uzXpZ/UZoY8jgfnaZbWRmi5ze0ju84jQDB8BvFZrPAX2XXJ80qEnJlb3?=
 =?us-ascii?Q?ZSbeCsy2TAqa9A3kuGxgQK9ZwKI5OTDvgRrfSr1Nx+ef9PAnti/+k0dGK7jp?=
 =?us-ascii?Q?Ad4xDAEhRSgJx6Dj33beepuwenRhirel5LVBVQSQDnDHdlKcgZC35bCdc0A7?=
 =?us-ascii?Q?ZGR4gF9Sh/baWAVaOEG6cpGCe5fVxz1QUW9HqBZC+sAv1W168BTTmkI00FFg?=
 =?us-ascii?Q?CykXwJjG/X1amUoV+ScfqplTbjz/Z2H9y9+x8EbSBaC4ON4USvch/7dDwO/B?=
 =?us-ascii?Q?PZL73iK1u4PcJduyf9ogX4m9THsvsjsTBALoVk3RHzIVOPeno7nD59Vyr1MX?=
 =?us-ascii?Q?f/Ydhfk4tXYNngz3+jF0JESyLDFZ7HzceI3js2I/r/+wtMlwiV1NwKjQCaDe?=
 =?us-ascii?Q?Wmsh085l8He+mySz6poeAGhsSew9y5hDcOtoCZRCLvb3g8HJadrGWmfd8juq?=
 =?us-ascii?Q?4r860sLJF5HwZhqaLu80Q8E/NxZUYNmKmtbmNauOF82+IqHFzM45Zf92j/4U?=
 =?us-ascii?Q?4u/74sHZBR4/ExDUaEvGwmMpY8A9dzEzMc/j+0tv3RtHPNIsvLCz4ujxcBgS?=
 =?us-ascii?Q?8pj3VT3LmYV2mnlmvwlS0SSnKEDDXA3p0IMRmlKlDverntk4sQ5uAcSExI7/?=
 =?us-ascii?Q?u2pZNHZWexP/zWwf1uyJhLY=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: f4cafedd-ddbb-4bb0-0d18-08de398f283b
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 15:00:15.2280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t1uKPzpiwj/G7MQ5UYrxbTqB9sbvBBXtATAvqNxV6jei6cIDqG6TdBIbZxXxJYHxhbCtX/CQ6YN3t9+R6q79smYLYOGZ5dW/nBK79naWZbkiwbCv2/4kO/8ChVaMPsG6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1122
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 21:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122623

Backport the fix for CVE-2025-53019

Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commi=
t/fc3ab0812edef903bbb2473c0ee652ddfd04fe5c]

Add below patch to fix CVE-2025-53019
0005-ImageMagick-Fix-CVE-2025-53019.patch

Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
---
 .../0005-ImageMagick-Fix-CVE-2025-53019.patch | 33 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0005-ImageMag=
ick-Fix-CVE-2025-53019.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/0005-ImageMagick-Fix=
-CVE-2025-53019.patch b/meta-oe/recipes-support/imagemagick/files/0005-Imag=
eMagick-Fix-CVE-2025-53019.patch
new file mode 100644
index 0000000000..c5bc15386a
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0005-ImageMagick-Fix-CVE-20=
25-53019.patch
@@ -0,0 +1,33 @@
+From c0367e544456895e77661481b76a55ac30d52420 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
+Date: Mon, 29 Sep 2025 15:38:57 +0530
+Subject: [PATCH 05/18] ImageMagick: Fix CVE-2025-53019
+
+Fixed memory leak when entering StreamImage multiple times.
+CVE: CVE-2025-53019
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/fc3ab0812edef903bbb2473c0ee652ddfd04fe5c.patch]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
+---
+ MagickCore/stream.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/MagickCore/stream.c b/MagickCore/stream.c
+index 28fa0f25b..bfa29f25e 100644
+--- a/MagickCore/stream.c
++++ b/MagickCore/stream.c
+@@ -1350,7 +1350,8 @@ MagickExport Image *StreamImage(const ImageInfo *ima=
ge_info,
+   assert(exception !=3D (ExceptionInfo *) NULL);
+   read_info=3DCloneImageInfo(image_info);
+   stream_info->image_info=3Dimage_info;
+-  stream_info->quantum_info=3DAcquireQuantumInfo(image_info,(Image *) NUL=
L);
++  if (stream_info->quantum_info =3D=3D (QuantumInfo *) NULL)
++    stream_info->quantum_info=3DAcquireQuantumInfo(image_info,(Image *) N=
ULL);
+   if (stream_info->quantum_info =3D=3D (QuantumInfo *) NULL)
+     {
+       read_info=3DDestroyImageInfo(read_info);
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/me=
ta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index 0256aa9164..c40aef1b46 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -28,6 +28,7 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git=
;branch=3Dmain;protocol=3Dhtt
     file://0002-ImageMagick-Fix-CVE-2025-53101.patch \
     file://0003-ImageMagick-Fix-CVE-2025-55160.patch \
     file://0004-ImageMagick-Fix-CVE-2025-55005.patch \
+    file://0005-ImageMagick-Fix-CVE-2025-53019.patch \
 "
=20
 SRCREV =3D "35b4991eb0939a327f3489988c366e21068b0178"
--=20
2.34.1


