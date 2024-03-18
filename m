Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1494C54E68
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 01:21:20 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.33225.1710724873623673827
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Mar 2024 18:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout10.t-online.de (Postfix) with SMTP id 4C81B8D74
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 02:21:11 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.38.150]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rm1ga-20evdh0; Mon, 18 Mar 2024 02:21:08 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/3] mutter: update 45.4 -> 46.0
Date: Mon, 18 Mar 2024 02:21:24 +0100
Message-ID: <20240318012126.1924855-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1710724868-3DA409FB-41E498A1/0/0 CLEAN NORMAL
X-TOI-MSGID: bfa450da-e5e8-4fbb-a960-89b6c04e5f6e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 01:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109393

46.0
=3D=3D=3D=3D
* Fix duplicate scroll events over libei [Peter; !3637]
* Fix window menu with mouse button modifier [Jonas; !3623]
* Fix caret offset in accessible event [Carlos; !3643]
* Fix handling of scroll events for mice [Carlos; !3642]
* Use timerfd for clock timing [Christian; !3636]
* Advertise support for BGRA for all screencast types [Robert; !3617]
* Add support for preferred_buffer_scale/transform [Robert; !3580]
* Use memfd to store selection data [Yotam; !3551]
* Fix globally active input focus [Sebastian K.; !3651]
* Call malloc_trim() after loading background image [Sebastian K.; !3653]
* Fix dynamic max render time sometimes getting stuck on constant framera=
te
  [Robert; !3655]
* Introduce base of new gesture framework [Jonas; !2389]
* Work around windows missing work area changes [Ball=C3=B3; !3601]
* Fix black screen with some drivers [Sebastian W.; !3646]
* Improve login screen <-> session transition [Jocelyn; !3659]
* Fixed crashes [Bilal, Carlos; !3656, !3660]
* Misc. bug fixes and cleanups [Philip, Peter, Sebastian W., Zander, Petr=
,
  Sebastian K., Robert, Bilal, Jonas; !3640, !3647, !3648, !3654, !3658, =
!3622,
  !1918, !3067, !3661, !3662, !3652, !3645]

Contributors:
  Yotam Bar-On, Zander Brown, Jonas Dre=C3=9Fler, Bilal Elmoussaoui, Joce=
lyn Falempe,
  Carlos Garnacho, Ball=C3=B3 Gy=C3=B6rgy, Christian Hergert, Petr Hodina=
, Peter Hutterer,
  Sebastian Keller, Robert Mader, Sebastian Wick, Philip Withnall

Translators:
  Sabri =C3=9Cnal [tr], Aurimas =C4=8Cernius [lt], Jordi Mas i Hernandez =
[ca],
  Asier Sarasua Garmendia [eu], Matej Urban=C4=8Di=C4=8D [sl], Anders Jon=
sson [sv],
  Bruce Cowan [en_GB], Guillaume Bernard [fr], Kukuh Syafaat [id],
  Milo Casagrande [it], R=C5=ABdolfs Mazurs [lv], Fran Dieguez [gl],
  Ask Hjorth Larsen [da]

46.rc
=3D=3D=3D=3D=3D
* screencast: Renegotiate when DMABUF allocation fails [columbarius; !255=
7]
* Unify wayland pointer- and keyboard grab mechanisms [Carlos; !3420]
* Add modifier-aware screencasting support [Do=C4=9Fukan; !3537]
* Fix synchronization issue on Xorg [Daniel; !3590]
* Send fractional_scale event immediately on window creation [Jonas; !359=
8]
* wayland/client: Add make_dock() method [Leonhard; !3612]
* Fix gray area on top of some X11 fullscreen windows [Sebastian K.; !360=
8]
* Stick dragged windows to the right anchor point [Carlos; !3546]
* cally/text: Fix emission of `text_caret_moved` signal [Florian; !3621]
* clutter/text: Fix minimum height calculation [Julian; !3610]
* Add experimental support for variable refresh rate [Dor; !1154]
* Expose the minimum refresh rate of monitors through D-Bus [Dor; !3576]
* Use "default" cursor for moving windows [Sebastian K.; !3634]
* Fixed crashes [Carlos, Michel; !3618, !3632]
* Misc. bug fixes and cleanups [Robert, Bilal, Dor, Florian, Sebastian W.=
,
  Daniel, msizanoen, Corentin, Agust=C3=ADn, Sebastian K., Marco, Do=C4=9F=
ukan, Carlos,
  Jonas, Barnab=C3=A1s; !3217, !3581, !3582, !3583, !3586, !3574, !3587, =
!3585,
  !3584, !3588, !3553, !3589, !3593, !3595, !3597, !3599, !3327, !3603, !=
3606,
  !3594, !3611, !3613, !3552, !3620, !3592, !3614, !3619, !3625, !3628, !=
3627,
  !3624, !3629, !3630, !3633, !3027]

Contributors:
  Dor Askayo, columbarius, Agust=C3=ADn Dall'Alba, Michel D=C3=A4nzer, Jo=
nas Dre=C3=9Fler,
  Bilal Elmoussaoui, Carlos Garnacho, Sebastian Keller, Do=C4=9Fukan Kork=
mazt=C3=BCrk,
  Leonhard, Robert Mader, msizanoen, Florian M=C3=BCllner, Corentin No=C3=
=ABl,
  Barnab=C3=A1s P=C5=91cze, Julian Sparber, Marco Trevisan (Trevi=C3=B1o)=
, Daniel van Vugt,
  Sebastian Wick

Translators:
  Ekaterine Papava [ka], Danial Behzadi [fa], Aurimas =C4=8Cernius [lt],
  Yuri Chornoivan [uk], Yaron Shahrabani [he], Nathan Follens [nl],
  Matej Urban=C4=8Di=C4=8D [sl], Jordi Mas i Hernandez [ca], Kukuh Syafaa=
t [id],
  Luming Zh [zh_CN], Andi Chandler [en_GB], Asier Sarasua Garmendia [eu],
  Quentin PAG=C3=88S [oc], R=C5=ABdolfs Mazurs [lv], Ir=C3=A9n=C3=A9e THI=
RION [fr],
  Daniel Mustieles [es], Daniel Rusek [cs], Piotr Dr=C4=85g [pl], Bal=C3=A1=
zs =C3=9Ar [hu],
  Artur S0 [ru]

46.beta
=3D=3D=3D=3D=3D=3D=3D
* Implement mouse cursor hotspots for KMS atomic [Albert, Zack; !3337, !3=
503]
* Improve project and development documentation
  [Bilal, Sebastian W.; !3489, !3505, !3519]
* Add a documentation website [Bilal; !3490]
* Refactor wayland focus management [Carlos; !3511]
* Remove experimental rt-scheduler feature [Dallas; !3296]
* Remove ClutterCanvas [Shmuel; !3470]
* Consider reduced blanking with lower pixelclock [Kai-Heng; !3449]
* Fix centering non-modal transients over parent [Florian; !3533]
* Allow XKB model to be configured [Leorize; !2760]
* Enable KMS deadline timer after a VT switch if it was inhibited [Dor; !=
3534]
* Prepare for variable refresh rate support [Dor; !3521, !3560, !3561]
* Restore IM state flushing before handling key events [Carlos; !3536]
* Swap stylus buttons to match traditional order [Peter; !3541]
* Fix handling of pad ring wrap arounds [Peter; !3545]
* Support Broadcast RGB/RGB range KMS property [Sebastian W.; !3535]
* Ensure all planes support EGL config format [Sebastian W.; !3512]
* Handle Alt modifier in pad actions [Peter; !3522]
* Store eraser and stylus tools separately [Peter; !3542]
* Disambiguate output mapped to tablet with connector name [Carlos; !3556=
]
* Fix lost keyboard focus after dismissing popups [Carlos; !3568]
* Implement direct scanout for cropped and scaled surfaces
  [Robert; !3559, !3177]
* Fixed crashes [Peter, Carlos, Sebastian W., Simon, Olivier, Daniel; !33=
83,
  !3517, !3518, !2774, !3446, !3539, !3562, !3565]
* Misc. bug fixes and cleanups [Bilal, Daniel, Sebastian W., Robert, Zand=
er,
  Florian, Carlos, Corentin, Shmuel, Dor, Sebastian K., Jonas; !3498, !34=
18,
  !3500, !3492, !3484, !3504, !3499, !3333, !3351, !3501, !3211, !3506, !=
3387,
  !3509, !3510, !3483, !3467, !3514, !3515, !3516, !3520, !3513, !3507, !=
3526,
  !3527, !3528, !3450, !3531, !3549, !3532, !3543, !3529, !3530, !3550, !=
3554,
  !3540, !3569, !3563, !3570, !3555, !3572, !3571, !3538, !3573, !3575]

Contributors:
  Dor Askayo, Zander Brown, Jonas Dre=C3=9Fler, Bilal Elmoussaoui, Albert=
 Esteve,
  Kai-Heng Feng, Olivier Fourdan, Carlos Garnacho, Peter Hutterer,
  Sebastian Keller, Leorize, Robert Mader, Simon McVittie, Shmuel Melamud=
,
  Florian M=C3=BCllner, Corentin No=C3=ABl, Zack Rusin, Dallas Strouse, D=
aniel van Vugt,
  Sebastian Wick

Translators:
  Ekaterine Papava [ka], Efstathios Iosifidis [el], Artur S0 [ru],
  Daniel Rusek [cs], Fran Dieguez [gl], Sabri =C3=9Cnal [tr]

46.alpha
=3D=3D=3D=3D=3D=3D=3D=3D
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
* wayland: Send keyboard modifiers after the enter event [Alexandros; !33=
41]
* wayland/client: Add make_desktop() method [Florian; !3305]
* Add a target workspace to raise_and_make_recent()  [Sebastian W.; !3315=
]
* clutter: Drop cairo helpers [Bilal; !3086]
* cogl: Port away from CoglObject  [Bilal; !3193]
* mtk: Add a Region type  [Bilal; !3292]
* Propagate focus appearance to all ancestors [Sebastian W.; !3356]
* Ignore locked modifiers in keybinding machinery [Carlos; !3369]
* Fix disabling check-alive timeout [Sebastian K.; !3367]
* Drop ClutterContainer interface [Zander; !3377, !3384]
* Improve sloppy and mouse focus modes [Sebastian W.; !3258]
* Sync geometry only when window is mapped [Sebastian W.; !3401, !3404]
* Improve repick due to transform changes [Carlos; !3385]
* Fix tablets on X11 having the wrong device [Carlos; !3393]
* Disable HW cursor when inhibited by backend [Robert; !3412]
* screencast: Bring back blitting [Georges; !3406]
* backends/native: Try 10 bpc formats [Michel; !3139]
* Fix forcing EGLStream with NVIDIA proprietary driver [Daniel; !2905]
* screencast: Add ability to stop streams [Jonas =C3=85., Pascal; !3307]
* Use standard cursor names from CSS specification [Carlos; !3295]
* Avoids over-synchronization due to client reads [Michel; !3389, !3408]
* Add more profiling instrumentation [Ivan; !3417]
* Allow specifyig the layout manager for an actor type [Florian; !3445]
* Fix handling of relative mode for tablets [Peter; !3410]
* Dynamically assign hardware planes during configuration [Jonas =C3=85.;=
 !3428]
* Simplify X11 focus management [Carlos; !3269]
* background: Fix background color around image [Sebastian W.; !3459]
* text-input: Use correct offsets in delete_surrounding_text [Alynx; !271=
2]
* Add wayland shm YCbCr support [Sebastian W.; !3371]
* Set a minimum guessed scale [Joan; !3464]
* Fix building without native backend [Bilal; !3480]
* Fix occasional artifacts at top of X11 fullscreen windows [Carlos; !347=
6]
* Add documentation for building, running and debugging
  [Sebastian W.; !3465, !3485]
* Improve tablet pressure curve calculation [Peter; !3399]
* Fixed crashes [Carlos, Jonas D., Robert, Sebastian W., Jonas =C3=85., S=
ebastian K.;
  !3287, !3283, !3311, !3322, !3318, !3370, !3392, !3335, !3422, !3376, !=
3453]
* Plugged leaks [Sebastian K.; !3411, !3442]
* Misc. bug fixes and cleanups [Daniel, Corentin, Carlos, Jonas =C3=85., =
Ivan,
  Michel, Sebastian W., Robert, Barnab=C3=A1s, Peter, Bilal, Sebastian K.=
, Zander,
  Florian, Mike, Qiu, Olivier, Christopher, Mart; !3212, !3298, !3267, !3=
297,
  !3313, !3316, !3317, !3323, !3325, !3326, !3328, !3330, !3332, !3319, !=
3097,
  !3288, !3347, !3178, !3240, !3338, !3352, !3321, !2618, !3309, !3353, !=
3348,
  !3349, !3358, !3361, !3362, !3276, !3340, !3365, !3366, !3364, !3363, !=
3375,
  !3181, !3374, !3379, !3382, !3388, !3354, !3386, !3398, !3395, !3397, !=
3368,
  !3400, !3396, !3405, !3403, !3409, !3413, !3402, !3280, !3394, !3421, !=
3423,
  !3431, !3432, !3425, !3438, !3440, !3430, !3429, !2016, !3443, !3444, !=
3441,
  !3451, !3350, !3434, !3437, !3447, !1908, !3456, !3452, !3454, !3455, !=
2620,
  !3463, !3466, !3458, !3468, !3469, !3474, !3473, !3471, !3479, !3482, !=
3487,
  !3486, !3478, !3488, !3357, !3491]

Contributors:
  Jonas =C3=85dahl, Zander Brown, Michel D=C3=A4nzer, Jonas Dre=C3=9Fler,=
 Bilal Elmoussaoui,
  Christopher Fore, Olivier Fourdan, Alexandros Frantzis, Carlos Garnacho=
,
  Mike Gorse, Peter Hutterer, Rohan Hendrik Jotz-Lean, Sebastian Keller,
  Robert Mader, Ivan Molodetskikh, Florian M=C3=BCllner,
  Georges Basile Stavracas Neto, Corentin No=C3=ABl, Pascal Nowack, Barna=
b=C3=A1s P=C5=91cze,
  Mart Raudsepp, Ray Strode, Joan Torres, Daniel van Vugt, Qiu Wenbo,
  Sebastian Wick, Alynx Zhou

Translators:
  Kristjan SCHMIDT [eo], Rafael Fontenelle [pt_BR], Guillaume Bernard [fr=
],
  Jordi Mas i Hernandez [ca], Florentina Mu=C8=99at [ro], Ng=E1=BB=8Dc Qu=
=C3=A2n Tr=E1=BA=A7n [vi],
  Artur S0 [ru]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/mutter/{mutter_45.4.bb =3D> mutter_46.0.bb}  | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_45.4.bb =3D> mutter_46.0.=
bb} (95%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_45.4.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_46.0.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/mutter/mutter_45.4.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_46.0.bb
index a32956ea6..d14f161f1 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_45.4.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_46.0.bb
@@ -24,7 +24,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gobject-introspection gettext features_check
=20
-SRC_URI[archive.sha256sum] =3D "91140837be15582f2c753be661ab8e42dad55d4a=
1b0f0650bd0b2c93f02bd7ab"
+SRC_URI[archive.sha256sum] =3D "bb3f7d77aebdea9d317d3f5ef03868e4e7969da4=
23ac495e33a16d61db2c9373"
=20
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES =3D "wayland x11 polkit"
@@ -63,9 +63,10 @@ PACKAGECONFIG[sound-player] =3D "-Dsound_player=3Dtrue=
, -Dsound_player=3Dfalse, libcan
 PACKAGECONFIG[profiler] =3D "-Dprofiler=3Dtrue,-Dprofiler=3Dfalse,syspro=
f"
 PACKAGECONFIG[startup-notification] =3D "-Dstartup_notification=3Dtrue, =
-Dstartup_notification=3Dfalse, startup-notification, startup-notificatio=
n"
=20
-MUTTER_API_NAME =3D "mutter-13"
+MUTTER_API_NAME =3D "mutter-14"
=20
 do_install:prepend() {
+    sed -i -e 's|${B}/||g' ${B}/cogl/cogl/cogl-enum-types.c
     sed -i -e 's|${B}/||g' ${B}/clutter/clutter/clutter-enum-types.c
     sed -i -e 's|${B}/||g' ${B}/src/meta-private-enum-types.c
     sed -i -e 's|${B}/||g' ${B}/src/meta/meta-enum-types.c
--=20
2.44.0


