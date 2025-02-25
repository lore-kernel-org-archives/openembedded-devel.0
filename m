Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08F8C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 13:49:21 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.8168.1740491359992158823
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 05:49:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout05.t-online.de (Postfix) with SMTP id 305C912FA
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 14:49:18 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.41.232]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tmvJC-3sgT3d0; Tue, 25 Feb 2025 14:49:14 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC][meta-gnome][PATCH 5/7] mutter: update 47.5 -> 48.beta
Date: Tue, 25 Feb 2025 14:49:35 +0100
Message-ID: <20250225134937.2085793-5-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225134937.2085793-1-f_l_k@t-online.de>
References: <20250225134937.2085793-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1740491354-C346097F-D62F6467/0/0 CLEAN NORMAL
X-TOI-MSGID: e38d8efc-2659-472d-b069-454602c186e8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 13:49:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115576

- libdisplay-info is not optional anymore
- add dependencies to fix api-documentation and bash-completion

48.beta
=3D=3D=3D=3D=3D=3D=3D
* Update cursors via the frame clock in virtual monitors [Jonas; !4067]
* Synchronize device enabled state when adding device [Yao; !4188]
* Do not use modifiers if surface should be sharable [Michel; !4219]
* Add accessible state tracking in Clutter [Bilal; !4089]
* Introduce GNOME Display Control (gdctl) utility [Jonas; !4190]
* Fix notifying shell about modifier-only keyboard layout switches
  [Olivier; !4232, !4237]
* Configure HDR via DisplayConfig D-Bus API [Jonas; !4192]
* Fixed crashes [Philip, Jonas; !4222, !4210]
* Misc. bug fixes and cleanups [Michel, Sebastian W., Jonas, Jos=C3=A9, A=
lessandro,
  Sebastian K., Daniel, Philip, Carlos, Florian, Alberto, Bilal; !4208, !=
4022,
  !4005, !4218, !4225, !4229, !4228, !4231, !4223, !3972, !4233, !4234, !=
4242,
  !4198]
Contributors:
  Alessandro Astone, Michel D=C3=A4nzer, Bilal Elmoussaoui, Jos=C3=A9 Exp=
=C3=B3sito,
  Olivier Fourdan, Carlos Garnacho, Sebastian Keller, Florian M=C3=BCllne=
r,
  Alberto Ruiz, Daniel van Vugt, Yao Wei (=E9=AD=8F=E9=8A=98=E5=BB=B7), S=
ebastian Wick,
  Philip Withnall, Jonas =C3=85dahl
48.alpha
=3D=3D=3D=3D=3D=3D=3D=3D
* gwakeup: Reduce wake-ups to only first item in queue [Christian; !4007]
* x11: Reduce chances XPending does recvmsg() syscall [Christian; !4006]
* Fix grabbing tablet devices [Jonas =C3=85.; !4033]
* Improve color-management support [Joan; !3913, !3948, !4020, !4062, !41=
44]
* Fix misplaced windows and random resizes on scaled monitors [Jonas =C3=85=
.; !4041]
* Improve detecting preferred primary devices [Kamil; !4055]
* Merge CoglPango into Clutter [Bilal; !4004]
* Always depend on libdisplay-info for EDID parsing [Sebastian W.; !3602]
* Fix explicit sync with virtual monitors w/o pipewire streams [Do=C4=9Fu=
kan; !4056]
* Introspect `event` parameter in MetaKeyHandlerFunc [Guacamolie; !4079]
* Fix warping pointer after releasing pointer constraints [Sebastian K.; =
!4098]
* Avoid CPU stalls with NVIDIA secondary GPUs with directly-attached moni=
tors
  [Gert-dev; !4015]
* Fix updating cursor immediately when starting window drag [Olivier; !36=
39]
* Add pipeline hooks to user program pipelines [Sebastian W.; !4037]
* Allow to configure monitors as for-lease [Jos=C3=A9; !4112, !4121]
* Add support for system bell protocol [Jonas =C3=85.; !3675]
* Prefer GPUs with built-in panels connected as primary GPU [Mario; !4114=
]
* Add `configure` signal to allow tweaking original window configuration
  [Olivier; !4076]
* Fix cursor glitches when using virtual monitors [Jonas =C3=85.; !4066]
* Default to high thread instead of realtime priority for KMS thread
  [Jonas =C3=85.; !4124]
* Add built-in renderdoc support [Sebastian W.; !4061]
* Ensure frame events are sent for cursor surfaces [Michel; !4113]
* Allow BGRX8888 format on big endian [Jocelyn; !4088]
* Fix touchscreen drag-and-drop on wayland [Alessandro; !4091]
* Fix maximized X11 when using native Xwayland scaling [Jonas =C3=85.; !4=
147]
* Implement xdg-toplevel-drag-v1 protocol [Nick; !4107]
* Fix blank screen in remote headless sessions [Jonas =C3=85.; !4152]
* Query screen cast format modifiers via CoglRenderer [Jonas =C3=85.; !39=
00]
* Also request high priority secondary EGL context [Jonas =C3=85.; !2973]
* Fix Xwayland DND coordinates when using fractional scaling [Jonas =C3=85=
.; !4169]
* Remove ClutterImage [Bilal; !4133]
* Fix applying initial _NET_WM_WINDOW_OPACITY on Xwayland [Olivier; !4170=
]
* Implement wp_viewport support for cursor surfaces [Jonas =C3=85., Rober=
t; !3859]
* Improve input =E2=86=92 output latency of cursor movements [Michel; !39=
64]
* Make font-rendering support optional [Bilal; !4106]
* Improve frame rate on monitors attached to secondary GPUs in copy mode
  [Gert-dev; !4027]
* Add support for commit-timing-v1 and fifo-v1 protocols [Derek; !3355]
* Use BT709 coefficients and limited range for YUV conversion by default
  [Robert; !4204]
* Send preferred scales to all surface roles [Jonas =C3=85.; !4205]
* Fixed crashes [Michel, Joan, Daniel, Jos=C3=A9, Jason, Bilal, Robert, J=
onas D.,
  Peter; !4028, !4032, !4019, !4029, !4030, !4059, !4070, !4034, !3176, !=
3650,

  !4117, !4136]
* Misc. bug fixes and cleanups [Sebastian W., Florian, Joan, Jonas =C3=85=
., Jos=C3=A9,
  Christian, Robert, Marco, Michel, Bilal, Daniel, Sebastian K., Jakub, J=
onas D,
  Takao, Ikey, Georges, Carlos, Corentin, Philip, Bart=C5=82omiej; !4036,=
 !4040,
  !4042, !3965, !4016, !3926, !4031, !4011, !3424, !4047, !4049, !4058, !=
4068,
  !4048, !4071, !4074, !3980, !4078, !4080, !4035, !4075, !4090, !4093, !=
4060,
  !4069, !3961, !4101, !4057, !4104, !4105, !4108, !4109, !4077, !4111, !=
4115,
  !4116, !4087, !4018, !3943, !4123, !4122, !4103, !4064, !4100, !4065, !=
4125,
  !4128, !4127, !4129, !4126, !3604, !4150, !4161, !4162, !4160, !4137, !=
4148,
  !4166, !4157, !4156, !4158, !4168, !4149, !4165, !4155, !4174, !4163, !=
4173,
  !4175, !4176, !4131, !4132, !4179, !4178, !4130, !4180, !4177, !4184, !=
4186,
  !4189, !4187, !4197, !4199, !4194, !4181, !4200, !4196, !3878, !4201]
Contributors:
  Alessandro Astone, Georges Basile Stavracas Neto, Nick Diego Yamane,
  Ikey Doherty, Jonas Dre=C3=9Fler, Michel D=C3=A4nzer, Bilal Elmoussaoui=
,
  Jos=C3=A9 Exp=C3=B3sito, Jocelyn Falempe, Derek Foreman, Olivier Fourda=
n,
  Takao Fujiwara, Carlos Garnacho, Jason Gerecke, Gert-dev, Guacamolie,
  Christian Hergert, Peter Hutterer, Sebastian Keller, Do=C4=9Fukan Korkm=
azt=C3=BCrk,
  Mario Limonciello, Robert Mader, Florian M=C3=BCllner, Corentin No=C3=AB=
l,
  Robert Obkircher, Bart=C5=82omiej Piotrowski, Jakub Steiner, Kamil Szcz=
=C4=99k,
  Joan Torres, Marco Trevisan (Trevi=C3=B1o), Daniel van Vugt, Sebastian =
Wick,
  Philip Withnall, Jonas =C3=85dahl
Translators:
  Vincent Chatelain [fr], Jordi Mas i Hernandez [ca], Daniel Mustieles [e=
s],
  J=C3=BCrgen Benvenuti [de], Nathan Follens [nl], Danial Behzadi [fa],
  =D0=9C=D0=B0=D1=80=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D1=9B [sr=
], Scrambled 777 [hi], Cas Pascal [vi]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../mutter/{mutter_47.5.bb =3D> mutter_48.beta.bb}         | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_47.5.bb =3D> mutter_48.be=
ta.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_47.5.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_48.beta.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/mutter/mutter_47.5.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_48.beta.bb
index ca28a679cd..7abb6a5d3c 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_47.5.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_48.beta.bb
@@ -14,9 +14,12 @@ DEPENDS =3D " \
     pango \
     gsettings-desktop-schemas \
     json-glib \
+    libdisplay-info \
     libei \
     libxtst \
     libxkbfile \
+    python3-argcomplete-native \
+    python3-docutils-native \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xinerama', '', d)} \
     xwayland \
 "
@@ -24,7 +27,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gobject-introspection gettext features_check
=20
-SRC_URI[archive.sha256sum] =3D "6551a33ce887e68415b13952af6d6b430e95306f=
9297adc8c111953e995c515b"
+SRC_URI[archive.sha256sum] =3D "2e2fd6a024d4a5b0fed9a34f4ca25fc9505fe84f=
04da0cd5dc901b70d868ba31"
=20
 SRC_URI +=3D "file://0001-Dont-use-system-sysprof-dbus-folder.patch"
=20
@@ -54,7 +57,6 @@ EXTRA_OEMESON +=3D " \
 PACKAGECONFIG[native-backend] =3D "-Dnative_backend=3Dtrue -Dudev=3Dtrue=
, -Dnative_backend=3Dfalse -Dudev=3Dfalse, libdrm virtual/libgbm libinput=
 ${LOGIND} virtual/egl virtual/libgles2 udev"
 PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse, virtual/li=
bgl"
 PACKAGECONFIG[glx] =3D "-Dglx=3Dtrue, -Dglx=3Dfalse"
-PACKAGECONFIG[libdisplay-info] =3D "-Dlibdisplay_info=3Denabled, -Dlibdi=
splay_info=3Ddisabled, libdisplay-info"
 PACKAGECONFIG[libwacom] =3D "-Dlibwacom=3Dtrue, -Dlibwacom=3Dfalse, libw=
acom"
 # Remove depending on pipewire-0.2 when mutter is upgraded to 3.36+
 PACKAGECONFIG[remote-desktop] =3D "-Dremote_desktop=3Dtrue, -Dremote_des=
ktop=3Dfalse, pipewire"
@@ -64,7 +66,7 @@ PACKAGECONFIG[sound-player] =3D "-Dsound_player=3Dtrue,=
 -Dsound_player=3Dfalse, libcan
 PACKAGECONFIG[profiler] =3D "-Dprofiler=3Dtrue,-Dprofiler=3Dfalse,syspro=
f"
 PACKAGECONFIG[startup-notification] =3D "-Dstartup_notification=3Dtrue, =
-Dstartup_notification=3Dfalse, startup-notification, startup-notificatio=
n"
=20
-MUTTER_API_NAME =3D "mutter-15"
+MUTTER_API_NAME =3D "mutter-16"
=20
 do_install:prepend() {
     sed -i -e 's|${B}/||g' ${B}/cogl/cogl/cogl-enum-types.c
@@ -88,6 +90,7 @@ GSETTINGS_PACKAGE =3D "${PN}-gsettings"
 PACKAGES =3D+ "${PN}-tests ${PN}-gsettings"
=20
 FILES:${PN} +=3D " \
+    ${datadir}/bash-completion \
     ${datadir}/gnome-control-center \
     ${datadir}/gir-1.0 \
     ${libdir}/${MUTTER_API_NAME}/lib*${SOLIBS} \
--=20
2.48.1


