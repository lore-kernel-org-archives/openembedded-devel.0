Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66670E6529E
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 18:40:22 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35464.1769971217912061921
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Feb 2026 10:40:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout11.t-online.de (Postfix) with SMTP id EDE7A1BF2C
	for <openembedded-devel@lists.openembedded.org>; Sun,  1 Feb 2026 19:39:52 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.161.231]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vmcMP-1nPpbN0; Sun, 1 Feb 2026 19:39:49 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libsdl2-compat: update 2.32.58 -> 2.32.62
Date: Sun,  1 Feb 2026 19:39:38 +0100
Message-ID: <20260201183938.1418660-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1769971189-577FDBB2-31E524DD/0/0 CLEAN NORMAL
X-TOI-MSGID: 8fa23ad8-113b-49c4-bd5c-06e9cd43e01d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 18:40:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124041

- Starting with [https://github.com/libsdl-org/sdl2-compat/pull/536], it
  is possible to compile without x11. Remove x11 from
  REQUIRED_DISTRO_FEATURES

Changelog:

2.32.62:
This is a stable bugfix release, with the following changes:
Improved support for GNU/Hurd
Fixed crash if hidapi strings are not available

2.32.60:
This is a stable bugfix release, with the following changes:
Fixed crash at startup in Dwarf Fortress
Fixed crash at startup in Stellaris
Fixed mouse stuttering in Amiberry
Fixed the viewport not being reset when the window is resized

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...libsdl2-compat_2.32.58.bb =3D> libsdl2-compat_2.32.62.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl2-compat_2.32.58.bb =3D> =
libsdl2-compat_2.32.62.bb} (77%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.58.bb b=
/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.62.bb
similarity index 77%
rename from meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.58.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.62.bb
index 8bbc23fde4..2d0125ce7d 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.58.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.62.bb
@@ -11,7 +11,7 @@ LICENSE =3D "Zlib"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D98241180d857fe975e4b60d44=
d6c01a5"
=20
 SRC_URI =3D "http://www.libsdl.org/release/sdl2-compat-${PV}.tar.gz"
-SRC_URI[sha256sum] =3D "ae85222c007f7e2acb927c7a47c12726f56478c6f3f35ee0=
da1ac929f8beb53e"
+SRC_URI[sha256sum] =3D "23019a3b0825e2fd3411901df3e1ae24c595cd57e20a3455=
09f77472bd9000e0"
 S =3D "${UNPACKDIR}/sdl2-compat-${PV}"
=20
 DEPENDS +=3D "libsdl3"
@@ -20,7 +20,10 @@ PROVIDES =3D "virtual/libsdl2"
=20
 inherit cmake pkgconfig upstream-version-is-even features_check
=20
-REQUIRED_DISTRO_FEATURES =3D "opengl x11"
+REQUIRED_DISTRO_FEATURES =3D "opengl"
+
+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG[x11] =3D "-DSDL2COMPAT_X11=3DON,-DSDL2COMPAT_X11=3DOFF,vir=
tual/libx11"
=20
 do_install:append() {
 	mv ${D}${libdir}/pkgconfig/sdl2-compat.pc ${D}${libdir}/pkgconfig/sdl2.=
pc
--=20
2.52.0


