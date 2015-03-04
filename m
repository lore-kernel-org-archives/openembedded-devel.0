Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4063560144
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2015 22:03:44 +0000 (UTC)
Received: by wggx13 with SMTP id x13so2337591wgg.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2015 14:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5YR/UMrSOY9gqg3taQ+Tuje5UEEJ//H//aahtnkB8M0=;
	b=a0WMbt/hDTMGOwqu/vBT1hdcxiLCP9Cq1vK/u334gTKAN+FyPvrMyycIaR8nJosXQT
	LnkgiX/0e0ZmHByv0EycCCRygIXkxqJFAtuj6OeIoRmJLyMLZrSNhVVZhssa78rGqFWs
	8vf2bhwsYDwIOrUqqQfD1aaxVJtMKdsbaAeFHaTVN3rKeHUKKvh+Y6iLPN6tfyKeWHX/
	CnQ9Zjq4VV7IitnSmBHW8eyWRhmooW/cD/DefIWHKybFAJLSYhTF6/fQf/Avua4zqj8o
	bSncQYdxWfYguBHLLk7DBn/Deroxrby0RZcVK/p+JG3+m8QhyYPtj5BqIVZDMkd0gmXl
	cHWQ==
X-Received: by 10.180.184.136 with SMTP id eu8mr5056930wic.45.1425506625301;
	Wed, 04 Mar 2015 14:03:45 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fu1sm6182187wic.2.2015.03.04.14.03.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Mar 2015 14:03:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 4 Mar 2015 23:03:48 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150304220348.GK2337@jama>
References: <1425457252-8056-1-git-send-email-mike.looijmans@topic.nl>
MIME-Version: 1.0
In-Reply-To: <1425457252-8056-1-git-send-email-mike.looijmans@topic.nl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] opencv: Upgrade to 2.4.11
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
X-List-Received-Date: Wed, 04 Mar 2015 22:03:46 -0000
X-Groupsio-MsgNum: 54627
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DozTQjXnjm3C9Xhk"
Content-Disposition: inline

--DozTQjXnjm3C9Xhk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 04, 2015 at 09:20:52AM +0100, Mike Looijmans wrote:
> Upgrade OpenCV to the 2.4.11 release.
>=20
> Remove the opencv-fix-pkgconfig-generation patch which has been integrate=
d upstream,
> be it in modified form.
> ---
>  .../opencv/opencv-fix-pkgconfig-generation.patch   | 44 ----------------=
------
>  meta-oe/recipes-support/opencv/opencv_2.4.bb       |  8 ++--
>  2 files changed, 3 insertions(+), 49 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/opencv/opencv/opencv-fix-pkgc=
onfig-generation.patch
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv/opencv-fix-pkgconfig-g=
eneration.patch b/meta-oe/recipes-support/opencv/opencv/opencv-fix-pkgconfi=
g-generation.patch
> deleted file mode 100644
> index d352778..0000000
> --- a/meta-oe/recipes-support/opencv/opencv/opencv-fix-pkgconfig-generati=
on.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -Fix pkg-config generation
> -
> -Replace absolute library path with library name spec and library search
> -path option.
> -
> -The fix has been provided by Ray Rashif (code.opencv.org/issues/1925)
> -
> -Upstream-Status: Pending
> -
> -diff -Nbaur OpenCV-2.4.3.orig/cmake/OpenCVGenPkgconfig.cmake OpenCV-2.4.=
3/cmake/OpenCVGenPkgconfig.cmake
> ---- OpenCV-2.4.3.orig/cmake/OpenCVGenPkgconfig.cmake	2012-11-04 08:40:14=
=2E243505926 +0000
> -+++ OpenCV-2.4.3/cmake/OpenCVGenPkgconfig.cmake	2012-11-04 08:40:42.2866=
49120 +0000
> -@@ -10,7 +10,7 @@
> - # ---------------------------------------------------------------------=
----------------------
> - set(prefix      "${CMAKE_INSTALL_PREFIX}")
> - set(exec_prefix "\${prefix}")
> --set(libdir      "") #TODO: need link paths for OpenCV_EXTRA_COMPONENTS
> -+set(libdir      "\${prefix}/${OPENCV_LIB_INSTALL_PATH}")
> - set(includedir  "\${prefix}/${OPENCV_INCLUDE_INSTALL_PATH}")
> - set(VERSION     ${OPENCV_VERSION})
> -=20
> -@@ -36,10 +36,11 @@
> - ocv_list_reverse(OpenCV_EXTRA_COMPONENTS)
> -=20
> - #build the list of components
> --set(OpenCV_LIB_COMPONENTS_ "")
> -+set(OpenCV_LIB_COMPONENTS_ "-L\${libdir}")
> - foreach(CVLib ${OpenCV_LIB_COMPONENTS})
> -   get_target_property(libpath ${CVLib} LOCATION_${CMAKE_BUILD_TYPE})
> -   get_filename_component(libname "${libpath}" NAME)
> -+  get_filename_component(lname "${libpath}" NAME_WE)
> -=20
> -   if(INSTALL_TO_MANGLED_PATHS)
> -     set(libname "${libname}.${OPENCV_VERSION}")
> -@@ -52,7 +53,8 @@
> -     set(installDir "${OPENCV_LIB_INSTALL_PATH}")
> -   endif()
> -=20
> --  set(OpenCV_LIB_COMPONENTS_ "${OpenCV_LIB_COMPONENTS_} \${exec_prefix}=
/${installDir}/${libname}")
> -+  string(REPLACE "libopencv" "-lopencv" lname "${lname}")
> -+  set(OpenCV_LIB_COMPONENTS_ "${OpenCV_LIB_COMPONENTS_} ${lname}")
> - endforeach()
> -=20
> - # add extra dependencies required for OpenCV
> diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recip=
es-support/opencv/opencv_2.4.bb
> index 63d7c8b..e57f9a6 100644
> --- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
> @@ -9,12 +9,10 @@ ARM_INSTRUCTION_SET =3D "arm"
> =20
>  DEPENDS =3D "python-numpy libtool swig swig-native python bzip2 zlib gli=
b-2.0"
> =20
> -SRCREV =3D "df8e28283f09825cca0c2902160b7abebcfe1b64"
> -SRC_URI =3D "git://github.com/Itseez/opencv.git;branch=3D2.4 \
> -           file://opencv-fix-pkgconfig-generation.patch \
> -"
> +SRCREV =3D "2c9547e3147779001811d01936aed38f560929fc"
> +SRC_URI =3D "git://github.com/Itseez/opencv.git;branch=3D2.4"
> =20
> -PV =3D "2.4.9+git${SRCPV}"
> +PV =3D "2.4.11+git${SRCPV}"

Please Fix this issue first:
WARNING: QA Issue: libopencv-highgui rdepends on jasper, but it isn't a
build dependency? [build-deps]
WARNING: QA Issue: libopencv-highgui rdepends on libdc1394, but it isn't
a build dependency? [build-deps]

>  S =3D "${WORKDIR}/git"
> =20
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

--DozTQjXnjm3C9Xhk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT3gUQACgkQN1Ujt2V2gBwfzQCfW5fVXY8aV1x/dNCcBwurPict
K9AAoJ/ZEaOzToWz16OrIETH7ypTUVx3
=4OXl
-----END PGP SIGNATURE-----

--DozTQjXnjm3C9Xhk--
