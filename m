Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1KqnbP-0006yX-Fs
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Oct 2008 13:34:43 +0200
Received: (qmail invoked by alias); 17 Oct 2008 11:34:37 -0000
Received: from p579E1958.dip.t-dialin.net (EHLO [192.168.10.3]) [87.158.25.88]
	by mail.gmx.net (mp008) with SMTP; 17 Oct 2008 13:34:37 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+idANwUMKi9BRjd6hF9sKOEoBzw9zM2vy2NoADSO
	OhREYrvdxrNRgD
Message-ID: <48F8784C.9010907@gmx.net>
Date: Fri, 17 Oct 2008 13:34:36 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Thunderbird 2.0.0.17 (X11/20080925)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200810131730.14114.zecke@selfish.org>
In-Reply-To: <200810131730.14114.zecke@selfish.org>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.6
Subject: Re: [RFC] File local variables
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
X-List-Received-Date: Fri, 17 Oct 2008 11:34:43 -0000
X-Groupsio-MsgNum: 6260
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigF49A85262B8C4F871E1D7FC3"

--------------enigF49A85262B8C4F871E1D7FC3
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Holger Freyther schrieb:
> imagine the following situation, I have the following files:
> 	foo-native_1.2.3.bb
> 	foo_1.2.2.bb
> 	foo_1.2.3.bb
> 	foo.inc
>=20
> now I'm forced to keep PR,PE inside the .inc file but in most of our ca=
ses we=20
> have the PR inside the final recipe file. This means when doing a chang=
e to=20
> an inc I need to open all other users to bump the right thing.
Clear to this point.

> Have you experienced this as well?
Sure. :)

> I have wondered if something like:
> 	PE_${FN} =3D "0"
> 	PR_${FN} =3D "0"
What is ${FN}?

> in each separate file and then some Bitbake magic to build the sum from=
 every=20
> included file?
>=20
> comments? Am I just too lazy?
Can you explain a bit how this is being supposed to being used.

Regards
Robert


--------------enigF49A85262B8C4F871E1D7FC3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFI+HhMG9cfwmwwEtoRAuClAJkBnXi6Pj24/xrHW9LafLngWohK5gCffn5d
Szbrk+EVAjZ4ThI0RaH9XiM=
=yjQP
-----END PGP SIGNATURE-----

--------------enigF49A85262B8C4F871E1D7FC3--
