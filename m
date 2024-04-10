Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B07CD1284
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 22:33:32 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.3930.1712788405318980235
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 15:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PK868Gu/;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: beniaminsandu@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e455b630acso18920785ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 15:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712788405; x=1713393205; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nesvpH4V52xCx9Yv/JKQcnrrQ4qxjg9MIq9T621oKRk=;
        b=PK868Gu/djMN7ZhRQpxiaVyU4ge8K2wdgUKoGSw9yzrcNofShxV7HmQVRMSvnLZDrc
         OrVp9EfXDrX6gCfl79khJy0YOv+jBu1vBkd7aWqrOB5xRGG33SPg+3of6p0jXooigp7f
         oGGL4GINk3coDbiSk4IIgNuvLNSZ5bPLQid+9+mtV9CNajCSKUwXy/TzFP53J+RUeZVE
         +c2J+y0ZhyCvXRcYYjioYjx3fSDJ4IHcoip93jgRAgWNeGpHkJj0VN7ycdQe6Fgvq0VX
         v5wipxCbcHBhdiTUnO0KJFnhnspjkaZ/rwYK1ghOGXrVPxH5CXbbc68AERpPmfAi22E7
         HjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712788405; x=1713393205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nesvpH4V52xCx9Yv/JKQcnrrQ4qxjg9MIq9T621oKRk=;
        b=CUmJXFtYMitWqi/fGwh6S2bhQofhTFOClcF+ZlFQN/tK5sJhX3YWYvCNOHo3vXA9xN
         Iz5UYIbiI2yFneFhCdyOzrMXZnSo/nqbU3dM2umid06FazHFly7EBLjD9ZSwSqNeErYI
         BUcbLtik5DIhqHsIRIVxocsR9KP2XSS+ht62gwyNpwHPA36mzi2GqHD9sUtRbJgvtGI4
         OLtjRIgybMJrLN7gDc/BEY/p2/Ph/fiw71Izbvy22X6CNWmcvn3HLsDzO1nnS7AtQL5Q
         Ad1iWUQCgiiwWm0j8SAVsqr9rt+fkJ6EO+WLLWeMOPu89ZJWhUCVrSApvbP2G0ifgz15
         hiNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnO0snSTykhnx8VnR5VEyb3nHcx9f6h3ouo/zEYbhziJWBNF7aXU4YnpUaLb7HVN5f+UhkS8JlhAqp9QJWi340RM9UIAnoZJGTkhKz2R5o/UjKNNMFeNGQVw==
X-Gm-Message-State: AOJu0Yx6b7xGLimjskpPJ8QHKUcaYK0VBWUzJkIlFcipbJxz9/OI861G
	lrsc1qFskbshzXKQ/I67/XiNCVDu2bjZO+unL1Jp4Wtg5+kRUId9p0YvPyCEtXR4gonQMJMR76Y
	LIC8V7JMkwb969FRuGVswweO6oxQ=
X-Google-Smtp-Source: AGHT+IG7k4meQqN/YlTdSuJlpmEBIo73GiVUL/D2VbbLceewgtmHr/BCpim6bcqQOgn7KA8xgPvB8/RMyw8yTQ/H8bA=
X-Received: by 2002:a17:902:f552:b0:1e2:8eee:ca5a with SMTP id
 h18-20020a170902f55200b001e28eeeca5amr4622357plf.52.1712788404694; Wed, 10
 Apr 2024 15:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240405151335.55698-1-beniaminsandu@gmail.com>
 <171250415788.900727.6749515569891043462.b4-ty@gmail.com> <AS1PR10MB56975FD5C4814FCFF378A635FD062@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAMKF1spWnKwYon8a4_op_54uv3pBV9C3L3hH-bXAFaqXP14aqA@mail.gmail.com>
 <CABQJdOGz8GNw0Gx=Yt87jVmocXy_Jkt8dwHsAURnP3SoyATO3g@mail.gmail.com>
 <CAMKF1soSk2xrEAAJWvXM9sy5db8fEGnoowCb1w6icq6+MJrGug@mail.gmail.com> <CABQJdOEvqMyUyaFCbV7pf1B3b1bVxn95LQs-WOAfkS-GQHAXbQ@mail.gmail.com>
In-Reply-To: <CABQJdOEvqMyUyaFCbV7pf1B3b1bVxn95LQs-WOAfkS-GQHAXbQ@mail.gmail.com>
From: Beniamin Sandu <beniaminsandu@gmail.com>
Date: Wed, 10 Apr 2024 23:33:13 +0100
Message-ID: <CABQJdOG1uqi54Mi9UDfJg+WDpYjM0nbiqDKk0nH8nreC14Vcqw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libtorrent: remove CVE mention
To: Khem Raj <raj.khem@gmail.com>
Cc: "Marko, Peter" <Peter.Marko@siemens.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 22:33:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109912

On Wed, 10 Apr 2024 at 19:36, Beniamin Sandu <beniaminsandu@gmail.com> wrot=
e:
>
> On Wed, 10 Apr 2024 at 19:11, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Apr 10, 2024 at 10:26=E2=80=AFAM Beniamin Sandu <beniaminsandu@=
gmail.com> wrote:
> > >
> > > I don't know how that CVE tool is doing the checks, but it's doing
> > > something wrong.
> > > Both the CVEs that are mentioned in the list, have nothing to do with
> > > the current library that is built with the recipe. I am actually
> > > curious as to who is using this library anyway, because it seems to b=
e
> > > some random implementation with a very similar name.
> >
> > Its not random infact, pretty old implementation.
> >
> > > The widely used library is the one at:
> > > https://github.com/arvidn/libtorrent (this is the one used in stuff
> > > like Deluge, and other torrent software).
> > >
> > > CVE-2016-5301 was fixed in: https://github.com/arvidn/libtorrent/pull=
/782.
> > > CVE-2009-1760 was fixed in:
> > > https://github.com/arvidn/libtorrent/commit/eb2203abf51e63b1d5ba0c3e5=
d972936df96c31a
> > >
> > > Maybe we should replace the current recipe or add a separate one to
> > > build the other library.
> >
> > Existing libtorrent in meta-oe is used by rotorrent recipe and I dont
> > see more users of it
> > so question is
> >
> > 1. Can rtorrent use the arvidn implementation ? if so then we can use
> > it for libtorrent systemwide
> > 2. Merge libtorrent into rtorrent recipe since its the only user of it
> > and libtorrent recipe uses arvidn fork
> > 3. Create a separate recipe for arvidn implementation
>
> I have started working on a separate recipe a couple of days ago,
> called libtorrent-rasterbar(which seems it was the original name of
> the arvidn library, also mentioned it one of the CVEs), but it
> currently fails to build the python3 bindings for 32-bit arches, and I
> did not have time to investigate yet.
> If you feel like taking a look, I can send it right now with python3
> bindings disabled and you could add a patch on top, or I can send it
> sometimes in the future when I get back to it and fix it myself.

I fixed the build and sent a patch to add this recipe. At the moment,
I don't know what needs to be done to map those CVEs to the new
recipe, so please adjust if needed.

>
> >
> > >
> > > On Wed, 10 Apr 2024 at 18:12, Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > Beniamin what is the resolution based on ? before we revert we shou=
ld find
> > > >
> > > > On Wed, Apr 10, 2024 at 10:02=E2=80=AFAM Marko, Peter <Peter.Marko@=
siemens.com> wrote:
> > > > >
> > > > > This CVE reappeared in https://autobuilder.yocto.io/pub/non-relea=
se/patchmetrics-meta-oe/cve-status-master.txt
> > > > > So it should not have been applied.
> > > > >
> > > > > Peter
> > > > >
> > > > > -----Original Message-----
> > > > > From: openembedded-devel@lists.openembedded.org <openembedded-dev=
el@lists.openembedded.org> On Behalf Of Khem Raj via lists.openembedded.org
> > > > > Sent: Sunday, April 7, 2024 17:43
> > > > > To: openembedded-devel@lists.openembedded.org; Beniamin Sandu <be=
niaminsandu@gmail.com>
> > > > > Cc: Khem Raj <raj.khem@gmail.com>
> > > > > Subject: Re: [oe] [meta-oe][PATCH] libtorrent: remove CVE mention
> > > > >
> > > > >
> > > > > On Fri, 05 Apr 2024 16:13:35 +0100, Beniamin Sandu wrote:
> > > > > > The CVE mentioned in the recipe applies to a different libtorre=
nt
> > > > > > library, from:
> > > > > > https://github.com/arvidn/libtorrent
> > > > > >
> > > > > >
> > > > >
> > > > > Applied, thanks!
> > > > >
> > > > > [1/1] libtorrent: remove CVE mention
> > > > >       commit: 0597c931ffbadf2a2242d8ed9cccb8567953d489
> > > > >
> > > > > Best regards,
> > > > > --
> > > > > Khem Raj <raj.khem@gmail.com>

