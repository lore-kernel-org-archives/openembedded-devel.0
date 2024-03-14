Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E4DC54E66
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 00:43:32 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.317.1710377009316346412
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Mar 2024 17:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=ROhKvskB;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id EECF287FB5;
	Thu, 14 Mar 2024 01:43:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710377007;
	bh=y15wsvHgRW/wUdyXtSD6qU5pTmCDK1C61fovjii5zwo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ROhKvskBctbgIoUFC8oxWJc4119V3FzvI14ChG4b+HX8ueNpLBoL9zekpCmfIJ7hn
	 GL7Lb2CiwmFkzN3RRMVlwNmBXf4UKrurGi7fKnRbSx9j7lYdATkxRiS9ftzv63S7zI
	 MepZz/X5B92O+Owpkrzo7S/KL3zfda00rxyFyeNivKFJGzQiQUNKr5wYwI1xL8jPCb
	 W3ukv6lUAqyYkhIhQ24kTy9+KFm1T82w5zjaietH/ZxHCRAbj5ycijgwDN2voTzXhZ
	 OsnhWei9BriI/n4YimBSq28SwLGZlfxRXmhgwxUgzQg7UgUXqIWLdBLDNKTlT4ivdL
	 1MFmM3RadtZxw==
Message-ID: <9351a334-dd37-47d0-bdb4-01e574ba5104@denx.de>
Date: Thu, 14 Mar 2024 01:43:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] lvgl: Upgrade to LVGL 9 series
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
 Fabio Estevam <festevam@denx.de>, Martin Jansa <martin.jansa@gmail.com>
References: <20240313045038.90500-1-marex@denx.de>
 <20240313045038.90500-3-marex@denx.de>
 <CAMKF1soot4YOaXGQeQJ5xnbwN-TApuALfFyDBLGQ6C=axZAfPA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMKF1soot4YOaXGQeQJ5xnbwN-TApuALfFyDBLGQ6C=axZAfPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 00:43:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109303

On 3/13/24 6:00 PM, Khem Raj wrote:
> Thanks, seeing this QA issue
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3707/steps/14/logs/errors

Ah, sorry. I see a fix from you already too, thank you !

Do you still want a V2 of this series ?

