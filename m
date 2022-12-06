Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02277C3A5A7
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 21:47:04 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.1067.1670363222703302731
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Dec 2022 13:47:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=alnMKZnY;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id s187so12326925oie.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Dec 2022 13:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+SobZgkXc1E8TSexX375c6t0XZXdPnNRfTwi62IuIGY=;
        b=alnMKZnYdaUNNbsbSOxfWhNwsv7n6EClYvuZzh42vI9Oxnixz+EFlXXmueH71LVML+
         zVWWDajNAHYg2l/52T8JCHSx4Rw4yJ3SrTt/D+mB7eIr88iPZOflXS2MrOZra8U8po0P
         b/ZL+n1UwP3zT/FmoBrWL0tPk3YQAn5IquJnoJa22Rory42afTr180iEBRu0k6dTZWbO
         ECGW4HotiCQQX4tyhVjU42MbJkBxX78oHZjFG68rWYK0j3fbK8ExcO3wiU1Qwgaei311
         lktm79ixI1iupSyui9W7RvKX5mJRGsG52jK0hlzU+TUm0xVGMjvoXayl4sCi0TVgTlFg
         SQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+SobZgkXc1E8TSexX375c6t0XZXdPnNRfTwi62IuIGY=;
        b=EvLCoJMGRVpgXTASj18uodvO8Oj3HhVAqOqlHJjxFbWcS1ToJIVnGT8Cd7Fs8Tjf+I
         AsG/qAVsNFf3LL2KZZY2xbybpkeut1VAelI3pTXE/48dijvQGs+SadS+2P9LODhiNTi+
         gj5JnaixUJ0TSVPdRgR2CdOLeK+yzFFG66IrvFFZQ8Vy8ztm3WvbXqT4jKNy9H7wWfPi
         Y5rcqyu7Li50ctf8E/9aQGw43ZtH91u/5sGrlNwsVjrD3TdDtw57f4fyKazbGY8X2ovh
         mBkkKtPDQ9fFleYiKx+gqGiN1VdPtxj6LX/JnxGzkIe9EdZ4dxlAN5pSbhRpI5z+6vKf
         X4jA==
X-Gm-Message-State: ANoB5pm4esM+PQdwzRKEFEYZb22PLaHTWmZox+FqqdakC3VDX3fpoXvX
	+1mAmzSedfBhTAVNfY4sNO21mPYxYGkZkIPfoIEJU6J1
X-Google-Smtp-Source: AA0mqf7RFwES8D4Jsv5QvvYWbv6JZmlbp67nviw3t+nwuHVIsy2E9isTLOzt8uVQKspAHC1DMQa8X8MhnyYKY7gQ250=
X-Received: by 2002:aca:f046:0:b0:35c:53a9:5513 with SMTP id
 o67-20020acaf046000000b0035c53a95513mr4154420oih.262.1670363221476; Tue, 06
 Dec 2022 13:47:01 -0800 (PST)
MIME-Version: 1.0
References: <20221206193547.144679-1-f_l_k@t-online.de> <20221206193547.144679-3-f_l_k@t-online.de>
In-Reply-To: <20221206193547.144679-3-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Dec 2022 13:46:50 -0800
Message-ID: <CAMKF1spSPgpa1ZYzQrzUqOFKxhAQR_widgDhpJX7g3LD3OTJGQ@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH 3/4] xfce4: update to v4.17
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000764b2305ef2fbef5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Dec 2022 21:47:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99966

--000000000000764b2305ef2fbef5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

4.18 is due in a weeks time can we wait for that ?
And perhaps you can rebase these recipes to use 4.18

On Tue, Dec 6, 2022 at 11:36 AM Markus Volk <f_l_k@t-online.de> wrote:

> For most recipes the license file has been changed, but they all are stil=
l
> under gpl-2.0
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../recipes-xfce/exo/exo/configure.patch      | 57 ------------
>  .../reduce-build-to-exo-csource-only.patch    | 90 -------------------
>  .../exo/{exo_4.16.4.bb =3D> exo_4.17.4.bb}      |  7 +-
>  .../{garcon_4.16.1.bb =3D> garcon_4.17.3.bb}    |  2 +-
>  ...xfce4ui_4.16.1.bb =3D> libxfce4ui_4.17.9.bb} |  4 +-
>  ...4util_4.16.0.bb =3D> libxfce4util_4.17.4.bb} |  4 +-
>  ...lman_4.16.0.bb =3D> thunar-volman_4.17.1.bb} |  4 +-
>  .../{thunar_4.16.9.bb =3D> thunar_4.17.12.bb}   | 10 +--
>  .../{tumbler_4.16.0.bb =3D> tumbler_4.17.3.bb}  |  5 +-
>  ...er_4.16.1.bb =3D> xfce4-appfinder_4.17.1.bb} |  4 +-
>  ...ls_4.16.0.bb =3D> xfce4-dev-tools_4.17.1.bb} |  4 +-
>  ...t-display-desktop-icon-when-no-windo.patch | 60 -------------
>  ...-panel_4.16.3.bb =3D> xfce4-panel_4.17.5.bb} |  3 +-
>  ....16.0.bb =3D> xfce4-power-manager_4.17.0.bb} |  4 +-
>  ...sion_4.16.0.bb =3D> xfce4-session_4.17.1.bb} |  6 +-
>  ...ngs_4.16.5.bb =3D> xfce4-settings_4.17.3.bb} |  6 +-
>  .../{xfconf_4.16.0.bb =3D> xfconf_4.17.2.bb}    |  2 +-
>  ...fdesktop_4.16.0.bb =3D> xfdesktop_4.17.2.bb} |  4 +-
>  .../{xfwm4_4.16.1.bb =3D> xfwm4_4.17.2.bb}      |  4 +-
>  19 files changed, 33 insertions(+), 247 deletions(-)
>  delete mode 100644 meta-xfce/recipes-xfce/exo/exo/configure.patch
>  delete mode 100644
> meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
>  rename meta-xfce/recipes-xfce/exo/{exo_4.16.4.bb =3D> exo_4.17.4.bb} (81=
%)
>  rename meta-xfce/recipes-xfce/garcon/{garcon_4.16.1.bb =3D>
> garcon_4.17.3.bb} (89%)
>  rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.16.1.bb =3D>
> libxfce4ui_4.17.9.bb} (86%)
>  rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.16.0.bb =3D>
> libxfce4util_4.17.4.bb} (55%)
>  rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_4.16.0.bb =3D=
>
> thunar-volman_4.17.1.bb} (68%)
>  rename meta-xfce/recipes-xfce/thunar/{thunar_4.16.9.bb =3D>
> thunar_4.17.12.bb} (61%)
>  rename meta-xfce/recipes-xfce/tumbler/{tumbler_4.16.0.bb =3D>
> tumbler_4.17.3.bb} (82%)
>  rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.16.1.bb
> =3D> xfce4-appfinder_4.17.1.bb} (60%)
>  rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.16.0.bb
> =3D> xfce4-dev-tools_4.17.1.bb} (81%)
>  delete mode 100644
> meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-not-display-d=
esktop-icon-when-no-windo.patch
>  rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.16.3.bb =3D>
> xfce4-panel_4.17.5.bb} (90%)
>  rename meta-xfce/recipes-xfce/xfce4-power-manager/{
> xfce4-power-manager_4.16.0.bb =3D> xfce4-power-manager_4.17.0.bb} (85%)
>  rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.16.0.bb =3D=
>
> xfce4-session_4.17.1.bb} (77%)
>  rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.5.bb
> =3D> xfce4-settings_4.17.3.bb} (80%)
>  rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.16.0.bb =3D>
> xfconf_4.17.2.bb} (89%)
>  rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.16.0.bb =3D>
> xfdesktop_4.17.2.bb} (68%)
>  rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.16.1.bb =3D> xfwm4_4.17.2.b=
b}
> (87%)
>
> diff --git a/meta-xfce/recipes-xfce/exo/exo/configure.patch
> b/meta-xfce/recipes-xfce/exo/exo/configure.patch
> deleted file mode 100644
> index 89cc1f387..000000000
> --- a/meta-xfce/recipes-xfce/exo/exo/configure.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -From 13a74582ffd7f81dbd66a7296fc76007718e9d4d Mon Sep 17 00:00:00 2001
> -From: Andreas Mueller <schnitzeltony@gmx.de>
> -Date: Mon, 1 Aug 2011 17:16:29 +0200
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> -
> ----
> - configure.ac | 34 ++++++++++++++++++----------------
> - 1 file changed, 18 insertions(+), 16 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 0de5ceb..3f92d1b 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -143,22 +143,24 @@ AC_FUNC_MMAP()
> - dnl ***************************************
> - dnl *** Check for strftime() extensions ***
> - dnl ***************************************
> --AC_TRY_RUN([
> --  #include <string.h>
> --  #include <time.h>
> --  int
> --  main (int argc, char **argv)
> --  {
> --    struct tm tm;
> --    char      buffer[16];
> --    tm.tm_year =3D 81;
> --    if (strftime (buffer, 16, "%EY", &tm) =3D=3D 4 && strcmp (buffer,
> "1981") =3D=3D 0)
> --      return 0;
> --    return 1;
> --  }
> --], [
> --  AC_DEFINE([HAVE_STRFTIME_EXTENSION], 1, [Define if strftime supports
> %E and %O modifiers.])
> --])
> -+dnl grrrr...  this doesn't work for cross compiling, define it for OE
> -+AC_DEFINE([HAVE_STRFTIME_EXTENSION], 1, [Define if strftime supports %E
> and %O modifiers.])
> -+dnl AC_TRY_RUN([
> -+dnl   #include <string.h>
> -+dnl   #include <time.h>
> -+dnl   int
> -+dnl   main (int argc, char **argv)
> -+dnl   {
> -+dnl     struct tm tm;
> -+dnl     char      buffer[16];
> -+dnl     tm.tm_year =3D 81;
> -+dnl     if (strftime (buffer, 16, "%EY", &tm) =3D=3D 4 && strcmp (buffe=
r,
> "1981") =3D=3D 0)
> -+dnl       return 0;
> -+dnl     return 1;
> -+dnl   }
> -+dnl ], [
> -+dnl   AC_DEFINE([HAVE_STRFTIME_EXTENSION], 1, [Define if strftime
> supports %E and %O modifiers.])
> -+dnl ])
> -
> - dnl ******************************
> - dnl *** Check for i18n support ***
> diff --git
> a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
> b/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch
> deleted file mode 100644
> index 8c950299f..000000000
> --- a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.pat=
ch
> +++ /dev/null
> @@ -1,90 +0,0 @@
> -From e710d8d4a3e3480416826c70d56ea3d2598a77e4 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> -Date: Sat, 4 May 2019 14:50:11 +0200
> -Subject: [PATCH] reduce build to exo-csource only
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -exo-csource creates c-header files from glade resource output files. Whe=
n
> -building xfce-packages from git instead of tarball this
> exo-csource-native is
> -required.
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> -
> ----
> - Makefile.am  | 10 +---------
> - configure.ac | 20 --------------------
> - 2 files changed, 1 insertion(+), 29 deletions(-)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index 62ad18d..8934f1f 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -1,15 +1,7 @@
> - ACLOCAL_AMFLAGS =3D -I m4 ${ACLOCAL_FLAGS}
> -
> - SUBDIRS =3D                                                            =
 \
> --      exo                                                             \
> --      exo-csource                                                     \
> --      exo-desktop-item-edit                                           \
> --      exo-helper                                                      \
> --      exo-open                                                        \
> --      docs                                                            \
> --      icons                                                           \
> --      pixmaps                                                         \
> --      po
> -+      exo-csource
> -
> - distclean-local:
> -       rm -rf *.cache *~
> -diff --git a/configure.ac b/configure.ac
> -index 4e4eb5e..237184c 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -120,15 +120,6 @@ AC_PROG_CC()
> - AM_PROG_CC_C_O()
> - AC_PROG_INSTALL()
> - IT_PROG_INTLTOOL([intltool_minimum_version], [no-xml])
> --AC_CHECK_PROGS([PERL], [perl5 perl])
> --
> --dnl ***************************************
> --dnl *** Check for required Perl modules ***
> --dnl ***************************************
> --AC_PROG_PERL_MODULES([URI::Escape URI::file URI::URL], [],
> --[
> --  AC_MSG_ERROR([Atleast one of the required Perl modules (URI::Escape,
> URI::file and URI::URL) was not found on your system])
> --])
> -
> - dnl ***************************************
> - dnl *** Check for standard header files ***
> -@@ -175,12 +166,6 @@ dnl ***********************************
> - dnl *** Check for required packages ***
> - dnl ***********************************
> - XDT_CHECK_PACKAGE([GLIB], [glib-2.0], [2.42.0])
> --XDT_CHECK_PACKAGE([GIO], [gio-2.0], [2.42.0])
> --XDT_CHECK_PACKAGE([GTK3], [gtk+-3.0], [3.22.0])
> --XDT_CHECK_PACKAGE([GTHREAD], [gthread-2.0], [2.42.0])
> --XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.12.0])
> --XDT_CHECK_PACKAGE([LIBXFCE4UI2], [libxfce4ui-2], [4.12.0])
> --XDT_CHECK_OPTIONAL_PACKAGE([GIO_UNIX], [gio-unix-2.0], [2.42.0],
> [gio-unix], [GIO-Unix features])
> -
> - dnl ***********************************************************
> - dnl *** Optional support for a GTK+2 version of the library ***
> -@@ -190,11 +175,6 @@ XDT_CHECK_OPTIONAL_PACKAGE([GTK2],
> -                            [GTK+ 2 support])
> - AM_CONDITIONAL([ENABLE_GTK2_LIBRARY], [test "x$GTK2_FOUND" =3D "xyes"])
> -
> --dnl *********************
> --dnl *** Check for X11 ***
> --dnl *********************
> --XDT_CHECK_LIBX11_REQUIRE()
> --
> - dnl *************************
> - dnl *** Check for gtk-doc ***
> - dnl *************************
> ---
> -2.20.1
> -
> diff --git a/meta-xfce/recipes-xfce/exo/exo_4.16.4.bb
> b/meta-xfce/recipes-xfce/exo/exo_4.17.4.bb
> similarity index 81%
> rename from meta-xfce/recipes-xfce/exo/exo_4.16.4.bb
> rename to meta-xfce/recipes-xfce/exo/exo_4.17.4.bb
> index 01c3bff06..12aae5aef 100644
> --- a/meta-xfce/recipes-xfce/exo/exo_4.16.4.bb
> +++ b/meta-xfce/recipes-xfce/exo/exo_4.17.4.bb
> @@ -11,12 +11,9 @@ inherit xfce perlnative gtk-doc features_check mime-xd=
g
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>
>  # SRC_URI must follow inherited one
> -SRC_URI +=3D " \
> -    file://exo-no-tests-0.8.patch \
> -    file://configure.patch \
> -"
> +SRC_URI +=3D "file://exo-no-tests-0.8.patch"
>
> -SRC_URI[sha256sum] =3D
> "82a50c67e78f1e5c420b7615515bcca759b86eeab99224ab8eca4306b89d2eca"
> +SRC_URI[sha256sum] =3D
> "83f4b9b9217e96d0991a6cdf060fb1357f32138f4127dcb3e45c3de7de392c82"
>
>  # Note: python bindings did not work in oe-dev and are about to be moved
> to
>  # pyxfce see
> http://comments.gmane.org/gmane.comp.desktop.xfce.devel.version4/19560
> diff --git a/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
> b/meta-xfce/recipes-xfce/garcon/garcon_4.17.3.bb
> similarity index 89%
> rename from meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
> rename to meta-xfce/recipes-xfce/garcon/garcon_4.17.3.bb
> index 14f0c4a64..2b51a7379 100644
> --- a/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
> +++ b/meta-xfce/recipes-xfce/garcon/garcon_4.17.3.bb
> @@ -11,7 +11,7 @@ inherit xfce gtk-doc gobject-introspection features_che=
ck
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>
>  SRC_URI +=3D
> "file://0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch"
> -SRC_URI[sha256sum] =3D
> "84914927a2c1fda167f67af26a6640630a744a22940df508aa6c752cdbd3d21d"
> +SRC_URI[sha256sum] =3D
> "8748d3b8a35a3211f6745468d4e5c4a78e807551ced35df4671c302d5e42721e"
>
>  EXTRA_OECONF =3D "--disable-gtk-doc"
>
> diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
> b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.17.9.bb
> similarity index 86%
> rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
> rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.17.9.bb
> index 692c79f3c..17c9a6fa5 100644
> --- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
> +++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.17.9.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Xfce4 Widget library and X Window System interaction"
>  SECTION =3D "x11/libs"
>  LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D252890d9eee26aab7b432e8b8a616=
475"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4cf66a4984120007c9881cc871cf4=
9db"
>  DEPENDS =3D "intltool-native perl-native gtk+3 libxfce4util xfce4-dev-to=
ols
> xfconf"
>
>  inherit xfce gtk-doc gobject-introspection features_check
> @@ -12,7 +12,7 @@ ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>
>  # TODO: Check if 0001-... can go
>  SRC_URI +=3D
> "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch"
> -SRC_URI[sha256sum] =3D
> "d96946ae5af6bf078dda415419e0021909f763ee0020b42f3e26f603e51585f6"
> +SRC_URI[sha256sum] =3D
> "d78c1852443a930bf1cdc5a90a68ffbf302fa3c34ed0885da41c7ee2f1c57b65"
>
>  EXTRA_OECONF +=3D "--with-vendor-info=3D${DISTRO}"
>  EXTRA_OECONF +=3D "--disable-vala"
> diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
> b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.17.4.bb
> similarity index 55%
> rename from meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
> rename to meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.17.4.bb
> index 6824ac67e..64fa120eb 100644
> --- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
> +++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.17.4.bb
> @@ -1,9 +1,9 @@
>  SUMMARY =3D "Basic utility library for Xfce4"
>  SECTION =3D "x11/libs"
>  LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D252890d9eee26aab7b432e8b8a616=
475"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4cf66a4984120007c9881cc871cf4=
9db"
>  DEPENDS =3D "intltool-native xfce4-dev-tools-native glib-2.0"
>
>  inherit xfce gtk-doc gobject-introspection vala
>
> -SRC_URI[sha256sum] =3D
> "60598d745d1fc81ff5ad3cecc3a8d1b85990dd22023e7743f55abd87d8b55b83"
> +SRC_URI[sha256sum] =3D
> "bc75cb211994a816c7673618fdbff37ead7a643181ea6adb138fe004ae9d02b4"
> diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.16.0.bb
> b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.17.1.bb
> similarity index 68%
> rename from meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.16.0.bb
> rename to meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.17.1.bb
> index 4b72d3a79..9a30c5f3a 100644
> --- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.16.0.bb
> +++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_4.17.1.bb
> @@ -1,14 +1,14 @@
>  SUMMARY =3D "Automatic management of removable drives and media for thun=
ar"
>  SECTION =3D "x11"
>  LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>  DEPENDS =3D "exo libnotify libgudev"
>
>  inherit xfce features_check
>
>  REQUIRED_DISTRO_FEATURES =3D "x11"
>
> -SRC_URI[sha256sum] =3D
> "d2c0e719b242b7fd3db70bc6678a2df1abf2cfaa899b775a1591a5efa08a547d"
> +SRC_URI[sha256sum] =3D
> "9ac33664dbef4c425ccb96cdb5dd376ebe023281c987a464b7900cc7139dc605"
>
>  PACKAGECONFIG ??=3D "notify"
>  PACKAGECONFIG[notify] =3D
> "--enable-notifications,--disable-notifications,libnotify"
> diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb
> b/meta-xfce/recipes-xfce/thunar/thunar_4.17.12.bb
> similarity index 61%
> rename from meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb
> rename to meta-xfce/recipes-xfce/thunar/thunar_4.17.12.bb
> index d3702c83c..dc95d446d 100644
> --- a/meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb
> +++ b/meta-xfce/recipes-xfce/thunar/thunar_4.17.12.bb
> @@ -1,8 +1,8 @@
>  SUMMARY =3D "File manager for the Xfce Desktop Environment"
>  SECTION =3D "x11"
>  LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> -DEPENDS =3D "libxml-parser-perl-native exo gdk-pixbuf libxfce4ui libnoti=
fy
> xfce4-panel udev"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +DEPENDS =3D "exo gdk-pixbuf libxfce4ui xfce4-panel xfconf gtk+3 glib-2.0
> pango udev"
>
>  inherit xfce gobject-introspection features_check mime-xdg perlnative
>
> @@ -10,11 +10,7 @@ inherit xfce gobject-introspection features_check
> mime-xdg perlnative
>  # cairo would at least needed to be built with xlib.
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>
> -SRC_URI[sha256sum] =3D
> "520bf318eef8bc792db38ae4af343b648f87d4b8d66f5b5d6f092e15264ee5af"
> -
> -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> -PACKAGECONFIG[pcre] =3D "--enable-pcre,--disable-pcre,libpcre"
> -PACKAGECONFIG[x11] =3D ",,libsm startup-notification"
> +SRC_URI[sha256sum] =3D
> "b0cd2a8b6e1b9d3fbd59c6e1202b8f54b970f66f5bd2254046d00968bd08ca36"
>
>  FILES:${PN} +=3D " \
>      ${libdir}/thunarx-3/* \
> diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb
> b/meta-xfce/recipes-xfce/tumbler/tumbler_4.17.3.bb
> similarity index 82%
> rename from meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb
> rename to meta-xfce/recipes-xfce/tumbler/tumbler_4.17.3.bb
> index 6a583ade7..1e5f34fbc 100644
> --- a/meta-xfce/recipes-xfce/tumbler/tumbler_4.16.0.bb
> +++ b/meta-xfce/recipes-xfce/tumbler/tumbler_4.17.3.bb
> @@ -2,11 +2,11 @@ DESCRIPTION =3D "Thumbnail service implementing the
> thumbnail management D-Bus spe
>  SECTION =3D "x11/libs"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> -DEPENDS =3D "freetype gdk-pixbuf poppler curl xfce4-dev-tools-native
> libxml2 libgsf"
> +DEPENDS =3D "freetype gdk-pixbuf poppler xfce4-dev-tools-native
> libxfce4util"
>
>  inherit xfce gtk-doc
>
> -SRC_URI[sha256sum] =3D
> "9b0b7fed0c64041733d490b1b307297984629d0dd85369749617a8766850af66"
> +SRC_URI[sha256sum] =3D
> "61181220ca5cfcf50112af2c5047f14154944a9253a697062d42e99203638821"
>
>  INSANE_SKIP:${PN} =3D "dev-so"
>
> @@ -23,6 +23,7 @@ FILES:${PN} +=3D "${datadir}/dbus-1/services \
>                  ${libdir}/tumbler-1/tumblerd \
>                  ${libdir}/tumbler-1/plugins/*.so \
>                  ${libdir}/tumbler-1/plugins/cache/*.so \
> +                ${systemd_user_unitdir} \
>  "
>
>  FILES:${PN}-dev +=3D "${libdir}/tumbler-1/plugins/*.la \
> diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/
> xfce4-appfinder_4.16.1.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/
> xfce4-appfinder_4.17.1.bb
> similarity index 60%
> rename from meta-xfce/recipes-xfce/xfce4-appfinder/
> xfce4-appfinder_4.16.1.bb
> rename to meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.17.1.b=
b
> index 18d9fedfc..5f96417bc 100644
> --- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.16.1.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.17.1.bb
> @@ -1,13 +1,13 @@
>  DESCRIPTION =3D "Xfce4 Application Finder"
>  SECTION =3D "x11"
>  LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>  DEPENDS =3D "glib-2.0 gtk+3 libxfce4util libxfce4ui garcon xfconf"
>
>  inherit xfce features_check
>
>  REQUIRED_DISTRO_FEATURES =3D "x11"
>
> -SRC_URI[sha256sum] =3D
> "bfe3e9bd92695014ee74a2fbb7f5fd1b4c29cf043c4a11598b8958324c81e7ec"
> +SRC_URI[sha256sum] =3D
> "5482dc18c2b8bdeebc95ccadacc6ce46d717d32009509a8491b8720cf1c2c996"
>
>  FILES:${PN} +=3D "${datadir}/metainfo"
> diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/
> xfce4-dev-tools_4.16.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/
> xfce4-dev-tools_4.17.1.bb
> similarity index 81%
> rename from meta-xfce/recipes-xfce/xfce4-dev-tools/
> xfce4-dev-tools_4.16.0.bb
> rename to meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.17.1.b=
b
> index 586a77efc..2c01bb7e3 100644
> --- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.16.0.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.17.1.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Xfce4 development tools"
>  HOMEPAGE =3D "http://www.xfce.org"
>  SECTION =3D "x11/libs"
>  LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9ac2e7cff1ddaf48b6eab6028f23e=
f88"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>
>  DEPENDS =3D "glib-2.0"
>  DEPENDS:append:class-target =3D " ${BPN}-native"
> @@ -15,7 +15,7 @@ SRC_URI =3D "
> http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BPN}-${PV}
>
> file://0001-m4macros-Check-for-a-function-provided-by-libX11-in-.patch \
>             "
>  SRC_URI:append:class-target =3D "
> file://0001-Run-native-xdt-csource-on-tests.patch"
> -SRC_URI[sha256sum] =3D
> "f50b3070e66f3ebdf331744dd1ec5e1af5de333965d491e15ce05545e8eb4f04"
> +SRC_URI[sha256sum] =3D
> "e9af0efc1acfe443cf513e7f82621f81ef62b50e2bf241096a41b90489ef4f9f"
>
>  do_install:append() {
>      install -d ${D}${datadir}/aclocal
> diff --git
> a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-not-display=
-desktop-icon-when-no-windo.patch
> b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-not-display=
-desktop-icon-when-no-windo.patch
> deleted file mode 100644
> index 1adb14552..000000000
> ---
> a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-not-display=
-desktop-icon-when-no-windo.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -From 0651f228cef01a6c3e4758a991cace1cd7721031 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> -Date: Mon, 24 Sep 2012 09:57:46 +0200
> -Subject: [PATCH] windowmenu: do not display desktop icon when no window =
is
> - active
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -* desktop icon is of no use
> -* desktop icon confuses when using showdesktop plugin
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ----
> - plugins/windowmenu/windowmenu.c | 10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/plugins/windowmenu/windowmenu.c
> b/plugins/windowmenu/windowmenu.c
> -index f47e993e..061d6544 100644
> ---- a/plugins/windowmenu/windowmenu.c
> -+++ b/plugins/windowmenu/windowmenu.c
> -@@ -251,7 +251,7 @@ window_menu_plugin_init (WindowMenuPlugin *plugin)
> -   g_signal_connect (G_OBJECT (plugin->button), "toggled",
> -       G_CALLBACK (window_menu_plugin_menu), plugin);
> -
> --  plugin->icon =3D gtk_image_new_from_icon_name ("user-desktop",
> GTK_ICON_SIZE_BUTTON);
> -+  plugin->icon =3D gtk_image_new_from_icon_name (NULL,
> GTK_ICON_SIZE_BUTTON);
> -   gtk_container_add (GTK_CONTAINER (plugin->button), plugin->icon);
> -   gtk_widget_show (plugin->icon);
> - }
> -@@ -640,7 +640,7 @@ window_menu_plugin_active_window_changed (WnckScreen
>      *screen,
> -           /* skip 'fake' windows */
> -           type =3D wnck_window_get_window_type (window);
> -           if (type =3D=3D WNCK_WINDOW_DESKTOP || type =3D=3D WNCK_WINDO=
W_DOCK)
> --            goto show_desktop_icon;
> -+            goto show_no_icon;
> -
> -           /* get the window icon and set the tooltip */
> -           gtk_widget_set_tooltip_text (GTK_WIDGET (icon),
> -@@ -660,12 +660,12 @@ window_menu_plugin_active_window_changed
> (WnckScreen       *screen,
> -         }
> -       else
> -         {
> --          show_desktop_icon:
> -+          show_no_icon:
> -
> -           /* desktop is shown right now */
> --          gtk_image_set_from_icon_name (GTK_IMAGE (icon),
> "user-desktop", icon_size);
> -+          gtk_image_set_from_icon_name (GTK_IMAGE (icon), NULL,
> icon_size);
> -           gtk_image_set_pixel_size (GTK_IMAGE (icon), icon_size);
> --          gtk_widget_set_tooltip_text (GTK_WIDGET (icon), _("Desktop"))=
;
> -+          gtk_widget_set_tooltip_text (GTK_WIDGET (icon), _("No
> Windows"));
> -         }
> -     }
> - }
> ---
> -2.14.3
> -
> diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
> b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.17.5.bb
> similarity index 90%
> rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
> rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.17.5.bb
> index 46d26159a..b9e55960a 100644
> --- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.17.5.bb
> @@ -10,9 +10,8 @@ inherit xfce gtk-doc gobject-introspection
> features_check mime-xdg
>  # cairo would at least needed to be built with xlib.
>  ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
>
> -SRC_URI[sha256sum] =3D
> "5934eaed8a76da52c29b734ccd79600255420333dd6ebd8fd9f066379af1e092"
> +SRC_URI[sha256sum] =3D
> "096b1230f6cde17f2497daa7cbe8316478a5500944e7a90b8a61e26961414fef"
>  SRC_URI +=3D " \
> -
> file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
>      file://0002-use-lxdm-to-replace-dm-tool.patch \
>  "
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/
> xfce4-power-manager_4.16.0.bb
> b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.17.0.b=
b
> similarity index 85%
> rename from meta-xfce/recipes-xfce/xfce4-power-manager/
> xfce4-power-manager_4.16.0.bb
> rename to meta-xfce/recipes-xfce/xfce4-power-manager/
> xfce4-power-manager_4.17.0.bb
> index 34de7a708..dca9d18e4 100644
> --- a/meta-xfce/recipes-xfce/xfce4-power-manager/
> xfce4-power-manager_4.16.0.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-power-manager/
> xfce4-power-manager_4.17.0.bb
> @@ -9,9 +9,9 @@ inherit xfce features_check
>
>  REQUIRED_DISTRO_FEATURES =3D "x11"
>
> -DEPENDS +=3D "libnotify libxrandr virtual/libx11 libxext xfce4-panel upo=
wer
> libxscrnsaver"
> +DEPENDS +=3D "libnotify libxfce4ui libxfce4util gtk+3 glib-2.0 xrandr
> virtual/libx11 xfce4-panel upower"
>
> -SRC_URI[sha256sum] =3D
> "eb9c587c01b502fa45a32e7fc2aba98fa6d8391475133883654f77e562c43bf3"
> +SRC_URI[sha256sum] =3D
> "2deca68f816705de5c4f11aad48b1157ce715da467bd3eaba723299df861615b"
>
>  EXTRA_OECONF =3D " \
>      --enable-network-manager \
> diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb
> b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.17.1.bb
> similarity index 77%
> rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb
> rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.17.1.bb
> index e6613b8ee..014ae589e 100644
> --- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.17.1.bb
> @@ -1,9 +1,9 @@
>  SUMMARY =3D "xfce4-session is a session manager for Xfce 4 Desktop
> Environment"
>  SECTION =3D "x11"
>  LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9ac2e7cff1ddaf48b6eab6028f23e=
f88"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>
> -DEPENDS =3D "libwnck3 libsm libxfce4ui virtual/libx11"
> +DEPENDS =3D "libxfce4util libxfce4ui xfconf libwnck3 libsm libxfce4ui
> virtual/libx11"
>
>  inherit xfce update-alternatives features_check
>
> @@ -13,7 +13,7 @@ PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURE=
S',
> 'polkit', d)}"
>  PACKAGECONFIG[polkit] =3D "--enable-polkit, --disable-polkit, polkit"
>
>  SRC_URI +=3D "file://0001-configure.in-hard-code-path-to-iceauth.patch"
> -SRC_URI[sha256sum] =3D
> "22f273f212481d71e0b5618c62710cd85f69aea74f5ea5c0093f7918b07d17b7"
> +SRC_URI[sha256sum] =3D
> "6c2d1dd49200a4f4e39a9459b055d8c1792188d4fb23400eff5a6795b204a48b"
>
>  ALTERNATIVE:${PN} =3D "x-session-manager"
>  ALTERNATIVE_TARGET[x-session-manager] =3D "${bindir}/xfce4-session"
> diff --git a/meta-xfce/recipes-xfce/xfce4-settings/
> xfce4-settings_4.16.5.bb b/meta-xfce/recipes-xfce/xfce4-settings/
> xfce4-settings_4.17.3.bb
> similarity index 80%
> rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.b=
b
> rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.17.3.bb
> index 4a4e9f188..662d85a4e 100644
> --- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.17.3.bb
> @@ -1,15 +1,15 @@
>  SUMMARY =3D "Xfce4 settings"
>  SECTION =3D "x11/wm"
>  LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> -DEPENDS =3D "exo garcon libxi virtual/libx11 xrandr libxcursor libxklavi=
er
> upower"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +DEPENDS =3D "exo garcon gtk+3 glib-2.0 libxfce4util libxfce4ui xfconf
> fontconfig intltool-native"
>
>  inherit xfce features_check mime-xdg
>
>  REQUIRED_DISTRO_FEATURES =3D "x11"
>
>  SRC_URI +=3D "file://0001-xsettings.xml-Set-default-themes.patch"
> -SRC_URI[sha256sum] =3D
> "7a4f74802486d7e77a1c9fa4fda19b13fc8a8dec3e5074f367e34fa82b40d28e"
> +SRC_URI[sha256sum] =3D
> "8bc5905d2157186e0b9c01421df0b7cbb7e8618653b495810dd95e95888162e2"
>
>  EXTRA_OECONF +=3D "--enable-maintainer-mode --disable-debug"
>
> diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb
> b/meta-xfce/recipes-xfce/xfconf/xfconf_4.17.2.bb
> similarity index 89%
> rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb
> rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.17.2.bb
> index be742192b..716fe3cf0 100644
> --- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb
> +++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.17.2.bb
> @@ -8,7 +8,7 @@ inherit xfce gtk-doc gobject-introspection bash-completio=
n
> vala
>
>  EXTRA_OECONF +=3D "PERL=3D${STAGING_DIR_TARGET}/usr/bin/perl"
>
> -SRC_URI[sha256sum] =3D
> "652a119007c67d9ba6c0bc7a740c923d33f32d03dc76dfc7ba682584e72a5425"
> +SRC_URI[sha256sum] =3D
> "e4eefa03cdd3672f928e80bf86f68ba9e9ea3e1ee8208f8d964610c416ee8db0"
>
>  FILES:${PN} +=3D "${libdir}/xfce4/xfconf/xfconfd \
>                  ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
> diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.16.0.bb
> b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.17.2.bb
> similarity index 68%
> rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.16.0.bb
> rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.17.2.bb
> index 4a1ece8be..3b0698075 100644
> --- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.16.0.bb
> +++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.17.2.bb
> @@ -2,13 +2,13 @@ SUMMARY =3D "Xfce4 Desktop Manager"
>  SECTION =3D "x11/base"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> -DEPENDS =3D "libxfce4ui libwnck thunar garcon exo"
> +DEPENDS =3D "libxfce4ui libxfce4util cairo xfconf gtk+3 libwnck3 thunar
> garcon exo"
>
>  inherit xfce features_check
>
>  REQUIRED_DISTRO_FEATURES =3D "x11"
>
> -SRC_URI[sha256sum] =3D
> "934ba5affecff21e62d9fac1dd50c50cd94b3a807fefa5f5bff59f3d6f155bae"
> +SRC_URI[sha256sum] =3D
> "e68128dc72924680ed384d32b95e3a18d94a1ec490c05dab43155cac737bcdd1"
>
>  PACKAGECONFIG ??=3D "notify"
>  PACKAGECONFIG[notify] =3D
> "--enable-notifications,--disable-notifications,libnotify"
> diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.1.bb
> b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.17.2.bb
> similarity index 87%
> rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.1.bb
> rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.17.2.bb
> index a32bad47e..b24130216 100644
> --- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.16.1.bb
> +++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.17.2.bb
> @@ -2,13 +2,13 @@ DESCRIPTION =3D "Xfce4 Window Manager"
>  SECTION =3D "x11/wm"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd791728a073bc009b4ffaf00b7599=
855"
> -DEPENDS =3D "virtual/libx11 libxfce4ui libwnck3 libxinerama"
> +DEPENDS =3D "virtual/libx11 libxfce4ui libxfce4util xfconf libwnck3
> libxinerama"
>
>  inherit xfce update-alternatives features_check
>
>  REQUIRED_DISTRO_FEATURES =3D "x11"
>
> -SRC_URI[sha256sum] =3D
> "b5b24ca04bd73c642db0a4b4df81d262381d758f01b51108257d48b391b8718c"
> +SRC_URI[sha256sum] =3D
> "b7200498ce57d1f2d11ef2191b4853c5cf65d3b5206afb6f1af6bf4f22469d29"
>
>  PACKAGECONFIG ?=3D " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'epoxy', '', d)} \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99964):
> https://lists.openembedded.org/g/openembedded-devel/message/99964
> Mute This Topic: https://lists.openembedded.org/mt/95501111/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000764b2305ef2fbef5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">4.18 is due in a weeks time can we wait for that ?</div><=
div dir=3D"auto">And perhaps you can rebase these recipes to use 4.18=C2=A0=
</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, Dec 6, 2022 at 11:36 AM Markus Volk &lt;<a href=3D"mailto:f_l_=
k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">For most recipes the license file has been changed, but they =
all are still under gpl-2.0<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0.../recipes-xfce/exo/exo/configure.patch=C2=A0 =C2=A0 =C2=A0 | 57 ---=
---------<br>
=C2=A0.../reduce-build-to-exo-csource-only.patch=C2=A0 =C2=A0 | 90 --------=
-----------<br>
=C2=A0.../exo/{<a href=3D"http://exo_4.16.4.bb" rel=3D"noreferrer" target=
=3D"_blank">exo_4.16.4.bb</a> =3D&gt; <a href=3D"http://exo_4.17.4.bb" rel=
=3D"noreferrer" target=3D"_blank">exo_4.17.4.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 7 +-<br>
=C2=A0.../{<a href=3D"http://garcon_4.16.1.bb" rel=3D"noreferrer" target=3D=
"_blank">garcon_4.16.1.bb</a> =3D&gt; <a href=3D"http://garcon_4.17.3.bb" r=
el=3D"noreferrer" target=3D"_blank">garcon_4.17.3.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
=C2=A0...<a href=3D"http://xfce4ui_4.16.1.bb" rel=3D"noreferrer" target=3D"=
_blank">xfce4ui_4.16.1.bb</a> =3D&gt; <a href=3D"http://libxfce4ui_4.17.9.b=
b" rel=3D"noreferrer" target=3D"_blank">libxfce4ui_4.17.9.bb</a>} |=C2=A0 4=
 +-<br>
=C2=A0...<a href=3D"http://4util_4.16.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">4util_4.16.0.bb</a> =3D&gt; <a href=3D"http://libxfce4util_4.17.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">libxfce4util_4.17.4.bb</a>} |=C2=A0 4=
 +-<br>
=C2=A0...<a href=3D"http://lman_4.16.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">lman_4.16.0.bb</a> =3D&gt; <a href=3D"http://thunar-volman_4.17.1.bb" =
rel=3D"noreferrer" target=3D"_blank">thunar-volman_4.17.1.bb</a>} |=C2=A0 4=
 +-<br>
=C2=A0.../{<a href=3D"http://thunar_4.16.9.bb" rel=3D"noreferrer" target=3D=
"_blank">thunar_4.16.9.bb</a> =3D&gt; <a href=3D"http://thunar_4.17.12.bb" =
rel=3D"noreferrer" target=3D"_blank">thunar_4.17.12.bb</a>}=C2=A0 =C2=A0| 1=
0 +--<br>
=C2=A0.../{<a href=3D"http://tumbler_4.16.0.bb" rel=3D"noreferrer" target=
=3D"_blank">tumbler_4.16.0.bb</a> =3D&gt; <a href=3D"http://tumbler_4.17.3.=
bb" rel=3D"noreferrer" target=3D"_blank">tumbler_4.17.3.bb</a>}=C2=A0 |=C2=
=A0 5 +-<br>
=C2=A0...<a href=3D"http://er_4.16.1.bb" rel=3D"noreferrer" target=3D"_blan=
k">er_4.16.1.bb</a> =3D&gt; <a href=3D"http://xfce4-appfinder_4.17.1.bb" re=
l=3D"noreferrer" target=3D"_blank">xfce4-appfinder_4.17.1.bb</a>} |=C2=A0 4=
 +-<br>
=C2=A0...<a href=3D"http://ls_4.16.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">ls_4.16.0.bb</a> =3D&gt; <a href=3D"http://xfce4-dev-tools_4.17.1.bb" re=
l=3D"noreferrer" target=3D"_blank">xfce4-dev-tools_4.17.1.bb</a>} |=C2=A0 4=
 +-<br>
=C2=A0...t-display-desktop-icon-when-no-windo.patch | 60 -------------<br>
=C2=A0...-<a href=3D"http://panel_4.16.3.bb" rel=3D"noreferrer" target=3D"_=
blank">panel_4.16.3.bb</a> =3D&gt; <a href=3D"http://xfce4-panel_4.17.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">xfce4-panel_4.17.5.bb</a>} |=C2=A0 3 =
+-<br>
=C2=A0....<a href=3D"http://16.0.bb" rel=3D"noreferrer" target=3D"_blank">1=
6.0.bb</a> =3D&gt; <a href=3D"http://xfce4-power-manager_4.17.0.bb" rel=3D"=
noreferrer" target=3D"_blank">xfce4-power-manager_4.17.0.bb</a>} |=C2=A0 4 =
+-<br>
=C2=A0...<a href=3D"http://sion_4.16.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">sion_4.16.0.bb</a> =3D&gt; <a href=3D"http://xfce4-session_4.17.1.bb" =
rel=3D"noreferrer" target=3D"_blank">xfce4-session_4.17.1.bb</a>} |=C2=A0 6=
 +-<br>
=C2=A0...<a href=3D"http://ngs_4.16.5.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ngs_4.16.5.bb</a> =3D&gt; <a href=3D"http://xfce4-settings_4.17.3.bb" r=
el=3D"noreferrer" target=3D"_blank">xfce4-settings_4.17.3.bb</a>} |=C2=A0 6=
 +-<br>
=C2=A0.../{<a href=3D"http://xfconf_4.16.0.bb" rel=3D"noreferrer" target=3D=
"_blank">xfconf_4.16.0.bb</a> =3D&gt; <a href=3D"http://xfconf_4.17.2.bb" r=
el=3D"noreferrer" target=3D"_blank">xfconf_4.17.2.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 2 +-<br>
=C2=A0...<a href=3D"http://fdesktop_4.16.0.bb" rel=3D"noreferrer" target=3D=
"_blank">fdesktop_4.16.0.bb</a> =3D&gt; <a href=3D"http://xfdesktop_4.17.2.=
bb" rel=3D"noreferrer" target=3D"_blank">xfdesktop_4.17.2.bb</a>} |=C2=A0 4=
 +-<br>
=C2=A0.../{<a href=3D"http://xfwm4_4.16.1.bb" rel=3D"noreferrer" target=3D"=
_blank">xfwm4_4.16.1.bb</a> =3D&gt; <a href=3D"http://xfwm4_4.17.2.bb" rel=
=3D"noreferrer" target=3D"_blank">xfwm4_4.17.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 4 +-<br>
=C2=A019 files changed, 33 insertions(+), 247 deletions(-)<br>
=C2=A0delete mode 100644 meta-xfce/recipes-xfce/exo/exo/configure.patch<br>
=C2=A0delete mode 100644 meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo=
-csource-only.patch<br>
=C2=A0rename meta-xfce/recipes-xfce/exo/{<a href=3D"http://exo_4.16.4.bb" r=
el=3D"noreferrer" target=3D"_blank">exo_4.16.4.bb</a> =3D&gt; <a href=3D"ht=
tp://exo_4.17.4.bb" rel=3D"noreferrer" target=3D"_blank">exo_4.17.4.bb</a>}=
 (81%)<br>
=C2=A0rename meta-xfce/recipes-xfce/garcon/{<a href=3D"http://garcon_4.16.1=
.bb" rel=3D"noreferrer" target=3D"_blank">garcon_4.16.1.bb</a> =3D&gt; <a h=
ref=3D"http://garcon_4.17.3.bb" rel=3D"noreferrer" target=3D"_blank">garcon=
_4.17.3.bb</a>} (89%)<br>
=C2=A0rename meta-xfce/recipes-xfce/libxfce4ui/{<a href=3D"http://libxfce4u=
i_4.16.1.bb" rel=3D"noreferrer" target=3D"_blank">libxfce4ui_4.16.1.bb</a> =
=3D&gt; <a href=3D"http://libxfce4ui_4.17.9.bb" rel=3D"noreferrer" target=
=3D"_blank">libxfce4ui_4.17.9.bb</a>} (86%)<br>
=C2=A0rename meta-xfce/recipes-xfce/libxfce4util/{<a href=3D"http://libxfce=
4util_4.16.0.bb" rel=3D"noreferrer" target=3D"_blank">libxfce4util_4.16.0.b=
b</a> =3D&gt; <a href=3D"http://libxfce4util_4.17.4.bb" rel=3D"noreferrer" =
target=3D"_blank">libxfce4util_4.17.4.bb</a>} (55%)<br>
=C2=A0rename meta-xfce/recipes-xfce/thunar-volman/{<a href=3D"http://thunar=
-volman_4.16.0.bb" rel=3D"noreferrer" target=3D"_blank">thunar-volman_4.16.=
0.bb</a> =3D&gt; <a href=3D"http://thunar-volman_4.17.1.bb" rel=3D"noreferr=
er" target=3D"_blank">thunar-volman_4.17.1.bb</a>} (68%)<br>
=C2=A0rename meta-xfce/recipes-xfce/thunar/{<a href=3D"http://thunar_4.16.9=
.bb" rel=3D"noreferrer" target=3D"_blank">thunar_4.16.9.bb</a> =3D&gt; <a h=
ref=3D"http://thunar_4.17.12.bb" rel=3D"noreferrer" target=3D"_blank">thuna=
r_4.17.12.bb</a>} (61%)<br>
=C2=A0rename meta-xfce/recipes-xfce/tumbler/{<a href=3D"http://tumbler_4.16=
.0.bb" rel=3D"noreferrer" target=3D"_blank">tumbler_4.16.0.bb</a> =3D&gt; <=
a href=3D"http://tumbler_4.17.3.bb" rel=3D"noreferrer" target=3D"_blank">tu=
mbler_4.17.3.bb</a>} (82%)<br>
=C2=A0rename meta-xfce/recipes-xfce/xfce4-appfinder/{<a href=3D"http://xfce=
4-appfinder_4.16.1.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-appfinder=
_4.16.1.bb</a> =3D&gt; <a href=3D"http://xfce4-appfinder_4.17.1.bb" rel=3D"=
noreferrer" target=3D"_blank">xfce4-appfinder_4.17.1.bb</a>} (60%)<br>
=C2=A0rename meta-xfce/recipes-xfce/xfce4-dev-tools/{<a href=3D"http://xfce=
4-dev-tools_4.16.0.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-dev-tools=
_4.16.0.bb</a> =3D&gt; <a href=3D"http://xfce4-dev-tools_4.17.1.bb" rel=3D"=
noreferrer" target=3D"_blank">xfce4-dev-tools_4.17.1.bb</a>} (81%)<br>
=C2=A0delete mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0001-wind=
owmenu-do-not-display-desktop-icon-when-no-windo.patch<br>
=C2=A0rename meta-xfce/recipes-xfce/xfce4-panel/{<a href=3D"http://xfce4-pa=
nel_4.16.3.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-panel_4.16.3.bb</=
a> =3D&gt; <a href=3D"http://xfce4-panel_4.17.5.bb" rel=3D"noreferrer" targ=
et=3D"_blank">xfce4-panel_4.17.5.bb</a>} (90%)<br>
=C2=A0rename meta-xfce/recipes-xfce/xfce4-power-manager/{<a href=3D"http://=
xfce4-power-manager_4.16.0.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-p=
ower-manager_4.16.0.bb</a> =3D&gt; <a href=3D"http://xfce4-power-manager_4.=
17.0.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-power-manager_4.17.0.bb=
</a>} (85%)<br>
=C2=A0rename meta-xfce/recipes-xfce/xfce4-session/{<a href=3D"http://xfce4-=
session_4.16.0.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-session_4.16.=
0.bb</a> =3D&gt; <a href=3D"http://xfce4-session_4.17.1.bb" rel=3D"noreferr=
er" target=3D"_blank">xfce4-session_4.17.1.bb</a>} (77%)<br>
=C2=A0rename meta-xfce/recipes-xfce/xfce4-settings/{<a href=3D"http://xfce4=
-settings_4.16.5.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-settings_4.=
16.5.bb</a> =3D&gt; <a href=3D"http://xfce4-settings_4.17.3.bb" rel=3D"nore=
ferrer" target=3D"_blank">xfce4-settings_4.17.3.bb</a>} (80%)<br>
=C2=A0rename meta-xfce/recipes-xfce/xfconf/{<a href=3D"http://xfconf_4.16.0=
.bb" rel=3D"noreferrer" target=3D"_blank">xfconf_4.16.0.bb</a> =3D&gt; <a h=
ref=3D"http://xfconf_4.17.2.bb" rel=3D"noreferrer" target=3D"_blank">xfconf=
_4.17.2.bb</a>} (89%)<br>
=C2=A0rename meta-xfce/recipes-xfce/xfdesktop/{<a href=3D"http://xfdesktop_=
4.16.0.bb" rel=3D"noreferrer" target=3D"_blank">xfdesktop_4.16.0.bb</a> =3D=
&gt; <a href=3D"http://xfdesktop_4.17.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">xfdesktop_4.17.2.bb</a>} (68%)<br>
=C2=A0rename meta-xfce/recipes-xfce/xfwm4/{<a href=3D"http://xfwm4_4.16.1.b=
b" rel=3D"noreferrer" target=3D"_blank">xfwm4_4.16.1.bb</a> =3D&gt; <a href=
=3D"http://xfwm4_4.17.2.bb" rel=3D"noreferrer" target=3D"_blank">xfwm4_4.17=
.2.bb</a>} (87%)<br>
<br>
diff --git a/meta-xfce/recipes-xfce/exo/exo/configure.patch b/meta-xfce/rec=
ipes-xfce/exo/exo/configure.patch<br>
deleted file mode 100644<br>
index 89cc1f387..000000000<br>
--- a/meta-xfce/recipes-xfce/exo/exo/configure.patch<br>
+++ /dev/null<br>
@@ -1,57 +0,0 @@<br>
-From 13a74582ffd7f81dbd66a7296fc76007718e9d4d Mon Sep 17 00:00:00 2001<br>
-From: Andreas Mueller &lt;<a href=3D"mailto:schnitzeltony@gmx.de" target=
=3D"_blank">schnitzeltony@gmx.de</a>&gt;<br>
-Date: Mon, 1 Aug 2011 17:16:29 +0200<br>
-<br>
-Upstream-Status: Inappropriate [embedded specific]<br>
-<br>
-Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@goo=
glemail.com" target=3D"_blank">schnitzeltony@googlemail.com</a>&gt;<br>
-<br>
----<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 34 ++++++++++++++++++----------------<br>
- 1 file changed, 18 insertions(+), 16 deletions(-)<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index 0de5ceb..3f92d1b 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -143,22 +143,24 @@ AC_FUNC_MMAP()<br>
- dnl ***************************************<br>
- dnl *** Check for strftime() extensions ***<br>
- dnl ***************************************<br>
--AC_TRY_RUN([<br>
--=C2=A0 #include &lt;string.h&gt;<br>
--=C2=A0 #include &lt;time.h&gt;<br>
--=C2=A0 int<br>
--=C2=A0 main (int argc, char **argv)<br>
--=C2=A0 {<br>
--=C2=A0 =C2=A0 struct tm tm;<br>
--=C2=A0 =C2=A0 char=C2=A0 =C2=A0 =C2=A0 buffer[16];<br>
--=C2=A0 =C2=A0 tm.tm_year =3D 81;<br>
--=C2=A0 =C2=A0 if (strftime (buffer, 16, &quot;%EY&quot;, &amp;tm) =3D=3D =
4 &amp;&amp; strcmp (buffer, &quot;1981&quot;) =3D=3D 0)<br>
--=C2=A0 =C2=A0 =C2=A0 return 0;<br>
--=C2=A0 =C2=A0 return 1;<br>
--=C2=A0 }<br>
--], [<br>
--=C2=A0 AC_DEFINE([HAVE_STRFTIME_EXTENSION], 1, [Define if strftime suppor=
ts %E and %O modifiers.])<br>
--])<br>
-+dnl grrrr...=C2=A0 this doesn&#39;t work for cross compiling, define it f=
or OE<br>
-+AC_DEFINE([HAVE_STRFTIME_EXTENSION], 1, [Define if strftime supports %E a=
nd %O modifiers.])<br>
-+dnl AC_TRY_RUN([<br>
-+dnl=C2=A0 =C2=A0#include &lt;string.h&gt;<br>
-+dnl=C2=A0 =C2=A0#include &lt;time.h&gt;<br>
-+dnl=C2=A0 =C2=A0int<br>
-+dnl=C2=A0 =C2=A0main (int argc, char **argv)<br>
-+dnl=C2=A0 =C2=A0{<br>
-+dnl=C2=A0 =C2=A0 =C2=A0struct tm tm;<br>
-+dnl=C2=A0 =C2=A0 =C2=A0char=C2=A0 =C2=A0 =C2=A0 buffer[16];<br>
-+dnl=C2=A0 =C2=A0 =C2=A0tm.tm_year =3D 81;<br>
-+dnl=C2=A0 =C2=A0 =C2=A0if (strftime (buffer, 16, &quot;%EY&quot;, &amp;tm=
) =3D=3D 4 &amp;&amp; strcmp (buffer, &quot;1981&quot;) =3D=3D 0)<br>
-+dnl=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
-+dnl=C2=A0 =C2=A0 =C2=A0return 1;<br>
-+dnl=C2=A0 =C2=A0}<br>
-+dnl ], [<br>
-+dnl=C2=A0 =C2=A0AC_DEFINE([HAVE_STRFTIME_EXTENSION], 1, [Define if strfti=
me supports %E and %O modifiers.])<br>
-+dnl ])<br>
- <br>
- dnl ******************************<br>
- dnl *** Check for i18n support ***<br>
diff --git a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-onl=
y.patch b/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.p=
atch<br>
deleted file mode 100644<br>
index 8c950299f..000000000<br>
--- a/meta-xfce/recipes-xfce/exo/exo/reduce-build-to-exo-csource-only.patch=
<br>
+++ /dev/null<br>
@@ -1,90 +0,0 @@<br>
-From e710d8d4a3e3480416826c70d56ea3d2598a77e4 Mon Sep 17 00:00:00 2001<br>
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D &lt;<a href=3D"mailto:sc=
hnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@googlemail.com<=
/a>&gt;<br>
-Date: Sat, 4 May 2019 14:50:11 +0200<br>
-Subject: [PATCH] reduce build to exo-csource only<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-exo-csource creates c-header files from glade resource output files. When<=
br>
-building xfce-packages from git instead of tarball this exo-csource-native=
 is<br>
-required.<br>
-<br>
-Upstream-Status: Inappropriate [embedded specific]<br>
-<br>
-Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@goo=
glemail.com" target=3D"_blank">schnitzeltony@googlemail.com</a>&gt;<br>
-<br>
----<br>
- Makefile.am=C2=A0 | 10 +---------<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 20 --------------------<br>
- 2 files changed, 1 insertion(+), 29 deletions(-)<br>
-<br>
-diff --git a/Makefile.am b/Makefile.am<br>
-index 62ad18d..8934f1f 100644<br>
---- a/Makefile.am<br>
-+++ b/Makefile.am<br>
-@@ -1,15 +1,7 @@<br>
- ACLOCAL_AMFLAGS =3D -I m4 ${ACLOCAL_FLAGS}<br>
- <br>
- SUBDIRS =3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>
--=C2=A0 =C2=A0 =C2=A0 exo=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
--=C2=A0 =C2=A0 =C2=A0 exo-csource=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
--=C2=A0 =C2=A0 =C2=A0 exo-desktop-item-edit=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
--=C2=A0 =C2=A0 =C2=A0 exo-helper=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=
<br>
--=C2=A0 =C2=A0 =C2=A0 exo-open=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
--=C2=A0 =C2=A0 =C2=A0 docs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
--=C2=A0 =C2=A0 =C2=A0 icons=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
--=C2=A0 =C2=A0 =C2=A0 pixmaps=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\<br>
--=C2=A0 =C2=A0 =C2=A0 po<br>
-+=C2=A0 =C2=A0 =C2=A0 exo-csource<br>
- <br>
- distclean-local:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf *.cache *~<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index 4e4eb5e..237184c 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -120,15 +120,6 @@ AC_PROG_CC()<br>
- AM_PROG_CC_C_O()<br>
- AC_PROG_INSTALL()<br>
- IT_PROG_INTLTOOL([intltool_minimum_version], [no-xml])<br>
--AC_CHECK_PROGS([PERL], [perl5 perl])<br>
--<br>
--dnl ***************************************<br>
--dnl *** Check for required Perl modules ***<br>
--dnl ***************************************<br>
--AC_PROG_PERL_MODULES([URI::Escape URI::file URI::URL], [],<br>
--[<br>
--=C2=A0 AC_MSG_ERROR([Atleast one of the required Perl modules (URI::Escap=
e, URI::file and URI::URL) was not found on your system])<br>
--])<br>
- <br>
- dnl ***************************************<br>
- dnl *** Check for standard header files ***<br>
-@@ -175,12 +166,6 @@ dnl ***********************************<br>
- dnl *** Check for required packages ***<br>
- dnl ***********************************<br>
- XDT_CHECK_PACKAGE([GLIB], [glib-2.0], [2.42.0])<br>
--XDT_CHECK_PACKAGE([GIO], [gio-2.0], [2.42.0])<br>
--XDT_CHECK_PACKAGE([GTK3], [gtk+-3.0], [3.22.0])<br>
--XDT_CHECK_PACKAGE([GTHREAD], [gthread-2.0], [2.42.0])<br>
--XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.12.0])<br>
--XDT_CHECK_PACKAGE([LIBXFCE4UI2], [libxfce4ui-2], [4.12.0])<br>
--XDT_CHECK_OPTIONAL_PACKAGE([GIO_UNIX], [gio-unix-2.0], [2.42.0], [gio-uni=
x], [GIO-Unix features])<br>
- <br>
- dnl ***********************************************************<br>
- dnl *** Optional support for a GTK+2 version of the library ***<br>
-@@ -190,11 +175,6 @@ XDT_CHECK_OPTIONAL_PACKAGE([GTK2],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 [GTK+ 2 support])<br>
- AM_CONDITIONAL([ENABLE_GTK2_LIBRARY], [test &quot;x$GTK2_FOUND&quot; =3D =
&quot;xyes&quot;])<br>
- <br>
--dnl *********************<br>
--dnl *** Check for X11 ***<br>
--dnl *********************<br>
--XDT_CHECK_LIBX11_REQUIRE()<br>
--<br>
- dnl *************************<br>
- dnl *** Check for gtk-doc ***<br>
- dnl *************************<br>
--- <br>
-2.20.1<br>
-<br>
diff --git a/meta-xfce/recipes-xfce/exo/<a href=3D"http://exo_4.16.4.bb" re=
l=3D"noreferrer" target=3D"_blank">exo_4.16.4.bb</a> b/meta-xfce/recipes-xf=
ce/exo/<a href=3D"http://exo_4.17.4.bb" rel=3D"noreferrer" target=3D"_blank=
">exo_4.17.4.bb</a><br>
similarity index 81%<br>
rename from meta-xfce/recipes-xfce/exo/<a href=3D"http://exo_4.16.4.bb" rel=
=3D"noreferrer" target=3D"_blank">exo_4.16.4.bb</a><br>
rename to meta-xfce/recipes-xfce/exo/<a href=3D"http://exo_4.17.4.bb" rel=
=3D"noreferrer" target=3D"_blank">exo_4.17.4.bb</a><br>
index 01c3bff06..12aae5aef 100644<br>
--- a/meta-xfce/recipes-xfce/exo/<a href=3D"http://exo_4.16.4.bb" rel=3D"no=
referrer" target=3D"_blank">exo_4.16.4.bb</a><br>
+++ b/meta-xfce/recipes-xfce/exo/<a href=3D"http://exo_4.17.4.bb" rel=3D"no=
referrer" target=3D"_blank">exo_4.17.4.bb</a><br>
@@ -11,12 +11,9 @@ inherit xfce perlnative gtk-doc features_check mime-xdg<=
br>
=C2=A0ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
<br>
=C2=A0# SRC_URI must follow inherited one<br>
-SRC_URI +=3D &quot; \<br>
-=C2=A0 =C2=A0 file://exo-no-tests-0.8.patch \<br>
-=C2=A0 =C2=A0 file://configure.patch \<br>
-&quot;<br>
+SRC_URI +=3D &quot;file://exo-no-tests-0.8.patch&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;82a50c67e78f1e5c420b7615515bcca759b86eeab9922=
4ab8eca4306b89d2eca&quot;<br>
+SRC_URI[sha256sum] =3D &quot;83f4b9b9217e96d0991a6cdf060fb1357f32138f4127d=
cb3e45c3de7de392c82&quot;<br>
<br>
=C2=A0# Note: python bindings did not work in oe-dev and are about to be mo=
ved to<br>
=C2=A0# pyxfce see <a href=3D"http://comments.gmane.org/gmane.comp.desktop.=
xfce.devel.version4/19560" rel=3D"noreferrer" target=3D"_blank">http://comm=
ents.gmane.org/gmane.comp.desktop.xfce.devel.version4/19560</a><br>
diff --git a/meta-xfce/recipes-xfce/garcon/<a href=3D"http://garcon_4.16.1.=
bb" rel=3D"noreferrer" target=3D"_blank">garcon_4.16.1.bb</a> b/meta-xfce/r=
ecipes-xfce/garcon/<a href=3D"http://garcon_4.17.3.bb" rel=3D"noreferrer" t=
arget=3D"_blank">garcon_4.17.3.bb</a><br>
similarity index 89%<br>
rename from meta-xfce/recipes-xfce/garcon/<a href=3D"http://garcon_4.16.1.b=
b" rel=3D"noreferrer" target=3D"_blank">garcon_4.16.1.bb</a><br>
rename to meta-xfce/recipes-xfce/garcon/<a href=3D"http://garcon_4.17.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">garcon_4.17.3.bb</a><br>
index 14f0c4a64..2b51a7379 100644<br>
--- a/meta-xfce/recipes-xfce/garcon/<a href=3D"http://garcon_4.16.1.bb" rel=
=3D"noreferrer" target=3D"_blank">garcon_4.16.1.bb</a><br>
+++ b/meta-xfce/recipes-xfce/garcon/<a href=3D"http://garcon_4.17.3.bb" rel=
=3D"noreferrer" target=3D"_blank">garcon_4.17.3.bb</a><br>
@@ -11,7 +11,7 @@ inherit xfce gtk-doc gobject-introspection features_check=
<br>
=C2=A0ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://0001-xfce-applications.menu-don-t-bloat-set=
tings-menu-by-.patch&quot;<br>
-SRC_URI[sha256sum] =3D &quot;84914927a2c1fda167f67af26a6640630a744a22940df=
508aa6c752cdbd3d21d&quot;<br>
+SRC_URI[sha256sum] =3D &quot;8748d3b8a35a3211f6745468d4e5c4a78e807551ced35=
df4671c302d5e42721e&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--disable-gtk-doc&quot;<br>
<br>
diff --git a/meta-xfce/recipes-xfce/libxfce4ui/<a href=3D"http://libxfce4ui=
_4.16.1.bb" rel=3D"noreferrer" target=3D"_blank">libxfce4ui_4.16.1.bb</a> b=
/meta-xfce/recipes-xfce/libxfce4ui/<a href=3D"http://libxfce4ui_4.17.9.bb" =
rel=3D"noreferrer" target=3D"_blank">libxfce4ui_4.17.9.bb</a><br>
similarity index 86%<br>
rename from meta-xfce/recipes-xfce/libxfce4ui/<a href=3D"http://libxfce4ui_=
4.16.1.bb" rel=3D"noreferrer" target=3D"_blank">libxfce4ui_4.16.1.bb</a><br=
>
rename to meta-xfce/recipes-xfce/libxfce4ui/<a href=3D"http://libxfce4ui_4.=
17.9.bb" rel=3D"noreferrer" target=3D"_blank">libxfce4ui_4.17.9.bb</a><br>
index 692c79f3c..17c9a6fa5 100644<br>
--- a/meta-xfce/recipes-xfce/libxfce4ui/<a href=3D"http://libxfce4ui_4.16.1=
.bb" rel=3D"noreferrer" target=3D"_blank">libxfce4ui_4.16.1.bb</a><br>
+++ b/meta-xfce/recipes-xfce/libxfce4ui/<a href=3D"http://libxfce4ui_4.17.9=
.bb" rel=3D"noreferrer" target=3D"_blank">libxfce4ui_4.17.9.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0SUMMARY =3D &quot;Xfce4 Widget library and X Window System interactio=
n&quot;<br>
=C2=A0SECTION =3D &quot;x11/libs&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D252890d9eee26aab7b432e8b8a=
616475&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4cf66a4984120007c9881cc871=
cf49db&quot;<br>
=C2=A0DEPENDS =3D &quot;intltool-native perl-native gtk+3 libxfce4util xfce=
4-dev-tools xfconf&quot;<br>
<br>
=C2=A0inherit xfce gtk-doc gobject-introspection features_check<br>
@@ -12,7 +12,7 @@ ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&qu=
ot;<br>
<br>
=C2=A0# TODO: Check if 0001-... can go<br>
=C2=A0SRC_URI +=3D &quot;file://0001-libxfce4kbd-private-xfce4-keyboard-sho=
rtcuts.xml-fix.patch&quot;<br>
-SRC_URI[sha256sum] =3D &quot;d96946ae5af6bf078dda415419e0021909f763ee0020b=
42f3e26f603e51585f6&quot;<br>
+SRC_URI[sha256sum] =3D &quot;d78c1852443a930bf1cdc5a90a68ffbf302fa3c34ed08=
85da41c7ee2f1c57b65&quot;<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot;--with-vendor-info=3D${DISTRO}&quot;<br>
=C2=A0EXTRA_OECONF +=3D &quot;--disable-vala&quot;<br>
diff --git a/meta-xfce/recipes-xfce/libxfce4util/<a href=3D"http://libxfce4=
util_4.16.0.bb" rel=3D"noreferrer" target=3D"_blank">libxfce4util_4.16.0.bb=
</a> b/meta-xfce/recipes-xfce/libxfce4util/<a href=3D"http://libxfce4util_4=
.17.4.bb" rel=3D"noreferrer" target=3D"_blank">libxfce4util_4.17.4.bb</a><b=
r>
similarity index 55%<br>
rename from meta-xfce/recipes-xfce/libxfce4util/<a href=3D"http://libxfce4u=
til_4.16.0.bb" rel=3D"noreferrer" target=3D"_blank">libxfce4util_4.16.0.bb<=
/a><br>
rename to meta-xfce/recipes-xfce/libxfce4util/<a href=3D"http://libxfce4uti=
l_4.17.4.bb" rel=3D"noreferrer" target=3D"_blank">libxfce4util_4.17.4.bb</a=
><br>
index 6824ac67e..64fa120eb 100644<br>
--- a/meta-xfce/recipes-xfce/libxfce4util/<a href=3D"http://libxfce4util_4.=
16.0.bb" rel=3D"noreferrer" target=3D"_blank">libxfce4util_4.16.0.bb</a><br=
>
+++ b/meta-xfce/recipes-xfce/libxfce4util/<a href=3D"http://libxfce4util_4.=
17.4.bb" rel=3D"noreferrer" target=3D"_blank">libxfce4util_4.17.4.bb</a><br=
>
@@ -1,9 +1,9 @@<br>
=C2=A0SUMMARY =3D &quot;Basic utility library for Xfce4&quot;<br>
=C2=A0SECTION =3D &quot;x11/libs&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D252890d9eee26aab7b432e8b8a=
616475&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4cf66a4984120007c9881cc871=
cf49db&quot;<br>
=C2=A0DEPENDS =3D &quot;intltool-native xfce4-dev-tools-native glib-2.0&quo=
t;<br>
<br>
=C2=A0inherit xfce gtk-doc gobject-introspection vala<br>
<br>
-SRC_URI[sha256sum] =3D &quot;60598d745d1fc81ff5ad3cecc3a8d1b85990dd22023e7=
743f55abd87d8b55b83&quot;<br>
+SRC_URI[sha256sum] =3D &quot;bc75cb211994a816c7673618fdbff37ead7a643181ea6=
adb138fe004ae9d02b4&quot;<br>
diff --git a/meta-xfce/recipes-xfce/thunar-volman/<a href=3D"http://thunar-=
volman_4.16.0.bb" rel=3D"noreferrer" target=3D"_blank">thunar-volman_4.16.0=
.bb</a> b/meta-xfce/recipes-xfce/thunar-volman/<a href=3D"http://thunar-vol=
man_4.17.1.bb" rel=3D"noreferrer" target=3D"_blank">thunar-volman_4.17.1.bb=
</a><br>
similarity index 68%<br>
rename from meta-xfce/recipes-xfce/thunar-volman/<a href=3D"http://thunar-v=
olman_4.16.0.bb" rel=3D"noreferrer" target=3D"_blank">thunar-volman_4.16.0.=
bb</a><br>
rename to meta-xfce/recipes-xfce/thunar-volman/<a href=3D"http://thunar-vol=
man_4.17.1.bb" rel=3D"noreferrer" target=3D"_blank">thunar-volman_4.17.1.bb=
</a><br>
index 4b72d3a79..9a30c5f3a 100644<br>
--- a/meta-xfce/recipes-xfce/thunar-volman/<a href=3D"http://thunar-volman_=
4.16.0.bb" rel=3D"noreferrer" target=3D"_blank">thunar-volman_4.16.0.bb</a>=
<br>
+++ b/meta-xfce/recipes-xfce/thunar-volman/<a href=3D"http://thunar-volman_=
4.17.1.bb" rel=3D"noreferrer" target=3D"_blank">thunar-volman_4.17.1.bb</a>=
<br>
@@ -1,14 +1,14 @@<br>
=C2=A0SUMMARY =3D &quot;Automatic management of removable drives and media =
for thunar&quot;<br>
=C2=A0SECTION =3D &quot;x11&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D94d55d512a9ba36caa9b7df079=
bae19f&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263&quot;<br>
=C2=A0DEPENDS =3D &quot;exo libnotify libgudev&quot;<br>
<br>
=C2=A0inherit xfce features_check<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;d2c0e719b242b7fd3db70bc6678a2df1abf2cfaa899b7=
75a1591a5efa08a547d&quot;<br>
+SRC_URI[sha256sum] =3D &quot;9ac33664dbef4c425ccb96cdb5dd376ebe023281c987a=
464b7900cc7139dc605&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;notify&quot;<br>
=C2=A0PACKAGECONFIG[notify] =3D &quot;--enable-notifications,--disable-noti=
fications,libnotify&quot;<br>
diff --git a/meta-xfce/recipes-xfce/thunar/<a href=3D"http://thunar_4.16.9.=
bb" rel=3D"noreferrer" target=3D"_blank">thunar_4.16.9.bb</a> b/meta-xfce/r=
ecipes-xfce/thunar/<a href=3D"http://thunar_4.17.12.bb" rel=3D"noreferrer" =
target=3D"_blank">thunar_4.17.12.bb</a><br>
similarity index 61%<br>
rename from meta-xfce/recipes-xfce/thunar/<a href=3D"http://thunar_4.16.9.b=
b" rel=3D"noreferrer" target=3D"_blank">thunar_4.16.9.bb</a><br>
rename to meta-xfce/recipes-xfce/thunar/<a href=3D"http://thunar_4.17.12.bb=
" rel=3D"noreferrer" target=3D"_blank">thunar_4.17.12.bb</a><br>
index d3702c83c..dc95d446d 100644<br>
--- a/meta-xfce/recipes-xfce/thunar/<a href=3D"http://thunar_4.16.9.bb" rel=
=3D"noreferrer" target=3D"_blank">thunar_4.16.9.bb</a><br>
+++ b/meta-xfce/recipes-xfce/thunar/<a href=3D"http://thunar_4.17.12.bb" re=
l=3D"noreferrer" target=3D"_blank">thunar_4.17.12.bb</a><br>
@@ -1,8 +1,8 @@<br>
=C2=A0SUMMARY =3D &quot;File manager for the Xfce Desktop Environment&quot;=
<br>
=C2=A0SECTION =3D &quot;x11&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D94d55d512a9ba36caa9b7df079=
bae19f&quot;<br>
-DEPENDS =3D &quot;libxml-parser-perl-native exo gdk-pixbuf libxfce4ui libn=
otify xfce4-panel udev&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263&quot;<br>
+DEPENDS =3D &quot;exo gdk-pixbuf libxfce4ui xfce4-panel xfconf gtk+3 glib-=
2.0 pango udev&quot;<br>
<br>
=C2=A0inherit xfce gobject-introspection features_check mime-xdg perlnative=
<br>
<br>
@@ -10,11 +10,7 @@ inherit xfce gobject-introspection features_check mime-x=
dg perlnative<br>
=C2=A0# cairo would at least needed to be built with xlib.<br>
=C2=A0ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;520bf318eef8bc792db38ae4af343b648f87d4b8d66f5=
b5d6f092e15264ee5af&quot;<br>
-<br>
-PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#=
39;x11&#39;, d)}&quot;<br>
-PACKAGECONFIG[pcre] =3D &quot;--enable-pcre,--disable-pcre,libpcre&quot;<b=
r>
-PACKAGECONFIG[x11] =3D &quot;,,libsm startup-notification&quot;<br>
+SRC_URI[sha256sum] =3D &quot;b0cd2a8b6e1b9d3fbd59c6e1202b8f54b970f66f5bd22=
54046d00968bd08ca36&quot;<br>
<br>
=C2=A0FILES:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/thunarx-3/* \<br>
diff --git a/meta-xfce/recipes-xfce/tumbler/<a href=3D"http://tumbler_4.16.=
0.bb" rel=3D"noreferrer" target=3D"_blank">tumbler_4.16.0.bb</a> b/meta-xfc=
e/recipes-xfce/tumbler/<a href=3D"http://tumbler_4.17.3.bb" rel=3D"noreferr=
er" target=3D"_blank">tumbler_4.17.3.bb</a><br>
similarity index 82%<br>
rename from meta-xfce/recipes-xfce/tumbler/<a href=3D"http://tumbler_4.16.0=
.bb" rel=3D"noreferrer" target=3D"_blank">tumbler_4.16.0.bb</a><br>
rename to meta-xfce/recipes-xfce/tumbler/<a href=3D"http://tumbler_4.17.3.b=
b" rel=3D"noreferrer" target=3D"_blank">tumbler_4.17.3.bb</a><br>
index 6a583ade7..1e5f34fbc 100644<br>
--- a/meta-xfce/recipes-xfce/tumbler/<a href=3D"http://tumbler_4.16.0.bb" r=
el=3D"noreferrer" target=3D"_blank">tumbler_4.16.0.bb</a><br>
+++ b/meta-xfce/recipes-xfce/tumbler/<a href=3D"http://tumbler_4.17.3.bb" r=
el=3D"noreferrer" target=3D"_blank">tumbler_4.17.3.bb</a><br>
@@ -2,11 +2,11 @@ DESCRIPTION =3D &quot;Thumbnail service implementing the =
thumbnail management D-Bus spe<br>
=C2=A0SECTION =3D &quot;x11/libs&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a8=
0fdaf4a4263&quot;<br>
-DEPENDS =3D &quot;freetype gdk-pixbuf poppler curl xfce4-dev-tools-native =
libxml2 libgsf&quot;<br>
+DEPENDS =3D &quot;freetype gdk-pixbuf poppler xfce4-dev-tools-native libxf=
ce4util&quot;<br>
<br>
=C2=A0inherit xfce gtk-doc<br>
<br>
-SRC_URI[sha256sum] =3D &quot;9b0b7fed0c64041733d490b1b307297984629d0dd8536=
9749617a8766850af66&quot;<br>
+SRC_URI[sha256sum] =3D &quot;61181220ca5cfcf50112af2c5047f14154944a9253a69=
7062d42e99203638821&quot;<br>
<br>
=C2=A0INSANE_SKIP:${PN} =3D &quot;dev-so&quot;<br>
<br>
@@ -23,6 +23,7 @@ FILES:${PN} +=3D &quot;${datadir}/dbus-1/services \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/tum=
bler-1/tumblerd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/tum=
bler-1/plugins/*.so \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/tum=
bler-1/plugins/cache/*.so \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${systemd_user_uni=
tdir} \<br>
=C2=A0&quot;<br>
<br>
=C2=A0FILES:${PN}-dev +=3D &quot;${libdir}/tumbler-1/plugins/*.la \<br>
diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/<a href=3D"http://xfce4=
-appfinder_4.16.1.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-appfinder_=
4.16.1.bb</a> b/meta-xfce/recipes-xfce/xfce4-appfinder/<a href=3D"http://xf=
ce4-appfinder_4.17.1.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-appfind=
er_4.17.1.bb</a><br>
similarity index 60%<br>
rename from meta-xfce/recipes-xfce/xfce4-appfinder/<a href=3D"http://xfce4-=
appfinder_4.16.1.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-appfinder_4=
.16.1.bb</a><br>
rename to meta-xfce/recipes-xfce/xfce4-appfinder/<a href=3D"http://xfce4-ap=
pfinder_4.17.1.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-appfinder_4.1=
7.1.bb</a><br>
index 18d9fedfc..5f96417bc 100644<br>
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/<a href=3D"http://xfce4-appfin=
der_4.16.1.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-appfinder_4.16.1.=
bb</a><br>
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/<a href=3D"http://xfce4-appfin=
der_4.17.1.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-appfinder_4.17.1.=
bb</a><br>
@@ -1,13 +1,13 @@<br>
=C2=A0DESCRIPTION =3D &quot;Xfce4 Application Finder&quot;<br>
=C2=A0SECTION =3D &quot;x11&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D94d55d512a9ba36caa9b7df079=
bae19f&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263&quot;<br>
=C2=A0DEPENDS =3D &quot;glib-2.0 gtk+3 libxfce4util libxfce4ui garcon xfcon=
f&quot;<br>
<br>
=C2=A0inherit xfce features_check<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;bfe3e9bd92695014ee74a2fbb7f5fd1b4c29cf043c4a1=
1598b8958324c81e7ec&quot;<br>
+SRC_URI[sha256sum] =3D &quot;5482dc18c2b8bdeebc95ccadacc6ce46d717d32009509=
a8491b8720cf1c2c996&quot;<br>
<br>
=C2=A0FILES:${PN} +=3D &quot;${datadir}/metainfo&quot;<br>
diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/<a href=3D"http://xfce4=
-dev-tools_4.16.0.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-dev-tools_=
4.16.0.bb</a> b/meta-xfce/recipes-xfce/xfce4-dev-tools/<a href=3D"http://xf=
ce4-dev-tools_4.17.1.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-dev-too=
ls_4.17.1.bb</a><br>
similarity index 81%<br>
rename from meta-xfce/recipes-xfce/xfce4-dev-tools/<a href=3D"http://xfce4-=
dev-tools_4.16.0.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-dev-tools_4=
.16.0.bb</a><br>
rename to meta-xfce/recipes-xfce/xfce4-dev-tools/<a href=3D"http://xfce4-de=
v-tools_4.17.1.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-dev-tools_4.1=
7.1.bb</a><br>
index 586a77efc..2c01bb7e3 100644<br>
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/<a href=3D"http://xfce4-dev-to=
ols_4.16.0.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-dev-tools_4.16.0.=
bb</a><br>
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/<a href=3D"http://xfce4-dev-to=
ols_4.17.1.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-dev-tools_4.17.1.=
bb</a><br>
@@ -2,7 +2,7 @@ SUMMARY =3D &quot;Xfce4 development tools&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.xfce.org" rel=3D"noreferrer"=
 target=3D"_blank">http://www.xfce.org</a>&quot;<br>
=C2=A0SECTION =3D &quot;x11/libs&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D9ac2e7cff1ddaf48b6eab6028f=
23ef88&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;glib-2.0&quot;<br>
=C2=A0DEPENDS:append:class-target =3D &quot; ${BPN}-native&quot;<br>
@@ -15,7 +15,7 @@ SRC_URI =3D &quot;<a href=3D"http://archive.xfce.org/src/=
xfce/$%7BBPN%7D/$%7B@&#39;$%7BPV%7D&#39;%5B0:4%5D%7D/$%7BBPN%7D-$%7BPV%7D" =
rel=3D"noreferrer" target=3D"_blank">http://archive.xfce.org/src/xfce/${BPN=
}/${@&#39;${PV}&#39;[0:4]}/${BPN}-${PV}</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-m4macros-Check-for-a-=
function-provided-by-libX11-in-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI:append:class-target =3D &quot; file://0001-Run-native-xdt-cso=
urce-on-tests.patch&quot;<br>
-SRC_URI[sha256sum] =3D &quot;f50b3070e66f3ebdf331744dd1ec5e1af5de333965d49=
1e15ce05545e8eb4f04&quot;<br>
+SRC_URI[sha256sum] =3D &quot;e9af0efc1acfe443cf513e7f82621f81ef62b50e2bf24=
1096a41b90489ef4f9f&quot;<br>
<br>
=C2=A0do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${datadir}/aclocal<br>
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-no=
t-display-desktop-icon-when-no-windo.patch b/meta-xfce/recipes-xfce/xfce4-p=
anel/files/0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch<=
br>
deleted file mode 100644<br>
index 1adb14552..000000000<br>
--- a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-not-displ=
ay-desktop-icon-when-no-windo.patch<br>
+++ /dev/null<br>
@@ -1,60 +0,0 @@<br>
-From 0651f228cef01a6c3e4758a991cace1cd7721031 Mon Sep 17 00:00:00 2001<br>
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D &lt;<a href=3D"mailto:sc=
hnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@googlemail.com<=
/a>&gt;<br>
-Date: Mon, 24 Sep 2012 09:57:46 +0200<br>
-Subject: [PATCH] windowmenu: do not display desktop icon when no window is=
<br>
- active<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-* desktop icon is of no use<br>
-* desktop icon confuses when using showdesktop plugin<br>
-<br>
-Upstream-Status: Pending<br>
-<br>
-Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@goo=
glemail.com" target=3D"_blank">schnitzeltony@googlemail.com</a>&gt;<br>
----<br>
- plugins/windowmenu/windowmenu.c | 10 +++++-----<br>
- 1 file changed, 5 insertions(+), 5 deletions(-)<br>
-<br>
-diff --git a/plugins/windowmenu/windowmenu.c b/plugins/windowmenu/windowme=
nu.c<br>
-index f47e993e..061d6544 100644<br>
---- a/plugins/windowmenu/windowmenu.c<br>
-+++ b/plugins/windowmenu/windowmenu.c<br>
-@@ -251,7 +251,7 @@ window_menu_plugin_init (WindowMenuPlugin *plugin)<br>
-=C2=A0 =C2=A0g_signal_connect (G_OBJECT (plugin-&gt;button), &quot;toggled=
&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0G_CALLBACK (window_menu_plugin_menu), plugin);<=
br>
- <br>
--=C2=A0 plugin-&gt;icon =3D gtk_image_new_from_icon_name (&quot;user-deskt=
op&quot;, GTK_ICON_SIZE_BUTTON);<br>
-+=C2=A0 plugin-&gt;icon =3D gtk_image_new_from_icon_name (NULL, GTK_ICON_S=
IZE_BUTTON);<br>
-=C2=A0 =C2=A0gtk_container_add (GTK_CONTAINER (plugin-&gt;button), plugin-=
&gt;icon);<br>
-=C2=A0 =C2=A0gtk_widget_show (plugin-&gt;icon);<br>
- }<br>
-@@ -640,7 +640,7 @@ window_menu_plugin_active_window_changed (WnckScreen=
=C2=A0 =C2=A0 =C2=A0 =C2=A0*screen,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* skip &#39;fake&#39; windows */=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0type =3D wnck_window_get_window_t=
ype (window);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (type =3D=3D WNCK_WINDOW_DESKT=
OP || type =3D=3D WNCK_WINDOW_DOCK)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto show_desktop_icon;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto show_no_icon;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* get the window icon and set th=
e tooltip */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_widget_set_tooltip_text (GTK_=
WIDGET (icon),<br>
-@@ -660,12 +660,12 @@ window_menu_plugin_active_window_changed (WnckScreen=
=C2=A0 =C2=A0 =C2=A0 =C2=A0*screen,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 show_desktop_icon:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 show_no_icon:<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* desktop is shown right now */<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_image_set_from_icon_name (GTK_IMAG=
E (icon), &quot;user-desktop&quot;, icon_size);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_image_set_from_icon_name (GTK_IMAG=
E (icon), NULL, icon_size);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_image_set_pixel_size (GTK_IMA=
GE (icon), icon_size);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_widget_set_tooltip_text (GTK_WIDGE=
T (icon), _(&quot;Desktop&quot;));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_widget_set_tooltip_text (GTK_WIDGE=
T (icon), _(&quot;No Windows&quot;));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- }<br>
--- <br>
-2.14.3<br>
-<br>
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/<a href=3D"http://xfce4-pan=
el_4.16.3.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-panel_4.16.3.bb</a=
> b/meta-xfce/recipes-xfce/xfce4-panel/<a href=3D"http://xfce4-panel_4.17.5=
.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-panel_4.17.5.bb</a><br>
similarity index 90%<br>
rename from meta-xfce/recipes-xfce/xfce4-panel/<a href=3D"http://xfce4-pane=
l_4.16.3.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-panel_4.16.3.bb</a>=
<br>
rename to meta-xfce/recipes-xfce/xfce4-panel/<a href=3D"http://xfce4-panel_=
4.17.5.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-panel_4.17.5.bb</a><b=
r>
index 46d26159a..b9e55960a 100644<br>
--- a/meta-xfce/recipes-xfce/xfce4-panel/<a href=3D"http://xfce4-panel_4.16=
.3.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-panel_4.16.3.bb</a><br>
+++ b/meta-xfce/recipes-xfce/xfce4-panel/<a href=3D"http://xfce4-panel_4.17=
.5.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-panel_4.17.5.bb</a><br>
@@ -10,9 +10,8 @@ inherit xfce gtk-doc gobject-introspection features_check=
 mime-xdg<br>
=C2=A0# cairo would at least needed to be built with xlib.<br>
=C2=A0ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;5934eaed8a76da52c29b734ccd79600255420333dd6eb=
d8fd9f066379af1e092&quot;<br>
+SRC_URI[sha256sum] =3D &quot;096b1230f6cde17f2497daa7cbe8316478a5500944e7a=
90b8a61e26961414fef&quot;<br>
=C2=A0SRC_URI +=3D &quot; \<br>
-=C2=A0 =C2=A0 file://0001-windowmenu-do-not-display-desktop-icon-when-no-w=
indo.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0002-use-lxdm-to-replace-dm-tool.patch \<br>
=C2=A0&quot;<br>
<br>
diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/<a href=3D"http://x=
fce4-power-manager_4.16.0.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-po=
wer-manager_4.16.0.bb</a> b/meta-xfce/recipes-xfce/xfce4-power-manager/<a h=
ref=3D"http://xfce4-power-manager_4.17.0.bb" rel=3D"noreferrer" target=3D"_=
blank">xfce4-power-manager_4.17.0.bb</a><br>
similarity index 85%<br>
rename from meta-xfce/recipes-xfce/xfce4-power-manager/<a href=3D"http://xf=
ce4-power-manager_4.16.0.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-pow=
er-manager_4.16.0.bb</a><br>
rename to meta-xfce/recipes-xfce/xfce4-power-manager/<a href=3D"http://xfce=
4-power-manager_4.17.0.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-power=
-manager_4.17.0.bb</a><br>
index 34de7a708..dca9d18e4 100644<br>
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/<a href=3D"http://xfce4-po=
wer-manager_4.16.0.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-power-man=
ager_4.16.0.bb</a><br>
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/<a href=3D"http://xfce4-po=
wer-manager_4.17.0.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-power-man=
ager_4.17.0.bb</a><br>
@@ -9,9 +9,9 @@ inherit xfce features_check<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;<br>
<br>
-DEPENDS +=3D &quot;libnotify libxrandr virtual/libx11 libxext xfce4-panel =
upower libxscrnsaver&quot;<br>
+DEPENDS +=3D &quot;libnotify libxfce4ui libxfce4util gtk+3 glib-2.0 xrandr=
 virtual/libx11 xfce4-panel upower&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;eb9c587c01b502fa45a32e7fc2aba98fa6d8391475133=
883654f77e562c43bf3&quot;<br>
+SRC_URI[sha256sum] =3D &quot;2deca68f816705de5c4f11aad48b1157ce715da467bd3=
eaba723299df861615b&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0--enable-network-manager \<br>
diff --git a/meta-xfce/recipes-xfce/xfce4-session/<a href=3D"http://xfce4-s=
ession_4.16.0.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-session_4.16.0=
.bb</a> b/meta-xfce/recipes-xfce/xfce4-session/<a href=3D"http://xfce4-sess=
ion_4.17.1.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-session_4.17.1.bb=
</a><br>
similarity index 77%<br>
rename from meta-xfce/recipes-xfce/xfce4-session/<a href=3D"http://xfce4-se=
ssion_4.16.0.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-session_4.16.0.=
bb</a><br>
rename to meta-xfce/recipes-xfce/xfce4-session/<a href=3D"http://xfce4-sess=
ion_4.17.1.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-session_4.17.1.bb=
</a><br>
index e6613b8ee..014ae589e 100644<br>
--- a/meta-xfce/recipes-xfce/xfce4-session/<a href=3D"http://xfce4-session_=
4.16.0.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-session_4.16.0.bb</a>=
<br>
+++ b/meta-xfce/recipes-xfce/xfce4-session/<a href=3D"http://xfce4-session_=
4.17.1.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-session_4.17.1.bb</a>=
<br>
@@ -1,9 +1,9 @@<br>
=C2=A0SUMMARY =3D &quot;xfce4-session is a session manager for Xfce 4 Deskt=
op Environment&quot;<br>
=C2=A0SECTION =3D &quot;x11&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D9ac2e7cff1ddaf48b6eab6028f=
23ef88&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263&quot;<br>
<br>
-DEPENDS =3D &quot;libwnck3 libsm libxfce4ui virtual/libx11&quot;<br>
+DEPENDS =3D &quot;libxfce4util libxfce4ui xfconf libwnck3 libsm libxfce4ui=
 virtual/libx11&quot;<br>
<br>
=C2=A0inherit xfce update-alternatives features_check<br>
<br>
@@ -13,7 +13,7 @@ PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_=
FEATURES&#39;, &#39;polkit&#39;, d)}&quot;<br>
=C2=A0PACKAGECONFIG[polkit] =3D &quot;--enable-polkit, --disable-polkit, po=
lkit&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://0001-configure.in-hard-code-path-to-iceauth=
.patch&quot;<br>
-SRC_URI[sha256sum] =3D &quot;22f273f212481d71e0b5618c62710cd85f69aea74f5ea=
5c0093f7918b07d17b7&quot;<br>
+SRC_URI[sha256sum] =3D &quot;6c2d1dd49200a4f4e39a9459b055d8c1792188d4fb234=
00eff5a6795b204a48b&quot;<br>
<br>
=C2=A0ALTERNATIVE:${PN} =3D &quot;x-session-manager&quot;<br>
=C2=A0ALTERNATIVE_TARGET[x-session-manager] =3D &quot;${bindir}/xfce4-sessi=
on&quot;<br>
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/<a href=3D"http://xfce4-=
settings_4.16.5.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-settings_4.1=
6.5.bb</a> b/meta-xfce/recipes-xfce/xfce4-settings/<a href=3D"http://xfce4-=
settings_4.17.3.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-settings_4.1=
7.3.bb</a><br>
similarity index 80%<br>
rename from meta-xfce/recipes-xfce/xfce4-settings/<a href=3D"http://xfce4-s=
ettings_4.16.5.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-settings_4.16=
.5.bb</a><br>
rename to meta-xfce/recipes-xfce/xfce4-settings/<a href=3D"http://xfce4-set=
tings_4.17.3.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-settings_4.17.3=
.bb</a><br>
index 4a4e9f188..662d85a4e 100644<br>
--- a/meta-xfce/recipes-xfce/xfce4-settings/<a href=3D"http://xfce4-setting=
s_4.16.5.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-settings_4.16.5.bb<=
/a><br>
+++ b/meta-xfce/recipes-xfce/xfce4-settings/<a href=3D"http://xfce4-setting=
s_4.17.3.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-settings_4.17.3.bb<=
/a><br>
@@ -1,15 +1,15 @@<br>
=C2=A0SUMMARY =3D &quot;Xfce4 settings&quot;<br>
=C2=A0SECTION =3D &quot;x11/wm&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D94d55d512a9ba36caa9b7df079=
bae19f&quot;<br>
-DEPENDS =3D &quot;exo garcon libxi virtual/libx11 xrandr libxcursor libxkl=
avier upower&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263&quot;<br>
+DEPENDS =3D &quot;exo garcon gtk+3 glib-2.0 libxfce4util libxfce4ui xfconf=
 fontconfig intltool-native&quot;<br>
<br>
=C2=A0inherit xfce features_check mime-xdg<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://0001-xsettings.xml-Set-default-themes.patch=
&quot;<br>
-SRC_URI[sha256sum] =3D &quot;7a4f74802486d7e77a1c9fa4fda19b13fc8a8dec3e507=
4f367e34fa82b40d28e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;8bc5905d2157186e0b9c01421df0b7cbb7e8618653b49=
5810dd95e95888162e2&quot;<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot;--enable-maintainer-mode --disable-debug&quot=
;<br>
<br>
diff --git a/meta-xfce/recipes-xfce/xfconf/<a href=3D"http://xfconf_4.16.0.=
bb" rel=3D"noreferrer" target=3D"_blank">xfconf_4.16.0.bb</a> b/meta-xfce/r=
ecipes-xfce/xfconf/<a href=3D"http://xfconf_4.17.2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">xfconf_4.17.2.bb</a><br>
similarity index 89%<br>
rename from meta-xfce/recipes-xfce/xfconf/<a href=3D"http://xfconf_4.16.0.b=
b" rel=3D"noreferrer" target=3D"_blank">xfconf_4.16.0.bb</a><br>
rename to meta-xfce/recipes-xfce/xfconf/<a href=3D"http://xfconf_4.17.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">xfconf_4.17.2.bb</a><br>
index be742192b..716fe3cf0 100644<br>
--- a/meta-xfce/recipes-xfce/xfconf/<a href=3D"http://xfconf_4.16.0.bb" rel=
=3D"noreferrer" target=3D"_blank">xfconf_4.16.0.bb</a><br>
+++ b/meta-xfce/recipes-xfce/xfconf/<a href=3D"http://xfconf_4.17.2.bb" rel=
=3D"noreferrer" target=3D"_blank">xfconf_4.17.2.bb</a><br>
@@ -8,7 +8,7 @@ inherit xfce gtk-doc gobject-introspection bash-completion =
vala<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot;PERL=3D${STAGING_DIR_TARGET}/usr/bin/perl&quo=
t;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;652a119007c67d9ba6c0bc7a740c923d33f32d03dc76d=
fc7ba682584e72a5425&quot;<br>
+SRC_URI[sha256sum] =3D &quot;e4eefa03cdd3672f928e80bf86f68ba9e9ea3e1ee8208=
f8d964610c416ee8db0&quot;<br>
<br>
=C2=A0FILES:${PN} +=3D &quot;${libdir}/xfce4/xfconf/xfconfd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/gio=
/modules/libxfconfgsettingsbackend.so \<br>
diff --git a/meta-xfce/recipes-xfce/xfdesktop/<a href=3D"http://xfdesktop_4=
.16.0.bb" rel=3D"noreferrer" target=3D"_blank">xfdesktop_4.16.0.bb</a> b/me=
ta-xfce/recipes-xfce/xfdesktop/<a href=3D"http://xfdesktop_4.17.2.bb" rel=
=3D"noreferrer" target=3D"_blank">xfdesktop_4.17.2.bb</a><br>
similarity index 68%<br>
rename from meta-xfce/recipes-xfce/xfdesktop/<a href=3D"http://xfdesktop_4.=
16.0.bb" rel=3D"noreferrer" target=3D"_blank">xfdesktop_4.16.0.bb</a><br>
rename to meta-xfce/recipes-xfce/xfdesktop/<a href=3D"http://xfdesktop_4.17=
.2.bb" rel=3D"noreferrer" target=3D"_blank">xfdesktop_4.17.2.bb</a><br>
index 4a1ece8be..3b0698075 100644<br>
--- a/meta-xfce/recipes-xfce/xfdesktop/<a href=3D"http://xfdesktop_4.16.0.b=
b" rel=3D"noreferrer" target=3D"_blank">xfdesktop_4.16.0.bb</a><br>
+++ b/meta-xfce/recipes-xfce/xfdesktop/<a href=3D"http://xfdesktop_4.17.2.b=
b" rel=3D"noreferrer" target=3D"_blank">xfdesktop_4.17.2.bb</a><br>
@@ -2,13 +2,13 @@ SUMMARY =3D &quot;Xfce4 Desktop Manager&quot;<br>
=C2=A0SECTION =3D &quot;x11/base&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D94d55d512a9ba36caa9b7=
df079bae19f&quot;<br>
-DEPENDS =3D &quot;libxfce4ui libwnck thunar garcon exo&quot;<br>
+DEPENDS =3D &quot;libxfce4ui libxfce4util cairo xfconf gtk+3 libwnck3 thun=
ar garcon exo&quot;<br>
<br>
=C2=A0inherit xfce features_check<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;934ba5affecff21e62d9fac1dd50c50cd94b3a807fefa=
5f5bff59f3d6f155bae&quot;<br>
+SRC_URI[sha256sum] =3D &quot;e68128dc72924680ed384d32b95e3a18d94a1ec490c05=
dab43155cac737bcdd1&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;notify&quot;<br>
=C2=A0PACKAGECONFIG[notify] =3D &quot;--enable-notifications,--disable-noti=
fications,libnotify&quot;<br>
diff --git a/meta-xfce/recipes-xfce/xfwm4/<a href=3D"http://xfwm4_4.16.1.bb=
" rel=3D"noreferrer" target=3D"_blank">xfwm4_4.16.1.bb</a> b/meta-xfce/reci=
pes-xfce/xfwm4/<a href=3D"http://xfwm4_4.17.2.bb" rel=3D"noreferrer" target=
=3D"_blank">xfwm4_4.17.2.bb</a><br>
similarity index 87%<br>
rename from meta-xfce/recipes-xfce/xfwm4/<a href=3D"http://xfwm4_4.16.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">xfwm4_4.16.1.bb</a><br>
rename to meta-xfce/recipes-xfce/xfwm4/<a href=3D"http://xfwm4_4.17.2.bb" r=
el=3D"noreferrer" target=3D"_blank">xfwm4_4.17.2.bb</a><br>
index a32bad47e..b24130216 100644<br>
--- a/meta-xfce/recipes-xfce/xfwm4/<a href=3D"http://xfwm4_4.16.1.bb" rel=
=3D"noreferrer" target=3D"_blank">xfwm4_4.16.1.bb</a><br>
+++ b/meta-xfce/recipes-xfce/xfwm4/<a href=3D"http://xfwm4_4.17.2.bb" rel=
=3D"noreferrer" target=3D"_blank">xfwm4_4.17.2.bb</a><br>
@@ -2,13 +2,13 @@ DESCRIPTION =3D &quot;Xfce4 Window Manager&quot;<br>
=C2=A0SECTION =3D &quot;x11/wm&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd791728a073bc009b4ffa=
f00b7599855&quot;<br>
-DEPENDS =3D &quot;virtual/libx11 libxfce4ui libwnck3 libxinerama&quot;<br>
+DEPENDS =3D &quot;virtual/libx11 libxfce4ui libxfce4util xfconf libwnck3 l=
ibxinerama&quot;<br>
<br>
=C2=A0inherit xfce update-alternatives features_check<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;b5b24ca04bd73c642db0a4b4df81d262381d758f01b51=
108257d48b391b8718c&quot;<br>
+SRC_URI[sha256sum] =3D &quot;b7200498ce57d1f2d11ef2191b4853c5cf65d3b5206af=
b6f1af6bf4f22469d29&quot;<br>
<br>
=C2=A0PACKAGECONFIG ?=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;op=
engl&#39;, &#39;epoxy&#39;, &#39;&#39;, d)} \<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#99964): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/99964" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/99964</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95501111/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95501111/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000764b2305ef2fbef5--

