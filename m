Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B45FC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 06:01:04 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.4217.1654063257164953466
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 23:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ijh62yGL;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id v1so505602qtx.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 23:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SEMXKntVE/+Bd9Eu3ZO6JiDuREjbxu6B1xtuEaeEj5k=;
        b=ijh62yGLtPCkzoa3KtJKATps1ytNRE/yHxuviOfpIUbvrMFf3AciTpalB63mfQN4LD
         pSxSCsbSJXmNzy0fGQuzbjU0Ep5JTT07uOcYAJLv/9yZ5z+5OlLBGYmh+v844QsgT1ty
         pT9RrxhBr/E0ZBqffTas2uLEdqzwwNPrkIxhjEa3Vc5eQElXa+l4p5MtdFrEXNYxiNnV
         jKAlW8wuQTNmlM703rubFUvaTPxDHpDlWL9Wm6YiwwPxKqMImEb67l4PfDgFa3e8EMLj
         TlvBkpFxitJanRBXldmguJYVgDU0v8kfOMoj10XcQVwks3UHUvARSPm3dsE2oRe2I4Ej
         jgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SEMXKntVE/+Bd9Eu3ZO6JiDuREjbxu6B1xtuEaeEj5k=;
        b=2HJDYn6iew1HyrCkR6Vl7igOGnkul5hqgTlqL5AE+j7aFNUMAJbtGheYwEslpxtIJ/
         BmQ8TTleuAEnz1B5Tm4caask+HzZDL0AfnWFBiCHP5EhL+vC6Mr8njVKw/X3J3gUbAyl
         wc0VJVg+EFLbC9l4PIfoI4f6E8evtePvp9TLo1ipqPuptRd3hQXStQx5SYU0I7+8Pd7M
         +zP17hV/2s7Y3PEXGaSlmMw1F2tVnVT3YCoXCmbfrSHhdtpbN7uGoA6h4mkaFOZ8a4+4
         TCakKFLjDaSkrcXvPa7aZdwvVUGvXSRPK9vuADjLq+ZRxqi7O+W1TenKSAD5QBxi09HC
         SFzQ==
X-Gm-Message-State: AOAM531U1VlSB3/Giro6/a/85/9YywVVtlpRXpeDNq2dATPGp9LZPemk
	tcyVryNdDfHLnL1RR0lvYIgXhjI4/TPMTmxQkGiqI3wJTh4=
X-Google-Smtp-Source: 
 ABdhPJxQI0MxYyqww9/rApm84N1BZSjgkhN7nhGWa6I+6xF7/sL9hazokoDzbW1S/oE5pL+HD92yznhGdQRmFbOa7DA=
X-Received: by 2002:ac8:5a86:0:b0:303:fba5:ed5e with SMTP id
 c6-20020ac85a86000000b00303fba5ed5emr11235764qtc.330.1654063255738; Tue, 31
 May 2022 23:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220531193031.186962-1-f_l_k@t-online.de>
In-Reply-To: <20220531193031.186962-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 May 2022 23:00:29 -0700
Message-ID: 
 <CAMKF1soi0JjM_DO=Py8gVQLnJEsCEX5X2-NNN_Fpv24G3sTHgA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] unblock some recipes for wayland
To: Markus Volk <f_l_k@t-online.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jun 2022 06:01:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97357

can you rebase it on master-next and resend please?

On Tue, May 31, 2022 at 12:30 PM Markus Volk <f_l_k@t-online.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-gnome/recipes-connectivity/geary/geary_40.0.bb |  4 ++--
>  meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb         |  2 +-
>  .../evolution-data-server/evolution-data-server.bb  |  2 +-
>  meta-gnome/recipes-gnome/gedit/gedit_42.0.bb        |  4 ++--
>  .../gnome-keyring/gnome-keyring_40.0.bb             |  2 +-
>  .../gnome-online-accounts_3.44.0.bb                 |  3 +--
>  .../gnome-system-monitor_42.0.bb                    |  3 ++-
>  .../gtksourceview/gtksourceview4_4.8.2.bb           |  2 +-
>  meta-gnome/recipes-gnome/gvfs/gvfs_1.50.0.bb        |  3 +--
>  .../recipes-gnome/libgdata/libgdata_0.18.1.bb       |  3 +--
>  meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb  |  6 ++----
>  meta-gnome/recipes-gnome/libwnck/libwnck3_40.1.bb   | 11 ++++++-----
>  meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb        |  3 +--
>  meta-gnome/recipes-gnome/zenity/zenity_3.42.1.bb    |  2 +-
>  meta-oe/recipes-devtools/glade/glade_3.22.2.bb      |  7 ++++---
>  meta-xfce/classes/thunar-plugin.bbclass             |  4 +++-
>  .../shares/thunar-shares-plugin_0.3.1.bb            |  5 +++--
>  meta-xfce/recipes-xfce/exo/exo_4.16.3.bb            |  6 ++++--
>  meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb      |  4 +++-
>  .../recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb    | 13 +++++++++----
>  meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb      |  9 ++++++---
>  .../recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb  |  4 +++-
>  22 files changed, 58 insertions(+), 44 deletions(-)
>
> diff --git a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb b/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
> index 501b27a54..4b454dc02 100644
> --- a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
> +++ b/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
> @@ -41,8 +41,8 @@ SRC_URI = " \
>  S = "${WORKDIR}/git"
>  SRCREV = "e561775c1580a9f60a726355b2b897bfc9cb3382"
>
> -# for gnome-online-accounts
> -REQUIRED_DISTRO_FEATURES = "gobject-introspection-data x11"
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> +REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
>
>  GIR_MESON_OPTION = ""
>  EXTRA_OEMESON = "-Dprofile=release"
> diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb
> index a6e5fa030..64291bee5 100644
> --- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb
> +++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.36.bb
> @@ -17,7 +17,7 @@ GNOMEBASEBUILDCLASS = "meson"
>
>  inherit features_check gnomebase vala gobject-introspection
>
> -REQUIRED_DISTRO_FEATURES = "x11"
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  SHPV = "${@gnome_verdir("${PV}")}"
>
> diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
> index b4931d796..64774b0fe 100644
> --- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
> +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
> @@ -8,7 +8,7 @@ DEPENDS = " \
>
>  inherit pkgconfig gsettings gobject-introspection features_check cmake gtk-doc gettext perlnative vala
>
> -REQUIRED_DISTRO_FEATURES = "x11"
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  SRC_URI += " \
>      file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
> diff --git a/meta-gnome/recipes-gnome/gedit/gedit_42.0.bb b/meta-gnome/recipes-gnome/gedit/gedit_42.0.bb
> index 5bb5525d5..baef4cd47 100644
> --- a/meta-gnome/recipes-gnome/gedit/gedit_42.0.bb
> +++ b/meta-gnome/recipes-gnome/gedit/gedit_42.0.bb
> @@ -23,9 +23,9 @@ def gnome_verdir(v):
>
>  SRC_URI[archive.sha256sum] = "a87991f42961eb4f6abcdbaabb784760c23aeaeefae6363d3e21a61e9c458437"
>
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>  # gobject-introspection is mandatory and cannot be configured
> -# x11 is needed for tepl and gtksourceview4
> -REQUIRED_DISTRO_FEATURES = "gobject-introspection-data x11"
> +REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
>  GIR_MESON_OPTION = ""
>
>  GTKDOC_MESON_OPTION = "gtk_doc"
> diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_40.0.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_40.0.bb
> index 5aa52d1a5..b6d9a58e8 100644
> --- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_40.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_40.0.bb
> @@ -19,7 +19,7 @@ DEPENDS = " \
>
>  inherit gnomebase gsettings features_check remove-libtool gettext
>
> -REQUIRED_DISTRO_FEATURES = "x11"
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  SRC_URI[archive.sha256sum] = "a3d24db08ee2fdf240fbbf0971a98c8ee295aa0e1a774537f4ea938038a3b931"
>  SRC_URI += " \
> diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.44.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.44.0.bb
> index 64aa2f4d9..451670e64 100644
> --- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.44.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.44.0.bb
> @@ -6,8 +6,7 @@ GNOMEBASEBUILDCLASS = "autotools"
>
>  inherit gnomebase gsettings gobject-introspection gsettings gtk-doc vala gettext features_check
>
> -# for webkitgtk
> -REQUIRED_DISTRO_FEATURES = "x11"
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  DEPENDS = "glib-2.0"
>
> diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_42.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_42.0.bb
> index 219a069b6..32ecc90eb 100644
> --- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_42.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_42.0.bb
> @@ -17,7 +17,8 @@ GNOMEBASEBUILDCLASS = "meson"
>
>  inherit gnomebase gsettings gnome-help itstool gtk-icon-cache features_check gettext
>
> -REQUIRED_DISTRO_FEATURES = "x11 polkit"
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> +REQUIRED_DISTRO_FEATURES = "polkit"
>
>  def gnome_verdir(v):
>      return oe.utils.trim_version(v, 1)
> diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb
> index db4d89de2..979da792f 100644
> --- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb
> +++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb
> @@ -14,7 +14,7 @@ GNOMEBASEBUILDCLASS = "meson"
>
>  inherit gnomebase lib_package gettext features_check gtk-doc gobject-introspection vala
>
> -REQUIRED_DISTRO_FEATURES = "x11"
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  SRC_URI = "https://download.gnome.org/sources/gtksourceview/4.8/${PNAME}-${PV}.tar.xz"
>  SRC_URI[sha256sum] = "842de7e5cb52000fd810e4be39cd9fe29ffa87477f15da85c18f7b82d45637cc"
> diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.0.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.0.bb
> index 93f7f5761..21d351a7b 100644
> --- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.0.bb
> +++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.0.bb
> @@ -14,8 +14,7 @@ SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/$
>
>  SRC_URI[archive.sha256sum] = "cbc2f564d2e9f00c760673f42d6803bce3e081ab7ffb4456deffffba9339b4dd"
>
> -# depends on gsettings-desktop-schemas->gcr->gtk+3-> x11
> -REQUIRED_DISTRO_FEATURES = "x11"
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  EXTRA_OEMESON = " \
>      -Dbluray=false \
> diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
> index 921c3ee80..bd9180e8a 100644
> --- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
> +++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
> @@ -14,8 +14,7 @@ GNOMEBASEBUILDCLASS = "meson"
>
>  inherit gnomebase pkgconfig gettext gtk-doc vala gobject-introspection manpages features_check
>
> -# gcr
> -REQUIRED_DISTRO_FEATURES = "x11"
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  do_compile:prepend() {
>      export GIR_EXTRA_LIBS_PATH="${B}/gdata/.libs"
> diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
> index 3ee7746c1..2e60264e0 100644
> --- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
> +++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
> @@ -2,11 +2,9 @@ SUMMARY = "A library for collecting system monitoring data"
>  LICENSE = "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>
> -inherit gnomebase lib_package gtk-doc gobject-introspection gettext upstream-version-is-even
> +inherit gnomebase lib_package gtk-doc gobject-introspection gettext upstream-version-is-even features_check
>
> -# depends on libxau
> -inherit features_check
> -REQUIRED_DISTRO_FEATURES = "x11"
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  SRC_URI += "file://0001-fix-compile-error-for-cross-compile.patch"
>
> diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_40.1.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_40.1.bb
> index cb4e459b3..a6c82b2cb 100644
> --- a/meta-gnome/recipes-gnome/libwnck/libwnck3_40.1.bb
> +++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_40.1.bb
> @@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
>  BPN = "libwnck"
>
>  SECTION = "x11/libs"
> -DEPENDS = "intltool-native gnome-common-native gtk+3 gdk-pixbuf-native libxres"
> +DEPENDS = "intltool-native gnome-common-native gtk+3 gdk-pixbuf-native"
>
> -PACKAGECONFIG ??= "startup-notification"
> -PACKAGECONFIG[startup-notification] = "-Dstartup_notification=enabled,-Dstartup_notification=disabled,startup-notification"
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> +PACKAGECONFIG[x11] = "-Dstartup_notification=enabled,-Dstartup_notification=disabled,startup-notification libxres"
>
>  GNOMEBASEBUILDCLASS = "meson"
>  GTKDOC_MESON_OPTION = "gtk_doc"
> @@ -22,5 +22,6 @@ def gnome_verdir(v):
>
>  SRC_URI[archive.sha256sum] = "03134fa114ef3fbe34075aa83678f58aa2debe9fcef4ea23c0779e28601d6611"
>
> -# libxres means x11 only
> -REQUIRED_DISTRO_FEATURES = "x11"
> +# gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
> +# cairo would at least needed to be built with xlib.
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> diff --git a/meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb b/meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb
> index 61e82e285..66de215cf 100644
> --- a/meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb
> +++ b/meta-gnome/recipes-gnome/tepl/tepl_6.00.0.bb
> @@ -15,8 +15,7 @@ GNOMEBASEBUILDCLASS = "meson"
>
>  inherit gnomebase gobject-introspection gettext features_check
>
> -# for gtksourceview4
> -REQUIRED_DISTRO_FEATURES += "x11"
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  SRC_URI[archive.sha256sum] = "a86397a895dca9c0de7a5ccb063bda8f7ef691cccb950ce2cfdee367903e7a63"
>
> diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.42.1.bb b/meta-gnome/recipes-gnome/zenity/zenity_3.42.1.bb
> index d48eb826f..2bcd8cc6b 100644
> --- a/meta-gnome/recipes-gnome/zenity/zenity_3.42.1.bb
> +++ b/meta-gnome/recipes-gnome/zenity/zenity_3.42.1.bb
> @@ -12,7 +12,7 @@ DEPENDS = " \
>      gtk+3 \
>  "
>
> -REQUIRED_DISTRO_FEATURES = "x11"
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  SRC_URI[archive.sha256sum] = "a08e0c8e626615ee2c23ff74628eba6f8b486875dd54371ca7e2d7605b72a87c"
>  SRC_URI += "file://0001-Harcode-shebang-to-avoid-pointing-to-build-system-s-.patch"
> diff --git a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb b/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
> index c7f98fac9..6c1112038 100644
> --- a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
> +++ b/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
> @@ -4,14 +4,15 @@ LICENSE = "GPL-2.0-only & LGPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=aabe87591cb8ae0f3c68be6977bb5522 \
>                      file://COPYING.GPL;md5=9ac2e7cff1ddaf48b6eab6028f23ef88 \
>                      file://COPYING.LGPL;md5=252890d9eee26aab7b432e8b8a616475"
> -DEPENDS = "gtk+ gtk+3 glib-2.0 libxml2 intltool-native \
> +DEPENDS = "gtk+3 glib-2.0 libxml2 intltool-native \
>             gnome-common-native \
>  "
>
> -
>  inherit features_check autotools pkgconfig gnomebase gobject-introspection mime-xdg
>
> -REQUIRED_DISTRO_FEATURES = "x11"
> +# xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
> +# cairo would at least needed to be built with xlib.
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade/3.22/glade-${PV}.tar.xz \
>             file://remove-yelp-help-rules-var.patch \
> diff --git a/meta-xfce/classes/thunar-plugin.bbclass b/meta-xfce/classes/thunar-plugin.bbclass
> index 423f337be..3719cba21 100644
> --- a/meta-xfce/classes/thunar-plugin.bbclass
> +++ b/meta-xfce/classes/thunar-plugin.bbclass
> @@ -1,6 +1,8 @@
>  inherit xfce features_check
>
> -REQUIRED_DISTRO_FEATURES = "x11"
> +# xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
> +# cairo would at least needed to be built with xlib.
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  DEPENDS += "thunar"
>
> diff --git a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.bb b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.bb
> index 6ed9cecef..fb7589637 100644
> --- a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.bb
> +++ b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.1.bb
> @@ -3,8 +3,9 @@ LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>
>  inherit thunar-plugin features_check
> -# x11 is needed for thunar
> -REQUIRED_DISTRO_FEATURES = "pam x11"
> +
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> +REQUIRED_DISTRO_FEATURES = "pam"
>
>  SRC_URI[md5sum] = "0884855d60cf1031b9013b6f5b125372"
>  SRC_URI[sha256sum] = "dc1d8c7caa727e76d033d4653dc0742613f57a1711d0050900659c90a84452a0"
> diff --git a/meta-xfce/recipes-xfce/exo/exo_4.16.3.bb b/meta-xfce/recipes-xfce/exo/exo_4.16.3.bb
> index 2b164442f..32735bc6e 100644
> --- a/meta-xfce/recipes-xfce/exo/exo_4.16.3.bb
> +++ b/meta-xfce/recipes-xfce/exo/exo_4.16.3.bb
> @@ -2,11 +2,13 @@ DESCRIPTION = "Application library for the Xfce desktop environment"
>  SECTION = "x11"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -DEPENDS = "gtk+3 libxfce4ui virtual/libx11 liburi-perl-native cairo"
> +DEPENDS = "gtk+3 libxfce4ui liburi-perl-native cairo"
>
>  inherit xfce perlnative gtk-doc features_check mime-xdg
>
> -REQUIRED_DISTRO_FEATURES = "x11"
> +# xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
> +# cairo would at least needed to be built with xlib.
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  # SRC_URI must follow inherited one
>  SRC_URI += " \
> diff --git a/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb b/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
> index a6c56edf3..14f0c4a64 100644
> --- a/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
> +++ b/meta-xfce/recipes-xfce/garcon/garcon_4.16.1.bb
> @@ -6,7 +6,9 @@ DEPENDS = "xfce4-dev-tools-native libxfce4ui intltool-native"
>
>  inherit xfce gtk-doc gobject-introspection features_check
>
> -REQUIRED_DISTRO_FEATURES = "x11"
> +# xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
> +# cairo would at least needed to be built with xlib.
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  SRC_URI += "file://0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch"
>  SRC_URI[sha256sum] = "84914927a2c1fda167f67af26a6640630a744a22940df508aa6c752cdbd3d21d"
> diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
> index e3d2a00ee..bb45ee6f4 100644
> --- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
> +++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
> @@ -2,11 +2,13 @@ SUMMARY = "Xfce4 Widget library and X Window System interaction"
>  SECTION = "x11/libs"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
> -DEPENDS = "intltool-native perl-native gtk+3 libice libsm libxfce4util xfce4-dev-tools xfconf virtual/libx11"
> +DEPENDS = "intltool-native perl-native gtk+3 libxfce4util xfce4-dev-tools xfconf"
>
>  inherit xfce gtk-doc gobject-introspection features_check
>
> -REQUIRED_DISTRO_FEATURES = "x11"
> +# xfce4 depends on libwnck3. gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
> +# cairo would at least needed to be built with xlib.
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  # TODO: Check if 0001-... can go
>  SRC_URI += "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch"
> @@ -15,9 +17,12 @@ SRC_URI[sha256sum] = "d96946ae5af6bf078dda415419e0021909f763ee0020b42f3e26f603e5
>  EXTRA_OECONF += "--with-vendor-info=${DISTRO}"
>  EXTRA_OECONF += "--disable-vala"
>
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= " \
> +       ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
> +"
>  PACKAGECONFIG[gladeui2] = "--enable-gladeui2,--disable-gladeui2,glade"
> -PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
> +PACKAGECONFIG[x11] = "--enable-startup-notification,--disable-startup-notification,libepoxy libice libsm startup-notification"
> +
>
>  PACKAGES += "${PN}-glade"
>  FILES:${PN}-glade = " \
> diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb
> index 93c41aedf..d3702c83c 100644
> --- a/meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb
> +++ b/meta-xfce/recipes-xfce/thunar/thunar_4.16.9.bb
> @@ -2,16 +2,19 @@ SUMMARY = "File manager for the Xfce Desktop Environment"
>  SECTION = "x11"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> -DEPENDS = "libxml-parser-perl-native exo gdk-pixbuf libxfce4ui libsm startup-notification libnotify xfce4-panel udev"
> +DEPENDS = "libxml-parser-perl-native exo gdk-pixbuf libxfce4ui libnotify xfce4-panel udev"
>
>  inherit xfce gobject-introspection features_check mime-xdg perlnative
>
> -REQUIRED_DISTRO_FEATURES = "x11"
> +# xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
> +# cairo would at least needed to be built with xlib.
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  SRC_URI[sha256sum] = "520bf318eef8bc792db38ae4af343b648f87d4b8d66f5b5d6f092e15264ee5af"
>
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>  PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
> +PACKAGECONFIG[x11] = ",,libsm startup-notification"
>
>  FILES:${PN} += " \
>      ${libdir}/thunarx-3/* \
> diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
> index b9201bc65..d47f9cefc 100644
> --- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.16.3.bb
> @@ -6,7 +6,9 @@ DEPENDS = "garcon exo gtk+3 cairo virtual/libx11 libxml2 libwnck3 vala-native"
>
>  inherit xfce gtk-doc gobject-introspection features_check remove-libtool mime-xdg
>
> -REQUIRED_DISTRO_FEATURES = "x11"
> +# xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
> +# cairo would at least needed to be built with xlib.
> +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  SRC_URI[sha256sum] = "5934eaed8a76da52c29b734ccd79600255420333dd6ebd8fd9f066379af1e092"
>  SRC_URI += " \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97356): https://lists.openembedded.org/g/openembedded-devel/message/97356
> Mute This Topic: https://lists.openembedded.org/mt/91459372/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

