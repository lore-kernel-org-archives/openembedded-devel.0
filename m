Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CDCC61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 08:22:49 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2948.1788423759629834001
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 01:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CBKDIhW2;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4b21f09ea42so1490517b6e.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 01:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788423759; cv=none;
        d=google.com; s=arc-20260327;
        b=CRKggwCyI0RuIBi+l+LvlbL5IZ8DqYyWVCorW13xcY/qhvB4gOKWePV+UctVPZQTD5
         +8q6HXyUaa5g8aCILfTwcEzKaPa98FYvQTBcZyoYEYWsz8w0xHs0yPIQ0vjSuXrNTKfU
         1ZpJVScPZFVoKC9tRBprVnzDscJJPtCXwkpqemR7f6RN9/z5DXhlE734lvpXtC8m49DQ
         y4v6ncVLh48YMakBgCz+bAZNd+soNEWrLZmwmFva1YAhuGjlt8nH/j3Qf/o6fHnnhHvj
         BOGjcTi2Ie1SOSIWT674t3XINVXgGc8pH0ZQNhRbzQGZvNpAmtIdLeXa1RM8QxoZ91Kc
         uYKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GEsLc3ERIoTAG8lLNLxyLK1ZdolW7h5AzAp/39Hl3cs=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=McVYsmij2eiuE/6EGkSJF3jrynrHUvKSbKNir2QRakvkCGHD/i+bE6oDMM6AUaEhqd
         lbTalPo8P8tRztrGQ9jSmZgC9XCn3FsF89oGTLWpaA1Qc84+yxK40GE+B5caNgvQGaTq
         JcsHgw0Dbyg6heLQ1aqar+yusgGjMn3drbtz/4qjpZnwAOPtxlKXVq518YB5ianq5AaC
         W5DOm9iDzmELrFKt7Jn+7A0LQ37sWmJbkIbWumMzkNnUA0CkgcPhlbQ+nFiKHSTW+omx
         huffMAIxhXGKvudCx400O8P7JyjFzT3Jg/HoYIrRtj8tEpMopDLAkT2En/5PJCZO6PXu
         5kJg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788423759; x=1789028559; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GEsLc3ERIoTAG8lLNLxyLK1ZdolW7h5AzAp/39Hl3cs=;
        b=CBKDIhW2SWUeOjaiElpj2u9I3gUrf9g1vijttDfbN0+ZfNnBzbYNmPlvpSNDGquVZq
         g5Epz4v0e1B/PV2ExxnB2g96+9TT83xGbK4iO1IurzYlNxXjPEu9dxTB0Zn15eJeUMSZ
         BgmsS1arKUGtkkDIcmd+t09bQREYsB9LRwtxlaPQaJLzh8/1d4e/xdwyOqWGjhY+vCV3
         sdXmuDAnN0b4MYA23rX4vLCHl5/5ZnG6qF0BQvyvCZnpjHwGOwx69ZyMPW36RACuHZsl
         acL3WZAlROVoFqRPHYIlfjY73zGCoYSOuOXjOEf35UOD+rd80BQETWuVLc53UxsJx/s4
         9fuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423759; x=1789028559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GEsLc3ERIoTAG8lLNLxyLK1ZdolW7h5AzAp/39Hl3cs=;
        b=Z7LeCIpMgWyAHFx9GLxk892XcI3PlRVyxcwOUAicrHVEDk5lSHSzAXcv057cj7+DLb
         0xoBM/w2T0oyNyPgaOE8SBMt1K0Z7zlDNmx4/uMzqh+Of6DXDP3JdX2pVTI6e1gHWxjP
         VeIXMm5piLFUJ1h5PLppc/2cbAF/S0qfHDP9DbSQdVIYIIRes4h40sbXRge3BGYtDms3
         EKOgc78tXnoy6N2OfGIKY0r3ork6MnVr5h8B4PrtAKPXsjxNzuly+cv58KkbNaSrG+t9
         2sjLCanji5dbpNesoGs7lfr4/YnejshTXj70jcD4pOvSL7mOJODbtC5dQjJc1msegYvk
         EGVw==
X-Gm-Message-State: AFuF++m8C8feeK9nMttrV5BZ4+eMXpfpHFhl/q1mJQGXBBumass3Swmz
	q0WWQymifwmNXIfgS1LRhW0KP/1kFeleyRrN85qU6qQ+IzKdhGpXbwsaIQdRR2qJ+U26erY0/sw
	HBy693MWEEi7vVlx+UZQ8qWbmNpuPhkI=
X-Gm-Gg: AYBFou0oCdGdxIC9T1IoBEUF3j1QamAUe7QCc886Q0KeZQNEa4amyL0rBU9xqYNX4oM
	QH7pyPVwgkyMZKyHbsUrblM/CXGdihLZEBM1fsOC6yfemZrlXdLMH6976xvPM0rTeJ1Fq1vZRHZ
	NM5cOtHZH4543h6bI4ow3yRVxsRJxKn0Z9A7UDzH9hPOffbQY+ds2PtO4fPd+r2SpSXNxUMq0Pw
	sKvTVz45Pf4Jl5I97fukUS3oSzcVpzMgTT/5ZDC7e8c0HcwVuO6TJuOnKcxqNGmvmenBayWi9w6
	xlwAKT41C5p9lc9FYojndOq0uzbmmC3w9Ju2dYCbHD+oQqk=
X-Received: by 2002:a05:6808:5149:b0:4b3:7b31:8df7 with SMTP id
 5614622812f47-4b6bf07525bmr8454527b6e.14.1788423758658; Thu, 03 Sep 2026
 01:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260903081916.156273-1-f_l_k@t-online.de> <20260903081916.156273-5-f_l_k@t-online.de>
In-Reply-To: <20260903081916.156273-5-f_l_k@t-online.de>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 3 Sep 2026 20:22:26 +1200
X-Gm-Features: AcwNN1X1cS5FCPqdQ9Ck2FglG6fU0I4pstXLOYGd7ohaOtL9r2VJ4qUjzcdbA7w
Message-ID: <CADySD0GaqGqQ=RO3HvmwiZfcRO6jEPsdLjXdCO+yThqEwe3-dA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 5/6] gnome-shell: update
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 08:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129710

will be good to include from and to version in the commit message as well

On Thu, Sep 3, 2026 at 8:19=E2=80=AFPM Markus Volk via lists.openembedded.o=
rg
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...ver-Fix-build-failure-with-libical-4.patch | 44 ++++++++++++++++++
>  ...nome-shell_48.8.bb =3D> gnome-shell_50.4.bb} | 45 ++++++++++++-------
>  2 files changed, 73 insertions(+), 16 deletions(-)
>  create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002=
-calendar-server-Fix-build-failure-with-libical-4.patch
>  rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_48.8.bb =3D> gn=
ome-shell_50.4.bb} (65%)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-calend=
ar-server-Fix-build-failure-with-libical-4.patch b/meta-gnome/recipes-gnome=
/gnome-shell/gnome-shell/0002-calendar-server-Fix-build-failure-with-libica=
l-4.patch
> new file mode 100644
> index 0000000000..d64cf38ccc
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0002-calendar-serv=
er-Fix-build-failure-with-libical-4.patch
> @@ -0,0 +1,44 @@
> +From 91eaa9221b45b506d7a5d84a9ec8c204b5c8c34f Mon Sep 17 00:00:00 2001
> +From: Xi Ruoyao <xry111@xry111.site>
> +Date: Fri, 8 May 2026 13:13:37 +0800
> +Subject: [PATCH] calendar-server: Fix build failure with libical 4
> +
> +Fix the following build error with libical 4 due to function signature c=
hanges:
> +
> +    error: passing argument 4 of 'get_time_from_property' from incompati=
ble pointer type [-Wincompatible-pointer-types]
> +    note: expected 'ICalTime * (*)(ICalProperty *)' but argument is of t=
ype 'ICalTime * (*)(const ICalProperty *)'
> +
> +Link: https://github.com/libical/libical/blob/4.0/docs/MigrationGuide_to=
_4.md
> +Part-of: <https://gitlab.gnome.org/GNOME/gnome-shell/-/merge_requests/42=
15>
> +
> +Only the gnome-shell-calendar-server.c hunk of the upstream commit is ta=
ken;
> +src/calendar-server/reminder-watcher.c does not exist in the 50.x series=
.
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gnome-shell/-/=
commit/b34766f3992c7616b7816a47249fb463c053e5fa]
> +---
> + src/calendar-server/gnome-shell-calendar-server.c | 8 +++++++-
> + 1 file changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/calendar-server/gnome-shell-calendar-server.c b/src/cal=
endar-server/gnome-shell-calendar-server.c
> +index 0b2f88eb7..622c16181 100644
> +--- a/src/calendar-server/gnome-shell-calendar-server.c
> ++++ b/src/calendar-server/gnome-shell-calendar-server.c
> +@@ -112,11 +112,17 @@ typedef struct
> +   time_t  end_time;
> + } CalendarAppointment;
> +
> ++#if ICAL_CHECK_VERSION(4, 0, 0)
> ++typedef ICalTime * (* GetICalPropFunc) (const ICalProperty *prop);
> ++#else
> ++typedef ICalTime * (* GetICalPropFunc) (ICalProperty *prop);
> ++#endif
> ++
> + static gboolean
> + get_time_from_property (ECalClient            *cal,
> +                         ICalComponent         *icomp,
> +                         ICalPropertyKind       prop_kind,
> +-                        ICalTime * (* get_prop_func) (ICalProperty *pro=
p),
> ++                        GetICalPropFunc        get_prop_func,
> +                         ICalTimezone          *default_zone,
> +                         ICalTime              **out_itt,
> +                         ICalTimezone          **out_timezone)
> diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.8.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_50.4.bb
> similarity index 65%
> rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.8.bb
> rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_50.4.bb
> index e8b1bd6d0c..f39d72532e 100644
> --- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.8.bb
> +++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_50.4.bb
> @@ -2,48 +2,58 @@ SUMMARY =3D "GNOME Shell is the graphical shell of the =
GNOME desktop environment"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>
> -
>  DEPENDS =3D " \
>      libxml2-native \
> -    gtk4 \
> -    mutter \
> +    at-spi2-core \
>      evolution-data-server \
>      gcr \
> -    geocode-glib \
> +    gdk-pixbuf \
>      gjs \
>      gnome-autoar \
>      gnome-desktop \
> -    gnome-control-center \
> -    polkit \
> -    pipewire \
> -    libsoup-3.0 \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'startup-noti=
fication', d)} \
> -    ibus \
>      gsettings-desktop-schemas \
> +    gtk4 \
> +    libsoup-3.0 \
> +    libxml2 \
> +    mutter \
> +    pango \
> +    polkit \
>  "
>
>  inherit gnomebase gsettings gettext gobject-introspection gtk-icon-cache=
 features_check bash-completion
>
> -REQUIRED_DISTRO_FEATURES =3D "polkit systemd pam"
> +REQUIRED_DISTRO_FEATURES =3D "polkit systemd pam wayland"
>
>  GTKIC_VERSION =3D "4"
> -GTKDOC_MESON_OPTION =3D "gtk_doc"
>  GIR_MESON_OPTION =3D ""
>
>  # gobject-introspection is mandatory and cannot be configured
>  REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
>
>  SRC_URI +=3D "file://0001-shell-app-usage.c-only-include-x11-headers-if-=
HAVE_X.patch"
> -SRC_URI[archive.sha256sum] =3D "cb9b7d86cf362530e648e68caaf109a32af4e832=
874a26791ca8789773efd233"
> -
> -PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
> +SRC_URI +=3D "file://0002-calendar-server-Fix-build-failure-with-libical=
-4.patch"
> +SRC_URI[archive.sha256sum] =3D "c531939539db316a41aef23670370abd1330d325=
4f84bcb0f9f4dae5d6e362cf"
> +
> +PACKAGECONFIG ??=3D " \
> +    camera-monitor \
> +    extensions-tool \
> +    nm \
> +    portal-helper \
> +    bluetooth \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> +"
>  PACKAGECONFIG[bluetooth] =3D ",,gnome-bluetooth"
> -PACKAGECONFIG[nm] =3D "-Dnetworkmanager=3Dtrue, -Dnetworkmanager=3Dfalse=
,networkmanager libsecret,networkmanager"
> +PACKAGECONFIG[camera-monitor] =3D "-Dcamera_monitor=3Dtrue, -Dcamera_mon=
itor=3Dfalse, pipewire"
> +PACKAGECONFIG[extensions-app] =3D "-Dextensions_app=3Dtrue, -Dextensions=
_app=3Dfalse"
> +PACKAGECONFIG[extensions-tool] =3D "-Dextensions_tool=3Dtrue, -Dextensio=
ns_tool=3Dfalse, gnome-autoar json-glib libsoup-3.0"
> +PACKAGECONFIG[nm] =3D "-Dnetworkmanager=3Dtrue, -Dnetworkmanager=3Dfalse=
, networkmanager libsecret, networkmanager"
> +PACKAGECONFIG[portal-helper] =3D "-Dportal_helper=3Dtrue, -Dportal_helpe=
r=3Dfalse"
>  PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue, -Dsystemd=3Dfalse, systemd=
"
>
>  EXTRA_OEMESON +=3D " \
>      -Dtests=3Dfalse \
>      -Dman=3Dfalse \
> +    -Dgtk_doc=3Dfalse \
>      --cross-file=3D${WORKDIR}/meson-${PN}.cross \
>  "
>
> @@ -88,6 +98,9 @@ RDEPENDS:${PN} +=3D " \
>         librsvg-gtk \
>  "
>
> +# The extensions app is a GJS application and pulls libadwaita at runtim=
e only.
> +RDEPENDS:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'extensions-a=
pp', 'libadwaita', '', d)}"
> +
>  PACKAGES =3D+ "${PN}-tools ${PN}-gsettings"
>  FILES:${PN}-tools =3D "${bindir}/*-tool"
>  RDEPENDS:${PN}-tools =3D "python3-core"
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129707): https://lists.openembedded.org/g/openembedde=
d-devel/message/129707
> Mute This Topic: https://lists.openembedded.org/mt/121065948/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

