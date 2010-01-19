Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NXNUD-0003dP-JA for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 00:27:52 +0100
Received: from f053039068.adsl.alicedsl.de ([78.53.39.68]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NXNS4-00059E-5u for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 23:25:36 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B563AED.6020504@atmel.com>
References: <4B563AED.6020504@atmel.com>
Date: Wed, 20 Jan 2010 00:25:34 +0100
Message-ID: <1263943534.3181.19.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Build fbv with JPEG and PNG enabled
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
X-List-Received-Date: Tue, 19 Jan 2010 23:27:52 -0000
X-Groupsio-MsgNum: 15913
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-BgKNM62O6ScBT0NZUkHh"

--=-BgKNM62O6ScBT0NZUkHh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 20.01.2010, 00:06 +0100 schrieb Ulf Samuelsson:
> Build fbv with jpeg and png enabled
>=20
> Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
> ---
>  recipes/fbv/fbv-1.0b/fbv-1.0b.patch |   12 ++++++++++++
>  recipes/fbv/fbv_1.0b.bb             |   23 +++++++++++++++--------
>  2 files changed, 27 insertions(+), 8 deletions(-)
>  create mode 100644 recipes/fbv/fbv-1.0b/fbv-1.0b.patch
>=20
> diff --git a/recipes/fbv/fbv-1.0b/fbv-1.0b.patch
> b/recipes/fbv/fbv-1.0b/fbv-1.0b.patch
> new file mode 100644
> index 0000000..6fbd1fb
> --- /dev/null
> +++ b/recipes/fbv/fbv-1.0b/fbv-1.0b.patch
> @@ -0,0 +1,12 @@
> +diff -urN fbv-1.0b-0rig/Makefile fbv-1.0b/Makefile
> +--- fbv-1.0b-0rig/Makefile	2009-08-20 00:33:58.000000000 +0200
> ++++ fbv-1.0b/Makefile	2009-08-20 00:34:16.000000000 +0200
> +@@ -12,7 +12,7 @@
> + OBJECTS	=3D ${SOURCES:.c=3D.o}
> +
> + OUT	=3D fbv
> +-#LIBS	=3D -lungif -L/usr/X11R6/lib -ljpeg -lpng
> ++LIBS	=3D -L/usr/lib -ljpeg -lpng #-lungif
> +
> + all: $(OUT)
> + 	@echo Build DONE.
> diff --git a/recipes/fbv/fbv_1.0b.bb b/recipes/fbv/fbv_1.0b.bb
> index 04c7066..4a5bd6b 100644
> --- a/recipes/fbv/fbv_1.0b.bb
> +++ b/recipes/fbv/fbv_1.0b.bb
> @@ -1,25 +1,32 @@
>  DESCRIPTION =3D "Frame Buffer Viewer"
>  LICENSE =3D "GPL"
> -DEPENDS =3D "libpng"
> +DEPENDS =3D "libpng jpeg"
>  PR =3D "r1"

Should not this be increased because of the changed `DEPENDS`? Why is
`PR` not just a number?

>  SRC_URI =3D "http://s-tech.elsat.net.pl/fbv/fbv-1.0b.tar.gz \
> -	   file://cross_compile.patch;patch=3D1"
> +	file://cross_compile.patch;patch=3D1 \
> +	file://fbv-1.0b.patch;patch=3D1 \
> +	"
> +
> +#inherit autotools

Please do not comment out code. Everything is under versioning control.

>  do_configure() {
> -	CC=3D"${CC}" ./configure --without-libungif --without-bmp \
> -		--without-libjpeg
> +	CC=3D"${CC}" ./configure --without-libungif
>  }
>=20
>  do_compile() {
>  	oe_runmake CFLAGS=3D"-O2 -Wall -D_GNU_SOURCE -D__KERNEL_STRICT_NAMES" \
>  		CC=3D"${CC}"
>  }
> +
>  do_install() {
>  	install -d ${D}${bindir}
> -        install -m 0755 fbv ${D}${bindir}
> +	install -m 0755 fbv ${D}${bindir}

What changed?

> -        # man
> -        install -d ${D}${mandir}/man1/
> -        install -m 0644 fbv.1 ${D}${mandir}/man1/fbv.1
> +# man
> +#	install -d ${D}${mandir}/man1/
> +#	install -m 0644 fbv.1 ${D}${mandir}/man1/fbv.1
>  }

Why did you disable this? If it is not needed, please do it in a
separate patch or at least mention it in the commit message.

> +
> +PACKAGES =3D "fbv"
> +


Thanks,

Paul

--=-BgKNM62O6ScBT0NZUkHh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktWP24ACgkQPX1aK2wOHVgCJQCeJEHAWpftl3EOil1nsAedRBfl
6S0AmwVK6xarlrz9KaUQVtZ1rZugP6Xu
=RVcm
-----END PGP SIGNATURE-----

--=-BgKNM62O6ScBT0NZUkHh--
