Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD0ECAC58D
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 10:55:09 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.43608.1757588101667088190
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Sep 2025 03:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout02.t-online.de (Postfix) with SMTP id 8F94C2A392
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 12:54:59 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.225.207]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uwex5-0BFM1p0; Thu, 11 Sep 2025 12:54:55 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [oe-core][PATCH] freetype: add PACKAGECONFIG for brotli
Date: Thu, 11 Sep 2025 12:54:49 +0200
Message-ID: <20250911105449.2814354-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1757588095-097F990B-1D5BF5AB/0/0 CLEAN NORMAL
X-TOI-MSGID: ef6a9d7f-eac3-44c9-8ca7-b47accbe89e9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Sep 2025 10:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119361

Enabling brotli adds support for processing WOFF2 fonts.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/freetype/freetype_2.13.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/freetype/freetype_2.13.3.bb b/meta/rec=
ipes-graphics/freetype/freetype_2.13.3.bb
index 100a7d95b6..dbfffdb65f 100644
--- a/meta/recipes-graphics/freetype/freetype_2.13.3.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.13.3.bb
@@ -27,6 +27,7 @@ EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader --exclude=
=3Dautomake -I ."
=20
 PACKAGECONFIG ??=3D "zlib pixmap"
=20
+PACKAGECONFIG[brotli] =3D "--with-brotli,--without-brotli,brotli"
 PACKAGECONFIG[bzip2] =3D "--with-bzip2,--without-bzip2,bzip2"
 # harfbuzz results in a circular dependency so enabling is non-trivial
 PACKAGECONFIG[harfbuzz] =3D "--with-harfbuzz,--without-harfbuzz,harfbuzz=
"
--=20
2.50.1


