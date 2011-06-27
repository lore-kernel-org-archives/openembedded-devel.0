Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QbI3Q-0002Y6-05 for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jun 2011 22:05:08 +0200
Received: from f053041087.adsl.alicedsl.de ([78.53.41.87]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QbI0E-0000mG-Af for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jun 2011 20:01:50 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1309203161-25143-1-git-send-email-raj.khem@gmail.com>
References: <1309203161-25143-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 27 Jun 2011 22:01:28 +0200
Message-ID: <1309204888.21379.143.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe][PATCH] gcc-common-4.6.inc: Set ARM_INSTRUCTION_SET to arm
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
X-List-Received-Date: Mon, 27 Jun 2011 20:05:08 -0000
X-Groupsio-MsgNum: 32850
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-ZNKjNbzofJMnpAsVBkvk"

--=-ZNKjNbzofJMnpAsVBkvk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 27.06.2011, 12:32 -0700 schrieb Khem Raj:
> Otherwise it will compile libgcc in thumb mode when thumb
> mode is selected and libgcc in thumb mode does not work
> well.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc b/meta-oe/re=
cipes-devtools/gcc/gcc-common-4.6.inc
> index 059f441..e5a1fba 100644
> --- a/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
> +++ b/meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc
> @@ -1,3 +1,4 @@
>  # this will prepend this layer to FILESPATH
>  FILESEXTRAPATHS :=3D "${THISDIR}/gcc-4.6"
> -PRINC =3D "0"
> +PRINC =3D "1"

Is that by intention or why is `INC_PR` not used?

> +ARM_INSTRUCTION_SET =3D "arm"


Thanks,

Paul


--=-ZNKjNbzofJMnpAsVBkvk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4I4ZgACgkQPX1aK2wOHVixgwCcDh0ab+B+ZeaVJ1DFalXoW7Fx
JfwAnjEIQISer4Ghz2I8duwM5E/nzxsP
=/4T+
-----END PGP SIGNATURE-----

--=-ZNKjNbzofJMnpAsVBkvk--
