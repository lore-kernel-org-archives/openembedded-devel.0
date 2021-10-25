Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B691EC433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 10:51:04 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.30364.1635159063450340180
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 03:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:38908 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mexZG-0008ET-4v; Mon, 25 Oct 2021 06:51:01 -0400
Date: Mon, 25 Oct 2021 06:50:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Khem Raj <raj.khem@gmail.com>
cc: OpenEmbedded Development mailing list
 <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] should "ntp-dev" package have header files in it, or not?
In-Reply-To: 
 <CAMKF1sq45WMvPcdx527KWTYkUkxa+yS+T+4aES3nvrS6JvDJBQ@mail.gmail.com>
Message-ID: <946de090-374f-85a0-bd52-eab9b3d54e7a@crashcourse.ca>
References: <20eeedea-efe-555c-acd2-2f89fd879d2@crashcourse.ca>
 <CAMKF1sq45WMvPcdx527KWTYkUkxa+yS+T+4aES3nvrS6JvDJBQ@mail.gmail.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Oct 2021 10:51:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93560

On Sun, 24 Oct 2021, Khem Raj wrote:

> On Sun, Oct 24, 2021 at 5:51 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >
> >   colleague recently asked me how to get access to one or more header
> > files associated with "ntp", so he could:
> >
> >   #include <ntp.h>
> >
> > from some other code. casually, i suggested the standard way was to
> > add ntp to his recipe's DEPENDS, but that didn't do it, so i built ntp
> > in my own aarch64 project, then took a look under packages-split to
> > see what got packaged in ntp-dev, and was puzzled to see it was
> > absolutely empty.
> >
> >   is this deliberate? are other recipes not entitled to ntp's header
> > files? am i overlooking something?
>
> While the header seems to be meant for public consumption, the build
> explicitly does not export it, so perhaps thats not expected to be
> used this way anymore.

  just to tie this back to a question i once asked on (i believe) the
YP mailing list, this wind river build is using ntpsec instead of
regular ntp, but it would appear this would still have the same
problem -- while the ntpsec source contains an "include" directory
with lots of ntp-related header files, if one comes up with an ntpsec
recipe, nothing would be solved if it also does not install those
headers into ntpsec-dev.

  so, simple question: does anyone have a bitbake recipe for current
ntpsec? it's "waf" based, so it might be a bit trickier, but if there
is such a recipe, unless it installs its header files into ntpsec-dev,
then it doesn't really solve the problem, does it?

  thoughts?

rday

