Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD82C4167B
	for <webhook@archiver.kernel.org>; Sun,  3 Dec 2023 08:02:02 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.35310.1701590520848108013
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Dec 2023 00:02:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout03.t-online.de (Postfix) with SMTP id 1AE7514F62
	for <openembedded-devel@lists.openembedded.org>; Sun,  3 Dec 2023 09:01:59 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.46.197]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r9hQK-18pT3B0; Sun, 3 Dec 2023 09:01:56 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] xdg-desktop-portal-gnome: upgrade 45.0 -> 45.1
Date: Sun,  3 Dec 2023 09:02:31 +0100
Message-ID: <20231203080231.1477715-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1701590516-489CB820-778BDDC4/0/0 CLEAN NORMAL
X-TOI-MSGID: b738fc71-9df1-49f7-aa8f-d09410828607
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Dec 2023 08:02:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107198

Changes in 45.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- accountdialog: Fix crash when pressing Escape
- Send remote file URIs as local FUSE URIs
- Various fixes to screencast and input capture
- Expose org.gnome.desktop.calendar through the Settings portal
- Put dialogs in separate window groups
- Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...op-portal-gnome_45.0.bb =3D> xdg-desktop-portal-gnome_45.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/xdg-desktop-portal/{xdg-desktop-portal=
-gnome_45.0.bb =3D> xdg-desktop-portal-gnome_45.1.bb} (89%)

diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-po=
rtal-gnome_45.0.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-de=
sktop-portal-gnome_45.1.bb
similarity index 89%
rename from meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-por=
tal-gnome_45.0.bb
rename to meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-porta=
l-gnome_45.1.bb
index 6cf706a92..a5477301b 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_45.0.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_45.1.bb
@@ -21,7 +21,7 @@ inherit gnomebase pkgconfig gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
-SRC_URI[archive.sha256sum] =3D "949598861c80000febf18cc12b3721c95c1bb1d1=
9371fc2156dc4f33def5aff0"
+SRC_URI[archive.sha256sum] =3D "3e9ca821044005fb37bd68ebe4ad196fc3d07283=
5581467a22a4879dac7b5fdd"
=20
 PACKAGECONFIG ?=3D "screenshot screencast ${@bb.utils.filter('DISTRO_FEA=
TURES', 'wayland', d)}"
 PACKAGECONFIG[wayland] =3D ",,wayland-native"
--=20
2.42.1


