Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RC7Kn-000224-2f for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2011 12:07:17 +0200
Received: from f053037204.adsl.alicedsl.de ([78.53.37.204]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RC7FX-0002Bu-PP for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2011 10:01:52 +0000
Message-ID: <1317981695.3685.22.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 07 Oct 2011 12:01:35 +0200
In-Reply-To: <1317942096-32057-1-git-send-email-gavinswanson@gmail.com>
References: <1317942096-32057-1-git-send-email-gavinswanson@gmail.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH] Added ImageMagick 6.7.2-3
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
X-List-Received-Date: Fri, 07 Oct 2011 10:07:17 -0000
X-Groupsio-MsgNum: 34603
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-laCmfuKtI+254C57W7CH"

--=-laCmfuKtI+254C57W7CH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Gavin,


thank you for your patch.

Am Donnerstag, den 06.10.2011, 16:01 -0700 schrieb gavinswanson@gmail.com:
> From: Gavin Swanson <gavinswanson@gmail.com>

Please refer to our commit policy [1] and style guide [2].
(Unfortunately the Wiki is down at the moment.)

Change the commit summary to

	imagemagick: Add version 6.7.2-3

and add some more information to the commit message. What distribution
and machine did you use for testing? Have you run tested the new
version.

You seem to have used an existing recipe as a template. Please note that
too.

At last please add you Signed-off-by line.

> ---
>  recipes/imagemagick/imagemagick_6.7.2-3.bb |   36 ++++++++++++++++++++++=
++++++
>  1 files changed, 36 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/imagemagick/imagemagick_6.7.2-3.bb
>=20
> diff --git a/recipes/imagemagick/imagemagick_6.7.2-3.bb b/recipes/imagema=
gick/imagemagick_6.7.2-3.bb
> new file mode 100644
> index 0000000..14746c9
> --- /dev/null
> +++ b/recipes/imagemagick/imagemagick_6.7.2-3.bb
> @@ -0,0 +1,36 @@
> +DESCRIPTION =3D "ImageMagick is an image convertion tools"
> +SECTION =3D "console/utils"
> +LICENSE =3D "GPL"

I updated those meta fields in the repository. Please update the above
too.

> +# FIXME: There is much more checked libraries. All should be added or ex=
plicitly disabled to get consistent results.
> +DEPENDS =3D "lcms bzip2 jpeg libpng librsvg tiff zlib"
> +
> +PR =3D "r1"

Please start with `r0`.

> +
> +SRC_URI =3D "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}.tar.bz=
2 \
> +#           file://PerlMagic_MakePatch;apply=3Dyes \

Why is this patch not needed anymore? You can just delete the line then.

> +          "
> +
> +IMVER =3D "6.7.2-3"

I think the old recipes strip the `-3` to get the correct directory
names. This way `IMVER` is equal to `PN`.

> +
> +S =3D "${WORKDIR}/ImageMagick-${IMVER}"

It looks like you can delete this line for this version, since in your
version the archive seems to have a =E2=80=9Ccorrectly=E2=80=9D named folde=
r included.

$ ls minimal-dev/work/armv7a-oe-linux-gnueabi/imagemagick-6.4.4-1-r7/
ImageMagick-6.4.4  temp

$ ls minimal-dev/work/armv7a-oe-linux-gnueabi/imagemagick-6.7.2-3-r1/
ImageMagick-6.7.2-3  temp

> +
> +inherit autotools binconfig pkgconfig
> +
> +EXTRA_OECONF =3D "--program-prefix=3D --without-x --without-freetype --w=
ithout-perl --disable-openmp"
> +
> +FILES_${PN} +=3D "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.so \
> +                ${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.la \
> +                ${libdir}/ImageMagick-${IMVER}/config/ \
> +                ${datadir}/ImageMagick-${IMVER}"

Could you please look into the following warnings.

        NOTE: package imagemagick-6.7.2-3-r1: task do_qa_staging: Succeeded
        WARNING: the following files were installed but not shipped in any =
package:
        WARNING:   /usr/share/ImageMagick-6.7.2/francais.xml
        WARNING:   /usr/share/ImageMagick-6.7.2/locale.xml
        WARNING:   /usr/share/ImageMagick-6.7.2/english.xml
        WARNING:   /usr/share/ImageMagick-6.7.2/configure.xml

Here you can also see that the directory name seems to only include
6.7.2 instead of 6.7.2-3. So you should check where `IMVER` should be
used and where `PV`, which is 6.7.2-3.

> +
> +FILES_${PN}-dev +=3D "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.a"
> +
> +FILES_${PN}-dbg +=3D "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/.debu=
g/*"
> +
> +BBCLASSEXTEND =3D "native"
> +
> +LEAD_SONAME =3D "libMagickCore.so.*"
> +
> +
> +SRC_URI[md5sum] =3D "62e12090d2d385f4800c06f58f477bea"
> +SRC_URI[sha256sum] =3D "50fe6e1af9e900e5d4bef45879a3a7e15512bb9ab3dbbafb=
521825359cb6d2c7"


Thanks,

Paul


[1] http://www.openembedded.org/wiki/Commit_Policy
[2] http://www.openembedded.org/index.php?title=3DStyleguide

--=-laCmfuKtI+254C57W7CH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6Ozf8ACgkQPX1aK2wOHVilKgCeOmHe/DVe7SF9CFichxYftdsb
lJ8An17TDx0hJwHlcpKsTirWpmSk+AGb
=GzmM
-----END PGP SIGNATURE-----

--=-laCmfuKtI+254C57W7CH--
