Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QjpZY-000450-BO for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jul 2011 11:29:36 +0200
Received: from f053034050.adsl.alicedsl.de ([78.53.34.50]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QjpWQ-0005Pr-CT; Thu, 21 Jul 2011 09:26:22 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1311233783-17093-1-git-send-email-mstirling@ad-holdings.co.uk>
References: <1311233783-17093-1-git-send-email-mstirling@ad-holdings.co.uk>
Date: Thu, 21 Jul 2011 11:25:29 +0200
Message-ID: <1311240329.3538.11.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: Mike Stirling <mstirling@chipwrights.com>
Subject: Re: [PATCH] vblade: Pass LDFLAGS to final link. Fixes GNU_HASH QA error.
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
X-List-Received-Date: Thu, 21 Jul 2011 09:29:36 -0000
X-Groupsio-MsgNum: 33265
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-0r3lwe7bK5LHmHqa3mWQ"

--=-0r3lwe7bK5LHmHqa3mWQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Mike,


thank you for your patch.

Am Donnerstag, den 21.07.2011, 08:36 +0100 schrieb Mike Stirling:
> From: Mike Stirling <mstirling@chipwrights.com>
>
> Signed-off-by: Mike Stirling <mstirling@chipwrights.com>
> ---
>  recipes/vblade/files/ldflags.patch |   12 ++++++++++++
>  recipes/vblade/vblade_19.bb        |    5 +++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
>  create mode 100644 recipes/vblade/files/ldflags.patch
>=20
> diff --git a/recipes/vblade/files/ldflags.patch b/recipes/vblade/files/ld=
flags.patch
> new file mode 100644
> index 0000000..3350513
> --- /dev/null
> +++ b/recipes/vblade/files/ldflags.patch

Could you please add a patch header [1]?

It would be great if you could send the patch (and the other one)
upstream [2] too or check if it has been fixed in vblade 20.

> @@ -0,0 +1,12 @@
> +diff -urN vblade-19.orig/makefile vblade-19/makefile
> +--- vblade-19.orig/makefile	2011-07-20 15:45:43.851538824 +0100
> ++++ vblade-19/makefile	2011-07-20 15:46:26.863358466 +0100
> +@@ -11,7 +11,7 @@
> + O=3Daoe.o bpf.o ${PLATFORM}.o ata.o
> +=20
> + vblade: $O
> +-	${CC} -o vblade $O
> ++	${CC} ${LDFLAGS} -o vblade $O
> +=20
> + aoe.o : aoe.c config.h dat.h fns.h makefile
> + 	${CC} ${CFLAGS} -c $<
> diff --git a/recipes/vblade/vblade_19.bb b/recipes/vblade/vblade_19.bb
> index f100a46..7b3504a 100644
> --- a/recipes/vblade/vblade_19.bb
> +++ b/recipes/vblade/vblade_19.bb
> @@ -1,10 +1,11 @@
>  DESCRIPTION =3D "Virtual EtherDrive blade AoE target"
>  SECTION =3D "console/network"
> -PR =3D "r1"
> +PR =3D "r2"
>  LICENSE =3D "GPL"
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/aoetools/${PN}-${PV}.tgz \
> -	   file://cross.patch"
> +	   file://cross.patch \
> +	   file://ldflags.patch"
> =20
>  inherit autotools

I build tested this patch on `angstrom-2010.x` and `minimal{,-uclibc}`
for `MACHINE =3D "beagleboard"`.

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul


[1] http://openembedded.org/index.php/Commit_Patch_Message_Guidelines
[2] http://aoetools.sourceforge.net/

--=-0r3lwe7bK5LHmHqa3mWQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEUEABECAAYFAk4n8IgACgkQPX1aK2wOHVhauQCY9rXRxzNQvSy02sl59E4JrB7H
1ACfXoqNKyehDGrdr8ntaN6FoX2YlF4=
=mkD0
-----END PGP SIGNATURE-----

--=-0r3lwe7bK5LHmHqa3mWQ--
