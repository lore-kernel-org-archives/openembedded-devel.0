Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id A7647605D2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 11:25:54 +0000 (UTC)
Received: by wieq12 with SMTP id q12so77968124wie.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 04:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bAJK87j8RoVryax/Ylu3vOh6pZEp32JKEBCrr5d5ito=;
	b=WKJICkzBLVU8QI/dvaBuOXD+6rWGEoquYYpg7za6gWcf4VIoptTAYzaCBJzb7iggPq
	PoenYhomdhR6OG2IWIvPDywk6IlqrfTnTFkejOnwilUr2vxz0TLs1DpCCSMW8xZn/1u/
	XbwQ72Hv+Rhk3h75ccdygoRPprakfsRwDehFwUYCwAYnnqRPr0H9c5+6JLnd7U8S0tHI
	8KW+fblSOisDsBMQOcouoANoSUZlPW1foKPr3CRTkhKHFcbgZ5omM4/4oXxz3dKMzXxV
	bVAAYfTvN+Om6QBPyLgCJzYvufBCS3qF3/eooTeAclHJCvGuGMTaYoEjxHl/5MVTleUR
	gurw==
X-Received: by 10.180.87.74 with SMTP id v10mr25344774wiz.66.1444821954647;
	Wed, 14 Oct 2015 04:25:54 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	p10sm9415131wjx.36.2015.10.14.04.25.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Oct 2015 04:25:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 14 Oct 2015 13:26:09 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151014112609.GA22448@jama>
References: <1444791091-27572-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1444791091-27572-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] polkit: fix an incomplete patch
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
X-List-Received-Date: Wed, 14 Oct 2015 11:25:55 -0000
X-Groupsio-MsgNum: 57808
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline

--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2015 at 10:51:31AM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> The patch 0001-do-not-hardcoded-libdir.patch to fix
> libprivdir is incomplete, it missed to fix the one
> in data/Makefile.am, and causes failure:
>=20
> systemd[676]: polkit.service: Failed at step EXEC spawning /usr/lib/polki=
t-1/polkitd: No such file or directory
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../polkit/0001-do-not-hardcoded-libdir.patch      | 31 ++++++++++++++++=
------
>  1 file changed, 23 insertions(+), 8 deletions(-)

error:
meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir.patch:
does not exist in index

It was removed in:
commit f86ba9a5583d3b493651134bf710d28dd6509765
Author: Reinette Chatre <reinette.chatre@intel.com>
Date:   Thu Sep 24 15:03:01 2015 -0700

    polkit: fix relocation of polkit binaries

>=20
> diff --git a/meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded=
-libdir.patch b/meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcode=
d-libdir.patch
> index e605e30..21ef578 100644
> --- a/meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir=
=2Epatch
> +++ b/meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir=
=2Epatch
> @@ -1,6 +1,6 @@
> -From c9e09d9b101109832b1dcb050f0c8b588e276686 Mon Sep 17 00:00:00 2001
> -From: Zhenhua Luo <zhenhua.luo@freescale.com>
> -Date: Mon, 4 May 2015 04:11:27 -0500
> +From fd07fbf131e31124094d9123091604dd32726750 Mon Sep 17 00:00:00 2001
> +From: Jackie Huang <jackie.huang@windriver.com>
> +Date: Wed, 14 Oct 2015 10:30:12 +0800
>  Subject: [PATCH] do not hardcoded libdir
> =20
>  Upstream-Status: Pending
> @@ -8,13 +8,28 @@ Upstream-Status: Pending
>  libdir is hardcoded to ${prefix}/lib, but we want it to support multilib
> =20
>  Signed-off-by: Chunrong Guo <B40290@freescale.com>
> +Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>  ---
> - polkitagent/Makefile.am   | 2 +-
> - polkitbackend/Makefile.am | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> + data/Makefile.am              | 2 +-
> + src/polkitagent/Makefile.am   | 2 +-
> + src/polkitbackend/Makefile.am | 2 +-
> + 3 files changed, 3 insertions(+), 3 deletions(-)
> =20
> +diff --git a/data/Makefile.am b/data/Makefile.am
> +index fe0f1d5..52cb4b4 100644
> +--- a/data/Makefile.am
> ++++ b/data/Makefile.am
> +@@ -2,7 +2,7 @@
> +=20
> + NULL =3D
> +=20
> +-libprivdir =3D $(prefix)/lib/polkit-1
> ++libprivdir =3D $(libdir)/polkit-1
> +=20
> + # ---------------------------------------------------------------------=
-------------------------------
> +=20
>  diff --git a/src/polkitagent/Makefile.am b/src/polkitagent/Makefile.am
> -index 3bc364e..7d1ac0e 100644
> +index 58a55bd..1b6156b 100644
>  --- a/src/polkitagent/Makefile.am
>  +++ b/src/polkitagent/Makefile.am
>  @@ -78,7 +78,7 @@ libpolkit_agent_1_la_LIBADD =3D                       =
        		\
> @@ -27,7 +42,7 @@ index 3bc364e..7d1ac0e 100644
>  =20
>   polkit_agent_helper_1_SOURCES =3D 					\
>  diff --git a/src/polkitbackend/Makefile.am b/src/polkitbackend/Makefile.=
am
> -index 9f430d0..1f7610b 100644
> +index 547ca82..78ed934 100644
>  --- a/src/polkitbackend/Makefile.am
>  +++ b/src/polkitbackend/Makefile.am
>  @@ -67,7 +67,7 @@ rules_DATA =3D 50-default.rules
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYeO9AACgkQN1Ujt2V2gBz0MQCfUp8b5C+uDdhEWOm8aRJMzc30
YjwAnj872/Lpd8VsOgcuyW0SdE3T4oNQ
=+i8X
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
