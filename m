Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55633C54E5D
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 10:43:29 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.12190.1710845003446017387
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Mar 2024 03:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout01.t-online.de (Postfix) with SMTP id 9C51E6D1C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 11:42:58 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.227.144]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rmWvn-4HTcRt0; Tue, 19 Mar 2024 11:42:55 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-session: update 45.0 -> 46.0
Date: Tue, 19 Mar 2024 11:43:18 +0100
Message-ID: <20240319104318.873991-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710844975-F6FFA954-D23141E7/0/0 CLEAN NORMAL
X-TOI-MSGID: 6aaaff63-fb16-4a44-8d82-cf35cbece601
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 10:43:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109478

- consolekit support was removed upstream
- add PACKAGECONFIG for doc

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-session/gnome-session_46.0.bb           | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_46.0.bb=
 b/meta-gnome/recipes-gnome/gnome-session/gnome-session_46.0.bb
index ad8912b2c..87117fd17 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_46.0.bb
@@ -4,29 +4,26 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263"
=20
 DEPENDS =3D " \
     glib-2.0-native \
-    libxslt-native \
-    xmlto-native \
     xtrans \
     libice \
     libsm \
     virtual/libx11 \
-    gtk+3 \
     gnome-desktop \
-    gsettings-desktop-schemas \
+    gtk+3 \
     json-glib \
+    systemd \
 "
=20
-
 inherit gnomebase gettext gsettings upstream-version-is-even features_ch=
eck
=20
-REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam gobject-introspecti=
on-data"
+REQUIRED_DISTRO_FEATURES =3D "polkit systemd pam gobject-introspection-d=
ata"
=20
 SRC_URI[archive.sha256sum] =3D "c6e1624af6090bc4e1a191fe2268abfa7a8de078=
31ca7a57f217e679bf7b9a54"
=20
-PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'systemd', 'consolekit',d)}"
+PACKAGECONFIG ??=3D ""
=20
-PACKAGECONFIG[consolekit] =3D "-Dconsolekit=3Dtrue, -Dconsolekit=3Dfalse=
, dbus-glib"
-PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue -Dsystemd_journal=3Dtrue, -=
Dsystemd=3Dfalse -Dsystemd_journal=3Dfalse, systemd"
+PACKAGECONFIG[docbook] =3D "-Ddocbook=3Dtrue, -Ddocbook=3Dfalse"
+PACKAGECONFIG[man] =3D "-Dman=3Dtrue, -Dman=3Dfalse,xmlto-native libxslt=
-native"
=20
 FILES:${PN} +=3D " \
    ${datadir}/xdg-desktop-portal \
--=20
2.44.0


