Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QIxYG-0002sx-0G for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 08:33:12 +0200
Received: from f053040243.adsl.alicedsl.de ([78.53.40.243]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QIxWp-0004Ac-65 for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 06:31:43 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304822586-14872-1-git-send-email-otavio@ossystems.com.br>
References: <1304822586-14872-1-git-send-email-otavio@ossystems.com.br>
Date: Sun, 08 May 2011 08:30:29 +0200
Message-ID: <1304836229.4124.4.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [meta-oe][PATCH 01/11] fuse: add 2.8.5
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
X-List-Received-Date: Sun, 08 May 2011 06:33:12 -0000
X-Groupsio-MsgNum: 31720
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-Y3hmlGhw0hlxF7D2pFmZ"

--=-Y3hmlGhw0hlxF7D2pFmZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 08.05.2011, 02:42 +0000 schrieb Otavio Salvador:
> This recipes is required by ntfs-3g-ntfsprogs.

Is this based on the OE recipe? Could you add an inc file right from the
beginning?

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-oe/recipes-support/fuse/fuse_2.8.5.bb |   32 ++++++++++++++++++++++=
++++++
>  1 files changed, 32 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-support/fuse/fuse_2.8.5.bb
>=20
> diff --git a/meta-oe/recipes-support/fuse/fuse_2.8.5.bb b/meta-oe/recipes=
-support/fuse/fuse_2.8.5.bb
> new file mode 100644
> index 0000000..cf323ce
> --- /dev/null
> +++ b/meta-oe/recipes-support/fuse/fuse_2.8.5.bb
> @@ -0,0 +1,32 @@
> +DESCRIPTION =3D "With FUSE it is possible to implement a fully functiona=
l filesystem in a userspace program"
> +HOMEPAGE =3D "http://fuse.sf.net"

Could you also add a section please.

> +LICENSE =3D "GPLv2"
> +RRECOMMENDS_fuse =3D "kernel-module-fuse""

Use `_${PN}`?

> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
> +                    file://COPYING.LIB;md5=3Df30a9716ef3762e3467a2f62bf7=
90f0a"
> +
> +PR =3D "r0"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/fuse/fuse-${PV}.tar.gz"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF =3D " --disable-kernel-module"

Space in the beginning not needed?

> +PACKAGES =3D+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev lib=
ulockmgr-dbg"
> +
> +FILES_${PN} +=3D "${libdir}/libfuse.so.*"
> +FILES_${PN}-dev +=3D "${libdir}/libfuse*.la"
> +
> +FILES_libulockmgr =3D "${libdir}/libulockmgr.so.*"
> +FILES_libulockmgr-dev +=3D "${libdir}/libulock*.la"
> +FILES_libulockmgr-dbg +=3D "${libdir}/.debug/libulock*"
> +
> +# Forbid auto-renaming to libfuse-utils
> +FILES_fuse-utils =3D "${bindir} ${base_sbindir}"
> +FILES_fuse-utils-dbg =3D "${bindir}/.debug ${base_sbindir}/.debug"
> +DEBIAN_NOAUTONAME_fuse-utils =3D "1"
> +DEBIAN_NOAUTONAME_fuse-utils-dbg =3D "1"
> +
> +SRC_URI[md5sum] =3D "8aa2fd689de00b73963620483084ae3b"
> +SRC_URI[sha256sum] =3D "bec80e66ae8ee60dfdf67b2ca291266a45dcfe6bc20c64f3=
acfceaa38ed29a84"

I would put these field to the first `SRC_URI` fields.


Thanks,

Paul

--=-Y3hmlGhw0hlxF7D2pFmZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3GOH8ACgkQPX1aK2wOHVjoLgCghfTBHFMdwkA8JL+Uux3h2U+f
sh4AnRSYrDsTYzp9LvxUMNxbDdvF4PQ9
=1no+
-----END PGP SIGNATURE-----

--=-Y3hmlGhw0hlxF7D2pFmZ--
