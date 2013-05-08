Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1Ua8lk-00059C-72
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 May 2013 20:07:14 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r48Hn70F029287
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 May 2013 10:49:07 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 8 May 2013 10:49:07 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 101677FD0;
	Wed,  8 May 2013 13:49:02 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id B72CA410E6; Wed,
	8 May 2013 13:49:06 -0400 (EDT)
Date: Wed, 8 May 2013 13:49:06 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20130508174906.GC9137@windriver.com>
References: <1368034148-3512-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1368034148-3512-1-git-send-email-otavio@ossystems.com.br>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][meta-networking PATCH] cifs-utils: Add runtime recommendation to CIFS kernel module
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
X-List-Received-Date: Wed, 08 May 2013 18:07:18 -0000
X-Groupsio-MsgNum: 44639
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="48TaNjbzBVislYPb"
Content-Disposition: inline

--48TaNjbzBVislYPb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-oe][meta-networking PATCH] cifs-utils: Add runtime recommendati=
on to CIFS kernel module] On 13.05.08 (Wed 14:29) Otavio Salvador wrote:

> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> Note: This patch has been tested in master and danny. Please
>       consider it for master, dylan and danny branches.
>=20
>  meta-networking/recipes-support/cifs/cifs-utils_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-networking/recipes-support/cifs/cifs-utils_git.bb b/met=
a-networking/recipes-support/cifs/cifs-utils_git.bb
> index 19b60ad..de2786a 100644
> --- a/meta-networking/recipes-support/cifs/cifs-utils_git.bb
> +++ b/meta-networking/recipes-support/cifs/cifs-utils_git.bb
> @@ -5,6 +5,7 @@ LICENSE =3D "GPLv3 & LGPLv3"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> =20
>  PV =3D "5.9"
> +PR =3D "r1"

For the sake of one patch in all branches, I think we're okay, but in
master we don't actually need PR anymore, do we?

-J.

> =20
>  SRCREV =3D "353d491dcb5d69d31434abeb962c8e9a49c36867"
>  SRC_URI =3D "git://git.samba.org/cifs-utils.git"
> @@ -18,3 +19,5 @@ do_install_append() {
>      # is installed to /sbin
>      rmdir ${D}${bindir} ${D}${sbindir}
>  }
> +
> +RRECOMMENDS_${PN} =3D "kernel-module-cifs"
--=20
-Joe MacDonald.
:wq

--48TaNjbzBVislYPb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlGKkBIACgkQPN8S4W6ZZndgHACfTQI1YVZlkIczCZGz/hlrT3gR
bNMAn3CvltC64CJkt6yP2VeDrm7mA3p8
=Oc2S
-----END PGP SIGNATURE-----

--48TaNjbzBVislYPb--
