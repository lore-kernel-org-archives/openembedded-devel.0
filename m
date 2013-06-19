Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 28C92601AF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 18:13:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5JIDKO0008573
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 11:13:20 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 19 Jun 2013 11:13:19 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 7A4587FD0	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 14:12:58 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id DCE17410DF; Wed,
	19 Jun 2013 14:13:18 -0400 (EDT)
Date: Wed, 19 Jun 2013 14:13:18 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130619181318.GE8093@windriver.com>
References: <1371541796-3895-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1371541796-3895-1-git-send-email-net147@gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] cyrus-sasl: move plugin *.so symbolic links to cyrus-sasl package
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
X-List-Received-Date: Wed, 19 Jun 2013 18:13:19 -0000
X-Groupsio-MsgNum: 45163
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nHwqXXcoX0o6fKCv"
Content-Disposition: inline

--nHwqXXcoX0o6fKCv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH] cyrus-sasl: move plugin *.so symbolic links =
to cyrus-sasl package] On 13.06.18 (Tue 17:49) Jonathan Liu wrote:

> The Cyrus SASL plugins are loaded without their version number so the
> plugin *.so symbolic links need to be placed in the cyrus-sasl package
> rather than the cyrus-sasl-dev package.
>=20
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 6 ++++=
--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26=
=2Ebb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> index 0113025..bf6f95c 100644
> --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> @@ -36,8 +36,10 @@ SRC_URI[sha256sum] =3D "8fbc5136512b59bb793657f36fadda=
6359cae3b08f01fd16b3d406f134
> =20
>  PACKAGES =3D+ "${PN}-bin"
> =20
> -FILES_${PN}           +=3D "${libdir}/sasl2/*.so.*"
> +FILES_${PN}           +=3D "${libdir}/sasl2/*.so*"
>  FILES_${PN}-bin       +=3D "${bindir}"
> -FILES_${PN}-dev       +=3D "${libdir}/sasl2/*.so ${libdir}/sasl2/*.la"
> +FILES_${PN}-dev       +=3D "${libdir}/sasl2/*.la"
>  FILES_${PN}-dbg       +=3D "${libdir}/sasl2/.debug"
>  FILES_${PN}-staticdev +=3D "${libdir}/sasl2/*.a"
> +
> +INSANE_SKIP_${PN} +=3D "dev-so"

Merged, thanks.

--=20
-Joe MacDonald.
:wq

--nHwqXXcoX0o6fKCv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHB9L4ACgkQPN8S4W6ZZncPuACdEaVgShNk4tx8oo64bgGLkTSX
ifAAn1genTWAfWaHfY1z79EbRngz9N1Q
=8Wee
-----END PGP SIGNATURE-----

--nHwqXXcoX0o6fKCv--
