Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PARIb-0005Fs-Or
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 19:57:39 +0200
Received: by gxk22 with SMTP id 22so2356549gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 10:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=hwjbGZpAFN5icRq7Q+az32Zako7ooMgSd5biK9OjztY=;
	b=YXpeTPSfxCZkBhD7OXpGYPXF8VaUqulChKogNgQ5+xn80o2i4IXTVJSHPsoevylQD3
	yu7eEBcxtXlAq8PVinUgfHucRL4UZz5iVrxaH4NO0VF2tgyW8Q1kCqWHX03HEROCtL9v
	yRA/NPX4RepWwzwAHCDLbwMrXswJFyZe4FRGk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=m0ulV08ubRFEm28OplWNJZFnuV9V66+Hwse3YD00KVbjaYoSP+T5AWDnlMp5wGaF2W
	LDjmpD5Fx1VtcsiTF+Atp9VEEHCHlES+ib4Sm02AngSYgddUw1jL68R2DVOftM9eWVD9
	gwtmyprCSg2NxfzJTasOpmqQjpuhfu7TlpvWw=
MIME-Version: 1.0
Received: by 10.42.204.3 with SMTP id fk3mr5491144icb.314.1288029411434; Mon,
	25 Oct 2010 10:56:51 -0700 (PDT)
Received: by 10.42.164.194 with HTTP; Mon, 25 Oct 2010 10:56:51 -0700 (PDT)
In-Reply-To: <4CC5A48B.40404@atmel.com>
References: <1287233406-8778-1-git-send-email-ulf.samuelsson@atmel.com>
	<201010181520.30454.marcin@juszkiewicz.com.pl>
	<4CBC4DD4.3010908@atmel.com> <i9hpii$gf2$1@dough.gmane.org>
	<4CBC7F6A.9040000@atmel.com>
	<AANLkTi=xBMvDEKjiaNKy7zijs4DCZwhrSDr=gHVkMh_T@mail.gmail.com>
	<4CBCD3FC.5090305@atmel.com>
	<AANLkTin6jOdo56fCEaMLNgiKDThBV0yg7x_OvOntwQEM@mail.gmail.com>
	<4CBF81FC.3040803@atmel.com>
	<AANLkTim3ucg9ue8OoLDvZP=J-jdt2Dd1g_+Wnf_CZ6jO@mail.gmail.com>
	<4CC5A48B.40404@atmel.com>
Date: Mon, 25 Oct 2010 10:56:51 -0700
Message-ID: <AANLkTi=WLnbdQiOC4B_v5hk+ehR_hUE8hgiGoCgDkEAx@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Mon, 25 Oct 2010 17:57:40 -0000
Content-Type: text/plain; charset=UTF-8

On 10/25/10, Ulf Samuelsson <ulf.samuelsson@atmel.com> wrote:
> Khem Raj skrev:
>> On Wed, Oct 20, 2010 at 4:57 PM, Ulf Samuelsson
>> <ulf.samuelsson@atmel.com> wrote:
>>> Khem Raj skrev:
>>>> On Mon, Oct 18, 2010 at 4:10 PM, Ulf Samuelsson
>>>> <ulf.samuelsson@atmel.com> wrote:
>>>>> Khem Raj skrev:
>>>>>> On Mon, Oct 18, 2010 at 10:10 AM, Ulf Samuelsson
>>>>>> <ulf.samuelsson@atmel.com> wrote:
>>>>>>> Koen Kooi skrev:
>>>>>>>> On 18-10-10 15:38, Ulf Samuelsson wrote:
>>>>>>>>> Marcin Juszkiewicz skrev:
>>>>>>>>>> Dnia sobota, 16 pazdziernika 2010 o 14:50:02
>>>>>>>>>> ulf.samuelsson@atmel.com
>>>>>>>>>> napisaB(a):
>>>>>>>>>>
>>>>>>>>>>> +++ b/conf/machine/include/at91-2.6.30.inc
>>>>>>>>>>> +++ b/conf/machine/include/at91-2.6.32.inc
>>>>>>>>>> Do you plan to duplicate that file with each kernel you will
>>>>>>>>>> produce?
>>>>>>>>>> Create include/at91-sam9.inc and put it there.
>>>>>>>>>>
>>>>>>>>>> Regards,
>>>>>>>>> This is to allow different kernel versions for different AT91
>>>>>>>>> chips.
>>>>>>>>> This allows both a "stable" version, and a development kernel
>>>>>>>>> to be easily handled.
>>>>>>>>> The file defines (amongst other things) the
>>>>>>>>> * kernel version,
>>>>>>>>> * u-boot version
>>>>>>>>> * at91bootstrap version
>>>>>>>>> so you need one file per version.he
>>>>>>>> NAK! Machines don't get to decide versions! Please revert that
>>>>>>>> commit
>>>>>>>> and come up with a better way, e.g. default_preference in the
>>>>>>>> recipes
>>>>>>>> or
>>>>>>>> distro include files.
>>>>>>> If I look at the machine files, almost all of them provide
>>>>>>> a preferred kernel / u-boot. Some also provide version.
>>>>>> we should avoid pinning versions there. Choosing a type is fine.
>>>>>>
>>>>> Why ?
>>>>> Is it because it affect rebuild time?
>>>>> It would be good to understand what problems people see with this.
>>>> Well we have distro which sets policies including which recipe
>>>> versions to be pinned
>>>> machine configuration decides on various machine features. There are
>>>> different ways to do it
>>>> but if we remain consistent in what we do, we can make it more
>>>> understandable for others
>>>>
>>>> If you feel strongly that your approach is good I think it should be
>>>> decided if this is suitable
>>>> for majority of OE distro and machines, If it has technical merits
>>>> over existing approaches
>>>> people will be interested in it.
>>>>
>>>>> We are pinning the version to a specific machine, in the kernel recipe.
>>>>> If we add a new recipe, then we can, by increasing the priority
>>>>> force a different kernel to be built.
>>>>> This will not affect anything else.
>>>>>
>>>>> If the version is in the machine configuration, then a change of
>>>>> kernel version could force a total rebuild, or?
>>>>>
>>>> I dont think it will force any rebuild or anything. It will just not
>>>> be the way other machines
>>>> do things. The machine configuration tend to be version agnostic as
>>>> per current approach.
>>>>
>>>>> Any other problem?
>>>>>
>>>> what are the issues that you see in following approaches suggested in
>>>> this thread so far ?
>>> 1) Many boards do put kernel version in the machine conf file.
>>>   The patch was created to collect common stuff in an include file
>>>   to make maintenance easier.
>>>
>>> 2) I cannot assume that all Atmel chips should use the same kernel,
>>>   so a single include file will not make it.
>>>
>>> 3) I want to be able to work with two kernel versions for the same chip.
>>>   This is to have one stable kernel, and one development kernel.
>>>   The use of the develoment kernel, should not make the stable version
>>>   unbuildable.
>>
>> you want to ship with two kernel or you want to work with two kernel
>> versions?
>> if you just want to develop then you can have the stable kernel
>> version as preferred version
>> and override that in local.conf with yout dev kernel for development
>> purposes. Once you are
>> done with it and it is your next stable just add
>> DEFAULT_PREFERENCE_<machine> = "1" in that recipe
>> and it should become new default for this machine.
>>
>
> I would like to ship with two kernels.
> one "stable" kernel, and another "development" kernel
> which is accessible to others to allow shared responsibility
> for testing purposes.
>

you can either use different version of different recipe name
with different name you can just override the virtual/kernel
PREFERRED_PROVIDER_virtual/kernel = "/whatever/"

> Preferably, it should be possible to build both,
> without having to rebuild the complete root fs.
>

yes why not. One just needs to flip the PREFERRED_VERSION
in local.conf file and he should not get the kernel version he chose.
and no rebuild of rfs is needed.

>
>
>>
>> for release you can create your own pinned config file and call it
>> inside distro config you have
>> and have two distros one for dev and one for stable
>>>   If I put the preferred version in the recipe, then I can only work
>>>   with one kernel.
>>>
>>>   If I try to use the preferred version in the recipe, then I
>>>   have to have two machine files.
>>>   I.E:
>>>   at91sam9g45ek
>>>   at91sam9g45ek-devel
>>>
>>>   and I have to support both machines in the recipe.
>>>
>>>   Once I have come to a point, where the development kernel is
>>>   to become the stable version, then I have to edit the recipe
>>>   again to make this the official.
>>>   I have to remove all references to "sam9g45ek",
>>>   then I have to modify the "sam9g45ek-devel" settings to refer to
>>>   "sam9g45ek", remove the sam9g45ek.conf and rename the
>>>   sam9g45ek-devel.conf to sam9g45ek.conf.
>>>
>>>   I then have to retest everything!
>>>
>>>   As I see it, the kernel/u-boot/at91bootstrap hangs together,
>>>   and it is easier to maintain a single include file with versions
>>>   for this, than to maintain the three recipes.
>>>
>>>   If I maintain in the recipes, I have to create a lot
>>>   of preferred_version_<machine>) in multiple kernel recipes,
>>>   and with my method, I include a single file in the machine
>>>   configuration.
>>>   If I want to change kernel version, I edit a few characters.
>>>
>>> 4. This points to another weakness.
>>>   You can only build a certain machine in one way.
>>>
>>>   Today, when we specify a MACHINE, we use "$MACHINE.conf"
>>>
>>>   It would be better, if you could have several machine configuration
>>>   files referring to the same MACHINE, and specifying the MACHINE
>>>   in the configuration file.
>>>
>>>   local.conf would then contain
>>>
>>>   MACHINE_CONFIG = at91sam9g45ek-2.6.30.conf
>>>
>>>   "at91sam9g45ek-2.6.30.conf" would contain
>>>
>>>   MACHINE = at91sam9g45ek
>>>
>>>   This would allow several configuration files referring to the same
>>>   machine.
>>>   The machine configuration must support selecting separate
>>>   * linux ".config"
>>>   * uboot configuration
>>>   * boot monitor configuration.
>>
>> why not use existing MACHINE_FEATURES to steer the features you would
>> like to change in .config files.
>>
>>
>>>   Possibly, then machine configuration should support downloading such
>>>   stuff from internet.
>>>
>>>   (I don't expect the mainline OE to contain more than one "stable"
>>>    version)
>>>
>>>
>
> BR
> Ulf
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


-- 
-Khem


