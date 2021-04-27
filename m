Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web12.9431.1619534624173115524
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Apr 2021 07:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=GDeK7oIr;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.44, mailfrom: brgl@bgdev.pl)
Received: by mail-ed1-f44.google.com with SMTP id s15so70291204edd.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Apr 2021 07:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wc8UwnnrKvjssrfs3XBj7vDuwU80SjGskL3KOdpYI2w=;
        b=GDeK7oIrmp7ACka6rv8CDIE9nCreAJBy85smOx+yPbNKGHkDC26N8hyPx2y012Wri2
         owb0WaBp+E4uTI3ck74nc+QOAwGz0c6ZhBQ2K/vhL4qHYBYsrp47dv0cQAPiS7NiixmW
         TUZqtmz9JfB2kT/tNt5u7V+sQJbYJ8AtIeQKMTO9uy9vE6MTqINX/NOJfwTSTqjA4Wz+
         Rr3d8rB/mWLRdDwo9yHJKimds+AryqNlNHy5Du0Sfsoc0PTGc23BEiyKyZ1G75rMiTuo
         tsiWxKItpFKvTMEwRWjOpRvXjw1hF/f+OZq9gEL04H4x31XUtvplr48i9DFln3PnLXJG
         Xmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wc8UwnnrKvjssrfs3XBj7vDuwU80SjGskL3KOdpYI2w=;
        b=uMKSvDXeuccdz7WP2kWJyK7ypDyAZz27ENL7LGPtS2ZpMRevh+WdGtYhQbCzbRI/gr
         JHv7zlChEq2mDwblr1mtkGnWpW/Vi1dRnLk52BfK8d4qfVNFlhos+HWeAfS3vqRhlIHW
         W6IGYWlbxI8r3f6HzOJTXwqYorJi/nXAtCau4ToKfUwwpVNdirLKK8dMLpUtH0yTuIPy
         LoZcTbn+88GnRF15c5jiCk5BK9QvaP26R2xaAPaKIA558uIcdWJwNK+4diGa9mUnIpXk
         SgyrAxydod85XRnV+Lw7yF2pQ1bVWw/iEUxAWuk/Eklp8fwWpWg8fe1n570425fZm/Oy
         KRIA==
X-Gm-Message-State: AOAM533VEw2NrI5ln3BjWBYoDlu4LpJW6WTrC5XDlkzOmf+UAy0fMOkG
	Fy4UC+bT3pR50IbVT8OK6qLWSPJan6kL9YkwA7dGvQ==
X-Google-Smtp-Source: ABdhPJzyYC59V29ALVT22pR+Eza3seR0D+f3Im2nS2tAroJaUSJ00jdlKKxJ3uZJnLK11tdQBUtiUe+Z7yfFDYkss+w=
X-Received: by 2002:a05:6402:6d4:: with SMTP id n20mr4810617edy.134.1619534622366;
 Tue, 27 Apr 2021 07:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210427140009.10771-1-brgl@bgdev.pl> <472586cf-e706-069e-14d4-615b9ba35bf9@windriver.com>
In-Reply-To: <472586cf-e706-069e-14d4-615b9ba35bf9@windriver.com>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Tue, 27 Apr 2021 16:43:31 +0200
Message-ID: <CAMRc=MeBBpR991_HOuJ95quXFidxkX6GGLXhA8dg-+J2=p5=3Q@mail.gmail.com>
Subject: Re: [meta-python][PATCH] python3-txsockjs: new package
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>, 
	Tim moto-timo Orling <TicoTimo@gmail.com>, Derek Straka <derek@asterius.io>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 27, 2021 at 4:04 PM Trevor Gamblin
<trevor.gamblin@windriver.com> wrote:
>
>
> On 2021-04-27 10:00 a.m., Bartosz Golaszewski wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > This adds twisted python support for SockJS.
> >
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > ---
> >   .../0001-setup-fix-syntax-error.patch         | 27 +++++++++++++++++++
> >   .../python/python3-txsockjs_1.2.2.bb          | 15 +++++++++++
> >   2 files changed, 42 insertions(+)
> >   create mode 100644 meta-python/recipes-devtools/python/python3-txsockjs/0001-setup-fix-syntax-error.patch
> >   create mode 100644 meta-python/recipes-devtools/python/python3-txsockjs_1.2.2.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-txsockjs/0001-setup-fix-syntax-error.patch b/meta-python/recipes-devtools/python/python3-txsockjs/0001-setup-fix-syntax-error.patch
> > new file mode 100644
> > index 000000000..f5de64221
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-txsockjs/0001-setup-fix-syntax-error.patch
> > @@ -0,0 +1,27 @@
> > +From 7b6323f467dc4f2ff4421350ac5fbf3a73c66764 Mon Sep 17 00:00:00 2001
> > +From: Bartosz Golaszewski <brgl@bgdev.pl>
> > +Date: Tue, 27 Apr 2021 14:20:41 +0200
> > +Subject: [PATCH] setup: fix syntax error
> > +
> > +Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > +---
> > +Upstream-Status: Inappropriate [Project's github has been removed :(]
>
> I'm hesitant to add a recipe for a module whose official repository may
> have been deleted. I do see the DesertBus/sockjs-twisted repo, but it
> hasn't been updated in several years. Do you know if any of the forks
> are actually being maintained?
>

Doesn't look like they are but the package works fine for me. I'm not
too attached to this, we can keep the recipe locally in our layer if
you decide not to apply it.

Bart

> - Trevor
>
> > +
> > + setup.py | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/setup.py b/setup.py
> > +index d67320e..13ac3c5 100644
> > +--- a/setup.py
> > ++++ b/setup.py
> > +@@ -70,6 +70,6 @@ setup(
> > + try:
> >
> > +     from twisted.plugin import IPlugin, getPlugins
> >
> > +     list(getPlugins(IPlugin))
> >
> > +-except Exception, e:
> >
> > ++except Exception as e:
> >
> > +     log.warn("*** Failed to update Twisted plugin cache. ***")
> >
> > +     log.warn(str(e))
> >
> > +--
> > +2.25.1
> > +
> > diff --git a/meta-python/recipes-devtools/python/python3-txsockjs_1.2.2.bb b/meta-python/recipes-devtools/python/python3-txsockjs_1.2.2.bb
> > new file mode 100644
> > index 000000000..e5a86e013
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-txsockjs_1.2.2.bb
> > @@ -0,0 +1,15 @@
> > +SUMMARY = "A simple library for adding SockJS support to your twisted application."
> > +AUTHOR = "Christopher Gamble"
> > +HOMEPAGE = "https://pypi.org/project/txsockjs/"
> > +SECTION = "devel/python"
> > +LICENSE = "BSD"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=c62063068876fa826aa4fb6db49fdf7a"
> > +
> > +SRC_URI += "file://0001-setup-fix-syntax-error.patch"
> > +
> > +SRC_URI[md5sum] = "fcdd3f68021abc6034223b5b36f43128"
> > +SRC_URI[sha256sum] = "759f5571e276e70c1ad20919d27cf2e8eef8751594892bd107d6e88dce4a5db9"
> > +
> > +inherit pypi setuptools3
> > +
> > +RDEPENDS_${PN} += "python3-twisted"
> > --
> > 2.30.1
> >
