Return-Path: <wolfgang.meyer@gossenmetrawatt.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90947C6FA86
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 08:45:38 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [104.47.9.57])
 by mx.groups.io with SMTP id smtpd.web11.3925.1663404319185487221
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Sep 2022 01:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gossenmetrawatt.onmicrosoft.com
 header.s=selector1-gossenmetrawatt-onmicrosoft-com header.b=YEMOlZDH;
 spf=pass (domain: gossenmetrawatt.com, ip: 104.47.9.57,
 mailfrom: wolfgang.meyer@gossenmetrawatt.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/nIwlET6QJy6JJ1I1rxKTJ6Xq9I1mqO5ROFLadN1aXIOCdgiI63GEsAwvtYGqU2ONBaoFrY0cxms/f1mR/SCyl54vXoP79VIDdzjB2HLRLmnGWkQJ+E9sjyvxWSWkvT0cqwsWl2iGrJtqUrePbJFbkFEFV10YfqB2ekvwTxEHL1fXnEJNZoLlYHY2qzycLhNquhkAVnPpuoFdGvdbdSPtjHmGAUyyn9q3tuftZvaoVBpuFgwpiiLP49OymlDnQ19jcJFs6vKsV0xUQrcaGmm8wxXOoAjQOuVb66vpOZRX/4qtnZ30Q6Az40UfxSsoDvyNrSWKNFmBphRkUc/srElQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmmsnUPoTKhWWEVELGasfM7MKI4y0i1sktZ1PhTbC7o=;
 b=XuBQOXU61FyGh6lJB64N/kMpwfLBb9jcyWeJJuoyo5ycWzMCDaaWO1UT/wWj017av/5abaQqQFnWuPxlnFfFfg5TIH5v79D67oY8tzA604KgHRzXe2CKa7P2GOIWHybCsYZH4NvAUAPPTyLHVxFDaDKHbR+fnQcSRsUPXw7ETZ1kQVmtML+/HbUKfV+C7BJ68ax8Taae45dDZJsF7OC75nZCupT4ktEcAUsmN4Ow0OPd864hWjggNSVZJNjUlVrUh1Us+CGYczmsc20VEO+CVWbU2jsv66ftrywuBJKBlsh4AMtJSBorRt2htt2dta1FEsIUw7C25YQ7aL71+H6d2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gossenmetrawatt.com; dmarc=pass action=none
 header.from=gossenmetrawatt.com; dkim=pass header.d=gossenmetrawatt.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gossenmetrawatt.onmicrosoft.com;
 s=selector1-gossenmetrawatt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmmsnUPoTKhWWEVELGasfM7MKI4y0i1sktZ1PhTbC7o=;
 b=YEMOlZDHoyYKnriQFMExjzCpXWXw2CZF7g9Wad4v3gx+6fUCTQ77s77Ssu0oscQVRrqvR22b0tbErn+zUzGqagJuGP96zbgyFLjN8K+rCn9IU/CAI1swLzbBGRuXGvnqnngoxiBFQOyhztIQx4PZBEf/71Ovn19vlHsWnnNEClc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gossenmetrawatt.com;
Received: from VE1PR08MB5583.eurprd08.prod.outlook.com (2603:10a6:800:1ac::24)
 by DU0PR08MB7461.eurprd08.prod.outlook.com (2603:10a6:10:354::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.17; Sat, 17 Sep
 2022 08:45:14 +0000
Received: from VE1PR08MB5583.eurprd08.prod.outlook.com
 ([fe80::742f:f82e:f58:2a5a]) by VE1PR08MB5583.eurprd08.prod.outlook.com
 ([fe80::742f:f82e:f58:2a5a%8]) with mapi id 15.20.5632.018; Sat, 17 Sep 2022
 08:45:14 +0000
From: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
Subject: [meta-oe][PATCH 1/4] fbida: Switch to git fetcher
Date: Sat, 17 Sep 2022 10:44:56 +0200
Message-Id: <20220917084459.17933-1-Wolfgang.Meyer@gossenmetrawatt.com>
X-Mailer: git-send-email 2.37.3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::16) To VE1PR08MB5583.eurprd08.prod.outlook.com
 (2603:10a6:800:1ac::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB5583:EE_|DU0PR08MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: a50db1c9-0b27-46ac-b9e3-08da9888f06c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zjnJvjfoBoRWg9wIbN2bp36Q9D7qI9nUIUHPMfTejM9yC5JX2z+aZj3/A/SsOSCd/6aKsz7vM3D8TtptV34cAXsKTIPe8nNAl8UvsTPVdTFrAEQfgDbpbjxWDObras/lI7mn8xdyXt2EKFBiTEYBQW595vxutJtmZdFl5P6wKQ1EeFMD79/ENOqT5bvM8enVOgdrNvGH3xhZ2M/1PhAdRu62qJV6ZADqaKK/GBY4bIHBOficaBPaRUNgrOPmtQocFU3lsOz/xsl58v3ztxFb1Kz1LOaIvsQX/acRVyq2xhCrM4WQiZYNlUCzmacCvOJxFYme4taila24N4Zuk93b14UYePsxoqX+IZ9X6TcrWKK1PErG3gSbDo+aVA9z+0iS3Xkewm/tEEcs/dJWsRfIPqKOMr8mRJF5JY14b4iTGGFgWdZnxsqI0Sgqn2p1vq3PM2qFc9E+lghFLs74vFenPOkIFCURKkOFYzEC6DKn0fOKSypodUwgG5xaNhtvVVAYgHWaRV4xDlhgykG6cRmF+bPmitF+g+vigYnA51RBngimuGP34SbDwGQklPKCA5GmvIcohBUeCorBtK7ts31EWepWW3g47DYymbVx/itB8IOJx4sdf9qMUnCNX6kImq2vLnONVg7IxC7Fh1bUzJmEn+UnTM8PKIrNu33JnG1mlE5/e+ImSn6uiYyRMYBlbb/sneifrXAUmMCkPF8KWSlelu23tVohYkcKl+nV+frCXK7ufMO6qs5+I8oQWCS9FFWhi103Alaq6ZabjuUequ74HPh5XphIqkNsmUr5zPS91xQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5583.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(346002)(376002)(396003)(39840400004)(451199015)(83380400001)(6666004)(107886003)(186003)(52116002)(1076003)(6506007)(2616005)(6512007)(26005)(41300700001)(2906002)(5660300002)(6486002)(6916009)(966005)(66556008)(478600001)(66946007)(8936002)(4326008)(316002)(66476007)(8676002)(86362001)(36756003)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?B9nbDCtnmWYrJLFy0R/rYmZwD14t0e+Q0KXL8sKR3BQfsPOF+Bj8gTQCjNmM?=
 =?us-ascii?Q?G65emwZfelpyeSsAfCmve4KCSjHn1USJwCf4CcuUUmhevNoqK5B+ZT6n/Hwi?=
 =?us-ascii?Q?J+uLHc+wSV4W1n8kYTMClDnil+vjtYPQCSfo58QphVf7MILTSstQsGh98ZgC?=
 =?us-ascii?Q?qxLbiWke2gCIuwcj6lmslw5mQlfRBzIXn9UlEq66i2nR3ccECn3EB9oR1Dbx?=
 =?us-ascii?Q?0KcDX6E3sYAwIY3XGLSv+6I2+dbVJi1m7SA0eFiSgDsIw6JRyl1LV2Yt9ZEu?=
 =?us-ascii?Q?z6XJVXUY5W0UsNrpHmQ/7voV2Wv1jbCkVWqrCOe24GESbAf1f7N00bj10Gcq?=
 =?us-ascii?Q?NWYJ6PdHQ6TkHFD9LtL3WI+7zILSv7/b6m7nyj9YyTP78iKjYiKDEIG/NKW0?=
 =?us-ascii?Q?+eCvOSQRcte2+VQq+W+dzlo6FvWglwrJuGZ8+uH9fKoRO3QcBcolG3sG9VgR?=
 =?us-ascii?Q?7pLb53Dn5w88SvKu/K3rpb9vaPj1ealeDbSkVpzWrFK+8iBjePYYUnuvZmTY?=
 =?us-ascii?Q?MY0O4SdLnudXY7Wkx4DB66Jn0UvhQhbxiI0HK6cwPMypKVKesm1X8fcYEE7f?=
 =?us-ascii?Q?TFM/7+knMd3ZrtgiOI0ILetXDiDWCcm6guWZG3cXmacYb5woLJm3J7U35Wxc?=
 =?us-ascii?Q?8o1WUN+qQaOZH0o4hajmPq6iUjHg9DcEAABYpjDUb0jSspWuvbjo/4cIqNfH?=
 =?us-ascii?Q?7I080lMnrpU9scoI8ioYXiVXDGDbqL7i/I9gqUAigA5sQTQlF+/Ad0vH9XCH?=
 =?us-ascii?Q?7G6X5XF5t+hCo8GGL2RLimEWHt8JjXom4mfKbmruY2om6i55bkpBRD47dlwc?=
 =?us-ascii?Q?IT9jtblohrz6ncMyloVo3uwyaRNbeoG64kC7AEkDBUwGtBAcPXXdELJVuULX?=
 =?us-ascii?Q?ju4Mvk9FXF6NBXUdWWkTWf6Q1sCzRU2i0i9gRXFOzumuAXqihrKtxHR3xJof?=
 =?us-ascii?Q?8BOghAvBfSqGyZFBVbwoesl4v7aA+eZU2Dab0liMenrK7VgUNGyZxAhzwflO?=
 =?us-ascii?Q?JhAjapP8NISrlJXJ0CVii0zB1AjqpHIt/mVu8PP+LCtEmLhIXVxSQpo/K9YX?=
 =?us-ascii?Q?m+cj6Mf3l8XjFJYRjT47s+9j5iw3yUQ2HgW/XHqIsAFdkUoSRnhn6nNoFjtP?=
 =?us-ascii?Q?jxgtvO9u5fP919YQhb/4JGRi2rn/dZMnLce+ERB4/uE8OTeX+BA+Gq3H+8EY?=
 =?us-ascii?Q?9gLPEpdszyDQeT+QNyPUSndwnAiTppNLSUoDCSeROIbmMkDgjMNbxtZQHj9A?=
 =?us-ascii?Q?/I4GOfgCtFDseZu4EqD3BJqzQrSBekCFDh1oob+XGxgS14rKe+5FZFDZ6G02?=
 =?us-ascii?Q?HE+wYpV4jZQTSaWYReCit3LDgKs/LyYCtrif0kEGTTPl4g1HiESVfKZxf447?=
 =?us-ascii?Q?L96Lu9pSUGj2RW6+PCGNBXBVq1UYJgpNHpf5vnBxTF56Vj2ziGHRskaXNDql?=
 =?us-ascii?Q?1f1RHiZErxYimLl0rPQ3tHhjYs6/Ozq6axaiwGRfl7POZUTYSrLJ9EwNXn0Y?=
 =?us-ascii?Q?FtOR7ScDO/GE0YwLWBE6xjLya9ckbu7mzleZ9nz6F/QpNkUWzucqRCQE0UF0?=
 =?us-ascii?Q?RrKVtP/DYDdfFuUNt3YUamkEOQKqRfBEwNe5T5KyfIh1jE/scnz2saqNndir?=
 =?us-ascii?Q?d+FfgMJ3vmc2F3c7GsdAxEY=3D?=
X-OriginatorOrg: gossenmetrawatt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a50db1c9-0b27-46ac-b9e3-08da9888f06c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB5583.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2022 08:45:14.4216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 927cd455-6160-4d75-86b6-a6892a3b5317
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SipElJ8gQ5OdCdPbYdJGBNGaY5NVrjrQ6jQRZlp0RCMHh8ITz9aCCuRruNGbu5RVPtdiqtX0Sj3Kmy+Wn0wKlLzEi0hDI3IvfyiwhAg5ulSLSpPuoG2MpwC88mgjFr3C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7461
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Sep 2022 08:45:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98844

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

