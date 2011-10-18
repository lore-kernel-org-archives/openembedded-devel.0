Received: from smtprelay-b22.telenor.se ([195.54.99.213])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RGA0T-00059g-BC
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 15:47:01 +0200
Received: from iph2.telenor.se (iph2.telenor.se [195.54.127.133])
	by smtprelay-b22.telenor.se (Postfix) with ESMTP id C1487E9DB9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 15:41:11 +0200 (CEST)
X-SENDER-IP: [83.227.57.13]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AtkvANWBnU5T4zkNPGdsb2JhbAAMOIk8kEWOfAEBAQE3giABAQEBAgE4UQshGgsPAjIUEwYCAQGHfLcniBsEk32RWA
X-IronPort-AV: E=Sophos;i="4.69,365,1315173600"; d="scan'208";a="496726775"
Received: from c-0d39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.249]) ([83.227.57.13])
	by iph2.telenor.se with ESMTP; 18 Oct 2011 15:41:00 +0200
Message-ID: <4E9D81EB.50702@telia.com>
Date: Tue, 18 Oct 2011 15:40:59 +0200
From: Ulf Samuelsson <ulf_samuelsson@telia.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E9C93AB.7090705@telia.com>
	<20111018062814.GA3751@ad.chargestorm.se>
	<4E9D6B7C.5000404@telia.com>
	<20111018121936.GA23902@ad.chargestorm.se>
In-Reply-To: <20111018121936.GA23902@ad.chargestorm.se>
Subject: Re: Performance measurement: Building openembedded-core with and without overclocking on C-i7 2600K
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
X-List-Received-Date: Tue, 18 Oct 2011 13:47:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2011-10-18 14:19, Anders Darander skrev:
> * Ulf Samuelsson<ulf_samuelsson@telia.com>  [111018 14:06]:
>> 2011-10-18 08:28, Anders Darander skrev:
>>> * Ulf Samuelsson<ulf_samuelsson@telia.com>   [111017 22:45]:
>>>> If anyone is interested...
>>> Build stats are always interesting... ;)
>>>> Same machine in two different configurations.
>>>> .........................................................#1...........................#2
>>>> P8Z68V Pro
>>>> Core-i7 2600K @                             3.4 GHz..................4.4 GHz
>>>> 8 GB @ ...........................................1333
>>>> MHz...............1640 MHz
>>>> 1TB WD Black 7200 RPM
>>>> Ubuntu 11-10
>>>> Almost all source code already in source directory
>>> This would severely restrict the usefulness of the comparison. I'd guess
>>> that this means that in one case the source will be downloaded, while
>>> it'll already be downloaded in the second test. Could you redo the
>>> statistics with all sources downloaded?
>> I had already built it once before running the first test then updated
>> and I think one additional package was downloaded over a 100 MBps line
>> so it affects a little, but not too much.
> Ok, just curious. Not least as you had one image fail in the first
> configuration, which you attributed to a failed download. That remark
> made me wonder...

OK, To be 100% correct:
I built meta-toolchain first so all packages for that build should be there.
This is much longer than anything else, so this is a good comparision.

Then the build #1 was started and measruements was taken.
This failed for core-image-sato due to one missing package, which
After build #1 was completed, I downloaded the missing package
and started build #2.

>
> Cheers,
> Anders
>
>> I think the conclusion:
>>       Increasing the CPU speed by 30% and the memory frequency by 20%
>>       gives 10-15% faster build time is OK.
>>>> Building meta-toolchain is 13% faster with overclocking.
>>> Was the overclocking test run after the non-overclocking?
>


-- 
Best Regards
Ulf Samuelsson



