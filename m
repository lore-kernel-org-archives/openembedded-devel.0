Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QB5aT-0005c5-1x for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 15:30:57 +0200
Received: from f053044057.adsl.alicedsl.de ([78.53.44.57]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QB5Ye-000808-4b for openembedded-devel@lists.openembedded.org;
	Sat, 16 Apr 2011 13:29:04 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1302885760-32195-1-git-send-email-patda293@student.liu.se>
References: <1302885760-32195-1-git-send-email-patda293@student.liu.se>
Date: Sat, 16 Apr 2011 15:28:39 +0200
Message-ID: <1302960519.20934.5.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH v2] firefox: Added libIDL-2.0 CFLAGS and LIBS
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
X-List-Received-Date: Sat, 16 Apr 2011 13:30:57 -0000
X-Groupsio-MsgNum: 31221
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-iwlnm8+/bmT1d4bt2eea"

--=-iwlnm8+/bmT1d4bt2eea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Patrik,


Am Freitag, den 15.04.2011, 18:42 +0200 schrieb Patrik Dahlstr=C3=B6m:
> * autoconf does not fill in any CFLAGS or LIBS for libIDL-2.0. This
>   patch sets the appropriate flags in autoconf.mk.in for
>   HOST_LIBIDL_CFLAGS and HOST_LIBIDL_LIBS.
>=20
> Signed-off-by: Patrik Dahlstr=C3=B6m <patda293@student.liu.se>
> ---
>  recipes/mozilla/firefox_3.6.8.bb |    7 +++++--
>  1 files changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/mozilla/firefox_3.6.8.bb b/recipes/mozilla/firefox_3=
.6.8.bb
> index 04dde08..828822c 100644
> --- a/recipes/mozilla/firefox_3.6.8.bb
> +++ b/recipes/mozilla/firefox_3.6.8.bb
> @@ -28,6 +28,7 @@ SRC_URI[archive.md5sum] =3D "0ee5f14fd8be07513d16131027=
ebcb61"
>  SRC_URI[archive.sha256sum] =3D "fc609cc6a0ddaa2a9ebd8511ec39ae4a404e1107=
a12e07b233e2afca51d9a10e"
> =20
>  S =3D "${WORKDIR}/mozilla-1.9.2"
> +export PKG_CONFIG=3D${STAGING_BINDIR_NATIVE}/pkg-config

is that line really needed?

>  inherit mozilla
>  require firefox.inc
> @@ -37,7 +38,9 @@ EXTRA_OECONF +=3D " --enable-official-branding --disabl=
e-crashreporter"
>  FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer -f=
rename-registers -O2"
> =20
>  do_compile_prepend() {
> -	cp ${WORKDIR}/jsautocfg.h ${S}/js/src/
> -	sed -i "s|CPU_ARCH =3D|CPU_ARCH =3D ${TARGET_ARCH}|" security/coreconf/=
Linux.mk
> +    cp ${WORKDIR}/jsautocfg.h ${S}/js/src/
> +    sed -i "s|CPU_ARCH =3D|CPU_ARCH =3D ${TARGET_ARCH}|" security/coreco=
nf/Linux.mk
> +    sed -i "s|HOST_LIBIDL_CFLAGS =3D \@HOST_LIBIDL_CFLAGS\@|HOST_LIBIDL_=
CFLAGS =3D $(pkg-config --cflags libIDL-2.0)|" config/autoconf.mk.in
> +    sed -i "s|HOST_LIBIDL_LIBS   =3D @HOST_LIBIDL_LIBS@|HOST_LIBIDL_LIBS=
 =3D $(pkg-config --libs libIDL-2.0)|" config/autoconf.mk.in
>  }

Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>

Is that bug fixed in newer releases of Firefox?


Thanks,

Paul

--=-iwlnm8+/bmT1d4bt2eea
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2pmYcACgkQPX1aK2wOHViXBwCfZaaINwR5i0PjsqG/LPEUd3HC
VOAAoIp3ZIKfqEmUErGR1QW2XnzNUW9C
=HmBv
-----END PGP SIGNATURE-----

--=-iwlnm8+/bmT1d4bt2eea--
