Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEdNv-00071c-ES for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 10:12:39 +0200
Received: from f053033081.adsl.alicedsl.de ([78.53.33.81]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QEdMH-0002Di-CJ for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 08:10:57 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1303760088-28474-1-git-send-email-sgh@sgh.dk>
References: <1303760088-28474-1-git-send-email-sgh@sgh.dk>
Date: Tue, 26 Apr 2011 10:10:10 +0200
Message-ID: <1303805410.4073.15.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] wvstreams: Cleaned up recipe.
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
X-List-Received-Date: Tue, 26 Apr 2011 08:12:39 -0000
X-Groupsio-MsgNum: 31462
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-r3k+r1rzZUayzAbS+0Ew"

--=-r3k+r1rzZUayzAbS+0Ew
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear S=C3=B8ren,


Am Montag, den 25.04.2011, 21:34 +0200 schrieb S=C3=B8ren Holm:
> * Corrected license.
> * Added dbus support.

at least the addition DBus support is not a clean up in my opinion and
should be an extra patch.

> * Made PAM-support conditional.

I would make a commit/patch for each change, but other developers
disagree with me in that point.

> ---
>  recipes/wvstreams/wvstreams_4.6.1.bb |   21 +++++++--------------
>  1 files changed, 7 insertions(+), 14 deletions(-)
>=20
> diff --git a/recipes/wvstreams/wvstreams_4.6.1.bb b/recipes/wvstreams/wvs=
treams_4.6.1.bb
> index 53249d4..8453e08 100644
> --- a/recipes/wvstreams/wvstreams_4.6.1.bb
> +++ b/recipes/wvstreams/wvstreams_4.6.1.bb
> @@ -1,9 +1,10 @@
>  HOMEPAGE =3D "http://alumnit.ca/wiki/index.php?page=3DWvStreams"
> -LICENSE =3D "LGPL"
> +LICENSE =3D "LGPLv2.1"
>  DESCRIPTION =3D "WvStreams is a network programming library in C++"
> -DEPENDS =3D "zlib openssl (>=3D 0.9.8)"
> +DEPENDS =3D "zlib openssl dbus"
> +DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d=
)}"
> =20
> -PR =3D "r0"
> +PR =3D "r1"
> =20
>  SRC_URI =3D "http://wvstreams.googlecode.com/files/${PN}-${PV}.tar.gz \
>  	file://0001-Fixed-missing-header-includes.patch \
> @@ -13,13 +14,10 @@ inherit autotools pkgconfig
> =20
>  LDFLAGS_append =3D " -Wl,-rpath-link,${TOOLCHAIN_PATH}/${TARGET_SYS}/lib=
"
> =20
> -# dbus detection currently broken in configure.ac; remember to add "dbus=
 (>=3D 1.2.14)" to DEPENDS  when fixed
> -EXTRA_OECONF =3D " --without-tcl --without-qt --without-pam --without-db=
us"
> +EXTRA_OECONF =3D " --without-tcl --without-qt --with-dbus"
> +EXTRA_OECONF +=3D ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam=
', '--without-pam', d)}
> =20
> -PACKAGES_prepend =3D "libuniconf libuniconf-dbg "
> -PACKAGES_prepend =3D "uniconfd uniconfd-dbg "
> -PACKAGES_prepend =3D "libwvstreams-base libwvstreams-base-dbg "
> -PACKAGES_prepend =3D "libwvstreams-extras libwvstreams-extras-dbg "
> +PACKAGES +=3D "libuniconf libuniconf-dbg uniconfd uniconfd-dbg libwvstre=
ams-base libwvstreams-base-dbg libwvstreams-extras libwvstreams-extras-dbg"
> =20
>  FILES_libuniconf     =3D "${libdir}/libuniconf.so.*"
>  FILES_libuniconf-dbg =3D "${libdir}/.debug/libuniconf.so.*"
> @@ -35,10 +33,5 @@ FILES_libwvstreams-extras-dbg =3D "${libdir}/.debug/li=
bwvbase.so.* ${libdir}/.debu
> =20
>  PARALLEL_MAKE =3D ""
> =20
> -do_configure() {
> -        autoreconf
> -        oe_runconf
> -}
> -

Can you think of a reason, why Khem did not use the default autotools
configure when adding the recipe? I am adding him to CC.

>  SRC_URI[md5sum] =3D "2760dac31a43d452a19a3147bfde571c"
>  SRC_URI[sha256sum] =3D "8403f5fbf83aa9ac0c6ce15d97fd85607488152aa84e007b=
7d0621b8ebc07633"


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D6cb210a=
ccf55894d2bee00260c2bcc83ab3440c0

--=-r3k+r1rzZUayzAbS+0Ew
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk22feIACgkQPX1aK2wOHVhtLACfSeua95/FOEcW0w/2chpCetVw
FrIAn2oVGHVDzSbeCQcC0krJ+Ib71ucI
=uGne
-----END PGP SIGNATURE-----

--=-r3k+r1rzZUayzAbS+0Ew--
