Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R1v0z-0006Vh-5v
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2011 08:56:41 +0200
Received: by fxg11 with SMTP id 11so2355971fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Sep 2011 23:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NXVpyDqjOe3V+pFhYw04Xi/dPXsl8M0SuD1tnwAnR+Q=;
	b=RriS1LdSMPD92zaqp7TAnyiGzFNdN8IEh+XRo2u9Sb6nqSO0fiFptNsHjDvX83SZ/E
	of54qGS5dWQhS2JwN8Tp8JpPmCjcEgUzyz9DNgpTxBOwiMrta60vOhl5c7+TQsTdsfVG
	kyBSm+airz6Qr6tEI9GZGbpTsxg5QpIIdjZh4=
Received: by 10.223.76.201 with SMTP id d9mr212057fak.119.1315551096392;
	Thu, 08 Sep 2011 23:51:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o16sm650011fag.21.2011.09.08.23.51.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Sep 2011 23:51:35 -0700 (PDT)
Date: Fri, 9 Sep 2011 08:51:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110909065128.GA4124@jama.jama.net>
References: <1315434958-5042-1-git-send-email-errordeveloper@gmail.com>
	<1315539201-6902-1-git-send-email-errordeveloper@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1315539201-6902-1-git-send-email-errordeveloper@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Ilya Dmitrichenko <errordeveloper@newbrik.new-synth.info>
Subject: Re: [PATCH 2/2] binutils-2.20.1: fix checksums
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
X-List-Received-Date: Fri, 09 Sep 2011 06:56:41 -0000
X-Groupsio-MsgNum: 34160
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline

--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 09, 2011 at 04:33:21AM +0100, Ilya Dmitrichenko wrote:
> From: Ilya Dmitrichenko <errordeveloper@newbrik.new-synth.info>
>=20
> Signed-off-by: Ilya Dmitrichenko <errordeveloper@gmail.com>
> ---
>  recipes/binutils/binutils_2.20.1.bb  |   33 ----------------------------=
-----
>  recipes/binutils/binutils_2.20.1a.bb |   33 ++++++++++++++++++++++++++++=
+++++
>  2 files changed, 33 insertions(+), 33 deletions(-)
>  delete mode 100644 recipes/binutils/binutils_2.20.1.bb
>  create mode 100644 recipes/binutils/binutils_2.20.1a.bb

And what happens with binutils-cross* etc?
they won't even parse OK, because could not find
require binutils_${PV}.bb

Renaming just the tarbal in SRC_URI is easier then renaming recipes and
works fine (will force everybody to redownload right sources with right
checksums) see:

http://patches.openembedded.org/patch/11149/

Or you have to rename all binutils*2.20.1 recipes.

Regards,
=20
> diff --git a/recipes/binutils/binutils_2.20.1.bb b/recipes/binutils/binut=
ils_2.20.1.bb
> deleted file mode 100644
> index f40b676..0000000
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
> -SRC_URI[tarball.sha256sum] =3D "71d37c96451333c5c0b84b170169fdcb138bbb27=
397dc06281905d9717c8ed64"
> -SRC_URI[tarball.md5sum] =3D "2b9dc8f2b7dbd5ec5992c6e29de0b764"
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
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5pt3AACgkQN1Ujt2V2gByCZgCeOKaK/qLAHCv6Q0d37pbS5Q+K
UNAAoJNgPu3SYBstUh7DyUWITrpjLEvn
=2yOl
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
