Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.380.1612809926205364987
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Feb 2021 10:45:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jl/1KZef;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id t63so15517605qkc.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Feb 2021 10:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FH3FQvBxcYKfCjLJ2UwGT/hPfxINvKnWpM9130OY36I=;
        b=jl/1KZefR6AvIpGCjzoISIzR1ZZa9dbOI7NMUxdPXet6p58N+i4XCVOp20h/XPC9qd
         ZCMfkSbWHu5qqc6bNugjZBbw4euSO0Qh+/IF7cjbEQp+IgTgONGBIgIs0EOugabRs78U
         y6asKmAXUv4ww++F1cDgZ9F7jKGuKhMr52eyxIx7TI8kjOExEahxYH7lpf7mnnJ1v3mc
         3NRR09MAIsUvOOJFfIfr4StXANlsFq+qebsBL3I5TV83Sglx0LfSY9HsaQM8dDp7x/t6
         ViUdFcRZ5o9eV270gox01gNw4r+rANMMTObfrESSTvqdb65Pdk/lmzgWIr/lEinBCKQv
         3NDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FH3FQvBxcYKfCjLJ2UwGT/hPfxINvKnWpM9130OY36I=;
        b=I0Xf9hwLUK8Y5qncwP5cu3GAV0aSYxC7moe15CJzY6ozgbNvoPq2+50kPf3SKvANtk
         LAT8ftsoshr5nOKrFP1REs2r+/y/CEbqPNswak1IIsKHzSdLFKtNvk5khNDp0ypM32i3
         ibUO6lI8S4EdWT47e/iRr3sV4khQTsOygVZQL3revRP/rPk6P7XRvP/DVlxA7Yt1k1bK
         J6IImdNdhu8/j7z30oKDUZMY2RUi5DcL7sdEalQUMnZmi5jIOYxhj9pVlq16Wbtue1L5
         5XJRT8wJ7V6Mh5LJD3ke3vdjfS5FWH2zKn19vESlNI1ivbgQuGhXNDH1Q6TE5smmokec
         34UQ==
X-Gm-Message-State: AOAM5335Pk9W4//9sEgX0/QODo4RkETwN1fvcbwTRBKV2DgQueqs8o2G
	So4KUX5AXULaXG2b1vZnzt2PfG5/eu7R1Q2HlFQ=
X-Google-Smtp-Source: ABdhPJyVws2A5NM67wmTyATSW5Y60OGWEQQDcyYrrCSiXgYvm0k8yD1mtv0TxiOPSyHQ+Nz9My3twDIKg0Bgv7aN+3k=
X-Received: by 2002:a37:7047:: with SMTP id l68mr17377742qkc.337.1612809925203;
 Mon, 08 Feb 2021 10:45:25 -0800 (PST)
MIME-Version: 1.0
References: <8f242d61-4dea-070a-217d-657e2204a807@windriver.com>
 <CAAnfSTsku9yTFYKCMVkmKq=77V8XGgq9pdO5n_PPb_ttHWnd3w@mail.gmail.com>
 <3aeac6ad-c5cc-dba9-2c3e-6caaad82aa2d@windriver.com> <5a73bb02-18ae-a7ea-c55b-d650db4d97a1@windriver.com>
 <CAHtQpK7P8JbrKCS-xMmgUu-rEUW1wbgJau+_93O9eP_+wgM_LQ@mail.gmail.com>
 <c6849b7a-5dc0-ced2-b6d0-a0e6f9ec72f6@windriver.com> <CAMKF1soXQNO8Jx_iHN+3rGam6qNJ1SsUyPXZgHv=F7NyGgwpOQ@mail.gmail.com>
 <CAMKF1sr-fsVGdCegDri4Vy7cJK8AZ18M6X8E76XThfi7C34KLQ@mail.gmail.com>
 <86f09202-225b-ceee-ebfd-1f4ad3be20c1@windriver.com> <c925fe41-3563-e817-b525-011c82111b58@windriver.com>
In-Reply-To: <c925fe41-3563-e817-b525-011c82111b58@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 8 Feb 2021 10:44:58 -0800
Message-ID: <CAMKF1sqK3=ue0VEVPPX9Pz6=nJfTBPRZb8V-j8DaQF4Ar0Ccug@mail.gmail.com>
Subject: Re: [oe] Help with dealing with autoconf uprev affected packages?
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Yi Fan Yu <yifan.yu@windriver.com>, Andrey Zhizhikin <andrey.z@gmail.com>, 
	hongxu <hongxu.jia@windriver.com>, "Chen, Qi" <qi.chen@windriver.com>, 
	Ross Burton <ross@burtonini.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

it seems things are getting  in shape we have first clean build for
meta-openembedded with autotools 2.70+

http://jenkins.nas-admin.org/view/OE/job/oe_world_qemuarm/2286/console

Latest master-next has all the changes, so please give it a shot.

Thanks to everyone who chimed in with help in fixing the recipes.

On Fri, Feb 5, 2021 at 3:42 PM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2021-02-05 9:46 a.m., Yi Fan Yu wrote:
> > libmcrypt still uses autoconf 2.59. last release seems to date from 2007
> >
> > https://sourceforge.net/projects/mcrypt/files/Libmcrypt/2.5.8/
> >
> > its not going to be a piece of cake...
>
> Yi Fan will be sending patches to meta-oe and meta-virt
> to blacklist libmcrypt, nagios-nsca, maybe hiptopvm
> and change the configuration for php:
> http://layers.openembedded.org/layerindex/branch/master/recipes/?q=depends%3Alibmcrypt
>
> He has also sent a postgresql patch and might wrestle with
> freeradius unless someone gets there first...
>
> Hongxu, aren't you working this weekend due to the
> upcoming Chinese New Year holiday? If you want to do
> freeradius, just go ahead and send a patch.
>
> ../Randy
>
> >
> > On 2/4/21 10:26 PM, Khem Raj wrote:
> >> [Please note: This e-mail is from an EXTERNAL e-mail address]
> >>
> >> We are now left with 15 odd packages
> >>
> >> https://errors.yoctoproject.org/Errors/Build/116395/
> >>
> >> On Thu, Feb 4, 2021 at 1:47 PM Khem Raj<raj.khem@gmail.com>  wrote:
> >>> here is latest list
> >>>
> >>> https://errors.yoctoproject.org/Errors/Build/116365/
> >>>
> >>> Just look at the do_configure failures for filtering to autotools issues only.
> >>>
> >>> On Thu, Feb 4, 2021 at 1:09 PM Yi Fan Yu<yifan.yu@windriver.com>  wrote:
> >>>> Andrey,
> >>>>
> >>>> i am working on this now.
> >>>>
> >>>> since you already submitted iperf3, i'll focus on
> >>>>
> >>>> libmcrypt.
> >>>>
> >>>> i'll test and build both of them once i figure out libmcrypt.
> >>>>
> >>>>
> >>>> On 2/4/21 5:45 AM, Andrey Zhizhikin wrote:
> >>>>>>> - iperf3 - YiFan
> >>>>> I just sent a patch for this one:
> >>>>> https://lists.openembedded.org/g/openembedded-devel/message/89274
> >>>>>
> >>>>> YiFan, can you please have a look at it to see if it fits?
> >>>>>
> >>>>>
> >>>>> 
> >>>>>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
