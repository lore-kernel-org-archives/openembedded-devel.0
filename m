Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id D4B41731C1
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jan 2016 18:40:26 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id f206so150816845wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2016 10:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=+gWkb9jPpTQ7RkkOiMR6LmyF0KHjPRymeZe+YteCkko=;
	b=qzXkl17SRV2IGTItBbigMJwWc58PWbpCMo9Immge2QQyb6Zwc3BXx95CjoAK50StDE
	/LZ7BFGEiCcwOHNj+ltdoT/uQaXDKOFI7azrob2SWy21oAOY1bfOLc15wBS9VBc8iZNs
	IqgeK3ard8nAjE+aB39EejnufpWsY1BIkZYcdJjcHJXS1mqcHtYcGFNnjh8k/qTrcMgA
	xzMi5nhpRorqW/P3th8Oyu+5taOX0G5+lhcTwCbGdeF96V/Twd0GCXHxK1qvt3skBftq
	FMjfKJnhSf50rlS6cQDYnTiGik33FX9sJaN3LGdC+f49XtZTLsEOLAqoXU2ZTAhfLrJB
	fYzA==
X-Received: by 10.28.189.11 with SMTP id n11mr64610472wmf.3.1451932827010;
	Mon, 04 Jan 2016 10:40:27 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	a126sm28893910wmh.0.2016.01.04.10.40.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jan 2016 10:40:26 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <5683B82F.7060003@topic.nl>
Date: Mon, 4 Jan 2016 19:40:24 +0100
Message-Id: <E6192AC1-BA02-47DA-8E8A-9688A788AF74@gmail.com>
References: <5683B31B.4090103@topic.nl> <5683B82F.7060003@topic.nl>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: Why does samba think it (R)DEPENDS on perl?
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
X-List-Received-Date: Mon, 04 Jan 2016 18:40:27 -0000
X-Groupsio-MsgNum: 59326
Content-Type: multipart/signed;
	boundary="Apple-Mail=_541120CD-A802-49F6-B350-36E6BE9D7F33";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_541120CD-A802-49F6-B350-36E6BE9D7F33
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> Am 30.12.2015 um 11:55 schrieb Mike Looijmans =
<mike.looijmans@topic.nl>:
>=20
> Found that the cause is "inherit cpan-base", this hardcodes "perl" =
into the package.
>=20
> I think this requires a split-up of cpan-base.bbclass into two parts, =
so that one get obtain the perl version without adding these =
dependencies.

It's more reasonable to "move" the RDEPENDS from cpan-base.bbclass to =
cpan.bbclass and cpan_build.bbclass (WITH commend in source).
cpan-base.bbclass might be an unfortunate place for adding RDEPENDS, =
since it's just a helper (abstract base class ^^)

> On 30-12-15 11:34, Mike Looijmans wrote:
>> When building the current version of samba, it builds perl and drags =
it
>> into the image through an RDEPENDS.
>>=20
>> I've been researching this for a while, but failed to figure out what
>> causes this runtime relation. Is there a way to find out where this =
is
>> being "detected"?
>>=20
>> The workaround I implemented is simply adding this line to the samba
>> recipe, which at least gets rid of the overhead in the image:
>>=20
>> RDEPENDS_${PN}_remove =3D "perl"
>>=20
>> (Samba 4 is bloated enough by itself, it doesn't need other packages =
to
>> inflate its runtime even more)
>>=20
>=20

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_541120CD-A802-49F6-B350-36E6BE9D7F33
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWiryZAAoJEESZlq7c5QqdeoAP/ioB+e8BJ9aC0nxD+i6TATvk
3/z0bNxZAJvQEqRA5KR7Lih1dJ8pRNIuUzcDfSz6PYzokat/1qcaexLQCXWL0e41
06DtJh//KDpUW0EYOd224Vnuf8fjjWmsdhUFXwDbgPRF3QwCwjY4GC8JfuRsJOyj
bwzvgJ2a8P7cYA+RGG8AG+5Gz6puNjeTBSaqO2yhL2MY7g8WtwBgpGp/12PFOoer
XjBYYGGqefbCbntvQzaLNpJX7pRROJjH0grOAJU05pt6b6HuiQZSyUOS7mF/JX//
QzX29rgQSGf/EFpLCjnmEY6S52iq8j9FuciNCqYdO8JaEuWN0tMYt0VOqXh/Kieb
u+Ngy0HWSFvMeeOoPb7YhXo9/Fy/YsKXG/aeHGPwtG59EoZ5IuueWgqy5plWecEa
Pqa0vgLu3okmzaxyx4taEzyeK8fqBl8JqJgeUro4WV1GXsns5+MThQNoSwaUL8Al
GT2rzj9cvOcpMOxWpSF712nrH0KGEBIXqzvmfMk5Px6diNoVrTv1mjb7eIsvKLcq
VWN6phrQdTgbjx1aLtNvU1VjKfWq8m38RMR3PfaK3YKDTaLpIPU+ewVZSWObreCb
DpvI2Q49NsZgkJ3zl6XPTSdxedqlXLyb5cYb6WY8FQypHgALXKbN3loJTLIQgVFN
yY7rMZAx8kiP37u79gFe
=8+Ks
-----END PGP SIGNATURE-----

--Apple-Mail=_541120CD-A802-49F6-B350-36E6BE9D7F33--
