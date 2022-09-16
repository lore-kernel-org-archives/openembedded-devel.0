Return-Path: <wolfgang.meyer@gossenmetrawatt.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A00DC6FA82
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 17:24:00 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [104.47.18.109])
 by mx.groups.io with SMTP id smtpd.web10.8988.1663349035160712817
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 10:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gossenmetrawatt.onmicrosoft.com
 header.s=selector1-gossenmetrawatt-onmicrosoft-com header.b=QJDNkZq5;
 spf=pass (domain: gossenmetrawatt.com, ip: 104.47.18.109,
 mailfrom: wolfgang.meyer@gossenmetrawatt.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzhOfshS0Kn4M4Yt1qQL7mT8LjHB/Bq7fBuDxBZXbWpR7FQgIDPqYl7X0k24gef0v5X++8FHliJWN/LpAeTBw5qajq6KVlr9XssnAof3JhwtrlFX6ZbdMw9Az+wDpPjm+yKc6Mqk1Ay4/wctQPM03fSZ9pT7aQFcD1qd+d35Ng0svwpj3+RBzDBAS3vzus4wwKIXA2VNHfgUjdDR33N1ZCwaUa+AI3tGT1ozlIX/T6sVneEB97qu3x9oiNtja8a9Oi2eYOkLMR4qPfZZnpv60XT2e2toO9tCl4xOBu9sWR/o/ckxsVCCCkMA59gFcMPV9ahowh1ihpKAU8/p1Wd/pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqQMDpS7vdaMhSHrRZ+k1FvzmknYFKH0lipdSZOz2Pk=;
 b=ec/mK/15Yd9SAKLnbitjbBc/1ySzU7tVukT1Bxzz7ga3sFJnF9c9wB0UEJkpiZM7cf2N8yGtsi2OBZlLO+ffCsdPQGIMkyL3aplHTU8X0motbCGqtk2TUzmLumoGCcaiy8JRsTfSzPS8fUcBYZABoTxzxpFv8N9cNiUrEaQ4Q6odqdTa6LZx9aUvh0fTvCV4ZJNgZDdbxS5t0QbS9+nak0TrZFrRCWK2T5s5v3bX0ZrVbzmZCqntTUVdVmy5z20y+xEOo9rPvg467HBgcRMlb4gSdRyypd+PP4a0TdHBXxpwxntFJdWpzeBBJOXXyYWXI6up2myWJMpD1ra/0KP36g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gossenmetrawatt.com; dmarc=pass action=none
 header.from=gossenmetrawatt.com; dkim=pass header.d=gossenmetrawatt.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gossenmetrawatt.onmicrosoft.com;
 s=selector1-gossenmetrawatt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqQMDpS7vdaMhSHrRZ+k1FvzmknYFKH0lipdSZOz2Pk=;
 b=QJDNkZq5SU9kO8gc1ilwIVPJaFB9KxgmhHxh3jLR1upVRaoibca9zDCb1lcZtVKF2F/VlMOHaonBkWqZb1mFuJDiaQuXiWhVhPkdNZQYKQx5HfPAxtuTJpckA6WdQwsPvK38Q7mvXCPsyY2CZzY6wkln3KcyxLuCgmk55RtNJdQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gossenmetrawatt.com;
Received: from VE1PR08MB5583.eurprd08.prod.outlook.com (2603:10a6:800:1ac::24)
 by VE1PR08MB5725.eurprd08.prod.outlook.com (2603:10a6:800:1b0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 17:23:52 +0000
Received: from VE1PR08MB5583.eurprd08.prod.outlook.com
 ([fe80::742f:f82e:f58:2a5a]) by VE1PR08MB5583.eurprd08.prod.outlook.com
 ([fe80::742f:f82e:f58:2a5a%8]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 17:23:52 +0000
From: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
Subject: [meta-oe][PATCH 4/4] fbida: make fbpdf build optional
Date: Fri, 16 Sep 2022 19:23:32 +0200
Message-Id: <20220916172332.3096-4-Wolfgang.Meyer@gossenmetrawatt.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5b86a118-75ba-4677-6227-08da9808398b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KuAo0eefNocSOI1F8kAjXWvOhNJE4Y9jm9ZNnJwRMdwYfRXfajAQy1N3eIMSp4jUJfKgAE8i210wFSfluYNn0U2bS3kg/eOdgAOcO7O17nFUylQ3UDo8cJwlEA1kQTmP/jtFoPpiQmU88j7qYnuUR3J3BtEH6vKBqhgHcf/OYWHbdIaFNBPd+CEMs6+csM/TjIpah6clzrNrKIFkKXe3nmtxk5R0wV1MqHFqaHcFF28oGVwEVIKaSlcFUjYS8Uy36h6+oqLvVSCgGtKhauUaoV6Vjt/+lLiUV2tDGl9NUuw++A0R//iYf9GGVSCdpQD79bkwXfUlHarpn7SjZCBH6f0WndjJTFDYLriFTYURcNcMwJ7TFIPJLsFNiZPXz4RJdOcE+n6vkYJ/HpZTsvbfOWmqGJ2Tt4lSLI1/K2oSSEUjhJ0tpHixLr5yLSHYRaFJTttiQq5Q2PWCuQoanGJu1JmrKsh60GVy/fqvKbCLz81wNrfOm9qiYutAMM6vASi9af2OPpZn2stbu3znZ1q/7ZTz+Y9rfVpdxOVb+/I/IEaBy2AebM/o4wKbPqxhvzv/aKgcvaLhTJQ22LWFQn3QAFtVEIt+wj4FfnmC7AeD5HykqTNCuaDyqY6kJW9Bo/ioDNmUjASH0Q+gVPxmfM+tL2ir5j0xMcf3fdG8hzBKJj6XbDvSyJIohji1gaoJs5gs3HhBtD5OZjhi76g8U4TvFUe6/RM3fLsAjXNN3CC8b2XinKnvv4HRZExexTKkDFCS5Isb4tpMueIxPcN42eoe1Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5583.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(346002)(136003)(39850400004)(396003)(451199015)(2906002)(5660300002)(8936002)(2616005)(6512007)(26005)(52116002)(6486002)(966005)(6666004)(41300700001)(478600001)(86362001)(38100700002)(316002)(186003)(107886003)(38350700002)(6506007)(66946007)(83380400001)(1076003)(66556008)(8676002)(66476007)(4326008)(6916009)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?d4sSjcKCoWP8sNDQ8/7ce++CFJG+Tqnbthp3QMSYbDbiHPRAGUv6LesMMK6y?=
 =?us-ascii?Q?BcMOdCzOLEOg7FBbOWigx5kAsuQpMPtaMc7KD+iM0kUeJEalL21HAYDGG5nt?=
 =?us-ascii?Q?enRNeZx6VOecIVQ2J7AXJukIj5yeWm0YimCL6jZZOh/tdvgZemd+TuWD83ZD?=
 =?us-ascii?Q?RA8cuf223uEdDO9NI3+rFr/wFfUxVV+79dxBx1kR1WT9Wgrze6EmX8SlrmJR?=
 =?us-ascii?Q?8xX31Jf96gcHkO8D5YErt20zO8Se697vg0T3yNUyicf1ASU8jnVazdE06X6F?=
 =?us-ascii?Q?41yC30ZgMYR3/irarSFoFlBbyOWIenscP0FqlHArYiiSrceWPG5HGZIpVXxn?=
 =?us-ascii?Q?K63hcDrAtxeARwbrLq62pBilJyYDufwjKm5ZImudfVGfMnFksWGg/51sQsC8?=
 =?us-ascii?Q?g2EAAEn0J/8ezez5+mNSyoO97U9YIjLgHS4gj+eSIA/+hBfwZxG6+XzIlzlw?=
 =?us-ascii?Q?vTjvTa0g/qJyQq6cWE6rR4R0RujilCLsFywtI/9j/D7AQx1Y77rSIYlAhZBE?=
 =?us-ascii?Q?IrT65hoPD+SLXD5lkNILUgOLEJe299Do7/kZJhtbJ3YJlabdAHcNF3U6Mcpg?=
 =?us-ascii?Q?irmzShgGKRCem6rnlyvFvoU88jcYyci/erXSosKrqgDNz6qk/RPRU116Jn9L?=
 =?us-ascii?Q?iE3z3YxS+8a16PHD0r0nC+cI777oCDPxHxkX2Boq45bCT4pEccFFK2u35vVC?=
 =?us-ascii?Q?JlBanTR57m7Iw6FGBuTU3F7HbHwnHZrD3AZMb0cmBAkqKua7ZGdKm1FzlmDe?=
 =?us-ascii?Q?3lkx4wFkxCPgpS1iDkja0mV94yiYhbc4fWoFK5p4RMbVWDghkkYR9bWGrmcB?=
 =?us-ascii?Q?zFcLU5W+c9lywzaInkaQAj8HIe/czpdbks3woSaiqo0TpbIpcP+cz6dhDI5I?=
 =?us-ascii?Q?1ISjIHJdI0OAOH8u5Pt8RjUuDGLehWt+iKnyWUx0qkOh0UKi7N+7lU8qNs5w?=
 =?us-ascii?Q?fuS6qUM7ghxE6dtq7xFCBMo7s6Xyz+SLB5o4QwcNGhxG9GGbsOgDGyVKwoWb?=
 =?us-ascii?Q?HxuwR/pTekbzRDcCEVh4HgWlVkIG2UO93nP62+EXu1yjG7yh0CuKA7lvUyDc?=
 =?us-ascii?Q?Ih0CBkptakJl7EkZAn8ska5XZ4KSvEjf0J7w4AC1dQWmDB8C1DS5nmVNGh7H?=
 =?us-ascii?Q?CeoBSvYaBEAs7EwAhg5L8+ECX5eWpZ4ArLr9yqXnPL0Msx4ONFFVXH1AneVy?=
 =?us-ascii?Q?Bs4sPuXCKU6zbG1L6dYu7cxTf2z1AdjZBeyIPPkwFK3kaXHC6pwqEXasojN1?=
 =?us-ascii?Q?U8fsj0OMAySw/RBc7wgU97xzTEbJ9j0jcWAj8wQ4UC1qFa6o5z+CObLRinOS?=
 =?us-ascii?Q?OoNMixm5q3T6rnsC47FnuWWZH+vk9FSwF9MRt6VjjbVBqe54OWKuCWG4FjRB?=
 =?us-ascii?Q?M3n+KJ5fqyzmHvv24975zDbchnxnlK9dl9lxatZlxGgR5st7u5SLJI7W9OTJ?=
 =?us-ascii?Q?H9tpvB1iceA4Q74pfJC0V+DWROksIEP6A9NARW+klofIJNYda5gPHWDKyvcY?=
 =?us-ascii?Q?59O5OmJOi1liO+k5vN6cy4jwQG4ehTZyMJr8iA868jHC4V9Hv+4RNKhZvqKB?=
 =?us-ascii?Q?d5/URcALqK/9j43mGnAAJni5rSFEk4mmZS+0PJ/TLy/tMLH9Maez8LN9xaLZ?=
 =?us-ascii?Q?vXBcWyhGDjn5e9IL3RmuhBQ=3D?=
X-OriginatorOrg: gossenmetrawatt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5b86a118-75ba-4677-6227-08da9808398b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB5583.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 17:23:52.0036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 927cd455-6160-4d75-86b6-a6892a3b5317
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dPif7WIqovbiLV+vt3rU6+gc1bY0SATpqlIVyTofVAU3wTgg3mHE6gLBoBZwXF9hwM9FH1YFRY3uLht3Lr/6BKzs49VSIjZu2HShomIMy/IgqVY1P6qSinyeO/J5+5K9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5725
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Sep 2022 17:24:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98841

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

