Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E1BCE7A89
	for <webhook@archiver.kernel.org>; Sun, 24 Sep 2023 02:52:57 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.34137.1695523971781172815
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Sep 2023 19:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ixlV+X5a;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1dce0c05171so1391223fac.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 19:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695523971; x=1696128771; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oG4oAD1cXh6U+rhXkjWs38Q1LhqI2C1r9sDkK9AD6SE=;
        b=ixlV+X5aJIEzoZaI0bQOkcpzUeZIZSSodzSIaQ/NVpPvJg9IjpAjWPARs1NegpFlTW
         +mXjJjeklbgMY3w2RjCBmQiEDG0/oEREapXdSFRP08uep3Be1pFFLaMquITOPbziz/mS
         AokeFviaYw5HbA4sMQY+mXesOf94dJyjohqHAp6oAZhR1qBfzxMR/itD1kwyz8IASMkl
         LmY/OGSpskd8Iq7OPAeo3Lr4C6JkA8yKNojLJLKLCyuDza8sxVAcB2LtmP/IFPdqU3/C
         5Ntgkqkl7X9VU2cdjvVCz6VxPSLT1huad5E/f8OIJpejTIi8MhEk6T+b9yCvlAmsg/mK
         IpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695523971; x=1696128771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oG4oAD1cXh6U+rhXkjWs38Q1LhqI2C1r9sDkK9AD6SE=;
        b=jxd6OYlfPkMpmv75rvuoPA2f112aCuZcG8ooi/Ynxe1UG5PdxRO7eKg77Nga4qtBe0
         kippgPVub2C1/2R0dgT5KqNIAy5lf4O5sqO0xLFaATUT2dgnFXGrDs/24EZm/Y08iWtS
         dGyYqsNqJ31xV4Orx9UR0gOZEIqkpTJvqq1ofpCw5SO2tyCE5ov+0S6kV5CrSWyip/X+
         Bj9hdmw6VVdtirI4F/E6eHbAh6vav8E5HEC5RQJEy+0cEar7jRzprRG1E5SKGTd6eynZ
         pHfy8BdglFeTOx6Mw6lf744EIIN0uxAuQaSHt0wx39ETofUSdpTWp/armQ8Hn79FytU8
         mg/g==
X-Gm-Message-State: AOJu0YzLr5sp8GW30rMsxsTzn/9WceC899mFsNT5AqngWoMhmzq+Wng8
	DYgyS7WpPvI55OPg16Wog/f/H0uujR1+FlxgVME=
X-Google-Smtp-Source: AGHT+IFolUcxBdHnQXbM9NhGcm/C5CbFJuxB/wts/aHMVkUUCkqbLRZUpj8bP0VfGHfp9xBTicKcttUDAguLVLOYZgw=
X-Received: by 2002:a05:6870:ea90:b0:1b0:653a:af92 with SMTP id
 s16-20020a056870ea9000b001b0653aaf92mr4946040oap.8.1695523970699; Sat, 23 Sep
 2023 19:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230923151033.902586-1-f_l_k@t-online.de>
In-Reply-To: <20230923151033.902586-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Sep 2023 19:52:24 -0700
Message-ID: <CAMKF1sqvnG7y4AbNC3ZyNY+a+Ob1FhQCkv0fa_XXsztozG1HAQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCHv3] gedit: Upgrade 44.2 -> 46.1
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 02:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105102

something is still amiss.

https://errors.yoctoproject.org/Errors/Build/171993/

On Sat, Sep 23, 2023 at 8:10=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> - add recipes for libedit-amtk and libgedit-gtksourceview
> - drop deprecated amtk recipe
> - update dependencies
> - fix reproducibility issue
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb   | 22 -------------------
>  .../gedit/{gedit_44.2.bb =3D> gedit_46.1.bb}    | 13 ++++++++---
>  .../gedit/libgedit-amtk_5.8.0.bb              | 17 ++++++++++++++
>  .../gedit/libgedit-gtksourceview_299.0.4.bb   | 19 ++++++++++++++++
>  4 files changed, 46 insertions(+), 25 deletions(-)
>  delete mode 100644 meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb
>  rename meta-gnome/recipes-gnome/gedit/{gedit_44.2.bb =3D> gedit_46.1.bb}=
 (67%)
>  create mode 100644 meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
>  create mode 100644 meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview=
_299.0.4.bb
>
> diff --git a/meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb b/meta-gnome/rec=
ipes-gnome/amtk/amtk_5.6.1.bb
> deleted file mode 100644
> index fbc8f3845..000000000
> --- a/meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -SUMMARY =3D "Actions, Menus and Toolbars Kit"
> -LICENSE =3D "LGPL-3.0-or-later"
> -LIC_FILES_CHKSUM =3D "file://LICENSES/LGPL-3.0-or-later.txt;md5=3Dc51d3e=
ef3be114124d11349ca0d7e117"
> -
> -DEPENDS =3D " \
> -    glib-2.0-native \
> -    gtk+3 \
> -    gtk-doc-native \
> -    libxslt-native \
> -    docbook-xsl-stylesheets-native \
> -    python3-pygments-native \
> -"
> -
> -GNOMEBASEBUILDCLASS =3D "meson"
> -
> -GIR_MESON_OPTION =3D ""
> -
> -inherit gnomebase gettext features_check gobject-introspection
> -
> -ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> -
> -SRC_URI[archive.sha256sum] =3D "d50115b85c872aac296934b5ee726a3fa156c6f5=
ad96d27e0edd0aa5ad173228"
> diff --git a/meta-gnome/recipes-gnome/gedit/gedit_44.2.bb b/meta-gnome/re=
cipes-gnome/gedit/gedit_46.1.bb
> similarity index 67%
> rename from meta-gnome/recipes-gnome/gedit/gedit_44.2.bb
> rename to meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
> index 34c782297..0538221f4 100644
> --- a/meta-gnome/recipes-gnome/gedit/gedit_44.2.bb
> +++ b/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
> @@ -6,27 +6,34 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D75859989545e=
37968a99b631ef42722e"
>  GNOMEBASEBUILDCLASS =3D "meson"
>
>  DEPENDS =3D " \
> +    appstream-glib-native \
> +    desktop-file-utils-native \
> +    libgedit-amtk \
> +    libgedit-gtksourceview \
>      gdk-pixbuf-native \
>      gtk+3 \
>      gsettings-desktop-schemas \
>      libpeas \
>      libsoup \
>      gspell \
> -    gtksourceview4 \
>      tepl \
>  "
>
> -inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk=
-doc vala gettext features_check mime-xdg python3targetconfig
> +inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk=
-doc vala gettext features_check mime-xdg gtk-icon-cache python3targetconfi=
g
>
>  def gnome_verdir(v):
>      return oe.utils.trim_version(v, 1)
>
> -SRC_URI[archive.sha256sum] =3D "3bbb1b3775d4c277daf54aaab44b0eb83a4eb1f0=
9f0391800041c9e56893ec11"
> +SRC_URI[archive.sha256sum] =3D "a1a6e37f041765dff7227a1f5578b6f49faaf016=
b1e17e869caf5bfb94c6aa4e"
>
>  # gobject-introspection is mandatory and cannot be configured
>  REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>
> +do_install:prepend() {
> +    sed -i -e 's|${S}/src|/usr/src/debug/${PN}/${PV}-${PR}/src|g' ${B}/p=
lugins/filebrowser/gedit-file-browser-enum-types.c
> +}
> +
>  GIR_MESON_OPTION =3D ""
>
>  GTKDOC_MESON_OPTION =3D "gtk_doc"
> diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb b/meta=
-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
> new file mode 100644
> index 000000000..8067407e4
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "libgedit-amtk - Actions, Menus and Toolbars Kit for GTK app=
lications"
> +SECTION =3D "gnome"
> +LICENSE =3D "LGPL-3.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://LICENSES;md5=3D75859989545e37968a99b631ef42=
722e"
> +
> +DEPENDS =3D "glib-2.0 gtk+3"
> +
> +inherit meson pkgconfig gobject-introspection gtk-doc
> +
> +SRC_URI =3D "git://github.com/gedit-technology/libgedit-amtk.git;protoco=
l=3Dhttps;branch=3Dmain"
> +S =3D "${WORKDIR}/git"
> +SRCREV =3D "f6fbfd1c57de3d97cab2056a5c3088b0da49e8a4"
> +
> +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> +
> +GIR_MESON_OPTION =3D "gobject_introspection"
> +GTKDOC_MESON_OPTION =3D "gtk_doc"
> diff --git a/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.=
4.bb b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.4.bb
> new file mode 100644
> index 000000000..3f7ac9623
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.4.bb
> @@ -0,0 +1,19 @@
> +SUMMARY =3D "Gedit Technology - Source code editing widget"
> +SECTION =3D "gnome"
> +LICENSE =3D "LGPL-2.1-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
> +
> +DEPENDS =3D "glib-2.0 gtk+3 libxml2"
> +
> +inherit meson pkgconfig gobject-introspection gtk-doc
> +
> +SRC_URI =3D "git://github.com/gedit-technology/libgedit-gtksourceview.gi=
t;protocol=3Dhttps;branch=3Dmain"
> +S =3D "${WORKDIR}/git"
> +SRCREV =3D "7062264d635f6efe04d88217a893a97ff385b873"
> +
> +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> +
> +GIR_MESON_OPTION =3D "gobject_introspection"
> +GTKDOC_MESON_OPTION =3D "gtk_doc"
> +
> +FILES:${PN} +=3D "${datadir}"
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105095): https://lists.openembedded.org/g/openembedde=
d-devel/message/105095
> Mute This Topic: https://lists.openembedded.org/mt/101541175/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

