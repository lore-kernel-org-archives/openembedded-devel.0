Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 267F079D61
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Nov 2018 19:40:41 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n10-v6so7732628pgv.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Nov 2018 11:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=NXbdkHVDItY0/LNcaak/V3/q0r2OfnTLv4WA5wGI7i0=;
	b=Z0Sd8BPB0SEPhOMFBxvlK/YdFX24fpcTTVntjLtruiHwlg6lIf/Gf+nFrOvGQszTSD
	hf26PydR4/kWlA3mU1JH/KS7iHdgcNsBEkjt3QrlYI+ohasVkUdtRF2pTtPLMyq2bzqi
	6AzH4il0uv6SXNXgfaASKTR9kw0WlxPkQZTXR+g6BMQcD6zaGPaSw5US2wu2uM76HI96
	63KU8FGa/X57WPM/GtdgZU7aqYlu4YCckzAijYkj7KCTUsFditPMXOskZEaIlS8ZM8dC
	OMN541BuUEPmZ0KekUBXpSEoxqXP0LGR+gjJOG3oSrGuj1XDmSAJWlVlhxFYEyDn4Chw
	FK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=NXbdkHVDItY0/LNcaak/V3/q0r2OfnTLv4WA5wGI7i0=;
	b=Xhi6kvxiaghF6rs5jZE72Ow2TgoiaebQrDJi4u0EEKvbhVdt7iBi9nfStkX3jWpOss
	3fh52c9Otppt5jJHVDgWx8BOttdekcG9a7DzwNvcP/1727xwngv411uhZxluo66NFSP8
	J2hpNxsqyCNxvy6f5V2U41Gn6F1wxeBQdXxC8i1C7Xc73DWBFma3CFAE60dr/CVl480r
	mp6drEXom7OryGdD/T7ZjvuoioHMifjzR0l5dpGRXOyqoKlHQaGFLcD3JpCiFi4kw28D
	oCCn0xRSFfwzkQ2RJji15Sl63K4Wl2D8X/bJkY2Ez90djHXReRT/b/19rqvsC/gvxfxC
	1IIg==
X-Gm-Message-State: AGRZ1gJ1Z8dUqUXeghUBKtHQgHIOrQXMsvgjyBxYIQZpP+GsPSXlL9Fy
	DJXDDr87jpIAEvL6ntmbzhjodxWg
X-Google-Smtp-Source: AJdET5dR9zk+BAN+j5P17/g+kyzv2dIC8teFDKaBNQOGRnX/5quX8Avy5h9znQQ4JxX3KXjLQsVjWg==
X-Received: by 2002:a65:65c9:: with SMTP id y9mr1359984pgv.438.1541619642514; 
	Wed, 07 Nov 2018 11:40:42 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:8dfb:8ab4:5b4a:d848?
	([2601:202:4180:c33:8dfb:8ab4:5b4a:d848])
	by smtp.gmail.com with ESMTPSA id
	d5-v6sm1428541pfo.131.2018.11.07.11.40.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Nov 2018 11:40:41 -0800 (PST)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <1541617902-21755-1-git-send-email-akuster808@gmail.com>
	<CALbNGRR1gd6fr8iivhxqfBqPnvL+yiAtKFHRvKD-v-G4GyV8eQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <fb6b0063-4d24-c1b1-eff2-c0e5849bea16@gmail.com>
Date: Wed, 7 Nov 2018 11:40:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CALbNGRR1gd6fr8iivhxqfBqPnvL+yiAtKFHRvKD-v-G4GyV8eQ@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] blueman: fix rdepends issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Nov 2018 19:40:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 11/7/18 11:22 AM, Andreas M=C3=BCller wrote:
> On Wed, Nov 7, 2018 at 8:12 PM Armin Kuster <akuster808@gmail.com> wrot=
e:
>> fixes
>> ERROR: Required build target 'blueman' has no buildable providers.
>> Missing or unbuildable dependency chain was: ['blueman', 'thunar']
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta-networking/recipes-connectivity/blueman/blueman_git.bb | 5 +++--=

>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-networking/recipes-connectivity/blueman/blueman_git.=
bb b/meta-networking/recipes-connectivity/blueman/blueman_git.bb
>> index 8eb99ed..06a11b7 100644
>> --- a/meta-networking/recipes-connectivity/blueman/blueman_git.bb
>> +++ b/meta-networking/recipes-connectivity/blueman/blueman_git.bb
>> @@ -27,9 +27,10 @@ RRECOMENDS_${PN} +=3D "adwaita-icon-theme"
>>  RDEPENDS_${PN} +=3D " \
>>      python3-dbus \
>>      packagegroup-tools-bluetooth \
>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'thunar', '', d)} =
\
>>  "
>> -
>> -PACKAGECONFIG[thunar] =3D "--enable-thunar-sendto,--disable-thunar-se=
ndto,,thunar"
>> +PACKAGECONGIG ??=3D ""
>> +PACKAGECONFIG[thunar] =3D "--enable-thunar-sendto,--disable-thunar-se=
ndto,,"
>>
>>  FILES_${PN} +=3D " \
>>      ${datadir}/dbus-1 \
>> --
>> 2.7.4
>>
> This is not right: How shall this happen if meta-xfce is not in your
> layers - I suggest you run a cleansstate after changing layer
> configuration


I am running the yocto-check-layer.=C2=A0 Should this recipe really be in=

meta-xfce? .. I am out of options on how to get this to pass. Maybe no
one cares if it ever does???


- armin

> Andreas


