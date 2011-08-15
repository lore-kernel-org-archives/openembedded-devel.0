Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qt30m-0003ID-6M for openembedded-devel@lists.openembedded.org;
	Mon, 15 Aug 2011 21:39:48 +0200
Received: from f053038207.adsl.alicedsl.de ([78.53.38.207]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Qt2wM-0004db-SN; Mon, 15 Aug 2011 19:35:15 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2011 21:35:05 +0200
Message-ID: <1313436905.4058.47.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Coordination for updating the XBMC recipe
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
X-List-Received-Date: Mon, 15 Aug 2011 19:39:48 -0000
X-Groupsio-MsgNum: 33600
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-N9By4Acp6ZTKp959wppW"

--=-N9By4Acp6ZTKp959wppW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks and especially Koen,


Scott Davilla from the XBMC project asked me for build instructions for
XBMC for the PandaBoard.

Currently the XBMC recipe does not build for the PandaBoard

	COMPATIBLE_MACHINE =3D "omap3|ti816x"

and 'virtual/egl' is not available for `MACHINE =3D "omap4430-panda"` in
oe.dev. Additionally the recipe is quite outdated.

This is a good occasion to update and clean up the current XBMC recipes.

I have some patches locally and I build test the latest commits for
`MACHINE =3D "beagleboard"` unfortunately still for oe.dev. On LinuxTag
you told me that you also had some patches but they conflicted with my
pushed commits.

So what is the best way to go forward? Did you already do some work on
this so that no wheel is reinvented? Please publish your patches
somewhere. That would be awesome.

Without knowing your answer I propose the following.

1. I try to clean up my patches and push them right to oe.dev? (I could
also publish a tree on Gitorious where I am already registered.)

Unfortunately I am only able to build test XBMC as I do not have a setup
BeagleBoard or PandaBoard currently and no time to set them up.

2. Not having used meta-oe/oe-core it would be great if you could port
those to meta-oe.

Then building XBMC should be a piece of cake for interested persons.


Thanks,

Paul

--=-N9By4Acp6ZTKp959wppW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5JdOkACgkQPX1aK2wOHVg1oACfUSbrmhTAPs8ErqBnsKobybUu
nFMAoIQMIfeCg06ErI8+VWydvixVPxi4
=pq8G
-----END PGP SIGNATURE-----

--=-N9By4Acp6ZTKp959wppW--
