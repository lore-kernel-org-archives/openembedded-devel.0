Return-Path: <jupiter.hce@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E63C433FE
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 09:39:55 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.7763.1651138790667713099
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 02:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Eu9QPKJN;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: jupiter.hce@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id e2so5947676wrh.7
        for <Openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 02:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Elg0PXsYsw8YAWMoWnwgB1sObyFlLp7Pvoz/CgqlE/w=;
        b=Eu9QPKJNuoCTUblOB4Rq537154MbPEXZbSR4Q2SWJG1hM/FrMxdijZdoHlZLTnEs7w
         vj6QpTHlXpnJkdvn25qfTwFXQUuu0jAu+BiS/+P/DJ/K5KMJEsB4O+0ilKun0anPkFc0
         DcnmSAxpG1mlFSgZIKIXLgdPwFHHaFUjAxtTku8FJVG5iyWDXmIdSybu6fUcqHGDbj0v
         ykaWLuBAT0brh3K/m9/H8OMUU1JQ/jl7Ff4BaM4NUoKhHA9grPkl044S6BPp0tDdx1BH
         f8oNXQblAzrx197otiGLPol5ba2Lz7i6qtM9qpsbM3xvg4p4f6rjohW1HzJF3iK1w/2M
         sRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Elg0PXsYsw8YAWMoWnwgB1sObyFlLp7Pvoz/CgqlE/w=;
        b=BBK3FtpeONsY1cgn8lElGLOrzWk7+iVdqOk88OJSi+oatX8hA1wXzJSwq0GcnHnHY2
         VoJ8UDC6bw56SimbuX+QWUX1+7wg38YH/VvVJNShmudcD+w/QxPaXCSmjeqd22moV2bB
         L4pSRQ4uqL5eGhT1IoqRKvEo2nHAhHfkayM5iLF6V7NtepK9+9VgF9gTu3/fgvNHsSNN
         +tAmp6cNLr6c+e1aJNl/C3A9Z/ivyeJGGSiq7nXQ4+I2Z7V3lMjPyKFDtPYoXGFXslci
         LjBvJearRGZLMq/3PBjTUMMvMqdn36Z3NbEFE09aMCrSEAG1bf8rzJnBhDBUGpqF5hOo
         dUrg==
X-Gm-Message-State: AOAM5334hfUZUASvLMGuxjnkFqC/ep7GwQNyWy9jnugdAth2FunV0VOs
	gKctqEvOmhrAnBQGJMmGHPcYUMYot+VhiuqajFg=
X-Google-Smtp-Source: 
 ABdhPJxlcciiLBZJit2M3H9mmpkcwH2YCLmr/nbZK3LYk3nZYtWNsdlbuwUIEKuzzOZu4jI4WO+ZnxLbmuFpLkcc8kM=
X-Received: by 2002:a5d:4e08:0:b0:20a:f065:7024 with SMTP id
 p8-20020a5d4e08000000b0020af0657024mr5684084wrt.598.1651138788935; Thu, 28
 Apr 2022 02:39:48 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAA=hcWSv7=gctvWYXSaJTqi=y=G9Zr8Jr01+5vVUcGSsPJM9vA@mail.gmail.com>
 <CADkTA4McF0vDHBX+gtFnFXLHF5+eyfFZCjPs4DP2B5C0zcSsVw@mail.gmail.com>
In-Reply-To: 
 <CADkTA4McF0vDHBX+gtFnFXLHF5+eyfFZCjPs4DP2B5C0zcSsVw@mail.gmail.com>
From: Jupiter <jupiter.hce@gmail.com>
Date: Thu, 28 Apr 2022 19:39:10 +1000
Message-ID: 
 <CAA=hcWTrEkw+xPDFzKqNMM264aOoqiJXvyU9209m5xhEBEts+A@mail.gmail.com>
Subject: Re: [yocto] How to force build system to use a working kernel
 defconfig?
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: yocto <yocto@lists.yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 09:39:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96838

Hi Bruce,

Thanks for your response.

> You can't suppress the kernel's config step, it is always going to
> run. You can't just copy over .config and have the kernel build.

If the OE build kernel config step can be disabled to compile kernel
using customer defconfig, that will make users life much easier to
disable unwanted kernel drivers and features.

The customer defconfig can be certainly generated from bitbake -c
menuconfig, but honestly, the kernel configure selection is not easier
to understand, we have to use defconfig to disable unwanted the
configures and tested it, inadvertently disable some configures could
cause kernel panic regardless if the OE build system config step is
running or not.

I have searched the internet, it is not just me, there are many others
who requested to run customer defconfig without OE build kernel config
step.

Are you a contributor in the OE dev team? Are there any reasons why
the OE dev team won't consider this feature?

Thank you very much.

Kind regards,

jupiter

