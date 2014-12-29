Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id C53FF72430
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 20:07:03 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1Y5gam-0003X6-62 from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Dec 2014 12:07:04 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 29 Dec 2014 12:07:03 -0800
Received: by burninator (Postfix, from userid 1000)	id 6D0DF5810B3; Mon, 29
	Dec 2014 15:06:57 -0500 (EST)
Date: Mon, 29 Dec 2014 15:06:57 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20141229200657.GD4672@mentor.com>
References: <1418977765-46144-1-git-send-email-liezhi.yang@windriver.com>
	<1418977765-46144-3-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1418977765-46144-3-git-send-email-liezhi.yang@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking] [PATCH 3/3] netkit-rusers: fix parallel build issue
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
X-List-Received-Date: Mon, 29 Dec 2014 20:07:03 -0000
X-Groupsio-MsgNum: 53515
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eheScQNz3K90DVRs"
Content-Disposition: inline

--eheScQNz3K90DVRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Robert,

I merged this patch after removing your "LOCAL REV:" comment from the
commit log) but I haven't merged the esmtp ones yet, I wanted to confirm
first that the runtime behaviour wasn't impacted.  Just FYI.

-J

[[oe] [meta-networking] [PATCH 3/3] netkit-rusers: fix parallel build issue=
] On 14.12.19 (Fri 00:29) Robert Yang wrote:

> Fixed:
> rusers.x: No such file or directory
> Makefile:44: recipe for target 'rusers_xdr.c' failed
>=20
> (LOCAL REV: NOT UPSTREAM) -- Sent to meta-networking on 20141219
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  ...rusersd-Makefile-fix-parallel-build-issue.patch |   30 ++++++++++++++=
++++++
>  .../netkit-rusers/netkit-rusers_0.17.bb            |    1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta-networking/recipes-netkit/netkit-rusers/netkit-r=
users/rpc.rusersd-Makefile-fix-parallel-build-issue.patch
>=20
> diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers/r=
pc.rusersd-Makefile-fix-parallel-build-issue.patch b/meta-networking/recipe=
s-netkit/netkit-rusers/netkit-rusers/rpc.rusersd-Makefile-fix-parallel-buil=
d-issue.patch
> new file mode 100644
> index 0000000..d85178d
> --- /dev/null
> +++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers/rpc.ruse=
rsd-Makefile-fix-parallel-build-issue.patch
> @@ -0,0 +1,30 @@
> +From c23cc112a480f90950de5cf1de09b1a7e732bf21 Mon Sep 17 00:00:00 2001
> +From: Robert Yang <liezhi.yang@windriver.com>
> +Date: Mon, 15 Dec 2014 18:31:13 -0800
> +Subject: [PATCH] rpc.rusersd/Makefile: fix parallel build issue
> +
> +Fixed:
> +rusers.x: No such file or directory
> +Makefile:44: recipe for target 'rusers_xdr.c' failed
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + rpc.rusersd/Makefile |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/rpc.rusersd/Makefile b/rpc.rusersd/Makefile
> +index 792f528..65a424a 100644
> +--- a/rpc.rusersd/Makefile
> ++++ b/rpc.rusersd/Makefile
> +@@ -40,5 +40,5 @@ rusers.x:
> + rusers.h: $(RUSERSX) rusers.x
> + 	$(RPCGEN) -h -o rusers.h rusers.x
> +=20
> +-rusers_xdr.c: $(RUSERSX)
> ++rusers_xdr.c: $(RUSERSX) rusers.x
> + 	$(RPCGEN) -c -C -o rusers_xdr.c rusers.x
> +--=20
> +1.7.9.5
> +
> diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0=
=2E17.bb b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.=
bb
> index e59f7a7..c930842 100644
> --- a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
> +++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
> @@ -8,6 +8,7 @@ DEPENDS =3D " tcp-wrappers libtirpc rpcbind"
> =20
>  SRC_URI =3D "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.orig.tar.gz;nam=
e=3Darchive \
>             ${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}-8.diff.gz;name=3D=
patch8 \
> +           file://rpc.rusersd-Makefile-fix-parallel-build-issue.patch \
>  "
> =20
>  SRC_URI[archive.md5sum] =3D "dc99a80b9fde2ab427c874f88f1c1602"
> --=20
> 1.7.9.5
>=20
--=20
-Joe MacDonald.
:wq

--eheScQNz3K90DVRs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJUobRhAAoJEEn8ffcsOfaWThEH+wT3l+KcxOWj83QDHux6WN3Y
/tz/leUBzS3ETZOCsjP8TU84HYUwtLi/kOd5U1CpoEzCPblWPe+Sra9S+1M0B9EU
XGACkAMN/EsQErEL1Ic43UW9m7+oBkXZ7IAk2aUFc4OtgdQf/CTUzPBWohB8wZIt
/CjgKKxZVLMn+1XCWYZqNQiDdmdbdue7vhy8cwc+OEcuOts+qgxpXR1LF3TpJDAu
/op0vaaMdMi85gpFuFJz99v5Zopo/gXXrneQo3WP058x04bvfNGEtY4GjnXLDhuy
dOIDAtvjt1bAkbZzn7T3Fs9y6aZr//YQHsH6x0wkrMDlwkm7GFCWBxPFrentIfs=
=1N3+
-----END PGP SIGNATURE-----

--eheScQNz3K90DVRs--
