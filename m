Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8FE616FFCE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 20:16:27 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id uo6so309598068pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 12:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=vXFzXZFaCbSm8ATvMFozwQ/sYg4pmourfQlJOStE/aw=;
	b=tyhTERLiji5MrFymNXMi1LJID4/D8H4esQKzFMtZ9mWcTOOh0AcKIaNt6H2TNyUZWU
	/qhz+83oWrzfAc3my/5FgayUA55HCsHjUpYZQU1CD/HoDxHi5RIsDdcILc17iiEMqd+l
	BJmz6gqb5t8Sng4By9hk7MOgIILMTLMug2KstqERXk3MJWyN2/QaAs6uzHq4Fbc86OAy
	FtT/I+pgSF3eEkhjV/gPmwVcvoSvimLKTdVmmeDFe1tN/gb0IzyAgpOrpU5oHWaQGXeX
	HY6Adrb1ZAVomQi0uuITJnyFKCLwA0VvIiisEjs7mVrmLm2eIGwf3geExySASNl0QZWj
	KhJQ==
X-Received: by 10.66.237.35 with SMTP id uz3mr183234474pac.96.1452543388918;
	Mon, 11 Jan 2016 12:16:28 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:409b:83af:918e:bae1?
	([2601:646:8802:5d5c:409b:83af:918e:bae1])
	by smtp.gmail.com with ESMTPSA id
	xr8sm187638078pab.26.2016.01.11.12.16.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 12:16:28 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CADySD0Fx+VpoaPNgFSwvne6D1ENxH=F-v4cpSJmjRtc2rpkS2A@mail.gmail.com>
Date: Mon, 11 Jan 2016 12:16:27 -0800
Message-Id: <90CBA3E6-A9A9-4485-ADAB-2D68D6E88E40@gmail.com>
References: <CADySD0EiW1oO_wezsLtEFX8h2V-ByykrgfSvOvGLJJLWyrm4uw@mail.gmail.com>
	<CAMKF1sqmg8gOj3_jjJTGebJQj+msh5tquKnOOV8zwShJtoHaUA@mail.gmail.com>
	<CADySD0Fx+VpoaPNgFSwvne6D1ENxH=F-v4cpSJmjRtc2rpkS2A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: bitbake meta-toolchain-qt5 error
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
X-List-Received-Date: Mon, 11 Jan 2016 20:16:28 -0000
X-Groupsio-MsgNum: 59469
Content-Type: multipart/signed;
	boundary="Apple-Mail=_90740183-8B24-461B-BD9F-3FE8BA47C832";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_90740183-8B24-461B-BD9F-3FE8BA47C832
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 11, 2016, at 11:25 AM, Ankur Tyagi <ankur.tyagi85@gmail.com> =
wrote:
>=20
> included stdint.h in qnetworkinfo_linux.cpp but still getting the same =
error

what version of gcc are you using and can you preprocess the file under =
error with -E -dD and pastebin it ?

>=20
> On Mon, Jan 11, 2016 at 10:47 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>> On Mon, Jan 11, 2016 at 10:37 AM, Ankur Tyagi =
<ankur.tyagi85@gmail.com>
>> wrote:
>>>=20
>> =
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-too=
lchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:159:9:
>>> error: expected identifier before '*' token
>>> |   return bt_get_unaligned((const uint64_t *) ptr);
>>=20
>> this means that stdint.h is missing from includes.
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_90740183-8B24-461B-BD9F-3FE8BA47C832
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaUDZsACgkQuwUzVZGdMxSCTQCbBsYIv9fyFWNDAsUumRhiodEu
2xEAn2bJ3SI8ZU5F6IYyU3WN9dbCdc/c
=V0dY
-----END PGP SIGNATURE-----

--Apple-Mail=_90740183-8B24-461B-BD9F-3FE8BA47C832--
