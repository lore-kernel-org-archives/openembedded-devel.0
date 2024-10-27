Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98284D10BFE
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 07:20:51 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.25579.1730013648893487529
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Oct 2024 00:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id 2FDBA545A
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 08:20:42 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.173.215]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t4xZo-2ieknh0; Sun, 27 Oct 2024 08:20:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/5] gnome-control-center: update 47.0.1 -> 47.1.1
Date: Sun, 27 Oct 2024 08:22:38 +0100
Message-ID: <20241027072242.381222-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1730013640-0F7FC40D-191882FC/0/0 CLEAN NORMAL
X-TOI-MSGID: 31844ea6-f5eb-4c4c-aeb3-c8547cf35dc8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 07:20:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113239

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 47.1.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Fix crash on display scales > 1 due to conflicting type registration

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 47.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Various translation updates
- Require gsettings-desktop-schemas >=3D 47.0

About
- Allow FQDN hostnames

Appearance
- Fix thumbnailing of backgrounds causing OOM kills

Date and Time
- Fix resize issue in the time format row when shown in small window size=
s

Online Accounts
- Fix untranslated account provider info string

Region and Language
- Update language row after closing language selector

Remote Desktop
- Hide "Remote Desktop" row when gnome-remote-desktop is not available

Wacom
- Don't crash when handling an unknown stylus ID
- Don't show Map Buttons for fallback devices
- Handle all external remotes like an external TV remote-like device
- Make assets recolaborable, supporting dark-style, high-contrast, and ac=
cent colors
- Support HDPI for tablet/stylus illustration images

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-control-center_47.0.1.bb =3D> gnome-control-center_47.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_47.0.1.bb =3D> gnome-control-center_47.1.1.bb} (97%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_47.0.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-co=
ntrol-center_47.1.1.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_47.0.1.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_47.1.1.bb
index f2b0d09d5..dce7711b8 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
47.0.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
47.1.1.bb
@@ -41,7 +41,7 @@ SRC_URI =3D "gitsm://gitlab.gnome.org/GNOME/gnome-contr=
ol-center.git;protocol=3Dhttp
=20
 S =3D "${WORKDIR}/git"
 SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
-SRCREV =3D "adb035fa5c61cdcff622536fde9456e3859211fd"
+SRCREV =3D "7985fc671ad43f5925b9012e6c51231ad73a628d"
=20
 PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
 PACKAGECONFIG[cups] =3D ",,cups,cups system-config-printer cups-pk-helpe=
r"
--=20
2.47.0


