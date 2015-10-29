Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6782D755F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 19:14:28 +0000 (UTC)
Received: by wmec75 with SMTP id c75so30759466wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 12:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SeC8RBMZJBfbiWoyrSFJqkU0Sz5yMOy9VJBvpX2Jsh8=;
	b=C5MwXObcH8SJGTE7DlfVgZEeqyVXJmZd1V7Oics5s9nyXzKlv4m8gIuEF2lj1rrLPk
	9pQYjXKn/Uzox3v/czaMao1rZzTiuCb9VMkH/mcKPbtUl4XrFhg9ViE63L9u7d3cfUQ6
	wakzTwRSIAxUpj9Ry+1l+K7gISsSq3QmGBwU+J2oX8Ld4Uw9nVO3SITG3dY7zX2qzxIe
	LBO46kj0pjpgkfIw0aMSRK7Bn/oqCnS1SO+Yp4uNY92J5SLGfkaDgRcjVLkUMyIU0YhP
	5erj0IwuiloMoXBp52zwszPLMK5rB5kyv1FHUVojJouxqQ8ZR4QOLI/5w6PORdV7sOBc
	imlw==
X-Received: by 10.28.88.143 with SMTP id m137mr8638426wmb.13.1446146068384;
	Thu, 29 Oct 2015 12:14:28 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q141sm4952889wmg.3.2015.10.29.12.14.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Oct 2015 12:14:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 29 Oct 2015 20:14:55 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151029191455.GC2564@jama>
References: <1445901886-17887-1-git-send-email-philip@blister.org>
MIME-Version: 1.0
In-Reply-To: <1445901886-17887-1-git-send-email-philip@blister.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Philip Balister <philip@opensdr.com>
Subject: Re: [meta-oe][PATCH] llvm: Add recipe for llvm-3.7.0.
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
X-List-Received-Date: Thu, 29 Oct 2015 19:14:33 -0000
X-Groupsio-MsgNum: 58159
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RIYY1s2vRbPFwWeW"
Content-Disposition: inline

--RIYY1s2vRbPFwWeW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2015 at 04:24:46PM -0700, Philip Balister wrote:
> From: Philip Balister <philip@opensdr.com>
>=20
> This version builds in parallel with the 3.3 recipe. I had to use the
> mesa llvmpipe driver, which required updates to llvm and mesa before it
> worked. With updates, I succesfully used the mesa llvmpipe driver.
>=20
>  * Move the licence file checksum to the version specific part of the rec=
ipe
>  * License changed for 3.7.0 due to year change and adding related softwa=
re
>  * llvm source is now compressed with xz not gz.

It fails to build on older Ubuntu-12.04 with:
| checking whether GCC is new enough... no
| configure: error:
| The selected GCC C++ compiler is not new enough to build LLVM. Please upg=
rade
| to GCC 4.7. You may pass --disable-compiler-version-checks to configure to
| bypass these sanity checks.

Shouldn't it check the cross compiler instead of the native one from
host? (in this build it was 5.2)

> Signed-off-by: Philip Balister <philip@opensdr.com>
> ---
>  meta-oe/recipes-core/llvm/llvm.inc           |  3 +--
>  meta-oe/recipes-core/llvm/llvm3.3_3.3.bb     |  4 ++++
>  meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb | 24 ++++++++++++++++++++++=
++
>  3 files changed, 29 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb
>=20
> diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/ll=
vm/llvm.inc
> index 04c87aa..7df4f4c 100644
> --- a/meta-oe/recipes-core/llvm/llvm.inc
> +++ b/meta-oe/recipes-core/llvm/llvm.inc
> @@ -23,7 +23,6 @@ HOMEPAGE =3D "http://llvm.org"
>  # 3-clause BSD-like
>  # University of Illinois/NCSA Open Source License
>  LICENSE =3D "NCSA"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3Dd0a3ef0d3e0e8f5cf59e5ffc2=
73ab1f8"
> =20
>  DEPENDS =3D "libffi libxml2-native llvm-common"
> =20
> @@ -32,7 +31,7 @@ inherit perlnative pythonnative autotools
>  LLVM_RELEASE =3D "${PV}"
>  LLVM_DIR =3D "llvm${LLVM_RELEASE}"
> =20
> -SRC_URI =3D "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.gz"
> +SRC_URI =3D "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.xz"
>  S =3D "${WORKDIR}/llvm-${PV}.src"
> =20
>  LLVM_BUILD_DIR =3D "${WORKDIR}/llvm-${PV}.build"
> diff --git a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb b/meta-oe/recipes-c=
ore/llvm/llvm3.3_3.3.bb
> index 60a2221..f1562f6 100644
> --- a/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
> +++ b/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb
> @@ -1,8 +1,12 @@
>  require llvm.inc
> =20
> +LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3Dd0a3ef0d3e0e8f5cf59e5ffc2=
73ab1f8"
> +
>  DEPENDS +=3D "zlib"
>  EXTRA_OECONF +=3D "--enable-zlib"
> =20
> +# Overwrite SRC_URI from include file since older llvm uses .gz compress=
ion
> +SRC_URI =3D "http://llvm.org/releases/${PV}/llvm-${PV}.src.tar.gz"
>  SRC_URI +=3D "file://Remove-error-output-from-configure-if-CFLAGS-is-set=
-.patch"
> =20
>  SRC_URI_append_libc-uclibc =3D " file://arm_fenv_uclibc.patch "
> diff --git a/meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb b/meta-oe/recip=
es-core/llvm/llvm3.7.0_3.7.0.bb
> new file mode 100644
> index 0000000..813b185
> --- /dev/null
> +++ b/meta-oe/recipes-core/llvm/llvm3.7.0_3.7.0.bb
> @@ -0,0 +1,24 @@
> +require llvm.inc
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D4c0bc17c954e99fd547528d93=
8832bfa"
> +
> +DEPENDS +=3D "zlib"
> +EXTRA_OECONF +=3D "--enable-zlib"
> +
> +SRC_URI_append_libc-uclibc =3D " file://arm_fenv_uclibc.patch "
> +
> +SRC_URI[md5sum] =3D "b98b9495e5655a672d6cb83e1a180f8e"
> +SRC_URI[sha256sum] =3D "ab45895f9dcdad1e140a3a79fd709f64b05ad7364e308c0e=
582c5b02e9cc3153"
> +
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[r600] =3D "--enable-experimental-targets=3DR600,,,"
> +
> +PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
> +
> +# Fails to build with thumb-1 (qemuarm)
> +# | {standard input}: Assembler messages:
> +# | {standard input}:22: Error: selected processor does not support Thum=
b mode `stmdb sp!,{r0,r1,r2,r3,lr}'
> +# | {standard input}:31: Error: lo register required -- `ldmia sp!,{r0,r=
1,r2,r3,lr}'
> +# | {standard input}:32: Error: lo register required -- `ldr pc,[sp],#4'
> +# | make[3]: *** [/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te=
-oe-linux-gnueabi/llvm3.3/3.3-r0/llvm-3.3.build/lib/Target/ARM/Release/ARMJ=
ITInfo.o] Error 1
> +ARM_INSTRUCTION_SET =3D "arm"
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RIYY1s2vRbPFwWeW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEUEARECAAYFAlYycC8ACgkQN1Ujt2V2gBxw6gCeK3uxl9ptO08rczs6MOlFUfne
Yl4Al2x7zLpoLflSGhDdhnMHLc/QNz0=
=CIlb
-----END PGP SIGNATURE-----

--RIYY1s2vRbPFwWeW--
