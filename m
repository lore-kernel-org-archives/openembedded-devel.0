Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DCEED2F358
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 18:10:54 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65955.1768327849447977183
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 10:10:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout10.t-online.de (Postfix) with SMTP id 5429A38F25
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 19:10:24 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.234.232]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vfiqU-1t8Hdx0; Tue, 13 Jan 2026 19:10:22 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] imagemagick: add packageconfigs for raw,jxl,heic
Date: Tue, 13 Jan 2026 19:10:17 +0100
Message-ID: <20260113181017.496462-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1768327822-DDFF8939-D6322B78/0/0 CLEAN NORMAL
X-TOI-MSGID: 92d4909c-f541-4752-b018-f2177a3104ff
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 18:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123439

Dont add them by default

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-12.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-12.bb =
b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-12.bb
index 26c19bf986..535ba7df65 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-12.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-12.bb
@@ -27,9 +27,12 @@ EXTRA_OECONF =3D "--program-prefix=3D --program-suffix=
=3D.im7 --without-perl --enable-
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} cx=
x webp xml"
 PACKAGECONFIG[cxx] =3D "--with-magick-plus-plus,--without-magick-plus-pl=
us"
 PACKAGECONFIG[graphviz] =3D "--with-gvc,--without-gvc,graphviz"
+PACKAGECONFIG[heic] =3D "--with-heic,--without-heic,libheif"
+PACKAGECONFIG[jxl] =3D "--with-jxl,--without-jxl,libjxl"
 PACKAGECONFIG[lzma] =3D "--with-lzma,--without-lzma,xz"
 PACKAGECONFIG[openjpeg] =3D "--with-openjp2,--without-openjp2,openjpeg"
 PACKAGECONFIG[pango] =3D "--with-pango,--without-pango,pango cairo"
+PACKAGECONFIG[raw] =3D "--with-raw,--without-raw,libraw"
 PACKAGECONFIG[rsvg] =3D "--with-rsvg,--without-rsvg,librsvg"
 PACKAGECONFIG[tcmalloc] =3D "--with-tcmalloc=3Dyes,--with-tcmalloc=3Dno,=
gperftools"
 PACKAGECONFIG[webp] =3D "--with-webp,--without-webp,libwebp"
--=20
2.52.0


