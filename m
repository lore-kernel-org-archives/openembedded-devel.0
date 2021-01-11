Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.1286.1610391440410798134
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 10:57:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rzQ9D15L;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: marek.belisko@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id i24so848437edj.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 Jan 2021 10:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AWk2BqptbknUu81QpcXK5znPgBLBbUJbmOldIfyPqYs=;
        b=rzQ9D15LDtZ5kSnZ5fqRNunKOYIfksYc4AThNlhv9UB+5G3Gm6T2x6Cd0BWCFQEFdt
         TLgDHT+FOU+5JRtR5pB2VuTpbtUUDH08871HYOgqrOAe2MH8NJPgJS3gUmx4UWxrzjnq
         u2gyc2VD0laxRvAqjgCT8odol+ZjumccRWjj69OEX21huHOoke2RXAEDnUsbYsfUfl0+
         Ljwusx/Bq7khBgtwNvrLKbH84SkWI7FOB79xjItNluhrZrNw0doSa+sv9lX+ZlSoj7My
         Z19sI1mImbAF0EqKgak0x/4phgmNwMADTRAginoW2JgS7V+TrqySGVAdUuu2OXLhbYai
         qYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AWk2BqptbknUu81QpcXK5znPgBLBbUJbmOldIfyPqYs=;
        b=LuTso+iXBqB5fwijTJXWgeUjaOObMgeGs7pwd4boiRHppH0oq6LiTFoVvXt8RInXr0
         k0/8cjFh3O2rZ3urrjBXYwYs4a+w8PnwuAo4Us52PlT1T0MLO6MVpWk9Gagg++lqzCrQ
         ySq2trqK9Z9O5Ljn0copM6pSzEG9qgqr4e5/aNKeJMwB16HnsCGebZeh/GKNUf//+RWP
         STu5YnLssFfl5EvaRDFJ3nE8mxbM9j4a+hqvivi72QBrnfJOBn8ypB6S41FIUxJ4aiuE
         GnIzAcPK0jSlRx1C2dWVST9GcTZA3tOux30N15Yfqc/MOS+D/2xJXhkPwX6Fwsh5c8RB
         QBvA==
X-Gm-Message-State: AOAM533O54rt81Af+8kj+dbeFMg83NMYXmUuH+rxCRXSB8Ly/brw/YGm
	fOxo9JMPe9QlXcQZe/FkZRmhyoSmd3DEYqCqFuI=
X-Google-Smtp-Source: ABdhPJwxai1fqdR0uc0NEf2O5wSS0WT0Uh+f9Iq+XBKMOUwVuLLMwfoZ4wiCebmbkxUf7I6T+tVoApW5gbl6tyRUlxw=
X-Received: by 2002:a05:6402:1352:: with SMTP id y18mr591020edw.178.1610391438923;
 Mon, 11 Jan 2021 10:57:18 -0800 (PST)
MIME-Version: 1.0
References: <CAAfyv35iGwiKWorpEthr_CCDj_dVQUT0PW6MacAA+4k3h=foWQ@mail.gmail.com>
 <CAMKF1sryLZF-Qx2UDXCFpguOi4Yd3AVVR3KV+4g-QUoskL-SCQ@mail.gmail.com>
In-Reply-To: <CAMKF1sryLZF-Qx2UDXCFpguOi4Yd3AVVR3KV+4g-QUoskL-SCQ@mail.gmail.com>
From: "Marek Belisko" <marek.belisko@gmail.com>
Date: Mon, 11 Jan 2021 19:57:07 +0100
Message-ID: <CAAfyv34raB-VGfLOc6DOOQ4bMPsFW3xNmXrW=q43XeNiK1ANtg@mail.gmail.com>
Subject: Re: [oe] nodejs complation fails on dunfell
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Khem,

On Mon, Jan 11, 2021 at 6:49 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> you might have to add -latomic to LDFLAGS
I added it to LDFLAGS but it doesn't help.
>
> On Mon, Jan 11, 2021 at 5:18 AM Marek Belisko <marek.belisko@gmail.com> wrote:
> >
> > Hi,
> >
> > I'm trying to compile nodejs12 from dunfell branch for
> > raspberrypi0-wifi and getting following issue:
> >
> > /usr/include/c++/9.3.0/atomic:254: undefined reference to `__atomic_load_8'
> >
> > For raspberrypi3 build it works perfectly fine. relevant flags are:
> > -march=armv6 -mfpu=vfp -mfloat-abi=hard -mtune=arm1176jzf-s
> >
> > Strange is that nodejs8 from rocko branch works fine for
> > raspberrypi0-wifi. Any ideas?
> >
> > Thanks and regards,
> >
> > marek
> >
> > 
> >

BR,

marek
