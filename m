Return-Path: <sbabic@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC4AC27C53
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 12:44:47 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.33094.1718541884871374961
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jun 2024 05:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=Nx8znsav;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: sbabic@denx.de)
Received: from [IPV6:2001:a61:5210:b101:1be6:7198:f41d:799d] (unknown [IPv6:2001:a61:5210:b101:1be6:7198:f41d:799d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: sbabic@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6F06D80C58;
	Sun, 16 Jun 2024 14:44:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1718541882;
	bh=TPEhm7M/Xs++nN9CDq7ju52ceKSfHpfeaJv3H9K3k64=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Nx8znsavFhx9KMWXHio7WiJXZwr234ywbRgJOjqxOuBf4dVfxGwxX2hzCwQ0UmI5p
	 NzvacCm2igZeNW0OOvQoxkYKyglreCw0s5609ZbGm4xlNuKjD1K+U/HtVOKbTaaHgp
	 zv7+pXg2O97OqCZwu8ohQpgK474QFsB3Pr4XYjN1eD3xykZr7NVSUqtPIkKWOh/z57
	 8zyTwTWdXZ4WNWfVHZmYz7maFSmPuRFg+uqMKr0/0+rCLC5D/LB/3ucephQ+/bdtTT
	 NAg5kATOXP+GmSHcCofe27b3ID2eJSGYssBUUcLo2DMftApPdaV0tK+iPvKl5FjYKO
	 mvMrpF1Gy5pOg==
Message-ID: <9f9f4544-ac3a-47b9-9349-17bb3f1e26da@denx.de>
Date: Sun, 16 Jun 2024 14:44:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lvgl: add gridnav to packageconfig
To: Marek Vasut <marex@denx.de>, Stefano Babic <stefano.babic@swupdate.org>,
 openembedded-devel@lists.openembedded.org
Cc: Christophe Chapuis <chris.chapuis@gmail.com>,
 Khem Raj <raj.khem@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
References: <20240616102112.17463-1-stefano.babic@swupdate.org>
 <cce987d8-1df5-4a53-832f-71c8d8a18118@denx.de>
Content-Language: en-US
From: Stefano Babic <sbabic@denx.de>
In-Reply-To: <cce987d8-1df5-4a53-832f-71c8d8a18118@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 12:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110917

Hi Marek,

On 16.06.24 14:30, Marek Vasut wrote:
> On 6/16/24 12:21 PM, Stefano Babic wrote:
>> Some packages require to activate LVGL_CONFIG_LV_USE_GRIDNAV}
>=20
> Extra } here, please drop.
>=20
>> , so let
>> configure it.
>>
>> Signed-off-by: Stefano Babic <sbabic@denx.de>
>> ---
>> CC: Marek Vasut <marex@denx.de>
>> CC: Christophe Chapuis <chris.chapuis@gmail.com>
>> CC: Khem Raj <raj.khem@gmail.com>
>> Cc: Martin Jansa <martin.jansa@gmail.com>
>> ---
>> =C2=A0 meta-oe/recipes-graphics/lvgl/lv-conf.inc | 4 ++++
>> =C2=A0 1 file changed, 4 insertions(+)
>>
>> diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc=20
>> b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
>> index 8fd3412c0..c24df1b01 100644
>> --- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
>> +++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
>> @@ -14,6 +14,9 @@ LVGL_CONFIG_USE_EVDEV =3D=20
>> "${@bb.utils.contains_any('PACKAGECONFIG', 'drm fbdev',
>> =C2=A0 LVGL_CONFIG_USE_FBDEV =3D "${@bb.utils.contains('PACKAGECONFIG'=
,=20
>> 'fbdev', '1', '0', d)}"
>>
>> =C2=A0 LVGL_CONFIG_USE_SDL =3D "${@bb.utils.contains('PACKAGECONFIG', =
'sdl',=20
>> '1', '0', d)}"
>> +
>> +LVGL_CONFIG_LV_USE_GRIDNAV =3D "${@bb.utils.contains('PACKAGECONFIG',=
=20
>> 'gridnav', '1', '0', d)}"
>=20
> This hunk should be below LVGL_CONFIG_LV_USE_FONT_COMPRESSED to keep th=
e=20
> list of config options sorted.
>=20
>> =C2=A0 LVGL_CONFIG_SDL_FULLSCREEN ?=3D "0"
>>
>> =C2=A0 LVGL_CONFIG_LV_MEM_CUSTOM ?=3D "0"
>> @@ -71,6 +74,7 @@ do_configure:append() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -e "s|^([[:spac=
e:]]*#define=20
>> LV_USE_FONT_COMPRESSED[[:space:]]).*|\1${LVGL_CONFIG_LV_USE_FONT_COMPR=
ESSED}|" \
>=20
> Move the change from below to here, to keep the list sorted.
>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -e "s|^([[:spac=
e:]]*#define=20
>> LV_THEME_DEFAULT_DARK[[:space:]]).*|\1${LVGL_CONFIG_LV_THEME_DEFAULT_D=
ARK}|" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -e "s|^([[:space:]]*#defin=
e=20
>> LV_USE_GRIDNAV[[:space:]]).*|\1${LVGL_CONFIG_LV_USE_GRIDNAV}|" \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -i "${S}/lv_con=
f.h"
>> =C2=A0 }
>=20
> With that fixed, for V2:
>=20
> Reviewed-by: Marek Vasut <marex@denx.de>


Thanks for review, I send V2.

Best regards,
Stefano Babic

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich,   Office: Kirchenstr.5, 82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

