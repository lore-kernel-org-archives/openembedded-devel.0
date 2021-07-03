Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.23800.1625327306759928459
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Jul 2021 08:48:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sg7fKgap;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id b18so1109334qkc.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Jul 2021 08:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AjaAJ+UnK7VvUGzw/y8/TxHZ1pskXijT/WKbI45j/aU=;
        b=sg7fKgapefXRUfmf13rfrc0BKaKA68tlYOhI/AlDBa3D5OcRSrRy/s8euoADDj3ThT
         FNfvv1KoqEl9CjO/Npw9rY9IBbkO86BJWkVIlYBQiFkmqGCjvFvljt0d3ivrF9GdiSVF
         VBuDoqbndjwt23iqaF5+qdReFyCzrZxd3voB1VZxDMno8tQu4ZjwcClV0ak/pnmVXYik
         9NOiETLeC1HCP0HUzRmOLwf3x+5iV9BUPR23LFZExFgEuO1IA2ZBJ9HMZv0UCe2zNFXP
         UYlAyX+dqQ/jjWi1hAi5S2PK2vmVX8I1gsmIkysTcBghBZUYLl9wjqaXi5Kw8cc/rocc
         Qlrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AjaAJ+UnK7VvUGzw/y8/TxHZ1pskXijT/WKbI45j/aU=;
        b=SOroDjxS68dFLlontSpFxi+FtX/1RrMo/BwuxWywiFhYxdmujn3VsfSwzHH2dg2PXq
         HXp7BEVJNYtPsbgYSdZ8kyEmE2sxGp17OfREM8nQ5pfJOD05l/b7+8nyWYEbkovHXaV6
         2JynGCVW4v/UZ5PsEwerghZBtZ3ySpulsVOWyP6EzCOzKSmF/haWRd6vhUwCpiFLbRg1
         61/cclb0ZisaUMWRARUluC0AwyZb4bpYyz0Io9lcFQhY/9XFxa1hj5qLfx/fw1fO8RlH
         oQHW2nJyi6g723gAmXGgZlAtXjkWGMo1VR+JYqaDpyS0j7LuRGELXaRZt/TrWZKWBzQq
         uX8A==
X-Gm-Message-State: AOAM530DJo6fQZmzpIvyPJGIvBItA5Plq8m63wXxEn1p06kLvWFo/cq7
	GALtjtjXJvMlIyGrY2YQNkZoX0QQ4gQKRy8fmyY=
X-Google-Smtp-Source: ABdhPJx89xw11VeS1WW0i3arCmv0XrYhvVwxHF1e4pIwsaXzGO76nKlPcq91iuNwodQrfWoEFJUsHljnUoaM1ybv+Rg=
X-Received: by 2002:a05:620a:69b:: with SMTP id f27mr5838865qkh.25.1625327305822;
 Sat, 03 Jul 2021 08:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210702103534.105212-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20210702103534.105212-1-rasmus.villemoes@prevas.dk>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 3 Jul 2021 08:47:59 -0700
Message-ID: <CAMKF1sq4Le56Di9D12BBgV4aK=CY=_=iaPDRum2GAeMzg5ntXg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] recipes-kernel: vdsotest: new recipe
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Rasmus

Thanks for patch, we have however couple of failures

1. it needs to address error.h usage on musl -
https://errors.yoctoproject.org/Errors/Details/587173/
2. Need 64bit time_t usage addressed e..g rv32 -
https://errors.yoctoproject.org/Errors/Details/587178/

Cheers
-Khem

On Fri, Jul 2, 2021 at 3:35 AM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> vdsotest is a handy tool for testing and benchmarking the vDSO,
> e.g. to measure the overhead of clock_gettime() done via the vDSO
> compared to an actual system call.
>
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>  meta-oe/recipes-kernel/vdsotest/vdsotest_0.3.bb | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/vdsotest/vdsotest_0.3.bb
>
> diff --git a/meta-oe/recipes-kernel/vdsotest/vdsotest_0.3.bb b/meta-oe/recipes-kernel/vdsotest/vdsotest_0.3.bb
> new file mode 100644
> index 000000000..5f9490910
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/vdsotest/vdsotest_0.3.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "vdsotest is a utility for testing and benchmarking a Linux VDSO"
> +HOMEPAGE = "https://github.com/nlynch-mentor/vdsotest"
> +LICENSE = "GPL-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "git://github.com/nlynch-mentor/vdsotest.git"
> +SRCREV = "4ad733fb25364e4afaf4060e57c2429a93b686c5"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools
> --
> 2.31.1
>
