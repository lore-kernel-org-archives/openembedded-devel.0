Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.15873.1599144776297307631
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2020 07:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ruQpSiyW;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id n10so2109006qtv.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2020 07:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9veu8XCQHybfFxYsT6OLXGkZ8xoXERro+3c980ia7Zs=;
        b=ruQpSiyWGSjAsrqgUhj7PKhflzFSnf8Njpa7Ca93XiW12wFIS5mdlo2LSL4fCnrLQ4
         A5nwzWmEYoPozkKg2+g65m3216UQDxAw1xJ7kURHYyy/VPKQj600ztFCYrjs9GfUU4fW
         Kd0gbZ5YQ4vs9kxyc/epw0UrirHv5/8OUkgAMFjerT8oxRut2xGTrfA4LPvJCbRm1E3m
         E2x+rIq8g9z0lIRBgvMCV5bJNl+6Bog8QSj3JwgDTTvtsOOhCpAOCGM5EJrCCrT1m2k/
         lcsqSmI52b9qKpzGj6HYvBKXYPGNz0oYmYxVcWCB64YEEM6TjcO3lJykci+yBIbA2eqm
         X4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9veu8XCQHybfFxYsT6OLXGkZ8xoXERro+3c980ia7Zs=;
        b=GtP+lDO381IQFbVtBs7Mo0BwWNngwVZM/o1A6xM5umJbs8S9Rtu5+VxmbjnZjKbD6T
         fMYdyXItoQFgQ/t5aQE9r5u1CaWC/dm5SuLEqpJyc0BM3syg5MITk6CpBHxjQbr9nTXk
         7exYs5IpFkOfqQMBygztIXF8xr9Fx4d7KqLVkK2gOJzREmkK/352hscLF7n+ZgErN2fC
         BlH9oyd+cDRjbCvdofFklIwCmIml7x+Q7f2Im41OjmAJHwTIf5Z3IId5tRnb4J+0vPvp
         M9sFenMvNXLeZmilsawA8HIdJRLRyRhygtPok8cF5Ip86cjJDG+2jxJ5DCcBjk7LKaeS
         2mgw==
X-Gm-Message-State: AOAM530phoQlFMey91YVr5+EEUFDIJCRL/9oMXMbNX60crXLQcU8yVG8
	CKhRblA9a+KTIKyItoq71EqP/sMN7g7E+lZsQbk=
X-Google-Smtp-Source: ABdhPJyn8ZQ6kaEAjDinrJYW5XkZ9eg71XNI/c1V3tONc7HJwNUbsHta16LDdP81EnWnu79t6fP//1Gb/k+P9kQzyn0=
X-Received: by 2002:ac8:2495:: with SMTP id s21mr3814804qts.194.1599144775195;
 Thu, 03 Sep 2020 07:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200902080332.6083-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20200902080332.6083-1-costamagnagianfranco@yahoo.it>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 3 Sep 2020 07:52:29 -0700
Message-ID: <CAMKF1sr=Aq0qt4h=YaNxmimHFRZGQTEx9PMyMx8vHLww2oOVqQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] brotli: update to 1.0.9
To: Gianfranco <costamagna.gianfranco@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: text/plain; charset="UTF-8"

I am seeing cpprest failure and it seems to be related to this

https://errors.yoctoproject.org/Errors/Details/498414/

Fails with

arm-yoe-linux-gnueabi-g++: error: unrecognized command-line option '-R'
arm-yoe-linux-gnueabi-g++: error: unrecognized command-line option '-R'

somewhere in log I see.

-R/usr/lib  -lbrotlidec  -R/usr/lib  -lbrotlienc

On Wed, Sep 2, 2020 at 1:03 AM Gianfranco
<costamagna.gianfranco@gmail.com> wrote:
>
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ---
>  .../brotli/{brotli_1.0.7.bb => brotli_1.0.9.bb}               | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-extended/brotli/{brotli_1.0.7.bb => brotli_1.0.9.bb} (91%)
>
> diff --git a/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb b/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
> similarity index 91%
> rename from meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
> rename to meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
> index 32f855844..642e18f4a 100644
> --- a/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
> +++ b/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
> @@ -7,8 +7,8 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
>
>  SRC_URI = "git://github.com/google/brotli.git"
> -# tag 1.0.7
> -SRCREV= "d6d98957ca8ccb1ef45922e978bb10efca0ea541"
> +# tag 1.0.9
> +SRCREV= "e61745a6b7add50d380cfd7d3883dd6c62fc2c71"
>  S = "${WORKDIR}/git"
>
>  inherit cmake lib_package
> --
> 2.17.1
>
> 
