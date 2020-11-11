Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web12.8507.1605109915160373555
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2020 07:51:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t0fEmJuE;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id g15so1550452qtq.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2020 07:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rCS4iJ8BlQiTGkk3dDokqnlXd5ALUbmHq75/X6M6fFU=;
        b=t0fEmJuEFDwCSYl/jPWrkLhd0VgjUId60svGS7DpWabAnA3tV/0sx6HTDIojrf38bC
         UewPcymCOayijHeM2sJjzvqa56rAPCNeekZtHlosjOL8SKNyT08CH1FNzhFTsGlfgC4v
         EBVSnujpDuOigTba+aEtrCCz8W8rHMUnzgb54814JMRKIHq+6eIcBe3hlOyeC5w+uDOh
         UmywOmx5CktwlEPxWCt32fE5wJevGkLCz0YYK54sCNx6nDGetgcdAaz/bZ2WsFXwqON/
         Vkg0+njeWHfXTgnRP/KkM/PdjUkfpa1FkpHQFQ13cenpqXaPGtPyuL3TFAxZcMyGTp8j
         iKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rCS4iJ8BlQiTGkk3dDokqnlXd5ALUbmHq75/X6M6fFU=;
        b=CIQZzynh40au7lh4/fMwsNdQsd5TJvV9IP7VySfD1pIz6Pr/DtdyPqCQ7bVLzCZoMt
         9a38tdav9zwBMySzMxjbw+a3O20V48vnWFMUkdlFbtFy7AnZn/ls3oWFxts++VJMjJKd
         EVSYAEIbIdfILvrCcGsgfYHKl1ybXax1kkLSFiSJr8bb1BySx56CiYp08zT5XAKSV9xq
         k3P+96Ee6F0FYJkVVhRj6qeenNiAVo7Zk4FPNaaCnPp5qj/meWrZCiJ/jloXMEVo+5nl
         ffiTBm6hsbE35hPGNkcN3EpMsJ2zFW6QFvKApnDHTHJEihR9xB0qYAvjWQ8f/nL+joAW
         +nfA==
X-Gm-Message-State: AOAM533zNa/e2VWsW/queaYk9tn3V3qV8lC9YdvAbWwvKZX6U8Hh9e/h
	+O/rG7B409ZQuEXu/er/jtgrXk49YRk5+RYIAQA=
X-Google-Smtp-Source: ABdhPJx8nobKye27GKKT+pPGDs6+fJSur/BgaHKuLAwqIwb5W5NlOWj9pSTkJWIUvdQdP0HfWCo4je+dzM+3GhZxwlc=
X-Received: by 2002:ac8:3417:: with SMTP id u23mr23030358qtb.80.1605109914114;
 Wed, 11 Nov 2020 07:51:54 -0800 (PST)
MIME-Version: 1.0
References: <20201110193033.2750137-1-raj.khem@gmail.com> <0cf0cc3c-6550-db48-63d7-8e24d17dc99c@windriver.com>
In-Reply-To: <0cf0cc3c-6550-db48-63d7-8e24d17dc99c@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 11 Nov 2020 07:51:28 -0800
Message-ID: <CAMKF1sryqVUX+e8hwBNe5=mrQRpzW_W6y8A_aVrhEWSOnGvDQA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] meta-python: Drop RDEPEND'ing on python3-typing
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

thanks done now.

On Wed, Nov 11, 2020 at 4:58 AM Trevor Gamblin
<trevor.gamblin@windriver.com> wrote:
>
>
> On 11/10/20 2:30 PM, Khem Raj wrote:
>
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Its part of core python package now
>
> There are at least three more recipes that still have it in their dependencies:
>
> meta-python/recipes-devtools/python/python-m2crypto.inc
>
> meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
>
> meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
>
> Can you re-submit with those fixed as well?
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb    | 1 -
>  .../recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb   | 1 -
>  meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb      | 1 -
>  .../recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb      | 1 -
>  meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb | 2 --
>  5 files changed, 6 deletions(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb b/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
> index a26835b607..9f152a1d60 100644
> --- a/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
> @@ -9,7 +9,6 @@ SRC_URI[sha256sum] = "61f9ae9322e38ae64996848421afbdb018239a99c4e796fe064f172d6c
>
>  DEPENDS += "python3-setuptools-scm-native"
>  RDEPENDS_${PN} += "\
> -  python3-typing \
>    python3-dynamic-dispatch \
>    python3-typeguard \
>  "
> diff --git a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
> index 2bf487584a..0ed5df1b2e 100644
> --- a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
> @@ -12,7 +12,6 @@ PYPI_PACKAGE = "dynamic_dispatch"
>
>  DEPENDS += "python3-setuptools-scm-native"
>  RDEPENDS_${PN} += "\
> -  python3-typing \
>    python3-typeguard \
>  "
>
> diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
> index 2bf9d07533..70527e026c 100644
> --- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
> @@ -15,7 +15,6 @@ RDEPENDS_${PN} += "\
>      python3-json \
>      python3-logging \
>      python3-netclient \
> -    python3-typing \
>  "
>
>  BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
> index 98db23039b..75a0926f08 100644
> --- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
> @@ -17,7 +17,6 @@ RDEPENDS_${PN} += "\
>      python3-logging \
>      python3-netclient \
>      python3-pkgutil \
> -    python3-typing \
>  "
>
>  BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
> index bd92216776..cb5c372352 100644
> --- a/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
> @@ -28,6 +28,4 @@ DEPENDS += "\
>      python3-setuptools-scm-native \
>  "
>
> -RDEPENDS_${PN} += "python3-typing"
> -
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.29.2
>
>
> 
>
