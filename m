Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QczUU-0007QQ-My for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jul 2011 14:40:10 +0200
Received: from f053033014.adsl.alicedsl.de ([78.53.33.14]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QczR2-00053E-Bw for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jul 2011 12:36:32 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <5fa6a25857cc7b16ab7fe2ca21ead58aa754f46d.1309608953.git.michael.lippautz@gmail.com>
References: <cover.1309608953.git.michael.lippautz@gmail.com>
	<5fa6a25857cc7b16ab7fe2ca21ead58aa754f46d.1309608953.git.michael.lippautz@gmail.com>
Date: Sat, 02 Jul 2011 14:36:21 +0200
Message-ID: <1309610181.4228.9.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe][PATCH 1/4] pyudev: Add intial version
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
X-List-Received-Date: Sat, 02 Jul 2011 12:40:11 -0000
X-Groupsio-MsgNum: 32953
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-de8CwJDJu2/3khemXFtm"

--=-de8CwJDJu2/3khemXFtm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 02.07.2011, 14:20 +0200 schrieb Michael Lippautz:

Please add the program version also to the commit summary.

	Add version 0.11 (initial recipe)

> * glib, qt4 and side .py files are deployed. Their RDEPS are however curr=
ently
>   not (yet) existing, hence no RSUGGESTS.
>=20
> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
> ---
>  .../recipes-devtools/python/python-pyudev_0.11.bb  |   22 ++++++++++++++=
++++++
>  1 files changed, 22 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/python/python-pyudev_0.11.bb
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-pyudev_0.11.bb b/meta=
-oe/recipes-devtools/python/python-pyudev_0.11.bb
> new file mode 100644
> index 0000000..e14450f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-pyudev_0.11.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION =3D "A libudev binding"
> +HOMEPAGE =3D "http://pypi.python.org/pypi/pyudev"
> +SECTION =3D "devel/python"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37=
343"
> +PR =3D "r0"
> +
> +SRCNAME =3D "pyudev"
> +SRC_URI =3D "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNA=
ME}-${PV}.tar.gz"
> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit setuptools
> +
> +RDEPENDS_${PN} =3D "\
> +  python-ctypes \
> +  python-subprocess \
> +  python-misc \
> +	libudev \

This looks like a white space error. Please use spaces consistently.

> +"
> +
> +SRC_URI[md5sum] =3D "dca4e69da387f9a6683ee4b5c27ca66a"
> +SRC_URI[sha256sum] =3D "0acfa500219f4bcf711f35c1b2041d035b4bf5f302eca503=
8572ee788d9e584a"

I do not know how it is handled in meta-oe, but usually the checksum
lines go right below the first `SRC_URI` entry. In those recipes where
there are at the bottom it was most likely due to the conversion script
used.


Thanks,

Paul

--=-de8CwJDJu2/3khemXFtm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk4PEMUACgkQPX1aK2wOHVg6swCfSCJjGPzMWfrjLv20C2DuGbH0
e9sAmgMq2zUzGZdvrBds8zgtbSXV5UDl
=Gc55
-----END PGP SIGNATURE-----

--=-de8CwJDJu2/3khemXFtm--
