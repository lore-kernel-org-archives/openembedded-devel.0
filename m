Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 372BFC4167B
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 06:31:30 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.5051.1699079483202911345
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 23:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout03.t-online.de (Postfix) with SMTP id E2B9F581AE
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Nov 2023 07:31:20 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.35.165]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qzABk-1LnF0U0; Sat, 4 Nov 2023 07:31:20 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] mutter: Upgrade 45.0 -> 45.1
Date: Sat,  4 Nov 2023 07:31:36 +0100
Message-ID: <20231104063136.40884-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231104063136.40884-1-f_l_k@t-online.de>
References: <20231104063136.40884-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1699079480-42563D4D-89650ECC/0/0 CLEAN NORMAL
X-TOI-MSGID: 91553794-bee9-445b-95aa-96d4ddf7c145
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 06:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106298

45.1
=3D=3D=3D=3D
* Fix filtering keybinding events in presence of grabs [Sebastian K.; !30=
54]
* Fix direct scanout support when using integer scaling [Daniel; !3290]
* Fix capitalization of some keys when caps lock is on [Carlos; !3306]
* Fix vsync regression [Robert; !3286]
* Fix visibility of software cursors when using direct scanout [Robert; !=
3302]
* Fix artifacts at the bottom of some surfaces [Robert; !3310]
* Discard monitor configs with fractional scale when unusable [Jonas =C3=85=
.; !3299]
* Apply track point settings [Rohan; !3089]
* xwayland: Enable XDG portal only when not nested [Olivier; !3303]
* Inhibit real-time scheduling when mode setting [Ray; !3324]
* Don't delay frame updates after idle period [Michel; !3174]
* Fix running Xwayland in headless setup with nvidia driver [Olivier; !33=
20]
* wayland: Send keyboard modifiers after the enter event  [Alexandros; !3=
341]
* Fixed crashes [Carlos, Jonas D., Robert, Sebastian W., Jonas =C3=85.; !=
3287, !3283,
  !3311, !3322, !3318]
* Misc. bug fixes and cleanups [Daniel, Corentin, Carlos, Jonas =C3=85., =
Ivan,
  Michel, Sebastian W., Robert, Barnab=C3=A1s, Peter; !3212, !3298, !3267=
, !3297,
  !3313, !3316, !3317, !3323, !3325, !3326, !3328, !3330, !3332, !3319]

Contributors:
  Jonas =C3=85dahl, Michel D=C3=A4nzer, Jonas Dre=C3=9Fler, Olivier Fourd=
an,
  Alexandros Frantzis, Carlos Garnacho, Peter Hutterer, Rohan Hendrik Jot=
z-Lean,
  Sebastian Keller, Robert Mader, Ivan Molodetskikh, Florian M=C3=BCllner=
,
  Corentin No=C3=ABl, Barnab=C3=A1s P=C5=91cze, Ray Strode, Daniel van Vu=
gt, Sebastian Wick

Translators:
  Kristjan SCHMIDT [eo], Rafael Fontenelle [pt_BR], Guillaume Bernard [fr=
],
  Jordi Mas i Hernandez [ca], Florentina Mu=C8=99at [ro]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/mutter/{mutter_45.0.bb =3D> mutter_45.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_45.0.bb =3D> mutter_45.1.=
bb} (97%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_45.0.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_45.1.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/mutter/mutter_45.0.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_45.1.bb
index 87d61c266..541991ba8 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_45.0.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_45.1.bb
@@ -26,7 +26,7 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings gobject-introspection gettext features_check
=20
-SRC_URI[archive.sha256sum] =3D "8fbc963019eda9ba52fca2f6c4c477efbc6e36eb=
4fa93f23174f02ff6b907715"
+SRC_URI[archive.sha256sum] =3D "2cd3c5efb22db76c79311cb1889a1aab2feb35b4=
a4dd03f3822aab7999da212c"
=20
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES =3D "wayland x11 polkit"
--=20
2.42.0


