Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90615CE7A89
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 14:46:20 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.21965.1695480370965323751
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Sep 2023 07:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nBi39mQy;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1db2445b7afso2286831fac.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 07:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695480370; x=1696085170; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wlJ18+EUfb6ckuneaLa4V0+0/0aWT2cwj56wpIkjyk=;
        b=nBi39mQyb9jYfnLsHkdmJack6FTEgiU71ac3+yUNwQtgml9Lpa8eQ7b5/HZDd4lw1Z
         bR/VXARF6Rd/pw69fz2V5xk8l5YgXVFqPJGTrE6fOq1pnoNaB6H5R/vf+uZKPL9w0PPO
         3VddemkRuQyADL2ffnGrNWAEYFYRswZMuY8tQD8k22VR6G/v5WQd31f+blPOsVVhfZkh
         GbVBb5xghuW6tWsOysaf5Qz9BqsFRGZJpwK0fTv60TI5RD+3PrP8FEb2eZAqzMJ0Zz6x
         m6eH3t9vntTrNeRQ27z7ISVcx90Oy2lvm3DcQVXVGh1jCPgbmuu08ka64I7Xxi/1CSgc
         3hgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695480370; x=1696085170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3wlJ18+EUfb6ckuneaLa4V0+0/0aWT2cwj56wpIkjyk=;
        b=hm2LAYi8cNTwd8XXX1S9LYurakuOfYWKV1OquSVgtlhn9wbGAp7ncH1bM8snWvGLqg
         62LAL13JaXg+ZFruoFzrZVxBSS6+OOu+n1YZ/qnI0njWSC2pxwZM3KiGmzf5OLgxAHMW
         3UUbF9IxbDQVu5qthpIIj3cayhuKA3LrSYkuvh2ZYso03gfQSp6INkH/7XT+2bxA22Ji
         Tpj9DeAYiW6IwHGpSQofhAsc4Qdhc1bWVj53UtGfgOeED4nWXaI5TMLVw/qsVp7whOd0
         qZQpq0fUJvPT//IkABu3ThJiKZzuSGxFfAIDgaFtblUZsya+Hvc4JFj4wsvvy6U4xEB+
         cfsg==
X-Gm-Message-State: AOJu0Yzud2eDvdnZiwwufFPdXkKfdXXpbuobUJGuugB7Q2SGmPzdOgx2
	ZEUqI3ZVfbhirkjhO+0GORdFA+qmhi0jiGK82qsPzPOqZ1Nijw==
X-Google-Smtp-Source: AGHT+IE4EJ5MxF8iMvec+B0QrdpEjcYl73Z/rCw1kJOaVy4p8iDDMPjWylNFiaQnXs3wRvkq9gRcLCZDHp2QBmjrS08=
X-Received: by 2002:a05:6870:b68f:b0:1dc:6f48:504e with SMTP id
 cy15-20020a056870b68f00b001dc6f48504emr3106680oab.8.1695480369928; Sat, 23
 Sep 2023 07:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230923012830.3338338-1-f_l_k@t-online.de> <20230923012830.3338338-2-f_l_k@t-online.de>
In-Reply-To: <20230923012830.3338338-2-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Sep 2023 07:45:43 -0700
Message-ID: <CAMKF1sro9-orWKQZz1wRSLL4+WT=D8LYuUz5Vv1=PkPFd6k3PA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 2/2] gedit: Upgrade 44.2 -> 46.1
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 14:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105090

fails in license check

https://errors.yoctoproject.org/Errors/Details/738106/

Does this happen for you ?

On Fri, Sep 22, 2023 at 6:28=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> - add recipes for libedit-amtk and libgedit-gtksourceview
> - update dependencies
> - fix reproducibility issue
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../gedit/{gedit_44.2.bb =3D> gedit_46.1.bb}    | 13 ++++++++++---
>  .../gedit/libgedit-amtk_5.8.0.bb              | 17 +++++++++++++++++
>  .../gedit/libgedit-gtksourceview_299.0.4.bb   | 19 +++++++++++++++++++
>  3 files changed, 46 insertions(+), 3 deletions(-)
>  rename meta-gnome/recipes-gnome/gedit/{gedit_44.2.bb =3D> gedit_46.1.bb}=
 (67%)
>  create mode 100644 meta-gnome/recipes-gnome/gedit/libgedit-amtk_5.8.0.bb
>  create mode 100644 meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview=
_299.0.4.bb
>
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
> index 000000000..59ae16948
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
> +DEPENDS =3D "amtk"
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
> index 000000000..9a68bbda2
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gedit/libgedit-gtksourceview_299.0.4.bb
> @@ -0,0 +1,19 @@
> +SUMMARY =3D "Gedit Technology - Source code editing widget"
> +SECTION =3D "gnome"
> +LICENSE =3D "LGPL-2.1-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D75859989545e37968a99b631ef427=
22e"
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
> View/Reply Online (#105088): https://lists.openembedded.org/g/openembedde=
d-devel/message/105088
> Mute This Topic: https://lists.openembedded.org/mt/101533596/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

