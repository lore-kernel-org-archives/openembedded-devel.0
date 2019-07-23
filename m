Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF9C7D597
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 21:03:09 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id z4so43332064qtc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 14:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NrhgHKLsRzdprnFVz5aBaK7uDpHwC0j+towFCJnkgGY=;
	b=OS06Ur/dcXlDOUQmarZkypg8Cl2p4N/jZNclGz46J5/jOEetH6yW69m3YOSIS9cWES
	v0AK/di0xHG4fkX1dHsqNbIcad1rt3X6LpaKLHErqONO5FUCGwwyyd03xM5yRvmYCXPo
	YwHm5CZjU/7vJEbFay/4jy3hlDMItvN955TK7t2akD8W48RtIO42ENKihNUNzuZVYFkn
	8V4wii6lanjLXv3qkHZ7YCmPZ3D5RYcBgWFLpctUijjH3xRQkB/siRTzXwjQT3qUUGW0
	aUuHhYkQpqzgEaVM3c6MysuOYwKGvaW07ZRwKPakBN+W/JqIFX5zrljhh5Gwf/uZxhku
	GPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NrhgHKLsRzdprnFVz5aBaK7uDpHwC0j+towFCJnkgGY=;
	b=rDwEr8uGyJ9s1vIW0ylbbbRd3DB8ZmSQDiK/22QEykpId8mxmHKoCE/3boJo/ba8M4
	BsL4PwR4xQi11mB0/BFqdGvK7s8MX7a88w5JsXI+yF83BlyTQDxS9lf0Cj/G/YunY40I
	/6HzOSnpZ+g/uWSftlAIE5GGxY7zPkHEKucjXQ3VvR3pRXjHBjB/9kMTe2hl/x7rG9pn
	Ic8M4EOjCRhlRc9yVXJjvObYY55872NNMsjJySRGhOveR7vrZsbIfCQwQAtHh7xZKEHO
	a4DcrGkLeTtVVY16/6/AwXB7O7O94QlKIKq2nDjvhcZIQHIIpyqd7Pz2+yXIAVtSd6sT
	YnVg==
X-Gm-Message-State: APjAAAX+rYjGxb+E1v5ERyOX9dXiFvsSXB0e20Va2O1qvdCIvxBLGM7Y
	ieDRnwsvU3BFK9i3tz2cdl93iMUX2+mlC2VGiJrbN/wjXWA=
X-Google-Smtp-Source: APXvYqxSX7GUNM5nVFHV+u0sSYDe6cUwBpD8n/X9FinXrXlo24zZPtacyrHb8gc/bZaZNNSpdQIGAm7WnnmXz6iymnI=
X-Received: by 2002:aed:3644:: with SMTP id e62mr53227959qtb.80.1563915789739; 
	Tue, 23 Jul 2019 14:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190723151739.9337-1-bunk@stusta.de>
In-Reply-To: <20190723151739.9337-1-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Jul 2019 14:02:52 -0700
Message-ID: <CAMKF1srK9e7bZravC4r_1rwL-J_xPHmQipwAbu7796FLHyDjfA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH v2] meta-gnome: Inherit gnomebase instead of gnome
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Jul 2019 21:03:09 -0000
Content-Type: text/plain; charset="UTF-8"

https://errors.yoctoproject.org/Errors/Details/253908/

On Tue, Jul 23, 2019 at 8:17 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> The gnome class pulls in usually unwanted dependencies like gconf.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta-gnome/recipes-gnome/evince/evince_3.28.2.bb              | 2 +-
>  meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb                | 2 +-
>  .../recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb      | 2 +-
>  .../gnome-system-monitor/gnome-system-monitor_3.32.0.bb       | 2 +-
>  meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb                  | 4 ++--
>  meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb       | 2 +-
>  meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb             | 2 +-
>  7 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb b/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
> index d2885906f..f45180e79 100644
> --- a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
> +++ b/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
>  SECTION = "x11/office"
>  DEPENDS = "gtk+3 libsecret ${@bb.utils.contains('DISTRO_FEATURES','x11','gnome-desktop3','',d)} poppler gstreamer1.0-plugins-base orc adwaita-icon-theme intltool-native gnome-common-native"
>
> -inherit gnome pkgconfig gtk-icon-cache gsettings gobject-introspection distro_features_check systemd
> +inherit gnomebase pkgconfig gtk-icon-cache gsettings gobject-introspection distro_features_check systemd
>
>  SRC_URI = " \
>      ${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
> diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
> index ea6439d91..9046645f5 100644
> --- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
> +++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
> @@ -9,7 +9,7 @@ DEPENDS = "gvfs enchant gconf gnome-doc-utils glib-2.0 gtk+ \
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>
> -inherit distro_features_check gnome gettext python3native
> +inherit distro_features_check gnomebase gconf gettext python3native
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
> index 1dad1e95b..85ee5e6cf 100644
> --- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
> @@ -8,7 +8,7 @@ BPN = "gnome-desktop"
>
>  GNOMEBASEBUILDCLASS = "meson"
>
> -inherit gnome pkgconfig upstream-version-is-even gobject-introspection distro_features_check
> +inherit gnomebase pkgconfig upstream-version-is-even gobject-introspection distro_features_check
>
>  # gobject-introspection is mandatory and cannot be configured
>  REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
> index c2432a322..701b0891c 100644
> --- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
> @@ -14,7 +14,7 @@ DEPENDS = " \
>
>  GNOMEBASEBUILDCLASS = "meson"
>
> -inherit gnomebase gtk-icon-cache distro_features_check gettext
> +inherit gnomebase gconf gtk-icon-cache distro_features_check gettext
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
> index 3a4714a12..893379b52 100644
> --- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
> +++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
> @@ -3,9 +3,9 @@ LICENSE = "LGPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=05df38dd77c35ec8431f212410a3329e"
>
>  GNOMEBASEBUILDCLASS = "meson"
> -inherit gnome bash-completion gettext upstream-version-is-even
> +inherit gnomebase bash-completion gettext upstream-version-is-even
>
> -DEPENDS += "libsecret glib-2.0 gconf libgudev shadow-native"
> +DEPENDS += "libsecret glib-2.0 glib-2.0-native gconf libgudev shadow-native"
>
>  SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
>
> diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
> index 7babbd0a8..d9f643106 100644
> --- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
> +++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
> @@ -6,7 +6,7 @@ SECTION = "x11/gnome/libs"
>
>  DEPENDS = "gconf glib-2.0 libxklavier gtk+3 intltool-native"
>
> -inherit distro_features_check gnome gobject-introspection gettext
> +inherit distro_features_check gnomebase gobject-introspection gettext
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb
> index 08e52241b..e2a838b3a 100644
> --- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb
> +++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb
> @@ -7,7 +7,7 @@ SECTION = "libs"
>
>  DEPENDS= "libxml2 bzip2 glib-2.0 zlib intltool-native gnome-common-native"
>
> -inherit autotools pkgconfig gnome gconf gobject-introspection
> +inherit autotools pkgconfig gnomebase gconf gobject-introspection
>
>  SRC_URI += "file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

