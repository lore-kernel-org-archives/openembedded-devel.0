Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA909C48BF8
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 18:47:46 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.2154.1708368466209719412
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 10:47:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout08.t-online.de (Postfix) with SMTP id F375E220FB
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 19:47:21 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.47.44]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rc8ff-1vNyUN0; Mon, 19 Feb 2024 19:47:19 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/4] gnome-control-center: update 45.2 -> 45.3
Date: Mon, 19 Feb 2024 19:47:30 +0100
Message-ID: <20240219184731.3378-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240219184731.3378-1-f_l_k@t-online.de>
References: <20240219184731.3378-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1708368439-3DA409FB-390FB221/0/0 CLEAN NORMAL
X-TOI-MSGID: 2ab57a10-8d4f-43df-9cfc-7634349911d5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:47:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108877

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 45.3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Datetime
- Fix build with -Wincompatible-pointer-types

Region
- Prevent preview crash from accessing invalid pointer

Wifi
- Fix build with -Wincompatible-pointer-types

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...nome-control-center_45.2.bb =3D> gnome-control-center_45.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_45.2.bb =3D> gnome-control-center_45.3.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_45.2.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_45.3.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_45.2.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_45.3.bb
index d146bc4bd..cb9a57798 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
45.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
45.3.bb
@@ -38,7 +38,7 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings ge=
ttext upstream-version-is
 REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
=20
 SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
-SRC_URI[archive.sha256sum] =3D "0cfa3c332d6edacb73d06c6b26ffca1078e86ff5=
9eac819b2931e0967753df70"
+SRC_URI[archive.sha256sum] =3D "b1e949c4e86c0624ec6a6ed0df09c9fae2b22983=
c1dca60ed86aec8ef0b24004"
=20
 PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
 PACKAGECONFIG[cups] =3D ",,cups,cups"
--=20
2.43.0


