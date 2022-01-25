Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59552C433FE
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 17:00:38 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web09.12.1643130036985401918
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 09:00:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83,
 mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout07.t-online.de (Postfix) with SMTP id E6FEA152C0
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 18:00:33 +0100 (CET)
Received: from [192.168.178.83] ([84.163.43.159]) by fwd88.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nCPBJ-1suXCL0; Tue, 25 Jan 2022 18:00:33 +0100
Message-ID: <8e766066-ce73-e07c-c82d-45f38f8a2a55@t-online.de>
Date: Tue, 25 Jan 2022 18:00:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-gnome][PATCH 1/2] geary: initial add recipe
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20220120202643.3827177-1-f_l_k@t-online.de>
 <fc07f2df1f07b73a902be4377c65b70952db4500.camel@pengutronix.de>
 <622bf2f8-fd27-63ed-da25-89c6536a4f25@t-online.de>
 <1e2357fc2900c4eaef91943265baa293e0bfe76c.camel@pengutronix.de>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <1e2357fc2900c4eaef91943265baa293e0bfe76c.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1643130033-00013579-BC4674B8/0/0 CLEAN NORMAL
X-TOI-MSGID: 3c48d53a-d815-4849-87a7-70e394f04d84
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 17:00:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95074

Thats right. I did it like this because it would be then=C2=A0 only be ne=
eded=20
to change the PV in the recipe name to get the SRCREV updated on a=20
version update (of course assumed that the tag name wasn't modified).

> Additionally, https://docs.yoctoproject.org/singleindex.html#term-SRCRE=
V warns:
> "Note that if you want to build a fixed revision and you want to avoid
> performing a query on the remote repository every time BitBake parses y=
our
> recipe, you should specify a SRCREV that is a full revision identifier =
and not
> just a tag."

Thats quite an argument. I'll send a patch for it

Am 25.01.22 um 17:45 schrieb Jan Luebbe:
> Hi Markus,
>
> On Tue, 2022-01-25 at 14:28 +0100, Markus Volk wrote:
>> Hi Jan,
>>
>> it is also allowed to use tags here.
>>
>> SRCREV=3D "gnome-40.0" fetches the same code as
>>
>> SRCREV =3D "e561775c1580a9f60a726355b2b897bfc9cb3382"
> That's only true as long as nobody modifies that tag in the upstream re=
pository
> and isn't cryptographically secure. As far as I can see, no existing re=
cipe in
> meta-oe or oe-core uses a tag as SRCREV.
>
>
> Regards,
> Jan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95072): https://lists.openembedded.org/g/openembedd=
ed-devel/message/95072
> Mute This Topic: https://lists.openembedded.org/mt/88611343/3618223
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[f_l_k@t-online.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

