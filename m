Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web11.16082.1589557305137703915
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 08:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MuXZehgf;
 spf=pass (domain: gmail.com, ip: 209.85.166.194, mailfrom: alistair23@gmail.com)
Received: by mail-il1-f194.google.com with SMTP id w18so2935358ilm.13
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 08:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AoRGYIFr5+MjolZd7WMlzuisi68uC9FUCAfTVgcTPDo=;
        b=MuXZehgfCnLKas1ypbldFrIsNA9a8zzxDsE6SuyQf+U7eJoFO8+sSpi9k7R5+2ZU7X
         u1BnmsjfZQh2R+Y36064TceG+8r6stH2Q0z6J7bKq2LrqDkGY3YtyAth0VnmLKXShGR7
         CwAdbr2gqV9LFeAnRUX4ifWsjeC4ZhZq8QV/7jxt32dZyqC8FkZQ10Sro8YEk4rIlzPR
         7NVZg1G4UI1rvDv8/fk81yA2ybM6dHjFH1VKvjr+Tvh5dCGxXY3tCH2ymhapOVO3pz5l
         lalTNeGWO9Zvpg1wagKNOgHBQ/wdzivCmiKlz3D598Oz28WPjis6lo5dOc2OWYDK62u/
         sEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AoRGYIFr5+MjolZd7WMlzuisi68uC9FUCAfTVgcTPDo=;
        b=GmpRPQa1z0SrBL3hrX1xSeTrMph5jTsJ6FG8gUScZUwqf+QZKgpHznIVjdfAwVzN1R
         eIpNrHzyWFLZAoIQYN1f6Vd75yiLNlUtS+F4V+tLwEkzP8Ci9yw1voLx9E6Xo5U2kn09
         PxxW0PFe6wFxLYh5ZcfyJqA9TWMizIOiNBtX/Xw0KsPpxNbT0kTegs2lM60LFLNkJZm/
         OnhRtF0KtbgIaSK0eFt67t3pknrat4OlGC5mbj6bDteb0X9LukJ0CseF+9ceiZP5ec5I
         PoL75jIeDfd27Isa6bZ4J/bVrDoF5E7hzjL2ikvNzUNBm9ZP+1GwtN68InB/75m3Baha
         wCxg==
X-Gm-Message-State: AOAM533dhFbSzAcLHhJoX9ap69hyCdsoLlqqikrlSTo3E08YKmkZ8DDt
	MfZthteQcPxkBhZujwfK8Hu7nSeKBzc3T7yOtEVXEiQP
X-Google-Smtp-Source: ABdhPJy+gx8kK0gfHckTkcWqlWtfdzqr72VPko5X2Jb8W1Mf9uOzif9VFmc7Msxsc6p7oq1+ZuO71RCPxgKf0SA3Gag=
X-Received: by 2002:a92:de02:: with SMTP id x2mr4094074ilm.267.1589557304481;
 Fri, 15 May 2020 08:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200515121436.2078760-1-sean@geanix.com>
In-Reply-To: <20200515121436.2078760-1-sean@geanix.com>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Fri, 15 May 2020 08:32:55 -0700
Message-ID: <CAKmqyKNVJ6AgYnO=GCtm+4krQW_0+dS=-DLDQ9HnZh_mnxCrog@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] gpsd: fix build on aarch64
To: Sean Nyekjaer <sean@geanix.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 15, 2020 at 5:14 AM Sean Nyekjaer <sean@geanix.com> wrote:
>
> Explicitly add ${CC} as linker, for it to understand -Wl option.
>
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>
> Alistair please check in your setup :)

Thanks! This fixes the build for me.

Alistair

>
>  meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
> index 0914f7ec2..5463c8231 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
> @@ -35,6 +35,7 @@ EXTRA_OESCONS = " \
>      systemd='${SYSTEMD_OESCONS}' \
>      libdir='${libdir}' \
>      manbuild='false' \
> +    LINK='${CC}' \
>      ${PACKAGECONFIG_CONFARGS} \
>  "
>  # this cannot be used, because then chrpath is not found and only static lib is built
> @@ -44,6 +45,7 @@ do_compile_prepend() {
>      export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
>      export PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\" pkg-config"
>      export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
> +    export LD="${CC}"
>      export LINKFLAGS="${LDFLAGS}"
>  }
>
> @@ -51,6 +53,7 @@ do_install() {
>      export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
>      export PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\" pkg-config"
>      export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
> +    export LD="${CC}"
>      export LINKFLAGS="${LDFLAGS}"
>
>      export DESTDIR="${D}"
> --
> 2.26.2
>
