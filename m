Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 645FEC7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 12:46:42 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.31212.1683636392620171232
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 05:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout03.t-online.de (Postfix) with SMTP id 61A082246D
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 May 2023 14:46:30 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.32.109]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pwMjd-0P8K9q0; Tue, 9 May 2023 14:46:29 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 2/2] imaagemagick: update 7.1.1-5 -> 7.1.1-8
Date: Tue,  9 May 2023 14:46:12 +0200
Message-Id: <20230509124612.37627-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509124612.37627-1-f_l_k@t-online.de>
References: <20230509124612.37627-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683636389-42FF7266-743E8604/0/0 CLEAN NORMAL
X-TOI-MSGID: 07f399e4-d585-445d-8ffd-6e1722cd39eb
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 12:46:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102506

- add PACKAGECONFIG for xml
- add configuration
- workaround reproducibility issues

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../imagemagick/imagemagick_7.1.1.bb          | 23 ++++++++++++-------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/m=
eta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 07434c0564..e59b511a72 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -10,23 +10,19 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dac58ac14f9=
d9d02cafd2d81ef38fb2cc \
 DEPENDS =3D "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
=20
 BASE_PV :=3D "${PV}"
-PV .=3D "-5"
+PV .=3D "-8"
 SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git;branch=3Dmain;=
protocol=3Dhttps \
            file://0001-m4-Use-autconf-provided-AC_FUNC_FSEEKO.patch"
-SRCREV =3D "2d24be538f286962c355cf422bb525375ac77998"
+SRCREV =3D "920f79206ff59f30a4cff22c9c9c393508b82663"
=20
 S =3D "${WORKDIR}/git"
=20
 inherit autotools pkgconfig update-alternatives
 export ac_cv_sys_file_offset_bits=3D"64"
=20
-# xml disabled because it's using xml2-config --prefix to determine pref=
ix which returns just /usr with our libxml2
-# if someone needs xml support then fix it first
-EXTRA_OECONF =3D "--program-prefix=3D --program-suffix=3D.im7 --without-=
perl \
-                --disable-openmp --without-xml --disable-opencl \
-                --enable-largefile"
+EXTRA_OECONF =3D "--program-prefix=3D --program-suffix=3D.im7 --without-=
perl --enable-largefile"
=20
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} cx=
x webp xml"
 PACKAGECONFIG[cxx] =3D "--with-magick-plus-plus,--without-magick-plus-pl=
us"
 PACKAGECONFIG[graphviz] =3D "--with-gvc,--without-gvc,graphviz"
 PACKAGECONFIG[jp2] =3D "--with-jp2,,jasper"
@@ -38,6 +34,17 @@ PACKAGECONFIG[tcmalloc] =3D "--with-tcmalloc=3Dyes,--w=
ith-tcmalloc=3Dno,gperftools"
 PACKAGECONFIG[webp] =3D "--with-webp,--without-webp,libwebp"
 PACKAGECONFIG[wmf] =3D "--with-wmf,--without-wmf,libwmf"
 PACKAGECONFIG[x11] =3D "--with-x,--without-x,virtual/libx11 libxext libx=
t"
+PACKAGECONFIG[xml] =3D "--with-xml,--without-xml,libxml2"
+
+do_install:append:class-target() {
+    for file in MagickCore-config.im7 MagickWand-config.im7 Magick++-con=
fig.im7; do
+        sed -i 's,${STAGING_DIR_NATIVE},,g' ${D}${bindir}/"$file"
+    done
+    sed -i 's,${S},,g' ${D}${libdir}/ImageMagick-${BASE_PV}/config-Q16HD=
RI/configure.xml
+    sed -i 's,${B},,g' ${D}${libdir}/ImageMagick-${BASE_PV}/config-Q16HD=
RI/configure.xml
+    sed -i 's,${RECIPE_SYSROOT},,g' ${D}${libdir}/ImageMagick-${BASE_PV}=
/config-Q16HDRI/configure.xml
+    sed -i 's,${HOSTTOOLS_DIR},${bindir},g' ${D}${sysconfdir}/ImageMagic=
k-7/delegates.xml
+}
=20
 FILES:${PN} +=3D "${libdir}/ImageMagick-${BASE_PV}/config-Q16* \
                 ${datadir}/ImageMagick-7"
--=20
2.34.1


