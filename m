Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QIxbu-000312-29 for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 08:36:58 +0200
Received: from f053040243.adsl.alicedsl.de ([78.53.40.243]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QIxaT-0004Ca-H9 for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 06:35:29 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304822586-14872-2-git-send-email-otavio@ossystems.com.br>
References: <1304822586-14872-1-git-send-email-otavio@ossystems.com.br>
	<1304822586-14872-2-git-send-email-otavio@ossystems.com.br>
Date: Sun, 08 May 2011 08:34:15 +0200
Message-ID: <1304836455.4124.7.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [meta-oe][PATCH 02/11] ntfs-3g-ntfsprogs: add 2011.4.12 recipes
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
X-List-Received-Date: Sun, 08 May 2011 06:36:58 -0000
X-Groupsio-MsgNum: 31721
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-xbwAHUVBqrBblU5MPyHW"

--=-xbwAHUVBqrBblU5MPyHW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 08.05.2011, 02:42 +0000 schrieb Otavio Salvador:

In the summary s/recipes/recipe/.

> This recipe is a merge of ntfs-3g and ntfsprogs thus the provides
> entries.
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../ntfs-3g-ntfsprogs_2011.4.12.bb                 |   26 ++++++++++++++=
++++++
>  1 files changed, 26 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntf=
sprogs_2011.4.12.bb
>=20
> diff --git a/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_=
2011.4.12.bb b/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_=
2011.4.12.bb
> new file mode 100644
> index 0000000..561f52a
> --- /dev/null
> +++ b/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.=
12.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION =3D "The NTFS-3G driver is an open source, freely available =
NTFS driver for Linux with read and write support."
> +HOMEPAGE =3D "http://www.ntfs-3g.org/"
> +DEPENDS =3D "fuse libgcrypt"
> +PROVIDES =3D "ntfsprogs ntfs-3g"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552 \
> +                    file://COPYING.LIB;md5=3Df30a9716ef3762e3467a2f62bf7=
90f0a"
> +PR =3D "r0"
> +
> +SRC_URI =3D "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz"
> +S =3D "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"

Is not this the default for `S`?

> +inherit autotools
> +
> +EXTRA_OEMAKE =3D "LDCONFIG=3Decho"

A short explanation in the commit message or as a comment why this is
needed would be nice.

> +PACKAGES =3D. "ntfs-3g ntfsprogs libntfs-3g"

`=3D+` is more commonly used?

> +FILES_ntfs-3g =3D "${base_sbindir}/*.ntfs-3g ${bindir}/ntfs-3g*"
> +RDEPENDS_ntfs-3g +=3D "fuse"
> +
> +FILES_ntfsprogs =3D "${base_sbindir}/* ${bindir}/* ${sbindir}/*"
> +FILES_libntfs-3g =3D "${libdir}/*.so.*"
> +
> +SRC_URI[md5sum] =3D "9c4ce318373b15332239a77a9d2a39fe"
> +SRC_URI[sha256sum] =3D "aa8c747f0bfe819b2387b05e12db8d35e4ac96dcb2432873=
a0b939e248b2ee05"

Maybe again at the top.


Thanks,

Paul

--=-xbwAHUVBqrBblU5MPyHW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3GOWcACgkQPX1aK2wOHVjRdwCfURg+RPD82eXGhf3VaXJJ+wwU
wHYAn39webL/i6IZFuSJLzy75EZTGqdg
=o2Di
-----END PGP SIGNATURE-----

--=-xbwAHUVBqrBblU5MPyHW--
