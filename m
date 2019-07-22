Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8E6E57EC66
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 16:09:14 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id l9so39020699qtu.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 09:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=weTOsXTYy6NWoD6tAWzVtJhtUjZoWUqpzMAW/Do6qWo=;
	b=jJGccMEfYcJUQZTaGHI2H9gdKoIisd2aRMyCLWVTklErBpnPa7LrxipRH1JP5I6WEt
	Izu9LrRV7MZh7NXHsJcWeFpSz/AoBbyiAWF2RCAoTIAKVJTUA1WH6n3Vid9K09uoKXse
	XMPZ0FpK4rtprQWpuUlhHbRsonFAdVP+wZm0LUHLU1XHh5WLxcS7zYetHz5Y+E3DGe6i
	edPTL1cYFbBs8gTGHmWxZRFP8U2+io7tohkzOCXnB6n7WClw25GLjdAjDOAzjS3zUOyY
	Rm42+A0gWprEYu609QOjVB+7IWQHY/bP9ffzTEhDZSWSjQreW1e3hIpB+DWSRoF3vpEV
	9dVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=weTOsXTYy6NWoD6tAWzVtJhtUjZoWUqpzMAW/Do6qWo=;
	b=Wr/9PHyW0Y2DtTzEGDR3XBxrSjbzOZnKUT5dKSWbfbiSSO1tpSfq1MA4spfBHJKU7D
	ziuitOUct6Hrx6ATD6UEFuqL4U2wibqWTRB8YGzEsdFKNolJ3eoIx9F4vZaNNe6/DYEw
	xjCqHkcxelaQoBeessTEFg8EQrvBH4T2EKXM/7QHXEpIV1cDrEWfCz3oSR5bBx6ywDxX
	z/FAQu3VkdzhdCctfpoRAzIXMkuJu+hlxEA4Xcq5F3pIRZ58jGc1RbkhFw09ktxTLXWF
	rkof8oFBZLBNVbk0SHpaExyA9qPeYK02OrI2Ad0cF3fq8uiR54dRFLBjbHYIvdij8PB+
	y/8A==
X-Gm-Message-State: APjAAAUuwDisNHt8J5EbDsun8FaGAARaenvEZOJhVX9XQ+iQjgkASkuf
	4pXxV1qBhtO1Z68+NCEn2nEoGKlKLtMxEOv2WnQDBQnGq6E=
X-Google-Smtp-Source: APXvYqwi+vx7GHnlo/dFMVVxOxXMQfbguKLfeDX7YhKRrIAAoX12Ukoh1sRyquUULlXRMNDIaeCKpiHkaDM5+5x6XLQ=
X-Received: by 2002:a0c:ae5a:: with SMTP id z26mr50758373qvc.65.1563811755050; 
	Mon, 22 Jul 2019 09:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190722073224.9950-2-bunk@stusta.de>
In-Reply-To: <20190722073224.9950-2-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Jul 2019 09:08:49 -0700
Message-ID: <CAMKF1sqf6ReJqaJOhKbcExG558jEcMeqPmjxKerEk==WVid93w@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] meta-oe: Inherit gnomebase instead of gnome
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
X-List-Received-Date: Mon, 22 Jul 2019 16:09:14 -0000
Content-Type: text/plain; charset="UTF-8"

pavucontrol fails

https://errors.yoctoproject.org/Errors/Details/253672/

On Mon, Jul 22, 2019 at 12:32 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> The gnome class pulls in usually unwanted dependencies like gconf.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta-oe/recipes-gnome/atk/atkmm_2.28.0.bb                | 2 +-
>  meta-oe/recipes-gnome/vte9/vte9.inc                      | 2 +-
>  meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb             | 3 ++-
>  meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb | 2 +-
>  meta-oe/recipes-support/pidgin/gmime_3.2.3.bb            | 2 +-
>  5 files changed, 6 insertions(+), 5 deletions(-)
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
> index 6a8274405..44801c8d9 100644
> --- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
> +++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>
>  DEPENDS = "intltool-native gtkmm3 libcanberra pulseaudio"
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

