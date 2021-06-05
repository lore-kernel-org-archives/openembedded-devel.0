Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.17293.1622931437577726507
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Jun 2021 15:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ryxCTWuq;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id c138so219286qkg.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Jun 2021 15:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5PUFC92J79s2TRexYvfwK59DPAgn3PKe5Pr8qpgSvmA=;
        b=ryxCTWuq1ao55FrA4y7qX+1tvk7NictZNOOYza+es1pHxL+6ytnmCrMPZa3kS0InI1
         FmbQ2aUaehAnXjkxOMzKCFHoqjOejkxyGbD6L5IR0sGnQVlkux1nA1Fqnejto40c0LPY
         R7FRE4hDdrH3w+NnhwaF/Yq2gMf+rS50lF8acLC6ZELFbkx4L8EWeOXJj+6Z6onYdyzr
         t8yc8DOY2ynVccArJKtgcp/coM7X94JjE2S5Xpg1LHg1rP2/Nm/FODzZY5wyqQJeYid6
         6PNg2l5oRlIqIselLhHCdd137BBE9LD9tfLbwUsS7bZh7YR6cUJi3DPhz2aZOzLkn4kx
         ZsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5PUFC92J79s2TRexYvfwK59DPAgn3PKe5Pr8qpgSvmA=;
        b=Z1mWy3x1cnoTKdyKe8Dy8sN7p94TxWyASA5L2qK9pchoKq9ojBHy0uqPZlGLfBeCIG
         x2eZb0c6Pu8wpKx5hyCxgYo19sHEqtfcdM09f01MtTI/2Hu8tbyxSXbYNa5gT3WsJlMi
         kcJLq9woWf8pNFJbfZ2zV951iPLGpdoh3gLOtpDqEUTg3TRydPPJPCkk8w4aywdDD2pe
         IkrDgO5BlG8Z+ISjPQ8AVrow9GxJcM8aqhDc8d+++mOlACcDHP374I+FCnXn/0yfDI96
         tXvuXZ+Bzqn42puykgMBsPq4hGyE8nOEroS/tiMMnb6UaY7PzdOtSm+j0GnBHXc3HA44
         LYkg==
X-Gm-Message-State: AOAM5301I6pdwBwQxRmkZBJgeFFLdkIDFtukCbYLzyxboqeN9qaWTdJ5
	DQ1MaPRYvtZ6rr2CHjlWTeR+T6CNuA6pmCUb6J4=
X-Google-Smtp-Source: ABdhPJywXW4W+yNM1GNlHhOIDOtLsntjNwoC5GpL8g4Bv7WyFy/MzFy1e4039L9GLZTXB0nxCoT/tXXHDL7KNSMFrxU=
X-Received: by 2002:a05:620a:13a5:: with SMTP id m5mr10413999qki.119.1622931436571;
 Sat, 05 Jun 2021 15:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210602141501.6174-1-brgl@bgdev.pl> <20210602141501.6174-9-brgl@bgdev.pl>
In-Reply-To: <20210602141501.6174-9-brgl@bgdev.pl>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 5 Jun 2021 15:16:50 -0700
Message-ID: <CAMKF1spd2yzEBiStsv-+sqaCMe7HG-6iUKXcKkc+4MfZ5waG7Q@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 8/9] libgpiod: ptest: warn if the gpio-mockup kernel module is not selected
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Armin Kuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 2, 2021 at 7:15 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> libgpiod test-suites work with the gpio-mockup kernel module. When using
> linux-yocto, it's enabled using the gpio/mockup.scc kernel feature. Check
> if this feature is present in KERNEL_FEATURE and warn if not.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> index 874453fbd..febf625a6 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> @@ -52,6 +52,13 @@ RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-py
>  PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'tests', '', d)}"
>
>  do_install_ptest() {
> +    if [ "${PREFERRED_PROVIDER_virtual/kernel}" = "linux-yocto" ] && \
> +       ${@bb.utils.contains('KERNEL_FEATURES', 'features/gpio/mockup.scc', 'false', 'true',d)}; then
> +        bbwarn "libgpiod test-suites need the gpio-mockup
> +module and will not work without it. Consider adding
> +'features/gpio/mockup.scc' to KERNEL_FEATURES"
> +    fi
> +

perhaps turn this into a bbnote something like what libbpf is doing see
http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-kernel/libbpf/libbpf_0.3.bb?h=master

>      install -d ${D}${PTEST_PATH}/tests
>
>      # These are the core C library tests
> --
> 2.30.1
>
