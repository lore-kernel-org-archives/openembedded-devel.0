Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 834A3C433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 07:27:34 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web09.25307.1643268453345510548
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jan 2022 23:27:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21,
 mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout10.t-online.de (Postfix) with SMTP id 57E874FC4
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 08:27:31 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.60]) by fwd76.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nCzBo-1vRH4j0; Thu, 27 Jan 2022 08:27:28 +0100
Message-ID: <3ef87993-f28b-1d51-77d6-dfa7cfac7f0f@t-online.de>
Date: Thu, 27 Jan 2022 08:27:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-gnome][PATCH] evolution-data-server: try to fix g-i
 data generation
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <20220126060104.578932-1-f_l_k@t-online.de>
 <CAMKF1soCvBP6kNsGfcFQ1zaS6LUAK7thNy97aCj0B8q2+RzMjA@mail.gmail.com>
 <16CDC0E5A96FEE34.21331@lists.openembedded.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <16CDC0E5A96FEE34.21331@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1643268448-0001619A-6317533C/0/0 CLEAN NORMAL
X-TOI-MSGID: 5b09ae4a-11a8-4f0c-a14e-63484e31fe2c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jan 2022 07:27:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95116

thanks to your patches for systemd i could try this now. i have=20
successfully built evolution-data-server for musl x86-64 with g-ir and=20
vapi. However, also with the recipe that is currently in master. So this=20
test is not really helpful.

Am 26.01.22 um 08:18 schrieb Markus Volk:
> i tried, but there are a lot of systemd patches that are not applying=20
> and thus i'm unable to compile it. But never mind ... if it doesn't=20
> run for you, just disable GIR. Maybe i find some time to look into it=20
> sometime later
>
> Am 26.01.22 um 07:35 schrieb Khem Raj:
>> On Tue, Jan 25, 2022 at 10:01 PM Markus Volk <f_l_k@t-online.de> wrote=
:
>>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>>> ---
>>> =C2=A0 .../evolution-data-server/evolution-data-server.bb | 5 +++--
>>> =C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git=20
>>> a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb=20
>>> b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb=20
>>>
>>> index 9ccaedbcc..c5c7d947f 100644
>>> ---=20
>>> a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
>>> +++=20
>>> b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
>>> @@ -27,14 +27,15 @@ EXTRA_OECMAKE =3D " \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DENABLE_UOA=3DOFF \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DENABLE_GOOGLE_AUTH=3DOFF \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DENABLE_WEATHER=3DOFF \
>>> -=C2=A0=C2=A0=C2=A0 -DG_IR_COMPILER=3D${STAGING_BINDIR}/g-ir-compiler=
-wrapper \
>>> -=C2=A0=C2=A0=C2=A0 -DG_IR_SCANNER=3D${STAGING_BINDIR}/g-ir-scanner-w=
rapper \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DVAPIGEN=3D${STAGING_BINDIR_NATIVE}/v=
apigen \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('GI_DATA_ENABLED'=
, 'True',=20
>>> '-DENABLE_INTROSPECTION=3DON -DENABLE_VALA_BINDINGS=3DON',=20
>>> '-DENABLE_INTROSPECTION=3DOFF', d)} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -D${LKSTRFTIME} \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DLIB_SUFFIX=3D${@d.getVar('baselib').=
replace('lib', '')} \
>>> =C2=A0 "
>>>
>>> +EXTRA_OECMAKE:append:class-target =3D "=20
>>> -DG_IR_COMPILER=3D${STAGING_BINDIR}/g-ir-compiler-wrapper"
>>> +EXTRA_OECMAKE:append:class-target =3D "=20
>>> -DG_IR_SCANNER=3D${STAGING_BINDIR}/g-ir-scanner-wrapper"
>>> +
>> Can you test it for TCLIBC =3D "musl"
>>
>>
>>> =C2=A0 PACKAGECONFIG[canberra] =3D=20
>>> "-DENABLE_CANBERRA=3DON,-DENABLE_CANBERRA=3DOFF,libcanberra"
>>> =C2=A0 PACKAGECONFIG[oauth]=C2=A0=C2=A0=C2=A0 =3D=20
>>> "-DENABLE_OAUTH2=3DON,-DENABLE_OAUTH2=3DOFF,webkitgtk json-glib"
>>> =C2=A0 PACKAGECONFIG[goa]=C2=A0=C2=A0=C2=A0 =3D=20
>>> "-DENABLE_GOA=3DON,-DENABLE_GOA=3DOFF,gnome-online-accounts"
>>> --=20
>>> 2.25.1
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95101): https://lists.openembedded.org/g/openembedd=
ed-devel/message/95101
> Mute This Topic: https://lists.openembedded.org/mt/88691224/3618223
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[f_l_k@t-online.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

