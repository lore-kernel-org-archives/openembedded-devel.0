Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBF0C77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 16:14:23 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.25304.1682612054895384008
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Apr 2023 09:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=cag6sj3P;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33RGE8oS064525;
	Thu, 27 Apr 2023 11:14:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682612048;
	bh=xuspf+lE83CE+gs37V6WZC67g1FLf/rsI4Xu/3Iz5q8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=cag6sj3PKIUXhYLtTG/IGPhNS1LRTKblrSneWDJdmzCiUCsbxFX+LYM4QKaHMGWEO
	 9pB9LIniilz5QJa0jHykV+9wkk28QWLsa+0tHYsEZlpt8c831pIRvT+jJA0xnP3zgu
	 KnFYYRLI1WUIq7ad0O+OwnvVhOe2OcL2dtrlt6tA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33RGE8kp066301
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Apr 2023 11:14:08 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 11:14:08 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 11:14:08 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33RGE8S1029108;
	Thu, 27 Apr 2023 11:14:08 -0500
Message-ID: <19d24e40-7918-3329-6745-741fcd260dfd@ti.com>
Date: Thu, 27 Apr 2023 11:14:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [EXTERNAL] Re: [oe] [meta-oe][kirkstone][PATCH] glfw: add
 packageconfig and wayland dependencies
To: Denys Dmytriyenko <denis@denix.org>, Khem Raj <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>, <afd@ti.com>,
        <reatmon@ti.com>, <akuster808@gmail.com>, <detheridge@ti.com>
References: <20230426203453.3497409-1-rs@ti.com>
 <20230426203453.3497409-2-rs@ti.com>
 <CAMKF1soDfEAhBYq91JVt9xhvQFr6yV2gsiOAcebCvX5wNio8iw@mail.gmail.com>
 <20230427160243.GK9226@denix.org>
Content-Language: en-US, en-US-large
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230427160243.GK9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 33RGE8oS064525
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 16:14:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102210

On 4/27/23 11:02, Denys Dmytriyenko wrote:
> On Thu, Apr 27, 2023 at 01:22:16AM -0700, Khem Raj wrote:
>> fails layer check perhaps it has some cross layer deps
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2693
>>
>> On Wed, Apr 26, 2023 at 1:35=E2=80=AFPM Randolph Sapp via
>> lists.openembedded.org <rs=3Dti.com@lists.openembedded.org> wrote:
>>>
>>> From: Randolph Sapp <rs@ti.com>
>>>
>>> GLFW has the ability to use a wayland backend. This patch adds a conf=
ig
>>> for it and attempts to automatically resolve the most common collisio=
n
>>> since the wayland and x11 backends are mutually exclusive.
>>>
>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>> ---
>>>   meta-oe/recipes-core/glfw/glfw_3.3.bb | 15 +++++++++++++--
>>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb b/meta-oe/recipes-=
core/glfw/glfw_3.3.bb
>>> index b31bba6b6b..29d7b5de42 100644
>>> --- a/meta-oe/recipes-core/glfw/glfw_3.3.bb
>>> +++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb
>>> @@ -20,7 +20,18 @@ EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON -DGLF=
W_BUILD_DOCS=3DOFF"
>>>
>>>   CFLAGS +=3D "-fPIC"
>>>
>>> -DEPENDS =3D "libpng libglu zlib libxrandr libxinerama libxi libxcurs=
or"
>>> -REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
>>> +DEPENDS =3D "libpng libglu zlib"
>>> +REQUIRED_DISTRO_FEATURES =3D "opengl"
>>> +ANY_OF_DISTRO_FEATURES =3D "wayland x11"
>>> +
>>> +# upstream considers x11 and wayland backends mutually exclusive and=
 will
>>> +# prioritize wayland if it is enabled
>>> +
>>> +PACKAGECONFIG ??=3D " \
>>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'x=
11', d)} \
>>> +"
>>> +
>>> +PACKAGECONFIG[wayland] =3D "-DGLFW_USE_WAYLAND=3DON,,wayland wayland=
-native wayland-protocols extra-cmake-modules libxkbcommon"
>=20
> ^^^ extra-cmake-modules is a KDE piece and available from these layers:
> https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3De=
xtra-cmake-modules
>=20
>=20
>>> +PACKAGECONFIG[x11] =3D ",,libxrandr libxinerama libxi libxcursor"
>>>
>>>   COMPATIBLE_HOST:libc-musl =3D "null"
>>> --
>>> 2.40.0

Rats. Well now I guess I know why this was never enabled. What's the=20
play? Drop this or add a new layer dependency? I think I already know=20
the answer but I figure I should ask anyway.

