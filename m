Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P16J7-0004aI-01 for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 01:43:29 +0200
Received: from g225082119.adsl.alicedsl.de ([92.225.82.119]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P16Iw-0003Pq-36 for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 23:43:18 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1285781858-5299-1-git-send-email-chase.maupin@ti.com>
References: <1285781858-5299-1-git-send-email-chase.maupin@ti.com>
Date: Thu, 30 Sep 2010 01:43:17 +0200
Message-ID: <1285803797.5168.3.camel@mattotaupa>
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
Subject: Re: [PATCHv2] am-benchmarks: update to latest version
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
X-List-Received-Date: Wed, 29 Sep 2010 23:43:29 -0000
X-Groupsio-MsgNum: 24195
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-x+4FTkHoJnBDyP2mc8qx"

--=-x+4FTkHoJnBDyP2mc8qx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Chase,


Am Mittwoch, den 29.09.2010, 12:37 -0500 schrieb Chase Maupin:=20
> * Updated the SRCREV to the latest version of this project
>   which includes support for multiple platforms.
> * Add COMPATIBLE_MACHINE setting for recipe.
>=20
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>

it would be great if you could briefly note what changed between the
patch iterations after a --- line, so that it will get removed when it
is committed. v1 =E2=86=92 v2

Please also remember to update the patch queue [1] as picked all patches
from the queue and then had to remove the first version since it was
still listed.

> ---
>  recipes/ti/am-benchmarks_svn.bb |   13 ++++++++++---
>  1 files changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes/ti/am-benchmarks_svn.bb b/recipes/ti/am-benchmarks_s=
vn.bb
> index 51ac6af..6ab29f5 100644
> --- a/recipes/ti/am-benchmarks_svn.bb
> +++ b/recipes/ti/am-benchmarks_svn.bb
> @@ -4,15 +4,22 @@ LICENSE =3D "BSD"
>  SECTION =3D "system"
>  PRIORITY =3D "optional"
> =20
> -SRCREV =3D "33"
> -PV =3D "1.0"
> +SRCREV =3D "56"
> +PV =3D "1.1"
>  PR =3D "r1+svnr${SRCPV}"
> =20
> +COMPATIBLE_MACHINE =3D "(dm365|omapl138|omap3|ti816x)"
> +
> +ARCHITECTURE_dm365 =3D "arm9"
> +ARCHITECTURE_omapl138 =3D "arm9"
> +ARCHITECTURE_omap3 =3D "cortex-a8"
> +ARCHITECTURE_ti816x =3D "cortex-a8"
> +
>  INSANE_SKIP_${PN} =3D "True"
> =20
>  SRC_URI =3D "svn://gforge.ti.com/svn/am_benchmarks/;module=3Dtrunk;proto=
=3Dhttps;user=3Danonymous;pswd=3D''"
> =20
> -S =3D "${WORKDIR}/trunk"
> +S =3D "${WORKDIR}/trunk/${ARCHITECTURE}"
> =20
>  do_compile() {
>  	# don't build debug version

I get the following error with minimal-uclibc. The other distributions
still build. The error looks generic though.

        ERROR: 'oe/openembedded/recipes/ti/am-benchmarks_svn.bb' failed
        ERROR: Function do_compile failed
        [=E2=80=A6]
        Log data follows:
        | make: *** No rule to make target `release'.  Stop.
        | ERROR: Function do_compile failed
        NOTE: package am-benchmarks-1.1-r1+svnr56: task do_compile: Failed


Thanks,

Paul


[1] http://wiki.openembedded.net/index.php/Patchwork

--=-x+4FTkHoJnBDyP2mc8qx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyjzw8ACgkQPX1aK2wOHVhEQwCeJeEE1lx4aMM55x1PxUFcvfAq
6EAAnReHk8SrQhFm9jse/3wlhcjgr196
=E8iN
-----END PGP SIGNATURE-----

--=-x+4FTkHoJnBDyP2mc8qx--
