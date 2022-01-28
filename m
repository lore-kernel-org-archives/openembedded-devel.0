Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A6D9C433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 17:42:09 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web08.1709.1643391728194697741
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 09:42:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout04.t-online.de (Postfix) with SMTP id 82B9E129D
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 18:42:06 +0100 (CET)
Received: from [192.168.178.83] ([84.163.44.28]) by fwd85.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nDVGA-0G5uU50; Fri, 28 Jan 2022 18:42:06 +0100
Message-ID: <0cbe12a2-5804-e8ba-7e4e-638ef1ef8021@t-online.de>
Date: Fri, 28 Jan 2022 18:42:05 +0100
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
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <CAMKF1srApj-60009gE=U=RgCO_XGbgPJPP9HuPvp99yQ8cAyiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1643391726-00014AB5-DD02CA22/0/0 CLEAN NORMAL
X-TOI-MSGID: bcfe2581-48f6-4dfb-8df1-42358cf96899
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 17:42:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95153

Like this ?

PACKAGECONFIG:append:class-native = 
"${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'tests','', d)}"

or just with

EXTRA_OEMESON = "-Dtests=false" ?


Am 28.01.22 um 18:38 schrieb Khem Raj:
> On Fri, Jan 28, 2022 at 9:35 AM Markus Volk <f_l_k@t-online.de> wrote:
>> https://github.com/openembedded/meta-openembedded/blob/aa22894fa352986a62c4530ad8facd8868b2e535/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb#L24
>>
>> Doesn't this line explicitly disable tests until DISTRO_FEATURE ptests
>> is set ?
> yes but it means we think that tests do work when ptest feature is
> enabled which is not true. So it should be disabled even for distros
> enabling ptest feature.
>
>> Am 28.01.22 um 18:15 schrieb Ross Burton:
>>> +PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,python3-dbusmock-native"
>>>
>>> You don't install the tests, so this serves no purpose.
>>>
>>> Just set -Dtests=false explicitly, unless you install the tests and do the ptest integration.
>>>
>>> Also the dbusmock test in folks is broken, it should be cross-aware.  As you can't check for target python modules it should avoid the check in cross builds.
>>>
>>> Ross
>>>
>>>
>>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#95152): https://lists.openembedded.org/g/openembedded-devel/message/95152
>> Mute This Topic: https://lists.openembedded.org/mt/88678231/3618223
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [f_l_k@t-online.de]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

