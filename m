Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A80AD10C11
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 07:20:51 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.25581.1730013648952185254
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Oct 2024 00:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id 355EB545D
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 08:20:42 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.173.215]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t4xZo-2ieknk0; Sun, 27 Oct 2024 08:20:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 4/5] gnome-shell-extensions: update 47.0 -> 47.1
Date: Sun, 27 Oct 2024 08:22:41 +0100
Message-ID: <20241027072242.381222-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241027072242.381222-1-f_l_k@t-online.de>
References: <20241027072242.381222-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1730013640-D1FF940D-71960C4F/0/0 CLEAN NORMAL
X-TOI-MSGID: 23992a21-149e-4054-9aa0-b1ad8effaa54
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 07:20:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113242

47.1
=3D=3D=3D=3D
* classic: Add missing top-bar indicators [Florian; !339]
* window-list: Fix window state styling [Florian; !342]
* window-list: Fix "ignore-workspace" setting getting reset [Florian; !34=
1]
* Misc. bug fixes and cleanups [Florian; !337, !338, !345, !347, !349]

Contributors:
  Florian M=C3=BCllner

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-shell-extensions_47.0.bb =3D> gnome-shell-extensions_47.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_47.0=
.bb =3D> gnome-shell-extensions_47.1.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_=
47.0.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_47.=
1.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_4=
7.0.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_47.=
1.bb
index d3c491b84..a47548fbb 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_47.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_47.1.bb
@@ -6,7 +6,7 @@ inherit gnomebase gettext gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam gobject-introspecti=
on-data"
=20
-SRC_URI[archive.sha256sum] =3D "50f04f7ba50eded10cea07a4705fb3363e86926d=
10011be5b25037566770834f"
+SRC_URI[archive.sha256sum] =3D "e9438cc5d39f9875dfd04ea0abb51e5962eaad5c=
20274123243b1612098b3a85"
=20
 EXTRA_OEMESON +=3D " \
     -Dextension_set=3Dall \
--=20
2.47.0


