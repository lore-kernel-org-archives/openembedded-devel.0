Return-Path: <wolfgang.meyer@gossenmetrawatt.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6A3C6FA90
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 08:45:38 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [104.47.9.52])
 by mx.groups.io with SMTP id smtpd.web11.3926.1663404327536631645
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Sep 2022 01:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gossenmetrawatt.onmicrosoft.com
 header.s=selector1-gossenmetrawatt-onmicrosoft-com header.b=9Xq8ZSoC;
 spf=pass (domain: gossenmetrawatt.com, ip: 104.47.9.52,
 mailfrom: wolfgang.meyer@gossenmetrawatt.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQnxxVdJMHmtiIa0Rf9LSXSuIQ7KC7qgWZilVEtwbqvIPFJT0hmAxLvUDrCA/bIvfG9pjy4BL53PS0u0rNBXC4/XV/puJ/I29tqRe8LKbMFtqTCXcidDSKDOIS/skmGYEb5gV+4FNIYzwx1cCnUiaMh3gxGw8Qeqqav9AjNGVl4t1k84FMBN4218PmvbdmnKa2nKCHzQoLdkSWALkmFjSHoS4+v+bc7Xo/t9WjY7UHyMCZ8lRRUeWXHpB5DX1G0WCSYfBCbfCxYKDAZCZB34J/0v+2wqYekyDh+qwUrvagA+AfaH6Xlxgff1gdgWEjR/UA1b4VMZ6fXX/Jzsk3z3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqQMDpS7vdaMhSHrRZ+k1FvzmknYFKH0lipdSZOz2Pk=;
 b=Y/wDcKkuBp8+w0SnfZdD0RWQeaaL5tQp7DHeI0IvzuFVFM503M60+2UlcJGdwMmvMw8piENyUxDjcVpSnbRtbl7Yn70YTkuexzejDD88E0418CCIE4VDrhuxP5r1qr4tRNKdOgg6yOzzoOMERfy3mu6GnADX2dOoIAInQsWxrDQ1/uQfFJFg5ZjkoPPzOBKC1QMPObF77+npNMuNxD+2HsnAwKUT/VoFCIae0p4Xje/1NSajaMPnNqU+FUNE6Ze9RtP8uXyfJVmb18NiobnwKq9KnYDbgCaRfrZsTWSv+Vdo2Vw0FfTreH0PJfZJZ11a83ldUtblZSNyKqWlmc7XmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gossenmetrawatt.com; dmarc=pass action=none
 header.from=gossenmetrawatt.com; dkim=pass header.d=gossenmetrawatt.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gossenmetrawatt.onmicrosoft.com;
 s=selector1-gossenmetrawatt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqQMDpS7vdaMhSHrRZ+k1FvzmknYFKH0lipdSZOz2Pk=;
 b=9Xq8ZSoCPeaNqvVRIZrvirTWxKGK010uG2TZNsi8lyOcJur+rLKrcvQZUcQIhw5BvoK22F0tBGjnMqxQBRwpQWgqeCC8kN9MSphtR/yjiaDwk1I8N2H8vvE6+eK35eGZlCK3Ijf+Kzk5MSPtPBq7A0aEbg9wwPNqg517NMAVydY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gossenmetrawatt.com;
Received: from VE1PR08MB5583.eurprd08.prod.outlook.com (2603:10a6:800:1ac::24)
 by DU0PR08MB7461.eurprd08.prod.outlook.com (2603:10a6:10:354::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.17; Sat, 17 Sep
 2022 08:45:25 +0000
Received: from VE1PR08MB5583.eurprd08.prod.outlook.com
 ([fe80::742f:f82e:f58:2a5a]) by VE1PR08MB5583.eurprd08.prod.outlook.com
 ([fe80::742f:f82e:f58:2a5a%8]) with mapi id 15.20.5632.018; Sat, 17 Sep 2022
 08:45:25 +0000
From: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
Subject: [meta-oe][PATCH 4/4] fbida: make fbpdf build optional
Date: Sat, 17 Sep 2022 10:44:59 +0200
Message-Id: <20220917084459.17933-4-Wolfgang.Meyer@gossenmetrawatt.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220917084459.17933-1-Wolfgang.Meyer@gossenmetrawatt.com>
References: <20220917084459.17933-1-Wolfgang.Meyer@gossenmetrawatt.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::16) To VE1PR08MB5583.eurprd08.prod.outlook.com
 (2603:10a6:800:1ac::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB5583:EE_|DU0PR08MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: 9582868d-984d-4a15-878c-08da9888f6ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Npx4k2ASOP9RGF/mXVBVThQzt50nzWbjs1XROCdhmDz+CcNBoFgTfAZBVrI4MCsDUYJkdqvPQ6QvApnWSdEOEOzWWhoI2SaurnG9wExFHgDMShL5oRo1ynhdLI62Wu7Bxmj3zlSDKVL4sj9ef8pqrXNtvj2sFBlfTLuIJocE06sQqhEH7oREWjD7tHKOUr6Y+MZ2kXIiEDTlnnpyKkNKpHiZvE1r3GChTRE3Pk3qFyWb1YuvCW2QDyMpXaA8HBNz+FnGvr4L0is+2ZNAwwCt5GMAeUA6aQLb80zL7r8Jz2Hz+cELjYxBLyQY9h6ujjqKJ1l93ML9t1V7jGHsg/yRty11tLspee4eltN3tZgjm3Jh6Y0QDS8uL5do/hX1NHwRxISi6aXikwXD0dMAPvCfqMVvD45UYbgon6RPuTR6OibP3FBqyyjLXEVnl+c/t4G8T+7PdQaG8p4z6jUR3ao1W303K6s4mQOFGQiB8/EYmMcrfoSyR+IYfjixRfzZrNxkTAI20+Ddz6AhvwO9mihheoRlf0+dyyovoEFWQ1+9p36zErG/vjhCrdtjIIf96JhIBeSUtVRQbSVFoF1TTqvOXHzsyCu8TAmK+wG7ZMhdP/3ZpsTMxEHLkKLuAqpSPMnYYTL0oA2IUa/LT86YTRJ0Mqxr6lwppoRdoyZGkvu2RrpbjMkSybu/N1ZnAuQYCx0c1W8+o6PX6F562mQOq0eR2ei4b4cpUBxE3gbnVbY1P2FdkS8YjReY4Pw3A/98ROUOVWLrUzLTUvInWj/FvRQSoA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5583.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(346002)(376002)(396003)(39840400004)(451199015)(83380400001)(6666004)(107886003)(186003)(52116002)(1076003)(6506007)(2616005)(6512007)(26005)(41300700001)(2906002)(5660300002)(6486002)(6916009)(966005)(66556008)(478600001)(66946007)(8936002)(4326008)(316002)(66476007)(8676002)(86362001)(36756003)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UYnAA+D+cX9tZVxpbstsFvJNq4fVclODoXh8az8YTJGaQRPjWxvoIKSreWcM?=
 =?us-ascii?Q?hk5Rm+b8NJTsHEszLsonxGTw8QsFELsKNoHFZYqpX325FQzQ3e3stqrPzrCy?=
 =?us-ascii?Q?mNKikD+9d4dO7Ae6ruWgVDgX9hi5/otXTqOteCtHlrhTMx+QdUEUl0sdGiFA?=
 =?us-ascii?Q?ONbEovFVxFoleCIzg/uBmdIkMkIvG/tNZHMBtiI7wSRxIXIlSehJGnK1OgwZ?=
 =?us-ascii?Q?NGxe/YPb3DK60u3Q7t41M0xJFg0KM3g1ET7XHy6vf0SpBlQ8SpLIWWIiFmoW?=
 =?us-ascii?Q?C1jEXMzoYEjWNvwM92qD3qNlFBa/rlImiSYYHAO9bdvs1wuyccq/iqE4sdxw?=
 =?us-ascii?Q?13GviPDtfNreSTGdnA+WqN6gGJenFsLGoblXDt6QctkeYJznDFolLt1a6IYl?=
 =?us-ascii?Q?mf4nqkOE+4iDzobJIPH9WR+Uuxvn8pchaAYV0+5zcchhsUjGdfO1s0e1C5fy?=
 =?us-ascii?Q?KS+fZwmiSRKeVxGP290BwdZ1NVgL7ecU9mpqSe5CAZxDkY0kOuLcld/+VYWS?=
 =?us-ascii?Q?U+4wxn0n5oe6z9yt0xeXacolVAh4V171cHCMZblFOvJKXeBrELeFT4wC3lLd?=
 =?us-ascii?Q?CmvdF/TkK7JfIaQmoYLKqsy20JCDzv7PaEMF4k3o/mT2uYm0yO0pLH6JjLJ+?=
 =?us-ascii?Q?nWozoqHK4uZIk2ePyNvUcfZclbeGhLix4Z54HtGvv8Ls/fVDFljHHT1bRYmv?=
 =?us-ascii?Q?kKCBLhHAUUiLS726nSDA1tqZ250tPt/6Phu/I/WO+j3WXlimg/oEGYYPmAVb?=
 =?us-ascii?Q?wIceJH7HhMGdGVGHf7uKsassBMjgBD/oSDYoqTO4pzxlVn7DTDL7tJlzUDQy?=
 =?us-ascii?Q?/+XqcmfGA3EShxVyBuW5zjElnmyXhlyK2MwJVhBhxv7Zr7HCUeDDbruGi2Uz?=
 =?us-ascii?Q?ZeJD/bmpqaHOAxWNMyGMZuCTnP1oKphK3t2Xtsy/nve6k9RU4eWjY4Eh2ZFP?=
 =?us-ascii?Q?aQIV6S3FdcICOx0vGyZtS6cf2b7SEGTR2L3hAOuJA0Q3nOhCMZPHmZJS45oI?=
 =?us-ascii?Q?fv9Tp41S17CJroIfqOx+/8jYGn6Q6nRo+axfYpKbPcAWdcW79iWikF/++mKU?=
 =?us-ascii?Q?/wDw4QsSXqs3TOisilb1CyzGY+DSNfQwsq0qGoTy0vaR8TPqhPlVn2RzOYfo?=
 =?us-ascii?Q?FF5imp1DuGGX5a7AXm4u+Dpi7aWG7A1A5/n8hnoT2ZN7I5h2iK8gC5IK9D0i?=
 =?us-ascii?Q?chX9gybSUwtPCyC2PG/5DweanpFGQ1oN9PFlo2xKnzpMf6fC8D09MzhthNEp?=
 =?us-ascii?Q?tG4Gyjx9io8S1PbBx7KK9yThFAF1neUrHAtWA/+dSIh+UOZ5husXXT5O9RsC?=
 =?us-ascii?Q?noUudRSqvhjfMnHyWr3FqNWAE/0vBU09LXTI93FGKPOamDIYJP9UbO8ayZ6y?=
 =?us-ascii?Q?GnYjqxaZkd0/rT6qeX1TKFq3KrV0L5M9GGmUpCnbgFO/tkODMNHh6RvsQRSx?=
 =?us-ascii?Q?3LoR67v0vtHkXOBdHVSo0PjQwM31xx3Slgh9lIjxmn26aIZ4GV9q+otd7ONz?=
 =?us-ascii?Q?awJ7evB1ioNlhDi9QHrqWf0xlfYfAZ/b2c8j1qz+YRL3AsNwZzEbIDkQBmyT?=
 =?us-ascii?Q?LShaayWgy0CoR//VYxDeu/MA2YCjyhGO5o5Vl+LnKi6MT/ZpERgqc1kK/imF?=
 =?us-ascii?Q?zA8RE5++35elBhEkW5GANm8=3D?=
X-OriginatorOrg: gossenmetrawatt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9582868d-984d-4a15-878c-08da9888f6ef
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB5583.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2022 08:45:25.3151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 927cd455-6160-4d75-86b6-a6892a3b5317
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BXi7oShRrIMNoFm0j+kVhSggcyDdBHpsTaCXZzmIANzMh+SYQ6HUigT0LmHPb4lUOWFaRCW2Csd4wPxt3Zg0bGLdIdofQgLfxhyyfpYSpG1Tg3Y/qyaKgUQNRbYurZAi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7461
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Sep 2022 08:45:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98847

Signed-off-by: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
---
 meta-oe/recipes-graphics/fbida/fbida_git.bb   |  6 +-
 ...eson.build-make-fbpdf-build-optional.patch | 64 +++++++++++++++++++
 2 files changed, 68 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/fbida/files/0001-meson.build-m=
ake-fbpdf-build-optional.patch

diff --git a/meta-oe/recipes-graphics/fbida/fbida_git.bb b/meta-oe/recipes-=
graphics/fbida/fbida_git.bb
index 9d9e349e2..236c9af9a 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_git.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_git.bb
@@ -8,7 +8,7 @@ SECTION =3D "utils"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De8feb78a32950a909621bbb51f634b3=
9"

-DEPENDS =3D "virtual/libiconv jpeg fontconfig freetype libexif libdrm pixm=
an udev libinput poppler libepoxy cairo"
+DEPENDS =3D "virtual/libiconv jpeg fontconfig freetype libexif libdrm pixm=
an udev libinput cairo"

 PV =3D "2.14+git${SRCPV}"
 SRC_URI =3D "\
@@ -19,6 +19,7 @@ SRC_URI =3D "\
     file://0001-meson.build-install-fbgs-shell-script.patch               =
  \
     file://0002-meson.build-add-features-options-for-png-gif-tiff-we.patch=
  \
     file://0003-meson.build-do-not-require-xkbcommon.patch                =
  \
+    file://0001-meson.build-make-fbpdf-build-optional.patch               =
  \
 "
 SRCREV =3D "eb769e3d7f4a073d4c37ed524ebd5017c6a578f5"
 S =3D "${WORKDIR}/git"
@@ -28,12 +29,13 @@ inherit meson pkgconfig features_check
 # Depends on libepoxy
 REQUIRED_DISTRO_FEATURES =3D "opengl"

-PACKAGECONFIG ??=3D "gif png"
+PACKAGECONFIG ??=3D "gif png pdf"
 PACKAGECONFIG[gif] =3D "-Dgif=3Denabled,-Dgif=3Ddisabled,giflib"
 PACKAGECONFIG[png] =3D "-Dpng=3Denabled,-Dpng=3Ddisabled,libpng"
 PACKAGECONFIG[tiff] =3D "-Dtiff=3Denabled,-Dtiff=3Ddisabled,tiff"
 PACKAGECONFIG[motif] =3D "-Dmotif=3Denabled,-Dmotif=3Ddisabled,libx11 libx=
ext libxpm libxt openmotif"
 PACKAGECONFIG[webp] =3D "-Dwebp=3Denabled,-Dwebp=3Ddisabled,libwebp"
+PACKAGECONFIG[pdf] =3D "-Dpdf=3Denabled,-Dpdf=3Ddisabled,poppler libepoxy"

 CFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_=
X11=3D1', d)}"

diff --git a/meta-oe/recipes-graphics/fbida/files/0001-meson.build-make-fbp=
df-build-optional.patch b/meta-oe/recipes-graphics/fbida/files/0001-meson.b=
uild-make-fbpdf-build-optional.patch
new file mode 100644
index 000000000..6c0d0f1d3
--- /dev/null
+++ b/meta-oe/recipes-graphics/fbida/files/0001-meson.build-make-fbpdf-buil=
d-optional.patch
@@ -0,0 +1,64 @@
+From c00a155e90a9b22bd6ab5fa5407bb9923ee16ca0 Mon Sep 17 00:00:00 2001
+From: "Meyer, Wolfgang" <Wolfgang.Meyer@gossenmetrawatt.com>
+Date: Fri, 16 Sep 2022 18:45:58 +0200
+Subject: [PATCH] meson.build: make fbpdf build optional
+
+---
+ meson.build       | 22 ++++++++++++----------
+ meson_options.txt |  1 +
+ 2 files changed, 13 insertions(+), 10 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 6b3daf3..289d1ec 100644
+--- a/meson.build
++++ b/meson.build
+@@ -15,11 +15,11 @@ x11resdir    =3D x11resrun.stdout().strip()
+
+ # pkg-config deps
+ pixman_dep   =3D dependency('pixman-1')
+-poppler_dep  =3D dependency('poppler-glib')
++poppler_dep  =3D dependency('poppler-glib', required: get_option('pdf'))
+ cairo_dep    =3D dependency('cairo')
+ drm_dep      =3D dependency('libdrm')
+-gbm_dep      =3D dependency('gbm')
+-epoxy_dep    =3D dependency('epoxy')
++gbm_dep      =3D dependency('gbm', required: get_option('pdf'))
++epoxy_dep    =3D dependency('epoxy', required: get_option('pdf'))
+ exif_dep     =3D dependency('libexif')
+ png_dep      =3D dependency('libpng', required: get_option('png'))
+ tiff_dep     =3D dependency('libtiff-4', required: get_option('tiff'))
+@@ -132,13 +132,15 @@ fbpdf_deps   =3D [ drm_dep, gbm_dep, epoxy_dep,
+                  pixman_dep, poppler_dep, cairo_dep,
+                  udev_dep, input_dep ]
+
+-executable('fbpdf',
+-           sources             : fbpdf_srcs,
+-           dependencies        : fbpdf_deps,
+-           install             : true)
+-install_data('fbgs',
+-             install_dir        : get_option('bindir'),
+-             install_mode       : 'rwxr--r--')
++if get_option('pdf').enabled()
++    executable('fbpdf',
++               sources             : fbpdf_srcs,
++               dependencies        : fbpdf_deps,
++               install             : true)
++    install_data('fbgs',
++                 install_dir        : get_option('bindir'),
++                 install_mode       : 'rwxr--r--')
++endif
+
+ # build fbcon
+ fbcon_srcs   =3D [ 'fbcon.c', 'drmtools.c', 'fbtools.c', 'gfx.c', 'vt.c',=
 'kbd.c' ]
+diff --git a/meson_options.txt b/meson_options.txt
+index ce37188..74699ab 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -3,3 +3,4 @@ option('png', type: 'feature', value : 'enabled')
+ option('tiff', type: 'feature', value : 'enabled')
+ option('webp', type: 'feature', value : 'disabled')
+ option('motif', type: 'feature', value : 'disabled')
++option('pdf', type: 'feature', value : 'enabled')
+--
+2.37.3
+
--
2.37.3


Gossen Metrawatt GmbH

S=FCdwestpark 15
90449 N=FCrnberg
Germany

http://www.gossenmetrawatt.com
Amtsgericht N=FCrnberg HRB 24 602/USt-IdNr. DE815002769
Gesch=E4ftsf=FChrer: Marcel Hutka, Matthias Wist

Gossen Metrawatt GmbH is a member of GMC INSTRUMENTS-Group

[https://www.gmc-instruments.de/media/mailfooter/mailfooter.jpg]<http://www=
.gossenmetrawatt.com>

