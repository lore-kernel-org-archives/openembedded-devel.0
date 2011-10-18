Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RG8Ve-0001dS-Id
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 14:11:06 +0200
Received: from iph2.telenor.se (iph2.telenor.se [195.54.127.133])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id 2424BEA8BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 14:05:17 +0200 (CEST)
X-SENDER-IP: [83.227.57.13]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: At4vAGNqnU5T4zkNPGdsb2JhbAAMN4k8kEWOfAEBAQE3giABAQEBAgE4QBELIRYECwkDAgECATEUEwYCAQGHfLYyiBsEk32RWA
X-IronPort-AV: E=Sophos;i="4.69,365,1315173600"; d="scan'208";a="496667315"
Received: from c-0d39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.249]) ([83.227.57.13])
	by iph2.telenor.se with ESMTP; 18 Oct 2011 14:05:17 +0200
Message-ID: <4E9D6B7C.5000404@telia.com>
Date: Tue, 18 Oct 2011 14:05:16 +0200
From: Ulf Samuelsson <ulf_samuelsson@telia.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E9C93AB.7090705@telia.com>
	<20111018062814.GA3751@ad.chargestorm.se>
In-Reply-To: <20111018062814.GA3751@ad.chargestorm.se>
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
X-List-Received-Date: Tue, 18 Oct 2011 12:11:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2011-10-18 08:28, Anders Darander skrev:
> * Ulf Samuelsson<ulf_samuelsson@telia.com>  [111017 22:45]:
>> If anyone is interested...
> Build stats are always interesting... ;)
>
>> Same machine in two different configurations.
>> .........................................................#1...........................#2
>> P8Z68V Pro
>> Core-i7 2600K @                             3.4 GHz..................4.4 GHz
>> 8 GB @ ...........................................1333
>> MHz...............1640 MHz
>> 1TB WD Black 7200 RPM
>> Ubuntu 11-10
>> Almost all source code already in source directory
> This would severely restrict the usefulness of the comparison. I'd guess
> that this means that in one case the source will be downloaded, while
> it'll already be downloaded in the second test. Could you redo the
> statistics with all sources downloaded?
I had already built it once before running the first test then updated
and I think one additional package was downloaded over a 100 MBps line
so it affects a little, but not too much.

I think the conclusion:
     Increasing the CPU speed by 30% and the memory frequency by 20%
     gives 10-15% faster build time is OK.



>> Building meta-toolchain is 13% faster with overclocking.
> Was the overclocking test run after the non-overclocking?
>
> Cheers,
> Anders
>


-- 
Best Regards
Ulf Samuelsson



