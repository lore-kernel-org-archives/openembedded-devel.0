Return-Path: <mgrosshauser@gmx.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD70BC00140
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 13:51:53 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by mx.groups.io with SMTP id smtpd.web09.6821.1658843505910211744
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 06:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=fL4C9N0I;
 spf=pass (domain: gmx.net, ip: 212.227.17.21, mailfrom: mgrosshauser@gmx.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1658843504;
	bh=tuJpBAzZyCEMDrY8NO/teO7XEVm3fteRy1a2z3TazKA=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=fL4C9N0IDelRbDGsErRLyyrGFraU5bzuavOviLlVoq5vQuQsGwB3Fh92HBJaU5xHH
	 vkBMNDONH0+DeDLWgWScTIG7nb2EUoOj1+5NO9wO0Dr7pGtDLmIoTOhV37byE/caKy
	 WF1MgqVwMnMBJR579F8di7eY8vEzoZ8WGjbrDTnw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.200.100] ([80.109.177.11]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2Dx8-1nUGTx3q50-013gyU for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 15:51:43 +0200
Message-ID: <8bfc711f-10f0-e786-5c03-71d8c749c986@gmx.net>
Date: Tue, 26 Jul 2022 15:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [oe] [meta-python][PATCH] Add runtime dependencies for
 python3-supervisor
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <9b5881cf-15b1-b401-c6bd-5f9232fd0d4c@gmx.net>
 <CABF_=yh7frbvHSe=+EokH+AuU5p7GRSN4+Kb_-qn__1HqyFu_Q@mail.gmail.com>
 <CAMKF1soLr20bKVyC4008rtTSRAK+ehjTADwhMdMRpY7NkJxAmg@mail.gmail.com>
 <CANx9H-DOmascgaTnU=983dVXdixSjEQmDJNro1Zq+KbQBtK-bg@mail.gmail.com>
From: =?UTF-8?Q?Martin_Gro=c3=9fhauser?= <mgrosshauser@gmx.net>
In-Reply-To: 
 <CANx9H-DOmascgaTnU=983dVXdixSjEQmDJNro1Zq+KbQBtK-bg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cA9ywFapjh2UknGtMwADXrWQtJjtEN3oAcf+zjOWtP9zb17DI9x
 Z7w9AePZWcU63iOQ8AlZ8fy0U+zCXRYHdWYE1+8qoz+uot5cuY5S6wgiBOdM3KOUngtMZUx
 BVVKFteYf7uxUuea7WnsfESYPwr5npvWvii+83+wCjycIXj4NAqfhhRPgsvdlgFwF4nzIH0
 NFKgP3Ed8QcAfaNBPUFXA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EnMnDJWWEOc=:fAoaCOE7C9INXHsMnBS/OH
 mcQezIIDHo/gDQiQBB0ZJ8y4aKF0sWQjL0NIEgVHjXk48tAKtElX+69wK5/yWd55WRI8BDdB2
 un57NO7kBOW9aSeCUitQhVFKLhsoiLWGnhNFrUi+UIoGNeBKNozWyk52gk91rDd1CzZa7EsvO
 DnYNgZ6T9KfelYHk1cWbO88fSGu+t66vHGC6fJpMRsRf44BXUQZMpDa2la5touoxSZlaaP33G
 2MhWVCkQsl397QxvcN6sWiBNJAy0Ect8TwkAD+McSNeJ/F4J5/0PowW5qbpa3CgqKSeMzcOtE
 gQh5TaPMnz9rd0DGR7SVgsVE0qOvnJ1BppKdezD+Ar+QLt0xYfJdnFpVodyAQiwnbaQCZOo3T
 8Cb73thaohjiXKyxOmU7WHSblj7+7vjhSiwmzl5BZ2h88twy84tvBc9ysPW1zWJe3Q9lT3+pv
 rQqPnl8KZbWivR2FIys+nB7wnaWfpaqaiS6BymnrRkUq13HWXxhXKEO6Tm9WtMq5dwMRGpaqs
 Tfpy2v8s8fXxrECSYOog7XfnZbhsgkyQL5eK1x6TbvUIKtIcGPDvrOY1tKz4NHtz51FuqNG+A
 Fi5VWetD/xyaATdELINAXJ70L/rCOL+0pJ1OWMuPgVCpitzdtuO+cx3sBLBhQySvsFiJI0nS4
 mDMe92YpGJs6Z7gagM/jIJOaMr/Cr/vYSTvDiLrSaciiGhg7/Dl6DfHT/IMPC3AhKr4d3j5Ee
 FSgdmFesv83h/P6EIJUlenTAZZPlkemtuqEx8dmhmzwu9u/1fb2yKCcgwdIHOXS6ylfRea0E0
 AoGsUBcrzu6uT9H303JZXMh0sVckH3D6ZVkcbWPnnGeAPi0ghdsIx4GP3xFu82QJcp6Xicug3
 pO55pCHfcmS5WB28a9yovnULW+W1bjS6bS2GM+IlkSrwIqdx/pqyvqRwLRCRRZyt36JzbcDsM
 BuzOc+qkHYlV9KXRaWGZ4BzwXnQGn5G0TN2U7fC2ADU1VqYdsgNUkQVpTWEn4xIZA2zzHcE1K
 VilaeNVJO2FHeLSSXP3jstkNUzo7dfnj5hF5+7tGkvhVpFvWuIk95vFufRRBEGquBMOLran5g
 2OXSHOzrsYkXGjXMd1FuBylS/e5QQ3UqZInaJ0/LzdYxydgFzjGiBk98Q==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 13:51:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97991



On 25.07.22 05:21, Tim Orling wrote:
>
>
> On Sun, Jul 24, 2022 at 7:01 PM Khem Raj <raj.khem@gmail.com <mailto:raj=
.khem@gmail.com>> wrote:
>
>     On Sun, Jul 24, 2022 at 3:31 PM Jan Vermaete <jan.vermaete@gmail.com=
 <mailto:jan.vermaete@gmail.com>> wrote:
>      >
>      > Hi,
>      >
>      > Could it be it should be '${PYTHON_PN}-setuptools-native' iso=C2=
=A0 '${PYTHON_PN}-setuptools' ?
>
>     rdep on a native package wont be a good thing.
>      >
>      > Br
>      >
>      > On Fri, Jul 22, 2022 at 9:39 PM Martin Gro=C3=9Fhauser <mgrosshau=
ser@gmx.net <mailto:mgrosshauser@gmx.net>> wrote:
>      >>
>      >> Running supervisord without these fails with import errors. smtp=
d might look strange, but provides required asynchat.py.
>      >> ---
>      >>=C2=A0 =C2=A0.../recipes-devtools/python/python3-supervisor_4.2.4=
.bb <http://python3-supervisor_4.2.4.bb>=C2=A0 =C2=A0 =C2=A0 | 5 +++++
>      >>=C2=A0 =C2=A01 file changed, 5 insertions(+)
>      >>
>      >> diff --git a/meta-python/recipes-devtools/python/python3-supervi=
sor_4.2.4.bb <http://python3-supervisor_4.2.4.bb> b/meta-python/recipes-de=
vtools/python/python3-supervisor_4.2.4.bb <http://python3-supervisor_4.2.4=
.bb>
>      >> index fdd8a76cf..7da29e39b 100644
>      >> --- a/meta-python/recipes-devtools/python/python3-supervisor_4.2=
.4.bb <http://python3-supervisor_4.2.4.bb>
>      >> +++ b/meta-python/recipes-devtools/python/python3-supervisor_4.2=
.4.bb <http://python3-supervisor_4.2.4.bb>
>      >> @@ -13,6 +13,11 @@ PYPI_PACKAGE =3D "supervisor"
>      >>=C2=A0 =C2=A0inherit pypi systemd setuptools3
>      >>=C2=A0 =C2=A0RDEPENDS:${PN} =3D "\
>      >>=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-meld3 \
>      >> +=C2=A0 =C2=A0 ${PYTHON_PN}-io \
>      >> +=C2=A0 =C2=A0 ${PYTHON_PN}-xmlrpc \
>      >> +=C2=A0 =C2=A0 ${PYTHON_PN}-resource \
>      >> +=C2=A0 =C2=A0 ${PYTHON_PN}-setuptools \
>      >> +=C2=A0 =C2=A0 ${PYTHON_PN}-smtpd \
>      >>=C2=A0 =C2=A0"
>
>
> FWIW, we don=E2=80=99t need to carry the ${PYTHON_PN} if the version no =
longer supports python 2.

I submitted a revised patch (v2) fixing that.

>
>
>      >>
>      >>=C2=A0 =C2=A0SRC_URI +=3D "file://supervisord.conf \
>      >> --
>      >> 2.25.1
>      >>
>      >>
>      >>
>      >>
>      >
>      >
>      > --
>      > Jan Vermaete
>      > =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gar=
y Hamel
>      >
>      >
>      >
>
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97967): https://lists.openembedded.org/g/openembedde=
d-devel/message/97967
> Mute This Topic: https://lists.openembedded.org/mt/92555239/7053818
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
mgrosshauser@gmx.net]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

