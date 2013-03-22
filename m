Received: from mail-pb0-f45.google.com ([209.85.160.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UIySX-0007ze-Ji
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 10:40:34 +0100
Received: by mail-pb0-f45.google.com with SMTP id ro8so2942432pbb.18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 02:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=0NOZN7fGmSwgagia4K0zRChnHV0Og32BoPHStQzQr1o=;
	b=ZJMlbo4JrC5FUuM+n+6SXBH0S0RLj/5WiExKo80hd7rjTaSF981j6kojgpijkip6p9
	E4QAaQ4hRrwXIiz4l4+kgROHUi9fBIro/QCPoqsEGxMPDasiEgDRob8OM4simoWgSChW
	xNpsf21rF9NmnKphRWQmE5H0C8m7/imijMVxykY0JucIKSFsDIXHzQTsnQJh8QRLeWSy
	+Ws6wZLdFXt4NC6rnlovS9g114Ea6AUH1qlAD9l+VRasP/+TjlimtsSZVvI+HM4A2Tp4
	+5SI6BHL1t4AtH9B1RLXbfcLwroJI7PVA0Kv+26tN/kYXG5jLGplROk2conUBzsc2r54
	XkeA==
X-Received: by 10.66.165.34 with SMTP id yv2mr2269120pab.35.1363944211427;
	Fri, 22 Mar 2013 02:23:31 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id na4sm1750005pbc.8.2013.03.22.02.23.28
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 02:23:30 -0700 (PDT)
Date: Fri, 22 Mar 2013 10:23:29 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130322092328.GO3219@jama>
References: <1363439755-13680-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1363439755-13680-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH] python-numpy: add i586 *config.h files
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
X-List-Received-Date: Fri, 22 Mar 2013 09:40:38 -0000
X-Groupsio-MsgNum: 43656
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8N0TQpGUCeEQshoq"
Content-Disposition: inline

--8N0TQpGUCeEQshoq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 16, 2013 at 02:15:55PM +0100, Koen Kooi wrote:
> Generated using native compile on FRI2/angstrom

Applied, thanks!

>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  .../python/python-numpy/i586/config.h              | 108 +++++++++++++++=
++++++
>  .../python/python-numpy/i586/numpyconfig.h         |  24 +++++
>  .../recipes-devtools/python/python-numpy_1.7.0.bb  |   4 +
>  3 files changed, 136 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/python/python-numpy/i586/con=
fig.h
>  create mode 100644 meta-oe/recipes-devtools/python/python-numpy/i586/num=
pyconfig.h
>=20
> diff --git a/meta-oe/recipes-devtools/python/python-numpy/i586/config.h b=
/meta-oe/recipes-devtools/python/python-numpy/i586/config.h
> new file mode 100644
> index 0000000..08e41e3
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-numpy/i586/config.h
> @@ -0,0 +1,108 @@
> +#define SIZEOF_PY_INTPTR_T 4
> +#define SIZEOF_PY_LONG_LONG 8
> +#define MATHLIB m
> +#define HAVE_SIN
> +#define HAVE_COS
> +#define HAVE_TAN
> +#define HAVE_SINH
> +#define HAVE_COSH
> +#define HAVE_TANH
> +#define HAVE_FABS
> +#define HAVE_FLOOR
> +#define HAVE_CEIL
> +#define HAVE_SQRT
> +#define HAVE_LOG10
> +#define HAVE_LOG
> +#define HAVE_EXP
> +#define HAVE_ASIN
> +#define HAVE_ACOS
> +#define HAVE_ATAN
> +#define HAVE_FMOD
> +#define HAVE_MODF
> +#define HAVE_FREXP
> +#define HAVE_LDEXP
> +#define HAVE_RINT
> +#define HAVE_TRUNC
> +#define HAVE_EXP2
> +#define HAVE_LOG2
> +#define HAVE_ATAN2
> +#define HAVE_POW
> +#define HAVE_NEXTAFTER
> +#define HAVE_SINF
> +#define HAVE_COSF
> +#define HAVE_TANF
> +#define HAVE_SINHF
> +#define HAVE_COSHF
> +#define HAVE_TANHF
> +#define HAVE_FABSF
> +#define HAVE_FLOORF
> +#define HAVE_CEILF
> +#define HAVE_RINTF
> +#define HAVE_TRUNCF
> +#define HAVE_SQRTF
> +#define HAVE_LOG10F
> +#define HAVE_LOGF
> +#define HAVE_LOG1PF
> +#define HAVE_EXPF
> +#define HAVE_EXPM1F
> +#define HAVE_ASINF
> +#define HAVE_ACOSF
> +#define HAVE_ATANF
> +#define HAVE_ASINHF
> +#define HAVE_ACOSHF
> +#define HAVE_ATANHF
> +#define HAVE_HYPOTF
> +#define HAVE_ATAN2F
> +#define HAVE_POWF
> +#define HAVE_FMODF
> +#define HAVE_MODFF
> +#define HAVE_FREXPF
> +#define HAVE_LDEXPF
> +#define HAVE_EXP2F
> +#define HAVE_LOG2F
> +#define HAVE_COPYSIGNF
> +#define HAVE_NEXTAFTERF
> +#define HAVE_SINL
> +#define HAVE_COSL
> +#define HAVE_TANL
> +#define HAVE_SINHL
> +#define HAVE_COSHL
> +#define HAVE_TANHL
> +#define HAVE_FABSL
> +#define HAVE_FLOORL
> +#define HAVE_CEILL
> +#define HAVE_RINTL
> +#define HAVE_TRUNCL
> +#define HAVE_SQRTL
> +#define HAVE_LOG10L
> +#define HAVE_LOGL
> +#define HAVE_LOG1PL
> +#define HAVE_EXPL
> +#define HAVE_EXPM1L
> +#define HAVE_ASINL
> +#define HAVE_ACOSL
> +#define HAVE_ATANL
> +#define HAVE_ASINHL
> +#define HAVE_ACOSHL
> +#define HAVE_ATANHL
> +#define HAVE_HYPOTL
> +#define HAVE_ATAN2L
> +#define HAVE_POWL
> +#define HAVE_FMODL
> +#define HAVE_MODFL
> +#define HAVE_FREXPL
> +#define HAVE_LDEXPL
> +#define HAVE_EXP2L
> +#define HAVE_LOG2L
> +#define HAVE_COPYSIGNL
> +#define HAVE_NEXTAFTERL
> +#define HAVE_DECL_SIGNBIT
> +#define HAVE_COMPLEX_H
> +#define HAVE_LDOUBLE_INTEL_EXTENDED_12_BYTES_LE 1
> +#ifndef __cplusplus
> +/* #undef inline */
> +#endif
> +
> +#ifndef _NPY_NPY_CONFIG_H_
> +#error config.h should never be included directly, include npy_config.h =
instead
> +#endif
> diff --git a/meta-oe/recipes-devtools/python/python-numpy/i586/numpyconfi=
g.h b/meta-oe/recipes-devtools/python/python-numpy/i586/numpyconfig.h
> new file mode 100644
> index 0000000..ff7938c
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-numpy/i586/numpyconfig.h
> @@ -0,0 +1,24 @@
> +#ifndef _NPY_NUMPYCONFIG_H_
> +#define _NPY_NUMPYCONFIG_H_
> +
> +#include "_numpyconfig.h"
> +
> +/*=20
> + * On Mac OS X, because there is only one configuration stage for all th=
e archs
> + * in universal builds, any macro which depends on the arch needs to be
> + * harcoded
> + */
> +#ifdef __APPLE__
> +	#undef NPY_SIZEOF_LONG
> +	#undef NPY_SIZEOF_PY_INTPTR_T
> +
> +	#ifdef __LP64__
> +		#define NPY_SIZEOF_LONG 		8
> +		#define NPY_SIZEOF_PY_INTPTR_T 	8
> +	#else
> +		#define NPY_SIZEOF_LONG 		4
> +		#define NPY_SIZEOF_PY_INTPTR_T 	4
> +	#endif
> +#endif
> +
> +#endif
> diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb b/meta=
-oe/recipes-devtools/python/python-numpy_1.7.0.bb
> index bbe4e63..23bec15 100644
> --- a/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
> +++ b/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
> @@ -18,6 +18,10 @@ CONFIGFILESURI_mipsel =3D "file://config.h \
>  	   file://numpyconfig.h \
>  	  "
> =20
> +CONFIGFILESURI_i586 =3D "file://config.h \
> +                       file://numpyconfig.h \
> +                      "
> +
>  S =3D "${WORKDIR}/numpy-${PV}"
> =20
>  inherit distutils
> --=20
> 1.8.1.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8N0TQpGUCeEQshoq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFMIxAACgkQN1Ujt2V2gBzktwCfbtI+AGF1pq/XA2a0M9/Koo9E
EtMAn0+E71gx3+ZmH7lqAwN0cR+9NdYc
=5nfT
-----END PGP SIGNATURE-----

--8N0TQpGUCeEQshoq--
