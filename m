Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.1200.1622678611022578867
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jun 2021 17:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sWUC1JDM;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id eb9so2334045qvb.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Jun 2021 17:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=51T7420Qih4nYbjg9zq/k9YmvKUkcCJN7t5Ec63DG2k=;
        b=sWUC1JDMOw+kkRyKPmuc6Ow2OYfdBlkmlNRwyhrcn9OdGRuZuiW0g+tg8O6O3LRn3g
         FEnVLTH3uibA6+x89kWTs5kK4Hzi1NtmsFOF63MSzUenCo+Bu/19Qm52ecmgpDvjeS/g
         CHsoTQvSmyaomrN5ptPtbUqPuRmH/a4HQ0mrw86MY5RNntgOTuUhRC1GAmR5KpXYXZgH
         /80qtaElfcoeAFP6uh8zfoCjgHLtvK89XLw+AygtiHlxuEUH+i6LOZQG4/+OP5Ku38Iy
         bopGhxKiwyJxXedw++c1vxcCfsXne+mFZr9BGEg/Hoo/ahdIVAvCIWutHqNjP4rGh3wF
         Vgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=51T7420Qih4nYbjg9zq/k9YmvKUkcCJN7t5Ec63DG2k=;
        b=Rl5tZKwbdkAM0LxxOzQZqFs+a0W6frW05HtvEE2jEHYDGVUVKQTWvE3Ins/FQ2O/S6
         nWHeOqgM8YUYU1G9hc3bNL8ZST1AO2ms3eYXEIBdcyTa0jMr/Nb5a9BRCbSfMrlll9wL
         kef9wNUi2xpuwfHZXvAVCsQg+209FpjRLWTk6sdHsqVkMIE9hDNYLyJwmT1fHzh/PYnA
         LWgd4A8VRzo9/+agA/13exx6atDXFXCAMrA3OOu5UmoMxuJd+bMWm6LEpQI4NZ9DQV3+
         UskFrhc230VnQShkdkkzy2+v6L1AvPL8TQ6k2EvnCIN3X67yW/un1a2Hl/fQWGLvymG/
         tLdg==
X-Gm-Message-State: AOAM5313FO9KVNgTEtLg1xQNptizFqDOfFZAZjImIbXqYSETGCO0IFqS
	sEKPJcr5aqM5cdLuH1SVrjOhxYjArc1/DbNiZDuGSiPqPzKRVA==
X-Google-Smtp-Source: ABdhPJzDtlbjv9u59exc376D/4IFZq+gMwirkUX558C5FA7yfGEL8ux9H9GdRHVH8G9o/GKcDZ3SZ9g9LrhvLd4NPes=
X-Received: by 2002:a05:6214:258d:: with SMTP id fq13mr31475208qvb.50.1622678610158;
 Wed, 02 Jun 2021 17:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210602141501.6174-1-brgl@bgdev.pl>
In-Reply-To: <20210602141501.6174-1-brgl@bgdev.pl>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 2 Jun 2021 17:03:04 -0700
Message-ID: <CAMKF1spuC4GysJgyQdze0T6h0Vf3RtMpPU1bKsOQA=L2FuA7ZQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 0/9] libgpiod: ptest improvements
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Armin Kuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz

I am seeing this warning on AB

stdio: WARNING: libgpiod-1.6.3-r0 do_install_ptest_base: libgpiod
test-suites need the gpio-mockup

Can you look further into this please ?

On Wed, Jun 2, 2021 at 7:15 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> This series improves the recipe for libgpiod with primary focus on ptest
> parts. We bring in support for all test-suites available in the package.
> We also tweak the recipe in other places to make it more readable and
> robust in general.
>
> Bartosz Golaszewski (9):
>   libgpiod: coding style fixes
>   libgpiod: list all packages in a single assignment
>   libgpiod: fix RRECOMMENDS for python bindings
>   libgpiod: correctly split output files into packages
>   libgpiod: add RDEPENDS for tests
>   libgpiod: redirect stdout from the ptest executable to a file
>   libgpiod: ptest: run all test-suites if possible
>   libgpiod: ptest: warn if the gpio-mockup kernel module is not selected
>   libgpiod: ptest: add kernel-modules to RRECOMMENDS
>
>  .../recipes-support/libgpiod/files/run-ptest  | 21 ++++---
>  .../libgpiod/libgpiod_1.6.3.bb                | 61 +++++++++++++++----
>  2 files changed, 64 insertions(+), 18 deletions(-)
>
> --
> 2.30.1
>
