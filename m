Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R21cL-0003tH-Eb
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2011 15:59:41 +0200
Received: by fxi1 with SMTP id 1so148412fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Sep 2011 06:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/mMjmWDZKN3DVK9aUeGXiN5uftM8fdb18YbVgKrWNU8=;
	b=YvKwIjRSI1vVt2TgIuUq3A1XNmbcH0/WMv+DbKBcztER1VhHsIRpiKiSaqmsxFEqFP
	KatcaZqj5tOXitnowjOKycloP9LbppBlx200ulf4NcTPkaqIsvIGVNRX3y790feN2oWa
	u8JHHFEcC2gOCIIMEmP2esfqsaDDavOIE5oP4=
Received: by 10.223.76.201 with SMTP id d9mr19288fak.119.1315576470179;
	Fri, 09 Sep 2011 06:54:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o16sm1079605fag.21.2011.09.09.06.54.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Sep 2011 06:54:29 -0700 (PDT)
Date: Fri, 9 Sep 2011 15:54:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110909135422.GL4124@jama.jama.net>
References: <1315434958-5042-1-git-send-email-errordeveloper@gmail.com>
	<1315579610-3943-1-git-send-email-errordeveloper@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1315579610-3943-1-git-send-email-errordeveloper@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] binutils: Update from 2.20.1 to 2.20.1a
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
X-List-Received-Date: Fri, 09 Sep 2011 13:59:41 -0000
X-Groupsio-MsgNum: 34171
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yQDbd2FCF2Yhw41T"
Content-Disposition: inline

--yQDbd2FCF2Yhw41T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 09, 2011 at 03:46:50PM +0100, Ilya Dmitrichenko wrote:
> Signed-off-by: Ilya Dmitrichenko <errordeveloper@gmail.com>
> ---
>  recipes/binutils/binutils-cross-sdk_2.20.1.bb  |    4 ---
>  recipes/binutils/binutils-cross-sdk_2.20.1a.bb |    4 +++
>  recipes/binutils/binutils-cross_2.20.1.bb      |    4 ---
>  recipes/binutils/binutils-cross_2.20.1a.bb     |    4 +++
>  recipes/binutils/binutils_2.20.1.bb            |   33 ------------------=
------
>  recipes/binutils/binutils_2.20.1a.bb           |   33 ++++++++++++++++++=
++++++
>  6 files changed, 41 insertions(+), 41 deletions(-)
>  delete mode 100644 recipes/binutils/binutils-cross-sdk_2.20.1.bb
>  create mode 100644 recipes/binutils/binutils-cross-sdk_2.20.1a.bb
>  delete mode 100644 recipes/binutils/binutils-cross_2.20.1.bb
>  create mode 100644 recipes/binutils/binutils-cross_2.20.1a.bb
>  delete mode 100644 recipes/binutils/binutils_2.20.1.bb
>  create mode 100644 recipes/binutils/binutils_2.20.1a.bb
>=20
> diff --git a/recipes/binutils/binutils-cross-sdk_2.20.1.bb b/recipes/binu=
tils/binutils-cross-sdk_2.20.1.bb
> deleted file mode 100644
> index 2b1ac30..0000000
> --- a/recipes/binutils/binutils-cross-sdk_2.20.1.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -require binutils_${PV}.bb
> -require binutils-cross-sdk.inc
> -PR =3D "${INC_PR}.0"
> -
> diff --git a/recipes/binutils/binutils-cross-sdk_2.20.1a.bb b/recipes/bin=
utils/binutils-cross-sdk_2.20.1a.bb
> new file mode 100644
> index 0000000..2b1ac30
> --- /dev/null
> +++ b/recipes/binutils/binutils-cross-sdk_2.20.1a.bb
> @@ -0,0 +1,4 @@
> +require binutils_${PV}.bb
> +require binutils-cross-sdk.inc
> +PR =3D "${INC_PR}.0"
> +
> diff --git a/recipes/binutils/binutils-cross_2.20.1.bb b/recipes/binutils=
/binutils-cross_2.20.1.bb
> deleted file mode 100644
> index ca7fe05..0000000
> --- a/recipes/binutils/binutils-cross_2.20.1.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -FILESPATHPKG =3D. "binutils-${PV}:"
> -require binutils_${PV}.bb
> -require binutils-cross.inc
> -
> diff --git a/recipes/binutils/binutils-cross_2.20.1a.bb b/recipes/binutil=
s/binutils-cross_2.20.1a.bb
> new file mode 100644
> index 0000000..ca7fe05
> --- /dev/null
> +++ b/recipes/binutils/binutils-cross_2.20.1a.bb
> @@ -0,0 +1,4 @@
> +FILESPATHPKG =3D. "binutils-${PV}:"
> +require binutils_${PV}.bb
> +require binutils-cross.inc
> +
> diff --git a/recipes/binutils/binutils_2.20.1.bb b/recipes/binutils/binut=
ils_2.20.1.bb
> deleted file mode 100644
> index 5154e2d..0000000
> --- a/recipes/binutils/binutils_2.20.1.bb
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -require binutils.inc
> -LICENSE =3D "GPLv3"
> -
> -PR =3D "${INC_PR}.4"
> -EXTRA_OECONF +=3D "--disable-werror"
> -
> -#COMPATIBLE_TARGET_SYS =3D "."
> -
> -SRC_URI =3D "\
> -     ${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2;name=3Dtarball \
> -     file://binutils-uclibc-100-uclibc-conf.patch \
> -     file://110-arm-eabi-conf.patch \
> -     file://binutils-uclibc-300-001_ld_makefile_patch.patch \
> -     file://binutils-uclibc-300-006_better_file_error.patch \
> -     file://binutils-uclibc-300-012_check_ldrunpath_length.patch \
> -     file://binutils-uclibc-gas-needs-libm.patch \
> -     file://binutils-x86_64_i386_biarch.patch \
> -     ${@['file://libtool-update.patch','file://libtool-2.4-update.patch'=
][bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) =3D=3D 'yes']} \
> -     file://binutils-2.19.1-ld-sysroot.patch \
> -     "
> -
> -SRC_URI_append_nios2 =3D" \
> -	file://binutils-nios2-files.patch \
> -	file://binutils-nios2.patch \
> -	"
> -
> -SRC_URI[tarball.sha256sum] =3D "228b84722d87e88e7fdd36869e590e649ab523a0=
800a7d53df906498afe6f6f8"
> -SRC_URI[tarball.md5sum] =3D "9cdfb9d6ec0578c166d3beae5e15c4e5"
> -
> -# powerpc patches
> -SRC_URI +=3D "\
> -     file://binutils-2.16.1-e300c2c3.patch \
> -     "
> diff --git a/recipes/binutils/binutils_2.20.1a.bb b/recipes/binutils/binu=
tils_2.20.1a.bb
> new file mode 100644
> index 0000000..f40b676
> --- /dev/null
> +++ b/recipes/binutils/binutils_2.20.1a.bb
> @@ -0,0 +1,33 @@
> +require binutils.inc
> +LICENSE =3D "GPLv3"
> +
> +PR =3D "${INC_PR}.4"
> +EXTRA_OECONF +=3D "--disable-werror"
> +
> +#COMPATIBLE_TARGET_SYS =3D "."
> +
> +SRC_URI =3D "\
> +     ${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2;name=3Dtarball \
> +     file://binutils-uclibc-100-uclibc-conf.patch \
> +     file://110-arm-eabi-conf.patch \
> +     file://binutils-uclibc-300-001_ld_makefile_patch.patch \
> +     file://binutils-uclibc-300-006_better_file_error.patch \
> +     file://binutils-uclibc-300-012_check_ldrunpath_length.patch \
> +     file://binutils-uclibc-gas-needs-libm.patch \
> +     file://binutils-x86_64_i386_biarch.patch \
> +     ${@['file://libtool-update.patch','file://libtool-2.4-update.patch'=
][bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) =3D=3D 'yes']} \
> +     file://binutils-2.19.1-ld-sysroot.patch \
> +     "
> +
> +SRC_URI_append_nios2 =3D" \
> +	file://binutils-nios2-files.patch \
> +	file://binutils-nios2.patch \
> +	"
> +
> +SRC_URI[tarball.sha256sum] =3D "71d37c96451333c5c0b84b170169fdcb138bbb27=
397dc06281905d9717c8ed64"
> +SRC_URI[tarball.md5sum] =3D "2b9dc8f2b7dbd5ec5992c6e29de0b764"
> +
> +# powerpc patches
> +SRC_URI +=3D "\
> +     file://binutils-2.16.1-e300c2c3.patch \
> +     "
> --=20
> 1.7.3.4

Have you tested it? I don't see setting S
something like
S =3D "${WORKDIR}/binutils-2.20.1"

So I guess it will fail even to do_patch.. :/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yQDbd2FCF2Yhw41T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5qGo4ACgkQN1Ujt2V2gBzgTgCfYcLyFlF5szjk9YN9h0hAFhM5
ml8Ani+HSGP/upc4TwAiP5THZmquA2hQ
=F5Bb
-----END PGP SIGNATURE-----

--yQDbd2FCF2Yhw41T--
