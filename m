Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813C2C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:03:52 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.9099.1635325430937863026
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:34060 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mfeqb-00075X-Lz; Wed, 27 Oct 2021 05:03:48 -0400
Date: Wed, 27 Oct 2021 05:03:45 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alex Kiernan <alex.kiernan@gmail.com>
cc: Khem Raj <raj.khem@gmail.com>,
    OpenEmbedded Development mailing list
 <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] should "ntp-dev" package have header files in it, or not?
In-Reply-To: 
 <CAO5Uq5RUCUkBEEf6faBhBc_LGnyic=oqr_U+c_mJSXubOtALwA@mail.gmail.com>
Message-ID: <d44318f6-30d4-4217-dde-d5bdb8ad7a9a@crashcourse.ca>
References: <20eeedea-efe-555c-acd2-2f89fd879d2@crashcourse.ca>
 <CAMKF1sq45WMvPcdx527KWTYkUkxa+yS+T+4aES3nvrS6JvDJBQ@mail.gmail.com>
 <946de090-374f-85a0-bd52-eab9b3d54e7a@crashcourse.ca>
 <CAO5Uq5Tv+yfED2u7ygvCX1tBcKpnAgpVaiAPGg10uYnXBfEdsw@mail.gmail.com>
 <d4e0285f-3053-e1a0-146-bf54410cb2a@crashcourse.ca>
 <CAO5Uq5RUCUkBEEf6faBhBc_LGnyic=oqr_U+c_mJSXubOtALwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Oct 2021 09:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93624

On Tue, 26 Oct 2021, Alex Kiernan wrote:

> On Mon, Oct 25, 2021 at 4:11 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> > On Mon, 25 Oct 2021, Alex Kiernan wrote:
> >
> > > On Mon, Oct 25, 2021 at 11:51 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > > >
> > > > On Sun, 24 Oct 2021, Khem Raj wrote:
> > > >
> > > > > On Sun, Oct 24, 2021 at 5:51 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > > > > >
> > > > > >
> > > > > >   colleague recently asked me how to get access to one or more header
> > > > > > files associated with "ntp", so he could:
> > > > > >
> > > > > >   #include <ntp.h>
> > > > > >
> > > > > > from some other code. casually, i suggested the standard way was to
> > > > > > add ntp to his recipe's DEPENDS, but that didn't do it, so i built ntp
> > > > > > in my own aarch64 project, then took a look under packages-split to
> > > > > > see what got packaged in ntp-dev, and was puzzled to see it was
> > > > > > absolutely empty.
> > > > > >
> > > > > >   is this deliberate? are other recipes not entitled to ntp's header
> > > > > > files? am i overlooking something?
> > > > >
> > > > > While the header seems to be meant for public consumption, the build
> > > > > explicitly does not export it, so perhaps thats not expected to be
> > > > > used this way anymore.
> > > >
> > > >   just to tie this back to a question i once asked on (i believe) the
> > > > YP mailing list, this wind river build is using ntpsec instead of
> > > > regular ntp, but it would appear this would still have the same
> > > > problem -- while the ntpsec source contains an "include" directory
> > > > with lots of ntp-related header files, if one comes up with an ntpsec
> > > > recipe, nothing would be solved if it also does not install those
> > > > headers into ntpsec-dev.
> > > >
> > > >   so, simple question: does anyone have a bitbake recipe for current
> > > > ntpsec?
> > >
> > > I do, it's unfinished as I realised part way through that the python
> > > dependency meant it wasn't going to fit for my use case, but the
> > > basics of the build are there.
> >
> >   so is there a link for this?
> >
>
> Have a look at this:
>
> https://github.com/akiernan/meta-openembedded/commit/b1464c4b8dcab4a9dfaebbb7116b1c8462a198c4
>
> Seems like it works for me. Will send a patch if it looks good.

  setting up to test build right now: poky/aarch64/core-image-base.
will let you know. thank you kindly.

rday

