Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P7zE8-0005IT-Vx
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 01:34:49 +0200
Received: by ywl5 with SMTP id 5so884608ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 16:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=UT1bg7ms0dp493TzYrdTlvnUPmwS/8Q9xzIlVypg7IA=;
	b=v0ZJqzCcUbbHtGl86XIkteRcbN9akALcdTe4gwkIthQftT1sLW6r61/tQbdmUt/YXS
	39bjUKkv2gxH3X7rhAgxIp0nnzmG7WQD0r/78oTPfCrxjlvMlAkuzinUnbstsIQH1iNh
	8tUcB4QzttURXN1BjaRIimEIYf6acXtJdAEKM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=GU26HLVFYDZap81YjOTqC1bFT/N9L9XG++XQKPQddnutyyEAsPJ6lXJ6vY4Cj5g3Bj
	1ZXIG7TTr7L8ETqt73Moi7BAAokxJ6m1SUCDJNWho/6j93NM6gSVpAdn3PJBs/+Bs+/x
	wrgiuAV/E78quVPUDD3jeYQVkc9xHcHzFTZvQ=
Received: by 10.90.102.15 with SMTP id z15mr2214992agb.18.1287444853757; Mon,
	18 Oct 2010 16:34:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.6 with HTTP; Mon, 18 Oct 2010 16:33:53 -0700 (PDT)
In-Reply-To: <4CBCD3FC.5090305@atmel.com>
References: <1287233406-8778-1-git-send-email-ulf.samuelsson@atmel.com>
	<201010181520.30454.marcin@juszkiewicz.com.pl>
	<4CBC4DD4.3010908@atmel.com>
	<i9hpii$gf2$1@dough.gmane.org> <4CBC7F6A.9040000@atmel.com>
	<AANLkTi=xBMvDEKjiaNKy7zijs4DCZwhrSDr=gHVkMh_T@mail.gmail.com>
	<4CBCD3FC.5090305@atmel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Oct 2010 16:33:53 -0700
Message-ID: <AANLkTin6jOdo56fCEaMLNgiKDThBV0yg7x_OvOntwQEM@mail.gmail.com>
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
X-List-Received-Date: Mon, 18 Oct 2010 23:34:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 18, 2010 at 4:10 PM, Ulf Samuelsson
<ulf.samuelsson@atmel.com> wrote:
> Khem Raj skrev:
>> On Mon, Oct 18, 2010 at 10:10 AM, Ulf Samuelsson
>> <ulf.samuelsson@atmel.com> wrote:
>>> Koen Kooi skrev:
>>>> On 18-10-10 15:38, Ulf Samuelsson wrote:
>>>>> Marcin Juszkiewicz skrev:
>>>>>> Dnia sobota, 16 pazdziernika 2010 o 14:50:02 ulf.samuelsson@atmel.co=
m
>>>>>> napisaB(a):
>>>>>>
>>>>>>> +++ b/conf/machine/include/at91-2.6.30.inc
>>>>>>> +++ b/conf/machine/include/at91-2.6.32.inc
>>>>>> Do you plan to duplicate that file with each kernel you will produce=
?
>>>>>> Create include/at91-sam9.inc and put it there.
>>>>>>
>>>>>> Regards,
>>>>> This is to allow different kernel versions for different AT91 chips.
>>>>> This allows both a "stable" version, and a development kernel
>>>>> to be easily handled.
>>>>> The file defines (amongst other things) the
>>>>> * kernel version,
>>>>> * u-boot version
>>>>> * at91bootstrap version
>>>>> so you need one file per version.he
>>>> NAK! Machines don't get to decide versions! Please revert that commit
>>>> and come up with a better way, e.g. default_preference in the recipes =
or
>>>> distro include files.
>>> If I look at the machine files, almost all of them provide
>>> a preferred kernel / u-boot. Some also provide version.
>>
>> we should avoid pinning versions there. Choosing a type is fine.
>>
>
> Why ?
> Is it because it affect rebuild time?
> It would be good to understand what problems people see with this.

Well we have distro which sets policies including which recipe
versions to be pinned
machine configuration decides on various machine features. There are
different ways to do it
but if we remain consistent in what we do, we can make it more
understandable for others

If you feel strongly that your approach is good I think it should be
decided if this is suitable
for majority of OE distro and machines, If it has technical merits
over existing approaches
people will be interested in it.

>
> We are pinning the version to a specific machine, in the kernel recipe.
> If we add a new recipe, then we can, by increasing the priority
> force a different kernel to be built.
> This will not affect anything else.
>
> If the version is in the machine configuration, then a change of
> kernel version could force a total rebuild, or?
>

I dont think it will force any rebuild or anything. It will just not
be the way other machines
do things. The machine configuration tend to be version agnostic as
per current approach.

> Any other problem?
>

what are the issues that you see in following approaches suggested in
this thread so far ?


> BR
> Ulf Samuelsson
>
>
>
>>> The patch will move the definition from the machine file to the include
>>> file for a few board, so reverting the patch will not solve the problem=
,
>>> just spread it out into multiple files.
>>> The patch also adds some boards.
>>
>> it pins a kernel version thats not ok IMO. You should pin this in the
>> kernel recipes
>> instead for the machines that should use it using PREFERRED_VERSIONS
>>
>>> Having default preference in recipes is not going to make it easy to
>>> switch between version so I don't like that method at all.
>>>
>>
>> what do you mean by easy here ? Its not difficult to change two
>> priority numbers. I think we should try to remain inline with our
>> policies
>> whatever they are otherwise it will create confusion.
>>
>>> Using the distro to select boot and kernel, seems flawed since none of
>>> the stuff will reside in the file system (my file system)
>>> but at least this is easily maintainable.
>>>
>>
>> usually in OE distros set policy with sufficient knowledge of machine
>> characteristics
>> you can think of ways to use this approach. distro does not decide on
>> which kernel or u-boot
>> these are machine specific recipes and you decide which one to feed
>> for which machine in the recipe.
>>
>>> The best right now seems to be to make a new distro file for each kerne=
l
>>> version, which just includes Angstrom and adds version info for kernel,
>>> u-boot and at91bootstrap.
>>>
>>> Long term, I think that there should be something equivalent to DISTRO
>>> for the files outside the file system, and that you should be able to
>>> select between multiple variants like you select a DISTRO today,
>>> but I am not yet into bitbake, so I can't tell where to start.
>>>
>>> Since the reversal of the patch, wont solve anything,
>>> I suggest we agree on how to proceed, and then do the fixes.
>>> Is including Angstrom from a kernel specific distro file OK?
>>
>>
>>
>>> If a distro file is to include another file, then
>>> you have to be able to tell different kernels for
>>>
>>>
>>> I guess we could do:
>>>
>>> require =C2=A0 conf/distro/include/$(SOC_FAMILY).inc
>>>
>>> conf/distro/include/at91.inc would contain:
>>>
>>>
>>> PREFERRED_VERSION_at91bootstrap =3D "2.13"
>>> PREFERRED_VERSION_u-boot =3D "2009.11"
>>
>> why is all this needed ?
>>
>>> Not sure how to do machine dependent kernel version
>>>
>>> PREFERRED_VERSION_linux_at91sam9g45ek =3D "2.6.30"
>>> does not feel like it would work.
>>> Ideas?
>>>
>>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


