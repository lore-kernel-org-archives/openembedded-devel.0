Return-Path: <nickdademo@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id 80DE16D815
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 02:41:02 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id j17so8688620oag.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 18:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Asn6JPesZsEGYTwCakcLCcaCU5Z4OE45Vg/1I2Oty9k=;
	b=ZchG3WQrWPbfZ6ouHww27Fz1EnMnbx7P5WP+qStayW+yfx0n4AGImhfmeTCZlPyzq5
	mDbmCtXd7u6qU2qwCUrozXIoVjcjgQZuKZiC7XK4QPkNHzU/SNpWGVPfmiHD/lgc7bla
	1xLxbnW85soMkfbEdRX2/tpBBGgP8S80ol8jBTk3lgVdY0JIGX+0BYA33Xxfeiv7n73X
	fQrBiC6aBlUNq+L8Fc8takHK0a/McA5KcCGd13q+hy5Jhe5WgRp0im9E/4k/qTkWErRc
	+wdCSSMat07kpBvIyqcFkZeBdEtDKZuL1fW96VtEd+nP8pfB6+SKngizZvfofNWexW7T
	pZ5g==
X-Received: by 10.60.98.69 with SMTP id eg5mr17884737oeb.42.1385606461728;
	Wed, 27 Nov 2013 18:41:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.133.130 with HTTP; Wed, 27 Nov 2013 18:40:41 -0800 (PST)
In-Reply-To: <1385606318-6049-1-git-send-email-nickdademo@gmail.com>
References: <1385606318-6049-1-git-send-email-nickdademo@gmail.com>
From: "Nick D'Ademo" <nickdademo@gmail.com>
Date: Thu, 28 Nov 2013 13:40:41 +1100
Message-ID: <CANR6C568v3tnX04Ni_=G9cfdFQmd0S=Z8ueNiU2HPBuy9RNgNg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] opencv: bump SRCREV and make recipe multilib build compatible
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
X-List-Received-Date: Thu, 28 Nov 2013 02:41:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

Previous message contains complete final patch.

Cheers,
Nick

On Thu, Nov 28, 2013 at 1:38 PM, Nick D'Ademo <nickdademo@gmail.com> wrote:

> Pass LIB_SUFFIX to CMake during a multilib build so that the generated
> library folder has the correct suffix.
>
> Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_2.4.bb |   10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bbb/meta-oe/recipes-support/opencv/
> opencv_2.4.bb
> index 9dd9cd0..df89b0a 100644
> --- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
> @@ -9,7 +9,7 @@ ARM_INSTRUCTION_SET = "arm"
>
>  DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib
> glib-2.0"
>
> -SRCREV = "c5afaa4e8dfe507e87531f7688b9cf65c1f701c6"
> +SRCREV = "1253c2101b22b9e89400553fd220858cda8d6ea5"
>  SRC_URI = "git://github.com/Itseez/opencv.git;branch=2.4 \
>             file://opencv-fix-pkgconfig-generation.patch \
>  "
> @@ -27,6 +27,8 @@ EXTRA_OECMAKE =
> "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}
>                   -DWITH_GSTREAMER=OFF \
>                   -DCMAKE_SKIP_RPATH=ON \
>                   ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3",
> "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
> +                 ${@base_conditional("libdir", "/usr/lib64",
> "-DLIB_SUFFIX=64", "", d)} \
> +                 ${@base_conditional("libdir", "/usr/lib32",
> "-DLIB_SUFFIX=32", "", d)} \
>  "
>
>  PACKAGECONFIG ??= "eigen gtk jpeg libav png tiff v4l"
> @@ -88,4 +90,10 @@ RDEPENDS_python-opencv = "python-core python-numpy"
>  do_install_append() {
>      cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
>      sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
> +
> +    # Move Python files into correct library folder (for multilib build)
> +    if [ "$libdir" != "/usr/lib" ]; then
> +        mv ${D}/usr/lib/* ${D}/${libdir}/
> +        rm -rf ${D}/usr/lib
> +    fi
>  }
> --
> 1.7.9.5
>
>

