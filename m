Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.4522.1601670071953372195
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Oct 2020 13:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rMkxxbRr;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id x201so3297447qkb.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Oct 2020 13:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hee/wPVZ3ncnZUjQP0s35f7uVYmufDILiDuGFvloXQY=;
        b=rMkxxbRr6hxERsEOMfjuVI/31BN54RbLRbnKdaoS9aRh4nLJJERT720ldL6P6kPnDe
         A2bBi3aOrioTnULmRdGY91OXvh/KNKijL46lbnUAFTfHMfMMPCQbtTsxW8+2fRBVnD8v
         Utla7qoUFn2udDbK1n2zhssbPLlet9mfNQYuMIUNBL8v+WypFEbUYtTiVBngBXHfiAlW
         PzakI0QTzJtHBsKs3318LENP8W2ik3qKQ8TbndG4b3SFr8SHBBzIWw8X21aE+LnNPFLm
         7jEJ2c8b7FH4bj6ibGg35gSj2hzlRtNFPLtzPG9cggjpi+cZRbjWPHjgG//AhvZ56w6J
         rcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hee/wPVZ3ncnZUjQP0s35f7uVYmufDILiDuGFvloXQY=;
        b=e/7P5Dq49XWZBzvKTopwjVnqu/eqhtUIF0S5++BTxTSsY5DcYPixxJxY6A+75+rLeb
         FZVzq2x9LE5XaL+m0IIm6WKTuAzDHavl0daIGmDwQBH8ZKNo2b6BCbdlnEEmaQJozSO1
         wXhVbJpztIaFwuFgqhRKPNO3/hOsCsSYbffKDmMjZfK/jwZm48IS16RMGQA2bkoJHBiS
         jO0ZcRbMhNloUVBJiQqbHTrsoNgBpKqxAM9zdWXOQDk5D2XSFiltrmO5C5zLyEWj7Bk9
         n2tCQ8LEE0p0q9b+zs2qvdhjH1kso/jqvQLUX4zb1K78LuTdEWE6t6B0bcj4XROfUvx0
         qAEA==
X-Gm-Message-State: AOAM531x9MlEuNKbO796caKOhHtb8UfhKgOkBY/68OxsOQ3wkz6rQEeu
	ihw4rS92VBnrJFJe9OuiKnE/WOC7f/GB8N6oRaY=
X-Google-Smtp-Source: ABdhPJwYBZ3Dgz9AkeXZfW0em5ZoTq8YdGEnewMoA1l+Akka8+L2jnHLtk9KfwRx8rinQIwWoaFcxFvigl/DQiOrDNY=
X-Received: by 2002:a05:620a:1670:: with SMTP id d16mr3888843qko.474.1601670070892;
 Fri, 02 Oct 2020 13:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAFR_W8q+7wJegtG-CNAxur=+EMi2jXKoP80=KuyqBY-zMkbLTQ@mail.gmail.com>
 <CADkTA4PYpOZwrstc6XcF_J3j0aRwEEAWZwRT==JMFJ0p==d_FQ@mail.gmail.com>
In-Reply-To: <CADkTA4PYpOZwrstc6XcF_J3j0aRwEEAWZwRT==JMFJ0p==d_FQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 2 Oct 2020 13:20:44 -0700
Message-ID: <CAMKF1soKALxESKSnmS7HDRRnNcJD3ratQOVVvqyd-K=iebu4TA@mail.gmail.com>
Subject: Re: [oe] Tracking dependencies on kernel configration
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: maxims@google.com, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 2, 2020 at 11:28 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Fri, Oct 2, 2020 at 1:58 PM Maxim Sloyko via lists.openembedded.org
> <maxims=google.com@lists.openembedded.org> wrote:
> >
> > Hi all,
> >
> > I hope this is the right mailing list for my question.
> >
> > Short version: my recipe (not kernel) depends on a certain option(s)
> > being set in the kernel built and certain devices enabled in the
> > device tree. Is there a way to make this dependency explicit and make
> > my recipe fail, if the kernel does not have this option set.
> >
> > Slightly longer version.
> > I have a recipe that builds a program that creates USB ECM gadget. For
> > that program to work properly, the kernel must have support for USB
> > Device (SoC specific driver) and ECM and the devices need to be
> > enabled in the Device Tree. Right now this dependency is not codified
> > anywhere, this is just something one needs to know. I would like to
> > codify it somehow, so that the recipe will fail, if the options are
> > not enabled in the kernel or if the devices are disabled in the device
> > tree.
> >
> > I've been thinking about creating a special class
> > kernel-dependency.class, which would check the kernel's final .config
> > file for the options specified in the variable and to the same for
> > device tree (maybe using dtc?). Before I do this, I want to check if
> > there are existing solutions for this problem.
>
> There's no existing solution in oe-core (at least not that I've heard of),
> I'm sure you'll now get a few folks popping up with their custom solutions
> and one of those may work in your scenario.
>
> I've actually got a really old feature that is somewhat related to this,
> and it can be found in bugzilla.
>
> There's a lot of not so obvious complexiting in getting something like
> you are describing working in the general case. It crosses kernels,
> kernel providers, kernel versions, machines, sub-machines,
> programmable logic, recipe and image configuration space, etc.
>
> The yocto kernel tooling has always had something similar to this
> which are a set of options that can be tagged as "required", and if
> they aren't present .. the build fails.  It just hasn't ever been exposed,
> due to the variety of kernel recipes out there.
>
> The .config is an artifact that we save in the kernel staging dir, so
> you can definitely write something that peeks into it and makes
> some decisions based on what it does or doesn't find.  The dtbs
> aren't dumped into the common directory, so you may need to
> jump through some hoops there.
>
> Making that generic to cross multiple kernel versions, machines,
> etc, that's the hard part (so I suggest staying out of that mess).

I think its an interesting problem, meta-raspberrypi tries to create knobs
for config metadata that translates into .config options and can also be
used in other recipes to validate a feature being compiled-in or out
but doing it comprehensively for all kernel config options is a whole
different game.

>
> Cheers,
>
> Bruce
>
> >
> > For USB Device (or gadget) specifically I found the usbgadget
> > MACHINE_FEATURE, but it looks like all it does is it recommends some
> > kernel modules. Maybe I'm missing something.
> >
> > Thanks for your help.
> >
> >
> > --
> > -MS
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> 
>
