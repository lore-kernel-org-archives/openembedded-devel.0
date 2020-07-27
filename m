Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web12.57736.1595862746331654008
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nrH6Ye11;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id x69so15555170qkb.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2020 08:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rptzrkuEtuLf4sFG2ob54WGWs6tZvRSLjgtfnxfyJWs=;
        b=nrH6Ye11IdGjYa7B0K1vCoJGEYdYy9s3fnwRsik/w45s7KcGmsrhlbRzq7uXZkbjZ8
         lWh4Vyq4NCUYLiYcR+LZubbyaFb5xkeDxsDmLA55s/9Fg6DI0ohB/ZOoG9qDLPz8JN4V
         Qt9Eh9YnF+wUYSMByK5wGurwipFkhrVNzC3I+DJ+D5blZE+ZqkgYRtfL0yId5Kt3ydeg
         dFar8kyEu5V2FT+Nd+A8yOeN8Vm7j3d8Jxo4z2KUfqjs8wEiz3FwUOrCghD7RIx0fayh
         FT+aGx0SynEKLfGlIEtRkvdFCACa2ifkVbeLKz4bxe/Jxyx71JkA/gUYQyGHvsclTq8k
         srKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rptzrkuEtuLf4sFG2ob54WGWs6tZvRSLjgtfnxfyJWs=;
        b=GsDNDAhpbNQQiJGAUsASj3oEsZJnl3Y3GqLUE9vVTN39IQj/SDjxMtfzJvq8VR8wMy
         dWOxmU3u46Z6YwpUjgqGMsSY3uuSQaP3VHJ1KxG1R51Fv/1H71dmWzTKHeaHwBY/U9z7
         Pea6Nn/bS7re/pxU9Nn7ak8jPMW0On7GmSqG5S9vzwiHrwxkFi2RyZtjm2Ni4zu7mQoG
         ykpi6qFgsgU9CC0Ikpp0sjj0Tfs0hhcM55lo5I313pzQD7w8eck5DILbWbbMKXRPWjiF
         FyaQon3LeepTXrvLVe3D/UesNQ/4Cc7eqIaeZkcoSfplsqU7uFpOUiGO7ZfZNepnQ3x7
         Z8Ag==
X-Gm-Message-State: AOAM533RTTuDIr47575frPqSsoTdah0QtamEbw1NJ5lTfshCanD/8sZA
	gcUsE3FenIx/YS+hm401XeHGokyWjuRZXJLijomOxswzu3g=
X-Google-Smtp-Source: ABdhPJwYt6bXTnhOQJsQ99hi08DcOXaMJ2+NFTcLJjF8rEXQZWGDaqx6oMqeDkpqsUfRrHFV7qttOsNezKbLkHPxsbA=
X-Received: by 2002:a37:9d53:: with SMTP id g80mr22607712qke.17.1595862745216;
 Mon, 27 Jul 2020 08:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200725103447.2109015-1-open.source@oleksandr-kravchuk.com> <20200725103447.2109015-3-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20200725103447.2109015-3-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 27 Jul 2020 08:11:59 -0700
Message-ID: <CAMKF1sq0QB7J3OS=jQdAHSgLgMN1pnxi6a_JHfQOYrLcv5pVhg@mail.gmail.com>
Subject: Re: [oe] [PATCH][meta-oe 3/4] libplist: update to 2.2.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

this fails ifuse build https://errors.yoctoproject.org/Errors/Details/424949/

On Sat, Jul 25, 2020 at 3:35 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../{libplist_2.1.0.bb => libplist_2.2.0.bb}   | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>  rename meta-oe/recipes-extended/libimobiledevice/{libplist_2.1.0.bb => libplist_2.2.0.bb} (70%)
>
> diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb
> similarity index 70%
> rename from meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb
> rename to meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb
> index 36659e752d..408fa8ac0e 100644
> --- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb
> +++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb
> @@ -1,5 +1,5 @@
>  SUMMARY = "A library to handle Apple Property List format whereas it's binary or XML"
> -
> +HOMEPAGE = "https://github.com/libimobiledevice/libplist"
>  LICENSE = "GPLv2 & LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \
>                      file://COPYING.LESSER;md5=6ab17b41640564434dda85c06b7124f7"
> @@ -8,9 +8,8 @@ DEPENDS = "libxml2 glib-2.0 swig python3"
>
>  inherit autotools pkgconfig python3native
>
> -SRCREV = "3df02d4d0e9008771e8622fdc10de8333b3f0d85"
> -SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https \
> -           "
> +SRCREV = "c5a30e9267068436a75b5d00fcbf95cb9c1f4dcd"
> +SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https"
>
>  S = "${WORKDIR}/git"
>
> @@ -20,10 +19,11 @@ do_install_append () {
>      fi
>  }
>
> -PACKAGES =+ "${PN}-utils ${PN}++ ${PN}-python"
> -FILES_${PN} = "${libdir}/libplist${SOLIBS}"
> -FILES_${PN}++ = "${libdir}/libplist++${SOLIBS}"
> +PACKAGES =+ "${PN}-utils \
> +             ${PN}++ \
> +             ${PN}-python"
> +
> +FILES_${PN} = "${libdir}/libplist-2.0${SOLIBS}"
> +FILES_${PN}++ = "${libdir}/libplist++-2.0${SOLIBS}"
>  FILES_${PN}-utils = "${bindir}/*"
>  FILES_${PN}-python = "${libdir}/python*/site-packages/*"
> -
> -
> --
> 2.25.1
>
> 
