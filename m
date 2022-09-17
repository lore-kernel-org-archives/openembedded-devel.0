Return-Path: <wolfgang.meyer@gossenmetrawatt.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BF0ECAAD3
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 08:45:28 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (EUR03-VE1-obe.outbound.protection.outlook.com [104.47.9.57])
 by mx.groups.io with SMTP id smtpd.web11.3925.1663404319185487221
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Sep 2022 01:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gossenmetrawatt.onmicrosoft.com
 header.s=selector1-gossenmetrawatt-onmicrosoft-com header.b=rIhkohZJ;
 spf=pass (domain: gossenmetrawatt.com, ip: 104.47.9.57,
 mailfrom: wolfgang.meyer@gossenmetrawatt.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YM+fcC6xw6sEDFC3Bi7pfiDa5qlNz7BXcE0IlAiw4g83HBE3IufFe8+lpJsBO0bfLAKz7C1pEHch0eNhOZ49j/3p8S7Ygw0M5E6ndhDzsuwm3aYeYuX1yqiPqDaEIXucsCcxlbdOfnYVs8q20lKi/H+3sIVtC7AjBjcCG6297iAToh8ZDgMxXCBTfyA3zsrMRspx6m+5/Ps2BksgMchJhTexk+tbVlLMFRD+3EzxBB4VOa2WVxTFHZTawU/mVtvoLSclu6Htf/LfFomzdFqdPc4atjBzVbk1LnPnIwyBe96XgfgKa7BgSPAJDGfjSqRaQVhF3KCo1932lwAjcRriTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6Jboz+QU7KrL9Smfy7nGthmckAw3/htxczM0dryVPw=;
 b=fI/GfxUp+hfTeEEm8mOTp7EnM3q73gTAbWUnvTWPRwxu7agkBLXodSULBfr6ZvdFby8HqnxbndOfJxyhbn+m41+BZ9gv00+Ny9eNT/kv8+G6Sq15UnYHWatmrXMCo3HbXc/pBydMjN1wQCue9rJzj/X2ZuBl04Mrfw7/+313UaKgvwDIePzNUuLyjHJSO11B8vtTv52hvWOYXWYGB6iqHepwMfLI9xyVU0rQPXU/vXFNEdeLSqB/MCohYH59cvOkOeUPG+g78zTZz/K8fdWLRDqQTQ1/EaxvmQbySg79dTE9YxpBi02HbP4vXL77X7wReGBdnRvP6gOZdnek8m7cpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gossenmetrawatt.com; dmarc=pass action=none
 header.from=gossenmetrawatt.com; dkim=pass header.d=gossenmetrawatt.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gossenmetrawatt.onmicrosoft.com;
 s=selector1-gossenmetrawatt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6Jboz+QU7KrL9Smfy7nGthmckAw3/htxczM0dryVPw=;
 b=rIhkohZJxQcf0xAsl/H4493323CSLA0yGWKBcjiIx3IheOVSF6KWb5WkfmKL+3XNGvNULT8k97538+3z0jcHUR0jVJ3Q/Uaz5Z9Uzyt3IJ6hEybpWjcJwJA2sWoRnuFGkhQZ21IoGj+3czhE2SEy/3EhbZdzSGkhZ6hfrb4caeU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gossenmetrawatt.com;
Received: from VE1PR08MB5583.eurprd08.prod.outlook.com (2603:10a6:800:1ac::24)
 by DU0PR08MB7461.eurprd08.prod.outlook.com (2603:10a6:10:354::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.17; Sat, 17 Sep
 2022 08:45:18 +0000
Received: from VE1PR08MB5583.eurprd08.prod.outlook.com
 ([fe80::742f:f82e:f58:2a5a]) by VE1PR08MB5583.eurprd08.prod.outlook.com
 ([fe80::742f:f82e:f58:2a5a%8]) with mapi id 15.20.5632.018; Sat, 17 Sep 2022
 08:45:18 +0000
From: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wolfgang Meyer <Wolfgang.Meyer@gossenmetrawatt.com>
Subject: [meta-oe][PATCH 2/4] fbida: build with meson
Date: Sat, 17 Sep 2022 10:44:57 +0200
Message-Id: <20220917084459.17933-2-Wolfgang.Meyer@gossenmetrawatt.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2fe6e098-7ac9-47a6-e5d3-08da9888f2f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lMJxeKHP6LaaT6AzLP69Y3OeLY+ue7dDNUQAh3xKeQ6Hc3kc79CT6HO8KuBRxiO86AaSAvlG4JnfrSRwYI8pPdon0lmlnjz/wA0EeNOCPaG5mklyUEOCkpfapkyyPo0Aj0Odoq3jet68hR6jW9jL6UC6DZSJUxZA1zxpuOClmkRLAYM4IlO7KFRjrmuZSkBQGeM9YKReaN4Vs9wnu7SHd/RsFcBMlmrpdIAuKv48bQnnXalCvU8mG2KCrb5n6Ci04hWenXjeL6+4vcu+1918BDvg+qVR723SLbHpc6F7Qk3MZjqdS5DtApOzUcdzwN921bpa1NIST6TP84eoUXqb6Y5TwmqWU/XrgZ5keYQGuWsdau5kH1m5qUr5woiD97GPU0AkZEv3mw/eYfdYsCGF0UPV7Rnli3CDfGtKkFw9Z5IThRAGwu0TOHJhqRcwhPhuGK+lcWNjA6TjW4+HE7KZHEV7tmfxLUA9vJ+Wua+PLCIuqpfM/qKNzkttrsLxspn28QgwE5JPTBaTrpdUdCy7BqNnOUrsxPexST4ZjaddSe4axfXkYhzoB2q+APAYfPFmzQXyph2IGelyqe0wxnOZCgNJtLeBOx7oxFTg+sVvUyNFEPnLcj/5UoMdqJprS7IahhyJ93BnCypVP/3RAXJtCx7JWVK9U6OJ7xFp+nt7F/nNoGOAgQRiyimV7aoJGTFYf9AdBd4B59n846nGfu0NSg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5583.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(346002)(376002)(396003)(39840400004)(451199015)(83380400001)(6666004)(107886003)(186003)(52116002)(1076003)(6506007)(2616005)(6512007)(26005)(84970400001)(41300700001)(2906002)(30864003)(5660300002)(6486002)(6916009)(966005)(66556008)(478600001)(66946007)(8936002)(4326008)(316002)(66476007)(8676002)(86362001)(36756003)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wpILYOTJTCSvsfiihtBl6U2iPdEONYHpTs78V3gd9tcojmfsGtmK2Vh6dWwa?=
 =?us-ascii?Q?IaVOm4Q1iqzTNSwMQr0CihQ4HQ9bSX9TczWTz1/cD43kszIC7HGTwFsv9rOx?=
 =?us-ascii?Q?iMfOAwihsGKcZudaiGd6oST0guKnJxrel3ctuhW3cUq8SlvVIOEE29LoqHIQ?=
 =?us-ascii?Q?iFEmfebE8BdT3v17AmAA+7zQC9ME4ahl29jYD/dtDfa5lgMkrAGMMPXsGBgT?=
 =?us-ascii?Q?DkHABFsA7CxrdWExxpdSSvSNZjEvI46JawWPMpoddknnDIV/BSqrQ7G+LU/B?=
 =?us-ascii?Q?+Vdq60FMXcnI88KllJ4rtFiltsAokUT2a7B8HPFLfle70xFW1UC3eFKQug1q?=
 =?us-ascii?Q?i6XmQ/ckMAG0/8k/u0uKC30IkUMWn8y6ljTIL6f2iHMFj7k6wer8yL2UAAnq?=
 =?us-ascii?Q?7JsBB4wWZNAjKGpFAZkhfBDIsag6resELYsUT8N8yh1h/9XZw5BkxpRSJOEC?=
 =?us-ascii?Q?iY3C3S/6bneeCON45xABOvAg74B7xMBF3FTaiJ9kn9uh6jvc5sUuoeiXuQ9u?=
 =?us-ascii?Q?3CmeBEUXG/jaB8458xwNIPCGZHWuo3gBedZYeDvGPYTW6lRsQUenPgl86TGN?=
 =?us-ascii?Q?CHyiw/ZSS7XA1MGXoiuT6Hc4EIFraEMI6Zv0DCMLM3wNBtoy+ZyWLzcRXCIS?=
 =?us-ascii?Q?ZMhm54H6PYKswuU6b76mOzHBAkFH5F7NrnFpwZYN+Yy3NpnQiuqZ9kzR/CGz?=
 =?us-ascii?Q?ZzbXRWvzS/ExXhjOjVtszGQe5N6E+lIEbQFtHwTWzIEA/tOyAVU9AssiPk6W?=
 =?us-ascii?Q?msasEvqilGMqHUyOB/K5oFkrxKY7rtlxkpKSdkSpIc2KWiA7sLnYKslTt/Ci?=
 =?us-ascii?Q?zw/cIowk3t155iwT1Agsi/j8ybNg+hrkudSF+uNoJdMtynC/rBpk526CxIz0?=
 =?us-ascii?Q?l9PWlvnld11WLzxB+R5R7+N+P/CdQTd3pwlVu0tbOqg8qRfekpNO0IWxLE/f?=
 =?us-ascii?Q?LQ1joW93Y5HfLPKi97xpIwg/hgdx1ccHWkV1yoCiUjgrrksnJK0W2WROgwm+?=
 =?us-ascii?Q?w/gTzQgcvtpXhhDnj1ZHQk0IU7oSKVTJ86XzmET65/ouyaAtD93Y0gE61Q3F?=
 =?us-ascii?Q?ErgOx8m9qp5mk1aSzyQegX+3xedeltwJX4S4QtQl8xMvPAxudocNUoL12Y1c?=
 =?us-ascii?Q?ttiD+mDMb0AQ0/9x5yQBqSQOkWxW7Iku0xCaDGSF7jWf/PKsf55y1DCvSsRH?=
 =?us-ascii?Q?qBnm3OQi+bhFjZKWG3QJ9Ti4Euj4Fy5/NzqOygd063/udt1IB8tqZGmJAmgi?=
 =?us-ascii?Q?eIQiGpSWwsVKSwnxP4nILZRnb37m01SxakZA48M3ojPrxJVhybdHdr/qYmzk?=
 =?us-ascii?Q?OXioqb9/Z7DEAddzfzL9omKOjqAPaSZnJSviPnxxXtpp4JxCDtxzD8EmHqZ7?=
 =?us-ascii?Q?RAUG+AHKhCLICOjNeDy3DMWo4/8Q/rKrG1L92/3JWTdfBrs917kq7oh8SvWu?=
 =?us-ascii?Q?cSK4VuNBSU44QTJtKzL3izmTsJfoAg+FmMZUtkt2JERbQ3QG2rvRx4wt60LB?=
 =?us-ascii?Q?TdG3HLfDnb6oAJjpLvNaPtu4Rgq0dM1ml6EuWjUYuH+OW2pHvkwgadAVdL4t?=
 =?us-ascii?Q?hBqQtr6voXx9DfM5v6M288yiEixLo+a/FN4hb/hp/W7uzPR9Zf2D8U97yYUM?=
 =?us-ascii?Q?f6/RYJ80/XscEXBcBFgBGUg=3D?=
X-OriginatorOrg: gossenmetrawatt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2fe6e098-7ac9-47a6-e5d3-08da9888f2f7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB5583.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2022 08:45:18.6746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 927cd455-6160-4d75-86b6-a6892a3b5317
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4Du8aOJw5pD7CMbmP3Ni0YX24CnRo1fExYTudwwNmAVmRm9iusXMzzmU65J7vVla9SfqkNDIgYi+5hzUxCJvfcnYlBB9AT9Gt15vL7B1xQT9e31QVaUpSujUmXZ5wqRW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7461
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Sep 2022 08:45:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98845

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

