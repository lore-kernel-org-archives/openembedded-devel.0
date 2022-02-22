Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC477C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 05:57:20 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.9654.1645509438985929742
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 21:57:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout09.t-online.de (Postfix) with SMTP id 8B1F012D10;
	Tue, 22 Feb 2022 06:57:16 +0100 (CET)
Received: from [192.168.178.83] ([84.154.173.113]) by fwd88.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nMOAc-0HEr6P0; Tue, 22 Feb 2022 06:57:06 +0100
Message-ID: <abe798dc-a561-b461-23d8-54ffcabbc718@t-online.de>
Date: Tue, 22 Feb 2022 06:57:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-xfce][PATCH] libxfce4util: inherit vala
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220221182012.2513597-1-f_l_k@t-online.de>
 <CAMKF1soMv7n5_0qXH9T4ZR=QEpGFAWdwdfGERbSMTpCW356FsQ@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <CAMKF1soMv7n5_0qXH9T4ZR=QEpGFAWdwdfGERbSMTpCW356FsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1645509426-00013579-59EF9548/0/0 CLEAN NORMAL
X-TOI-MSGID: 9451f5b0-7288-4d64-b413-3aa4d8760cd2
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 05:57:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95437

I dont think this is related. Its more like after updating poky to 
current master some of the xfce4 recipes try to build vapi, not caring 
that its not explicitly enabled. That was in fact the reason for adding 
vala to xfconf and libxfce4util. Both recipes started to fail after poky 
update.

libxfce4ui and xfce4-panel are failing too, but it doesnt help to 
inherit vala here. Both of them will then fail with different error 
messages. What helps for me is to to disable vala like this

EXTRA_OECONF += "--disable-vala"

I guess it would be ok to just dont build vapi for libxfceui and 
xfce4-panel because even upstream builds it like this:

https://gitlab.xfce.org/xfce/libxfce4ui/-/blob/master/Makefile.am#L46

I'll send patches if you agree on this

Am 22.02.22 um 03:10 schrieb Khem Raj:
> I am seeing libxfce4ui is failing in install task I wonder if it is
> related these changes
>
> see
> https://errors.yoctoproject.org/Errors/Details/633079/
>
> On Mon, Feb 21, 2022 at 10:20 AM Markus Volk <f_l_k@t-online.de> wrote:
>> This fixes do_configure error:
>>
>> | libxfce4util/Makefile.am:159: error: ENABLE_VAPIGEN does not appear in AM_CONDITIONAL
>>
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> ---
>>   meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
>> index 1a0b7183e..9462b28ac 100644
>> --- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
>> +++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
>> @@ -4,6 +4,6 @@ LICENSE = "GPLv2"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
>>   DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"
>>
>> -inherit xfce gtk-doc gobject-introspection
>> +inherit xfce gtk-doc gobject-introspection vala
>>
>>   SRC_URI[sha256sum] = "60598d745d1fc81ff5ad3cecc3a8d1b85990dd22023e7743f55abd87d8b55b83"
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#95423): https://lists.openembedded.org/g/openembedded-devel/message/95423
>> Mute This Topic: https://lists.openembedded.org/mt/89300196/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

