Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F59C02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 19:23:46 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.2542.1737573816969262220
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jan 2025 11:23:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout12.t-online.de (Postfix) with SMTP id 6B109630
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 20:23:02 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.37.54]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tagJZ-3Hgq7W0; Wed, 22 Jan 2025 20:23:01 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] gnome-control-center: update 47.2 -> 47.3
Date: Wed, 22 Jan 2025 20:23:09 +0100
Message-ID: <20250122192309.935004-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250122192309.935004-1-f_l_k@t-online.de>
References: <20250122192309.935004-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1737573781-AF7FD9C7-2314AADF/0/0 CLEAN NORMAL
X-TOI-MSGID: f94c9d76-d9cf-4b4b-8d4c-afd857a37648
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 19:23:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115022

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 47.3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Various translation updates

About
- Fix wrong GPU names when g-c-c is launched using dGPU

Color
- Various fixes to the color calibration tool

Notifications
- Update UI when underlying gsetting changes

Network
- Make metered connection and hotspot settings adaptive to small screens

Power
- Handle when tuned-ppd has an unsupported power profile

Sound
- Prevent crash in Volume Levels when stream has no name

Users
- Make screen reader read avatar file names when there are no names

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...nome-control-center_47.2.bb =3D> gnome-control-center_47.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_47.2.bb =3D> gnome-control-center_47.3.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_47.2.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_47.3.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_47.2.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_47.3.bb
index a2decc13e3..a73183f0f8 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
47.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
47.3.bb
@@ -39,7 +39,7 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings ge=
ttext gi-docgen upstream-
 REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
=20
 SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
-SRC_URI[archive.sha256sum] =3D "434a322dc3743858b89d8165d89f89dc05968b6b=
7be3400944ced4271250d3e9"
+SRC_URI[archive.sha256sum] =3D "78381d5a7f1d5b297c9a19611145ee5e0584f06a=
c575ed08ad070a0c07bbeaa2"
=20
 PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
 PACKAGECONFIG[cups] =3D ",,cups,cups system-config-printer cups-pk-helpe=
r"
--=20
2.47.1


