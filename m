Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id C4E0B7D9A9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 16:24:32 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id e24so8806612pfi.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2019 09:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=3Tmxat+tM9PMoytucWMGRQs4+wXtYzRboZIQ2HPmjpw=;
	b=YiswAd5OTwi7ve+MDfQZACglvTM1MaOtWi+caTJvjDhjqWVPpQbURFI5f2seJpURk1
	PC9QdOu0RjfCk4U/6XOmDZQsynUAYvIUIqKQuMXSJ78NR6H8nTYtFrO3fKfVsbv/tIcN
	uG+NDpmVjuxzu6ZNhEbw0HKcz/ASmkEXvvqP8WiSo5FFXQ9HDdPQRsPPGI9XAQQECojE
	1dBQS9HDsUKSBLdrQcmkcWQkGCRO1t4VikGVNJVc/d+rzn1h5NSb70SG4SGwk5j2+sN/
	JnhjriFYJnhXUfNjUyZ/DY+QpEFXrDL3oFz3Z5KUGATgrI72OK5hwj7QPmqOQEOS5Qgs
	nJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=3Tmxat+tM9PMoytucWMGRQs4+wXtYzRboZIQ2HPmjpw=;
	b=KRa391wBtuQCEdj3ebi/ajXu69+zVTCrp+ewF3hZMomVyjeHKE54jvr1BkoVTwozdz
	v+uFbELomxD36zU1ZJrQfA6wXGbCb5UieLawZpdqKTbt+aHCzv4ZnBjNnM63DBO4Jyer
	4rO7Ag/WE0Rc0PBRFGoo2oY79BonrwpuJ9eyBAxwRZaK/29iOjP+bvhh4NRUXW3O+wDf
	BXbSVexE/ZWfXz6qMHlIXqFM1owHlnHW3v1VvIBj98H+LewmZTzivr9VvR47rvnoJFnk
	SThwCbfdDT026mSHRoWchMgreMmylCaTLSJz6uN7ADMeAC7VlsuuL5dXTTKSZjWuHP8q
	3twA==
X-Gm-Message-State: APjAAAXAaYB9gFG5aCTbF3p08y1UmcQyJUG1v7a4HluPaEW8N94Uz+yn
	fsRIeNb6UM8AyI2KFqZ4WZ6WZFeN
X-Google-Smtp-Source: APXvYqxdGu/QIjqvOYdjhmkZW6QpwKtPtzijUbcI9kCl4waOkIum2cQpugRfsQ3V83QFzmyWIzoz/w==
X-Received: by 2002:a63:7d03:: with SMTP id y3mr72105866pgc.8.1556727873363;
	Wed, 01 May 2019 09:24:33 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:8977:bf2:211e:20be?
	([2601:202:4180:c33:8977:bf2:211e:20be])
	by smtp.gmail.com with ESMTPSA id
	o66sm48790696pfb.184.2019.05.01.09.24.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 09:24:32 -0700 (PDT)
To: Tom Rini <trini@konsulko.com>
References: <1556725263-19751-1-git-send-email-akuster808@gmail.com>
	<20190501160044.GA31207@bill-the-cat>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <de5ac985-9b63-c19a-5c73-71ae0d684c04@gmail.com>
Date: Wed, 1 May 2019 09:24:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501160044.GA31207@bill-the-cat>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior][v2][PATCH] README: updated Maintainers list for Warrior
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
X-List-Received-Date: Wed, 01 May 2019 16:24:32 -0000
X-Groupsio-MsgNum: 77376
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="NH7O2Kbw0QJIk0Wg96ZmHaCHqoosLW6hE"

--NH7O2Kbw0QJIk0Wg96ZmHaCHqoosLW6hE
Content-Type: multipart/mixed; boundary="AXwTUtiX0spJbi6mxpR0r4lZoUJ70GLvb";
 protected-headers="v1"
From: akuster808 <akuster808@gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Message-ID: <de5ac985-9b63-c19a-5c73-71ae0d684c04@gmail.com>
Subject: Re: [oe] [warrior][v2][PATCH] README: updated Maintainers list for
 Warrior
References: <1556725263-19751-1-git-send-email-akuster808@gmail.com>
 <20190501160044.GA31207@bill-the-cat>
In-Reply-To: <20190501160044.GA31207@bill-the-cat>

--AXwTUtiX0spJbi6mxpR0r4lZoUJ70GLvb
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 5/1/19 9:00 AM, Tom Rini wrote:
> On Wed, May 01, 2019 at 08:41:03AM -0700, Armin Kuster wrote:
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>
>> [v2]
>> bump bitbake to warrior version
>> ---
>>  README                      |  2 +-
>>  meta-filesystems/README     | 12 ++++++------
>>  meta-gnome/README           | 10 +++++-----
>>  meta-initramfs/README       |  8 ++++----
>>  meta-multimedia/README      | 10 +++++-----
>>  meta-networking/MAINTAINERS | 32 +++-----------------------------
>>  meta-networking/README      |  6 +++---
>>  meta-oe/README              |  8 ++++----
>>  meta-perl/README            | 10 ++++------
>>  meta-python/README          | 12 +++++-------
>>  meta-webserver/README       |  8 ++++----
>>  meta-xfce/README            | 10 +++++-----
>>  12 files changed, 49 insertions(+), 79 deletions(-)
>>
>> diff --git a/README b/README
>> index 7318f09..881115e 100644
>> --- a/README
>> +++ b/README
>> @@ -1,6 +1,6 @@
>>  Collection of layers for the OE-core universe
>> =20
>> -Main layer maintainer: Khem Raj <raj.khem@gmail.com>
>> +Warrior maintainer: Armin Kuster  <akuster808@gmail.com>
>> =20
>>  This repository is a collection of layers to suppliment OE-Core
>>  with additional packages, Each layer have designated maintainer
>> diff --git a/meta-filesystems/README b/meta-filesystems/README
>> index 87cb685..842da13 100644
>> --- a/meta-filesystems/README
>> +++ b/meta-filesystems/README
>> @@ -10,30 +10,30 @@ Dependencies
>>  This layer depends on:
>> =20
>>    URI: git://git.openembedded.org/bitbake
>> -  branch: master
>> +  branch: 1.42
> To be clear, where is 1.42 coming from?
> $ git checkout warrior
> Switched to branch 'warrior'
> Your branch is up-to-date with 'origin/warrior'.
> $ git grep BB_MIN_VER
> meta/classes/sanity.bbclass:    minversion =3D d.getVar('BB_MIN_VERSION=
')
> meta/conf/sanity.conf:BB_MIN_VERSION =3D "1.39.1"
How is this a problem of meta-openembedded?
its a core=A0 and bitbake issue.

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=3Dwarrior&id=3D0=
c3423aae935c36e59d15d8bb60d7826cebc4e03
https://git.openembedded.org/bitbake/log/?h=3D1.42


>
> To be clear, I'm _not_ a fan of saying we need to go that old
> (especially since there's no CI done with that version) but I am saying=

> we should be consistent with the code.

You are helping make a case for removing the reference to what bitbake
version meta-filesystems want as its the only layer that identified it
needed bitbake.

The other layers in meta-openembedded don't list it.

I will send v3 to remove any reference to bitbake.

- armin
>



--AXwTUtiX0spJbi6mxpR0r4lZoUJ70GLvb--

--NH7O2Kbw0QJIk0Wg96ZmHaCHqoosLW6hE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJcycg/AAoJEO6LtJn0Vuf5JScP/0Rjj6Gu2QCm0Iv+l7DzVaf+
K5ry4lGop5fAEzzQaASsRKy/zsRKAOm6saQDrPn6Jc5D2qSRMzfTeExOH3CETVak
ZhXUiFcAkQ6fsz6qNsfRIjY7akvfL7Ng7F8yPR1S/23kpxKO6+3ouaKiaOGr5/AM
PJ1YvLXYoEodFEezaQLys9nLGE7QGXiD4ppaE6ldCunuBLbhEgAIWUTPN/V6i3JF
GnFpr8UWouRg0q86DCzhwuuGxCEDg1hhTh0jHcKAXo7Ck35XvRAh+8P2a5NpFpEW
EwHaQQfF/6wCBirqrvIMWReZup0FmFef3AnlO/90xsA3XTbD1AIF3m1Vu4BUbdqj
fOypKbO140D4WZPQsv00HQnTgOWMpfhpGU08+nRLe/8BL3h97NiWnicW/EBRX+0C
EUk1qydm2/M/mWtoTwvsEWZ3AOgfZDfxr+TqqlnxPUUUGuUblaUrk12PhlDcSbYN
t23qi9NCr8ud4XGohNC8tgrsLQXAAMaP6a4RANuqTxdpRFRhtYuLHNLbfUXoenQI
Ic/bBqGJ4A/DIlkYqkdEgP1zx7sUrXk+JlrJoPk6ROAaXwVr1WdylqbHVAv3VnjS
gLbE0Tg7RDLJgmldcOqly1XISWzUgXjdeOa+ZdC0zmPNooVFBAN7iuEdGWRunxZo
40yerqOJ2GSTPP2o71Yn
=XqTo
-----END PGP SIGNATURE-----

--NH7O2Kbw0QJIk0Wg96ZmHaCHqoosLW6hE--
