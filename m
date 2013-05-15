Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UcgQP-000585-DC
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 May 2013 20:27:47 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4FI9Rn0025293
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2013 11:09:27 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 15 May 2013 11:09:27 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id C4D567FCE	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2013 14:09:13 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 78225410E5; Wed,
	15 May 2013 14:09:26 -0400 (EDT)
Date: Wed, 15 May 2013 14:09:26 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130515180926.GH751@windriver.com>
References: <1368391699-1402-1-git-send-email-schnitzeltony@googlemail.com>
	<1368391699-1402-5-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1368391699-1402-5-git-send-email-schnitzeltony@googlemail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe/meta-network/meta-gnome 4/4] proftpd: pack missing files
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
X-List-Received-Date: Wed, 15 May 2013 18:28:04 -0000
X-Groupsio-MsgNum: 44737
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/8E7gjuj425jZz9t"
Content-Disposition: inline

--/8E7gjuj425jZz9t
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-oe/meta-network/meta-gnome 4/4] proftpd: pack missing files] On=
 13.05.12 (Sun 22:48) Andreas M=FCller wrote:

> WARNING: QA Issue: proftpd: Files/directories were installed but not ship=
ped
>   /home
>   /home/ftp
>   /home/ftp/pub
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../recipes-daemons/proftpd/proftpd_1.3.4b.bb      |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb b/=
meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> index 806413b..3c48422 100644
> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "http://www.proftpd.org"
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfb0d1484d11915fa88a6a7702f1dc=
184"
> =20
> -PR =3D "r2"
> +PR =3D "r3"
> =20
>  SRC_URI =3D "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
>             file://make.patch \
> @@ -59,3 +59,5 @@ INITSCRIPT_PARAM =3D "defaults 85 15"
>  USERADD_PACKAGES =3D "${PN}"
>  GROUPADD_PARAM_${PN} =3D "${FTPGROUP}"
>  USERADD_PARAM_${PN} =3D "--system -g ${FTPGROUP} ${FTPUSER}"
> +
> +FILES_${PN} +=3D "/home/${FTPUSER}"

I only merged this one from the series.

--=20
-Joe MacDonald.
:wq

--/8E7gjuj425jZz9t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlGTz1YACgkQPN8S4W6ZZnfMzgCfVFkJzeQ1UcAl/Gv01me4pRSj
eJcAnAr/dwUlJzH+Q6+aRGiWrECovTH/
=ZLrQ
-----END PGP SIGNATURE-----

--/8E7gjuj425jZz9t--
