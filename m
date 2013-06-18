Return-Path: <Joe.MacDonald@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 506E3608A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 12:35:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5ICZIuW008648
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 05:35:18 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 18 Jun 2013 05:35:18 -0700
Received: from yow-jmacdona-l1 (yow-jmacdona-d2.wrs.com [128.224.146.166])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 7C7E37FD0;
	Tue, 18 Jun 2013 08:34:58 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 83C2640534; Tue,
	18 Jun 2013 08:35:17 -0400 (EDT)
Date: Tue, 18 Jun 2013 08:35:17 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <rongqing.li@windriver.com>
Message-ID: <20130618123516.GA3622@windriver.com>
References: <1371452640-28576-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1371452640-28576-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH meta-networking] arptables: fix the redefinition of 'arpt_get_target' error
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
X-List-Received-Date: Tue, 18 Jun 2013 12:35:17 -0000
X-Groupsio-MsgNum: 45120
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline

--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[PATCH meta-networking] arptables: fix the redefinition of 'arpt_get_targe=
t' error] On 13.06.17 (Mon 15:04) rongqing.li@windriver.com wrote:

> From: "Roy.Li" <rongqing.li@windriver.com>
>=20
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>  .../arptables-arpt-get-target-fix.patch            |   30 ++++++++++++++=
++++++
>  .../recipes-support/arptables/arptables_0.0.3-4.bb |    1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta-networking/recipes-support/arptables/arptables-0=
=2E0.3-4/arptables-arpt-get-target-fix.patch
>=20
> diff --git a/meta-networking/recipes-support/arptables/arptables-0.0.3-4/=
arptables-arpt-get-target-fix.patch b/meta-networking/recipes-support/arpta=
bles/arptables-0.0.3-4/arptables-arpt-get-target-fix.patch
> new file mode 100644
> index 0000000..3f5948b
> --- /dev/null
> +++ b/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptabl=
es-arpt-get-target-fix.patch
> @@ -0,0 +1,30 @@
> +arptables: fix the redefinition of 'arpt_get_target'
> +   =20
> +Upstream-Status: Pending
> +
> +This function is already defined as a static inline function in=20
> +include/linux/netfilter_arp/arp_tables.h, once GCC uses -O0, the
> +inline will not work, and the redefinition error will happen
> +
> +Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>=20
> +
> +diff --git a/libarptc/libarptc_incl.c b/libarptc/libarptc_incl.c
> +index 35736db..addd3f9 100644
> +--- a/libarptc/libarptc_incl.c
> ++++ b/libarptc/libarptc_incl.c
> +@@ -11,14 +11,6 @@
> + /* (C)1999 Paul ``Rusty'' Russell - Placed under the GNU GPL (See
> +    COPYING for details). */
> +=20
> +-#ifndef __OPTIMIZE__
> +-STRUCT_ENTRY_TARGET *
> +-GET_TARGET(STRUCT_ENTRY *e)
> +-{
> +-	return (void *)e + e->target_offset;
> +-}
> +-#endif
> +-
> + static int sockfd =3D -1;
> + static void *arptc_fn =3D NULL;
> +=20
> diff --git a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.=
bb b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
> index fe14b61..f3deaeb 100644
> --- a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
> +++ b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
> @@ -12,6 +12,7 @@ SRC_URI =3D " \
>      ${SOURCEFORGE_MIRROR}/ebtables/arptables-v${PV}.tar.gz;name=3Darptab=
les \
>      file://arptables-compile-install.patch \
>      file://arptables-init-busybox.patch \
> +    file://arptables-arpt-get-target-fix.patch \
>  "
>  SRC_URI[arptables.md5sum] =3D "1d4ab05761f063b0751645d8f2b8f8e5"
>  SRC_URI[arptables.sha256sum] =3D "e529fd465c67d69ad335299a043516e6b38cdc=
d337a5ed21718413e96073f928"
--=20
-Joe MacDonald.
:wq

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlHAVAEACgkQPN8S4W6ZZnfUhgCbBg0xffNm0NEERgx/TRizwMZZ
J1cAn00Ub7vPF5TPA0UeKkQkNiK/gkrN
=v2cE
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
