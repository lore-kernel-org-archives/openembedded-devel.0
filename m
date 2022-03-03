Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A9CC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 15:12:15 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.11763.1646320333721609226
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 07:12:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout12.t-online.de (Postfix) with SMTP id A469C20E7C;
	Thu,  3 Mar 2022 16:12:11 +0100 (CET)
Received: from [192.168.178.83] ([79.219.225.177]) by fwd80.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nPn7j-0ugH2H0; Thu, 3 Mar 2022 16:12:11 +0100
Message-ID: <21198b64-b539-57e1-d5a9-09c7e762610c@t-online.de>
Date: Thu, 3 Mar 2022 16:12:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-gnome][PATCH] gjs: update; customize dependencies
Content-Language: en-US
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220303073138.1434568-1-f_l_k@t-online.de>
 <CALbNGRTM1_J=rZHXisUj6hJZ1Hamcj8A6NWrAiFxhv47sUrZ7g@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <CALbNGRTM1_J=rZHXisUj6hJZ1Hamcj8A6NWrAiFxhv47sUrZ7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1646320331-00001C4D-C80F8D42/0/0 CLEAN NORMAL
X-TOI-MSGID: 95d1e3e9-5ece-4cfd-bc66-733d9aabf658
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 15:12:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95751

> What about gnome-shell - or why go backwards?
That is correct. Since I'm not building it, I didn't notice that=20
gnome-shell now also uses gtk4. For me, gjs was the only recipe that=20
included gtk4.

But since it is only needed for gtk_tests, I sent a v2 to disable it.

However, if you want to keep the gtk dependency, I'll send another patch=20
that contains only the recipe and mozjs updates

Am 03.03.22 um 15:45 schrieb Andreas M=C3=BCller:
> On Thu, Mar 3, 2022 at 8:32 AM Markus Volk <f_l_k@t-online.de> wrote:
>> gjs seems to be the only gnome recipe to be built against gtk4. Align =
this to the
>> rest of the universe.
> What about gnome-shell - or why go backwards?
>> Update mozjs dependency to mozjs-91 since polkit also builds with it.
> Glad to see
>
> Cheers
>
> Andreas

