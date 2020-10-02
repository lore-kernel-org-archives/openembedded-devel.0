Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.1973.1601663296269317275
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Oct 2020 11:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gRnlwAWz;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id nw23so3254805ejb.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Oct 2020 11:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cp+X7XIwqgcB5o1nj8jNEV/ChLfA/a11GxSZswhJHPc=;
        b=gRnlwAWzney5w4/xAXcoSo9h03YiYUt+8JFO3PngllSVcM5IMMqAb4ZOVGd4XG2LZT
         46iF076AZePF9lHPFYpS9chuET2AZP9z/y9wjh6M7obIGNUQ5oKbYLiUWP2ZXTx91IMb
         3YAEFIoASSc5il1MSzjkEV2NNV1L3n12qkyvnZDo1WjDWod5rsOjTBHm+Q/sbQF3bFtP
         7aD/gTrfPj0piNcbaWLauoKBDmjSPdesam9o2YC2Wf1Wnzl5gzzk4sY+xkMyWpb/+hdB
         AC9/h5WForgYsMj1hXHsbbHfWdNzTozWaDwTkPb8n4QXR6vc1QN+piLZwaUNA6zgusUI
         fLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cp+X7XIwqgcB5o1nj8jNEV/ChLfA/a11GxSZswhJHPc=;
        b=VBe7Cvsy1dJVFFoZasVOhLCMUsocMbEAhol+LbrKTvgMbjzpcjmKkDPX+nFTrIEyZ6
         1lj+9gq3W1BHaBUpC+RfpATxxq7jA8qsNlkC4tpkL+zJazA7GAqVrNUfKCOSXSFoM/2T
         /5Da/6aLG9XOY/Ao/2HvAbjqiMxkMs+eDQb1BfA2VfAjpxeRK7Wkr1Xlk15OoZYeOYfl
         L/QpAgXOQyBahih59C4hKTcPyapxHBOZ8mpmcHa9UvKd1kzBJ0Jx1r2YtMbfncmDaL9L
         GA7OFORDhlUdTcoByA2LYU6KDApbp60oZ6saTizUFABXpRwCsYd4WGUD3nswmEZPNOqM
         ajrA==
X-Gm-Message-State: AOAM531FV0YYQ2KVexOUrhQoLCLQR2PhbymKWRB0lTvbEajc9jniMxY4
	z86fB4rQyyUlQyp2MhmvSiTnh+q8rDcLDOsNRnY=
X-Google-Smtp-Source: ABdhPJxTqjEC2TopEb03xQQa3g/7Oop5nZVd0/IiIjIBzjccoPxZkI0/0k6c94gY9siNweVThtdMKtQVeTCta/g/a6Y=
X-Received: by 2002:a17:907:11d0:: with SMTP id va16mr1951242ejb.22.1601663294543;
 Fri, 02 Oct 2020 11:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAFR_W8q+7wJegtG-CNAxur=+EMi2jXKoP80=KuyqBY-zMkbLTQ@mail.gmail.com>
In-Reply-To: <CAFR_W8q+7wJegtG-CNAxur=+EMi2jXKoP80=KuyqBY-zMkbLTQ@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 2 Oct 2020 14:28:03 -0400
Message-ID: <CADkTA4PYpOZwrstc6XcF_J3j0aRwEEAWZwRT==JMFJ0p==d_FQ@mail.gmail.com>
Subject: Re: [oe] Tracking dependencies on kernel configration
To: maxims@google.com
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 2, 2020 at 1:58 PM Maxim Sloyko via lists.openembedded.org
<maxims=google.com@lists.openembedded.org> wrote:
>
> Hi all,
>
> I hope this is the right mailing list for my question.
>
> Short version: my recipe (not kernel) depends on a certain option(s)
> being set in the kernel built and certain devices enabled in the
> device tree. Is there a way to make this dependency explicit and make
> my recipe fail, if the kernel does not have this option set.
>
> Slightly longer version.
> I have a recipe that builds a program that creates USB ECM gadget. For
> that program to work properly, the kernel must have support for USB
> Device (SoC specific driver) and ECM and the devices need to be
> enabled in the Device Tree. Right now this dependency is not codified
> anywhere, this is just something one needs to know. I would like to
> codify it somehow, so that the recipe will fail, if the options are
> not enabled in the kernel or if the devices are disabled in the device
> tree.
>
> I've been thinking about creating a special class
> kernel-dependency.class, which would check the kernel's final .config
> file for the options specified in the variable and to the same for
> device tree (maybe using dtc?). Before I do this, I want to check if
> there are existing solutions for this problem.

There's no existing solution in oe-core (at least not that I've heard of),
I'm sure you'll now get a few folks popping up with their custom solutions
and one of those may work in your scenario.

I've actually got a really old feature that is somewhat related to this,
and it can be found in bugzilla.

There's a lot of not so obvious complexiting in getting something like
you are describing working in the general case. It crosses kernels,
kernel providers, kernel versions, machines, sub-machines,
programmable logic, recipe and image configuration space, etc.

The yocto kernel tooling has always had something similar to this
which are a set of options that can be tagged as "required", and if
they aren't present .. the build fails.  It just hasn't ever been exposed,
due to the variety of kernel recipes out there.

The .config is an artifact that we save in the kernel staging dir, so
you can definitely write something that peeks into it and makes
some decisions based on what it does or doesn't find.  The dtbs
aren't dumped into the common directory, so you may need to
jump through some hoops there.

Making that generic to cross multiple kernel versions, machines,
etc, that's the hard part (so I suggest staying out of that mess).

Cheers,

Bruce

>
> For USB Device (or gadget) specifically I found the usbgadget
> MACHINE_FEATURE, but it looks like all it does is it recommends some
> kernel modules. Maybe I'm missing something.
>
> Thanks for your help.
>
>
> --
> -MS
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
