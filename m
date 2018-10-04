Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id E3F7978A99
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Oct 2018 06:37:40 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id k19-v6so2893406pfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2018 23:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=j+d8cOynaUDIOIoRCL+0ceYwI41uFTvoreM6Nc9S1RM=;
	b=M0jJBM7iNRoBwKxwjEB6STw+dVGVBde0dCKC7nUJ+Op+EyS35KsYMGKfseVEvRZDtF
	2a9jYGyvVjsEO8exnh85kZvoosFLFhT1gLkgBx7HKAG3pWR7RC1Tkh4ogH/EahRiGrJ5
	IBZPWyu22rR9RD2uh65k5zrbtQMriaQWfePnvUrR8yCmeIf7DQ6OfUhR7+w8N4KrVBTr
	xw+8oQWd5ktjcE2uTTX6cqtH5YDiI9N98u/19utANDzpVghLr7c2K6XKlByjxAJ11PRw
	0dfCaWwGcQ6iHTCUnV2gvc91WBbZBOEbtTXfLlNJu9m1Gfe9g+BbGDQxKJhdkDczDtaZ
	yCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to;
	bh=j+d8cOynaUDIOIoRCL+0ceYwI41uFTvoreM6Nc9S1RM=;
	b=CbaulEzk8Vo6PjWHe1srR38cgp4Ke6Ym8BMV/YfnE152YpxjwLh8lB3vr/elzoizS9
	1+8WX6lK0MNKzFGCnZ+cGyZrsABbnB9qDXX52IBIFuY/g4dd0gIqA0VpSSX+8tm/vcl7
	6NIKsSTs/eH93G0eYBnJHGEfteFjYa6gjKJksKdzNT7egGXZnt2fa2L3fUKoNw9nsGzn
	MgrjVtD1kGetDIqc3bmcHwsJruMzK7EWH1eGJiHzkgQk1Cwu7rIAqN0twabviU6AGwMn
	X4mwUhqtcVBQravPztrpM3JkD0ZwdZhkJlLbiCH+1W5HQuvSAWzkBBdSDHjw3pmRtq8H
	w2iA==
X-Gm-Message-State: ABuFfojktkY6FFCKXCbXYQM3h3DURWlcXKtCqpqzzJlTH9LdjnK0s0wF
	vOzkiq4l47bgLCKZZHMApvn62t++
X-Google-Smtp-Source: ACcGV62VQ+lNCTb/dAe8adXh9qp41jiK400OZ60GAitTBXHN0Ur90F7G3Oyo8TsyzNKECn06DdO0qg==
X-Received: by 2002:a62:ca4d:: with SMTP id n74-v6mr791067pfg.10.1538635061285;
	Wed, 03 Oct 2018 23:37:41 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:d433:f8f7:b499:a790])
	by smtp.gmail.com with ESMTPSA id
	25-v6sm9907473pfm.36.2018.10.03.23.37.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 23:37:40 -0700 (PDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <20181003192455.24921-1-schnitzeltony@gmail.com>
	<CAMKF1sotCFH3POn6S11GOdkuH2A886iKN=PGdPA_81c59TzwhA@mail.gmail.com>
	<CALbNGRR0v4Nm1O7J2RQC0-MqRVLZNpDHn1jDYVRedpttr3AY9w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Organization: HIMVIS LLC
Message-ID: <ee935578-3dba-ac85-d207-9636e8916a6a@gmail.com>
Date: Wed, 3 Oct 2018 23:37:30 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRR0v4Nm1O7J2RQC0-MqRVLZNpDHn1jDYVRedpttr3AY9w@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/8] libsdl-gfx: initial add 2.0.25
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
X-List-Received-Date: Thu, 04 Oct 2018 06:37:41 -0000
X-Groupsio-MsgNum: 74849
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="NL0HD8KlGyGx1hrPf5MHmGi7HKixWMno2"

--NL0HD8KlGyGx1hrPf5MHmGi7HKixWMno2
Content-Type: multipart/mixed; boundary="1j8bdwTeXn9OQM7oNh4pk26Cp0PKn6DDC";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <ee935578-3dba-ac85-d207-9636e8916a6a@gmail.com>
Subject: Re: [oe] [PATCH 1/8] libsdl-gfx: initial add 2.0.25
References: <20181003192455.24921-1-schnitzeltony@gmail.com>
 <CAMKF1sotCFH3POn6S11GOdkuH2A886iKN=PGdPA_81c59TzwhA@mail.gmail.com>
 <CALbNGRR0v4Nm1O7J2RQC0-MqRVLZNpDHn1jDYVRedpttr3AY9w@mail.gmail.com>
In-Reply-To: <CALbNGRR0v4Nm1O7J2RQC0-MqRVLZNpDHn1jDYVRedpttr3AY9w@mail.gmail.com>

--1j8bdwTeXn9OQM7oNh4pk26Cp0PKn6DDC
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Andreas


On 10/3/18 1:56 PM, Andreas M=C3=BCller wrote:
> On Wed, Oct 3, 2018 at 10:32 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Wed, Oct 3, 2018 at 12:25 PM Andreas M=C3=BCller <schnitzeltony@gma=
il.com> wrote:
>>>
>>> Recipes like this live in in meta-games and meta-game-emulators. Once=
 applied
>>> here, pull requests will go out.
>>>
>>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>>> ---
>>>  meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb | 20 ++++++++++=
++++++++++
>>>  1 file changed, 20 insertions(+)
>>>  create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25=
=2Ebb
>>>
>>> diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb b/m=
eta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb
>>> new file mode 100644
>>> index 000000000..c9910cb1b
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-graphics/libsdl/libsdl-gfx_2.0.25.bb
>>> @@ -0,0 +1,20 @@
>>> +SUMMARY =3D "SDL graphics drawing primitives and other support funct=
ions"
>>> +SECTION =3D "libs"
>>> +LICENSE =3D "Zlib"
>>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d1de21f0b70830e299905eac=
3419084"
>>> +
>>> +DEPENDS =3D "virtual/libsdl"
>>> +
>>> +SRC_URI =3D "http://www.ferzkopp.net/Software/SDL_gfx-2.0/SDL_gfx-${=
PV}.tar.gz"
>>> +SRC_URI[md5sum] =3D "ea24ed4b82ff1304809c363494fa8e16"
>>> +SRC_URI[sha256sum] =3D "556eedc06b6cf29eb495b6d27f2dcc51bf909ad82389=
ba2fa7bdc4dec89059c0"
>>> +
>>> +S =3D "${WORKDIR}/SDL_gfx-${PV}"
>>> +
>>> +inherit autotools pkgconfig
>>> +
>>> +EXTRA_OECONF +=3D " \
>>> +    SDL_CONFIG=3D${STAGING_BINDIR_CROSS}/pkg-config sdl \
>>
>> is the intention to have SDL_CONFIG point to pkg-config here
>>
> I was under the impression it replaces sdl-config (sdl-config supports
> for basic stuff as cflags and libs same arguments as pkg-config). Now
> that you ask I checked and grepping did not show my why I should set
> it (it is mentioned in the doc but...).
> So I tested and it builds fine without setting SDL_CONFIG. So V2 is
> near - thanks for the pointer.

I was thinking it should be

SDL_CONFIG=3D"${STAGING_BINDIR_CROSS}/pkg-config sdl"

>=20
> Andreas
>=20


--1j8bdwTeXn9OQM7oNh4pk26Cp0PKn6DDC--

--NL0HD8KlGyGx1hrPf5MHmGi7HKixWMno2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCW7W1KwAKCRC7BTNVkZ0z
FNmsAJ9wXDqDM/n/CMac6Y9gOE7cutF65ACfQOsqkKveh6cQIkUWROU59InJ2bQ=
=EI31
-----END PGP SIGNATURE-----

--NL0HD8KlGyGx1hrPf5MHmGi7HKixWMno2--
