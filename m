Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.79903.1629428777343047568
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 20:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mSKvcZJD;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id e15so6431739qtx.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Aug 2021 20:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UtTRAnx8btX4jdadHv2evBNl70XAw3W2ATYhT/a1pTw=;
        b=mSKvcZJDwmBiQR6gP5e5GzxMp1X9QhlIwvpmjQbj0EWr7+qf8eGIotisk6WoKHn37x
         x4cQNDtplMRnLwJA0pdamx6nJ+9OUdK35EG57tYNRCQzrCwgmtvq8YRtrC1D4tVgAaOi
         A2U+dSRjTD7S4tRY0vnnjk0RtAUY8COBm2IcjBsc9DDvOyfvA+SfVpI5aL/HpUFyoUji
         72YSRVuwHa6rEtPBQVGOc41MrFsyx6RMIzvXPY0PPM9cS1lJ7cGI1VAASEpcgNQy7BED
         bLCnFeO91h5EbqsGAUUTJmBnndYzD43Lgoj5HlZKtLMMRMMU55xyPi18Ttr+pg0N7fmU
         FkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UtTRAnx8btX4jdadHv2evBNl70XAw3W2ATYhT/a1pTw=;
        b=gEZBYFwb1RSnhQ7Lp+4diGz8qeE94vwfMPUdnbsMmB9uCGH+/+2lRl7c3un7jElP4M
         Y3NIN9Q3LEoImLsrhocQmlhaVmpb1gaLaZZyJwW/cBM9rY7MDicMQTCcGEw0cKt+t4u6
         07O3jiKXfw4R2igNFVFSSPF5G3bve5drAvhjk6UElh9mFiszO++lvy55I2WFVFO5+l0T
         5Yb43q+6Iw4o9gahM9xagUneoPfISS85QEyqFTQfX7lxSAO1A54b6VH8Lc2stfzqO1by
         VBlGL4T/eZNhxB+/o/sZTCtITbe98c/sSgXr2tEn7UNNj4peZ6bLEn9XfJ8fvmAIhs9E
         fTvg==
X-Gm-Message-State: AOAM533MMYzOotJtA1A9/lcfGj4Ev4MTklwFbiK+qY2K+Vh4+DyMLnm1
	t4vIGuWr6BEG1Ju4g3Nu6Wjv5EvUCavMdh87PLg=
X-Google-Smtp-Source: ABdhPJyeMTrTPbrYA+fqeyOzv9F3dmf4ah9nZe1bUtlzd7ScTsOAr0T08kWj4VWXIAgNhyvKRqmu3m8hJk6QfDGSgEM=
X-Received: by 2002:ac8:b82:: with SMTP id h2mr16038423qti.214.1629428776481;
 Thu, 19 Aug 2021 20:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <1629424945-45595-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1629424945-45595-1-git-send-email-wangmy@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 19 Aug 2021 20:05:50 -0700
Message-ID: <CAMKF1sq_tZW6_7xnSq8CfZDn-UEQqYr=rSza0m9Tem2AfCLCjQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] c-ares: upgrade 1.17.1 -> 1.17.2
To: wangmy <wangmy@fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 19, 2021 at 7:02 PM wangmy <wangmy@fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../c-ares/{c-ares_1.17.1.bb => c-ares_1.17.2.bb} | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>  rename meta-oe/recipes-support/c-ares/{c-ares_1.17.1.bb => c-ares_1.17.2.bb} (63%)
>
> diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
> similarity index 63%
> rename from meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb
> rename to meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
> index f9575a3fce..857fe3ed09 100644
> --- a/meta-oe/recipes-support/c-ares/c-ares_1.17.1.bb
> +++ b/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
> @@ -5,14 +5,13 @@ SECTION = "libs"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
>
> -PV = "1.17.1"
> -
> -SRC_URI = "\
> -    git://github.com/c-ares/c-ares.git \
> -    file://cmake-install-libcares.pc.patch \
> -    file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch \
> -"
> -SRCREV = "39c73b503d9ef70a58ad1f4a4643f15b01407c66"
> +PV = "1.17.2"

The PV is encoded in recipe name too so this is redundant, Please remove it.

> +
> +SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main \
> +           file://cmake-install-libcares.pc.patch \
> +           file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch \
> +           "
> +SRCREV = "6654436a307a5a686b008c1d4c93b0085da6e6d8"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
>
> --
> 2.25.1
>
>
> 
>
