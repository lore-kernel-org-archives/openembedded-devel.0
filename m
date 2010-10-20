Received: from smtprelay-b11.telenor.se ([62.127.194.20])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1P8its-0003vS-9N
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 02:20:56 +0200
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-b11.telenor.se (Postfix) with ESMTP id C66E3EA3BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 01:57:50 +0200 (CEST)
X-SENDER-IP: [83.227.56.243]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AusUAKoev0xT4zjzPGdsb2JhbAAHgxeEUplrAQEBATWuGJIggSKDNHQEiks
X-IronPort-AV: E=Sophos;i="4.57,357,1283724000"; d="scan'208";a="1683471297"
Received: from c-f338e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.250]) ([83.227.56.243])
	by ipb4.telenor.se with ESMTP; 21 Oct 2010 01:57:50 +0200
Message-ID: <4CBF81FC.3040803@atmel.com>
Date: Thu, 21 Oct 2010 01:57:48 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
User-Agent: Thunderbird 2.0.0.24 (Windows/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1287233406-8778-1-git-send-email-ulf.samuelsson@atmel.com>	<201010181520.30454.marcin@juszkiewicz.com.pl>	<4CBC4DD4.3010908@atmel.com>	<i9hpii$gf2$1@dough.gmane.org>
	<4CBC7F6A.9040000@atmel.com>	<AANLkTi=xBMvDEKjiaNKy7zijs4DCZwhrSDr=gHVkMh_T@mail.gmail.com>	<4CBCD3FC.5090305@atmel.com>
	<AANLkTin6jOdo56fCEaMLNgiKDThBV0yg7x_OvOntwQEM@mail.gmail.com>
In-Reply-To: <AANLkTin6jOdo56fCEaMLNgiKDThBV0yg7x_OvOntwQEM@mail.gmail.com>
X-SA-Exim-Connect-IP: 62.127.194.20
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
X-List-Received-Date: Thu, 21 Oct 2010 00:20:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj skrev:
> On Mon, Oct 18, 2010 at 4:10 PM, Ulf Samuelsson
> <ulf.samuelsson@atmel.com> wrote:
>> Khem Raj skrev:
>>> On Mon, Oct 18, 2010 at 10:10 AM, Ulf Samuelsson
>>> <ulf.samuelsson@atmel.com> wrote:
>>>> Koen Kooi skrev:
>>>>> On 18-10-10 15:38, Ulf Samuelsson wrote:
>>>>>> Marcin Juszkiewicz skrev:
>>>>>>> Dnia sobota, 16 pazdziernika 2010 o 14:50:02 ulf.samuelsson@atmel.com
>>>>>>> napisaB(a):
>>>>>>>
>>>>>>>> +++ b/conf/machine/include/at91-2.6.30.inc
>>>>>>>> +++ b/conf/machine/include/at91-2.6.32.inc
>>>>>>> Do you plan to duplicate that file with each kernel you will produce?
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
>>>>> and come up with a better way, e.g. default_preference in the recipes or
>>>>> distro include files.
>>>> If I look at the machine files, almost all of them provide
>>>> a preferred kernel / u-boot. Some also provide version.
>>> we should avoid pinning versions there. Choosing a type is fine.
>>>
>> Why ?
>> Is it because it affect rebuild time?
>> It would be good to understand what problems people see with this.
> 
> Well we have distro which sets policies including which recipe
> versions to be pinned
> machine configuration decides on various machine features. There are
> different ways to do it
> but if we remain consistent in what we do, we can make it more
> understandable for others
> 
> If you feel strongly that your approach is good I think it should be
> decided if this is suitable
> for majority of OE distro and machines, If it has technical merits
> over existing approaches
> people will be interested in it.
> 
>> We are pinning the version to a specific machine, in the kernel recipe.
>> If we add a new recipe, then we can, by increasing the priority
>> force a different kernel to be built.
>> This will not affect anything else.
>>
>> If the version is in the machine configuration, then a change of
>> kernel version could force a total rebuild, or?
>>
> 
> I dont think it will force any rebuild or anything. It will just not
> be the way other machines
> do things. The machine configuration tend to be version agnostic as
> per current approach.
> 
>> Any other problem?
>>
> 
> what are the issues that you see in following approaches suggested in
> this thread so far ?

1) Many boards do put kernel version in the machine conf file.
    The patch was created to collect common stuff in an include file
    to make maintenance easier.

2) I cannot assume that all Atmel chips should use the same kernel,
    so a single include file will not make it.

3) I want to be able to work with two kernel versions for the same chip.
    This is to have one stable kernel, and one development kernel.
    The use of the develoment kernel, should not make the stable version
    unbuildable.

    If I put the preferred version in the recipe, then I can only work
    with one kernel.

    If I try to use the preferred version in the recipe, then I
    have to have two machine files.
    I.E:
    at91sam9g45ek
    at91sam9g45ek-devel

    and I have to support both machines in the recipe.

    Once I have come to a point, where the development kernel is
    to become the stable version, then I have to edit the recipe
    again to make this the official.
    I have to remove all references to "sam9g45ek",
    then I have to modify the "sam9g45ek-devel" settings to refer to
    "sam9g45ek", remove the sam9g45ek.conf and rename the
    sam9g45ek-devel.conf to sam9g45ek.conf.

    I then have to retest everything!

    As I see it, the kernel/u-boot/at91bootstrap hangs together,
    and it is easier to maintain a single include file with versions
    for this, than to maintain the three recipes.

    If I maintain in the recipes, I have to create a lot
    of preferred_version_<machine>) in multiple kernel recipes,
    and with my method, I include a single file in the machine
    configuration.
    If I want to change kernel version, I edit a few characters.

4. This points to another weakness.
    You can only build a certain machine in one way.

    Today, when we specify a MACHINE, we use "$MACHINE.conf"

    It would be better, if you could have several machine configuration
    files referring to the same MACHINE, and specifying the MACHINE
    in the configuration file.

    local.conf would then contain

    MACHINE_CONFIG = at91sam9g45ek-2.6.30.conf

    "at91sam9g45ek-2.6.30.conf" would contain

    MACHINE = at91sam9g45ek

    This would allow several configuration files referring to the same
    machine.
    The machine configuration must support selecting separate
    * linux ".config"
    * uboot configuration
    * boot monitor configuration.
    Possibly, then machine configuration should support downloading such
    stuff from internet.

    (I don't expect the mainline OE to contain more than one "stable"
     version)


BR
Ulf




