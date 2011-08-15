Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qt5FE-00073X-Jk for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 00:02:52 +0200
Received: from f053038207.adsl.alicedsl.de ([78.53.38.207]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qt5Ap-0004y0-KB for openembedded-devel@lists.openembedded.org;
	Mon, 15 Aug 2011 21:58:19 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1313436905.4058.47.camel@mattotaupa>
References: <1313436905.4058.47.camel@mattotaupa>
Date: Mon, 15 Aug 2011 23:58:15 +0200
Message-ID: <1313445495.4058.54.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: Coordination for updating the XBMC recipe
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
X-List-Received-Date: Mon, 15 Aug 2011 22:02:52 -0000
X-Groupsio-MsgNum: 33601
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-2AVu7PCLFEgWMDR76lfk"

--=-2AVu7PCLFEgWMDR76lfk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks and especially Koen,


Am Montag, den 15.08.2011, 21:35 +0200 schrieb Paul Menzel:

> Scott Davilla from the XBMC project asked me for build instructions for
> XBMC for the PandaBoard.
>=20
> Currently the XBMC recipe does not build for the PandaBoard
>=20
> 	COMPATIBLE_MACHINE =3D "omap3|ti816x"
>=20
> and 'virtual/egl' is not available for `MACHINE =3D "omap4430-panda"` in
> oe.dev. Additionally the recipe is quite outdated.
>=20
> This is a good occasion to update and clean up the current XBMC recipes.
>=20
> I have some patches locally and I build test the latest commits for
> `MACHINE =3D "beagleboard"` unfortunately still for oe.dev. On LinuxTag
> you told me that you also had some patches but they conflicted with my
> pushed commits.
>=20
> So what is the best way to go forward? Did you already do some work on
> this so that no wheel is reinvented? Please publish your patches
> somewhere. That would be awesome.
>=20
> Without knowing your answer I propose the following.
>=20
> 1. I try to clean up my patches and push them right to oe.dev? (I could
> also publish a tree on Gitorious where I am already registered.)
>=20
> Unfortunately I am only able to build test XBMC as I do not have a setup
> BeagleBoard or PandaBoard currently and no time to set them up.
>=20
> 2. Not having used meta-oe/oe-core it would be great if you could port
> those to meta-oe.
>=20
> Then building XBMC should be a piece of cake for interested persons.

some more questions.

3. oe.dev: When I rename `xbmc_svn.bb`, which uses Git already, to
`xbmc_git.bb` what is the policy regarding `PR`? Just set it back to r0?

Koen, your comments are much appreciated!


Thanks,

Paul

--=-2AVu7PCLFEgWMDR76lfk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5JlncACgkQPX1aK2wOHVg3+gCeK6pz99Gbxxq4zw/uWZaU5GiF
mbMAoIarx4tmqKOvARmnpfGmdJx0Oiu8
=Obu6
-----END PGP SIGNATURE-----

--=-2AVu7PCLFEgWMDR76lfk--
