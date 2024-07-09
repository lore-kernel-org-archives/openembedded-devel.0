Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB39C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 12:54:09 +0000 (UTC)
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
 by mx.groups.io with SMTP id smtpd.web11.12167.1720529647859640966
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jul 2024 05:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@g0hl1n.net header.s=key1 header.b=jSYf+pO1;
 spf=pass (domain: g0hl1n.net, ip: 95.215.58.188, mailfrom: dev@g0hl1n.net)
X-Envelope-To: akuster808@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1720529645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mZ1vfBOYPUoGlbcHMg17XchJuex2R9jeiE+IvYwx3eI=;
	b=jSYf+pO1SBlMVmXMCUXimNSSXeIahx4BTZgXq0AtqOwP/KPulprkm6RuZf1xhtZ5tK7VOb
	pbX9yEZ42Zm/HASV2J4MsFpg1zpTiYb81p7EJcqsGHYC2/V3f4tPZdmIUx42qdMCwO4RSY
	ubJddPckOowInpme8bFeARGcHXWyZw0=
X-Envelope-To: openembedded-devel@lists.openembedded.org
X-Envelope-To: tim.orling@konsulko.com
Date: Tue, 9 Jul 2024 14:54:00 +0200
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <dev@g0hl1n.net>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, tim.orling@konsulko.com
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pydantic-core:
 upgrade 2.16.3 -> 2.18.1
Message-ID: <w24ywr4aiiqxecb46semqmbw4ulstn4rz25mwbiurkwh4xzxva@oyphvy5wc7nj>
References: <20240706180810.1707296-1-dev@g0hl1n.net>
 <26a61314-0aa1-4e5c-ac71-d0ece3591362@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26a61314-0aa1-4e5c-ac71-d0ece3591362@gmail.com>
X-Migadu-Flow: FLOW_OUT
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jul 2024 12:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111285

Hi Armin,

On Tue, Jul 09, 2024 at 08:12:06AM GMT, akuster808 wrote:
> Hello Richard,
> 
> On 7/6/24 2:08 PM, Richard Leitner via lists.openembedded.org wrote:
> > The currently available python-3-pydantic v2.7.0 requires
> > python3-pydantic-core to be updated to v2.18.1.
> I don't see the updated or later version in master? Am I missing something?

I found a series from Tim [1] which updates python3-pydantic and python3-pydantic-core
to 2.7.4/1.9.0 for master.
As those are newer versions I didn't send this patch for master.

Furthermore I wanted to fix the incorrect dependency first before
trying to update python3-pydantic for scarthgap (and therefore backport
Tims series).

So how should we proceed here? Should this patch be sent for master too?
Or should the series from Tim should be followed up for master?

regards;rl

> 
> - Armin
> 

[1] https://patchwork.yoctoproject.org/project/oe/list/?series=25615

