Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.12796.1596175779364454028
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2020 23:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gc02L9q8;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id l64so21061530qkb.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2020 23:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MhMim0Jt7HnTtOY4yuz8I2oK16X+q47YHDLUVh3vebc=;
        b=Gc02L9q8TogrTX/+RBBfzKdk8oX8YF4yhG2bAaR4UIKkQXbxL2LFP15NLY+q3ttmC1
         P9SC9jNTyS3Pujt5dfUiHmv0GEMk3Vw1kVJj/uyZ7mi8U+EDaJN2zBBA2fGVp8/opuvZ
         yOBfL7Va+PHteg0K9Z3NPNtiWzh7g0mmS3KtON9bL8vJ7Zv0CUilj94LvP4IPrcob2dM
         QRUwvM7dmBMLjO1z2mh7hzGBELhHrJVWr0FcLknc0PsFgZg6wAfy/aoDpCseYoj2j+PE
         idQ5O2g4TFoDnoObRvZQjSORDGzGi1pR/wJm8fr1t55CYxlM1KdcOoQe1pW6A0JxX/IZ
         0gfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MhMim0Jt7HnTtOY4yuz8I2oK16X+q47YHDLUVh3vebc=;
        b=ZUY1kGKqb90YIqcbAsbcsg/iAnJJH0TqXmiYQC04qqQ09QLmC4Z3szRPLrMdKhOA27
         r+pqNl20U8Upyq7v6FXldiTRYd7yXmbQ18FKNa6By3kI+tlYFmEFFxOZ/1G+Oq2NB8b/
         P/DfgVJxRxphix1+iw9vlCkDlLGsUtVF/7E1Guj9453ivmKefkaAfWHzS6tVGidH3Vra
         bTeYXbykLFuaKNxNnhDd0ygW68o65q3T01WUbSdxg1XArgJ5yIb1b8Ziiqlr6asvjvUn
         ww75gznwH9edmY46R1rgfgaZPMtEj/bx13boPnZkpaC2iYPBYOlg+lUFTJOcMJraFIKg
         6urw==
X-Gm-Message-State: AOAM532S1woL8rwodqCLkvnm6cdVeptbaMDbbRSXnTamU+na6yRD3S3q
	F64HN2MwnXGTgusZ9+V9rnBWl/00n1+ZqI9Bcrg=
X-Google-Smtp-Source: ABdhPJy75nxapExlpcK/UJTGzvaZdFWC4HLqGFpKjoH3zELfwD82/aYGbyIVwgovaiYNyFaTOd02h4zLtQsLrGbGbYM=
X-Received: by 2002:a37:9d53:: with SMTP id g80mr2466568qke.17.1596175778434;
 Thu, 30 Jul 2020 23:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200729124155.3367618-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20200729124155.3367618-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 30 Jul 2020 23:09:12 -0700
Message-ID: <CAMKF1so8iHhEByJJU0BK-oD7SFOuSPeh6tKqRFVjBUhpm3JoPw@mail.gmail.com>
Subject: Re: [oe] [PATCH][meta-networking] mbedtls: update to 0.23.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Fails on musl

https://errors.yoctoproject.org/Errors/Details/426318/

On Wed, Jul 29, 2020 at 5:42 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> License checksum due to dropped due to CLA requirement being removed
> from the license (see c76a54554ca8bffedf@).
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../mbedtls/{mbedtls_2.16.6.bb => mbedtls_2.23.0.bb}     | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>  rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.16.6.bb => mbedtls_2.23.0.bb} (84%)
>
> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.23.0.bb
> similarity index 84%
> rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb
> rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.23.0.bb
> index 12ad39761..3e4553291 100644
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.6.bb
> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.23.0.bb
> @@ -18,13 +18,14 @@ understand what the code does. It features:                          \
>  HOMEPAGE = "https://tls.mbed.org/"
>
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=302d50a6369f5f22efdb674db908167a"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
>  SECTION = "libs"
>
> -SRC_URI = "https://tls.mbed.org/download/mbedtls-${PV}-apache.tgz"
> -SRC_URI[md5sum] = "1f629a43c166de2eca808f3e30aa961d"
> -SRC_URI[sha256sum] = "66455e23a6190a30142cdc1113f7418158839331a9d8e6b0778631d077281770"
> +SRC_URI = "https://github.com/ARMmbed/mbedtls/archive/mbedtls-${PV}.tar.gz"
> +SRC_URI[sha256sum] = "5c8998217402aa1fc734f4afaeac38fad2421470fac4b3abc112bd46391054fe"
> +
> +S = "${WORKDIR}/mbedtls-mbedtls-${PV}"
>
>  inherit cmake
>
> --
> 2.25.1
>
> 
