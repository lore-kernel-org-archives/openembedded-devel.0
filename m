Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44299C9832F
	for <webhook@archiver.kernel.org>; Sun, 18 Jan 2026 06:54:22 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10525.1768719261610457869
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 22:54:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XoSz3wOS;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78e7ba9fc29so28961237b3.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 22:54:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768719261; cv=none;
        d=google.com; s=arc-20240605;
        b=YxA8OMr6Gel6L3Xxrdj+L84MICLVfkYJ0fQkohHWeV/od4SWD0KCif/0JNITK0ZbfE
         rucnnRUfGew3eb+10XhnXzLbDepsAyFKIhqDyBfFEPoV+cZwQDoJyBjxDK86h8QnMLMX
         f5T11ECzCP+rk0IhBC/FijdxNQCJvaLrdJdg1hlGUooqGQJtfqgOWbX8BjYh7q/ziqFp
         xlZ4KmvPefnCQASgeBhqDHBLQ8bR/IDNALNsIocmfNy2cG0+BXWrKNAEfYkMgxqKNCkJ
         +yYJ//ucToaMPV/d8SSVatm0L/5ZmGFjHaZfCJuamRtKvF5g3y0DrluGSZp/JbpfFsR0
         MAlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=21YPwjOuFVa5lUWjR+Mfop0RQd2YkNatynBawIs10sw=;
        fh=6hcUKr3duktBY3UgoTWb3oMgRC8h/CdRJUPQi4zxMzQ=;
        b=CNWUz3ipAnaOZnQfUB87oG4kCo65HvWTDlGZ40ThmBoFPcWnJKzcmHMxmkASSKQfvg
         BUUm9L5l1duWif9Ccm/xTpTZ6aGw56zAsqqLtRYwWaJMaYqpcMrwZqVLoS8hXmV5bzrX
         suUnkboaHYL0c2l9/08TaHTn7BWE6UFiOzufRhaz2va6w2wPn+8cv8ztPNp5yDRNOFgt
         EZFNN98o5Y8gy+BUSZ/U8EgWhGgQxgq20aVwLnVzO2M8KLE+1fv6mPyaFyDnAAjyjJOO
         jC+PGxD9dXESCqnxJtm2YYHocUBz0/cWOd1XM6dJOv9YV10vjIdLpf7PgoOG6v300qOk
         X9wg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768719261; x=1769324061; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=21YPwjOuFVa5lUWjR+Mfop0RQd2YkNatynBawIs10sw=;
        b=XoSz3wOSRJFmStn2Qo2ZrSCfsFUcbVyBxewvdMSSj06rNAA1QR4NMcz8LupHC+fPm1
         rvzxwHWGNfTtAegzVjWIs2lizDMCNQCWIyf0K6UwySxfHhk+xtFx8HZOmODJjYf5Wkec
         79GnQeC3lxV0EqujiW8X8KmhAT6DDoY9gnLQDTeUbsFbRrjhpo3v07vbrd8dKkpAM+jT
         +4VeSq0XeZG5ojzPL0vS2ieeOy9nFMgSpJWQHTKFRUxLn30Hy3U7UmHcuZw5ueUloqio
         9mgNK4uJ8E+ctECfK9msBxXKKGLVeTAxRqaK7Zj67kfEwjgbfyQA9K+bN7dPESuL5N2q
         GBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768719261; x=1769324061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21YPwjOuFVa5lUWjR+Mfop0RQd2YkNatynBawIs10sw=;
        b=gUFamN3rC+FDtljkpJaYCZqnRI6xgnKZprprtczFoO+V3+uDyIG5x0vhX/x95OhGNS
         S42+QsVUHm67TOB1QuLQzC+WQUh+pQJMqPGgnj5hfetn6GJr7afrxsa/Zvsx4Umxm3wW
         9+ZCFYynrchWpd23Pe+3+ZnphijZxk9HDzT/gFNPKF82Z4qorZbCm5PJCDbzTxJlyQWc
         Ut8WQnGmLINqDxc2zblf8G2Kuy/AAm+8lJPC4M/qzngfCrESp5YBTib3naR0hFDqtAAO
         CONuwS8QmUB+xJyRpPHsePUyB17rWzYdZs1S4OQvCQiUXibSglU7NQHn1VICcXbIMw1G
         Ai2Q==
X-Gm-Message-State: AOJu0YzhVV6wM0CvItOmoQRlPYptFbCrj+hC4v9+PD2aTyKz/D+1eAf6
	Ktk19CHE5Yb9qKDT3IA/92aTAHYwPO5y77YFOzE/C1XuRckxurM7G6igr5+6eYV8Z2ot3losEv6
	xXKWwRafIvVIL/3GFhtv/xS0mWq9R+jc=
X-Gm-Gg: AY/fxX4hU35iYJtAutDTRbbgcv5/jaPbumXCrbsVC5Vof7Pyus6Df+Wzb4h/By9RwZb
	vhOr2DM8Tv0sgGxxqUW6e8MHoKaRljAn4BjNSPz0unKEmWY5zmevS31hlHVWHZfI+/FidOGmTJb
	IHEmfuPDLJBgCH5i5IGMcuzOHfwQ34MJ85ze4e1uivXsqdwmE7W8IRZV8j+vAjtAoPT5+pyVIoh
	hfdRdGzzIBf8zOISMWhQBoFpsy5O9DhLHHDut7ubPsYxGjFDcMPJQ7PZIJu7rcA3qkj6/29ef4P
	Xyr9eh3nRGW4aQzj8V5YE2kQa2x3b1riJNGEE6LQkjWIgLEQfr+mIaLl4nN8398MGhLbBtbR9Lt
	pLQWCpS4PQeO8Dys6ae/0+x2Qo3bOtLuN+rQJOPFkeHt0G4Yu9Yqo+eCL
X-Received: by 2002:a05:690c:e3e6:b0:793:c8be:ea05 with SMTP id
 00721157ae682-793c8beeb09mr50706207b3.18.1768719260604; Sat, 17 Jan 2026
 22:54:20 -0800 (PST)
MIME-Version: 1.0
References: <188B48759A024316.3271208@lists.openembedded.org> <3MYY8T.Q5PYJALQRTAY1@t-online.de>
In-Reply-To: <3MYY8T.Q5PYJALQRTAY1@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 17 Jan 2026 22:53:54 -0800
X-Gm-Features: AZwV_QhwDjUh9jdOi0he267Nlkg1qy2FNvsNOqvfl8IdGeI61vCDN36VcHm3noo
Message-ID: <CAMKF1soS_O6mSq+twMZzHP8WR5GJVdTT22E9oZipmXfijuTOew@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCHv3] gnome-session: update 47.0.1 -> 49.2
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003c60630648a40b31"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 06:54:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123566

--0000000000003c60630648a40b31
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

its also breaking YP compat check

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1249/ste=
ps/12/logs/errors

On Fri, Jan 16, 2026 at 10:14=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wr=
ote:

> v3: remove systemd dependency. There is only a runtime dependency on
> logind which can also be fulfilled by e.g. elogind
>
> On Fri, Jan 16 2026 at 19:08:49 +01:00:00, Markus Volk via
> lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org> wrote=
:
>
> - update dependencies - inherit manpages mime - build x11 depending on
> DISTRO_FEATURES - rename packageconfig man->manpages to work with manpage=
s
> class =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Version 49.0 =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D - Translation updates - Fixed
> build with musl libc - Fixed some memory corruption bugs that led to
> gnome-session-init-worker crashing on logout - Fixed a memory leak in
> gnome-session-init-worker - Allowed Qt apps to use the Wayland text-input
> protocol, instead of forcing them to use the direct ibus integration plug=
in
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Version 49.rc =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D - Disabled the
> org.freedesktop.ScreenSaver proxy service on the login screen - Separated
> out the systemd-specific code from the gnome-session leader process into =
a
> dedicated executable. This makes it easier to integrate distributions tha=
t
> use alternative init systems with gnome-session (though note that this is
> still a usecase we don't officially support upstream) - Translation updat=
es
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Version 49.beta =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D - gnome-session is no
> longer started via a shell script, and instead all of the necessary setup
> is done in C. - gnome-session's builtin service manager has been complete=
ly
> removed. Service management will now be handled entirely by the operating
> system's native service manager (i.e. systemd). See the following blog po=
st
> for more information:
> https://blogs.gnome.org/adrianvovk/2025/06/10/gnome-systemd-dependencies
> - The "fail whale" dialog has been removed - Various unused APIs and
> interfaces were removed, including: - The org.gnome.SessionManager.Client
> and o.g.SM.App D-Bus interfaces - Various D-Bus APIs related to the
> service manager - Various .desktop and .session file keys that were used
> only by the builtin service manager - Fallback sessions, since there's no
> way to fall back anymore - The code was significantly refactored -
> gnome-session now provides a gnome-session-basic-services.target, that
> sessions like the GDM greeter and gnome-initial-setup can use to avoid
> listing all of the basic GNOME session services (like all the
> gnome-settings-daemon plugins) - The --autostart command line option was
> removed, and instead kiosk sessions should set Kiosk=3Dtrue in their sess=
ion
> definition file. - Updated GNOME's mimetype defaults to drop Evince (whic=
h
> was replaced with Papers) - Translation updates =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Version
> 49.alpha.1 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Fix POT=
FILES to stop listing deleted files
> Stop requiring the gnome-settings-daemon Wacom plugin, which doesn't exis=
t
> anymore Ensure that we start localsearch when starting a GNOME session vi=
a
> systemd Translation updates =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D Version 49.alpha.0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Removed XSMP Remov=
ed session restore functionality X11
> sessions are disabled by default Added a default mimeapps list for GNOME'=
s
> core apps gsd-xsettings now starts on demand in Wayland Dropped gnome-dum=
my
> session Allow Inhibit() with no app ID Unset all LC_* variables that are
> bound to REGION Ported fail whale to gtk4 Dropped session selector GUI
> Dropped the hardware acceleration check gnome-session-inhibit: Propagate
> parent death gnome-session-inhibit: Fixup terminal handling Contributors:
> Benjamin Berg, Alessandro Bono, Matthias Clasen, gnome-build-meta-bot, Ne=
al
> Gompa, Sophie Herold, Javier Jard=C3=B3n, Chris Mayo, Simon McVittie, Jor=
dan
> Petridis, Ray Strode, Joan Torres, Adrian Vovk, Chris Williams Translator=
s:
> =D0=9C=D0=B0=D1=80=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D1=9B [sr],=
 Aefgh Threenine [th], A S Alam [pa], Baxrom Raxmatov
> [uz], Ekaterine Papava [ka], Martin [sl], Quentin PAG=C3=88S [oc], Vasil =
Pupkin
> [be] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Version 48.0 =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D The gnome-session script no
> longer re-runs itself as a subprocess GNOME OS CI was ported to use a CI
> template Integrated new CI-based release process Fix bugs caused by syste=
md
> v257's inhibitor behavior changes Make `gnome-session --version` print to
> stdout rather than syslog Translation updates README updates Signed-off-b=
y:
> Markus Volk <f_l_k@t-online.de> Signed-off-by: Khem Raj <
> raj.khem@gmail.com> --- .../gnome-session/gnome-session_47.0.1.bb | 35
> ------------------- .../gnome-session/gnome-session_49.2.bb | 27
> ++++++++++++++ 2 files changed, 27 insertions(+), 35 deletions(-) delete
> mode 100644 meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.b=
b
> create mode 100644 meta-gnome/recipes-gnome/gnome-session/
> gnome-session_49.2.bb diff --git a/meta-gnome/recipes-gnome/gnome-session=
/
> gnome-session_47.0.1.bb b/meta-gnome/recipes-gnome/gnome-session/
> gnome-session_47.0.1.bb deleted file mode 100644 index
> 3bb1cb1651..0000000000 --- a/meta-gnome/recipes-gnome/gnome-session/
> gnome-session_47.0.1.bb +++ /dev/null @@ -1,35 +0,0 @@ -SUMMARY =3D "GNOM=
E
> session" -LICENSE =3D "GPL-2.0-only" -LIC_FILES_CHKSUM =3D "
> file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263" - -DEPENDS =3D " \=
 -
> glib-2.0-native \ - xtrans \ - libice \ - libsm \ - virtual/libx11 \ -
> gtk+3 \ - gnome-desktop \ - json-glib \ - systemd \ -" - - -inherit
> gnomebase gettext gsettings upstream-version-is-even features_check -
> -REQUIRED_DISTRO_FEATURES =3D "polkit systemd pam gobject-introspection-d=
ata"
> - -SRC_URI =3D "
> https://download.gnome.org/sources/gnome-session/${@oe.utils.trim_version=
('${PV}',
> 1)}/gnome-session-${PV}.tar.xz" -SRC_URI[sha256sum] =3D
> "56ae9c68e49995793eb2096bcdc4533b111669e1e54c8b6e0b1d952f6a5e8a70" -
> -PACKAGECONFIG ??=3D "" - -PACKAGECONFIG[docbook] =3D "-Ddocbook=3Dtrue,
> -Ddocbook=3Dfalse" -PACKAGECONFIG[man] =3D "-Dman=3Dtrue,
> -Dman=3Dfalse,xmlto-native libxslt-native" - -FILES:${PN} +=3D " \ -
> ${datadir}/xdg-desktop-portal \ - ${datadir}/xsessions \ -
> ${datadir}/wayland-sessions \ - ${systemd_user_unitdir} \ -" diff --git
> a/meta-gnome/recipes-gnome/gnome-session/gnome-session_49.2.bb
> b/meta-gnome/recipes-gnome/gnome-session/gnome-session_49.2.bb new file
> mode 100644 index 0000000000..20f122ffd0 --- /dev/null +++
> b/meta-gnome/recipes-gnome/gnome-session/gnome-session_49.2.bb @@ -0,0
> +1,27 @@ +SUMMARY =3D "GNOME session" +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> + +DEPENDS =3D " \ + glib-2.0 \ + gtk4 \ + gnome-desktop \ + json-glib \ =
+" +
> +inherit gnomebase gettext gsettings upstream-version-is-even mime mime-x=
dg
> manpages + +SRC_URI[archive.sha256sum] =3D
> "fcdb4f45d6a60d84e9ecae1e3740bab6e55bab0cb49e0fb38280e9b38f3a8485" +
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}" +
> +PACKAGECONFIG[docbook] =3D "-Ddocbook=3Dtrue, -Ddocbook=3Dfalse"
> +PACKAGECONFIG[x11] =3D "-Dx11=3Dtrue, -Dx11=3Dfalse,virtual/libx11"
> +PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue, -Dman=3Dfalse,xmlto-native
> libxslt-native" + +FILES:${PN} +=3D " \ + ${datadir}/xdg-desktop-portal \=
 +
> ${datadir}/xsessions \ + ${datadir}/wayland-sessions \ +
> ${systemd_user_unitdir} \ +"
> --
> 2.52.0
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all mess=
ages sent to this
> group. View/Reply Online (#123538):
> https://lists.openembedded.org/g/openembedded-devel/message/123538 Mute
> This Topic: https://lists.openembedded.org/mt/117302289/3618223 Group
> Owner: openembedded-devel+owner@lists.openembedded.org Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub [
> f_l_k@t-online.de] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003c60630648a40b31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">its also breaking YP=C2=A0compat=C2=A0check<div><br></div>=
<div><a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81=
/builds/1249/steps/12/logs/errors">https://autobuilder.yoctoproject.org/val=
kyrie/#/builders/81/builds/1249/steps/12/logs/errors</a></div></div><br><di=
v class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gma=
il_attr">On Fri, Jan 16, 2026 at 10:14=E2=80=AFAM Markus Volk &lt;<a href=
=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div id=3D"m_124194108952099=
0853geary-body" dir=3D"auto"><div>v3: remove systemd dependency. There is o=
nly a runtime dependency on logind which can also be fulfilled by e.g. elog=
ind</div></div><div id=3D"m_1241941089520990853geary-quote" dir=3D"auto"><b=
r>On Fri, Jan 16 2026 at 19:08:49 +01:00:00, Markus Volk via <a href=3D"htt=
p://lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &l=
t;f_l_k=3D<a href=3D"mailto:t-online.de@lists.openembedded.org" target=3D"_=
blank">t-online.de@lists.openembedded.org</a>&gt; wrote:<br><blockquote typ=
e=3D"cite"><div style=3D"white-space:break-spaces">- update dependencies
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
  is still a usecase we don&#39;t officially support upstream)
- Translation updates

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 49.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- gnome-session is no longer started via a shell script, and instead all of
  the necessary setup is done in C.
- gnome-session&#39;s builtin service manager has been completely removed. =
Service
  management will now be handled entirely by the operating system&#39;s nat=
ive
  service manager (i.e. systemd). See the following blog post for more info=
rmation:
  <a href=3D"https://blogs.gnome.org/adrianvovk/2025/06/10/gnome-systemd-de=
pendencies" target=3D"_blank">https://blogs.gnome.org/adrianvovk/2025/06/10=
/gnome-systemd-dependencies</a>
- The &quot;fail whale&quot; dialog has been removed
- Various unused APIs and interfaces were removed, including:
	- The org.gnome.SessionManager.Client and <a href=3D"http://o.g.SM.App" ta=
rget=3D"_blank">o.g.SM.App</a> D-Bus interfaces
	- Various D-Bus APIs related to the service manager
	- Various .desktop and .session file keys that were used only by the
	  builtin service manager
	- Fallback sessions, since there&#39;s no way to fall back anymore
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
- Updated GNOME&#39;s mimetype defaults to drop Evince (which was replaced =
with Papers)
- Translation updates

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 49.alpha.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

	Fix POTFILES to stop listing deleted files
	Stop requiring the gnome-settings-daemon Wacom plugin, which doesn&#39;t e=
xist anymore
	Ensure that we start localsearch when starting a GNOME session via systemd
	Translation updates

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 49.alpha.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

	Removed XSMP
	Removed session restore functionality
	X11 sessions are disabled by default
	Added a default mimeapps list for GNOME&#39;s core apps
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
	Fix bugs caused by systemd v257&#39;s inhibitor behavior changes
	Make `gnome-session --version` print to stdout rather than syslog
	Translation updates
	README updates

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;
---
 .../gnome-session/<a href=3D"http://gnome-session_47.0.1.bb" target=3D"_bl=
ank">gnome-session_47.0.1.bb</a>     | 35 -------------------
 .../gnome-session/<a href=3D"http://gnome-session_49.2.bb" target=3D"_blan=
k">gnome-session_49.2.bb</a>       | 27 ++++++++++++++
 2 files changed, 27 insertions(+), 35 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-session/<a href=3D"http:=
//gnome-session_47.0.1.bb" target=3D"_blank">gnome-session_47.0.1.bb</a>
 create mode 100644 meta-gnome/recipes-gnome/gnome-session/<a href=3D"http:=
//gnome-session_49.2.bb" target=3D"_blank">gnome-session_49.2.bb</a>

diff --git a/meta-gnome/recipes-gnome/gnome-session/<a href=3D"http://gnome=
-session_47.0.1.bb" target=3D"_blank">gnome-session_47.0.1.bb</a> b/meta-gn=
ome/recipes-gnome/gnome-session/<a href=3D"http://gnome-session_47.0.1.bb" =
target=3D"_blank">gnome-session_47.0.1.bb</a>
deleted file mode 100644
index 3bb1cb1651..0000000000
--- a/meta-gnome/recipes-gnome/gnome-session/<a href=3D"http://gnome-sessio=
n_47.0.1.bb" target=3D"_blank">gnome-session_47.0.1.bb</a>
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY =3D &quot;GNOME session&quot;
-LICENSE =3D &quot;GPL-2.0-only&quot;
-LIC_FILES_CHKSUM =3D &quot;<a>file://COPYING;md5=3Db234ee4d69f5fce4486a80f=
daf4a4263&quot;</a>
-
-DEPENDS =3D &quot; \
-    glib-2.0-native \
-    xtrans \
-    libice \
-    libsm \
-    virtual/libx11 \
-    gtk+3 \
-    gnome-desktop \
-    json-glib \
-    systemd \
-&quot;
-
-
-inherit gnomebase gettext gsettings upstream-version-is-even features_chec=
k
-
-REQUIRED_DISTRO_FEATURES =3D &quot;polkit systemd pam gobject-introspectio=
n-data&quot;
-
-SRC_URI =3D &quot;<a href=3D"https://download.gnome.org/sources/gnome-sess=
ion/$%7B@oe.utils.trim_version(&#39;$%7BPV" target=3D"_blank">https://downl=
oad.gnome.org/sources/gnome-session/${@oe.utils.trim_version(&#39;${PV</a>}=
&#39;, 1)}/gnome-session-${PV}.tar.xz&quot;
-SRC_URI[sha256sum] =3D &quot;56ae9c68e49995793eb2096bcdc4533b111669e1e54c8=
b6e0b1d952f6a5e8a70&quot;
-
-PACKAGECONFIG ??=3D &quot;&quot;
-
-PACKAGECONFIG[docbook] =3D &quot;-Ddocbook=3Dtrue, -Ddocbook=3Dfalse&quot;
-PACKAGECONFIG[man] =3D &quot;-Dman=3Dtrue, -Dman=3Dfalse,xmlto-native libx=
slt-native&quot;
-
-FILES:${PN} +=3D &quot; \
-   ${datadir}/xdg-desktop-portal \
-    ${datadir}/xsessions \
-    ${datadir}/wayland-sessions \
-    ${systemd_user_unitdir} \
-&quot;
diff --git a/meta-gnome/recipes-gnome/gnome-session/<a href=3D"http://gnome=
-session_49.2.bb" target=3D"_blank">gnome-session_49.2.bb</a> b/meta-gnome/=
recipes-gnome/gnome-session/<a href=3D"http://gnome-session_49.2.bb" target=
=3D"_blank">gnome-session_49.2.bb</a>
new file mode 100644
index 0000000000..20f122ffd0
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-session/<a href=3D"http://gnome-sessio=
n_49.2.bb" target=3D"_blank">gnome-session_49.2.bb</a>
@@ -0,0 +1,27 @@
+SUMMARY =3D &quot;GNOME session&quot;
+LICENSE =3D &quot;GPL-2.0-only&quot;
+LIC_FILES_CHKSUM =3D &quot;<a>file://COPYING;md5=3Db234ee4d69f5fce4486a80f=
daf4a4263&quot;</a>
+
+DEPENDS =3D &quot; \
+    glib-2.0 \
+    gtk4 \
+    gnome-desktop \
+    json-glib \
+&quot;
+
+inherit gnomebase gettext gsettings upstream-version-is-even mime mime-xdg=
 manpages
+
+SRC_URI[archive.sha256sum] =3D &quot;fcdb4f45d6a60d84e9ecae1e3740bab6e55ba=
b0cb49e0fb38280e9b38f3a8485&quot;
+
+PACKAGECONFIG ??=3D &quot;<a href=3D"mailto:$%7B@bb.utils.filter" target=
=3D"_blank">${@bb.utils.filter</a>(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;=
, d)}&quot;
+
+PACKAGECONFIG[docbook] =3D &quot;-Ddocbook=3Dtrue, -Ddocbook=3Dfalse&quot;
+PACKAGECONFIG[x11] =3D &quot;-Dx11=3Dtrue, -Dx11=3Dfalse,virtual/libx11&qu=
ot;
+PACKAGECONFIG[manpages] =3D &quot;-Dman=3Dtrue, -Dman=3Dfalse,xmlto-native=
 libxslt-native&quot;
+
+FILES:${PN} +=3D &quot; \
+   ${datadir}/xdg-desktop-portal \
+    ${datadir}/xsessions \
+    ${datadir}/wayland-sessions \
+    ${systemd_user_unitdir} \
+&quot;
<div>--=20
</div>2.52.0

</div><div style=3D"white-space:break-spaces">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#123538): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123538" target=3D"_blank">https://lists.openembedd=
ed.org/g/openembedded-devel/message/123538</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117302289/361=
8223" target=3D"_blank">https://lists.openembedded.org/mt/117302289/3618223=
</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" target=3D"_blank">https://lists.openembedded.org/g/openembedded-dev=
el/unsub</a> [<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_k@=
t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div></blockquote></div>

--0000000000003c60630648a40b31--

