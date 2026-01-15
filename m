Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8877D44C7A
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 16:19:24 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39818.1768493960293296382
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 08:19:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout07.t-online.de (Postfix) with SMTP id 3A84EE0B6;
	Thu, 15 Jan 2026 17:19:13 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.202]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vgQ3y-2Sj17p0; Thu, 15 Jan 2026 17:19:10 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCHv2] gnome-session: update 47.0.1 -> 49.2
Date: Thu, 15 Jan 2026 17:19:05 +0100
Message-ID: <20260115161905.19141-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1768493950-96FFA9BB-D5D7D473/0/0 CLEAN NORMAL
X-TOI-MSGID: 09684245-e273-4073-b38c-a9773f62db49
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 16:19:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123516

- update dependencies
- inherit manpages mime
- build x11 depending on DISTRO_FEATURES

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 49.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Translation updates
- Fixed build with musl libc
- Fixed some memory corruption bugs that led to gnome-session-init-worker
  crashing on logout
- Fixed a memory leak in gnome-session-init-worker
- Allowed Qt apps to use the Wayland text-input protocol, instead of forc=
ing
  them to use the direct ibus integration plugin

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 49.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Disabled the org.freedesktop.ScreenSaver proxy service on the login scr=
een
- Separated out the systemd-specific code from the gnome-session leader p=
rocess
  into a dedicated executable. This makes it easier to integrate distribu=
tions
  that use alternative init systems with gnome-session (though note that =
this
  is still a usecase we don't officially support upstream)
- Translation updates

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 49.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- gnome-session is no longer started via a shell script, and instead all =
of
  the necessary setup is done in C.
- gnome-session's builtin service manager has been completely removed. Se=
rvice
  management will now be handled entirely by the operating system's nativ=
e
  service manager (i.e. systemd). See the following blog post for more in=
formation:
  https://blogs.gnome.org/adrianvovk/2025/06/10/gnome-systemd-dependencie=
s
- The "fail whale" dialog has been removed
- Various unused APIs and interfaces were removed, including:
	- The org.gnome.SessionManager.Client and o.g.SM.App D-Bus interfaces
	- Various D-Bus APIs related to the service manager
	- Various .desktop and .session file keys that were used only by the
	  builtin service manager
	- Fallback sessions, since there's no way to fall back anymore
- The code was significantly refactored
- gnome-session now provides a gnome-session-basic-services.target, that =
sessions
  like the GDM greeter and gnome-initial-setup can use to avoid listing a=
ll of
  the basic GNOME session services (like all the gnome-settings-daemon pl=
ugins)
- The --autostart command line option was removed, and instead kiosk sess=
ions
  should set Kiosk=3Dtrue in their session definition file.
- Updated GNOME's mimetype defaults to drop Evince (which was replaced wi=
th Papers)
- Translation updates

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 49.alpha.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

	Fix POTFILES to stop listing deleted files
	Stop requiring the gnome-settings-daemon Wacom plugin, which doesn't exi=
st anymore
	Ensure that we start localsearch when starting a GNOME session via syste=
md
	Translation updates

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 49.alpha.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

	Removed XSMP
	Removed session restore functionality
	X11 sessions are disabled by default
	Added a default mimeapps list for GNOME's core apps
	gsd-xsettings now starts on demand in Wayland
	Dropped gnome-dummy session
	Allow Inhibit() with no app ID
	Unset all LC_* variables that are bound to REGION
	Ported fail whale to gtk4
	Dropped session selector GUI
	Dropped the hardware acceleration check
	gnome-session-inhibit: Propagate parent death
	gnome-session-inhibit: Fixup terminal handling

Contributors:
  Benjamin Berg, Alessandro Bono, Matthias Clasen, gnome-build-meta-bot,
  Neal Gompa, Sophie Herold, Javier Jard=C3=B3n, Chris Mayo, Simon McVitt=
ie,
  Jordan Petridis, Ray Strode, Joan Torres, Adrian Vovk, Chris Williams

Translators:
  =D0=9C=D0=B0=D1=80=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D1=9B [sr=
], Aefgh Threenine [th], A S Alam [pa], Baxrom Raxmatov [uz],
  Ekaterine Papava [ka], Martin [sl], Quentin PAG=C3=88S [oc], Vasil Pupk=
in [be]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 48.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

	The gnome-session script no longer re-runs itself as a subprocess
	GNOME OS CI was ported to use a CI template
	Integrated new CI-based release process
	Fix bugs caused by systemd v257's inhibitor behavior changes
	Make `gnome-session --version` print to stdout rather than syslog
	Translation updates
	README updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-session_47.0.1.bb =3D> gnome-session_49.2.bb} | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-session/{gnome-session_47.0.1.bb =3D=
> gnome-session_49.2.bb} (50%)

diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.=
bb b/meta-gnome/recipes-gnome/gnome-session/gnome-session_49.2.bb
similarity index 50%
rename from meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.b=
b
rename to meta-gnome/recipes-gnome/gnome-session/gnome-session_49.2.bb
index 3bb1cb1651..3c39cc33e1 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_49.2.bb
@@ -3,28 +3,23 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
 DEPENDS =3D " \
-    glib-2.0-native \
-    xtrans \
-    libice \
-    libsm \
-    virtual/libx11 \
-    gtk+3 \
+    glib-2.0 \
+    gtk4 \
     gnome-desktop \
     json-glib \
     systemd \
 "
=20
=20
-inherit gnomebase gettext gsettings upstream-version-is-even features_ch=
eck
+inherit gnomebase gettext gsettings upstream-version-is-even mime mime-x=
dg manpages
=20
-REQUIRED_DISTRO_FEATURES =3D "polkit systemd pam gobject-introspection-d=
ata"
=20
-SRC_URI =3D "https://download.gnome.org/sources/gnome-session/${@oe.util=
s.trim_version('${PV}', 1)}/gnome-session-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "56ae9c68e49995793eb2096bcdc4533b111669e1e54c8b6e=
0b1d952f6a5e8a70"
+SRC_URI[archive.sha256sum] =3D "fcdb4f45d6a60d84e9ecae1e3740bab6e55bab0c=
b49e0fb38280e9b38f3a8485"
=20
-PACKAGECONFIG ??=3D ""
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
=20
 PACKAGECONFIG[docbook] =3D "-Ddocbook=3Dtrue, -Ddocbook=3Dfalse"
+PACKAGECONFIG[x11] =3D "-Dx11=3Dtrue, -Dx11=3Dfalse,virtual/libx11"
 PACKAGECONFIG[man] =3D "-Dman=3Dtrue, -Dman=3Dfalse,xmlto-native libxslt=
-native"
=20
 FILES:${PN} +=3D " \
--=20
2.52.0


