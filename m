Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4DACC982E8
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 18:14:06 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3656.1768587244708587739
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jan 2026 10:14:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout07.t-online.de (Postfix) with SMTP id 6D54CE48A;
	Fri, 16 Jan 2026 19:13:26 +0100 (CET)
Received: from [192.168.178.36] ([79.219.227.115]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vgoK1-0xOHuy0; Fri, 16 Jan 2026 19:13:21 +0100
Date: Fri, 16 Jan 2026 19:13:15 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCHv3] gnome-session: update 47.0.1 -> 49.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <3MYY8T.Q5PYJALQRTAY1@t-online.de>
In-Reply-To: <188B48759A024316.3271208@lists.openembedded.org>
References: <188B48759A024316.3271208@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-muX7PQUEXKcp3ysPFG9d"
X-TOI-EXPURGATEID: 150726::1768587201-D7FFC995-F1A85D6D/0/0 CLEAN NORMAL
X-TOI-MSGID: 1a37fa65-1a42-4985-9ed9-d9ce6c7a6e76
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 18:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123539

--=-muX7PQUEXKcp3ysPFG9d
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

v3: remove systemd dependency. There is only a runtime dependency on=20
logind which can also be fulfilled by e.g. elogind

On Fri, Jan 16 2026 at 19:08:49 +01:00:00, Markus Volk via=20
lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
> - update dependencies
> - inherit manpages mime
> - build x11 depending on DISTRO_FEATURES
> - rename packageconfig man->manpages to work with manpages class
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Version 49.0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> - Translation updates
> - Fixed build with musl libc
> - Fixed some memory corruption bugs that led to=20
> gnome-session-init-worker
>   crashing on logout
> - Fixed a memory leak in gnome-session-init-worker
> - Allowed Qt apps to use the Wayland text-input protocol, instead of=20
> forcing
>   them to use the direct ibus integration plugin
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Version 49.rc
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> - Disabled the org.freedesktop.ScreenSaver proxy service on the login=20
> screen
> - Separated out the systemd-specific code from the gnome-session=20
> leader process
>   into a dedicated executable. This makes it easier to integrate=20
> distributions
>   that use alternative init systems with gnome-session (though note=20
> that this
>   is still a usecase we don't officially support upstream)
> - Translation updates
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Version 49.beta
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> - gnome-session is no longer started via a shell script, and instead=20
> all of
>   the necessary setup is done in C.
> - gnome-session's builtin service manager has been completely=20
> removed. Service
>   management will now be handled entirely by the operating system's=20
> native
>   service manager (i.e. systemd). See the following blog post for=20
> more information:
>  =20
> <https://blogs.gnome.org/adrianvovk/2025/06/10/gnome-systemd-dependencies=
>
> - The "fail whale" dialog has been removed
> - Various unused APIs and interfaces were removed, including:
> 	- The org.gnome.SessionManager.Client and o.g.SM.App D-Bus interfaces
> 	- Various D-Bus APIs related to the service manager
> 	- Various .desktop and .session file keys that were used only by the
> 	  builtin service manager
> 	- Fallback sessions, since there's no way to fall back anymore
> - The code was significantly refactored
> - gnome-session now provides a gnome-session-basic-services.target,=20
> that sessions
>   like the GDM greeter and gnome-initial-setup can use to avoid=20
> listing all of
>   the basic GNOME session services (like all the=20
> gnome-settings-daemon plugins)
> - The --autostart command line option was removed, and instead kiosk=20
> sessions
>   should set Kiosk=3Dtrue in their session definition file.
> - Updated GNOME's mimetype defaults to drop Evince (which was=20
> replaced with Papers)
> - Translation updates
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Version 49.alpha.1
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> 	Fix POTFILES to stop listing deleted files
> 	Stop requiring the gnome-settings-daemon Wacom plugin, which doesn't=20
> exist anymore
> 	Ensure that we start localsearch when starting a GNOME session via=20
> systemd
> 	Translation updates
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Version 49.alpha.0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> 	Removed XSMP
> 	Removed session restore functionality
> 	X11 sessions are disabled by default
> 	Added a default mimeapps list for GNOME's core apps
> 	gsd-xsettings now starts on demand in Wayland
> 	Dropped gnome-dummy session
> 	Allow Inhibit() with no app ID
> 	Unset all LC_* variables that are bound to REGION
> 	Ported fail whale to gtk4
> 	Dropped session selector GUI
> 	Dropped the hardware acceleration check
> 	gnome-session-inhibit: Propagate parent death
> 	gnome-session-inhibit: Fixup terminal handling
>=20
> Contributors:
>   Benjamin Berg, Alessandro Bono, Matthias Clasen,=20
> gnome-build-meta-bot,
>   Neal Gompa, Sophie Herold, Javier Jard=C3=B3n, Chris Mayo, Simon=20
> McVittie,
>   Jordan Petridis, Ray Strode, Joan Torres, Adrian Vovk, Chris=20
> Williams
>=20
> Translators:
>   =D0=9C=D0=B0=D1=80=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D1=9B [sr=
], Aefgh Threenine [th], A S Alam [pa],=20
> Baxrom Raxmatov [uz],
>   Ekaterine Papava [ka], Martin [sl], Quentin PAG=C3=88S [oc], Vasil=20
> Pupkin [be]
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Version 48.0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> 	The gnome-session script no longer re-runs itself as a subprocess
> 	GNOME OS CI was ported to use a CI template
> 	Integrated new CI-based release process
> 	Fix bugs caused by systemd v257's inhibitor behavior changes
> 	Make `gnome-session --version` print to stdout rather than syslog
> 	Translation updates
> 	README updates
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> Signed-off-by: Khem Raj <raj.khem@gmail.com=20
> <mailto:raj.khem@gmail.com>>
> ---
>  .../gnome-session/gnome-session_47.0.1.bb     | 35=20
> -------------------
>  .../gnome-session/gnome-session_49.2.bb       | 27 ++++++++++++++
>  2 files changed, 27 insertions(+), 35 deletions(-)
>  delete mode 100644=20
> meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.bb
>  create mode 100644=20
> meta-gnome/recipes-gnome/gnome-session/gnome-session_49.2.bb
>=20
> diff --git=20
> a/meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.bb=20
> b/meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.bb
> deleted file mode 100644
> index 3bb1cb1651..0000000000
> --- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.bb
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -SUMMARY =3D "GNOME session"
> -LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D=20
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"=20
> <file://copying;md5=3Db234ee4d69f5fce4486a80fdaf4a4263/>
> -
> -DEPENDS =3D " \
> -    glib-2.0-native \
> -    xtrans \
> -    libice \
> -    libsm \
> -    virtual/libx11 \
> -    gtk+3 \
> -    gnome-desktop \
> -    json-glib \
> -    systemd \
> -"
> -
> -
> -inherit gnomebase gettext gsettings upstream-version-is-even=20
> features_check
> -
> -REQUIRED_DISTRO_FEATURES =3D "polkit systemd pam=20
> gobject-introspection-data"
> -
> -SRC_URI =3D=20
> "https://download.gnome.org/sources/gnome-session/${@oe.utils.trim_versio=
n('${PV=20
> <https://download.gnome.org/sources/gnome-session/$%7B@oe.utils.trim_vers=
ion('$%7BPV>}',=20
> 1)}/gnome-session-${PV}.tar.xz"
> -SRC_URI[sha256sum] =3D=20
> "56ae9c68e49995793eb2096bcdc4533b111669e1e54c8b6e0b1d952f6a5e8a70"
> -
> -PACKAGECONFIG ??=3D ""
> -
> -PACKAGECONFIG[docbook] =3D "-Ddocbook=3Dtrue, -Ddocbook=3Dfalse"
> -PACKAGECONFIG[man] =3D "-Dman=3Dtrue, -Dman=3Dfalse,xmlto-native=20
> libxslt-native"
> -
> -FILES:${PN} +=3D " \
> -   ${datadir}/xdg-desktop-portal \
> -    ${datadir}/xsessions \
> -    ${datadir}/wayland-sessions \
> -    ${systemd_user_unitdir} \
> -"
> diff --git=20
> a/meta-gnome/recipes-gnome/gnome-session/gnome-session_49.2.bb=20
> b/meta-gnome/recipes-gnome/gnome-session/gnome-session_49.2.bb
> new file mode 100644
> index 0000000000..20f122ffd0
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_49.2.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "GNOME session"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D=20
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"=20
> <file://copying;md5=3Db234ee4d69f5fce4486a80fdaf4a4263/>
> +
> +DEPENDS =3D " \
> +    glib-2.0 \
> +    gtk4 \
> +    gnome-desktop \
> +    json-glib \
> +"
> +
> +inherit gnomebase gettext gsettings upstream-version-is-even mime=20
> mime-xdg manpages
> +
> +SRC_URI[archive.sha256sum] =3D=20
> "fcdb4f45d6a60d84e9ecae1e3740bab6e55bab0cb49e0fb38280e9b38f3a8485"
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.filter=20
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'x11', d)}"
> +
> +PACKAGECONFIG[docbook] =3D "-Ddocbook=3Dtrue, -Ddocbook=3Dfalse"
> +PACKAGECONFIG[x11] =3D "-Dx11=3Dtrue, -Dx11=3Dfalse,virtual/libx11"
> +PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue, -Dman=3Dfalse,xmlto-native=20
> libxslt-native"
> +
> +FILES:${PN} +=3D " \
> +   ${datadir}/xdg-desktop-portal \
> +    ${datadir}/xsessions \
> +    ${datadir}/wayland-sessions \
> +    ${systemd_user_unitdir} \
> +"
> --
> 2.52.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123538):=20
> <https://lists.openembedded.org/g/openembedded-devel/message/123538>
> Mute This Topic: <https://lists.openembedded.org/mt/117302289/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org=20
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-muX7PQUEXKcp3ysPFG9d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>v3: remove systemd dependency. The=
re is only a runtime dependency on logind which can also be fulfilled by e.=
g. elogind</div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Fri, Jan =
16 2026 at 19:08:49 +01:00:00, Markus Volk via lists.openembedded.org &lt;f=
_l_k=3Dt-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type=3D=
"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">- upda=
te dependencies
- inherit manpages mime
- build x11 depending on DISTRO_FEATURES
- rename packageconfig man-&gt;manpages to work with manpages class

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 49.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Translation updates
- Fixed build with musl libc
- Fixed some memory corruption bugs that led to gnome-session-init-worker
  crashing on logout
- Fixed a memory leak in gnome-session-init-worker
- Allowed Qt apps to use the Wayland text-input protocol, instead of forcin=
g
  them to use the direct ibus integration plugin

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 49.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Disabled the org.freedesktop.ScreenSaver proxy service on the login scree=
n
- Separated out the systemd-specific code from the gnome-session leader pro=
cess
  into a dedicated executable. This makes it easier to integrate distributi=
ons
  that use alternative init systems with gnome-session (though note that th=
is
  is still a usecase we don't officially support upstream)
- Translation updates

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 49.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- gnome-session is no longer started via a shell script, and instead all of
  the necessary setup is done in C.
- gnome-session's builtin service manager has been completely removed. Serv=
ice
  management will now be handled entirely by the operating system's native
  service manager (i.e. systemd). See the following blog post for more info=
rmation:
  <a href=3D"https://blogs.gnome.org/adrianvovk/2025/06/10/gnome-systemd-de=
pendencies">https://blogs.gnome.org/adrianvovk/2025/06/10/gnome-systemd-dep=
endencies</a>
- The "fail whale" dialog has been removed
- Various unused APIs and interfaces were removed, including:
	- The org.gnome.SessionManager.Client and o.g.SM.App D-Bus interfaces
	- Various D-Bus APIs related to the service manager
	- Various .desktop and .session file keys that were used only by the
	  builtin service manager
	- Fallback sessions, since there's no way to fall back anymore
- The code was significantly refactored
- gnome-session now provides a gnome-session-basic-services.target, that se=
ssions
  like the GDM greeter and gnome-initial-setup can use to avoid listing all=
 of
  the basic GNOME session services (like all the gnome-settings-daemon plug=
ins)
- The --autostart command line option was removed, and instead kiosk sessio=
ns
  should set Kiosk=3Dtrue in their session definition file.
- Updated GNOME's mimetype defaults to drop Evince (which was replaced with=
 Papers)
- Translation updates

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 49.alpha.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

	Fix POTFILES to stop listing deleted files
	Stop requiring the gnome-settings-daemon Wacom plugin, which doesn't exist=
 anymore
	Ensure that we start localsearch when starting a GNOME session via systemd
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
  Neal Gompa, Sophie Herold, Javier Jard=C3=B3n, Chris Mayo, Simon McVittie=
,
  Jordan Petridis, Ray Strode, Joan Torres, Adrian Vovk, Chris Williams

Translators:
  =D0=9C=D0=B0=D1=80=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D1=9B [sr],=
 Aefgh Threenine [th], A S Alam [pa], Baxrom Raxmatov [uz],
  Ekaterine Papava [ka], Martin [sl], Quentin PAG=C3=88S [oc], Vasil Pupkin=
 [be]

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

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;
---
 .../gnome-session/gnome-session_47.0.1.bb     | 35 -------------------
 .../gnome-session/gnome-session_49.2.bb       | 27 ++++++++++++++
 2 files changed, 27 insertions(+), 35 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-session/gnome-session_47=
.0.1.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-session/gnome-session_49=
.2.bb

diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.bb=
 b/meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.bb
deleted file mode 100644
index 3bb1cb1651..0000000000
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY =3D "GNOME session"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3Db234ee4d69f5fce4486a=
80fdaf4a4263" "=3D"">file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"=
</a>
-
-DEPENDS =3D " \
-    glib-2.0-native \
-    xtrans \
-    libice \
-    libsm \
-    virtual/libx11 \
-    gtk+3 \
-    gnome-desktop \
-    json-glib \
-    systemd \
-"
-
-
-inherit gnomebase gettext gsettings upstream-version-is-even features_chec=
k
-
-REQUIRED_DISTRO_FEATURES =3D "polkit systemd pam gobject-introspection-dat=
a"
-
-SRC_URI =3D "<a href=3D"https://download.gnome.org/sources/gnome-session/$=
{@oe.utils.trim_version('${PV">https://download.gnome.org/sources/gnome-ses=
sion/${@oe.utils.trim_version('${PV</a>}', 1)}/gnome-session-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "56ae9c68e49995793eb2096bcdc4533b111669e1e54c8b6e0b=
1d952f6a5e8a70"
-
-PACKAGECONFIG ??=3D ""
-
-PACKAGECONFIG[docbook] =3D "-Ddocbook=3Dtrue, -Ddocbook=3Dfalse"
-PACKAGECONFIG[man] =3D "-Dman=3Dtrue, -Dman=3Dfalse,xmlto-native libxslt-n=
ative"
-
-FILES:${PN} +=3D " \
-   ${datadir}/xdg-desktop-portal \
-    ${datadir}/xsessions \
-    ${datadir}/wayland-sessions \
-    ${systemd_user_unitdir} \
-"
diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_49.2.bb b=
/meta-gnome/recipes-gnome/gnome-session/gnome-session_49.2.bb
new file mode 100644
index 0000000000..20f122ffd0
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_49.2.bb
@@ -0,0 +1,27 @@
+SUMMARY =3D "GNOME session"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3Db234ee4d69f5fce4486a=
80fdaf4a4263" "=3D"">file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"=
</a>
+
+DEPENDS =3D " \
+    glib-2.0 \
+    gtk4 \
+    gnome-desktop \
+    json-glib \
+"
+
+inherit gnomebase gettext gsettings upstream-version-is-even mime mime-xdg=
 manpages
+
+SRC_URI[archive.sha256sum] =3D "fcdb4f45d6a60d84e9ecae1e3740bab6e55bab0cb4=
9e0fb38280e9b38f3a8485"
+
+PACKAGECONFIG ??=3D "<a href=3D"mailto:${@bb.utils.filter">${@bb.utils.fil=
ter</a>('DISTRO_FEATURES', 'x11', d)}"
+
+PACKAGECONFIG[docbook] =3D "-Ddocbook=3Dtrue, -Ddocbook=3Dfalse"
+PACKAGECONFIG[x11] =3D "-Dx11=3Dtrue, -Dx11=3Dfalse,virtual/libx11"
+PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue, -Dman=3Dfalse,xmlto-native libx=
slt-native"
+
+FILES:${PN} +=3D " \
+   ${datadir}/xdg-desktop-portal \
+    ${datadir}/xsessions \
+    ${datadir}/wayland-sessions \
+    ${systemd_user_unitdir} \
+"
<div>--=20
</div>2.52.0

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#123538): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123538">https://lists.openembedded.org/g/openembed=
ded-devel/message/123538</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117302289/361=
8223">https://lists.openembedded.org/mt/117302289/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-muX7PQUEXKcp3ysPFG9d--


