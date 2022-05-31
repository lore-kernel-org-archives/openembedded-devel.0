Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C441C433F5
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 15:35:28 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.51118.1654011325784414275
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 08:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=h1s6e8+b;
 spf=pass (domain: konsulko.com, ip: 209.85.219.51,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qv1-f51.google.com with SMTP id ea7so4407885qvb.12
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 08:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=iXha5Rw+sP2oDRNT/gjjtkGWim1jKpvcMDxoW/5lLVk=;
        b=h1s6e8+b41ElHxmzL04xB0Dn5V1bpim3gVTWmhXmb/Yjzwj/D3NEsuGu6wjKwYApha
         RKz67P91pQ0tU0BiSabMAkiVMeTxFy5ivknw2Q5o9nTAy9ciYA5HTT95fZq+XZGuKqwc
         cUxwqyThO6eFYprqY8IyaNzEckEph+jBDiKck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=iXha5Rw+sP2oDRNT/gjjtkGWim1jKpvcMDxoW/5lLVk=;
        b=qhsFqGx/Sx2uOkss2PmFBiUl5fe+LmE5UDlS5T6x6z9Ce7m/jZ0e/HUTjlR2eVd+Ar
         s3c20TdDdeukZFGCV8W29atuVo1pzYbW57OUIzW8WfrSVcGmlexl+m/Sdot+mg+n7Szm
         J7H8RxfEOX5aBhZ8bC+WIOGwvhTcvlXCWobd67jRtCmIIq1K/YVF07wZqkGjEbdwiH63
         b5I0Zhif1Q60c3maaV/UsJg3vzCCIYJjFWz9HNZPACUfyN/kj/NrM2shZN0CPeIpe9Aq
         OsBI9EMR0PacyfKy3valX9FSucpP6UGuFawiYMGsSUKVORt847vumWP2Q3N41a24Cmx5
         TieA==
X-Gm-Message-State: AOAM532VNJm5o+m8/C+KQeqoqHYBony25RP3+rU9une3cX7sNDVaMSW4
	4CBOh77+ewwJhC1kfM5BWppz9w==
X-Google-Smtp-Source: 
 ABdhPJzcgIpfwN2R94FX3E0zp93IjbGMAsx21Jhzyhgbiylg2481IjwMF0lcD+xSiPn3nZd1Hnt+LA==
X-Received: by 2002:a05:6214:509a:b0:461:bf7b:1565 with SMTP id
 kk26-20020a056214509a00b00461bf7b1565mr49631455qvb.101.1654011324881;
        Tue, 31 May 2022 08:35:24 -0700 (PDT)
Received: from godzilla (192-0-174-222.cpe.teksavvy.com. [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 z207-20020a3765d8000000b0069fc13ce23esm9699271qkb.111.2022.05.31.08.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 08:35:24 -0700 (PDT)
Date: Tue, 31 May 2022 11:35:23 -0400 (EDT)
From: Scott Murray <scott.murray@konsulko.com>
To: Samuli Piippo <samuli.piippo@gmail.com>
cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-multimedia][PATCH] flite: add recipe
In-Reply-To: 
 <CABXoSoVEMV4xPWmftuJcX63QCV5ZPcxObLzmF+kzY7kH1F=h2A@mail.gmail.com>
Message-ID: <ca74cd1d-f065-9e29-8445-242f917e6d8@spiteful.org>
References: <20220530122952.2715776-1-samuli.piippo@qt.io>
 <9881391e-a6d9-beb4-14a4-de636795c22@spiteful.org>
 <CABXoSoVEMV4xPWmftuJcX63QCV5ZPcxObLzmF+kzY7kH1F=h2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 May 2022 15:35:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97353

On Tue, 31 May 2022, Samuli Piippo wrote:

> On Mon, 30 May 2022 at 17:43, Scott Murray <scott.murray@konsulko.com>
> wrote:
>
> > On Mon, 30 May 2022, Samuli Piippo wrote:
> >
> > > CMU Flite (festival-lite) is a small, fast run-time open source
> > > text to speech synthesis engine developed at CMU and primarily
> > > designed for small embedded machines.
> > >
> > > Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> > > ---
> > >  .../recipes-multimedia/flite/flite_2.2.bb     | 19 +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >  create mode 100644 meta-multimedia/recipes-multimedia/flite/
> > flite_2.2.bb
> > >
> > > diff --git a/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
> > b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
> > > new file mode 100644
> > > index 000000000..9ab9c0208
> > > --- /dev/null
> > > +++ b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
> > > @@ -0,0 +1,19 @@
> > > +SUMMARY = "Flite: a small run-time speech synthesis engine"
> > > +HOMEPAGE = "http://cmuflite.org"
> > > +SECTION = "libs/multimedia"
> > > +LICENSE = "BSD-3-Clause"
> > > +LIC_FILES_CHKSUM = "file://COPYING;md5=b3b732d1349633a53e69356607fd2d6c"
> > > +
> > > +inherit autotools-brokensep
> > > +
> > > +SRC_URI = "git://
> > github.com/festvox/flite.git;protocol=https;branch=master"
> > > +
> > > +SRCREV = "e9e2e37c329dbe98bfeb27a1828ef9a71fa84f88"
> > [snip]
> >
> > There's no 2.3 tag, but the README.md and Makefile imply that 2.3 was
> > released in March 2022 (see commit 530060de), and the current voice files
> > on http://festvox.org/flite/packed/ are "flite-2.3".  So perhaps this
> > should be building that instead of the ~2 years old 2.2?
>
> Hard to say if there's a specific revision that was meant to be the
> release, but I could update this to 2.3 and just use the latest revision?

I'd be in favor of a _git recipe that set PV = "2.3+git${SRCPV}", but Khem
might have a different opinion.

> > > +
> > > +S = "${WORKDIR}/git"
> > > +
> > > +EXTRA_OECONF += "--enable-shared"
> > > +
> > > +do_install:append() {
> > > +    chown -R root:root ${D}${libdir}/*
> >
> > This seems a bit odd, I'm curious what prompted adding it?
>
> The installed files had local user and group IDs that caused host
> contamination error.

Hrm, that suggests upstream have a broken Makefile using "cp -p", it could
be worthwhile to poke them about it.  We have had a recipe for an older
version in AGL for quite a while and didn't see it, so it seems like
something changed.

Scott


