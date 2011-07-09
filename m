Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QfUX2-0008Vk-Gu for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jul 2011 12:13:04 +0200
Received: from f053045224.adsl.alicedsl.de ([78.53.45.224]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QfUTh-00084r-06; Sat, 09 Jul 2011 10:09:37 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1310170909-3533-1-git-send-email-agnel.joel@gmail.com>
References: <1310170909-3533-1-git-send-email-agnel.joel@gmail.com>
Date: Sat, 09 Jul 2011 12:09:10 +0200
Message-ID: <1310206150.4123.94.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Cc: joelagnel@ti.com, Joel A Fernandes <agnel.joel@gmail.com>, jdk@ti.com,
	k-kooi@ti.com
Subject: Re: [PATCH] pulseaudio: Switch to version version 0.9.22 for Angstrom 2011.03
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
X-List-Received-Date: Sat, 09 Jul 2011 10:13:04 -0000
X-Groupsio-MsgNum: 33090
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-rD1U+EVdjIoIyfzOOVyz"

--=-rD1U+EVdjIoIyfzOOVyz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 08.07.2011, 19:21 -0500 schrieb Joel A Fernandes:

I do not know if the commit summary is correct and if it should be
prepended with =C2=BBangstrom=C2=AB.

> This fixes all the issues noticed earlier with pulseaudio 0.9.15:
>  * Pulseaudio keeping audio devices busy when run as per-user instance
>  * Failure of pactl, pacmd etc to connect to the pulseaudio server

Please always include links to corresponding list threads if they are
available.

> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
> ---
> Notes:
> * This has to go into the OpenEmbedded 2011.03-maintenance branch as ther=
e is no such configration file in the master branch

        $ git grep pulse conf/distro
        conf/distro/include/angstrom-2008-preferred-versions.inc:PREFERRED_=
VERSION_gst-pulse    =3D "0.9.7"
        conf/distro/include/angstrom-2008-preferred-versions.inc:PREFERRED_=
VERSION_pulseaudio   =3D "0.9.15"
        conf/distro/include/angstrom-2010-preferred-versions.inc:PREFERRED_=
VERSION_gst-pulse    =3D "0.9.7"
        conf/distro/include/angstrom-2010-preferred-versions.inc:PREFERRED_=
VERSION_pulseaudio   =3D "0.9.22"
        [=E2=80=A6]

So you your change could actually be applied to master?

> * Please ignore the earlier patch "pulseaudio: Run as system-wide instanc=
e instead of per-user"
>=20
> Applying this and the patch titled "beagleboard-test-scripts: Add a scrip=
t flash-fs.sh for flashing NAND" will mark the
> "Alpha" build of the C5 image. Can this be tagged?
>=20
> Things to go into "Beta":
> * User button fixes (kernel and flashing scripts)
> * U-boot fixes for EHCI timeouts when doing a tftpboot

Great, but this should have gone to a separate thread.

>  conf/distro/angstrom-2008.1.conf                   |    3 +++
>  .../include/angstrom-2008-preferred-versions.inc   |    2 +-
>  2 files changed, 4 insertions(+), 1 deletions(-)
>=20
> diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008=
.1.conf
> index ae1ed4c..7b4f25a 100644
> --- a/conf/distro/angstrom-2008.1.conf
> +++ b/conf/distro/angstrom-2008.1.conf
> @@ -121,6 +121,9 @@ PREFERRED_VERSION_binutils_avr32 =3D "2.17"
>  PREFERRED_VERSION_binutils-cross_avr32 =3D "2.17"
>  PREFERRED_VERSION_binutils-cross-sdk_avr32 =3D "2.17"
> =20
> +ANGSTROM_PULSEAUDIO_VERSION		=3D "0.9.15"
> +ANGSTROM_PULSEAUDIO_VERSION_armv7a	=3D "0.9.22"
> +

1. Where did you find this syntax?

	$ git grep PULSE conf/distro/

does not find anything in branch master.

2. Could you add an explanation, why 0.9.22 is not used for everything
and only for armv7a. Is that because of commit cce5e648 [1]?

>  PREFERRED_PROVIDER_dbus-glib             =3D "dbus-glib"
>  PREFERRED_PROVIDER_hotplug               =3D "udev"
>  PREFERRED_PROVIDER_opkg                 ?=3D "opkg"
> diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc b/c=
onf/distro/include/angstrom-2008-preferred-versions.inc
> index b5b524a..e4b8bf1 100644
> --- a/conf/distro/include/angstrom-2008-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2008-preferred-versions.inc
> @@ -44,7 +44,7 @@ PREFERRED_VERSION_pango-native     =3D "1.24.4"
>  #PREFERRED_VERSION_pixman	=3D "0.13.2"
>  PREFERRED_VERSION_pkgconfig	=3D "0.23"
>  PREFERRED_VERSION_pkgconfig-native =3D "0.23"
> -PREFERRED_VERSION_pulseaudio 	=3D "0.9.15"
> +PREFERRED_VERSION_pulseaudio 	=3D "${ANGSTROM_PULSEAUDIO_VERSION}"
>  PREFERRED_VERSION_python-pycairo =3D "1.8.0"
>  PREFERRED_VERSION_qt4-tools-native =3D "${ANGSTROM_QT_VERSION}"
>  PREFERRED_VERSION_qt4-tools-sdk =3D "${ANGSTROM_QT_VERSION}"

So I would prefer, if you would change the version just in this file and
such a patch could go into branch master first.

Even better would be the following.

1. Package PA 0.9.23 for oe-dev. If I remember correctly I send all
patches upstream and it should work for all architectures(?).
2. Prefer PA 0.9.23 for =C8=A6ngstr=C3=B6m and other distributions.
3. Remove older PA versions.
4. Cherry pick these changes into branch 2011.03-maintenance.

Joel, do you have time and motivation to do that?


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dcce5e64=
8222525a0619f454ddc4f2253afca2821

--=-rD1U+EVdjIoIyfzOOVyz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4YKMYACgkQPX1aK2wOHVhXRQCghKgpDt3w0wjVXmkkZtzADbhW
mPcAnjx44pw1g7XcMhHMtRvjnkxkMLCb
=nWxZ
-----END PGP SIGNATURE-----

--=-rD1U+EVdjIoIyfzOOVyz--
