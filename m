Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id E9DB46D610
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 16:42:24 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id c50so3590022eek.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2013 08:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=x7T7HPV0Wp4UqyV33vHZJluY9PenbcbmWMWvTfcJKoE=;
	b=XziS5bgB1/yum6OgKnKtE17diLxtRdRcECqLbpUS0JP3639OcCOmew+eO1wom4bsVj
	LwIh7OScTghoW1ZtLmZywp6sbSmocYQMJkd+JALUIvEhaV5NE4rqAck82Ait++UV1RJp
	41woJckzRPHYLwSD+lJyNL6W1CwPEpR5fTUdpSVr1iORdh1RrCG1EVPHOaumnmz7nnfI
	KIems7Nx8wTz1qmZsjGifBpnaobYPM93YPbcYlCwe/Bq9YemeLoQfy0ZwGgKm0IXugK8
	Cwnx5mG9ZmJP6jodgI6hGGdavpkv71qZwzV1BrYQRCdvdXku8oi6UtnIhz527c5qP9we
	aASQ==
X-Received: by 10.15.33.73 with SMTP id b49mr65294eev.68.1384965746188;
	Wed, 20 Nov 2013 08:42:26 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id b42sm61754689eem.9.2013.11.20.08.42.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Nov 2013 08:42:25 -0800 (PST)
Date: Wed, 20 Nov 2013 17:42:28 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131120164228.GT3708@jama>
References: <1384944262-4850-1-git-send-email-zhenhua.luo@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1384944262-4850-1-git-send-email-zhenhua.luo@freescale.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: b40527@freescale.com
Subject: Re: [meta-oe/meta-oe][PATCH 1/2] Fix python-numpy build failure on powerpc architecture.
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
X-List-Received-Date: Wed, 20 Nov 2013 16:42:25 -0000
X-Groupsio-MsgNum: 47212
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IQvoI1rdlCKiYEYW"
Content-Disposition: inline

--IQvoI1rdlCKiYEYW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2013 at 06:44:21PM +0800, Zhenhua Luo wrote:
> Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> ---
>  .../python/python-numpy/ppc/config.h               |  21 ++++
>  .../python/python-numpy/ppc/numpyconfig.h          |  17 +++
>  .../python/python-numpy/ppc64/_numpyconfig.h       |  30 +++++
>  .../python/python-numpy/ppc64/config.h             | 139 +++++++++++++++=
++++++
>  .../recipes-devtools/python/python-numpy_1.7.0.bb  |   9 ++

put them into right directories powerpc/powerpc64 and you won't need
following commit.

>  5 files changed, 216 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/python/python-numpy/ppc/conf=
ig.h
>  create mode 100644 meta-oe/recipes-devtools/python/python-numpy/ppc/nump=
yconfig.h
>  create mode 100644 meta-oe/recipes-devtools/python/python-numpy/ppc64/_n=
umpyconfig.h
>  create mode 100644 meta-oe/recipes-devtools/python/python-numpy/ppc64/co=
nfig.h
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-numpy/ppc/config.h b/=
meta-oe/recipes-devtools/python/python-numpy/ppc/config.h
> new file mode 100644
> index 0000000..17ef186
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-numpy/ppc/config.h
> @@ -0,0 +1,21 @@
> +/* ./src.linux-i686-2.5/numpy/core/include/numpy/config.h */
> +/* #define SIZEOF_SHORT 2 */
> +/* #define SIZEOF_INT 4 */
> +/* #define SIZEOF_LONG 4 */
> +/* #define SIZEOF_FLOAT 4 */
> +/* #define SIZEOF_DOUBLE 8 */
> +#define SIZEOF_LONG_DOUBLE 12
> +#define SIZEOF_PY_INTPTR_T 4
> +/* #define SIZEOF_LONG_LONG 8 */
> +#define SIZEOF_PY_LONG_LONG 8
> +/* #define CHAR_BIT 8 */
> +#define MATHLIB m
> +#define HAVE_FLOAT_FUNCS
> +#define HAVE_LOG1P
> +#define HAVE_EXPM1
> +#define HAVE_INVERSE_HYPERBOLIC
> +#define HAVE_INVERSE_HYPERBOLIC_FLOAT
> +#define HAVE_ISNAN
> +#define HAVE_ISINF
> +#define HAVE_RINT
> +
> diff --git a/meta-oe/recipes-devtools/python/python-numpy/ppc/numpyconfig=
=2Eh b/meta-oe/recipes-devtools/python/python-numpy/ppc/numpyconfig.h
> new file mode 100644
> index 0000000..c4bf654
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-numpy/ppc/numpyconfig.h
> @@ -0,0 +1,17 @@
> +/* cat ./src.linux-i686-2.5/numpy/core/include/numpy/numpyconfig.h */
> +/*
> + *  * This file is generated by numpy/core/setup.pyc. DO NOT EDIT=20
> + *   */
> +#define NPY_SIZEOF_SHORT 2=20
> +#define NPY_SIZEOF_INT 4=20
> +#define NPY_SIZEOF_LONG 4=20
> +#define NPY_SIZEOF_FLOAT 4=20
> +#define NPY_SIZEOF_DOUBLE 8=20
> +#define NPY_SIZEOF_LONGDOUBLE 12=20
> +#define NPY_SIZEOF_PY_INTPTR_T 4=20
> +#define NPY_NO_SMP 0
> +
> +#define NPY_SIZEOF_LONGLONG 8=20
> +#define NPY_SIZEOF_PY_LONG_LONG 8=20
> +/* #define CHAR_BIT 8 */
> +
> diff --git a/meta-oe/recipes-devtools/python/python-numpy/ppc64/_numpycon=
fig.h b/meta-oe/recipes-devtools/python/python-numpy/ppc64/_numpyconfig.h
> new file mode 100644
> index 0000000..be57ac2
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-numpy/ppc64/_numpyconfig.h
> @@ -0,0 +1,30 @@
> +#define NPY_HAVE_ENDIAN_H 1
> +#define NPY_SIZEOF_SHORT SIZEOF_SHORT
> +#define NPY_SIZEOF_INT SIZEOF_INT
> +#define NPY_SIZEOF_LONG SIZEOF_LONG
> +#define NPY_SIZEOF_FLOAT 4
> +#define NPY_SIZEOF_COMPLEX_FLOAT 8
> +#define NPY_SIZEOF_DOUBLE 8
> +#define NPY_SIZEOF_COMPLEX_DOUBLE 16
> +#define NPY_SIZEOF_LONGDOUBLE 16
> +#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
> +#define NPY_SIZEOF_PY_INTPTR_T 8
> +#define NPY_SIZEOF_PY_LONG_LONG 8
> +#define NPY_SIZEOF_LONGLONG 8
> +#define NPY_NO_SMP 0
> +#define NPY_HAVE_DECL_ISNAN
> +#define NPY_HAVE_DECL_ISINF
> +#define NPY_HAVE_DECL_ISFINITE
> +#define NPY_HAVE_DECL_SIGNBIT
> +#define NPY_USE_C99_COMPLEX 1
> +#define NPY_HAVE_COMPLEX_DOUBLE 1
> +#define NPY_HAVE_COMPLEX_FLOAT 1
> +#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
> +#define NPY_USE_C99_FORMATS 1
> +#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
> +#define NPY_ABI_VERSION 0x01000009
> +#define NPY_API_VERSION 0x00000007
> +
> +#ifndef __STDC_FORMAT_MACROS
> +#define __STDC_FORMAT_MACROS 1
> +#endif
> diff --git a/meta-oe/recipes-devtools/python/python-numpy/ppc64/config.h =
b/meta-oe/recipes-devtools/python/python-numpy/ppc64/config.h
> new file mode 100644
> index 0000000..c30b868
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-numpy/ppc64/config.h
> @@ -0,0 +1,139 @@
> +#define HAVE_ENDIAN_H 1
> +#define SIZEOF_PY_INTPTR_T 8
> +#define SIZEOF_PY_LONG_LONG 8
> +#define MATHLIB m
> +#define HAVE_SIN 1
> +#define HAVE_COS 1
> +#define HAVE_TAN 1
> +#define HAVE_SINH 1
> +#define HAVE_COSH 1
> +#define HAVE_TANH 1
> +#define HAVE_FABS 1
> +#define HAVE_FLOOR 1
> +#define HAVE_CEIL 1
> +#define HAVE_SQRT 1
> +#define HAVE_LOG10 1
> +#define HAVE_LOG 1
> +#define HAVE_EXP 1
> +#define HAVE_ASIN 1
> +#define HAVE_ACOS 1
> +#define HAVE_ATAN 1
> +#define HAVE_FMOD 1
> +#define HAVE_MODF 1
> +#define HAVE_FREXP 1
> +#define HAVE_LDEXP 1
> +#define HAVE_RINT 1
> +#define HAVE_TRUNC 1
> +#define HAVE_EXP2 1
> +#define HAVE_LOG2 1
> +#define HAVE_ATAN2 1
> +#define HAVE_POW 1
> +#define HAVE_NEXTAFTER 1
> +#define HAVE_SINF 1
> +#define HAVE_COSF 1
> +#define HAVE_TANF 1
> +#define HAVE_SINHF 1
> +#define HAVE_COSHF 1
> +#define HAVE_TANHF 1
> +#define HAVE_FABSF 1
> +#define HAVE_FLOORF 1
> +#define HAVE_CEILF 1
> +#define HAVE_RINTF 1
> +#define HAVE_TRUNCF 1
> +#define HAVE_SQRTF 1
> +#define HAVE_LOG10F 1
> +#define HAVE_LOGF 1
> +#define HAVE_LOG1PF 1
> +#define HAVE_EXPF 1
> +#define HAVE_EXPM1F 1
> +#define HAVE_ASINF 1
> +#define HAVE_ACOSF 1
> +#define HAVE_ATANF 1
> +#define HAVE_ASINHF 1
> +#define HAVE_ACOSHF 1
> +#define HAVE_ATANHF 1
> +#define HAVE_HYPOTF 1
> +#define HAVE_ATAN2F 1
> +#define HAVE_POWF 1
> +#define HAVE_FMODF 1
> +#define HAVE_MODFF 1
> +#define HAVE_FREXPF 1
> +#define HAVE_LDEXPF 1
> +#define HAVE_EXP2F 1
> +#define HAVE_LOG2F 1
> +#define HAVE_COPYSIGNF 1
> +#define HAVE_NEXTAFTERF 1
> +#define HAVE_SINL 1
> +#define HAVE_COSL 1
> +#define HAVE_TANL 1
> +#define HAVE_SINHL 1
> +#define HAVE_COSHL 1
> +#define HAVE_TANHL 1
> +#define HAVE_FABSL 1
> +#define HAVE_FLOORL 1
> +#define HAVE_CEILL 1
> +#define HAVE_RINTL 1
> +#define HAVE_TRUNCL 1
> +#define HAVE_SQRTL 1
> +#define HAVE_LOG10L 1
> +#define HAVE_LOGL 1
> +#define HAVE_LOG1PL 1
> +#define HAVE_EXPL 1
> +#define HAVE_EXPM1L 1
> +#define HAVE_ASINL 1
> +#define HAVE_ACOSL 1
> +#define HAVE_ATANL 1
> +#define HAVE_ASINHL 1
> +#define HAVE_ACOSHL 1
> +#define HAVE_ATANHL 1
> +#define HAVE_HYPOTL 1
> +#define HAVE_ATAN2L 1
> +#define HAVE_POWL 1
> +#define HAVE_FMODL 1
> +#define HAVE_MODFL 1
> +#define HAVE_FREXPL 1
> +#define HAVE_LDEXPL 1
> +#define HAVE_EXP2L 1
> +#define HAVE_LOG2L 1
> +#define HAVE_COPYSIGNL 1
> +#define HAVE_NEXTAFTERL 1
> +#define HAVE_DECL_SIGNBIT
> +#define HAVE_COMPLEX_H 1
> +#define HAVE_CREAL 1
> +#define HAVE_CIMAG 1
> +#define HAVE_CABS 1
> +#define HAVE_CARG 1
> +#define HAVE_CEXP 1
> +#define HAVE_CSQRT 1
> +#define HAVE_CLOG 1
> +#define HAVE_CCOS 1
> +#define HAVE_CSIN 1
> +#define HAVE_CPOW 1
> +#define HAVE_CREALF 1
> +#define HAVE_CIMAGF 1
> +#define HAVE_CABSF 1
> +#define HAVE_CARGF 1
> +#define HAVE_CEXPF 1
> +#define HAVE_CSQRTF 1
> +#define HAVE_CLOGF 1
> +#define HAVE_CCOSF 1
> +#define HAVE_CSINF 1
> +#define HAVE_CPOWF 1
> +#define HAVE_CREALL 1
> +#define HAVE_CIMAGL 1
> +#define HAVE_CABSL 1
> +#define HAVE_CARGL 1
> +#define HAVE_CEXPL 1
> +#define HAVE_CSQRTL 1
> +#define HAVE_CLOGL 1
> +#define HAVE_CCOSL 1
> +#define HAVE_CSINL 1
> +#define HAVE_CPOWL 1
> +#define HAVE_LDOUBLE_IEEE_QUAD_LE 1
> +#ifndef __cplusplus
> +/* #undef inline */
> +#endif
> +
> +#ifndef _NPY_NPY_CONFIG_H_
> +#error config.h should never be included directly, include npy_config.h =
instead
> +#endif
> diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb b/meta=
-oe/recipes-devtools/python/python-numpy_1.7.0.bb
> index e6d328f..99662da 100644
> --- a/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
> +++ b/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
> @@ -34,6 +34,15 @@ CONFIGFILESURI_x86-64 =3D " \
>      file://_numpyconfig.h \
>  "
> =20
> +CONFIGFILESURI_powerpc =3D " \
> +    file://config.h \
> +    file://numpyconfig.h \
> +"
> +CONFIGFILESURI_powerpc64 =3D " \
> +    file://config.h \
> +    file://_numpyconfig.h \
> +"
> +
>  S =3D "${WORKDIR}/numpy-${PV}"
> =20
>  inherit distutils
> --=20
> 1.8.3.1
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IQvoI1rdlCKiYEYW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKM5nQACgkQN1Ujt2V2gByt3ACgtAJiF3CnngdSUVB0SFPL1Wcg
W9kAn13uxwIwjimSmMBKK11Hcxu+zUvr
=xog5
-----END PGP SIGNATURE-----

--IQvoI1rdlCKiYEYW--
