Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF0E609B9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2013 12:42:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5OCgiP1001339
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2013 05:42:44 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 24 Jun 2013 05:42:42 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 2D09D7FE7	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2013 08:42:41 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 945A4410DF; Mon,
	24 Jun 2013 08:42:41 -0400 (EDT)
Date: Mon, 24 Jun 2013 08:42:41 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130624124241.GA3823@windriver.com>
References: <1372043456-22739-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1372043456-22739-1-git-send-email-raj.khem@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] netcat-openbsd: Update to 1.105
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Jun 2013 12:42:43 -0000
X-Groupsio-MsgNum: 45210
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH] netcat-openbsd: Update to 1.105] On 13.06.23=
 (Sun 20:10) Khem Raj wrote:

> Add the missing dependency on libbsd
> it was not building otherwise. libbsd recipes for OE-Core
> has been ported please wait until they are applied
>=20
> | netcat.c:99:24: fatal error: bsd/stdlib.h: No such file or directory
> |  #include <bsd/stdlib.h>
> |                         ^
> | compilation terminated.
> | make: *** [netcat.o] Error 1
> | make: *** Waiting for unfinished jobs....
> | socks.c:41:32: fatal error: bsd/readpassphrase.h: No such file or direc=
tory
> |  #include <bsd/readpassphrase.h>
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

Is there any option to disable the dependency on libbsd in the new
version?  If it's at all possible, I'd prefer to have this as an
optional dependency.

-J.

>  .../recipes-support/netcat/netcat-openbsd_1.105.bb |   31 ++++++++++++++=
+++++
>  .../recipes-support/netcat/netcat-openbsd_1.89.bb  |   32 --------------=
------
>  2 files changed, 31 insertions(+), 32 deletions(-)
>  create mode 100644 meta-networking/recipes-support/netcat/netcat-openbsd=
_1.105.bb
>  delete mode 100644 meta-networking/recipes-support/netcat/netcat-openbsd=
_1.89.bb
>=20
> diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.=
bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
> new file mode 100644
> index 0000000..8f6cc54
> --- /dev/null
> +++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
> @@ -0,0 +1,31 @@
> +require netcat.inc
> +DESCRIPTION =3D "OpenBSD Netcat"
> +HOMEPAGE =3D "http://ftp.debian.org"
> +LICENSE =3D "BSD-3-Clause"
> +
> +DEPENDS +=3D "glib-2.0 libbsd"
> +
> +SRC_URI =3D "${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}=
=2Eorig.tar.gz;name=3Dnetcat \
> +           ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}-7=
=2Edebian.tar.gz;name=3Dnetcat-patch"
> +
> +SRC_URI[netcat.md5sum] =3D "7e67b22f1ad41a1b7effbb59ff28fca1"
> +SRC_URI[netcat.sha256sum] =3D "40653fe66c1516876b61b07e093d826e2a5463c5d=
994f1b7e6ce328f3edb211e"
> +SRC_URI[netcat-patch.md5sum] =3D "e914f8eb7eda5c75c679dd77787ac76b"
> +SRC_URI[netcat-patch.sha256sum] =3D "eee759327ffea293e81d0dde67921b7fcfc=
ad279ffd7a2c9d037bbc8f882b363"
> +
> +S =3D "${WORKDIR}/${BPN}-${PV}"
> +
> +do_configure[noexec] =3D "1"
> +
> +do_compile() {
> +    cd ${S}
> +    while read line; do patch -p1 < ${WORKDIR}/debian/patches/$line; don=
e < ${WORKDIR}/debian/patches/series
> +    pkgrel=3D4
> +    oe_runmake CFLAGS=3D"$CFLAGS -DDEBIAN_VERSION=3D\"\\\"${pkgrel}\\\"\=
""
> +}
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
> +}
> +ALTERNATIVE_PRIORITY =3D "50"
> diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.b=
b b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
> deleted file mode 100644
> index 0a30de6..0000000
> --- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -require netcat.inc
> -DESCRIPTION =3D "OpenBSD Netcat"
> -HOMEPAGE =3D "http://ftp.debian.org"
> -LICENSE =3D "BSD-3-Clause"
> -PR =3D "r2"
> -
> -DEPENDS +=3D "glib-2.0"
> -
> -SRC_URI =3D "${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.89.=
orig.tar.gz;name=3Dnetcat \
> -           ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.89-4.=
diff.gz;name=3Dnetcat-patch"
> -
> -SRC_URI[netcat.md5sum] =3D "7238ce15aae43069e96ba7faf03f153e"
> -SRC_URI[netcat.sha256sum] =3D "72e844dde8a2a7cba61971d493758dbea9ef0b164=
bccef15fd4a36490dc77f2b"
> -SRC_URI[netcat-patch.md5sum] =3D "00c65aa22243b76998174c733cbb64cc"
> -SRC_URI[netcat-patch.sha256sum] =3D "d5b6b2bd9788114bdcfbb71acad0263720b=
4fdc41529e287adf451b8610f84f1"
> -
> -S =3D "${WORKDIR}/${BPN}-${PV}.orig"
> -
> -do_configure[noexec] =3D "1"
> -
> -do_compile() {
> -    cd ${S}
> -    while read line; do patch -p1 <debian/patches/$line; done <debian/pa=
tches/series
> -    pkgrel=3D4
> -    oe_runmake CFLAGS=3D"$CFLAGS -DDEBIAN_VERSION=3D\"\\\"${pkgrel}\\\"\=
""
> -}
> -
> -do_install() {
> -    install -d ${D}${bindir}
> -    install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
> -}
> -ALTERNATIVE_PRIORITY =3D "50"
--=20
-Joe MacDonald.
:wq

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHIPr4ACgkQPN8S4W6ZZncT4gCeKy/fEjHXeI86bnVlNpKzPtu5
gXsAn07/SIYs9jxHpb8Kilv88Pi5W3Xk
=b4rq
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
