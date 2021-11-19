Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18342C433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 21:14:23 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.177.1637356460882771302
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 13:14:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=o4X6VdPf;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9A7D482F3E;
	Fri, 19 Nov 2021 22:14:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1637356459;
	bh=pCMxhQmaVVSTj/F4ZKrn32tcALu7sT4PXOH2mwrVh0I=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=o4X6VdPfERKq93WAHMLoRs219ZO+9DMBZm1LRQdlMWLjiOvyohos2OTz8rOS4kXR6
	 /rhzoCHSY6z7BCVfTk1yARV3rjCEwyNoITjKqfGrEm9x1vbR67HH15+s4gms3CZwGF
	 /q3ZBYw6VIVskEPya+c+PK6DbzXRUfo55TulJFZsisaS7QLhBaIL0bQzhJTGh1rH0J
	 e3pJDqx3QPjzndYXZEyLFKCO3HkaJQDeuhJ7mULAFBfUWxFamvh5MjO1qHMPau2v7D
	 jKwKY/5JDUOtRrg8nuGRBohzDHHoha7Ogkw42WOG5mHi8iAu0/U7cLiyQewCDwCv10
	 kNOjWHHdEchrw==
Subject: Re: [oe] [meta-games][PATCH] neverball: Add neverball
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 Marko Lindqvist <cazfi74@gmail.com>, Heiko Schocher <hs@denx.de>
References: <20211119210515.131769-1-marex@denx.de>
 <CAMKF1squfEBbt6G-UzaW-k2dUDMiUJ-U0d1E+ZdtTMPV=3waeQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <286cbec8-212c-0346-c754-a7313fcd1c82@denx.de>
Date: Fri, 19 Nov 2021 22:14:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <CAMKF1squfEBbt6G-UzaW-k2dUDMiUJ-U0d1E+ZdtTMPV=3waeQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Nov 2021 21:14:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94069

On 11/19/21 10:08 PM, Khem Raj wrote:

[...]

>> +do_install() {
>> +       install -d -m 755 ${D}${bindir}
>> +       install -m 755 ${B}/neverball ${D}/${bindir}/
>> +       install -m 755 ${B}/neverputt ${D}/${bindir}/
>> +
>> +       install -d -m 755 ${D}${datadir}/neverball
>> +       cp -r ${B}/locale ${D}${datadir}/neverball/
> 
> perhap use
> 
> cp -R --no-dereference --preserve=mode,links
> 
> here

Will do in V2.

Is that some new recommended best practice ?

