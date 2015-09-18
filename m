Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 575E673243
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 19:34:44 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so25233082igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 12:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=yey3OV3haFRf5nMCvdIFbevTCYJtFgbPrud9QdL5rh8=;
	b=lGbQ6AJq2cTr642Odz4+O7MmrVfTW8GOdCReiJYLzSKLvKYzgcdTwQRI0z59GlN6zD
	FYeYfPIUh2gx1tVuEVWaljAWd+wBmciuEh2I1RI+uuh47nEfrJDyJ8yojuXAozkvWrTG
	f6B/joZ6NRzY/zQKcAcDodUJneLx3auoPVj+htKOTtVJYTZL6jpM/LA4jAjTUEf3phUK
	pOIgq1jXd4mxRN9hrahAb7I6KdYeqPjiZo8ygIlkgVInew8PsddtIUeRDfbMxc2UKnl7
	qar6oEVQxpTWId6/y2QDEqIKZ2XpvHhc9bLbWeAxCwY8skj1bJQfDJjC8MeHyVcJ+Nn7
	lKwQ==
X-Received: by 10.50.85.20 with SMTP id d20mr16779708igz.77.1442604885047;
	Fri, 18 Sep 2015 12:34:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Fri, 18 Sep 2015 12:34:15 -0700 (PDT)
In-Reply-To: <1442586346-12457-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
References: <1442586346-12457-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Sep 2015 12:34:15 -0700
Message-ID: <CAMKF1srZd2htZv2VOiBgmo-=zrt4tecVL5UZqO0heJM_y-+fog@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] opencv: backport commit to compile with ppc
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
X-List-Received-Date: Fri, 18 Sep 2015 19:34:46 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 18, 2015 at 7:25 AM, Lukas Bulwahn
<lukas.bulwahn@oss.bmw-carit.de> wrote:
> During the testing of the meta-ros layer, I discovered that opencv
> does not cross-compile for the ppc architecture. The error is
> reported in the meta-ros issue tracker #355 [1]. To address this
> error,  this commit applies a patch that is already provided upstream
> in the opencv version 3.0.
>
> [1] https://github.com/bmwcarit/meta-ros/issues/355
>

this is ok

> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
> ---
>  ...ector-instead-of-vector-as-suggests-Eigen.patch | 49 ++++++++++++++++++++++
>  meta-oe/recipes-support/opencv/opencv_2.4.bb       |  3 +-
>  2 files changed, 51 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Use-__vector-instead-of-vector-as-suggests-Eigen.patch
>
> diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Use-__vector-instead-of-vector-as-suggests-Eigen.patch b/meta-oe/recipes-support/opencv/opencv/0001-Use-__vector-instead-of-vector-as-suggests-Eigen.patch
> new file mode 100644
> index 0000000..7f809bc
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv/0001-Use-__vector-instead-of-vector-as-suggests-Eigen.patch
> @@ -0,0 +1,49 @@
> +From 711f07a34ceb504e8f75e978692201efa58268ca Mon Sep 17 00:00:00 2001
> +From: Dinar Valeev <dvaleev@suse.com>
> +Date: Thu, 16 Jan 2014 21:53:49 +0100
> +Subject: [PATCH] Use __vector instead of vector as suggests Eigen
> +
> +This fixes build on PowerPC where Eigen unsets vector, bool and pixel
> +
> +Signed-off-by: Dinar Valeev <dvaleev@suse.com>
> +
> +This patch is already part of OpenCV v3.0. The patch can be obtained
> +from:
> +
> +  https://github.com/Itseez/opencv/commit/711f07a34ceb504e8f75e978692201efa58268ca.patch
> +
> +Upstream-Status: Backport [commit 711f07a34c, part of version 3.0]
> +
> +Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
> +---
> + 3rdparty/include/opencl/1.2/CL/cl_platform.h | 14 +++++++-------
> + 1 file changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/3rdparty/include/opencl/1.2/CL/cl_platform.h b/3rdparty/include/opencl/1.2/CL/cl_platform.h
> +index e94949a..42c35d5 100644
> +--- a/3rdparty/include/opencl/1.2/CL/cl_platform.h
> ++++ b/3rdparty/include/opencl/1.2/CL/cl_platform.h
> +@@ -332,13 +332,13 @@ typedef unsigned int cl_GLenum;
> + /* Define basic vector types */
> + #if defined( __VEC__ )
> +    #include <altivec.h>   /* may be omitted depending on compiler. AltiVec spec provides no way to detect whether the header is required. */
> +-   typedef vector unsigned char     __cl_uchar16;
> +-   typedef vector signed char       __cl_char16;
> +-   typedef vector unsigned short    __cl_ushort8;
> +-   typedef vector signed short      __cl_short8;
> +-   typedef vector unsigned int      __cl_uint4;
> +-   typedef vector signed int        __cl_int4;
> +-   typedef vector float             __cl_float4;
> ++   typedef __vector unsigned char     __cl_uchar16;
> ++   typedef __vector signed char       __cl_char16;
> ++   typedef __vector unsigned short    __cl_ushort8;
> ++   typedef __vector signed short      __cl_short8;
> ++   typedef __vector unsigned int      __cl_uint4;
> ++   typedef __vector signed int        __cl_int4;
> ++   typedef __vector float             __cl_float4;
> +    #define  __CL_UCHAR16__  1
> +    #define  __CL_CHAR16__   1
> +    #define  __CL_USHORT8__  1
> +--
> +1.9.3
> +
> diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
> index 733fe44..3b10b55 100644
> --- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
> @@ -10,7 +10,8 @@ ARM_INSTRUCTION_SET = "arm"
>  DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0"
>
>  SRCREV = "2c9547e3147779001811d01936aed38f560929fc"
> -SRC_URI = "git://github.com/Itseez/opencv.git;branch=2.4"
> +SRC_URI = "git://github.com/Itseez/opencv.git;branch=2.4 \
> +  file://0001-Use-__vector-instead-of-vector-as-suggests-Eigen.patch"
>
>  PV = "2.4.11+git${SRCPV}"
>
> --
> 1.9.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

