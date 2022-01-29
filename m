Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16AE8C433F5
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 14:21:30 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web12.6257.1643466088636224548
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Jan 2022 06:21:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout01.t-online.de (Postfix) with SMTP id B88949798
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Jan 2022 15:21:26 +0100 (CET)
Received: from [192.168.178.83] ([84.163.40.80]) by fwd73.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nDobW-34SqHJ0; Sat, 29 Jan 2022 15:21:26 +0100
Message-ID: <a06e34b6-56cf-59fa-0a99-21a861b3d9c0@t-online.de>
Date: Sat, 29 Jan 2022 15:21:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-gnome][PATCH] folks: make some dependencies optional
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20220125181339.114315-1-f_l_k@t-online.de>
 <26359.1643390123448861343@lists.openembedded.org>
 <81dde554-b80e-43aa-cc85-033f858ff2a0@t-online.de>
 <CAMKF1srApj-60009gE=U=RgCO_XGbgPJPP9HuPvp99yQ8cAyiQ@mail.gmail.com>
 <0cbe12a2-5804-e8ba-7e4e-638ef1ef8021@t-online.de>
 <CAMKF1sqrLsFvLwxWt9g6Ktt+-EjtEfVBowvuXp-CcEzJdxc1bg@mail.gmail.com>
 <a1395a8e-ba6e-9148-b028-5fbdf8caf41f@t-online.de>
 <CAMKF1son2JrcBe8jia4=Mdjwkp=jDgP6y5wX0b4kT_eUPc0uag@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <CAMKF1son2JrcBe8jia4=Mdjwkp=jDgP6y5wX0b4kT_eUPc0uag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1643466086-0000C4DD-4414BF08/0/0 CLEAN NORMAL
X-TOI-MSGID: c569f112-60e4-426c-943d-269fb3c041f7
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Jan 2022 14:21:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95169

https://github.com/GNOME/folks/search?q=readline

looks like a hard dependency to me

Am 28.01.22 um 19:28 schrieb Khem Raj:
> On Fri, Jan 28, 2022 at 9:54 AM Markus Volk <f_l_k@t-online.de> wrote:
>> inspect_tool has a dependency on readline. That is pulled in
>> automatically but should we also add it like this to make clear it is
>> needed here?
>>
>> PACKAGECONFIG[inspect_tool] =
>> "-Dinspect_tool=true,-Dinspect_tool=false,readline"
>>
> hmm it is hard dependency on readline ? or will it also work with
> libedit provided editline
> it would be good to check and perhaps have both the options, some
> policies may prefer
> to not use readline. Regardless if it supports both, adding a
> dependency is preferred in packageconfig
> if thats the feature needing that dependency.
>
>> Am 28.01.22 um 18:43 schrieb Khem Raj:
>>> On Fri, Jan 28, 2022 at 9:42 AM Markus Volk <f_l_k@t-online.de> wrote:
>>>> Like this ?
>>>>
>>>> PACKAGECONFIG:append:class-native =
>>>> "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'tests','', d)}"
>>>>
>>>> or just with
>>>>
>>>> EXTRA_OEMESON = "-Dtests=false" ?
>>>>
>>> you cant control ptest distro feature here so its better to remove
>>> that packageconfig and just set
>>>
>>> EXTRA_OEMESON += "-Dtests=false"
>>>> Am 28.01.22 um 18:38 schrieb Khem Raj:
>>>>> On Fri, Jan 28, 2022 at 9:35 AM Markus Volk <f_l_k@t-online.de> wrote:
>>>>>> https://github.com/openembedded/meta-openembedded/blob/aa22894fa352986a62c4530ad8facd8868b2e535/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb#L24
>>>>>>
>>>>>> Doesn't this line explicitly disable tests until DISTRO_FEATURE ptests
>>>>>> is set ?
>>>>> yes but it means we think that tests do work when ptest feature is
>>>>> enabled which is not true. So it should be disabled even for distros
>>>>> enabling ptest feature.
>>>>>
>>>>>> Am 28.01.22 um 18:15 schrieb Ross Burton:
>>>>>>> +PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,python3-dbusmock-native"
>>>>>>>
>>>>>>> You don't install the tests, so this serves no purpose.
>>>>>>>
>>>>>>> Just set -Dtests=false explicitly, unless you install the tests and do the ptest integration.
>>>>>>>
>>>>>>> Also the dbusmock test in folks is broken, it should be cross-aware.  As you can't check for target python modules it should avoid the check in cross builds.
>>>>>>>
>>>>>>> Ross
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>
>>>>
>>>>
>>>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#95158): https://lists.openembedded.org/g/openembedded-devel/message/95158
>> Mute This Topic: https://lists.openembedded.org/mt/88678231/3618223
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [f_l_k@t-online.de]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

