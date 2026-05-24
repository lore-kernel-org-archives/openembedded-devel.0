Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E545CD5BB1
	for <webhook@archiver.kernel.org>; Sun, 24 May 2026 16:37:10 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10929.1779640620504142787
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 May 2026 09:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=RDo14TjU;
 spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout09.t-online.de (Postfix) with SMTP id 5390437EBC
	for <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 18:36:58 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.161.166]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wRBos-4dCTzt0; Sun, 24 May 2026 18:36:54 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] mpv-mpris: add recipe
Date: Sun, 24 May 2026 18:36:47 +0200
Message-ID: <20260524163647.14345-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1779640614-87FFC85B-07F64D84/0/0 CLEAN NORMAL
X-TOI-MSGID: 45d66f47-392a-409f-a33e-1c92fb373e95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1779640618; i=f_l_k@t-online.de;
	bh=RMH+bXNr+gBpRR7ZHPArdmWKF+FLzDupydw5zCE8sqc=;
	h=From:To:Subject:Date;
	b=RDo14TjU5XIvOSkUtgGh63k4I+Vk4RQ2CWszDktBSxt9SfTfooFu+XCe0UBMXl7cW
	 gA698ABSXS8YdqFaDyFHYspnI6cmcI4bdBC0v5zECQmBnoSn4LOrp7RaLWpAD6DcSf
	 6OmFmHVnoixs94eN49TDbRSFceTR4gj5ntrIRCUvqIJit4zmNxbLTBoG4v7lGgPu26
	 uIpIssmQKE0lgmrg4P1hEkognbLf6+HCVtSWYuhEew/8I5e/YSXfRisEPBFwj8PtR9
	 qs9tp+rrdqVtleTrcIwM5lFmAzk7ZHfPSV4hnTGdQea71ThxB7svN1hRafYjt5fWXx
	 bBZzfO7f3e5gw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2026 16:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127191

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
 .../mplayer/mpv-mpris_1.2.bb                  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv-mpris_1.2.bb

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv-mpris_1.2.bb b/meta-o=
e/recipes-multimedia/mplayer/mpv-mpris_1.2.bb
new file mode 100644
index 0000000000..802564193a
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mpv-mpris_1.2.bb
@@ -0,0 +1,20 @@
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
+EXCLUDE_FROM_WORLD =3D "${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "=
commercial", "0", "1", d)}"
+
+RDEPENDS:${PN} =3D "playerctl"
--=20
2.54.0


