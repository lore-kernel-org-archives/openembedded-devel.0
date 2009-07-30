Received: from [85.17.141.90] (helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1MWVJf-0003Gg-UP
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jul 2009 15:05:03 +0200
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id CF5551402C; Thu, 30 Jul 2009 14:50:01 +0200 (CEST)
Date: Thu, 30 Jul 2009 14:50:01 +0200
From: Marc Olzheim <zlo@zlo.nu>
To: Stanislav Brabec <utx@penguin.cz>
Message-ID: <20090730125001.GA30052@zlo.nu>
References: <BLU137-W15C50162BE2D466B2B3182D44C0@phx.gbl>
	<1244144325.6678.0.camel@port4>
	<BLU137-W9D00E1434DB12273A400AD4480@phx.gbl>
	<1244206438.6643.46.camel@port4>
	<BLU137-W29570FDEF1300363D893E4D4450@phx.gbl>
	<1244635240.28486.7.camel@hammer.suse.cz>
	<20090730105711.GA29595@zlo.nu>
	<1248952464.21030.110.camel@hammer.suse.cz>
	<20090730114922.GA29793@zlo.nu>
	<1248956053.21030.133.camel@hammer.suse.cz>
MIME-Version: 1.0
In-Reply-To: <1248956053.21030.133.camel@hammer.suse.cz>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Commit 2e0fa4918d643ce6ec0299cd31cfe1c346e4bce3 breaks	libtool's do_configure [PATCH]
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
X-List-Received-Date: Thu, 30 Jul 2009 13:05:04 -0000
X-Groupsio-MsgNum: 12146
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline

--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2009 at 02:14:13PM +0200, Stanislav Brabec wrote:
> Just curious, is your /bin/sh link to bash? I am not able to reproduce:
>=20
> ~> sh --version
> malloc: using debugging hooks
> GNU bash, version 3.2.39(1)-release (x86_64-suse-linux-gnu)
> Copyright (C) 2007 Free Software Foundation, Inc.
> ~> export a=3D${a=3Db c}
> ~> echo $a
> b c

Ah, *doh*...

My /bin/sh is a dash, I should have known, my apologies.  I have a patch
in place that allows dash as /bin/sh as well, as that works just as well
for me (and /bin/bash for /bin/sh breaks other scripts for me), up until
now.

Building the micro-image, the libtool build was suddenly failing though.

Still I should have known that this would be the issue.

Marc

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpxlvkACgkQezjnobFOgrGnkQCgmioSOLVrW3tjjF7HLhQD5xSZ
idAAnRa+lfupXjru9ZxF5rtvjyjPxWSs
=Jh0r
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
