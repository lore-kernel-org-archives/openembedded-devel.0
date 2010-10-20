Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1P8iKq-0002z1-OU
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 01:44:45 +0200
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id 0A2B4EB27F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 01:44:08 +0200 (CEST)
X-SENDER-IP: [83.227.56.243]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AhcaACcbv0xT4zjzPGdsb2JhbAAHh2mLdY12AQEBATXAJoVKBIpL
X-IronPort-AV: E=Sophos;i="4.57,357,1283724000"; d="scan'208";a="143150242"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.250]) ([83.227.56.243])
	by ipb1.telenor.se with ESMTP; 21 Oct 2010 01:44:08 +0200
Message-ID: <4CBF7EC6.3050905@atmel.com>
Date: Thu, 21 Oct 2010 01:44:06 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Thunderbird 2.0.0.24 (Windows/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287233406-8778-1-git-send-email-ulf.samuelsson@atmel.com>	<201010181520.30454.marcin@juszkiewicz.com.pl>	<4CBC4DD4.3010908@atmel.com>	<i9hpii$gf2$1@dough.gmane.org>	<4CBC7F6A.9040000@atmel.com>	<AANLkTi=xBMvDEKjiaNKy7zijs4DCZwhrSDr=gHVkMh_T@mail.gmail.com>	<4CBCD3FC.5090305@atmel.com>
	<4CBD02B8.7020805@balister.org>
In-Reply-To: <4CBD02B8.7020805@balister.org>
X-SA-Exim-Connect-IP: 62.127.194.21
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_SOFTFAIL autolearn=ham version=3.2.5
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
X-List-Received-Date: Wed, 20 Oct 2010 23:44:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Philip Balister skrev:
> On 10/18/2010 07:10 PM, Ulf Samuelsson wrote:
>> Khem Raj skrev:
>>> On Mon, Oct 18, 2010 at 10:10 AM, Ulf Samuelsson
>>> <ulf.samuelsson@atmel.com>  wrote:
>>>> Koen Kooi skrev:
>>>>> On 18-10-10 15:38, Ulf Samuelsson wrote:
>>>>>> Marcin Juszkiewicz skrev:
>>>>>>> Dnia sobota, 16 pazdziernika 2010 o 14:50:02 
>>>>>>> ulf.samuelsson@atmel.com
>>>>>>> napisaB(a):
>>>>>>>
>>>>>>>> +++ b/conf/machine/include/at91-2.6.30.inc
>>>>>>>> +++ b/conf/machine/include/at91-2.6.32.inc
>>>>>>> Do you plan to duplicate that file with each kernel you will 
>>>>>>> produce?
>>>>>>> Create include/at91-sam9.inc and put it there.
>>>>>>>
>>>>>>> Regards,
>>>>>> This is to allow different kernel versions for different AT91 chips.
>>>>>> This allows both a "stable" version, and a development kernel
>>>>>> to be easily handled.
>>>>>> The file defines (amongst other things) the
>>>>>> * kernel version,
>>>>>> * u-boot version
>>>>>> * at91bootstrap version
>>>>>> so you need one file per version.he
>>>>> NAK! Machines don't get to decide versions! Please revert that commit
>>>>> and come up with a better way, e.g. default_preference in the 
>>>>> recipes or
>>>>> distro include files.
>>>> If I look at the machine files, almost all of them provide
>>>> a preferred kernel / u-boot. Some also provide version.
>>>
>>> we should avoid pinning versions there. Choosing a type is fine.
>>>
>>
>> Why ?
>> Is it because it affect rebuild time?
>> It would be good to understand what problems people see with this.
>>
>> We are pinning the version to a specific machine, in the kernel recipe.
>> If we add a new recipe, then we can, by increasing the priority
>> force a different kernel to be built.
>> This will not affect anything else.
>>
>> If the version is in the machine configuration, then a change of
>> kernel version could force a total rebuild, or?
>>
>> Any other problem?
> 
> In general, if you pin a version in a machine file, consider what 
> happens in the case of a distro that supports many machines. Your 
> machine build one version of something and the other machines build 
> another.
> 
> now do an update, upgrade on a package the version you chose may change, 
> or it may change on the other machines. There are likely some packages 
> you can pin version in machine files, but in general, it will cause 
> problems for distros that support more than just one machine at a time.
> 
> Philip


We are only talking about the kernel/u-boot/at91bootstrap.
Not any arbitrary applications.
I do agree that the distro should handle versioning for the normal file 
system.


BR
Ulf Samuelsson


