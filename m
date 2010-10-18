Received: from smtprelay-h31.telenor.se ([213.150.131.4])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1P7yrs-0004s5-TH
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 01:11:49 +0200
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h31.telenor.se (Postfix) with ESMTP id 635B9CF14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 01:10:53 +0200 (CEST)
X-SENDER-IP: [83.227.56.243]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AtgRAFtxvExT4zjzPGdsb2JhbAAHgxiEUplnAQEBATWvSpI6gSKDM3QEiko
X-IronPort-AV: E=Sophos;i="4.57,347,1283724000"; d="scan'208";a="141348421"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.242]) ([83.227.56.243])
	by ipb2.telenor.se with ESMTP; 19 Oct 2010 01:10:53 +0200
Message-ID: <4CBCD3FC.5090305@atmel.com>
Date: Tue, 19 Oct 2010 01:10:52 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287233406-8778-1-git-send-email-ulf.samuelsson@atmel.com>	<201010181520.30454.marcin@juszkiewicz.com.pl>	<4CBC4DD4.3010908@atmel.com>	<i9hpii$gf2$1@dough.gmane.org>
	<4CBC7F6A.9040000@atmel.com>
	<AANLkTi=xBMvDEKjiaNKy7zijs4DCZwhrSDr=gHVkMh_T@mail.gmail.com>
In-Reply-To: <AANLkTi=xBMvDEKjiaNKy7zijs4DCZwhrSDr=gHVkMh_T@mail.gmail.com>
X-Enigmail-Version: 0.95.7
X-SA-Exim-Connect-IP: 213.150.131.4
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
X-List-Received-Date: Mon, 18 Oct 2010 23:11:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Khem Raj skrev:
> On Mon, Oct 18, 2010 at 10:10 AM, Ulf Samuelsson
> <ulf.samuelsson@atmel.com> wrote:
>> Koen Kooi skrev:
>>> On 18-10-10 15:38, Ulf Samuelsson wrote:
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
>>>> The file defines (amongst other things) the
>>>> * kernel version,
>>>> * u-boot version
>>>> * at91bootstrap version
>>>> so you need one file per version.he    
>>> NAK! Machines don't get to decide versions! Please revert that commit
>>> and come up with a better way, e.g. default_preference in the recipes or
>>> distro include files.
>> If I look at the machine files, almost all of them provide
>> a preferred kernel / u-boot. Some also provide version.
> 
> we should avoid pinning versions there. Choosing a type is fine.
> 

Why ?
Is it because it affect rebuild time?
It would be good to understand what problems people see with this.

We are pinning the version to a specific machine, in the kernel recipe.
If we add a new recipe, then we can, by increasing the priority
force a different kernel to be built.
This will not affect anything else.

If the version is in the machine configuration, then a change of
kernel version could force a total rebuild, or?

Any other problem?

BR
Ulf Samuelsson



>> The patch will move the definition from the machine file to the include
>> file for a few board, so reverting the patch will not solve the problem,
>> just spread it out into multiple files.
>> The patch also adds some boards.
> 
> it pins a kernel version thats not ok IMO. You should pin this in the
> kernel recipes
> instead for the machines that should use it using PREFERRED_VERSIONS
> 
>> Having default preference in recipes is not going to make it easy to
>> switch between version so I don't like that method at all.
>>
> 
> what do you mean by easy here ? Its not difficult to change two
> priority numbers. I think we should try to remain inline with our
> policies
> whatever they are otherwise it will create confusion.
> 
>> Using the distro to select boot and kernel, seems flawed since none of
>> the stuff will reside in the file system (my file system)
>> but at least this is easily maintainable.
>>
> 
> usually in OE distros set policy with sufficient knowledge of machine
> characteristics
> you can think of ways to use this approach. distro does not decide on
> which kernel or u-boot
> these are machine specific recipes and you decide which one to feed
> for which machine in the recipe.
> 
>> The best right now seems to be to make a new distro file for each kernel
>> version, which just includes Angstrom and adds version info for kernel,
>> u-boot and at91bootstrap.
>>
>> Long term, I think that there should be something equivalent to DISTRO
>> for the files outside the file system, and that you should be able to
>> select between multiple variants like you select a DISTRO today,
>> but I am not yet into bitbake, so I can't tell where to start.
>>
>> Since the reversal of the patch, wont solve anything,
>> I suggest we agree on how to proceed, and then do the fixes.
>> Is including Angstrom from a kernel specific distro file OK?
> 
> 
> 
>> If a distro file is to include another file, then
>> you have to be able to tell different kernels for
>>
>>
>> I guess we could do:
>>
>> require   conf/distro/include/$(SOC_FAMILY).inc
>>
>> conf/distro/include/at91.inc would contain:
>>
>>
>> PREFERRED_VERSION_at91bootstrap = "2.13"
>> PREFERRED_VERSION_u-boot = "2009.11"
> 
> why is all this needed ?
> 
>> Not sure how to do machine dependent kernel version
>>
>> PREFERRED_VERSION_linux_at91sam9g45ek = "2.6.30"
>> does not feel like it would work.
>> Ideas?
>>
>>


