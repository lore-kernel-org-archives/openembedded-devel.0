Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C735CE7A89
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 00:10:50 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.11988.1695427843676163396
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 17:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout08.t-online.de (Postfix) with SMTP id 0BA3FC2D2
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 02:10:42 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.34.192]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qjqEK-23FnFc0; Sat, 23 Sep 2023 02:10:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 4/4] exiv2: Upgrade 0.27.6 -> 0.28.0
Date: Sat, 23 Sep 2023 02:10:26 +0200
Message-ID: <20230923001033.2805049-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230923001033.2805049-1-f_l_k@t-online.de>
References: <20230923001033.2805049-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695427840-56FF8F57-629795A4/0/0 CLEAN NORMAL
X-TOI-MSGID: 5953848b-3715-4e26-a9b3-070772aeafb5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 00:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105082

- add required dependencies on brotli and libinih

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../exiv2/{exiv2_0.27.6.bb =3D> exiv2_0.28.0.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/exiv2/{exiv2_0.27.6.bb =3D> exiv2_0.28.0.=
bb} (82%)

diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.6.bb b/meta-oe/reci=
pes-support/exiv2/exiv2_0.28.0.bb
similarity index 82%
rename from meta-oe/recipes-support/exiv2/exiv2_0.27.6.bb
rename to meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb
index 6ccd9fb26..958810cf7 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.6.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb
@@ -2,10 +2,10 @@ SUMMARY =3D "Exif, Iptc and XMP metadata manipulation l=
ibrary and tools"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D625f055f41728f84a8d7938acc35b=
dc2"
=20
-DEPENDS =3D "zlib expat"
+DEPENDS =3D "zlib expat brotli libinih"
=20
 SRC_URI =3D "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${=
BP}-Source.tar.gz"
-SRC_URI[sha256sum] =3D "4c192483a1125dc59a3d70b30d30d32edace9e14adf52802=
d2f853abf72db8a6"
+SRC_URI[sha256sum] =3D "89af3b5ef7277753ef7a7b5374ae017c6b9e304db3b688f1=
948e73e103491f3d"
 # Once patch is obsolete (project should be aware due to PRs), dos2unix =
can be removed either
 # inherit dos2unix
 S =3D "${WORKDIR}/${BP}-Source"
--=20
2.42.0


