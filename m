Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF56C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 00:53:02 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web09.4815.1651193579474930263
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 17:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j1dzhgsh;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id o18so4747665qtk.7
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 17:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YsdygxQR5ypOwpEi2rCeUuOzwNSgwVsf+2xJqz1McJM=;
        b=j1dzhgshODN9Wttbs8TMjjOqFMsIG6BgL4gn0wiSQ1h6RXd5IiH2uf99YZYTz9IOSo
         aW0CFQo/zHbQJu219FS0PjB0bNrbrPq+1fWASANEWIY1Zs2sfWmzBRJHwKj5oQEYEc4m
         eMzDTCYX+Bm/w+xc5Q2oaJVGQtVj1i8Xl8wRMfGq2iAjvN0H82f9VhAIiW+4ZQRsOiji
         ShgYjxIc2YFqBuZgsf7WYVAUwGpZMJevLOqdHlGXidNiaw2YZbG2MfOffjVjYNQ1zYZR
         feWuLIn2skil6+vmSRW2x6AwQ8UMHeORHHH0JKK3SKJw9+2uPIv6bFmxrs4AacfxMvZm
         0iLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YsdygxQR5ypOwpEi2rCeUuOzwNSgwVsf+2xJqz1McJM=;
        b=gcIBbzIF1pk+VnAN45ejcPZxm2ab3OJRBQIcIDlhDhfeRTWOklfRnnG3Se29I5i4zQ
         bcRLWwRL3swhDrTtLyDVJFIOTHX8PVAJ10tw/DRKH/Mlq9hPzfdpF41B8qHfj1YYeWK/
         e+h4WV9Rvky8MC2CbSW0KfOyl2IlrZy7nYCdAnGIbmYqG6pnfG/2BjwcjGR+rTP1JE0N
         gzEVAOBJ6OF2QcDSpR7lOYM2Aa9K6McdC6wqeDrkGjELtOFby3H0pCd5FyeJAuU7QrM1
         A322YlYhwbFZGrW7JoLYSAfVppfrzUmobG0bVtXapSgnl0tYIXvT80xJ9of7lyYod2aF
         T2Ng==
X-Gm-Message-State: AOAM532RiJApnCiGzZAHHxnwPZCQOStAcaARwkJM/4U/J6orvMeL5XBt
	CJrVoUhKrzDfmvoNujeEI689LDYo1+U0KVIieJc=
X-Google-Smtp-Source: 
 ABdhPJyyRZljGRn5NvODiNot04sKcNLSVT11q76/yhKoRiZLeUVhOREetqfSj+ls9PHIHZGJSAa+nr828AOZRDnLrI4=
X-Received: by 2002:ac8:5805:0:b0:2f1:f1fe:d403 with SMTP id
 g5-20020ac85805000000b002f1f1fed403mr25119979qtg.229.1651193578436; Thu, 28
 Apr 2022 17:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220428230012.3467800-1-alejandro@enedino.org>
 <66219d6d-9a8e-e4c9-5d88-a4a37ca9115e@gmail.com>
 <CAHMutrb-XosSSouvUQenKdcOd_Bcbeg9nLd89=BPX7Pj5shEMA@mail.gmail.com>
In-Reply-To: 
 <CAHMutrb-XosSSouvUQenKdcOd_Bcbeg9nLd89=BPX7Pj5shEMA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Apr 2022 17:52:30 -0700
Message-ID: 
 <CAMKF1srQgTo6Up6DD3VAvkA1MTqF147gP0y+V1qeerWqqn_0ZA@mail.gmail.com>
Subject: Re: [oe] [PATCH] cryptsetup: Add luks2 related PACKAGECONFIGs
To: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Apr 2022 00:53:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96853

On Thu, Apr 28, 2022 at 5:39 PM Alejandro Enedino Hernandez Samaniego
<alejandro@enedino.org> wrote:
>
>
>
> On Thu, Apr 28, 2022, 6:30 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On 4/28/22 16:00, Alejandro Hernandez Samaniego wrote:
>> > Cryptsetup allows for certain luks2 related defaults to be
>> > set for libcryptsetup, these include the default PBKDF
>> > algorithm, memory limit for PBKDF2, parallel threads and
>> > iteration time.
>> >
>> > Add these options as PACKAGECONFIGs to cryptsetup while
>> > setting variables defined as the current cryptsetup
>> > defaults, making this change transparent for the user but
>> > allow these knobs to be customized.
>> >
>> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
>> > ---
>> >   .../recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb    | 12 ++++++++++++
>> >   1 file changed, 12 insertions(+)
>> >
>> > diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
>> > index 8f9f663a3..7baca98cb 100644
>> > --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
>> > +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
>> > @@ -44,6 +44,14 @@ PACKAGECONFIG:append:class-target = " \
>> >       udev \
>> >   "
>> >
>> > +
>> > +# libcryptsetup default PBKDF algorithm, Argon2 memory cost (KB), parallel threads and iteration time (ms)
>> > +LUKS2_PBKDF ?= "argon2i"
>> > +LUKS2_MEMORYKB ?= "1048576"
>> > +LUKS2_PARALLEL_THREADS ?= "4"
>> > +LUKS2_ITERTIME ?= "2000"
>> > +
>>
>> is this something that can be selected at runtime too ?
>
>
>
> Hi Khem,
>
> Yes, if using cryptsetup directly these can be changed at runtime regardless of the default set here.
>

in current settings, it will need to set two knobs and it seems a bit
off from what packageconfigs are for.
so perhaps we can enable the default configure options unconditionally
with default values and make the values a weak assigment.

> Being able to change these at build time becomes useful when relying on the libcryptsetup API.
>
>
> Cheers,
> Alejandro
>
>
>>
>> > +
>> >   PACKAGECONFIG[keyring] = "--enable-keyring,--disable-keyring"
>> >   PACKAGECONFIG[fips] = "--enable-fips,--disable-fips"
>> >   PACKAGECONFIG[pwquality] = "--enable-pwquality,--disable-pwquality,libpwquality"
>> > @@ -69,6 +77,10 @@ PACKAGECONFIG[nss] = "--with-crypto_backend=nss,,nss"
>> >   PACKAGECONFIG[kernel] = "--with-crypto_backend=kernel"
>> >   PACKAGECONFIG[nettle] = "--with-crypto_backend=nettle,,nettle"
>> >   PACKAGECONFIG[luks2] = "--with-default-luks-format=LUKS2,--with-default-luks-format=LUKS1"
>> > +PACKAGECONFIG[luks2-pbkdf] = "--with-luks2-pbkdf=${LUKS2_PBKDF}"
>> > +PACKAGECONFIG[luks2-memorykb] = "--with-luks2-memory-kb=${LUKS2_MEMORYKB}"
>> > +PACKAGECONFIG[luks2-parallel-threads] = "--with-luks2-parallel-threads=${LUKS2_PARALLEL_THREADS}"
>> > +PACKAGECONFIG[luks2-itertime] = "--with-luks2-iter-time=${LUKS2_ITERTIME}"
>> >
>> >   EXTRA_OECONF = "--enable-static"
>> >   # Building without largefile is not supported by upstream
>> >
>> >
>> >
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#96850): https://lists.openembedded.org/g/openembedded-devel/message/96850
>> > Mute This Topic: https://lists.openembedded.org/mt/90765285/1997914
>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> >

