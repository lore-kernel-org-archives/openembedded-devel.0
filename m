Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15393E9A03B
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 11:35:01 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10179.1771414498627031030
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Feb 2026 03:34:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout02.t-online.de (Postfix) with SMTP id 8A9A9E64D
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 12:34:56 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.40.86]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vsfpY-3zBrnv0; Wed, 18 Feb 2026 12:34:56 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] libsdl2-compat: update 2.32.62 -> 2.32.64
Date: Wed, 18 Feb 2026 12:34:50 +0100
Message-ID: <20260218113450.32876-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260218113450.32876-1-f_l_k@t-online.de>
References: <20260218113450.32876-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1771414496-D2FDE5A5-B8ADBCC1/0/0 CLEAN NORMAL
X-TOI-MSGID: c0fdef4c-3ce5-4e4d-9afa-85434d354d68
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 11:35:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124475

- fix license checkksum: Copyright year has been changed

This is a stable bugfix release, with the following changes:

    Fixed surface memory leak in some circumstances
    Fixed mouse grab not persisting past window recreation
    Fixed picking the correct fullscreen resolution

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{libsdl2-compat_2.32.62.bb =3D> libsdl2-compat_2.32.64.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl2-compat_2.32.62.bb =3D> =
libsdl2-compat_2.32.64.bb} (86%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.62.bb b=
/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.64.bb
similarity index 86%
rename from meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.62.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.64.bb
index 2d0125ce7d..c83b90f77b 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.62.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.64.bb
@@ -8,10 +8,10 @@ BUGTRACKER =3D "http://bugzilla.libsdl.org/"
 SECTION =3D "libs"
=20
 LICENSE =3D "Zlib"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D98241180d857fe975e4b60d44=
d6c01a5"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dca6eaff208365238403badb97=
aa6b3d2"
=20
 SRC_URI =3D "http://www.libsdl.org/release/sdl2-compat-${PV}.tar.gz"
-SRC_URI[sha256sum] =3D "23019a3b0825e2fd3411901df3e1ae24c595cd57e20a3455=
09f77472bd9000e0"
+SRC_URI[sha256sum] =3D "b2fa522e7bb08113534904b3dc2d2f7ff7b0c259224d86c1=
2374d5b4a4027930"
 S =3D "${UNPACKDIR}/sdl2-compat-${PV}"
=20
 DEPENDS +=3D "libsdl3"
--=20
2.52.0


