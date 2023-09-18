Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B71CD13D9
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 21:52:17 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.4027.1695073930347517105
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 14:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout03.t-online.de (Postfix) with SMTP id E4A583482A
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 23:52:08 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.214]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiMA0-3qxV250; Mon, 18 Sep 2023 23:52:04 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 05/18] gnome-session: upgrade 44.0 -> 45.0
Date: Mon, 18 Sep 2023 23:51:40 +0200
Message-ID: <20230918215156.1920452-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918215156.1920452-1-f_l_k@t-online.de>
References: <20230918215156.1920452-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695073924-477FF5E3-2B48CB42/0/0 CLEAN NORMAL
X-TOI-MSGID: 2a972641-8238-4aef-afb1-49ef57232b6f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 21:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104930

Remove unneeded dependencies as gnome-session gets pulled in by gnome-she=
ll
---
 .../{gnome-session_44.0.bb =3D> gnome-session_45.0.bb}         | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-session/{gnome-session_44.0.bb =3D=
> gnome-session_45.0.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_44.0.bb=
 b/meta-gnome/recipes-gnome/gnome-session/gnome-session_45.0.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-session/gnome-session_44.0.bb
rename to meta-gnome/recipes-gnome/gnome-session/gnome-session_45.0.bb
index 3f642f401..ec5b47b97 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_44.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_45.0.bb
@@ -22,7 +22,7 @@ inherit gnomebase gettext gsettings upstream-version-is=
-even features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam gobject-introspecti=
on-data"
=20
-SRC_URI[archive.sha256sum] =3D "ccf829a96526135e9e9f917526515d36a5092bdf=
a316f3737dd8c5a524dbf2c6"
+SRC_URI[archive.sha256sum] =3D "706d2ffcacac38553a3c0185793f5a2b4aac940b=
b5e789d953c9808163bef2f1"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'systemd', 'consolekit',d)}"
=20
@@ -30,9 +30,8 @@ PACKAGECONFIG[consolekit] =3D "-Dconsolekit=3Dtrue, -Dc=
onsolekit=3Dfalse, dbus-glib"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue -Dsystemd_journal=3Dtrue, -=
Dsystemd=3Dfalse -Dsystemd_journal=3Dfalse, systemd"
=20
 FILES:${PN} +=3D " \
+   ${datadir}/xdg-desktop-portal \
     ${datadir}/xsessions \
     ${datadir}/wayland-sessions \
     ${systemd_user_unitdir} \
 "
-
-RDEPENDS:${PN} +=3D "gnome-shell gnome-settings-daemon gsettings-desktop=
-schemas"
--=20
2.41.0


