Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.9396.1601739304245618913
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Oct 2020 08:35:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IXUk3GF/;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id t21so2295565eds.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Oct 2020 08:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LtD2I/xReLO8XfBsj91icpmGbiz/O0bPUmGmF+xA7bg=;
        b=IXUk3GF/QtF5Q5rKcwdSt6ycLmWoDF7Nc+Tj6EWe/wr5tvb038htQFLG4qjmHlnB0X
         0SUw3MEWflgIDfHRXKfhwI9+NSEvrcuA8fYlPS7ImUoXTAVKNzZ0CUw6oinc/Kk47Yok
         6IrBQ9XKzFsMJaCvZVpDeFQgNZT2DC1ZtGCNWrabUOGzSmnW44wue3+ClkfzZRstQh7z
         ZDKMNjMGnYGQSQvaVbLeVrRjcLY+ahHvTh//YiBy7CwLb4ywYVQFU7H2OR8Wc9WT4F5j
         PM8Oqw4WCS7P8ufgtCCYWJsZA7xWdZ/TitvA5uMIHYgs+WVEWMJBNs+xQqVZDMmoHmqq
         JL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LtD2I/xReLO8XfBsj91icpmGbiz/O0bPUmGmF+xA7bg=;
        b=dHVxSVQDTFvh7evYIqoIi/Sy9kuKcHbO/kZQHRha50AoZ5k9e4BuvrYr+cImEFLCLu
         7ClregdjMUJq68oUNggc4ZTEVxYSpLgI+8dYRBVGLIOiC7tXD7GT75M9fTgRGOfxThv+
         QewEQPN/LKDMFcenva16ILmXbC5nJHxqJs8N1oVDYDWOfraSe7pnIx5TDAztVIpNxONK
         bDT7HKtBUBRO84r5FyvpL4ETtL/fiJRv5Oe6D+m4To87ZfeCeR1ojEIKtc7Psa/f7lKn
         /wS0/te2MOCv8/bspIUqrjUDdoam2pSNgi5TUpUCxC/5NKJAlig7CdmK08zHsDbfX8xa
         BlWg==
X-Gm-Message-State: AOAM533rZCph5CdCrjZBYd2y7SgdNOrCJWwrNQHNGIofRAr0t082U98I
	9akZiAPOguunYv6Ruls0isz4fLAW1b0gEaJVnCg=
X-Google-Smtp-Source: ABdhPJzmVHcPGfnyq/1V85q884FAN1TQlf2m5QdSUwTi3qM2Cm5/5JbomvSA9V28UdFpNSkjiKm3cC1/nUbV9UhHgT8=
X-Received: by 2002:aa7:d5c2:: with SMTP id d2mr9242425eds.234.1601739302472;
 Sat, 03 Oct 2020 08:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAFR_W8q+7wJegtG-CNAxur=+EMi2jXKoP80=KuyqBY-zMkbLTQ@mail.gmail.com>
 <CADkTA4PYpOZwrstc6XcF_J3j0aRwEEAWZwRT==JMFJ0p==d_FQ@mail.gmail.com>
 <CAMKF1soKALxESKSnmS7HDRRnNcJD3ratQOVVvqyd-K=iebu4TA@mail.gmail.com>
 <CADkTA4MqpacYUd6OxkrsjkL4=vcVHWxB=dRZ=TdyM_1dtAbpvg@mail.gmail.com> <CAMKF1srh0Wn-6VyWOZm7QcyQ6RnN64YiJcPoFYXoLpTOxbD4rg@mail.gmail.com>
In-Reply-To: <CAMKF1srh0Wn-6VyWOZm7QcyQ6RnN64YiJcPoFYXoLpTOxbD4rg@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sat, 3 Oct 2020 11:34:51 -0400
Message-ID: <CADkTA4Pg4TeZOvKLVgx8J-W_b2HXEfb=yjggrpEtrB_pAq2uaA@mail.gmail.com>
Subject: Re: [oe] Tracking dependencies on kernel configration
To: Khem Raj <raj.khem@gmail.com>
Cc: Maxim Sloyko <maxims@google.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 3, 2020 at 1:49 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Oct 2, 2020 at 7:27 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Fri, Oct 2, 2020 at 4:21 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Fri, Oct 2, 2020 at 11:28 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > > >
> > > > On Fri, Oct 2, 2020 at 1:58 PM Maxim Sloyko via lists.openembedded.org
> > > > <maxims=google.com@lists.openembedded.org> wrote:
> > > > >
> > > > > Hi all,
> > > > >
> > > > > I hope this is the right mailing list for my question.
> > > > >
> > > > > Short version: my recipe (not kernel) depends on a certain option(s)
> > > > > being set in the kernel built and certain devices enabled in the
> > > > > device tree. Is there a way to make this dependency explicit and make
> > > > > my recipe fail, if the kernel does not have this option set.
> > > > >
> > > > > Slightly longer version.
> > > > > I have a recipe that builds a program that creates USB ECM gadget. For
> > > > > that program to work properly, the kernel must have support for USB
> > > > > Device (SoC specific driver) and ECM and the devices need to be
> > > > > enabled in the Device Tree. Right now this dependency is not codified
> > > > > anywhere, this is just something one needs to know. I would like to
> > > > > codify it somehow, so that the recipe will fail, if the options are
> > > > > not enabled in the kernel or if the devices are disabled in the device
> > > > > tree.
> > > > >
> > > > > I've been thinking about creating a special class
> > > > > kernel-dependency.class, which would check the kernel's final .config
> > > > > file for the options specified in the variable and to the same for
> > > > > device tree (maybe using dtc?). Before I do this, I want to check if
> > > > > there are existing solutions for this problem.
> > > >
> > > > There's no existing solution in oe-core (at least not that I've heard of),
> > > > I'm sure you'll now get a few folks popping up with their custom solutions
> > > > and one of those may work in your scenario.
> > > >
> > > > I've actually got a really old feature that is somewhat related to this,
> > > > and it can be found in bugzilla.
> > > >
> > > > There's a lot of not so obvious complexiting in getting something like
> > > > you are describing working in the general case. It crosses kernels,
> > > > kernel providers, kernel versions, machines, sub-machines,
> > > > programmable logic, recipe and image configuration space, etc.
> > > >
> > > > The yocto kernel tooling has always had something similar to this
> > > > which are a set of options that can be tagged as "required", and if
> > > > they aren't present .. the build fails.  It just hasn't ever been exposed,
> > > > due to the variety of kernel recipes out there.
> > > >
> > > > The .config is an artifact that we save in the kernel staging dir, so
> > > > you can definitely write something that peeks into it and makes
> > > > some decisions based on what it does or doesn't find.  The dtbs
> > > > aren't dumped into the common directory, so you may need to
> > > > jump through some hoops there.
> > > >
> > > > Making that generic to cross multiple kernel versions, machines,
> > > > etc, that's the hard part (so I suggest staying out of that mess).
> > >
> > > I think its an interesting problem, meta-raspberrypi tries to create knobs
> > > for config metadata that translates into .config options and can also be
> > > used in other recipes to validate a feature being compiled-in or out
> > > but doing it comprehensively for all kernel config options is a whole
> > > different game.
> >
> > That's also what the existing KERNEL_FEATURES options are for, they
> > error if not found or don't make it into the final configuration.
> >
>
> right, KERNEL_FEATURES is too kernel'y and sticky bits are yocto
> kernel tooling and metadata
> perhaps that is the inertia for its adoption I don't know.
>
> We need something like what buildroot has where top level kconfig
> option can translate into needed knobs for
> all affected packages including the kernel. distro_features,
> packageconfig there are many kbobs we have each solving
> a subset but not wholesome solution

And there's pretty much no way to really/easily align things (not that
this is news! :D).

DISTRO_FEATURES are probably the best way to do something like this,
or a similar newly invented mechanism that is global in scope and can
cross all of the various package/recipe boundaries.

That's of course, just the mechanism/implementation. Various
packages/BSPs/kernel recipes/distros would then have to tap into some
sort of abstracted "feature description" and map it to what they can
provide/do and optionally throw errors if they can't meet the
requirement. KERNEL_FEATURES was meant to be an abstraction like that,
which various kernel recipes could tap into .. but like we've been
saying, it's only part of the problem. We went down the rabbit hole
about 6 years ago and captured thoughts in bugzilla at the time.

Cheers,

Bruce

>
> > On a purely "is the option in the final .config", the existing
> > mechanisms could solve it.
> >
> > The extension of the problem comes with addon boards and dynamic
> > logic. There needs to be some way to map and check what the BSP itself
> > supports, not just that someone has whacked an option on, when the h/w
> > doesn't actually support it.
> >
> > That's what is tracked in the bugzilla entries .. and agreed, we'd
> > have already done something if it was easy to solve :D
> >
> > Bruce
> >
> >
> >
> > >
> > > >
> > > > Cheers,
> > > >
> > > > Bruce
> > > >
> > > > >
> > > > > For USB Device (or gadget) specifically I found the usbgadget
> > > > > MACHINE_FEATURE, but it looks like all it does is it recommends some
> > > > > kernel modules. Maybe I'm missing something.
> > > > >
> > > > > Thanks for your help.
> > > > >
> > > > >
> > > > > --
> > > > > -MS
> > > > >
> > > > >
> > > > >
> > > >
> > > >
> > > > --
> > > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > > thee at its end
> > > > - "Use the force Harry" - Gandalf, Star Trek II
> > > >
> > > > 
> > > >
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
