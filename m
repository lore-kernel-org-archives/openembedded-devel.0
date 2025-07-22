Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF913C83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 17:47:44 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.20030.1753206461950092548
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jul 2025 10:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout02.t-online.de (Postfix) with SMTP id ED61B2A425
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 19:47:39 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.113]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ueH5W-0dwDPW0; Tue, 22 Jul 2025 19:47:38 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2 2/2] gnome-shell-extensions: update 48.0 -> 48.3
Date: Tue, 22 Jul 2025 19:47:26 +0200
Message-ID: <20250722174726.14459-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722174726.14459-1-f_l_k@t-online.de>
References: <20250722174726.14459-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1753206458-7FFFD8E0-89E4B31F/0/0 CLEAN NORMAL
X-TOI-MSGID: fab0d6bb-15c6-4f96-a631-773ae6bb4176
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 17:47:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118703

48.3
=3D=3D=3D=3D
* Misc. bug fixes and cleanups [Florian; !409, !411, !405, !413]
Contributors:
  Florian M=C3=BCllner
48.2
=3D=3D=3D=3D
* windowsNavigator: Fix handling keyboard shortcuts [Daniel; !395]
* build: Allow disabling the X11 session [Neal; !396, !400]
Contributors:
  Daniel Buch Hansen, Neal Gompa
48.1
=3D=3D=3D=3D
Translators:
  Hugo Carvalho [pt], Danial Behzadi [fa]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-shell-extensions_48.0.bb =3D> gnome-shell-extensions_48.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_48.0=
.bb =3D> gnome-shell-extensions_48.3.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_=
48.0.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_48.=
3.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_4=
8.0.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_48.=
3.bb
index f2f3e8654d..5537b3521e 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_48.3.bb
@@ -6,7 +6,7 @@ inherit gnomebase gettext gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam gobject-introspecti=
on-data"
=20
-SRC_URI[archive.sha256sum] =3D "f301b5e7354d5adc01c8bb21793810074e1ea408=
de45300f767d104454db3e33"
+SRC_URI[archive.sha256sum] =3D "adde34c08f40b63411be6f1d17e235550a009049=
4871e6481c312989d7f4a2d4"
=20
 EXTRA_OEMESON +=3D " \
     -Dextension_set=3Dall \
--=20
2.50.1


