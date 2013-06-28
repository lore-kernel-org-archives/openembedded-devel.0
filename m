Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1829C6023E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2013 16:59:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5SGxCIs004113
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2013 09:59:13 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 28 Jun 2013 09:59:12 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 5D6C2A06C	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2013 12:59:06 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id B8016410DF; Fri,
	28 Jun 2013 12:59:11 -0400 (EDT)
Date: Fri, 28 Jun 2013 12:59:11 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130628165911.GB10011@windriver.com>
References: <1372043456-22739-1-git-send-email-raj.khem@gmail.com>
	<20130624124241.GA3823@windriver.com>
	<D4C3EBB5-5EE3-4F1E-9F9F-8CBB1CF8E962@gmail.com>
MIME-Version: 1.0
In-Reply-To: <D4C3EBB5-5EE3-4F1E-9F9F-8CBB1CF8E962@gmail.com>
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
X-List-Received-Date: Fri, 28 Jun 2013 16:59:12 -0000
X-Groupsio-MsgNum: 45244
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Content-Disposition: inline

--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking][PATCH] netcat-openbsd: Update to 1.105] On 13.0=
6.28 (Fri 09:42) Khem Raj wrote:

>=20
> On Jun 24, 2013, at 5:42 AM, Joe MacDonald <Joe.MacDonald@windriver.com> =
wrote:
>=20
> > [[oe] [meta-networking][PATCH] netcat-openbsd: Update to 1.105] On 13.0=
6.23 (Sun 20:10) Khem Raj wrote:
> >=20
> >> Add the missing dependency on libbsd
> >> it was not building otherwise. libbsd recipes for OE-Core
> >> has been ported please wait until they are applied
> >>=20
> >> | netcat.c:99:24: fatal error: bsd/stdlib.h: No such file or directory
> >> |  #include <bsd/stdlib.h>
> >> |                         ^
> >> | compilation terminated.
> >> | make: *** [netcat.o] Error 1
> >> | make: *** Waiting for unfinished jobs....
> >> | socks.c:41:32: fatal error: bsd/readpassphrase.h: No such file or di=
rectory
> >> |  #include <bsd/readpassphrase.h>
> >>=20
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >=20
> > Is there any option to disable the dependency on libbsd in the new
> > version?  If it's at all possible, I'd prefer to have this as an
> > optional dependency.
>=20
> No there isn't. After all It a bsd tool We can hack and chop and beat
> it to submission but thats exactly why libbsd shim exists to elegantly
> build BSD apps on linux without murdering them

I saw the related thread whereby libbsd got merged into oe-core, so my
only concern about this causing a bit of creep in the layer dependencies
for me has been resolved anyway, so I'm good with this.

I'm merging it now.  Thanks Khem.

-J.

>=20
> >=20
> > -J.
> >=20
> >> .../recipes-support/netcat/netcat-openbsd_1.105.bb |   31 ++++++++++++=
+++++++
> >> .../recipes-support/netcat/netcat-openbsd_1.89.bb  |   32 ------------=
--------
> >> 2 files changed, 31 insertions(+), 32 deletions(-)
> >> create mode 100644 meta-networking/recipes-support/netcat/netcat-openb=
sd_1.105.bb
> >> delete mode 100644 meta-networking/recipes-support/netcat/netcat-openb=
sd_1.89.bb
> >>=20
> >> diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.1=
05.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
> >> new file mode 100644
> >> index 0000000..8f6cc54
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
> >> @@ -0,0 +1,31 @@
> >> +require netcat.inc
> >> +DESCRIPTION =3D "OpenBSD Netcat"
> >> +HOMEPAGE =3D "http://ftp.debian.org"
> >> +LICENSE =3D "BSD-3-Clause"
> >> +
> >> +DEPENDS +=3D "glib-2.0 libbsd"
> >> +
> >> +SRC_URI =3D "${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${=
PV}.orig.tar.gz;name=3Dnetcat \
> >> +           ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV=
}-7.debian.tar.gz;name=3Dnetcat-patch"
> >> +
> >> +SRC_URI[netcat.md5sum] =3D "7e67b22f1ad41a1b7effbb59ff28fca1"
> >> +SRC_URI[netcat.sha256sum] =3D "40653fe66c1516876b61b07e093d826e2a5463=
c5d994f1b7e6ce328f3edb211e"
> >> +SRC_URI[netcat-patch.md5sum] =3D "e914f8eb7eda5c75c679dd77787ac76b"
> >> +SRC_URI[netcat-patch.sha256sum] =3D "eee759327ffea293e81d0dde67921b7f=
cfcad279ffd7a2c9d037bbc8f882b363"
> >> +
> >> +S =3D "${WORKDIR}/${BPN}-${PV}"
> >> +
> >> +do_configure[noexec] =3D "1"
> >> +
> >> +do_compile() {
> >> +    cd ${S}
> >> +    while read line; do patch -p1 < ${WORKDIR}/debian/patches/$line; =
done < ${WORKDIR}/debian/patches/series
> >> +    pkgrel=3D4
> >> +    oe_runmake CFLAGS=3D"$CFLAGS -DDEBIAN_VERSION=3D\"\\\"${pkgrel}\\=
\"\""
> >> +}
> >> +
> >> +do_install() {
> >> +    install -d ${D}${bindir}
> >> +    install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
> >> +}
> >> +ALTERNATIVE_PRIORITY =3D "50"
> >> diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.8=
9.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
> >> deleted file mode 100644
> >> index 0a30de6..0000000
> >> --- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
> >> +++ /dev/null
> >> @@ -1,32 +0,0 @@
> >> -require netcat.inc
> >> -DESCRIPTION =3D "OpenBSD Netcat"
> >> -HOMEPAGE =3D "http://ftp.debian.org"
> >> -LICENSE =3D "BSD-3-Clause"
> >> -PR =3D "r2"
> >> -
> >> -DEPENDS +=3D "glib-2.0"
> >> -
> >> -SRC_URI =3D "${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.=
89.orig.tar.gz;name=3Dnetcat \
> >> -           ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.89=
-4.diff.gz;name=3Dnetcat-patch"
> >> -
> >> -SRC_URI[netcat.md5sum] =3D "7238ce15aae43069e96ba7faf03f153e"
> >> -SRC_URI[netcat.sha256sum] =3D "72e844dde8a2a7cba61971d493758dbea9ef0b=
164bccef15fd4a36490dc77f2b"
> >> -SRC_URI[netcat-patch.md5sum] =3D "00c65aa22243b76998174c733cbb64cc"
> >> -SRC_URI[netcat-patch.sha256sum] =3D "d5b6b2bd9788114bdcfbb71acad02637=
20b4fdc41529e287adf451b8610f84f1"
> >> -
> >> -S =3D "${WORKDIR}/${BPN}-${PV}.orig"
> >> -
> >> -do_configure[noexec] =3D "1"
> >> -
> >> -do_compile() {
> >> -    cd ${S}
> >> -    while read line; do patch -p1 <debian/patches/$line; done <debian=
/patches/series
> >> -    pkgrel=3D4
> >> -    oe_runmake CFLAGS=3D"$CFLAGS -DDEBIAN_VERSION=3D\"\\\"${pkgrel}\\=
\"\""
> >> -}
> >> -
> >> -do_install() {
> >> -    install -d ${D}${bindir}
> >> -    install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
> >> -}
> >> -ALTERNATIVE_PRIORITY =3D "50"
> > --=20
> > -Joe MacDonald.
> > :wq
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
-Joe MacDonald.
:wq

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHNwN8ACgkQPN8S4W6ZZncHWgCfSV47AZ6rt/YHMunGeJ1WfIj2
IRMAmwTpHVl8LCqrzS6B0lnDUCUBSwFK
=G/IH
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--
