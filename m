Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
 by mx.groups.io with SMTP id smtpd.web10.3696.1601667791357759935
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Oct 2020 12:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=X1UHh5kG;
 spf=pass (domain: google.com, ip: 209.85.219.194, mailfrom: maxims@google.com)
Received: by mail-yb1-f194.google.com with SMTP id h9so1975821ybm.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Oct 2020 12:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lloVTTHQ41t71IzXwq1mmR89tZuwk1jYh03kfcZVfPA=;
        b=X1UHh5kG7TCDEEddLAOvFSeSlaPAWHaB5yxWJdi0ZEWaZAlXPjt4PbsHcB7lAHVd1G
         Uo7uAbIu7EXnP5/OtvFZgq/bHUSLnIDJIneUfahaLQJe7wuvk2dP3iGVL+b0zjlsnn/W
         8NMhK3uJ9PfwdpRHhDDL6lP+sJ+cM0oXHULXpv9AH4iJ9CY30WLsvD54N/YlkRNuRcGg
         Dx9p/NhSS3qtRdbbBzvLnciPT8e3UKKlnXe9Fyt5tzeeFPIAVe6EJ55Oz+yfqmYjGYqf
         LVBgJ3LE5qaOEU7nKzmqYSt29qflowWlSjkNIghk8mEFy6oB3ag5eq5YquJBGwqn84ww
         UtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lloVTTHQ41t71IzXwq1mmR89tZuwk1jYh03kfcZVfPA=;
        b=BGY3bxf2jfvJxZhiS5JXU+Loby3bKFNAEDL3zDl6f4ONhdH0qXcC9MHX5LX7+MXXTt
         NtK2Cli8wiovaQoCI5TBO2yoAV9YHl2VJXGh0k13/TzR9adayQ4HH1JLTZUI40SCt2Qx
         2yPlzyBKwq9R0HYriZowUHLGnbkHTwMyoUY/+8PulCow/WMdJEm6WCGc/9H9fOXa5sCP
         PvFBzeOO/0H8NmJEe1KM2bqLwMf/OTYgFAMLHqsHilImv70oBxuSpDafcT9wrC5hgIkl
         P9Mi60CTGvrJBuKzJbFwdxVV3fd2MeO/PmR6h0xo0vatYdJwNtB3JlYmWZ12AEIEP6SR
         PQrQ==
X-Gm-Message-State: AOAM532TMhhWBGOWnfuq4XuQBbXPcRwAKQziQyh5wuGkdMYUE2Sahjzm
	wjG3qDlstu55Tqs5V84hdRfRGA52NZy0JWLqdp//5Q==
X-Google-Smtp-Source: ABdhPJzI3MWTSEpuZKa3irgNFtIrqNXVGeqAvV03c+n1u6KbParT5jKHoS2a9+Iax92QWbDq+f7RlURkVPwiUKYRV9E=
X-Received: by 2002:a25:500c:: with SMTP id e12mr5189893ybb.125.1601667790265;
 Fri, 02 Oct 2020 12:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAFR_W8q+7wJegtG-CNAxur=+EMi2jXKoP80=KuyqBY-zMkbLTQ@mail.gmail.com>
 <CADkTA4PYpOZwrstc6XcF_J3j0aRwEEAWZwRT==JMFJ0p==d_FQ@mail.gmail.com>
In-Reply-To: <CADkTA4PYpOZwrstc6XcF_J3j0aRwEEAWZwRT==JMFJ0p==d_FQ@mail.gmail.com>
From: "Maxim Sloyko" <maxims@google.com>
Date: Fri, 2 Oct 2020 12:42:59 -0700
Message-ID: <CAFR_W8qXXWtuW3vLWGz+-=nAXgJ9kbmfTD2a=9yFesgX8adE0A@mail.gmail.com>
Subject: Re: [oe] Tracking dependencies on kernel configration
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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

OK, that makes sense. Thanks, Bruce.

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



-- 
-MS
