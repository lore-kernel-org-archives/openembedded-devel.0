Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0VPr-0006cj-3H
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2013 12:01:20 +0100
Received: by mail-pb0-f52.google.com with SMTP id mc8so142827pbc.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2013 02:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5PEhmt28yL4SZhSxhAI+X/AAF8UwFD6McOXSNkHs2/A=;
	b=HpeI175S+Q79uNiiyDEr5lZm8rvfmIK+5WRoMZ/jG3OsnCMItFumfi+hHBhXMgGtNd
	cckmnFnNpkwOouP/SIFH8l1h4zQsKb0JNnMfv+RavHLyPqygB1TDBEpltyIg6I2RiBBj
	j3HWge2rB6uwRe8z2ID/G0qzakFno9kVaXrUG4rMgBbRm+a+CxnRufVdb9AsBf6olVCF
	a6uHr1iM+lMTeA53Va2d5b+r8nXjHuS6KgUi26i3CZrcNTEQIOwDsjGj47lva2c//sVj
	w0xy0DElOQ0J6N+hvwrLCuY5AjKsKonPxMRDE4srpLD0SoZ2sWG0ICBYl9bLBj+NClJS
	5AVA==
X-Received: by 10.69.1.66 with SMTP id be2mr11487177pbd.42.1359542736671;
	Wed, 30 Jan 2013 02:45:36 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id jv1sm1245117pbc.36.2013.01.30.02.45.33
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 30 Jan 2013 02:45:35 -0800 (PST)
Date: Wed, 30 Jan 2013 11:45:31 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130130104531.GV16904@jama.palm1.palmone.com>
References: <1359532239-30333-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1359532239-30333-2-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1359532239-30333-2-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 2/2] python-numpy: add 1.7.0-rc1
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
X-List-Received-Date: Wed, 30 Jan 2013 11:01:21 -0000
X-Groupsio-MsgNum: 42922
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TrSyUYpaPvvX07X2"
Content-Disposition: inline

--TrSyUYpaPvvX07X2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 30, 2013 at 08:50:39AM +0100, Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  .../python/python-numpy/aarch64.patch              |  41 ++++++
>  .../python/python-numpy/aarch64/_numpyconfig.h     |  30 +++++
>  .../python/python-numpy/aarch64/config.h           | 139 +++++++++++++++=
++++++
>  ...python-numpy_1.4.1.bb =3D> python-numpy_1.7.0.bb} |  33 +++--

Can we add rc1 to recipe name? python-numpy_1.7.0-rc1.bb


>  4 files changed, 236 insertions(+), 7 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/python/python-numpy/aarch64.=
patch
>  create mode 100644 meta-oe/recipes-devtools/python/python-numpy/aarch64/=
_numpyconfig.h
>  create mode 100644 meta-oe/recipes-devtools/python/python-numpy/aarch64/=
config.h
>  rename meta-oe/recipes-devtools/python/{python-numpy_1.4.1.bb =3D> pytho=
n-numpy_1.7.0.bb} (50%)
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-numpy/aarch64.patch b=
/meta-oe/recipes-devtools/python/python-numpy/aarch64.patch
> new file mode 100644
> index 0000000..60d0d00
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-numpy/aarch64.patch
> @@ -0,0 +1,41 @@
> +From 7d7a5939dcf5821d9f381d57bfa2012568ef6b82 Mon Sep 17 00:00:00 2001
> +From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> +Date: Thu, 10 Jan 2013 21:49:01 +0100
> +Subject: [PATCH] Added support for AArch64 architecture
> +
> +Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> +
> +Upstream-status: backport

Please use Upstream-Status: (with capital S) like most of patches.

> +---
> + numpy/core/include/numpy/npy_cpu.h    | 2 ++
> + numpy/core/include/numpy/npy_endian.h | 1 +
> + 2 files changed, 3 insertions(+)
> +
> +diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/num=
py/npy_cpu.h
> +index 8a29788..9707a7a 100644
> +--- a/numpy/core/include/numpy/npy_cpu.h
> ++++ b/numpy/core/include/numpy/npy_cpu.h
> +@@ -66,6 +66,8 @@
> +     #define NPY_CPU_MIPSEL
> + #elif defined(__MIPSEB__)
> +     #define NPY_CPU_MIPSEB
> ++#elif defined(__aarch64__)
> ++    #define NPY_CPU_AARCH64
> + #else
> +     #error Unknown CPU, please report this to numpy maintainers with \
> +     information about your platform (OS, CPU and compiler)
> +diff --git a/numpy/core/include/numpy/npy_endian.h b/numpy/core/include/=
numpy/npy_endian.h
> +index aa5ed8b..4e3349f 100644
> +--- a/numpy/core/include/numpy/npy_endian.h
> ++++ b/numpy/core/include/numpy/npy_endian.h
> +@@ -25,6 +25,7 @@
> +             || defined(NPY_CPU_IA64)    \
> +             || defined(NPY_CPU_ALPHA)   \
> +             || defined(NPY_CPU_ARMEL)   \
> ++            || defined(NPY_CPU_AARCH64) \
> +             || defined(NPY_CPU_SH_LE)   \
> +             || defined(NPY_CPU_MIPSEL)
> +         #define NPY_BYTE_ORDER NPY_LITTLE_ENDIAN
> +--=20
> +1.8.0
> +
> diff --git a/meta-oe/recipes-devtools/python/python-numpy/aarch64/_numpyc=
onfig.h b/meta-oe/recipes-devtools/python/python-numpy/aarch64/_numpyconfig=
=2Eh
> new file mode 100644
> index 0000000..be57ac2
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-numpy/aarch64/_numpyconfig.h
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
> diff --git a/meta-oe/recipes-devtools/python/python-numpy/aarch64/config.=
h b/meta-oe/recipes-devtools/python/python-numpy/aarch64/config.h
> new file mode 100644
> index 0000000..c30b868
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-numpy/aarch64/config.h
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
> diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb b/meta=
-oe/recipes-devtools/python/python-numpy_1.7.0.bb
> similarity index 50%
> rename from meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> rename to meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
> index 2bede09..2e4bd6a 100644
> --- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> +++ b/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
> @@ -1,14 +1,20 @@
>  DESCRIPTION =3D "A sophisticated Numeric Processing Package for Python"
>  SECTION =3D "devel/python"
>  LICENSE =3D "PSF"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3c42211d73c3faa1026e671dd=
39883fa"
> -PR =3D "r5"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Df87832d854acbade6e9f5c601=
c8b30b1"
> +PR =3D "r0"
> +PV =3D "1.6.99+1.7.0rc1"
> +REALPV =3D "1.7.0rc1"
> =20
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/numpy/numpy-${REALPV}.tar.gz \
>             ${CONFIGFILESURI} \
> +           file://aarch64.patch \
>  	  "
>  CONFIGFILESURI ?=3D ""
> =20
> +CONFIGFILESURI_aarch64 =3D "file://config.h \
> +	   file://_numpyconfig.h \
> +	  "
>  CONFIGFILESURI_arm =3D "file://config.h \
>  	   file://numpyconfig.h \
>  	  "
> @@ -16,7 +22,7 @@ CONFIGFILESURI_mipsel =3D "file://config.h \
>  	   file://numpyconfig.h \
>  	  "
> =20
> -S =3D "${WORKDIR}/numpy-${PV}"
> +S =3D "${WORKDIR}/numpy-${REALPV}"
> =20
>  inherit distutils
> =20
> @@ -29,14 +35,27 @@ do_compile_prepend() {
>  	 cp ${WORKDIR}/*config.h ${S}/build/$(ls ${S}/build | grep src)/numpy/c=
ore/include/numpy/
>  }
> =20
> -SRC_URI[md5sum] =3D "5c7b5349dc3161763f7f366ceb96516b"
> -SRC_URI[sha256sum] =3D "2e7bb84573e5123e07f3c919fd433bc09b78d606252b6b71=
9e385c2a981d8e06"
> -
>  FILES_${PN}-staticdev +=3D "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.=
a"
> +SRC_URI[md5sum] =3D "a4719f5a1853bc0f8892a5956d5c4229"
> +SRC_URI[sha256sum] =3D "45ea23622f72d86bc3614446d668ee962c0475ee7b91a93e=
f85a5e0493962de5"
> =20
> +# install what is needed for numpy.test()
>  RDEPENDS_${PN} =3D "python-unittest \
>                    python-difflib \
>                    python-pprint \
>                    python-pickle \
>                    python-shell \
> +                  python-nose \
> +                  python-doctest \
> +                  python-datetime \
> +                  python-distutils \
> +                  python-misc \
> +                  python-mmap \
> +                  python-netclient \
> +                  python-numbers \
> +                  python-pydoc \
> +                  python-pkgutil \
> +                  python-email \
> +                  python-subprocess \
> +                  python-compression \
>                   "
> --=20
> 1.8.0
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TrSyUYpaPvvX07X2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEI+csACgkQN1Ujt2V2gBwxLwCglFlo7VDaOdhBca9RMTOt6BxY
3wEAn1YNitCjskUHjGfVYU7S0xQLmnyR
=egIy
-----END PGP SIGNATURE-----

--TrSyUYpaPvvX07X2--
