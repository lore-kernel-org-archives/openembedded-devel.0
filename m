Return-Path: <wolfgang.meyer@gossenmetrawatt.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980F6ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 17:24:00 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [104.47.18.111])
 by mx.groups.io with SMTP id smtpd.web10.8986.1663349029868186444
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 10:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gossenmetrawatt.onmicrosoft.com
 header.s=selector1-gossenmetrawatt-onmicrosoft-com header.b=feMgFkf8;
 spf=pass (domain: gossenmetrawatt.com, ip: 104.47.18.111,
 mailfrom: wolfgang.meyer@gossenmetrawatt.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=faXJSn3W+wo+lgDx97dPGU8p8KowtPXA9JFyWbJgdysPC6W+8VK3kQwZgSSxpBrQIL22wYgesfZectTBva1WBhXX7mywemnXYJJiLaDazUlmIrA8B9enf8oYuMPOPiNLQPJr5YVf+4scoGC98NyjAFYCeNr5Aul3AXfyQGVg5TD7ydQP3DCntFt4xQzIBcnSs6C2G0U6MFJojxSHicAL23+Pu8sFISe2sa81l/DytT59tGPyD7BWlxplWsOePwoIRKPEiJUh+w/D+3yTdcwGyEKoj0L/F455uiEQJ2TpUFCFc7Svp1SqlbEzPU0v3BI7n102YrKw+vP0ya9JtOI9Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmmsnUPoTKhWWEVELGasfM7MKI4y0i1sktZ1PhTbC7o=;
 b=M4bdV9JodBDMVmlxLzc4aQwH2zF7eaivIwo64G199Xzj7zzLby4cc3VUhfyytgfhKcWdP45cFDeVJn9ilTXL5YkPVByiQGSewbqjrMSAkf1WH0D0qylA8BIAzC9RGQu0UIbD+Z45A1TKLeM3ER0K4fLrkC8gMj3+EmEFOLd8uOr9iIOGTPGJ6NIVUPhOmxdTomB6psKhF6j3wcnpebFvtXB6/DyqNE+6McChrz7e3OAJQVrB1YN4iaTv0mH3lw8GHuo5358ZB0NKmqtO00SC//YsEWee3UNbx/kVg/IkNutbYRsvpLxO750h4H7TyancAXgWPJjG7pZTD0Lyy0jY5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gossenmetrawatt.com; dmarc=pass action=none
 header.from=gossenmetrawatt.com; dkim=pass header.d=gossenmetrawatt.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gossenmetrawatt.onmicrosoft.com;
 s=selector1-gossenmetrawatt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmmsnUPoTKhWWEVELGasfM7MKI4y0i1sktZ1PhTbC7o=;
 b=feMgFkf8OJX5GCn1+SphM4F8Mi2Sl/bRpQTLToNkoLCaoOsux1nPCfXjM/4vH6hKZQr2UI0JtL8LPcrHszGTpEqD2nhSZMgdrf9N4xeCPtz8QkAmk1dqbBdwL4+O62HcqQXkjFWqXxe+DBVSvPpBkwMe46dgUI2ihpzmJb5+F+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gossenmetrawatt.com;
Received: from VE1PR08MB5583.eurprd08.prod.outlook.com (2603:10a6:800:1ac::24)
 by VE1PR08MB5725.eurprd08.prod.outlook.com (2603:10a6:800:1b0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 17:23:45 +0000
Received: from VE1PR08MB5583.eurprd08.prod.outlook.com
 ([fe80::742f:f82e:f58:2a5a]) by VE1PR08MB5583.eurprd08.prod.outlook.com
 ([fe80::742f:f82e:f58:2a5a%8]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 17:23:45 +0000
From: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
Subject: [meta-oe][PATCH 1/4] fbida: Switch to git fetcher
Date: Fri, 16 Sep 2022 19:23:29 +0200
Message-Id: <20220916172332.3096-1-Wolfgang.Meyer@gossenmetrawatt.com>
X-Mailer: git-send-email 2.37.3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::20) To VE1PR08MB5583.eurprd08.prod.outlook.com
 (2603:10a6:800:1ac::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB5583:EE_|VE1PR08MB5725:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dc6bc68-a2f0-4781-9350-08da98083587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JjtBRez6h8a29fANBepxwNG19wLCkgu6JHZ8+gEBsCfaF73QPaMAtb0KAV+Cx+8SyxZWGZK9DB/3POHcCciXSF0fW4zhrTcHOESLPd45U8jxPZ/Cvtt2BwiTvJhKxIdZyZw03re4amCJsVE+0WwjLujDvY/sSFriP8Edj9U9c1flU0+N8bBUtV8c8nHd/GZTqJsoJwIQHx6LuvYvGyxOXAqLfypmC/3/QMWqvg+JqivCyqy198Cxdzf2ZdWSZGrLckQHIivFGGFKraJZ7BaMpXStKtZYmy6IJOhJSTQDwdWfZF6FkkCaPgNWU8wOeGSHyzPOvlTTdrv9vjLWcXQa18ipbNbr+ZkDF1Jd0m+lKt4zWzL3HLWUqxDs3lRg6hz1Mc1oBQTpCUW5fw7YqvHabMCNW/sYQ16PE5MZg5qFyXKTDOsgccZPAmXDe/mxogoXwRj0Mw3v+PrDVYfZ3Xn6eWO0lUwr3t6EyMOj/dFllhZP9DVYLTdnDaRGaduDl5p25bJzpSkuR9ABPxFEalkzQ2bIwu66iP/odfM9nv1hpZ9DjzrdC02rL75LxxftgdZYkim7Qz3xpF3cEVZpNbH5gN2pU8E6q9ftlYbQMDUGKfTU2PtA9uJVcMaIYam8/XPtNbbvO+NhnfycZQ9L0vucnuSlgk32WWhcIFpLVVqjOUc1zljF3vSiquj0x5WvEUn0zL8W2KZ9/FuX8Ct0fzIpTw6hJCeCZVNY1HW7aYSJLXX6ddS7y55kmax5Ux3AdcO71fFjIYHvPRKkTZe0dHanM+PzC/oeIq7AtsgEJrzA9ZE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5583.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(346002)(136003)(39850400004)(396003)(451199015)(2906002)(5660300002)(8936002)(2616005)(6512007)(26005)(52116002)(6486002)(966005)(6666004)(41300700001)(478600001)(86362001)(38100700002)(316002)(186003)(107886003)(38350700002)(6506007)(66946007)(83380400001)(1076003)(66556008)(8676002)(66476007)(4326008)(6916009)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UhZzxCZjGh9IotTC7/BvrK6fwJnXY0isTFhVB7BkXOrfSBaBZPSX3RmcqGp1?=
 =?us-ascii?Q?YgubC68FpnadMq32PRRDQTjzOmX/bWwFf+bI4zMj4Lf8l1RNo/PMhI6GXpIl?=
 =?us-ascii?Q?WBRrGF0OpWBz6oLdK0t7MuPxmFwPGsSbhPsmi98pNlw6BTIFZFmt1+KlsfKS?=
 =?us-ascii?Q?WgiKQVbZ2klvgdt12LBXnr4NGMZ6Oceo2NxPaVoQx9rOLbMl9Ku68u2huWjo?=
 =?us-ascii?Q?wYG+pH7nFm64wpI4TRFWaZajMALD7bo+6TxXcwQOc0YkX/TmrwWD6ZBuQ6Em?=
 =?us-ascii?Q?w6zeNI40YuWqG1QFproGPjNOlIi83hx1Zk/GS2MJ6acyuI/q6X1+8ywFKLg1?=
 =?us-ascii?Q?PqE6T1WmdBsanmDhas8IV3TYatRyAsBnS+CbgIJRPn2Ba3VXSghMksvNvEhr?=
 =?us-ascii?Q?RHFzNa3oGOzRqZ6LDHN2L9whDKDHyvKbpsw1ckEzi36bQJ7QbviQWnRk5zW2?=
 =?us-ascii?Q?ZXJSyQ8g7mx0VdJN3K2D2cyOq5vad/G6rU+s6M2sjnvbF0IBDfOtHK7bME/W?=
 =?us-ascii?Q?DsttQnOMm91OtbPM1gwrqpTP9Z5MZ6EBMU1QZ92uhnGB9YnnlSeozk7hX6cf?=
 =?us-ascii?Q?3gUIDnvwvlijXLoq3mkJSbn84h3z/NnkVY7Bmx8MkaI3mzCmsd7e8dMTJ/9m?=
 =?us-ascii?Q?AcNV2rpN0caHG0jAtU+abuUqMe/eTN+82TzSdFLpjd93pmUBmNq5JrRs6zMa?=
 =?us-ascii?Q?ofWviMw2C0Pin/d3entZ7FSAUmfSWSy+pUus9+MVK20tn4teicGE+QfQ3Wda?=
 =?us-ascii?Q?w3BtN4G1eeHySaFDkwnR+fjQHLvpo9fAFRFJJIhOA50PIoK0qJnHvpUkawNg?=
 =?us-ascii?Q?dSs1SFjAxqdbS62UPEuYgJd0IW/7kTR+NIVLhppzAvpsSr6KJCJyJ8Z815s9?=
 =?us-ascii?Q?H5Zb/LK7nrvwijw9OPTfrpCf37V/Kt1bTcoS0UCcR7+HuTchQtVsK/SimwF/?=
 =?us-ascii?Q?+guNOOpLXLxwytpT1HQR1DOBF926Ac3EifkT1Bn+69JShiZgI8aiG00H35CW?=
 =?us-ascii?Q?iBVYWKCnrbSGRJd5r0xunNX2AnVFf/cdwaHqZmPCsttci64kBXx3o/r3uYdm?=
 =?us-ascii?Q?3Ma03TQb+sBz4hdhoFVPgHL5qe0vycCuUrwhd8aCvKX7E65tXE/ZbDYrja17?=
 =?us-ascii?Q?34u719AypyPwuSzv0B14JCbIG3VpuErGHG4oGU+AKmJuaNtBAA/MvDig90b5?=
 =?us-ascii?Q?aYOpO1xnfGpqvdTFsPvYPqtYzjDpT4sBQAWgfXxSPt+WNBNZZo/hE5d40ufD?=
 =?us-ascii?Q?wpZq7aY+Hze49UQTssArFqorIPpuE4tvXEq+n0FbbKVjg+eGPbi0mrJS5kVN?=
 =?us-ascii?Q?vzdIv1/2R/4yjmva4sLsuHDsFSi/STUE8BNg0di4NPV6SxvfFKJbmiQ1KXS4?=
 =?us-ascii?Q?v56yivNQyEexnbJTwFcVsV4t+T7a7boT4K2rqvcym0xw4czmySfbV1nKfAp6?=
 =?us-ascii?Q?oKfb3bWXRwOgUP9mtWeApPnLA3QtPxEw5P0/EzMWNlC2x+Q29nHYa9fkf1As?=
 =?us-ascii?Q?qJGSaTZqI0ZbKSvQWsjIeOGd3i2QEsJ7+Ctnky9b2Tbpic/vlr+2v0yLYcaQ?=
 =?us-ascii?Q?M5U8QBErwVBX5/LRPJhr9JmdV29O/PEOF1oe0A09g4gHD1pICxNRYbK1CoSB?=
 =?us-ascii?Q?t7TV9HAkdntEO2N9trvsn1w=3D?=
X-OriginatorOrg: gossenmetrawatt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6dc6bc68-a2f0-4781-9350-08da98083587
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB5583.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 17:23:45.2365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 927cd455-6160-4d75-86b6-a6892a3b5317
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wZ2fVwD282/GT7aDH7n6Jju7s3HedMpY5y2cVekC7Q5viT6+hMNJPDeafMCfbSzpPhkit6sQKzrPtapzPIyY2+4w39VKrEHxiaeFu2QMUO6EkS+5ReRgKGw8csUonC+e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5725
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Sep 2022 17:24:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98838

fbida has not seen any versioned releases for five years even though
has not stalled. Update to latest commit that builds with the legacy gnumak=
e
style build system ([2019-01-24] ac9005bf0).

Support for lirc, curl, sane, and cairo-gl has been dropped, the correspond=
ing
packageconfigs and dependencies were removed from the recipe. Dependencies =
to
libinput and udev have been added.

Signed-off-by: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
---
 .../fbida/{fbida_2.14.bb =3D> fbida_git.bb}     | 38 +++++++------------
 .../fbida/files/cairo-weak-detect.patch       | 17 ---------
 2 files changed, 14 insertions(+), 41 deletions(-)
 rename meta-oe/recipes-graphics/fbida/{fbida_2.14.bb =3D> fbida_git.bb} (6=
3%)
 delete mode 100644 meta-oe/recipes-graphics/fbida/files/cairo-weak-detect.=
patch

diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.14.bb b/meta-oe/recipes=
-graphics/fbida/fbida_git.bb
similarity index 63%
rename from meta-oe/recipes-graphics/fbida/fbida_2.14.bb
rename to meta-oe/recipes-graphics/fbida/fbida_git.bb
index 3d65399cd..aadaaf57e 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_2.14.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_git.bb
@@ -1,23 +1,25 @@
 SUMMARY =3D "Framebuffer image and doc viewer tools"
 DESCRIPTION =3D "The fbida project contains a few applications for viewing=
 and editing images, \
-               with the main focus being photos."
-HOMEPAGE =3D "http://linux.bytesex.org/fbida/"
+with the main focus being photos."
+HOMEPAGE =3D "https://www.kraxel.org/blog/linux/fbida/"
 AUTHOR =3D "Gerd Hoffmann"
 SECTION =3D "utils"

 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De8feb78a32950a909621bbb51f634b3=
9"

-DEPENDS =3D "virtual/libiconv jpeg fontconfig freetype libexif libdrm pixm=
an poppler libepoxy cairo"
+DEPENDS =3D "virtual/libiconv jpeg fontconfig freetype libexif libdrm pixm=
an udev libinput poppler libepoxy cairo"

-SRC_URI =3D "https://www.kraxel.org/releases/fbida/fbida-${PV}.tar.gz \
-          file://0001-Avoid-using-host-path.patch \
-          file://fix-preprocessor.patch \
-           file://support-jpeg-turbo.patch \
-           file://cairo-weak-detect.patch \
-           file://fbida-gcc10.patch \
-          "
-SRC_URI[sha256sum] =3D "95b7c01556cb6ef9819f358b314ddfeb8a4cbe862b521a3ed6=
2f03d163154438"
+PV =3D "2.14+git${SRCPV}"
+SRC_URI =3D "\
+        git://github.com/kraxel/fbida;protocol=3Dhttps;branch=3Dmaster    =
  \
+        file://0001-Avoid-using-host-path.patch                         \
+        file://fix-preprocessor.patch                                   \
+        file://support-jpeg-turbo.patch                                 \
+        file://fbida-gcc10.patch                                        \
+"
+SRCREV =3D "ac9005bf0bbf50f14dc1b368be5084c8e0510a5d"
+S =3D "${WORKDIR}/git"

 inherit pkgconfig features_check

@@ -26,18 +28,12 @@ REQUIRED_DISTRO_FEATURES =3D "opengl"

 EXTRA_OEMAKE =3D "STRIP=3D 'srcdir=3D${S}' -f ${S}/GNUmakefile"

-PACKAGECONFIG ??=3D "gif png curl"
-PACKAGECONFIG[curl] =3D ",,curl"
+PACKAGECONFIG ??=3D "gif png"
 PACKAGECONFIG[gif] =3D ",,giflib"
 PACKAGECONFIG[png] =3D ",,libpng"
 PACKAGECONFIG[tiff] =3D ",,tiff"
 PACKAGECONFIG[motif] =3D ",,libx11 libxext libxpm libxt openmotif"
 PACKAGECONFIG[webp] =3D ",,libwebp"
-PACKAGECONFIG[lirc] =3D ",,lirc"
-# This can only be enabled when cairo has egl enabled in its packageconfig=
 support too
-PACKAGECONFIG[egl] =3D ",,"
-
-EXTRA_OEMAKE +=3D ""${@bb.utils.contains('PACKAGECONFIG', 'egl', 'HAVE_CAI=
RO_GL=3Dyes', 'HAVE_CAIRO_GL=3Dno', d)}""

 CFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_=
X11=3D1', d)}"

@@ -48,9 +44,6 @@ do_compile() {

     # Be sure to respect preferences (force to "no")
     # Also avoid issues when ${BUILD_ARCH} =3D=3D ${HOST_ARCH}
-    if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'curl', d)}" ]; then
-        sed -i -e '/^HAVE_LIBCURL/s/:=3D.*$/:=3D no/' ${S}/GNUmakefile
-    fi
     if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'gif', d)}" ]; then
         sed -i -e '/^HAVE_LIBGIF/s/:=3D.*$/:=3D no/' ${S}/GNUmakefile
     fi
@@ -66,9 +59,6 @@ do_compile() {
     if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'webp', d)}" ]; then
         sed -i -e '/^HAVE_LIBWEBP/s/:=3D.*$/:=3D no/' ${S}/GNUmakefile
     fi
-    if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'lirc', d)}" ]; then
-        sed -i -e '/^HAVE_LIBLIRC/s/:=3D.*$/:=3D no/' ${S}/GNUmakefile
-    fi

     oe_runmake
 }
diff --git a/meta-oe/recipes-graphics/fbida/files/cairo-weak-detect.patch b=
/meta-oe/recipes-graphics/fbida/files/cairo-weak-detect.patch
deleted file mode 100644
index c7c579cc4..000000000
--- a/meta-oe/recipes-graphics/fbida/files/cairo-weak-detect.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-OE configures cairo to disable EGL support, however fbida expects cairo wi=
th egl support
-this patch therefore makes it possible to set HAVE_CAIRO_GL via recipe
-
-Upstream-Status: Inappropriate [OE-Specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/GNUmakefile
-+++ b/GNUmakefile
-@@ -67,7 +67,7 @@ define make-config
- LIB           :=3D $(LIB)
- RESDIR                :=3D $(call ac_resdir)
- HAVE_LINUX_FB_H       :=3D $(call ac_header,linux/fb.h)
--HAVE_CAIRO_GL :=3D $(call ac_pkg_config,cairo-gl)
-+HAVE_CAIRO_GL ?=3D $(call ac_pkg_config,cairo-gl)
- HAVE_LIBPCD   :=3D $(call ac_lib,pcd_open,pcd)
- HAVE_LIBGIF   :=3D $(call ac_lib,DGifOpenFileName,gif)
- HAVE_LIBWEBP  :=3D $(call ac_pkg_config,libwebp)
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

