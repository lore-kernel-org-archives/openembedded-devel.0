Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48BD0CD5BAB
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 00:29:51 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7526.1779409788331117240
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2026 17:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=mgFbADxG;
 spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd92.aul.t-online.de (fwd92.aul.t-online.de [10.223.144.118])
	by mailout08.t-online.de (Postfix) with SMTP id F1C44FC5C
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 02:29:45 +0200 (CEST)
Received: from fedora.fritz.box ([84.163.32.69]) by fwd92.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wQDln-4LXmIT0; Fri, 22 May 2026 02:29:43 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] xdg-desktop-portal-gnome: remove gnome-shell runtime dependency
Date: Fri, 22 May 2026 02:29:32 +0200
Message-ID: <20260522002932.87072-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1779409783-CFFFCE15-97EBF1C3/0/0 CLEAN NORMAL
X-TOI-MSGID: 4ac6301d-95df-464f-a23d-203d8044451b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1779409785; i=f_l_k@t-online.de;
	bh=/b8UWvzo3wCpab1T6aL3awKf+FG4y3M+kVhFqIug86Y=;
	h=From:To:Subject:Date;
	b=mgFbADxGYoyHCqiqyVH+Ygh0JzlBvSJK+yk5uIx01pJkRrwaRxtvUuWGw2l40sr8T
	 EjAD3kPtNzbNsaaShBFV+mDBw8lzmBKtF4Rm0NpVI49Djb7y5hY8XLDRM8NMJTX+XQ
	 Wy7IeK+mS4KsbvU0uWX04u5d6gofawWvnDOrFFKJxBD/4SWxxjqPozlZyockHo00xo
	 /lvFdkb9XZxVWhktxxlaAFZg4UZQSe3kTeBAMgIY4PR0QD5BGFRxcflKtCABM5Nins
	 hRHA0ofdJmqzA9Gawm4DsNcZlb6ehCxeS/4iHbLchHIWfkqt1SnffkmvMPGWbNLrrL
	 hgrzi206fQQTA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 00:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127145

xdg-desktop-portal-gnome is no longer used exclusively by gnome-shell. Fo=
r example, it is also used by
niri to provide support for screencasts.

It is not necessary for xdg-desktop-portal-gnome to add runtime dependenc=
ies for mutter and gnome-shell.
In this context, doing so is actually counterproductive.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../xdg-desktop-portal/xdg-desktop-portal-gnome_50.0.bb       | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-po=
rtal-gnome_50.0.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-de=
sktop-portal-gnome_50.0.bb
index 00ef8a5d97..f9d52a5bb2 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_50.0.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_50.0.bb
@@ -23,9 +23,7 @@ REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
 SRC_URI[archive.sha256sum] =3D "ceeef2fb68b34b3f66a3def0a332a22a70af2726=
41fb6c50065b7a2fde3d5759"
=20
-PACKAGECONFIG ?=3D "screenshot screencast ${@bb.utils.filter('DISTRO_FEA=
TURES', 'wayland', d)}"
+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}=
"
 PACKAGECONFIG[wayland] =3D ",,wayland-native"
-PACKAGECONFIG[screenshot] =3D ",,,gnome-shell"
-PACKAGECONFIG[screencast] =3D ",,,mutter"
=20
 FILES:${PN} +=3D "${systemd_user_unitdir} ${datadir}"
--=20
2.54.0


