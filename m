Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Psk7G-0000ox-3S for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 23:56:58 +0100
Received: from f053042033.adsl.alicedsl.de ([78.53.42.33]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Psk5z-00058M-KE for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 22:55:39 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D668554.4050307@mentor.com>
References: <1298490534.26736.52.camel@rex>
	<AANLkTim-WprzRfvaYnFMjoR4=19hj96qp3NioMjY0Axi@mail.gmail.com>
	<4D668554.4050307@mentor.com>
Date: Thu, 24 Feb 2011 23:55:38 +0100
Message-ID: <1298588138.26090.38.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: OT: pull requests, merges and bisection (was: OE TSC Meeting 2011/02/21 Minutes)
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
X-List-Received-Date: Thu, 24 Feb 2011 22:56:58 -0000
X-Groupsio-MsgNum: 29664
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-CpNvmY+NxLRKAlQ8oEcU"

--=-CpNvmY+NxLRKAlQ8oEcU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


it is great that the minutes of the meetings get published. Thank you.


Am Donnerstag, den 24.02.2011, 09:20 -0700 schrieb Tom Rini:

[=E2=80=A6]

> Not clear in the summary but from the logs is that we want to, as part=
=20
> of making this be transparent, publish guidelines for how this will=20
> work, based on what poky is doing now.  The high level plan is to follow=
=20
> the contrib tree model that poky has which means sending pull requests=
=20
> (which in turn also post the patches to the ML for review).
>=20
> For changes that don't have a tree to pull from, someone with write=20
> access would need to pick them up.

XBMC is using also an approach with pull requests. The Linux kernel is
doing that also. Is there documentation on how pull requests, merges and
bisecting works together?

My problem is that pull requests are based on a certain commit in
origin/master. After the request is sent most of the time several
commits are pushed to origin/master in the mean time, so a merge is
necessary =E2=80=9Cpolluting=E2=80=9D the commit history.

With my current knowledge I find it very difficult to track down bad
commits especially if commits break the builds in between. Does `git
bisect` take care of that itself? How do the Linux developers deal with
that problem, especially merge conflicts?

Currently I like rebasing (fast fowarding) very much, but that puts
strain on developers too because they always need to update their
patches/commit to latest master.


Thanks,

Paul

--=-CpNvmY+NxLRKAlQ8oEcU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1m4eoACgkQPX1aK2wOHVgvIACeN0J/rqSqFKq3+2tFM/9CMPao
xuUAnio+Tjbk4pI3WvAp+on3wkJjW4zG
=70Og
-----END PGP SIGNATURE-----

--=-CpNvmY+NxLRKAlQ8oEcU--
