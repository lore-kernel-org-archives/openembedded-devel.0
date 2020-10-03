Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.1386.1601704168667072854
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Oct 2020 22:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=twvnIf/r;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id w12so5683050qki.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Oct 2020 22:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V0RvOFikibN4CDK/7fKoPOO7sfEfB/d988s/5Y6TLpc=;
        b=twvnIf/rRuwiOxGFY8fYGlV4k1Rv3yfq2MjriRnuirB5w3o/XbJx5xD2SzTVnZx6eT
         jV7kZi4LuxHndq+uvR/uhnZG0rjlo2GZ0aWK4+qcYzz9y+SPQ2dZ+2lkzBMcDiUAeqt9
         1/ZIXjwWtdT3pQt9Otr6Lo+c15q88eih8ya4raMc9K5JaFh4ghSUgHK5O4Ktbnoa5oCh
         JFPx3F15beQcMUKAFtu2f+vDbGs7hR/XR4rxGXJxT6Jy0QejjPYz/iDRrgf+kyE6ID+g
         XQ6TdwMsS65cWYM2ET1TlyVylei8geEgXY81t/j1Rmarj/HSrL/K3FwyXRybbJS+dOdK
         Ua7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V0RvOFikibN4CDK/7fKoPOO7sfEfB/d988s/5Y6TLpc=;
        b=IDTNqN2AtMCzQYT5ny7XSJwjmy5tWM5BcZ3Y/Ac9siJvamI4JG7HsZ7WaDS8dVetEQ
         MVpci03c1cLB20XYaGB8uVEl5NrxNE/pXcOJRbU9F7QHU9PK3QjISx4PzKXnhKq6wqsf
         owTdJJ5VmGQAo4PVYDXxIOUc6V3KbHYWhwob6StfyfhXgnIr6RQXgEzUsFFE1EC/+ixb
         WBqtl/TNry8KAI9BRbWakcNSBJtIVDveW8EZteV9TwSQ33ryoxH/8QUYtlrpnWP3EfNz
         374EB/gZqrfy8vVDAtwfrT8Uw78qGX+gnOWhImeffsweGRq5uViY9kGqaxdVZq9YyHDD
         iIRw==
X-Gm-Message-State: AOAM530J0CXMZLwDZ8vUT1Nxr8sDvRpojcZzIal5PRj1RiaYqFIIjTp0
	pUp4bF2wPDhhNJ+rE28bHf37xdM/jgmTl88Zj6Y=
X-Google-Smtp-Source: ABdhPJz7JTwV92Bs435VsXDfhU0kmcK7xp31JJFC3YQnGwSvtIinMn9L18H2YwiWZndxNLoKTSWyDxG+7uWmUBV9HM8=
X-Received: by 2002:a05:620a:1670:: with SMTP id d16mr5428877qko.474.1601704167421;
 Fri, 02 Oct 2020 22:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAFR_W8q+7wJegtG-CNAxur=+EMi2jXKoP80=KuyqBY-zMkbLTQ@mail.gmail.com>
 <CADkTA4PYpOZwrstc6XcF_J3j0aRwEEAWZwRT==JMFJ0p==d_FQ@mail.gmail.com>
 <CAMKF1soKALxESKSnmS7HDRRnNcJD3ratQOVVvqyd-K=iebu4TA@mail.gmail.com> <CADkTA4MqpacYUd6OxkrsjkL4=vcVHWxB=dRZ=TdyM_1dtAbpvg@mail.gmail.com>
In-Reply-To: <CADkTA4MqpacYUd6OxkrsjkL4=vcVHWxB=dRZ=TdyM_1dtAbpvg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 2 Oct 2020 22:49:01 -0700
Message-ID: <CAMKF1srh0Wn-6VyWOZm7QcyQ6RnN64YiJcPoFYXoLpTOxbD4rg@mail.gmail.com>
Subject: Re: [oe] Tracking dependencies on kernel configration
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Maxim Sloyko <maxims@google.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 2, 2020 at 7:27 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Fri, Oct 2, 2020 at 4:21 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Fri, Oct 2, 2020 at 11:28 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > >
> > > On Fri, Oct 2, 2020 at 1:58 PM Maxim Sloyko via lists.openembedded.org
> > > <maxims=google.com@lists.openembedded.org> wrote:
> > > >
> > > > Hi all,
> > > >
> > > > I hope this is the right mailing list for my question.
> > > >
> > > > Short version: my recipe (not kernel) depends on a certain option(s)
> > > > being set in the kernel built and certain devices enabled in the
> > > > device tree. Is there a way to make this dependency explicit and make
> > > > my recipe fail, if the kernel does not have this option set.
> > > >
> > > > Slightly longer version.
> > > > I have a recipe that builds a program that creates USB ECM gadget. For
> > > > that program to work properly, the kernel must have support for USB
> > > > Device (SoC specific driver) and ECM and the devices need to be
> > > > enabled in the Device Tree. Right now this dependency is not codified
> > > > anywhere, this is just something one needs to know. I would like to
> > > > codify it somehow, so that the recipe will fail, if the options are
> > > > not enabled in the kernel or if the devices are disabled in the device
> > > > tree.
> > > >
> > > > I've been thinking about creating a special class
> > > > kernel-dependency.class, which would check the kernel's final .config
> > > > file for the options specified in the variable and to the same for
> > > > device tree (maybe using dtc?). Before I do this, I want to check if
> > > > there are existing solutions for this problem.
> > >
> > > There's no existing solution in oe-core (at least not that I've heard of),
> > > I'm sure you'll now get a few folks popping up with their custom solutions
> > > and one of those may work in your scenario.
> > >
> > > I've actually got a really old feature that is somewhat related to this,
> > > and it can be found in bugzilla.
> > >
> > > There's a lot of not so obvious complexiting in getting something like
> > > you are describing working in the general case. It crosses kernels,
> > > kernel providers, kernel versions, machines, sub-machines,
> > > programmable logic, recipe and image configuration space, etc.
> > >
> > > The yocto kernel tooling has always had something similar to this
> > > which are a set of options that can be tagged as "required", and if
> > > they aren't present .. the build fails.  It just hasn't ever been exposed,
> > > due to the variety of kernel recipes out there.
> > >
> > > The .config is an artifact that we save in the kernel staging dir, so
> > > you can definitely write something that peeks into it and makes
> > > some decisions based on what it does or doesn't find.  The dtbs
> > > aren't dumped into the common directory, so you may need to
> > > jump through some hoops there.
> > >
> > > Making that generic to cross multiple kernel versions, machines,
> > > etc, that's the hard part (so I suggest staying out of that mess).
> >
> > I think its an interesting problem, meta-raspberrypi tries to create knobs
> > for config metadata that translates into .config options and can also be
> > used in other recipes to validate a feature being compiled-in or out
> > but doing it comprehensively for all kernel config options is a whole
> > different game.
>
> That's also what the existing KERNEL_FEATURES options are for, they
> error if not found or don't make it into the final configuration.
>

right, KERNEL_FEATURES is too kernel'y and sticky bits are yocto
kernel tooling and metadata
perhaps that is the inertia for its adoption I don't know.

We need something like what buildroot has where top level kconfig
option can translate into needed knobs for
all affected packages including the kernel. distro_features,
packageconfig there are many kbobs we have each solving
a subset but not wholesome solution

> On a purely "is the option in the final .config", the existing
> mechanisms could solve it.
>
> The extension of the problem comes with addon boards and dynamic
> logic. There needs to be some way to map and check what the BSP itself
> supports, not just that someone has whacked an option on, when the h/w
> doesn't actually support it.
>
> That's what is tracked in the bugzilla entries .. and agreed, we'd
> have already done something if it was easy to solve :D
>
> Bruce
>
>
>
> >
> > >
> > > Cheers,
> > >
> > > Bruce
> > >
> > > >
> > > > For USB Device (or gadget) specifically I found the usbgadget
> > > > MACHINE_FEATURE, but it looks like all it does is it recommends some
> > > > kernel modules. Maybe I'm missing something.
> > > >
> > > > Thanks for your help.
> > > >
> > > >
> > > > --
> > > > -MS
> > > >
> > > >
> > > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > > 
> > >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
