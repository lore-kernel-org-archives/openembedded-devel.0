Received: from smtprelay-h32.telenor.se ([213.150.131.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1P7te5-0004lU-Ch
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 19:37:14 +0200
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-h32.telenor.se (Postfix) with ESMTP id BD667EBA14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 19:16:40 +0200 (CEST)
X-SENDER-IP: [83.227.56.243]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: An0RAHYdvExT4zjzPGdsb2JhbAAHjzKDd44IAQEBATXAIYVJBIlbbw
X-IronPort-AV: E=Sophos;i="4.57,345,1283724000"; d="scan'208";a="142381501"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.242]) ([83.227.56.243])
	by ipb1.telenor.se with ESMTP; 18 Oct 2010 19:16:40 +0200
Message-ID: <4CBC80F6.8020600@atmel.com>
Date: Mon, 18 Oct 2010 19:16:38 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287233406-8778-1-git-send-email-ulf.samuelsson@atmel.com>	<201010181520.30454.marcin@juszkiewicz.com.pl>	<4CBC4DD4.3010908@atmel.com>
	<i9hpii$gf2$1@dough.gmane.org>
	<AANLkTim6ROYhLyn1e8=PT+Joby0hiJ7rCVgUD7ifJRYe@mail.gmail.com>
In-Reply-To: <AANLkTim6ROYhLyn1e8=PT+Joby0hiJ7rCVgUD7ifJRYe@mail.gmail.com>
X-Enigmail-Version: 0.95.7
X-SA-Exim-Connect-IP: 213.150.131.5
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/5] Use common files for AT91SAM9 configuration
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
X-List-Received-Date: Mon, 18 Oct 2010 17:37:14 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks skrev:
> 2010/10/18 Koen Kooi <k.kooi@student.utwente.nl>:
> On 18-10-10 15:38, Ulf Samuelsson wrote:
>>>> Marcin Juszkiewicz skrev:
>>>>> Dnia sobota, 16 pazdziernika 2010 o 14:50:02 ulf.samuelsson@atmel.com
>>>>> napisaB(a):
>>>>>
>>>>>> +++ b/conf/machine/include/at91-2.6.30.inc
>>>>>> +++ b/conf/machine/include/at91-2.6.32.inc
>>>>> Do you plan to duplicate that file with each kernel you will produce?
>>>>> Create include/at91-sam9.inc and put it there.
>>>>>
>>>>> Regards,
>>>> This is to allow different kernel versions for different AT91 chips.
>>>> This allows both a "stable" version, and a development kernel
>>>> to be easily handled.
>>>>
>>>> The file defines (amongst other things) the
>>>> * kernel version,
>>>> * u-boot version
>>>> * at91bootstrap version
>>>> so you need one file per version.
> NAK! Machines don't get to decide versions! Please revert that commit
> and come up with a better way, e.g. default_preference in the recipes or
> distro include files.
> 
>> Well machines are probably better capable to decide what u-boot and
>> kernel version is best for them.
>> One alternative (which is probably by more yukky) is to create an
>> kernel-at91 recipe and define PREFERRED_PROVIDER_virtual/kernel
>> I don't feel that is a better scenario
> 

The advantage of putting the kernel/u-boot/at91bootstrap in the
machine file, is that I can make a copy of a machine file to another
file, change the version of the include file and build.

I dont have to change any files, so nothing existing breaks.

Once everything is tested, I can just replace the old machine file
with the new file and check in.



>> Frans
> 
> 
>>
>>
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

BR
Ulf Samuelsson


