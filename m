Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D7DD59F45
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 21:03:43 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14831.1765552520493868176
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 07:15:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=G0fIA3Gk;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.3, mailfrom: divyanshu.rathore@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qYCwuMi1o9bjSQGd8vpl13nrdpqJ0I0UmtSPfwk0+Nvpmf28nJKfCNt+KfM51NXRbJ/PYg8FyrKrqG+ALd1hase/W0duKkhAtyBCCrDknF32t0/CAsMKs23EFAkVGB+r9avSVvySc6baoyuzsMaXN5KifpxOQB0fvV+6FGL4kplkNJryirG3CSeij6MxJQGMx513R2A6NGejv1h5zra2tXW/2xejn3hVYEBekrU6rpXrxxdSSA5/rDt1lkuSSYWJuS3ZVD3YlWOdipg3ZSaW3VxkXAkaHwR/JHM7TUm1ijmGFtEEwpCDAJbG4+E9q94pSYxL/nCEdS5e7azd8Owz+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFJmZ0vEepmSZQOI9u13z5aPOGGWHFXkI4NZlxYpOt0=;
 b=Mb6fkVdYP5dynh31m9gdkAZDG4TMAsbIjVf88KDEhVJlRfIUB79F4IXtS+DGpie6HU+kDihLJtQQRG5gnWbMulno3XknBRbkIhra1ebrNRb/LHYYmX7UYGc/x3lRV6jImSd1ThrAJeTD2R4NvKhqJNzCW0qdtoH/64Tt3H1BtmdixKtP6UqM0w7XolRYgQy9N2x8G+zSn2b6uVovQklHfN1LX/wQMactSxzrq71gK9tLlja5qHQtjgVGvFTF+cDUFuPS8kmyul1k6/+c7gvDWRuN4n45FaG9ZICJp2gkVF3cRNVDuN6YkDVmkOUfXN/fqdqMvku8HWQZyvptKFnh3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFJmZ0vEepmSZQOI9u13z5aPOGGWHFXkI4NZlxYpOt0=;
 b=G0fIA3Gk6srD9ROZXoc8rrYksfWoU3IpaeQS2qW20EkUjNdY1qBEHALVEF/d7xFTylZ7gEhqKWFavTkiEEnXWyI/P7bC3A9ZCTbJcwTul+AmJMd2+b1+dBjNnRRToL696spphxrKWna7Cj+XeUozJHkcjAfcyVjQNow3MYjnroNrb+kzr3MN56mMXkelTyJJzPnWFbdPuKHdXR2f1968J4TIAB9n/IDeYSYVLmy5GgZsH8QVGGGQY+85XrqShsm0BNgwdPlkM+94jHxZ35/PtTchwYhOTE4GXIOS8vtHpC4ESS2D9foNLr56l+3Sr2I5d5v9FWAUf6qK9ms3y5J6wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:143::11)
 by PN0P287MB1122.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 15:00:14 +0000
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483]) by MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 15:00:14 +0000
From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Divyanshu.Rathore@bmwtechworks.in
Subject: [meta-oe][kirkstone][PATCH v2 04/11] ImageMagick: Fix CVE-2025-55005
Date: Fri, 12 Dec 2025 20:29:40 +0530
Message-ID: <20251212145947.7434-4-Divyanshu.Rathore@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212145947.7434-1-Divyanshu.Rathore@bmwtechworks.in>
References: <20251212145947.7434-1-Divyanshu.Rathore@bmwtechworks.in>
X-ClientProxiedBy: PN0PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::14) To MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:143::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3378:EE_|PN0P287MB1122:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b47272-ce48-403c-3778-08de398f2790
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NNe7XI6sc5UzJqpTbMUKk0d0KEdIXrBwTFa4/SH1QU3Kw4ke+MyinNjrWFa2?=
 =?us-ascii?Q?26KhGKpBHW58XDMc53Zu3J+1rLL2VycW80ETFyuvFrEjyd2UDMtoXmAFU5HJ?=
 =?us-ascii?Q?7SSsSbf6GGc6+hdQGkfya0bTeOVrlv3+qtmn8BiWnHmZg0wToEJRaHZtcn7k?=
 =?us-ascii?Q?u2JAK1VeIB/xLUV7KDoUssUGC0Fwc4dUfpRKJde405pjOe61l0/bM8bTc+Ly?=
 =?us-ascii?Q?ei4sI0ZHTTlMVsm2XGhS4h3fwMoBXz5p1QX04mNpbC87S4QmcecIuAXp1dX+?=
 =?us-ascii?Q?4DS4fhxm0S3Ncr5EJQQH/ZKFfgJf5r3hiR7l5/bpOGgqQOQVWYy9o/Z28bdP?=
 =?us-ascii?Q?ds25nX9pshRAEqzQjGTWnfYs4VXwILY86HJpmsaCIrFe0P1Tx1bHCeI26C9c?=
 =?us-ascii?Q?atbqQAjIysUGNY66NkXO/2n34M0aDCqqMV7NdNBh1XWJijqpVpqpxVzaIeyp?=
 =?us-ascii?Q?Qpn4TaPu5sptwzGOzZENB+tZg0w2VoXQRAg46DtdDhSP7vD3TlMSKDz/D9g9?=
 =?us-ascii?Q?FhpdcxpQwvIICQdr6wYy0OYgvOoFCwSYA1mGq4RSg0VsSdh9kwhvahOp4EL/?=
 =?us-ascii?Q?1Ho+wbSHbfunQaznUhgM+4X2fp6RtgRgAw5jTYRUA9TQkJ1GZbrziamHkSXJ?=
 =?us-ascii?Q?EXzJvb6i6m/WnZNlrNLFtq8rDhJZ458qp/7UXR4AQ4cERgTkcHyOPDyhJ6lY?=
 =?us-ascii?Q?xZDhNviTX+z/9TOMgRAUnPFSTothifWdj7NsoY5IDDFdVY9HMJjlFoHczWxs?=
 =?us-ascii?Q?FWK6HHo/LZrBNxMM79oZxxzbQ9UPfSlWIH37z2p3b0IxLMq/90jfSf0AFwM2?=
 =?us-ascii?Q?LOPeM3gJA763gxU21zvIKc1NlnIisbs4uLENDud0sE+S/3OATl7szBivEt9M?=
 =?us-ascii?Q?IRxHALaUxU+5Wf1E8DCkQfPTqjeZ6sOglcA6Ja57JHMu+QkeNBNbc+LGPGcZ?=
 =?us-ascii?Q?EEDgdJGWr2tVQ5XMAQrk0yHE0R2hKY3rIOTDpA6BHOr7ClsENt7s+RU6B6/V?=
 =?us-ascii?Q?8vev8+J/YFGLZk5D1HjlDHuOiqTZjyyTR1t2KzYEjKSTt9TBejgBITcquApU?=
 =?us-ascii?Q?V8rOkxBtn2u5BKGsHS+DegzXZ7dSMofoAZ8VA9jsjg/rhWanbB6Kj1iA2s+2?=
 =?us-ascii?Q?SudyJayRcEYpT7W2Gnyce40FN3iM/0GQFBLBarCB0LhaZ8+Xa+V7c0VOlAe3?=
 =?us-ascii?Q?eOiCA6AU+cpX/NCnwvrEVGDypHCm6VGsngLt1tM7IxSw2t9xrS6l/ogD/u9Q?=
 =?us-ascii?Q?DyGFYM5vZZqCOkYOakcbNcyW7ilZz2qPW2bUZIxiVW/ovkLQs8RBKdxgqhdk?=
 =?us-ascii?Q?BUvdLjrPaO8Q4qmRj3Sv2X9G5TroOW47abj7G1cdNx0rdKmUdg8/KTQW2ypy?=
 =?us-ascii?Q?xpXfudG+CJYv4sHNtSQPf7DDn9lYsceFoR0FwOkAi6oORsXgLYqhi1aPjv+s?=
 =?us-ascii?Q?6UHH+AOO9sCtiiLa0o3k6QyuUbQ4Gi4+lW87NBpp6VwUjE7qUWFSCg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3378.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5XOWnFxvP7aEURNr/5+qT66m+mtAZUPcZn8lHZ4nwm5bEZKYwDhG2xpM2agP?=
 =?us-ascii?Q?U1VGw1Vb3hIw2738oA8oK7dtq0FZ4LnP1NRN71y7RPkxlVgpLnB2C5CHUKiT?=
 =?us-ascii?Q?x7t4pxN+07drBYjwzwqSeGUygE4K+XexSMEKBKWDcLfpwTcP5EtxJ2CUGiHd?=
 =?us-ascii?Q?183zM/E20QhWE1MT6lcBARtTzgvUFrus4WL0gNoUEwRdeGS9jgX5m+60wiTG?=
 =?us-ascii?Q?hQFVip/hYdlN5o1pkSS/6AbDvaE17xOSGxmraEMKa+B/VdxExAhrOtXz5qix?=
 =?us-ascii?Q?3+RffZJK4uN0/Cvoo0PCFJy70z/H7Ls2ZQZiL+tKNihmDBegzADc00JY8MUQ?=
 =?us-ascii?Q?GEW+APxkDuGwxZT0Wq1hgd1yiVcGtOX+3CiVk3grMpgjW4LrxF86C4qaUraE?=
 =?us-ascii?Q?6jYBgP7Vy9jtuo9OhTpYA5U3y16N4H4xkR+Eop4MalJdUxAQFgIhBb6Oxtw+?=
 =?us-ascii?Q?V+bio8cdPcgavbcUiN7GV912PuTPrdK/yIStXGMrF6asSerfAygNAIh+FFow?=
 =?us-ascii?Q?lzWCopIfITY8Jsxf/Xi2pPPZfZyqHrqhLrgACUhNijkQpvxwzrLYsg6O5rrg?=
 =?us-ascii?Q?djaHUd/kD+kveOohvPk96f9JMHUdYpIe15mMJ/YNYWKWZ+De1ExJbX74bXup?=
 =?us-ascii?Q?e+Dj/Bj8jgz+RfvZq9GJT+amRDfhWujtxEaqZa+H05g6jeOyAnKl3/QV7gcu?=
 =?us-ascii?Q?AKZDSWO7aJkQgZIbecxb9v2U6wRlelXj5V8dd8wMCYq73MMMmGlPwMiP3+7K?=
 =?us-ascii?Q?aOryW/Y1QtYRcK+zaHtk438TSUzc09kX/FhYK4YQCc0vmv5GH727kszIvZdA?=
 =?us-ascii?Q?UDWjmFqcSDut4m6uOCZsN4/Ychp9YsLOJj3kzu6Rv7M2zDSR5UYH/KSvdsb4?=
 =?us-ascii?Q?GmdGq+JYXCpfhWSMSEeOH7+g3KwW4wdhIni3EzgH4J45F7YPT3r0VzYms9JO?=
 =?us-ascii?Q?CatxqOKIkPmOjQjB2UIZ4t3VvWQIZbpizJwUeoFj5IEZfd1gjP7gjHDllkb5?=
 =?us-ascii?Q?GtLQ7vqBGzt5lZ8KLDkOBKUYEIKQxz2saSViQP1kpo49Kx8BL/aoYNJ4yd6C?=
 =?us-ascii?Q?5lxWXJ17GyMIt1wMvisLAN0mRkWssea+F3dqFftYdzfHwyf7H0sd4rxfxqNm?=
 =?us-ascii?Q?AnU/o7F5YpehC2aY/dmv61Gn5qYOpDkuPzIC+MQYvu8tZrUtI95UBlXu0cag?=
 =?us-ascii?Q?cOW6VVLZVonCTeY9lqF/JVxv+NaIBw6XSoiZlJERG+NCeG9p+BaP+qFdJWpZ?=
 =?us-ascii?Q?QmkbF/kJ37LAT/V1zbSXFeRT+pLTqYhFXkKJ3pjyrS2YPTerxNvlFO92LDIe?=
 =?us-ascii?Q?N34y9xp6EJdDzl7R/ahPT/25YMcldS9m4aUeT4dmacsYx1cANYq1qeiyCn2x?=
 =?us-ascii?Q?wmxv0az6ifw/QcpQ2LBvEoJvok45we4JcKebetImQRTbjzCC8sIovW5PLeYB?=
 =?us-ascii?Q?0EKLVZYiN/Jm2q6CEsoGD+gXiar60zpfpQZe/v3swdi5TyqJqJ1aO7/E5hby?=
 =?us-ascii?Q?5eMfvNUF1ePQUaJWPdTD7z1vbsHO11vpMjQw/rqLLlmqzLEQvn4UiLOmErie?=
 =?us-ascii?Q?Rh6avHgXvrEyixRxvlBQc1V5Kjh/FkyuV+02l7jbHJhtOdTge1oXJSWf5JL5?=
 =?us-ascii?Q?8Vu3PxjShemL86ueFWehehs=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b47272-ce48-403c-3778-08de398f2790
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 15:00:14.0939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GOq3QjQfWDhXAyuPUhW54y2eh8UaKRpFtGqnJPhNLCtSGDFQgVNZi8g6oFj5tYL+KaRkcNZpmu3TTPf1fjapE3990DVrnLACGgy2NmheyYGddS12zi1ujMS7LPZfSHj7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1122
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 21:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122621

Backport the fix for CVE-2025-55005

Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commi=
t/b68bb6d3cfe472d5bd9329b4172e2e4f63d90a57]

Add below patch to fix
0004-ImageMagick-Fix-CVE-2025-55005.patch

Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
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
index 0000000000..ed33093022
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0004-ImageMagick-Fix-CVE-20=
25-55005.patch
@@ -0,0 +1,40 @@
+From d16c2ff3b34a4785f089e956d2adfc5108fd63a8 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
+Date: Fri, 3 Oct 2025 17:40:59 +0530
+Subject: [PATCH 04/18] ImageMagick: Fix CVE-2025-55005
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
index 9b6ab5c7f4..0256aa9164 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -27,6 +27,7 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git=
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


