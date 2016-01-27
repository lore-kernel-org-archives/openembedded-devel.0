Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id CC50D731A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 06:04:27 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1aOJDP-0002pm-J0 from Joe_MacDonald@mentor.com ;
	Tue, 26 Jan 2016 22:04:27 -0800
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 26 Jan 2016 22:04:27 -0800
Received: by burninator (Postfix, from userid 1000)	id A0145580899; Tue, 26
	Jan 2016 22:04:25 -0800 (PST)
Date: Tue, 26 Jan 2016 22:04:25 -0800
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Stephen Arnold <sarnold@vctlabs.com>
Message-ID: <20160127060425.GA4039@mentor.com>
References: <1453858161-27358-1-git-send-email-sarnold@vctlabs.com>
MIME-Version: 1.0
In-Reply-To: <1453858161-27358-1-git-send-email-sarnold@vctlabs.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] net-snmp: fix cross-compile breakage, add libnl pkgconfig option
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jan 2016 06:04:30 -0000
X-Groupsio-MsgNum: 59713
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ew6BAiZeqk4r7MaW"
Content-Disposition: inline

--ew6BAiZeqk4r7MaW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH] net-snmp: fix cross-compile breakage, add li=
bnl pkgconfig option] On 16.01.26 (Tue 17:29) Stephen Arnold wrote:

> From: Stephen Arnold <stephen.arnold42@gmail.com>
>=20
> This patch enhances a previously unapplied patch on jethro, plus adds
> some flexibility in terms of required deps and a few cleanups.
>=20
> Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
> ---
>  meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 10 ++++++=
++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb=
 b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> index b32d842..93eb025 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> @@ -27,7 +27,7 @@ SRC_URI[sha256sum] =3D "e8dfc79b6539b71a6ff335746ce63d2=
da2239062ad41872fff4354cafe
> =20
>  inherit autotools update-rc.d siteinfo systemd pkgconfig
> =20
> -EXTRA_OEMAKE =3D "INSTALL_PREFIX=3D${D}"
> +EXTRA_OEMAKE =3D "INSTALL_PREFIX=3D${D} OTHERLDFLAGS=3D'${LDFLAGS}' HOST=
_CPPFLAGS=3D'${BUILD_CPPFLAGS}'"
> =20
>  PARALLEL_MAKE =3D ""
>  CCACHE =3D ""
> @@ -36,12 +36,13 @@ TARGET_CC_ARCH +=3D "${LDFLAGS}"
> =20
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[elfutils] =3D "--with-elf, --without-elf, elfutils"
> +PACKAGECONFIG[libnl] =3D "--with-nl, --without-nl, libnl"
> =20
>  EXTRA_OECONF =3D "--disable-embedded-perl \
>                  --with-perl-modules=3Dno \
> -                --enable-shared \

Why this change?

-J.

>                  --disable-manuals \
>                  --with-defaults \
> +                --with-install-prefix=3D${D} \
>                  --with-persistent-directory=3D${localstatedir}/lib/net-s=
nmp \
>                  ${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--with=
-endianness=3Dlittle', '--with-endianness=3Dbig', d)}"
> =20
> @@ -51,10 +52,15 @@ EXTRA_OECONF +=3D "--with-mib-modules=3Dsmux"
>  CACHED_CONFIGUREVARS =3D " \
>      ac_cv_header_valgrind_valgrind_h=3Dno \
>      ac_cv_header_valgrind_memcheck_h=3Dno \
> +    ac_cv_ETC_MNTTAB=3D/etc/mtab \
> +    lt_cv_shlibpath_overrides_runpath=3Dyes \
>  "
> =20
>  do_configure_prepend() {
>      export PERLPROG=3D"${bindir}/env perl"
> +    sed -i -e "s|I/usr/include|I${STAGING_INCDIR}|g" \
> +        "${S}"/configure \
> +        "${S}"/configure.d/config_os_libs2
>  }
> =20
>  do_install_append() {
> --=20
> 2.6.4
>=20
--=20
-Joe MacDonald.
:wq

--ew6BAiZeqk4r7MaW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJWqF3lAAoJEEn8ffcsOfaWCToH/RUet+x3maQSd1lycJMXlKOX
xfNyPVgl9z64TWvSAh8V0I3yhfBQMSjzgsma3Zz48YHYMsVykbFyEttE4RRbLS3M
4HfoqY8VzsvOmEdcWAM+aV5JkHPxLqIJh45UclUVtx7UDcrX3WHhkDOK1xxOQGkC
fRKoEJ07peLxjZh0gPFN7stiooeNnyvx7kn9LfnNPFI4fRcueLKHNqVEZ92u9xsy
tvM4xTc4+fFFpNpFIahR8PO43cgLJWa9HFmzaV9QiVIlsHtNsxt2WU397GO4bROK
I71Bv++t3GzPynraz3+ptoM63nnf1nGMO44oHEYGEqOrLBf4eA6yqxg2M5R4T+g=
=Krw3
-----END PGP SIGNATURE-----

--ew6BAiZeqk4r7MaW--
