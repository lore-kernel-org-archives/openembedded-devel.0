Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D376FF3C245
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 12:16:35 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12796.1773058585045214808
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 05:16:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout08.t-online.de (Postfix) with SMTP id B9C15F1D9
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Mar 2026 13:16:22 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.45.136]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vzZX4-4cfD500; Mon, 9 Mar 2026 13:16:22 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] gnome-shell: update 48.3 -> 48.7
Date: Mon,  9 Mar 2026 13:16:09 +0100
Message-ID: <20260309121609.6867-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309121609.6867-1-f_l_k@t-online.de>
References: <20260309121609.6867-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1773058582-DD7F26FB-6C047D4F/0/0 CLEAN NORMAL
X-TOI-MSGID: baaac2d4-a0f9-4fc0-9939-ed539ea41e7c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 12:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124996

48.7
=3D=3D=3D=3D
* Fix wrong network icon on connectivity loss [Antoine; !3910]
* Sort session list on login screen by display name [Ball=C3=B3; !3920]
* Add extended OSK layouts for German and Austrian [Leonidas; !3923]
* Fix leaving VPN auth helper zombie processes [Michael; !3926]
* Fix freeze on modifier-only layout switch shortcut [Sebastian; !3939]
* Fix glitch in list search results [Florian; !3951]
* Fix swipe gestures behaving erroneously in RTL locales [Florian; !3967]
* Fix misplaced separator in dash after unpinning running app [Raghuveer;=
 !1973]
* Fixed crash [Sebastian; !3933]
* Misc. bug fixes and cleanups [Sebastian, Leonidas, Florian, Jonas,
  ClarityStorm, Alessandro, Marco, Adrian, Carlos; !3922, !3925, !3931, !=
3927,
  !3932, !3924, !3937, !3940, !3942, !3946, !3943, !3950, !3708, !3917, !=
3971]

Contributors:
  Leonidas Adaktylos, Alessandro Bono, Michael Catanzaro, ClarityStorm,
  Carlos Garnacho, Ball=C3=B3 Gy=C3=B6rgy, Raghuveer Kasaraneni, Sebastia=
n Keller,
  Antoine Lassagne, Florian M=C3=BCllner, Marco Trevisan (Trevi=C3=B1o), =
Adrian Vovk,
  Jonas =C3=85dahl

Translators:
  Antonio Marin [ro]

48.6
=3D=3D=3D=3D
* Fix key focus on choice list on login screen [Marco; !3849]
* Fix animation glitch when cancelling overview search [Noam; !3888]
* Also send activation token for notifications without app [Marco; !3891]
* Update keyboard indicator on modifier-only layout switches [Carlos; !38=
95]
* Improve accessibility of screenshot UI [Luk=C3=A1=C5=A1; !3908]
* Improve Hindi bolnagri input with on-screen keyboard [Mike; !3911]
* Do not expire notifications that are about to show [Marco; !3905]
* Misc. bug fixes and cleanups [SimonMaracine, Daniel, Marco; !3894, !389=
2,
  !3907, !3904]

Contributors:
  Mike FABIAN, Carlos Garnacho, Noam Raz, SimonMaracine,
  Marco Trevisan (Trevi=C3=B1o), Luk=C3=A1=C5=A1 Tyrychtr, Daniel van Vug=
t

Translators:
  Abduqadir Abliz [ug]

48.5
=3D=3D=3D=3D
* Fix connecting to WPA(2) Enterprise networks [Mitchell; !3834]
* Improve order in which extensions are enabled/disabled [Kyrill; !3835]
* Account for scaling when setting cursor location from ibus [Takao; !372=
9]
* Do not reset the unlock prompt on every tap [Marco; !3852]
* Improve legacy tray icon support [Marco; !3818]
* Fix misplaced background menu [Jonas; !3863]
* Fix layout of app search results in RTL locales [Khalid; !3851]
* Fix notification banners sometimes getting stuck [everyx; !3861]
* Fixed crashes [Johannes, Daniel, Jonas, Alessandro; !3839, !3809, !3872=
]
* Plugged leak [Sebastian; !3854]
* Misc. bug fixes and cleanups [Michael, Marco, Philip, Jonas; !3813, !38=
46,
  !3853, !3220, !3850, !3855, !3869]

Contributors:
  Khalid Abu Shawarib, Alessandro Astone, Mitchell Augustin, Michael Cata=
nzaro,
  Jonas Dre=C3=9Fler, everyx, Takao Fujiwara, Sebastian Keller, Johannes =
Maibaum,
  Marco Trevisan (Trevi=C3=B1o), Daniel van Vugt, Philip Withnall, Kyrill=
 Zorin,
  Jonas =C3=85dahl

Translators:
  Cheng-Chia Tseng [zh_TW], Philipp Kiemle [de], Aefgh Threenine [th],
  Jiri Gr=C3=B6nroos [fi]

48.4
=3D=3D=3D=3D
* Fix taking interactive screenshots via D-Bus [Florian; !3803]
* Fix pointer scaling glitches in magnifier [Marco; !475]
* Fix drawing glitch in sliders in RTL locales [Sebastian, Khalid; !3817]
* Misc. bug fixes and cleanups [Marco, Sebastian, Florian, Mike, Jonas; !=
3785,
  !3798, !3799, !3816, !3796, !3750]

Contributors:
  Khalid Abu Shawarib, Jonas Dre=C3=9Fler, Mike FABIAN, Sebastian Keller,
  Florian M=C3=BCllner, Marco Trevisan (Trevi=C3=B1o)

Translators:
  Aefgh Threenine [th]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-shell/{gnome-shell_48.3.bb =3D> gnome-shell_48.7.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_48.3.bb =3D> gn=
ome-shell_48.7.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.3.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.7.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.3.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.7.bb
index 802a6948ae..3f668fe410 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.7.bb
@@ -34,7 +34,7 @@ GIR_MESON_OPTION =3D ""
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
 SRC_URI +=3D "file://0001-shell-app-usage.c-only-include-x11-headers-if-=
HAVE_X.patch"
-SRC_URI[archive.sha256sum] =3D "fb0203fc748593f14e51732618e1f042525fd719=
764a0fdb0ee3f6fe413a9b2b"
+SRC_URI[archive.sha256sum] =3D "2dff328d5f7e29f8c897bc21caac7d2d443be3c6=
3ae84d7623dec800f23493c3"
=20
 PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
 PACKAGECONFIG[bluetooth] =3D ",,gnome-bluetooth"
@@ -76,7 +76,7 @@ RDEPENDS:${PN} +=3D " \
 	accountsservice \
 	adwaita-icon-theme \
 	adwaita-icon-theme-cursors \
-	gdm-base \
+	gdm \
 	gnome-control-center \
 	gnome-backgrounds \
 	gnome-bluetooth \
--=20
2.53.0


