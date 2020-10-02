Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.5877.1601673696037336329
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Oct 2020 14:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=WXv3EzlI;
 spf=pass (domain: google.com, ip: 209.85.219.178, mailfrom: maxims@google.com)
Received: by mail-yb1-f178.google.com with SMTP id x20so2135871ybs.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Oct 2020 14:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A4gZoISI2rzLRsZEZoKgpn9vsorLeqXyuIJxCgYdPXc=;
        b=WXv3EzlIyGErtJbuyThtc4BC4GfMdX/zEvbVfp6O30W39pI3WStx+P/Db+kSXNpjgd
         WHBSi8y0CqJKp5R4pNMYJrGVBu4UAk6DB7iwGKsmTk9SCP9gn0xSMiIIQOeZtywGGkxo
         sOUMJj7nIiYSLx1MuqMgKfr583CX9lgb+H+DhHevfB6daREjnbB7Zvr7vSkPJQCP/D2W
         cBa1EmlsPqqnMz/5TretgCFonVSfGY/OMFfugFIL8cPdsaIg3sp9jFjkjtlyweSOtJks
         woP5MLPZaWZH+tqRR8vhGdk5OAGhsyY23OV5uc36CZizhdKAwhMZ0XfevhTbtbYIwbmJ
         Mbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A4gZoISI2rzLRsZEZoKgpn9vsorLeqXyuIJxCgYdPXc=;
        b=doamEGbSnBKzom/QWXu6XDhcyEygblScWKtgQT2t1OhiHwTnn6hKSQRSZKxy78L/x5
         eo8MXnNGxG9tRq+jVtBtbZScl4Df4DcAdU7fQPComkfX8CFFc5PzgvlgHtdeH70tZdZC
         3ez/18qEAoXDcVasM/XRd97B6Eyn9c9hcqRxq53/MX/UzDv+iRPC8bi7LZpPP44tuKE6
         BW/Ce3V3L3atCWa+IzJCG4KByi6rhR+2GXRPYzJnWUdws+E6ajOnOssi/9mvskM1rft5
         Rek2i3hf05/Wly6Cwy8K7gbHfm5TftjmjYPj8LefU2iYVsM/1dMO8Xy1kC2VUtYb/Xys
         5Gzg==
X-Gm-Message-State: AOAM531vqpZJEmddBUYbyn+INtu/wL6pFh4pIchFV9XgE5uu/8ebUpXw
	4JqyOn7zou4BWbuxg0MDx/Ij2uEhyeXnj9XpXe0czA==
X-Google-Smtp-Source: ABdhPJxzRWZN4tSnAOTA1Dcd6nGLIUfo5qlntwXMCwVADskLdaDl9c7J4AMHuOYDwfrxNcipkyg2wdTwQLw2YGjAZYU=
X-Received: by 2002:a25:500c:: with SMTP id e12mr5709852ybb.125.1601673694905;
 Fri, 02 Oct 2020 14:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAFR_W8q+7wJegtG-CNAxur=+EMi2jXKoP80=KuyqBY-zMkbLTQ@mail.gmail.com>
 <CADkTA4PYpOZwrstc6XcF_J3j0aRwEEAWZwRT==JMFJ0p==d_FQ@mail.gmail.com> <CAMKF1soKALxESKSnmS7HDRRnNcJD3ratQOVVvqyd-K=iebu4TA@mail.gmail.com>
In-Reply-To: <CAMKF1soKALxESKSnmS7HDRRnNcJD3ratQOVVvqyd-K=iebu4TA@mail.gmail.com>
From: "Maxim Sloyko" <maxims@google.com>
Date: Fri, 2 Oct 2020 14:21:24 -0700
Message-ID: <CAFR_W8r8P+=OC3pNuzthPiYzHvdk2jBK7JOAvr+wjd1JHKFcJA@mail.gmail.com>
Subject: Re: [oe] Tracking dependencies on kernel configration
To: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 2, 2020 at 1:21 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Oct 2, 2020 at 11:28 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Fri, Oct 2, 2020 at 1:58 PM Maxim Sloyko via lists.openembedded.org
> > <maxims=google.com@lists.openembedded.org> wrote:
> > >
> > > Hi all,
> > >
> > > I hope this is the right mailing list for my question.
> > >
> > > Short version: my recipe (not kernel) depends on a certain option(s)
> > > being set in the kernel built and certain devices enabled in the
> > > device tree. Is there a way to make this dependency explicit and make
> > > my recipe fail, if the kernel does not have this option set.
> > >
> > > Slightly longer version.
> > > I have a recipe that builds a program that creates USB ECM gadget. For
> > > that program to work properly, the kernel must have support for USB
> > > Device (SoC specific driver) and ECM and the devices need to be
> > > enabled in the Device Tree. Right now this dependency is not codified
> > > anywhere, this is just something one needs to know. I would like to
> > > codify it somehow, so that the recipe will fail, if the options are
> > > not enabled in the kernel or if the devices are disabled in the device
> > > tree.
> > >
> > > I've been thinking about creating a special class
> > > kernel-dependency.class, which would check the kernel's final .config
> > > file for the options specified in the variable and to the same for
> > > device tree (maybe using dtc?). Before I do this, I want to check if
> > > there are existing solutions for this problem.
> >
> > There's no existing solution in oe-core (at least not that I've heard of),
> > I'm sure you'll now get a few folks popping up with their custom solutions
> > and one of those may work in your scenario.
> >
> > I've actually got a really old feature that is somewhat related to this,
> > and it can be found in bugzilla.
> >
> > There's a lot of not so obvious complexiting in getting something like
> > you are describing working in the general case. It crosses kernels,
> > kernel providers, kernel versions, machines, sub-machines,
> > programmable logic, recipe and image configuration space, etc.
> >
> > The yocto kernel tooling has always had something similar to this
> > which are a set of options that can be tagged as "required", and if
> > they aren't present .. the build fails.  It just hasn't ever been exposed,
> > due to the variety of kernel recipes out there.
> >
> > The .config is an artifact that we save in the kernel staging dir, so
> > you can definitely write something that peeks into it and makes
> > some decisions based on what it does or doesn't find.  The dtbs
> > aren't dumped into the common directory, so you may need to
> > jump through some hoops there.
> >
> > Making that generic to cross multiple kernel versions, machines,
> > etc, that's the hard part (so I suggest staying out of that mess).
>
> I think its an interesting problem, meta-raspberrypi tries to create knobs
> for config metadata that translates into .config options and can also be
> used in other recipes to validate a feature being compiled-in or out

Can you please link to a specific example of such a knob? I can't find
anything like that in that layer.

Thanks.

> but doing it comprehensively for all kernel config options is a whole
> different game.
>
> >
> > Cheers,
> >
> > Bruce
> >
> > >
> > > For USB Device (or gadget) specifically I found the usbgadget
> > > MACHINE_FEATURE, but it looks like all it does is it recommends some
> > > kernel modules. Maybe I'm missing something.
> > >
> > > Thanks for your help.
> > >
> > >
> > > --
> > > -MS
> > >
> > >
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> > 
> >



-- 
-MS
