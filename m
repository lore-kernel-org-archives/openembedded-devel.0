Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F282CC433EF
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 17:35:25 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.1617.1643391324902585136
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 09:35:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83,
 mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout07.t-online.de (Postfix) with SMTP id 17E2631BD
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 18:35:23 +0100 (CET)
Received: from [192.168.178.83] ([84.163.44.28]) by fwd72.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nDV9Z-1gcYfx0; Fri, 28 Jan 2022 18:35:17 +0100
Message-ID: <81dde554-b80e-43aa-cc85-033f858ff2a0@t-online.de>
Date: Fri, 28 Jan 2022 18:35:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-gnome][PATCH] folks: make some dependencies optional
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20220125181339.114315-1-f_l_k@t-online.de>
 <26359.1643390123448861343@lists.openembedded.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <26359.1643390123448861343@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1643391317-0000B7AB-DA5D7F39/0/0 CLEAN NORMAL
X-TOI-MSGID: 834c0c32-9f4b-45cd-8e6c-674a613c0b26
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 17:35:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95151

https://github.com/openembedded/meta-openembedded/blob/aa22894fa352986a62c4530ad8facd8868b2e535/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb#L24

Doesn't this line explicitly disable tests until DISTRO_FEATURE ptests 
is set ?

Am 28.01.22 um 18:15 schrieb Ross Burton:
> +PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,python3-dbusmock-native"
>
> You don't install the tests, so this serves no purpose.
>
> Just set -Dtests=false explicitly, unless you install the tests and do the ptest integration.
>
> Also the dbusmock test in folks is broken, it should be cross-aware.  As you can't check for target python modules it should avoid the check in cross builds.
>
> Ross
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95149): https://lists.openembedded.org/g/openembedded-devel/message/95149
> Mute This Topic: https://lists.openembedded.org/mt/88678231/3618223
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [f_l_k@t-online.de]
> -=-=-=-=-=-=-=-=-=-=-=-
>

