Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85911C76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 04:59:57 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.27957.1679893188270630863
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 21:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout04.t-online.de (Postfix) with SMTP id 2DB271D732;
	Mon, 27 Mar 2023 06:59:23 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.42.31]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pgewn-40Smq80; Mon, 27 Mar 2023 06:59:09 +0200
Message-ID: <88bec4d9-33da-b0f2-5e9c-ab016da1cb8c@t-online.de>
Date: Mon, 27 Mar 2023 06:59:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [oe] [meta-gnome][PATCH 09/32] gnome-chess: update 43.2 -> 44.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230325080256.923752-1-f_l_k@t-online.de>
 <174F9ACDC80FD1FC.7603@lists.openembedded.org>
 <6397c1d1-acd7-6713-bb2c-60a94f42c427@t-online.de>
 <CAMKF1sqXmfzumGoEBRvqiytrVjGSDM65ExBO13VpQDNH1YFFPw@mail.gmail.com>
Content-Language: en-US
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <CAMKF1sqXmfzumGoEBRvqiytrVjGSDM65ExBO13VpQDNH1YFFPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1679893149-F4DA8C53-E396DD76/0/0 CLEAN NORMAL
X-TOI-MSGID: 2b746e13-0a14-4d74-b52b-53bdb092ae56
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 04:59:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101772

https://gitlab.gnome.org/GNOME/gnome-chess/-/tags/44.0

There is=C2=A0 a bogus tag, thats why I accidentially created this and fo=
rgot=20
to remove after I noticed it

Am 27.03.23 um 06:53 schrieb Khem Raj:
> yeah seems there is no 44 release yet.
>
> On Sat, Mar 25, 2023 at 3:30=E2=80=AFAM Markus Volk <f_l_k@t-online.de>=
 wrote:
>> This one was sent accidentially and can be dropped.
>>
>> Am 25.03.23 um 09:02 schrieb Markus Volk:
>>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>>> ---
>>>    .../{gnome-chess_43.2.bb =3D> gnome-chess_44.0.bb}         | 9 +++=
+-----
>>>    1 file changed, 4 insertions(+), 5 deletions(-)
>>>    rename meta-gnome/recipes-gnome/gnome-chess/{gnome-chess_43.2.bb =3D=
> gnome-chess_44.0.bb} (70%)
>>>
>>> diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb=
 b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_44.0.bb
>>> similarity index 70%
>>> rename from meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb
>>> rename to meta-gnome/recipes-gnome/gnome-chess/gnome-chess_44.0.bb
>>> index 343135bfa..d9727ec1c 100644
>>> --- a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb
>>> +++ b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_44.0.bb
>>> @@ -22,13 +22,12 @@ DEPENDS =3D " \
>>>
>>>    RRECOMMENDS:${PN}  =3D "gnuchess"
>>>
>>> -SRC_URI =3D "git://github.com/GNOME/gnome-chess.git;protocol=3Dhttps=
;nobranch=3D1"
>>> +SRC_URI[archive.sha256sum] =3D "734f092d95fc60409eeaca3427b5a48cb9b5=
99da11995119d85baa99653e0292"
>>>
>>> -inherit meson pkgconfig gobject-introspection gtk-icon-cache vala fe=
atures_check mime-xdg gsettings
>>> +inherit gnomebase meson pkgconfig gobject-introspection gtk-icon-cac=
he vala features_check mime-xdg gsettings
>>>
>>> +GNOMEBASEBUILDCLASS =3D "meson"
>>> +GTKIC_VERSION =3D '4'
>>>    GIR_MESON_OPTION =3D ""
>>>
>>> -S =3D "${WORKDIR}/git"
>>> -SRCREV =3D "de47d07ec6fc828b2668ca6ee59fe9bdfa9dc1d6"
>>> -
>>>    FILES:${PN} +=3D "${datadir}"
>>>
>>>
>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#101747): https://lists.openembedded.org/g/openembe=
dded-devel/message/101747
>> Mute This Topic: https://lists.openembedded.org/mt/97841027/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

