Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C72C433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 21:58:07 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.229.1637359084941853027
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 13:58:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=I3+/hyr2;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 06BA883027;
	Fri, 19 Nov 2021 22:58:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1637359082;
	bh=FM/M0HwNn1xWKluTfmUKqnFdrQtLHVSErG5UlcCWp+U=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=I3+/hyr2cGkVfWKuUOGCzIMGd5wLLn375kceGNf9fW9iGHZrCzj5VdLT/3klXcyQE
	 3gcvs/tb9airNJkgM/ewTMjbYkB3K4n8aLCzvIQOz6ZKdinzPDqumAoOo2v4o1DkHm
	 NBQhWmawXtrQgBYZ4zMwFg8QNX7sZJoR9yxseQzqVXqgd40r5YB7vk7pLrs4lrVEDb
	 CXZ+sMrxTcXH4HxdGAknkTZuIbRXFGhwYr0tjcFKAPIz7IdjmpZS67db9ICO4s1zbD
	 3o482gyRv94rXhx09wbvhZ4je/+JibQFaTtFv7AIovp6tTDyYKvTQEBbRihOR2flK5
	 FmrhOIRZKQ9vw==
Subject: Re: [oe] [meta-games][PATCH] neverball: Add neverball
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 Marko Lindqvist <cazfi74@gmail.com>, Heiko Schocher <hs@denx.de>
References: <20211119210515.131769-1-marex@denx.de>
 <CAMKF1squfEBbt6G-UzaW-k2dUDMiUJ-U0d1E+ZdtTMPV=3waeQ@mail.gmail.com>
 <286cbec8-212c-0346-c754-a7313fcd1c82@denx.de>
 <CAMKF1srRxBDSmV+Mrm_ucdk=jwVrANybPbrVZ7E3K8+_nnid4w@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <140f0c0e-cc15-55c5-435f-39f290dea863@denx.de>
Date: Fri, 19 Nov 2021 22:58:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CAMKF1srRxBDSmV+Mrm_ucdk=jwVrANybPbrVZ7E3K8+_nnid4w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Nov 2021 21:58:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94071

On 11/19/21 10:20 PM, Khem Raj wrote:
> On Fri, Nov 19, 2021 at 1:14 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 11/19/21 10:08 PM, Khem Raj wrote:
>>
>> [...]
>>
>>>> +do_install() {
>>>> +       install -d -m 755 ${D}${bindir}
>>>> +       install -m 755 ${B}/neverball ${D}/${bindir}/
>>>> +       install -m 755 ${B}/neverputt ${D}/${bindir}/
>>>> +
>>>> +       install -d -m 755 ${D}${datadir}/neverball
>>>> +       cp -r ${B}/locale ${D}${datadir}/neverball/
>>>
>>> perhap use
>>>
>>> cp -R --no-dereference --preserve=mode,links
>>>
>>> here
>>
>> Will do in V2.
>>
>> Is that some new recommended best practice ?
> 
> We need to have same username, sometimes username differs especially
> when building in docker containers.

Ahh, I see. Thanks

