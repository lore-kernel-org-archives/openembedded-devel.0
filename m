Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D2ED3EE8B
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 15:44:00 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40497.1769096637698475337
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 07:43:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout10.t-online.de (Postfix) with SMTP id BB7C838529
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 16:43:54 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.161.253]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1viwqb-1auNgP0; Thu, 22 Jan 2026 16:43:49 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 01/11] mutter: update 48.5 -> 48.7
Date: Thu, 22 Jan 2026 16:43:24 +0100
Message-ID: <20260122154334.1872038-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1769096629-24FF6925-170984C5/0/0 CLEAN NORMAL
X-TOI-MSGID: 2006e150-bea4-423c-b18a-8387cd4974c7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 15:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123747

48.7
=3D=3D=3D=3D
* Still constrain fullscreen wayland windows with size limits [Jonas =C3=85=
.;
  !4587]
  * Fixed crashes [Jonas, Marco; !4643, !4705]

  Contributors:
    Marco Trevisan, Jonas =C3=85dahl

48.6
    =3D=3D=3D=3D
* Fix DND actions not working reliably in some X11 clients [Jonas;
  #4288]
  * Fix presentation timings with commit-timing-v1 [Mario; !4645]
  * Fixed crashes [Sebastian, Milan; !4682, !4592]
  * Misc. bug fixes and cleanups [Carlos, Raihan; !4697, !4688]

  Contributors:
    Raihan Ahamed, Milan Crha, Carlos Garnacho, Sebastian Keller,
    Mario Kleiner, Jonas =C3=85dahl

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/mutter/{mutter_48.5.bb =3D> mutter_48.7.bb}  | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_48.5.bb =3D> mutter_48.7.=
bb} (95%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_48.5.bb b/meta-gnome/=
recipes-gnome/mutter/mutter_48.7.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/mutter/mutter_48.5.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_48.7.bb
index ce7f44947e..0dbdb4b31a 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_48.5.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_48.7.bb
@@ -27,9 +27,8 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gobject-introspection gettext features_check
=20
-SRC_URI[archive.sha256sum] =3D "02ed0ab4194fc537540f9ee92acbf5af8209971a=
404df319c1cb7763294ae58b"
-
 SRC_URI +=3D "file://0001-Dont-use-system-sysprof-dbus-folder.patch"
+SRC_URI[archive.sha256sum] =3D "ec102aa3cbb0e39001206627aca3055314555f70=
609de5e6c2b7efcd1fa90f20"
=20
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES =3D "wayland x11 polkit"
@@ -43,7 +42,6 @@ REQUIRED_DISTRO_FEATURES +=3D "systemd"
 PACKAGECONFIG ??=3D " \
     native-backend \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'opengl glx', =
'', d)} \
-    sm \
     startup-notification \
     gnome-desktop \
 "
@@ -61,7 +59,6 @@ PACKAGECONFIG[libwacom] =3D "-Dlibwacom=3Dtrue, -Dlibwa=
com=3Dfalse, libwacom"
 # Remove depending on pipewire-0.2 when mutter is upgraded to 3.36+
 PACKAGECONFIG[remote-desktop] =3D "-Dremote_desktop=3Dtrue, -Dremote_des=
ktop=3Dfalse, pipewire"
 PACKAGECONFIG[gnome-desktop] =3D "-Dlibgnome_desktop=3Dtrue, -Dlibgnome_=
desktop=3Dfalse, gnome-desktop gnome-settings-daemon"
-PACKAGECONFIG[sm] =3D "-Dsm=3Dtrue, -Dsm=3Dfalse, libsm"
 PACKAGECONFIG[sound-player] =3D "-Dsound_player=3Dtrue, -Dsound_player=3D=
false, libcanberra"
 PACKAGECONFIG[profiler] =3D "-Dprofiler=3Dtrue,-Dprofiler=3Dfalse,syspro=
f"
 PACKAGECONFIG[startup-notification] =3D "-Dstartup_notification=3Dtrue, =
-Dstartup_notification=3Dfalse, startup-notification, startup-notificatio=
n"
--=20
2.52.0


