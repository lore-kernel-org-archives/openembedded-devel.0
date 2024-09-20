Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51ED6CF9C4B
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:08:21 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.20393.1726844891931342324
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id CC9CF2E7DE
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 17:07:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfEU-3JaG0Z0; Fri, 20 Sep 2024 17:07:42 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 19/23] mutter: update 46.4 -> 47.0
Date: Fri, 20 Sep 2024 17:08:18 +0200
Message-ID: <20240920150822.1131707-19-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920150822.1131707-1-f_l_k@t-online.de>
References: <20240920150822.1131707-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1726844862-B67FA467-89EC0E16/0/0 CLEAN NORMAL
X-TOI-MSGID: 57f133ee-f04c-4dce-a9e3-f8a208e80150
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 15:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112426

47.0
=3D=3D=3D=3D
* Fix resizing of electron windows [Jonas; !3997]
* Fix using modifiers on multi-GPU setups [Jos=C3=A9; !3998]
* Don't override externally set tablet calibration [Peter; !3846]
* Add experimental support for xdg-session-manager-v1 protocol
* Fixed crashes [Peter, Sebastian, Jonas, Michel; !3959, !4000, !4003, !3=
999]
  [Jonas, Carlos, Sebastian; !3825]
* Misc. bug fixes and cleanups [Florian, Sebastian, nibon7, Peter, Simon,=
 Jonas;
  !3995, !4008, !3996, !4013, !4012, !4017, !4026]
Contributors:
  Jonas =C3=85dahl, Michel D=C3=A4nzer, Jos=C3=A9 Exp=C3=B3sito, Carlos G=
arnacho, Peter Hutterer,
  Simon McVittie, Florian M=C3=BCllner, nibon7, Sebastian Wick
Translators:
  Daniel [es], Fran Dieguez [gl], Luming Zh [zh_CN], Martin [sl],
  Yuri Chornoivan [uk], Yaron Shahrabani [he], Emin Tufan =C3=87etin [tr]=
,
  Daniel Rusek [cs], Danial Behzadi [fa], Alexander Shopov [bg],
  Anders Jonsson [sv], Ekaterine Papava [ka], Asier Sarasua Garmendia [eu=
],
  Hugo Carvalho [pt], Piotr Dr=C4=85g [pl], Aurimas =C4=8Cernius [lt], Ba=
l=C3=A1zs =C3=9Ar [hu],
  Andika Triwidada [id], Andi Chandler [en_GB], Artur S0 [ru],
  Quentin PAG=C3=88S [oc], Rafael Fontenelle [pt_BR], Ask Hjorth Larsen [=
da],
  R=C5=ABdolfs Mazurs [lv]
47.rc
=3D=3D=3D=3D=3D
* Add experimental color management protocol support
  [Sebastian W.; !3904, !3930, !3941, !3893, !3953]
* Merge Cally into Clutter [Bilal; !3917]
* Fix drag and drop between X11 and wayland clients [Carlos; !3821]
* Fix drag and drop from grabbing popups [Carlos; !3937]
* Fix EGLDevice support [Daniel; !3939]
* Improve cursor smoothness under load [Jonas =C3=85., Michel; !3184, !39=
34, !3958]
* Fix frozen cursor on some hybrid machines [Daniel; !3950]
* Fix touch window dragging with pointer lock enabled [Carlos; !3889]
* Store the layout mode in monitor config [Jonas & Jonas; !3596]
* Fix keys sometimes getting stuck after using global shortcut [Carlos; !=
3935]
* Fix propagating tablet device removals to clients [Peter; !3955]
* Fix tablet input in maximized windows [Peter; !3956]
* Reduce damage on window movement [Christian; !3975]
* Install mutter tests [Jonas =C3=85.; !3973]
* Use libadwaita for server-side decorations on GNOME [Georges; !3981]
* Fix frozen cursor after suspend [Jonas =C3=85.; !3982]
* Let scaling-aware Xwayland clients scale themselves [Jonas & Jonas; !35=
67]
* Add initial PipeWire explicit sync support [Michel, Wim; !3876]
* Trace damage reason in sysprof [Sebastian W.; !3952]
* Expose new backlight API to gnome-settings-daemon [Jonas =C3=85.; !3861=
]
* Fixed crashes [Jonas =C3=85., Daniel; !3960, !3928]
* Plugged leaks [Sebastian K.; !3994]
* Misc. bug fixes and cleanups [Bilal, Sebastian W., Jonas =C3=85., Marco=
, Daniel,
  Georges, sid, Florian, Jos=C3=A9, Sophie, Michel, Robert, Luk=C3=A1=C5=A1=
, Martin, Carlos,
  Sebastian K.; !3915, !3907, !3923, !3925, !3924, !3694, !3912, !3916, !=
3931,
  !3918, !3922, !3940, !3946, !3945, !3949, !3942, !3914, !3899, !3954, !=
3957,
  !3963, !3967, !3966, !3971, !3962, !3974, !3969, !3976, !3983, !3977, !=
3979,
  !3986, !3987, !3988, !3991, !3989, !3992]
Contributors:
  Jonas =C3=85dahl, Michel D=C3=A4nzer, Jonas Dre=C3=9Fler, Bilal Elmouss=
aoui, Jos=C3=A9 Exp=C3=B3sito,
  Carlos Garnacho, Christian Hergert, Sophie Herold, Peter Hutterer,
  Sebastian Keller, Martin Abente Lahaye, Robert Mader, Florian M=C3=BCll=
ner,
  Georges Basile Stavracas Neto, sid, Wim Taymans, Marco Trevisan (Trevi=C3=
=B1o),
  Luk=C3=A1=C5=A1 Tyrychtr, Daniel van Vugt, Sebastian Wick
Translators:
  Daniel =C8=98erb=C4=83nescu [ro], Quentin PAG=C3=88S [oc], Vasil Pupkin=
 [be]
47.beta
=3D=3D=3D=3D=3D=3D=3D
* Fix visibility of Xwayland windows [Michel; !3862]

* Add plumbing for transforming color state [Jonas; !3433]
* Build and publish GNOME OS systemd-sysext extensions [Martin; !3843]
* Implement support for tablet tool keybindings and actions [Peter; !3649=
]
* Add support for tablet tool pressure ranges [Peter; !3794]
* Improve sticky behavior with transient dialogs [Jonas; !3870]
* Improve placement and focus logic with always-on-top windows [Jonas; !3=
879]
* Expose Orientationmanager to introspection [Ivan; !3880]
* Recover from secondary GPU update failures [Daniel; !3817]
* Plugged leaks [Sebastian K.; !3884, !3888]
* Misc. bug fixes and cleanups [Carlos, Michel, Sebastian W., Pascal, Flo=
rian,
  Martin, Bilal, Daniel, Jonas, Robert; !3860, !3848, !3867, !3869, !3871=
,
  !3740, !3872, !3883, !3857, !3885, !3891, !3895, !3898, !3896, !3887, !=
3901,
  !3897, !3902, !3329, !3894, !3903, !3906, !3909, !3905, !3910]
Contributors:
  Jonas =C3=85dahl, Michel D=C3=A4nzer, Bilal Elmoussaoui, Carlos Garnach=
o,
  Peter Hutterer, Sebastian Keller, Ivan Kuzmenko, Martin Abente Lahaye,
  Robert Mader, Florian M=C3=BCllner, Pascal Nowack, Daniel van Vugt, Seb=
astian Wick
Translators:
  Chao-Hsiung Liao [zh_TW]
47.alpha
=3D=3D=3D=3D=3D=3D=3D=3D
* Fix sending preferred buffer transform [Robert; !3717]
* Fix key press events with immediate release being ignored [Carlos; !372=
1]
* Fix hardware cursor with non-atomic KMS drivers [Daniel; !3676]
* Fix night light state getting stuck on monitor changes [Michel; !3742]
* Fix unsetting clipboard on screen lock [Florian; !3752]
* Fix wrong input region of undecorated X11 windows [Sebastian K.; !3720]
* Fix windows potentially shrinking unexpectedly on configure [Jonas =C3=85=
.; !3755]
* Implement XDG dialog protocol [Carlos; !3557]
* Fix popup menus sometimes closing immediately [Jonas D.; !3631]
* Allow building without X11 support [Bilal; !3607, !3765, !3254, !3776, =
!3853]
* Emit signal when accelerator is deactivated [dcz; !3680]
* Fix wrong pointer cursor during compositor grabs [Carlos; !3736]
* Fix possible out of sync primary selections and clipboard [Carlos; !378=
9]
* Improve monitor matching when restoring windows on hotplug [Jonas =C3=85=
.; !3753]
* Add support for SIZE_HINTS cursor plane property [adarshgm; !3165]
* Fix ibus support in popups [Sebastian K.; !3787]
* Delay xdg-activation requests until window is mapped [Sebastian W.; !37=
28]
* Fix hardware accelerated rendering when headless [Jonas =C3=85.; !3805]
* Merge ClutterColor and CoglColor [Bilal; !3796, !3802, !3544]
* Fix performance issues with second virtual monitor [Jonas =C3=85.; !380=
3]
* Add back support for legacy X11 cursor themes [Daniel; !3718]
* Add support for DRM lease protocol [Sebastian W., Jonas =C3=85., Jos=C3=
=A9; !3746]
* Base test backend on native backend instead of X11 [Jonas =C3=85.; !381=
2]
* Fix missing unmap animation of some windows [Michel; !3840]
* Fix preedit offsets [Orko; !3845]
* Use character offsets to specify surrounding text [Shiki; !3719]
* Don't force titlebar on screen on all interactive resizes [Jeffrey; !37=
64]
* Fixed crashes [Carlos, Michel, Keyu, Jonas =C3=85., Sebastian K., Marco=
, Georges,
  Sebastian W.; !3715, !3725, !3711, !3758, !3763, !3749, !3732, !3729, !=
3828,
  !3783, !3849]
* Misc. bug fixes and cleanups [Mart, Florian, Marco, Jonas =C3=85., Seba=
stian W.,
  Bilal, Michel, Corentin, Georges, Philip, Daniel, Jonas D., Jos=C3=A9, =
Pascal,
  Carlos; !3716, !3723, !3727, !3735, !3731, !3378, !3700, !3743, !3750, =
!3701,
  !3757, !3754, !3748, !3759, !3761, !3762, !3730, !3737, !3771, !3775, !=
3770,
  !3768, !3781, !3782, !3784, !3788, !3791, !2959, !3792, !3265, !3801, !=
3804,
  !3795, !3693, !3793, !3800, !3115, !3806, !3809, !3810, !3816, !3811, !=
3667,
  !3799, !3823, !3818, !3813, !3814, !3807, !3827, !3826, !3831, !3829, !=
3830,
  !3798, !3833, !3836, !3837, !3835, !3820, !3822, #3540, !3842, !3851, !=
3747,
  !3790]
Contributors:
  Jonas =C3=85dahl, adarshgm, Michel D=C3=A4nzer, dcz, Jonas Dre=C3=9Fler=
, Bilal Elmoussaoui,
  Jos=C3=A9 Exp=C3=B3sito, Orko Garai, Carlos Garnacho, Sebastian Keller,=
 Jeffrey Knockel,
  Robert Mader, Florian M=C3=BCllner, Georges Basile Stavracas Neto, Core=
ntin No=C3=ABl,
  Pascal Nowack, Shiki Okasaka, Mart Raudsepp, Keyu Tao,
  Marco Trevisan (Trevi=C3=B1o), Daniel van Vugt, Sebastian Wick, Philip =
Withnall

Translators:
  Hugo Carvalho [pt], Le=C3=B4nidas Ara=C3=BAjo [pt_BR], Scrambled 777 [h=
i],
  Jose Riha [sk], =D0=9C=D0=B8=D0=BB=D0=BE=D1=88 =D0=9F=D0=BE=D0=BF=D0=BE=
=D0=B2=D0=B8=D1=9B [sr]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../mutter/{mutter_46.4.bb =3D> mutter_47.0.bb}         | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_46.4.bb =3D> mutter_47.0.=
bb} (90%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_46.4.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_47.0.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/mutter/mutter_46.4.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_47.0.bb
index c91744cf6..bc9508bf2 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_46.4.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_47.0.bb
@@ -24,7 +24,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gobject-introspection gettext features_check
=20
-SRC_URI[archive.sha256sum] =3D "611bd9cf982adb56597ce2b34224272fda619bb3=
bb912a684d75c6f2c37502e4"
+SRC_URI[archive.sha256sum] =3D "2d0ea90150ac6cd0219d0078db05d6e1514d6ae2=
1bf9f3f740d4fb039129016b"
=20
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES =3D "wayland x11 polkit"
@@ -44,16 +44,15 @@ PACKAGECONFIG ??=3D " \
 "
=20
 EXTRA_OEMESON +=3D " \
-    -Dtests=3Dfalse \
-    -Dnative_tests=3Dfalse \
+    -Dtests=3Ddisabled \
     -Dxwayland_path=3D${bindir}/Xwayland \
 "
=20
 # combi-config - see meson_options.txt for more details
 PACKAGECONFIG[native-backend] =3D "-Dnative_backend=3Dtrue -Dudev=3Dtrue=
, -Dnative_backend=3Dfalse -Dudev=3Dfalse, libdrm virtual/libgbm libinput=
 ${LOGIND} virtual/egl virtual/libgles2 udev"
-PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dtrue, virtual/lib=
gl"
+PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse, virtual/li=
bgl"
 PACKAGECONFIG[glx] =3D "-Dglx=3Dtrue, -Dglx=3Dfalse"
-PACKAGECONFIG[libdisplay-info] =3D "-Dlibdisplay_info=3Dtrue, -Dlibdispl=
ay_info=3Dfalse, libdisplay-info"
+PACKAGECONFIG[libdisplay-info] =3D "-Dlibdisplay_info=3Denabled, -Dlibdi=
splay_info=3Ddisabled, libdisplay-info"
 PACKAGECONFIG[libwacom] =3D "-Dlibwacom=3Dtrue, -Dlibwacom=3Dfalse, libw=
acom"
 # Remove depending on pipewire-0.2 when mutter is upgraded to 3.36+
 PACKAGECONFIG[remote-desktop] =3D "-Dremote_desktop=3Dtrue, -Dremote_des=
ktop=3Dfalse, pipewire"
@@ -63,7 +62,7 @@ PACKAGECONFIG[sound-player] =3D "-Dsound_player=3Dtrue,=
 -Dsound_player=3Dfalse, libcan
 PACKAGECONFIG[profiler] =3D "-Dprofiler=3Dtrue,-Dprofiler=3Dfalse,syspro=
f"
 PACKAGECONFIG[startup-notification] =3D "-Dstartup_notification=3Dtrue, =
-Dstartup_notification=3Dfalse, startup-notification, startup-notificatio=
n"
=20
-MUTTER_API_NAME =3D "mutter-14"
+MUTTER_API_NAME =3D "mutter-15"
=20
 do_install:prepend() {
     sed -i -e 's|${B}/||g' ${B}/cogl/cogl/cogl-enum-types.c
--=20
2.46.0


