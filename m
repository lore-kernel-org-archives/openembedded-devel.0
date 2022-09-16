Return-Path: <wolfgang.meyer@gossenmetrawatt.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E62C54EE9
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 17:24:00 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [104.47.18.111])
 by mx.groups.io with SMTP id smtpd.web10.8986.1663349029868186444
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 10:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gossenmetrawatt.onmicrosoft.com
 header.s=selector1-gossenmetrawatt-onmicrosoft-com header.b=odid+M93;
 spf=pass (domain: gossenmetrawatt.com, ip: 104.47.18.111,
 mailfrom: wolfgang.meyer@gossenmetrawatt.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJTw35ReUJdZGSTH8fIS3KrlN8R6QtUfBLjCOy7jiqZ9e0+QJz3UYnQuz0xe0F4Wch6hcT7PaeLc0YceZ7lVhfFfbbFHfx7xMHZYtm4wslphDuuIsiN4zXewJWad2mSxhhMwcm/RUByhj8m8OP/xTHKjQG6IXiTewZm/un0WKZC9xCjCNjLCdEVP9EcXdYmsPP/dXDM8yVD2R5FYpY4xwU+a5dDTs+nF6Gn1zwjSGAK5PTOHtdPcNxELTGyQRxjHfgXWstTR7WmcROQspljXIaeqlszF+GNSPAZlQhOhSYK3QKdlZvsKvHwZjdj5afrcc0TJqx7KBKUSQnDEGVX51g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6Jboz+QU7KrL9Smfy7nGthmckAw3/htxczM0dryVPw=;
 b=Q5qJEphv++MkTQ8Qe8PbyOPc22cOWsN/Rkx0WXg3GSjgOylTsUXuyZZrpEQ1eqc2zgcbZSquOnU+DLb4grYbn8hCHgd0IMKrwqjYFZOrRsDtsV9lr08IMnMkwR52z9tQgnRz/sCcIY1RxKxKeJquYD2xO8dDz6v0fNBNg+EU6x7XzUcMDtIsFh/tMTidnLNAElwTNAm8LKanlQ7Q4Td+MJ6GcO9d9s1QoO1o46PZXOokZB0Ir18KkjjDN3gAvBM9UPkzyUMFTrUolClBiUyzhY7IOd5tbToJuX4mAFEAHcLJD3+ljXPYtr8fuWAQLg1znhzsIwJbtKVJC+LNnnHIPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gossenmetrawatt.com; dmarc=pass action=none
 header.from=gossenmetrawatt.com; dkim=pass header.d=gossenmetrawatt.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gossenmetrawatt.onmicrosoft.com;
 s=selector1-gossenmetrawatt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6Jboz+QU7KrL9Smfy7nGthmckAw3/htxczM0dryVPw=;
 b=odid+M93No5A28isJg7UJ+CXMUpNQcDhFnPSc1OlOEtEP5cCCQ1TiXBwgoRKfrcNHbUeJB7FRdKNUi4YTMgDij0PSnoYPXRyvNYdF/nXssUHtG8T5PNarAFYGTlLJfJKjLbCl/3hE6sYl2aedATUhyOVhff+kWZMqAb9iinL1X4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gossenmetrawatt.com;
Received: from VE1PR08MB5583.eurprd08.prod.outlook.com (2603:10a6:800:1ac::24)
 by VE1PR08MB5725.eurprd08.prod.outlook.com (2603:10a6:800:1b0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 17:23:48 +0000
Received: from VE1PR08MB5583.eurprd08.prod.outlook.com
 ([fe80::742f:f82e:f58:2a5a]) by VE1PR08MB5583.eurprd08.prod.outlook.com
 ([fe80::742f:f82e:f58:2a5a%8]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 17:23:48 +0000
From: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
Subject: [meta-oe][PATCH 2/4] fbida: build with meson
Date: Fri, 16 Sep 2022 19:23:30 +0200
Message-Id: <20220916172332.3096-2-Wolfgang.Meyer@gossenmetrawatt.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1dd641e8-783a-48cf-96cc-08da9808377e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pRUBlOnwKqWTPkP9T5wsAE6tr1U90Mnp1WIix1UuB8aOvb8Vou862MPaa0K4Ncl7g0Wuppj1PbjmDljwNp04lvQnn9e9FANP/Dmc0LwlChoyfTxjwJkHRtDNY1yy+4o4+t+A/R5sIX3fY4bItozCCmT8qg9S84ZVq69Ah6wt0+JWOqjoAAf1Hwukf9wuUGMEAkrvNxZQgq71bEOGfW1bQgvkAP8QbP+FtANQ9jgTMjx5aKx975iNZrTaEdBqfjyESH7GfOQScmnEy3lzgOK10AtbRH6ilSjoq9G5E2U2TAC4lsk5H7Rujhj8fZDLw7gdqKObiU+bOxw+O8lg7/XI1FIkv+q0z2bke7JoG9ImugJJ9t+rfSHPKbsc/R5BEX5e5WBMTq2Qmri3ySPnwWwtcjBOmd9HFS4Edwb2iNZB0BVLmD3CGzGpuWTNveVusApA+4qMqA0TrfcpdPgHbgaRz1Qd+t7S1upuatA+MKWF4qiDVoFaKgjz/hDLOheHOKr+FZgffAznE8YX6KX4846KMGFZr3OCJg4YaescdqWI6WAlZVox/MiIsMVdetCeuuk3tH8Sug3Ml1P9++Ag6m50RKl/00Lk3Uw+bbS7E+t/Ov5HXlAvcNxJGxn09VGTuFAjYelkhZ7dzm3MagrSoBxJg1po79+vAqYqCSiS8l9z0kWowN7+29DAo9wWwUaY07DMQSUpXHrGxpIh6A+h/UA9Ow==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5583.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(346002)(136003)(39850400004)(396003)(451199015)(30864003)(2906002)(5660300002)(8936002)(2616005)(6512007)(26005)(52116002)(6486002)(966005)(6666004)(41300700001)(478600001)(86362001)(38100700002)(84970400001)(316002)(186003)(107886003)(38350700002)(6506007)(66946007)(83380400001)(1076003)(66556008)(8676002)(66476007)(4326008)(6916009)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RS/CFbYaGN4gQGy64SCAL6KHGad49CkmARHMUsVad42AZBZNf1MKq+V2xfID?=
 =?us-ascii?Q?AKPavzOnwPViblGcadg5ZgG97HlTvNaSye6Cw03x7/GsIumefNppJAji3zOC?=
 =?us-ascii?Q?Oe1X745DYe/eVX7eV0XjAyYDqQaSFZ0+CiETsRf/+mKdGDljV3kvqIEeNaYB?=
 =?us-ascii?Q?Ol367CnMZjywv2qc+F27bcrtautrBFYJO30R5/h4Zs5snw19ZkUwemFuBo23?=
 =?us-ascii?Q?60PR8NDgC9cxg73hS9aK9Q9em8/klWsRtep+F0yEl1i7PzVIytJavzxFXiru?=
 =?us-ascii?Q?4sRZSutVX035yKwjHyRmMsTbDaN0o7raBZce6vTiPL+hUeebtThwt4XUfp8b?=
 =?us-ascii?Q?6zKs9WuQhWETEQSSYl+SdROyEmNF7OLLHno/Tr5rE/V/jNW9H4bo0Agox3NM?=
 =?us-ascii?Q?5OetzKZvfh/TK7mHFHpefWuiwvfifDAr67wdqTjhuRgEbZSnqIonfu4USrTW?=
 =?us-ascii?Q?Ci7wOIIvyTKWtFRWGNjA2wC4Fc9cOcehmaqKFhBGPOK6kpVOBhVPCv8HfkqY?=
 =?us-ascii?Q?srIuonElDAv4aTKFyG1w+aDAY6NMVCH1SuTHMMWooKM8i9GoxFA9TLMlWtAT?=
 =?us-ascii?Q?csONQAwuO/J8UAC1Io53wD/v72UQ/e8xQnMn85zeuP8kMm5Jl/SBuTILlUJ3?=
 =?us-ascii?Q?e6Xihz1G5oVWSSzc9CbAx2qonLQ1js4/MHx4Q7wzoR2NhC+9Hsf18EYnFVwn?=
 =?us-ascii?Q?sB3AMs7BEifGLNfzRPLki5/WziSDlji2x3PUNCHrt26zJ1FLmzwNvi4xKJ3A?=
 =?us-ascii?Q?83wlcP1XNZpauBB8tgx3DxindgfTRY5oSZpa7spEIeFshcvWp/nXXhyJg7Tb?=
 =?us-ascii?Q?++byKKwmWoi41xhQ1fqcQU7PQYSe+XmMm2kX0G9tOKxEGL0lc7m5P2Q6LyWy?=
 =?us-ascii?Q?vbyzMcZjxBh3ve1lOs4REz8JJqYBGtJV+cA93sGM6rjgNXRwM4aWvRAWMKUz?=
 =?us-ascii?Q?Ye/LoPX9U0PM/rgLMPsOiE6KHdaR7grDt66NWTa5/6iM/ff7KeCWRedg7IR6?=
 =?us-ascii?Q?xoTeH76ufT8Cido5RZH8ViBVqNOlDQFEizgXYPFaU/Q5kUDYu7AJOlu28GUK?=
 =?us-ascii?Q?2ZX+S8CrJwbArC1ERpeM/7E81XcR3iGKiz3Rm0ZKCk27UIRFoOxCNyQ5uLhv?=
 =?us-ascii?Q?Ou46kSW53xN7gCp1s5cdK4NBrOR7TsLPpHYm/ASFMyTBIwIk/1AOvTagrjNW?=
 =?us-ascii?Q?DRn6HWtGaf19gng24kcriQBELUTmNCgAD5NRGHEjnE+W/3QiyADQVJl5y5Id?=
 =?us-ascii?Q?Hh/S1xvkNdriF1wGAElIqraJY6+y9ihxIv2nPwaZU/WCRNSHslJ2zp6OHTs9?=
 =?us-ascii?Q?FrfLX7UktUsXa3wzep0nIlOJKHWmk6HPKBloXGg/p5ZH79tEIBvlrBSDGHEb?=
 =?us-ascii?Q?pbqBd+etkN63WTAYT5WfP5SjTBLrzbt10z8riBmflScL+5yabTpnSe18OpWA?=
 =?us-ascii?Q?DYGySUHbuYaAVV6nGu2Lih6nHZ4rLmuRqwO7JCCdZzObjqzn/UY+UAmXzKzg?=
 =?us-ascii?Q?dqVarYYgn0u33V/wtN7ZjaPyLnxmawnPzCRMQXusALhzNs7WLsbhMERxwBw9?=
 =?us-ascii?Q?BDsyx4fbUr11to7/KmImNevmqoEPvry1KNlBDzgKYnZsMHm/zp9uwzZVOuEV?=
 =?us-ascii?Q?x/02/71T+ZDfJuMfcsPl5gU=3D?=
X-OriginatorOrg: gossenmetrawatt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1dd641e8-783a-48cf-96cc-08da9808377e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB5583.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 17:23:48.5487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 927cd455-6160-4d75-86b6-a6892a3b5317
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HxSTHFRwkcixA8a9rWVWgg0gYbScFmxtWGZ9cIp60sL4hwG32qAdwgvbTAYNXC/BvPov4RzZwOtQUBqIg6mh4hWBJwhUIZl/zAxzf/qbk+y9K6e8lROwztIwm7Bg22Y1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5725
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Sep 2022 17:24:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98839

Add meason features options for the PACKAGECONFIG choices. Remove patches t=
hat
target the Autotools/gnumake style build.

Signed-off-by: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
---
 meta-oe/recipes-graphics/fbida/fbida_git.bb   |  55 ++------
 .../files/0001-Avoid-using-host-path.patch    |  34 -----
 ...eson.build-install-fbgs-shell-script.patch |  26 ++++
 ...features-options-for-png-gif-tiff-we.patch | 123 ++++++++++++++++++
 .../fbida/files/use-jpeg-turbo.patch          |  13 --
 5 files changed, 161 insertions(+), 90 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/fbida/files/0001-Avoid-using-h=
ost-path.patch
 create mode 100644 meta-oe/recipes-graphics/fbida/files/0001-meson.build-i=
nstall-fbgs-shell-script.patch
 create mode 100644 meta-oe/recipes-graphics/fbida/files/0002-meson.build-a=
dd-features-options-for-png-gif-tiff-we.patch
 delete mode 100644 meta-oe/recipes-graphics/fbida/files/use-jpeg-turbo.pat=
ch

diff --git a/meta-oe/recipes-graphics/fbida/fbida_git.bb b/meta-oe/recipes-=
graphics/fbida/fbida_git.bb
index aadaaf57e..ab3c7d361 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_git.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_git.bb
@@ -12,59 +12,28 @@ DEPENDS =3D "virtual/libiconv jpeg fontconfig freetype =
libexif libdrm pixman udev

 PV =3D "2.14+git${SRCPV}"
 SRC_URI =3D "\
-        git://github.com/kraxel/fbida;protocol=3Dhttps;branch=3Dmaster    =
  \
-        file://0001-Avoid-using-host-path.patch                         \
-        file://fix-preprocessor.patch                                   \
-        file://support-jpeg-turbo.patch                                 \
-        file://fbida-gcc10.patch                                        \
+    git://github.com/kraxel/fbida;protocol=3Dhttps;branch=3Dmaster        =
      \
+    file://fix-preprocessor.patch                                         =
  \
+    file://support-jpeg-turbo.patch                                       =
  \
+    file://fbida-gcc10.patch                                              =
  \
+    file://0001-meson.build-install-fbgs-shell-script.patch               =
  \
+    file://0002-meson.build-add-features-options-for-png-gif-tiff-we.patch=
  \
 "
 SRCREV =3D "ac9005bf0bbf50f14dc1b368be5084c8e0510a5d"
 S =3D "${WORKDIR}/git"

-inherit pkgconfig features_check
+inherit meson pkgconfig features_check

 # Depends on libepoxy
 REQUIRED_DISTRO_FEATURES =3D "opengl"

-EXTRA_OEMAKE =3D "STRIP=3D 'srcdir=3D${S}' -f ${S}/GNUmakefile"
-
 PACKAGECONFIG ??=3D "gif png"
-PACKAGECONFIG[gif] =3D ",,giflib"
-PACKAGECONFIG[png] =3D ",,libpng"
-PACKAGECONFIG[tiff] =3D ",,tiff"
-PACKAGECONFIG[motif] =3D ",,libx11 libxext libxpm libxt openmotif"
-PACKAGECONFIG[webp] =3D ",,libwebp"
+PACKAGECONFIG[gif] =3D "-Dgif=3Denabled,-Dgif=3Ddisabled,giflib"
+PACKAGECONFIG[png] =3D "-Dpng=3Denabled,-Dpng=3Ddisabled,libpng"
+PACKAGECONFIG[tiff] =3D "-Dtiff=3Denabled,-Dtiff=3Ddisabled,tiff"
+PACKAGECONFIG[motif] =3D "-Dmotif=3Denabled,-Dmotif=3Ddisabled,libx11 libx=
ext libxpm libxt openmotif"
+PACKAGECONFIG[webp] =3D "-Dwebp=3Denabled,-Dwebp=3Ddisabled,libwebp"

 CFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_=
X11=3D1', d)}"

-do_compile() {
-    sed -i -e 's# fbgs# \$(srcdir)/fbgs#; s#-Ijpeg#-I\$(srcdir)/jpeg#; s# =
jpeg/# \$(srcdir)/jpeg/#' ${S}/GNUmakefile
-    sed -i -e 's:/sbin/ldconfig:echo x:' ${S}/mk/Autoconf.mk
-    sed -i -e 's: cpp: ${CPP}:' ${S}/GNUmakefile
-
-    # Be sure to respect preferences (force to "no")
-    # Also avoid issues when ${BUILD_ARCH} =3D=3D ${HOST_ARCH}
-    if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'gif', d)}" ]; then
-        sed -i -e '/^HAVE_LIBGIF/s/:=3D.*$/:=3D no/' ${S}/GNUmakefile
-    fi
-    if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'png', d)}" ]; then
-        sed -i -e '/^HAVE_LIBPNG/s/:=3D.*$/:=3D no/' ${S}/GNUmakefile
-    fi
-    if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'tiff', d)}" ]; then
-        sed -i -e '/^HAVE_LIBTIFF/s/:=3D.*$/:=3D no/' ${S}/GNUmakefile
-    fi
-    if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'motif', d)}" ]; then
-        sed -i -e '/^HAVE_MOTIF/s/:=3D.*$/:=3D no/' ${S}/GNUmakefile
-    fi
-    if [ -z "${@bb.utils.filter('PACKAGECONFIG', 'webp', d)}" ]; then
-        sed -i -e '/^HAVE_LIBWEBP/s/:=3D.*$/:=3D no/' ${S}/GNUmakefile
-    fi
-
-    oe_runmake
-}
-
-do_install() {
-    oe_runmake 'DESTDIR=3D${D}' install
-}
-
 RDEPENDS:${PN} =3D "ttf-dejavu-sans-mono"
diff --git a/meta-oe/recipes-graphics/fbida/files/0001-Avoid-using-host-pat=
h.patch b/meta-oe/recipes-graphics/fbida/files/0001-Avoid-using-host-path.p=
atch
deleted file mode 100644
index cdf2c25d3..000000000
--- a/meta-oe/recipes-graphics/fbida/files/0001-Avoid-using-host-path.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 8d8fa9f22d9f6a95523bac63ac3af724faf5ff92 Mon Sep 17 00:00:00 2001
-From: Marek Vasut <marex@denx.de>
-Date: Fri, 7 Apr 2017 23:26:09 +0200
-Subject: [PATCH] Avoid using host-path
-
-Remove the explicit reference to /usr/local/* , this is completely
-bogus and causes trouble during cross-compilation.
-
-Signed-off-by: Marek Vasut <marex@denx.de>
-Upstream-Status: Inappropriate [upstream requires this]
----
- mk/Variables.mk | 6 ------
- 1 file changed, 6 deletions(-)
-
-diff --git a/mk/Variables.mk b/mk/Variables.mk
-index 99f787c..3ffd87a 100644
---- a/mk/Variables.mk
-+++ b/mk/Variables.mk
-@@ -42,12 +42,6 @@ CFLAGS              +=3D -Wall -Wmissing-prototypes -Ws=
trict-prototypes \
-                  -Wpointer-arith -Wunused
- CXXFLAGS      +=3D -Wall -Wpointer-arith -Wunused
-
--# add /usr/local to the search path if something is in there ...
--ifneq ($(wildcard /usr/local/include/*.h),)
--  CFLAGS  +=3D -I/usr/local/include
--  LDFLAGS +=3D -L/usr/local/$(LIB)
--endif
--
- # fixup include path for $(srcdir) !=3D "."
- ifneq ($(srcdir),.)
-   CFLAGS  +=3D -I. -I$(srcdir)
---
-2.11.0
-
diff --git a/meta-oe/recipes-graphics/fbida/files/0001-meson.build-install-=
fbgs-shell-script.patch b/meta-oe/recipes-graphics/fbida/files/0001-meson.b=
uild-install-fbgs-shell-script.patch
new file mode 100644
index 000000000..06ec5dfd8
--- /dev/null
+++ b/meta-oe/recipes-graphics/fbida/files/0001-meson.build-install-fbgs-sh=
ell-script.patch
@@ -0,0 +1,26 @@
+From f9c455e81ad4d870c8ae20b9af8598139231ad26 Mon Sep 17 00:00:00 2001
+From: "Meyer, Wolfgang" <Wolfgang.Meyer@gossenmetrawatt.com>
+Date: Fri, 9 Sep 2022 09:32:22 +0200
+Subject: [PATCH] meson.build: install fbgs shell script
+
+---
+ meson.build | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index cbed982..2129896 100644
+--- a/meson.build
++++ b/meson.build
+@@ -124,6 +124,9 @@ executable('fbpdf',
+            sources             : fbpdf_srcs,
+            dependencies        : fbpdf_deps,
+            install             : true)
++install_data('fbgs',
++             install_dir        : get_option('bindir'),
++             install_mode       : 'rwxr--r--')
+
+ # build kbdtest
+ executable('kbdtest',
+--
+2.37.3
+
diff --git a/meta-oe/recipes-graphics/fbida/files/0002-meson.build-add-feat=
ures-options-for-png-gif-tiff-we.patch b/meta-oe/recipes-graphics/fbida/fil=
es/0002-meson.build-add-features-options-for-png-gif-tiff-we.patch
new file mode 100644
index 000000000..cf89da926
--- /dev/null
+++ b/meta-oe/recipes-graphics/fbida/files/0002-meson.build-add-features-op=
tions-for-png-gif-tiff-we.patch
@@ -0,0 +1,123 @@
+From fa60c06cadd6acd8abede91e75254e7250a087a3 Mon Sep 17 00:00:00 2001
+From: "Meyer, Wolfgang" <Wolfgang.Meyer@gossenmetrawatt.com>
+Date: Fri, 16 Sep 2022 13:40:25 +0200
+Subject: [PATCH] meson.build: add features options for png, gif, tiff, web=
,
+ and motif
+
+---
+ meson.build       | 41 +++++++++++++++++++++++++++--------------
+ meson_options.txt |  5 +++++
+ selections.c      |  4 ++++
+ 3 files changed, 36 insertions(+), 14 deletions(-)
+ create mode 100644 meson_options.txt
+
+diff --git a/meson.build b/meson.build
+index cbed982..e66ee48 100644
+--- a/meson.build
++++ b/meson.build
+@@ -21,9 +21,9 @@ drm_dep      =3D dependency('libdrm')
+ gbm_dep      =3D dependency('gbm')
+ epoxy_dep    =3D dependency('epoxy')
+ exif_dep     =3D dependency('libexif')
+-png_dep      =3D dependency('libpng')
+-tiff_dep     =3D dependency('libtiff-4')
+-webp_dep     =3D dependency('libwebp', required : false)
++png_dep      =3D dependency('libpng', required: get_option('png'))
++tiff_dep     =3D dependency('libtiff-4', required: get_option('tiff'))
++webp_dep     =3D dependency('libwebp', required : get_option('webp'))
+ udev_dep     =3D dependency('libudev')
+ input_dep    =3D dependency('libinput')
+
+@@ -32,20 +32,20 @@ cc           =3D meson.get_compiler('c')
+ jpeg_dep     =3D cc.find_library('jpeg')
+ math_dep     =3D cc.find_library('m', required : false)
+ pcd_dep      =3D cc.find_library('pcd', required : false)
+-gif_dep      =3D cc.find_library('gif', required : false)
++gif_dep      =3D cc.find_library('gif', required: get_option('gif'))
+
+ # motif + x11 libs
+-motif_dep    =3D cc.find_library('Xm', required : false)
+-xpm_dep      =3D cc.find_library('Xpm', required : false)
+-xt_dep       =3D cc.find_library('Xt', required : false)
+-xext_dep     =3D cc.find_library('Xext', required : false)
+-x11_dep      =3D cc.find_library('X11', required : false)
++motif_dep    =3D cc.find_library('Xm', required : get_option('motif'))
++xpm_dep      =3D cc.find_library('Xpm', required : get_option('motif'))
++xt_dep       =3D cc.find_library('Xt', required : get_option('motif'))
++xext_dep     =3D cc.find_library('Xext', required : get_option('motif'))
++x11_dep      =3D cc.find_library('X11', required : get_option('motif'))
+
+ # image formats
+ read_srcs    =3D [ 'readers.c', 'rd/read-ppm.c', 'rd/read-bmp.c',
+-                 'rd/read-jpeg.c', 'rd/read-png.c', 'rd/read-tiff.c' ]
++                 'rd/read-jpeg.c' ]
+ write_srcs   =3D [ 'writers.c', 'wr/write-ppm.c', 'wr/write-ps.c',
+-                 'wr/write-jpeg.c', 'wr/write-png.c', 'wr/write-tiff.c' ]
++                 'wr/write-jpeg.c' ]
+ image_deps   =3D [ jpeg_dep, png_dep, tiff_dep,
+                  pcd_dep, gif_dep, webp_dep ]
+
+@@ -53,11 +53,21 @@ if pcd_dep.found()
+     read_srcs +=3D 'rd/read-pcd.c'
+     config.set('HAVE_LIBPCD', true)
+ endif
+-if gif_dep.found()
++if get_option('png').enabled()
++    read_srcs +=3D 'rd/read-png.c'
++    write_srcs +=3D 'wr/write-png.c'
++    config.set('HAVE_LIBPNG', true)
++endif
++if get_option('tiff').enabled()
++    read_srcs +=3D 'rd/read-tiff.c'
++    write_srcs +=3D 'wr/write-tiff.c'
++    config.set('HAVE_LIBTIFF', true)
++endif
++if get_option('gif').enabled()
+     read_srcs +=3D 'rd/read-gif.c'
+     config.set('HAVE_LIBGIF', true)
+ endif
+-if webp_dep.found()
++if get_option('webp').enabled()
+     read_srcs +=3D 'rd/read-webp.c'
+     config.set('HAVE_LIBWEBP', true)
+ endif
+@@ -153,7 +166,7 @@ ida_srcs     =3D [ 'ida.c', 'man.c', 'hex.c', 'x11.c',=
 'viewer.c',
+ ida_deps     =3D [ pixman_dep, exif_dep, image_deps, math_dep,
+                  motif_dep, xpm_dep, xt_dep, xext_dep, x11_dep ]
+
+-if motif_dep.found()
++if get_option('motif').enabled()
+     executable('ida',
+                sources             : ida_srcs,
+                dependencies        : ida_deps,
+diff --git a/meson_options.txt b/meson_options.txt
+new file mode 100644
+index 0000000..ce37188
+--- /dev/null
++++ b/meson_options.txt
+@@ -0,0 +1,5 @@
++option('gif', type: 'feature', value : 'enabled')
++option('png', type: 'feature', value : 'enabled')
++option('tiff', type: 'feature', value : 'enabled')
++option('webp', type: 'feature', value : 'disabled')
++option('motif', type: 'feature', value : 'disabled')
+diff --git a/selections.c b/selections.c
+index 7b16264..ccdc686 100644
+--- a/selections.c
++++ b/selections.c
+@@ -609,8 +609,12 @@ void ipc_init()
+ #ifdef HAVE_LIBGIF
+     targets[ntargets++] =3D MIME_IMAGE_GIF;
+ #endif
++#ifdef HAVE_LIBPNG
+     targets[ntargets++] =3D MIME_IMAGE_PNG;
++#endif
++#ifdef HAVE_LIBTIFF
+     targets[ntargets++] =3D MIME_IMAGE_TIFF;
++#endif
+     targets[ntargets++] =3D XA_PIXMAP;
+     targets[ntargets++] =3D XA_STRING;
+
+--
+2.37.3
+
diff --git a/meta-oe/recipes-graphics/fbida/files/use-jpeg-turbo.patch b/me=
ta-oe/recipes-graphics/fbida/files/use-jpeg-turbo.patch
deleted file mode 100644
index 99639554c..000000000
--- a/meta-oe/recipes-graphics/fbida/files/use-jpeg-turbo.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: fbida-2.10/GNUmakefile
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- fbida-2.10.orig/GNUmakefile
-+++ fbida-2.10/GNUmakefile
-@@ -51,7 +51,7 @@ HAVE_LIBSANE :=3D $(call ac_lib,sane_init,
- HAVE_LIBCURL  :=3D $(call ac_lib,curl_easy_init,curl)
- HAVE_LIBLIRC  :=3D $(call ac_lib,lirc_init,lirc_client)
- HAVE_MOTIF    :=3D $(call ac_lib,XmStringGenerate,Xm,-L/usr/X11R6/$(LIB) =
-lXpm -lXt -lXext -lX11)
--JPEG_VER        :=3D $(call ac_jpeg_ver)
-+JPEG_VER        :=3D 62
- endef
-
- # transposing
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

