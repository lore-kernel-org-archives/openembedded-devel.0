Return-Path: <nickdademo@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9A26F71808
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Oct 2014 01:25:47 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id wn1so4885611obc.23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Oct 2014 18:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/pc5TAZSwFI4M+mwPq1DA3Mp91NnrOE5VeAz8/eCU8k=;
	b=KFXBLL9kDITCM2TIwoq5hOFS73gzlMuj/cWE71zh/pnhueVLy5tej2TWimOxYQMjmp
	eukVpj8Z5lJMM0BR8mXvV+2icTwAlLZKuYy0/41MknBI28ZMjSjawdiX2izj9UpxEyo8
	6jeviqMbQDRCcsaidvSFcdGniXqd76GiWxrOhHEdAYC2uUWCMd6RvmHXB7hfdwv82Bqz
	1DghDdmniVaSERr2K0KWJG8C1QiS3ko/Jn1ESv54RLf2WtEi6DwRhRfBuISAHT9ZPUeB
	Us7jnxCHj3O95YiVumav4NKoNRk94OQzvdhLr/a4mBuvcT6pO0o2eK5KkHn7m/T4vjgx
	68sg==
X-Received: by 10.60.64.40 with SMTP id l8mr414611oes.63.1412645148385; Mon,
	06 Oct 2014 18:25:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.167.163 with HTTP; Mon, 6 Oct 2014 18:25:28 -0700 (PDT)
In-Reply-To: <20141007003556.GE25997@denix.org>
References: <1411041927-9041-1-git-send-email-nickdademo@gmail.com>
	<20140924151927.GI25706@jama>
	<CANR6C54eaCZdb7ef58XfxdWu8odTUSJXr_X4P=J-_tuv5tkY_A@mail.gmail.com>
	<20141007000758.GA12322@jama> <20141007003556.GE25997@denix.org>
From: "Nick D'Ademo" <nickdademo@gmail.com>
Date: Tue, 7 Oct 2014 12:25:28 +1100
Message-ID: <CANR6C54viPVPQ4zTdsY81NE1N+JfAq6o+hnQwDL7NKsaaDw3XA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>, Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] opencv: Add recipe for OpenCV v3.0.0-alpha.
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
X-List-Received-Date: Tue, 07 Oct 2014 01:25:55 -0000
Content-Type: text/plain; charset=UTF-8

Understood regarding PV.

Would "opencv_git.bb" be more suitable for the recipe file? Or keep it as "
opencv_3.0.0.bb"?


On Tue, Oct 7, 2014 at 11:35 AM, Denys Dmytriyenko <denis@denix.org> wrote:

> On Tue, Oct 07, 2014 at 02:07:58AM +0200, Martin Jansa wrote:
> > On Tue, Oct 07, 2014 at 10:12:03AM +1100, Nick D'Ademo wrote:
> > > Hi Martin,
> > >
> > > qemuarm build issue is fixed - what PV format do you suggest for
> alpha/beta
> > > releases?
> >
> > "2.99+3.0.0-alpha+git${SRCPV}"
> >
> > would be OK with me
>
> Well, this is all clearly defined in the OE wiki:
>
> http://www.openembedded.org/wiki/Versioning_Policy
>
> --
> Denys
>
>
> > > On Thu, Sep 25, 2014 at 1:19 AM, Martin Jansa <martin.jansa@gmail.com>
> > > wrote:
> > >
> > > > On Thu, Sep 18, 2014 at 10:05:27PM +1000, Nick D'Ademo wrote:
> > > > > Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
> > > > > ---
> > > > >  meta-oe/recipes-support/opencv/opencv_3.0.0.bb | 95
> > > > ++++++++++++++++++++++++++
> > > > >  1 file changed, 95 insertions(+)
> > > > >  create mode 100644 meta-oe/recipes-support/opencv/opencv_3.0.0.bb
> > > > >
> > > > > diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.0.bb
> > > > b/meta-oe/recipes-support/opencv/opencv_3.0.0.bb
> > > > > new file mode 100644
> > > > > index 0000000..3922964
> > > > > --- /dev/null
> > > > > +++ b/meta-oe/recipes-support/opencv/opencv_3.0.0.bb
> > > > > @@ -0,0 +1,95 @@
> > > > > +DESCRIPTION = "Opencv : The Open Computer Vision Library"
> > > > > +HOMEPAGE = "http://opencv.org/"
> > > > > +SECTION = "libs"
> > > > > +
> > > > > +LICENSE = "BSD"
> > > > > +LIC_FILES_CHKSUM =
> > > >
> "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932466bb14"
> > > > > +
> > > > > +ARM_INSTRUCTION_SET = "arm"
> > > > > +
> > > > > +DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib
> > > > glib-2.0 gstreamer gst-plugins-base"
> > > > > +
> > > > > +# Commit hash for 3.0.0-alpha tag
> > > > > +SRCREV = "fb9a143429f86603ff93e5bcb2d94b94780b7234"
> > > > > +SRC_URI = "git://github.com/Itseez/opencv.git;branch=master \
> > > > > +           file://opencv-fix-pkgconfig-generation.patch \
> > > > > +"
> > > > > +
> > > > > +PV = "3.0.0+git${SRCPV}"
> > > >
> > > > subject says alpha, so it should be lower PV than 3.0.0
> > > >
> > > > Fails to build for qemuarm:
> > > >
> > > > CMakeFiles/opencv_core.dir/src/tables.cpp.o
> > > > CMakeFiles/opencv_core.dir/src/types.cpp.o
> > > > CMakeFiles/opencv_core.dir/src/umatrix.cpp.o
> > > > CMakeFiles/opencv_core.dir/opencl_kernels_core.cpp.o -lz -ldl -lm
> -lpthread
> > > > -lrt
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(ippinit.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(ippmalloc.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMirror_16s_C4R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiSum_8u_C4R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNorm_Inf_8s_C1MR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMin_8u_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMean_16s_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormRel_L1_32f_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiTranspose_32f_C4IR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiConvert_8u32s_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMinMaxIndx_8u_C1MR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiOr_8u_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippsFlip_16u_I_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNorm_L2_32f_C1MR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiTranspose_8u_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMul_8u_C1RSfs_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMinMaxIndx_8s_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippsFlip_8u_I_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMirror_16u_C4IR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiSet_16s_C1MR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiCompare_8u_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippsInvSqrt_32f_A21_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMirror_16s_C3R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNorm_L1_16s_C4R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormDiff_Inf_16u_C4R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNorm_L2_32f_C4R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormDiff_L2_16s_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNorm_L1_16u_C3R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiTranspose_32s_C4IR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMirror_32f_C1IR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippsSortAscend_8u_I_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippsMaxEvery_32f_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormDiff_L1_16s_C3R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippsMaxEvery_8u_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiDFTInit_C_32fc_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiConvert_8u16s_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNorm_L2_16s_C4R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormRel_Inf_32f_C1MR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiTranspose_8u_C4IR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippsFlip_32f_I_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiCopy_8u_C3MR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormDiff_Inf_8u_C4R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormRel_L2_16u_C1MR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiTranspose_16u_C3R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiCompare_32f_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiSum_32f_C3R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiCopy_16u_C3MR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNorm_L1_8u_C4R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNorm_L1_16u_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiXor_8u_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormDiff_Inf_32f_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMean_StdDev_8u_C1MR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiCopy_32s_C4MR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMirror_32s_C1IR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMean_StdDev_32f_C3CR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMean_8u_C1MR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiAbsDiff_16u_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMirror_32f_C4IR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMirror_16u_C1IR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippsMaxEvery_16u_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormDiff_L2_32f_C1MR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormDiff_L2_8s_C1MR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMin_16s_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNorm_L1_16s_C3R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiDotProd_16s64f_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNorm_Inf_16s_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormRel_Inf_32f_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiConvert_8s16s_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiTranspose_16u_C4IR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippsDFTFwd_CToC_64fc_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiSet_32s_C4MR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiTranspose_32s_C3R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMean_StdDev_32f_C1MR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMean_StdDev_16u_C3CMR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMirror_16s_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMirror_16u_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippsPolarToCart_64f_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormDiff_L2_16s_C3R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippsMaxEvery_64f_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormDiff_L1_32f_C3R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiDCTInvInitAlloc_32f_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNorm_L1_32f_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippsDFTGetSize_R_32f_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiConvert_32s32f_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiConvert_32s16s_C1RSfs_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMirror_32s_C3R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiConvert_16u32f_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiSub_8u_C1RSfs_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiSet_16u_C3MR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormDiff_L1_16u_C4R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNorm_L2_32f_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMax_16s_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMirror_8u_C1IR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiDCTFwdGetBufSize_32f_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormDiff_Inf_32f_C4R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNorm_L2_32f_C3R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormDiff_L1_8u_C4R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiCopy_16u_C1MR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippsSqrt_32f_A21_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormDiff_L2_16u_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiTranspose_8u_C3IR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiConvert_8s16u_C1Rs_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormDiff_L1_16s_C4R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippsDFTInv_CToC_32fc_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMean_StdDev_16u_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormRel_Inf_8u_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMean_8u_C3R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormDiff_L2_8u_C4R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippsDFTInit_C_64fc_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormDiff_L2_8u_C1MR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiTranspose_32f_C1IR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiAnd_8u_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormRel_L2_16u_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormRel_L1_32f_C1MR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiAdd_16u_C1RSfs_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMin_32f_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMean_8u_C4R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippsDFTInv_CToC_64fc_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippsDFTFwd_CToC_32fc_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormDiff_Inf_8u_C3R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMirror_8u_C3R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiSet_32s_C1MR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiTranspose_16s_C4R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiDotProd_16u64f_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiLUTPalette_8u_C3R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiAdd_32f_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNorm_L1_32f_C1MR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiTranspose_32s_C1IR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMirror_16u_C3R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMean_16u_C3CMR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiDFTGetSize_C_32fc_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiTranspose_32s_C4R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormDiff_L1_32f_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiDFTFwd_RToPack_32f_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormDiff_L1_8u_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMax_16u_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormRel_L1_16u_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiCopy_8u_C1MR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiCopy_32s_C3MR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiConvert_32f8u_C1RSfs_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormDiff_L1_16u_C3R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiConvert_16u16s_C1RSfs_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMirror_16u_C3IR_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiMirror_32f_C4R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormRel_L1_16s_C1R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNorm_L2_8u_C3R_as.s.o):
> > > > incompatible target
> > > > |
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > > > error:
> > > >
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_lnx/lib/ia32/libippicv.a(jmp_ippiNormRel_Inf_16u_C1MR_as.s.o):
> > > > incompatible target
> > > > ...
> > > >
> > > >
> > > > > +
> > > > > +S = "${WORKDIR}/git"
> > > > > +
> > > > > +# Do an out-of-tree build
> > > > > +OECMAKE_SOURCEPATH = "${S}"
> > > > > +OECMAKE_BUILDPATH = "${WORKDIR}/build-${TARGET_ARCH}"
> > > > > +
> > > > > +EXTRA_OECMAKE =
> > > >
> "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include
> > > > \
> > > > > +                 -DBUILD_PYTHON_SUPPORT=ON \
> > > > > +                 -DWITH_FFMPEG=ON \
> > > > > +                 -DCMAKE_SKIP_RPATH=ON \
> > > > > +                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3",
> > > > "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1",
> "", d)} \
> > > > > +                 ${@base_conditional("libdir", "/usr/lib64",
> > > > "-DLIB_SUFFIX=64", "", d)} \
> > > > > +                 ${@base_conditional("libdir", "/usr/lib32",
> > > > "-DLIB_SUFFIX=32", "", d)} \
> > > > > +"
> > > > > +
> > > > > +PACKAGECONFIG ??= "eigen gtk jpeg libav png tiff v4l jasper"
> > > > > +PACKAGECONFIG[eigen] =
> "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen,"
> > > > > +PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+,"
> > > > > +PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
> > > > > +PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
> > > > > +PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
> > > > > +PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
> > > > > +PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
> > > > > +PACKAGECONFIG[jasper] =
> "-DBUILD_JASPER=ON,-DBUILD_JASPER=OFF,jasper"
> > > > > +PACKAGECONFIG[pvapi] = '-DWITH_PVAPI=ON
> > > >
> -DPVAPI_LIBRARY="${STAGING_LIBDIR}/libPvAPI.a",-DWITH_PVAPI=OFF,pvapi'
> > > > > +
> > > > > +inherit distutils-base pkgconfig cmake
> > > > > +
> > > > > +export BUILD_SYS
> > > > > +export HOST_SYS
> > > > > +export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
> > > > > +export PYTHON="${STAGING_BINDIR_NATIVE}/python"
> > > > > +
> > > > > +TARGET_CC_ARCH += "-I${S}/include "
> > > > > +
> > > > > +PACKAGES += "${PN}-apps python-opencv"
> > > > > +
> > > > > +python populate_packages_prepend () {
> > > > > +    cv_libdir = d.expand('${libdir}')
> > > > > +    do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev',
> > > > 'OpenCV %s development package', extra_depends='${PN}-dev',
> > > > allow_links=True)
> > > > > +    do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev',
> > > > 'OpenCV %s development package', extra_depends='${PN}-dev')
> > > > > +    do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev',
> > > > 'OpenCV %s development package', extra_depends='${PN}-dev')
> > > > > +    do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s',
> 'OpenCV
> > > > %s library', extra_depends='', allow_links=True)
> > > > > +
> > > > > +    pn = d.getVar('PN', 1)
> > > > > +    metapkg =  pn + '-dev'
> > > > > +    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
> > > > > +    blacklist = [ metapkg ]
> > > > > +    metapkg_rdepends = [ ]
> > > > > +    packages = d.getVar('PACKAGES', 1).split()
> > > > > +    for pkg in packages[1:]:
> > > > > +        if not pkg in blacklist and not pkg in metapkg_rdepends
> and
> > > > pkg.endswith('-dev'):
> > > > > +            metapkg_rdepends.append(pkg)
> > > > > +    d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
> > > > > +}
> > > > > +
> > > > > +PACKAGES_DYNAMIC += "^libopencv-.*"
> > > > > +
> > > > > +FILES_${PN} = ""
> > > > > +FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
> > > > > +FILES_${PN}-dbg += "${libdir}/.debug"
> > > > > +FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
> > > > > +FILES_${PN}-doc = "${datadir}/OpenCV/doc"
> > > > > +FILES_${PN}-staticdev +=
> "${datadir}/OpenCV/3rdparty${base_libdir}"
> > > > > +
> > > > > +ALLOW_EMPTY_${PN} = "1"
> > > > > +
> > > > > +INSANE_SKIP_python-opencv = "True"
> > > > > +DESCRIPTION_python-opencv = "Python bindings to opencv"
> > > > > +FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
> > > > > +RDEPENDS_python-opencv = "python-core python-numpy"
> > > > > +
> > > > > +do_install_append() {
> > > > > +    cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
> > > > > +    sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
> > > > > +}
> > > > > --
> > > > > 1.9.1
> > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-devel mailing list
> > > > > Openembedded-devel@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > >
> > > > --
> > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > >
> > > >
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>
>
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

