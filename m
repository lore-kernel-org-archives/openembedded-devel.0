Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E70CD11C2
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 15:18:28 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.15056.1712330305900773670
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Apr 2024 08:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZSSaix+L;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5a4d3b82e53so1308559eaf.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 08:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712330305; x=1712935105; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxE3/zL08C0yV/ACF2SLggmm5pfy8G07o6HaEtTfAag=;
        b=ZSSaix+LTOMFwUdnh2GQ/J5o43N3xOtKheUs0tSC5dqV8Cr1c7q3FreKv0JktoO4vi
         b/CCf5SFItD+Lb316lIRXyTng/ZvLcGgH3dOEbcTJGXP2dI0p7iDXo1ueQM+8QQGJBmE
         FxHWM/rqP0FBXqIv1wmkJoJTPGt7cuuRezPaoLsiUjseVYgLLzHL27og0HqvS3Guuucp
         WeLBZok1w5fSZbOARe2LMuM3iBpqQqHJNpVTUpw5oLykQXd+NO5TKWB92jmwOo3kg1ko
         /SYYxZHYf91LHUj1Crl3Ngw3laJY+IHHMZIc+QXBMuCrZaUvrA3SevTF70NdYxMFDl68
         bBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712330305; x=1712935105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxE3/zL08C0yV/ACF2SLggmm5pfy8G07o6HaEtTfAag=;
        b=b6RMq2pv/gX/cuU9Qhbx3np5nF5KXQlT0wvzMWKyzKhdKYr4YUrXaDQH5nUpi3obzM
         tCDmmhxMHmQrbM0FrTz0Ag8n2Xg+ptIJEo8LGZOft/ONDsOFsjKHOlpCyZHriDLXRZW4
         v4Z5Gg3o4ze6YzaKn48aXx/RVykel6p+vp+MRAu6X7P05AR1NQA4zhowjrYPh1XVKdYp
         Zb9iyhx++/0W8wKbvAWANqqLhp0N9nyvbjltZDyCPYm2BeyQRzVRVVjrm9nuYwMJPBXr
         US2n1TV/20O8jtJCvH/If1RZLIXHttPrIxKu2K+mW22DYZ+POWWnxZAGa13LqiPzpR1n
         363g==
X-Forwarded-Encrypted: i=1; AJvYcCUimwg/Tn1vBLjQKODEe/RiQuo1USHmmH3ibErUcp48dxWKyZopyMHQzp/vAaGchMuAhF5H34IgG1zhn9lVe/IWPodOFOGL7gbe7/59E9Hbzs1BmVxhq29/LA==
X-Gm-Message-State: AOJu0YwwHXCB9ksl6H/9UEYsCsCXmvtWG+PnvpGoJGA5ln553zyR27dd
	G1PEhq79bENg6abALtoHB4RieuYAJ7m1HLzxEK6IbZdhAS8rlbbvMQ/4UlylIPMQu6W1JFmK26R
	1eOsGVPdGgnIVP3gP6T0WabiRbQ/Wfzmjfak=
X-Google-Smtp-Source: AGHT+IEGccbDlrPENgI9XFzFwS2uzABYZzSJJPwBxpRMbViAbiOAqSOM1GENZVkzvQGkkck6Ypijq1oTxxCeR0hCSkU=
X-Received: by 2002:a05:6870:548a:b0:22a:6e6c:28f2 with SMTP id
 f10-20020a056870548a00b0022a6e6c28f2mr1208876oan.18.1712330305049; Fri, 05
 Apr 2024 08:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240402054947.10487-1-f_l_k@t-online.de> <CA+chaQe_3orTvmZcOJ1f0zaVSs4rPa0ySFZimpbfpiBKvitLgg@mail.gmail.com>
 <0YIGBS.J01SL0J2C2S41@t-online.de> <CA+chaQfiFbHWuRX2B01LF=Oe=M5vjMDNndo3O5GcY1QDS97deA@mail.gmail.com>
In-Reply-To: <CA+chaQfiFbHWuRX2B01LF=Oe=M5vjMDNndo3O5GcY1QDS97deA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Apr 2024 08:17:59 -0700
Message-ID: <CAMKF1sr5Qbj34qjh3OSZLyPiDUnZduHTuDxqJJ_61htCMm6_oQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] libjxl: add recipe
To: Martin Jansa <martin.jansa@gmail.com>
Cc: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 15:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109824

Can you try to comment out

   CXXFLAGS:append:arm =3D " -mfp16-format=3Dieee"

for a test ?

On Fri, Apr 5, 2024 at 12:13=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> qemuarm build log:
> http://errors.yoctoproject.org/Errors/Details/761504/
>
> shows -mfpu=3Dneon was already used.
>
> FAILED: lib/CMakeFiles/jxl_cms.dir/__/third_party/skcms/skcms.cc.o
> TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2/r=
ecipe-sysroot-native/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++
> --sysroot=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/lib=
jxl/0.10.2/recipe-sysroot
> -DFJXL_ENABLE_AVX512=3D0
> -DHWY_DISABLED_TARGETS=3D"(HWY_SSSE3|HWY_AVX3|HWY_AVX3_SPR|HWY_AVX3_ZEN4)=
"
> -D__DATE__=3D\"redacted\" -D__TIMESTAMP__=3D\"redacted\"
> -D__TIME__=3D\"redacted\" -Djxl_cms_EXPORTS
> -ITOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2=
/git
> -ITOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2=
/git/third_party/skcms
> -isystem TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl=
/0.10.2/build/lib/include
> -mthumb -mfpu=3Dneon -mfloat-abi=3Dhard -mcpu=3Dcortex-a15 -D_TIME_BITS=
=3D64
> -D_FILE_OFFSET_BITS=3D64
> --sysroot=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/lib=
jxl/0.10.2/recipe-sysroot
>  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map
> -fmacro-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gn=
ueabi/libjxl/0.10.2/git=3D/usr/src/debug/libjxl/0.10.2
>  -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-g=
nueabi/libjxl/0.10.2/git=3D/usr/src/debug/libjxl/0.10.2
>  -fmacro-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-g=
nueabi/libjxl/0.10.2/build=3D/usr/src/debug/libjxl/0.10.2
>  -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-g=
nueabi/libjxl/0.10.2/build=3D/usr/src/debug/libjxl/0.10.2
>  -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-g=
nueabi/libjxl/0.10.2/recipe-sysroot=3D
>  -fmacro-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-g=
nueabi/libjxl/0.10.2/recipe-sysroot=3D
>  -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-g=
nueabi/libjxl/0.10.2/recipe-sysroot-native=3D
>  -fvisibility-inlines-hidden -mfp16-format=3Dieee -fno-rtti -DNDEBUG
> -std=3Dc++11 -fPIC -fvisibility=3Dhidden -fvisibility-inlines-hidden
> -fmacro-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gn=
ueabi/libjxl/0.10.2/git=3D.
> -funwind-tables -fno-omit-frame-pointer -Wno-builtin-macro-redefined
> -Wall -fmerge-all-constants -fno-builtin-fwrite -fno-builtin-fread
> -Wextra -Wc++11-compat -Warray-bounds -Wformat-security
> -Wimplicit-fallthrough -Wno-register -Wno-unused-function
> -Wno-unused-parameter -Wnon-virtual-dtor -Woverloaded-virtual -Wvla
> -fsized-deallocation -fno-exceptions -fmath-errno
> -DJPEGXL_ENABLE_SKCMS=3D1 -DHWY_STATIC_DEFINE -Wno-psabi -MD -MT
> lib/CMakeFiles/jxl_cms.dir/__/third_party/skcms/skcms.cc.o -MF
> lib/CMakeFiles/jxl_cms.dir/__/third_party/skcms/skcms.cc.o.d -o
> lib/CMakeFiles/jxl_cms.dir/__/third_party/skcms/skcms.cc.o -c
> TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2/g=
it/third_party/skcms/skcms.cc
> In file included from
> TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2/g=
it/third_party/skcms/skcms.cc:18:
> TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2/r=
ecipe-sysroot-native/usr/lib/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/=
14.0.1/include/arm_neon.h:
> In function 'baseline::F baseline::F_from_Half(U16)':
> TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2/r=
ecipe-sysroot-native/usr/lib/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/=
14.0.1/include/arm_neon.h:7526:1:
> error: inlining failed in call to 'always_inline' 'float32x4_t
> vcvt_f32_f16(float16x4_t)': target specific option mismatch
>  7526 | vcvt_f32_f16 (float16x4_t __a)
>       | ^~~~~~~~~~~~
> In file included from
> TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2/g=
it/third_party/skcms/skcms.cc:2315:
> TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2/g=
it/third_party/skcms/src/Transform_inl.h:155:24:
> note: called from here
>   155 |     return vcvt_f32_f16((float16x4_t)half);
>       |            ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
>
> On Fri, Apr 5, 2024 at 8:48=E2=80=AFAM <f_l_k@t-online.de> wrote:
> >
> > Does this also happen if you add '-mfpu=3Dneon' to CXXFLAGS ?
> >
> > On Fri, Apr 5 2024 at 07:54:47 AM +02:00:00, Martin Jansa <martin.jansa=
@gmail.com> wrote:
> >
> > I'm seeing build failure in 32bit arm builds (with multilib): lib32-lib=
jxl/0.10.2/recipe-sysroot-native/usr/lib/arm-oemllib32-linux-gnueabi/gcc/ar=
m-oemllib32-linux-gnueabi/13.2.0/include/arm_neon.h:7526:1: error: inlining=
 failed in call to 'always_inline' 'float32x4_t vcvt_f32_f16(float16x4_t)':=
 target specific option mismatch 7526 | vcvt_f32_f16 (float16x4_t __a) | ^~=
~~~~~~~~~~ In file included from TOPDIR/BUILD/work/mach-oemllib32-linux-gnu=
eabi/lib32-libjxl/0.10.2/git/third_party/skcms/skcms.cc:2315: TOPDIR/BUILD/=
work/mach-oemllib32-linux-gnueabi/lib32-libjxl/0.10.2/git/third_party/skcms=
/src/Transform_inl.h:155:24: note: called from here 155 | return vcvt_f32_f=
16((float16x4_t)half); | ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~ should I try to re=
produce on some publicly available arm MACHINE (like qemuarm) or is someone=
 else seeing this as well? On Tue, Apr 2, 2024 at 7:50=E2=80=AFAM Markus Vo=
lk <f_l_k@t-online.de> wrote:
> >
> > Import this recipe from meta-wayland, because it is a prerequisite for =
the Gnome desktop. The recently updated gnome-backgrounds package has conve=
rted most of the backgrounds to jxl and to keep them usable the gdk-pixbuf-=
loader for jpegxl must be provided. This is included in the libjxl package =
itself. Signed-off-by: Markus Volk <f_l_k@t-online.de> --- .../libjxl/libjx=
l_2.10.0.bb | 42 +++++++++++++++++++ 1 file changed, 42 insertions(+) creat=
e mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb diff --git=
 a/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb b/meta-oe/recipes-mul=
timedia/libjxl/libjxl_2.10.0.bb new file mode 100644 index 000000000..0c4f7=
9fdb --- /dev/null +++ b/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb=
 @@ -0,0 +1,42 @@ +SUMMARY =3D "Reference implementation of JPEG XL (encode=
r and decoder)" +HOMEPAGE =3D "https://github.com/libjxl/libjxl/" + +LICENS=
E =3D "BSD-3-Clause" +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6a905a337c=
c228a1f68f0b5416f52a7f" + +inherit cmake pkgconfig mime + +DEPENDS =3D "hig=
hway brotli" + +SRC_URI =3D "gitsm://github.com/libjxl/libjxl.git;protocol=
=3Dhttps;nobranch=3D1" + +SRCREV =3D "e1489592a770b989303b0edc5cc1dc447bbe0=
515" +S =3D "${WORKDIR}/git" + +EXTRA_OECMAKE =3D " \ + -DCMAKE_BUILD_TYPE=
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
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109816): https://lists.openembedded.org/g/openembedde=
d-devel/message/109816
> Mute This Topic: https://lists.openembedded.org/mt/105282918/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

