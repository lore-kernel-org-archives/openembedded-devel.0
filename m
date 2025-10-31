Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F51CCF9F0
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 03:43:24 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.7088.1761882194640527332
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 20:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout07.t-online.de (Postfix) with SMTP id EB8C1F16F
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 04:43:02 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.215]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vEg2V-0aV6VW0; Fri, 31 Oct 2025 04:42:59 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] libsdl2-compat: update 2.32.56 -> 2.32.58
Date: Fri, 31 Oct 2025 04:42:43 +0100
Message-ID: <20251031034243.70918-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031034243.70918-1-f_l_k@t-online.de>
References: <20251031034243.70918-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1761882179-31FF8A4B-E4562361/0/0 CLEAN NORMAL
X-TOI-MSGID: 4e4f3649-3539-426e-a77b-27020912b8aa
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 03:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121221

This is a stable bugfix release, with the following changes:

    Fixed a crash at startup in Hearts of Iron IV
    Fixed mouse movement in Heroes of Might and Magic III
    Fixed crash under Wayland with Heavy Gear 2
    Fixed crash at shutdown in Sim City 3000
    Fixed stuck mouse cursor in Seven Kingdoms
    Added a fast path for SDL_MapRGB() and SDL_MapRGBA()
    Fixed the colorspace for YUV to RGB conversion
    Fixed deadlock when opening audio on some systems
    Added logging when games are launched with DEBUG_INVOCATION=3D1

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{libsdl2-compat_2.32.56.bb =3D> libsdl2-compat_2.32.58.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl2-compat_2.32.56.bb =3D> =
libsdl2-compat_2.32.58.bb} (91%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb b=
/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.58.bb
similarity index 91%
rename from meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.58.bb
index 3b17f350df..8bbc23fde4 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.56.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.58.bb
@@ -11,7 +11,7 @@ LICENSE =3D "Zlib"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D98241180d857fe975e4b60d44=
d6c01a5"
=20
 SRC_URI =3D "http://www.libsdl.org/release/sdl2-compat-${PV}.tar.gz"
-SRC_URI[sha256sum] =3D "27e845b1b7dc0a91a85f1a1f18892ed205adb38caf767741=
eb258008d8264de0"
+SRC_URI[sha256sum] =3D "ae85222c007f7e2acb927c7a47c12726f56478c6f3f35ee0=
da1ac929f8beb53e"
 S =3D "${UNPACKDIR}/sdl2-compat-${PV}"
=20
 DEPENDS +=3D "libsdl3"
--=20
2.51.0


