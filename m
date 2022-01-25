Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCE99C433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 13:28:27 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web08.6946.1643117306978948048
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 05:28:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout12.t-online.de (Postfix) with SMTP id A683014052
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 14:28:09 +0100 (CET)
Received: from [192.168.178.83] ([84.163.43.159]) by fwd87.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nCLrl-1MkMWP0; Tue, 25 Jan 2022 14:28:09 +0100
Message-ID: <622bf2f8-fd27-63ed-da25-89c6536a4f25@t-online.de>
Date: Tue, 25 Jan 2022 14:28:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-gnome][PATCH 1/2] geary: initial add recipe
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20220120202643.3827177-1-f_l_k@t-online.de>
 <fc07f2df1f07b73a902be4377c65b70952db4500.camel@pengutronix.de>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <fc07f2df1f07b73a902be4377c65b70952db4500.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1643117289-00000271-DC6A7051/0/0 CLEAN NORMAL
X-TOI-MSGID: 156cc263-7a04-42f2-b0b6-658ad58a88c7
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 13:28:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95065

Hi Jan,

it is also allowed to use tags here.

SRCREV= "gnome-40.0" fetches the same code as

SRCREV ="e561775c1580a9f60a726355b2b897bfc9cb3382"

Am 25.01.22 um 13:25 schrieb Jan Luebbe:
> Hi Markus,
>
> On Thu, 2022-01-20 at 21:26 +0100, Markus Volk wrote:
>
> ...
>> +inherit meson pkgconfig mime-xdg gtk-icon-cache gobject-introspection vala
>> +
>> +SRC_URI = " \
>> +	git://github.com/GNOME/geary.git;nobranch=1;protocol=https \
>> +"
>> +
>> +S = "${WORKDIR}/git"
>> +SRCREV = "gnome-${PV}"
> perhaps I'm missing something, but shouldn't this be a git commit hash?
>
> Regards,
> Jan
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95056): https://lists.openembedded.org/g/openembedded-devel/message/95056
> Mute This Topic: https://lists.openembedded.org/mt/88611343/3618223
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [f_l_k@t-online.de]
> -=-=-=-=-=-=-=-=-=-=-=-
>

