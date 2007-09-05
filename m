Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <nils.faerber@kernelconcepts.de>) id 1IStPc-0000JI-Pn
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2007 13:51:14 +0200
Received: from [192.168.2.28] by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <nils.faerber@kernelconcepts.de>) id 1IStYS-0002XK-FO
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2007 14:00:20 +0200
Message-ID: <46DE979B.2070405@kernelconcepts.de>
Date: Wed, 05 Sep 2007 13:48:43 +0200
From: Nils Faerber <nils.faerber@kernelconcepts.de>
Organization: kernel concepts
User-Agent: Thunderbird 1.5.0.10 (X11/20070403)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20070904202957.GD1429@dodger.lab.datenfreihafen.org>
In-Reply-To: <20070904202957.GD1429@dodger.lab.datenfreihafen.org>
X-Enigmail-Version: 0.94.2.0
Subject: Re: [RFC] How to handle external kernel patches in oe the right way?
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
X-List-Received-Date: Wed, 05 Sep 2007 11:51:16 -0000
X-Groupsio-MsgNum: 2835
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig888DA5FCBC28BB71C4C23247"

--------------enig888DA5FCBC28BB71C4C23247
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Stefan Schmidt schrieb:
> Hello.
Hi!

> Due to my work on OpenEZX (http://www.openezx.org) I'm in touch with
> external kernel patches used in OE to build working kernels for
> different Motorola mobile phones.
>=20
> Talking with Koen about the best way to handle this we have some
> slightly different opinions on this. So we like to get some more
> opinions on this before pinning to a strategy.
>=20
> Koen like to pull the patches from a known-good rev into oe to have
> them all at one place for less fragile building and tweaking.
>=20
> I prefer OE to use our svn server with a fixed SRCREV which gets
> updated once a newer version is known good. I'm not a fan of
> duplicating the patches in OE if some small tweaking patches can also
> handle it.

To add my 0.02=A4 ;)
I also see both points, for good and for bad.
I have the same situation here currently, I am doing the integration of
a third party board (which will be committed to OE...). The board
manufacturer does it's own kernel port and maintains own patches. But
the manufacturer does not do the OE maintenance.
Including the patch in OE would mean that the patch is stale and once
the kernel maintainer creates a new patch (against the same kernel
version) they would have to send the patch to me so that I can get it
into OE.
So I decided for now to directly pull the patch from their external
source. If they do updates they would be automatically included in a
next build.

For me this calls for something like a stable and development tree, i.e.
the stable tree would include the patch itself and a development tree
would pull from CVS/SVN/externals.

> For bleeding edge building and testing we will create a recipe with
> DEFAULT =3D -1 anyway.
>=20
> I'm not totally against Koens approach, just see not much sense, but
> more problems in duplicating the patches in OE. If other people are
> still for it we can of course go that route.

I see a maintenance problem here.
If we have the patches in OE someone has to keep them up to date. Not
impossible, but additional work.

> Comments?

S.a. ;)

> regards
> Stefan Schmidt
Cheers
  nils faerber

--=20
kernel concepts GbR        Tel: +49-271-771091-12
Sieghuetter Hauptweg 48    Fax: +49-271-771091-19
D-57072 Siegen             Mob: +49-176-21024535
--


--------------enig888DA5FCBC28BB71C4C23247
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFG3pebJXeIURG1qHgRAs+gAJ9M7D2DvfO5DCFontx+653JPlGP0gCfdUzg
v2M2ugxlWt1edpQKOFGQV8s=
=0OwO
-----END PGP SIGNATURE-----

--------------enig888DA5FCBC28BB71C4C23247--
