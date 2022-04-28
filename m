Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B234FC433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 11:44:46 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.8893.1651146279352086948
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 04:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cpAqZN/t;
 spf=pass (domain: gmail.com, ip: 209.85.128.176,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-2f16645872fso49785397b3.4
        for <Openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 04:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tEhojiAn1sYgtSQnQao3W4PPYmAiVsYOYIvz/3YbhdY=;
        b=cpAqZN/tYasLSv0P5mJ5h4lD/09FMp2gyPofEXCpHb6LK7vUI3GcJijp/csU6Ntur/
         3P0DdN0HIwrJbvqiFgoBe4dCrdJdmk2mOQRyVge+8EnrwteiWvt7aEZa7RxHeHSaHz/B
         yRt8d+DIcHc/STu4OoCOPt2dX0cSsJn2fsdkHhuRhA3RNbmm8QWPWngt3U2XODJJGZoC
         5JFyrFb+9fZdA+VNx8eRW2Gomgew7UBo8e8eKLtVR8AzUVEbTHcPcflnsnLUXrDVkyLF
         D7q2rpKjBA8Yeo6MNQQO0u8B5c/MAuZ/wGtYccn6+rv5C3X/2VArLdkOj2cqNuexCeOF
         CA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tEhojiAn1sYgtSQnQao3W4PPYmAiVsYOYIvz/3YbhdY=;
        b=LP/ubDJjZUYJAiO5tA/Ivd7a5es+2fAt+VIAcuDlyWrM/3HHqDf6QaM2KZvFaEyYw4
         Ex8maSIHtc1ZsjlR7WLqkqxPxpxGNjR+h92tAdmLyPuANV/swoZYGUlgySMWKjd53s6M
         KhqIWM+Oe2ma0ssgcOdNfRz7JYB7foEmGrRsjeK79jeMBpgvHtrXVIbSEtlEBbOeDIbi
         anfPomEyAvoVhtutZGcKkAeCvF8g0AU9wlCnmDdFs+l2c2zM4q07y1TcN4PMbQrLRc3g
         9XYkLiKbicMeHCCCYHacpCHAlrdXzgD0qcRlLINKzknAdt4dJQjSLCpQnq1lE6o8ffkl
         pfAA==
X-Gm-Message-State: AOAM533F+qj+M+0uHBgozExzUs6uZGbbsl6sYzNFYDmMF5Fd21t6bJLa
	eeafEV9N7ZYL3KaLWoPQ1B6ddjoQQy7TeDqGxVMqNRjNYoE=
X-Google-Smtp-Source: 
 ABdhPJwkZBCAAGSmpgUq89h/LMCGc8kuEsuHXHTT0931h8RDXHBO93Gxh45ysYfdd72uhhndT2qeJ6NDjvZwXBAXCoQ=
X-Received: by 2002:a0d:df08:0:b0:2f7:d206:1f75 with SMTP id
 i8-20020a0ddf08000000b002f7d2061f75mr23250719ywe.182.1651146278476; Thu, 28
 Apr 2022 04:44:38 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAA=hcWSv7=gctvWYXSaJTqi=y=G9Zr8Jr01+5vVUcGSsPJM9vA@mail.gmail.com>
 <CADkTA4McF0vDHBX+gtFnFXLHF5+eyfFZCjPs4DP2B5C0zcSsVw@mail.gmail.com>
 <CAA=hcWTrEkw+xPDFzKqNMM264aOoqiJXvyU9209m5xhEBEts+A@mail.gmail.com>
In-Reply-To: 
 <CAA=hcWTrEkw+xPDFzKqNMM264aOoqiJXvyU9209m5xhEBEts+A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 28 Apr 2022 07:44:26 -0400
Message-ID: 
 <CADkTA4M7_+X06P3ahtt4edRiMTUNXS7-dVKTkRknAD2MtNtSOA@mail.gmail.com>
Subject: Re: [yocto] How to force build system to use a working kernel
 defconfig?
To: Jupiter <jupiter.hce@gmail.com>
Cc: yocto <yocto@lists.yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 11:44:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96841

On Thu, Apr 28, 2022 at 5:39 AM Jupiter <jupiter.hce@gmail.com> wrote:
>
> Hi Bruce,
>
> Thanks for your response.
>
> > You can't suppress the kernel's config step, it is always going to
> > run. You can't just copy over .config and have the kernel build.
>
> If the OE build kernel config step can be disabled to compile kernel
> using customer defconfig, that will make users life much easier to
> disable unwanted kernel drivers and features.

This has nothing to do with OE, that's what the kernel would do
no matter how you build it.

>
> The customer defconfig can be certainly generated from bitbake -c
> menuconfig, but honestly, the kernel configure selection is not easier
> to understand, we have to use defconfig to disable unwanted the
> configures and tested it, inadvertently disable some configures could
> cause kernel panic regardless if the OE build system config step is
> running or not.
>

There's a reason why kernel-yocto (and other frameworks) provide
things like configuration fragments, kernel types, etc, This is a well
explored topic. Check out my (and others) presentations about this
throughout the years of yocto summits, etc. They can all be found
online in various formats.

> I have searched the internet, it is not just me, there are many others
> who requested to run customer defconfig without OE build kernel config
> step.

It can already do that, just as I described in my previous response.
The defconfig is copied in, and then the kernel *will* run its configuration
process over it, not OE's, the kernel.

>
> Are you a contributor in the OE dev team? Are there any reasons why
> the OE dev team won't consider this feature?

See above,

Bruce

>
> Thank you very much.
>
> Kind regards,
>
> jupiter



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

