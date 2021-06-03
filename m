Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.5075.1622708215841377102
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 01:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=iAtbf41w;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.218.53, mailfrom: brgl@bgdev.pl)
Received: by mail-ej1-f53.google.com with SMTP id ci15so7891075ejc.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jun 2021 01:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JK9CzAotv30/Gx3i86cgH3vTt54BeomVg5N9xxNYMNA=;
        b=iAtbf41wXaZcfAwYbTlHopsX0Stts09Yw03gP43oJyTlHXEkGyv0rHQxH9X22vBKPC
         pOT2FeUrMl2IBIyPy8kHFv2PQJuPuMDXBMJEy4Yix7aDBbxkXuPrXHXezVLsdjc0pr4E
         XuBVsfQUofkcgsHcT040mxLjDYuYsY2V0j1kUb2UdSlqxLLJFO1k+WPXuXboBAJXkGpm
         6Awl12HIsvDw30E0rzPpMxrC6xnVA4j1YcYLVEVzeKnOgh7zKobcpG/1wMzzOXDOFKL5
         JgaUjT2xyT643qrEyY6gd27Ahh78SN4RToGOzIinye+4Q0qvCResd2IG1bj5B4/Wxz+T
         6IdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JK9CzAotv30/Gx3i86cgH3vTt54BeomVg5N9xxNYMNA=;
        b=GwKv5fDvDyDPMkLHOcw0V1rbN39tJPrALrih6TV4EbUbpq2gyN3BbviRNrfJ6BV8TL
         2kXIEWeaVB/oibqjWEUPobhjj6SPOT3ORHJ+uT6RaK5g/w5pgdrGPqUcSZSAUqHiaaib
         PWXqpsPE81SVqLcoD3qu6q6GSOXfhE1B0NgGcpZTcOseU/V4zFtLp+WfS3Y9jhbzOueP
         8MyuwE4oZ89WR6tHL4O3nZSkryTm9Z6/4Z8aE7T1cXEwhwEVdwSXjBIbGukF0nfBq1Gr
         x+iWZK0mZuL8fFkDh3Rl5PoLxECcQ2SZ9sfz62rVcFwLSNSAeFBz6fwrfEaiwk6SlbiU
         VHJA==
X-Gm-Message-State: AOAM5322Xss+6ZpL5XM1i0k2UvxJYnL9qe60rR++sRuGyaqbtpZZ+ruP
	vSI42C2hyotaDHCsC05tenICeDtUiQnsE7BejZYcnA==
X-Google-Smtp-Source: ABdhPJz0pigwWHItkOstdofqlI3CJaMlOPZBV+Xe6P1ojL0kqqb9Vq9uzU1vttrj6IbEBKXTYnf2ICTuzgLQ6UqAJrA=
X-Received: by 2002:a17:906:8345:: with SMTP id b5mr4763882ejy.14.1622708213983;
 Thu, 03 Jun 2021 01:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210602141501.6174-1-brgl@bgdev.pl> <CAMKF1spuC4GysJgyQdze0T6h0Vf3RtMpPU1bKsOQA=L2FuA7ZQ@mail.gmail.com>
In-Reply-To: <CAMKF1spuC4GysJgyQdze0T6h0Vf3RtMpPU1bKsOQA=L2FuA7ZQ@mail.gmail.com>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Thu, 3 Jun 2021 10:16:43 +0200
Message-ID: <CAMRc=MeP48vqH70-fHBSnQqU300w-Nk_9NTfzwEwh9EyshMqyA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 0/9] libgpiod: ptest improvements
To: Khem Raj <raj.khem@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 3, 2021 at 2:03 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Bartosz
>
> I am seeing this warning on AB
>
> stdio: WARNING: libgpiod-1.6.3-r0 do_install_ptest_base: libgpiod
> test-suites need the gpio-mockup
>
> Can you look further into this please ?
>

I don't have to look into it - this is the behavior introduced by
patch 8/9. If using linux-yocto, building the ptest package for
libgpiod doesn't make sense without including feature/gpio/mockup.scc
in KERNEL_FEATURES. The test-suites simply won't work. I don't see any
way for implicitly pulling in kernel features so I thought that the
second best option is to warn if we don't detect it as already
configured.

Bart
