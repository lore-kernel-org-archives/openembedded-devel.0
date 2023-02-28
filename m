Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80279C64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 23:33:23 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.9027.1677627200608179764
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Feb 2023 15:33:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 84BD040CA5;
	Tue, 28 Feb 2023 23:33:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RL3e_7zZ3_FV; Tue, 28 Feb 2023 23:33:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 630EB40C98;
	Tue, 28 Feb 2023 23:33:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2B5E4163766; Tue, 28 Feb 2023 18:32:52 -0500 (EST)
Date: Tue, 28 Feb 2023 18:32:52 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH 0/2] Resolve conflict between /usr/bin/hello from
 lmbench and mbedtls
Message-ID: <20230228233252.GN22689@denix.org>
References: <20230225231717.3887902-1-denis@denix.org>
 <70AE5022-1A56-44E4-82CC-3B9E38669233@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70AE5022-1A56-44E4-82CC-3B9E38669233@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Feb 2023 23:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101311

On Mon, Feb 27, 2023 at 11:05:36AM +0000, Ross Burton wrote:
> On 25 Feb 2023, at 23:17, Denys Dmytriyenko via lists.openembedded.org <denis=denix.org@lists.openembedded.org> wrote:
> > 
> > Both lmbench and mbedtls packages provide generically-named /usr/bin/hello
> > binary, which causes a conflict when trying to install them both into a
> > rootfs or SDK. Set up alternative providers to resolve the conflict.
> 
> Are either of these binaries actually useful?  The, well, alternative is to 
> just delete them stupidly named binaries (or rename).

My assumption is that at least lmbench is using this binary for some testing 
or benchmarking. But I haven't looked very deep into it. Plus I wanted to get 
this backported to Kirkstone, so the least invasive approach made more sense.

-- 
Denys

