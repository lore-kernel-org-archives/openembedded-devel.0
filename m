Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id E4C3C7977A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 00:24:00 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id h79-v6so6084251pfk.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 17:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=J3PxWTqM7vFVxjPg+Lk2doskTdyvcx8u7LpjqT+Ks9c=;
	b=AUh+rjpxycIt/ikeNIG7qfS2ur5h4Kp7B3eM70NDcYgERtmGctI8ORi6bvjqDiuK3G
	HnWMDllBp9neh/PaxPn/1ST0g/pf2wN2EJR1RZJ42Uv9yj2uHuI0XAPL3d0dwEedH+PW
	tz9qDxkVHMdzaVLF/zJ3Q9Jp9HC01dsUmm/UbQcAP9RvcCNnJ6+rpUcpX57p5FsZc+L7
	jFL2Tgl1004mwy9NqV+8ptKseUCAM3aINgrTFkJlFGne/sRZc5MjLWJpBBm18fAMlcZT
	kEc97sS83GxR81YtpZwvo1zYIr5mAl/xTNTM3LEA2j2dJ2zDyuunq4D2KbsV6XH9Mbws
	s8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to;
	bh=J3PxWTqM7vFVxjPg+Lk2doskTdyvcx8u7LpjqT+Ks9c=;
	b=ewK7TI6JQ2r3vCI5ob6NumTppeoR7GNXjf6RwYL1clqKSCyYUu73b7gkEQCO6B2TRB
	aOWXWXSHAXiqhbJYgG0kxCh3+sbPHRcmsfU6CyiGlP6W/VJL0qfNCv3P1sejX+xy55lp
	c+q4uqKzF5wrptJK/JZq3uFEDDsewrwYvbKjH7oI7PMb9zNsWtUHt0/K+Ks7P5tAfb5W
	G+tyUiXsBopGSNBqagFfw4/X57V7+43blJoRz2D0hrjLti01sZ/IN7PA7QvwCBLNVZlW
	xH3rtUeQYNiMndeiZ0ZIiFIISJth+Fj20bOT2alamfBz1lz+G6CKGEY51vgyNYekfTP/
	H4Aw==
X-Gm-Message-State: APzg51DrttWReYa3qxj4t3ZLgm+nnQnyO4VFQPI0Bk15TivJ7jPc279C
	UedJE/Iw8PEovkAYsWGc1m9aO+Wo
X-Google-Smtp-Source: ANB0VdblfiimnZLnN/IfPfrrLO7ooNDQKjio7UQqsY/WsaQOsRaMhG8b03OluWbE/55BpmFqrVRZUw==
X-Received: by 2002:a63:4663:: with SMTP id
	v35-v6mr5528393pgk.178.1536279841417; 
	Thu, 06 Sep 2018 17:24:01 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:fc25:43f8:d4d:d1b3])
	by smtp.gmail.com with ESMTPSA id
	f186-v6sm6411349pgc.4.2018.09.06.17.24.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Sep 2018 17:24:00 -0700 (PDT)
To: Philip Balister <philip@balister.org>,
	openembedded-devel@lists.openembedded.org
References: <20180905210224.21225-1-raj.khem@gmail.com>
	<20180905210224.21225-10-raj.khem@gmail.com>
	<70311756-b9d0-f3c2-cd7e-cb057f390ef4@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Organization: HIMVIS LLC
Message-ID: <f539cee0-af55-37e5-72c2-01c431e11832@gmail.com>
Date: Thu, 6 Sep 2018 17:23:55 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <70311756-b9d0-f3c2-cd7e-cb057f390ef4@balister.org>
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
X-List-Received-Date: Fri, 07 Sep 2018 00:24:01 -0000
X-Groupsio-MsgNum: 74405
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="W1XXzy8vux9dvPcLjptF54fB6TYG4xJ4g"

--W1XXzy8vux9dvPcLjptF54fB6TYG4xJ4g
Content-Type: multipart/mixed; boundary="JppU0Ud3fZc2K0sZKif7kPrh2tLzkFA0E";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Philip Balister <philip@balister.org>,
 openembedded-devel@lists.openembedded.org
Message-ID: <f539cee0-af55-37e5-72c2-01c431e11832@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 10/12] sip: Upgrade to 4.19.12 release
References: <20180905210224.21225-1-raj.khem@gmail.com>
 <20180905210224.21225-10-raj.khem@gmail.com>
 <70311756-b9d0-f3c2-cd7e-cb057f390ef4@balister.org>
In-Reply-To: <70311756-b9d0-f3c2-cd7e-cb057f390ef4@balister.org>

--JppU0Ud3fZc2K0sZKif7kPrh2tLzkFA0E
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 9/6/18 5:17 PM, Philip Balister wrote:
> This leads to a dysfunctional sip. I'm working on a working update.
>=20

Thanks for update, although we will need to move to this version for
openssl 1.1.x support. are working on fixing the same version ?
if so I will look forward for patches.

> On 09/05/2018 05:02 PM, Khem Raj wrote:
>> Inherit pythonnative instead of using python from build host
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../recipes-devtools/sip/{sip_4.19.8.bb =3D> sip_4.19.12.bb}  | 6 +++=
---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>  rename meta-oe/recipes-devtools/sip/{sip_4.19.8.bb =3D> sip_4.19.12.b=
b} (90%)
>>
>> diff --git a/meta-oe/recipes-devtools/sip/sip_4.19.8.bb b/meta-oe/reci=
pes-devtools/sip/sip_4.19.12.bb
>> similarity index 90%
>> rename from meta-oe/recipes-devtools/sip/sip_4.19.8.bb
>> rename to meta-oe/recipes-devtools/sip/sip_4.19.12.bb
>> index ea944b32ff..be58959989 100644
>> --- a/meta-oe/recipes-devtools/sip/sip_4.19.8.bb
>> +++ b/meta-oe/recipes-devtools/sip/sip_4.19.12.bb
>> @@ -4,13 +4,13 @@ SECTION =3D "devel"
>>  LICENSE =3D "GPLv2+"
>>  LIC_FILES_CHKSUM =3D "file://LICENSE-GPL2;md5=3De91355d8a6f8bd8f7c699=
d62863c7303"
>> =20
>> -inherit python-dir
>> +inherit python-dir pythonnative
>> =20
>>  DEPENDS =3D "python"
>> =20
>>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/pyqt/sip/sip-${PV}/sip-${P=
V}.tar.gz"
>> -SRC_URI[md5sum] =3D "0625fb20347d4ff1b5da551539be0727"
>> -SRC_URI[sha256sum] =3D "7eaf7a2ea7d4d38a56dd6d2506574464bddf7cf284c96=
0801679942377c297bc"
>> +SRC_URI[md5sum] =3D "e28b0790dfe4962ce6bbd7c4772f40c9"
>> +SRC_URI[sha256sum] =3D "24617fc31b983df075500ecac0e99d2fb48bf63ba82d4=
a17518659e571923822"
>> =20
>>  BBCLASSEXTEND =3D "native"
>> =20
>>


--JppU0Ud3fZc2K0sZKif7kPrh2tLzkFA0E--

--W1XXzy8vux9dvPcLjptF54fB6TYG4xJ4g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCW5HFGwAKCRC7BTNVkZ0z
FJXHAJ9IyFeEGvm6zprdWiKU6IPlFlQ2nQCfZTej89nNr2/MOQxt/RLt1nMp/Dw=
=tTyO
-----END PGP SIGNATURE-----

--W1XXzy8vux9dvPcLjptF54fB6TYG4xJ4g--
