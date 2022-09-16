Return-Path: <wolfgang.meyer@gossenmetrawatt.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95213ECAAD8
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 17:24:00 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [104.47.18.111])
 by mx.groups.io with SMTP id smtpd.web10.8986.1663349029868186444
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 10:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gossenmetrawatt.onmicrosoft.com
 header.s=selector1-gossenmetrawatt-onmicrosoft-com header.b=gNPPIHPj;
 spf=pass (domain: gossenmetrawatt.com, ip: 104.47.18.111,
 mailfrom: wolfgang.meyer@gossenmetrawatt.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F233/s6zeCP1Ls4qhMeviDc2kKaZLRuQz99DB9xYch3OIXbsp1m1RO9XG6WZ4gXFuy63r70a3PmqqBdgNTg+bVn3m/9zW6Y1p8cCfkG9LZb8RPMoI36AolZFEE/y9eXAVIyHDLd9/sltMiQ6/prxsV03clHLhh165+PmkkhI6Ps9De8ICPexaBD8KNXMO9v/FlUNRcqNxr/p3QGZUG0xLEYDhIrAbT88RQYnN6g99BEK63FuaYgeiTtCNTPjpBY0uAcN0D1SsT7N/tDd+6lJMlYbpkYbjyV6Dazys9ILl6ir+AXRYubPxcIeVWDF/kz4m8/rV+dWmyp4DMe8k4DC8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLJ+WIw1AWr3PWlY3kOj16p1qPYlWWWwzpMJaKLpx5U=;
 b=axO/t3bZi+rG6Dpx/DXKcNKc5SbNLkNwRKHoPd1EyObWn6Xdkzp5Hlhfhqge+mFmouqiVX5D5eKU/CAS1P+xnYoM3rEeJ/HVX+uc85HDrtwbxCQB+WC3NLuSiH2OkxFGfYLyrp3J2Ws3ZZyYeM6Zpjq2UT+1YdsOssdNkNOQcEJvuq7yBYnZJj3pSMIMX9ajKOXKWYo53Qd1hpIlurrV9Jj2ynveP5VR+Oc/0LGywfxH11P7tZ0QMR/q1YTwWZ9YapFC2YzdioE4d8wDQoJ9FsJzyKLjdiWHIBQLhKx/KPh0h5v7IFEN8Z/hqg3Ccgapz957kfA/fOGlncwCTUBj5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gossenmetrawatt.com; dmarc=pass action=none
 header.from=gossenmetrawatt.com; dkim=pass header.d=gossenmetrawatt.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gossenmetrawatt.onmicrosoft.com;
 s=selector1-gossenmetrawatt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLJ+WIw1AWr3PWlY3kOj16p1qPYlWWWwzpMJaKLpx5U=;
 b=gNPPIHPjEjX7kGR4J/5bFJlTS17xckSurZLbl/2mvgjAiVlf2uHAsMWnzDEjEIZAUaPWt3opgf+RjSnEt6wgqBbnYoeHpelpjfz6qaQbRly9jVSjKYEDmoS2OL82WuBazIal/pvPT1TyfSM+0HA5KxmA53xaFMnSKUXcbcc6nF0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gossenmetrawatt.com;
Received: from VE1PR08MB5583.eurprd08.prod.outlook.com (2603:10a6:800:1ac::24)
 by VE1PR08MB5725.eurprd08.prod.outlook.com (2603:10a6:800:1b0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 17:23:50 +0000
Received: from VE1PR08MB5583.eurprd08.prod.outlook.com
 ([fe80::742f:f82e:f58:2a5a]) by VE1PR08MB5583.eurprd08.prod.outlook.com
 ([fe80::742f:f82e:f58:2a5a%8]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 17:23:50 +0000
From: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
Subject: [meta-oe][PATCH 3/4] fbida: SRC_REV bump ac9005b..eb769e3
Date: Fri, 16 Sep 2022 19:23:31 +0200
Message-Id: <20220916172332.3096-3-Wolfgang.Meyer@gossenmetrawatt.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220916172332.3096-1-Wolfgang.Meyer@gossenmetrawatt.com>
References: <20220916172332.3096-1-Wolfgang.Meyer@gossenmetrawatt.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::20) To VE1PR08MB5583.eurprd08.prod.outlook.com
 (2603:10a6:800:1ac::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB5583:EE_|VE1PR08MB5725:EE_
X-MS-Office365-Filtering-Correlation-Id: dc52e9d1-684a-4625-60f9-08da98083868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u9ZuSVNICsR1By7JQTRkSZz8H27mU2phtTVHHXEsUq4o5pZhlfmLgNuTyJOShDbptOFWe10M9sU/zIiX7B9sANHq4kOosa6Svct6TV/vq4cninL3PWwPYwEBSQuEJVq2LuypmyAd9McJeQFTVmg7yRtpkHHQMV2d4fm7RIfzxL3o/PWGcuUfP8P5XRvhLWoB+liTPJ3XnOqTisp8uW7RRirGXNo2rHWMDS7BIQyIoAn7K5Mfzl826oiypWjhUr2kGPg5BMN60ROx9cTJuN/EPqNJ2eMOP3dZKJZUpmlTT4t8hRrRG0Qv3WSP0DXgPgt2FdW1fdkuSy71EEuH9W44N5km3lCAlfmqYsL+ikklv3rcjA/9l1ONA8Tkje17gIFlG6MzfkY64FxKlNHXizHqxhcnu6LvBD8p87hnyqsFw3YonWnvDitXbSPImFDLRkw6vaROsYPAwtuC5ub1w2VZBbjlflgDx5OQ44bC9cORzEY2uCBGcpd3pvXkBOAEWhppmaOJcfyTVRUAfIr4IALPBskaVB616hytbjhRfYelCpSfllApyZrXmXV3KcMUpwm1m41NhvGdr8IDWcFnSX/u6MKrxuKqDB8232OGmCjT/lIEd+Q0IQOIOjlFg1PyZb5r76+PmqgfI0o0S6sUAhV5qL5TYni9OPhQDN3u2EeayuXDKJIfgyZdAH+4RoWkez2zlwsxRFRZ5wo4V3J7xU2dUpRbc4Yv08cC2aQ1kVeEldHtiZt/g1Rpy4PShsuHIKSV3Qk5g9W3Nkwns5Sd7HxHPSTiy0vYc9Ga/EhoFFWYXBo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5583.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(346002)(136003)(39850400004)(396003)(451199015)(2906002)(5660300002)(8936002)(2616005)(6512007)(26005)(52116002)(6486002)(966005)(6666004)(41300700001)(478600001)(86362001)(38100700002)(316002)(186003)(107886003)(38350700002)(6506007)(66946007)(83380400001)(1076003)(66556008)(8676002)(66476007)(4326008)(6916009)(36756003)(101420200003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AIeOkOgwa6sd3mSE6Q8cFqUfh4Ht/g3KDxcvTR8I7ysT556TIv8PKUDrXSv1?=
 =?us-ascii?Q?xdkiwpD0umRGyQa63SE+BQCkjTSp0HMChWXQ2t0EIpos7+majdTm6bhxxQBp?=
 =?us-ascii?Q?FgSKjJt9lgA3May/IP+NU0ElqMVQeLKgLZGxPTTJUAMjoQd5fenNi/UNAD2f?=
 =?us-ascii?Q?ajM28aFxTer7aMojgCGbdmlgnTZP5x+Ohd1V+ZpHlvT3YZbbzyuEGS8bf8uI?=
 =?us-ascii?Q?pnwMdme6MXBDzgg2lWKKsW0UYAYRvsEpggPuc2U2oX+MsNOzbTg/h/zhoAw6?=
 =?us-ascii?Q?Y2pWa97JDXZgQxuhR2JoiK7Hlz59ESAHZKAYlSsp643lixzyr/O2HsW2STEr?=
 =?us-ascii?Q?ijo+yAjPqOys1V+8I/qJXHqvZHWZzRBAQfI9JwV7tpaLQm5W4tLBE2+JLGLB?=
 =?us-ascii?Q?YpVtmGYb2s+0qBKG3Yt0Mf1o8vLsg8arSxrcR/E1P+y6aI/q8oosdWcY/uq9?=
 =?us-ascii?Q?WNqVQdE7yNMARdGO+Muhc/MXKXMYQ+8UbvvkfIPWAfjDx2VR+e9I82OAMzCC?=
 =?us-ascii?Q?ShYifV567JVPV7OB43xl+296nbvI54PsO3N24hQqLEJp149461lfKqpUt1qP?=
 =?us-ascii?Q?gu0mBoXeK0Ce8bVkJNknPzg4yXxCbpHiV2KNc3fncvce++T4g5ukP1tvB/zo?=
 =?us-ascii?Q?Zw0qcapRWd8TUdaohKkKkxpX34hpSsi2Y3zLYP4GKP1Tv0qt5zZpN3wPLddj?=
 =?us-ascii?Q?r0XGPyFULe3nbOgrjdpdXA5wHAPUtIRwjsadSoHsp1h0V+b9Lbvi/lKCnJIW?=
 =?us-ascii?Q?7zZYOv3PXItd2Krxcrs3ZuildE6WWYwTdoL1U/X+jX/zKEVKsrMHlX7YLFjF?=
 =?us-ascii?Q?I984yYb/pBPEWGKHp3E3feZeiWxsHT925wQjA3C1TgmCTnsc9Ywtu4u423KA?=
 =?us-ascii?Q?dnWPpk1PTWp5gbzcms7fOYxVI2Zsiapxog6snaiogLoHXHS+oTRMZXfSBwz/?=
 =?us-ascii?Q?fE9Yacpg5Hyk+m4iP35GRD4GVNwY2EOBfcV1F2iG48z+or6u7C/YuVYgW8PH?=
 =?us-ascii?Q?0W8czER8UvaqaZOxVhcrHVKZRkqhATi4/CxBXppuqdGYc21yOs25Bcs34yhJ?=
 =?us-ascii?Q?4RjTkcBZw8bari7tgP/A9dbfVaOpf4SwUbYi46ccTtlB2sK4F5XOJh7Sa1Mb?=
 =?us-ascii?Q?gTy1i61vcx6z/EXmterT9wnRDSqFdq2iORFPjSwWzlK8gw2fRImMe0aih9KU?=
 =?us-ascii?Q?6c0gAIZGTBT7H6n6na+c0atvBAfXDOKCOQ4AhBjSYoaq2OlLhbpzunF1WKno?=
 =?us-ascii?Q?/P9up8zWhS+HhknpDa/mWfTcJJd5yY9iw2ADvTb/aC7gaVXXF/ZL7BUlxiQ3?=
 =?us-ascii?Q?cRNsQ8UmMlOchIAoRtShU4SQSw1EZd9JqK/KjmnOdAZfNJ24qxQyzScx4j05?=
 =?us-ascii?Q?lzx3DjxEt6lOEV2VtONBRQz9pTa13epy2JLUGOtbWQAoCfnxB/Xog3Xhs98i?=
 =?us-ascii?Q?sh2dN1RWdu577iOt46mvc9ylfL8QIWu4vdAELmpuctOU28kNFoMsvGYiLXyt?=
 =?us-ascii?Q?zShcb5V4VYcfsmyUSAiJfZw+obdK11gHNIS3g8DXw1k/qC9aMbTyF5f9PY+P?=
 =?us-ascii?Q?jnTlLeyW8lXysClfDjNbTiVJBQPmxd2GaMKdAvAV2JRH/bhV+l2AHwFvbh9d?=
 =?us-ascii?Q?eKdBzGY5xK8TCY4sWivWFyY=3D?=
X-OriginatorOrg: gossenmetrawatt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dc52e9d1-684a-4625-60f9-08da98083868
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB5583.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 17:23:50.0809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 927cd455-6160-4d75-86b6-a6892a3b5317
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 p7SPFNnnPQU1/8cYV3tzpMcyUxO3USyq8aJ5+HeQErFL9EEIfv2/0HyCeRSTd1ZxB3gp5KH4Gj5jkVJ+QOypVGZbHZ3W9ZzPNaCdBTux1x7RwVgCGPiPeeN9XPXmrlBB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5725
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Sep 2022 17:24:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98840

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

