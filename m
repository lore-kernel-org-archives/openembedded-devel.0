Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QgDme-0004i3-IO for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jul 2011 12:32:14 +0200
Received: from f053040213.adsl.alicedsl.de ([78.53.40.213]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QgDjM-0008A4-1o for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jul 2011 10:28:48 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1310352997-22504-1-git-send-email-agnel.joel@gmail.com>
References: <1310352997-22504-1-git-send-email-agnel.joel@gmail.com>
Date: Mon, 11 Jul 2011 12:28:16 +0200
Message-ID: <1310380096.4187.11.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH v2] angstrom: Use pulseaudio version 0.9.22 for armv7a architecture
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
X-List-Received-Date: Mon, 11 Jul 2011 10:32:14 -0000
X-Groupsio-MsgNum: 33107
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-8F5e4iskJyrD1lu94m16"

--=-8F5e4iskJyrD1lu94m16
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 10.07.2011, 21:56 -0500 schrieb Joel A Fernandes:
> This fixes all the issues noticed earlier with pulseaudio 0.9.15:
>  * Pulseaudio keeping audio devices busy when run as per-user instance
>  * Failure of pactl, pacmd etc to connect to the pulse server
>=20
> The gcc 4.3.x angstrom is using in maintenance lacks the needed atomic op=
s to build pulseaudio 0.9.23
> for armv7a so we use pulseaudio 0.9.22 which is less buggier than pulseau=
dio 0.9.15
>=20
> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

> ---
> Following Paul's suggestions, changes since original patch:
> * Moved setting of the PREFERRED_VERSION for pulseaudio from conf/distro/=
angstrom-2008.1.conf
> to conf/distro/include/angstrom-2008-preferred-versions.inc
>=20
> * prepended the patch title with "angstrom:"
>=20
> Original patch:
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-July/033854.=
html
>=20
> Paul's suggestions:
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-July/033872.=
html
>=20
> Koen's comments on the lack of atomic ops in gcc 4.3.x:
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-July/033866.=
html
>=20
>  .../include/angstrom-2008-preferred-versions.inc   |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc b/c=
onf/distro/include/angstrom-2008-preferred-versions.inc
> index b5b524a..4833d35 100644
> --- a/conf/distro/include/angstrom-2008-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2008-preferred-versions.inc
> @@ -45,6 +45,7 @@ PREFERRED_VERSION_pango-native     =3D "1.24.4"
>  PREFERRED_VERSION_pkgconfig	=3D "0.23"
>  PREFERRED_VERSION_pkgconfig-native =3D "0.23"
>  PREFERRED_VERSION_pulseaudio 	=3D "0.9.15"
> +PREFERRED_VERSION_pulseaudio_armv7a =3D "0.9.22"
>  PREFERRED_VERSION_python-pycairo =3D "1.8.0"
>  PREFERRED_VERSION_qt4-tools-native =3D "${ANGSTROM_QT_VERSION}"
>  PREFERRED_VERSION_qt4-tools-sdk =3D "${ANGSTROM_QT_VERSION}"

Thank you again for improving this patch and incorporating the
suggestions. Please do not forget to update our patch queue [1] as I
already wrote in another reply. (You could search for =C2=BBpatchwork=C2=AB=
 in
your inbox.)


Thanks,

Paul


[1] http://patches.openembedded.org/project/oe/list/

--=-8F5e4iskJyrD1lu94m16
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4a0DcACgkQPX1aK2wOHViaNACfXiRZHL7ml0JsdxBUk+IrYToL
a8UAniOO2jQuwCUlsqqETXzWCeAQfCd6
=3yA0
-----END PGP SIGNATURE-----

--=-8F5e4iskJyrD1lu94m16--
