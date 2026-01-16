Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D12C982E0
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 17:35:26 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2849.1768584920030614810
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jan 2026 09:35:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OWo1/m7o;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78d6a3c3b77so36921457b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 09:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768584919; x=1769189719; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5PU3zce5XapSpnGZtvo3nOMFAsq65AZZPvEXjO7oLRE=;
        b=OWo1/m7olFXqzTXpf/CsrbHSFXYZO3t1QorjPUpYODy7sorr+FC04ukQnrhnrQUgTz
         8uz4bY0E6Hrtn5zvBLja5glZqn1lkJDD15B75+wjj83JGC7CVx7P5z6ev352kpUMHc1d
         t4RshsvR4AzptKuAo9lRhKczOtZiguRWmcOGnlrruDJ1gdLWwQHgBR7LnnM6vaWsVa8Z
         o7T/8+yvqbonvrOdptz4+02pI9hUw0cLJ/mKN8I7pBhMpuG7yuexnJuY3jpS9Gjz0Jz+
         KlaRpAVclvWQJppn0vgURNzRrhaSvZHaxXghyWEADOAjWtVz4Qj0h0oJkYWk4UrRt0A9
         f2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768584919; x=1769189719;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PU3zce5XapSpnGZtvo3nOMFAsq65AZZPvEXjO7oLRE=;
        b=JAMp4/mL1Fn1r9Jp2rN8l0lK7/k65vtSz3SCmalFAnHbktGTugeyHI05ODP2Y+usQl
         GElRbtKcEa0bhH/KSoeoI764WO31ISY5Xs/cmEdjSkUI7HMNqIzdNYiqQ6knAYLkEmyM
         BMLN/zjhQIGeTSKdmue6CM/a+5Lg+IXA/W6y78JgLpEt0mmacjZDi5Rv+5YTGVvDdjQ/
         PiUo3wOiVUBzF9u+5x4O7na/DsxO1cxTZQHCBtvOz7V0+o72ucBXa74Q+8XZmQZslxCg
         4fElIrCDLYtKqrAv7HPyhvLsINfoWZtoxL84gfvYZOWJdS2TvtV5Rb3nvPmuQ0cCA0B+
         qHdw==
X-Gm-Message-State: AOJu0YyXFd3sTwqpUBH42g80XXs/5WrlWVHrU5Xa7ZedozoQgKLBmYWc
	xO+764Ai9h0K7N6BRTeTXOe8OkW8htPKFkBexTmrXsn5lpTekQ5SnioUke2lQ6MincWIjbOsFGe
	v0uPwS8rT8qibyONyaq/edNCx37nbNQ4=
X-Gm-Gg: AY/fxX6uMIwipXrOytLtB+HkLlbvJD8b9kfVt5H4Fw6oAPfOjlU/tPqyu0wxiGpI0ad
	queZE1kvozVeZVfW17kEfVC/I0kfRDvPai6YDUQaWqKAberNuNUA/ZWT/RBJ3N+7Izd6n0ghGkW
	sMQq12nmDmj6SKTsuFD9/kEDUDDXoZtPp1qfwEAj4gLtn0vrTGwFzKTIPoU0qS9abVZWI3223rb
	xi8yS7i7IUylYR2PkXWs5/FvA5KGmwtiocb4uAXSZrmPMWZMZKXcwHHk3WFDtLSZ9TdrwJKDvhx
	J/3mzCs0XzKNoFTLqXVP1VtRVg+LB4Ng0uGROwL9bOvpRVl87bi69ZbrWSQKS8N96Rc88KpEz6W
	1nC27MnzznAyNVXavG4/zuApKYwiDSEjo/uVyOX5pyR3pZg==
X-Received: by 2002:a05:690c:d8e:b0:789:2517:6ace with SMTP id
 00721157ae682-793c58d77dbmr27345667b3.25.1768584914436; Fri, 16 Jan 2026
 09:35:14 -0800 (PST)
MIME-Version: 1.0
References: <20260115161905.19141-1-f_l_k@t-online.de>
In-Reply-To: <20260115161905.19141-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Jan 2026 09:34:48 -0800
X-Gm-Features: AZwV_QjsrLdaX_GLw2dJLWc-EvPnxmWbzac2S0ABFmS61554rZJbsCFY5p605xs
Message-ID: <CAMKF1spyBOub+zwLgZrKzyBvg9wo+bTLj98kaEJ=-r+Co7K38w@mail.gmail.com>
Subject: Re: [meta-gnome][PATCHv2] gnome-session: update 47.0.1 -> 49.2
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000948510064884c3b2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 17:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123537

--000000000000948510064884c3b2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

when using distro without systemd it fails to parse e.g.

ERROR: Nothing PROVIDES 'systemd' (but
/mnt/jenkins/workspace/Yocto-world-musl/sources/meta-openembedded/meta-gnom=
e/recipes-gnome/gnome-session/gnome-session_49.2.bb
DEPENDS on or otherwise requires it)
systemd was skipped: using DISTRO 'yoe', which is missing required
DISTRO_FEATURES: 'systemd'
ERROR: Nothing RPROVIDES 'gnome-session-dev' (but
/mnt/jenkins/workspace/Yocto-world-musl/sources/meta-openembedded/meta-gnom=
e/recipes-gnome/gnome-session/gnome-session_49.2.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'gnome-session-dev'
NOTE: Runtime target 'gnome-session-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gnome-session-dev']
ERROR: Nothing RPROVIDES 'gnome-session' (but
/mnt/jenkins/workspace/Yocto-world-musl/sources/meta-openembedded/meta-gnom=
e/recipes-gnome/gnome-session/gnome-session_49.2.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'gnome-session'
NOTE: Runtime target 'gnome-session' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gnome-session']



On Thu, Jan 15, 2026 at 8:19=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:

> - update dependencies
> - inherit manpages mime
> - build x11 depending on DISTRO_FEATURES
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Version 49.0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> - Translation updates
> - Fixed build with musl libc
> - Fixed some memory corruption bugs that led to gnome-session-init-worker
>   crashing on logout
> - Fixed a memory leak in gnome-session-init-worker
> - Allowed Qt apps to use the Wayland text-input protocol, instead of
> forcing
>   them to use the direct ibus integration plugin
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Version 49.rc
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> - Disabled the org.freedesktop.ScreenSaver proxy service on the login
> screen
> - Separated out the systemd-specific code from the gnome-session leader
> process
>   into a dedicated executable. This makes it easier to integrate
> distributions
>   that use alternative init systems with gnome-session (though note that
> this
>   is still a usecase we don't officially support upstream)
> - Translation updates
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Version 49.beta
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> - gnome-session is no longer started via a shell script, and instead all =
of
>   the necessary setup is done in C.
> - gnome-session's builtin service manager has been completely removed.
> Service
>   management will now be handled entirely by the operating system's nativ=
e
>   service manager (i.e. systemd). See the following blog post for more
> information:
>   https://blogs.gnome.org/adrianvovk/2025/06/10/gnome-systemd-dependencie=
s
> - The "fail whale" dialog has been removed
> - Various unused APIs and interfaces were removed, including:
>         - The org.gnome.SessionManager.Client and o.g.SM.App D-Bus
> interfaces
>         - Various D-Bus APIs related to the service manager
>         - Various .desktop and .session file keys that were used only by
> the
>           builtin service manager
>         - Fallback sessions, since there's no way to fall back anymore
> - The code was significantly refactored
> - gnome-session now provides a gnome-session-basic-services.target, that
> sessions
>   like the GDM greeter and gnome-initial-setup can use to avoid listing
> all of
>   the basic GNOME session services (like all the gnome-settings-daemon
> plugins)
> - The --autostart command line option was removed, and instead kiosk
> sessions
>   should set Kiosk=3Dtrue in their session definition file.
> - Updated GNOME's mimetype defaults to drop Evince (which was replaced
> with Papers)
> - Translation updates
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Version 49.alpha.1
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>         Fix POTFILES to stop listing deleted files
>         Stop requiring the gnome-settings-daemon Wacom plugin, which
> doesn't exist anymore
>         Ensure that we start localsearch when starting a GNOME session vi=
a
> systemd
>         Translation updates
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Version 49.alpha.0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>         Removed XSMP
>         Removed session restore functionality
>         X11 sessions are disabled by default
>         Added a default mimeapps list for GNOME's core apps
>         gsd-xsettings now starts on demand in Wayland
>         Dropped gnome-dummy session
>         Allow Inhibit() with no app ID
>         Unset all LC_* variables that are bound to REGION
>         Ported fail whale to gtk4
>         Dropped session selector GUI
>         Dropped the hardware acceleration check
>         gnome-session-inhibit: Propagate parent death
>         gnome-session-inhibit: Fixup terminal handling
>
> Contributors:
>   Benjamin Berg, Alessandro Bono, Matthias Clasen, gnome-build-meta-bot,
>   Neal Gompa, Sophie Herold, Javier Jard=C3=B3n, Chris Mayo, Simon McVitt=
ie,
>   Jordan Petridis, Ray Strode, Joan Torres, Adrian Vovk, Chris Williams
>
> Translators:
>   =D0=9C=D0=B0=D1=80=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D1=9B [sr=
], Aefgh Threenine [th], A S Alam [pa], Baxrom Raxmatov
> [uz],
>   Ekaterine Papava [ka], Martin [sl], Quentin PAG=C3=88S [oc], Vasil Pupk=
in [be]
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Version 48.0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>         The gnome-session script no longer re-runs itself as a subprocess
>         GNOME OS CI was ported to use a CI template
>         Integrated new CI-based release process
>         Fix bugs caused by systemd v257's inhibitor behavior changes
>         Make `gnome-session --version` print to stdout rather than syslog
>         Translation updates
>         README updates
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...-session_47.0.1.bb =3D> gnome-session_49.2.bb} | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
>  rename meta-gnome/recipes-gnome/gnome-session/{gnome-session_47.0.1.bb
> =3D> gnome-session_49.2.bb} (50%)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-session/
> gnome-session_47.0.1.bb b/meta-gnome/recipes-gnome/gnome-session/
> gnome-session_49.2.bb
> similarity index 50%
> rename from meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.b=
b
> rename to meta-gnome/recipes-gnome/gnome-session/gnome-session_49.2.bb
> index 3bb1cb1651..3c39cc33e1 100644
> --- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_49.2.bb
> @@ -3,28 +3,23 @@ LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>
>  DEPENDS =3D " \
> -    glib-2.0-native \
> -    xtrans \
> -    libice \
> -    libsm \
> -    virtual/libx11 \
> -    gtk+3 \
> +    glib-2.0 \
> +    gtk4 \
>      gnome-desktop \
>      json-glib \
>      systemd \
>  "
>
>
> -inherit gnomebase gettext gsettings upstream-version-is-even
> features_check
> +inherit gnomebase gettext gsettings upstream-version-is-even mime
> mime-xdg manpages
>
> -REQUIRED_DISTRO_FEATURES =3D "polkit systemd pam gobject-introspection-d=
ata"
>
> -SRC_URI =3D "
> https://download.gnome.org/sources/gnome-session/${@oe.utils.trim_version=
('${PV}',
> 1)}/gnome-session-${PV}.tar.xz"
> -SRC_URI[sha256sum] =3D
> "56ae9c68e49995793eb2096bcdc4533b111669e1e54c8b6e0b1d952f6a5e8a70"
> +SRC_URI[archive.sha256sum] =3D
> "fcdb4f45d6a60d84e9ecae1e3740bab6e55bab0cb49e0fb38280e9b38f3a8485"
>
> -PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>
>  PACKAGECONFIG[docbook] =3D "-Ddocbook=3Dtrue, -Ddocbook=3Dfalse"
> +PACKAGECONFIG[x11] =3D "-Dx11=3Dtrue, -Dx11=3Dfalse,virtual/libx11"
>  PACKAGECONFIG[man] =3D "-Dman=3Dtrue, -Dman=3Dfalse,xmlto-native libxslt=
-native"
>
>  FILES:${PN} +=3D " \
> --
> 2.52.0
>
>

--000000000000948510064884c3b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">when using distro without systemd it fails to parse e.g.<d=
iv><br></div><div><pre style=3D"color:rgb(0,0,0)">ERROR: Nothing PROVIDES &=
#39;systemd&#39; (but /mnt/jenkins/workspace/Yocto-world-musl/sources/meta-=
openembedded/meta-gnome/recipes-gnome/gnome-session/<a href=3D"http://gnome=
-session_49.2.bb">gnome-session_49.2.bb</a> DEPENDS on or otherwise require=
s it)
systemd was skipped: using DISTRO &#39;yoe&#39;, which is missing required =
DISTRO_FEATURES: &#39;systemd&#39;
ERROR: Nothing RPROVIDES &#39;gnome-session-dev&#39; (but /mnt/jenkins/work=
space/Yocto-world-musl/sources/meta-openembedded/meta-gnome/recipes-gnome/g=
nome-session/<a href=3D"http://gnome-session_49.2.bb">gnome-session_49.2.bb=
</a> RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for &#39;gnome-session-dev&#39;
NOTE: Runtime target &#39;gnome-session-dev&#39; is unbuildable, removing..=
.
Missing or unbuildable dependency chain was: [&#39;gnome-session-dev&#39;]
ERROR: Nothing RPROVIDES &#39;gnome-session&#39; (but /mnt/jenkins/workspac=
e/Yocto-world-musl/sources/meta-openembedded/meta-gnome/recipes-gnome/gnome=
-session/<a href=3D"http://gnome-session_49.2.bb">gnome-session_49.2.bb</a>=
 RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for &#39;gnome-session&#39;
NOTE: Runtime target &#39;gnome-session&#39; is unbuildable, removing...
Missing or unbuildable dependency chain was: [&#39;gnome-session&#39;]
</pre><br class=3D"gmail-Apple-interchange-newline"></div></div><br><div cl=
ass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Thu, Jan 15, 2026 at 8:19=E2=80=AFAM Markus Volk &lt;<a href=3D"mai=
lto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">- update dependencies<br>
- inherit manpages mime<br>
- build x11 depending on DISTRO_FEATURES<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Version 49.0<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
- Translation updates<br>
- Fixed build with musl libc<br>
- Fixed some memory corruption bugs that led to gnome-session-init-worker<b=
r>
=C2=A0 crashing on logout<br>
- Fixed a memory leak in gnome-session-init-worker<br>
- Allowed Qt apps to use the Wayland text-input protocol, instead of forcin=
g<br>
=C2=A0 them to use the direct ibus integration plugin<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Version 49.rc<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
- Disabled the org.freedesktop.ScreenSaver proxy service on the login scree=
n<br>
- Separated out the systemd-specific code from the gnome-session leader pro=
cess<br>
=C2=A0 into a dedicated executable. This makes it easier to integrate distr=
ibutions<br>
=C2=A0 that use alternative init systems with gnome-session (though note th=
at this<br>
=C2=A0 is still a usecase we don&#39;t officially support upstream)<br>
- Translation updates<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Version 49.beta<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
- gnome-session is no longer started via a shell script, and instead all of=
<br>
=C2=A0 the necessary setup is done in C.<br>
- gnome-session&#39;s builtin service manager has been completely removed. =
Service<br>
=C2=A0 management will now be handled entirely by the operating system&#39;=
s native<br>
=C2=A0 service manager (i.e. systemd). See the following blog post for more=
 information:<br>
=C2=A0 <a href=3D"https://blogs.gnome.org/adrianvovk/2025/06/10/gnome-syste=
md-dependencies" rel=3D"noreferrer" target=3D"_blank">https://blogs.gnome.o=
rg/adrianvovk/2025/06/10/gnome-systemd-dependencies</a><br>
- The &quot;fail whale&quot; dialog has been removed<br>
- Various unused APIs and interfaces were removed, including:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - The org.gnome.SessionManager.Client and <a hr=
ef=3D"http://o.g.SM.App" rel=3D"noreferrer" target=3D"_blank">o.g.SM.App</a=
> D-Bus interfaces<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Various D-Bus APIs related to the service man=
ager<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Various .desktop and .session file keys that =
were used only by the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 builtin service manager<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Fallback sessions, since there&#39;s no way t=
o fall back anymore<br>
- The code was significantly refactored<br>
- gnome-session now provides a gnome-session-basic-services.target, that se=
ssions<br>
=C2=A0 like the GDM greeter and gnome-initial-setup can use to avoid listin=
g all of<br>
=C2=A0 the basic GNOME session services (like all the gnome-settings-daemon=
 plugins)<br>
- The --autostart command line option was removed, and instead kiosk sessio=
ns<br>
=C2=A0 should set Kiosk=3Dtrue in their session definition file.<br>
- Updated GNOME&#39;s mimetype defaults to drop Evince (which was replaced =
with Papers)<br>
- Translation updates<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Version 49.alpha.1<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Fix POTFILES to stop listing deleted files<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Stop requiring the gnome-settings-daemon Wacom =
plugin, which doesn&#39;t exist anymore<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Ensure that we start localsearch when starting =
a GNOME session via systemd<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Translation updates<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Version 49.alpha.0<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Removed XSMP<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Removed session restore functionality<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 X11 sessions are disabled by default<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Added a default mimeapps list for GNOME&#39;s c=
ore apps<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gsd-xsettings now starts on demand in Wayland<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Dropped gnome-dummy session<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Allow Inhibit() with no app ID<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Unset all LC_* variables that are bound to REGI=
ON<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Ported fail whale to gtk4<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Dropped session selector GUI<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Dropped the hardware acceleration check<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gnome-session-inhibit: Propagate parent death<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gnome-session-inhibit: Fixup terminal handling<=
br>
<br>
Contributors:<br>
=C2=A0 Benjamin Berg, Alessandro Bono, Matthias Clasen, gnome-build-meta-bo=
t,<br>
=C2=A0 Neal Gompa, Sophie Herold, Javier Jard=C3=B3n, Chris Mayo, Simon McV=
ittie,<br>
=C2=A0 Jordan Petridis, Ray Strode, Joan Torres, Adrian Vovk, Chris William=
s<br>
<br>
Translators:<br>
=C2=A0 =D0=9C=D0=B0=D1=80=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D1=9B =
[sr], Aefgh Threenine [th], A S Alam [pa], Baxrom Raxmatov [uz],<br>
=C2=A0 Ekaterine Papava [ka], Martin [sl], Quentin PAG=C3=88S [oc], Vasil P=
upkin [be]<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Version 48.0<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 The gnome-session script no longer re-runs itse=
lf as a subprocess<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 GNOME OS CI was ported to use a CI template<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Integrated new CI-based release process<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Fix bugs caused by systemd v257&#39;s inhibitor=
 behavior changes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Make `gnome-session --version` print to stdout =
rather than syslog<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Translation updates<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 README updates<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0...-<a href=3D"http://session_47.0.1.bb" rel=3D"noreferrer" target=3D=
"_blank">session_47.0.1.bb</a> =3D&gt; <a href=3D"http://gnome-session_49.2=
.bb" rel=3D"noreferrer" target=3D"_blank">gnome-session_49.2.bb</a>} | 17 +=
+++++-----------<br>
=C2=A01 file changed, 6 insertions(+), 11 deletions(-)<br>
=C2=A0rename meta-gnome/recipes-gnome/gnome-session/{<a href=3D"http://gnom=
e-session_47.0.1.bb" rel=3D"noreferrer" target=3D"_blank">gnome-session_47.=
0.1.bb</a> =3D&gt; <a href=3D"http://gnome-session_49.2.bb" rel=3D"noreferr=
er" target=3D"_blank">gnome-session_49.2.bb</a>} (50%)<br>
<br>
diff --git a/meta-gnome/recipes-gnome/gnome-session/<a href=3D"http://gnome=
-session_47.0.1.bb" rel=3D"noreferrer" target=3D"_blank">gnome-session_47.0=
.1.bb</a> b/meta-gnome/recipes-gnome/gnome-session/<a href=3D"http://gnome-=
session_49.2.bb" rel=3D"noreferrer" target=3D"_blank">gnome-session_49.2.bb=
</a><br>
similarity index 50%<br>
rename from meta-gnome/recipes-gnome/gnome-session/<a href=3D"http://gnome-=
session_47.0.1.bb" rel=3D"noreferrer" target=3D"_blank">gnome-session_47.0.=
1.bb</a><br>
rename to meta-gnome/recipes-gnome/gnome-session/<a href=3D"http://gnome-se=
ssion_49.2.bb" rel=3D"noreferrer" target=3D"_blank">gnome-session_49.2.bb</=
a><br>
index 3bb1cb1651..3c39cc33e1 100644<br>
--- a/meta-gnome/recipes-gnome/gnome-session/<a href=3D"http://gnome-sessio=
n_47.0.1.bb" rel=3D"noreferrer" target=3D"_blank">gnome-session_47.0.1.bb</=
a><br>
+++ b/meta-gnome/recipes-gnome/gnome-session/<a href=3D"http://gnome-sessio=
n_49.2.bb" rel=3D"noreferrer" target=3D"_blank">gnome-session_49.2.bb</a><b=
r>
@@ -3,28 +3,23 @@ LICENSE =3D &quot;GPL-2.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a8=
0fdaf4a4263&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot; \<br>
-=C2=A0 =C2=A0 glib-2.0-native \<br>
-=C2=A0 =C2=A0 xtrans \<br>
-=C2=A0 =C2=A0 libice \<br>
-=C2=A0 =C2=A0 libsm \<br>
-=C2=A0 =C2=A0 virtual/libx11 \<br>
-=C2=A0 =C2=A0 gtk+3 \<br>
+=C2=A0 =C2=A0 glib-2.0 \<br>
+=C2=A0 =C2=A0 gtk4 \<br>
=C2=A0 =C2=A0 =C2=A0gnome-desktop \<br>
=C2=A0 =C2=A0 =C2=A0json-glib \<br>
=C2=A0 =C2=A0 =C2=A0systemd \<br>
=C2=A0&quot;<br>
<br>
<br>
-inherit gnomebase gettext gsettings upstream-version-is-even features_chec=
k<br>
+inherit gnomebase gettext gsettings upstream-version-is-even mime mime-xdg=
 manpages<br>
<br>
-REQUIRED_DISTRO_FEATURES =3D &quot;polkit systemd pam gobject-introspectio=
n-data&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://download.gnome.org/sources/gnome-sess=
ion/$%7B@oe.utils.trim_version(&#39;$%7BPV%7D" rel=3D"noreferrer" target=3D=
"_blank">https://download.gnome.org/sources/gnome-session/${@oe.utils.trim_=
version(&#39;${PV}</a>&#39;, 1)}/gnome-session-${PV}.tar.xz&quot;<br>
-SRC_URI[sha256sum] =3D &quot;56ae9c68e49995793eb2096bcdc4533b111669e1e54c8=
b6e0b1d952f6a5e8a70&quot;<br>
+SRC_URI[archive.sha256sum] =3D &quot;fcdb4f45d6a60d84e9ecae1e3740bab6e55ba=
b0cb49e0fb38280e9b38f3a8485&quot;<br>
<br>
-PACKAGECONFIG ??=3D &quot;&quot;<br>
+PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#=
39;x11&#39;, d)}&quot;<br>
<br>
=C2=A0PACKAGECONFIG[docbook] =3D &quot;-Ddocbook=3Dtrue, -Ddocbook=3Dfalse&=
quot;<br>
+PACKAGECONFIG[x11] =3D &quot;-Dx11=3Dtrue, -Dx11=3Dfalse,virtual/libx11&qu=
ot;<br>
=C2=A0PACKAGECONFIG[man] =3D &quot;-Dman=3Dtrue, -Dman=3Dfalse,xmlto-native=
 libxslt-native&quot;<br>
<br>
=C2=A0FILES:${PN} +=3D &quot; \<br>
-- <br>
2.52.0<br>
<br>
</blockquote></div>

--000000000000948510064884c3b2--

