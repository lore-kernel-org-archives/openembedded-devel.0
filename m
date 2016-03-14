Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 624DE60588
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 11:25:47 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id p65so97868667wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 04:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=hivjoZCcx8gbVprLqY3twoM/oY/0ez9PotN9u/J/VRc=;
	b=n1l5mwk7Vw4D22s5iU46fmXmITUW1oL7Qy88mHynHvuVM8nHLjiuBs1ZCrcE/sB2Lm
	kBil+pLM+mdLjDe85e4ppNZOIMaQLVzyZF7ED+LO68Ythh+QHOOl1xi+rGka23k8yVzH
	DjP0uku5uAGrS2sOzZ0Sdb9ULCjNanc7oNgrdu0JLuZRCYNvyIpdpSZKQlyUGpMqfDLe
	gxLhfug9bm0LzWvwZdyACOuMNXubyT3nGfgdF5uVEJ1eTb4zxa32/UYqTv47dJs5IUb0
	sCAmOuZ/5qNoxp8QCbVOIZWE6gkPwoShZcV5THVxxyv5iNa6yR2Vfn7huKrksHfAyYdT
	Nriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hivjoZCcx8gbVprLqY3twoM/oY/0ez9PotN9u/J/VRc=;
	b=J1jmhcbHIqV0k3N2+mWCpS8XCQ5orzg/v8jLuS0YDBUXUWRP9170ExqaY0AVsDGAjn
	8Oj7Jo0CLbQrk5pRUuGRSqS2rMy8iUL6b8wvcHWXMvqQRbc/xrFvZT0u2GQDztQneiwj
	co8RXPhUlZ9ZCHIzwZ2ZhvIfCi2uv+ExOziiubJ0NCpIm6Rezba637A0mZLPYFAa4/Eg
	hIEQMxEyN7jMf1STmF1HY1/ZoSW0C1zgbF5OKCDO/IjJoHQ3LDn5JiVqp5esNgcOxe6b
	owwjr7DSRqe4TKiARx0Gerdjwx0489WpkHuCQ5YihvJTCyThmqgSsoeAjLNKOk/Aol21
	6wiA==
X-Gm-Message-State: AD7BkJL/JHd6Af4JZ2zgbxYvgdTFnsRjb9lcwgINZFRKev/3c4UwYL69N259xRH0vl8jCw==
X-Received: by 10.28.148.142 with SMTP id w136mr17203483wmd.90.1457954747875; 
	Mon, 14 Mar 2016 04:25:47 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	vw2sm21805218wjc.43.2016.03.14.04.25.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Mar 2016 04:25:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 14 Mar 2016 12:29:09 +0100
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Message-ID: <20160314112909.GC2560@jama>
References: <1457951544-23279-1-git-send-email-ricardo.ribalda@gmail.com>
	<1457951544-23279-3-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1457951544-23279-3-git-send-email-ricardo.ribalda@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 3/4] opencv: Update to version 3.1
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
X-List-Received-Date: Mon, 14 Mar 2016 11:25:49 -0000
X-Groupsio-MsgNum: 60507
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7qSK/uQB79J36Y4o"
Content-Disposition: inline

--7qSK/uQB79J36Y4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2016 at 11:32:23AM +0100, Ricardo Ribalda Delgado wrote:
> The first major update in 3.0 release series

Fails to apply.

Please resend with -M.

>=20
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_3.0.bb | 133 ---------------------=
------
>  meta-oe/recipes-support/opencv/opencv_3.1.bb | 133 +++++++++++++++++++++=
++++++
>  2 files changed, 133 insertions(+), 133 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/opencv/opencv_3.0.bb
>  create mode 100644 meta-oe/recipes-support/opencv/opencv_3.1.bb
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.bb b/meta-oe/recip=
es-support/opencv/opencv_3.0.bb
> deleted file mode 100644
> index 1a34efa7f01f..000000000000
> --- a/meta-oe/recipes-support/opencv/opencv_3.0.bb
> +++ /dev/null
> @@ -1,133 +0,0 @@
> -SUMMARY =3D "Opencv : The Open Computer Vision Library"
> -HOMEPAGE =3D "http://opencv.org/"
> -SECTION =3D "libs"
> -
> -LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0ea90d28b4de883d7af5e6711f14f=
7bf"
> -
> -ARM_INSTRUCTION_SET_armv4 =3D "arm"
> -ARM_INSTRUCTION_SET_armv5 =3D "arm"
> -
> -DEFAULT_PREFERENCE =3D "-1"
> -
> -DEPENDS =3D "python-numpy libtool swig swig-native python bzip2 zlib gli=
b-2.0"
> -
> -SRCREV_opencv =3D "424c2bddb39dae97dc4639a24eaa0e0c8fbb8e69"
> -SRCREV_contrib =3D "844c30e8b2f2f4b34b96a169fafe9beea3c45e87"
> -SRCREV_FORMAT =3D "opencv"
> -SRC_URI =3D "git://github.com/Itseez/opencv.git;name=3Dopencv \
> -	   git://github.com/Itseez/opencv_contrib.git;destsuffix=3Dcontrib;name=
=3Dcontrib"
> -
> -PV =3D "3.0+git${SRCPV}"
> -
> -S =3D "${WORKDIR}/git"
> -
> -EXTRA_OECMAKE =3D "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=3D${STAGING_LIBDIR}=
/${PYTHON_DIR}/site-packages/numpy/core/include \
> -		 -DOPENCV_EXTRA_MODULES_PATH=3D${WORKDIR}/contrib/modules \
> -                 -DWITH_1394=3DOFF \
> -                 -DCMAKE_SKIP_RPATH=3DON \
> -                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENA=
BLE_SSE=3D1 -DENABLE_SSE2=3D1 -DENABLE_SSE3=3D1 -DENABLE_SSSE3=3D1", "", d)=
} \
> -                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DE=
NABLE_SSE=3D1 -DENABLE_SSE2=3D1 -DENABLE_SSE3=3D1 -DENABLE_SSSE3=3D1 -DENAB=
LE_SSE41=3D1", "", d)} \
> -                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DE=
NABLE_SSE=3D1 -DENABLE_SSE2=3D1 -DENABLE_SSE3=3D1 -DENABLE_SSSE3=3D1 -DENAB=
LE_SSE41=3D1 -DENABLE_SSE42=3D1", "", d)} \
> -                 ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFF=
IX=3D64", "", d)} \
> -                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFF=
IX=3D32", "", d)} \
> -"
> -
> -PACKAGECONFIG ??=3D "eigen jpeg png tiff v4l libv4l gstreamer samples tb=
b \
> -                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk",=
 "", d)} \
> -		   ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "liba=
v", "", d)}"
> -
> -PACKAGECONFIG[amdblas] =3D "-DWITH_OPENCLAMDBLAS=3DON,-DWITH_OPENCLAMDBL=
AS=3DOFF,libclamdblas,"
> -PACKAGECONFIG[amdfft] =3D "-DWITH_OPENCLAMDFFT=3DON,-DWITH_OPENCLAMDFFT=
=3DOFF,libclamdfft,"
> -PACKAGECONFIG[eigen] =3D "-DWITH_EIGEN=3DON,-DWITH_EIGEN=3DOFF,libeigen,"
> -PACKAGECONFIG[gstreamer] =3D "-DWITH_GSTREAMER=3DON,-DWITH_GSTREAMER=3DO=
FF,gstreamer1.0 gstreamer1.0-plugins-base,"
> -PACKAGECONFIG[gtk] =3D "-DWITH_GTK=3DON,-DWITH_GTK=3DOFF,gtk+3,"
> -PACKAGECONFIG[jasper] =3D "-DWITH_JASPER=3DON,-DWITH_JASPER=3DOFF,jasper=
,"
> -PACKAGECONFIG[jpeg] =3D "-DWITH_JPEG=3DON,-DWITH_JPEG=3DOFF,jpeg,"
> -PACKAGECONFIG[libav] =3D "-DWITH_FFMPEG=3DON,-DWITH_FFMPEG=3DOFF,libav,"
> -PACKAGECONFIG[libv4l] =3D "-DWITH_LIBV4L=3DON,-DWITH_LIBV4L=3DOFF,v4l-ut=
ils,"
> -PACKAGECONFIG[opencl] =3D "-DWITH_OPENCL=3DON,-DWITH_OPENCL=3DOFF,opencl=
-headers,"
> -PACKAGECONFIG[oracle-java] =3D "-DJAVA_INCLUDE_PATH=3D${JAVA_HOME}/inclu=
de -DJAVA_INCLUDE_PATH2=3D${JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PAT=
H=3D${JAVA_HOME}/include -DJAVA_AWT_LIBRARY=3D${JAVA_HOME}/lib/amd64/libjaw=
t.so -DJAVA_JVM_LIBRARY=3D${JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-nati=
ve oracle-jse-jdk oracle-jse-jdk-native,"
> -PACKAGECONFIG[png] =3D "-DWITH_PNG=3DON,-DWITH_PNG=3DOFF,libpng,"
> -PACKAGECONFIG[samples] =3D "-DBUILD_EXAMPLES=3DON -DINSTALL_PYTHON_EXAMP=
LES=3DON,-DBUILD_EXAMPLES=3DOFF,,"
> -PACKAGECONFIG[tbb] =3D "-DWITH_TBB=3DON,-DWITH_TBB=3DOFF,tbb,"
> -PACKAGECONFIG[tiff] =3D "-DWITH_TIFF=3DON,-DWITH_TIFF=3DOFF,tiff,"
> -PACKAGECONFIG[v4l] =3D "-DWITH_V4L=3DON,-DWITH_V4L=3DOFF,v4l-utils,"
> -
> -inherit distutils-base pkgconfig cmake
> -
> -export BUILD_SYS
> -export HOST_SYS
> -export PYTHON_CSPEC=3D"-I${STAGING_INCDIR}/${PYTHON_DIR}"
> -export PYTHON=3D"${STAGING_BINDIR_NATIVE}/python"
> -export JAVA_HOME=3D"${STAGING_DIR_NATIVE}/usr/bin/java"
> -export ANT_DIR=3D"${STAGING_DIR_NATIVE}/usr/share/ant/"
> -
> -TARGET_CC_ARCH +=3D "-I${S}/include "
> -
> -PACKAGES +=3D "${PN}-java-dbg ${PN}-java ${PN}-samples-dbg ${PN}-samples=
 ${PN}-apps python-opencv"
> -
> -python populate_packages_prepend () {
> -    cv_libdir =3D d.expand('${libdir}')
> -    cv_libdir_dbg =3D d.expand('${libdir}/.debug')
> -    do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenC=
V %s development package', extra_depends=3D'${PN}-dev', allow_links=3DTrue)
> -    do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenC=
V %s development package', extra_depends=3D'${PN}-dev')
> -    do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV=
 %s development package', extra_depends=3D'${PN}-dev')
> -    do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV =
%s library', extra_depends=3D'', allow_links=3DTrue)
> -
> -    pn =3D d.getVar('PN', 1)
> -    metapkg =3D  pn + '-dev'
> -    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
> -    blacklist =3D [ metapkg ]
> -    metapkg_rdepends =3D [ ]
> -    packages =3D d.getVar('PACKAGES', 1).split()
> -    for pkg in packages[1:]:
> -        if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.=
endswith('-dev'):
> -            metapkg_rdepends.append(pkg)
> -    d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
> -
> -    metapkg =3D  pn
> -    blacklist =3D [ metapkg ]
> -    metapkg_rdepends =3D [ ]
> -    for pkg in packages[1:]:
> -        if not pkg in blacklist and not pkg in metapkg_rdepends and not =
pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-do=
c') :
> -            metapkg_rdepends.append(pkg)
> -    bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
> -
> -}
> -
> -PACKAGES_DYNAMIC +=3D "^libopencv-.*"
> -
> -FILES_${PN} =3D ""
> -FILES_${PN}-apps =3D "${bindir}/* ${datadir}/OpenCV"
> -FILES_${PN}-dbg +=3D "${libdir}/.debug"
> -FILES_${PN}-dev =3D "${includedir} ${libdir}/pkgconfig"
> -FILES_${PN}-doc =3D "${datadir}/OpenCV/doc"
> -FILES_${PN}-java =3D "${datadir}/OpenCV/java"
> -FILES_${PN}-java-dbg =3D "${datadir}/OpenCV/java/.debug/"
> -FILES_${PN}-samples =3D "${datadir}/OpenCV/samples/"
> -FILES_${PN}-samples-dbg =3D "${datadir}/OpenCV/samples/bin/.debug"
> -
> -INSANE_SKIP_${PN}-apps =3D "staticdev"
> -INSANE_SKIP_${PN}-java =3D "libdir"
> -INSANE_SKIP_${PN}-java-dbg =3D "libdir"
> -
> -ALLOW_EMPTY_${PN} =3D "1"
> -
> -SUMMARY_python-opencv =3D "Python bindings to opencv"
> -FILES_python-opencv =3D "${PYTHON_SITEPACKAGES_DIR}/*"
> -RDEPENDS_python-opencv =3D "python-core python-numpy"
> -
> -do_install_append() {
> -    cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
> -    sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
> -
> -    # Move Python files into correct library folder (for multilib build)
> -    if [ "$libdir" !=3D "/usr/lib" ]; then
> -        mv ${D}/usr/lib/* ${D}/${libdir}/
> -        rm -rf ${D}/usr/lib
> -    fi
> -
> -    install -d ${D}${datadir}/OpenCV/samples/bin/
> -    cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/samples=
/bin/
> -}
> \ No newline at end of file
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recip=
es-support/opencv/opencv_3.1.bb
> new file mode 100644
> index 000000000000..9fd3b12e3631
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
> @@ -0,0 +1,133 @@
> +SUMMARY =3D "Opencv : The Open Computer Vision Library"
> +HOMEPAGE =3D "http://opencv.org/"
> +SECTION =3D "libs"
> +
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0ea90d28b4de883d7af5e6711f14f=
7bf"
> +
> +ARM_INSTRUCTION_SET_armv4 =3D "arm"
> +ARM_INSTRUCTION_SET_armv5 =3D "arm"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +DEPENDS =3D "python-numpy libtool swig swig-native python bzip2 zlib gli=
b-2.0 libwebp"
> +
> +SRCREV_opencv =3D "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
> +SRCREV_contrib =3D "5409d5ad560523c85c6796cc5a009347072d883c"
> +SRCREV_FORMAT =3D "opencv"
> +SRC_URI =3D "git://github.com/Itseez/opencv.git;name=3Dopencv \
> +	   git://github.com/Itseez/opencv_contrib.git;destsuffix=3Dcontrib;name=
=3Dcontrib"
> +
> +PV =3D "3.1+git${SRCPV}"
> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OECMAKE =3D "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=3D${STAGING_LIBDIR}=
/${PYTHON_DIR}/site-packages/numpy/core/include \
> +		 -DOPENCV_EXTRA_MODULES_PATH=3D${WORKDIR}/contrib/modules \
> +                 -DWITH_1394=3DOFF \
> +                 -DCMAKE_SKIP_RPATH=3DON \
> +                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENA=
BLE_SSE=3D1 -DENABLE_SSE2=3D1 -DENABLE_SSE3=3D1 -DENABLE_SSSE3=3D1", "", d)=
} \
> +                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DE=
NABLE_SSE=3D1 -DENABLE_SSE2=3D1 -DENABLE_SSE3=3D1 -DENABLE_SSSE3=3D1 -DENAB=
LE_SSE41=3D1", "", d)} \
> +                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DE=
NABLE_SSE=3D1 -DENABLE_SSE2=3D1 -DENABLE_SSE3=3D1 -DENABLE_SSSE3=3D1 -DENAB=
LE_SSE41=3D1 -DENABLE_SSE42=3D1", "", d)} \
> +                 ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFF=
IX=3D64", "", d)} \
> +                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFF=
IX=3D32", "", d)} \
> +"
> +
> +PACKAGECONFIG ??=3D "eigen jpeg png tiff v4l libv4l gstreamer samples tb=
b \
> +                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk",=
 "", d)} \
> +		   ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "liba=
v", "", d)}"
> +
> +PACKAGECONFIG[amdblas] =3D "-DWITH_OPENCLAMDBLAS=3DON,-DWITH_OPENCLAMDBL=
AS=3DOFF,libclamdblas,"
> +PACKAGECONFIG[amdfft] =3D "-DWITH_OPENCLAMDFFT=3DON,-DWITH_OPENCLAMDFFT=
=3DOFF,libclamdfft,"
> +PACKAGECONFIG[eigen] =3D "-DWITH_EIGEN=3DON,-DWITH_EIGEN=3DOFF,libeigen,"
> +PACKAGECONFIG[gstreamer] =3D "-DWITH_GSTREAMER=3DON,-DWITH_GSTREAMER=3DO=
FF,gstreamer1.0 gstreamer1.0-plugins-base,"
> +PACKAGECONFIG[gtk] =3D "-DWITH_GTK=3DON,-DWITH_GTK=3DOFF,gtk+3,"
> +PACKAGECONFIG[jasper] =3D "-DWITH_JASPER=3DON,-DWITH_JASPER=3DOFF,jasper=
,"
> +PACKAGECONFIG[jpeg] =3D "-DWITH_JPEG=3DON,-DWITH_JPEG=3DOFF,jpeg,"
> +PACKAGECONFIG[libav] =3D "-DWITH_FFMPEG=3DON,-DWITH_FFMPEG=3DOFF,libav,"
> +PACKAGECONFIG[libv4l] =3D "-DWITH_LIBV4L=3DON,-DWITH_LIBV4L=3DOFF,v4l-ut=
ils,"
> +PACKAGECONFIG[opencl] =3D "-DWITH_OPENCL=3DON,-DWITH_OPENCL=3DOFF,opencl=
-headers,"
> +PACKAGECONFIG[oracle-java] =3D "-DJAVA_INCLUDE_PATH=3D${JAVA_HOME}/inclu=
de -DJAVA_INCLUDE_PATH2=3D${JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PAT=
H=3D${JAVA_HOME}/include -DJAVA_AWT_LIBRARY=3D${JAVA_HOME}/lib/amd64/libjaw=
t.so -DJAVA_JVM_LIBRARY=3D${JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-nati=
ve oracle-jse-jdk oracle-jse-jdk-native,"
> +PACKAGECONFIG[png] =3D "-DWITH_PNG=3DON,-DWITH_PNG=3DOFF,libpng,"
> +PACKAGECONFIG[samples] =3D "-DBUILD_EXAMPLES=3DON -DINSTALL_PYTHON_EXAMP=
LES=3DON,-DBUILD_EXAMPLES=3DOFF,,"
> +PACKAGECONFIG[tbb] =3D "-DWITH_TBB=3DON,-DWITH_TBB=3DOFF,tbb,"
> +PACKAGECONFIG[tiff] =3D "-DWITH_TIFF=3DON,-DWITH_TIFF=3DOFF,tiff,"
> +PACKAGECONFIG[v4l] =3D "-DWITH_V4L=3DON,-DWITH_V4L=3DOFF,v4l-utils,"
> +
> +inherit distutils-base pkgconfig cmake
> +
> +export BUILD_SYS
> +export HOST_SYS
> +export PYTHON_CSPEC=3D"-I${STAGING_INCDIR}/${PYTHON_DIR}"
> +export PYTHON=3D"${STAGING_BINDIR_NATIVE}/python"
> +export JAVA_HOME=3D"${STAGING_DIR_NATIVE}/usr/bin/java"
> +export ANT_DIR=3D"${STAGING_DIR_NATIVE}/usr/share/ant/"
> +
> +TARGET_CC_ARCH +=3D "-I${S}/include "
> +
> +PACKAGES +=3D "${PN}-java-dbg ${PN}-java ${PN}-samples-dbg ${PN}-samples=
 ${PN}-apps python-opencv"
> +
> +python populate_packages_prepend () {
> +    cv_libdir =3D d.expand('${libdir}')
> +    cv_libdir_dbg =3D d.expand('${libdir}/.debug')
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
> +    metapkg_rdepends =3D [ ]
> +    packages =3D d.getVar('PACKAGES', 1).split()
> +    for pkg in packages[1:]:
> +        if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.=
endswith('-dev'):
> +            metapkg_rdepends.append(pkg)
> +    d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
> +
> +    metapkg =3D  pn
> +    blacklist =3D [ metapkg ]
> +    metapkg_rdepends =3D [ ]
> +    for pkg in packages[1:]:
> +        if not pkg in blacklist and not pkg in metapkg_rdepends and not =
pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-do=
c') :
> +            metapkg_rdepends.append(pkg)
> +    bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
> +
> +}
> +
> +PACKAGES_DYNAMIC +=3D "^libopencv-.*"
> +
> +FILES_${PN} =3D ""
> +FILES_${PN}-apps =3D "${bindir}/* ${datadir}/OpenCV"
> +FILES_${PN}-dbg +=3D "${libdir}/.debug"
> +FILES_${PN}-dev =3D "${includedir} ${libdir}/pkgconfig"
> +FILES_${PN}-doc =3D "${datadir}/OpenCV/doc"
> +FILES_${PN}-java =3D "${datadir}/OpenCV/java"
> +FILES_${PN}-java-dbg =3D "${datadir}/OpenCV/java/.debug/"
> +FILES_${PN}-samples =3D "${datadir}/OpenCV/samples/"
> +FILES_${PN}-samples-dbg =3D "${datadir}/OpenCV/samples/bin/.debug"
> +
> +INSANE_SKIP_${PN}-apps =3D "staticdev"
> +INSANE_SKIP_${PN}-java =3D "libdir"
> +INSANE_SKIP_${PN}-java-dbg =3D "libdir"
> +
> +ALLOW_EMPTY_${PN} =3D "1"
> +
> +SUMMARY_python-opencv =3D "Python bindings to opencv"
> +FILES_python-opencv =3D "${PYTHON_SITEPACKAGES_DIR}/*"
> +RDEPENDS_python-opencv =3D "python-core python-numpy"
> +
> +do_install_append() {
> +    cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
> +    sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
> +
> +    # Move Python files into correct library folder (for multilib build)
> +    if [ "$libdir" !=3D "/usr/lib" ]; then
> +        mv ${D}/usr/lib/* ${D}/${libdir}/
> +        rm -rf ${D}/usr/lib
> +    fi
> +
> +    install -d ${D}${datadir}/OpenCV/samples/bin/
> +    cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/samples=
/bin/
> +}
> \ No newline at end of file
> --=20
> 2.7.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7qSK/uQB79J36Y4o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbmoIUACgkQN1Ujt2V2gBw9WQCfai1Xsq9PuMkbpriHur3089Bk
NB0An01f7TyxlNBGxYt5KEQdYwOw9wrQ
=q/xK
-----END PGP SIGNATURE-----

--7qSK/uQB79J36Y4o--
