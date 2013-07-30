Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B52676B478
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2013 18:06:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6UI6HUt017641
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2013 11:06:17 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 30 Jul 2013 11:06:15 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 98C9D7FE2	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jul 2013 14:05:59 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 49D43404D6; Tue,
	30 Jul 2013 14:06:13 -0400 (EDT)
Date: Tue, 30 Jul 2013 14:06:13 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130730180613.GJ3667@windriver.com>
References: <1374848456-19550-1-git-send-email-mihai.prica@intel.com>
MIME-Version: 1.0
In-Reply-To: <1374848456-19550-1-git-send-email-mihai.prica@intel.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH] ebtables: Load ebtables kernel module
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
X-List-Received-Date: Tue, 30 Jul 2013 18:06:15 -0000
X-Groupsio-MsgNum: 45526
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AXxEqdD4tcVTjWte"
Content-Disposition: inline

--AXxEqdD4tcVTjWte
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] ebtables: Load ebtables kernel module] On 13=
=2E07.26 (Fri 17:20) Mihai Prica wrote:

> Ebtables needs some kernel configs options to work properly. The standard=
 yocto
> kernel config includes these as modules. Add code to load the ebtables mo=
dule.
>=20
> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> ---
>  .../recipes-filter/ebtables/ebtables_2.0.10-4.bb   |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb=
 b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> index 78e069a..6ac886e 100644
> --- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> +++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> @@ -2,10 +2,13 @@ SUMMARY =3D "Utility for basic Ethernet frame filtering=
 on a Linux bridge, MAC NAT
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D53b4a999993871a28ab1488fdbd2e=
73e"
>  SECTION =3D "console/network"
> -PR =3D "r2"
> +PR =3D "r3"
> =20
>  RDEPENDS_${PN} +=3D "perl"
> =20
> +RRECOMMENDS_${PN} +=3D "kernel-module-ebtables \
> +    "
> +
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
>             file://installnonroot.patch \
>             file://01debian_defaultconfig.patch \
--=20
-Joe MacDonald.
:wq

--AXxEqdD4tcVTjWte
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlH4AJQACgkQPN8S4W6ZZndwJQCeICP5uMXm4vZKjjo15Q2+lseL
zIIAn0PHrDSW2VZ/0AsS3rPmw1xyZHQH
=Ciy8
-----END PGP SIGNATURE-----

--AXxEqdD4tcVTjWte--
