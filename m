Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2788B60232
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 01:26:05 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so37387009pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Oct 2015 18:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=zePEmyaTvIes8v3QvsAV4x+XLNsI1kFzBb5V5XYPnnk=;
	b=Kd9ZjWG0l/pJVvZoavBxjlWl09d7Vx5b2xWGUCvEUHTFbXQ7+gTJZXtBoc4NS4+2B7
	zwtUMWC/L/QrjqZOfUvU1yIiBL4LHLOBetsByoIDybenSr9Ju9FEpw6ZAVxo7tXfWrfW
	yZIAirPFrWyWbb8uza3l6uMDqioICao1J3TFmmXblqJjMesBZF4YV2eASt0okXAWJQDV
	6T/cHUrNsksoNwuhQPWmYedsaRZJVkp2t82XiR7tLjr8jh7bazsmI5D5VBxExSi4Ei0z
	eU2BvYK26Jz6bTWjUDhRgDI2B4dILTfSD/Yp3s2pLQfJLeBtzI1fbZSaMxS1n/VgwEQU
	KXkA==
X-Received: by 10.68.226.196 with SMTP id ru4mr4656050pbc.107.1444267565474;
	Wed, 07 Oct 2015 18:26:05 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:787e:b3a8:cb23:6c63?
	([2601:646:8601:4580:787e:b3a8:cb23:6c63])
	by smtp.gmail.com with ESMTPSA id
	ql7sm41820592pbc.45.2015.10.07.18.26.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 Oct 2015 18:26:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3095\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAC+jU25s54MZ_bqJk+ifq_OVB4jUr=RPPR=AtUExtq=kmobfPA@mail.gmail.com>
Date: Wed, 7 Oct 2015 18:26:01 -0700
Message-Id: <C0258E2F-9645-4579-B357-E800F3D0B722@gmail.com>
References: <CAC+jU25s54MZ_bqJk+ifq_OVB4jUr=RPPR=AtUExtq=kmobfPA@mail.gmail.com>
To: Martin Jansa <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3095)
Subject: Re: Multiple bbappends and their order
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Oct 2015 01:26:09 -0000
X-Groupsio-MsgNum: 57704
Content-Type: multipart/signed;
	boundary="Apple-Mail=_64A95AA8-B290-4195-84F8-C8ADFCDCAE39";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_64A95AA8-B290-4195-84F8-C8ADFCDCAE39
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 7, 2015, at 8:36 AM, Angelika Tobisch <tobisch@dresearch-fe.de> =
wrote:
>=20
> Hello,
>=20
> suppose I have layers A, B, and C. Layer A provides a recipe. I want
> to append this recipe in both layers B and C.
>=20
> In what order are the appends going to be applied? Is it
> deterministic? Does it depend on layer priority? Something else
> entirely?

they are appended in order of BBFILE_PRIORITY defined in each layer=E2=80=99=
s layer.conf file e.g. a bbappend in layer with BBFILE_PRIORITY =3D 5
will be appended before bbappend from another layer with BBFILE_PRIORIY =
=3D 6
so in theory you can negate the effects of changes in lower priority =
layer in the bbappend from higher priority layer.
keep in mind that this only works for recipe metadata, not for =
configuration metadata, for configuration metadata the order layer path =
in BBFILES
will matter much like PATH search in shell.

>=20
> Thank you in advance
> Angelika
>=20
> --
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-231 mailto:tobisch@dresearch-fe.de
> Fax: +49 30 515932-299
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_64A95AA8-B290-4195-84F8-C8ADFCDCAE39
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYVxiwACgkQuwUzVZGdMxSPMgCfYSbgFpcYx0ioaUDMQ0GQDdQD
jDIAnjC5LQEYFx41ameTuOY22Stpkvkz
=soDX
-----END PGP SIGNATURE-----

--Apple-Mail=_64A95AA8-B290-4195-84F8-C8ADFCDCAE39--
