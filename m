Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web09.59.1622738911999811454
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 09:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=thDu3iB5;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id u13so3516381qvt.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jun 2021 09:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+iRpLmYKAMqw6SSHshpNfzSnZFkmjWFZT4TP9eAO91g=;
        b=thDu3iB534gK1srvEQEXuaaRhf1vD1MdHD6qqlRh4jSiBzgYKJuDxhLO3k3LCbj0Fn
         sE4AgY4LOmyyxTM3CGhwLp+LMHYtFy3w+ERITQfJ84xoA8lgnunFAu2O9yQ1csWVCqYo
         dUeLJx45ekLwV0y2YQjRhsuMlh0lAbBLGY0UMiZ+bA+atPR5b5EcsEoRmEHD0H+gtCMe
         jHTwwbleUfLLn2/6wGuBTgFvqVUl5TzWwtoOLyokBlfJYqfxci7N8IQd//nLPduWDxtZ
         Exjfiq8a1KlJUDQYJq/Mbzg9n2L1rSxHLIfqOlTGa1hAhO5Bm8o9EIQu84HqMK3uHyl8
         QMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+iRpLmYKAMqw6SSHshpNfzSnZFkmjWFZT4TP9eAO91g=;
        b=FHm3ER7tT7NtxCxGg4cha0H7uD4KjjdykwQ6ce5qRgt8AFJXhCwSJo/CHlqzLM0yjg
         1ICaEKeqe77sHnoAFgS0dD2jdxdlpF7xiAq3BaQVWvEt40mV9WeqNq/oOrNz4eANmqLK
         lUCAQIqwMIP0MbI8RVg5AwbvZymvu2q/PninTaop2OUKI3q89fNx85S3Fz2Hk8wwTn2m
         1mbGfPq815jRkc3R54DE2Pqcwy8enfxnLx59DCelMFSXWKxVenQG2ByiIUPpBvu0Ye7I
         /UFcSHSIyXPebt/VH4bMbHrUndBpgQ/IVZxB6eh73HHC3haAJrX0JteyQ68j4+oqw/gE
         XvrQ==
X-Gm-Message-State: AOAM530R/8+K8lKKv+GHT8lhvT+xoNhn9ww8LSWsqP1w5OoPH6dWtpR0
	JeHg2hw9WvURXon1XgSoxe0c1AdvirZbWWQ3KHU=
X-Google-Smtp-Source: ABdhPJxEK9tTjN5Wri88ufJT1l6aN//6WK/P1AdlGt/po8oVzAsLWhtTTKR7HMIkOiaRuVAaLwTsItP0CpE7C1AGteE=
X-Received: by 2002:a05:6214:1869:: with SMTP id eh9mr445421qvb.16.1622738911063;
 Thu, 03 Jun 2021 09:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210602141501.6174-1-brgl@bgdev.pl> <20210602141501.6174-10-brgl@bgdev.pl>
In-Reply-To: <20210602141501.6174-10-brgl@bgdev.pl>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 3 Jun 2021 09:48:05 -0700
Message-ID: <CAMKF1sqMDM3xW68nGQa3A8NJaSsuvBvVw7GiDkyNWrfC3V=iYw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 9/9] libgpiod: ptest: add kernel-modules to RRECOMMENDS
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Armin Kuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 2, 2021 at 7:15 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> libgpiod needs the gpio-mockup kernel module to be loadable (not
> built-in). Add kernel-modules to RRECOMMENDS.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> index febf625a6..8dda8a2a6 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> @@ -48,6 +48,7 @@ FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*.so"
>  FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
>
>  RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-python', '', d)}"
> +RRECOMMENDS_${PN}-ptest += "kernel-modules"
>

do we need full swath of modules ? or can we be surgical ?

>  PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'tests', '', d)}"
>
> --
> 2.30.1
>
