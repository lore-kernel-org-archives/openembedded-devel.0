Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1Epm-0007AX-UK for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 10:49:51 +0200
Received: from f053042246.adsl.alicedsl.de ([78.53.42.246]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P1Epb-0001E7-J8 for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 08:49:35 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1285792594-10032-7-git-send-email-obi@opendreambox.org>
References: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
	<1285792594-10032-7-git-send-email-obi@opendreambox.org>
Date: Thu, 30 Sep 2010 10:49:34 +0200
Message-ID: <1285836574.3805.42.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 06/18] netkit-base-0.17: fix compile with gcc-4.x
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
X-List-Received-Date: Thu, 30 Sep 2010 08:49:51 -0000
X-Groupsio-MsgNum: 24205
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-qEftvZwXgYdONeRccJ/C"

--=-qEftvZwXgYdONeRccJ/C
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 29.09.2010, 20:36 +0000 schrieb Andreas Oberritter:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  .../netkit-base-0.17/gcc4_buildfix.patch           |   11 +++++++++++
>  recipes/netkit-base/netkit-base_0.17.bb            |    3 ++-
>  2 files changed, 13 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/netkit-base/netkit-base-0.17/gcc4_buildfix.pa=
tch
>=20
> diff --git a/recipes/netkit-base/netkit-base-0.17/gcc4_buildfix.patch b/r=
ecipes/netkit-base/netkit-base-0.17/gcc4_buildfix.patch
> new file mode 100644
> index 0000000..f284f1a

As written in my answer to your introductory message [1], it would be
nice to add a patch header [2].

> --- /dev/null
> +++ b/recipes/netkit-base/netkit-base-0.17/gcc4_buildfix.patch
> @@ -0,0 +1,11 @@
> +--- bla/inetd/servtab.c	2000-07-22 22:20:50.000000000 +0200
> ++++ bla/inetd/servtab.c	2006-03-01 15:26:46.000000000 +0100
> +@@ -771,7 +771,7 @@
> + 			return;
> + 		}
> + 	=09
> +-#define SWAP(type, a, b) {type c=3D(type)a; (type)a=3D(type)b; (type)b=
=3D(type)c;}
> ++#define SWAP(type, a, b) {type c=3D(type)a; a=3D(type)b; b=3D(type)c;}
> +=20
> + 		/*
> + 		 * sep->se_wait may be holding the pid of a daemon
> diff --git a/recipes/netkit-base/netkit-base_0.17.bb b/recipes/netkit-bas=
e/netkit-base_0.17.bb
> index c9864ae..4e70164 100644
> --- a/recipes/netkit-base/netkit-base_0.17.bb
> +++ b/recipes/netkit-base/netkit-base_0.17.bb
> @@ -1,11 +1,12 @@
>  SECTION =3D "base"
>  DESCRIPTION =3D "netkit-base includes the inetd daemon."
>  LICENSE =3D "BSD"
> -PR =3D "r1"
> +PR =3D "r2"
> =20
>  SRC_URI =3D "ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/netkit-b=
ase-${PV}.tar.gz \
>             file://configure.patch \
>             file://mconfig.patch \
> +           file://gcc4_buildfix.patch \
>             file://init \
>             file://inetd.conf"

I build tested your patch for `MACHINE =3D "beagleboard"` for the
distributions `minimal-{libc,eglibc,uclibc}` and it worked. It compiled
for `angstrom-2008.1` but failed with a quality assurance warning which
probably has been there before and is for a separate patch.
       =20
        $ more /oe/build/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/ne=
tkit-base-0.17-r2/temp/log.package_do_package.4223=20
     ERROR: QA Issue with netkit-base: No GNU_HASH in the elf binary: '/oe/=
build/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/netkit-base-0.17-r2/p=
ackages-split/netkit-base/usr/sbin/inetd'
     FATAL: QA run found fatal errors. Please consider fixing them.
     ERROR: Error in executing python function in: /oe/openembedded/recipes=
/netkit-base/netkit-base_0.17.bb
     ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
     ERROR: Printing the environment of the function
     ERROR: Function do_package_qa failed

        $ more /oe/build/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/ne=
tkit-base-0.17-r2/temp/log.qa_package=20
     LDFLAGS ignored, netkit-base, /work/armv7a-angstrom-linux-gnueabi/netk=
it-base-0.17-r2/packages-split/netkit-base/usr/sbin/inetd


Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>


Thanks,

Paul


[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-September/=
024859.html
[2] http://wiki.openembedded.net/index.php/Push_patches_upstream

--=-qEftvZwXgYdONeRccJ/C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkykTx4ACgkQPX1aK2wOHVhuyQCeM0IQc7GSj9s8D984Lt8YTK2/
6gwAn2M+87WXz5L5h7/UG20s5l2dToZR
=4BA2
-----END PGP SIGNATURE-----

--=-qEftvZwXgYdONeRccJ/C--
