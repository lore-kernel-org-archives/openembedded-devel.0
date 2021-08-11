Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web11.11497.1628705577991583499
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Aug 2021 11:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7F20720000B;
	Wed, 11 Aug 2021 18:12:55 +0000 (UTC)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] opus-tools: update to 0.2 and fix license
To: Khem Raj <raj.khem@gmail.com>
References: <20210810131836.137934-1-michael.opdenacker@bootlin.com>
 <CAMKF1soq0fjOp8piavjppYcCOoAesQuyb+idC3NNX-yWBjOiFw@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <9abf72ba-5ace-a600-4f68-5e98e1ce19cf@bootlin.com>
Date: Wed, 11 Aug 2021 20:12:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soq0fjOp8piavjppYcCOoAesQuyb+idC3NNX-yWBjOiFw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Khem,

Thanks for the review and checking the test report!

On 8/11/21 7:23 PM, Khem Raj wrote:
> On Tue, Aug 10, 2021 at 6:18 AM Michael Opdenacker
> <michael.opdenacker@bootlin.com> wrote:
>> The license in version 0.1.8 was already BSD-2-Clause and GPLv2
>> (for the "opusinfo" command).
>>
>> The license checksum change is due to trivial changes on the license
>> text ("https" instead of "http" and whitespace changes).
>>
>> This new version now DEPENDs on "libopusenc" and "opusfile" too.
>>
> Thanks for this patch, it brings up a YP compatibility issue to front see
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1455
>
> I think it would be better to move this recipe to meta-multimedia
> which should fix it.


I'll be happy to.
However, what's really the difference between meta-oe/recipes-multimedia
and meta-multimedia/recipes-multimedia/? Why two different directories
in the same repository?

Thanks again,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

