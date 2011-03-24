Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q2gex-0000vl-1n for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 10:16:51 +0100
Received: from f053039182.adsl.alicedsl.de ([78.53.39.182]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q2gdB-0005Vy-B9 for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 09:15:01 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTikXA3RfJ2jfnf+ct=eCVmOS4CC1xPg1Q94JDeGT@mail.gmail.com>
References: <AANLkTikXA3RfJ2jfnf+ct=eCVmOS4CC1xPg1Q94JDeGT@mail.gmail.com>
Date: Thu, 24 Mar 2011 10:15:00 +0100
Message-ID: <1300958100.3795.13.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 1/2] TI IPC: Fixes for license, dependencies and installer unpack
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
X-List-Received-Date: Thu, 24 Mar 2011 09:16:51 -0000
X-Groupsio-MsgNum: 30576
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-M8Ir2//U0inFSECgPWjO"

--=-M8Ir2//U0inFSECgPWjO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Siddharth,


Am Donnerstag, den 24.03.2011, 14:22 +0530 schrieb Siddharth Heroor:
> * Correct the license from TI to BSD.
> * Fix dependencies

Also full stop at the end. ;-)

> * Update the installer unpack commands for latest releases.
>=20
> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> ---
>  recipes/ti/ti-ipc.inc |    9 ++++++---
>  1 files changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes/ti/ti-ipc.inc b/recipes/ti/ti-ipc.inc
> index cd6ad6e..28f8525 100644
> --- a/recipes/ti/ti-ipc.inc
> +++ b/recipes/ti/ti-ipc.inc
> @@ -1,20 +1,23 @@
>  DESCRIPTION =3D "TI Inter Process Ccommunication (IPC) Mechanisms (for
> Uni- and Multi- Processor Configurations)"

Your mailer mangled the patch by adding line breaks.

>  HOMEPAGE =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targe=
tcontent/ipc/index.html"
> +

I think no empty line is needed [1].

>  SECTION =3D "devel"
> -LICENSE =3D "TI"
> +LICENSE =3D "BSD"
>=20
>  require ti-paths.inc
>  require ti-staging.inc
>  require ti-eula-unpack.inc
>=20
> -PR =3D "r2"
> +PR =3D "r3"
>=20
>  S =3D "${WORKDIR}/ipc_${PV}"
>=20
>  SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/target=
content/ipc/${PV}/exports/ipc_setuplinux_${PV}.bin;name=3Dipcbin"
>=20
> +DEPENDS =3D "ti-sysbios ti-cgt6x ti-xdctools"
> +

Did it work before?

>  BINFILE=3D"ipc_setuplinux_${PV}.bin"
> -TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
> +TI_BIN_UNPK_CMDS=3D"Y: q:workdir:Y"

Will this work with the older versions, since it is an include file.

>  do_install() {
>      install -d ${D}${IPC_INSTALL_DIR_RECIPE}

Please resend as =C2=BBPATCH v2=C2=AB. Your other patch was also corrupted.

Two additional comments.

1. I would prefer one commit for each change.
2. Is it true that `ti-ipc` as committed in 32336b9a [1] was only usable
for the TI folks and just now it is released to and usable for the
public? This should be explained in the commit message and that the
first public version will be committed in the next commit.


Thanks,

Paul


[1] http://openembedded.org/index.php/Styleguide
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D32336b9=
a0e785f2f13d8cc36aefcaa2be27141da

--=-M8Ir2//U0inFSECgPWjO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2LC5MACgkQPX1aK2wOHVgWaQCfZpX09PWAMczB1cQAI80VKurb
FngAnRllc/m93hjnzGwUtuB3TUgrcKRg
=FcnL
-----END PGP SIGNATURE-----

--=-M8Ir2//U0inFSECgPWjO--
