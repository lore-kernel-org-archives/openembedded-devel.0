Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8B4C54E60
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 01:21:20 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.33226.1710724873765571735
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Mar 2024 18:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout10.t-online.de (Postfix) with SMTP id 4E5AD8D75
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 02:21:11 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.38.150]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rm1gb-20evdi0; Mon, 18 Mar 2024 02:21:09 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/3] gnome-shell: update 45.4 -> 46.0
Date: Mon, 18 Mar 2024 02:21:25 +0100
Message-ID: <20240318012126.1924855-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318012126.1924855-1-f_l_k@t-online.de>
References: <20240318012126.1924855-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1710724869-3DA409FB-208C8790/0/0 CLEAN NORMAL
X-TOI-MSGID: 56d1d24b-75dd-4d0a-ac8f-4ff9c2435aaf
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 01:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109395

46.0
=3D=3D=3D=3D
* Fix model selection in on-screen keyboard [Jonas; !3230]
* Fix key getting stuck when raising screen shield [Jonas; !3231]
* Fix notifications sometimes being empty [Julian; !3229]
* Fix cursor visibilty when magnified [Sebastian; !3237]
* Fixed crashes [Jonas, Sebastian; !3233, !3239]
* Misc. bug fixes and cleanups [Carlos, Yotam, Aleksandr, Florian, Joan, =
Sam;
  !3225, !3161, !3232, !3226, !3236, !3203, !3238]

Contributors:
  Yotam Bar-On, Jonas Dre=C3=9Fler, Carlos Garnacho, Sam Hewitt, Sebastia=
n Keller,
  Aleksandr Mezin, Florian M=C3=BCllner, Julian Sparber, Joan Torres

Translators:
  Sabri =C3=9Cnal [tr], Yuri Chornoivan [uk], Piotr Dr=C4=85g [pl], Jiri =
Gr=C3=B6nroos [fi],
  Ekaterine Papava [ka], Aurimas =C4=8Cernius [lt], Yaron Shahrabani [he]=
,
  Daniel Mustieles [es], Asier Sarasua Garmendia [eu], Guillaume Bernard =
[fr],
  Jordi Mas i Hernandez [ca], Matej Urban=C4=8Di=C4=8D [sl], Bruce Cowan =
[en_GB],
  Baurzhan Muftakhidinov [kk], Brage Fuglseth [nb], Andika Triwidada [id]=
,
  Quentin PAG=C3=88S [oc], R=C5=ABdolfs Mazurs [lv], Anders Jonsson [sv],
  Fran Dieguez [gl], Milo Casagrande [it], Bal=C3=A1zs =C3=9Ar [hu], Phil=
ipp Kiemle [de],
  Artur S0 [ru], Changwoo Ryu [ko], Ask Hjorth Larsen [da],
  Athmane MOKRAOUI [kab]

46.rc
=3D=3D=3D=3D=3D
* Fix repainting drawing area [Florian; !3190]
* Support locking down extension installation [Florian; !3180]
* Fix auto-closing FDO notifications [Florian; !3204]
* Ensure remote actions are activated with correct platform data [Julian;=
 !3198]
* FDO notifications: Support ActivationToken signal [Julian; !3199]
* Delete selected text on backspace from on-screen keyboard [Sebastian; !=
2746]
* Various on-screen keyboard improvements [Carlos; !3162]
* Inform users of conflicting local/remote sessions on login [Joan; !3134=
]
* screencasts: Use h264 encoding if available [Jonas; !3211]
* Work around issue in NetworkManager's wireguard support [Jonas; !3219]
* Allow expanding notifications in message list [Julian; !3173]
* Fixed crash [Marco; !2267]
* Misc. bug fixes and cleanups [Paul, Florian, Carlos, Julian, Bilal, Aut=
omeris,
  Ray, Sam, Daniel, Sophie; !3186, !3187, !3028, !3188, !3189, !3191, !31=
92,
  !3147, !3195, !3197, !3196, !2765, !3200, !3202, !3201, !3206, !3208, !=
3213,
  !3207, !3214, !3215, !3216, !3209, !3217, !3221]

Contributors:
  Jonas Dre=C3=9Fler, Bilal Elmoussaoui, Carlos Garnacho, Sophie Herold, =
Sam Hewitt,
  Paul Hollinsky, Sebastian Keller, Florian M=C3=BCllner, Automeris naran=
ja,
  Julian Sparber, Ray Strode, Joan Torres, Marco Trevisan (Trevi=C3=B1o),
  Daniel van Vugt

Translators:
  Ekaterine Papava [ka], Danial Behzadi [fa], Marek =C4=8Cernock=C3=BD [c=
s],
  Sabri =C3=9Cnal [tr], Artur S0 [ru], Yuri Chornoivan [uk], Fran Dieguez=
 [gl],
  Vasil Pupkin [be], Asier Sarasua Garmendia [eu], Yaron Shahrabani [he],
  Daniel Rusek [cs], Brage Fuglseth [nb], Emin Tufan =C3=87etin [tr],
  Nathan Follens [nl], Aurimas =C4=8Cernius [lt], Matej Urban=C4=8Di=C4=8D=
 [sl],
  Daniel Mustieles [es], Quique Serrano [ca], Ir=C3=A9n=C3=A9e THIRION [f=
r],
  Kukuh Syafaat [id], Luming Zh [zh_CN], Jordi Mas i Hernandez [ca],
  Bruce Cowan [en_GB], Quentin PAG=C3=88S [oc], Baurzhan Muftakhidinov [k=
k],
  R=C5=ABdolfs Mazurs [lv], Chao-Hsiung Liao [zh_TW], Guillaume Bernard [=
fr],
  J=C3=BCrgen Benvenuti [de], Philipp Kiemle [de], Jiri Gr=C3=B6nroos [fi=
]

46.beta
=3D=3D=3D=3D=3D=3D=3D
* Improve High Contrast styling
  [Sam; !3063, !3075, !3076, !3097, !3143, !3120, !3154]
* Improve default styling [Sam; !3044, !3084, !3102, !3140, !3167]
* Close mount notification when drive gets disconnected [Florian; !3089]
* extensions-app: Remember window state [Florian; !3115]
* Fix feedback look in keyboard backlight slider [Barnab=C3=A1s; !3086]
* Follow "switch-shapes" accessibility setting [Florian; !3107]
* Fix effects of transient wayland windows [Florian; !3125]
* Add keyboard model configuration support [Leorize; !2583]
* Add Text Editor to the dash by default [Allan; !3135]
* Fix icon size regression in dash [Sam; !3119]
* Improve project and development documentation [Florian; !3122]
* overview: Keep dimming effect for modal dialogs [Florian; !3151]
* Do not use markup in button labels [Carlos; !3149]
* Fix menu alignment in RTL locales [Florian; !3150]
* Overhaul assets in monitor layout switcher [Sam; !3128]
* Fix overview transition from search results to session [Suryashankar; !=
3152]
* Add header to notifications [Julian; !3103]
* extensions-app: Use adaptive dialogs [Florian; !3148]
* Register custom D-Bus errors [Florian; !3159, !3160]
* Improve appearance of symbolic icons in notifications [Julian; !3066]
* Improve minimize animation [Keyu; !2968]
* Use a single source for all system notifications [Julian; !3156]
* Add missing shift level to Georgian OSK layout [Carlos; !3145]
* Tweak switch appearance [kramo; !3077]
* Improve handling of screencast failures [Jonas; !2976]
* Fixed crash [Florian; !3117]
* Misc. bug fixes and cleanups [Julian, Robert, Bilal, Florian, Georges, =
Sam,
  Shmuel, Jonas, Andy, Evan, =C3=93scar, Bilal; !3059, !2982, !3026, !310=
5, !3104,
  !3106, !3109, !3110, !3112, !3111, !3113, !3114, !3118, !3121, !3098, !=
3123,
  !3126, !3129, !3136, !3138, !3139, !3137, !3133, !3132, !3130, !3131, !=
3141,
  !3146, !786, !2475, !2901, !2037, !3153, !3158, !3155, !3165, !3171, !3=
169,
  !3127, !3172, !3157, !3170, !3175, !3176, !3178, !3177, !3181]

Contributors:
  Suryashankar Das, Allan Day, Jonas Dre=C3=9Fler, Bilal Elmoussaoui,
  =C3=93scar Fern=C3=A1ndez Diaz, Carlos Garnacho, Sam Hewitt, Andy Holme=
s, kramo,
  Leorize, Robert Mader, Shmuel Melamud, Florian M=C3=BCllner,
  Georges Basile Stavracas Neto, Barnab=C3=A1s P=C5=91cze, Julian Sparber=
, Keyu Tao,
  Evan Welsh

Translators:
  Ekaterine Papava [ka], Artur S0 [ru], Sabri =C3=9Cnal [tr], Bal=C3=A1zs=
 Mesk=C3=B3 [hu],
  Danial Behzadi [fa], A S Alam [pa], Daniel Rusek [cs], Fran Dieguez [gl=
],
  Vasil Pupkin [be], Yosef Or Boczko [he]

46.alpha
=3D=3D=3D=3D=3D=3D=3D=3D
* Fix scroll handling on sliders [Carlos; !2967]
* overview: Handle unredirection as part of the state transition [Robert;=
 !2970]
* Handle DESKTOP windows during workspace animations [Sundeep; !2865]
* Improve wording in welcome dialog [Automeris, Florian; !2963, !2962]
* Improve recording indicator in light style [Georges; !2983]
* Fix calendar popup shrinking on date changes [Sebastian K.; !2989]
* app: Make all windows on target workspace recent when activated
  [Sebastian W.; !2991]
* Fix performance degradation due to repeated signal leak [Sebastian K.; =
!3001]
* Optimize application search [Sebastian K.; !3004]
* Fix on-screen keyboard backspace getting stuck [Sebastian K.; !3009]
* Adapt to ClutterContainer removal [Zander; !3010, !3014]
* Fix arrow navigation in search results [Sebastian K.; !3015]
* Improve monitor OSD labels [Sam; !3016]
* Support async code in Eval() D-Bus method [Florian; !3021]
* Fix sliders not requesting any size [Florian; !2994]
* Only show prefs dialog after the extension has been loaded [Florian; !3=
025]
* Use dedicated assets in ctrl-alt-tab popup [Sam; !3019]
* Improve high-contrast styling [Sam; !3030]
* Fix mapping of tablet rings/strips [Peter; !3029]
* Add support for "version-name" field in extension metainfo
  [Aryan, Florian; !2995, !3034]
* Add more toolbox developer tooling [Florian; !2935, !3040]
* Use less ambiguous symbols for radio menu items [Sam; !3027]
* Improve icon- and text scaling [Sam; !3033]
* Modernize Extensions app [Florian; !3048, !3051, !3067]
* Use gi-docgen for API documentation [Zander; !1873]
* Improve high-contrast styling [Sam; !3017]
* Allow any enter key to be used to screenshot [Scott; !2777]
* Remove X11-specific icon fallback [Florian; !3056]
* Replace StBin's custom layout code [Florian; !3046]
* Minimize need to rebase when loading extensions [Sundeep; !2851]
* Add D-Bus method to take interactive screenshots [Georges; !2999]
* Add shortcuts to open new window of pinned apps [Florian, Leleat; !1829=
]
* Fix spinner in light style variant [Florian; !3080]
* Improve handling of enabled-but-inactive extensions [Florian; !3073]
* Improve formatting of extension errors [Philip; !3041]
* Fixed crashes [Daniel, Sebastian K., Carlos, Florian; !2975, !2974, !29=
93,
  !3018, !3011, !3006]
* Misc. bug fixes and cleanups [Florian, Martin, Alessandro, Bilal,
  Sebastian K., Barnab=C3=A1s, Jonas, Julian, Charles, Daniel, Automeris,=
 Cassidy,
  Carlos, Sam, Sabri, Jonian, Sebastian W.; !2966, !2978, !2987, !2988, !=
2808,
  !2964, !3000, !3005, !3008, !3013, !2190, !3020, !3023, !2997, !3031, !=
3042,
  !3043, !3045, !3047, !3049, !2653, !3052, !3050, !3054, !3055, !1905, !=
3060,
  !3061, !2950, !3062, !3068, !3058, !3064, !3072, !3071, !3079, !2998, !=
3085,
  !3083, !3088, !3087, !3091, !3057, !3090]

Contributors:
  Cassidy James Blaede, Alessandro Bono, Zander Brown, Scott Buchanan,
  Philip Chimento, Jonas Dre=C3=9Fler, Bilal Elmoussaoui, Carlos Garnacho=
,
  Jonian Guveli, Sam Hewitt, Peter Hutterer, Aryan Kaushik, Sebastian Kel=
ler,
  Leleat, Robert Mader, Sundeep Mediratta, Florian M=C3=BCllner, Automeri=
s naranja,
  Georges Basile Stavracas Neto, Barnab=C3=A1s P=C5=91cze, Julian Sparber=
, Sabri =C3=9Cnal,
  Daniel van Vugt, Sebastian Wick, Charles Wong, Martin Zurowietz

Translators:
  Jordi Mas [ca], Fabio Tomat [fur], Ekaterine Papava [ka], Sabri =C3=9Cn=
al [tr],
  Cheng-Chia Tseng [zh_TW], Changwoo Ryu [ko], Florentina Mu=C8=99at [ro]=
,
  Brage Fuglseth [nb], Evangelos Skarmoutsos [el], Efstathios Iosifidis [=
el],
  Quentin PAG=C3=88S [oc], J=C3=BCrgen Benvenuti [de], Daniel =C8=98erb=C4=
=83nescu [ro],
  Artur S0 [ru], =D0=9C=D0=B0=D1=80=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=
=B8=D1=9B [sr], Hugo Carvalho [pt], Ng=E1=BB=8Dc Qu=C3=A2n Tr=E1=BA=A7n [=
vi],
  Du=C5=A1an Kazik [sk], Aefgh Threenine [th]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...s-gjs_path-to-optionally-set-path-to.patch | 20 +++++++++++--------
 ...nome-shell_45.4.bb =3D> gnome-shell_46.0.bb} |  2 +-
 2 files changed, 13 insertions(+), 9 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_45.4.bb =3D> gn=
ome-shell_46.0.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0001-Introd=
uce-options-gjs_path-to-optionally-set-path-to.patch b/meta-gnome/recipes=
-gnome/gnome-shell/gnome-shell/0001-Introduce-options-gjs_path-to-optiona=
lly-set-path-to.patch
index e8c7e79aa..8ef0da16f 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0001-Introduce-opt=
ions-gjs_path-to-optionally-set-path-to.patch
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0001-Introduce-opt=
ions-gjs_path-to-optionally-set-path-to.patch
@@ -1,4 +1,4 @@
-From b2710a880b366201f07752e87d35bb52ea69cbbe Mon Sep 17 00:00:00 2001
+From e9835f650d70bf22ad0e5d8c2179aa01b2d18955 Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
 Date: Thu, 28 Oct 2021 18:57:24 +0200
 Subject: [PATCH] Introduce options 'gjs_path' to optionally set path to =
gjs
@@ -16,10 +16,14 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=3DUTF-8
 Content-Transfer-Encoding: 8bit
=20
+From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
 Upstream-Status: Pending
=20
 Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
-
 ---
  js/dbusServices/meson.build                  | 2 +-
  meson.build                                  | 6 +++++-
@@ -43,10 +47,10 @@ index 48b7f89..700b590 100644
 =20
    configure_file(
 diff --git a/meson.build b/meson.build
-index 70ba711..f0ab158 100644
+index a6d83b1..2c612a8 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -135,7 +135,11 @@ endif
+@@ -134,7 +134,11 @@ endif
 =20
  mutter_typelibdir =3D mutter_dep.get_variable('typelibdir')
  python =3D find_program('python3')
@@ -87,11 +91,11 @@ index c9a67f8..91ae887 100644
  configure_file(
    input: prgname + '.in',
 diff --git a/subprojects/extensions-app/meson.build b/subprojects/extens=
ions-app/meson.build
-index 6c9639e..3fe1ce0 100644
+index 45f391b..d581408 100644
 --- a/subprojects/extensions-app/meson.build
 +++ b/subprojects/extensions-app/meson.build
-@@ -46,7 +46,12 @@ localedir =3D join_paths(datadir, 'locale')
- metainfodir =3D join_paths(datadir, 'metainfo')
+@@ -47,7 +47,12 @@ metainfodir =3D join_paths(datadir, 'metainfo')
+ schemadir =3D join_paths(datadir, 'glib-2.0', 'schemas')
  servicedir =3D join_paths(datadir, 'dbus-1', 'services')
 =20
 -gjs =3D find_program('gjs')
@@ -102,8 +106,8 @@ index 6c9639e..3fe1ce0 100644
 +endif
 +
  appstream_util =3D find_program('appstream-util', required: false)
+ appstreamcli =3D find_program('appstreamcli', required: false)
  desktop_file_validate =3D find_program('desktop-file-validate', require=
d: false)
-=20
 diff --git a/subprojects/extensions-app/meson_options.txt b/subprojects/=
extensions-app/meson_options.txt
 index ca2eb41..2787785 100644
 --- a/subprojects/extensions-app/meson_options.txt
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.4.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.0.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.4.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.0.bb
index 9512f0b58..907cfdf67 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.0.bb
@@ -32,7 +32,7 @@ GIR_MESON_OPTION =3D ""
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "5bfea379e120b1c7f237f3ec369ad27ef5c2f593=
0c7df163b392782d8582090d"
+SRC_URI[archive.sha256sum] =3D "6bc41340b6de05774e97cfe20feba86e2b3cc9c8=
139118f24bd84ac63e82b53e"
 SRC_URI +=3D "file://0001-Introduce-options-gjs_path-to-optionally-set-p=
ath-to.patch"
=20
 PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
--=20
2.44.0


