Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RK8C8-0002AQ-Ei for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 14:39:28 +0200
Received: from g225082113.adsl.alicedsl.de ([92.225.82.113]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RK86W-000219-Kk for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 12:33:40 +0000
Message-ID: <1319891607.3756.18.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Oct 2011 14:33:27 +0200
In-Reply-To: <3bcd2fb9e853253747293c584109ab394ba3fd4e.1319884094.git.Martin.Jansa@gmail.com>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
	<3bcd2fb9e853253747293c584109ab394ba3fd4e.1319884094.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [meta-efl][meta-oe 05/12] id3lib: Import from openembedded classic
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
X-List-Received-Date: Sat, 29 Oct 2011 12:39:28 -0000
X-Groupsio-MsgNum: 35065
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-CBhjnUFsO4cXzAnTgBps"

--=-CBhjnUFsO4cXzAnTgBps
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Martin, dear Denis,


Am Samstag, den 29.10.2011, 12:29 +0200 schrieb Martin Jansa:
> From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
>=20
> Added LIC_FILES_CHKSUM, and fixed LICENSE
>=20
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

NACK.

please add the version you import and the commit ID you import from.
This is all written in the guide lines [1]!

> ---
>  meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb |   18 +++++++++++++++=
+++
>  1 files changed, 18 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb b/meta-oe/=
recipes-multimedia/id3lib/id3lib_3.8.3.bb
> new file mode 100644
> index 0000000..9be4ffb
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION =3D "Library for interacting with ID3 tags."
> +SECTION =3D "libs/multimedia"
> +PRIORITY =3D "optional"
> +DEPENDS =3D "zlib"
> +LICENSE =3D "GPLv2+"

That is not correct [2], it is `LGPLv2+`. Additionally the header
ordering is not the standard. I thought migration to meta-oe was
supposed to be a chance to clean up the recipes.

> +LIC_FILES_CHKSUM =3D "files://COPYING;md5=3D3bf50002aefd002f49e7bb854063=
f7e7"
> +PR =3D "r0"

According to Koen these are going away. Unfortunately these things are
discussed on oe-core instead of openembedded-devel as described in the
Wiki [3].

> +inherit autotools
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/id3lib/id3lib-${PV}.tar.gz;name=3Darc=
hive \
> +           http://ftp.de.debian.org/debian/pool/main/i/id3lib3.8.3/id3li=
b3.8.3_3.8.3-7.2.diff.gz;name=3Dpatch \
> +          "
> +
> +SRC_URI[archive.md5sum] =3D "19f27ddd2dda4b2d26a559a4f0f402a7"
> +SRC_URI[archive.sha256sum] =3D "2749cc3c0cd7280b299518b1ddf5a5bcfe2d1100=
614519b68702230e26c7d079"
> +SRC_URI[patch.md5sum] =3D "805c0320a2efb21c40ce06fa13cd7c4b"
> +SRC_URI[patch.sha256sum] =3D "9f03b59ccc8826a5be55a3dcde2f889067d58bdc72=
bf846416a198c9b933704c"


Thanks,

Paul


[1] http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
[2] http://git.openembedded.org/openembedded/log/recipes/id3lib/id3lib_3.8.=
3.bb
[3] http://www.openembedded.org/wiki/Mailing_lists

--=-CBhjnUFsO4cXzAnTgBps
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6r8pcACgkQPX1aK2wOHVhLSQCeLQwOfINBtez/J5yKYPCcIUMB
XKUAn3Kz49Fe5edNDMs4Gl82W6/E9u+L
=Jhmw
-----END PGP SIGNATURE-----

--=-CBhjnUFsO4cXzAnTgBps--
