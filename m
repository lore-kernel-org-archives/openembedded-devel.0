Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.39546.1601915066969652030
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Oct 2020 09:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=Tfac64kI;
 spf=pass (domain: google.com, ip: 209.85.128.49, mailfrom: maxims@google.com)
Received: by mail-wm1-f49.google.com with SMTP id j136so133110wmj.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Oct 2020 09:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jG+kUQff+yltyMk9+Y29B8LoiJ1W6KBs21dN9ylhbCc=;
        b=Tfac64kIGFelZZ8BTG5YwHNvTOP/7dKv4LY52fVTRvMQC+EdOxjn2aiNu2Qk/P/Ppx
         +CYW/PWjAbEMAQS6QeSX83yY1hggFllaEaKtqQ5wAUrAMgBLFVMc4JmzSns9+YhbB1qc
         h6bYWNeDxQkKacbp2S3f4Qf15JcpIQIUZBiSn0uYIzVs64Bq/DivgOUqiLblFdhksvn6
         wDdiw32nE5bZNRvLXZqDpK+J346wQ6MqjYjShQDpa/OLOLGCSf4E9zXvOjBXzv3eqikt
         MggvAbj+RE3e/S6RMDBze+21WWgrYPnSmx9u4+y+/iG9tMEo4HxtUIpyMaaNaVffi/6i
         Yvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jG+kUQff+yltyMk9+Y29B8LoiJ1W6KBs21dN9ylhbCc=;
        b=SrM0FQs8kXKFk4zKH4jkx+QSjxMB9W/W6kBQWnT44kT6fJvZL84jJKoDSzZewhmsXV
         wxCMvTOepRU8jEbcC9kykPydvhVTsSFVwJ5IebYiPEwqe+jszMi4z8yQMrYWzrYJdJ8+
         VNlXfEl6exz89WxFnsvKuYER7slXbQ6kUO1noJsAO7vJ60j9mGGaCeNmwnueYtfMouCo
         3F5IqlqM1IfsR9huwKP0Edo+9oxs31GLy4zKzN2+Zar8czSDYU8ODFgffcQ6J1UM/s30
         tHII8JA3PrrUENtM/1ywJO1PWyYlGayZ7w/q/9xALJ3bC3GB0O2Onrc5/zJqrz9BKpj5
         SNcw==
X-Gm-Message-State: AOAM531Fhgn2bfB5OnYb18TaGKuk1NfT6qCP/ahz5r16bMP4Y3OTuW/7
	A1i4obafLExiovfVqAVdzZBGnfFqVjpfg6VYU0v6ww==
X-Google-Smtp-Source: ABdhPJxBCj5gfaP7+05i0ZoRZCcVGxhlI/sfWfnvP05G6lLNmbN9t9rIuEaDkUJ0PtVz9M3Tqq10rsXts7L6wfK7zAw=
X-Received: by 2002:a7b:cb44:: with SMTP id v4mr154796wmj.101.1601915065086;
 Mon, 05 Oct 2020 09:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAFR_W8q+7wJegtG-CNAxur=+EMi2jXKoP80=KuyqBY-zMkbLTQ@mail.gmail.com>
 <CADkTA4PYpOZwrstc6XcF_J3j0aRwEEAWZwRT==JMFJ0p==d_FQ@mail.gmail.com>
 <CAMKF1soKALxESKSnmS7HDRRnNcJD3ratQOVVvqyd-K=iebu4TA@mail.gmail.com>
 <CADkTA4MqpacYUd6OxkrsjkL4=vcVHWxB=dRZ=TdyM_1dtAbpvg@mail.gmail.com>
 <CAMKF1srh0Wn-6VyWOZm7QcyQ6RnN64YiJcPoFYXoLpTOxbD4rg@mail.gmail.com> <CADkTA4Pg4TeZOvKLVgx8J-W_b2HXEfb=yjggrpEtrB_pAq2uaA@mail.gmail.com>
In-Reply-To: <CADkTA4Pg4TeZOvKLVgx8J-W_b2HXEfb=yjggrpEtrB_pAq2uaA@mail.gmail.com>
From: "Maxim Sloyko" <maxims@google.com>
Date: Mon, 5 Oct 2020 09:24:13 -0700
Message-ID: <CAFR_W8q3R9Wj8rOGn50RAMvO8+4mLQ0nxte9+invEOvD28m9BA@mail.gmail.com>
Subject: Re: [oe] Tracking dependencies on kernel configration
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I think the solutions being discussed here are much bigger than what
I'm actually looking for at the moment.

On Sat, Oct 3, 2020 at 8:35 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Sat, Oct 3, 2020 at 1:49 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Fri, Oct 2, 2020 at 7:27 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > >
> > > On Fri, Oct 2, 2020 at 4:21 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On Fri, Oct 2, 2020 at 11:28 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > > > >
> > > > > On Fri, Oct 2, 2020 at 1:58 PM Maxim Sloyko via lists.openembedded.org
> > > > > <maxims=google.com@lists.openembedded.org> wrote:
> > > > > >
> > > > > > Hi all,
> > > > > >
> > > > > > I hope this is the right mailing list for my question.
> > > > > >
> > > > > > Short version: my recipe (not kernel) depends on a certain option(s)
> > > > > > being set in the kernel built and certain devices enabled in the
> > > > > > device tree. Is there a way to make this dependency explicit and make
> > > > > > my recipe fail, if the kernel does not have this option set.
> > > > > >
> > > > > > Slightly longer version.
> > > > > > I have a recipe that builds a program that creates USB ECM gadget. For
> > > > > > that program to work properly, the kernel must have support for USB
> > > > > > Device (SoC specific driver) and ECM and the devices need to be
> > > > > > enabled in the Device Tree. Right now this dependency is not codified
> > > > > > anywhere, this is just something one needs to know. I would like to
> > > > > > codify it somehow, so that the recipe will fail, if the options are
> > > > > > not enabled in the kernel or if the devices are disabled in the device
> > > > > > tree.
> > > > > >
> > > > > > I've been thinking about creating a special class
> > > > > > kernel-dependency.class, which would check the kernel's final .config
> > > > > > file for the options specified in the variable and to the same for
> > > > > > device tree (maybe using dtc?). Before I do this, I want to check if
> > > > > > there are existing solutions for this problem.
> > > > >
> > > > > There's no existing solution in oe-core (at least not that I've heard of),
> > > > > I'm sure you'll now get a few folks popping up with their custom solutions
> > > > > and one of those may work in your scenario.
> > > > >
> > > > > I've actually got a really old feature that is somewhat related to this,
> > > > > and it can be found in bugzilla.
> > > > >
> > > > > There's a lot of not so obvious complexiting in getting something like
> > > > > you are describing working in the general case. It crosses kernels,
> > > > > kernel providers, kernel versions, machines, sub-machines,
> > > > > programmable logic, recipe and image configuration space, etc.

I'm not really trying to make a recipe work for all kernels. This is
the internal tool, we only support a handful of kernels and fixing it
when it breaks for a newer kernel is fine with me. We don't plan to
share the recipe itself.

> > > > >
> > > > > The yocto kernel tooling has always had something similar to this
> > > > > which are a set of options that can be tagged as "required", and if
> > > > > they aren't present .. the build fails.  It just hasn't ever been exposed,
> > > > > due to the variety of kernel recipes out there.
> > > > >
> > > > > The .config is an artifact that we save in the kernel staging dir, so
> > > > > you can definitely write something that peeks into it and makes
> > > > > some decisions based on what it does or doesn't find.

So, what I'm really looking for (or maybe looking to add to oe-core)
is a simple function that allows me to check kernel config for
options.

e.g. `is_kernel_option_enabled('NET_USB') -> y|m|n`

Are there any issues I'm missing with this? What is the best way to
add such functionality?

> > > > >  The dtbs
> > > > > aren't dumped into the common directory, so you may need to
> > > > > jump through some hoops there.

Would it be possible to change the kernel recipe so that the dtbs
would be dumped into the common directory?

> > > > >
> > > > > Making that generic to cross multiple kernel versions, machines,
> > > > > etc, that's the hard part (so I suggest staying out of that mess).
> > > >
> > > > I think its an interesting problem, meta-raspberrypi tries to create knobs
> > > > for config metadata that translates into .config options and can also be
> > > > used in other recipes to validate a feature being compiled-in or out
> > > > but doing it comprehensively for all kernel config options is a whole
> > > > different game.
> > >
> > > That's also what the existing KERNEL_FEATURES options are for, they
> > > error if not found or don't make it into the final configuration.
> > >
> >
> > right, KERNEL_FEATURES is too kernel'y and sticky bits are yocto
> > kernel tooling and metadata
> > perhaps that is the inertia for its adoption I don't know.
> >
> > We need something like what buildroot has where top level kconfig
> > option can translate into needed knobs for
> > all affected packages including the kernel. distro_features,
> > packageconfig there are many kbobs we have each solving
> > a subset but not wholesome solution
>
> And there's pretty much no way to really/easily align things (not that
> this is news! :D).
>
> DISTRO_FEATURES are probably the best way to do something like this,
> or a similar newly invented mechanism that is global in scope and can
> cross all of the various package/recipe boundaries.
>
> That's of course, just the mechanism/implementation. Various
> packages/BSPs/kernel recipes/distros would then have to tap into some
> sort of abstracted "feature description" and map it to what they can
> provide/do and optionally throw errors if they can't meet the
> requirement. KERNEL_FEATURES was meant to be an abstraction like that,
> which various kernel recipes could tap into .. but like we've been
> saying, it's only part of the problem. We went down the rabbit hole
> about 6 years ago and captured thoughts in bugzilla at the time.
>
> Cheers,
>
> Bruce
>
> >
> > > On a purely "is the option in the final .config", the existing
> > > mechanisms could solve it.
> > >
> > > The extension of the problem comes with addon boards and dynamic
> > > logic. There needs to be some way to map and check what the BSP itself
> > > supports, not just that someone has whacked an option on, when the h/w
> > > doesn't actually support it.
> > >
> > > That's what is tracked in the bugzilla entries .. and agreed, we'd
> > > have already done something if it was easy to solve :D
> > >
> > > Bruce
> > >
> > >
> > >
> > > >
> > > > >
> > > > > Cheers,
> > > > >
> > > > > Bruce
> > > > >
> > > > > >
> > > > > > For USB Device (or gadget) specifically I found the usbgadget
> > > > > > MACHINE_FEATURE, but it looks like all it does is it recommends some
> > > > > > kernel modules. Maybe I'm missing something.
> > > > > >
> > > > > > Thanks for your help.
> > > > > >
> > > > > >
> > > > > > --
> > > > > > -MS
> > > > > >
> > > > > >
> > > > > >
> > > > >
> > > > >
> > > > > --
> > > > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > > > thee at its end
> > > > > - "Use the force Harry" - Gandalf, Star Trek II
> > > > >
> > > > > 
> > > > >
> > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
-MS
