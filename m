Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 040D060879
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 01:45:15 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id m14so6959887qka.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 18:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=M5XGoX70Fu54wtJHofmwMkEX8YHCQWxi+FDdspSQ4kQ=;
	b=YmIIi9vmrztmWbiY8owJMmISAdakSEAhuiBUsdSLZo5QJJ5IY/urwLV24vJ7ALp/4d
	42HTMsnlkmUhVhdpCni422mkw6E4K9fLkBFn3nE45nfCAB0rQxrBKaxDV12Z9rFwKyr8
	XL7+whOm1y+dKy9OmaCRHksQZc6P8zOYvb539xh7SM3hvpR1j2xbx4KCzFcml23ux7gj
	RlQ1k+RWUcZUC71nn6L5VOSeh8GxyQ1/se/4MDcuLEUG2MUDrX86NWc6PUZcUO9HN5mp
	vQDcVRoDoWKY8qwSwAGZQmRjzSmP9MSuPCYcjirKqvVYUaRUk68Zib9D6DqiB2J70TYr
	Yt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=M5XGoX70Fu54wtJHofmwMkEX8YHCQWxi+FDdspSQ4kQ=;
	b=qJ8eB8ck1aNheAIT/ieLJzkNQIFYzO4lIo937/SinMxjc7+WBabkdOcYAsz8NTSkeQ
	c7AXWPCBhepWIMWdauR3TKywcY8ev2Sad9lp0fb48SWqSUUw2+4QV+J8ofT6FnmjZBwz
	JMaSZD+Zf2KrTLV/BdrhmAphLpGhOz2eXbd4BzpHIHgHcpobTyoOw1SNaqBsAFUPZW/F
	ecK48ZH02EuiNAxJ3leMV5HmqHxWAJOZGaRqskuRW/Jw9O0AN7uqA0RbIyWRlOilsnJ0
	UR9cf+nC9pQKNvyFNxKZ5WXKQ7T3JU3HI5u7m4rqMoz6SgOeJ8WzKckmP6nLRKP3gzQC
	Yxtg==
X-Gm-Message-State: APjAAAWOwdWrshYRcpeA40KbtvYBsSNVMVy0o5NrBYDE+stH48v47bmo
	+xEud0S2I0Whdyd2H8Tz0U1A7bp7pFpUmnpEs+7Dcsxohp8=
X-Google-Smtp-Source: APXvYqwVLeb/mlHEVdy1ISiLnj38v0ik6CblHv8de9Cwe9uR8WeeZ6CGwRVhhG3EefKI0iaTufezCqLr7/MTorLJwM4=
X-Received: by 2002:a37:c81:: with SMTP id 123mr53911764qkm.474.1563932716377; 
	Tue, 23 Jul 2019 18:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190723151649.9238-1-bunk@stusta.de>
In-Reply-To: <20190723151649.9238-1-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Jul 2019 18:44:49 -0700
Message-ID: <CAMKF1srWP3iFCHveAGELyZzQ0QeB16PG7+2H536au1QAoWOqCA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] meta-oe: Inherit gnomebase instead of gnome
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
X-List-Received-Date: Wed, 24 Jul 2019 01:45:16 -0000
Content-Type: text/plain; charset="UTF-8"

This causes
https://errors.yoctoproject.org/Errors/Details/253988/
maybe due to atkmm change is exposing another missing inherit
 gnome-system-monitor -> gtkmm3 -> atkmm

On Tue, Jul 23, 2019 at 8:17 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> The gnome class pulls in usually unwanted dependencies like gconf.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta-oe/recipes-gnome/atk/atkmm_2.28.0.bb                | 2 +-
>  meta-oe/recipes-gnome/vte9/vte9.inc                      | 2 +-
>  meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb             | 3 ++-
>  meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb | 4 ++--
>  meta-oe/recipes-support/pidgin/gmime_3.2.3.bb            | 2 +-
>  5 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/meta-oe/recipes-gnome/atk/atkmm_2.28.0.bb b/meta-oe/recipes-gnome/atk/atkmm_2.28.0.bb
> index 63f4f09ba..e587e2a10 100644
> --- a/meta-oe/recipes-gnome/atk/atkmm_2.28.0.bb
> +++ b/meta-oe/recipes-gnome/atk/atkmm_2.28.0.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>
>  DEPENDS = "atk glibmm"
>
> -inherit distro_features_check gnome autotools pkgconfig
> +inherit distro_features_check gnomebase autotools pkgconfig
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-gnome/vte9/vte9.inc b/meta-oe/recipes-gnome/vte9/vte9.inc
> index 206c430da..d860d44e2 100644
> --- a/meta-oe/recipes-gnome/vte9/vte9.inc
> +++ b/meta-oe/recipes-gnome/vte9/vte9.inc
> @@ -8,7 +8,7 @@ RDEPENDS_libvte = "vte-termcap"
>  GNOMEBN = "vte"
>  S = "${WORKDIR}/vte-${PV}"
>
> -inherit gnome gtk-doc distro_features_check upstream-version-is-even gobject-introspection
> +inherit gnomebase gtk-doc distro_features_check upstream-version-is-even gobject-introspection
>  ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
>
>  EXTRA_OECONF = "--disable-python"
> diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
> index 943986e77..1d64910fd 100644
> --- a/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
> +++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
> @@ -8,6 +8,7 @@ DEPENDS = " \
>      gdk-pixbuf-native \
>      intltool-native \
>      libxslt-native \
> +    dbus-glib \
>      gtk+ \
>      babl \
>      gegl \
> @@ -24,7 +25,7 @@ DEPENDS = " \
>  "
>  DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxmu libxpm', '', d)}"
>
> -inherit distro_features_check gnome gtk-doc
> +inherit distro_features_check gnomebase gtk-icon-cache gtk-doc
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
> index 6a8274405..421ea9d5c 100644
> --- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
> +++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
> @@ -2,9 +2,9 @@ DESCRIPTION = "PulseAudio Volume Control (pavucontrol) is a simple GTK based vol
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>
> -DEPENDS = "intltool-native gtkmm3 libcanberra pulseaudio"
> +DEPENDS = "intltool-native gtk+3-native gtkmm3 libcanberra pulseaudio"
>
> -inherit gnome distro_features_check
> +inherit gnomebase distro_features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-support/pidgin/gmime_3.2.3.bb b/meta-oe/recipes-support/pidgin/gmime_3.2.3.bb
> index 8c6f0b010..bce89bec8 100644
> --- a/meta-oe/recipes-support/pidgin/gmime_3.2.3.bb
> +++ b/meta-oe/recipes-support/pidgin/gmime_3.2.3.bb
> @@ -4,7 +4,7 @@ DESCRIPTION = "Runtime libraries for parsing and creating MIME mail"
>  SECTION = "libs"
>  DEPENDS = "glib-2.0 zlib"
>
> -inherit gnome autotools gobject-introspection
> +inherit gnomebase autotools gobject-introspection
>
>  SRC_URI += "file://iconv-detect.h \
>              file://nodolt.patch"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

