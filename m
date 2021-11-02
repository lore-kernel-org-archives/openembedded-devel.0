Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E199C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 20:20:53 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web12.876.1635884452118086201
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 13:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f9XAR5da;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id h4so380233qth.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 13:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kauood34IKD3eP2RMgNS4RuWCH6tFvCDSpze3B30lNE=;
        b=f9XAR5daiBcfqlmWF2Ngm/CWYJkCn+tx2T0EsoioRdlsJ784CnIejyETp1U4R1jT5B
         Wzx0gmSrxbgLKfpOTytzIxBR4soU/pV+nU+lwMLvNRcrCMUuw3QasqniqbM3Bk9Hv/eW
         gTh9SR90bQUChF26aEhOq5IQU6kZ4YFpMvxI77DFPSbVwM71HXqACeuERHE2ku7zRKn2
         LbnDyHp38nA4K1WCSknAyokaUxSAvMBxIOFOBcNMU0hjKMacuIHoW/0p+Zq6a6XFtd7b
         Tmqq0j8bI/9AIeQqz7kWHVDLF5txH+kSoMByXZVAU9H3yJTzTqoHetuFe1oe1bs9IcOF
         iSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kauood34IKD3eP2RMgNS4RuWCH6tFvCDSpze3B30lNE=;
        b=5Ko8sVadL6bp0/Y1QpX2qod04XY3leB5KYRXCwk1CaKMCNP5cWw2DMRF+2/+to3+A6
         pHna6hB6jq4POpFWEAVeennYdt9BTKkW/6mLDBIROZNfigN2G38o/OuqGmxeJKbfRKch
         qkRAgwlaIR+iVFWvacog5GWAnMFCK7RHsdeqcpMzvkTH7Oa8GYHB7SVUsT5aLMKSIrVs
         NEFPGTYSOXgRAqpyfXiurG81AXKwO8n6D1zctd1u9nOtKCYXoeTTj1UIymPuD7qMxEjs
         XfsubxABR2qG/HNbqH8YePkXJ7bxrxqAk+/RAR7DVDmDqmBRxMc5EHXXovdxWWFsyEP0
         MiUQ==
X-Gm-Message-State: AOAM532sDP7b6ADwK2R5XN0IdSTonq4puF309qCcT0D6rbIAs1Uhk6DC
	LyWM/gB5eLI2dow+TwDNHYBT/GdJ8txlqqM4Buw=
X-Google-Smtp-Source: 
 ABdhPJxxR9uv7WRhn3hiIJZ7zQB+wd1ifmOo8kqymoZE+g5tia1YkCaeYLHtGEkQQPR8LzFJu7nBrr46wWUxbaDx+V0=
X-Received: by 2002:ac8:4e93:: with SMTP id 19mr11795325qtp.116.1635884450963;
 Tue, 02 Nov 2021 13:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <432b09f9a07b493fb9191eec798aa07a@axis.com>
 <083fee51-9dd8-c9d3-7f27-90f41e8d261e@gmail.com>
 <c904695823484f2fb1ce9df4e14d0f6e@axis.com>
In-Reply-To: <c904695823484f2fb1ce9df4e14d0f6e@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Nov 2021 13:20:24 -0700
Message-ID: 
 <CAMKF1sqjFtq5jTNLHDVg6uNcj-uLm0uEGwxFNLW4PqciaUq+Hw@mail.gmail.com>
Subject: Re: [oe] Is it time to remove opensaf?
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: akuster808 <akuster808@gmail.com>,
	"OE Development (openembedded-devel@lists.openembedded.org)"
 <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 20:20:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93793

On Tue, Nov 2, 2021 at 1:11 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: akuster808 <akuster808@gmail.com>
> > Sent: den 2 november 2021 20:41
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; OE Development
> > (openembedded-devel@lists.openembedded.org) <openembedded-
> > devel@lists.openembedded.org>
> > Subject: Re: [oe] Is it time to remove opensaf?
> >
> > Peter,
> >
> > On 11/2/21 9:33 AM, Peter Kjellerstedt wrote:
> > > I am currently working on patches for OE-Core to report QA warnings
> > > in case some directories that are expected to be empty have some
> > > files installed into them. As part of the review process, Khem
> > > reported failures for some recipes in OpenEmbedded due to this,
> > > opensaf being one of them.
> > >
> > > Now I have tried to build and run opensaf in a QEMU image, but I
> > > cannot get it to work. The sysvinit initscript relies on
> > > /lib/lsb/init-functions, which AFAICT has not existed since lsb
> > > was removed from OE-Core two years ago, and opensaf has never
> > > depended on lsb in the first place. As for systemd, the service
> > > file uses the same sysvinit scripts so it has the same problem.
> > > And in addition, the script is in /etc/init.d, which
> > > systemd.bbclass removes unless both sysvinit and systemd are
> > > enabled in DISTRO_FEATURES.
> > >
> > > And in addition to this, if I just try to start the opensafd binary
> > > it seg faults immediately.
> > >
> > > So all in all, even if opensaf has been updated regularly, it
> > > doesn't seem like anyone is actually using it. Which brings me to
> > > my actual question: should I just send a patch to remove it?
> > >
> > > Alternatively I can fix the creation of the /var/log/opensaf
> > > directory, which was the error Khem saw with my patch for OE-Core
> > > applied, but it seems like wasted work in case no one is actually
> > > using the recipe...
> >
> > Thanks for the analysis. Does the current mechanism to blacklist a
> > recipe help possible finding users of this recipe?  Is your concern
> > carrying this in the next LTS as well?
>
> I guess adding a PNBLACKLIST for it would work too (I have never used
> it, so I did not think off it). My concern was mainly that I had to
> spend time on fixing the recipe to support that /var/volatile is now
> checked for being empty, for a recipe that apparently is broken. So
> if a PNBLACKLIST helps the next person that does changes to the system
> from having to care about the broken opensaf recipe, then that is fine
> with me. ;)

Generally, I would refrain from excluding recipes via PNBLACKLIST if they can be
brought to support whatever improvements we are doing in Core or other
dependencies
thats the price of accepting recipes into a layer in the first place.
If its broken such that
it can not be fixed then we should perhaps exclude it.

It was added via below commit, so perhaps Bian could be much better suited to
say if it is still in use or not.

 commit e18830c2b4323487f9afa5205f13579903c7f9d4
  Author: Bian Naimeng <biannm@cn.fujitsu.com>
  Date:   Wed Dec 31 16:22:06 2014 +0800

      opensaf: add recipe

      OpenSAF is an open source implementation of the SAF AIS specification

      Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
      Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
      Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>


>
> In the end I did send a patch that changes the opensaf recipe to create
> /var/log/opensaf in runtime, by copying the solution for one of the
> other recipes I was fixing. So I am in the clear for my change to
> OE-Core. But opensaf is still as broken as before when it comes to
> actually starting the service...


Thanks for fixing the bunch of recipes for this,. Really helpful.

>
> > -armin
> > >
> > > //Peter
>
> //Peter
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93792): https://lists.openembedded.org/g/openembedded-devel/message/93792
> Mute This Topic: https://lists.openembedded.org/mt/86770394/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

