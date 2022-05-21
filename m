Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6B6C433EF
	for <webhook@archiver.kernel.org>; Sat, 21 May 2022 08:03:29 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.3479.1653120206103703419
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 May 2022 01:03:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout02.t-online.de (Postfix) with SMTP id 65DC459BF;
	Sat, 21 May 2022 10:03:24 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.39.7]) by fwd73.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nsK54-2mEODh0; Sat, 21 May 2022 10:03:22 +0200
Message-ID: <ae4e1ba5-3951-d552-4648-6930983f8b0b@t-online.de>
Date: Sat, 21 May 2022 10:03:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [oe] [oe-core][RFC PATCH 1/2] pipewire: fix build
Content-Language: en-US
To: Scott Murray <scott.murray@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20220520125313.4115361-1-f_l_k@t-online.de>
 <56b79fce-6f91-8b1a-8d6a-49c176b136@spiteful.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <56b79fce-6f91-8b1a-8d6a-49c176b136@spiteful.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1653120202-0000C4DD-5102C873/0/0 CLEAN NORMAL
X-TOI-MSGID: aba03279-ce97-4e66-b9c9-bc881286b8e1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 May 2022 08:03:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97217

I didn't have a specific use case. I was just trying to build libsdl2 
identical for target and native. And since libsdl2 can be built for 
nativesdk, the consequence would be that pipewire-nativesdk is needed to 
be built as well.

Am 21.05.22 um 08:58 schrieb Scott Murray:
> On Fri, 20 May 2022, Markus Volk wrote:
>
>> -after updating to poky master i get issues picking the right udev provider
>> -add a backport patch to fix libsdl2 build with pipewire enabled
>> -allow native/nativesdk build
> [snip]
>
> I'm curious what your usecase is for native/nativesdk?  There's no
> preprocessor or similiar tools in pipewire that I'm aware of.
>
> Scott
>

