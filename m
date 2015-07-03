Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1FEAF75CC2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jul 2015 15:27:02 +0000 (UTC)
Received: by wibdq8 with SMTP id dq8so103210208wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jul 2015 08:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5k8qPbbCi1ieMKR5Xa+3Jrqbc/vtQjQSASF4soMvDyk=;
	b=WkCNWckSqIUDrmk3a9MZqjrzhs6Yb/jSXfZCFHrDJA/EgmknmeVcDfnLtLQV+QuZQ+
	ajCktgZHrHknLH3Zqwq4HK+BG2ztF/svHyPKc7JSFLegdeYjxKxDP8LrHke6I9tQWpK0
	s4GmxeZ9aih7Pi3wkDfxEd3dqm+pF91jxwgugZedtwQrSsxWWBziwBLNErU6zNFoRFfA
	1VQkV46Wg4UZdgkf0OyWGBRA4S9VjrCx1YhmiQRrPllqrwmfPhy5BGTuGufRPFodtLM4
	zJ2WO6f2izbRthbZJq0iYvjV8m8Ep2v25Igjtsx/LDhECb15qBuBwJ40nIJq6HsVjgHK
	jRNw==
X-Received: by 10.180.23.8 with SMTP id i8mr67367368wif.39.1435937222321;
	Fri, 03 Jul 2015 08:27:02 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	bg6sm13847037wjc.13.2015.07.03.08.27.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Jul 2015 08:27:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 3 Jul 2015 17:27:35 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150703152734.GC2436@jama>
References: <1433859189-31341-1-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1433859189-31341-1-git-send-email-ricardo.ribalda@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH v2] [meta-oe] opencv: Add OpenCV 3.0
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
X-List-Received-Date: Fri, 03 Jul 2015 15:27:04 -0000
X-Groupsio-MsgNum: 56141
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XMCwj5IQnwKtuyBG"
Content-Disposition: inline

--XMCwj5IQnwKtuyBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2015 at 04:13:09PM +0200, Ricardo Ribalda Delgado wrote:
> -Support for new PACKAGECONFIGS
> -Merge with opencv-samples
>=20
> Since it is not backward compatible with 2.x and cannot be installed in
> parallel it has a DEFAULT_PREFERENCE of -1.
>=20
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_3.0.bb | 127 +++++++++++++++++++++=
++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 meta-oe/recipes-support/opencv/opencv_3.0.bb
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.bb b/meta-oe/recip=
es-support/opencv/opencv_3.0.bb
> new file mode 100644
> index 000000000000..60a96af1fe68
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv_3.0.bb
> @@ -0,0 +1,127 @@
> +SUMMARY =3D "Opencv : The Open Computer Vision Library"
> +HOMEPAGE =3D "http://opencv.willowgarage.com/wiki/"
> +SECTION =3D "libs"
> +
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://include/opencv2/opencv.hpp;endline=3D41;md5=
=3D6d690d8488a6fca7a2c192932466bb14"
> +
> +ARM_INSTRUCTION_SET =3D "arm"
> +
> +DEPENDS =3D "python-numpy libtool swig swig-native python bzip2 zlib gli=
b-2.0 oracle-jse-jdk ant"

meta-oe doesn't depend on meta-java layer, so this cannot be added here

ERROR: Nothing PROVIDES 'oracle-jse-jdk' (but
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/o=
pencv/opencv_3.0.bb
DEPENDS on or otherwise requires it)
ERROR: Nothing PROVIDES 'ant' (but
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-support/o=
pencv/opencv_3.0.bb
DEPENDS on or otherwise requires it). Close matches:

Is it possible to disable java part with PACKAGECONFIG?

> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +SRCREV_opencv =3D "424c2bddb39dae97dc4639a24eaa0e0c8fbb8e69"
> +SRCREV_contrib =3D "844c30e8b2f2f4b34b96a169fafe9beea3c45e87"
> +SRCREV_FORMAT =3D "opencv"
> +SRC_URI =3D "git://github.com/Itseez/opencv.git;nobranch=3D1;name=3Dopen=
cv \
> +	   git://github.com/Itseez/opencv_contrib.git;nobranch=3D1;destsuffix=
=3Dcontrib;name=3Dcontrib"

Don't use nobranch=3D1 when it's not needed:

OE @ ~/projects/opencv $ git branch -a --contains 424c2bddb39dae97dc4639a24=
eaa0e0c8fbb8e69
* master
  remotes/origin/HEAD -> origin/master
  remotes/origin/master
OE @ ~/projects/opencv $ cd ../opencv_contrib/
OE @ ~/projects/opencv_contrib $ git branch -a --contains 844c30e8b2f2f4b34=
b96a169fafe9beea3c45e87
* master
  remotes/origin/HEAD -> origin/master
  remotes/origin/master

> +
> +PV =3D "3.0+git${SRCPV}"
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
> +                 ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFF=
IX=3D64", "", d)} \
> +                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFF=
IX=3D32", "", d)} \
> +"
> +
> +PACKAGECONFIG ??=3D "eigen jpeg libav png tiff v4l tbb samples\
> +                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk",=
 "", d)}"
> +PACKAGECONFIG[eigen] =3D "-DWITH_EIGEN=3DON,-DWITH_EIGEN=3DOFF,libeigen,"
> +PACKAGECONFIG[gtk] =3D "-DWITH_GTK=3DON,-DWITH_GTK=3DOFF,gtk+3,"
> +PACKAGECONFIG[jpeg] =3D "-DWITH_JPEG=3DON,-DWITH_JPEG=3DOFF,jpeg,"
> +PACKAGECONFIG[libav] =3D "-DWITH_FFMPEG=3DON,-DWITH_FFMPEG=3DOFF,libav,"
> +PACKAGECONFIG[png] =3D "-DWITH_PNG=3DON,-DWITH_PNG=3DOFF,libpng,"
> +PACKAGECONFIG[tiff] =3D "-DWITH_TIFF=3DON,-DWITH_TIFF=3DOFF,tiff,"
> +PACKAGECONFIG[v4l] =3D "-DWITH_V4L=3DON,-DWITH_V4L=3DOFF,v4l-utils,"
> +PACKAGECONFIG[jasper] =3D "-DWITH_JASPER=3DON,-DWITH_JASPER=3DOFF,jasper=
,"
> +PACKAGECONFIG[amdblas] =3D "-DWITH_OPENCLAMDBLAS=3DON,-DWITH_OPENCLAMDBL=
AS=3DOFF,libclamdblas,"
> +PACKAGECONFIG[amdfft] =3D "-DWITH_OPENCLAMDFFT=3DON,-DWITH_OPENCLAMDFFT=
=3DOFF,libclamdfft,"
> +PACKAGECONFIG[opencl] =3D "-DWITH_OPENCL=3DON,-DWITH_OPENCL=3DOFF,opencl=
-headers,"
> +PACKAGECONFIG[gstreamer] =3D "-DWITH_GSTREAMER=3DON,-DWITH_GSTREAMER=3DO=
FF,gstreamer1.0 gstreamer1.0-plugins-base,"
> +PACKAGECONFIG[oracle-java-amd64] =3D "-DJAVA_INCLUDE_PATH=3D${JAVA_HOME}=
/include -DJAVA_INCLUDE_PATH2=3D${JAVA_HOME}/include/linux -DJAVA_AWT_INCLU=
DE_PATH=3D${JAVA_HOME}/include -DJAVA_AWT_LIBRARY=3D${JAVA_HOME}/lib/amd64/=
libjawt.so -DJAVA_JVM_LIBRARY=3D${JAVA_HOME}/lib/amd64/server/libjvm.so,,or=
acle-jse-jdk ant,"
> +PACKAGECONFIG[samples] =3D "-DBUILD_EXAMPLES=3DON -DINSTALL_PYTHON_EXAMP=
LES=3DON,-DBUILD_EXAMPLES=3DOFF,,"
> +PACKAGECONFIG[tbb] =3D "-DWITH_TBB=3DON,-DWITH_TBB=3DOFF,tbb,"
> +
> +inherit distutils-base pkgconfig cmake
> +
> +export BUILD_SYS
> +export HOST_SYS
> +export PYTHON_CSPEC=3D"-I${STAGING_INCDIR}/${PYTHON_DIR}"
> +export PYTHON=3D"${STAGING_BINDIR_NATIVE}/python"
> +export JAVA_HOME=3D"${STAGING_DIR_TARGET}/usr/share/java/"
> +export ANT_DIR=3D"${STAGING_DIR_TARGET}/usr/share/ant/"
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
> +INSANE_SKIP_python-opencv =3D "True"
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
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XMCwj5IQnwKtuyBG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWWqeYACgkQN1Ujt2V2gBwk7wCfUafpObv4clO83zrunwJw24LM
w+0An1Rk5BDTBRUPWa0W+khNXOKj92YY
=4Dfy
-----END PGP SIGNATURE-----

--XMCwj5IQnwKtuyBG--
