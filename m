Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E562CC25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 17:09:47 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.12525.1698426583955075052
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Oct 2023 10:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=iDJ8wCq1;
 spf=pass (domain: konsulko.com, ip: 209.85.222.172, mailfrom: trini@konsulko.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7788ebea620so169785485a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 10:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1698426583; x=1699031383; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UU+oaXgjlWAu8DF8jS5RccOfuAZ7fRfZa0UhV7KR3Hc=;
        b=iDJ8wCq10D5mdOhpf67T77IbeaIpP6HWv5drhT/PtnyR7nuL10/JiUfb3gVre4kURA
         eNWGUU70rAYe6pVyhzPLztJ9D+62lWvrpf4ub3HBftEzW54EOmn6D5gsHh1Btr/CthCv
         RjHdTCaHW+D1xrHyLuHKTmELjnhQ8OfuMt9aM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698426583; x=1699031383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UU+oaXgjlWAu8DF8jS5RccOfuAZ7fRfZa0UhV7KR3Hc=;
        b=WIt+V1RLND6BhmN/VJV1BlU/O5fTy9l+x3jKoZz/eUEf9j8t6ff3NgGQrrLf4SzB6S
         DqodRCBDbxt/P2ZSSBMY/ciWjhrekRyRVZP/JhnJ341+Tm2iZvaTlKKuSLHChoBI/k2w
         P/t9IhvHftMBIIDnDjKaDW1+/Pd4ZW4DDkcqxfrm80s/0cldj3lv00jSzFTxn9zXqIcn
         YMbA97eNDc5KarZVji+rjkQU/X4INuKJoTQtRjDgUnDQuOEL+Vb+ZgMfJOUu0g2L130g
         q7/xxFj27QG1Im91AyVv6kjQwo3hzDNMmtCjg6L25XuztNa5lUt9lgi2mPkzZUPXoIWt
         YEEQ==
X-Gm-Message-State: AOJu0YwNLvYIuv3BVYMnqEURO5Zk7lYIwEQT1MDdCrMUlaJQpXybHJpb
	YlT+Bss489y9W0/zt/LcSJi1Sw==
X-Google-Smtp-Source: AGHT+IEA1TSvEP0egpMPglNVVdp2/snNA1yPtFuvFjwgDw5kk0NxmgXmzQx9YbbRCCS3y3T92zuvqA==
X-Received: by 2002:ad4:5c4c:0:b0:66d:113e:5374 with SMTP id a12-20020ad45c4c000000b0066d113e5374mr4359278qva.25.1698426582919;
        Fri, 27 Oct 2023 10:09:42 -0700 (PDT)
Received: from bill-the-cat (2603-6081-7b00-6400-6a0e-a72f-3fdd-31b7.res6.spectrum.com. [2603:6081:7b00:6400:6a0e:a72f:3fdd:31b7])
        by smtp.gmail.com with ESMTPSA id mn5-20020a0562145ec500b0065b13180892sm769267qvb.16.2023.10.27.10.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 10:09:42 -0700 (PDT)
Date: Fri, 27 Oct 2023 13:09:40 -0400
From: Tom Rini <trini@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Armin Kuster <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
Subject: Re: meta-oe source mirroring
Message-ID: <20231027170940.GA496310@bill-the-cat>
References: <f928e9f7f4e98eeb45db886a70b26cd7c292702f.camel@linuxfoundation.org>
 <20231027163016.GX496310@bill-the-cat>
 <b07976f49a6a948c28950f68069bfeec926fe0d5.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b07976f49a6a948c28950f68069bfeec926fe0d5.camel@linuxfoundation.org>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 17:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105781

On Fri, Oct 27, 2023 at 05:53:24PM +0100, Richard Purdie wrote:
> On Fri, 2023-10-27 at 12:30 -0400, Tom Rini wrote:
> > On Thu, Oct 26, 2023 at 03:22:26PM +0100, Richard Purdie wrote:
> > 
> > > I'm happy to say that meta-openembedded source mirroring is now working
> > > via the Yocto Project's infrastructure and available through the
> > > project's source mirrors.
> > > 
> > > An example successful run with master is here:
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/19
> > > 
> > > Nanbield should also work.
> > > 
> > > kirkstone is here and is now error free but does show a lot of
> > > warnings:
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/27
> > > 
> > > dunfell is also error free but also shows warnings:
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/31
> > > 
> > > I did have to disable two recipes as one uses mercurial (the other has
> > > it as a dependency) and the mercurial checkout format changed between
> > > versions. The mirrors from later releases don't work with the version
> > > of mercurial-native from dunfell meta-oe. Disabling it was the
> > > easiest/safest path forward.
> > > 
> > > Currently these are all scheduled to run automatically. If we can fix
> > > the warnings, that can stay. If there isn't a desire to fix the
> > > warnings in stable branches, we'd probably disable the scheduler for
> > > them since we have a policy of no warnings on the autobuilder.
> > 
> > Maybe it's because I'm missing a different step, but I've always had to
> > setup source mirrors for SCM archives to be in a subdirectory, not just
> > for mercurial style problems but for hash changes. For example I have:
> > $ ls -d ~/work/OE/downloads/*/git2_sourceware.org.git.glibc.git.tar.gz
> > /home/trini/work/OE/downloads/dunfell/git2_sourceware.org.git.glibc.git.tar.gz
> > /home/trini/work/OE/downloads/honister/git2_sourceware.org.git.glibc.git.tar.gz
> > ...
> > 
> > And then have in my PREMIRRORS:
> > git://.*/.*     ${SOURCE_MIRROR_URL}/${LAYERSERIES_COMPAT:core} \n \
> > gitsm://.*/.*   ${SOURCE_MIRROR_URL}/${LAYERSERIES_COMPAT:core} \n \
> > 
> > So that I get the right thing. Might this be closer to the path forward
> > to solve the above issue? Or is mine because I'm not generating the
> > archives correctly to start with (and so the mercurial issue really is
> > special) ?
> 
> The idea is that information is not removed from the archives so that a
> newer archive should always have everything the older one had plus
> more. In that sense, DL_DIR should be shareable between newer and older
> releases and the mirror tarballs should to. They don't have to be
> identical, newer ones may contain new revisions, as long as the older
> ones are still there.
> 
> For YP, we only have one source mirror for all releases.

Right. So, I think I got astray somewhere then, sorry. I would have
sworn the case I had run in to was that my archive mirror of say
linux-yocto (so, something that can be painful to refresh from scratch)
didn't have commits / branches that it should, and so went and split up
the source archives per-codename. I did a manual inspection of the glibc
archive above and it looks like it should have everything for honister
and dunfell (and anything else). So I likely really hit the problem of
commit changed and archive just didn't have it, period. So not something
that required codename based splitting. Sorry for the noise.

> With mercurial, they changed the on disk format newer tooling creates
> so it doesn't work with the mercurial-native from dunfell. If you
> ASSUME_PROVIDED it, or update the recipe it would work. Since it is a
> single recipe on an fairly old release (now) I'm not worrying too much
> about it. The mirrors do have the data and people would make it work if
> they needed to.

Thanks for explaining more.

-- 
Tom

