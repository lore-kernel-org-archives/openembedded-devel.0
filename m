Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RKpXJ-0007oa-Ve for openembedded-devel@lists.openembedded.org;
	Mon, 31 Oct 2011 11:56:14 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RKpRR-0003gz-0Q for openembedded-devel@lists.openembedded.org;
	Mon, 31 Oct 2011 11:50:09 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2011 11:50:08 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2011 11:50:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 31 Oct 2011 11:46:52 +0100
Message-ID: <j8luas$7vb$2@dough.gmane.org>
References: <1320038418-24191-1-git-send-email-cwabbott0@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <1320038418-24191-1-git-send-email-cwabbott0@gmail.com>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-oe][PATCH] opencv: import from oe-classic and upgrade to 2.3.1
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
X-List-Received-Date: Mon, 31 Oct 2011 10:56:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Can you please send a v2 with the PRIORITY fields removed?

Op 31-10-11 06:20, Connor Abbott schreef:
> OpenCV <= 2.2 won't compile on oe-core due to the lack of v4l1 headers,
> and therefore wasn't included in this patch. Also, the support for newer
> cv2-style python bindings is a bit hacked up at the moment due to the way
> OpenCV detects the Python version and Numpy headers (see
> 0001-Fix-CMakeLists.txt-numpy-detection.patch). In particular, it
> requires the native & target python to be the same version and have
> similar site-packages directories, which is true at least for now in OE. 
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com> --- 
> .../recipes-support/opencv/opencv-samples_2.3.bb   |   43 +++++++++++ 
> .../0001-Fix-CMakeLists.txt-numpy-detection.patch  |   37 ++++++++++ 
> meta-oe/recipes-support/opencv/opencv_2.3.bb       |   76
> ++++++++++++++++++++ 3 files changed, 156 insertions(+), 0 deletions(-) 
> create mode 100644 meta-oe/recipes-support/opencv/opencv-samples_2.3.bb 
> create mode 100644
> meta-oe/recipes-support/opencv/opencv/0001-Fix-CMakeLists.txt-numpy-detection.patch
>
> 
create mode 100644 meta-oe/recipes-support/opencv/opencv_2.3.bb
> 
> diff --git a/meta-oe/recipes-support/opencv/opencv-samples_2.3.bb
> b/meta-oe/recipes-support/opencv/opencv-samples_2.3.bb new file mode
> 100644 index 0000000..5cac4a5 --- /dev/null +++
> b/meta-oe/recipes-support/opencv/opencv-samples_2.3.bb @@ -0,0 +1,43 @@ 
> +DESCRIPTION = "Opencv : The Open Computer Vision Library" +HOMEPAGE =
> "http://opencv.willowgarage.com/wiki/" +SECTION = "libs" +PRIORITY =
> "optional" +LICENSE = "BSD" + +DEPENDS = "opencv" + +LIC_FILES_CHKSUM =
> "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932466bb14
> \ +" + +SRC_URI =
> "svn://code.ros.org/svn/opencv/tags/2.3.1;module=opencv;proto=https \ +" 
> + +SRCREV = "6923" +PV = "2.3.1" +PR = "r0" + +S = "${WORKDIR}/opencv" + 
> +do_install() { +    cd samples/c +	install -d ${D}/${bindir} +	install
> -d ${D}/${datadir}/opencv/samples + +	cp * ${D}/${datadir}/opencv/samples
> || true + +    for i in *.c; do +        echo "compiling $i" +
> ${CXX} ${CFLAGS} ${LDFLAGS} -ggdb `pkg-config --cflags opencv` -o
> `basename $i .c` $i `pkg-config --libs opencv` || true +		install -m 0755
> `basename $i .c` ${D}/${bindir} || true +		rm
> ${D}/${datadir}/opencv/samples/`basename $i .c` || true +	done +    for i
> in *.cpp; do +        echo "compiling $i" +        ${CXX} ${CFLAGS}
> ${LDFLAGS} -ggdb `pkg-config --cflags opencv` -o `basename $i .cpp` $i
> `pkg-config --libs opencv` || true +		install -m 0755 `basename $i .cpp`
> ${D}/${bindir} || true +		rm ${D}/${datadir}/opencv/samples/`basename $i
> .cpp` || true +	done +} + +FILES_${PN}-dev +=
> "${datadir}/opencv/samples/*.c* ${datadir}/opencv/samples/*.vcp*
> ${datadir}/opencv/samples/build*" +FILES_${PN} += "${bindir}
> ${datadir}/opencv" diff --git
> a/meta-oe/recipes-support/opencv/opencv/0001-Fix-CMakeLists.txt-numpy-detection.patch
> b/meta-oe/recipes-support/opencv/opencv/0001-Fix-CMakeLists.txt-numpy-detection.patch
>
> 
new file mode 100644
> index 0000000..dba00f8 --- /dev/null +++
> b/meta-oe/recipes-support/opencv/opencv/0001-Fix-CMakeLists.txt-numpy-detection.patch
>
> 
@@ -0,0 +1,37 @@
> +From a7301911a3cdf9196abd93ff894a9e86e0bcdc5e Mon Sep 17 00:00:00 2001 
> +From: Connor Abbott <cwabbott0@gmail.com> +Date: Sun, 30 Oct 2011
> 20:00:03 -0400 +Subject: [PATCH] Fix CMakeLists.txt numpy detection + 
> +Right now, the code opencv uses to detect where the numpy include files
> are doesn't work with cross-compiling because it uses the native python
> to determine the environment. To make this a little better, allow the
> user to explictly specify the path using
> -DPYTHON_NUMPY_INCLUDE_DIRS=path/to/numpy/include/dir . +Signed-off-by:
> Connor Abbott <cwabbott0@gmail.com> +--- + CMakeLists.txt |   12
> ++++++++---- + 1 files changed, 8 insertions(+), 4 deletions(-) + +diff
> --git a/CMakeLists.txt b/CMakeLists.txt +index ff8f20c..8edbd78 100644 
> +--- a/CMakeLists.txt ++++ b/CMakeLists.txt +@@ -715,10 +715,14 @@ IF
> ("${PYTHON_VERSION_MAJOR_MINOR}" VERSION_GREATER 2.4) + ENDIF() + + #
> Attempt to discover the NumPy include directory. If this succeeds, then
> build python API with NumPy +-execute_process(COMMAND
> ${PYTHON_EXECUTABLE} -c "import os; os.environ['DISTUTILS_USE_SDK']='1';
> import numpy.distutils; print
> numpy.distutils.misc_util.get_numpy_include_dirs()[0]" +-
> RESULT_VARIABLE PYTHON_NUMPY_PROCESS +-            OUTPUT_VARIABLE
> PYTHON_NUMPY_INCLUDE_DIRS +-
> OUTPUT_STRIP_TRAILING_WHITESPACE) ++if(NOT DEFINED
> PYTHON_NUMPY_INCLUDE_DIRS) ++    execute_process(COMMAND
> ${PYTHON_EXECUTABLE} -c "import os; os.environ['DISTUTILS_USE_SDK']='1';
> import numpy.distutils; print
> numpy.distutils.misc_util.get_numpy_include_dirs()[0]" ++
> RESULT_VARIABLE PYTHON_NUMPY_PROCESS ++                OUTPUT_VARIABLE
> PYTHON_NUMPY_INCLUDE_DIRS ++
> OUTPUT_STRIP_TRAILING_WHITESPACE) ++else() ++    set(PYTHON_NUMPY_PROCESS
> 0) ++endif() + + if(PYTHON_NUMPY_PROCESS EQUAL 0) +
> set(PYTHON_USE_NUMPY 1) +-- +1.7.4.1 + diff --git
> a/meta-oe/recipes-support/opencv/opencv_2.3.bb
> b/meta-oe/recipes-support/opencv/opencv_2.3.bb new file mode 100644 index
> 0000000..220116d --- /dev/null +++
> b/meta-oe/recipes-support/opencv/opencv_2.3.bb @@ -0,0 +1,76 @@ 
> +DESCRIPTION = "Opencv : The Open Computer Vision Library" +HOMEPAGE =
> "http://opencv.willowgarage.com/wiki/" +SECTION = "libs" +PRIORITY =
> "optional" +LICENSE = "BSD" + +ARM_INSTRUCTION_SET = "arm" + 
> +LIC_FILES_CHKSUM =
> "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932466bb14
> \ +" + +DEPENDS = "python-numpy ffmpeg gtk+ libtool swig swig-native
> python jpeg bzip2 zlib libpng tiff glib-2.0" + +SRC_URI =
> "svn://code.ros.org/svn/opencv/tags/2.3.1;module=opencv;proto=https \ 
> +file://opencv/0001-Fix-CMakeLists.txt-numpy-detection.patch \ +" + 
> +SRCREV = "6923" + +PV = "2.3.1" +PR = "r0" + +S = "${WORKDIR}/opencv" + 
> +EXTRA_OECMAKE =
> "-DPYTHON_NUMPY_INCLUDE_DIRS=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include
> \ +-DBUILD_PYTHON_SUPPORT=ON \ +" + +inherit distutils-base pkgconfig
> cmake + +export BUILD_SYS +export HOST_SYS +export
> PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}" +export
> PYTHON=${STAGING_BINDIR_NATIVE}/python + +TARGET_CC_ARCH +=
> "-I${S}/include " + +PACKAGES += "${PN}-apps python-opencv" + +python
> populate_packages_prepend () { +	cv_libdir = bb.data.expand('${libdir}',
> d) +	cv_libdir_dbg = bb.data.expand('${libdir}/.debug', d) +
> do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV %s
> development package', extra_depends='${PN}-dev', allow_links=True) +
> do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV %s
> development package', extra_depends='${PN}-dev') +	do_split_packages(d,
> cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s development package',
> extra_depends='${PN}-dev') +	do_split_packages(d, cv_libdir,
> '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s library', extra_depends='',
> allow_links=True) + +	pn = bb.data.getVar('PN', d, 1) +	metapkg =  pn +
> '-dev' +	bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d) +	blacklist = [
> metapkg ] +	metapkg_rdepends = [ ] +	packages =
> bb.data.getVar('PACKAGES', d, 1).split() +	for pkg in packages[1:]: +		if
> not pkg in blacklist and not pkg in metapkg_rdepends and
> pkg.endswith('-dev'): +			metapkg_rdepends.append(pkg) +
> bb.data.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends), d) 
> +} + +FILES_${PN} = "" +FILES_${PN}-apps = "${bindir}/*
> ${datadir}/OpenCV" +FILES_${PN}-dbg += "${libdir}/.debug" 
> +FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig" +FILES_${PN}-doc =
> "${datadir}/OpenCV/doc" + +ALLOW_EMPTY_${PN} = "1" + 
> +INSANE_SKIP_python-opencv = True +DESCRIPTION_python-opencv = "Python
> bindings to opencv" +FILES_python-opencv =
> "${PYTHON_SITEPACKAGES_DIR}/*" +RDEPENDS_python-opencv = "python-core
> python-numpy" + +do_install_append() { +	cp ${S}/include/opencv/*.h
> ${D}${includedir}/opencv/ +	sed -i '/blobtrack/d'
> ${D}${includedir}/opencv/cvaux.h +} \ No newline at end of file

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOrnycMkyGM64RGpERAkBoAJ9M7fp8O1f4X9F4wG/d6Lm4jKpR3ACeNcdK
WA0OW/0cYuV7mhrnZ0MjgYI=
=PzOO
-----END PGP SIGNATURE-----



