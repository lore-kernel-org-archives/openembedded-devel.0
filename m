Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F70AE77182
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 08:07:13 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.5738.1733904423823455889
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Dec 2024 00:07:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout05.t-online.de (Postfix) with SMTP id CF946AE4
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 09:07:01 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.33.231]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tLHkL-0OXTbW0; Wed, 11 Dec 2024 09:07:01 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/4] mutter: update 47.1 -> 47.3
Date: Wed, 11 Dec 2024 09:06:58 +0100
Message-ID: <20241211080700.104771-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241211080700.104771-1-f_l_k@t-online.de>
References: <20241211080700.104771-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1733904421-D9FF886F-0F206712/0/0 CLEAN NORMAL
X-TOI-MSGID: 43beae5b-0523-4e31-be49-0fa6794cd1ac
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 08:07:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114271

47.3
=3D=3D=3D=3D
* Fix maximized X11 when using native xwayland scaling [Jonas; !4147]
* Fix blank screen in remote headless sessions [Jonas; !4152]
* Fix touch-triggered popups being cancelled too early [Carlos; !4166]
* Fix pointer cursor during compositor grabs [Carlos; !4166]
* Fixed crash [Michel; !4148]

Contributors:
  Michel D=C3=A4nzer, Jonas =C3=85dahl, Carlos Garnacho

47.2
=3D=3D=3D=3D
* Fix warping pointer after releasing pointer constraints [Sebastian K.; =
!4098]
* Default to high thread instead of realtime priority for KMS thread
  [Jonas =C3=85.; !4124]
* Avoid CPU stalls with NVIDIA secondary GPUs with directly-attached moni=
tors
  [Gert-dev; !4015]
* Fix updating cursor immediately when starting window drag [Olivier; !36=
39]
* Add pipeline hooks to user program pipelines [Sebastian W.; !4037]
* Prefer GPUs with built-in panels connected as primary GPU [Mario; !4114=
]
* Fix cursor glitches when using virtual monitors [Jonas =C3=85.; !4066]
* Ensure frame events are sent for cursor surfaces [Michel; !4113]
* Allow BGRX8888 format on big endian [Jocelyn; !4088]
* Fix touchscreen drag-and-drop on wayland [Alessandro; !4091]
* Fixed crashes [Robert, Jonas D., Peter, Michel; !3176, !3650, !4117, !4=
136]
* Misc. bug fixes and cleanups [Bilal, Michel, Jos=C3=A9, Sebastian W., J=
onas =C3=85.,
  Takao; !4087, !4057, !4109, !4116, !4123, !4064, !4065, !4128, !3604]

Contributors:
  Alessandro Astone, Jonas Dre=C3=9Fler, Michel D=C3=A4nzer, Bilal Elmous=
saoui,
  Jos=C3=A9 Exp=C3=B3sito, Jocelyn Falempe, Olivier Fourdan, Takao Fujiwa=
ra, Gert-dev,
  Peter Hutterer, Sebastian Keller, Mario Limonciello, Robert Obkircher,
  Sebastian Wick, Jonas =C3=85dahl

Translators:
  Christian Kirbach [de], Nathan Follens [nl], Danial Behzadi [fa],
  =D0=9C=D0=B0=D1=80=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D1=9B [sr=
]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/mutter/{mutter_47.1.bb =3D> mutter_47.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_47.1.bb =3D> mutter_47.3.=
bb} (97%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_47.1.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_47.3.bb
similarity index 97%
rename from meta-gnome/recipes-gnome/mutter/mutter_47.1.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_47.3.bb
index 1b49fa619..75129342a 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_47.1.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_47.3.bb
@@ -24,7 +24,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gobject-introspection gettext features_check
=20
-SRC_URI[archive.sha256sum] =3D "905474a32cd99b34342cd69e74bb01971b387e2f=
a22361b6d99add109409ddc9"
+SRC_URI[archive.sha256sum] =3D "76421af6f90509cfdf1ab851d5ee58271e27e94a=
a8f7db521d5aa06daea6c560"
=20
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES =3D "wayland x11 polkit"
--=20
2.47.0


