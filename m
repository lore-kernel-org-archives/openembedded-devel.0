Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.213.1613066280378536470
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Feb 2021 09:58:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uiAJWYj+;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id w20so4821210qta.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Feb 2021 09:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0rt8h4Ks0NWAY++7SwU0L4V6RXzG+xZwicCiMhbo5TI=;
        b=uiAJWYj+F8/UAuAw7Kavntu8q7O+aDbIvNjpOjRmT+pI5HLfwcI41AOjECp75TtOti
         q+P+yBReanwT4DxPqXL9vaefIR0BErkguMwOfKzfHZuFnVrVwaAxwhs8p0YAB2sfBHRN
         94W7i8GUeYQFaO4OcR/7Dq8+UxulmIoIP4TjKsff2TB4251Sw9ldE9t+AyCwLR0dmMzh
         SyHKAlcN/vPnLcUERxQbsDRgcOqbXUzUyfhENsTZrhkICc85eKxwEHW3ju/Pik5ZYGRQ
         0iq/qZpl6IGu74dmoCiMXEfW0agoMkxa0cTC2qGIGlaOSHLNX9dqty8ZjP+ZGEBJ7Ckf
         Z0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0rt8h4Ks0NWAY++7SwU0L4V6RXzG+xZwicCiMhbo5TI=;
        b=E7j4Ql/Y8J8YtT6n3yuFFwFyvSYxlzZhsO3LL6gjdEuKrrfqcy8NJ/V2yoZmwqFp8P
         KjlFNEHXCyykQ5tpmpW2oxtPNf77e3g56xc9/VQ5CDVJ6xkdWr+G4V8RGiF4GumTSZbY
         eMAsM7VbH3m8lVkn6Zpha3bkZhOkrcitnKQwGLu7PIg/n1a2cC3H4utUbc9NTjpXn56g
         edthWFiw/y13e205AQU+2jeSpJOL6EBchvahtC52Sy4XrRxg5+BOq7P+53MaZ5/8x+1d
         VkenUwJ++3jOAdhJFg72/MwCvowiPcKdY3L00HQDf/TKwTcI/Hzd2qkP1jA5IN4yqVVE
         QZ7Q==
X-Gm-Message-State: AOAM5314r8lJNAOImODQQCmWZWwjzKiPHdY+IuR6j5BGi5xG5uTJQo00
	F/NJ59lqJlzawohUk0uGvOomUxqmRZVlgK2Nb4W4PZCYVOiIOA==
X-Google-Smtp-Source: ABdhPJwx7zq+FXSTFUxzvWVOvZLPogZmioTZGVhasqK8QXO0jzOzLViRM/+BTI4ZqrNz3PFRX9E0Mwf3AFFlnudUweI=
X-Received: by 2002:ac8:4b49:: with SMTP id e9mr8533562qts.80.1613066279461;
 Thu, 11 Feb 2021 09:57:59 -0800 (PST)
MIME-Version: 1.0
References: <20210211000457.1922320-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20210211000457.1922320-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 11 Feb 2021 09:57:33 -0800
Message-ID: <CAMKF1srM16PXSqQV4eCeat0WyH3a6-s9i6FY7NTyGAFOpsXu8Q@mail.gmail.com>
Subject: Re: [oe] [meta-python[PATCH] python3-idna: update to 3.1
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

NOTE: Runtime target '${PYTHON_PN}-codecs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['${PYTHON_PN}-codecs']
NOTE: Runtime target 'python3-idna' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-idna',
'${PYTHON_PN}-codecs']

On Wed, Feb 10, 2021 at 4:05 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> License-Update: copyright years.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  meta-python/recipes-devtools/python/python3-idna_2.10.bb     | 2 --
>  .../python/{python-idna.inc => python3-idna_3.1.bb}          | 5 ++---
>  2 files changed, 2 insertions(+), 5 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-idna_2.10.bb
>  rename meta-python/recipes-devtools/python/{python-idna.inc => python3-idna_3.1.bb} (60%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-idna_2.10.bb b/meta-python/recipes-devtools/python/python3-idna_2.10.bb
> deleted file mode 100644
> index a08ca714a..000000000
> --- a/meta-python/recipes-devtools/python/python3-idna_2.10.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit pypi setuptools3
> -require python-idna.inc
> diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python3-idna_3.1.bb
> similarity index 60%
> rename from meta-python/recipes-devtools/python/python-idna.inc
> rename to meta-python/recipes-devtools/python/python3-idna_3.1.bb
> index 4968f1072..0b64bb2ee 100644
> --- a/meta-python/recipes-devtools/python/python-idna.inc
> +++ b/meta-python/recipes-devtools/python/python3-idna_3.1.bb
> @@ -1,10 +1,9 @@
>  SUMMARY = "Internationalised Domain Names in Applications"
>  HOMEPAGE = "https://github.com/kjd/idna"
>  LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
> -LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=cf36c8682cc154d2d4aa57bd6246b9a1"
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1"
>
> -SRC_URI[md5sum] = "7a910c706db30d758f377db2762c0f9a"
> -SRC_URI[sha256sum] = "b307872f855b18632ce0c21c5e45be78c0ea7ae4c15c828c20788b26921eb3f6"
> +SRC_URI[sha256sum] = "c5b02147e01ea9920e6b0a3f1f7bb833612d507592c837a6c49552768f4054e1"
>
>  RDEPENDS_${PN}_class-target = "\
>      ${PYTHON_PN}-codecs \
> --
> 2.25.1
>
>
> 
>
