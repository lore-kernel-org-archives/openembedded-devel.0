Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P86Zk-0002xa-Pn
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 09:25:40 +0200
Received: by iwn2 with SMTP id 2so2195609iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 00:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Li2J2DdCFE2xpoDWhOehPwXJ0PzrBKz7VKMVymV4Bts=;
	b=SYgAhhdYS+DvR4HSfRC1SmQkFPE2PT/ZzEOA1xmFn21Eq3eZozmf+1KlExIOvjaCwH
	c/kTD7LXYdhmGcVdJbnM1Tf2HTXt0m3s5PGvsrs7Zi9UDcJDP5dGgq7LKQjU1IeNf8Vs
	EG6RAZAjdhvG95hwjImKeLksJ+4L9K3FLJ0i4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=yDWBFdul6VXeqSjodX7fQ7C5qNd++7vzm3AKfEYwlDBK6aYlyUsioLKNAX+FGRa6Ub
	sjiEgYRiL4pjHuyq4xB8GR6E7QkzvSbL7UnnKvrUOf/kCfePoN1Fn5idh+jJELQGT4Eq
	yGLkm/URTzc9CICVc8I5RxfMH7tr7RtOP8/EI=
MIME-Version: 1.0
Received: by 10.231.174.196 with SMTP id u4mr4351761ibz.19.1287473098838; Tue,
	19 Oct 2010 00:24:58 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 19 Oct 2010 00:24:58 -0700 (PDT)
In-Reply-To: <4CBD02B8.7020805@balister.org>
References: <1287233406-8778-1-git-send-email-ulf.samuelsson@atmel.com>
	<201010181520.30454.marcin@juszkiewicz.com.pl>
	<4CBC4DD4.3010908@atmel.com> <i9hpii$gf2$1@dough.gmane.org>
	<4CBC7F6A.9040000@atmel.com>
	<AANLkTi=xBMvDEKjiaNKy7zijs4DCZwhrSDr=gHVkMh_T@mail.gmail.com>
	<4CBCD3FC.5090305@atmel.com> <4CBD02B8.7020805@balister.org>
Date: Tue, 19 Oct 2010 09:24:58 +0200
Message-ID: <AANLkTikJbhrs7Fh6v1TMNgOo-ctpHNTsr_MtCCi8bN4T@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
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
X-List-Received-Date: Tue, 19 Oct 2010 07:25:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/19 Philip Balister <philip@balister.org>:
> On 10/18/2010 07:10 PM, Ulf Samuelsson wrote:
>>
>> Khem Raj skrev:
>>>
>>> On Mon, Oct 18, 2010 at 10:10 AM, Ulf Samuelsson
>>> <ulf.samuelsson@atmel.com> =A0wrote:
>>>>
>>>> Koen Kooi skrev:
>>>>>
>>>>> On 18-10-10 15:38, Ulf Samuelsson wrote:
>>>>>>
>>>>>> Marcin Juszkiewicz skrev:
>>>>>>>
>>>>>>> Dnia sobota, 16 pazdziernika 2010 o 14:50:02 ulf.samuelsson@atmel.c=
om
>>>>>>> napisaB(a):
>>>>>>>
>>>>>>>> +++ b/conf/machine/include/at91-2.6.30.inc
>>>>>>>> +++ b/conf/machine/include/at91-2.6.32.inc
>>>>>>>
>>>>>>> Do you plan to duplicate that file with each kernel you will produc=
e?
>>>>>>> Create include/at91-sam9.inc and put it there.
>>>>>>>
>>>>>>> Regards,
>>>>>>
>>>>>> This is to allow different kernel versions for different AT91 chips.
>>>>>> This allows both a "stable" version, and a development kernel
>>>>>> to be easily handled.
>>>>>> The file defines (amongst other things) the
>>>>>> * kernel version,
>>>>>> * u-boot version
>>>>>> * at91bootstrap version
>>>>>> so you need one file per version.he
>>>>>
>>>>> NAK! Machines don't get to decide versions! Please revert that commit
>>>>> and come up with a better way, e.g. default_preference in the recipes
>>>>> or
>>>>> distro include files.
>>>>
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
> In general, if you pin a version in a machine file, consider what happens=
 in
> the case of a distro that supports many machines. Your machine build one
> version of something and the other machines build another.
>
> now do an update, upgrade on a package the version you chose may change, =
or
> it may change on the other machines. There are likely some packages you c=
an
> pin version in machine files, but in general, it will cause problems for
> distros that support more than just one machine at a time.
>
> Philip
>
It does not cause a problem if it are machine specific recipes (things
like linux, u-boot etc. those which end up in tmp/work/${MACHINE}...
(and actually it seems logical to let the machine decide for those)

It may (and most likely will) cause problems in the way you describe
for the recipes that are arch specific and not machine specific.
One exception: if a pinning applies for *all* systems in the arch.
E.g. for nios2 gcc 4.1.2 is still the only option so pinning it would
cause no damage (but there it has been resolved in a different way)

Frans.


