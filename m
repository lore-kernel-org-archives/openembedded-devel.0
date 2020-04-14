Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web11.7560.1586855153902434947
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 02:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=Eo+W9zMw;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.166.45, mailfrom: brgl@bgdev.pl)
Received: by mail-io1-f45.google.com with SMTP id y17so12395896iow.9
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2020 02:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jFHNLL+6t7HUM+pvYdd67hCCbjo3mpLIygMSHItLOZs=;
        b=Eo+W9zMwRTYqTTBuvqn81fYIMcFbtzR12ysBRG6rNQtllBiNGsUOEP1uZE9jmXgvrU
         GSrMVmVenAE2UrBK96A6Pcn3/smPjPZ+Ot6aPJT0isYgCMlEyiSLcsPZGHe33aHEEqYS
         X379/Ny/yaAJSQDvddBh+Tsp5peLI9u73imJPDemd6mNo1FmziffUbGJGXk98ZuWjAFa
         X8+UM2ETVKoKE+Th94iXBA7B5khKfCgxKm9gnU7VewcW3m7DB2ZC8+BMM2QBRrAHEDaM
         1AR87LbE2kdAcnLYsePJ54M1u1/6pMF5k/glsQMti8G3626YOuQ+UvRqReZbYoVCkbeU
         RAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jFHNLL+6t7HUM+pvYdd67hCCbjo3mpLIygMSHItLOZs=;
        b=dGkGOPcdqpCUqsG4JiSUGDrlP4F7ZVGkgxhFU5whSDyFsW/+iY3cliooPRvTre4jSY
         HqIlQ3+Y5IeYvu+/hlz81lwDLMzGGp7EYlFNMfYq4nNB523drCAPDZf7jYFCF5meq9Da
         nJWmFBkKoQKU9kWQ5SC4gsbNu7EJ81jTZwBy4+5KqQ/Q34k0sFg787D12TNZ2QcZjizi
         H0pCi3ivcab+niJhA7pW8gu8TKiGmX7bjbtXqTtlW1B4ZeCR/a9gwQ0n9ju5FsHn5o0E
         XaoxOyRVhwwL0gnQKKiCuSNYoibm+KRwUunacGE4yXdobV4BCC2Qz7BoU5XpfbUSOrKo
         iHPg==
X-Gm-Message-State: AGi0PuaipTmwaHHL7o9K1PmDA1umTlQfZaX/UFDyhFckdrw8DBrqY5Jx
	rTTYq6N49k9Qp/pOJCfYResCi8hmp2uuVlnP3KNeAFu5
X-Google-Smtp-Source: APiQypI1M9X/bZKf7Gv5YXoMA/x6Inw5dcNqjo1dFoJf+QgZx544fn+pM6mK4Myn83VKjpfoih+tb16a8wg3A2DBQrg=
X-Received: by 2002:a6b:248:: with SMTP id 69mr20497800ioc.130.1586855153133;
 Tue, 14 Apr 2020 02:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200410124135.24217-1-brgl@bgdev.pl> <20200410124135.24217-2-brgl@bgdev.pl>
 <34f4335a-c9ed-a790-c683-3b6db93eceb7@embexus.com>
In-Reply-To: <34f4335a-c9ed-a790-c683-3b6db93eceb7@embexus.com>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Tue, 14 Apr 2020 11:05:42 +0200
Message-ID: <CAMRc=MeJOmwqPnZbgT-XugtQRU8okQMPGvgWx+cjnMw=1WyM=A@mail.gmail.com>
Subject: Re: [oe] [meta-security][RFC 1/2] classes: provide a class for generating dm-verity meta-data images
To: Ayoub Zaki <ayoub.zaki@embexus.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 13 kwi 2020 o 12:58 Ayoub Zaki <ayoub.zaki@embexus.com> napisa=C5=82(=
a):
>
>
> basically this class generate a dm-verity hash that needs to be injected
> inside the initramfs...it's a bit hacky.
>
> wouldn't be signing the hash, include the verifiication public key in
> initramfs more portable ?
>

Sorry, but I don't see how this is a better solution. You then have to
store two things somewhere: the hash and its signature. If the
fitImage is already signed - there's no reason to have a second
signature for the hash: it already comes from a trusted source.

This would also inflate the size of the initramfs - not only would it
need to include the cryptsetup tools but also additional tools for
signature verification.

Bart
