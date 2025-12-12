Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40C8D59F4A
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 21:03:43 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14983.1765552571543204428
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 07:16:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=4JOnSS7O;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.37, mailfrom: divyanshu.rathore@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWvPeEKOwOhTD+uT5/dtuAWmB+L/5rr7vmSWPT36h5VP61llyyuBo0uKoZWtodR/Lu1bs9UUDkpO6nU7PbU5aKqflkIuZYgo4OeidXLPZhep1X5Sp2O+t1faSG1F3jYZeXRYXU7G3QPA6I7X92rzjPYc5hG0OIao5Qp28ly/VWCqf8YfNI9aLhYpvhRmn+YeHiJFLPwAn+dD2DWlOYgXnJBKs9+xtZo3BmWxsA+aFbvPLg2X4FxyMdHzJX02M0AVUPuvrkZslpiqFi3vFGlyoks2PelSfqVGIATFCVQS7e88ENkiIkOGj8CYRcgsmvEkR5arID437zTe6P5Q30q8Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ED3G4irfJq8jd7KD4dZdx8hZZOka4KOq9atjlLvnJm8=;
 b=K8YUfDclNqkylS1PxVF4miuwEuOVrsgY29wCwwF+3q6GpwUeTOnRoCT4pJLsoH7HRswfd/Jym55hx5I1evaKpngdLH1bhLxgSZKshtl56rQo8/9iVQYjRHjNsTlF5N6G0IF64a1RW17772+6ICxwTTnDByNFCmaP3IWjitPLHtcyPF5htpAuVax5oszT/Y/c8Sr7NCNwPxIlz38VEBnIrPz+1ZjlHWfah09G9WnS/jyK7m2BFs7Nn5G5KhGFTBGDZP1H8fNPaeAr5hOsWhcMve5ktT5cKEV9I9pOMI3VgaThscIVdHNMA6jVMXB03ctY/zcXSL5faUQg9F9KDeOOFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ED3G4irfJq8jd7KD4dZdx8hZZOka4KOq9atjlLvnJm8=;
 b=4JOnSS7OUVTzWY/QFYSvbFXQl3ZKxjTUU+oiplXrVZw95sONLJErt4D2G/+IkHLweB4PzIC2/udRt4RyyvxP6M4O1aaIAQsWjQsGlDwCYtGbSRmGamv3byvG7ZVFFDVsyg9yii1GFIDDeRxuXRAoaxA7iwwZqo9c2KOO2EVYiau4z8molXKCPj4taVhQAO0Ln4yg9JwkVgzbw1bR8TX/BnOV5ExS+RUuY96dh0Q3/oCYOzysurDro9q56HiK0aDb5YK5XwjPneRXPF6LcyTcmUNX8g9fK5Xr60owSfdU7E4Bk6OEicNJJnEd2nUmz0bAya31JC1+c3LuRxWuUrBx5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:143::11)
 by PN0P287MB1122.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 15:00:22 +0000
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483]) by MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 15:00:21 +0000
From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Divyanshu.Rathore@bmwtechworks.in
Subject: [meta-oe][kirkstone][PATCH v2 10/11] ImageMagick: Fix CVE-2025-55298
Date: Fri, 12 Dec 2025 20:29:46 +0530
Message-ID: <20251212145947.7434-10-Divyanshu.Rathore@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212145947.7434-1-Divyanshu.Rathore@bmwtechworks.in>
References: <20251212145947.7434-1-Divyanshu.Rathore@bmwtechworks.in>
X-ClientProxiedBy: PN0PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::14) To MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:143::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3378:EE_|PN0P287MB1122:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c3f80e3-20d1-4fd0-17c1-08de398f2c2e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?in7IizVek76IdQfLMfAl/VnyEPcxVBMKH7IOcr2HsWU+ySwrCJePpP14+eji?=
 =?us-ascii?Q?5MBO/KwB27Bq3+syK47kfm2VRo1rBJDptyTIPR0/BvcdYlfu/3X9oVo0cWpD?=
 =?us-ascii?Q?JJwoiXfN86PdT0Bg+dCWOEE3Qn559nAUOx3YEpWoMa/+kOnPG2IUbd/cOM9W?=
 =?us-ascii?Q?/Gzp4+2UCDVDIw3ujin37m6zjsuVoqeY2bQLvUqiewVbxEfeBEHpHMejyR27?=
 =?us-ascii?Q?z0wdHAXfKvm9sbW9izdMYVnVCJ4Ro1raTAqZXhjk7hjVmkNgQheJzthTNPcG?=
 =?us-ascii?Q?lbgOW0i4Qmp5osB25wkpOKIhUn2eZfn3BC+75KEZGdzy6RJkBwt7JQLwJU8R?=
 =?us-ascii?Q?0GhEfOU1QERAv6E/zCUIJAeaFBQppKa1TJQiWU2hrlJVTYS8D94V9Hv/zWUV?=
 =?us-ascii?Q?lq7d7hM2rfALNDPyh9UWLoVf0tjFx1iJcd8tCbpllwlpBTpKky5hSQ0ukCqR?=
 =?us-ascii?Q?NHIvJv/gqnnVRlyIAtn/k6V4aKHejjUj1XURAKUwa+o5oWmEEGbttEqu9MSo?=
 =?us-ascii?Q?gpidzOjF8p2VTtujWhAR100+Lfz+p/gya+9eNtQuuMNYGhjNL0kNWEAYjHrm?=
 =?us-ascii?Q?ZJdlHRHAcuJZMAfmy6gmCf/SGP/vWJeJpuqdYFsSwBl1cumNgd39Cf6PvYzm?=
 =?us-ascii?Q?QodTtXddAOrkmj62HAd2zMISgmJFZECYeko2kZIKiIP4MLcMO/xk/rv49xFE?=
 =?us-ascii?Q?HyFwdVYFm42Y0EMGexUL3zazBBQ+0hhlo8o7NunqpIC/8jO6YvfbH9MBRqd8?=
 =?us-ascii?Q?qgGIJwY8yc6ldyLTUP4C1d96GSik+7qmUc5TJDUNLs6uYtqoLRSxRXrytlDk?=
 =?us-ascii?Q?828g6yrb3EJhPLHmChMaiavVpVJ5sD1up0xXXDrUO0hPSB/2pNx4QgbFrxVr?=
 =?us-ascii?Q?krQWiGRiX87kIrqyuiETRoUwfRnTHwQmjnX5i0jXexOhGRuaQPbqFmu52PqR?=
 =?us-ascii?Q?4X9YVR+9t58MgErEpzCVj9O7WxAJKaWtj046BjwsRHJK5TaeMVuryupP6aYa?=
 =?us-ascii?Q?zK5M4fmDUzJT4ktKZvFvNKP6KntvOV89MCA0NrvZpJBgx+Gn/G3okkXPVB4A?=
 =?us-ascii?Q?4rBwx4zc0kyxpSWAPgG+cfxmp/Y6DVjxc71NtcVopTs5RH1imP6NMpE5+0CQ?=
 =?us-ascii?Q?fU82S76IELOKc1eGZ5hWKMZwlPmISHZOgX3gjwOfn1VOQzw4z+D57CzYZ1tD?=
 =?us-ascii?Q?S+9NyKJbf0J4rsvqEnU1P8Jnwwz2kqDBdXZf6Wz4FtgB/KsJ0z2UBfV0+UvF?=
 =?us-ascii?Q?Fw5idWUJRaAwSel0k6QfOlT7zI11lyNnCVzb3CT7XBPf+yZCKj+pot0qp5ZO?=
 =?us-ascii?Q?zpZap6vsI7FPdOQ615yTW2hhzsHZE6AwZwJgoGgZyX/aZBzs1WIXPZPbmvrQ?=
 =?us-ascii?Q?ON2L7vN5HUayD7TV2dggMESZy9ghws0b2B2KZ/Ph6djEiODOOyddzl6hPW9r?=
 =?us-ascii?Q?1PnluSDfA0fbjB05q50Dhs9KLuHpnNqAez+hO5yepy5e7aaRwXPpPw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3378.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T6eONZ214eG96zgQ3AKcQlfzKxjKnOaCVGq2VmWF3eI+3jITR9UC+sJw3j+r?=
 =?us-ascii?Q?iBtfVmi9R1sbpXnDAdnyHstnkaUe21BWptDZSCjVILvloWBt2e31ZKGpuxZN?=
 =?us-ascii?Q?alOzB3dVJS6MTa9neFZPbsYC9BkPS8tBPF53Cah1tPOEQlVqR4w6QD0BpTdU?=
 =?us-ascii?Q?YsiisVOjnMmlLsX10offZzkPuu3Z63Tsc2jYAx0tWFZbXNJsOp/PBARDNIvd?=
 =?us-ascii?Q?FdSpteD10EiSzyn5rbQ1uEAWhdpM7fZwB6d3HpGb6IKEMck6XA+PsIcl+VBv?=
 =?us-ascii?Q?29X5s7I7xiWFPso5Ea+fKb6leoqsoxDqV78wLCBcbVKy/ULte3FiL7xn5A/b?=
 =?us-ascii?Q?1zfZoB2cu33aSCVLpJhWbwTP8X9fie1SgHfqIKK2wby7PDEQOa1B2dZ+p5bg?=
 =?us-ascii?Q?v2lS1yzbmL7l590be/RqHBhGStJDDO+pQzAAVuLwkhOvu5IA0JhJdNA7iNoX?=
 =?us-ascii?Q?HCMUxYGjJEMZlVA8RMONDBit99I5qfcYDmC4fS7feq1SX7QyrIzQhTP9Jfdj?=
 =?us-ascii?Q?f4X3PHT7v9att5G2pzt6OzHS0Gjcue+jlXLXpnW+/p3AhGYSUgI0/sZ7qocF?=
 =?us-ascii?Q?bCfFEW7LzkPOPDFr9onmEh9InN7tv+24k4y9MG5s2Wna3xVlIglDImYYqZMK?=
 =?us-ascii?Q?kTh6RGX1blHSEyczuJsepP2Bcum7OHk3J9pXk8JMPa8ZXVu+eFo56rkpu4sB?=
 =?us-ascii?Q?iVijEgA05/KYob684oJkJkQpZM8eNN4RsbLE6QqJcHk4qwaDlbuq6wNVD3cR?=
 =?us-ascii?Q?NMCRisMoDUeG7DZ0kvp7bX9NKM1o0cXu8DElx3EL41Yu28p9z4BtoZAaJQh5?=
 =?us-ascii?Q?QFhDF4uUKHCGbovMFxYFqCts8ZgnPjVhh/AWl6lV1gInHGWoe5JzVkIKctSh?=
 =?us-ascii?Q?mOH0PYiqAOqPJHSuEMWhqxiTF48KFVmyboLhz8cQFSDK0M2KRUfBIhi+Vak9?=
 =?us-ascii?Q?V19F9Be9vGU+5iJ7H9pGmw7nXSflfx/Hq/UibNQoPJzPKfQ1gaq8WWfFJ1zy?=
 =?us-ascii?Q?WXOpFzi523urW+b6ZyjX8cEsjxD2WlRnLeSgfWlOmN5zNv2Klj4S8c0wBD7k?=
 =?us-ascii?Q?cmmdeZ3mXCu/dHd3icVGKxpNp1NpUHRiRn4kE3K5i2fmsjiwxpfAt3F07BI1?=
 =?us-ascii?Q?2f9HUs6Ql7bht5CXwY2IkW8JHTi39pLMSvW/3+LRNCo8eJfMAWGkc1Pk5OM1?=
 =?us-ascii?Q?OGySb5lYrr6TYnCsChHl4LQj7tkL4PHQ3KYWL7dDtCaEycJS1HT3nLeitzFB?=
 =?us-ascii?Q?jQuBQFikL4td0q5qqPnwEunH6XT5oH4f0Gfnz23XIo0o03SyWqCF92l6nJwK?=
 =?us-ascii?Q?TBmEeGM/hQt0TiMvv+czTlyc31+4Is69H/ak4+BV3gefmffWNuoGqcHtG9yI?=
 =?us-ascii?Q?cUJOnPJOimiQaF+aG/MP4WUGYV+/mKs15cM6nmD0CPl8KCNfJtxM41vAYixl?=
 =?us-ascii?Q?0NuW2I5YQqrUFmRC/U/HlibA1G4IEDYsW1n7Mh+Sta813lGN2//W6WVIEsYg?=
 =?us-ascii?Q?E6hsNu5dQ8RirHde9Dn7kAih2ZMspHaAM0rMYTi5mdIg5lcIXc3ipExkOQpZ?=
 =?us-ascii?Q?copyuxhRdxDiKELPCaHLvk3sRlaDj2V6fBjm/SsQt+OM5fcAEelf3GOa+mV3?=
 =?us-ascii?Q?g+VCc6IRTBq09BpPs9WviYc=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c3f80e3-20d1-4fd0-17c1-08de398f2c2e
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 15:00:21.8544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z9DkYKAwSF0NKEvpv61q/I15CCXyEfQf9MRiemvVZ+Kgs307ehsiHBhMleXx4B4xr2t6DQcgdvUul+6mOp6uoYVyoXotqXpr++5H1gnrNBJ/Vti6d3qhaoOf66XGNQe1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1122
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 21:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122624

Backport the fix for CVE-2025-55298

Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commi=
t/439b362b93c074eea6c3f834d84982b43ef057d5]
                          [https://github.com/ImageMagick/ImageMagick/commi=
t/1f93323df9d8c011c31bc4c6880390071f7fb895]

Add below patch to fix
0010-ImageMagick-Fix-CVE-2025-55298-1.patch
0010-ImageMagick-Fix-CVE-2025-55298-2.patch

Add below support patch to fix
0010-ImageMagick-Add-support-patch-1-to-fix-CVE-2025-5529.patch
0010-ImageMagick-Add-support-patch-2-to-fix-CVE-2025-5529.patch
0010-ImageMagick-Add-support-patch-3-to-fix-CVE-2025-5529.patch

Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
---
 ...support-patch-1-to-fix-CVE-2025-5529.patch |  48 +++
 ...support-patch-2-to-fix-CVE-2025-5529.patch | 205 +++++++++++++
 ...support-patch-3-to-fix-CVE-2025-5529.patch | 103 +++++++
 ...010-ImageMagick-Fix-CVE-2025-55298-1.patch |  71 +++++
 ...010-ImageMagick-Fix-CVE-2025-55298-2.patch | 274 ++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |   5 +
 6 files changed, 706 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0010-ImageMag=
ick-Add-support-patch-1-to-fix-CVE-2025-5529.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0010-ImageMag=
ick-Add-support-patch-2-to-fix-CVE-2025-5529.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0010-ImageMag=
ick-Add-support-patch-3-to-fix-CVE-2025-5529.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0010-ImageMag=
ick-Fix-CVE-2025-55298-1.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0010-ImageMag=
ick-Fix-CVE-2025-55298-2.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/0010-ImageMagick-Add=
-support-patch-1-to-fix-CVE-2025-5529.patch b/meta-oe/recipes-support/image=
magick/files/0010-ImageMagick-Add-support-patch-1-to-fix-CVE-2025-5529.patc=
h
new file mode 100644
index 0000000000..9e95b294e3
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0010-ImageMagick-Add-suppor=
t-patch-1-to-fix-CVE-2025-5529.patch
@@ -0,0 +1,48 @@
+From 93bcbd44f4771227a9e637f69ddabb60e0e33b18 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Tue, 11 Nov 2025 14:34:12 +0530
+Subject: [PATCH 10/18] ImageMagick: Add support patch 1 to fix CVE-2025-55=
298
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/83caf59fce695fea0c5878e9f0d0b65e662cae66]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ MagickCore/image.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/MagickCore/image.c b/MagickCore/image.c
+index 346285165..f64e83645 100644
+--- a/MagickCore/image.c
++++ b/MagickCore/image.c
+@@ -1640,21 +1640,23 @@ MagickExport size_t InterpretImageFilename(const I=
mageInfo *image_info,
+   char
+     *q;
+=20
++  const char
++    *p;
++
+   int
+     c;
+=20
+   MagickBooleanType
+     canonical;
+=20
+-  const char
+-    *p;
+-
+   ssize_t
+     offset;
+=20
+   canonical=3DMagickFalse;
+   offset=3D0;
+   (void) CopyMagickString(filename,format,MagickPathExtent);
++  if (IsStringTrue(GetImageOption(image_info,"filename:literal")) !=3D Ma=
gickFalse)
++    return(strlen(filename));
+   for (p=3Dstrchr(format,'%'); p !=3D (char *) NULL; p=3Dstrchr(p+1,'%'))
+   {
+     q=3D(char *) p+1;
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/files/0010-ImageMagick-Add=
-support-patch-2-to-fix-CVE-2025-5529.patch b/meta-oe/recipes-support/image=
magick/files/0010-ImageMagick-Add-support-patch-2-to-fix-CVE-2025-5529.patc=
h
new file mode 100644
index 0000000000..a51bc1994b
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0010-ImageMagick-Add-suppor=
t-patch-2-to-fix-CVE-2025-5529.patch
@@ -0,0 +1,205 @@
+From 18f573cbd4767d9b51b23cde5b58945ae4e57243 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Tue, 11 Nov 2025 21:53:10 +0530
+Subject: [PATCH 11/18] ImageMagick: Add support patch-2 to fix CVE-2025-55=
298
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/82550750ec8f79393b381c3ed349dd495bbab8a7]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ MagickCore/image.c | 134 +++++++++++++++++++--------------------------
+ 1 file changed, 55 insertions(+), 79 deletions(-)
+
+diff --git a/MagickCore/image.c b/MagickCore/image.c
+index f64e83645..cd4de6df9 100644
+--- a/MagickCore/image.c
++++ b/MagickCore/image.c
+@@ -1638,34 +1638,41 @@ MagickExport size_t InterpretImageFilename(const I=
mageInfo *image_info,
+   ExceptionInfo *exception)
+ {
+   char
+-    *q;
++    *p =3D filename,
++    pattern[MagickPathExtent];
+=20
+   const char
+-    *p;
+-
+-  int
+-    c;
+-
+-  MagickBooleanType
+-    canonical;
+-
+-  ssize_t
+-    offset;
++    *cursor =3D format;
+=20
+-  canonical=3DMagickFalse;
+-  offset=3D0;
++  /*
++    Start with a copy of the format string.
++  */
+   (void) CopyMagickString(filename,format,MagickPathExtent);
+   if (IsStringTrue(GetImageOption(image_info,"filename:literal")) !=3D Ma=
gickFalse)
+     return(strlen(filename));
+-  for (p=3Dstrchr(format,'%'); p !=3D (char *) NULL; p=3Dstrchr(p+1,'%'))
++  while ((cursor=3Dstrchr(cursor,'%')) !=3D (const char *) NULL)
+   {
+-    q=3D(char *) p+1;
+-    if (*q =3D=3D '%')
++    const char
++      *q =3D cursor;
++
++    ssize_t
++      offset =3D (ssize_t) (cursor-format);
++
++    cursor++;  /* move past '%' */
++    if (*cursor =3D=3D '%')
+       {
+-        p++;
++        /*
++          Escaped %%.
++        */
++        cursor++;
+         continue;
+       }
+-    switch (*q)
++    /*
++      Skip padding digits like %03d.
++    */
++    if (*cursor =3D=3D '0')
++      (void) strtol(cursor,(char **) &cursor,10);
++    switch (*cursor)
+     {
+       case 'd':
+       case 'o':
+@@ -1674,93 +1681,62 @@ MagickExport size_t InterpretImageFilename(const I=
mageInfo *image_info,
+         ssize_t
+           count;
+=20
+-        q++;
+-        c=3D(*q);
+-        *q=3D'\0';
+-        count=3DFormatLocaleString(filename+(p-format-offset),(size_t)
+-          (MagickPathExtent-(p-format-offset)),p,value);
+-        if ((count <=3D 0) || (count > (MagickPathExtent-(p-format-offset=
))))
++        count=3DFormatLocaleString(pattern,sizeof(pattern),q,value);
++        if ((count <=3D 0) || (count >=3D MagickPathExtent))
+           return(0);
+-        offset+=3D(ssize_t) ((q-p)-count);
+-        *q=3Dc;
+-        (void) ConcatenateMagickString(filename,q,MagickPathExtent);
+-        canonical=3DMagickTrue;
+-        if (*(q-1) !=3D '%')
+-          break;
+-        p++;
++        if ((offset+count) >=3D MagickPathExtent)
++          return(0);
++        (void) CopyMagickString(p+offset,pattern,(size_t) (MagickPathExte=
nt-
++          offset));
++        cursor++;
+         break;
+       }
+       case '[':
+       {
+-        char
+-          pattern[MagickPathExtent];
+-
+         const char
+-          *option;
++          *end =3D strchr(cursor,']'),
++          *option =3D (const char *) NULL;
+=20
+-        char
+-          *r;
+-
+-        ssize_t
+-          i;
+-
+-        ssize_t
+-          depth;
++        size_t
++          extent =3D (size_t) (end-cursor);
+=20
+         /*
+-          Image option.
++          Handle %[key:value];
+         */
+-        if (strchr(p,']') =3D=3D (char *) NULL)
++        if (end =3D=3D (const char *) NULL)
+           break;
+-        depth=3D1;
+-        r=3Dq+1;
+-        for (i=3D0; (i < (MagickPathExtent-1L)) && (*r !=3D '\0'); i++)
+-        {
+-          if (*r =3D=3D '[')
+-            depth++;
+-          if (*r =3D=3D ']')
+-            depth--;
+-          if (depth <=3D 0)
+-            break;
+-          pattern[i]=3D(*r++);
+-        }
+-        pattern[i]=3D'\0';
+-        if (LocaleNCompare(pattern,"filename:",9) !=3D 0)
++        if (extent >=3D sizeof(pattern))
+           break;
+-        option=3D(const char *) NULL;
++        (void) CopyMagickString(pattern,cursor,extent);
++        pattern[extent]=3D'\0';
+         if (image !=3D (Image *) NULL)
+           option=3DGetImageProperty(image,pattern,exception);
+-        if ((option =3D=3D (const char *) NULL) && (image !=3D (Image *) =
NULL))
++        if ((option =3D=3D (const char *) NULL) && (image !=3D (Image *)N=
ULL))
+           option=3DGetImageArtifact(image,pattern);
+         if ((option =3D=3D (const char *) NULL) &&
+             (image_info !=3D (ImageInfo *) NULL))
+           option=3DGetImageOption(image_info,pattern);
+         if (option =3D=3D (const char *) NULL)
+           break;
+-        q--;
+-        c=3D(*q);
+-        *q=3D'\0';
+-        (void) CopyMagickString(filename+(p-format-offset),option,(size_t=
)
+-          (MagickPathExtent-(p-format-offset)));
+-        offset+=3Dstrlen(pattern)-strlen(option)+3;
+-        *q=3Dc;
+-        (void) ConcatenateMagickString(filename,r+1,MagickPathExtent);
+-        canonical=3DMagickTrue;
+-        if (*(q-1) !=3D '%')
+-          break;
+-        p++;
++        (void) CopyMagickString(p+offset,option,(size_t) (MagickPathExten=
t-
++          offset));
++        cursor=3Dend+1;
+         break;
+       }
+       default:
+         break;
+     }
+   }
+-  if (canonical =3D=3D MagickFalse)
+-    (void) CopyMagickString(filename,format,MagickPathExtent);
+-  else
+-    for (q=3Dfilename; *q !=3D '\0'; q++)
+-      if ((*q =3D=3D '%') && (*(q+1) =3D=3D '%'))
+-        (void) CopyMagickString(q,q+1,(size_t) (MagickPathExtent-(q-filen=
ame)));
++  for (p=3Dfilename; *p !=3D '\0'; )
++  {
++    /*
++      Replace "%%" with "%".
++    */
++    if ((*p =3D=3D '%') && (*(p+1) =3D=3D '%'))
++      (void) memmove(p,p+1,strlen(p));  /* shift left */
++    else
++      p++;
++  }
+   return(strlen(filename));
+ }
+ =0C
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/files/0010-ImageMagick-Add=
-support-patch-3-to-fix-CVE-2025-5529.patch b/meta-oe/recipes-support/image=
magick/files/0010-ImageMagick-Add-support-patch-3-to-fix-CVE-2025-5529.patc=
h
new file mode 100644
index 0000000000..2f4e019132
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0010-ImageMagick-Add-suppor=
t-patch-3-to-fix-CVE-2025-5529.patch
@@ -0,0 +1,103 @@
+From abc0b89e166c993ff766d3ff62b6d2be82f478f3 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Wed, 12 Nov 2025 11:35:37 +0530
+Subject: [PATCH 12/18] ImageMagick: Add support patch-3 to fix CVE-2025-55=
298
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/6c7c8d5866b9c0ce6cc76a741e05b9482716101e]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ MagickCore/image.c | 31 +++++++++++++++++++++----------
+ 1 file changed, 21 insertions(+), 10 deletions(-)
+
+diff --git a/MagickCore/image.c b/MagickCore/image.c
+index cd4de6df9..1acf8edbd 100644
+--- a/MagickCore/image.c
++++ b/MagickCore/image.c
+@@ -1647,6 +1647,8 @@ MagickExport size_t InterpretImageFilename(const Ima=
geInfo *image_info,
+   /*
+     Start with a copy of the format string.
+   */
++  assert(format !=3D (const char *) NULL);
++  assert(filename !=3D (char *) NULL);
+   (void) CopyMagickString(filename,format,MagickPathExtent);
+   if (IsStringTrue(GetImageOption(image_info,"filename:literal")) !=3D Ma=
gickFalse)
+     return(strlen(filename));
+@@ -1670,7 +1672,7 @@ MagickExport size_t InterpretImageFilename(const Ima=
geInfo *image_info,
+     /*
+       Skip padding digits like %03d.
+     */
+-    if (*cursor =3D=3D '0')
++    if (isdigit((int) ((unsigned char) *cursor)) !=3D 0)
+       (void) strtol(cursor,(char **) &cursor,10);
+     switch (*cursor)
+     {
+@@ -1682,9 +1684,8 @@ MagickExport size_t InterpretImageFilename(const Ima=
geInfo *image_info,
+           count;
+=20
+         count=3DFormatLocaleString(pattern,sizeof(pattern),q,value);
+-        if ((count <=3D 0) || (count >=3D MagickPathExtent))
+-          return(0);
+-        if ((offset+count) >=3D MagickPathExtent)
++        if ((count <=3D 0) || (count >=3D MagickPathExtent) ||
++            ((offset+count) >=3D MagickPathExtent))
+           return(0);
+         (void) CopyMagickString(p+offset,pattern,(size_t) (MagickPathExte=
nt-
+           offset));
+@@ -1698,7 +1699,9 @@ MagickExport size_t InterpretImageFilename(const Ima=
geInfo *image_info,
+           *option =3D (const char *) NULL;
+=20
+         size_t
+-          extent =3D (size_t) (end-cursor);
++          extent =3D (size_t) (end-cursor-1),
++          option_length,
++          tail_length;
+=20
+         /*
+           Handle %[key:value];
+@@ -1707,19 +1710,27 @@ MagickExport size_t InterpretImageFilename(const I=
mageInfo *image_info,
+           break;
+         if (extent >=3D sizeof(pattern))
+           break;
+-        (void) CopyMagickString(pattern,cursor,extent);
++        (void) CopyMagickString(pattern,cursor+1,extent+1);
+         pattern[extent]=3D'\0';
+         if (image !=3D (Image *) NULL)
+-          option=3DGetImageProperty(image,pattern,exception);
+-        if ((option =3D=3D (const char *) NULL) && (image !=3D (Image *)N=
ULL))
+-          option=3DGetImageArtifact(image,pattern);
++          {
++            option=3DGetImageProperty(image,pattern,exception);
++            if (option =3D=3D (const char *) NULL)
++              option=3DGetImageArtifact(image,pattern);
++          }
+         if ((option =3D=3D (const char *) NULL) &&
+             (image_info !=3D (ImageInfo *) NULL))
+           option=3DGetImageOption(image_info,pattern);
+         if (option =3D=3D (const char *) NULL)
+           break;
++        option_length=3Dstrlen(option);
++        tail_length=3Dstrlen(end+1);
++        if ((offset+option_length+tail_length+1) > MagickPathExtent)
++          return(0);
+         (void) CopyMagickString(p+offset,option,(size_t) (MagickPathExten=
t-
+           offset));
++        (void) ConcatenateMagickString(p+offset+option_length,end+1,(size=
_t) (
++          MagickPathExtent-offset-option_length-tail_length-1));
+         cursor=3Dend+1;
+         break;
+       }
+@@ -1733,7 +1744,7 @@ MagickExport size_t InterpretImageFilename(const Ima=
geInfo *image_info,
+       Replace "%%" with "%".
+     */
+     if ((*p =3D=3D '%') && (*(p+1) =3D=3D '%'))
+-      (void) memmove(p,p+1,strlen(p));  /* shift left */
++      (void) memmove(p,p+1,strlen(p+1)+1);  /* shift left */
+     else
+       p++;
+   }
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/files/0010-ImageMagick-Fix=
-CVE-2025-55298-1.patch b/meta-oe/recipes-support/imagemagick/files/0010-Im=
ageMagick-Fix-CVE-2025-55298-1.patch
new file mode 100644
index 0000000000..95dda55623
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0010-ImageMagick-Fix-CVE-20=
25-55298-1.patch
@@ -0,0 +1,71 @@
+From 62f97a69edb936544604e669de25e4bf2a9e2f06 Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Wed, 12 Nov 2025 11:52:00 +0530
+Subject: [PATCH 13/18] ImageMagick: Fix CVE-2025-55298
+
+CVE: CVE-2025-55298
+
+This CVE fixed in two parts, this commit includes the first fix.
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/1f93323df9d8c011c31bc4c6880390071f7fb895]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ MagickCore/image.c | 32 ++++++++++++++++++++++++++++++++
+ 1 file changed, 32 insertions(+)
+
+diff --git a/MagickCore/image.c b/MagickCore/image.c
+index 1acf8edbd..7a52236d8 100644
+--- a/MagickCore/image.c
++++ b/MagickCore/image.c
+@@ -1633,6 +1633,31 @@ MagickExport VirtualPixelMethod GetImageVirtualPixe=
lMethod(const Image *image)
+ %    o exception: return any errors or warnings in this structure.
+ %
+ */
++
++static inline MagickBooleanType PercentNInvalidOperation(char *filename)
++{
++  MagickBooleanType
++    match =3D MagickFalse;
++
++  size_t
++    length =3D strlen(filename);
++
++  ssize_t
++    i;
++
++  for (i=3D0; i < (ssize_t) length-1; i++)
++  {
++    if ((filename[i] =3D=3D '%') &&
++        ((filename[i+1] =3D=3D 'n') || (filename[i+1] =3D=3D 'N')))
++      {
++        filename[i]=3D'?';
++        filename[i+1]=3D'\?';
++        match=3DMagickTrue;
++      }
++  }
++  return(match);
++}
++
+ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
+   Image *image,const char *format,int value,char *filename,
+   ExceptionInfo *exception)
+@@ -1652,6 +1677,13 @@ MagickExport size_t InterpretImageFilename(const Im=
ageInfo *image_info,
+   (void) CopyMagickString(filename,format,MagickPathExtent);
+   if (IsStringTrue(GetImageOption(image_info,"filename:literal")) !=3D Ma=
gickFalse)
+     return(strlen(filename));
++  if (PercentNInvalidOperation(filename) !=3D MagickFalse)
++    {
++      errno=3DEPERM;
++      (void) ThrowMagickException(exception,GetMagickModule(),OptionError=
,
++        "InvalidArgument","`%s'",filename);
++      return(0);
++    }
+   while ((cursor=3Dstrchr(cursor,'%')) !=3D (const char *) NULL)
+   {
+     const char
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/files/0010-ImageMagick-Fix=
-CVE-2025-55298-2.patch b/meta-oe/recipes-support/imagemagick/files/0010-Im=
ageMagick-Fix-CVE-2025-55298-2.patch
new file mode 100644
index 0000000000..c9cbf95c4d
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0010-ImageMagick-Fix-CVE-20=
25-55298-2.patch
@@ -0,0 +1,274 @@
+From b7e445241e43e3e919667d7244ccb99573cf951a Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Date: Wed, 12 Nov 2025 13:05:40 +0530
+Subject: [PATCH 14/18] ImageMagick: Fix CVE-2025-55298
+
+CVE: CVE-2025-55298
+
+This CVE fixed in two parts, this commit includes the second fix.
+
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/439b362b93c074eea6c3f834d84982b43ef057d5]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+---
+ MagickCore/image.c | 183 ++++++++++++++++++++++++---------------------
+ 1 file changed, 96 insertions(+), 87 deletions(-)
+
+diff --git a/MagickCore/image.c b/MagickCore/image.c
+index 7a52236d8..3e6fdd114 100644
+--- a/MagickCore/image.c
++++ b/MagickCore/image.c
+@@ -1619,7 +1619,7 @@ MagickExport VirtualPixelMethod GetImageVirtualPixel=
Method(const Image *image)
+ %
+ %  A description of each parameter follows.
+ %
+-%    o image_info: the image info..
++%    o image_info: the image info.
+ %
+ %    o image: the image.
+ %
+@@ -1634,28 +1634,38 @@ MagickExport VirtualPixelMethod GetImageVirtualPix=
elMethod(const Image *image)
+ %
+ */
+=20
+-static inline MagickBooleanType PercentNInvalidOperation(char *filename)
++static inline MagickBooleanType IsValidFormatSpecifier(const char *start,
++  const char *end)
+ {
+-  MagickBooleanType
+-    match =3D MagickFalse;
+-
++  char
++    specifier =3D end[-1];
+   size_t
+-    length =3D strlen(filename);
++    length =3D end-start;
+=20
+-  ssize_t
+-    i;
++  /*
++    Is this a valid format specifier?
++  */
++  if ((specifier !=3D 'd') && (specifier !=3D 'x') && (specifier !=3D 'o'=
))
++    return(MagickFalse);
++  if ((length =3D=3D 1) && (*start =3D=3D specifier))
++    return(MagickTrue);
++  if (length >=3D 2)
++    {
++      size_t
++        i =3D 0;
+=20
+-  for (i=3D0; i < (ssize_t) length-1; i++)
+-  {
+-    if ((filename[i] =3D=3D '%') &&
+-        ((filename[i+1] =3D=3D 'n') || (filename[i+1] =3D=3D 'N')))
+-      {
+-        filename[i]=3D'?';
+-        filename[i+1]=3D'\?';
+-        match=3DMagickTrue;
+-      }
+-  }
+-  return(match);
++      if (*start =3D=3D '0')
++        {
++          if ((length >=3D 3) && (start[1] =3D=3D '0'))
++            return(MagickFalse);
++          i=3D1;
++        }
++      for ( ; i < (length-1); i++)
++        if (isdigit((int) ((unsigned char) start[i])) =3D=3D 0)
++          return(MagickFalse);
++      return(MagickTrue);
++    }
++  return(MagickFalse);
+ }
+=20
+ MagickExport size_t InterpretImageFilename(const ImageInfo *image_info,
+@@ -1669,82 +1679,89 @@ MagickExport size_t InterpretImageFilename(const I=
mageInfo *image_info,
+   const char
+     *cursor =3D format;
+=20
+-  /*
+-    Start with a copy of the format string.
+-  */
+   assert(format !=3D (const char *) NULL);
+   assert(filename !=3D (char *) NULL);
+-  (void) CopyMagickString(filename,format,MagickPathExtent);
+   if (IsStringTrue(GetImageOption(image_info,"filename:literal")) !=3D Ma=
gickFalse)
+-    return(strlen(filename));
+-  if (PercentNInvalidOperation(filename) !=3D MagickFalse)
+     {
+-      errno=3DEPERM;
+-      (void) ThrowMagickException(exception,GetMagickModule(),OptionError=
,
+-        "InvalidArgument","`%s'",filename);
+-      return(0);
++      (void) CopyMagickString(filename,format,MagickPathExtent);
++      return(strlen(filename));
+     }
+-  while ((cursor=3Dstrchr(cursor,'%')) !=3D (const char *) NULL)
++  while ((*cursor !=3D '\0') && ((p-filename) < ((ssize_t) MagickPathExte=
nt-1)))
+   {
+     const char
+-      *q =3D cursor;
++      *specifier_start,
++      *start;
+=20
+-    ssize_t
+-      offset =3D (ssize_t) (cursor-format);
+-
+-    cursor++;  /* move past '%' */
++    if (*cursor !=3D '%')
++      {
++        *p++=3D(*cursor++);
++        continue;
++      }
++    start=3Dcursor++;  /* Skip '%' */
+     if (*cursor =3D=3D '%')
+       {
+-        /*
+-          Escaped %%.
+-        */
++        *p++=3D'%';
+         cursor++;
+         continue;
+       }
+-    /*
+-      Skip padding digits like %03d.
+-    */
+-    if (isdigit((int) ((unsigned char) *cursor)) !=3D 0)
+-      (void) strtol(cursor,(char **) &cursor,10);
+-    switch (*cursor)
+-    {
+-      case 'd':
+-      case 'o':
+-      case 'x':
++    specifier_start=3Dcursor;
++    while (isdigit((int) ((unsigned char) *cursor)) !=3D 0)
++      cursor++;
++    if ((*cursor =3D=3D 'd') || (*cursor =3D=3D 'o') || (*cursor =3D=3D '=
x'))
+       {
+-        ssize_t
+-          count;
++        const char
++          *specifier_end =3D cursor+1;
+=20
+-        count=3DFormatLocaleString(pattern,sizeof(pattern),q,value);
+-        if ((count <=3D 0) || (count >=3D MagickPathExtent) ||
+-            ((offset+count) >=3D MagickPathExtent))
+-          return(0);
+-        (void) CopyMagickString(p+offset,pattern,(size_t) (MagickPathExte=
nt-
+-          offset));
+-        cursor++;
+-        break;
++        if (IsValidFormatSpecifier(specifier_start,specifier_end) !=3D Ma=
gickFalse)
++          {
++            char
++              format_specifier[MagickPathExtent];
++
++            size_t
++              length =3D cursor-specifier_start;
++
++            ssize_t
++              count;
++
++            (void) snprintf(format_specifier,sizeof(format_specifier),
++              "%%%.*s%c",(int) length,specifier_start,*cursor);
++            count=3DFormatLocaleString(pattern,sizeof(pattern),format_spe=
cifier,
++              value);
++            if ((count <=3D 0) || ((p-filename+count) >=3D MagickPathExte=
nt))
++              return(0);
++            (void) CopyMagickString(p,pattern,MagickPathExtent-(p-filenam=
e));
++            p+=3Dstrlen(pattern);
++            cursor++;
++            continue;
++          }
++        else
++          {
++            /*
++              Invalid specifier =E2=80=94 treat as literal.
++            */
++            cursor=3Dstart;
++            *p++=3D(*cursor++);
++            continue;
++          }
+       }
+-      case '[':
++    if (*cursor =3D=3D '[')
+       {
+         const char
+           *end =3D strchr(cursor,']'),
+           *option =3D (const char *) NULL;
+=20
+         size_t
+-          extent =3D (size_t) (end-cursor-1),
+-          option_length,
+-          tail_length;
++          extent,
++          option_length;
+=20
+-        /*
+-          Handle %[key:value];
+-        */
+         if (end =3D=3D (const char *) NULL)
+-          break;
++          continue;
++        extent=3D(size_t) (end-cursor-1);
+         if (extent >=3D sizeof(pattern))
+-          break;
++          continue;
+         (void) CopyMagickString(pattern,cursor+1,extent+1);
+         pattern[extent]=3D'\0';
+-        if (image !=3D (Image *) NULL)
++        if (image !=3D NULL)
+           {
+             option=3DGetImageProperty(image,pattern,exception);
+             if (option =3D=3D (const char *) NULL)
+@@ -1754,32 +1771,24 @@ MagickExport size_t InterpretImageFilename(const I=
mageInfo *image_info,
+             (image_info !=3D (ImageInfo *) NULL))
+           option=3DGetImageOption(image_info,pattern);
+         if (option =3D=3D (const char *) NULL)
+-          break;
++          continue;
+         option_length=3Dstrlen(option);
+-        tail_length=3Dstrlen(end+1);
+-        if ((offset+option_length+tail_length+1) > MagickPathExtent)
++        if ((p-filename+option_length) >=3D MagickPathExtent)
+           return(0);
+-        (void) CopyMagickString(p+offset,option,(size_t) (MagickPathExten=
t-
+-          offset));
+-        (void) ConcatenateMagickString(p+offset+option_length,end+1,(size=
_t) (
+-          MagickPathExtent-offset-option_length-tail_length-1));
++        (void) CopyMagickString(p,option,MagickPathExtent-(p-filename));
++        p+=3Doption_length;
+         cursor=3Dend+1;
+-        break;
++        continue;
+       }
+-      default:
+-        break;
+-    }
+-  }
+-  for (p=3Dfilename; *p !=3D '\0'; )
+-  {
+     /*
+-      Replace "%%" with "%".
++      Invalid or unsupported specifier =E2=80=94 treat as literal.
+     */
+-    if ((*p =3D=3D '%') && (*(p+1) =3D=3D '%'))
+-      (void) memmove(p,p+1,strlen(p+1)+1);  /* shift left */
+-    else
+-      p++;
++    cursor=3Dstart;
++    if ((p-filename+1) >=3D MagickPathExtent)
++      return(0);
++    *p++=3D(*cursor++);
+   }
++  *p=3D'\0';
+   return(strlen(filename));
+ }
+ =0C
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/me=
ta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index 751186b361..ecd4d85b3a 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -34,6 +34,11 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.gi=
t;branch=3Dmain;protocol=3Dhtt
     file://0007-ImageMagick-Fix-CVE-2025-57803.patch \
     file://0008-ImageMagick-Fix-CVE-2025-57807.patch \
     file://0009-ImageMagick-Fix-CVE-2025-55154.patch \
+    file://0010-ImageMagick-Add-support-patch-1-to-fix-CVE-2025-5529.patch=
 \
+    file://0010-ImageMagick-Add-support-patch-2-to-fix-CVE-2025-5529.patch=
 \
+    file://0010-ImageMagick-Add-support-patch-3-to-fix-CVE-2025-5529.patch=
 \
+    file://0010-ImageMagick-Fix-CVE-2025-55298-1.patch \
+    file://0010-ImageMagick-Fix-CVE-2025-55298-2.patch \
 "
=20
 SRCREV =3D "35b4991eb0939a327f3489988c366e21068b0178"
--=20
2.34.1


