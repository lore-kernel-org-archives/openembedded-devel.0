Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.58107.1595863730394311895
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rTQBUO2V;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id d14so15545252qke.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2020 08:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5KcXTSwtN7FGrhsn+VZeMSY1uJ6phjI/QZyY87UMQnI=;
        b=rTQBUO2V4DVOG0lyLCO8BgIk9UvORAR36fNrxtzHyNyDOkPsMM6sxezALynbV/MZJ2
         WTwB2s7QYR3c2egAg3kUm94jI/bWLU9sNPClx1hu6dyCyFdu/WecjzYS27JFNyDorMnW
         3EuYSluW5cd3Nv7wfwwnTtbV28wfKp4b+vtBObhVYaUz8PK3denYZ62AXcoi2BXRRTGM
         voxhhyx4oXSCmFZzJTL6PPIXFnBSMeDnIO/AOjD0r4rewBSeR7QEREdj0TjfP6EZdY25
         iFEvcXX7vELrqr62uObvJ9mup+PG6vsbsZGZL9Lrq1YBVIjprtgdxqdXkQS4FdHkyHpy
         UjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5KcXTSwtN7FGrhsn+VZeMSY1uJ6phjI/QZyY87UMQnI=;
        b=kc3CGeHOfRtLu+d1GNZnpvIwG4Rz2gcywy0FCKTSbf6cLigNjwbP3W8PuLotoC3WkA
         zY/FF2785ttNs4+97Tx4nS6t4MLn5CER7N+p8M7a87vCplZlpkeKJbvaqsP/BGvFxtDf
         6wtffarfL1Rzs50ocDY/yKdRfjwjghiO3iZEKOuVmubkWxbcxAoRlHcMYu2DYGlYurCJ
         g7bJfUob8lYEzvGjkCyG4/3J9APiqMBPt1vc+hWWmcTJ+aCIJ4+5khqFajE49OnF4ukx
         MJxIcpt9P2wzJL9zA4yY7+Ow3bMsk+L8vBI7ebcMrDlHFr5OGN6OeY3x/2AOSZdAnPX6
         dKAw==
X-Gm-Message-State: AOAM532jx9Zgs6vTknQtrYEu0P5jCWlil3Z2kQz9jD+kFtsJQokIPpNf
	rPkgVgg1vQvq0fUB+bHxIOL2Gi5JdaoEc11t/+M=
X-Google-Smtp-Source: ABdhPJwd4k07MJa+O1rMg9RSbAUmHhv18T/TEYlU8hJak7sH2qFfSU9zE4cIV/bUcOaqqRKPpaNRbP6hfdNbAZJiVVo=
X-Received: by 2002:a05:620a:565:: with SMTP id p5mr24591574qkp.215.1595863729436;
 Mon, 27 Jul 2020 08:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200727092108.6209-1-andrey.konovalov@linaro.org>
In-Reply-To: <20200727092108.6209-1-andrey.konovalov@linaro.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 27 Jul 2020 08:28:23 -0700
Message-ID: <CAMKF1sqFr4Tkb_zumT8ida8aPPrcp-aS82xeO=xebeY=B7K=tQ@mail.gmail.com>
Subject: Re: [meta-multimedia][PATCH] libcamera: fix packaging and installation
To: Andrey Konovalov <andrey.konovalov@linaro.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, madhavan.krishnan@linaro.org, 
	Peter Griffin <peter.griffin@linaro.org>, libcamera-devel@lists.libcamera.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 27, 2020 at 2:21 AM Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
> libcamera checks if RPATH or RUNPATH dynamic tag is present in
> libcamera.so. If it does, it assumes that libcamera binaries are
> run directly from the build directory without installing them, and
> tries to use resorces like IPA modules from the build directory.
> Mainline meson strips RPATH/RUNPATH out at install time (for
> meson versions up to 0.54; the things are somewhat changed in 0.55).
> But openembedded-core patches meson to disable RPATH/RUNPATH removal.
> That's why we need to remove this tag manually in do_install_append().
>
> IPA module is signed (with openssl dgst) after it is built. But
> during packaging the OE build system 1) splits out debugging info,
> and 2) strips the binaries. So the IPA module *.so file installed
> isn't the one which the signature was calculated against. Then
> the signature check fails, and libcamera tries to run the IPA
> module isolated (in a sandbox), which doesn't work if the IPA
> module wasn't designed to run isolated. The easiest way to fix that
> is to disable splitting out debug information and stripping the binaries
> during packaging with INHIBIT_PACKAGE_DEBUG_SPLIT and
> INHIBIT_PACKAGE_STRIP.
>
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>  .../recipes-multimedia/libcamera/libcamera.bb            | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> index 00a5c480d..573366f08 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> @@ -18,13 +18,20 @@ PV = "202006+git${SRCPV}"
>
>  S = "${WORKDIR}/git"
>
> -DEPENDS = "python3-pyyaml-native udev gnutls boost"
> +DEPENDS = "python3-pyyaml-native udev gnutls boost chrpath-native"
>  DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
>
>  RDEPENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland qt', 'qtwayland', '', d)}"
>
>  inherit meson pkgconfig python3native
>
> +do_install_append() {
> +        chrpath -d ${D}${libdir}/libcamera.so
> +}
> +
>  FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
>  FILES_${PN} += " ${libdir}/libcamera.so"
>
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +INHIBIT_PACKAGE_STRIP = "1"

I think this is sub-optimal, it means we can not have stripped
binaries and it will increase the size unnecessarily

> +
> --
> 2.17.1
>
