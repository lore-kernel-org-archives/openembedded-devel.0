Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA2BC282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 12:38:11 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.13431.1741869485667542417
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 05:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout08.t-online.de (Postfix) with SMTP id B0AB0792
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 13:38:03 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.231.110]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tshp5-3fM95d0; Thu, 13 Mar 2025 13:38:03 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libsdl2-compat: add recipe
Date: Thu, 13 Mar 2025 13:38:44 +0100
Message-ID: <20250313123844.419122-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1741869483-BF7FC51F-9A3CD99D/0/0 CLEAN NORMAL
X-TOI-MSGID: 23454c64-a622-4e06-85a0-f6439e265c5c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 12:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115968

This is a drop in replacement for libsdl2 that uses libsdl3 behind the sc=
enes

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libsdl3/libsdl2-compat_2.32.52.bb         | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.=
52.bb

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb b=
/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb
new file mode 100644
index 0000000000..5052c85b3d
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb
@@ -0,0 +1,21 @@
+SUMMARY =3D "Simple DirectMedia Layer (SDL) sdl2-compat"
+DESCRIPTION =3D "This code is a compatibility layer; it provides a binar=
y and source compatible \
+API for programs written against SDL2, but it uses SDL3 behind the scene=
s. If you are \
+writing new code, please target SDL3 directly and do not use this layer.=
"
+HOMEPAGE =3D "http://www.libsdl.org"
+BUGTRACKER =3D "http://bugzilla.libsdl.org/"
+
+SECTION =3D "libs"
+
+LICENSE =3D "Zlib"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D98241180d857fe975e4b60d44=
d6c01a5"
+
+SRC_URI =3D "http://www.libsdl.org/release/sdl2-compat-${PV}.tar.gz"
+SRC_URI[sha256sum] =3D "eb02c4c47d90e7a2585a65c712cf4a08ff4c37c0a1efc17a=
f49d8ebde3292c23"
+S =3D "${WORKDIR}/sdl2-compat-${PV}"
+
+DEPENDS +=3D "libsdl3"
+
+inherit cmake pkgconfig upstream-version-is-even
+
+FILES:${PN} +=3D "${datadir}/licenses"
--=20
2.48.1


