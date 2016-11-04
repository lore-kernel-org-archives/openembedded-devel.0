Return-Path: <ruben.de.smet@rubdos.be>
Received: from mail.glycos.org (mail.glycos.org [178.62.217.237])
	by mail.openembedded.org (Postfix) with ESMTP id 10EBD71BCF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Nov 2016 19:27:54 +0000 (UTC)
Received: from arch-club.local (unknown [84.198.89.1])
	by mail.glycos.org (Postfix) with ESMTPSA id 2B11B44CD1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Nov 2016 19:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rubdos.be;
	s=default; t=1478287675;
	bh=GdUFUALTztyq+/LsYP74OS1v86JXqAyA2nqwmZ14usg=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=DDVeD8CAN2+XutvCnRjGsYdsGSZOWmj8YGzBJgd1lQcp0GYWxLJK9KOVDHJbHGt61
	RX5ggfjqnaBwClthPshTYWnAyBYPPUjwRcKqhTWzHIvpEM2ye35mXYkrD9Gzjpf7Iv
	qIHozuE9KP/yjKaEu77w2xr2y2pP4j1/hOr/5d78=
To: openembedded-devel@lists.openembedded.org
References: <20161104101639.20665-1-ruben.de.smet@rubdos.be>
	<96645ce4-02c6-5de8-13e0-b6369429860a@gmail.com>
From: Ruben De Smet <ruben.de.smet@rubdos.be>
Message-ID: <ae9e05db-9331-444b-701c-1a084f57d1e5@rubdos.be>
Date: Fri, 4 Nov 2016 20:27:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <96645ce4-02c6-5de8-13e0-b6369429860a@gmail.com>
Subject: Re: [meta-python][PATCH v2] python-cassandra-driver: add recipe for version 3.6.0
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
X-List-Received-Date: Fri, 04 Nov 2016 19:27:55 -0000
X-Groupsio-MsgNum: 63749
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="3mOMWOmO1oAN8OOUnhqidNs0M8u4cqo7I"

--3mOMWOmO1oAN8OOUnhqidNs0M8u4cqo7I
Content-Type: multipart/mixed; boundary="1nX1e9sQM4jmETr5dp6NvoRb0jA9M9nMk";
 protected-headers="v1"
From: Ruben De Smet <ruben.de.smet@rubdos.be>
To: openembedded-devel@lists.openembedded.org
Message-ID: <ae9e05db-9331-444b-701c-1a084f57d1e5@rubdos.be>
Subject: Re: [oe] [meta-python][PATCH v2] python-cassandra-driver: add recipe
 for version 3.6.0
References: <20161104101639.20665-1-ruben.de.smet@rubdos.be>
 <96645ce4-02c6-5de8-13e0-b6369429860a@gmail.com>
In-Reply-To: <96645ce4-02c6-5de8-13e0-b6369429860a@gmail.com>

--1nX1e9sQM4jmETr5dp6NvoRb0jA9M9nMk
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 11/04/2016 07:18 PM, Khem Raj wrote:
>> > +++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3=
=2E6.0.bb
>> > @@ -0,0 +1,7 @@
>> > +inherit setuptools3
>> > +require python-cassandra-driver.inc
>> > +RDEPENDS_${PN}_class-native =3D ""
>> > +
>> > +DEPENDS_${PN} +=3D "\
> Dont use PN here.
>=20

I suppose it's more logical to have this in the inc file. This counts
for Python 2 as well.

I don't see why I have that RDEPENDS_${PN}_class-native line there
either; python-cython.inc has that too, I don't really see why. Does
this trigger a gcc dependency or so?

I'll send a v3 with the DEPENDS in the .inc file.


--1nX1e9sQM4jmETr5dp6NvoRb0jA9M9nMk--

--3mOMWOmO1oAN8OOUnhqidNs0M8u4cqo7I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQE2BAEBCAAgBQJYHOE3GRxydWJlbi5kZS5zbWV0QGdseWNvcy5vcmcACgkQ+CZa
iBIT3BCsVwf9FGkcSMtIioBBykZuqBmM88mCv8TPKBdFBoSJrB7w5Jw18wlXwbQQ
lzBXSqlNdHsrZjj3gK3UNLmk04SyMu2TRuTS6X8w8yvp+SE4ejww85bF8J/Cc32q
nVPkH5iTj37auwfXMdq1B38bWsD7P7WWIk+g2COunwyLuj6BfbwsQXXZNDqBDVau
PR9jXf7nExgIADt5Xb2lqZP5d2lOjcrbbRag6B0OU9b4Ld31jILHy7pEVnw7wSyH
xNdy7yslXQLcxF6m+WQkN3esmybx1TyyqCb3iJ5PfLeHNzOrct+iuJiSonkuxpf/
TnpJg8SbN584W/m485mT46Rk/TZOsicrSQ==
=YlaU
-----END PGP SIGNATURE-----

--3mOMWOmO1oAN8OOUnhqidNs0M8u4cqo7I--
