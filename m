Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.22364.1594655199664198294
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jul 2020 08:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rRwcF7Kk;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id x62so10300595qtd.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2020 08:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=stz/m1Ohx4S5EBFKIu63LSDxTcY3kvI2tPAIeabpYW0=;
        b=rRwcF7KktuvjyMJZi73hU0X27CtHHf8pBxTzYQa8/0fIuffIKv9jQ76kndTddyaM0x
         vdELqI+o6KdL613cAbs3jn1CKqSd+FWKyhCEcWekrqmK6cTgSCme0obYsXKzBuUU815b
         9qlPiDcipbQh/zSifTDiI7NODJdQ3x31YNv7w5ySvaJ2LK0fFXt+AzK3JkpJk/EVTl2e
         HtjnOlTN2Q0nB/UZ7ANP/6sd7lyRY3UD7D4WJkkYHm/D51Tkl2WNUd5rbtXChLdiXtBk
         d3ksl94OHI15GVp0ebj5UoIxZg4Qv5BOl1E900tlvTcIITGvkzns9kA9L1dkVFdGQWtp
         DTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=stz/m1Ohx4S5EBFKIu63LSDxTcY3kvI2tPAIeabpYW0=;
        b=ELLNdCGb4rUME8lafgIJUyz6dqMi5KO4fl5twAtjrgCHKOs+7Xr6YtLZvD8LXc3qh4
         Cga7KloEqHvs/xhVbGFVzhp26kSz6h8TrXRwV7KHJOHGXAe/QbHa+BNsFzk9cz273yG8
         ThCFo4FRfyS0oE42EmF2/oU4uNL7R0e0g5SqXY5HzrShNivid8R4AL66eP2t5vdGRyHX
         T2fW6I+EIJjx1gHzxPLfqJ3b7dO7t7sljQ8oFbxARFnetirUb1N0LKnkt/TSyVfZDUkL
         oFW4Xl30yphWHdM4u3I8TFKiyK/XnUkXHdWQ4iVRvpmPJhp9tw4yw2DQQBlic7Pk5M9q
         vlUQ==
X-Gm-Message-State: AOAM532lTJy4RZPXjD2qT4+q2hu1CuiDwLCC0t2v4GW1dSAXyWpCVIki
	OP+bXa1Zvvw5CFG0DYdwQFm3dMV7M4LZRGEaAv8=
X-Google-Smtp-Source: ABdhPJwW8rChRUNybGqAN0sFZkMjqVXDJymSdRg7+8csDhxWXrijRSkjlO1oTgfbCFuSq8LakkLf+VH8okmAa/rbwyc=
X-Received: by 2002:ac8:748b:: with SMTP id v11mr13116361qtq.293.1594655198681;
 Mon, 13 Jul 2020 08:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593561840.git.akuster808@gmail.com> <fc1b28e574a01410f082034c1f8212139b6107e1.1593561840.git.akuster808@gmail.com>
 <CA+chaQc92KeJnoG+NPi6EvKMHNnLCbN8AFPS9Usdc1S1WNHu9A@mail.gmail.com>
 <24a9b660-a636-a614-4e5c-62bc9782ade3@gmail.com> <CA+chaQen7fpxTQ2eT933-5pZjsSpT0pJhciP2UY8V5rwe-6X1w@mail.gmail.com>
 <afc84fcc-e8bb-c8d2-52a4-372b72840857@gmail.com> <20200710073738.GQ108868@korppu>
 <06e723c4-54f1-10f8-3d2a-f8be6cca1a06@gmail.com> <20200713082540.GX108868@korppu>
In-Reply-To: <20200713082540.GX108868@korppu>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 13 Jul 2020 08:46:12 -0700
Message-ID: <CAMKF1soout4WD0nWYa5Nmx9+GiW69UfLTpP6x+iFPtWF0mny1A@mail.gmail.com>
Subject: Re: [oe] [dunfel 03/32] jsoncpp: upgrade 1.9.2 -> 1.9.3
To: Mikko Rapeli <Mikko.Rapeli@bmw.de>
Cc: Armin Kuster <akuster808@gmail.com>, Martin Jansa <Martin.Jansa@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 13, 2020 at 1:25 AM <Mikko.Rapeli@bmw.de> wrote:
>
> Hi,
>
> On Sun, Jul 12, 2020 at 11:41:58AM -0700, akuster wrote:
> >
> >
> > On 7/10/20 12:37 AM, Mikko.Rapeli@bmw.de wrote:
> > > Hi,
> > >
> > > jsoncpp seems to have messy ABI history so I would not update even minor versions
> > > in stable branch:
> > so are you for a revert?
>
> Yes, I would prefer a revert.

I think that's fine. Armin can you include this in your latest pull
review bundle, please?

>
> -Mikko
>
> > -armin
> > > https://abi-laboratory.pro/index.php?view=timeline&l=jsoncpp
> > >
> > > Cheers,
> > >
> > > -Mikko
> >
>
> > 
