Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B25CA5FF2
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 06:46:18 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30616.1768805170026671108
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jan 2026 22:46:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout02.t-online.de (Postfix) with SMTP id 8B83FE3C2;
	Mon, 19 Jan 2026 07:46:07 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.47.39]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vhj1Z-2xKwgT0; Mon, 19 Jan 2026 07:46:06 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCHv2] gnome-settings-daemon: update 48.0 -> 49.1
Date: Mon, 19 Jan 2026 07:45:55 +0100
Message-ID: <20260119064555.9286-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1768805166-E0FDCC6F-0C4CF48E/0/0 CLEAN NORMAL
X-TOI-MSGID: 8dd3c164-659e-404f-b890-fc8d78ce42b0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 06:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123586

PACKAGECONFIG for wayland,nm have been removed upstream
PACKAGECONFIG for x11,xwayland have been added upstream

Add a patch to fix reproducibility in gnome-settings-daemon-src

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 49.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates

Power:
- Avoid xext dependency

Xsettings:
- Build only if X11 or Xwayland are enabled

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 49.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates

Power:
- Avoid polling light sensor if ambient light setting is disabled

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 49.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates
- Update to GNOME Session changes

Power:
- Fix check for shell-managed brightness
- Refactor light sensor enablement

A11y-settings:
- Manage Orca lifetime

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 49.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates
- Drop dependency on GTK4
- Add xwayland/x11 build options

Power:
- Do not treat all notifications as critical
- Let backlight auto-dimming in control of GNOME Shell

Housekeeping:
- Add new donation reminder notification

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 49.alpha.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Keyboard:
- Drop keyboard bell GSettings schema leftovers

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 49.alpha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates
- Update to GTK4

Power:
- Use new Mutter backlight D-Bus interface

Wacom:
- Drop support to update per-button OLED screens in Wacom
  Intuos 4 model with descriptive actions. This tablet model
    will still be functional, but the tiny screens besides the
      pad buttons will remain blank.

      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
      Version 48.1
      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
      - Translation updates
      - Cleanups and fixes

      Power:
      - Ensure the backlight interface signal gets emitted on startup
      - Avoid using uninitialized value when restoring brightness

      Sharing:
      - Fixes to shutdown of sharing services

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...um-types.c.in-fix-reproducibility-is.patch | 41 ++++++++++++++++++
 ...um-types.c.in-fix-reproducibility-is.patch | 42 +++++++++++++++++++
 ..._48.0.bb =3D> gnome-settings-daemon_49.1.bb} | 19 +++++----
 3 files changed, 93 insertions(+), 9 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-settings-daemon/0001-g=
sd-smartcard-enum-types.c.in-fix-reproducibility-is.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-=
settings-daemon/0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-is=
.patch
 rename meta-gnome/recipes-gnome/gnome-settings-daemon/{gnome-settings-da=
emon_48.0.bb =3D> gnome-settings-daemon_49.1.bb} (67%)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/0001-gsd-smar=
tcard-enum-types.c.in-fix-reproducibility-is.patch b/meta-gnome/recipes-g=
nome/gnome-settings-daemon/0001-gsd-smartcard-enum-types.c.in-fix-reprodu=
cibility-is.patch
new file mode 100644
index 0000000000..d8d9232c98
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/0001-gsd-smartcard-e=
num-types.c.in-fix-reproducibility-is.patch
@@ -0,0 +1,41 @@
+From 49df2d7021a68d9fe13ff094e9f564323c7c8556 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Thu, 15 Jan 2026 14:33:58 +0100
+Subject: [PATCH] gsd-smartcard-enum-types.c.in:fix reproducibility issue
+
+---
+ plugins/smartcard/gsd-smartcard-enum-types.c.in | 4 ++--
+ plugins/smartcard/gsd-smartcard-enum-types.h.in | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/plugins/smartcard/gsd-smartcard-enum-types.c.in b/plugins/s=
martcard/gsd-smartcard-enum-types.c.in
+index f281cf4e..0a970105 100644
+--- a/plugins/smartcard/gsd-smartcard-enum-types.c.in
++++ b/plugins/smartcard/gsd-smartcard-enum-types.c.in
+@@ -5,8 +5,8 @@
+ /*** END file-header ***/
+=20
+ /*** BEGIN file-production ***/
+-#include "@filename@"
+-/* enumerations from "@filename@" */
++#include "@basename@"
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+=20
+ /*** BEGIN value-header ***/
+diff --git a/plugins/smartcard/gsd-smartcard-enum-types.h.in b/plugins/s=
martcard/gsd-smartcard-enum-types.h.in
+index 79dcc3d8..3906ba4c 100644
+--- a/plugins/smartcard/gsd-smartcard-enum-types.h.in
++++ b/plugins/smartcard/gsd-smartcard-enum-types.h.in
+@@ -9,7 +9,7 @@ G_BEGIN_DECLS
+=20
+ /*** BEGIN file-production ***/
+=20
+-/* enumerations from "@filename@" */
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+=20
+ /*** BEGIN value-header ***/
+--=20
+2.52.0
+
diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-setting=
s-daemon/0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch =
b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon/00=
01-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch
new file mode 100644
index 0000000000..e5429366e4
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n/0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch
@@ -0,0 +1,42 @@
+From 49df2d7021a68d9fe13ff094e9f564323c7c8556 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Thu, 15 Jan 2026 14:33:58 +0100
+Subject: [PATCH] gsd-smartcard-enum-types.c.in:fix reproducibility issue
+
+Upstream-Status: Pending
+---
+ plugins/smartcard/gsd-smartcard-enum-types.c.in | 4 ++--
+ plugins/smartcard/gsd-smartcard-enum-types.h.in | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/plugins/smartcard/gsd-smartcard-enum-types.c.in b/plugins/s=
martcard/gsd-smartcard-enum-types.c.in
+index f281cf4e..0a970105 100644
+--- a/plugins/smartcard/gsd-smartcard-enum-types.c.in
++++ b/plugins/smartcard/gsd-smartcard-enum-types.c.in
+@@ -5,8 +5,8 @@
+ /*** END file-header ***/
+=20
+ /*** BEGIN file-production ***/
+-#include "@filename@"
+-/* enumerations from "@filename@" */
++#include "@basename@"
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+=20
+ /*** BEGIN value-header ***/
+diff --git a/plugins/smartcard/gsd-smartcard-enum-types.h.in b/plugins/s=
martcard/gsd-smartcard-enum-types.h.in
+index 79dcc3d8..3906ba4c 100644
+--- a/plugins/smartcard/gsd-smartcard-enum-types.h.in
++++ b/plugins/smartcard/gsd-smartcard-enum-types.h.in
+@@ -9,7 +9,7 @@ G_BEGIN_DECLS
+=20
+ /*** BEGIN file-production ***/
+=20
+-/* enumerations from "@filename@" */
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+=20
+ /*** BEGIN value-header ***/
+--=20
+2.52.0
+
diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-setting=
s-daemon_48.0.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-s=
ettings-daemon_49.1.bb
similarity index 67%
rename from meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings=
-daemon_48.0.bb
rename to meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-d=
aemon_49.1.bb
index 9a2948d432..2125bd91fe 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_49.1.bb
@@ -17,33 +17,34 @@ DEPENDS =3D " \
     libnotify \
     upower \
     libwacom \
-    virtual/libx11 \
+    networkmanager \
 "
=20
 # all these are mandatory
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit pulseaudio systemd gobject-intr=
ospection-data"
 GIR_MESON_OPTION =3D ""
=20
-SRC_URI[archive.sha256sum] =3D "f3da20ab4a2ba56fd3e97b991f2bc267973d5619=
bd58bfa516410aa036305e45"
+SRC_URI +=3D "file://0001-gsd-smartcard-enum-types.c.in-fix-reproducibil=
ity-is.patch"
+SRC_URI[archive.sha256sum] =3D "2a9957fc4f91c3b9127b49484179bef485120d9c=
1c208e44d44e6a746e6cc1c1"
=20
 PACKAGECONFIG ??=3D " \
-    cups nm \
-    alsa gudev \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11 alsa', d)} \
+    gudev \
     smartcard \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
+    xwayland \
+    cups \
 "
 PACKAGECONFIG[alsa] =3D "-Dalsa=3Dtrue,-Dalsa=3Dfalse,alsa-lib"
 PACKAGECONFIG[cups] =3D "-Dcups=3Dtrue,-Dcups=3Dfalse,cups"
 PACKAGECONFIG[gudev] =3D "-Dgudev=3Dtrue,-Dgudev=3Dfalse,libgudev"
-PACKAGECONFIG[nm] =3D "-Dnetwork_manager=3Dtrue,-Dnetwork_manager=3Dfals=
e,networkmanager"
 PACKAGECONFIG[smartcard] =3D "-Dsmartcard=3Dtrue,-Dsmartcard=3Dfalse,nss=
"
-PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue,-Dwayland=3Dfalse,wayland"
+PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd"
+PACKAGECONFIG[xwayland] =3D "-Dxwayland=3Dtrue,-Dxwayland=3Dtrue"
+PACKAGECONFIG[x11] =3D "-Dx11=3Dtrue,-Dx11=3Dfalse,libx11 libxfixes"
=20
 def gnome_verdir(v):
    return oe.utils.trim_version(v, 1)
=20
-PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
-
 FILES:${PN} +=3D " \
     ${systemd_user_unitdir} \
     ${libdir}/gnome-settings-daemon-${@gnome_verdir("${PV}")}/libgsd.so =
\
--=20
2.52.0


