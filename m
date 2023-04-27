Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA410C77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 19:15:43 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.844.1682622933361592313
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 27 Apr 2023 12:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=brA3yIBF;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33RJFS5u090171;
	Thu, 27 Apr 2023 14:15:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682622928;
	bh=p+tP0e5OQoRJENS4OPJnBDjT2KFW2M5fe2ygO5UzhVc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=brA3yIBFn8E3X2GWHhnuSp+5QxmoekF/FkhpMVT60JAyGUHNzP7MJCHDeDZzo2MK0
	 9ExdEZT1TkeEOqp7NliM8YdKvJ0PeTY/97Pg3GeXmNf2/eeSLYSOMibL0eC/tF0KD/
	 OP3/vk2HUtaFN8AzgriRJEpEO/IjrD/7AUUG/1jQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33RJFSDN012263
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Apr 2023 14:15:28 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 14:15:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 14:15:28 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33RJFS3J011287;
	Thu, 27 Apr 2023 14:15:28 -0500
Message-ID: <88499b7b-dd39-54fc-2dde-21b5b3fef7d5@ti.com>
Date: Thu, 27 Apr 2023 14:15:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [EXTERNAL] Re: [EXTERNAL] Re: [meta-oe][kirkstone][PATCHv2] glfw:
 add packageconfig and wayland dependencies
Content-Language: en-US, en-US-large
To: Khem Raj <raj.khem@gmail.com>
CC: <afd@ti.com>, <akuster808@gmail.com>, <detheridge@ti.com>,
        <reatmon@ti.com>, <denis@denix.org>,
        <Openembedded-devel@lists.openembedded.org>
References: <20230427164723.863197-1-rs@ti.com>
 <CAMKF1so-36v9=sJqy+-AN1Y-qSVCgLNTeueci9=Hyy3RSWM9Fw@mail.gmail.com>
 <5edc6746-3944-f358-1a49-06e67ff616ad@ti.com>
 <CAMKF1sr6mJH+-qU+R7oX0rbDtpOJ15zcxPEzre4_j9SHYVv-mw@mail.gmail.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <CAMKF1sr6mJH+-qU+R7oX0rbDtpOJ15zcxPEzre4_j9SHYVv-mw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 33RJFS5u090171
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 19:15:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102220

On 4/27/23 12:35, Khem Raj wrote:
> On Thu, Apr 27, 2023 at 10:34=E2=80=AFAM Randolph Sapp <rs@ti.com> wrot=
e:
>>
>> On 4/27/23 11:53, Khem Raj wrote:
>>> On Thu, Apr 27, 2023 at 9:47=E2=80=AFAM <rs@ti.com> wrote:
>>>>
>>>> From: Randolph Sapp <rs@ti.com>
>>>>
>>>> GLFW has the ability to use a wayland backend. This patch adds a con=
fig
>>>> for it, but does not enable it by default because it has a dependenc=
y on
>>>> extra-cmake-modules which is provided (most commonly) by meta-qt5-ex=
tra.
>>>>
>>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>>> ---
>>>>    meta-oe/recipes-core/glfw/glfw_3.3.bb | 14 ++++++++++++--
>>>>    1 file changed, 12 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb b/meta-oe/recipes=
-core/glfw/glfw_3.3.bb
>>>> index b31bba6b6b..5b0d61241e 100644
>>>> --- a/meta-oe/recipes-core/glfw/glfw_3.3.bb
>>>> +++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb
>>>> @@ -20,7 +20,17 @@ EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON -DGL=
FW_BUILD_DOCS=3DOFF"
>>>>
>>>>    CFLAGS +=3D "-fPIC"
>>>>
>>>> -DEPENDS =3D "libpng libglu zlib libxrandr libxinerama libxi libxcur=
sor"
>>>> -REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
>>>> +DEPENDS =3D "libpng libglu zlib"
>>>> +REQUIRED_DISTRO_FEATURES =3D "opengl"
>>>> +ANY_OF_DISTRO_FEATURES =3D "wayland x11"
>>>> +
>>>> +# upstream considers x11 and wayland backends mutually exclusive an=
d will
>>>> +# prioritize wayland if it is enabled, but wayland has dependencies=
 that cannot
>>>> +# be satisfied by this layer so it is disabled by default
>>>> +
>>>> +PACKAGECONFIG ??=3D "x11"
>>>> +
>>>> +PACKAGECONFIG[wayland] =3D "-DGLFW_USE_WAYLAND=3DON,,wayland waylan=
d-native wayland-protocols extra-cmake-modules libxkbcommon"
>>>
>>> I wonder if extra-cmake-modules recipe is common enough to live in me=
ta-oe
>>
>> I'd be happy to offer up a recipe loosely based on what we've got in
>> meta-arago if you think it's worth it, but it seems to be mostly KDE
>> specific excluding this weird instance and a handful of desktop
>> applications that aren't packaged by oe-core or meta-oe.
>=20
> We dont want KDE stuff, but the fact that enabling wayland support
> needs it is less than ideal.
>=20

Given that this may be required for other components and exists to=20
extend cmake should I make a push to integrate this into oe-core=20
alongside cmake or do you think it's still enough of an optional package=20
that it should be in one of the meta-openembedded layers?

>>
>>>> +PACKAGECONFIG[x11] =3D ",,libxrandr libxinerama libxi libxcursor"
>>>>
>>>>    COMPATIBLE_HOST:libc-musl =3D "null"
>>>> --
>>>> 2.40.0
>>>>
>>


