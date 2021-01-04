Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.2649.1609792888400030179
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 12:41:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZL7Ycn0p;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id lb18so331518pjb.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Jan 2021 12:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+EUcgV7Ag1kpV7JgqOo2JzCHEsQefPM7ritXVy7Txo0=;
        b=ZL7Ycn0pkBVak+c+zdXzFmE7g7lZR4fmhAsu9cv5l2P5wQqTL/5ts/W9kICZ/VQmer
         XEI56UNQwuRgaeYr52A5JKa+WmO+Gf7zd1J39W+tNnAAjNF6FB6DVvPTzLPWGUH2bSdy
         1ZZWg9cgYq3Ccxky6OYHG3n5Rsydg+wCj8bRAI/BoJT/tmPY0ZiAbbT8m/I4SvqZbeYZ
         YHaFnGG6aYPcZFqbB7uQv5p1hGtPG9gRfT41y+1i3GwCoe+peB+G7zbjdUhpwmXNh6M7
         qOlA6eQPqFtIlPF608JUDsmpIJ7TdChx3TlnEv0yI2p9UeAkShQGPH/UzPHeEpSz109+
         +dOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+EUcgV7Ag1kpV7JgqOo2JzCHEsQefPM7ritXVy7Txo0=;
        b=Zzlor245m2ULmq/HfBANEvZ1/mLmXRrly7bZEXlAf3ncAhed2DhxWH/obUMyy+MqrX
         UThnaYHNVwFR8JpzOl2jbHeTzxr9e4rZk/URIF4oDcQvP6MJy0S4J9y8b9gBqbjOZB5Y
         14SmqxJZe7KhdUY/X+Z6tVttq0C3Z+KdowR/0Sto0nIF3Hs6yggvf+kMYxfOVARpM2cS
         1wiKFcOvp0rpIWcdPsIVF6ncWkfwbl+9P9sAvXlrKSeDBJB272YoXaF9Cukm9RTD82/+
         TfceT9kk9Lj4U/+48YqqrMM1cjFTlGypECyapY8Dz1BqzZTo30V5ttOPY0S363FdheIk
         r+vw==
X-Gm-Message-State: AOAM532+M5Wm8m1eYZdhI2d6FTsd+hJYUpX1muPvMKhnprVwG4qdvBHB
	a2GA3e/CN+fRbG6NPSZURNeNqe3FEpT2p0gof8E=
X-Google-Smtp-Source: ABdhPJwMKRp7dfJhRLRZXFNdcieDlPzkdMU14ml38ocbT+LdPBatGrNxYMsBXDFC0uTAQJWuP7kwPstaCPwDX1TR4dU=
X-Received: by 2002:a17:902:d70d:b029:db:fc74:67fa with SMTP id
 w13-20020a170902d70db02900dbfc7467famr74480417ply.65.1609792887845; Mon, 04
 Jan 2021 12:41:27 -0800 (PST)
MIME-Version: 1.0
References: <20210103141247.1637618-1-schnitzeltony@gmail.com>
 <20210103141247.1637618-3-schnitzeltony@gmail.com> <615e622d-7e4e-561a-ae75-a5c0d3186b69@gmail.com>
 <16571EDE005A7F88.23355@lists.openembedded.org>
In-Reply-To: <16571EDE005A7F88.23355@lists.openembedded.org>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Mon, 4 Jan 2021 21:41:16 +0100
Message-ID: <CALbNGRTwOY0c_C65czxV2N+3vnB+zg0fF5U-DP4dxNEWr1mXZw@mail.gmail.com>
Subject: Re: [oe] [PATCH][V2 02/16] xfce4-mount-plugin: upgrade 1.1.3 -> 1.1.5
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 4, 2021 at 8:42 PM Andreas M=C3=BCller via
lists.openembedded.org
<schnitzeltony=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Mon, Jan 4, 2021 at 8:21 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > it seems fstab.h header check needs some extra checks its failing on mu=
sl
> >
> > https://errors.yoctoproject.org/Errors/Details/540467/
> > https://errors.yoctoproject.org/Errors/Details/540468/
> >
> Hoped musl builds not necessary for me this time...
>
> OK - Will look into and come back

I accidentally removed fstab patch from SRC_URI - congratulations ->
V3 is coming.

Andreas
