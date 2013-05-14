Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UcEZb-00013I-7h
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 May 2013 14:43:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4ECP7Nq015449
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2013 05:25:07 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 14 May 2013 05:25:06 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id CEA577FCE	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2013 08:24:54 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 151AD410E3; Tue,
	14 May 2013 08:25:06 -0400 (EDT)
Date: Tue, 14 May 2013 08:25:06 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130514122505.GC3918@windriver.com>
References: <1368518279-8029-1-git-send-email-jukka.rissanen@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1368518279-8029-1-git-send-email-jukka.rissanen@linux.intel.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH v2] vpnc: Runtime dependency to perl was missing
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
X-List-Received-Date: Tue, 14 May 2013 12:43:30 -0000
X-Groupsio-MsgNum: 44706
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KDt/GgjP6HVcx58l"
Content-Disposition: inline

--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH v2] vpnc: Runtime dependency to perl was miss=
ing] On 13.05.14 (Tue 10:57) Jukka Rissanen wrote:

>=20
> Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
> ---
> This version now properly rdepends on perl-module-io-file instead of
> just the perl package.
>=20
> Cheers,
> Jukka
>=20
>  meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/me=
ta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> index 2ce9530..a73cd13 100644
> --- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> +++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
> @@ -6,7 +6,7 @@ PRIORITY =3D "optional"
>  LICENSE =3D "GPL-2.0+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D173b74cb8ac640a9992c03f3bce22=
a33"
>  DEPENDS =3D "libgcrypt"
> -RDEPENDS_${PN} =3D "kernel-module-tun"
> +RDEPENDS_${PN} =3D "kernel-module-tun perl-module-io-file"
> =20
>  CFLAGS_append =3D ' -DVERSION=3D\\"${PV}\\"'
>  LDFLAGS_append =3D " -lgcrypt -lgpg-error"

Given that I'd already merged your previous change (and Koen is
absolutely right, I should've pushed back on it too since I completely
agree with him) can you send out another version of this patch that
addresses his suggestion about reordering the R* variables and is
against the latest tree?  This one won't apply as the tree stands now.

Thanks.

--=20
-Joe MacDonald.
:wq

--KDt/GgjP6HVcx58l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlGSLSEACgkQPN8S4W6ZZncnswCfVMUE7Nk2PvVIfpOnn0EQVKmZ
i5kAnAjY/Mt5wdvM2szcTLaTGg2i51+p
=RdiS
-----END PGP SIGNATURE-----

--KDt/GgjP6HVcx58l--
