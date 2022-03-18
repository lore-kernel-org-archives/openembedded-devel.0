Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DEA9C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 00:31:47 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web08.4135.1647563506258420303
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 17:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=miQiNlk/;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id j21so5843722qta.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 17:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=skGAv9qz9FSsk0UK3a4TezMfJKqL034+aiA8OH6hzr4=;
        b=miQiNlk/O4pH/DIWv45S/BcAOVMTuqKD+U2N9h+Rgz9KC4McLLV0RU+jXFvbkz44S/
         L7AfYXyteqNznxtz7lDCiQGUvqJdfvQwAXfB/D1hyfGZQqHrBLvQ7VX+ZylhokpGfBqq
         NNfSNqYIlfoY7fzjrpmsmuRX1vlYZxY80NWmoDxmYvMWYc3wUmMGw4o2b7lwea5TH9z1
         la1d8rHTQB4NkIzVsQfdNWu4dMNPuNI9qOQWMCHSqOkUZzEba21obUOGgSOtSz1ciE0P
         1gJJbT7cr7qo8dHSx/snvhLhf4i6KoBhAwlexSX3H80s8/cnlcAfFFGIiPedzUvFUlYy
         gWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=skGAv9qz9FSsk0UK3a4TezMfJKqL034+aiA8OH6hzr4=;
        b=pzsXSETO5dtpFzqcuFeWApZUs+6xo0100kVji1Bh7W53K/dVT3PQSANzDZA/fGIYy9
         /2QjmfHQqTG9+tpb0mNynQxiFX/3WR8rSo61HAibfP5ZxJRJch5oemfYB1dc4WMlMMnT
         cgtSUcex4fZg10nPzqgPf3hil9qOZe1ILnJrXK0S5Fb2nwU8RdJbLd1jA3gvW1IuIf+G
         utMhBF0owxNPL+edMz1K19Ezfz7z4Wbcxy3ySAj9/rVVyucvVQwMPiWmQYYF1QuXNqk5
         s5fastmdF2jhLnna781lCcoJK5Tydo6oNUEzWUZw0p5wQfCeszIMaLLepQg5061QDDt9
         tajg==
X-Gm-Message-State: AOAM533LlngexE+XkvDmlDY9l2MwqKGW3QoyKiOrpkfLCVcN3vxbK1Eq
	G3DqAavOfKxLNTLKAcr0AIWsZfKRSx2pIXo4w28=
X-Google-Smtp-Source: 
 ABdhPJxFZUz5w1P8i43S2DZyKb10IykTqiILAfk4N0shmiJER1RNmp37e5ydd4rPbeDC/NBxFgbNMgnupFdfC0Zerb4=
X-Received: by 2002:ac8:5743:0:b0:2e1:cee6:f15 with SMTP id
 3-20020ac85743000000b002e1cee60f15mr5791934qtx.634.1647563505225; Thu, 17 Mar
 2022 17:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220317165929.527418-1-f_l_k@t-online.de>
 <CAAnfSTvFTEDAnHETjQX99vPNRq6fxcZdyB_93kcdpjbEeXzZhg@mail.gmail.com>
 <2029191d-9920-31ce-e5bb-6bdd0c68417d@t-online.de>
In-Reply-To: <2029191d-9920-31ce-e5bb-6bdd0c68417d@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Mar 2022 17:31:19 -0700
Message-ID: 
 <CAMKF1spM5LNvuiSH4Oa+dUZpWPnUTyqhY2PhyKvnkD=11V3DNw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] perfetto: initial add commit
To: Markus Volk <f_l_k@t-online.de>
Cc: Ross Burton <ross@burtonini.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Mar 2022 00:31:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96051

Mark them RFC or something like that, so its clear that you dont
intend to include them.

On Thu, Mar 17, 2022 at 4:31 PM Markus Volk <f_l_k@t-online.de> wrote:
>
>
> >> +From f70ed62ce4a42525c9738455966bec2ed9647568 Mon Sep 17 00:00:00 2001
> >> +From: Markus Volk <f_l_k@t-online.de>
> >> +Date: Thu, 17 Mar 2022 15:44:23 +0100
> >> +Subject: [PATCH] meson.build: add pc file; build shared
> > No Upstream-Status or Signed-off-by.
> >
>
> These recipes are pretty ugly. I sent them to the mailing list, mostly
> in case someone wants to play around with them.
>
> If that's really the plan to add them i'll update the status and fix the
> other little problems
>
> >> +do_install:append() {
> >> +       install -d ${D}${includedir}
> >> +       install -m 0664 ${S}/sdk/perfetto.h ${D}${includedir}
> >> +}
> > As you're editing the meson why not just get it to install these too?
> I was just too lazy after I found out that this header was needed for
> Mesa but was not installed.
> >
> >> +FILES:${PN} = "${includedir} ${libdir}"
> >> +FILES:${PN}-dev = ""
> > No.  Always split into the usual packaging.
>
> My issue was, that there is only a .so without version number and
> symlink. All files got installed into dev.
>
> Needed to add dev-elf to INSANE_SKIP  and mesa complained about RDEPEND
> on libperfetto
>
> > YUCK.  What is this installing and why can't that be done via DEPENDS
> > and SRC_URI?  This breaks offline builds and source archiving.
> >
> > Ross
>
> This is ugly, i know. Other google projects like highway allow fetching
> stuff as submodules
>
> but to me it looks like only zlib and protobuf can be configured as
> use_system here. But this is my first
>
> approach on building with gn. I'm quite unfamiliar with it. Good chances
> that i'm just not knowing enough
>
> to to it better.
>
> https://github.com/google/perfetto/blob/master/tools/install-build-deps
>
> When I have more time, I'll take a closer look, but right now it's not a
> high priority for me.  As it is at the moment,
>
> this is definitely in need of improvement
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96049): https://lists.openembedded.org/g/openembedded-devel/message/96049
> Mute This Topic: https://lists.openembedded.org/mt/89850216/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

