Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web09.25213.1628788402841372570
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Aug 2021 10:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 122871C000B;
	Thu, 12 Aug 2021 17:13:20 +0000 (UTC)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] opus-tools: update to 0.2 and fix license
To: Khem Raj <raj.khem@gmail.com>
References: <20210810131836.137934-1-michael.opdenacker@bootlin.com>
 <CAMKF1soq0fjOp8piavjppYcCOoAesQuyb+idC3NNX-yWBjOiFw@mail.gmail.com>
 <9abf72ba-5ace-a600-4f68-5e98e1ce19cf@bootlin.com>
 <CAMKF1sqJrCpxccqJr4Dsmgow2R2S-e2C=crXFbmOGLU8ggPDug@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <f9de346f-45f6-c8dd-c037-f44d2f15df94@bootlin.com>
Date: Thu, 12 Aug 2021 19:13:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqJrCpxccqJr4Dsmgow2R2S-e2C=crXFbmOGLU8ggPDug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Khem,

On 8/11/21 8:15 PM, Khem Raj wrote:
> On Wed, Aug 11, 2021 at 11:12 AM Michael Opdenacker
> <michael.opdenacker@bootlin.com> wrote:
>>
>> I'll be happy to.
>> However, what's really the difference between meta-oe/recipes-multimedia
>> and meta-multimedia/recipes-multimedia/? Why two different directories
>> in the same repository?
> these are two different layers, someone may not use meta-multimedia if
> its not in bblayers.conf
> and thusly not see the dir under meta-multimedia, so tools/packages
> which are media related
> but more or less generic go into meta-oe/recipe-multimedia, which this
> upgrade now depends
> on packages in meta-multimedia so its better to put it in meta-multimedia now


Thank you for the clarification. Now I understand that "meta-oe" is
rather for generic packages (outside of oe-core, of course), and the
other layers are for more specific purposes.

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

