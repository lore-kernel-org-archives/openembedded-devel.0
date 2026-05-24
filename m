Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27893CD5BC7
	for <webhook@archiver.kernel.org>; Sun, 24 May 2026 12:57:29 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7603.1779627441703639503
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 May 2026 05:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=VgUEVd/N;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd95.aul.t-online.de (fwd95.aul.t-online.de [10.223.144.121])
	by mailout06.t-online.de (Postfix) with SMTP id 864E86BD
	for <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 14:57:19 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.161.166]) by fwd95.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wR8ON-0Whidu0; Sun, 24 May 2026 14:57:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] mpv-mpris: add recipe
Date: Sun, 24 May 2026 14:57:08 +0200
Message-ID: <20260524125709.9164-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260524125709.9164-1-f_l_k@t-online.de>
References: <20260524125709.9164-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1779627439-9FFFCF97-A5024310/0/0 CLEAN NORMAL
X-TOI-MSGID: bac5e9f7-7e2c-4a0b-8b2f-7028cd3ff995
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1779627439; i=f_l_k@t-online.de;
	bh=E/Pwdm1ERFKyyR/b0x4mQ7aH6t/mPJlJ1XtLbjrg3MM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=VgUEVd/NuMsIRU15LdxMOGQVYsrciDI9C1p23Ms5DZFqnrab+Ev4jkVg7yjMsv3jd
	 4fpRoAVbGzp+CWhkKrPfvY5LI7zB5Ac4s9/r5FlbCkCGyxfZVLus5tu4DaSJhc9yPi
	 sNEgZ6npzO6Q4+0KGF0wn8XH5KAV0tVbm+xl1gEda1Dz9iX9S29JmGS6yHJy+89TLK
	 5MPOC8SU05FkZrkB9cxubBUp71ba0OdRCyOugcvA9OlgUPwMUfOdw8tpmn0lHpOLbS
	 LDt0TV87PKBTLBjx7+wySZWfor7fqr3vdGz3dO1IStHYb3MsV7UXf+WF+5Q5LKEYLG
	 jWWAgZtOPyDQw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 12:57:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127185

mpv-mpris is a plugin for mpv which allows control of the player using st=
andard media keys.

This plugin implements the MPRIS D-Bus interface and can be controlled us=
ing tools such as
playerctl or through many open source desktop environments, such as GNOME=
 and KDE.

It requires mpv to be built with --enable-cplugins (default as of mpv 0.2=
6) and to
be built with Lua support (to enable loading scripts).

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../mplayer/mpv-mpris_1.2.bb                   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv-mpris_1.2.bb

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv-mpris_1.2.bb b/meta-o=
e/recipes-multimedia/mplayer/mpv-mpris_1.2.bb
new file mode 100644
index 0000000000..d4c42483a0
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mpv-mpris_1.2.bb
@@ -0,0 +1,18 @@
+SUMMARY =3D "mpv-mpris is a plugin for mpv which allows control of the p=
layer using standard media keys"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6d9f933220f595813218a175adc13=
001"
+
+SRC_URI =3D "git://github.com/hoyon/mpv-mpris.git;protocol=3Dhttps;branc=
h=3Dmaster"
+SRCREV =3D "df95f07c48926d1589ee5fe36a455c1f49cbe4c8"
+
+DEPENDS +=3D "ffmpeg glib-2.0 mpv"
+
+inherit pkgconfig
+
+do_install() {
+	oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} install
+}
+
+INSANE_SKIP:${PN} =3D "dev-so"
+
+RDEPENDS:${PN} =3D "playerctl"
--=20
2.54.0


