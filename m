Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.1579.1601687057803103895
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Oct 2020 18:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sXsIAt1/;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id g3so4110405qtq.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Oct 2020 18:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PjU1f7bxcHnhG+XTEoc0uxImhbp8pjIEcV+b6TVl2os=;
        b=sXsIAt1/vaofMGILKGV02QAHWXJaRkJAUPorgSI+6IXoaSf4cIvtEDbXOgPE5hlV7f
         l1VStH6QpxQvNwLSybiE/sjobjbtV48ZhvLe2WXyauM/6aK1zlMLvvVgU72wZtD2JjhD
         tMhXPB850qD5Lyf1TPODtKVNLqia8HZhv3Y1VnocI06Su/U1kIN0a1fu/E8oyn7/25O0
         LdhOgqDomkNI/ZPij8fAC4ODvL6RP8z0jUjC0eRUCaePfw5sr/fKdZ6YkhA6p7zbM/Ch
         stfsVUEIX8Kq8KXxziUBAVrhBVp1SXVL5WTxrbUwShXYfP9HBqrlLrDmHbqf2M09azy0
         eTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PjU1f7bxcHnhG+XTEoc0uxImhbp8pjIEcV+b6TVl2os=;
        b=mmK/72sb4VIu6s1HCWW2GTdkthsvLVvBps8ZD85x+vpaBc8jdqwgJwcwQTfqnWR/B5
         6aKQugIk65nGuUgionmUGuMZtqzvpYnjkeOyoXx3w0IAwTk//S7VoZyjxmPvNGoTFf0c
         DsJRFR4p3BlhrZlec3gRVjXBhNP5lAHarQwi9vRgMZ6EdT86adeATYZuTuqbXc6712G5
         vRsrXT6l07hc2JGm4xIiWsJGVfJX16JwQoJQwcsqZWLjY/x/sKIZb6DlSfl43XwyYGWq
         BAe7+2R/Y4v3zI6hXrfkFYnthADOzmSw9GD9IRzDrpCCl4gaLLBUfkoeLXLlO9i4TZGM
         cEBQ==
X-Gm-Message-State: AOAM5334W7h93+/LCyM96GGTM8yv1lOCbYsSvsQX0P1gOD+42Yim+6A7
	2iQRlQNmAQeKkCR+Q2XOIoCcDCCMz/HuWixcUJs=
X-Google-Smtp-Source: ABdhPJzYKEDt5hhzVf+u66Gh84FNHeUGxy5qvnNXkVFWbgur7M5wwqSJBY1mmAI3UEQZfSCkTTmNaSHGbXpc9zrgcGc=
X-Received: by 2002:aed:23fc:: with SMTP id k57mr4829104qtc.216.1601687056728;
 Fri, 02 Oct 2020 18:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAFR_W8q+7wJegtG-CNAxur=+EMi2jXKoP80=KuyqBY-zMkbLTQ@mail.gmail.com>
 <CADkTA4PYpOZwrstc6XcF_J3j0aRwEEAWZwRT==JMFJ0p==d_FQ@mail.gmail.com>
 <CAMKF1soKALxESKSnmS7HDRRnNcJD3ratQOVVvqyd-K=iebu4TA@mail.gmail.com> <CAFR_W8r8P+=OC3pNuzthPiYzHvdk2jBK7JOAvr+wjd1JHKFcJA@mail.gmail.com>
In-Reply-To: <CAFR_W8r8P+=OC3pNuzthPiYzHvdk2jBK7JOAvr+wjd1JHKFcJA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 2 Oct 2020 18:03:50 -0700
Message-ID: <CAMKF1spCwaGKcG3LDw15pTjRJwxzQ17RhpAyA5c8NyZOYdO-FQ@mail.gmail.com>
Subject: Re: [oe] Tracking dependencies on kernel configration
To: Maxim Sloyko <maxims@google.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 2, 2020 at 2:21 PM Maxim Sloyko <maxims@google.com> wrote:
>
> On Fri, Oct 2, 2020 at 1:21 PM Khem Raj <raj.khem@gmail.com> wrote:
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
>
> Can you please link to a specific example of such a knob? I can't find
> anything like that in that layer.
>

Look at docs/extra-build-config.md

> Thanks.
>
> > but doing it comprehensively for all kernel config options is a whole
> > different game.
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
> -MS
