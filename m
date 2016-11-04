Return-Path: <ruben.de.smet@rubdos.be>
Received: from mail.glycos.org (mail.glycos.org [178.62.217.237])
	by mail.openembedded.org (Postfix) with ESMTP id 95BD76078D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Nov 2016 19:09:08 +0000 (UTC)
Received: from arch-club.local (unknown [84.198.89.1])
	by mail.glycos.org (Postfix) with ESMTPSA id 021F844C47;
	Fri,  4 Nov 2016 19:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rubdos.be;
	s=default; t=1478286549;
	bh=14ncQx1PSBoaNDKH6GELCvDCamXbVmCZ3eMp2YIu+sc=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Td5dgPX8MyAr2wCuQ/sMXHdj0okobHnfN0TFUB9BFQNmtYn48b7ufqHmvdJoNE0eg
	qfLHPZBlKkckkt4Fr3DTm3qFFJ4mHvl7XCskhd+GMR/2KRbPvP5Gc3CU1e5NliBcnK
	JypvVHpA2FukGfJrZ605wQiuLgYu5zE1HrK/k7cM=
To: Derek Straka <straka.derek@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20161104101649.20749-1-ruben.de.smet@rubdos.be>
	<CADNbA1r1ZpMZ+0uv0SXOfr9c0tgKOqEqC4NrR4iZu0AR+33tqQ@mail.gmail.com>
From: Ruben De Smet <ruben.de.smet@rubdos.be>
Message-ID: <1a53564d-2eb8-a073-fafe-b4d16bd9562d@rubdos.be>
Date: Fri, 4 Nov 2016 20:09:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CADNbA1r1ZpMZ+0uv0SXOfr9c0tgKOqEqC4NrR4iZu0AR+33tqQ@mail.gmail.com>
Subject: Re: [meta-python][PATCH v2] python-spidev: add recipe for version 3.2
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
X-List-Received-Date: Fri, 04 Nov 2016 19:09:09 -0000
X-Groupsio-MsgNum: 63748
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Q0QP14CWSErFQbDBSlb8r1sU5OodXus2l"

--Q0QP14CWSErFQbDBSlb8r1sU5OodXus2l
Content-Type: multipart/mixed; boundary="sqPibaTGwH63avMuq9pCDpxud1pQV4ROG";
 protected-headers="v1"
From: Ruben De Smet <ruben.de.smet@rubdos.be>
To: Derek Straka <straka.derek@gmail.com>,
 openembeded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <1a53564d-2eb8-a073-fafe-b4d16bd9562d@rubdos.be>
Subject: Re: [oe] [meta-python][PATCH v2] python-spidev: add recipe for
 version 3.2
References: <20161104101649.20749-1-ruben.de.smet@rubdos.be>
 <CADNbA1r1ZpMZ+0uv0SXOfr9c0tgKOqEqC4NrR4iZu0AR+33tqQ@mail.gmail.com>
In-Reply-To: <CADNbA1r1ZpMZ+0uv0SXOfr9c0tgKOqEqC4NrR4iZu0AR+33tqQ@mail.gmail.com>

--sqPibaTGwH63avMuq9pCDpxud1pQV4ROG
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/04/2016 02:20 PM, Derek Straka wrote:
> On Fri, Nov 4, 2016 at 6:16 AM, Ruben De Smet <ruben.de.smet@rubdos.be>=

> wrote:
>=20
>> A python module for interfacing with SPI
>>
>> Signed-off-by: Ruben De Smet <ruben.de.smet@rubdos.be>
>> ---
>>  meta-python/recipes-devtools/python/python-spidev.inc   | 17
>> +++++++++++++++++
>>  .../recipes-devtools/python/python3-spidev_3.2.bb       |  6 ++++++
>>  2 files changed, 23 insertions(+)
>>  create mode 100644 meta-python/recipes-devtools/python/python-spidev.=
inc
>>  create mode 100644 meta-python/recipes-devtools/python/
>> python3-spidev_3.2.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python-spidev.inc
>> b/meta-python/recipes-devtools/python/python-spidev.inc
>> new file mode 100644
>> index 0000000..1b93763
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-spidev.inc
>> @@ -0,0 +1,17 @@
>> +SUMMARY =3D "Python bindings for Linux SPI access through spidev"
>> +DESCRIPTION =3D "This project contains a python module for interfacin=
g with
>> SPI\
>> +devices from user space via the spidev linux kernel driver.\
>> +This is a modified version of the code originally found\
>> +[here](http://elk.informatik.fh-augsburg.de/da/da-49/trees/
>> pyap7k/lang/py-spi)\
>> +All code is GPLv2 licensed unless explicitly stated otherwise."
>> +HOMEPAGE =3D "http://github.com/doceme/py-spidev"
>> +SECTION =3D "devel/python"
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D54bdb9022ebb75ab68399cd=
aab97da
>> 60"
>> +SRCNAME =3D "spidev"
>> +
>> +SRC_URI[md5sum] =3D "f601676f1bb48b9aa3b3897f95216365"
>> +SRC_URI[sha256sum] =3D "09d2b5122f0dd79910713a11f9a002
>> 0f71537224bf829916def4fffc0ea59456"
>> +
>> +
>> +inherit pypi
>> diff --git a/meta-python/recipes-devtools/python/python3-spidev_3.2.bb=

>> b/meta-python/recipes-devtools/python/python3-spidev_3.2.bb
>> new file mode 100644
>> index 0000000..59f1c4f
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-spidev_3.2.bb
>> @@ -0,0 +1,6 @@
>> +inherit setuptools3
>> +require python-spidev.inc
>> +
>> +RDEPENDS_${PN} +=3D "\
>> +"
>>
> Any need to keep the empty '+=3D'?
>=20

Heh that's stupid. Will change right away.

>> +RDEPENDS_${PN}_class-native =3D ""
>> --
>> 2.10.2
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>=20



--sqPibaTGwH63avMuq9pCDpxud1pQV4ROG--

--Q0QP14CWSErFQbDBSlb8r1sU5OodXus2l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQE2BAEBCAAgBQJYHNzUGRxydWJlbi5kZS5zbWV0QGdseWNvcy5vcmcACgkQ+CZa
iBIT3BAzjQf+JK1lUL8SetdtZlRfjO0pnHKofrJiB3EYjo6nYBGVlWzJSZDzP3s0
ha8vdSniChhBwbBU37+PRK9KnSRa1Yzm5LWPq6sB2gFgZmcqrlP4ZE0OONQoOz8t
EXkx8DtPg95GsLOseOHdnVlTss8j5dUR1Dq0uOm2jR7RJ0g+rdeboOQy5Uk8NcBy
zqN0xyz0xtrv/MACX0rNv9Buw9Me8NnTE4DnYJC6cgdMOP8adfeaKsdFNghxS+14
rClMR0miNZ477aJ3yez+wkSCTVTfuF1Lm3y9KTNOyOeVGNqQgw4rmICWJg1PHcPP
Zucgt1pJjgD0iiCKhVPAs0upLHdpXHDIQQ==
=GGHb
-----END PGP SIGNATURE-----

--Q0QP14CWSErFQbDBSlb8r1sU5OodXus2l--
