Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B20C0D10C16
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 07:20:51 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.25580.1730013648934939378
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Oct 2024 00:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id 31A22545B
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 08:20:42 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.173.215]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t4xZo-2iekni0; Sun, 27 Oct 2024 08:20:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/5] mutter: update 47.0 -> 47.1
Date: Sun, 27 Oct 2024 08:22:39 +0100
Message-ID: <20241027072242.381222-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241027072242.381222-1-f_l_k@t-online.de>
References: <20241027072242.381222-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1730013640-127FA40D-3C2E21D0/0/0 CLEAN NORMAL
X-TOI-MSGID: 910b8c5c-df22-474a-91d4-33489af6ead6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 07:20:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113241

47.1
=3D=3D=3D=3D
* gwakeup: Reduce wake-ups to only first item in queue [Christian; !4007]
* x11: Reduce chances XPending does recvmsg() syscall [Christian; !4006]
* Fix grabbing tablet devices [Jonas; !4033]
* Fix misplaced windows and random resizes on scaled monitors [Jonas; !40=
41]
* Fix explicit sync with virtual monitors w/o pipewire streams [Do=C4=9Fu=
kan; !4056]
* Improve detecting preferred primary devices [Kamil; !4055]
* Fixed crashes [Michel, Jonas, Daniel, Jos=C3=A9, Jason, Bilal; !4028, !=
4032,
  !4019, !4030, !4029, !4059, !4070, !4034]
* Misc. bug fixes and cleanups [Sebastian, Florian, Jonas, Jos=C3=A9, Mic=
hel;
  !4036, !4040, !4016, !3926, !4031, !4047, !4058, !4068, !3980, !3980]

Contributors:
  Jonas =C3=85dahl, Michel D=C3=A4nzer, Bilal Elmoussaoui, Jos=C3=A9 Exp=C3=
=B3sito, Jason Gerecke,
  Christian Hergert, Do=C4=9Fukan Korkmazt=C3=BCrk, Florian M=C3=BCllner,=
 Kamil Szcz=C4=99k,
  Joan Torres, Daniel van Vugt, Sebastian Wick

Translators:
  Vincent Chatelain [fr], Jordi Mas i Hernandez [ca], Daniel Mustieles [e=
s],
  J=C3=BCrgen Benvenuti [de]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/mutter/{mutter_47.0.bb =3D> mutter_47.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_47.0.bb =3D> mutter_47.1.=
bb} (97%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_47.0.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_47.1.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/mutter/mutter_47.0.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_47.1.bb
index bc9508bf2..1b49fa619 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_47.0.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_47.1.bb
@@ -24,7 +24,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gobject-introspection gettext features_check
=20
-SRC_URI[archive.sha256sum] =3D "2d0ea90150ac6cd0219d0078db05d6e1514d6ae2=
1bf9f3f740d4fb039129016b"
+SRC_URI[archive.sha256sum] =3D "905474a32cd99b34342cd69e74bb01971b387e2f=
a22361b6d99add109409ddc9"
=20
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES =3D "wayland x11 polkit"
--=20
2.47.0


