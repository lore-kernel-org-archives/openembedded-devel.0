Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A613D10C08
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 07:20:51 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.25582.1730013649175330914
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Oct 2024 00:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id 337C0545C
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 08:20:42 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.173.215]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t4xZo-2ieknj0; Sun, 27 Oct 2024 08:20:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/5] gnome-shell: uodate 47.0 -> 47.1
Date: Sun, 27 Oct 2024 08:22:40 +0100
Message-ID: <20241027072242.381222-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241027072242.381222-1-f_l_k@t-online.de>
References: <20241027072242.381222-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1730013640-CBFF540D-E9D2EDB5/0/0 CLEAN NORMAL
X-TOI-MSGID: 64d0267b-1447-4696-9b81-c64e2df51d68
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 07:20:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113243

47.1
=3D=3D=3D=3D
* Improve quick settings accessibility [Luk=C3=A1=C5=A1; !3477, !3481, !3=
484, !3485]
* Use accent color in tablet configuration UI [Alice; !3480]
* Improve accuracy of inset box shadows [Daniel; !3488]
* Fix `PopupSwitchMenuItem::toggled` passing wrong state [Andrew; !3493]
* Consider text direction when handling arrow keys in sliders [Sundeep; !=
3500]
* Fix layout issues with new dialog style [Sam; !3473]
* Fix uneven padding in notification headers [Sam; !3486]
* Fixed crash [Florian; #7912]
* Misc. cleanups and bug fixes [Florian, Marco, Bilal; !3478, !3479, !349=
0,
  !3495, !3499, !3504, !3505, !3507, !3508, !3506, !3511, !3514]

Contributors:
  Bilal Elmoussaoui, Sam Hewitt, Sundeep Mediratta, Alice Mikhaylenko,
  Florian M=C3=BCllner, Marco Trevisan (Trevi=C3=B1o), Luk=C3=A1=C5=A1 Ty=
rychtr, Daniel van Vugt,
  Andrew Zaech

Translators:
  Aefgh Threenine [th], Daniel Mustieles [es]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-shell/{gnome-shell_47.0.bb =3D> gnome-shell_47.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_47.0.bb =3D> gn=
ome-shell_47.1.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.0.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.1.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.0.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.1.bb
index 3829110bf..042b3935a 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.1.bb
@@ -33,7 +33,7 @@ GIR_MESON_OPTION =3D ""
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "7a20770c6290ad69a9a82c8497cb27e1bf863f38=
7db25e98e542e4f6c5f06ded"
+SRC_URI[archive.sha256sum] =3D "b467575f8c159d20557258517f0dd68dfd0147d1=
1b48d97ab8e1f709bc522a63"
 SRC_URI +=3D "file://0001-Introduce-options-gjs_path-to-optionally-set-p=
ath-to.patch"
=20
 PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
--=20
2.47.0


