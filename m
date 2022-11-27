Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB974C4708A
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 12:29:12 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.90659.1669552142273721006
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 04:29:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout06.t-online.de (Postfix) with SMTP id 67DD31F861
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Nov 2022 13:29:00 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.231.234]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ozGmK-0sD6nQ0; Sun, 27 Nov 2022 13:29:00 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv3 08/14] gnome-settings-daemon: update 42.1 -> 43.0
Date: Sun, 27 Nov 2022 13:28:40 +0100
Message-Id: <20221127122846.1406944-8-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127122846.1406944-1-f_l_k@t-online.de>
References: <20221127122846.1406944-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669552140-D9A4E9D3-089F6749/0/0 CLEAN NORMAL
X-TOI-MSGID: be1e3e12-dbe5-45c6-8a5f-9c97ac6e2cb4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Nov 2022 12:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99775

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-settings-daemon_42.1.bb =3D> gnome-settings-daemon_43.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-settings-daemon/{gnome-settings-da=
emon_42.1.bb =3D> gnome-settings-daemon_43.0.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-setting=
s-daemon_42.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-s=
ettings-daemon_43.0.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings=
-daemon_42.1.bb
rename to meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-d=
aemon_43.0.bb
index 3d5913ac0..fe246953f 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_42.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_43.0.bb
@@ -25,7 +25,7 @@ DEPENDS =3D " \
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit pulseaudio systemd gobject-intr=
ospection-data"
 GIR_MESON_OPTION =3D ""
=20
-SRC_URI[archive.sha256sum] =3D "ed65851ae54adcd58a24c86837d624fc6a14bd84=
ab22e94df40a3a4cfd19ffdb"
+SRC_URI[archive.sha256sum] =3D "3513bb24fc6f8181667223a64a067534fdccf3bf=
66326a9403d38b0f0d6013d0"
=20
 PACKAGECONFIG ??=3D " \
     cups nm \
@@ -42,5 +42,5 @@ PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue,-Dwayland=3D=
false,wayland"
=20
 FILES:${PN} +=3D " \
     ${systemd_user_unitdir} \
-    ${libdir}/gnome-settings-daemon-42/libgsd.so \
+    /usr/lib/gnome-settings-daemon-43/libgsd.so \
 "
--=20
2.34.1


