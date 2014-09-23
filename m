Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 88ACE6ACBA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 16:58:34 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id z2so5524618wiv.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 09:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CPtA3i41TOJ22CPBYHjKxADpPS44OLoUsxygL1zhW7c=;
	b=ApTH4+3ALAT3ULe/xd+Wpvzoc8Q9O14izxkYioB2/eNn6qTLmflQLeHeQEbebVvjmO
	SMJxn/gWqrUdh1hDhWnE73DHADgmZO3bRzr6xU6htJZ8ODB/wdxv7VX/YOxNaPE7x0Oa
	WhJ/52iI+RJklyjYYuhFM3QHFQ+wvWfvEjIIjitnEbRVy7uL0MZjVHZ3zz1MgQVfojtC
	sPO+UnJFhLYhGGoSNwOWkG8zZK7HAUrLhTD3enN++Fxs62tAQq4fAVem8JuiG4QjY+Kv
	Jhy1AA+sR+Gxp/0kgBL3AhSsRBTt2htjwqoGjbLWehPNHe91tIAny/fCLJfm+7io+Xxk
	CPtw==
X-Received: by 10.180.19.1 with SMTP id a1mr25174628wie.5.1411491515558;
	Tue, 23 Sep 2014 09:58:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cz3sm16542546wjb.23.2014.09.23.09.58.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Sep 2014 09:58:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 23 Sep 2014 18:59:20 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140923165920.GE25706@jama>
References: <1411455848-21704-1-git-send-email-ting.liu@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1411455848-21704-1-git-send-email-ting.liu@freescale.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] libunwind: Fix test case link failure on PowerPC systems with Altivec
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
X-List-Received-Date: Tue, 23 Sep 2014 16:58:38 -0000
X-Groupsio-MsgNum: 52194
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YkJPYEFdoxh/AXLE"
Content-Disposition: inline

--YkJPYEFdoxh/AXLE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2014 at 03:04:08PM +0800, ting.liu@freescale.com wrote:
> From: Ting Liu <ting.liu@freescale.com>

libunwind was recently moved to oe-core, please fix it there.

>=20
> Signed-off-by: Ting Liu <ting.liu@freescale.com>
> ---
>  ...k-failure-on-PowerPC-systems-with-Altivec.patch | 31 ++++++++++++++++=
++++++
>  meta-oe/recipes-support/libunwind/libunwind_1.1.bb |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libunwind/libunwind/Fix-test-=
case-link-failure-on-PowerPC-systems-with-Altivec.patch
>=20
> diff --git a/meta-oe/recipes-support/libunwind/libunwind/Fix-test-case-li=
nk-failure-on-PowerPC-systems-with-Altivec.patch b/meta-oe/recipes-support/=
libunwind/libunwind/Fix-test-case-link-failure-on-PowerPC-systems-with-Alti=
vec.patch
> new file mode 100644
> index 0000000..e8f4382
> --- /dev/null
> +++ b/meta-oe/recipes-support/libunwind/libunwind/Fix-test-case-link-fail=
ure-on-PowerPC-systems-with-Altivec.patch
> @@ -0,0 +1,31 @@
> +From 4c62c4a9556f92495d93eddc7641497e1ce1e35c Mon Sep 17 00:00:00 2001
> +From: Ulrich Weigand <uweigand@de.ibm.com>
> +Date: Tue, 17 Dec 2013 15:00:54 +0100
> +Subject: [PATCH] Fix test case link failure on PowerPC systems with Alti=
vec
> +
> +Upstream-Status:backport
> +
> +On systems where the system compiler supports Altivec by default,
> +the libunwind Makefile will attempt to build an extra test case
> +ppc64-test-altivec.  Unfortunately, the link step will fail since
> +the Makefile does not actually link against the libunwind library.
> +
> +Fixed by adding the appropriate LDADD macro.
> +
> +Signed-off-by: Ulrich Weigand <uweigand@de.ibm.com>
> +---
> + tests/Makefile.am |    1 +
> + 1 files changed, 1 insertions(+), 0 deletions(-)
> +
> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index 0e30536..9c76628 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -201,3 +201,4 @@ Lia64_test_rbs_LDADD =3D $(LIBUNWIND_local)
> + Lia64_test_readonly_LDADD =3D $(LIBUNWIND_local)
> + ia64_test_dyn1_LDADD =3D $(LIBUNWIND)
> + ia64_test_sig_LDADD =3D $(LIBUNWIND)
> ++ppc64_test_altivec_LDADD =3D $(LIBUNWIND)
> +--=20
> +1.7.2.5
> +
> diff --git a/meta-oe/recipes-support/libunwind/libunwind_1.1.bb b/meta-oe=
/recipes-support/libunwind/libunwind_1.1.bb
> index bc38e36..18bca0e 100644
> --- a/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
> +++ b/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
> @@ -1,4 +1,5 @@
>  require libunwind.inc
> =20
> +SRC_URI +=3D "file://Fix-test-case-link-failure-on-PowerPC-systems-with-=
Altivec.patch"
>  SRC_URI[md5sum] =3D "fb4ea2f6fbbe45bf032cd36e586883ce"
>  SRC_URI[sha256sum] =3D "9dfe0fcae2a866de9d3942c66995e4b460230446887dbdab=
302d41a8aee8d09a"
> --=20
> 1.8.3.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YkJPYEFdoxh/AXLE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQhpugACgkQN1Ujt2V2gByogACdHxD6tSWpHmbUD5HpQ6zSZBoZ
SWgAnR203K+gmCfAU/vnlh+3nqhX4NHa
=IzjO
-----END PGP SIGNATURE-----

--YkJPYEFdoxh/AXLE--
