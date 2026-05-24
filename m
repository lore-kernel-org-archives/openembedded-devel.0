Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE56CD5BAB
	for <webhook@archiver.kernel.org>; Sun, 24 May 2026 12:57:29 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7652.1779627441713880282
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 May 2026 05:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=UiGMg11K;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd95.aul.t-online.de (fwd95.aul.t-online.de [10.223.144.121])
	by mailout06.t-online.de (Postfix) with SMTP id 77CD15D0
	for <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 14:57:19 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.161.166]) by fwd95.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wR8OM-0Whidt0; Sun, 24 May 2026 14:57:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] playerctl: add recipe
Date: Sun, 24 May 2026 14:57:07 +0200
Message-ID: <20260524125709.9164-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1779627439-097F9F97-E7CEABC5/0/0 CLEAN NORMAL
X-TOI-MSGID: ae23b787-8a1b-4d59-83d3-6228d938a208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1779627439; i=f_l_k@t-online.de;
	bh=uW4uIWGm8tPrxYlHN8za+Ho98gCUdCwqAqCqwjFsRgc=;
	h=From:To:Subject:Date;
	b=UiGMg11KqWT9rx0yl0BGLI9A73CsoCtrYtEJihJRjAycjzbsRyliV6HT166jHKB0A
	 ooN7oKhtJNOXNGbCNsLmuj7N5CiMFDR9Dg6dSHuYPXK3gyYt8pOgEv5VnXm5ERZqjE
	 bV3w87El9vpAboI1RzaqPeFnST2sRkUqckuABwOVoCx92dQsT5VIvpgBOCVLnI7v4e
	 hsrXJsVu1gsYQuRiXVIV17q4CQnJUUwCXsAYVnyCIhcBQ6mOaFE5o4CSxsNvAXLu9r
	 QDhhTRt1Dv+8t3D4e2KZ6yWiqQAywVsDKdcBAoBWDpjWzifUGVt5BBJ78By0DrHZZB
	 P+28EIQoM/jbQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 12:57:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127186

Playerctl is a command-line utility and library for controlling media pla=
yers that
implement the MPRIS D-Bus Interface Specification. Playerctl makes it eas=
y to bind
player actions, such as play and pause, to media keys. You can also get m=
etadata
about the playing track such as the artist and title for integration into=
 statusline
generators or other command-line tools.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../playerctl/playerctl_2.4.1.bb                | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/playerctl/playerctl_2.4.1.=
bb

diff --git a/meta-oe/recipes-multimedia/playerctl/playerctl_2.4.1.bb b/me=
ta-oe/recipes-multimedia/playerctl/playerctl_2.4.1.bb
new file mode 100644
index 0000000000..9d933e63b3
--- /dev/null
+++ b/meta-oe/recipes-multimedia/playerctl/playerctl_2.4.1.bb
@@ -0,0 +1,17 @@
+SUMMARY =3D "For true players only: vlc, mpv, RhythmBox, web browsers, c=
mus, mpd, spotify and others."
+LICENSE =3D "LGPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De6a600fd5e1d9cbde2d983680233a=
d02"
+
+SRC_URI =3D "git://github.com/altdesktop/playerctl.git;protocol=3Dhttps;=
branch=3Dmaster"
+
+DEPENDS =3D "glib-2.0"
+RDEPENDS:${PN} =3D "glib-2.0"
+
+inherit meson pkgconfig gobject-introspection
+
+EXTRA_OEMESON +=3D "--buildtype=3Drelease -Dbash-completions=3Dtrue -Dgt=
k-doc=3Dfalse"
+
+SRCREV =3D "e5304e9dc9a0c0c32b3689c3f141cf266d27f59c"
+
+FILES:${PN} +=3D "${datadir}"
+
--=20
2.54.0


