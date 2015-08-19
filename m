Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E4CC173E11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 14:34:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 19 Aug 2015 07:34:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,710,1432623600"; d="scan'208";a="786824952"
Received: from mclawlor-mobl5.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.12.193])
	by fmsmga002.fm.intel.com with ESMTP; 19 Aug 2015 07:34:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 19 Aug 2015 15:34:13 +0100
Message-ID: <2715823.yrG8XtC48O@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.4-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1439993274-3955-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1439993274-3955-1-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v4] Opencv: Add OpenCV 3.0
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
X-List-Received-Date: Wed, 19 Aug 2015 14:34:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ricardo,

Firstly can you please not send patches to the openembedded-core mailing list 
that aren't for OE-Core? I probably don't need to be CC'd on every patch 
either unless it's a recipe I've worked on.

A couple of other comments below.

On Wednesday 19 August 2015 16:07:54 Ricardo Ribalda Delgado wrote:
> -Support for new PACKAGECONFIGS
> -Merge with opencv-samples
> 
> Since it is not backward compatible with 2.x and cannot be installed in
> parallel it has a DEFAULT_PREFERENCE of -1.
> 
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
> v4: Fix suggested by Nathan Lynch <Nathan_Lynch@mentor.com>
>   Wrong url on HOMEPAGE
> 
>  meta-oe/recipes-support/opencv/opencv_3.0.bb | 128
> +++++++++++++++++++++++++++ 1 file changed, 128 insertions(+)
>  create mode 100644 meta-oe/recipes-support/opencv/opencv_3.0.bb
> 
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.bb
> b/meta-oe/recipes-support/opencv/opencv_3.0.bb new file mode 100644
> index 000000000000..36ab6271edd6
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv_3.0.bb
> @@ -0,0 +1,128 @@
> +SUMMARY = "Opencv : The Open Computer Vision Library"
> +HOMEPAGE = "http://opencv.org/"
> +SECTION = "libs"
> +
> +LICENSE = "BSD"

I realise this is in the older recipe, but can you change this to be more 
specific i.e. BSD-2-Clause, BSD-3-Clause, etc.

> +LIC_FILES_CHKSUM =
> "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932
> 466bb14" +
> +ARM_INSTRUCTION_SET = "arm"
> +
> +DEFAULT_PREFERENCE = "-1"
> +
> +DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib
> glib-2.0" +
> +SRCREV_opencv = "424c2bddb39dae97dc4639a24eaa0e0c8fbb8e69"
> +SRCREV_contrib = "844c30e8b2f2f4b34b96a169fafe9beea3c45e87"
> +SRCREV_FORMAT = "opencv"
> +SRC_URI = "git://github.com/Itseez/opencv.git;name=opencv \
> +	  
> git://github.com/Itseez/opencv_contrib.git;destsuffix=contrib;name=contrib"
> +
> +PV = "3.0+git${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OECMAKE =
> "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-pac
> kages/numpy/core/include \ +		
> -DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
> +                 -DWITH_1394=OFF \
> +                 -DCMAKE_SKIP_RPATH=ON \
> +                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3",
> "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)}
> \ +                 ${@base_conditional("libdir", "/usr/lib64",
> "-DLIB_SUFFIX=64", "", d)} \ +                
> ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \ +"
> +
> +PACKAGECONFIG ??= "eigen jpeg libav png tiff v4l gstreamer samples tbb\
> +                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk",
> "", d)}" +PACKAGECONFIG[eigen] =
> "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen," +PACKAGECONFIG[gtk] =
> "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+3,"
> +PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
> +PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
> +PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
> +PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
> +PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
> +PACKAGECONFIG[jasper] = "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
> +PACKAGECONFIG[amdblas] =
> "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
> +PACKAGECONFIG[amdfft] =
> "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
> +PACKAGECONFIG[opencl] =
> "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers,"
> +PACKAGECONFIG[gstreamer] =
> "-DWITH_GSTREAMER=ON,-DWITH_GSTREAMER=OFF,gstreamer1.0
> gstreamer1.0-plugins-base," +PACKAGECONFIG[oracle-java] =
> "-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include
> -DJAVA_INCLUDE_PATH2=${JAVA_HOME}/include/linux
> -DJAVA_AWT_INCLUDE_PATH=${JAVA_HOME}/include
> -DJAVA_AWT_LIBRARY=${JAVA_HOME}/lib/amd64/libjawt.so
> -DJAVA_JVM_LIBRARY=${JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native
> oracle-jse-jdk oracle-jse-jdk-native," +PACKAGECONFIG[samples] =
> "-DBUILD_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON,-DBUILD_EXAMPLES=OFF,,"
> +PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
> +
> +inherit distutils-base pkgconfig cmake
> +
> +export BUILD_SYS
> +export HOST_SYS
> +export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
> +export PYTHON="${STAGING_BINDIR_NATIVE}/python"
> +export JAVA_HOME="${STAGING_DIR_NATIVE}/usr/bin/java"
> +export ANT_DIR="${STAGING_DIR_NATIVE}/usr/share/ant/"
> +
> +TARGET_CC_ARCH += "-I${S}/include "
> +
> +PACKAGES += "${PN}-java-dbg ${PN}-java ${PN}-samples-dbg ${PN}-samples
> ${PN}-apps python-opencv" +
> +python populate_packages_prepend () {
> +    cv_libdir = d.expand('${libdir}')
> +    cv_libdir_dbg = d.expand('${libdir}/.debug')
> +    do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV
> %s development package', extra_depends='${PN}-dev', allow_links=True) +   
> do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV %s
> development package', extra_depends='${PN}-dev') +    do_split_packages(d,
> cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s development package',
> extra_depends='${PN}-dev') +    do_split_packages(d, cv_libdir,
> '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s library', extra_depends='',
> allow_links=True) +
> +    pn = d.getVar('PN', 1)
> +    metapkg =  pn + '-dev'
> +    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
> +    blacklist = [ metapkg ]
> +    metapkg_rdepends = [ ]
> +    packages = d.getVar('PACKAGES', 1).split()
> +    for pkg in packages[1:]:
> +        if not pkg in blacklist and not pkg in metapkg_rdepends and
> pkg.endswith('-dev'): +            metapkg_rdepends.append(pkg)
> +    d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
> +
> +    blacklist = [ metapkg ]
> +    metapkg =  pn
> +    metapkg_rdepends = [ ]
> +    for pkg in packages[1:]:
> +        if not pkg in blacklist and not pkg in metapkg_rdepends and not
> pkg.endswith('-dev') and not pkg.endswith('-dbg') and not
> pkg.endswith('-doc') : +            metapkg_rdepends.append(pkg)
> +    bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
> +
> +}
> +
> +PACKAGES_DYNAMIC += "^libopencv-.*"
> +
> +FILES_${PN} = ""
> +FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
> +FILES_${PN}-dbg += "${libdir}/.debug"
> +FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
> +FILES_${PN}-doc = "${datadir}/OpenCV/doc"
> +FILES_${PN}-java = "${datadir}/OpenCV/java"
> +FILES_${PN}-java-dbg = "${datadir}/OpenCV/java/.debug/"
> +FILES_${PN}-samples = "${datadir}/OpenCV/samples/"
> +FILES_${PN}-samples-dbg = "${datadir}/OpenCV/samples/bin/.debug"
> +
> +INSANE_SKIP_${PN}-apps = "staticdev"
> +INSANE_SKIP_${PN}-java = "libdir"
> +INSANE_SKIP_${PN}-java-dbg = "libdir"
> +
> +ALLOW_EMPTY_${PN} = "1"
> +
> +INSANE_SKIP_python-opencv = "True"

I don't think this will do anything. INSANE_SKIP lists the tests to skip, not 
an overall True/False value.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

