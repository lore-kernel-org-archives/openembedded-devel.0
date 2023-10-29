Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C221C4332F
	for <webhook@archiver.kernel.org>; Sun, 29 Oct 2023 16:15:15 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.75241.1698596108822666443
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Oct 2023 09:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout12.t-online.de (Postfix) with SMTP id B5DCA173C8
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Oct 2023 17:15:05 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.162.58]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qx8RK-3UvO3l0; Sun, 29 Oct 2023 17:15:02 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-shell: Remove deprecated libcroco dependency
Date: Sun, 29 Oct 2023 17:15:19 +0100
Message-ID: <20231029161519.20890-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1698596102-F894633D-A6F41326/0/0 CLEAN NORMAL
X-TOI-MSGID: 32506202-1a3d-4625-a01e-02c05d4842d0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Oct 2023 16:15:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105786

- add dependency on gnome-desktop and libsecret

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.0.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.0.bb
index d920c6d65..8dc4d8317 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.0.bb
@@ -13,9 +13,9 @@ DEPENDS =3D " \
     geocode-glib \
     gjs \
     gnome-autoar \
+    gnome-desktop \
     polkit \
     pipewire \
-    libcroco \
     libsoup-3.0 \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'startup-noti=
fication', d)} \
     ibus \
@@ -38,7 +38,7 @@ SRC_URI +=3D "file://0001-Introduce-options-gjs_path-to=
-optionally-set-path-to.pat
=20
 PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
 PACKAGECONFIG[bluetooth] =3D ",,gnome-bluetooth"
-PACKAGECONFIG[nm] =3D "-Dnetworkmanager=3Dtrue, -Dnetworkmanager=3Dfalse=
,networkmanager,networkmanager"
+PACKAGECONFIG[nm] =3D "-Dnetworkmanager=3Dtrue, -Dnetworkmanager=3Dfalse=
,networkmanager libsecret,networkmanager"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue, -Dsystemd=3Dfalse, systemd=
"
=20
 EXTRA_OEMESON =3D " \
--=20
2.42.0


