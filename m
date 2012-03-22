Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SAeSx-000522-BB
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 10:37:55 +0100
Received: by wera1 with SMTP id a1so1641675wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 02:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oB/9cOJX3cJZP8hGD62TZF0zNSipGpHeR70IyzYq5rA=;
	b=GtmzI5r4Zp+EcMtmxrL4VJRMSoWnhKl9MVKUmAfBAKcAtSZfAdobsAMpf/igjGWPyj
	EZmtora+XVIFdI4ZvtxL8EGvasBoIWWSF36vsNfD/tROCoYKgSdt4mRSLyr5CGpXhW+c
	M36cz7fYcE++693qw7azZzV20gXrPklC5ZzfChVX2w5hoWFJUk/gPVi7ETQelCkewdib
	lQcDec1H5t4RMRz8tP9mM9tTCzsN/D2tAzqgD0rVP2isERh68LTtn0mdX8l7hUWSJxq/
	snEmVpIlkGtvcpmhG/A0Tp2xlMk/n6SmnsSxLEhzoMR7AzbTaKsUjyUWuQ3J5sUbUr6C
	+ScA==
Received: by 10.180.19.37 with SMTP id b5mr3436256wie.9.1332408540830;
	Thu, 22 Mar 2012 02:29:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm3821465wiy.7.2012.03.22.02.28.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 02:29:00 -0700 (PDT)
Date: Thu, 22 Mar 2012 10:28:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120322092859.GE4010@jama.jama.net>
References: <1332339451-26902-1-git-send-email-s.stirtzel@googlemail.com>
	<jkdg34$om0$1@dough.gmane.org>
	<CAGiJk9cG0mySg454zxYS8VJLc9etr2jAAxxtBSMbN9boq0EnRg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGiJk9cG0mySg454zxYS8VJLc9etr2jAAxxtBSMbN9boq0EnRg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] [meta-oe] giflib: Move to OE-Core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2012 09:37:55 -0000
X-Groupsio-MsgNum: 37904
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="19uQFt6ulqmgNgg1"
Content-Disposition: inline

--19uQFt6ulqmgNgg1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2012 at 10:24:38AM +0100, Samuel Stirtzel wrote:
> 2012/3/21 Koen Kooi <koen@dominion.thruhere.net>:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > Op 21-03-12 15:17, Samuel Stirtzel schreef:
> >> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> >
> > OE-core needs to slim down, not get fatter. You are basically saying "l=
ayer
> > suck, let's move back to oe-classic"
>=20
> That is definitively not what I want to say.
> In my point of view there is no value in maintaining an existing
> recipe redundantly in meta-oe and kde-core or anywhere else.
>=20
>=20
> And IMHO we need to get over this, how is it supposed to work?
> Should I make a meta-devtools layer?
> Or should I copy giflib from meta-oe and all recipes from oe-core that
> meta-kde depends on over to my own layer?

why not add meta-oe dependency to meta-kde/README?

> > -----BEGIN PGP SIGNATURE-----
> > Version: GnuPG v1.4.11 (Darwin)
> > Comment: GPGTools - http://gpgtools.org
> >
> > iQIcBAEBAgAGBQJPakOkAAoJEHZqAkdh1vT6zyQP/R7/viIEf4trbFzR3ZaD2cRd
> > D4U4q7eDF5DM/fC85yoLBj7byBfryB/I2JWDir9YOAcGgaBysvpL5vApTWFt1hJZ
> > MOc3NFNdIsALL/jnMzjmY4OB5bIAYHj4nC0XGiRj6CuEvkyz6IueAAR3k2O6NU64
> > L32Ou0iGD0GKg6gl8LSBfixVKYAjIFfehP5rWv1L0P7cJiYmVy4Gj7CalmmRpPZz
> > zMhmwoUze4dIx9z6X5WSIXs44aBOFs3MZjtYRfBQsUDkjBheLWI5tMIekhFX0Ega
> > wKjU9GUwerPzI0oI2DG+9n7nS1wlBJesrHAQKh3pwCWRC19NQuqFjArdaF80DwPk
> > ZHZNnTzB5Dd/NbPcSkRG5V0DAFYB54Xty6A2w7ONbPoQs5h3vjS4g8V560Kvgqaa
> > O/efrZi2VgYA/1RAaz7COjNkMF/OBeH9aE9oRNPweOBYcwMFzhbrTEXPUL/pZ7gg
> > 5oI0JdJj5lmqi6q9+jk8hDVJvYIkM45l9xqy6nDnIa0tUnDTzCRxj+jr7LEyPp/R
> > p+/6GO5aPG8S4JPbmgFbmJN7hrLzNyg6JS962VVYiOhw0cIVwkj/hX+9oYPE4pRe
> > AHXoBtWrfflkL4RIadYI64uMJHNpHzfuzd6+0JljL8sA969nh36GXsd4OwMdUx6b
> > AVqAIeCDYo30C3i9BXRL
> > =3D1Xye
> > -----END PGP SIGNATURE-----
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20
>=20
> --=20
> Regards
> Samuel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--19uQFt6ulqmgNgg1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9q8NsACgkQN1Ujt2V2gBy0qACdGQU6aH22k3SDgmlbMn+huVIB
cbIAoJ9VqJAbC/VvaSBk0wk0UqkHZxm9
=AcCj
-----END PGP SIGNATURE-----

--19uQFt6ulqmgNgg1--
