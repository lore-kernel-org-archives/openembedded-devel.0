Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68737E936F2
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 02:22:31 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.6939.1696472545402541938
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Oct 2023 19:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=PnrWJcO3;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 964A4864C3;
	Thu,  5 Oct 2023 04:22:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1696472542;
	bh=6CjmRA7nDMNSTpM1A+eb1bkhhvW3h7brXaopBMvqOlk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PnrWJcO3AB8CMJn9gQTCOeIrVwS323ANmJfQQ0UeSzxUZacybQbGxlp/T3qCAJCjY
	 ReASAagcsyjMe0qkHxeE6uPJWplcl1Nf/fDvnSC3YoWXdDEUvV2RvDjx4RYjHDmdE9
	 J5fcaykaGGxpaml5aJn1k1g6bUIlhZ9xadOI4XRvmcEPRaqr0a2T1hCbFOcNEeN7Ua
	 VfJkfWoJS1Xin77eFdRJNVdb8Neh1P2jylPlY6yxPRgUklECDgC0SU31cwS+CEzDrJ
	 WyXbBmqMwe2P009UkJHUUrhZRXmFUEfZodjmPDBXfeDhoQX2ChzPjhOPp9XhMK875l
	 4G+bEBZYykwig==
Message-ID: <6dca63d7-cd19-42d9-a013-1d2642e60ad6@denx.de>
Date: Thu, 5 Oct 2023 04:22:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH] faad2: Upgrade 2.10.0 -> 2.10.1
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
 Alex Kiernan <alex.kiernan@gmail.com>
References: <20231003205747.84389-1-marex@denx.de>
 <CAMKF1sq3B8kq+dT1WMobwya_eVWOi_BTjB2xs5SvVjYGU70iKQ@mail.gmail.com>
 <CAMKF1soGNbjnWqiZr9xT0YoWO3jj-kJE=sncUvgnxO0+Un=9wg@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMKF1soGNbjnWqiZr9xT0YoWO3jj-kJE=sncUvgnxO0+Un=9wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 02:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105347

On 10/5/23 00:36, Khem Raj wrote:
> I looked at the changes in master since 2.10 and most of them are
> bugfixes, but one big change is switch away from autotools to cmake
> so it might be worth to get all fixes and switch to cmake in recipe
> for master instead of trying to fix the dependency issues to generate
> faad.h
> since we run autoreconf this might be messing up with bootstrap code
> of this package.

I also noticed that 2.11 is about to be released, so I'll send 2.11 with 
cmake when its out.

