Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web08.31744.1611166260683122431
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 10:11:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FN9oO9MF;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id 19so26210855qkm.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Jan 2021 10:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fyGLZqXJVEbVv13irNtZKZSGafb8CM1vAelvP4lkcDk=;
        b=FN9oO9MFQkyqhD4V47pI/pf63IKv5/rireVm/lLiDB2YHwT8mTjSk8FJ/SRvTnwuHF
         aqz8/yM63Y4sxuWpax82fm/AMEY2qQuG+kRWN6k8qAlxrOuhmQiyqlAkbBWbXEo4mnuc
         yrW4/BBbWC4qkPERg9if9YR5ulwooU9Yd47WN3Ce789d704ekihfTI+/lBdP0ck5V5Tc
         oA2hmoLvMINku4EDHK0YICYvGk90l6OCJMYYRlhdsazlLM36cIvfyglYwxY8F6if5f/h
         1NM9OUH3RAyvrWH8/kbhIeKfSpWROwpgfpi95E6bYCUvw/Fn+4kHznJD+IjJtlzXSfIj
         iB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fyGLZqXJVEbVv13irNtZKZSGafb8CM1vAelvP4lkcDk=;
        b=n8oDe8Z3bodPSXk4rsaYSTmrrrrYOg+YqKFiUtnqzhsmTa0CuNSgKVSMYIphaBIVAh
         eKd2dlQXmilkQKkl5Itb6ZI2ehqYWv1z0iCEHUoyZaHbihbbpHoxNY9fVKu3mQW/Zi/v
         6N5NIhXlP9DTnh2JMlC8GjEKOPpOX/maArRiZbZwZRjz5tHQuuWOSRuO6Gd6IZKYIHrW
         x3SEj4qlqv9zyDYPNJZGPTwaJWzu7Srw24uSBTA0m1l6irtWojSwgLrve4ZmdnLD0DDp
         8Vl2/J2ESu7F51vBHfzSP0WVKFrPNAqmFSrf9wZRQuAUPNtkF8BM2Dcyooe8E3L3Zt1K
         i6Xw==
X-Gm-Message-State: AOAM533EIZ//IIxSVaUMT2bqSCNzs+YHfKohn+b+lEaWiAhWhF8SFVRW
	XZyK4Lr3dQsyOUv2zNjY/0swJBi8wzVbwOiywuA=
X-Google-Smtp-Source: ABdhPJwqAe1Loc82ICQ2wYOR+aUOGlli1H9tepOe/S9XXiTIOA1NLglVISGM6ikzcNfANd+uALXx5FbOJOajkUbj9DU=
X-Received: by 2002:a37:4286:: with SMTP id p128mr2217154qka.337.1611166259689;
 Wed, 20 Jan 2021 10:10:59 -0800 (PST)
MIME-Version: 1.0
References: <20210120165300.8588-1-leon.anavi@konsulko.com> <20210120165300.8588-2-leon.anavi@konsulko.com>
In-Reply-To: <20210120165300.8588-2-leon.anavi@konsulko.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 20 Jan 2021 10:10:33 -0800
Message-ID: <CAMKF1sp2qB-QE4aNWFhRfjKNcM1f=b8JZA6y6L0wBP+qmopFmA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-alembic: Upgrade 1.4.3 -> 1.5.1
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 20, 2021 at 8:53 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>
> Upgrade to release 1.5.1:
>
> - Fixed installation issue where the "templates" directory was not
>   being installed, preventing commands like "list_templates" and
>   "init" from working.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../{python3-alembic_1.4.3.bb => python3-alembic_1.5.1.bb}   | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-alembic_1.4.3.bb => python3-alembic_1.5.1.bb} (54%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.4.3.bb b/meta-python/recipes-devtools/python/python3-alembic_1.5.1.bb
> similarity index 54%
> rename from meta-python/recipes-devtools/python/python3-alembic_1.4.3.bb
> rename to meta-python/recipes-devtools/python/python3-alembic_1.5.1.bb
> index 0e7f629d4..f07be042f 100644
> --- a/meta-python/recipes-devtools/python/python3-alembic_1.4.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-alembic_1.5.1.bb
> @@ -1,11 +1,10 @@
>  DESCRIPTION = "A database migration tool for SQLAlchemy"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=bd64aba1b968c2bfbc2b525a181ce85c"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb"
>

you forgot to describe this change

>  inherit pypi setuptools3
>
> -SRC_URI[md5sum] = "6051576d8e25e3d4a9fd818d79531bad"
> -SRC_URI[sha256sum] = "5334f32314fb2a56d86b4c4dd1ae34b08c03cae4cb888bc699942104d66bc245"
> +SRC_URI[sha256sum] = "52d1d48109f17959982779e3c4b5cdeca701e449897bacb75bab173bd6ba984e"
>
>  PYPI_PACKAGE = "alembic"
>
> --
> 2.17.1
>
>
> 
>
