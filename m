Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AEBC25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 10:16:21 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.18603.1716891373241454841
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 03:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout09.t-online.de (Postfix) with SMTP id D128617624
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 12:16:11 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.40.240]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sBtsE-0356zT0; Tue, 28 May 2024 12:16:06 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/3] gnome-shell: update 46.1 -> 46.2
Date: Tue, 28 May 2024 12:16:43 +0200
Message-ID: <20240528101643.2314146-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240528101643.2314146-1-f_l_k@t-online.de>
References: <20240528101643.2314146-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1716891366-D3FFCD0F-876B7B33/0/0 CLEAN NORMAL
X-TOI-MSGID: e87be456-8ee0-4398-98cc-fde448d3e04b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110582

46.2
=3D=3D=3D=3D
* Fix size of workspace switcher OSD [Jakub; !3282]
* Fix handling of invalid TLS certs in portal handler [Sebastian K.; !328=
4]
* Exclude override-redirect windows from workspace animation [Marco; !328=
5]
* Also center time on lock screen when using 12h format [pesader; !3290]
* Use absolute tray icon position in root event coordinates [Marco; !3283=
]
* Fix displaying info messages on login screen [Ray; !3298]
* Correct expected bus name for streams [Simon; !3303]
* Fix notifications on lock screen [Florian; !3308]
* notifications: Only apply special styling to symbolic icons [Florian; !=
3296]
* Fix number of search results with Large Text option [Sam; !3312]
* Fix showing keyboard layouts with variants [Sebastian K.; !3324]
* Tweak font sizes in calendar [Sam; !3313]
* automountManager: Fix re-asking password for TCRYPT devices [segfault; =
!3300]
* Fix stuck unlock prompt when animations are disabled [Florian; !3317]
* Fix possible hang on startup during ibus-daemon launch [Marco; !3293]
* Misc. bug fixes and cleanups [Sebastian W., Gabriel, Sebastian K., Flor=
ian,
  Jonas, Sam, Ray; !3267, !3281, !3288, !3295, !3299, !3310, !3315, !3326=
,
  !3321, !3319, !3329, !3331, !3245, !3340]

Contributors:
  Jonas =C3=85dahl, Sam Hewitt, Sebastian Keller, Simon McVittie, Florian=
 M=C3=BCllner,
  Gabriel Nagy, pesader, segfault, Jakub Steiner, Ray Strode,
  Marco Trevisan (Trevi=C3=B1o), Sebastian Wick

Translators:
  Andika Triwidada [id], Rachida SACI [kab], Hugo Carvalho [pt],
  Scrambled 777 [hi], Jose Riha [sk], Bal=C3=A1zs =C3=9Ar [hu], Quentin P=
AG=C3=88S [oc]

- remove backport patch
- update extensions

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...46.1.bb =3D> gnome-shell-extensions_46.2.bb} |  2 +-
 ...orrect-expected-bus-name-for-streams.patch | 38 -------------------
 ...nome-shell_46.1.bb =3D> gnome-shell_46.2.bb} |  3 +-
 3 files changed, 2 insertions(+), 41 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell-extensions_46.1=
.bb =3D> gnome-shell-extensions_46.2.bb} (84%)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002=
-screencast-Correct-expected-bus-name-for-streams.patch
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_46.1.bb =3D> gn=
ome-shell_46.2.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_=
46.1.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_46.=
2.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_4=
6.1.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_46.=
2.bb
index b79f70c60..5c2ae0593 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_46.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_46.2.bb
@@ -6,7 +6,7 @@ inherit gnomebase gettext gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam gobject-introspecti=
on-data"
=20
-SRC_URI[archive.sha256sum] =3D "c5ba50700da77a986f0060beedacfc017e7ec822=
83f2a6384842a0807bc4553f"
+SRC_URI[archive.sha256sum] =3D "d442e9d26925125ff215a5c13429049565538074=
1daafbb37a3a99d6f0c7d86f"
=20
 EXTRA_OEMESON +=3D " \
     -Dextension_set=3Dall \
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-screen=
cast-Correct-expected-bus-name-for-streams.patch b/meta-gnome/recipes-gno=
me/gnome-shell/gnome-shell/0002-screencast-Correct-expected-bus-name-for-=
streams.patch
deleted file mode 100644
index 736594716..000000000
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-screencast-Co=
rrect-expected-bus-name-for-streams.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 50a011a19dcc6997ea6173c07bb80b2d9888d363 Mon Sep 17 00:00:00 2001
-From: Simon McVittie <smcv@debian.org>
-Date: Mon, 6 May 2024 21:58:09 +0100
-Subject: [PATCH] screencast: Correct expected bus name for streams
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Previously, this only worked because GDBusConnection was not filtering
-signals by their sender correctly (GNOME/glib#3268).
-
-Thanks: Alicia Boya Garc=C3=ADa
-Signed-off-by: Simon McVittie <smcv@debian.org>
-Part-of: <https://gitlab.gnome.org/GNOME/gnome-shell/-/merge_requests/33=
03>
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gnome-shell/-/=
commit/50a011a19dcc6997ea6173c07bb80b2d9888d363]
-
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- js/dbusServices/screencast/screencastService.js | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/js/dbusServices/screencast/screencastService.js b/js/dbusSe=
rvices/screencast/screencastService.js
-index d664a51b083..0645811fa0a 100644
---- a/js/dbusServices/screencast/screencastService.js
-+++ b/js/dbusServices/screencast/screencastService.js
-@@ -340,7 +340,7 @@ class Recorder extends Signals.EventEmitter {
-                 });
-=20
-             this._streamProxy =3D new ScreenCastStreamProxy(Gio.DBus.se=
ssion,
--                'org.gnome.ScreenCast.Stream',
-+                'org.gnome.Mutter.ScreenCast',
-                 streamPath);
-=20
-             this._streamProxy.connectSignal('PipeWireStreamAdded',
---=20
-2.30.2
-
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.1.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.2.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.1.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.2.bb
index 1bc9b6b39..0a52de7a3 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_46.2.bb
@@ -32,9 +32,8 @@ GIR_MESON_OPTION =3D ""
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "64f999844c101e63bf294d45b138de56319ad2f3=
26282721aad0fa860653b369"
+SRC_URI[archive.sha256sum] =3D "6b587101c04bfb364ab09cd38b5d93ebeeb42547=
54c807cf712fbc8ee3fde238"
 SRC_URI +=3D "file://0001-Introduce-options-gjs_path-to-optionally-set-p=
ath-to.patch"
-SRC_URI +=3D "file://0002-screencast-Correct-expected-bus-name-for-strea=
ms.patch"
=20
 PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
 PACKAGECONFIG[bluetooth] =3D ",,gnome-bluetooth"
--=20
2.45.1


