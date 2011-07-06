Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QeOeN-00067c-Al for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 11:44:07 +0200
Received: from f053037185.adsl.alicedsl.de ([78.53.37.185]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QeOay-0001hN-K6; Wed, 06 Jul 2011 09:40:36 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1309915643-16401-1-git-send-email-agnel.joel@gmail.com>
References: <1309915643-16401-1-git-send-email-agnel.joel@gmail.com>
Date: Wed, 06 Jul 2011 11:40:16 +0200
Message-ID: <1309945216.4518.8.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: joelagnel@ti.com, Joel A Fernandes <agnel.joel@gmail.com>, jdk@ti.com,
	k-kooi@ti.com
Subject: Re: [PATCH] beagleboard-test-scripts: Add a script flash-fs.sh for flashing NAND.
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
X-List-Received-Date: Wed, 06 Jul 2011 09:44:07 -0000
X-Groupsio-MsgNum: 32996
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-G5IYshYcFBPgm229jG+i"

--=-G5IYshYcFBPgm229jG+i
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Joel,


Am Dienstag, den 05.07.2011, 20:27 -0500 schrieb Joel A Fernandes:
                                                       ^

=E2=80=A2 Is in your Name a dot missing after the second name?
=E2=80=A2 In the commit summary no full stop at the end is used according t=
o the
new commit guidelines.

> This script flashes the NAND of a beagleboard if it exists, and if there =
is a valid image to flash.

If you capitalize NAND you could also write BeagleBoard.

> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
> ---
>  .../beagleboard/beagleboard-test-scripts_git.bb    |    7 +++++--
>  1 files changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/beagleboard/beagleboard-test-scripts_git.bb b/recipe=
s/beagleboard/beagleboard-test-scripts_git.bb
> index be0d059..237d8d6 100644
> --- a/recipes/beagleboard/beagleboard-test-scripts_git.bb
> +++ b/recipes/beagleboard/beagleboard-test-scripts_git.bb
> @@ -3,10 +3,10 @@ DESCRIPTION =3D "BeagleBoard test scripts"
>  HOMEPAGE =3D "http://beagleboad.org/support"
>  PR =3D "r2"

Since the package content changes you have to increase the number.

> -SRC_URI =3D "git://gitorious.org/beagleboard-validation/scripts.git;prot=
ocol=3Dgit \
> +SRC_URI =3D "git://gitorious.org/~joelf/beagleboard-validation/validatio=
n-scripts.git;protocol=3Dgit \
>  "
> =20
> -SRCREV =3D "473dd2ab20d866be6168c9f992c2c9e74e485c9d"
> +SRCREV =3D "${AUTOREV}"

In OE it is not wanted to use `AUTOREV`. I do not know though how you
can specify a revision for each repository.

>  S =3D "${WORKDIR}/git"
> =20
>  do_install() {
> @@ -28,4 +28,7 @@ do_install() {
>    for i in ${TEST_FILES}; do
>      install -m 0755 ${S}/${i} ${D}/${bindir}
>    done
> +  # Add  script to flash the NAND if it exists and if there is a valid i=
mage to flash on bootup.

=E2=80=A2 After =C2=BBAdd a space can be removed.
=E2=80=A2 =C2=BBon bootup=C2=AB is not clear to me. Does the BB have to be =
rebooted and
then the image is flashed?

> +  install -d ${D}/${sysconfdir}/rc5.d/
> +  install -m 0755 ${S}/flashing/flash-fs.sh ${D}/${sysconfdir}/rc5.d/S99=
flashfs
>  }


Thanks,

Paul

--=-G5IYshYcFBPgm229jG+i
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4ULXUACgkQPX1aK2wOHVjkQwCbBry3ywf2a9bsB/7PDIdNvHH0
RSsAniCXdCrSJmMQS2ISrlQJVG4Grn5O
=yAlR
-----END PGP SIGNATURE-----

--=-G5IYshYcFBPgm229jG+i--
