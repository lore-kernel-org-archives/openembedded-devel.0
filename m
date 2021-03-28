Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web09.2356.1616892470787970471
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Mar 2021 17:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.10, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4F7H9w6R4Yz1s2CJ;
	Sun, 28 Mar 2021 01:47:48 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4F7H9w6Bd8z1qsXM;
	Sun, 28 Mar 2021 01:47:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id XvJe2RELqGPl; Sun, 28 Mar 2021 01:47:47 +0100 (CET)
X-Auth-Info: XQ1NB+mAC45N/cL+Mb7i0GI7BI61SZJprYhZ5CfRkk4=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sun, 28 Mar 2021 01:47:47 +0100 (CET)
Subject: Re: [meta-oe][dunfell][PATCH] freerdp: Add missing libxkbcommon WL dependency
From: "Marek Vasut" <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>
References: <20201204234722.20315-1-marex@denx.de>
 <df600449-0f38-223a-e91a-c2f9bb6bd51e@denx.de>
Message-ID: <760ce487-ef1b-3022-bfc4-36a68d13d25b@denx.de>
Date: Sun, 28 Mar 2021 01:47:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <df600449-0f38-223a-e91a-c2f9bb6bd51e@denx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/12/21 3:18 PM, Marek Vasut wrote:
> On 12/5/20 12:47 AM, Marek Vasut wrote:
>> The WL build depends on libxkbcommon, so add the dependency.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> =C2=A0 meta-oe/recipes-support/freerdp/freerdp_git.bb | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb=20
>> b/meta-oe/recipes-support/freerdp/freerdp_git.bb
>> index 7cafbb799..82ef561fb 100644
>> --- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
>> +++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
>> @@ -40,7 +40,7 @@ PACKAGECONFIG ??=3D " \
>> =C2=A0 X11_DEPS =3D "virtual/libx11 libxinerama libxext libxcursor lib=
xv=20
>> libxi libxrender libxfixes libxdamage libxrandr libxkbfile"
>> =C2=A0 PACKAGECONFIG[x11] =3D "-DWITH_X11=3DON -DWITH_XINERAMA=3DON=20
>> -DWITH_XEXT=3DON -DWITH_XCURSOR=3DON -DWITH_XV=3DON -DWITH_XI=3DON=20
>> -DWITH_XRENDER=3DON -DWITH_XFIXES=3DON -DWITH_XDAMAGE=3DON -DWITH_XRAN=
DR=3DON=20
>> -DWITH_XKBFILE=3DON,-DWITH_X11=3DOFF,${X11_DEPS}"
>> -PACKAGECONFIG[wayland] =3D=20
>> "-DWITH_WAYLAND=3DON,-DWITH_WAYLAND=3DOFF,wayland wayland-native"
>> +PACKAGECONFIG[wayland] =3D=20
>> "-DWITH_WAYLAND=3DON,-DWITH_WAYLAND=3DOFF,wayland wayland-native=20
>> libxkbcommon"
>> =C2=A0 PACKAGECONFIG[directfb] =3D=20
>> "-DWITH_DIRECTFB=3DON,-DWITH_DIRECTFB=3DOFF,directfb"
>> =C2=A0 PACKAGECONFIG[pam] =3D "-DWITH_PAM=3DON,-DWITH_PAM=3DOFF,libpam=
"
>> =C2=A0 PACKAGECONFIG[pulseaudio] =3D=20
>> "-DWITH_PULSEAUDIO=3DON,-DWITH_PULSEAUDIO=3DOFF,pulseaudio"
>>
>=20
> +CC Armin, would be nice to have this picked up.

Any news on this ?
