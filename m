Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id D952E717F0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Oct 2014 00:06:56 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id fb4so6233935wid.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Oct 2014 17:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JkLcmr38VuHMUFlgsV+u6Wud3mgD8qWrV4utyKTC85A=;
	b=CQvIfJ+mbBAHZScxg6kUgNS3jhYjvFsgKy2q4dQZNEQOMcAV6k8c6jTY/SJmpILmJG
	Yt/jpG6i3ozl6VX9C89sADfLb912kyIrf9NsqzLXa1U/WpyvnnsGGRVh7OZz4O5DCyVe
	AbYe1X6fIk7FCh1A/mFLkTBD0owifIkKQQBtD3kZX9OjBPBJJ32aetg5kwT+/yOvcIkC
	ByTy0zDGuicxUFXWpdWlA1ySgBMMMLatlIem/aGRPxn741XnUfkPPsyDVRWCJVMyQ7ys
	86sYnc8SA4dj1o887yzQGS16ClPSCpf/sGAkiUZ/wQGPJ37PRoTZR7eUQ1XwhODJZ0nF
	jWjg==
X-Received: by 10.180.24.35 with SMTP id r3mr173850wif.71.1412640417525;
	Mon, 06 Oct 2014 17:06:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hu3sm18798265wjb.17.2014.10.06.17.06.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Oct 2014 17:06:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 7 Oct 2014 02:07:58 +0200
To: Nick D'Ademo <nickdademo@gmail.com>
Message-ID: <20141007000758.GA12322@jama>
References: <1411041927-9041-1-git-send-email-nickdademo@gmail.com>
	<20140924151927.GI25706@jama>
	<CANR6C54eaCZdb7ef58XfxdWu8odTUSJXr_X4P=J-_tuv5tkY_A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANR6C54eaCZdb7ef58XfxdWu8odTUSJXr_X4P=J-_tuv5tkY_A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Tue, 07 Oct 2014 00:07:04 -0000
X-Groupsio-MsgNum: 52382
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline

--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 07, 2014 at 10:12:03AM +1100, Nick D'Ademo wrote:
> Hi Martin,
>=20
> qemuarm build issue is fixed - what PV format do you suggest for alpha/be=
ta
> releases?

"2.99+3.0.0-alpha+git${SRCPV}"

would be OK with me

> On Thu, Sep 25, 2014 at 1:19 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>=20
> > On Thu, Sep 18, 2014 at 10:05:27PM +1000, Nick D'Ademo wrote:
> > > Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
> > > ---
> > >  meta-oe/recipes-support/opencv/opencv_3.0.0.bb | 95
> > ++++++++++++++++++++++++++
> > >  1 file changed, 95 insertions(+)
> > >  create mode 100644 meta-oe/recipes-support/opencv/opencv_3.0.0.bb
> > >
> > > diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.0.bb
> > b/meta-oe/recipes-support/opencv/opencv_3.0.0.bb
> > > new file mode 100644
> > > index 0000000..3922964
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/opencv/opencv_3.0.0.bb
> > > @@ -0,0 +1,95 @@
> > > +DESCRIPTION =3D "Opencv : The Open Computer Vision Library"
> > > +HOMEPAGE =3D "http://opencv.org/"
> > > +SECTION =3D "libs"
> > > +
> > > +LICENSE =3D "BSD"
> > > +LIC_FILES_CHKSUM =3D
> > "file://include/opencv2/opencv.hpp;endline=3D41;md5=3D6d690d8488a6fca7a=
2c192932466bb14"
> > > +
> > > +ARM_INSTRUCTION_SET =3D "arm"
> > > +
> > > +DEPENDS =3D "python-numpy libtool swig swig-native python bzip2 zlib
> > glib-2.0 gstreamer gst-plugins-base"
> > > +
> > > +# Commit hash for 3.0.0-alpha tag
> > > +SRCREV =3D "fb9a143429f86603ff93e5bcb2d94b94780b7234"
> > > +SRC_URI =3D "git://github.com/Itseez/opencv.git;branch=3Dmaster \
> > > +           file://opencv-fix-pkgconfig-generation.patch \
> > > +"
> > > +
> > > +PV =3D "3.0.0+git${SRCPV}"
> >
> > subject says alpha, so it should be lower PV than 3.0.0
> >
> > Fails to build for qemuarm:
> >
> > CMakeFiles/opencv_core.dir/src/tables.cpp.o
> > CMakeFiles/opencv_core.dir/src/types.cpp.o
> > CMakeFiles/opencv_core.dir/src/umatrix.cpp.o
> > CMakeFiles/opencv_core.dir/opencl_kernels_core.cpp.o -lz -ldl -lm -lpth=
read
> > -lrt
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(ippinit.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(ippmalloc.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMirror_16s_C4R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiSum_8u_C4R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNorm_Inf_8s_C1MR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMin_8u_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMean_16s_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormRel_L1_32f_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiTranspose_32f_C4IR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiConvert_8u32s_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMinMaxIndx_8u_C1MR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiOr_8u_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippsFlip_16u_I_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNorm_L2_32f_C1MR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiTranspose_8u_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMul_8u_C1RSfs_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMinMaxIndx_8s_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippsFlip_8u_I_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMirror_16u_C4IR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiSet_16s_C1MR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiCompare_8u_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippsInvSqrt_32f_A21_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMirror_16s_C3R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNorm_L1_16s_C4R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormDiff_Inf_16u_C4R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNorm_L2_32f_C4R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormDiff_L2_16s_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNorm_L1_16u_C3R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiTranspose_32s_C4IR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMirror_32f_C1IR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippsSortAscend_8u_I_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippsMaxEvery_32f_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormDiff_L1_16s_C3R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippsMaxEvery_8u_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiDFTInit_C_32fc_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiConvert_8u16s_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNorm_L2_16s_C4R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormRel_Inf_32f_C1MR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiTranspose_8u_C4IR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippsFlip_32f_I_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiCopy_8u_C3MR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormDiff_Inf_8u_C4R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormRel_L2_16u_C1MR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiTranspose_16u_C3R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiCompare_32f_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiSum_32f_C3R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiCopy_16u_C3MR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNorm_L1_8u_C4R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNorm_L1_16u_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiXor_8u_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormDiff_Inf_32f_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMean_StdDev_8u_C1MR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiCopy_32s_C4MR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMirror_32s_C1IR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMean_StdDev_32f_C3CR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMean_8u_C1MR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiAbsDiff_16u_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMirror_32f_C4IR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMirror_16u_C1IR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippsMaxEvery_16u_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormDiff_L2_32f_C1MR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormDiff_L2_8s_C1MR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMin_16s_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNorm_L1_16s_C3R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiDotProd_16s64f_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNorm_Inf_16s_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormRel_Inf_32f_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiConvert_8s16s_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiTranspose_16u_C4IR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippsDFTFwd_CToC_64fc_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiSet_32s_C4MR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiTranspose_32s_C3R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMean_StdDev_32f_C1MR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMean_StdDev_16u_C3CMR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMirror_16s_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMirror_16u_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippsPolarToCart_64f_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormDiff_L2_16s_C3R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippsMaxEvery_64f_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormDiff_L1_32f_C3R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiDCTInvInitAlloc_32f_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNorm_L1_32f_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippsDFTGetSize_R_32f_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiConvert_32s32f_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiConvert_32s16s_C1RSfs_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMirror_32s_C3R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiConvert_16u32f_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiSub_8u_C1RSfs_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiSet_16u_C3MR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormDiff_L1_16u_C4R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNorm_L2_32f_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMax_16s_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMirror_8u_C1IR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiDCTFwdGetBufSize_32f_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormDiff_Inf_32f_C4R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNorm_L2_32f_C3R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormDiff_L1_8u_C4R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiCopy_16u_C1MR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippsSqrt_32f_A21_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormDiff_L2_16u_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiTranspose_8u_C3IR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiConvert_8s16u_C1Rs_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormDiff_L1_16s_C4R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippsDFTInv_CToC_32fc_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMean_StdDev_16u_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormRel_Inf_8u_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMean_8u_C3R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormDiff_L2_8u_C4R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippsDFTInit_C_64fc_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormDiff_L2_8u_C1MR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiTranspose_32f_C1IR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiAnd_8u_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormRel_L2_16u_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormRel_L1_32f_C1MR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiAdd_16u_C1RSfs_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMin_32f_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMean_8u_C4R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippsDFTInv_CToC_64fc_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippsDFTFwd_CToC_32fc_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormDiff_Inf_8u_C3R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMirror_8u_C3R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiSet_32s_C1MR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiTranspose_16s_C4R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiDotProd_16u64f_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiLUTPalette_8u_C3R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiAdd_32f_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNorm_L1_32f_C1MR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiTranspose_32s_C1IR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMirror_16u_C3R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMean_16u_C3CMR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiDFTGetSize_C_32fc_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiTranspose_32s_C4R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormDiff_L1_32f_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiDFTFwd_RToPack_32f_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormDiff_L1_8u_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMax_16u_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormRel_L1_16u_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiCopy_8u_C1MR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiCopy_32s_C3MR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiConvert_32f8u_C1RSfs_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormDiff_L1_16u_C3R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiConvert_16u16s_C1RSfs_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMirror_16u_C3IR_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiMirror_32f_C4R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormRel_L1_16s_C1R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNorm_L2_8u_C3R_as.s.o):
> > incompatible target
> > |
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/lib=
exec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld:
> > error:
> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi=
/opencv/3.0.0+gitAUTOINC+fb9a143429-r0/git/3rdparty/ippicv/unpack/ippicv_ln=
x/lib/ia32/libippicv.a(jmp_ippiNormRel_Inf_16u_C1MR_as.s.o):
> > incompatible target
> > ...
> >
> >
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +# Do an out-of-tree build
> > > +OECMAKE_SOURCEPATH =3D "${S}"
> > > +OECMAKE_BUILDPATH =3D "${WORKDIR}/build-${TARGET_ARCH}"
> > > +
> > > +EXTRA_OECMAKE =3D
> > "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=3D${STAGING_LIBDIR}/${PYTHON_DIR}/site=
-packages/numpy/core/include
> > \
> > > +                 -DBUILD_PYTHON_SUPPORT=3DON \
> > > +                 -DWITH_FFMPEG=3DON \
> > > +                 -DCMAKE_SKIP_RPATH=3DON \
> > > +                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3",
> > "-DENABLE_SSE=3D1 -DENABLE_SSE2=3D1 -DENABLE_SSE3=3D1 -DENABLE_SSSE3=3D=
1", "", d)} \
> > > +                 ${@base_conditional("libdir", "/usr/lib64",
> > "-DLIB_SUFFIX=3D64", "", d)} \
> > > +                 ${@base_conditional("libdir", "/usr/lib32",
> > "-DLIB_SUFFIX=3D32", "", d)} \
> > > +"
> > > +
> > > +PACKAGECONFIG ??=3D "eigen gtk jpeg libav png tiff v4l jasper"
> > > +PACKAGECONFIG[eigen] =3D "-DWITH_EIGEN=3DON,-DWITH_EIGEN=3DOFF,libei=
gen,"
> > > +PACKAGECONFIG[gtk] =3D "-DWITH_GTK=3DON,-DWITH_GTK=3DOFF,gtk+,"
> > > +PACKAGECONFIG[jpeg] =3D "-DWITH_JPEG=3DON,-DWITH_JPEG=3DOFF,jpeg,"
> > > +PACKAGECONFIG[libav] =3D "-DWITH_FFMPEG=3DON,-DWITH_FFMPEG=3DOFF,lib=
av,"
> > > +PACKAGECONFIG[png] =3D "-DWITH_PNG=3DON,-DWITH_PNG=3DOFF,libpng,"
> > > +PACKAGECONFIG[tiff] =3D "-DWITH_TIFF=3DON,-DWITH_TIFF=3DOFF,tiff,"
> > > +PACKAGECONFIG[v4l] =3D "-DWITH_V4L=3DON,-DWITH_V4L=3DOFF,v4l-utils,"
> > > +PACKAGECONFIG[jasper] =3D "-DBUILD_JASPER=3DON,-DBUILD_JASPER=3DOFF,=
jasper"
> > > +PACKAGECONFIG[pvapi] =3D '-DWITH_PVAPI=3DON
> > -DPVAPI_LIBRARY=3D"${STAGING_LIBDIR}/libPvAPI.a",-DWITH_PVAPI=3DOFF,pva=
pi'
> > > +
> > > +inherit distutils-base pkgconfig cmake
> > > +
> > > +export BUILD_SYS
> > > +export HOST_SYS
> > > +export PYTHON_CSPEC=3D"-I${STAGING_INCDIR}/${PYTHON_DIR}"
> > > +export PYTHON=3D"${STAGING_BINDIR_NATIVE}/python"
> > > +
> > > +TARGET_CC_ARCH +=3D "-I${S}/include "
> > > +
> > > +PACKAGES +=3D "${PN}-apps python-opencv"
> > > +
> > > +python populate_packages_prepend () {
> > > +    cv_libdir =3D d.expand('${libdir}')
> > > +    do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev',
> > 'OpenCV %s development package', extra_depends=3D'${PN}-dev',
> > allow_links=3DTrue)
> > > +    do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev',
> > 'OpenCV %s development package', extra_depends=3D'${PN}-dev')
> > > +    do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev',
> > 'OpenCV %s development package', extra_depends=3D'${PN}-dev')
> > > +    do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'Ope=
nCV
> > %s library', extra_depends=3D'', allow_links=3DTrue)
> > > +
> > > +    pn =3D d.getVar('PN', 1)
> > > +    metapkg =3D  pn + '-dev'
> > > +    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
> > > +    blacklist =3D [ metapkg ]
> > > +    metapkg_rdepends =3D [ ]
> > > +    packages =3D d.getVar('PACKAGES', 1).split()
> > > +    for pkg in packages[1:]:
> > > +        if not pkg in blacklist and not pkg in metapkg_rdepends and
> > pkg.endswith('-dev'):
> > > +            metapkg_rdepends.append(pkg)
> > > +    d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
> > > +}
> > > +
> > > +PACKAGES_DYNAMIC +=3D "^libopencv-.*"
> > > +
> > > +FILES_${PN} =3D ""
> > > +FILES_${PN}-apps =3D "${bindir}/* ${datadir}/OpenCV"
> > > +FILES_${PN}-dbg +=3D "${libdir}/.debug"
> > > +FILES_${PN}-dev =3D "${includedir} ${libdir}/pkgconfig"
> > > +FILES_${PN}-doc =3D "${datadir}/OpenCV/doc"
> > > +FILES_${PN}-staticdev +=3D "${datadir}/OpenCV/3rdparty${base_libdir}"
> > > +
> > > +ALLOW_EMPTY_${PN} =3D "1"
> > > +
> > > +INSANE_SKIP_python-opencv =3D "True"
> > > +DESCRIPTION_python-opencv =3D "Python bindings to opencv"
> > > +FILES_python-opencv =3D "${PYTHON_SITEPACKAGES_DIR}/*"
> > > +RDEPENDS_python-opencv =3D "python-core python-numpy"
> > > +
> > > +do_install_append() {
> > > +    cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
> > > +    sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
> > > +}
> > > --
> > > 1.9.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQzLt4ACgkQN1Ujt2V2gBzj9gCgmcZs1qNrfftygxUXp4bIMBjB
U/EAoLjaJZ32xfNEQe7VVyaTBd713iQ0
=sPHd
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
