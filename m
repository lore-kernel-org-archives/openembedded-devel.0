Received: from mail-wg0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UNWcF-0008Jo-V3
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 00:57:16 +0200
Received: by mail-wg0-f47.google.com with SMTP id y10so2170379wgg.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2013 15:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=p4nzRyEglI++5Hr9dApBzVlX2rma3nH62JHrTeyNwn8=;
	b=OgwFqiy/P+0xlwjI4XeHcfdBz84sUqtkHOrLMWyN6Q0KHlY3YiEp1jtWbcQH4PT8rC
	1Dn93voiwSAyvEvBdlV3pCvGSuLX36KCLRaH6BjD2KMcQbaLCFw6CRkaydTUw0EuOOhp
	v3wldgagzffPzHTE4bBTFqAVzugVR/7Jdd5QqvBnsQJRgJQq67/2XG02YI61s/ga0Z34
	5WJcfPiLL6e7l5pdyp2DOruphUMiNgx0Ua4Anm9A1DKFXa1I7YK0gd2DLPtGIvBRc1aX
	JcZecrEidF8pUZ0pfUZaPHyaz+SbiGwLFIHjFI2QBeGyOjayU9R88lm6P8INp0ek0gIh
	0s5Q==
MIME-Version: 1.0
X-Received: by 10.181.12.103 with SMTP id ep7mr25438140wid.12.1365028804125;
	Wed, 03 Apr 2013 15:40:04 -0700 (PDT)
Received: by 10.194.243.137 with HTTP; Wed, 3 Apr 2013 15:40:03 -0700 (PDT)
In-Reply-To: <515CAD3B.4090809@pseudoterminal.org>
References: <515C5DE6.6040702@pseudoterminal.org> <kjhsve$nqm$1@ger.gmane.org>
	<515C8459.3080005@balister.org>
	<FF0E3122-75E0-47DF-978E-CF9982B94B64@dominion.thruhere.net>
	<515C8C04.3040904@balister.org>
	<4A3AFD82-E315-40D4-B21E-4E3005CBE86D@dominion.thruhere.net>
	<515C95F5.3080705@pseudoterminal.org>
	<CAP9ODKrKkqBQ8BduoazZ+xj8U09yWAnUoGBR=P_bN_dY-q0SbQ@mail.gmail.com>
	<1E8177FC-75D6-4877-A3F3-12678E7505BF@gmail.com>
	<515CAD3B.4090809@pseudoterminal.org>
Date: Thu, 4 Apr 2013 00:40:03 +0200
Message-ID: <CA+chaQf3TKFEH+N5=ZapLoEPYaUs69tVmBxd7c-sLfLBENxxFQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: New meta-cubox layer
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
X-List-Received-Date: Wed, 03 Apr 2013 22:57:16 -0000
Content-Type: text/plain; charset=UTF-8

Yes that looks correct, you can also find this thread
http://patches.openembedded.org/patch/37055/ interesting (better on other
archive, but linuxtogo is down now).

Unfortunately that RFC was rejected, so DISTROs have to hardcode list of
supported MACHINEs and their defaulttunes, SHR does the same in:
https://github.com/shr-distribution/meta-smartphone/blob/shr/meta-shr/conf/distro/include/defaulttunes.inc


On Thu, Apr 4, 2013 at 12:29 AM, Carlos Rafael Giani
<dv@pseudoterminal.org>wrote:

> On 2013-04-04 00:21, Khem Raj wrote:
>
>> On Apr 3, 2013, at 2:45 PM, Otavio Salvador <otavio@ossystems.com.br>
>> wrote:
>>
>>  On Wed, Apr 3, 2013 at 5:49 PM, Carlos Rafael Giani
>>> <dv@pseudoterminal.org> wrote:
>>>
>>>> Okay, I think I see the problem now. DEFAULTTUNES should not be set by
>>>> the
>>>> machine config. So, removing it
>>>> and fixing the README accordingly takes care of that. People who for
>>>> example
>>>> want hardfp then
>>>> set DEFAULTTUNE ?= "marvellpj4hf" in their local.conf . Is this correct?
>>>>
>>> You may provide a machine variant with has this set; so it will build
>>> a machine with this enabled.
>>>
>> I would say no. Weather to choose Hard float or not is more of a
>> capability that machine exposes
>> but distro decided the policy see how its done in angstrom for beagle
>> board and beagle bone
>>
>>
> You mean this file? https://github.com/Angstrom-**
> distribution/meta-angstrom/**blob/master/conf/distro/**
> include/arm-defaults.inc<https://github.com/Angstrom-distribution/meta-angstrom/blob/master/conf/distro/include/arm-defaults.inc>
>
> ______________________________**_________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>

