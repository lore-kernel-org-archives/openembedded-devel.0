Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OyUGg-0003Qs-8P
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 20:42:12 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OyU2c-0004nn-BO from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 11:27:38 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 22 Sep 2010 11:27:29 -0700
Received: from [172.30.80.208] ([172.30.80.208]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 22 Sep 2010 12:26:26 -0600
Message-ID: <4C9A4A4F.7060401@mentor.com>
Date: Wed, 22 Sep 2010 11:26:23 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C9950D0.7000907@gmail.com>	<201009220913.06632.marcin@juszkiewicz.com.pl>	<AANLkTi==90GdQHqJufKx6HEaOsM-y-Sgb7E8WsH0Zmvg@mail.gmail.com>	<4C99B7DB.8040602@gmail.com>
	<AANLkTik62awMj=AX3ndn_QbEQDnSDVuqrKKmza7P0haC@mail.gmail.com>
In-Reply-To: <AANLkTik62awMj=AX3ndn_QbEQDnSDVuqrKKmza7P0haC@mail.gmail.com>
X-OriginalArrivalTime: 22 Sep 2010 18:26:26.0833 (UTC)
	FILETIME=[AB1ED010:01CB5A83]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] at91bootstrap.inc: Mark COMPATIBLE_MACHINEs.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Sep 2010 18:42:14 -0000
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8bit

Graham Gower wrote:
> On 22 September 2010 17:31, Marco Cavallini <koansoftware@gmail.com> wrote:
>> Graham Gower ha scritto, Il 22/09/2010 09:36:
>>> On 22 September 2010 16:43, Marcin Juszkiewicz
>>> <marcin@juszkiewicz.com.pl> wrote:
>>>> Dnia ¶roda, 22 wrze¶nia 2010 o 02:41:52 Graham Gower napisa³(a):
>>>>
>>>>> --- a/recipes/at91bootstrap/at91bootstrap.inc
>>>>> +++ b/recipes/at91bootstrap/at91bootstrap.inc
>>>>> +COMPATIBLE_MACHINE =
>>>>> "(afeb9260|at91cap9adk|at91sam9g20ek|at91sam9rlek|at91sam9263ek|at91sam926
>>>>> 0ek|at91sam9xeek|at91sam9261ek)"
>>>> mk355 is also atmel at91sam9263 so at91bootstrap is used on it probably.
>>>>
>>> The compatible machines here are those that have a defconfig in the
>>> the files/ directory.
>>>
>> Yes please
>> mh55 is also atmel at91sam9263 so at91bootstrap is used on it too.
>> It also have its defconfig in the recipes/linux/linux-2.6.28/mh355/
>> directory.
>>
>>
> 
> Ok, well the defconfigs are duplicated into this recipe dir (probably
> a bad thing). To support mh55, you would have to copy the defconfig in
> and add it to COMPATIBLE_MACHINE.

It sounds like, and trying not to open a different can of worms, but the 
at91 stuff should perhaps be using one of those hooks for grouping a set 
of machines together?

-- 
Tom Rini
Mentor Graphics Corporation


