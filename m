Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web09.2811.1631994863576100628
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 12:54:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZdMryP2w;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id p4so28692712qki.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 12:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v3I+v13kwAf9jmG0758joTnrFzwo+6G3fX+qEHQ3pWs=;
        b=ZdMryP2wLnfXh2uOq5syXLuE6WDL02tYWKeoTH4KOH9xmZz5Q3F/ODo2eiz6eAEiUU
         vUhTP9ePqzizC0DMcc8YWBXgovQuyoG+geUy80ghAYgUOdGG2JQTClYs1PFXXVQYaQtH
         wuxzgO7BGx/Kd4tUtwCeQIqm0SHPeap+o2p3HwlR9Ra5X5uQhSDDAz4lYrTBBOIU9cud
         bzdrn2g8b8nvBJP0DGT5P9v71gBS9UGNm1m3XdTzC23J5oTsMWq4Yjun3C8SuBQdx0oL
         xiVp5Jg2R+9EIsPKBOtGxYQVbtIW1sWAU+unx0hBflRe4qUdrQtbHwK9IYMD9Ulk6YL8
         CKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v3I+v13kwAf9jmG0758joTnrFzwo+6G3fX+qEHQ3pWs=;
        b=yx29Al9v1ZHqcB+lUzIdCEjuUzA/f34HgeMLJQgsZVyVhsx6a/ZVITLsyyTHNfe15L
         ABex1Zp+YZjMt5Cn4bhMazlQYhoyNAkBcfcNz/7jsxr9cMcapu5pVg+snmEKhIky+6o1
         rBX8wGtffEkZV3+B8K+u5XKotOxq4lsL/0MeZfRQp25X2GyV6YxAEJiMHfHRq/oPi+eR
         vja4d8pRMUXfSktdeOhmBy9klR3FvmXI6oS+8KDzpxYBAJJGQ7so/A561RU4egvUdiQN
         SRlghWBnyBy1i/KBz+iRVr0Cij3ZbZyKHkrzRltHWnYCtfef02MJxsYggVBsT79ZX5+g
         VL4g==
X-Gm-Message-State: AOAM5308vHCphjX3fZlsXDujwBwGs6ueA0jBQHY3nkiUmtBu9oDkOdGX
	PPSXDu7on39G8GidGQ6IqECOIJH6ghyQQr9xRvY=
X-Google-Smtp-Source: ABdhPJw5GXYmcuLsSuw1Ke4sI/z1awDZ48sSyrqXaBUvf86PmO/X6WAE3rGX4is29147y47Gsx26CM2wkmplRKyKjz4=
X-Received: by 2002:a37:48f:: with SMTP id 137mr16892qke.105.1631994862359;
 Sat, 18 Sep 2021 12:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210918165738.2581429-1-akuster808@gmail.com> <20210918165738.2581429-12-akuster808@gmail.com>
In-Reply-To: <20210918165738.2581429-12-akuster808@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 18 Sep 2021 12:53:56 -0700
Message-ID: <CAMKF1srmqAz0im-MQTnudb+bmg3yghwyiVJEj=D0a0dn+5bQaw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 12/18] python3-geojson: set precise BSD license
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 18, 2021 at 9:57 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> "BSD" is ambiguous, use the precise licenses BSD-3-Clause
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb b/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb
> index 1a21230113..5c60673af4 100644
> --- a/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb
> @@ -1,6 +1,6 @@
>  SUMMARY = "Python bindings and utilities for GeoJSON"
>  HOMEPAGE = "https://pypi.org/project/geojson/"
> -LICENSE = "BSD"
> +LICENSE = "BSD-3-clause"

it should be 'Clause' this comes with warning on AB see
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1551

>  LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=f48972abe5cddee79e301574742ed745"
>
>  SRC_URI[md5sum] = "14753ed28678828b1de73f68b04e2324"
> --
> 2.25.1
>
>
> 
>
