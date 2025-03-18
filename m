Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3913C36003
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 08:34:13 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.6800.1742286843267180599
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Mar 2025 01:34:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout05.t-online.de (Postfix) with SMTP id 3E4DC154E;
	Tue, 18 Mar 2025 09:33:50 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.234.59]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tuSOS-2EPvLp0; Tue, 18 Mar 2025 09:33:48 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 05/11] gnome-shell: update 47.3 -> 48.0
Date: Tue, 18 Mar 2025 09:34:24 +0100
Message-ID: <20250318083430.544906-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318083430.544906-1-f_l_k@t-online.de>
References: <20250318083430.544906-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1742286828-B0FF7450-1AD2C4BE/0/0 CLEAN NORMAL
X-TOI-MSGID: 300202b9-0801-4d7a-b8db-eed458f02145
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 08:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116044

48.0
=3D=3D=3D=3D
* Fix ibus candidate popup position [Peng; !3659]
* breakManager: Allow break to be taken or delayed when overdue [Philip; =
!3656]
* Fix audio selection dialog in light style [Laria; !3665]
* Misc. bug fixes and cleanups [Philip, Simon, Daniel, Florian, Jonas; !3=
655,
  !3662, !3664, !3669, !3667, !3670]

Contributors:
  Laria Carolin Chabowski, Simon McVittie, Florian M=C3=BCllner, Daniel v=
an Vugt,
  Philip Withnall, Peng Wu, Jonas =C3=85dahl

Translators:
  Yuri Chornoivan [uk], Alexander Shopov [bg], Daniel Rusek [cs],
  Luming Zh [zh_CN], Changwoo Ryu [ko], Artur S0 [ru], Ekaterine Papava [=
ka],
  Martin [sl], Daniel Mustieles [es], Artur Miranda [pt_BR], Hugo Carvalh=
o [pt],
  Piotr Dr=C4=85g [pl], Bal=C3=A1zs =C3=9Ar [hu], Vasil Pupkin [be], Quen=
tin PAG=C3=88S [oc],
  Jordi Mas i Hernandez [ca], Fran Dieguez [gl], Aurimas =C4=8Cernius [lt=
],
  Ask Hjorth Larsen [da], Asier Saratsua Garmendia [eu], Anders Jonsson [=
sv],
  Sabri =C3=9Cnal [tr], Yosef Or Boczko [he], Andika Triwidada [id],
  Brage Fuglseth [nb], A S Alam [pa], Bruce Cowan [en_GB], Cas Pascal [vi=
],
  Ir=C3=A9n=C3=A9e THIRION [fr]

48.rc
=3D=3D=3D=3D=3D
* Fix integer scaling for spinner [Daniel v. V.; !3634]
* Group notifications by app [Julian; !3012]
* Fix tracking inactive time for screen time limits [Florian; !3636]
* Fix occasional stacking glitch during overview transition [Keyu; !3460]
* Reorganize default dash/grid/folder apps [Florian, Allan; !3642]
* Handle suspend/resume when tracking screen time [Philip; !3643]
* Misc. bug fixes and cleanups [Marco, Florian, Sebastian, Daniel R.,
  Alessandro; !3629, !3630, !3631] !3620, !3637, !3635, !3632, !3616, !36=
33,
  !3639, !3649, !3646, !3647, !3651]
Contributors:
  Alessandro Astone, Allan Day, Florian M=C3=BCllner, Daniel Rusek, Julia=
n Sparber,
  Keyu Tao, Marco Trevisan (Trevi=C3=B1o), Daniel van Vugt, Sebastian Wic=
k,
  Philip Withnall
Translators:
  Cheng-Chia Tseng [zh_TW], Jordi Mas i Hernandez [ca], Sabri =C3=9Cnal [=
tr],
  Jordi Mas [ca], Aurimas =C4=8Cernius [lt], Piotr Dr=C4=85g [pl], Aefgh =
Threenine [th],
  Ekaterine Papava [ka], Andika Triwidada [id], Daniel Rusek [cs],
  Danial Behzadi [fa], Yuri Chornoivan [uk], Asier Sarasua Garmendia [eu]=
,
  Yosef Or Boczko [he], twlvnn kraftwerk [bg], Quentin PAG=C3=88S [oc],
  Luming Zh [zh_CN], Jiri Gr=C3=B6nroos [fi], Hugo Carvalho [pt], Fran Di=
eguez [gl],
  A S Alam [pa], Brage Fuglseth [nb], Giannis Antypas [el]

48.beta
=3D=3D=3D=3D=3D=3D=3D
* Fix overlapping tiles in app grid on hover [Sam; !3551]
* Improve screen time limit support
  [Philip, Florian; !3597, !3603, !3604, !3606]
* Fix default user avatar with light stsyle [Sam; !3596]
* Transition to new BoxLayout.orientation property
  [Florian, Carlos; !3614, !3618]
* Allow tracking screen time history with no limit set [Philip; !3610]
* Fix Extensions app losing state after shell restart [Florian; !3463]
* Support loading login banner message from file [Florian; !3558]
* Misc. bug fixes and cleanups [Florian, Daniel, Bilal, Philip, Adam, Car=
los,
  Julian; !3600, !3601, !3528, !3510, !3605, !3607, !3609, !3613, !3615, =
!3598,
  !3617, !3599, !3612, !3621, !3619, !3429, !3627]
Contributors:
  Bilal Elmoussaoui, Carlos Garnacho, Sam Hewitt, Florian M=C3=BCllner,
  Julian Sparber, Daniel van Vugt, Adam Williamson, Philip Withnall
Translators:
  Rafael Fontenelle [pt_BR], Artur S0 [ru], Quentin PAG=C3=88S [oc],
  Emilio Sep=C3=BAlveda [ia], Martin [sl], Philipp Kiemle [de]
48.alpha
=3D=3D=3D=3D=3D=3D=3D=3D
* Improve quick settings accessibility [Luk=C3=A1=C5=A1; !3477, !3481, !3=
484, !3485]
* Use accent color in tablet configuration UI [Alice; !3480]
* Improve accuracy of inset box shadows [Daniel; !3488]
* Fix `PopupSwitchMenuItem::toggled` passing wrong state [Andrew; !3493]
* Consider text direction when handling arrow keys in sliders [Sundeep; !=
3500]
* Fix layout issues with new dialog style [Sam; !3473]
* Fix uneven padding in notification headers [Sam; !3486]
* Fix graphical artifacts in partially-rounded buttons [Sebastian; #7996]
* Do not depend on gnome-menus for folder translations [Pablo; !3526]
* Fix caret tracking in magnifier [Bilal; !3522]
* Show OSD notification for headphone connection [Sundeep; !3531]
* Improve accessibility of keyboard backlight quick settings toggle
  [Luk=C3=A1=C5=A1, Florian; !3538, !3545]
* Fix resetting non-caps shift key in on-screen keyboard [Jonas; !3286]
* Improve contrast of notification placeholder [Sam; !3557]
* Add support for screen time / health breaks [Philip; !3251]
* Add sysext support to toolbox tooling [Florian; !3498]
* Modernize spinner [Florian; !3565]
* extensions-app: Allow closing with ctrl+w [Maximiliano; !3577]
* Fix Escape handling in run dialog [Florian; !3585]
* Fix custom text-scaling-factor getting reset [Matthijs; !3574]
* Tweak ibus candidate popover appearance [AuralRay; !3584]
* Add convenience logging API for extensions [Florian; !3586]
* Improve on-screen keyboard appearance [Sam; !3555, !3553]
* Tweak quick settings appearance [Sam; !3554]
* Add support for screen time limits [Philip; !3397]
* Fixed crash [Florian; !3476]
* Misc. bug fixes and cleanups [Florian, Robert, Bilal, Marco, Guacamolie=
,
  Automeris, Daniel, Jonas, Georges, Michel, Bart=C5=82omiej, Alberto, As=
ciiWolf,
  Jakub, Sam; !3478, !3479, !3482, !3490, !3099, !3494, !3495, !3497, !34=
99,
  !3504, !3503, !3502, !3505, !3507, !3508, !3506, !3379, !3511, !3514, !=
3515,
  !3519, !3520, !3518, !3521, !3524, !3527, !3501, !3529, !3535, !3532, !=
3542,
  !3540, !3543, !3541, !3549, !3548, !3539, !3563, !3567, !3569, !3570, !=
3547,
  !3573, !3525, !3546, !3575, !3572, !3544, !3580, !3578, !3576, !3579, !=
3589,
  !3587, !3552, !3593]
Contributors:
  AsciiWolf, AuralRay, Georges Basile Stavracas Neto, Pablo Correa G=C3=B3=
mez,
  Jonas Dre=C3=9Fler, Michel D=C3=A4nzer, Bilal Elmoussaoui, Guacamolie, =
Sam Hewitt,
  Sebastian Keller, Robert Mader, Sundeep Mediratta, Alice Mikhaylenko,
  Florian M=C3=BCllner, Bogi Napoleon Wennerstr=C3=B6m, Automeris naranja=
,
  Bart=C5=82omiej Piotrowski, Alberto Ruiz, Daniel Rusek, Maximiliano San=
doval,
  Jakub Steiner, Marco Trevisan (Trevi=C3=B1o), Luk=C3=A1=C5=A1 Tyrychtr,=
 Daniel van Vugt,
  Matthijs Velsink, Philip Withnall, Andrew Zaech
Translators:

  Aefgh Threenine [th], Daniel Mustieles [es], Mahdi Hasan [bn],
  Brage Fuglseth [nb], Athmane MOKRAOUI [kab], Fabio Tomat [fur],
  Bogi Napoleon Wennerstr=C3=B6m [fo], Martin [sl], Emilio Sep=C3=BAlveda=
 [ia],
  Vasil Pupkin [be], Nathan Follens [nl], Artur S0 [ru],
  =D0=9C=D0=B0=D1=80=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D1=9B [sr=
], Yaron Shahrabani [he], Cas Pascal [vi],
  Sabri =C3=9Cnal [tr]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...shell-extensions_47.3.bb =3D> gnome-shell-extensions_48.0.bb} | 2 +-
 .../gnome-shell/{gnome-shell_47.3.bb =3D> gnome-shell_48.0.bb}   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_47.3=
.bb =3D> gnome-shell-extensions_48.0.bb} (84%)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_47.3.bb =3D> gn=
ome-shell_48.0.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_=
47.3.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_48.=
0.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_4=
7.3.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_48.=
0.bb
index 151e57e887..f2f3e8654d 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_47.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_48.0.bb
@@ -6,7 +6,7 @@ inherit gnomebase gettext gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam gobject-introspecti=
on-data"
=20
-SRC_URI[archive.sha256sum] =3D "1a9142a4e85d7a2b7dc5bad37e34df9eebb38e84=
96f4938be2d7b2b35883d139"
+SRC_URI[archive.sha256sum] =3D "f301b5e7354d5adc01c8bb21793810074e1ea408=
de45300f767d104454db3e33"
=20
 EXTRA_OEMESON +=3D " \
     -Dextension_set=3Dall \
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.3.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.0.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.3.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.0.bb
index b3fba01eee..1a0f89b6fc 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_47.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.0.bb
@@ -33,7 +33,7 @@ GIR_MESON_OPTION =3D ""
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "783deb9a086511e4a53db10574bfbba695576f69=
8078218ca6c80cb1efec293e"
+SRC_URI[archive.sha256sum] =3D "36aac2edcdc7588aaadb658cd4687df262b37ba0=
b667102dcbefbff0c2232bc3"
=20
 PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
 PACKAGECONFIG[bluetooth] =3D ",,gnome-bluetooth"
@@ -67,6 +67,7 @@ FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
     ${datadir}/gnome-control-center \
     ${datadir}/xdg-desktop-portal \
+    ${datadir}/desktop-directories \
     ${systemd_user_unitdir} \
 "
=20
--=20
2.48.1


