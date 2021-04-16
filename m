Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.6335.1618562715885237671
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Apr 2021 01:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bggdQdoI;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id g5so34286853ejx.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Apr 2021 01:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=A5+pXIObzhsWVoaNmLbg7WWaKGGjCPVdxj9UCbRBeUo=;
        b=bggdQdoIrKUZmmPfCiTUHeaEpTpc9q1T9gFD1g64Y80RBlUjQg2xWP9Zj7CDqNKw3h
         qljN3r7jy4/7g06jF6Ype0OcNsU33T+EttIxiVBW89H8TTt4gXEhFEplKz7o6OlKKB53
         9xN08spZTYgGDxRlf2DFKn0CFlx+GYQ+w4mpJ9YQE7LK7u8JSTl7JHPrun6anhqlB6X2
         ixMAoO5zGXd9S6uoVuXiIprIhU7t+Xg2HmlJbDW440/M7JjZ/U6VEtDKkDgb2jWcoJFS
         BJ7rLi1/blhf/x7kaZzEF3Vy+MTeJyfs0lqFUemN5LBQY9fRyVUH3XrkGCOAXrSfFVqi
         s5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A5+pXIObzhsWVoaNmLbg7WWaKGGjCPVdxj9UCbRBeUo=;
        b=g1/GszSEVnAO8xjBfHMG1L8tyJ5zF3qCNy4NNcyOGP5nwVodhEFiEJjHp5mZQBUv4c
         c2bLeolE5TwlKkXJ7U6HbOFKWqRBHSa/C24MxTx+iWNJGERFF38OxMfA+tt6/JjZRXw6
         +oQy9S/+GdhfMiAlgiPqtuPI+AdEqB8WDoaJYDn0XKM9Lt8cPHaGrWdADibt17hAtIOQ
         CrwGHTOeZNphVK7Ygb5oKAxzA1XCrYFBZkVL/+aM+USQfzxT67R1ThSSE6Dz0x1NWBGf
         +k1iP0YdlfD23jKwDfwUB1H2nIH/nKQMnsrauPemYlPxO8q1OmiFsUF2Lvz4PgrqhM7c
         HrMA==
X-Gm-Message-State: AOAM533upfcPVRYSFgah3++mdxOU+qs3Fcnlh1IX+CC6M4TavjtJo2d+
	zU3E1Q5Y3n9MREg1Y595StA=
X-Google-Smtp-Source: ABdhPJyE/ECd7vmozoGdT13D90FeClB1MLxsCiEbNYMPRNQUQ8OuhlX6cqiBdJht6Prti1uPE9QQ4A==
X-Received: by 2002:a17:907:7baa:: with SMTP id ne42mr7486559ejc.357.1618562714193;
        Fri, 16 Apr 2021 01:45:14 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p9sm4665186edu.79.2021.04.16.01.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 01:45:13 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 16 Apr 2021 10:45:12 +0200
To: =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][hardknott][master][PATCH 2/2] opencv: link sfm module with Glog
Message-ID: <20210416084512.ex6ko2o3o2vpufxj@jama>
References: <20210414003840.2175988-1-Martin.Jansa@gmail.com>
 <20210414003840.2175988-2-Martin.Jansa@gmail.com>
 <f8f8a255-c988-f5d3-fc53-a64e39959095@pr.hu>
MIME-Version: 1.0
In-Reply-To: <f8f8a255-c988-f5d3-fc53-a64e39959095@pr.hu>
X-Groupsio-MsgNum: 90845
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pwtnriy5sxmj2rx5"
Content-Disposition: inline

--pwtnriy5sxmj2rx5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 10:29:24AM +0200, B=F6sz=F6rm=E9nyi Zolt=E1n wrote:
> Thank you!!!
>=20
> Another datapoint: when meta-clang (with LLVM 12.0.0-rc5) is used,
> there is no build issue. Instead, there's a runtime issue because of
> the missing symbols in the sfm library.

Can you please report that in upstream PR as well?
https://github.com/opencv/opencv_contrib/pull/2923

> 2021. 04. 14. 2:38 keltez=E9ssel, Martin Jansa =EDrta:
> > * fixes build issue when dnn PACKAGECONFIG is enabled and ld-is-gold i=
n DISTRO_FEATURES
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >   .../opencv/0001-sfm-link-with-Glog_LIBS.patch | 44 +++++++++++++++++=
++
> >   .../recipes-support/opencv/opencv_4.5.2.bb    |  1 +
> >   2 files changed, 45 insertions(+)
> >   create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-sfm-li=
nk-with-Glog_LIBS.patch
> >=20
> > diff --git a/meta-oe/recipes-support/opencv/opencv/0001-sfm-link-with-=
Glog_LIBS.patch b/meta-oe/recipes-support/opencv/opencv/0001-sfm-link-with-=
Glog_LIBS.patch
> > new file mode 100644
> > index 0000000000..7b2c4100a2
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/opencv/opencv/0001-sfm-link-with-Glog_LI=
BS.patch
> > @@ -0,0 +1,44 @@
> > +From ffe20fc4ec46c6b491eff29a38f90686d4d035f6 Mon Sep 17 00:00:00 200=
1
> > +From: Martin Jansa <Martin.Jansa@gmail.com>
> > +Date: Mon, 12 Apr 2021 20:37:40 +0000
> > +Subject: [PATCH] sfm: link with Glog_LIBS
> > +
> > +* in 4.5.0 there was explicit linkage with GLOG_LIBRARY, but since 4.=
5.1 with:
> > +  https://github.com/opencv/opencv_contrib/commit/23ee62a19b7a3e50d6d=
bf295359d8b1aff2e03fd
> > +
> > +  it's gone, probably because Glog_FOUND is already set from Ceres,
> > +  but then GLOG_LIBRARIES is empty in LIBMV_LIGHT_LIBS and build with=
 gold fails:
> > +
> > +FAILED: bin/example_tutorial_perspective_correction
> > +: && TOPDIR/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/recipe-s=
ysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-g++ -m64 -march=3Dcor=
e2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -ITOPDIR/tmp-glibc/work/core2-64-oe=
-linux/opencv/4.5.2-r0/git/include  -fstack-protector-strong  -O2 -D_FORTIF=
Y_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security  --sysroo=
t=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/recipe-sysroot =
 -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=3DTOPDIR/tm=
p-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0=3D/usr/src/debug/opencv/4.5.=
2-r0                      -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/core2-=
64-oe-linux/opencv/4.5.2-r0=3D/usr/src/debug/opencv/4.5.2-r0               =
       -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/opencv/=
4.5.2-r0/recipe-sysroot=3D                      -fdebug-prefix-map=3DTOPDIR=
/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/recipe-sysroot-native=3D =
 -fvisibility-inlines-hidden  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mf=
pmath=3Dsse -ITOPDIR/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/git/i=
nclude  -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wform=
at-security -Werror=3Dformat-security  --sysroot=3DTOPDIR/tmp-glibc/work/co=
re2-64-oe-linux/opencv/4.5.2-r0/recipe-sysroot   -fsigned-char -W -Wall -We=
rror=3Dreturn-type -Werror=3Dnon-virtual-dtor -Werror=3Daddress -Werror=3Ds=
equence-point -Wformat -Werror=3Dformat-security -Wmissing-declarations -Wu=
ndef -Winit-self -Wpointer-arith -Wshadow -Wsign-promo -Wuninitialized -Wsu=
ggest-override -Wno-delete-non-virtual-dtor -Wno-comment -Wimplicit-fallthr=
ough=3D3 -Wno-strict-overflow -fdiagnostics-show-option -Wno-long-long -pth=
read -fomit-frame-pointer -ffunction-sections -fdata-sections  -msse -msse2=
 -msse3 -mssse3 -DNDEBUG  -DNDEBUG  -m64 -march=3Dcore2 -mtune=3Dcore2 -mss=
e3 -mfpmath=3Dsse -ITOPDIR/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0=
/git/include  -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat =
-Wformat-security -Werror=3Dformat-security  --sysroot=3DTOPDIR/tmp-glibc/w=
ork/core2-64-oe-linux/opencv/4.5.2-r0/recipe-sysroot  -O2 -pipe -g -felimin=
ate-unused-debug-types -fmacro-prefix-map=3DTOPDIR/tmp-glibc/work/core2-64-=
oe-linux/opencv/4.5.2-r0=3D/usr/src/debug/opencv/4.5.2-r0                  =
    -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/opencv/4.5=
.2-r0=3D/usr/src/debug/opencv/4.5.2-r0                      -fdebug-prefix-=
map=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/recipe-sysroo=
t=3D                      -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/core2-=
64-oe-linux/opencv/4.5.2-r0/recipe-sysroot-native=3D  -fvisibility-inlines-=
hidden  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse -ITOPDIR/t=
mp-glibc/work/core2-64-oe-linux/opencv/4.5.2-r0/git/include  -fstack-protec=
tor-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3D=
format-security  --sysroot=3DTOPDIR/tmp-glibc/work/core2-64-oe-linux/opencv=
/4.5.2-r0/recipe-sysroot -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl=
,-z,relro,-z,now -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-z,relr=
o,-z,now  -Wl,--gc-sections -Wl,--as-needed samples/cpp/CMakeFiles/example_=
tutorial_perspective_correction.dir/tutorial_code/features2D/Homography/per=
spective_correction.cpp.o -o bin/example_tutorial_perspective_correction  -=
ldl  -lm  -lpthread  -lrt  lib/libopencv_gapi.so.4.5.2  lib/libopencv_stitc=
hing.so.4.5.2  lib/libopencv_ts.so.4.5.2  lib/libopencv_alphamat.so.4.5.2  =
lib/libopencv_aruco.so.4.5.2  lib/libopencv_bgsegm.so.4.5.2  lib/libopencv_=
bioinspired.so.4.5.2  lib/libopencv_ccalib.so.4.5.2  lib/libopencv_dnn_objd=
etect.so.4.5.2  lib/libopencv_dnn_superres.so.4.5.2  lib/libopencv_dpm.so.4=
.5.2  lib/libopencv_face.so.4.5.2  lib/libopencv_fuzzy.so.4.5.2  lib/libope=
ncv_hfs.so.4.5.2  lib/libopencv_img_hash.so.4.5.2  lib/libopencv_intensity_=
transform.so.4.5.2  lib/libopencv_line_descriptor.so.4.5.2  lib/libopencv_m=
cc.so.4.5.2  lib/libopencv_quality.so.4.5.2  lib/libopencv_rapid.so.4.5.2  =
lib/libopencv_reg.so.4.5.2  lib/libopencv_rgbd.so.4.5.2  lib/libopencv_sali=
ency.so.4.5.2  lib/libopencv_sfm.so.4.5.2  lib/libopencv_stereo.so.4.5.2  l=
ib/libopencv_structured_light.so.4.5.2  lib/libopencv_superres.so.4.5.2  li=
b/libopencv_surface_matching.so.4.5.2  lib/libopencv_tracking.so.4.5.2  lib=
/libopencv_videostab.so.4.5.2  lib/libopencv_wechat_qrcode.so.4.5.2  lib/li=
bopencv_xfeatures2d.so.4.5.2  lib/libopencv_xobjdetect.so.4.5.2  lib/libope=
ncv_xphoto.so.4.5.2  lib/libopencv_shape.so.4.5.2  lib/libopencv_highgui.so=
.4.5.2  lib/libopencv_datasets.so.4.5.2  lib/libopencv_ml.so.4.5.2  lib/lib=
opencv_plot.so.4.5.2  lib/libopencv_phase_unwrapping.so.4.5.2  lib/libopenc=
v_optflow.so.4.5.2  lib/libopencv_ximgproc.so.4.5.2  lib/libopencv_videoio.=
so.4.5.2  lib/libopencv_video.so.4.5.2  lib/libopencv_dnn.so.4.5.2  lib/lib=
opencv_imgcodecs.so.4.5.2  lib/libopencv_objdetect.so.4.5.2  lib/libopencv_=
calib3d.so.4.5.2  lib/libopencv_features2d.so.4.5.2  lib/libopencv_flann.so=
.4.5.2  lib/libopencv_photo.so.4.5.2  lib/libopencv_imgproc.so.4.5.2  lib/l=
ibopencv_core.so.4.5.2  -Wl,-rpath-link,TOPDIR/tmp-glibc/work/core2-64-oe-l=
inux/opencv/4.5.2-r0/build/lib && :
> > +lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::Lo=
gMessage::LogMessage(char const*, int)'
> > +lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::Lo=
gMessage::stream()'
> > +lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::Lo=
gMessage::~LogMessage()'
> > +lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::kL=
ogSiteUninitialized'
> > +lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'fLI::FLAGS=
_v'
> > +lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::In=
itVLOG3__(int**, int*, char const*, int)'
> > +lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::Lo=
gMessageFatal::LogMessageFatal(char const*, int)'
> > +lib/libopencv_sfm.so.4.5.2: error: undefined reference to 'google::Lo=
gMessageFatal::~LogMessageFatal()'
> > +collect2: error: ld returned 1 exit status
> > +
> > +  Add Glog_LIBS which is set to the same value as GLOG_LIBRARIES used=
 to be.
> > +
> > +Upstream-Status: Submitted [https://github.com/opencv/opencv_contrib/=
pull/2923]
> > +
> > +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > +---
> > + modules/sfm/CMakeLists.txt | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/modules/sfm/CMakeLists.txt b/modules/sfm/CMakeLists.txt
> > +index 045a1fe6e..ee7cecdac 100644
> > +--- a/modules/sfm/CMakeLists.txt
> > ++++ b/modules/sfm/CMakeLists.txt
> > +@@ -84,6 +84,7 @@ set(LIBMV_LIGHT_LIBS
> > +   multiview
> > +   numeric
> > +   ${GLOG_LIBRARIES}
> > ++  ${Glog_LIBS}
> > +   ${GFLAGS_LIBRARIES}
> > + )
> > +
> > diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb b/meta-oe/=
recipes-support/opencv/opencv_4.5.2.bb
> > index 04ab807540..311355bd7a 100644
> > --- a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
> > +++ b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
> > @@ -51,6 +51,7 @@ SRC_URI =3D "git://github.com/opencv/opencv.git;name=
=
=3Dopencv \
> >              file://0001-Dont-use-isystem.patch \
> >              file://download.patch \
> >              file://0001-Make-ts-module-external.patch \
> > +           file://0001-sfm-link-with-Glog_LIBS.patch;patchdir=3D../co=
ntrib \
> >              "
> >   SRC_URI_append_riscv64 =3D " file://0001-Use-Os-to-compile-tinyxml2.=
cpp.patch;patchdir=3D../contrib"
> >=20
> >=20
> >=20
> >=20
> >=20
>=20

--pwtnriy5sxmj2rx5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYHlOlwAKCRA3VSO3ZXaA
HAs/AJ9cR8l0+bFhBeSTBVRLulRo0leTmwCeMkLLQy8gTtU3vijP/qvIKxRuKB8=
=KlrH
-----END PGP SIGNATURE-----

--pwtnriy5sxmj2rx5--
