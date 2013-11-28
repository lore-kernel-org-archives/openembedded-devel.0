Return-Path: <nickdademo@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 08A8F6D975
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 01:58:22 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id uz6so8132727obc.23
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 17:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=2UnNbzKzXzbFlH2mNGKytA0lKX/OCeDSxvqxTZJ2KlA=;
	b=SYt1lsrw5L54BuEMqircm6yydPCRxC/xbWPIzwldiyhQ2aVHVg9rDyfajPVoINTRxa
	YcVbr2JW8RSdF5ynABhM8sIh78T5BTQ1YPUb26OEYI2MERiMXnQ9HmSxvC7yAVJMSgDL
	VJ7kVgRsEmHz79Lhqnav1Avm5WOmhfi1NH8T1zW4KY4X6AL5VLL/dBp9cGTfKQ99qA+2
	i5faHiPGgVyEXGirk2e044wPbuqCwlRpHPINEjDr8/LycR+EuVhCxR2bRTmwSIFYIGGu
	dDFWZJnPE1Nhf8XJCeHGwk1ogZaGmLOCdzuRIyc6GGzgUNzGVOB/bWYJLm+RCEnGInPP
	18Cw==
X-Received: by 10.182.144.136 with SMTP id sm8mr163332obb.63.1385603902196;
	Wed, 27 Nov 2013 17:58:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.133.130 with HTTP; Wed, 27 Nov 2013 17:58:02 -0800 (PST)
In-Reply-To: <20131127134302.GP2870@jama>
References: <1385548830-6541-1-git-send-email-nickdademo@gmail.com>
	<20131127134302.GP2870@jama>
From: "Nick D'Ademo" <nickdademo@gmail.com>
Date: Thu, 28 Nov 2013 12:58:02 +1100
Message-ID: <CANR6C54f7XnUuxJ6TMHHnhXVGHEhg1iB4ejLmPcg+8HVfEcwSg@mail.gmail.com>
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
X-List-Received-Date: Thu, 28 Nov 2013 01:58:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

You're quite right Martin - "base_conditional" makes more sense here. I'll
resend the updated patch now.

Cheers,
Nick


On Thu, Nov 28, 2013 at 12:43 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Wed, Nov 27, 2013 at 09:40:30PM +1100, Nick D'Ademo wrote:
> > Pass LIB_SUFFIX to CMake during a multilib build so that the generated
> library folder has the correct suffix.
> >
> > Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
> > ---
> >  meta-oe/recipes-support/opencv/opencv_2.4.bb |   10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bbb/meta-oe/recipes-support/opencv/
> opencv_2.4.bb
> > index 9dd9cd0..8d4d8da 100644
> > --- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
> > +++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
> > @@ -9,7 +9,7 @@ ARM_INSTRUCTION_SET = "arm"
> >
> >  DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib
> glib-2.0"
> >
> > -SRCREV = "c5afaa4e8dfe507e87531f7688b9cf65c1f701c6"
> > +SRCREV = "1253c2101b22b9e89400553fd220858cda8d6ea5"
> >  SRC_URI = "git://github.com/Itseez/opencv.git;branch=2.4 \
> >             file://opencv-fix-pkgconfig-generation.patch \
> >  "
> > @@ -27,6 +27,8 @@ EXTRA_OECMAKE =
> "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}
> >                   -DWITH_GSTREAMER=OFF \
> >                   -DCMAKE_SKIP_RPATH=ON \
> >                   ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3",
> "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
> > +                 ${@bb.utils.contains("libdir", "/usr/lib64",
> "-DLIB_SUFFIX=64", "", d)} \
> > +                 ${@bb.utils.contains("libdir", "/usr/lib32",
> "-DLIB_SUFFIX=32", "", d)} \
>
> do you need contains here? Why not base_conditional?
> >  "
> >
> >  PACKAGECONFIG ??= "eigen gtk jpeg libav png tiff v4l"
> > @@ -88,4 +90,10 @@ RDEPENDS_python-opencv = "python-core python-numpy"
> >  do_install_append() {
> >      cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
> >      sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
> > +
> > +    # Move Python files into correct library folder (for multilib build)
> > +    if [ "$libdir" != "/usr/lib" ]; then
> > +        mv ${D}/usr/lib/* ${D}/${libdir}/
> > +        rm -rf ${D}/usr/lib
> > +    fi
> >  }
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

