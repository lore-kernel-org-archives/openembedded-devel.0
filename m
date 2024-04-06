Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2AF6C67861
	for <webhook@archiver.kernel.org>; Sat,  6 Apr 2024 08:11:07 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.8461.1712391063274450116
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Apr 2024 01:11:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kGLNlaib;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-34339f01cd2so2109191f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Apr 2024 01:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712391061; x=1712995861; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzFHc9TCnT/O5VdU+94/b+WtO1Taj25XqZXJVJxhX/s=;
        b=kGLNlaibWOnNJM2oB6x+1fBWTV1eoY6wx12MDAKizXRv3aqX3PrwCMFNuqoxJXbu56
         z7/XyKyOHLqFoyaBeXu8qHLBUSSdCgGDZl5It6TeaSZCijYaeBPUaphYNRXtaqDQnpRA
         0xPSeJyFBozfOJWJY36JdQ1wRKvYYUgyZPyuBjXAeZpvCZbUqqZDBEEq6eg4pPMm2TTi
         KEqihuAzb90DV/beSgnI5VSsIxY/YvsXdDC59qwzFZV1sM9yZXpB0s946sVuFRN/vvnb
         s9ytU4mA/cZSZHcJLWnbinKQVpsyjnmfN8c34iBM7UpvJcsNDhIEWmScivSQ2qSHwv7W
         ryCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712391061; x=1712995861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NzFHc9TCnT/O5VdU+94/b+WtO1Taj25XqZXJVJxhX/s=;
        b=GXRinzvGlQdx7VeXUqyVy6/etJeR0nYdMWuKuyA31WcDVtA5i8ggkU72gh+naeoNdD
         5GByxjbMp6xoLRXTYzSzQdayUYLJ6rfFN7uOx97tEKNqs7+9HaXbiBugOK63u83VcDcr
         Lm0w7ins1BCkbl/nhdZzvLnOhwInRroCX3XaLdFw2z9japoscIbb2o4qwjI5klchdZWo
         oajfpCBkymYXrN1Z9Vdyi63c5fZa3A31X8PHkxucTowEM15vYwSngVCKb4YlsG2MY2NV
         UWxvQIaFC79aVw6QC+KZcUm0LcyTpsuMzLH+PZfltLm80+ic4vVlrTu7jof2NSReUgJ+
         ilAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVJlKL/9bYZnaH5kztyAeQEbU5EFy3aj4cHoyDR9ICcRxkIRaMjYfqIcWOo3WvVXjqLrhNpe7eWHurd/d/WZfTXtXxSr//OQEr/rlZ7P/mpbYKSVWuv7XVhg==
X-Gm-Message-State: AOJu0Ywmmz7E1B+WgL1EKVZAKkeaLFewFfrIZW4qdMKrXmyEFDQDyP/v
	+UFsDbrzJu+v1RCo5deibkLtqbhQQm4vdsiAPCaSnzdd/8dsSAhOB6Z6LOk53tk8c2a/MjvRFh+
	pjgEEi1fDzOaYvqdyrHmIq0iuKJ4=
X-Google-Smtp-Source: AGHT+IHQa+VK5XG+blJ36dO/bw42SWvkVTZdgZyuA1YYRudrSB8whw5zqz0IvDrT4MKAD1AAioejNpFcza6K/I5XsAQ=
X-Received: by 2002:a5d:51c2:0:b0:341:e4f4:4399 with SMTP id
 n2-20020a5d51c2000000b00341e4f44399mr2633707wrv.68.1712391061273; Sat, 06 Apr
 2024 01:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240402054947.10487-1-f_l_k@t-online.de> <CA+chaQe_3orTvmZcOJ1f0zaVSs4rPa0ySFZimpbfpiBKvitLgg@mail.gmail.com>
 <0YIGBS.J01SL0J2C2S41@t-online.de> <CA+chaQfiFbHWuRX2B01LF=Oe=M5vjMDNndo3O5GcY1QDS97deA@mail.gmail.com>
 <CAMKF1sr5Qbj34qjh3OSZLyPiDUnZduHTuDxqJJ_61htCMm6_oQ@mail.gmail.com>
In-Reply-To: <CAMKF1sr5Qbj34qjh3OSZLyPiDUnZduHTuDxqJJ_61htCMm6_oQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 6 Apr 2024 10:10:49 +0200
Message-ID: <CA+chaQfJUs_mSqnfuNzBOmKA+zFBuGNrH398Jae6qYrxPS8UhQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] libjxl: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Apr 2024 08:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109832

On Fri, Apr 5, 2024 at 5:18=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> Can you try to comment out
>
>    CXXFLAGS:append:arm =3D " -mfp16-format=3Dieee"
>
> for a test ?

Yes, that fixes the build on qemuarm.

> On Fri, Apr 5, 2024 at 12:13=E2=80=AFAM Martin Jansa <martin.jansa@gmail.=
com> wrote:
> >
> > qemuarm build log:
> > http://errors.yoctoproject.org/Errors/Details/761504/
> >
> > shows -mfpu=3Dneon was already used.
> >
> > FAILED: lib/CMakeFiles/jxl_cms.dir/__/third_party/skcms/skcms.cc.o
> > TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2=
/recipe-sysroot-native/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-g+=
+
> > --sysroot=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/l=
ibjxl/0.10.2/recipe-sysroot
> > -DFJXL_ENABLE_AVX512=3D0
> > -DHWY_DISABLED_TARGETS=3D"(HWY_SSSE3|HWY_AVX3|HWY_AVX3_SPR|HWY_AVX3_ZEN=
4)"
> > -D__DATE__=3D\"redacted\" -D__TIMESTAMP__=3D\"redacted\"
> > -D__TIME__=3D\"redacted\" -Djxl_cms_EXPORTS
> > -ITOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10=
.2/git
> > -ITOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10=
.2/git/third_party/skcms
> > -isystem TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libj=
xl/0.10.2/build/lib/include
> > -mthumb -mfpu=3Dneon -mfloat-abi=3Dhard -mcpu=3Dcortex-a15 -D_TIME_BITS=
=3D64
> > -D_FILE_OFFSET_BITS=3D64
> > --sysroot=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/l=
ibjxl/0.10.2/recipe-sysroot
> >  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map
> > -fmacro-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-=
gnueabi/libjxl/0.10.2/git=3D/usr/src/debug/libjxl/0.10.2
> >  -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux=
-gnueabi/libjxl/0.10.2/git=3D/usr/src/debug/libjxl/0.10.2
> >  -fmacro-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux=
-gnueabi/libjxl/0.10.2/build=3D/usr/src/debug/libjxl/0.10.2
> >  -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux=
-gnueabi/libjxl/0.10.2/build=3D/usr/src/debug/libjxl/0.10.2
> >  -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux=
-gnueabi/libjxl/0.10.2/recipe-sysroot=3D
> >  -fmacro-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux=
-gnueabi/libjxl/0.10.2/recipe-sysroot=3D
> >  -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux=
-gnueabi/libjxl/0.10.2/recipe-sysroot-native=3D
> >  -fvisibility-inlines-hidden -mfp16-format=3Dieee -fno-rtti -DNDEBUG
> > -std=3Dc++11 -fPIC -fvisibility=3Dhidden -fvisibility-inlines-hidden
> > -fmacro-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-=
gnueabi/libjxl/0.10.2/git=3D.
> > -funwind-tables -fno-omit-frame-pointer -Wno-builtin-macro-redefined
> > -Wall -fmerge-all-constants -fno-builtin-fwrite -fno-builtin-fread
> > -Wextra -Wc++11-compat -Warray-bounds -Wformat-security
> > -Wimplicit-fallthrough -Wno-register -Wno-unused-function
> > -Wno-unused-parameter -Wnon-virtual-dtor -Woverloaded-virtual -Wvla
> > -fsized-deallocation -fno-exceptions -fmath-errno
> > -DJPEGXL_ENABLE_SKCMS=3D1 -DHWY_STATIC_DEFINE -Wno-psabi -MD -MT
> > lib/CMakeFiles/jxl_cms.dir/__/third_party/skcms/skcms.cc.o -MF
> > lib/CMakeFiles/jxl_cms.dir/__/third_party/skcms/skcms.cc.o.d -o
> > lib/CMakeFiles/jxl_cms.dir/__/third_party/skcms/skcms.cc.o -c
> > TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2=
/git/third_party/skcms/skcms.cc
> > In file included from
> > TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2=
/git/third_party/skcms/skcms.cc:18:
> > TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2=
/recipe-sysroot-native/usr/lib/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueab=
i/14.0.1/include/arm_neon.h:
> > In function 'baseline::F baseline::F_from_Half(U16)':
> > TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2=
/recipe-sysroot-native/usr/lib/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueab=
i/14.0.1/include/arm_neon.h:7526:1:
> > error: inlining failed in call to 'always_inline' 'float32x4_t
> > vcvt_f32_f16(float16x4_t)': target specific option mismatch
> >  7526 | vcvt_f32_f16 (float16x4_t __a)
> >       | ^~~~~~~~~~~~
> > In file included from
> > TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2=
/git/third_party/skcms/skcms.cc:2315:
> > TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2=
/git/third_party/skcms/src/Transform_inl.h:155:24:
> > note: called from here
> >   155 |     return vcvt_f32_f16((float16x4_t)half);
> >       |            ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
> >
> > On Fri, Apr 5, 2024 at 8:48=E2=80=AFAM <f_l_k@t-online.de> wrote:
> > >
> > > Does this also happen if you add '-mfpu=3Dneon' to CXXFLAGS ?
> > >
> > > On Fri, Apr 5 2024 at 07:54:47 AM +02:00:00, Martin Jansa <martin.jan=
sa@gmail.com> wrote:
> > >
> > > I'm seeing build failure in 32bit arm builds (with multilib): lib32-l=
ibjxl/0.10.2/recipe-sysroot-native/usr/lib/arm-oemllib32-linux-gnueabi/gcc/=
arm-oemllib32-linux-gnueabi/13.2.0/include/arm_neon.h:7526:1: error: inlini=
ng failed in call to 'always_inline' 'float32x4_t vcvt_f32_f16(float16x4_t)=
': target specific option mismatch 7526 | vcvt_f32_f16 (float16x4_t __a) | =
^~~~~~~~~~~~ In file included from TOPDIR/BUILD/work/mach-oemllib32-linux-g=
nueabi/lib32-libjxl/0.10.2/git/third_party/skcms/skcms.cc:2315: TOPDIR/BUIL=
D/work/mach-oemllib32-linux-gnueabi/lib32-libjxl/0.10.2/git/third_party/skc=
ms/src/Transform_inl.h:155:24: note: called from here 155 | return vcvt_f32=
_f16((float16x4_t)half); | ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~ should I try to =
reproduce on some publicly available arm MACHINE (like qemuarm) or is someo=
ne else seeing this as well? On Tue, Apr 2, 2024 at 7:50=E2=80=AFAM Markus =
Volk <f_l_k@t-online.de> wrote:
> > >
> > > Import this recipe from meta-wayland, because it is a prerequisite fo=
r the Gnome desktop. The recently updated gnome-backgrounds package has con=
verted most of the backgrounds to jxl and to keep them usable the gdk-pixbu=
f-loader for jpegxl must be provided. This is included in the libjxl packag=
e itself. Signed-off-by: Markus Volk <f_l_k@t-online.de> --- .../libjxl/lib=
jxl_2.10.0.bb | 42 +++++++++++++++++++ 1 file changed, 42 insertions(+) cre=
ate mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb diff --g=
it a/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb b/meta-oe/recipes-m=
ultimedia/libjxl/libjxl_2.10.0.bb new file mode 100644 index 000000000..0c4=
f79fdb --- /dev/null +++ b/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.=
bb @@ -0,0 +1,42 @@ +SUMMARY =3D "Reference implementation of JPEG XL (enco=
der and decoder)" +HOMEPAGE =3D "https://github.com/libjxl/libjxl/" + +LICE=
NSE =3D "BSD-3-Clause" +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6a905a33=
7cc228a1f68f0b5416f52a7f" + +inherit cmake pkgconfig mime + +DEPENDS =3D "h=
ighway brotli" + +SRC_URI =3D "gitsm://github.com/libjxl/libjxl.git;protoco=
l=3Dhttps;nobranch=3D1" + +SRCREV =3D "e1489592a770b989303b0edc5cc1dc447bbe=
0515" +S =3D "${WORKDIR}/git" + +EXTRA_OECMAKE =3D " \ + -DCMAKE_BUILD_TYPE=
=3DRelease \ + -DJPEGXL_ENABLE_PLUGINS=3DON \ + -DBUILD_TESTING=3DOFF \ + -=
DJPEGXL_WARNINGS_AS_ERRORS=3DOFF \ + -DJPEGXL_ENABLE_SIZELESS_VECTORS=3DON =
\ + -DJPEGXL_ENABLE_SJPEG=3DOFF \ + -DJPEGXL_ENABLE_BENCHMARK=3DOFF \ + -DJ=
PEGXL_ENABLE_EXAMPLES=3DOFF \ + -DJPEGXL_ENABLE_MANPAGES=3DOFF \ + -DJPEGXL=
_ENABLE_SKCMS=3DON \ + -DJPEGXL_FORCE_SYSTEM_BROTLI=3DON \ + -DJPEGXL_FORCE=
_SYSTEM_HWY=3DON \ + -DJPEGXL_ENABLE_JNI=3DOFF \ + -DJPEGXL_ENABLE_TCMALLOC=
=3DOFF \ + -DJPEGXL_ENABLE_TOOLS=3DOFF \ +" + +PACKAGECONFIG ?=3D "mime gdk=
-pixbuf-loader" +PACKAGECONFIG[gdk-pixbuf-loader] =3D "-DJPEGXL_ENABLE_PLUG=
IN_GDKPIXBUF=3DON,-DJPEGXL_ENABLE_PLUGIN_GDKPIXBUF=3DOFF,gdk-pixbuf" +PACKA=
GECONFIG[gimp] =3D "-DJPEGXL_ENABLE_PLUGIN_GIMP210=3DON,-DJPEGXL_ENABLE_PLU=
GIN_GIMP210=3DOFF,gimp" +PACKAGECONFIG[mime] =3D "-DJPEGXL_ENABLE_PLUGIN_MI=
ME=3DON,-DJPEGXL_ENABLE_PLUGIN_MIME=3DOFF" + +FILES:${PN} +=3D "${libdir}/g=
dk-pixbuf-2.0 ${datadir}" + +CXXFLAGS:append:arm =3D " -mfp16-format=3Dieee=
" + -- 2.44.0
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#109816): https://lists.openembedded.org/g/openembed=
ded-devel/message/109816
> > Mute This Topic: https://lists.openembedded.org/mt/105282918/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

