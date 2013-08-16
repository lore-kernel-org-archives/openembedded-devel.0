Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id D6E496B673
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2013 17:17:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7GHH5rY026295
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2013 13:17:06 -0400 (EDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 16 Aug 2013 10:17:05 -0700
Received: from yow-jmacdona-l1 (unknown [172.25.44.3])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id EE5127FE2;
	Fri, 16 Aug 2013 13:16:28 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id A0CCA40498; Fri,
	16 Aug 2013 13:17:02 -0400 (EDT)
Date: Fri, 16 Aug 2013 13:17:02 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <rongqing.li@windriver.com>
Message-ID: <20130816171702.GE13221@windriver.com>
References: <1376619839-23232-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1376619839-23232-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH meta-networking] quagga: two fixes
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
X-List-Received-Date: Fri, 16 Aug 2013 17:17:06 -0000
X-Groupsio-MsgNum: 45766
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="so9zsI5B81VjUb/o"
Content-Disposition: inline

--so9zsI5B81VjUb/o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[PATCH meta-networking] quagga: two fixes] On 13.08.16 (Fri 10:23) rongqin=
g.li@windriver.com wrote:

> From: "Roy.Li" <rongqing.li@windriver.com>
>=20
> 1. quagga should depend on iproute2, since ip from busybox is not suffici=
ent
> 2. fix a typOS(should chmod, not chown)
>=20
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>  meta-networking/recipes-protocols/quagga/quagga.inc |    9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-n=
etworking/recipes-protocols/quagga/quagga.inc
> index f5489c6..89b9f7a 100644
> --- a/meta-networking/recipes-protocols/quagga/quagga.inc
> +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
> @@ -5,7 +5,7 @@ Unix platforms, particularly FreeBSD, Linux, Solaris and =
NetBSD. \
>  Quagga is a fork of GNU Zebra which was developed by Kunihiro \
>  Ishiguro. The Quagga tree aims to build a more involved community \
>  around Quagga than the current centralised model of GNU Zebra."
> -HOMEPAGE =3D "http://www.quagga.net/"
> +HOMEPAGE =3D "http://www.nongnu.org/quagga/"
>  SECTION =3D "network"
>  LICENSE =3D "GPL-2.0 & LGPL-2.0"
>  DEPENDS =3D "readline ncurses perl-native"
> @@ -17,6 +17,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c=
2336e835926c2166c28b \
> =20
>  INC_PR =3D "r2"
> =20
> +# the "ip" command from busybox is not sufficient (flush by protocol flu=
shes all routes)
> +RDEPENDS_${PN} +=3D "iproute2"
> +
>  QUAGGASUBDIR =3D ""
>  # ${QUAGGASUBDIR} is deal with old versions. Set to "/attic" for old
>  # versions and leave it empty for recent versions.
> @@ -128,11 +131,11 @@ pkg_postinst_${PN} () {
>      if [ "x$D" !=3D "x" ] ; then
>          exit 1
>      fi
> -    for f in bgpd babeld isisd ospfd ripngd zebra ripd ospf6d; do touch =
${sysconfdir}/quagga/$f.conf; done
> +    for f in bgpd vtysh babeld isisd ospfd ripngd zebra ripd ospf6d; do =
touch ${sysconfdir}/quagga/$f.conf; done
>      chown quagga:quaggavty ${sysconfdir}/quagga
>      chown quagga:quagga ${sysconfdir}/quagga/*.conf
>      chmod 750 ${sysconfdir}/quagga
> -    chown 640 ${sysconfdir}/quagga/*.conf
> +    chmod 640 ${sysconfdir}/quagga/*.conf
>      if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
>          ${sysconfdir}/init.d/populate-volatile.sh update
>      fi
--=20
-Joe MacDonald.
:wq

--so9zsI5B81VjUb/o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlIOXo4ACgkQPN8S4W6ZZnfRrQCfTbbflbtJVp7Xgali6E/tDUqP
b1UAnRudNMp2BKPngwz3VnxXpx1ia1Tk
=EcS/
-----END PGP SIGNATURE-----

--so9zsI5B81VjUb/o--
