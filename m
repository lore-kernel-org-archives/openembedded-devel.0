Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3461C2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 07:18:51 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.9655.1643181530696011723
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 23:18:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82,
 mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout05.t-online.de (Postfix) with SMTP id 72E241502E
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jan 2022 08:18:47 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.134]) by fwd81.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nCcZq-3gMI8v0; Wed, 26 Jan 2022 08:18:46 +0100
Message-ID: <0eace0de-8fe4-3fae-0569-f3eea960ca75@t-online.de>
Date: Wed, 26 Jan 2022 08:18:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-gnome][PATCH] evolution-data-server: try to fix g-i
 data generation
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20220126060104.578932-1-f_l_k@t-online.de>
 <CAMKF1soCvBP6kNsGfcFQ1zaS6LUAK7thNy97aCj0B8q2+RzMjA@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <CAMKF1soCvBP6kNsGfcFQ1zaS6LUAK7thNy97aCj0B8q2+RzMjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1643181526-0000BD0E-71DD3B03/0/0 CLEAN NORMAL
X-TOI-MSGID: 34e6d631-6958-44a4-80ec-05a47f6fe758
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jan 2022 07:18:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95101

i tried, but there are a lot of systemd patches that are not applying 
and thus i'm unable to compile it. But never mind ... if it doesn't run 
for you, just disable GIR. Maybe i find some time to look into it 
sometime later

Am 26.01.22 um 07:35 schrieb Khem Raj:
> On Tue, Jan 25, 2022 at 10:01 PM Markus Volk <f_l_k@t-online.de> wrote:
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> ---
>>   .../evolution-data-server/evolution-data-server.bb           | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
>> index 9ccaedbcc..c5c7d947f 100644
>> --- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
>> +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
>> @@ -27,14 +27,15 @@ EXTRA_OECMAKE = " \
>>       -DENABLE_UOA=OFF \
>>       -DENABLE_GOOGLE_AUTH=OFF \
>>       -DENABLE_WEATHER=OFF \
>> -    -DG_IR_COMPILER=${STAGING_BINDIR}/g-ir-compiler-wrapper \
>> -    -DG_IR_SCANNER=${STAGING_BINDIR}/g-ir-scanner-wrapper \
>>       -DVAPIGEN=${STAGING_BINDIR_NATIVE}/vapigen \
>>       ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON -DENABLE_VALA_BINDINGS=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
>>       -D${LKSTRFTIME} \
>>       -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
>>   "
>>
>> +EXTRA_OECMAKE:append:class-target = " -DG_IR_COMPILER=${STAGING_BINDIR}/g-ir-compiler-wrapper"
>> +EXTRA_OECMAKE:append:class-target = " -DG_IR_SCANNER=${STAGING_BINDIR}/g-ir-scanner-wrapper"
>> +
> Can you test it for TCLIBC = "musl"
>
>
>>   PACKAGECONFIG[canberra] = "-DENABLE_CANBERRA=ON,-DENABLE_CANBERRA=OFF,libcanberra"
>>   PACKAGECONFIG[oauth]    = "-DENABLE_OAUTH2=ON,-DENABLE_OAUTH2=OFF,webkitgtk json-glib"
>>   PACKAGECONFIG[goa]    = "-DENABLE_GOA=ON,-DENABLE_GOA=OFF,gnome-online-accounts"
>> --
>> 2.25.1
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#95098): https://lists.openembedded.org/g/openembedded-devel/message/95098
>> Mute This Topic: https://lists.openembedded.org/mt/88691224/3618223
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [f_l_k@t-online.de]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

