Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web11.22645.1617028625664600194
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Mar 2021 07:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.9, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4F8FXH4Y9xz1qtQH;
	Mon, 29 Mar 2021 16:37:03 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4F8FXH4LXxz1r1ML;
	Mon, 29 Mar 2021 16:37:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id ARow2cF94wKa; Mon, 29 Mar 2021 16:37:02 +0200 (CEST)
X-Auth-Info: Au6ao/W/6gO/iRYd83Yaas7PxaWH6411uZPgwU1YocY=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 29 Mar 2021 16:37:02 +0200 (CEST)
Subject: Re: [meta-oe][dunfell][PATCH] freerdp: Add missing libxkbcommon WL dependency
To: akuster808 <akuster808@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20201204234722.20315-1-marex@denx.de>
 <df600449-0f38-223a-e91a-c2f9bb6bd51e@denx.de>
 <760ce487-ef1b-3022-bfc4-36a68d13d25b@denx.de>
 <73b914d2-c05d-4b81-99a5-9ef406b9dc73@gmail.com>
From: "Marek Vasut" <marex@denx.de>
Message-ID: <ff8feee7-0cb5-a321-34cf-f14610e116e8@denx.de>
Date: Mon, 29 Mar 2021 16:37:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <73b914d2-c05d-4b81-99a5-9ef406b9dc73@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/29/21 7:14 AM, akuster808 wrote:
[...]
>>>> diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb
>>>> b/meta-oe/recipes-support/freerdp/freerdp_git.bb
>>>> index 7cafbb799..82ef561fb 100644
>>>> --- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
>>>> +++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
>>>> @@ -40,7 +40,7 @@ PACKAGECONFIG ??=3D " \
>>>>  =C2=A0 X11_DEPS =3D "virtual/libx11 libxinerama libxext libxcursor =
libxv
>>>> libxi libxrender libxfixes libxdamage libxrandr libxkbfile"
>>>>  =C2=A0 PACKAGECONFIG[x11] =3D "-DWITH_X11=3DON -DWITH_XINERAMA=3DON
>>>> -DWITH_XEXT=3DON -DWITH_XCURSOR=3DON -DWITH_XV=3DON -DWITH_XI=3DON
>>>> -DWITH_XRENDER=3DON -DWITH_XFIXES=3DON -DWITH_XDAMAGE=3DON
>>>> -DWITH_XRANDR=3DON -DWITH_XKBFILE=3DON,-DWITH_X11=3DOFF,${X11_DEPS}"
>>>> -PACKAGECONFIG[wayland] =3D
>>>> "-DWITH_WAYLAND=3DON,-DWITH_WAYLAND=3DOFF,wayland wayland-native"
>>>> +PACKAGECONFIG[wayland] =3D
>>>> "-DWITH_WAYLAND=3DON,-DWITH_WAYLAND=3DOFF,wayland wayland-native
>>>> libxkbcommon"
>>>>  =C2=A0 PACKAGECONFIG[directfb] =3D
>>>> "-DWITH_DIRECTFB=3DON,-DWITH_DIRECTFB=3DOFF,directfb"
>>>>  =C2=A0 PACKAGECONFIG[pam] =3D "-DWITH_PAM=3DON,-DWITH_PAM=3DOFF,lib=
pam"
>>>>  =C2=A0 PACKAGECONFIG[pulseaudio] =3D
>>>> "-DWITH_PULSEAUDIO=3DON,-DWITH_PULSEAUDIO=3DOFF,pulseaudio"
>>>>
>>>
>>> +CC Armin, would be nice to have this picked up.
>>
>> Any news on this ?
>=20
> its in the queue

Thanks
