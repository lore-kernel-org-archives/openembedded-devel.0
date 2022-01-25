Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E601C433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 17:38:42 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web12.176.1643132321731375409
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 09:38:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout12.t-online.de (Postfix) with SMTP id 42512F9D2;
	Tue, 25 Jan 2022 18:38:28 +0100 (CET)
Received: from [192.168.178.83] ([84.163.43.159]) by fwd78.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nCPm0-2nmuO10; Tue, 25 Jan 2022 18:38:28 +0100
Message-ID: <12f7178c-e352-181e-6c69-4e14b52ce55a@t-online.de>
Date: Tue, 25 Jan 2022 18:38:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-gnome][PATCH 1/2] geary: initial add recipe
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20220120202643.3827177-1-f_l_k@t-online.de>
 <fc07f2df1f07b73a902be4377c65b70952db4500.camel@pengutronix.de>
 <622bf2f8-fd27-63ed-da25-89c6536a4f25@t-online.de>
 <1e2357fc2900c4eaef91943265baa293e0bfe76c.camel@pengutronix.de>
 <8e766066-ce73-e07c-c82d-45f38f8a2a55@t-online.de>
 <3d81b267-c9c9-234a-5d74-15cd5ff754f9@gmail.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <3d81b267-c9c9-234a-5d74-15cd5ff754f9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1643132308-0000AD4E-BED2CB30/0/0 CLEAN NORMAL
X-TOI-MSGID: a65de513-5e67-4b3c-a2c4-51c7d6b01653
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 17:38:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95079

sent a patch to fix this

Am 25.01.22 um 18:28 schrieb Khem Raj:
>
>
> On 1/25/22 9:00 AM, Markus Volk wrote:
>> Thats right. I did it like this because it would be then=C2=A0 only be=
=20
>> needed to change the PV in the recipe name to get the SRCREV updated=20
>> on a version update (of course assumed that the tag name wasn't=20
>> modified).
>>
>>> Additionally,=20
>>> https://docs.yoctoproject.org/singleindex.html#term-SRCREV warns:
>>> "Note that if you want to build a fixed revision and you want to avoi=
d
>>> performing a query on the remote repository every time BitBake=20
>>> parses your
>>> recipe, you should specify a SRCREV that is a full revision=20
>>> identifier and not
>>> just a tag."
>>
>> Thats quite an argument. I'll send a patch for it
>
> using tags is not going to work when network is disabled, so please=20
> use a proper SHA1
>
>>
>> Am 25.01.22 um 17:45 schrieb Jan Luebbe:
>>> Hi Markus,
>>>
>>> On Tue, 2022-01-25 at 14:28 +0100, Markus Volk wrote:
>>>> Hi Jan,
>>>>
>>>> it is also allowed to use tags here.
>>>>
>>>> SRCREV=3D "gnome-40.0" fetches the same code as
>>>>
>>>> SRCREV =3D "e561775c1580a9f60a726355b2b897bfc9cb3382"
>>> That's only true as long as nobody modifies that tag in the upstream=20
>>> repository
>>> and isn't cryptographically secure. As far as I can see, no existing=20
>>> recipe in
>>> meta-oe or oe-core uses a tag as SRCREV.
>>>
>>>
>>> Regards,
>>> Jan
>>>
>>>
>>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#95074):=20
>> https://lists.openembedded.org/g/openembedded-devel/message/95074
>> Mute This Topic: https://lists.openembedded.org/mt/88611343/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:=20
>> https://lists.openembedded.org/g/openembedded-devel/unsub=20
>> [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

