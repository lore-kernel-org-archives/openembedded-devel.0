Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P8oD4-0004EW-86
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 08:01:11 +0200
Received: by ywl5 with SMTP id 5so2659102ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 23:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=9SZOooJgSOTWdG2AHbyfUZM4fG/lL24NAbHHi8WMEuo=;
	b=XlRqCds8iMCVHkPKFZcAJko1gXkNfbgPkmZyxojX3Ina+DtFXuHE7cVh7Zc0zIKQP9
	UdOp7DleAQ0bTyPURM7e4NQHZOBw2rdrg0Qex3HKK9pXncLuIHLDmchYf+0O17/AP9FX
	NHFhk+Bo6hN6K/i5TNRjAcNhwY50kuNUWfHMA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=o64ZITVbNPd7KdGWU/8nvCmHLKpqLXg1wCiEiMh3xBW0cAW3ZXCw4l/z50FWVo/gO7
	PsA52vphHYj893aa4n4F6oJkaP74YDMKZTa6AZfoM9UGlIlGAGnN9aut0XUqY1aTVvlY
	ZxNYmuRrR4aTZ23r/ZtT23Tg2zkoo3dY4XXhE=
Received: by 10.90.86.18 with SMTP id j18mr1082741agb.120.1287640825829; Wed,
	20 Oct 2010 23:00:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.6 with HTTP; Wed, 20 Oct 2010 23:00:05 -0700 (PDT)
In-Reply-To: <4CBF81FC.3040803@atmel.com>
References: <1287233406-8778-1-git-send-email-ulf.samuelsson@atmel.com>
	<201010181520.30454.marcin@juszkiewicz.com.pl>
	<4CBC4DD4.3010908@atmel.com>
	<i9hpii$gf2$1@dough.gmane.org> <4CBC7F6A.9040000@atmel.com>
	<AANLkTi=xBMvDEKjiaNKy7zijs4DCZwhrSDr=gHVkMh_T@mail.gmail.com>
	<4CBCD3FC.5090305@atmel.com>
	<AANLkTin6jOdo56fCEaMLNgiKDThBV0yg7x_OvOntwQEM@mail.gmail.com>
	<4CBF81FC.3040803@atmel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Oct 2010 23:00:05 -0700
Message-ID: <AANLkTim3ucg9ue8OoLDvZP=J-jdt2Dd1g_+Wnf_CZ6jO@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
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
X-List-Received-Date: Thu, 21 Oct 2010 06:01:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 20, 2010 at 4:57 PM, Ulf Samuelsson
<ulf.samuelsson@atmel.com> wrote:
> Khem Raj skrev:
>>
>> On Mon, Oct 18, 2010 at 4:10 PM, Ulf Samuelsson
>> <ulf.samuelsson@atmel.com> wrote:
>>>
>>> Khem Raj skrev:
>>>>
>>>> On Mon, Oct 18, 2010 at 10:10 AM, Ulf Samuelsson
>>>> <ulf.samuelsson@atmel.com> wrote:
>>>>>
>>>>> Koen Kooi skrev:
>>>>>>
>>>>>> On 18-10-10 15:38, Ulf Samuelsson wrote:
>>>>>>>
>>>>>>> Marcin Juszkiewicz skrev:
>>>>>>>>
>>>>>>>> Dnia sobota, 16 pazdziernika 2010 o 14:50:02
>>>>>>>> ulf.samuelsson@atmel.com
>>>>>>>> napisaB(a):
>>>>>>>>
>>>>>>>>> +++ b/conf/machine/include/at91-2.6.30.inc
>>>>>>>>> +++ b/conf/machine/include/at91-2.6.32.inc
>>>>>>>>
>>>>>>>> Do you plan to duplicate that file with each kernel you will
>>>>>>>> produce?
>>>>>>>> Create include/at91-sam9.inc and put it there.
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>
>>>>>>> This is to allow different kernel versions for different AT91 chips=
.
>>>>>>> This allows both a "stable" version, and a development kernel
>>>>>>> to be easily handled.
>>>>>>> The file defines (amongst other things) the
>>>>>>> * kernel version,
>>>>>>> * u-boot version
>>>>>>> * at91bootstrap version
>>>>>>> so you need one file per version.he
>>>>>>
>>>>>> NAK! Machines don't get to decide versions! Please revert that commi=
t
>>>>>> and come up with a better way, e.g. default_preference in the recipe=
s
>>>>>> or
>>>>>> distro include files.
>>>>>
>>>>> If I look at the machine files, almost all of them provide
>>>>> a preferred kernel / u-boot. Some also provide version.
>>>>
>>>> we should avoid pinning versions there. Choosing a type is fine.
>>>>
>>> Why ?
>>> Is it because it affect rebuild time?
>>> It would be good to understand what problems people see with this.
>>
>> Well we have distro which sets policies including which recipe
>> versions to be pinned
>> machine configuration decides on various machine features. There are
>> different ways to do it
>> but if we remain consistent in what we do, we can make it more
>> understandable for others
>>
>> If you feel strongly that your approach is good I think it should be
>> decided if this is suitable
>> for majority of OE distro and machines, If it has technical merits
>> over existing approaches
>> people will be interested in it.
>>
>>> We are pinning the version to a specific machine, in the kernel recipe.
>>> If we add a new recipe, then we can, by increasing the priority
>>> force a different kernel to be built.
>>> This will not affect anything else.
>>>
>>> If the version is in the machine configuration, then a change of
>>> kernel version could force a total rebuild, or?
>>>
>>
>> I dont think it will force any rebuild or anything. It will just not
>> be the way other machines
>> do things. The machine configuration tend to be version agnostic as
>> per current approach.
>>
>>> Any other problem?
>>>
>>
>> what are the issues that you see in following approaches suggested in
>> this thread so far ?
>
> 1) Many boards do put kernel version in the machine conf file.
> =C2=A0 The patch was created to collect common stuff in an include file
> =C2=A0 to make maintenance easier.
>
> 2) I cannot assume that all Atmel chips should use the same kernel,
> =C2=A0 so a single include file will not make it.
>
> 3) I want to be able to work with two kernel versions for the same chip.
> =C2=A0 This is to have one stable kernel, and one development kernel.
> =C2=A0 The use of the develoment kernel, should not make the stable versi=
on
> =C2=A0 unbuildable.

you want to ship with two kernel or you want to work with two kernel versio=
ns?
if you just want to develop then you can have the stable kernel
version as preferred version
and override that in local.conf with yout dev kernel for development
purposes. Once you are
done with it and it is your next stable just add
DEFAULT_PREFERENCE_<machine> =3D "1" in that recipe
and it should become new default for this machine.


for release you can create your own pinned config file and call it
inside distro config you have
and have two distros one for dev and one for stable
>
> =C2=A0 If I put the preferred version in the recipe, then I can only work
> =C2=A0 with one kernel.
>
> =C2=A0 If I try to use the preferred version in the recipe, then I
> =C2=A0 have to have two machine files.
> =C2=A0 I.E:
> =C2=A0 at91sam9g45ek
> =C2=A0 at91sam9g45ek-devel
>
> =C2=A0 and I have to support both machines in the recipe.
>
> =C2=A0 Once I have come to a point, where the development kernel is
> =C2=A0 to become the stable version, then I have to edit the recipe
> =C2=A0 again to make this the official.
> =C2=A0 I have to remove all references to "sam9g45ek",
> =C2=A0 then I have to modify the "sam9g45ek-devel" settings to refer to
> =C2=A0 "sam9g45ek", remove the sam9g45ek.conf and rename the
> =C2=A0 sam9g45ek-devel.conf to sam9g45ek.conf.
>
> =C2=A0 I then have to retest everything!
>
> =C2=A0 As I see it, the kernel/u-boot/at91bootstrap hangs together,
> =C2=A0 and it is easier to maintain a single include file with versions
> =C2=A0 for this, than to maintain the three recipes.
>
> =C2=A0 If I maintain in the recipes, I have to create a lot
> =C2=A0 of preferred_version_<machine>) in multiple kernel recipes,
> =C2=A0 and with my method, I include a single file in the machine
> =C2=A0 configuration.
> =C2=A0 If I want to change kernel version, I edit a few characters.
>
> 4. This points to another weakness.
> =C2=A0 You can only build a certain machine in one way.
>
> =C2=A0 Today, when we specify a MACHINE, we use "$MACHINE.conf"
>
> =C2=A0 It would be better, if you could have several machine configuratio=
n
> =C2=A0 files referring to the same MACHINE, and specifying the MACHINE
> =C2=A0 in the configuration file.
>
> =C2=A0 local.conf would then contain
>
> =C2=A0 MACHINE_CONFIG =3D at91sam9g45ek-2.6.30.conf
>
> =C2=A0 "at91sam9g45ek-2.6.30.conf" would contain
>
> =C2=A0 MACHINE =3D at91sam9g45ek
>
> =C2=A0 This would allow several configuration files referring to the same
> =C2=A0 machine.
> =C2=A0 The machine configuration must support selecting separate
> =C2=A0 * linux ".config"
> =C2=A0 * uboot configuration
> =C2=A0 * boot monitor configuration.

why not use existing MACHINE_FEATURES to steer the features you would
like to change in .config files.


> =C2=A0 Possibly, then machine configuration should support downloading su=
ch
> =C2=A0 stuff from internet.
>
> =C2=A0 (I don't expect the mainline OE to contain more than one "stable"
> =C2=A0 =C2=A0version)
>
>
> BR
> Ulf
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


