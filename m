Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYnRv-0005i2-Kq for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 22:23:22 +0100
Received: from e178248110.adsl.alicedsl.de ([85.178.248.110]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYnPj-0003IN-3n for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 21:21:03 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2010 22:21:01 +0100
Message-ID: <1264281661.3738.150.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: How to best handle different build configurations (local.conf)?
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
X-List-Received-Date: Sat, 23 Jan 2010 21:23:23 -0000
X-Groupsio-MsgNum: 16121
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-+JGGLTdygYqYYXp1Bz++"

--=-+JGGLTdygYqYYXp1Bz++
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE hackers,


I imagine you juggle with different configurations for BitBake day in,
day out to specify different compiler versions or to build different
distributions. Could you please tell me what proofed to be the best
approach?

My requirements are that rebuilding everything should be avoided and
space should not be wasted.

I am using the setup described for =C3=85ngstr=C3=B6m [1] (local.conf [2]).

If I understood that correctly `local.conf` is the place where all this
happens.

Reading `bitbake -h` I did not find an option to specify a path to
`local.conf`.

In the `source-me.txt` [3] from [1] `PKGDIR` gets set to
`{OETREE}/build/` which is entered later on, but I could neither find a
reference for it in the BitBake user manual nor in the OE repository. So
it must be specific to this script.

To save the already build files for other platforms one should change
`TMPDIR` to a separate directory for each config.

        # Set TMPDIR instead of defaulting it to $pwd/tmp
        TMPDIR =3D "${OETREE}/${DISTRO}-dev"

1. So is the solution to have a directory with an adapted
`conf/local.conf` below which one enters before building a different
configuration?
2. Is there advantage to but this in a separate Git repository and
switch the branch to build a different configuration?
3. Or do you just set the environment variables yourself?

That is not so much work, but if you do it regularly pretty bothersome.


Thanks,

Paul


[1] http://www.angstrom-distribution.org/building-angstrom
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/contrib/angstro=
m/local.conf
[3] http://www.angstrom-distribution.org/files/source-me.txt
[4] http://bitbake.berlios.de/manual/

--=-+JGGLTdygYqYYXp1Bz++
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktbaD0ACgkQPX1aK2wOHViGcACffRyvCEH/oEIuY/4yyRh0Rg+m
fsQAn1+s3docsZZvz5k8eQbv4LpWSKmr
=xvSY
-----END PGP SIGNATURE-----

--=-+JGGLTdygYqYYXp1Bz++--
