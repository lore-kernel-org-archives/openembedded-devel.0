Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66932C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 20:34:26 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.4133.1745526862792889774
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 13:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout09.t-online.de (Postfix) with SMTP id 59D941A05
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 22:34:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.69]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u83H3-38CNSe0; Thu, 24 Apr 2025 22:34:21 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 12/18] libsdl2-image: make use of virtual/libsdl2
Date: Thu, 24 Apr 2025 22:34:00 +0200
Message-ID: <20250424203406.2113462-12-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424203406.2113462-1-f_l_k@t-online.de>
References: <20250424203406.2113462-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745526861-6A7FBA5A-7D8C44D4/0/0 CLEAN NORMAL
X-TOI-MSGID: c77e551f-e32d-4f06-83b1-d950903c0200
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 20:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117104

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb b/met=
a-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb
index 15f7b6f4b7..d3dbf13ae7 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb
@@ -4,7 +4,7 @@ SECTION =3D "libs"
 LICENSE =3D "Zlib"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dfbb0010b2f7cf6e8a13bcac1e=
f4d2455"
=20
-DEPENDS =3D "tiff zlib libpng jpeg libsdl2 libwebp"
+DEPENDS =3D "tiff zlib libpng jpeg virtual/libsdl2 libwebp"
=20
 SRC_URI =3D "http://www.libsdl.org/projects/SDL_image/release/SDL2_image=
-${PV}.tar.gz"
 SRC_URI[sha256sum] =3D "2213b56fdaff2220d0e38c8e420cbe1a83c87374190cba8c=
70af2156097ce30a"
--=20
2.49.0


