Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BAF7C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 20:40:47 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web12.34167.1660768838772873369
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 13:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XGP/Wjpy;
 spf=pass (domain: gmail.com, ip: 209.85.208.174,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id v4so1368961ljg.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 13:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=PSdlQvdCFjbc6hjVYF3mIjHKdv/X9CU+s6TShSQPbEc=;
        b=XGP/WjpyYfo7QOTVHMfIrpgsAx7vDtah/uXC85EwFcGyOrwdk/L+nZl034BPTElO+i
         A3A6kKKJm6GzzauLZhcazYDHcjXjFmiHwTPwhKs/b9XMqy9bQOADf+LKQ5Dn0qhUAiD6
         IyfVK+T8PRbGKB0N/xYkaA0//JC/yTy+pfuZxPWHP0uHPJ64HPTELWIOepdOBqz/PwO+
         7bH8OEG3hdAGCrVm9zXrzkUwZj2RLBI6mMbW7pZU2F+ALnVXrZW/qlcMkT16PT5qzlPy
         JDpnmMZP0QVeYH8NeYgO3edvrLn+JaA4nYtjiS8zXsf4AY4gCILjleLG/3nu5GDlQmcN
         O4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=PSdlQvdCFjbc6hjVYF3mIjHKdv/X9CU+s6TShSQPbEc=;
        b=oJr4k9qEpl3VK1xPAsotYyB7b6J6XQXcOb6jjVnMj+4L4X0DyM/49sNBu6GmJjNhaW
         waw4GAtYqEhDKoeRfvy8jKtQLtlrUr3vussmQMp87V3bBhBcmaGSusj59WtdxtgSWhBy
         bB9n5kP/Fa0RHR8aIuroAzECioaLFuR3lHDAed0NE/nH0yknPoQw4l8nNhXb6zBQA3ny
         N9PlMH+KwUxDUh0jzTP6CLCKRZamZ64VHEm54HeFEFyzO1qua/QIHt3V1ehcBGEhBnr4
         Pn1+vtCBKl096xpoYAfGpopAp1Qas7RQDj0ypzFkmd3VKBHfCp4qSydJap8Ryyp/dFVy
         uwqA==
X-Gm-Message-State: ACgBeo0hV/Vy3Fqc5+KHD2BGv+zC/ctYTvufboZi93hS4GlQSHHl5KQI
	pCF9KosCocCbXz7216DieuMmMdanUNOtBlQzlac=
X-Google-Smtp-Source: 
 AA6agR6Sk0I2kfYtHDxZvMbGhQ/blhvu1Ipm2SysvxglWmrOxLe+XAq1Pzz2fUGzGeLmpQ6ePKBGHCA8RRJF1WnwH8o=
X-Received: by 2002:a2e:9dc5:0:b0:25e:6fa0:1243 with SMTP id
 x5-20020a2e9dc5000000b0025e6fa01243mr8943424ljj.513.1660768836806; Wed, 17
 Aug 2022 13:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <fb208df3-7ee5-01be-5d2f-5d9657528764@blueridge.com>
In-Reply-To: <fb208df3-7ee5-01be-5d2f-5d9657528764@blueridge.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Aug 2022 22:40:25 +0200
Message-ID: 
 <CANNYZj-m28PeJL+S1+wt0f7kOEoOMxB53EOrwXhKAA9Xc6uAUQ@mail.gmail.com>
Subject: Re: [oe] Changing u-boot version in the build?
To: Bruce Johnson <bjohnson@blueridge.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 20:40:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98314

You need to show the actual recipes for the newer u-boot too (e.g.
publish your layer on github), otherwise it's really difficult to say
where the problem is.

Alex

On Wed, 17 Aug 2022 at 22:37, Bruce Johnson <bjohnson@blueridge.com> wrote:
>
> I am stumped by the problem of how to build a newer version of u-boot
> than the one in my openembedded-core version. The version shipped in our
> copy of openembedded-core is 1_2020.01, and I'd like to build something
> more recent. Whatever I put in for my PREFERRED_VERSION other than that
> version results in a handful of notes saying that the preferred version
> isn't available:
>
> > $ bitbake u-boot
> > Parsing recipes: 100%
> > |##################################################################################################|
> > Time: 0:00:10
> > Parsing of 2298 .bb files complete (0 cached, 2298 parsed). 3409
> > targets, 348 skipped, 0 masked, 0 errors.
> > NOTE: preferred version 1:2022.04 of u-boot not available (for item
> > u-boot)
> > NOTE: versions of u-boot available: 1:2020.01
> > NOTE: Resolving any missing task queue dependencies
> > NOTE: preferred version 1:2022.04 of u-boot not available (for item
> > u-boot-dev)
> > NOTE: versions of u-boot available: 1:2020.01
> > NOTE: preferred version 1:2022.04 of u-boot not available (for item
> > u-boot-env)
> > NOTE: versions of u-boot available: 1:2020.01
> > NOTE: preferred version 1:2022.04 of u-boot not available (for item
> > u-boot)
> > NOTE: versions of u-boot available: 1:2020.01
> I've tried various spellings of the PREFERRED_VERSION string: 1:2022.04,
> 1_2022.04, v2022.04 (the actual tag in the u-boot repository),  2011.04
>
> My meta-openembedded-version is from the dunfell branch, hash a62ad779
> (if I'm looking at the right thing).
>
> I did a similar thing with ModemManager not long ago and didn't have a
> real problem, and I don't understand what's so different about u-boot.
> Thanks in advance for any suggestions.
>
> --
> Bruce Johnson
> Chantilly, Virginia
> USA
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98313): https://lists.openembedded.org/g/openembedded-devel/message/98313
> Mute This Topic: https://lists.openembedded.org/mt/93091149/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

