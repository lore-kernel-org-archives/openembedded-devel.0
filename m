Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.1576.1600356200427283387
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2020 08:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PSCIbegK;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id 16so2613141qkf.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2020 08:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ArnBrjC2n7ViHSd2vx/inA3miFS5O0v45pursa9Joh0=;
        b=PSCIbegKzaAd8x+DJ0aiYwZD7IdtLB3XL11H8AnyTkuAwFQBEzsTvq4zZHhRNTeuew
         NR0nSIVH5UdlBmbiXaR6Sp43gRLsQ2Dnj0ItbRzwyJawh3Dc+S11+fhNCPEaOvfY2sPL
         coZots8xjvAMLCnpZvWlkJrTHTKZxEPV+afSDX005f3+60BAdhKyIwMYC/ntu8f3qFXa
         LnvEz5V9sPxUOqCNW6zvHrzkLCn3X5lsA2PUEUOz7PKkNMfliQGmA7k76hh2WV2zxwsh
         R8bzCEMf0c6XUvL30LQmtWwG91tRPd7/9Si7Z6QC1WNZkjFrezR1jjKqb/7mB9i8cuFD
         X/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ArnBrjC2n7ViHSd2vx/inA3miFS5O0v45pursa9Joh0=;
        b=Jxt32RtJ46cNplWONib9Hmd5TbXyh4zAD80YrDi7d3+KaaRSv5v7rQulVAT//mn37S
         7RLv82jLDsF5uT0sva89C6ZWyloyhuyjEposORF3dHMb6/CIRjeOJvGUd1Vq9U0e1MV/
         gmJpYzHFZeEbuNv6MLW6wgWPAlPMzLxBF3VuzT2sdIzY/ZJa3+0fbhVMs0TRLn++0UME
         f06wBPjq4vXia5omIFO12Djd7J3AdXveFIp7Dv96fHOJB/BZZszYW2ccE0bybGVFqa/j
         ryoKlFGGg8ec96hlKDO9KPQOQHW+IeRWYtLqEbBf+fsmmWlE+J8oOsOFL/MYPj2jJHWW
         TMtw==
X-Gm-Message-State: AOAM533hF0kRti4Ey76JEMF5TuAhINF8mHt7Ot5O10/u0Xi0P16gUSfj
	bvjX2gllmKAeNhBwkJrUtXqQbJaroztQ/C18soA=
X-Google-Smtp-Source: ABdhPJyfDbKntr0MWZqzdsgo2eAVsJpAUHe08/xkb3zEUvW0sDxH9WIzoDYZv6Nf1rDJujQeRtirf/gIn3FVtYf8NeA=
X-Received: by 2002:a37:9046:: with SMTP id s67mr28665613qkd.212.1600356199532;
 Thu, 17 Sep 2020 08:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200917144404.805-1-brgl@bgdev.pl>
In-Reply-To: <20200917144404.805-1-brgl@bgdev.pl>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 17 Sep 2020 08:22:53 -0700
Message-ID: <CAMKF1sr_D-WUU6vhxxG65oHvjc8b6Eh8n=eportP+p-iKaQs1w@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libgpiod: drop support for 0.3.3
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Armin Kuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

is 1.4.4 backward compatible?

On Thu, Sep 17, 2020 at 7:44 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> I no longer support the v0.x.y series. Remove the recipe for v0.3.3.
> While at it: the tests PACKAGECONFIG is duplicated so remove one
> instance.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb | 8 --------
>  meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb | 2 --
>  2 files changed, 10 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
> deleted file mode 100644
> index c4d2bddf4..000000000
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require libgpiod.inc
> -
> -PACKAGECONFIG ?= ""
> -
> -PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
> -
> -SRC_URI[md5sum] = "2aa1e1a80c3c919ae142ab9a55fb59ca"
> -SRC_URI[sha256sum] = "b773e557af1a497f786825462a776b7bf90168e67ee0a5bc5d2473a5674dc38c"
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
> index a9a462866..b5a64a554 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
> @@ -9,8 +9,6 @@ SRC_URI[sha256sum] = "f1cda2789e6a13a92aefc012a76e5a7cc57a1b402d66f71df8719ee314
>  PACKAGECONFIG ?= "cxx"
>
>  PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
> -PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
> -
>  PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3"
>
>  inherit python3native
> --
> 2.26.1
>
