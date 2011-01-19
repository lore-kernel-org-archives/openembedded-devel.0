Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pfemp-0007pF-MD
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 21:37:47 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PfemB-00053X-6c from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 12:37:07 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 19 Jan 2011 12:37:06 -0800
Received: from [172.30.80.47] ([172.30.80.47]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 19 Jan 2011 13:37:05 -0700
Message-ID: <4D374B50.3090402@mentor.com>
Date: Wed, 19 Jan 2011 13:36:32 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295286639-4901-1-git-send-email-raj.khem@gmail.com>	<4D34952B.607@mentor.com>
	<201101180730.29536.roman@khimov.ru>	<4D3661AC.8030708@mentor.com>
	<20110119042954.GA30752@gmail.com>	<4D37215D.7050209@mentor.com>
	<AANLkTimdiodUzAED=HN7-0BBy4q8yQ+zMTPWK9tngUFc@mail.gmail.com>
In-Reply-To: <AANLkTimdiodUzAED=HN7-0BBy4q8yQ+zMTPWK9tngUFc@mail.gmail.com>
X-OriginalArrivalTime: 19 Jan 2011 20:37:05.0952 (UTC)
	FILETIME=[A2C1B200:01CBB818]
Subject: Re: [PATCH 1/2] minimal.conf: Prefer perl 5.10.1 and opie 1.2.5
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
X-List-Received-Date: Wed, 19 Jan 2011 20:37:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/19/2011 10:57 AM, Khem Raj wrote:
> On Wed, Jan 19, 2011 at 9:37 AM, Tom Rini<tom_rini@mentor.com>  wrote:
>> On 01/18/2011 09:29 PM, Khem Raj wrote:
>>>
>>> On (18/01/11 20:59), Tom Rini wrote:
>>>>
>>>> On 01/17/2011 09:30 PM, Roman I Khimov wrote:
>>>>>
>>>>> В сообщении от Понедельник 17 января 2011 22:14:51 автор Tom Rini
>>>>> написал:
>>>>>>
>>>>>> On 01/17/2011 10:50 AM, Khem Raj wrote:
>>>>>> I see different problems with perl 5.10.1 + uclibc + p2020ds, so I
>>>>>> guess
>>>>>> this is fine with me.
>>>>>
>>>>> What kind of problems?
>>>>
>>>> Khem fixed it tonight.  At heart, there's been a need to make much
>>>> better use of the libc-uclibc override rather than testing TARGET_OS
>>>> as there's at least 'linux-uclibc', 'linux-uclibceabi' and
>>>> 'linux-uclibcspe' as valid TARGET_OS combinations.
>>>
>>> I thought about it and indeed it would be better to have a LIBC override
>>> but its defined in .inc files which may not be included by all
>>> distributions, if this makes into bitbake.conf somehow then that would
>>> be better or we can decide to have a global data var called LIBC or some
>>> sort.
>>
>> We already did this.  A distro that doesn't pull in the right libc inc file
>> is either broken or on its own (I forget and can't check atm if Angstrom
>> uses the files eventually or just also has the libc-foo OVERRIDES, but is
>> correct here).
>
> yes angstrom does. Ok I moved slugos to use it recently so its no more broken :)

Um, when did SlugOS break then?  When I introduced the libc overrides I 
moved everyone over to it.

> We also have LIBC as a global env way to say what LIBC to
>> use (Angstrom has ANGSTROMLIBC and LIBC since they originated the feature).
>
> nice we can use LIBC as well if need be but override is more elegant

Yes, LIBC shouldn't be parsed like that, it's like MACHINE :)

-- 
Tom Rini
Mentor Graphics Corporation


