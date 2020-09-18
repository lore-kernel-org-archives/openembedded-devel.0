Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web11.7559.1600413571315362439
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Sep 2020 00:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=CzRGtnQW;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.166.65, mailfrom: brgl@bgdev.pl)
Received: by mail-io1-f65.google.com with SMTP id r25so5810917ioj.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Sep 2020 00:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dLUT1PsYFsDf3lWAUlFq/K2SvIPwmwLX2c1l4Eqg6nY=;
        b=CzRGtnQWhRVOLtB9Mf+VST35+OFQN9lLRqoidynDjEAZQPJS50l5+Qwv8hraUqQf7g
         oqU9EQ0Jr0pVcNj0SWPkrR6ZxvvIjV1oH8a1WsSoAoqFJk2s0hDlOJLKqCfA0tzmbCCD
         m/BykXpwVcPc7amIkXpJ903rSUiZsPF9lMVT7ZKd7tKD1zLKxkmGlqIzhJM9b+MrLDDx
         Q225zy2cTmlr/Q7gXW9330LHmZjUlPY0zW62tMEAGl6YFOYgobrl+G4zJYvDksabv1E6
         49RnLA45FSNLkDnaqmIa/N1Z1ZHxfzJkKlqOjNsVu4RnazXG/pViNFnAPeTwCOXCSC3M
         GK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dLUT1PsYFsDf3lWAUlFq/K2SvIPwmwLX2c1l4Eqg6nY=;
        b=BmKtrxp4AiAxY80VYXJmvITij2q1nIHQ012onuYcCsxWizd75ur9IlrdytyL6NE5X0
         KKYR3r5uNTadWMeSoUae5np8OVZuyNHOzNR2fN05K5l2LoTFJ250lLias+fqtcbl4LQc
         9zot8P7goTKIcbxvJjU3JUCEyfR4H1PY1zneBGy/VlneyKzoUH4TZvJHsJOA8UgLZ6hR
         kv7kwC3H+iNKywMR80Ixa+fIUIbJqGrgl4Kk6fq1bLbQ4qLivwMieK4vwUzRiaBxhc2Z
         k5Aca4ywhirEQU3/PVFlKG8ail55K2P5/hRmIuHnTsyccitXSfYBO2J7Vsu4Hs96MW8C
         OQYA==
X-Gm-Message-State: AOAM533s1XLr4iRt6KG7Og6PniJnLwmUnyxuNhYsWxKW2OFMbhqjg+GY
	PQr56/gmmWWpv4S2zwSvcqtwT3h43R2o+clBXxas5A==
X-Google-Smtp-Source: ABdhPJzziwo/xowGdI7sF2UcI/R7mRSh2Ij8GW1QJnd3PPACPHtqHKd3PK65Q53O4cF+7rJoBXFoWOiWDvV1DQfVP4Q=
X-Received: by 2002:a05:6638:14c8:: with SMTP id l8mr29762048jak.136.1600413570514;
 Fri, 18 Sep 2020 00:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200917144404.805-1-brgl@bgdev.pl> <CAMKF1sr_D-WUU6vhxxG65oHvjc8b6Eh8n=eportP+p-iKaQs1w@mail.gmail.com>
 <CAMpxmJVWrjaORA6qqqa28TJWgEZT3rTUd=yCfjTZ=Kf2VeUs8w@mail.gmail.com> <CAMKF1sqFLLOFX5cafTb4F5ZO8E5QWL1_CwTDYj-5JQwS_dKriA@mail.gmail.com>
In-Reply-To: <CAMKF1sqFLLOFX5cafTb4F5ZO8E5QWL1_CwTDYj-5JQwS_dKriA@mail.gmail.com>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Fri, 18 Sep 2020 09:19:19 +0200
Message-ID: <CAMRc=MfeqiZQpPphZp=jO0OZ_+TkyG99+DL2=_DqWW3aYLzKbA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libgpiod: drop support for 0.3.3
To: Khem Raj <raj.khem@gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Armin Kuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 17, 2020 at 7:21 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Sep 17, 2020 at 8:49 AM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> >
> > On Thu, Sep 17, 2020 at 5:23 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > is 1.4.4 backward compatible?
> > >
> > > On Thu, Sep 17, 2020 at 7:44 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > >
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > I no longer support the v0.x.y series. Remove the recipe for v0.3.3.
> > > > While at it: the tests PACKAGECONFIG is duplicated so remove one
> > > > instance.
> > > >
> > > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > ---
> > > >  meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb | 8 --------
> > > >  meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb | 2 --
> > > >  2 files changed, 10 deletions(-)
> > > >  delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
> > > >
> > > > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
> > > > deleted file mode 100644
> > > > index c4d2bddf4..000000000
> > > > --- a/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
> > > > +++ /dev/null
> > > > @@ -1,8 +0,0 @@
> > > > -require libgpiod.inc
> > > > -
> > > > -PACKAGECONFIG ?= ""
> > > > -
> > > > -PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
> > > > -
> > > > -SRC_URI[md5sum] = "2aa1e1a80c3c919ae142ab9a55fb59ca"
> > > > -SRC_URI[sha256sum] = "b773e557af1a497f786825462a776b7bf90168e67ee0a5bc5d2473a5674dc38c"
> > > > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
> > > > index a9a462866..b5a64a554 100644
> > > > --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
> > > > +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
> > > > @@ -9,8 +9,6 @@ SRC_URI[sha256sum] = "f1cda2789e6a13a92aefc012a76e5a7cc57a1b402d66f71df8719ee314
> > > >  PACKAGECONFIG ?= "cxx"
> > > >
> > > >  PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
> > > > -PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
> > > > -
> > > >  PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3"
> > > >
> > > >  inherit python3native
> > > > --
> > > > 2.26.1
> > > >
> >
> > No, it was a major release with a new API but 0.x was never meant to
> > even be stable, it was largely a development series before we nailed
> > down a good interface and released v1.0.
>
> OK, perhaps a deprecation notice for a release might have been better,
> but since you maintain this recipe and
> perhaps has better idea of its users, I will defer that judgment to you.
>
> >
> > Bart

Yes, it's fine - this branch hasn't received any updates for over two
years. It doesn't even support all kernel features. I maintain the
library itself and don't have any intention of bringing v0.3 back to
life.

Thanks,
Bartosz
