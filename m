Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.3494.1612495623529263360
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 19:27:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qn7geUqI;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id n15so5656974qkh.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Feb 2021 19:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yq2C9vsvx4YZELkIxv6a2MT8/emGA3L/baUH6KcBiho=;
        b=Qn7geUqIdssrwsNN7o/ck4AeDQOW+gkUT1+lWwslrmbk6409Jpdv4EFvBecpYKeH8C
         i5IY+1ggIlpQ8aixO6eVyT2szWmIax8MdN8KbY+d0SIwX5BBdERA+SGvGc6s6ceiDK9U
         hQ902goL0QOh5T++tmyuWIwmvn+UDbGDqLEtaPoESVIsXMWZv7kPMRQMqATXjiPOdAb2
         DnvirTtDWcLdAbjkMBOyU+CWQf8Ws2egC/uRCfOz+0pfFsvGKKallKh4G8ZKNPd7qzo/
         51VSsc1FH1uz133JG7Hqix2NldBT/97tbXJ0kLRTXH8x1y3DlMiYwjBtGNEuGXNdvf0U
         v95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yq2C9vsvx4YZELkIxv6a2MT8/emGA3L/baUH6KcBiho=;
        b=caPifxtZQkXEMi+5b7gDB+ZghPotv5kNTgeBI7EoD4YMA95oTGor7Wkf4VSSVFur10
         J9fN8Ev3WHpLzyxK3ReA8Mk/BhA05WHbqOdlvdd48JHVnAT/gL6ZBlnimcD9nqjM+WU/
         Q1rg8zynVp81YdX+xtfXbrucdm1gQLgfSvUTMO/K3CDfEkDhkSimstgrbNfwkLp40Qg7
         DWh+TbwWbSRiJpN0nyoA+J8YucV/Xr8o0CVKp5vH1BAMOfEe4Z0RjPPapa6HuvLicNxu
         DF0apqXB0Sa9uaRoUmrwVqHIdTVqp7+neVTmb/08V0zDv72FDMkYHaSvsAOXm301dmOc
         1nmw==
X-Gm-Message-State: AOAM533xR2a2WUTan9O3hFTPO4mRKeeNM4YF2J15kB0IxDKwTqzUzsLo
	L0Xw+qOod9tuF7ctt6tVCLEAVxpYIlJVmFtJxpI=
X-Google-Smtp-Source: ABdhPJwwThonUaoKUSiAVJ+p3ucI6t7zBRtBJusy+bW2mu12BTwy2k5grntcICCtvXb9s+yVxMCeGGSTcLc9GpIYcxI=
X-Received: by 2002:a37:b346:: with SMTP id c67mr2528832qkf.212.1612495622678;
 Thu, 04 Feb 2021 19:27:02 -0800 (PST)
MIME-Version: 1.0
References: <8f242d61-4dea-070a-217d-657e2204a807@windriver.com>
 <CAAnfSTsku9yTFYKCMVkmKq=77V8XGgq9pdO5n_PPb_ttHWnd3w@mail.gmail.com>
 <3aeac6ad-c5cc-dba9-2c3e-6caaad82aa2d@windriver.com> <5a73bb02-18ae-a7ea-c55b-d650db4d97a1@windriver.com>
 <CAHtQpK7P8JbrKCS-xMmgUu-rEUW1wbgJau+_93O9eP_+wgM_LQ@mail.gmail.com>
 <c6849b7a-5dc0-ced2-b6d0-a0e6f9ec72f6@windriver.com> <CAMKF1soXQNO8Jx_iHN+3rGam6qNJ1SsUyPXZgHv=F7NyGgwpOQ@mail.gmail.com>
In-Reply-To: <CAMKF1soXQNO8Jx_iHN+3rGam6qNJ1SsUyPXZgHv=F7NyGgwpOQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 4 Feb 2021 19:26:36 -0800
Message-ID: <CAMKF1sr-fsVGdCegDri4Vy7cJK8AZ18M6X8E76XThfi7C34KLQ@mail.gmail.com>
Subject: Re: [oe] Help with dealing with autoconf uprev affected packages?
To: Yi Fan Yu <yifan.yu@windriver.com>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, hongxu <hongxu.jia@windriver.com>, 
	Randy MacLeod <randy.macleod@windriver.com>, "Chen, Qi" <qi.chen@windriver.com>, 
	Ross Burton <ross@burtonini.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

We are now left with 15 odd packages

https://errors.yoctoproject.org/Errors/Build/116395/

On Thu, Feb 4, 2021 at 1:47 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> here is latest list
>
> https://errors.yoctoproject.org/Errors/Build/116365/
>
> Just look at the do_configure failures for filtering to autotools issues only.
>
> On Thu, Feb 4, 2021 at 1:09 PM Yi Fan Yu <yifan.yu@windriver.com> wrote:
> >
> > Andrey,
> >
> > i am working on this now.
> >
> > since you already submitted iperf3, i'll focus on
> >
> > libmcrypt.
> >
> > i'll test and build both of them once i figure out libmcrypt.
> >
> >
> > On 2/4/21 5:45 AM, Andrey Zhizhikin wrote:
> > >>> - iperf3 - YiFan
> > > I just sent a patch for this one:
> > > https://lists.openembedded.org/g/openembedded-devel/message/89274
> > >
> > > YiFan, can you please have a look at it to see if it fits?
> > >
