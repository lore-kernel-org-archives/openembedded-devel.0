Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A40C10F1B
	for <webhook@archiver.kernel.org>; Sat, 10 Dec 2022 05:22:10 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.9043.1670649724536998122
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Dec 2022 21:22:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout04.t-online.de (Postfix) with SMTP id 53DA5ED7
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 06:22:02 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.165]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p3sJB-1hOgEc0; Sat, 10 Dec 2022 06:21:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 2/6] gnome-session: update 42.0 -> 43-0
Date: Sat, 10 Dec 2022 06:21:33 +0100
Message-Id: <20221210052137.303984-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221210052137.303984-1-f_l_k@t-online.de>
References: <20221210052137.303984-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670649717-E67DE07E-0E8704E3/0/0 CLEAN NORMAL
X-TOI-MSGID: 9b46da09-121f-4a3f-8ebd-f03e8630c804
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 05:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100013

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-session_42.0.bb =3D> gnome-session_43.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-session/{gnome-session_42.0.bb =3D=
> gnome-session_43.0.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_42.0.bb=
 b/meta-gnome/recipes-gnome/gnome-session/gnome-session_43.0.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gnome-session/gnome-session_42.0.bb
rename to meta-gnome/recipes-gnome/gnome-session/gnome-session_43.0.bb
index 9407c25a5..12f48bc82 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_43.0.bb
@@ -22,11 +22,11 @@ inherit gnomebase gettext gsettings upstream-version-=
is-even features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam gobject-introspecti=
on-data"
=20
-SRC_URI[archive.sha256sum] =3D "3cca06053ab682926920951a7da95f8cc6d72da7=
4c682c46d0a0653332969caa"
+SRC_URI[archive.sha256sum] =3D "3fb9949501385c8c14618e78f178d952df98ad8c=
91080f4c5e1568c7393ae1f2"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'systemd', 'consolekit',d)}"
=20
-PACKAGECONFIG[consolekit] =3D "-Dconsolekit=3Dtrue, -Dconsolekit=3Dfalse=
, consolekit"
+PACKAGECONFIG[consolekit] =3D "-Dconsolekit=3Dtrue, -Dconsolekit=3Dfalse=
, dbus-glib"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue -Dsystemd_journal=3Dtrue, -=
Dsystemd=3Dfalse -Dsystemd_journal=3Dfalse, systemd"
=20
 FILES:${PN} +=3D " \
--=20
2.34.1


