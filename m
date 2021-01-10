Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.13803.1610249286585444606
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Jan 2021 19:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uwXYJk6L;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id g3so7747618plp.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 Jan 2021 19:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q01T3MSAPn77qpzkR4nQcvwfnNgKJCkVbmUf+wQyphI=;
        b=uwXYJk6L6mYTTP77WaVLaIXj7uwcR26PxS0n3IOQx1eAwXrNtuoeN6fZahzZLqEF7D
         Gn/j4nRoVWk+5qshZv+C2ph1G3iKVi7UDVXrIgMoUGOa+PgYl7EacVhVcUsyjRYXedoc
         4PScW8YkyOWjqvw/m5E7crtHROUneU9kB2y3RckESJXCQZBFCDt7C0BSSTyf4483+ryG
         mgB1VhM+TWsR3jAaUmYzHJJFFwoF+TmqlGWY6Qsbtc4XOaC8e5IJu3AaesP7e+NTNCmn
         vHH31IwTKXD/e3Grx0c3QkLpyxcyNQSaEawVgKHWUPTPCGMmRJ1EsD/fvmVoVlusdyeT
         FZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q01T3MSAPn77qpzkR4nQcvwfnNgKJCkVbmUf+wQyphI=;
        b=JnHBMdvlcwOh5xWahpbLkBY2pxwPfgC6u8Td7aWV99MfT7Tiyz2yCa8O8dM7JEgIU8
         nYYS+kcfScnqObX15WGfDHN0/gn0ys2c1ynCjAnd5JhdZ/ZLP8VQ8zEGUUjdVjK1NBUz
         s2whEzJONEyvuQy5fcZf9U0h13jLZ2jNt/20BFyMKvegXzF0PBpdCeUMBXXOopsPhwf2
         5GGGCrlm7a+ao6XcN63LDJ0T37Vt/bx0v3pUP2CJsJ21HEumqWkmYk8uGJepqMjPDvt4
         jIGbNHZ5c02B+HMgcnBt2qaRR8A4e7lkwq/8ciguxscGIFkzzi6VhzGCmLs6AM4CN0u9
         EG1w==
X-Gm-Message-State: AOAM533AH80oqBIX8BbX9RsKd2qmzcaYFQfXCnNB+vWJqiYC+a7K21EW
	n63P12WV2qQzSNlIK3lo6sYI2/dJrzF6UacpwlU=
X-Google-Smtp-Source: ABdhPJxyRxU1/7YMP7Fu2j2/f8YlfKYkCcidY6X0JbAohq1eMzdiEUg2CmqhaqP+XKjJOoDp3utSRWqUXLFYcXQHFok=
X-Received: by 2002:a17:902:d70d:b029:db:fc74:67fa with SMTP id
 w13-20020a170902d70db02900dbfc7467famr10887619ply.65.1610249286088; Sat, 09
 Jan 2021 19:28:06 -0800 (PST)
MIME-Version: 1.0
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
 <20210106151717.1779543-4-schnitzeltony@gmail.com> <CAMKF1srRCWhAcsVaNM=rou6_ys+KC_16PyB4KGB+Kj2vjfvZWQ@mail.gmail.com>
 <CALbNGRTreOS2m9z9tOp_Z3sGrVVypZr=5J9RBFwwnPF+fieYcw@mail.gmail.com>
 <CAMKF1sqht8W9eaqY6sVAVEqq_fKXsefOkjCSaLF=eCt-f+6vMQ@mail.gmail.com>
 <CALbNGRT_Jgtqd=LzHSNxBOvowHWLDx481tNsJ2bBiR=G2uaP3A@mail.gmail.com> <CAMKF1sqQFRVW7aXJbbykZR+RoQumbHBka6A_BhF1=VESe5OGkA@mail.gmail.com>
In-Reply-To: <CAMKF1sqQFRVW7aXJbbykZR+RoQumbHBka6A_BhF1=VESe5OGkA@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sun, 10 Jan 2021 04:27:54 +0100
Message-ID: <CALbNGRQFCDtxGwCRrP8_gdSmkgLb0ihXFshP4ovYZ_afSxF-GQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 04/28] libxfce4ui: upgrade 4.14.1 -> 4.16.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 9, 2021 at 7:42 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>> > > On Fri, Jan 8, 2021 at 8:54 PM Khem Raj <raj.khem@gmail.com> wrote:
>> > > >
>> > > > I see an odd failure on qemuriscv64
>> > > > https://errors.yoctoproject.org/Errors/Details/540832/
>> > > Hi Khem,
>> > >
>> > > Have seen this either but assumed it was caused by going back and
>> > > forth during tests. Worked around this by cleansstate.
>> > >
>> > > I think there is some race (unrelated to qemuriscv64): when I saw the
>> > > error, the file was there. I looked into that already but did not find
>> > > suspicious yet. Have put libxfce4ui back on my TODO...
>> > >
>> >
>> > yeah it seems intermittent, its already in master so will observe how
>> > it fairs in CI builds over few days
>> > and if its too noisy we might need a quick solution
>> >
>> If you look in the logs and search for
>> 'TOPDIR/build/tmpfs/hosttools/install -c -m 644
>> ../../libxfce4ui-4.16.0/libxfce4ui/libxfce4ui.h', you'll find it
>> twice. Seems there are two make jobs doing same (sometimes at the same
>> time).
>
>
> That seems to be a install time race we can disable it for do_install perhaps

Did send a fix here and upstream

Andreas
>>
>>
>>
>> This is at least a start...
>>
>> Andreas
