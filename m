Return-Path: <henning@itconsulting-heinold.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F338C636D3
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 20:03:46 +0000 (UTC)
Received: from mail.familie-heinold.de (mail.familie-heinold.de [85.214.48.103])
 by mx.groups.io with SMTP id smtpd.web10.64558.1675713820270839646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Feb 2023 12:03:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@itconsulting-heinold.de header.s=20220607 header.b=ajdC5cyt;
 spf=none, err=permanent DNS error (domain: itconsulting-heinold.de, ip: 85.214.48.103, mailfrom: henning@itconsulting-heinold.de)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E16D6689C2;
	Mon,  6 Feb 2023 21:03:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=itconsulting-heinold.de; s=20220607; t=1675713818;
	bh=rdwqxoBGTOTk9RdZxaLPF0GBTXRaMbCHlsNtwqa5aVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ajdC5cytxbenqSCIjJrQqwshwUEwinQFnLSIT05Azn49SUgODSAZ4JWfh1TEo7sUh
	 HmkzcZKS/ro8toGSn7B88ZnnCZBNW0k9TrNrJC3OfitpLgYcvUpJlMjMpKOIo9m42f
	 WMVNqEmNEuMc6PRi/+ElMrcQsDLuFeR4JxlLKwye7xXueFpxWMRwH+4fD6OHRY6wCe
	 5/L7O92bNQuizZwsqHjkYTkWJHy2lnC8APzmrdB9h+SrDd6dzff5uSVDEdL7rZFKxY
	 kq6sDlPyyd8B7GKzzX3A8IrXA+TMOQzZZeiIugwx7y+G2OLaJb0axSEndLNpldIPCN
	 A44kD5WrQsx1Q==
Received: from mail.itconsulting-heinold.de (dynamic-077-188-016-144.77.188.pool.telefonica.de [77.188.16.144])
	by mail.familie-heinold.de (Postfix) with ESMTPSA;
	Mon,  6 Feb 2023 21:03:37 +0100 (CET)
Date: Mon, 6 Feb 2023 21:03:32 +0100
From: Henning Heinold <henning@itconsulting-heinold.de>
To: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Cc: "dev@g0hl1n.net" <dev@g0hl1n.net>
Subject: Re: [oe] [meta-java][PATCH] temurin-jdk-17-bin/temurin-jre-17-bin:
 Add recipes
Message-ID: <Y+FdFJUIogBOfEAS@mail.itconsulting-heinold.de>
References: <1740FE2141407D2F.20960@lists.openembedded.org>
 <487E72B2-8D6B-4B81-AE4A-F72DE1E4C4AB@getmailspring.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <487E72B2-8D6B-4B81-AE4A-F72DE1E4C4AB@getmailspring.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Feb 2023 20:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100946

Am Sun, Feb 05, 2023 at 10:52:59AM -0800 schrieb Robert Joslyn:
> Sorry, forgot to add Richard L to CC when sending the patch!
> 
> Robert
> 

Thanks for your work, but I am bit torn here, because
one goal of oe was that all packages can be compiled
by its own, so we can link against different sets of
libc implementations and not repackaging some binary stuff.
But in the end I would go with the decision of Richard Leitner.

> On Feb 5 2023, at 9:34 am, Robert Joslyn
> <robert.joslyn@redrectangle.org> wrote:
> 
> > +++ b/recipes-core/temurin/temurin.inc
> > @@ -0,0 +1,62 @@
> > +HOMEPAGE = "https://adoptium.net"
> > +LICENSE = "GPL-2.0-with-classpath-exception"

There are a lot more licenses involved according to:
https://projects.eclipse.org/projects/adoptium.temurin


Bye Henning

