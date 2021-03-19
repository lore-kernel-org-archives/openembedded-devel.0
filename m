Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.4654.1616151621490930575
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Mar 2021 04:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=fqeMZ+ar;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.218.45, mailfrom: brgl@bgdev.pl)
Received: by mail-ej1-f45.google.com with SMTP id l4so8970785ejc.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Mar 2021 04:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Si36t3M2dDQAiOb/3pwqJb3PVMnKwEKKwENH7EQVnas=;
        b=fqeMZ+arw2IYq7zva58F4yoWfUHWXRjSU3lA2CH0c7iq+TkWT8wkIE/ibFWpXA0eXE
         694gAfwny5Yh/28fkklv1KNxrURQ6E89INAVpANEgBZIGOpq6BT3UPsF2H9Dr/69bW+Y
         5fTytyRtEvLTu8X/0qhhNL/Yi32xTGjWaB6vz/s+nNClsDRW/6gwI0cYb6tSNPw0sntW
         4FsrqJGFcwtmMIfE5NhKw95yR1m3u0sQRBDPF4Vks3d/pBLPWY/xpnTK9NeyzhWNsqA8
         Ayo1X+C7es4Yj5zWJ8i2nPtEc09yJU1Nf6flaZlXz9ohfhQ17acw7XktbPtA0+4YxDET
         mdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Si36t3M2dDQAiOb/3pwqJb3PVMnKwEKKwENH7EQVnas=;
        b=tgxFjtsjf+kRrcOoeWBkmjCcJ0MKZC8YQ+9eW+yVopLtJrkMirRTYBREau/DVq24NB
         3nZPhn7oQJ8QAPZbFQZ8VW99yqvRf7tN5GFCSmfiuVLZFtfTMQeBSvquOVG4BUSqVzaA
         e2pLI3VVOh9oE9uDMgVhmM1pG8PTxV4I6m/aYAuz9S01ekiB6aCGQ/FGgnNAJOQZf3Ei
         pRKPowL+Z/w7BPeYUkpDM4YRB43XsHjMwY8o+536wolK+Qpp9h0JsndQAIIBNUy1jpwz
         RduBCkQza4qSDGJvA2X776Nj6m+js4/o/eHFxctHPD9/fUycfAE9HPlP7ta+1LrAncom
         R5SA==
X-Gm-Message-State: AOAM533aQ6P5VKTtEkBOsQty/kFOapV6Igg3C5R8CW7pyBtrSRs0oZzC
	zWJRIr5YBr67wdabpS+4aZz6uiwPcIHi/Jy0ESj1zQ==
X-Google-Smtp-Source: ABdhPJx51Ub9nFLlFH60+EQaKlP7ipIAkKJc0W/oXxprBDf+0ZWk3GfreN13EQLaWGJnWdki81agFDVEmN3umbbMcjk=
X-Received: by 2002:a17:906:2404:: with SMTP id z4mr3573928eja.14.1616151617421;
 Fri, 19 Mar 2021 04:00:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRc=McUB0dbu=GoQz_mrt0=V3=iYawp=WJi6Z5-_fW3i4dLPQ@mail.gmail.com>
 <20210318174457.gm2no6omtd6qgzma@apollo.localdomain> <CAMRc=Mc8WCeCobNeS6=qyHQH43UO3mf-hG1YHUAFCyrTeANn4g@mail.gmail.com>
 <CAMKF1soMR6uXiqHZhk-fZo3FFo3r1mH4i8HPJ5EXbJn3rKsXTQ@mail.gmail.com>
In-Reply-To: <CAMKF1soMR6uXiqHZhk-fZo3FFo3r1mH4i8HPJ5EXbJn3rKsXTQ@mail.gmail.com>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Fri, 19 Mar 2021 12:00:06 +0100
Message-ID: <CAMRc=MdmXCB0i+x=LHcVJ3GMaWxomsJwfe1TbnsDFNUkgNg7yQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] mpv can't find x11 components
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Trevor Woerner <twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 18, 2021 at 9:26 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Thursday, March 18, 2021, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>
>> On Thu, Mar 18, 2021 at 6:45 PM Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > On Thu, Mar 18, 2021 at 11:47:30AM +0100, Bartosz Golaszewski wrote:
>> > > I'm trying to add mpv to an image using the minimal-x-session. The
>> > > build fails with the following error at do_configure():
>> > >
>> > > | Checking for X11
>> > >      : no ('x11 >= 1.0.0 xscrnsaver >= 1.0.0 xext >= 1.0.0 xinerama >=
>> > > 1.0.0 xrandr >= 1.2.0' not found)
>> > > | You manually enabled the feature 'x11', but the autodetection check failed.
>> > >
>> > > If I build the core-image-x11 image, mpv builds just fine so I assume
>> > > I'm missing something in my custom image (or rather some dependency
>> > > isn't pulled in by the recipe).
>> > >
>> > > Any idea on what could be missing?
>> > >
>> >
>> > do you have x11 in DISTRO_FEATURES looking at config.log file might
>> > reveal more on missing dependencies.
>> >
>>
>> Yes I do. It looks like the build is looking for
>> /recipe-sysroot/usr/lib/pkgconfig/xrandr.pc (provided by
>> libxrandr-dev) and it finds it on current master but not on dunfell
>> that I'm using.
>>
>> It doesn't look right, does it? Shouldn't it look in
>> recipe-sysroot-native for any such development files?
>
>
> Yeah sometime with-x option is needed to let it find in right sysroot otherwise autoconf has mind of its own at times and pokes at build host
>

I haven't made myself clear - the xrandr.pc file is not there on
dunfell but it is present on master. Looks like libxrandr-dev isn't
pulled in on dunfell but is on master.

Bart
