Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QyV67-0001Ck-NT for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 22:39:51 +0200
Received: from f053039119.adsl.alicedsl.de ([78.53.39.119]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QyV1T-0006Zt-EX for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 20:35:03 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Aug 2011 22:34:58 +0200
In-Reply-To: <1314714550-29390-1-git-send-email-sherbrec@cit-ec.uni-bielefeld.de>
References: <1314714550-29390-1-git-send-email-sherbrec@cit-ec.uni-bielefeld.de>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314736499.3942.2.camel@mattotaupa>
Mime-Version: 1.0
Subject: Re: [PATCH] gcc: Remove package libstdc++-dev and libgcc-dev from gcc-cross
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
X-List-Received-Date: Tue, 30 Aug 2011 20:39:51 -0000
X-Groupsio-MsgNum: 33916
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-pijdgitZmRtfCIGLNj91"

--=-pijdgitZmRtfCIGLNj91
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Stefan,


thank you very much for the patch.

Am Dienstag, den 30.08.2011, 16:29 +0200 schrieb Stefan Herbrechtsmeier:
> Remove package libstdc++-dev and libgcc-dev from gcc-cross as they
> already provided by gcc.
>=20
> Commit 8c42351519ece9ed60659a103e624d2e154b3641 add dev packages
> (libstdc++-dev libgcc-dev) to gcc-cross (gcc-package-cross.inc)
> which are already part of gcc. The libgcc-dev package both include
> the libgcc_s.so file which triggers a 'file is already provided by
> package' error on incremental builds. The libstdc++-dev package have
> different content and is empty on some archs (armv5te, armv7e).
> The empty package triggers a 'Cannot satisfy the following
> dependencies for task-sdk-bare' error. If an empty libstdc++-dev
> package is generated it triggers a '..../usr/include/c++ not exist'
> error as this is part of the package from gcc but not gcc-cross.
>=20
> Signed-off-by: Stefan Herbrechtsmeier <sherbrec@cit-ec.uni-bielefeld.de>
> ---
>  recipes/gcc/gcc-4.3.3.inc         |    2 +-
>  recipes/gcc/gcc-4.5.inc           |    2 +-
>  recipes/gcc/gcc-package-cross.inc |    4 +---
>  3 files changed, 3 insertions(+), 5 deletions(-)

So does that patch revert commit 8c423515?


Thanks,

Paul

--=-pijdgitZmRtfCIGLNj91
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5dSXIACgkQPX1aK2wOHVgcoQCfSA6TK2SKHfOFntQHeZ5v8Dr+
OUIAniZRApB7ulsRQDZEbMjpFLSHYbWP
=UCw/
-----END PGP SIGNATURE-----

--=-pijdgitZmRtfCIGLNj91--
