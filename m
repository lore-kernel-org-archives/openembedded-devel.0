Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8DCA2616C2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 19:31:46 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id i19so77946pfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=2x3QhzM5cZ8BSoqsgIEm2jQxQEwVmRfOtm1qcZ+R36c=;
	b=SGqSkMzjHki7fH824XrQ03gzhpyMmqGVfWJtQ5rerMjb8bLiQwM19pA0dWxpaGI+TR
	C7SIulzKpYO0OLpnwz9dKilPWRPly/RCCx++8Wd8qijzGHDZdzS0N7TeW6qh125JPHU3
	3Hd4se1lxIkiLppHLq9LBvNy6M1rtDPXFXERFpu1Nsotbs7IhaG5JY7vLaCS0ryAiQas
	imui2djIhIvGU5tidtHzT+SKYHzfPz8BgaC16rqkg92U7fiBDsA92dq9qCCg6F9NENAd
	Thbplko+IBuA0Tn3HxcvJhsBozc7fhpmP0P0x55A2fAq640TcTEe5Jbsv/+sSjfWZ0zf
	7DTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=2x3QhzM5cZ8BSoqsgIEm2jQxQEwVmRfOtm1qcZ+R36c=;
	b=ucJhlKhVulpMVCf2L99q+oGOJY4IHf63ZgbTOAQo5tgWT8v1x/3Lv7fFBjT3Si9a9k
	D4PCQ0w5NQJ2e8xTup89oI+o82LdsHi8s2P2mlNAiqeUoyYyqP27ScDQ2jGDb6PwMKNT
	+SSGkvio4Shdc5GWfP/ZJmKkn84FEYEbzd6mzq6MKVMM6M3eMIh2uhjgW3x/aVoDPJl3
	ZeImJaN0hGnXalLVV0lezxnNQcSUG1Rg/4/x8lMoyZM45U+myz3hm1U7rJT4Bwvz2XXl
	12qeQmfYEaWf/I2AGlLOp3bD0qWD2TgidBGZvQ7pNlkjMJnXhqOTjw3v9frgH7MKbwT9
	ijrw==
X-Gm-Message-State: APjAAAVh6ZXeG8qxWCftZ43RRArGn6XR4yfOkj3Au4BouXpqWkIJ06ln
	WbTRFeZi5y6bAShrJ04hKgD8r2PFso0=
X-Google-Smtp-Source: APXvYqxQrpQoRosKeo1e6ThtEYPKOcpPgnJV1xakW6hgUg8YbTrjjc37Ksn0qj4pZyElNZHAWAKYmg==
X-Received: by 2002:aa7:8f0d:: with SMTP id x13mr265182pfr.61.1582659107299;
	Tue, 25 Feb 2020 11:31:47 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0::396c? ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id
	w21sm17655628pgc.87.2020.02.25.11.31.46
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 25 Feb 2020 11:31:46 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20200225190710.3928-1-Martin.Jansa@gmail.com>
	<CAMKF1spuk9oPW-9e6OVW0=O-MUWHM_0tOc35ZT4P5_qneXo8Aw@mail.gmail.com>
	<20200225192202.fjc5mxecs6c6oruj@jama>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
	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
Message-ID: <ba0e3efb-5a43-dc14-6917-0474830f5884@gmail.com>
Date: Tue, 25 Feb 2020 11:31:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200225192202.fjc5mxecs6c6oruj@jama>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] nodejs: don't enable ares support by default
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
X-List-Received-Date: Tue, 25 Feb 2020 19:31:46 -0000
X-Groupsio-MsgNum: 83036
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="WStOVE4kDXamTFwZZQmPq9nIzLe528lKq"

--WStOVE4kDXamTFwZZQmPq9nIzLe528lKq
Content-Type: multipart/mixed; boundary="or9jPSbo86MEn4ZUg6hQiD5HJstYAWO0y";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <ba0e3efb-5a43-dc14-6917-0474830f5884@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] nodejs: don't enable ares support by
 default
References: <20200225190710.3928-1-Martin.Jansa@gmail.com>
 <CAMKF1spuk9oPW-9e6OVW0=O-MUWHM_0tOc35ZT4P5_qneXo8Aw@mail.gmail.com>
 <20200225192202.fjc5mxecs6c6oruj@jama>
In-Reply-To: <20200225192202.fjc5mxecs6c6oruj@jama>

--or9jPSbo86MEn4ZUg6hQiD5HJstYAWO0y
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 2/25/20 11:22 AM, Martin Jansa wrote:
> On Tue, Feb 25, 2020 at 11:13:42AM -0800, Khem Raj wrote:
>> On Tue, Feb 25, 2020 at 11:07 AM Martin Jansa <martin.jansa@gmail.com>=
 wrote:
>>>
>>> * c-ares is in meta-networking and meta-oe doesn't depend on meta-net=
working
>>> * fixes:
>>>   ERROR: Nothing PROVIDES 'c-ares' (but meta-oe/recipes-devtools/node=
js/nodejs_12.14.1.bb DEPENDS on or otherwise requires it)
>>>   in builds without meta-networking
>>>
>>
>> this patch makes me thing if c-ares is better suites for meta-networki=
ng
>=20
> ?

s/meta-networking/meta-oe above

>=20
> This patch exists, because c-ares _is_ in meta-networking, while nodejs=

> which depends on it is in meta-oe.
>=20
>>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>>  meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb b/meta=
-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
>>> index 6eb52c209a..9f91a3f4dd 100644
>>> --- a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
>>> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
>>> @@ -51,7 +51,7 @@ ARCHFLAGS_arm =3D "${@bb.utils.contains('TUNE_FEATU=
RES', 'callconvention-hard', '-
>>>  GYP_DEFINES_append_mipsel =3D " mips_arch_variant=3D'r1' "
>>>  ARCHFLAGS ?=3D ""
>>>
>>> -PACKAGECONFIG ??=3D "ares icu libuv zlib"
>>> +PACKAGECONFIG ??=3D "icu libuv zlib"
>>>  PACKAGECONFIG[ares] =3D "--shared-cares,,c-ares"
>>>  PACKAGECONFIG[gyp] =3D ",,gyp-py2-native"
>>>  PACKAGECONFIG[icu] =3D "--with-intl=3Dsystem-icu,--without-intl,icu"=

>>> --
>>> 2.20.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--or9jPSbo86MEn4ZUg6hQiD5HJstYAWO0y--

--WStOVE4kDXamTFwZZQmPq9nIzLe528lKq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCXlV2KgAKCRC7BTNVkZ0z
FGHZAJ4iow6xdT0bJ4yjvT8cp05lbJMMUwCfSHY83oy/xJv2BAycVJcVIdtaMCE=
=K+dL
-----END PGP SIGNATURE-----

--WStOVE4kDXamTFwZZQmPq9nIzLe528lKq--
