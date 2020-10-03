Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.2831.1601692035461950855
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Oct 2020 19:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZCMiDn3z;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id qp15so4358138ejb.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Oct 2020 19:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AhyWp1RrrwFYUPq8ohnoMEnG7uUF2+dYpdyvuXLPyzs=;
        b=ZCMiDn3zAmh+ZHPBxLcl5hD5far4FsoX4NjhnwgGzPGIBhKORmf9NW39CM00oESog1
         mXG6t8Q308Y822b3jEa758uSjsaTaM1AmVImVBmqTXJiR+tSn5VoUX82jyhIKxS3SNws
         GCeFe+HjO3x0IGdrRqnqVPJZiQ2w1noKYSXa7en3Ycw3f10RtVrai2M8KQMn4PN5xEiD
         GXXqdl3WsS4vgikVF5JZ+2hN6X3SH5BUdXOUxHJGXNECyqA4joUUeiSa2tg026v/u1N8
         z/oPVZ4JyUFNqvrwJaIj/jiI/rjbHkg8kuVnHXegTOK1JnWMc077JNhi2Coo7qwbn0Ci
         Urcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AhyWp1RrrwFYUPq8ohnoMEnG7uUF2+dYpdyvuXLPyzs=;
        b=Yf/QfNNrIbeAXitBKQmArbb2xXJXHzZhWHd35ply9RjCe4XGCiCVRwXKve+TtwDrqZ
         I7k1gx6rAqgjYDZqkjz1vzGcfMJjRvGWnyPRSvQNFvmsL6snUdanudE1WoMlxEbaqYny
         e7dyhl033PzPdkZZPrKusUQrihPZHWexNwHZuxlOBBWd/pWR2hFvJrRkEfcw0Cqbbb4T
         LluJ/nEVenMmzFeVZ0/uLom9w26ys0ML2cxdbvVymrcvmpPERCHlUF1prvLjpxHM2Wy8
         NeVQ7PWTzKjLYQz/b7fl2ifeVj0jm+re4a9m9iUb06ew5rmwBvqNwQfxsEx5VtWitXYK
         BGVw==
X-Gm-Message-State: AOAM532/AsY/02Mp/VMxjXtmuWR5V392tou6ENV1ByAX7IM7fZvuWx9k
	2szndw2s2UJ3PpEXiCkEYeudyMB+4BEReft90r8=
X-Google-Smtp-Source: ABdhPJxMw+mNV/mog/CqHLKQ/xM7jFsD/I/hdj8BYE0/3lEShAvwh6P7NK7+Q4cMYSR0kGwoFsBgZ/MZY6OJNDMIIBs=
X-Received: by 2002:a17:906:7e53:: with SMTP id z19mr4908392ejr.334.1601692033784;
 Fri, 02 Oct 2020 19:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAFR_W8q+7wJegtG-CNAxur=+EMi2jXKoP80=KuyqBY-zMkbLTQ@mail.gmail.com>
 <CADkTA4PYpOZwrstc6XcF_J3j0aRwEEAWZwRT==JMFJ0p==d_FQ@mail.gmail.com> <CAMKF1soKALxESKSnmS7HDRRnNcJD3ratQOVVvqyd-K=iebu4TA@mail.gmail.com>
In-Reply-To: <CAMKF1soKALxESKSnmS7HDRRnNcJD3ratQOVVvqyd-K=iebu4TA@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 2 Oct 2020 22:27:02 -0400
Message-ID: <CADkTA4MqpacYUd6OxkrsjkL4=vcVHWxB=dRZ=TdyM_1dtAbpvg@mail.gmail.com>
Subject: Re: [oe] Tracking dependencies on kernel configration
To: Khem Raj <raj.khem@gmail.com>
Cc: Maxim Sloyko <maxims@google.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 2, 2020 at 4:21 PM Khem Raj <raj.khem@gmail.com> wrote:
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
> but doing it comprehensively for all kernel config options is a whole
> different game.

That's also what the existing KERNEL_FEATURES options are for, they
error if not found or don't make it into the final configuration.

On a purely "is the option in the final .config", the existing
mechanisms could solve it.

The extension of the problem comes with addon boards and dynamic
logic. There needs to be some way to map and check what the BSP itself
supports, not just that someone has whacked an option on, when the h/w
doesn't actually support it.

That's what is tracked in the bugzilla entries .. and agreed, we'd
have already done something if it was easy to solve :D

Bruce



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
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
