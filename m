Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44119C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 00:33:31 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.4219.1647563609833382040
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 17:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81,
 mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout03.t-online.de (Postfix) with SMTP id 614AD3121
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Mar 2022 01:33:28 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.192]) by fwd78.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nV0YU-3ws3E10; Fri, 18 Mar 2022 01:33:22 +0100
Message-ID: <fc3bb39c-0ec2-7332-1c72-9372f2988830@t-online.de>
Date: Fri, 18 Mar 2022 01:33:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-oe][PATCHv2] perfetto: initial add commit
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20220317165929.527418-1-f_l_k@t-online.de>
 <CAAnfSTvFTEDAnHETjQX99vPNRq6fxcZdyB_93kcdpjbEeXzZhg@mail.gmail.com>
 <2029191d-9920-31ce-e5bb-6bdd0c68417d@t-online.de>
 <CAMKF1spM5LNvuiSH4Oa+dUZpWPnUTyqhY2PhyKvnkD=11V3DNw@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <CAMKF1spM5LNvuiSH4Oa+dUZpWPnUTyqhY2PhyKvnkD=11V3DNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1647563602-0000AD4E-5105EF6E/0/0 CLEAN NORMAL
X-TOI-MSGID: 40644d7c-3645-437c-8b25-d3e706844ce5
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Mar 2022 00:33:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96052

Will do this in future. Sorry for that

Am 18.03.22 um 01:31 schrieb Khem Raj:
> Mark them RFC or something like that, so its clear that you dont
> intend to include them.
>
> On Thu, Mar 17, 2022 at 4:31 PM Markus Volk <f_l_k@t-online.de> wrote:
>>
>>>> +From f70ed62ce4a42525c9738455966bec2ed9647568 Mon Sep 17 00:00:00 2001
>>>> +From: Markus Volk <f_l_k@t-online.de>
>>>> +Date: Thu, 17 Mar 2022 15:44:23 +0100
>>>> +Subject: [PATCH] meson.build: add pc file; build shared
>>> No Upstream-Status or Signed-off-by.
>>>
>> These recipes are pretty ugly. I sent them to the mailing list, mostly
>> in case someone wants to play around with them.
>>
>> If that's really the plan to add them i'll update the status and fix the
>> other little problems
>>
>>>> +do_install:append() {
>>>> +       install -d ${D}${includedir}
>>>> +       install -m 0664 ${S}/sdk/perfetto.h ${D}${includedir}
>>>> +}
>>> As you're editing the meson why not just get it to install these too?
>> I was just too lazy after I found out that this header was needed for
>> Mesa but was not installed.
>>>> +FILES:${PN} = "${includedir} ${libdir}"
>>>> +FILES:${PN}-dev = ""
>>> No.  Always split into the usual packaging.
>> My issue was, that there is only a .so without version number and
>> symlink. All files got installed into dev.
>>
>> Needed to add dev-elf to INSANE_SKIP  and mesa complained about RDEPEND
>> on libperfetto
>>
>>> YUCK.  What is this installing and why can't that be done via DEPENDS
>>> and SRC_URI?  This breaks offline builds and source archiving.
>>>
>>> Ross
>> This is ugly, i know. Other google projects like highway allow fetching
>> stuff as submodules
>>
>> but to me it looks like only zlib and protobuf can be configured as
>> use_system here. But this is my first
>>
>> approach on building with gn. I'm quite unfamiliar with it. Good chances
>> that i'm just not knowing enough
>>
>> to to it better.
>>
>> https://github.com/google/perfetto/blob/master/tools/install-build-deps
>>
>> When I have more time, I'll take a closer look, but right now it's not a
>> high priority for me.  As it is at the moment,
>>
>> this is definitely in need of improvement
>>
>>
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#96051): https://lists.openembedded.org/g/openembedded-devel/message/96051
>> Mute This Topic: https://lists.openembedded.org/mt/89850216/3618223
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [f_l_k@t-online.de]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

