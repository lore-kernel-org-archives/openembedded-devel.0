Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id A62F4608BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2013 07:51:31 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VT5bE-0004eR-1p for openembedded-devel@lists.openembedded.org;
	Mon, 07 Oct 2013 09:51:28 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Oct 2013 09:51:28 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Oct 2013 09:51:28 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 07 Oct 2013 09:51:23 +0200
Message-ID: <l2tp5e$mj9$1@ger.gmane.org>
References: <1380613454-3799-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<1380613454-3799-3-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
In-Reply-To: <1380613454-3799-3-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Enigmail-Version: 1.5.2
Subject: Re: [meta-oe][PATCHv2 3/3] opencv: adding PACKAGECONFIG for eigen gtk jpeg libav png tiff v4l
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
X-List-Received-Date: Mon, 07 Oct 2013 07:51:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 01-10-13 09:44, Lukas Bulwahn schreef:
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de> --- 
> meta-oe/recipes-support/opencv/opencv_2.4.3.bb |   14 ++++++++++---- 1
> file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
> b/meta-oe/recipes-support/opencv/opencv_2.4.3.bb index 21a4f06..a0adc32
> 100644 --- a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb +++
> b/meta-oe/recipes-support/opencv/opencv_2.4.3.bb @@ -7,7 +7,7 @@
> LIC_FILES_CHKSUM =
> "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a
> 
> ARM_INSTRUCTION_SET = "arm"
> 
> -DEPENDS = "python-numpy v4l-utils libav gtk+ libtool swig swig-native
> python jpeg bzip2 zlib libpng tiff glib-2.0 libeigen" +DEPENDS =
> "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0"
> 
> SRC_URI =
> "${SOURCEFORGE_MIRROR}/opencvlibrary/opencv-unix/${PV}/OpenCV-${PV}.tar.bz2
> \ file://opencv-fix-pkgconfig-generation.patch \ @@ -26,14 +26,20 @@
> OECMAKE_BUILDPATH = "${WORKDIR}/build-${TARGET_ARCH}"
> 
> EXTRA_OECMAKE =
> "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include
> \ -DBUILD_PYTHON_SUPPORT=ON \ -                 -DWITH_FFMPEG=ON \ 
> -DWITH_GSTREAMER=OFF \ -                 -DWITH_V4L=ON \ -
> -DWITH_GTK=ON \ -DCMAKE_SKIP_RPATH=ON \ 
> ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1
> -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \ "
> 
> +PACKAGECONFIG ??= "eigen gtk jpeg libav png tiff v4l" 
> +PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen," 
> +PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+," 
> +PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg," 
> +PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav," 
> +PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng," 
> +PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff," 
> +PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils," +

Can you add one for gstreamer as well? In the past gst and libav were
mutually exclusive options for opencv, but I don't know if that's still the
case.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSUmf7MkyGM64RGpERAuasAKCKq/PJt7dTmZVm/hf3biGNmWx6CQCgjwml
foAecPiAacNLzoy79SY0th4=
=Kcxg
-----END PGP SIGNATURE-----


