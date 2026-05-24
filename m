Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CC7CD5BB1
	for <webhook@archiver.kernel.org>; Sun, 24 May 2026 13:06:39 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7733.1779627991257775345
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 May 2026 06:06:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=EFpAvycO;
 spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout12.t-online.de (Postfix) with SMTP id 6D058E61A
	for <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 15:06:29 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.161.166]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wR8XE-3djmEr0; Sun, 24 May 2026 15:06:28 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] playerctl: add recipe
Date: Sun, 24 May 2026 15:06:19 +0200
Message-ID: <20260524130619.27250-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1779627988-DA7FB9E4-5D0EF109/0/0 CLEAN NORMAL
X-TOI-MSGID: 2f6584df-c068-4b4a-b394-d9d0f362c9a4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1779627989; i=f_l_k@t-online.de;
	bh=kkT5juGXeH1T60BfNpyzxkil9J2/JIMx7oiQCuNp5PU=;
	h=From:To:Subject:Date;
	b=EFpAvycOxnNDqSWDOE66HOpRJ0rF2cL/ghNy/3sSQwWMjP2Itw0/6qwOLzUU29E/M
	 +vyco+c5yTambRxQW8MmSdG9Z7iT3bVkr/8jmbYbbR512GdYMIvnjFOsDGqFs+t2Hk
	 It05anxyW2Ow3fJ9usgRxvh//7ud6Xli7O3cr7o/f32cd1cnn964yXdMAYXc+WD1i3
	 KjmAly2H1Jfh51x8RlQWSp0S167IkPSxbxRIWQ1JCXTgubx5YHUMnKiaqDJKNp91/A
	 w4UAuh1ftD1M+dzo/aHohBm1YAXKaa6TjgMGS8Fghkp2TbV6RZ1fBuTo2ILKk3iNEb
	 6MEO1LsIIhp7A==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 13:06:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127188

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
 .../playerctl/playerctl_2.4.1.bb                 | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/playerctl/playerctl_2.4.1.=
bb

diff --git a/meta-oe/recipes-multimedia/playerctl/playerctl_2.4.1.bb b/me=
ta-oe/recipes-multimedia/playerctl/playerctl_2.4.1.bb
new file mode 100644
index 0000000000..d4c28b8543
--- /dev/null
+++ b/meta-oe/recipes-multimedia/playerctl/playerctl_2.4.1.bb
@@ -0,0 +1,16 @@
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
+
+inherit meson pkgconfig gobject-introspection bash-completion
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


