Received: from cpe.ge-0-2-0-951.faaqnqu1.customer.tele.dk ([93.167.193.22]
	helo=mail.mikrofyn.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgh@sgh.dk>) id 1QEd82-0006SY-Iq
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Apr 2011 09:56:14 +0200
Received: from koontz.localnet ([10.115.0.175]) by mail.mikrofyn.com with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 26 Apr 2011 09:58:32 +0200
From: =?iso-8859-1?q?S=F8ren_Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Apr 2011 09:53:45 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic; KDE/4.6.2; i686; ; )
References: <1303760088-28474-1-git-send-email-sgh@sgh.dk>
In-Reply-To: <1303760088-28474-1-git-send-email-sgh@sgh.dk>
MIME-Version: 1.0
Message-Id: <201104260953.46026.sgh@sgh.dk>
X-OriginalArrivalTime: 26 Apr 2011 07:58:32.0906 (UTC)
	FILETIME=[BCEFC2A0:01CC03E7]
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
X-List-Received-Date: Tue, 26 Apr 2011 07:56:14 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I forgot

Signed-off-by: S=F8ren Holm <sgh@sgh.dk>

Mandag 25 april 2011 21:34:48 skrev S=F8ren Holm:
> * Corrected license.
> * Added dbus support.
> * Made PAM-support conditional.
> ---
>  recipes/wvstreams/wvstreams_4.6.1.bb |   21 +++++++--------------
>  1 files changed, 7 insertions(+), 14 deletions(-)
>=20
> diff --git a/recipes/wvstreams/wvstreams_4.6.1.bb
> b/recipes/wvstreams/wvstreams_4.6.1.bb index 53249d4..8453e08 100644
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
>=20
> -PR =3D "r0"
> +PR =3D "r1"
>=20
>  SRC_URI =3D "http://wvstreams.googlecode.com/files/${PN}-${PV}.tar.gz \
>  	file://0001-Fixed-missing-header-includes.patch \
> @@ -13,13 +14,10 @@ inherit autotools pkgconfig
>=20
>  LDFLAGS_append =3D " -Wl,-rpath-link,${TOOLCHAIN_PATH}/${TARGET_SYS}/lib"
>=20
> -# dbus detection currently broken in configure.ac; remember to add "dbus
> (>=3D 1.2.14)" to DEPENDS  when fixed -EXTRA_OECONF =3D " --without-tcl
> --without-qt --without-pam --without-dbus" +EXTRA_OECONF =3D " --without-=
tcl
> --without-qt --with-dbus"
> +EXTRA_OECONF +=3D ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam=
',
> '--without-pam', d)}
>=20
> -PACKAGES_prepend =3D "libuniconf libuniconf-dbg "
> -PACKAGES_prepend =3D "uniconfd uniconfd-dbg "
> -PACKAGES_prepend =3D "libwvstreams-base libwvstreams-base-dbg "
> -PACKAGES_prepend =3D "libwvstreams-extras libwvstreams-extras-dbg "
> +PACKAGES +=3D "libuniconf libuniconf-dbg uniconfd uniconfd-dbg
> libwvstreams-base libwvstreams-base-dbg libwvstreams-extras
> libwvstreams-extras-dbg"
>=20
>  FILES_libuniconf     =3D "${libdir}/libuniconf.so.*"
>  FILES_libuniconf-dbg =3D "${libdir}/.debug/libuniconf.so.*"
> @@ -35,10 +33,5 @@ FILES_libwvstreams-extras-dbg =3D
> "${libdir}/.debug/libwvbase.so.* ${libdir}/.debu
>=20
>  PARALLEL_MAKE =3D ""
>=20
> -do_configure() {
> -        autoreconf
> -        oe_runconf
> -}
> -
>  SRC_URI[md5sum] =3D "2760dac31a43d452a19a3147bfde571c"
>  SRC_URI[sha256sum] =3D
> "8403f5fbf83aa9ac0c6ce15d97fd85607488152aa84e007b7d0621b8ebc07633"

=2D-=20
S=F8ren Holm


