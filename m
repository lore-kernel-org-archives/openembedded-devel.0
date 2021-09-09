Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.1543.1631205433592648566
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Sep 2021 09:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y2rvPPFp;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d18so1415653pll.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Sep 2021 09:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=heSMR0BDqyaEQFNtJx1tepTJHMYrymw00qrCwQ3Nr/E=;
        b=Y2rvPPFpj5LMtKn0G4w06nLLWu+ha+lPz3+4SZ+HUPK0hjtr95kkgFEFaKKK15jI1Q
         s/mmEg3jHi3FElXVMza9sq54uRBprMX67W1zOtoXMWEbmW3pMokmoipnPyaKdbK6Kmfg
         Pe4DG5X2Rn2Zwag19/dmAjEl2njPlL3pICGp2jYEGWAb/nUQxeYe9p48tovYMXdPR2MX
         ULCN9FNIFOXzfIr3pRxyUIJ7qXBRw4m+ZGbMRG1KkOXWIqTlADzBL/AhQ53RSlXFFdI8
         6WUNH1gUkQbYLjjC3198zo/0kj/C6H4/thxCego25f8mNsb8APORAY0kG9cWpiYaNPwv
         dGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=heSMR0BDqyaEQFNtJx1tepTJHMYrymw00qrCwQ3Nr/E=;
        b=NTItKQDRs3w2IDc5+zalsZqGou4uqaTLqqfs5UFrFmC4tsxBTKWfxXrsozVCLXbXHz
         2cmzE064rwmP3DWuAAEHKNl2iasrBKTrNTwo4b8PiUAUzwJPQrVGrkVOtU+oz6TMOBBf
         zU0t4Qpp+3noKkixiYeQ4+XWdbG0CXYxPWg0ika+1L4m8jKgdi9WxzqVYFR0wBAjZbej
         Ob3EdsUJ/fpDGd4B4N5ScZAyS+TVxacDIKbS7xUeEtJFgN847lrEN4P+1u2FHjXUhY6P
         RHPFKY15fNZKeCIYuJCbLWmNLbvidPCn3D9WCPzEXYZxsVG3zuGYm7DY+mVS/MoWCbnQ
         vwMg==
X-Gm-Message-State: AOAM5323MzUu7M2r4cbANgMrQN4OL4ovkJtJq1+14uR9dAMSHmJXO1tR
	bh/rfszO0SYTzlo8SCXwb7sdflD/+fC5zA==
X-Google-Smtp-Source: ABdhPJzfehnEAFS4mFdpqpYRz61D/fXmPdP/mcsonYvehxbmAx5iUG/BjDjALBBMME7KPekri6FCwA==
X-Received: by 2002:a17:90a:428e:: with SMTP id p14mr4644758pjg.92.1631205432855;
        Thu, 09 Sep 2021 09:37:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:889e:9651:ed1e:11b0? ([2601:646:9200:a0f0:889e:9651:ed1e:11b0])
        by smtp.gmail.com with ESMTPSA id y7sm2844645pff.206.2021.09.09.09.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Sep 2021 09:37:12 -0700 (PDT)
Message-ID: <82c9dfbc-85e1-2349-dca6-c10185558cdf@gmail.com>
Date: Thu, 9 Sep 2021 09:37:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.0
Subject: Re: [oe] [meta-gnome][PATCH v2] gimp: add recipe for current developement version
To: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
References: <20210903112308.4288-1-f_l_k@t-online.de>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210903112308.4288-1-f_l_k@t-online.de>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/3/21 4:23 AM, Markus Volk wrote:
> Reworked the gimp recipe to use the latest developement release.
> Switched buildsystem to meson.
> 

seems ok, can we also add DEFAULT_PREFERENCE = "-1" since we do not want 
this to be picked as default.

> Signed-off-by: MarkusVolk <f_l_k@t-online.de>
> ---
>   .../gimp/0001-meson-make-gir-buildable.patch  |  43 +++++++
>   meta-gnome/recipes-gimp/gimp/gimp_2.99.6.bb   | 109 ++++++++++++++++++
>   2 files changed, 152 insertions(+)
>   create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-meson-make-gir-buildable.patch
>   create mode 100644 meta-gnome/recipes-gimp/gimp/gimp_2.99.6.bb
> 
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-meson-make-gir-buildable.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson-make-gir-buildable.patch
> new file mode 100644
> index 000000000..632ae17c2
> --- /dev/null
> +++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson-make-gir-buildable.patch
> @@ -0,0 +1,43 @@
> +From c8f73f57d63779cfaad140e0521be40972fbec8f Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Wed, 1 Sep 2021 16:44:13 +0200
> +Subject: [PATCH] meson: make gir buildable
> +
> +yocto/oe is capable of building gobject introspection despite cross-compiling.
> +add an option to enable gir build even if cross-compiling
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +---
> + libgimp/meson.build | 2 +-
> + meson_options.txt   | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/libgimp/meson.build b/libgimp/meson.build
> +index 9e7b4fbbe3..99614733d7 100644
> +--- a/libgimp/meson.build
> ++++ b/libgimp/meson.build
> +@@ -384,7 +384,7 @@ libgimpui_introspectable_files = [
> +   libgimpwidgets_introspectable,
> + ]
> +
> +-if meson.is_cross_build()
> ++if meson.is_cross_build() and not get_option('introspection')
> +   have_gobject_introspection = false
> +   gobject_introspection_warning = '\n      '.join(['',
> +     'GObject Introspection is disabled while cross-compiling because',
> +diff --git a/meson_options.txt b/meson_options.txt
> +index 7b6ad78045..c29fdb5b40 100644
> +--- a/meson_options.txt
> ++++ b/meson_options.txt
> +@@ -52,7 +52,7 @@ option('headless-tests',    type: 'feature', value: 'auto', description: 'Use xv
> + option('gtk-doc',           type: 'boolean', value: true,   description: 'Build developer documentation')
> + option('gtk-doc-app',       type: 'boolean', value: false,  description: 'Build developer documentation for app')
> + option('g-ir-doc',          type: 'boolean', value: false,  description: 'Build developer documentation for introspected API')
> +-
> ++option('introspection',   type: 'boolean', value: false,  description: 'GIR is buildable even if crosscompiling')
> + option('linux-input',       type: 'feature', value: 'auto', description: 'Linux input event controller module')
> + option('vec-icons',         type: 'boolean', value: true,   description: 'Use vector icons rather than raster ones')
> +
> +--
> +2.25.1
> +
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.99.6.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.99.6.bb
> new file mode 100644
> index 000000000..c1e33d23d
> --- /dev/null
> +++ b/meta-gnome/recipes-gimp/gimp/gimp_2.99.6.bb
> @@ -0,0 +1,109 @@
> +SUMMARY = "The GIMP is the GNU Image Manipulation Program"
> +HOMEPAGE = "http://www.gimp.org"
> +SECTION = "graphics"
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
> +
> +REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> +
> +DEPENDS = " \
> +    appstream-glib \
> +    atk \
> +    babl \
> +    bison-native \
> +    cairo \
> +    dbus-glib \
> +    fontconfig \
> +    freetype \
> +    gdk-pixbuf-native \
> +    gegl \
> +    gegl-native \
> +    gexiv2 \
> +    gtk+3 \
> +    harfbuzz \
> +    intltool-native \
> +    json-glib \
> +    lcms \
> +    libarchive \
> +    libexif \
> +    libmypaint \
> +    libxslt-native \
> +    mypaint-brushes-1.0 \
> +    pango \
> +    poppler \
> +    poppler-data \
> +"
> +
> +DEPENDS:append:libc-musl = " libexecinfo"
> +RDEPENDS:${PN} = "mypaint-brushes-1.0 glib-networking"
> +
> +inherit meson gtk-icon-cache mime-xdg pkgconfig features_check gobject-introspection
> +
> +SRC_URI = " \
> +    git://github.com/GNOME/gimp.git;protocol=https \
> +    file://0001-meson-make-gir-buildable.patch \
> +"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "GIMP_2_99_6"
> +
> +PACKAGECONFIG[aa] = "-Daa=enabled,-Daa=disabled,aalib"
> +PACKAGECONFIG[alsa] = "-Dalsa=enabled,-Dalsa=disabled,alsa-lib"
> +PACKAGECONFIG[appdata-test] = "-Dappdata-test=enabled,-Dappdata-test=disabled,appstream-glib-native"
> +PACKAGECONFIG[bzip2] = ",,bzip2"
> +PACKAGECONFIG[cairo-pdf] = "-Dcairo-pdf=enabled,-Dcairo-pdf=disabled"
> +PACKAGECONFIG[check-update] = "-Dcheck-update=true,-Dcheck-update=false"
> +PACKAGECONFIG[enable-console-bin] = "-Denable-console-bin=true,-Denable-console-bin=false"
> +PACKAGECONFIG[ghostscript] = "-Dghostscript=enabled,-Dghostscript=disabled,ghostscript"
> +PACKAGECONFIG[gtk-doc] = "-Dgtk-doc=true,-Dgtk-doc=false,gtk-doc-native"
> +PACKAGECONFIG[gtk-doc-app] = "-Dgtk-doc-app=true,-Dgtk-doc-app=false,gtk-doc-native"
> +PACKAGECONFIG[gudev] = "-Dgudev=enabled,-Dgudev=disabled,libgudev"
> +PACKAGECONFIG[javascript] = "-Djavascript=true,-Djavascript=false,,openjre-8"
> +PACKAGECONFIG[jpeg2000] = "-Djpeg2000=enabled,-Djpeg2000=disabled,jasper"
> +PACKAGECONFIG[jpeg] = ",,jpeg"
> +PACKAGECONFIG[lua] = "-Dlua=true,-Dlua=false,,luajit lgi"
> +PACKAGECONFIG[lzma] = ",,xz"
> +PACKAGECONFIG[mng] = "-Dmng=enabled,-Dmng=disabled,libmng"
> +PACKAGECONFIG[png] = "-Dpng=enabled,-Dpng=disabled,libpng"
> +PACKAGECONFIG[python] = "-Dpython=true,-Dpython=false,,python3 python3-pygobject"
> +PACKAGECONFIG[rsvg] = ",,librsvg"
> +PACKAGECONFIG[tiff] = ",,tiff"
> +PACKAGECONFIG[vala-plugins] = "-Dvala-plugins=enabled,-Dvala-plugins=disabled"
> +PACKAGECONFIG[webkit] = "-Dwebkit=enabled,-Dwebkit=disabled,webkitgtk"
> +PACKAGECONFIG[webp] = "-Dwebp=enabled,-Dwebp=disabled,libwebp"
> +PACKAGECONFIG[xcursor] = "-Dxcursor=enabled,-Dxcursor=disabled,libxcursor"
> +PACKAGECONFIG[x11] = "-Dxpm=enabled,-Dxpm=disabled,libxpm libxmu"
> +PACKAGECONFIG[zlib] = ",,zlib"
> +
> +PACKAGECONFIG ?= " \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
> +    alsa \
> +    bzip2 \
> +    cairo-pdf \
> +    gtk-doc-app \
> +    gudev \
> +    jpeg \
> +    jpeg2000 \
> +    lua \
> +    lzma \
> +    mng \
> +    png \
> +    python \
> +    rsvg \
> +    tiff \
> +    webp \
> +    zlib \
> +"
> +
> +FILES:${PN} += " \
> +    ${datadir}/metainfo \
> +    ${datadir}/gir-1.0 \
> +    ${datadir}/appdata \
> +    ${libdir}/girepository-1.0 \
> +"
> +
> +EXTRA_OEMESON += " \
> +    -Dshmem-type=posix \
> +    --buildtype release \
> +"
> +
> 
> 
> 
> 
> 
