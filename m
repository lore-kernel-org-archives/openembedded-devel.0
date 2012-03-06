Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1S4tHJ-0004BS-VQ for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 13:14:05 +0100
Received: from g225138053.adsl.alicedsl.de ([92.225.138.53]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1S4t95-00012b-EL for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 12:05:35 +0000
Message-ID: <1331035530.6166.23.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 06 Mar 2012 13:05:30 +0100
In-Reply-To: <1331030173-21724-1-git-send-email-jluebbe@debian.org>
References: <1331030173-21724-1-git-send-email-jluebbe@debian.org>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/3] proj: add recipe
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
X-List-Received-Date: Tue, 06 Mar 2012 12:14:06 -0000
X-Groupsio-MsgNum: 37634
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-pNSrcd2ID9jENBz+4kVL"

--=-pNSrcd2ID9jENBz+4kVL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Jan,


thank you for your patch.

Am Dienstag, den 06.03.2012, 11:36 +0100 schrieb Jan Luebbe:

Could you please add the version number to the commit summary?

How did you test this package?

> Signed-off-by: Jan Luebbe <jluebbe@debian.org>
> ---
>  meta-oe/recipes-navigation/proj/proj.inc      |   13 +++++++++++++
>  meta-oe/recipes-navigation/proj/proj_4.7.0.bb |    7 +++++++

There seems to be 4.9 in OE-Classic? Is that not usable?

>  2 files changed, 20 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-navigation/proj/proj.inc
>  create mode 100644 meta-oe/recipes-navigation/proj/proj_4.7.0.bb
>=20
> diff --git a/meta-oe/recipes-navigation/proj/proj.inc b/meta-oe/recipes-n=
avigation/proj/proj.inc
> new file mode 100644
> index 0000000..f6275d1
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/proj/proj.inc
> @@ -0,0 +1,13 @@
> +DESCRIPTION =3D "PROJ.4 - Cartographic Projections Library"
> +HOMEPAGE =3D "http://trac.osgeo.org/proj/"
> +SECTION =3D "libs"
> +
> +INC_PR =3D "r0"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D74d9aaec5fa0cd734341e8c4dc91b=
608"
> +
> +SRC_URI =3D "http://download.osgeo.org/proj/proj-${PV}.tar.gz"
> +
> +inherit autotools pkgconfig
> +

Please no new line at the end.

> diff --git a/meta-oe/recipes-navigation/proj/proj_4.7.0.bb b/meta-oe/reci=
pes-navigation/proj/proj_4.7.0.bb
> new file mode 100644
> index 0000000..8e4f901
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/proj/proj_4.7.0.bb
> @@ -0,0 +1,7 @@
> +require proj.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[md5sum] =3D "927d34623b52e0209ba2bfcca18fe8cd"
> +SRC_URI[sha256sum] =3D "fc5440002a496532bfaf423c28bdfaf9e26cc96c84ccefcd=
efde911efbd98986"
> +

Please no new line at the end.

Also you do not need a INC file, because in OE-Core and meta-oe we try
to only have one version included.

Some of the comments also apply to your other patches.


Thanks,

Paul

--=-pNSrcd2ID9jENBz+4kVL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAk9V/YoACgkQPX1aK2wOHViYxQCeOsxwbhp5muMlxdyA7uRKxtOA
dm0AnRkEthphl1xcoRq+s4IHgfBzdb6W
=tscx
-----END PGP SIGNATURE-----

--=-pNSrcd2ID9jENBz+4kVL--
