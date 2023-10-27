Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA676C25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 16:30:27 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.11496.1698424220692231662
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Oct 2023 09:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=F7sw993D;
 spf=pass (domain: konsulko.com, ip: 209.85.222.179, mailfrom: trini@konsulko.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-778925998cbso168323385a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 09:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1698424219; x=1699029019; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MQB7ogEm4ckir233eo97B5P38aNur1qjLBKf0D4X7Us=;
        b=F7sw993DCGYiYJ+6zicQYsDLIeXfbivZYVTeofVhNyARYo2E9F6AhNPhY4dhw8NprY
         uxcOO6nb8MZFR3RsMVhA3tEk+W5ZkZyqL4bKF9Xn3RnzpF/lKezRemqfbR9snbtE86Tr
         UaDe4MoMe2oBu0LlhdxXW3dV2jWgX9zC5IEkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698424219; x=1699029019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQB7ogEm4ckir233eo97B5P38aNur1qjLBKf0D4X7Us=;
        b=UKNE+oElPHiZwo6yhsTPTkKKzgsXOfXZblZO3QVTBbuVOGBb9TgM7Y7mRLBuur/pA9
         q9eDHq4rPOlGuGqfLAA+Uz+AcM70/1EARDH7qb2AYLzcEerTqnMqwaAH0/jXByf+IFbm
         u5ZdehZrzeNuSntMr7bLzx0EdH0LtnI8T2eB1m1Rir8eIuc6AVMJf0CEcJgePYngwcz+
         DuWY/a1ns2CnYiRwWIlOmoseYA4EMOOPpX+7Q+tB8GOCgz7sS7tgg+RMLWOtkV95XYsE
         Lhbf88lD4mcwYhecV1ymNet59UWzVzG1FV+OGHit0Vx46n8emJpV2AwNA9YvXur1Z6v7
         FWAA==
X-Gm-Message-State: AOJu0YxCG9jtvGfey+EZvrvAl6FGlnxJ96h9V9N9qZJ2LPrEFl62wLoe
	8h4cR9xHIGOJ8aJ6ke9p9CNqcA==
X-Google-Smtp-Source: AGHT+IEvgAhTLs/7zGn4sVN9NLSaCiJCGr7fJwxRiLVb+eqlAtlLxLFth+JAVfMx8gA4JIUVZeNHXg==
X-Received: by 2002:a05:6214:2508:b0:66d:3f8b:fd93 with SMTP id gf8-20020a056214250800b0066d3f8bfd93mr4193851qvb.2.1698424219580;
        Fri, 27 Oct 2023 09:30:19 -0700 (PDT)
Received: from bill-the-cat (2603-6081-7b00-6400-6a0e-a72f-3fdd-31b7.res6.spectrum.com. [2603:6081:7b00:6400:6a0e:a72f:3fdd:31b7])
        by smtp.gmail.com with ESMTPSA id mk16-20020a056214581000b0064c1b27bf2dsm723070qvb.140.2023.10.27.09.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 09:30:19 -0700 (PDT)
Date: Fri, 27 Oct 2023 12:30:16 -0400
From: Tom Rini <trini@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Armin Kuster <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
Subject: Re: meta-oe source mirroring
Message-ID: <20231027163016.GX496310@bill-the-cat>
References: <f928e9f7f4e98eeb45db886a70b26cd7c292702f.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f928e9f7f4e98eeb45db886a70b26cd7c292702f.camel@linuxfoundation.org>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 16:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105778

On Thu, Oct 26, 2023 at 03:22:26PM +0100, Richard Purdie wrote:

> I'm happy to say that meta-openembedded source mirroring is now working
> via the Yocto Project's infrastructure and available through the
> project's source mirrors.
> 
> An example successful run with master is here:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/19
> 
> Nanbield should also work.
> 
> kirkstone is here and is now error free but does show a lot of
> warnings:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/27
> 
> dunfell is also error free but also shows warnings:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/31
> 
> I did have to disable two recipes as one uses mercurial (the other has
> it as a dependency) and the mercurial checkout format changed between
> versions. The mirrors from later releases don't work with the version
> of mercurial-native from dunfell meta-oe. Disabling it was the
> easiest/safest path forward.
> 
> Currently these are all scheduled to run automatically. If we can fix
> the warnings, that can stay. If there isn't a desire to fix the
> warnings in stable branches, we'd probably disable the scheduler for
> them since we have a policy of no warnings on the autobuilder.

Maybe it's because I'm missing a different step, but I've always had to
setup source mirrors for SCM archives to be in a subdirectory, not just
for mercurial style problems but for hash changes. For example I have:
$ ls -d ~/work/OE/downloads/*/git2_sourceware.org.git.glibc.git.tar.gz
/home/trini/work/OE/downloads/dunfell/git2_sourceware.org.git.glibc.git.tar.gz
/home/trini/work/OE/downloads/honister/git2_sourceware.org.git.glibc.git.tar.gz
...

And then have in my PREMIRRORS:
git://.*/.*     ${SOURCE_MIRROR_URL}/${LAYERSERIES_COMPAT:core} \n \
gitsm://.*/.*   ${SOURCE_MIRROR_URL}/${LAYERSERIES_COMPAT:core} \n \

So that I get the right thing. Might this be closer to the path forward
to solve the above issue? Or is mine because I'm not generating the
archives correctly to start with (and so the mercurial issue really is
special) ?

-- 
Tom

