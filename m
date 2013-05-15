Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UcgPu-00056x-Ch
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 May 2013 20:27:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4FI8tVa016788
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2013 11:08:55 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 15 May 2013 11:08:56 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id A7A747FCE	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2013 14:08:42 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 4D505410E5; Wed,
	15 May 2013 14:08:55 -0400 (EDT)
Date: Wed, 15 May 2013 14:08:55 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130515180855.GG751@windriver.com>
References: <1368535670-26737-1-git-send-email-jukka.rissanen@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1368535670-26737-1-git-send-email-jukka.rissanen@linux.intel.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] vpnc: Set RDEPENDS to perl-module-io-file instead of perl
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
X-List-Received-Date: Wed, 15 May 2013 18:27:47 -0000
X-Groupsio-MsgNum: 44736
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1EKig6ypoSyM7jaD"
Content-Disposition: inline

--1EKig6ypoSyM7jaD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH] vpnc: Set RDEPENDS to perl-module-io-file in=
stead of perl] On 13.05.14 (Tue 15:47) Jukka Rissanen wrote:

>=20
> Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
> ---
>  meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/me=
ta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> index df90234..addd150 100644
> --- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> +++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> @@ -6,7 +6,6 @@ PRIORITY =3D "optional"
>  LICENSE =3D "GPL-2.0+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D173b74cb8ac640a9992c03f3bce22=
a33"
>  DEPENDS =3D "libgcrypt"
> -RDEPENDS_${PN} =3D "kernel-module-tun perl"
> =20
>  CFLAGS_append =3D ' -DVERSION=3D\\"${PV}\\"'
>  LDFLAGS_append =3D " -lgcrypt -lgpg-error"
> @@ -19,6 +18,7 @@ do_install () {
>  }
> =20
>  CONFFILES_${PN} =3D "${sysconfdir}/vpnc/default.conf"
> +RDEPENDS_${PN} =3D "kernel-module-tun perl-module-io-file"
> =20
>  SRC_URI =3D "http://www.unix-ag.uni-kl.de/~massar/vpnc/vpnc-${PV}.tar.gz=
 \
>             file://makeman.patch \

Merged, thanks.

--=20
-Joe MacDonald.
:wq

--1EKig6ypoSyM7jaD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlGTzzYACgkQPN8S4W6ZZnfhPACdGjoRHyRY/xQ/hgfYbvf5lU0B
BMUAnjDPPvj5aj4yATgfNRHgJAWoRyOE
=Xk3I
-----END PGP SIGNATURE-----

--1EKig6ypoSyM7jaD--
