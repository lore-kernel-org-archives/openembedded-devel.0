Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id D1BCD7918C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 00:38:26 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id x17-v6so6118133pfh.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 17:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=32Doh5p8Jr664Pjh+Aa0xMxvNAno4L/U7tr/Kzz5jyg=;
	b=pLnrsS2z5PQOMWs5MTqOCVi2Oon9YvqdJnFBpifY1jQbWanZgvT+PftFIBngOHd4Bl
	OYejke6MYunKXyaKbju2hk0y7+dL597ybmXJCUboMaS3CsPrwM6OaitLRXWr8smKVVT7
	JntvEkOk9JRWGAEA/FrmjmqBFzsp2AetmCZbSWSwrbOBFjV9TKPcgKBTDYePR4nANnjn
	xSaupUZaSnpx3HqV4Awiq4B/Q0EPi4LGwkjp78yrmx3r3zVOZ4M/hUAWsEpRs3jBNnO7
	RT4nHPW4eZOnZsz1GgK40TGxj2X6FQ8IUkXn2/5WDKKRw8uLNZ47EDX4GCRid5YDXHfY
	M0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to;
	bh=32Doh5p8Jr664Pjh+Aa0xMxvNAno4L/U7tr/Kzz5jyg=;
	b=B2yxtEX5+3WqwnKZMFqPOjuIiiQuZ7HkIzOjCReUGE7oE3SIsOE6mqJZ9RhaldulWM
	cxjPxYWnmwBvBPP9QzKsIdmLhjklGH1cXp4s6BmCRhnklaXW4XLztnU6OTeIRjAph5M3
	gKyvF5+ONGYpE4qt5zvKQuKHSljhCOTgcp6b896E6GxUghHxeyHWbVOTAKfhqkz5YxoV
	8N/oTYgi4RoLDGpQV1uL0cnZtOoUEeal8CgyaOB2F8jzcByB/XadqcK09LmKUsAjfZC0
	XzYXW0Oc0qkZXszOkzKULyOMlK1uivAcV98WLNx2v9OK3pxUTDr1as8UGT0Tl5xsc6VD
	kONA==
X-Gm-Message-State: APzg51Aeg4uNlBO7dcJatH0Z2RuGCvvCgY7gd068ep1/M+WunN9DAUVQ
	ZF5cFuO1f1DR79qXkCL+/+mjhbOX
X-Google-Smtp-Source: ANB0VdY0eo0Z5iELyOQm+e6MncEOK49Mclf6KOXAk3cyrjcKJjVvY+VlZrCdRdJZv0lU4y6OjzvNoQ==
X-Received: by 2002:a62:fcd2:: with SMTP id
	e201-v6mr5777151pfh.101.1536280707390; 
	Thu, 06 Sep 2018 17:38:27 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:fc25:43f8:d4d:d1b3])
	by smtp.gmail.com with ESMTPSA id
	s75-v6sm11372668pfd.108.2018.09.06.17.38.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 17:38:26 -0700 (PDT)
To: Philip Balister <philip@balister.org>,
	openembedded-devel@lists.openembedded.org
References: <20180905210224.21225-1-raj.khem@gmail.com>
	<20180905210224.21225-10-raj.khem@gmail.com>
	<70311756-b9d0-f3c2-cd7e-cb057f390ef4@balister.org>
	<f539cee0-af55-37e5-72c2-01c431e11832@gmail.com>
	<81feb8d0-7b41-a744-ebac-742dd92a32b4@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Organization: HIMVIS LLC
Message-ID: <fe959205-486b-3138-d499-7e40999f9894@gmail.com>
Date: Thu, 6 Sep 2018 17:38:21 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <81feb8d0-7b41-a744-ebac-742dd92a32b4@balister.org>
Subject: Re: [meta-oe][PATCH 10/12] sip: Upgrade to 4.19.12 release
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
X-List-Received-Date: Fri, 07 Sep 2018 00:38:26 -0000
X-Groupsio-MsgNum: 74408
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="mW1IqXgjejdfQxKPIZwq7OkRPDrqBhape"

--mW1IqXgjejdfQxKPIZwq7OkRPDrqBhape
Content-Type: multipart/mixed; boundary="Em8YPS2AIXKYKHeAsZwi2Phd1voSWF2NC";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Philip Balister <philip@balister.org>,
 openembedded-devel@lists.openembedded.org
Message-ID: <fe959205-486b-3138-d499-7e40999f9894@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 10/12] sip: Upgrade to 4.19.12 release
References: <20180905210224.21225-1-raj.khem@gmail.com>
 <20180905210224.21225-10-raj.khem@gmail.com>
 <70311756-b9d0-f3c2-cd7e-cb057f390ef4@balister.org>
 <f539cee0-af55-37e5-72c2-01c431e11832@gmail.com>
 <81feb8d0-7b41-a744-ebac-742dd92a32b4@balister.org>
In-Reply-To: <81feb8d0-7b41-a744-ebac-742dd92a32b4@balister.org>

--Em8YPS2AIXKYKHeAsZwi2Phd1voSWF2NC
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 9/6/18 5:29 PM, Philip Balister wrote:
> Yes working for the latest release. I emailed the pyqt/sip list with a
> question. Hopefully we can sort the issue out. Working toward a combine=
d
> pyqt5 build for py 2 and 3
>=20

thanks, keep informed here

> Philip
>=20
> On 09/06/2018 08:23 PM, Khem Raj wrote:
>>
>>
>> On 9/6/18 5:17 PM, Philip Balister wrote:
>>> This leads to a dysfunctional sip. I'm working on a working update.
>>>
>>
>> Thanks for update, although we will need to move to this version for
>> openssl 1.1.x support. are working on fixing the same version ?
>> if so I will look forward for patches.
>>
>>> On 09/05/2018 05:02 PM, Khem Raj wrote:
>>>> Inherit pythonnative instead of using python from build host
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>>  .../recipes-devtools/sip/{sip_4.19.8.bb =3D> sip_4.19.12.bb}  | 6 +=
++---
>>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>>  rename meta-oe/recipes-devtools/sip/{sip_4.19.8.bb =3D> sip_4.19.12=
=2Ebb} (90%)
>>>>
>>>> diff --git a/meta-oe/recipes-devtools/sip/sip_4.19.8.bb b/meta-oe/re=
cipes-devtools/sip/sip_4.19.12.bb
>>>> similarity index 90%
>>>> rename from meta-oe/recipes-devtools/sip/sip_4.19.8.bb
>>>> rename to meta-oe/recipes-devtools/sip/sip_4.19.12.bb
>>>> index ea944b32ff..be58959989 100644
>>>> --- a/meta-oe/recipes-devtools/sip/sip_4.19.8.bb
>>>> +++ b/meta-oe/recipes-devtools/sip/sip_4.19.12.bb
>>>> @@ -4,13 +4,13 @@ SECTION =3D "devel"
>>>>  LICENSE =3D "GPLv2+"
>>>>  LIC_FILES_CHKSUM =3D "file://LICENSE-GPL2;md5=3De91355d8a6f8bd8f7c6=
99d62863c7303"
>>>> =20
>>>> -inherit python-dir
>>>> +inherit python-dir pythonnative
>>>> =20
>>>>  DEPENDS =3D "python"
>>>> =20
>>>>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/pyqt/sip/sip-${PV}/sip-$=
{PV}.tar.gz"
>>>> -SRC_URI[md5sum] =3D "0625fb20347d4ff1b5da551539be0727"
>>>> -SRC_URI[sha256sum] =3D "7eaf7a2ea7d4d38a56dd6d2506574464bddf7cf284c=
960801679942377c297bc"
>>>> +SRC_URI[md5sum] =3D "e28b0790dfe4962ce6bbd7c4772f40c9"
>>>> +SRC_URI[sha256sum] =3D "24617fc31b983df075500ecac0e99d2fb48bf63ba82=
d4a17518659e571923822"
>>>> =20
>>>>  BBCLASSEXTEND =3D "native"
>>>> =20
>>>>
>>


--Em8YPS2AIXKYKHeAsZwi2Phd1voSWF2NC--

--mW1IqXgjejdfQxKPIZwq7OkRPDrqBhape
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCW5HIfgAKCRC7BTNVkZ0z
FLxhAJ0UwxwIV0H2yShcKz2aWowcJKzsLgCdF7BMOz/daQl7OutgNlkCK53b644=
=YSA1
-----END PGP SIGNATURE-----

--mW1IqXgjejdfQxKPIZwq7OkRPDrqBhape--
