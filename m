Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id C4B06610F5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2014 09:33:18 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id r20so5693759wiv.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2014 02:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=o59uZPuAxp8tzYxsPDjTs0vFu+67EcfNedcKA/oq28I=;
	b=JgJRxKXUSE1VXfLF7BlPs+gC3Tz4m0MkgEyeOtNWJrtFs39PKfZpDVjlHLMs/gXeh3
	edxM9SsFOhwzPP7aAjtaRmE9Jm7tlIjjdpL5+PliYLcI0BmP9ghG6/2ydbMRmpuDsUuG
	nZmVaEenqlAT5shlRBx7tGFkrAP4QbFZ8oT9TxakpHDzyiFK6luuaB4IB5ewmbDes7Oj
	R8wWtqFRlEbcP8sGz9BIW31tsWs7Y8UK+NYy0slFNHBWI32vMJj6THvFN1L8EgpQ/vxM
	HGGpEGTYfiJvITuTorJ7B5aDqxO8E3Ajgd/ss3j7xf/E38RkFc/k/VtgFclog6leBtNW
	sHeA==
X-Received: by 10.194.10.167 with SMTP id j7mr2071767wjb.100.1404120798638;
	Mon, 30 Jun 2014 02:33:18 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ft2sm20310462wib.1.2014.06.30.02.33.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Jun 2014 02:33:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 30 Jun 2014 11:33:26 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140630093326.GB2437@jama>
References: <1403061135-22767-1-git-send-email-b40290@freescale.com>
	<3731aa39aae649be80dd07a5645f3665@BY2PR03MB254.namprd03.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <3731aa39aae649be80dd07a5645f3665@BY2PR03MB254.namprd03.prod.outlook.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] libhugetlbfs: arm 32bit support
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
X-List-Received-Date: Mon, 30 Jun 2014 09:33:21 -0000
X-Groupsio-MsgNum: 50622
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jSXJDi5r/aeatSyx"
Content-Disposition: inline

--jSXJDi5r/aeatSyx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2014 at 02:25:30AM +0000, B40290@freescale.com wrote:
> Pings.

libhugetlbfs was failing in last world builds, so I haven't merged it
yet (waiting for another build to confirm that it was or wasn't caused
by this change).

> -----Original Message-----
> From: b40290@freescale.com [mailto:b40290@freescale.com]=20
> Sent: Wednesday, June 18, 2014 11:12 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290
> Subject: [meta-oe][PATCH] libhugetlbfs: arm 32bit support
>=20
> From: Chunrong Guo <B40290@freescale.com>
>=20
> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  .../libhugetlbfs/files/arm32-support.patch         | 29 ++++++++++++++++=
++++++
>  .../libhugetlbfs/libhugetlbfs_git.bb               |  3 ++-
>  2 files changed, 31 insertions(+), 1 deletion(-)  create mode 100644 met=
a-oe/recipes-benchmark/libhugetlbfs/files/arm32-support.patch
>=20
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/arm32-support.p=
atch b/meta-oe/recipes-benchmark/libhugetlbfs/files/arm32-support.patch
> new file mode 100644
> index 0000000..96f162d
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/arm32-support.patch
> @@ -0,0 +1,29 @@
> +Upstream-Status: Submitted
> +
> +This patch adds support for arm32.
> +
> +Signed-off-by: Chunrong Guo <B40290@freescale.com>
> +
> +--- a/Makefileold	2014-06-17 21:55:23.131058918 -0500
> ++++ b/Makefile	2014-06-17 21:56:08.726098531 -0500
> +@@ -59,6 +59,12 @@
> + TMPLIB32 =3D lib
> + CPPFLAGS +=3D -DPPC_NO_SEGMENTS
> + else
> ++ifeq ($(ARCH),arm)
> ++CC32 =3D $(CC)
> ++TMPLIB32 =3D lib
> ++ELF32 +=3D armelf_linux_eabi
> ++CUSTOM_LDSCRIPTS =3D no
> ++else
> + ifeq ($(ARCH),armv7l)
> + CC32 =3D $(CC)
> + TMPLIB32 =3D lib
> +@@ -116,6 +122,7 @@
> + endif
> + endif
> + endif
> ++endif
> +=20
> + ifdef CC32
> + OBJDIRS +=3D obj32
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b=
/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> index 5645add..879f2a0 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> @@ -14,11 +14,12 @@ SRC_URI =3D "git://git.code.sf.net/p/libhugetlbfs/cod=
e \
>      file://0001-aarch64-fix-cross-compilation.patch \
>      file://0001-aarch64-fix-page-size-not-properly-computed.patch \
>      file://0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.pat=
ch \
> +    file://arm32-support.patch \
>  "
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -COMPATIBLE_HOST =3D "(x86_64|powerpc|powerpc64|aarch64).*-linux*"
> +COMPATIBLE_HOST =3D "(x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
> =20
>  LIBARGS =3D "LIB32=3D${baselib} LIB64=3D${baselib}"
>  EXTRA_OEMAKE =3D "'ARCH=3D${TARGET_ARCH}' 'OPT=3D${CFLAGS}' 'CC=3D${CC}'=
 ${LIBARGS} V=3D1"
> --
> 1.9.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jSXJDi5r/aeatSyx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOxLuYACgkQN1Ujt2V2gBzCfwCfWir3GXv1crsXik66HTOI9jTp
lWYAn0lQww3oqaj2t6xS6JKX3+dny87l
=FJsV
-----END PGP SIGNATURE-----

--jSXJDi5r/aeatSyx--
