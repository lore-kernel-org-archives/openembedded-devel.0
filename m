Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4AD3877029
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Sep 2016 20:44:49 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1biSfI-0003qA-9V from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2016 13:44:48 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.3.224.2; Fri, 9 Sep 2016
	13:44:47 -0700
Received: by burninator (Postfix, from userid 1000)	id 7263C580D7D; Fri,  9
	Sep 2016 16:44:46 -0400 (EDT)
Date: Fri, 9 Sep 2016 16:44:46 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20160909204446.GB5631@mentor.com>
References: <cover.1473388166.git.jackie.huang@windriver.com>
	<b21847dcc8605a8522be2bea1c0a1b4788cf841e.1473388166.git.jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <b21847dcc8605a8522be2bea1c0a1b4788cf841e.1473388166.git.jackie.huang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH 2/2 v2] samba: restrict the blacklist to ARM only
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
X-List-Received-Date: Fri, 09 Sep 2016 20:44:51 -0000
X-Groupsio-MsgNum: 63043
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline

--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[oe] [meta-networking][PATCH 2/2 v2] samba: restrict the blacklist to ARM =
only] On 16.09.09 (Fri 10:34) jackie.huang@windriver.com wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> It builds fine except for arm now, and the do_package
> and libpam issue is fixed by:
> "waf-samba.bbclass: Add PACKAGECONFIG_CONFARGS to CONFIGUREOPTS"

Did you confirm that you're still seeing the failure for arm?

-J.

>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/=
meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> index 042203e..c34adcb 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> @@ -319,6 +319,6 @@ RDEPENDS_${PN}-pidl_append =3D " perl"
>  FILES_${PN}-pidl =3D "${bindir}/pidl ${datadir}/perl5/Parse"
> =20
>  # http://errors.yoctoproject.org/Errors/Details/81004/
> -# before this issue it was also failing in do_package and
> -# autodetecting libpam dependency
> -PNBLACKLIST[samba] ?=3D "BROKEN: fails to build with new binutils-2.27"
> +BLACKLIST_REASON ?=3D ""
> +BLACKLIST_REASON_arm =3D "BROKEN: fails to build with new binutils-2.27"
> +PNBLACKLIST[samba] ?=3D "${BLACKLIST_REASON}"
> --=20
> 2.8.3
>=20
--=20
-Joe MacDonald.
:wq

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJX0x8+AAoJEEn8ffcsOfaWOy4IAIjZv6pE9TZdsPoYhKPhuS4/
sZk3xEHn+u6AdkGdIsuuI9fKdyqPtowBD2rdu7TDio//43KOtN4EOEpzMvwCqPPv
G2FAFxLj+Rv0ZkKwpItcrUf4XiJIydL011ZdxaCl4Sc+Ar/raheViAwlA5kbOVMh
QAs9rhH9LzpPO2WM5yY0v/K8lDwtDQI6e2s/J/M5PQA2gHAug081M6cdWfTfj4ON
VVm0kz2+JlWYuhu8ROVpqsmFEXzClbi/h3pD46Adp/zu2jF01s57yAvCR9iQWjJY
Bq5uwXOWtxK18obvDIoDShypSk2NZ+RbY9gLU1/TgBlVCkDWJTaFpt58WO8BVUs=
=Fx/G
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
