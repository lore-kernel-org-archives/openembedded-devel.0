Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9FEAB60053
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 12:58:44 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 20so23454460wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 05:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=hJh6KnG3bQaFrAZOSqyir3CTlHbEYuH+bhasbRJzsRM=;
	b=kmDSRYCvpPRq4YlsNaMXanK7/zYEVffpRw61wL/tZC2U8WECGJ1wg3c7P1AlLe7yKd
	BIIgajl2CRLm196xmtLXe+ZpL0E/shlwF0SkuXRqyvgjXNM2c8fAycQEf27tIqjrRnCD
	C1i78hLO/cn6eU2+98P5YaASGdVAc4+snVe8NdEA/Lk/WIKFIij5M0z9bJ3tcfeAqIz1
	3VhepX717t8Yj4b+33IAidfnD0wiy1+Zw5j3EtiMOpceJc/qJif9+eMOPb2sdf0l4yqS
	lV2sXZAj0heOaws3qrME/Sio1vz4VBTrGbmVognJWfN8sZC74Z71GBJ89HRdQe++tuuU
	JnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hJh6KnG3bQaFrAZOSqyir3CTlHbEYuH+bhasbRJzsRM=;
	b=e6k8ApW8cSytklk0GDiH2/ze3LYLDqA2AjvFnz40d0/eHGgQLstwBi0elv9dMjuxBs
	jNHW+vob71dz2alAKnCyEvHP1GpmgTR9p4ywoG3QlXYBTiCCrARNspqE8vJ0XSSiekIX
	UL7abfG/a0FkoYQZAzaFLRtyWZk51XlW68DaFm4haTRZNuQ1MuSBdhWSQTFkYvhGm73e
	X3wzZ5AtH5oaDW5VIueIFT6QXh9Iu5lSAozBBKyqBIIVzJMt/m11SVcMdLJ3TZ8P32NU
	dSxZeOjXgaqpkY6x7FeitZgjZtRU20vtuDY45Ax+XNIPNyV4FR0XEX9TVUVnXJHHVBXQ
	e7SQ==
X-Gm-Message-State: AD7BkJKMQfFqEkz2rQhWfVxI011wZyl/zBlVbWNeWvfNJTLGRtH4jeAzjhH/rEWyqEgfbw==
X-Received: by 10.194.78.129 with SMTP id b1mr14992827wjx.60.1459429125328;
	Thu, 31 Mar 2016 05:58:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ll9sm8958897wjc.29.2016.03.31.05.58.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Mar 2016 05:58:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 31 Mar 2016 14:58:51 +0200
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Message-ID: <20160331125851.GB2540@jama>
References: <1459423593-4123-1-git-send-email-ricardo.ribalda@gmail.com>
	<1459423593-4123-6-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1459423593-4123-6-git-send-email-ricardo.ribalda@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v4 5/7] opencv: Use pre-downloaded ipp
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Mar 2016 12:58:46 -0000
X-Groupsio-MsgNum: 60750
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m51xatjYGsM+13rf"
Content-Disposition: inline

--m51xatjYGsM+13rf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2016 at 01:26:31PM +0200, Ricardo Ribalda Delgado wrote:
> We should not rely on cmake downloading ipp at configure time.
>=20
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  ...01-3rdparty-ippicv-Use-pre-downloaded-ipp.patch | 28 ++++++++++++++++=
++++++
>  meta-oe/recipes-support/opencv/opencv_3.1.bb       |  8 +++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-3rdparty-i=
ppicv-Use-pre-downloaded-ipp.patch
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-U=
se-pre-downloaded-ipp.patch b/meta-oe/recipes-support/opencv/opencv/0001-3r=
dparty-ippicv-Use-pre-downloaded-ipp.patch
> new file mode 100644
> index 000000000000..d568018b8d91
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-=
downloaded-ipp.patch
> @@ -0,0 +1,28 @@
> +From 049f931207631aa54af55a2917318d032b2ef3fa Mon Sep 17 00:00:00 2001
> +From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> +Date: Thu, 31 Mar 2016 00:20:15 +0200
> +Subject: [PATCH] 3rdparty/ippicv: Use pre-downloaded ipp
> +
> +Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> +---
> + 3rdparty/ippicv/downloader.cmake | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/3rdparty/ippicv/downloader.cmake b/3rdparty/ippicv/download=
er.cmake
> +index a6016dbe10bc..af4062c8e95e 100644
> +--- a/3rdparty/ippicv/downloader.cmake
> ++++ b/3rdparty/ippicv/downloader.cmake
> +@@ -31,8 +31,10 @@ function(_icv_downloader)
> +     return() # Not supported
> +   endif()
> +=20
> ++  if(NOT DEFINED OPENCV_ICV_PATH)
> +   set(OPENCV_ICV_UNPACK_PATH "${CMAKE_CURRENT_LIST_DIR}/unpack")
> +   set(OPENCV_ICV_PATH "${OPENCV_ICV_UNPACK_PATH}${OPENCV_ICV_PACKAGE_SU=
BDIR}")
> ++  endif()
> +=20
> +   if(DEFINED OPENCV_ICV_PACKAGE_DOWNLOADED
> +        AND OPENCV_ICV_PACKAGE_DOWNLOADED STREQUAL OPENCV_ICV_PACKAGE_HA=
SH
> +--=20
> +2.8.0.rc3
> +
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recip=
es-support/opencv/opencv_3.1.bb
> index de6d8d9fe345..84a592799c0a 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
> @@ -14,9 +14,15 @@ DEPENDS =3D "python-numpy libtool swig swig-native pyt=
hon bzip2 zlib glib-2.0 libw
> =20
>  SRCREV_opencv =3D "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
>  SRCREV_contrib =3D "5409d5ad560523c85c6796cc5a009347072d883c"
> +IPP_MD5 =3D "808b791a6eac9ed78d32a7666804320e"
> +SRC_URI[ipp.md5sum] =3D "${IPP_MD5}"
> +SRC_URI[ipp.sha256sum] =3D "4333833e40afaa22c804169e44f9a63e357e21476b76=
5a5683bcb3760107f0da"
> +

Why don't you add normal git repo https://github.com/Itseez/opencv_3rdparty
in corresponding branch/revision?

>  SRCREV_FORMAT =3D "opencv"
>  SRC_URI =3D "git://github.com/Itseez/opencv.git;name=3Dopencv \
>              git://github.com/Itseez/opencv_contrib.git;destsuffix=3Dcont=
rib;name=3Dcontrib \
> +            https://raw.githubusercontent.com/Itseez/opencv_3rdparty/81a=
676001ca8075ada498583e4166079e5744668/ippicv/ippicv_linux_20151201.tgz;name=
=3Dipp \
> +            file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
>              file://fixpkgconfig.patch"
> =20
>  PV =3D "3.1+git${SRCPV}"
> @@ -27,6 +33,8 @@ EXTRA_OECMAKE =3D "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=3D=
${STAGING_LIBDIR}/${PYTHON_DI
>  		 -DOPENCV_EXTRA_MODULES_PATH=3D${WORKDIR}/contrib/modules \
>                   -DWITH_1394=3DOFF \
>                   -DCMAKE_SKIP_RPATH=3DON \
> +                 -DOPENCV_ICV_PACKAGE_DOWNLOADED=3D${IPP_MD5} \
> +                 -DOPENCV_ICV_PATH=3D${WORKDIR}/ippicv_lnx \
>                   ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENA=
BLE_SSE=3D1 -DENABLE_SSE2=3D1 -DENABLE_SSE3=3D1 -DENABLE_SSSE3=3D1", "", d)=
} \
>                   ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DE=
NABLE_SSE=3D1 -DENABLE_SSE2=3D1 -DENABLE_SSE3=3D1 -DENABLE_SSSE3=3D1 -DENAB=
LE_SSE41=3D1", "", d)} \
>                   ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DE=
NABLE_SSE=3D1 -DENABLE_SSE2=3D1 -DENABLE_SSE3=3D1 -DENABLE_SSSE3=3D1 -DENAB=
LE_SSE41=3D1 -DENABLE_SSE42=3D1", "", d)} \
> --=20
> 2.8.0.rc3
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--m51xatjYGsM+13rf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlb9HwsACgkQN1Ujt2V2gBzQfACgj4ME2W84qdUv77Nu1Kkd6qy9
YpcAn1qZuKdYd0vmIfTTaimW5a8Rcl2Q
=UdaU
-----END PGP SIGNATURE-----

--m51xatjYGsM+13rf--
