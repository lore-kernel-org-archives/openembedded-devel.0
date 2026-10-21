Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8044.1792577262381664862
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=hNhGe5x3;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout10.t-online.de (Postfix) with SMTP id F32DA37E01
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:39 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEJ-0cELa90; Wed, 21 Oct 2026 12:07:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 06/26] gnome-settings-daemon: upgrade 51.0 -> 51.1
Date: Wed, 21 Oct 2026 12:06:54 +0200
Message-ID: <20261021100717.11068-6-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021100717.11068-1-f_l_k@t-online.de>
References: <20261021100717.11068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1792577251-B99FD903-210CDE54/0/0 CLEAN NORMAL
X-TOI-MSGID: 28088f6c-9f2d-4f51-bf39-4af31fc80f18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577259; i=f_l_k@t-online.de;
	bh=qgCmH5lWR1uI0obRvMhU2u9B+TIcnbtDUVCXaSsUwcQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=hNhGe5x3J3Gd+XnJMyMrPakX759GsnbV0/e7gQ7Sn4CjYUmnKOWiWzp2XrDzcNmbK
	 8vo6qm2et9VzB/0Ii/bkb+td8uhQhxUyXHk88MSPxSrn+XNvdP2O6nyfKMRwPMdMlf
	 WisEqclCjU2zg0nhgsuA7hWOx8YF7HdVYVWSB6J8W304qIVu++dZpto3F+ayfpKUtO
	 1pPvwlh1KWjxkqnGEaP8lK0Xqx9I4q2Izj3xfpXkj4kfzTiqWbl9S1hnGZKnQ4rSjZ
	 jL5Ob0Zv5C1vCkPK3JNVSprIPcpRjuM7pHA1OVLwMSQ5U4hdm2gh73bNwRhcAZNByH
	 XAgpV1ysA45LQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131235
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...me-settings-daemon_51.0.bb =3D> gnome-settings-daemon_51.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-settings-daemon/{gnome-settings-da=
emon_51.0.bb =3D> gnome-settings-daemon_51.1.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-setting=
s-daemon_51.0.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-s=
ettings-daemon_51.1.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings=
-daemon_51.0.bb
rename to meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-d=
aemon_51.1.bb
index b0d54f6e21..e687de7783 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_51.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_51.1.bb
@@ -25,7 +25,7 @@ DEPENDS =3D " \
 REQUIRED_DISTRO_FEATURES =3D "alsa polkit pulseaudio systemd gobject-int=
rospection-data"
 GIR_MESON_OPTION =3D ""
=20
-SRC_URI[archive.sha256sum] =3D "7c6249118ddfffc4bb34d6b3edaa86b3ea02a1ad=
2b7711d79480749906767665"
+SRC_URI[archive.sha256sum] =3D "e7de8d30ae2d63c7a9a21f8f0247219275cbc1d7=
f5ed09205e4a47642666f6ae"
=20
 UPSTREAM_CHECK_URI =3D "https://gitlab.gnome.org/GNOME/gnome-settings-da=
emon/-/tags"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
--=20
2.56.0

