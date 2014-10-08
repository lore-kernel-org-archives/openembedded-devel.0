Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3AEAB71210
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Oct 2014 02:47:55 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id a1so10618640wgh.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Oct 2014 19:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QjONDCmRWwdbYhynYeDtT/NrIRRNkVjerUHoOoUmrtQ=;
	b=Ig2o7DUuVpcPTBux1lQPjEgeDYK+9aIrc80bN9uwCzi0WemaUkLCRu/xVgXofGCPmH
	5r5XUgFhcTpBCBgQ2cCHWxymbG+ncZhOSvUfld7VAhHEkFYFzFQ3PIPdk0sbLr3NHL25
	qvz9V362PIvpuDZZ31mGHE6HJSCsAYm+egX61dgFMbPMyXNPna3a10vAAFnvbkTzye3D
	56motCD27qLYNSf4OGRma0xoirZBgENmqzREYtQwubBjK2kFGUrC+X6NrKmBfHs+9t31
	feN3e/ZT9goCNfnMyoz1qwr87KsrI0oRHU3/m1MMLda9/F98wy8Vhsj/bFlE2k4o8LXk
	QabA==
X-Received: by 10.181.29.134 with SMTP id jw6mr8496478wid.69.1412736476239;
	Tue, 07 Oct 2014 19:47:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id gw6sm425194wib.8.2014.10.07.19.47.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Oct 2014 19:47:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 8 Oct 2014 04:48:58 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141008024858.GG12322@jama>
References: <1412651209-2483-1-git-send-email-nickdademo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1412651209-2483-1-git-send-email-nickdademo@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2] opencv: Add recipe for OpenCV v3.0.0-alpha.
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
X-List-Received-Date: Wed, 08 Oct 2014 02:47:57 -0000
X-Groupsio-MsgNum: 52405
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nhYGnrYv1PEJ5gA2"
Content-Disposition: inline

--nhYGnrYv1PEJ5gA2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 07, 2014 at 02:06:49PM +1100, Nick D'Ademo wrote:
> Includes fix which disables IPP for ARM builds.

I'm sorry, but it's causing vlc build failure:

| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/v=
lc/2.1.4-r0/vlc-2.1.4/modules/video_filter/opencv_example.cpp:132:59: error=
: 'cvReleaseHaarClassifierCascade' was not declared in this scope
|          cvReleaseHaarClassifierCascade( &p_sys->p_cascade );
|                                                            ^
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/v=
lc/2.1.4-r0/vlc-2.1.4/modules/video_filter/opencv_example.cpp: In function =
'picture_t* Filter(filter_t*, picture_t*)':
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/v=
lc/2.1.4-r0/vlc-2.1.4/modules/video_filter/opencv_example.cpp:175:45: error=
: 'CV_HAAR_DO_CANNY_PRUNING' was not declared in this scope
|                                              CV_HAAR_DO_CANNY_PRUNING,
|                                              ^
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/v=
lc/2.1.4-r0/vlc-2.1.4/modules/video_filter/opencv_example.cpp:176:60: error=
: 'cvHaarDetectObjects' was not declared in this scope
|                                              cvSize(20, 20) );
|                                                             ^
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/v=
lc/2.1.4-r0/vlc-2.1.4/modules/video_filter/opencv_example.cpp:197:58: error=
: 'CV_RGB' was not declared in this scope
|              cvRectangle( p_img[0], pt1, pt2, CV_RGB(0,0,0), 3, 8, 0 );
|                                                           ^
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/v=
lc/2.1.4-r0/vlc-2.1.4/modules/video_filter/opencv_example.cpp:197:69: error=
: 'cvRectangle' was not declared in this scope
|              cvRectangle( p_img[0], pt1, pt2, CV_RGB(0,0,0), 3, 8, 0 );
|                                                                      ^
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/v=
lc/2.1.4-r0/vlc-2.1.4/modules/video_filter/opencv_example.cpp:201:57: warni=
ng: deprecated conversion from string constant to 'char*' [-Wwrite-strings]
|              p_sys->event_info.p_region[i].p_description =3D "Face Detect=
ed";
|                                                          ^

Can you look into it as well (at least to disable opencv example while buil=
ding vlc).

Thanks

> Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_git.bb | 96 ++++++++++++++++++++++=
++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 meta-oe/recipes-support/opencv/opencv_git.bb
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv_git.bb b/meta-oe/recip=
es-support/opencv/opencv_git.bb
> new file mode 100644
> index 0000000..bf6fd84
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv_git.bb
> @@ -0,0 +1,96 @@
> +DESCRIPTION =3D "Opencv : The Open Computer Vision Library"
> +HOMEPAGE =3D "http://opencv.org/"
> +SECTION =3D "libs"
> +
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://include/opencv2/opencv.hpp;endline=3D41;md5=
=3D6d690d8488a6fca7a2c192932466bb14"
> +
> +ARM_INSTRUCTION_SET =3D "arm"
> +
> +DEPENDS =3D "python-numpy libtool swig swig-native python bzip2 zlib gli=
b-2.0 gstreamer gst-plugins-base"
> +
> +# Commit hash for 3.0.0-alpha tag
> +SRCREV =3D "fb9a143429f86603ff93e5bcb2d94b94780b7234"
> +SRC_URI =3D "git://github.com/Itseez/opencv.git;branch=3Dmaster \
> +           file://opencv-fix-pkgconfig-generation.patch \
> +"
> +
> +PV =3D "2.99+3.0.0-alpha+git${SRCPV}"
> +
> +S =3D "${WORKDIR}/git"
> +
> +# Do an out-of-tree build
> +OECMAKE_SOURCEPATH =3D "${S}"
> +OECMAKE_BUILDPATH =3D "${WORKDIR}/build-${TARGET_ARCH}"
> +
> +EXTRA_OECMAKE =3D "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=3D${STAGING_LIBDIR}/$=
{PYTHON_DIR}/site-packages/numpy/core/include \
> +                 -DBUILD_PYTHON_SUPPORT=3DON \
> +                 -DWITH_FFMPEG=3DON \
> +                 -DCMAKE_SKIP_RPATH=3DON \
> +                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENA=
BLE_SSE=3D1 -DENABLE_SSE2=3D1 -DENABLE_SSE3=3D1 -DENABLE_SSSE3=3D1", "", d)=
} \
> +                 ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFF=
IX=3D64", "", d)} \
> +                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFF=
IX=3D32", "", d)} \
> +                 ${@bb.utils.contains("TUNE_FEATURES", "arm", "-DWITH_IP=
P=3DOFF", "", d)} \
> +"
> +
> +PACKAGECONFIG ??=3D "eigen gtk jpeg libav png tiff v4l jasper"
> +PACKAGECONFIG[eigen] =3D "-DWITH_EIGEN=3DON,-DWITH_EIGEN=3DOFF,libeigen,"
> +PACKAGECONFIG[gtk] =3D "-DWITH_GTK=3DON,-DWITH_GTK=3DOFF,gtk+,"
> +PACKAGECONFIG[jpeg] =3D "-DWITH_JPEG=3DON,-DWITH_JPEG=3DOFF,jpeg,"
> +PACKAGECONFIG[libav] =3D "-DWITH_FFMPEG=3DON,-DWITH_FFMPEG=3DOFF,libav,"
> +PACKAGECONFIG[png] =3D "-DWITH_PNG=3DON,-DWITH_PNG=3DOFF,libpng,"
> +PACKAGECONFIG[tiff] =3D "-DWITH_TIFF=3DON,-DWITH_TIFF=3DOFF,tiff,"
> +PACKAGECONFIG[v4l] =3D "-DWITH_V4L=3DON,-DWITH_V4L=3DOFF,v4l-utils,"
> +PACKAGECONFIG[jasper] =3D "-DBUILD_JASPER=3DON,-DBUILD_JASPER=3DOFF,jasp=
er"
> +PACKAGECONFIG[pvapi] =3D '-DWITH_PVAPI=3DON -DPVAPI_LIBRARY=3D"${STAGING=
_LIBDIR}/libPvAPI.a",-DWITH_PVAPI=3DOFF,pvapi'
> +
> +inherit distutils-base pkgconfig cmake
> +
> +export BUILD_SYS
> +export HOST_SYS
> +export PYTHON_CSPEC=3D"-I${STAGING_INCDIR}/${PYTHON_DIR}"
> +export PYTHON=3D"${STAGING_BINDIR_NATIVE}/python"
> +
> +TARGET_CC_ARCH +=3D "-I${S}/include "
> +
> +PACKAGES +=3D "${PN}-apps python-opencv"
> +
> +python populate_packages_prepend () {
> +    cv_libdir =3D d.expand('${libdir}')
> +    do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenC=
V %s development package', extra_depends=3D'${PN}-dev', allow_links=3DTrue)
> +    do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenC=
V %s development package', extra_depends=3D'${PN}-dev')
> +    do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV=
 %s development package', extra_depends=3D'${PN}-dev')
> +    do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV =
%s library', extra_depends=3D'', allow_links=3DTrue)
> +
> +    pn =3D d.getVar('PN', 1)
> +    metapkg =3D  pn + '-dev'
> +    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
> +    blacklist =3D [ metapkg ]
> +    metapkg_rdepends =3D [ ]=20
> +    packages =3D d.getVar('PACKAGES', 1).split()
> +    for pkg in packages[1:]:
> +        if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.=
endswith('-dev'):
> +            metapkg_rdepends.append(pkg)
> +    d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
> +}
> +
> +PACKAGES_DYNAMIC +=3D "^libopencv-.*"
> +
> +FILES_${PN} =3D ""
> +FILES_${PN}-apps =3D "${bindir}/* ${datadir}/OpenCV"
> +FILES_${PN}-dbg +=3D "${libdir}/.debug"
> +FILES_${PN}-dev =3D "${includedir} ${libdir}/pkgconfig"
> +FILES_${PN}-doc =3D "${datadir}/OpenCV/doc"
> +FILES_${PN}-staticdev +=3D "${datadir}/OpenCV/3rdparty${base_libdir}"
> +
> +ALLOW_EMPTY_${PN} =3D "1"
> +
> +INSANE_SKIP_python-opencv =3D "True"
> +DESCRIPTION_python-opencv =3D "Python bindings to opencv"
> +FILES_python-opencv =3D "${PYTHON_SITEPACKAGES_DIR}/*"
> +RDEPENDS_python-opencv =3D "python-core python-numpy"
> +
> +do_install_append() {
> +    cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
> +    sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
> +}
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

--nhYGnrYv1PEJ5gA2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQ0phoACgkQN1Ujt2V2gBxYHACgsbe8A45NQw/3z+XP+vGdAjMr
rlUAoJ+inkGgCKKetPWIOT4ddth38Q1d
=PXx+
-----END PGP SIGNATURE-----

--nhYGnrYv1PEJ5gA2--
