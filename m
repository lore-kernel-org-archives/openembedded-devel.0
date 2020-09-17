Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web12.1372.1600363312258318740
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2020 10:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u9gGAyyY;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id z13so3070379iom.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2020 10:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aIrFKjgCMKz4ge0aSEUIvLwVJdHSIe0NH2PJ82zNP0U=;
        b=u9gGAyyYdx91risjiZ9kC4qub2gIoQ5OmwrEffde7n7xSr2/l1h7NhyFsxAWRAQWXA
         Tv+3El0OYvt4/v/v+Cn4TuJa2fII5yPTeSqp92fKXrxtp8VKalmaBgXj30rcwIRrTXbH
         mrHCo9OiNUO3YIald/zjzVEnOQqzkjz4gZ5VXT7aIXsd4nTibj5lvhSmgB7z+L8Sim03
         MUp+FMaXjNSvlocI7hvN9mtQ7m1bf4T39iY/bTk6zc8j5qfnFSfBeEVxw6Cy0nKjBj6g
         Y5Q/G8SUiVDxbJSN/3uMMciPqDh7rQH0wUmR+YcS4GWwSQAg57qXYiQruSQ6IP09GLmN
         N11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aIrFKjgCMKz4ge0aSEUIvLwVJdHSIe0NH2PJ82zNP0U=;
        b=FMGdppakZO3PFhxn6I8zc8xxDJvTwFZTOlXMCmrS/AUYs9T3KSJgKAkDKTY4d11/rc
         O3ntx7toFY1F+56Gci03e99kyovu/p3NkL/0QMua/UiMsGKy5LmES6FGrqOJy7thnpxN
         LuBM4RC8L/A2PCDLCzM85XlQGC+ZXpR+iaSFxFe+5xeoE5XBGQQqbzsYseJNF5K/2/3q
         TUl5kRJOm9DJBnY0QOT5qQm/06ZHdNvGiMJpBJ/d02KN8hMPk/MzatjmKRsdxsYpthHZ
         lvftcMl3F8/dE/GBmISuBIc1rZo+/llSOXQ3bS/OCxuwlaPXi3sXBHfqSaHGm0QpFgxL
         FggQ==
X-Gm-Message-State: AOAM532GrKILstuxLasYMUWmBL5PVOOhRx1woztPxpP6TRmrWAWqee0x
	rNj9T+ylLs39jhsuD7swFL0rb4Z9b/0Q6FGLYdw=
X-Google-Smtp-Source: ABdhPJwKmEvn6wh0p4bpZ1bcGlfxTjAdfdztzJ2dEDwI78Lq7i0RSQL4Z7yNdJBMJ4a5mWC87K1m2n13hD2GSOWm7UU=
X-Received: by 2002:a6b:bc82:: with SMTP id m124mr24685264iof.172.1600363311503;
 Thu, 17 Sep 2020 10:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200917144404.805-1-brgl@bgdev.pl> <CAMKF1sr_D-WUU6vhxxG65oHvjc8b6Eh8n=eportP+p-iKaQs1w@mail.gmail.com>
 <CAMpxmJVWrjaORA6qqqa28TJWgEZT3rTUd=yCfjTZ=Kf2VeUs8w@mail.gmail.com>
In-Reply-To: <CAMpxmJVWrjaORA6qqqa28TJWgEZT3rTUd=yCfjTZ=Kf2VeUs8w@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 17 Sep 2020 10:21:25 -0700
Message-ID: <CAMKF1sqFLLOFX5cafTb4F5ZO8E5QWL1_CwTDYj-5JQwS_dKriA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libgpiod: drop support for 0.3.3
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Armin Kuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 17, 2020 at 8:49 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Thu, Sep 17, 2020 at 5:23 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > is 1.4.4 backward compatible?
> >
> > On Thu, Sep 17, 2020 at 7:44 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > I no longer support the v0.x.y series. Remove the recipe for v0.3.3.
> > > While at it: the tests PACKAGECONFIG is duplicated so remove one
> > > instance.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > ---
> > >  meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb | 8 --------
> > >  meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb | 2 --
> > >  2 files changed, 10 deletions(-)
> > >  delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
> > >
> > > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
> > > deleted file mode 100644
> > > index c4d2bddf4..000000000
> > > --- a/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
> > > +++ /dev/null
> > > @@ -1,8 +0,0 @@
> > > -require libgpiod.inc
> > > -
> > > -PACKAGECONFIG ?= ""
> > > -
> > > -PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
> > > -
> > > -SRC_URI[md5sum] = "2aa1e1a80c3c919ae142ab9a55fb59ca"
> > > -SRC_URI[sha256sum] = "b773e557af1a497f786825462a776b7bf90168e67ee0a5bc5d2473a5674dc38c"
> > > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
> > > index a9a462866..b5a64a554 100644
> > > --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
> > > +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
> > > @@ -9,8 +9,6 @@ SRC_URI[sha256sum] = "f1cda2789e6a13a92aefc012a76e5a7cc57a1b402d66f71df8719ee314
> > >  PACKAGECONFIG ?= "cxx"
> > >
> > >  PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
> > > -PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
> > > -
> > >  PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3"
> > >
> > >  inherit python3native
> > > --
> > > 2.26.1
> > >
>
> No, it was a major release with a new API but 0.x was never meant to
> even be stable, it was largely a development series before we nailed
> down a good interface and released v1.0.

OK, perhaps a deprecation notice for a release might have been better,
but since you maintain this recipe and
perhaps has better idea of its users, I will defer that judgment to you.

>
> Bart
