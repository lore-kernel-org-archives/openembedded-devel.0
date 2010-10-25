Received: from smtp-out21.han.skanova.net ([195.67.226.208])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1PAP8E-00019Y-7Q
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 17:38:44 +0200
Received: from [10.3.3.206] (62.237.32.34) by smtp-out21.han.skanova.net
	(8.5.124.10) (authenticated as u82406562)
	id 4C7E106501581CE0 for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 17:35:07 +0200
Message-ID: <4CC5A3AE.1040509@atmel.com>
Date: Mon, 25 Oct 2010 17:35:10 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Thunderbird 2.0.0.24 (Windows/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287233406-8778-1-git-send-email-ulf.samuelsson@atmel.com>	<201010181520.30454.marcin@juszkiewicz.com.pl>	<4CBC4DD4.3010908@atmel.com>
	<i9hpii$gf2$1@dough.gmane.org>	<4CBC7F6A.9040000@atmel.com>	<AANLkTi=xBMvDEKjiaNKy7zijs4DCZwhrSDr=gHVkMh_T@mail.gmail.com>	<4CBCD3FC.5090305@atmel.com>	<AANLkTin6jOdo56fCEaMLNgiKDThBV0yg7x_OvOntwQEM@mail.gmail.com>	<4CBF81FC.3040803@atmel.com>
	<i9osim$dcl$1@dough.gmane.org>	<AANLkTi=ABVTThHSKLbf-QAJcdbOZmQr3B5vw6WVj2hGg@mail.gmail.com>	<i9p0tr$5iq$1@dough.gmane.org>
	<4CC0B81F.6030706@atmel.com>
	<AANLkTi=hLsCrMjw4_mvyniVX8GUsqkVZ2nUnrcm4-UD6@mail.gmail.com>
In-Reply-To: <AANLkTi=hLsCrMjw4_mvyniVX8GUsqkVZ2nUnrcm4-UD6@mail.gmail.com>
X-SA-Exim-Connect-IP: 195.67.226.208
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_SOFTFAIL autolearn=ham version=3.2.5
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
X-List-Received-Date: Mon, 25 Oct 2010 15:38:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks skrev:
> 2010/10/22 Ulf Samuelsson <ulf.samuelsson@atmel.com>:
>> Koen Kooi skrev:
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> On 21-10-10 10:43, Frans Meulenbroeks wrote:
>>>
>>>> PS: my opinion is that machine maintainers generally know better what
>>>> kernel works best for their machines than distro owners;
>>> And what's stopping them to put DEFAULT_PREFERENCE_machine and
>>> COMPATIBLE_MACHINE in the kernel recipes?
>>> There is no technical reason for setting it in machine.conf, so why
>>> should we break the orthogonality for that?
>>>
>>>> PPS: what's next? removing the PREFERRED_PROVIDER_virtual/kernel from
>>>> the machine configs because you feel you know better ?
>>> That is actually an option these days since most kernel recipes set
>>> COMPATIBLE_MACHINE correctly :)
>>> But seriously, there are use cases for one distro to use a different
>>> kernel for a given machine for whatever reasons.
>>>
>>> This whole situation is a mess because recipes/linux is a mess. It would
>>> be a nice topic for OEDEM to see if we should switch to a poky BSP
>>> model. It would boils down to:
>>>
>>> 1 bblayer per machine or SOC_FAMILY containing:
>>> * machine.conf
>>> * first and second stage bootloaders
>>> * kernel
>> I have already come to the conclusion that we could have a single linux.bb
>> recipe.
>>
>> This assumes that you define things like KERNEL_VERSION, SOC_FAMILY
>> etc. outside the recipe and then include files with include filenames
>> containing approproate ENVIRONMENT variables.
>>
>> I.E:
>> include $(KERNEL_VERSION)/kernel_source
>> include $(SOC_FAMILY)/$(KERNEL_VERSION)/kernel_patch
>>
>> etc.
>>
> 
> Isn't that what kernel.bbclass is about ?
> 
> Wrt your example:
> instead of
> include $(KERNEL_VERSION)/kernel_source
> you could say:
> at the place where you define kernel_source:
> SRC_URI = "..."
> 
> Basically what you propose is kind of a template.
> 

Didn't study kernel.bbclass.

A problem with this approach, is that different kernel version
are located in different directories.

http://www.kernel.org/pub/linux/kernel/v2.6/testing/linux-2.6.36-rc8.tar.gz
http://www.kernel.org/pub/linux/kernel/v2.6/linux-2.6.36.tar.bz2

If we want to have a single linux.bb file, then it
seems to be cleaner to have an include file per kernel version which 
specifies both the directory and the file name.

$(KERNEL_VERSION)/kernel_source would then contain

SRC_URI = 
"http://www.kernel.org/pub/linux/kernel/v2.6/linux-$(KERNEL_VERSION).tar.bz2"

for a stable kernel, and


SRC_URI = 
"http://www.kernel.org/pub/linux/kernel/v2.6/testing/linux-$(KERNEL_VERSION).tar.bz2"
for a release candidate.

One this file is created for a kernel version, it would require little 
or no maintenance.

Similar files in the SOC_FAMILY directory structure would control which 
minor patch as well as other architecture specific patches to be added.


> Frans
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



