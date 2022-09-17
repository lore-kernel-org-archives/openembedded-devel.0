Return-Path: <wolfgang.meyer@gossenmetrawatt.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ABC8ECAAD3
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 08:45:38 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [104.47.9.52])
 by mx.groups.io with SMTP id smtpd.web11.3926.1663404327536631645
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Sep 2022 01:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gossenmetrawatt.onmicrosoft.com
 header.s=selector1-gossenmetrawatt-onmicrosoft-com header.b=wNrSMWjI;
 spf=pass (domain: gossenmetrawatt.com, ip: 104.47.9.52,
 mailfrom: wolfgang.meyer@gossenmetrawatt.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/2TBpqORGOlbpY70rsLs0JPjK/cCTW1MexmnxpGDZijGUiAGtTG2N4sVOj4lXCgK7auwDcPLphViAIbEsGMMJm8ikgv5AaVZTloQeLovnAJWuQxbvxpQ94tT2sBkfIGMm3GIWaV/kl0eyq7XCrDrH8q8TGPqPvI4LlEylKkqaBrS5f2NsuO4ts9HNV9FNT6a7FGqrN9O2eUIISrs65Kf8OeKxps8TfCpNCa7UC4/NmabNPqXJaH6FH9oQqq+l6mzf/xPR4y5u8Y1qrMxychUQcUZLuc1QWdy7TOV3MGXyYdJMghzcxLO541fQvOLpCsPfOdp6QiDvKvEO14Ob9N2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLJ+WIw1AWr3PWlY3kOj16p1qPYlWWWwzpMJaKLpx5U=;
 b=ASObYBvM0f0L1vrxJsjTu6Oay27Wq6Cz+xNFxYsx0oCVVq1vqCYZq64RXW29G0jNVkO/fLCuoH0uVUAxj1MS/gnn7me9Yjyhm2CEzu5dqyWOcApa91XWs/ZlivrGxTBRPTZ7am4HlsaYE/c/tszABMttaWuFJqQ/aQi/h5qlo2OK4b4fFx1Ip0lliABRDI7c9OOmFnq0RetGaH8QdaKz7SJyLtLUacKPMnpW9pCayK+ELIL1cMZzuDMoQMex4vivGKDO2Q+rAkQ77K2x/QPu7NHXGKgfMgax3odn4Q6o+tt97u7DKk8BxS7797scmU70He6WUuW42Iom5Cxk9puVKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gossenmetrawatt.com; dmarc=pass action=none
 header.from=gossenmetrawatt.com; dkim=pass header.d=gossenmetrawatt.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gossenmetrawatt.onmicrosoft.com;
 s=selector1-gossenmetrawatt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLJ+WIw1AWr3PWlY3kOj16p1qPYlWWWwzpMJaKLpx5U=;
 b=wNrSMWjIPJOJ/AJ9v2DdwsoluT1Cb3iwyBHzAtIcHMOhodkj5SA3uCp7IVrBRumi7xFGhREBq+SxwRRStL4dY66qdJL7Ajl4fUF66luoFdqYEzjxwyTozSJi1ViGPcX3nThlnlhJLQDvjeRovxxUdUnfiyShieM5ojXRcCOxwtM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gossenmetrawatt.com;
Received: from VE1PR08MB5583.eurprd08.prod.outlook.com (2603:10a6:800:1ac::24)
 by DU0PR08MB7461.eurprd08.prod.outlook.com (2603:10a6:10:354::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.17; Sat, 17 Sep
 2022 08:45:24 +0000
Received: from VE1PR08MB5583.eurprd08.prod.outlook.com
 ([fe80::742f:f82e:f58:2a5a]) by VE1PR08MB5583.eurprd08.prod.outlook.com
 ([fe80::742f:f82e:f58:2a5a%8]) with mapi id 15.20.5632.018; Sat, 17 Sep 2022
 08:45:24 +0000
From: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
Subject: [meta-oe][PATCH 3/4] fbida: SRC_REV bump ac9005b..eb769e3
Date: Sat, 17 Sep 2022 10:44:58 +0200
Message-Id: <20220917084459.17933-3-Wolfgang.Meyer@gossenmetrawatt.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0ce1b0cb-b2fe-4b5b-b785-08da9888f61b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	geqkmH3ANgmYV6otn4HPw4PyrBYE6Q8/FTj6DYqJkgfV88Qu+M3CoAqloq7ATPSy51xH5wLsOfmzKauug/s4DBs1Vp+/wJ9ASNmO45f6Na5SBWfYiJTC6avOOb1CGUjKRMcogFcHqu4Nzywcal9yHV9FUTLm/d7yUtzZmcgBSris/BzSBX6pHsFGTXn/8CzIiNlaVQP4HuIOuQFZBgwvFqckYnzkRKOsEhQR+8LCzySKuSZDaStGyCZBruHWSgN3jsZBYuze6WXDX/t1ITaEMQ7LpCVs/a4JatWNXNFkSK8yi7INDGiIR875DO81TLchh72uwBZELzA1wdLRfNvhaCv66moQaK9wzhPsr0XrYrwOckYHPHFEmppU9O56Y6vqVvUBz9Ifj/AhfpNH6HD1WXIW08U00WmlXiIFxzvYKbnOvoF+wnwVpfIuqqhJDiseso7zSEVsTxDFGJim6aDuLC8rLys/UR/aMxvRfv+UukJEmWAu0bzhD23DAu952MF3LsB2c3OnqACsODz+131aqajZS2ti7QEENXeMXZChTOcdGJiSXEE+sDJqsBGh534/ZRiVYKhpdl7eyaGf48sv8lqTvbr+kAMybiaTSe4itT8W7If4SV/4ueLMe//LabjEXIlxEmK0V8JgvYXn3VGOHPj1Yy3GMbp74KNEMMukESTOtmc0ecmLY6MFCrJTZRapfdQyDRvxhWBEfj1VcJztFx0Ey0gmqVi6ZN7bJwPT2DOpggIMdykYC+t3zHQ4c/b8am4k0z2nbKRTl+hOl4HMNV7JknZsKKjwV+hvlUICDJ8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5583.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(346002)(376002)(396003)(39840400004)(451199015)(83380400001)(6666004)(107886003)(186003)(52116002)(1076003)(6506007)(2616005)(6512007)(26005)(41300700001)(2906002)(5660300002)(6486002)(6916009)(966005)(66556008)(478600001)(66946007)(8936002)(4326008)(316002)(66476007)(8676002)(86362001)(36756003)(38350700002)(38100700002)(101420200003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?862ILMTL9WGRCC2mrQBFLEjh3f6cVA67icXoiolLRbQcbuT+/ggz3ydcp7tG?=
 =?us-ascii?Q?jatDroaImbQtUnFiGZX0Vx4M6Pe/eEzvk9E4/KciBSDwYDwz66NVqnkWYX0q?=
 =?us-ascii?Q?bT92FLRGPa4l7hByMZRL8JfAOEkE1UQ3dZ/zhSBX4KgnRM1IDYoCX95xhpJR?=
 =?us-ascii?Q?RxXWEgQI2gWtZFJYNidSDoZKNpL7WaHQe9DhxMX35V6EfdZ09IqC2b+Hid3l?=
 =?us-ascii?Q?/5GimMup0joRCoDBMHdZvai8KEmjIv7sC2EdPO+hKbrzjpN7eDZP7JL21Up5?=
 =?us-ascii?Q?8yOxZVLLEVM3V1HbL6Uc0V/DrBajLZ6yMfOtJENE/nnWXjrMPu7PU1SbQNSm?=
 =?us-ascii?Q?z7XT27HRnoRwL1afH1iZuz601ip7p8oTnMAHG1zjf3yQVlYOVt2v8fKwLO+r?=
 =?us-ascii?Q?d5T3XHqAs76OxQlwm0yy7I4bJix43nSK4WG0GZWW+sZWcSG/AIFKt2U/UGHs?=
 =?us-ascii?Q?NDKW7PVWoEmUXOYB4/at4zaiyHT5AG/PipcdBQGzkWmhkhppAU0Abj6QAGqU?=
 =?us-ascii?Q?fBlHa+JSt8TeOYCfZM16ewrfhoVMOqMJxp1F5+V0Ng7tCRF3CryUwYVcP6hE?=
 =?us-ascii?Q?ho8avWHXqb5TGWSL7qZoouq8DRpTdmsKgJBf7oFgEMb0h/aLDL9AyeEyAiMT?=
 =?us-ascii?Q?kh0yRf81lk7liEsnhDBIoMp8k+14EfsU/UwIOI2A9VIgmdtT/SEoeRDlxEo6?=
 =?us-ascii?Q?H3KkhxxJi8RnAce7TkWxxLkKEec/FUe1tFXRV+bVbsIgKJx9Yyaa7pWB+cqC?=
 =?us-ascii?Q?tY9Mdokg+vnhw8uH7cvbM9MtNaBVVsNoKQrdhNG2v1UQx6uDAWd+ZseJ//cC?=
 =?us-ascii?Q?6pDhpdLB11UQyM5a+Kxe+P/MfJwP8M1u6ico2xMC710cwTdUYaUUbbjbzyAt?=
 =?us-ascii?Q?3VsCMN8ZHKk616WF+CzMxW3AsKLHh3QAH4Bk0X1+y60zP6ckYFHscMJftHCS?=
 =?us-ascii?Q?XYGz7RYuJYfYTe74/iZdwlYOxS6xHzKCIXMp76KuhHvNz+YtB/MMYFRNmkN6?=
 =?us-ascii?Q?5wP7vUGI1Sx8hroaG7L5s7Sx8IHQkkbQCgNYg8v95ENl7IRVXwzNt+WOZF/B?=
 =?us-ascii?Q?bHoT8xNVaPSshZ5Bz46ZSq77QdwWXYVAAmXpvJYXy1LAjGv1feZEDdpFjPtc?=
 =?us-ascii?Q?13DOX0it96txy7eeDNL9bEXt9J4kFAPmdaXpU94h+duk4LYzBEXd1pzhWH4V?=
 =?us-ascii?Q?FlrUZZY4O7EGkQ3jWJcuqM2FIgWUVe0IQrQ0XjQBeAoZO6f0tTgHHGO15kwv?=
 =?us-ascii?Q?BdkNn4qdAFcb8auUOVshjpqRfAtJQk8biTpwfjhXQQ66lc39c/12aP6QQ1tD?=
 =?us-ascii?Q?M4CwWzN87qyyPtk7rLlAR1+xBqmhVhYy//vezI/m/GDApP0y3iJf/RMbPfKg?=
 =?us-ascii?Q?pXP48NUIB8yEWk74LGj/LZ8P1h3zp3L32A+YLF+CzNH2HdDjSUF98QlsEhpq?=
 =?us-ascii?Q?VdsB9nG32xKRT/sx2IsuK3DcZryNKgPo31SPHljYHXfirX2hRIZWnKEMZ+3a?=
 =?us-ascii?Q?Eqv6caoPW3d1CDRYcPyUHU2H0C62/Zktw5ax4igq2XLsIstJ6tMJQB1+QZzA?=
 =?us-ascii?Q?qbGg34VimwGx1IiTYEpU9uLVpBHRYuUKrDbSAGTG6BwKnPR2YJcsQn7D8WCo?=
 =?us-ascii?Q?XVeATAAbPdqsAHtdex89gZc=3D?=
X-OriginatorOrg: gossenmetrawatt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0ce1b0cb-b2fe-4b5b-b785-08da9888f61b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB5583.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2022 08:45:23.9268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 927cd455-6160-4d75-86b6-a6892a3b5317
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2yOX8avkrOBKfZrkbLm9fzHCWb5jCAn24EJN/QiZEq6Gk/5Yn9ifPUsKC4dGb91Gkahy31urNJ2lUNg/o/DOfQzS5LDhc3xjzsiuVgikObQhe4hcgdJf+4JMIEZOiyS7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7461
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Sep 2022 08:45:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98846

The new build target fbcon is not built as the dependency libtsm cannot be =
met.

Changelogs:
eb769e3 clear sb on resize
82cff28 scrollback
ef35479 fbcon: cleanups, resize
a89c23e color tweak, inverse support
ff74e64 some optimizations
3b682fa fixes
94b0a4b update specfile
86da298 use libtsm kbd support
853c1b3 fbcon: switch to libtsm
6d62ddc drop dead code
d4aad4f blit using pixman, drop dirty line tracking
ea92708 fix cairo shadow clear
11ae121 tweak error logging
679347d drm format wireup
fb7fa43 fmt wireup, framebuffer
c2f9a48 format fixups
930713c add gfxfmt, fixes
4ff884b drop drmtools-egl.c
b8e5897 use pixman for image blit+blend
83a73a8 libinput check fix
60fa59d libinput tweaks
0e322a1 dirty fix, parse font name
8d5f8b0 fix pause
b66dd93 use cairo for text rendering
b69070a fix darkify
01a758d drop more line editing support
1e0cead drop line editing support
fe220c2 use cairo for darkify
f1609f4 fix cairo, use cairo for lines
100c5b1 init cairo context for shadow
900255f fix blend
c140de7 drop legacy build system
8b995ae drop dither support, switch shadow fb to DRM_FORMAT_XRGB8888 (aka C=
AIRO_FORMAT_RGB24)
8c07498 use cloexec
920879c fbdev support, console switching
9767597 add fbcon session
07b44a5 tweak console switching
620c38f drop -vt option
7fcf29e read keymap from /etc/vconsole.conf
c49dee0 move ansi keys
69d0357 color tweaks
aa62b1b terminal reply
6c289d5 udev device enumeration
2764d42 fill winsize
084cd1b more keys
f73e9dd update spec
541df7d add static
718d175 cursor key support
5a77b52 cache contexts, init font early, autosize terminal
d359a58 add color and cursor rendering
c1da53f add simple, experimental terminal emulator

Signed-off-by: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
---
 meta-oe/recipes-graphics/fbida/fbida_git.bb   |  3 ++-
 ...eson.build-install-fbgs-shell-script.patch |  6 ++---
 ...features-options-for-png-gif-tiff-we.patch | 21 ++++++++--------
 ...meson.build-do-not-require-xkbcommon.patch | 25 +++++++++++++++++++
 4 files changed, 40 insertions(+), 15 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/fbida/files/0003-meson.build-d=
o-not-require-xkbcommon.patch

diff --git a/meta-oe/recipes-graphics/fbida/fbida_git.bb b/meta-oe/recipes-=
graphics/fbida/fbida_git.bb
index ab3c7d361..9d9e349e2 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_git.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_git.bb
@@ -18,8 +18,9 @@ SRC_URI =3D "\
     file://fbida-gcc10.patch                                              =
  \
     file://0001-meson.build-install-fbgs-shell-script.patch               =
  \
     file://0002-meson.build-add-features-options-for-png-gif-tiff-we.patch=
  \
+    file://0003-meson.build-do-not-require-xkbcommon.patch                =
  \
 "
-SRCREV =3D "ac9005bf0bbf50f14dc1b368be5084c8e0510a5d"
+SRCREV =3D "eb769e3d7f4a073d4c37ed524ebd5017c6a578f5"
 S =3D "${WORKDIR}/git"

 inherit meson pkgconfig features_check
diff --git a/meta-oe/recipes-graphics/fbida/files/0001-meson.build-install-=
fbgs-shell-script.patch b/meta-oe/recipes-graphics/fbida/files/0001-meson.b=
uild-install-fbgs-shell-script.patch
index 06ec5dfd8..5f8deab67 100644
--- a/meta-oe/recipes-graphics/fbida/files/0001-meson.build-install-fbgs-sh=
ell-script.patch
+++ b/meta-oe/recipes-graphics/fbida/files/0001-meson.build-install-fbgs-sh=
ell-script.patch
@@ -11,7 +11,7 @@ diff --git a/meson.build b/meson.build
 index cbed982..2129896 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -124,6 +124,9 @@ executable('fbpdf',
+@@ -126,6 +126,9 @@ executable('fbpdf',
             sources             : fbpdf_srcs,
             dependencies        : fbpdf_deps,
             install             : true)
@@ -19,8 +19,8 @@ index cbed982..2129896 100644
 +             install_dir        : get_option('bindir'),
 +             install_mode       : 'rwxr--r--')

- # build kbdtest
- executable('kbdtest',
+ # build fbcon
+ fbcon_srcs   =3D [ 'fbcon.c', 'drmtools.c', 'fbtools.c', 'gfx.c', 'vt.c',=
 'kbd.c' ]
 --
 2.37.3

diff --git a/meta-oe/recipes-graphics/fbida/files/0002-meson.build-add-feat=
ures-options-for-png-gif-tiff-we.patch b/meta-oe/recipes-graphics/fbida/fil=
es/0002-meson.build-add-features-options-for-png-gif-tiff-we.patch
index cf89da926..65ca99d79 100644
--- a/meta-oe/recipes-graphics/fbida/files/0002-meson.build-add-features-op=
tions-for-png-gif-tiff-we.patch
+++ b/meta-oe/recipes-graphics/fbida/files/0002-meson.build-add-features-op=
tions-for-png-gif-tiff-we.patch
@@ -1,8 +1,7 @@
-From fa60c06cadd6acd8abede91e75254e7250a087a3 Mon Sep 17 00:00:00 2001
+From cdcde5c1fd106a69118dff98118600911392762f Mon Sep 17 00:00:00 2001
 From: "Meyer, Wolfgang" <Wolfgang.Meyer@gossenmetrawatt.com>
-Date: Fri, 16 Sep 2022 13:40:25 +0200
-Subject: [PATCH] meson.build: add features options for png, gif, tiff, web=
,
- and motif
+Date: Fri, 16 Sep 2022 16:25:38 +0200
+Subject: [PATCH] meson.build: options for png, gif, tiff, webp, and motif

 ---
  meson.build       | 41 +++++++++++++++++++++++++++--------------
@@ -12,10 +11,10 @@ Subject: [PATCH] meson.build: add features options for =
png, gif, tiff, web,
  create mode 100644 meson_options.txt

 diff --git a/meson.build b/meson.build
-index cbed982..e66ee48 100644
+index cd9cc49..b5e3ffc 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -21,9 +21,9 @@ drm_dep      =3D dependency('libdrm')
+@@ -23,9 +23,9 @@ drm_dep      =3D dependency('libdrm')
  gbm_dep      =3D dependency('gbm')
  epoxy_dep    =3D dependency('epoxy')
  exif_dep     =3D dependency('libexif')
@@ -27,9 +26,9 @@ index cbed982..e66ee48 100644
 +webp_dep     =3D dependency('libwebp', required : get_option('webp'))
  udev_dep     =3D dependency('libudev')
  input_dep    =3D dependency('libinput')
-
-@@ -32,20 +32,20 @@ cc           =3D meson.get_compiler('c')
- jpeg_dep     =3D cc.find_library('jpeg')
+ xkb_dep      =3D dependency('xkbcommon')
+@@ -36,20 +36,20 @@ jpeg_dep     =3D cc.find_library('jpeg')
+ util_dep     =3D cc.find_library('util')
  math_dep     =3D cc.find_library('m', required : false)
  pcd_dep      =3D cc.find_library('pcd', required : false)
 -gif_dep      =3D cc.find_library('gif', required : false)
@@ -57,7 +56,7 @@ index cbed982..e66ee48 100644
  image_deps   =3D [ jpeg_dep, png_dep, tiff_dep,
                   pcd_dep, gif_dep, webp_dep ]

-@@ -53,11 +53,21 @@ if pcd_dep.found()
+@@ -57,11 +57,21 @@ if pcd_dep.found()
      read_srcs +=3D 'rd/read-pcd.c'
      config.set('HAVE_LIBPCD', true)
  endif
@@ -81,7 +80,7 @@ index cbed982..e66ee48 100644
      read_srcs +=3D 'rd/read-webp.c'
      config.set('HAVE_LIBWEBP', true)
  endif
-@@ -153,7 +166,7 @@ ida_srcs     =3D [ 'ida.c', 'man.c', 'hex.c', 'x11.c',=
 'viewer.c',
+@@ -168,7 +181,7 @@ ida_srcs     =3D [ 'ida.c', 'man.c', 'hex.c', 'x11.c',=
 'viewer.c',
  ida_deps     =3D [ pixman_dep, exif_dep, image_deps, math_dep,
                   motif_dep, xpm_dep, xt_dep, xext_dep, x11_dep ]

diff --git a/meta-oe/recipes-graphics/fbida/files/0003-meson.build-do-not-r=
equire-xkbcommon.patch b/meta-oe/recipes-graphics/fbida/files/0003-meson.bu=
ild-do-not-require-xkbcommon.patch
new file mode 100644
index 000000000..9fabc20df
--- /dev/null
+++ b/meta-oe/recipes-graphics/fbida/files/0003-meson.build-do-not-require-=
xkbcommon.patch
@@ -0,0 +1,25 @@
+From ec82a194f3454ac203a134c9a99bac6d63095d25 Mon Sep 17 00:00:00 2001
+From: "Meyer, Wolfgang" <Wolfgang.Meyer@gossenmetrawatt.com>
+Date: Fri, 16 Sep 2022 18:29:03 +0200
+Subject: [PATCH] meson.build: do not require xkbcommon
+
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 341939c..b5dab14 100644
+--- a/meson.build
++++ b/meson.build
+@@ -26,7 +26,7 @@ tiff_dep     =3D dependency('libtiff-4', required: get_o=
ption('tiff'))
+ webp_dep     =3D dependency('libwebp', required : get_option('webp'))
+ udev_dep     =3D dependency('libudev')
+ input_dep    =3D dependency('libinput')
+-xkb_dep      =3D dependency('xkbcommon')
++xkb_dep      =3D dependency('xkbcommon', required : false)
+ tsm_dep      =3D dependency('libtsm', required : false)
+
+ # other library deps
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

