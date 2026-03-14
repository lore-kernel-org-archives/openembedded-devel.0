Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CB310706D4
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 12:00:15 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8354.1773489605872401325
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Mar 2026 05:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=ZEek6xxH;
 spf=pass (domain: navimatix.de, ip: 52.101.69.75, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MTBaKAf33gVCkz6K93VLvacHGSqLI4We7mPy7KuUBUyc70cpw/+FdzGo4/qyfV3yAk8+RAcxEY+/jTUoBRZMQ02VKZCDijJZlwohZEFrMqbwEwjB0hWZG1y5CoiYO4C8c9VmGwav5QrNshDOFDuiFtFYYgA5VE+K6zkNPf2DcHoQl/AXu5xVzKNAngQPWUjEdupFUNd2XAS5+SG3/iVjXbE5amvsag7EuZcmTGnBcywJ2AuEWzK7w6Il5lIRgVL4T6qE8+L5b9rPIKmBH70IX5bfATa2x2m+NxGH0x3GCR4McSan1LITVLLJFMctGnYbftuKEEw9O2uI4hSkEmLERA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7uykFn4+rgR83iSzCw+AfBBfeKDTcqJIwJ6eXFVDiU=;
 b=LYrcWOH1FLvZWjQBgzJ3e8xdr+6TONTglAgPymJK8dKbG34x3PKM1Qrb50cwquycnke6Ed/yq5a1JkU+JZ4wlemaj0+EvSGvbUGCv4/6mpF3wyCjQG+T6qP3zMb+G5chkc69+IuOfhfJnboF6mLnVQayy0NZkoPYeLn+RorObxtnKlB9hLeYGb9bpWRSdJs3LZbke+qp9nq2H7WQmW6LKCVRqxFLQq62Sx6XVvVf2fQrUGaj7QneG00K/NJUa7r08hpIzO4y1Do9Hirmx3PhV1ATBbge8SmOTocA7TFd5MCeq1b41y/TlfXhSb2SAjBLkUM1pdbcENq/QmmHJOU/GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7uykFn4+rgR83iSzCw+AfBBfeKDTcqJIwJ6eXFVDiU=;
 b=ZEek6xxHgsyDYpPt+hcnWMDKbXxJx1/9fhp0qnNV5blVkUILrxzPKM+ambMzYoJGU2ibk3oPRmfFZPmOG2uXfEcVF7gmu9J84KtCREb1HtFiQIJJaXhF3J2zEKgKdEQ6GGbGc9IV6uKJ0NIbRslp8EeRNswQX+t+anmjdLiqUFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by MI3PR01MB12410.eurprd01.prod.exchangelabs.com
 (2603:10a6:290:6e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Sat, 14 Mar
 2026 12:00:03 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9700.018; Sat, 14 Mar 2026 12:00:00 +0000
Date: Sat, 14 Mar 2026 13:00:02 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 2/2] multimedia/fswebcam: New recipe for a webcam image
 grabber
Message-ID: <285dcf1ffa906351b9102b15ac1bcc5995c0e674.1773489599.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <11abf2a38c37c565257019092e68b85ac257fb4f.1773489599.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <11abf2a38c37c565257019092e68b85ac257fb4f.1773489599.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE0P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::15) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|MI3PR01MB12410:EE_
X-MS-Office365-Filtering-Correlation-Id: a0230749-b5b3-4c60-2108-08de81c137d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Pi3rq/5sUUEv5ZKogy+Qi+RaEqcqHarZo7q7ypzOLDB9rBZrCzdNbcmpM7FYyZszgZjp0zFFAkph7+BmV+YW4CupaK3oG9M1xCgbuhZF19c5EizhSFLYor2LZkCxC+ftM1mdI6fDu0jpWGlDn0NW1X6Udv0IBmvCmK9LtLzjIVjO+Jh+2avLH/ITy8L/Koh4TjknBfxS5ZS+sz3ApIaeWlFCZFJ2P27Ha0NcfF4elSLZlC9RcJqxj+wJGw30OEMTqYIT/TBcW899J68zpXCPRd0AH7uae3ayWZaTVsO9r++0SLU26vnCvqZc69COIH0ni1I6Q+2Duc7lsIuUY4yIHOAe8UEfReY81+K1JteQLHHdvz7SwwNap7Evh2+SjZdHVi37jO+44nzOsGGbWqjlXAkU8jF4D67ckHWuvMRwyARu3j6C7Ppw0++qh2BJ6LmlC/D5yT8MVxFroBqEccTIRgt5Q4oIKpt830lYsrTJThoo3DDRvkhgWnHeqRidkoIOUtz8wQTKK5lwUPHGtmXAabwS/44w0Wr+OI/Pb1Ml7bXVKJq+x0zVhNbf8xv80ddCZkHpRPU/6Z2SUtrXzkGF3fRnb5wTDpnntjNyVQt7Dd8ldT5e68B3rMVh2n5FdkoMHMfgffsBlFW9CD8N/dG+AjE7MX+i7JT+wFDeTQTp5yUl7z7JCVVHAoeAcJt6hHAS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Spo6nuGztDd+JxXV7FI73MOueMoQE82UzK4Q67L4XR0GYAb8qcSwkKlXlV+D?=
 =?us-ascii?Q?HyD3Ft2g4oVaJfa+gY6lKYlTpVBQjZd/Zp8w1bXOsObQyi8Ng1FVD7LK6MrQ?=
 =?us-ascii?Q?XNG6AaDjVWpfcQTlYh6FzWl/KB62tV3qijumgoPlNedCdqLPtiDGS0D2ieww?=
 =?us-ascii?Q?37uLYv434shsQ149mQ9a4BdOSyR+AszheEKt1Jrff0W86TjdfyEyx8xY2UQw?=
 =?us-ascii?Q?lMXQnNLfiFBVDG2yc+UJq75S7UynYeFGtp6mMwKYz/iYrSV7DXPCr8wzO1Ou?=
 =?us-ascii?Q?PuFGMKqXvT0Jk0XilqinfWQcb6yZihAne6mW5Yarw8CZJt3aEGgryJRzlR6I?=
 =?us-ascii?Q?pa7ZsoQ+Yvpw6hOlQOJ9dz0cY3Kl0+MRv0wA9Nk14yK7FP/ggWGOuY4PT2Ak?=
 =?us-ascii?Q?agitD+cAsOPxyqhqQBrT1CiXS2+HT5RN0+cR8i1gyNhdcPNjAyEtn5qyIMWm?=
 =?us-ascii?Q?by+bpoBl38NVfMUtG+g+NeW7rjOtqNxDsLuglmKy/9n4wiqSnr+9677Tu9yW?=
 =?us-ascii?Q?X1MVCDEO6B8qeLFzaV3DoXYWbUGkWHVDNHM9vDzsDgGzQn/hK0bb4rWpmcSe?=
 =?us-ascii?Q?RrkP1etNt5pxO+D1HL+hqhNC74aCrF3/FWwpz1kq2/xtXLy2Ud0OaQf8kDOR?=
 =?us-ascii?Q?nx7UEnBq9sfFJBORIxnTbNbTlB2z+MwHDaqYUggdkHxVjXLMr4IgJ+VIsBWd?=
 =?us-ascii?Q?ISKVk6nYizYewYKNspifJjGFxeIHPrbgZog84/ybi0HO6mCI5O+5bKbeUsEn?=
 =?us-ascii?Q?gqKrkfU9va4IuH8dxUp28CznTWJUePX29RQT13qg8GxFsrPmkfkJQwFii0Xn?=
 =?us-ascii?Q?GPxdZ1j/sqSwz5WOL5bIM/A4IMEuJtZHGhwV8thOb6YMF/fWl2xwaMbwVjlF?=
 =?us-ascii?Q?Tc8TX0+A0MTl/v1tfBCjdu4LdRE+NXlosCMGMFfcs3+0lt6l/4IUvzZzQNRN?=
 =?us-ascii?Q?H8ZAlEerKgDOSP2tiQ3afKUbRRSWv8w7TBhXITuTrr6IZta8FW23K9XgDxfK?=
 =?us-ascii?Q?WyxXRcsvH4xmieAftAmABR7GoJmb1ZC1ujALmOXtjFTF6fFpdftYw8G0YnBQ?=
 =?us-ascii?Q?sqATISc3nsLTEhGemP29ow34SabN4P/nZBo0cHV1Q5JtMm/HzxsgeKo6qz6L?=
 =?us-ascii?Q?UB5trZ+mvFYjKlb05oKIHB7kEUdX/iUVrZf8vQv6lgrp0/avr1VnfHvsAuUO?=
 =?us-ascii?Q?daGS/q9UMuJwekTN4zJfV2rZQ2xbVvd86cTJGJ1N7PcLBcksz0NHDQDi3Eoq?=
 =?us-ascii?Q?Okpq740CpKFf6jwC5C/AbMa14eJ3qewIbjNprxtfz1WZKWVfzLTJxGeBTOeo?=
 =?us-ascii?Q?FXyWGAoAvWSdJqROOEHWvJq0o0pDLOjpG7wmfL0bAZNgL5lbvVXl4LFRaYbq?=
 =?us-ascii?Q?QC880x7lFK7nh20yy+FMpSsYj35X/xIoDXE4nXi5mWXJ/+0qKyI7lXP1o8Z4?=
 =?us-ascii?Q?nPzY6cWQJzoTLEt/YWez1mR3sNGLtnAq2Gm6Q52Q13GxPcyOGRtwlsttbHUA?=
 =?us-ascii?Q?K77UhL5flh547Olfzf8dBqbCsRS31qi4bAQu8GyGI6iHqz47XGhy3yLiBs5C?=
 =?us-ascii?Q?hHLuxDA/bdPBDJAuKFxs07EZXUS+YqZuZ5OgpZsA1OZe+MVrS65m2IqHxU4P?=
 =?us-ascii?Q?2j24xl8ZWPLGXxsCTGvknMZ5CL1jYXCmKoGeC3CBgR71CKwk8n/kuOX4Yiqa?=
 =?us-ascii?Q?qPQJQqG4CswYyykKBkNWgUdPa7jx5hv7kBVlp2U6kgsjVV3TytEeOHJTFR1n?=
 =?us-ascii?Q?2kK5DqVNXV6J3k8TOYPHlufn9PxsEQk=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a0230749-b5b3-4c60-2108-08de81c137d0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:00:00.0136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVLJ4WWajY5/CEIgNpRfwdsjTb9wqjd6wbQ6kPrsEwQ5uUOz1SKSPOTXaq+6wfXxjxhEZjjHKST0uSCV/9Ifdt3V+E09W09o3ruXQNctlY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR01MB12410
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 12:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125203

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Taken from
https://github.com/linux4sam/meta-atmel/blob/master/recipes-multimedia/fswe=
bcam/fswebcam_git.bb
and amended.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../fswebcam/fswebcam_20200725.bb             | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/fswebcam/fswebcam_20=
200725.bb

diff --git a/meta-multimedia/recipes-multimedia/fswebcam/fswebcam_20200725.=
bb b/meta-multimedia/recipes-multimedia/fswebcam/fswebcam_20200725.bb
new file mode 100644
index 0000000000..129735fdac
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/fswebcam/fswebcam_20200725.bb
@@ -0,0 +1,21 @@
+SUMMARY =3D "Webcam image grabber and manipulation application"
+DESCRIPTION =3D "\
+    fswebcam captures images from a V4L1/V4L2 compatible device or file, \
+    averages them to reduce noise and draws a caption using the GD Graphic=
s \
+    Library which also handles compressing the image to PNG or JPEG. The \
+    resulting image is saved to a file or sent to stdio where it can be pi=
ped \
+    to something like ncftpput or scp. \
+"
+HOMEPAGE =3D "http://www.sanslogic.co.uk/fswebcam/"
+BUGTRACKER =3D "https://codeberg.org/fsphil/fswebcam/issues"
+SECTION =3D "graphics"
+
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D393a5ca445f6965873eca0259a17f83=
3"
+
+DEPENDS =3D "gd"
+
+SRC_URI =3D "git://github.com/fsphil/fswebcam.git;protocol=3Dhttps;branch=
=3Dmaster"
+SRCREV =3D "db35d4bbd336885a44f017ff142bc9523dbdce3c"
+
+inherit autotools-brokensep
--=20
2.53.0


