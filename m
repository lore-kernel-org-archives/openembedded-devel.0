Return-Path: <bjohnson@blueridge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C7D8C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 20:37:47 +0000 (UTC)
Received: from smtp97.ord1c.emailsrvr.com (smtp97.ord1c.emailsrvr.com
 [108.166.43.97])
 by mx.groups.io with SMTP id smtpd.web08.34219.1660768666360430949
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 13:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@blueridge.com
 header.s=20171229-5bn1ohmr header.b=NmDj81fU;
 spf=pass (domain: blueridge.com, ip: 108.166.43.97,
 mailfrom: bjohnson@blueridge.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=blueridge.com;
	s=20171229-5bn1ohmr; t=1660768665;
	bh=yC2iUQbOyf4+k1DrBp5nQ8+63sNtr1RqZcdy5xn+cbY=;
	h=Date:To:From:Subject:From;
	b=NmDj81fUGMXqf6Ii70GuzwJ44TbVPA7sibFWgiVSPVd3DWwpTdGJSOidjqOlfLqPn
	 H94cbULCvg1f9S3PByT9eHGxUxM7rNS+/UisdB2swi7lHyR1uL25Y7GcxQGbd/QRYF
	 K0Flgdy0bw0BNNLD+jRWyh/ItIhQFyO3yD7yS+X8=
X-Auth-ID: bjohnson@blueridgenetworks.com
Received: by smtp13.relay.ord1c.emailsrvr.com (Authenticated sender:
 bjohnson-AT-blueridgenetworks.com) with ESMTPSA id 4EF64A0170
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 16:37:45 -0400 (EDT)
Message-ID: <fb208df3-7ee5-01be-5d2f-5d9657528764@blueridge.com>
Date: Wed, 17 Aug 2022 16:37:44 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: openembedded-devel@lists.openembedded.org
Content-Language: en-US
From: Bruce Johnson <bjohnson@blueridge.com>
Subject: Changing u-boot version in the build?
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Classification-ID: 0a6a0f2d-c554-4247-b656-d7dd762cc5ae-1-1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 20:37:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98313

I am stumped by the problem of how to build a newer version of u-boot=20
than the one in my openembedded-core version. The version shipped in our=20
copy of openembedded-core is 1_2020.01, and I'd like to build something=20
more recent. Whatever I put in for my PREFERRED_VERSION other than that=20
version results in a handful of notes saying that the preferred version=20
isn't available:

> $ bitbake u-boot
> Parsing recipes: 100%=20
> |######################################################################=
############################|=20
> Time: 0:00:10
> Parsing of 2298 .bb files complete (0 cached, 2298 parsed). 3409=20
> targets, 348 skipped, 0 masked, 0 errors.
> NOTE: preferred version 1:2022.04 of u-boot not available (for item=20
> u-boot)
> NOTE: versions of u-boot available: 1:2020.01
> NOTE: Resolving any missing task queue dependencies
> NOTE: preferred version 1:2022.04 of u-boot not available (for item=20
> u-boot-dev)
> NOTE: versions of u-boot available: 1:2020.01
> NOTE: preferred version 1:2022.04 of u-boot not available (for item=20
> u-boot-env)
> NOTE: versions of u-boot available: 1:2020.01
> NOTE: preferred version 1:2022.04 of u-boot not available (for item=20
> u-boot)
> NOTE: versions of u-boot available: 1:2020.01
I've tried various spellings of the PREFERRED_VERSION string: 1:2022.04,=20
1_2022.04, v2022.04 (the actual tag in the u-boot repository),=C2=A0 2011=
.04

My meta-openembedded-version is from the dunfell branch, hash a62ad779=20
(if I'm looking at the right thing).

I did a similar thing with ModemManager not long ago and didn't have a=20
real problem, and I don't understand what's so different about u-boot.=20
Thanks in advance for any suggestions.

--=20
Bruce Johnson
Chantilly, Virginia
USA


