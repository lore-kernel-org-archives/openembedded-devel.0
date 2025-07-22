Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F089AC83F34
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 17:47:44 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.20167.1753206461912180827
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Jul 2025 10:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout02.t-online.de (Postfix) with SMTP id EBAB32A208
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 19:47:39 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.113]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ueH5W-0dwDPV0; Tue, 22 Jul 2025 19:47:38 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2 1/2] gnome-shell: update 48.0 -> 48.3
Date: Tue, 22 Jul 2025 19:47:25 +0200
Message-ID: <20250722174726.14459-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1753206458-CEFFB8E0-237FEA34/0/0 CLEAN NORMAL
X-TOI-MSGID: 4be6f1bf-aeb6-4e67-9524-eb0a955261e5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 17:47:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118702

48.3
=3D=3D=3D=3D
* Check all modifiers for modifier-scroll [Florian; !3725]
* Fix visibility of emoji key in on-screen-keyboard [Carlos; !3733]
* Add missing accessibility labels in various components
  [Florian, Sergio; !3736, !3765, !3769, !3773, !3179]
* Allow users to correct keyring password after failure [Alynx; !3757]
* Misc. bug fixes and cleanups [fossdd, Jordan, Florian, Joan, Mike, Dani=
el;
  !3728, !3735, !3740, !3739, !3745, !3749, !3753, !3748, !3777, !3756]

Contributors:
  Sergio Costas Rodriguez, Mike FABIAN, fossdd, Carlos Garnacho,
  Florian M=C3=BCllner, Jordan Petridis, Joan Torres L=C3=B3pez, Daniel v=
an Vugt,
  Alynx Zhou

Translators:
  Fabio Tomat [fur], Takayuki Kusano [ja]

48.2
=3D=3D=3D=3D
* Only enable surrounding-text IM capability when needed [Takao; !3666]
* Fix launching command from terminal in run dialog [Ball=C3=B3; !3683]
* Ignore offset changes caused by suspend for screen time [Sebastian; !37=
07]
* Fix app folders sometimes not closing after outside clicks [Damien; !37=
13]
* Fixed crash [Florian; !3721]
* Misc. bug fixes and cleanups [Philipp, Alynx; !3716, !3711]

Contributors:
  Takao Fujiwara, Ball=C3=B3 Gy=C3=B6rgy, Sebastian Keller, Philipp Kieml=
e,
  Florian M=C3=BCllner, Damien Tournoud, Alynx Zhou

Translators:
  Antonio Marin [ro]

48.1
=3D=3D=3D=3D
* Fix glitch in sliders when close to maximum [Sebastian; !3648]
* Fix detecting suspend/resume for time tracking [Sebastian; !3679]
* Fix wrongly sized images with fractional scaling [Jonas; !3680]
* Fix frozen cursor when using magnifier in push mode [Jerome; !3688]
* Fix session button on login screen after wrong password [Florian; !3638=
]
* Misc. bug fixes and cleanups [Florian, Philip, Ball=C3=B3, Andy; !3673,
  !3675, !3685, !3676, !3689, !3687, !3641, !3694, !3684, !3672]

Contributors:
  Jerome Brenier, Jonas Dre=C3=9Fler, Ball=C3=B3 Gy=C3=B6rgy, Andy Holmes=
, Sebastian Keller,
  Florian M=C3=BCllner, Vasil Pupkin, Baxrom Raxmatov, Philip Withnall

Translators:
  Vasil Pupkin [be@latin], Daniel Mustieles [es], Antonio Marin [ro],
  Danial Behzadi [fa], Jose Riha [sk], Cheng-Chia Tseng [zh_TW],
  Danial Behzadi [fa], Jose Riha [sk], Cheng-Chia Tseng [zh_TW],
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-shell/{gnome-shell_48.0.bb =3D> gnome-shell_48.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_48.0.bb =3D> gn=
ome-shell_48.3.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.0.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.3.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.0.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.3.bb
index 1a0f89b6fc..33ba5eaa39 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.3.bb
@@ -33,7 +33,7 @@ GIR_MESON_OPTION =3D ""
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "36aac2edcdc7588aaadb658cd4687df262b37ba0=
b667102dcbefbff0c2232bc3"
+SRC_URI[archive.sha256sum] =3D "fb0203fc748593f14e51732618e1f042525fd719=
764a0fdb0ee3f6fe413a9b2b"
=20
 PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
 PACKAGECONFIG[bluetooth] =3D ",,gnome-bluetooth"
--=20
2.50.1


