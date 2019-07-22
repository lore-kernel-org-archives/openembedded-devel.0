Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 56D9C7EE0E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 16:07:45 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id x22so34129398qtp.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 09:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=h7LukCJ4GM85IYyho+445nF69MDoUS4BGnrg33sIcSU=;
	b=RXT4Rfg3Ql+xtrBpQY9aS/hN4pKFsRjUACGTVniTqZpMtD9Uc5yf2ddCFaohz8tMh5
	PC5FOOAqzxI0neJHTXJonXA4zQ6szcxgFBdN0Ul+fG2C+e+DA9/XB1ItACe0qVqC4nkw
	CYQNpOiCEb36z/k+j/wCN/CwZ+iHazymg7CnAYkIXmMRMia1TmHBwaoiR1bDEbNrM+/k
	F3wTHKHsGU5sdSsoQ+q95zsojGbMpleHkXzPBWnpdtHMupIeaDjfnyxwYHN2eRppnwAh
	QZyfJvcvHfeGyDUNWAzBArIbODpxHZHw5n/kG39wSGcRvFoNotIfobGdNuVk6cGOqiYI
	Sqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=h7LukCJ4GM85IYyho+445nF69MDoUS4BGnrg33sIcSU=;
	b=Dir8rBlUC3ckGo03EjHMcXbYEE1A6jQyckbBrkCmR+PQNucWCrTAeYqNWATABic+QS
	Pu3D8fVRc1zKOE+cDLm29WcKYhg5Np7dtrLiOF3WSm7wGRBQO/FUXqxBi3xtlVxDbVfj
	flg/fqCV0CWaM81PrFCAYRfzq1OefUaVFApOTBEDksX9EjdT4KDhpqLiWC7UZzArfDKn
	Xmf16hFHnkMH/6sl4qkMMOSFTbVdKhsO2ParOSfvp3vfIirYqeUXB+VqUmzkXL/CXf6/
	PLuh0h9WlV9OLNkTC3A+z1HWvx9kIAuZ/OaVl5bMCED3bHfTLv+Rqn0Zf9YE7/AVjsjn
	TBAQ==
X-Gm-Message-State: APjAAAUNoqZuQYmHDLim4bho86YSCpdpqXg3yYI50mOtr0YpMx/QJF7b
	9rGwOe+5yVL0zIx4VvZOJbWMT9Z+fYAcgSdjrbeyEeOa9dA=
X-Google-Smtp-Source: APXvYqxz1otscPnDDv6xlwA8mZaun58B0kPTjn4REN2gEvv2k3rCOTgTIQJgy03TdnrX6AoVG7XbWwil/KiP9hsnr9E=
X-Received: by 2002:aed:3644:: with SMTP id e62mr48981429qtb.80.1563811666128; 
	Mon, 22 Jul 2019 09:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190722130224.9972-1-bunk@stusta.de>
In-Reply-To: <20190722130224.9972-1-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Jul 2019 09:07:20 -0700
Message-ID: <CAMKF1sqM6spF1vd0+=fzJz0WyzHx1u_FofPUn=uiE8w9ybc1fw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH] meta-gnome: Inherit gnomebase instead of gnome
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
X-List-Received-Date: Mon, 22 Jul 2019 16:07:46 -0000
Content-Type: text/plain; charset="UTF-8"

Adrian

Seeing this failure

https://errors.yoctoproject.org/Errors/Details/253680/

On Mon, Jul 22, 2019 at 6:02 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> The gnome class pulls in usually unwanted dependencies like gconf.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta-gnome/recipes-gnome/evince/evince_3.28.2.bb                | 2 +-
>  meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb                  | 2 +-
>  meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb | 2 +-
>  meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb                    | 2 +-
>  meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb         | 2 +-
>  meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb               | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
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
> diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
> index 3a4714a12..86778aaeb 100644
> --- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
> +++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
> @@ -3,7 +3,7 @@ LICENSE = "LGPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=05df38dd77c35ec8431f212410a3329e"
>
>  GNOMEBASEBUILDCLASS = "meson"
> -inherit gnome bash-completion gettext upstream-version-is-even
> +inherit gnomebase bash-completion gettext upstream-version-is-even
>
>  DEPENDS += "libsecret glib-2.0 gconf libgudev shadow-native"
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

