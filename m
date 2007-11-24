Received: from [81.169.178.128] (helo=h6563.serverkompetenz.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <oe@hentges.net>) id 1IvmD7-0005mV-Bu
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Nov 2007 05:01:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 18E8C3081E6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Nov 2007 04:59:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at hentges.net
Received: from h6563.serverkompetenz.net ([127.0.0.1])
	by localhost (h6563.serverkompetenz.net [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id ObcBbiwhj7Lf
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Nov 2007 04:59:08 +0100 (CET)
Received: from [192.168.5.2] (xdsl-87-78-222-123.netcologne.de [87.78.222.123])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by h6563.serverkompetenz.net (Postfix) with ESMTP id C8F463081E3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Nov 2007 04:59:08 +0100 (CET)
From: Matthias Hentges <oe@hentges.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4747921A.8000300@whitby.id.au>
References: <E1Iv6U0-0003D9-3S@linuxtogo.org>
	<4746C4A5.6040501@student.utwente.nl>
	<05db01c82dfe$1401e230$6e01a8c0@twilight>
	<c384c5ea0711231351u1b91c5b6o437ecc5d512991e8@mail.gmail.com>
	<4747921A.8000300@whitby.id.au>
Date: Sat, 24 Nov 2007 04:59:06 +0100
Message-Id: <1195876746.5374.7.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.3 
Subject: Re: [oe-commits] org.oe.dev SlugOS: ixp4xx-kernel -	added	2.6.23.8 recipe and supporting files. (Note that
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 24 Nov 2007 04:01:45 -0000
X-Groupsio-MsgNum: 3435
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-WD7hh74PAB26iyuK0i3t"

--=-WD7hh74PAB26iyuK0i3t
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 24.11.2007, 13:23 +1030 schrieb Rod Whitby:

Before I go into this: Koen actually made a good point about applying
patches instead of downloading a 40Mb tarball every time.=20

VANILLA_VERSION =3D "2.6.23"
KERNEL_VERSION =3D "2.6.23.8"

SRC_URI =3D "
${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${VANILLA_VERSION}.tar.bz2
\
${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${KERNEL_VERSION}.bz2;patch=
=3D1
\
"

The above is IMO indeed a lot more elegant than=20

SRC_URI =3D "
${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.23.8.tar.bz2

> Of course Koen didn't write it, so instead of reading the comments to
> understand what it does, he says the following:
>=20
> Koen Kooi wrote:
> > I would have fixed it myself, but the huge block of
> > python magic in ixp4xx-kernel.inc scared me away.
>=20
> Which is pretty much par for the course for Koen ... anything he didn't
> write is by definition substandard and shouldn't be used.  He'll
> probably even reply to this to explain why all this ixp4xx-kernel.inc
> functionality has been implemented the wrong way and doesn't follow the
> unwritten "spirit" of OE ...

Actually Koen learned from his past. He wrote down this "spirit" so he
has a page he can point people at when they complain about various
brain-dead "policies". That doesn't make it one bit bitter, but it is no
longer "unwritten" ;)

--=20
Matthias 'CoreDump' Hentges=20
Cologne / Germany

Webmaster of Hentges.net & Embedded Linux Developer
GPG ->  gpg --keyserver gpg-keyserver.de --recv-keys 0xAF3030D9

My OS: Debian SID: Geek by Nature, Linux by Choice



--=-WD7hh74PAB26iyuK0i3t
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHR6GKPXyoPq8wMNkRAmVVAKCu4IH7uJ2wr2QdGkhrnCzul/HkhgCgvVlD
MzIfawTTbc8C5ExARuK/uYw=
=ZWYb
-----END PGP SIGNATURE-----

--=-WD7hh74PAB26iyuK0i3t--
