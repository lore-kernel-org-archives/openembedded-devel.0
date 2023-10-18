Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FB6CDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 19:35:05 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.10489.1697657696865263691
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 12:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=lYnCJW3J;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id EA6958071F;
	Wed, 18 Oct 2023 21:34:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1697657692;
	bh=FwOsqfBsEAhuXqjqr+gEbSk5Ut2Mix0muUqbPZ4uNL0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lYnCJW3JBzRv8Of6ZSJDHjYLYfNZvLbH9hM+v47P4BkA6MWRiUD+gay/iiuFwHfTy
	 XYLcGWyKSgK3OC+JnPq2npDlZfQt/eYLH+zwTNTK/yDGaHL5v7cR37EhI57xaq5nyW
	 YIJEDVAyoK7z7ZsUeL9AMeQaxfy1gwpYwlZgzJ9tWmsZBLuBALecJWhMVYo5h/V9oc
	 Y2MOeBtgw6iQ+0lvvCW6Gy0Nwa4E9FswNUs6XYjvAKJKO+qoehNj6AfbyElxuT8Btz
	 qR+2q4cJYvW1ITUOihbqZCvsZ38RVfIWcYMuP3GfrrOHup5yTpwhkVjUvdGdXwxNQZ
	 dHQX7H1HHW44g==
Message-ID: <44d8a126-5a80-4a27-90f0-309555e5fd35@denx.de>
Date: Wed, 18 Oct 2023 21:34:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH 1/2] lvgl: lv-drivers: Allow empty package
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
 Fabio Estevam <festevam@denx.de>, Khem Raj <raj.khem@gmail.com>,
 Michael Opdenacker <michael.opdenacker@bootlin.com>
References: <20231018181221.87138-1-marex@denx.de>
 <CA+chaQcet4HaWkoHp1XvjPUGWUxVAJanMhLnASq_hHSgpKN2-A@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CA+chaQcet4HaWkoHp1XvjPUGWUxVAJanMhLnASq_hHSgpKN2-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 19:35:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105582

On 10/18/23 21:05, Martin Jansa wrote:
> What issue does this actually fix?
> 
> Is it related to
> https://lists.openembedded.org/g/openembedded-core/message/188383 ?

Nope

> I'm not fan of empty useless packages created just to make package manager
> happy when something else has unfortunate dependency on them.

I have a downstream repo where a tool DEPENDS on lvgl and it builds an 
SDK too, that's where it blows up on the empty package.

