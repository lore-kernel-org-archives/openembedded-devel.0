Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70DBC67861
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 07:13:55 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.5589.1712301234001382339
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Apr 2024 00:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ThsOt6af;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3416df43cabso1374553f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 00:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712301232; x=1712906032; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2acCrR+/qShQ4rhNkCxKAjCFkNfXFshWYIVyYMCvdA=;
        b=ThsOt6afEbWCXv9fkvj/n1jz0tBKuQVQkQ/bpqNUnQ9tf3pvrXAquas8QHzYyOS44q
         1kC1SBc6YTrgwI9rHV2C4Dgb+kSsx+Q0+C0c2XjWxXvusdd1diMWiUGjWxtFEXQUF5rh
         kXfI+RJb27ekLf1VOYGxm2oHe9/Km1gsPlBfYQ2M15Od0Prf2+MeWw1HaiXvkRjOzeYJ
         FIQpesQbt80jwmQf9PVRMpnZLqvyp5f5P84UH96l8oQ5niSBdVo11MRLS66i2vJO8BqS
         xk9ZdQt+IMDIL1RMjB/VT00Uc0j5tusBoIie2tBMi2cMlLhMgNKF5kzTr+N6gOyIWYQO
         J7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712301232; x=1712906032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2acCrR+/qShQ4rhNkCxKAjCFkNfXFshWYIVyYMCvdA=;
        b=qNhfNcowUjbwnWwybIDr7HE5dpDek0ks2vE5BvBJVE8fF5uBpeUOUhG1q19b/HpAWx
         y+UfZNYyHhm+Gr8OgTZMKBBvX9DABTnZ2rUoeWzBdMhewIJvO1i2yY6OCc25VPXjnvXm
         YNqCdQTXoFok2bBCsnmXKac3XryNnt7iEga+sg+ZQFpgFPDtrSUmilEMQV3JwLqGvVGT
         w1GwkeQqs7JeglHjsvivxlA7DE6QzGumemz8my+cmNCZnJNJ3TDMbfFNr82EzlGe8bOk
         sbI97XDYWnfUQjHR/LAeQ1bBN2U73Xg+Dfcqyi5Zf68R4QRS5cOUjE9SS0YS1IXpmcZg
         9zwQ==
X-Gm-Message-State: AOJu0Yzrr7ESIkIZRLnC9puBAqrauVKbJX6yUAtwpCsm0a0Y64x50hRr
	IeUVyWaWkLzdaYyP8nNiQxVAFjgvTYBDk7gwL2dg6HCfoUXVgY0krYCfbrC3VAY6D01gE2P81iv
	NFbZ7HItM8+r0RzTLWzLw0wW9eHg=
X-Google-Smtp-Source: AGHT+IFaCqECJ17hG7tmSXr6QUkVWV23Lt5SiNqHccrZYyOR1DU0nkTjcu5LZnfL0ShjtP7AAmwCh5p/2gel8x/ufaw=
X-Received: by 2002:a05:600c:b8c:b0:415:4efe:e9b0 with SMTP id
 fl12-20020a05600c0b8c00b004154efee9b0mr522343wmb.18.1712301232218; Fri, 05
 Apr 2024 00:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240402054947.10487-1-f_l_k@t-online.de> <CA+chaQe_3orTvmZcOJ1f0zaVSs4rPa0ySFZimpbfpiBKvitLgg@mail.gmail.com>
 <0YIGBS.J01SL0J2C2S41@t-online.de>
In-Reply-To: <0YIGBS.J01SL0J2C2S41@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 5 Apr 2024 09:13:31 +0200
Message-ID: <CA+chaQfiFbHWuRX2B01LF=Oe=M5vjMDNndo3O5GcY1QDS97deA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] libjxl: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 07:13:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109816

qemuarm build log:
http://errors.yoctoproject.org/Errors/Details/761504/

shows -mfpu=3Dneon was already used.

FAILED: lib/CMakeFiles/jxl_cms.dir/__/third_party/skcms/skcms.cc.o
TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2/rec=
ipe-sysroot-native/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++
--sysroot=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjx=
l/0.10.2/recipe-sysroot
-DFJXL_ENABLE_AVX512=3D0
-DHWY_DISABLED_TARGETS=3D"(HWY_SSSE3|HWY_AVX3|HWY_AVX3_SPR|HWY_AVX3_ZEN4)"
-D__DATE__=3D\"redacted\" -D__TIMESTAMP__=3D\"redacted\"
-D__TIME__=3D\"redacted\" -Djxl_cms_EXPORTS
-ITOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2/g=
it
-ITOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2/g=
it/third_party/skcms
-isystem TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0=
.10.2/build/lib/include
-mthumb -mfpu=3Dneon -mfloat-abi=3Dhard -mcpu=3Dcortex-a15 -D_TIME_BITS=3D6=
4
-D_FILE_OFFSET_BITS=3D64
--sysroot=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjx=
l/0.10.2/recipe-sysroot
 -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map
-fmacro-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnue=
abi/libjxl/0.10.2/git=3D/usr/src/debug/libjxl/0.10.2
 -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnu=
eabi/libjxl/0.10.2/git=3D/usr/src/debug/libjxl/0.10.2
 -fmacro-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnu=
eabi/libjxl/0.10.2/build=3D/usr/src/debug/libjxl/0.10.2
 -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnu=
eabi/libjxl/0.10.2/build=3D/usr/src/debug/libjxl/0.10.2
 -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnu=
eabi/libjxl/0.10.2/recipe-sysroot=3D
 -fmacro-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnu=
eabi/libjxl/0.10.2/recipe-sysroot=3D
 -fdebug-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnu=
eabi/libjxl/0.10.2/recipe-sysroot-native=3D
 -fvisibility-inlines-hidden -mfp16-format=3Dieee -fno-rtti -DNDEBUG
-std=3Dc++11 -fPIC -fvisibility=3Dhidden -fvisibility-inlines-hidden
-fmacro-prefix-map=3DTOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnue=
abi/libjxl/0.10.2/git=3D.
-funwind-tables -fno-omit-frame-pointer -Wno-builtin-macro-redefined
-Wall -fmerge-all-constants -fno-builtin-fwrite -fno-builtin-fread
-Wextra -Wc++11-compat -Warray-bounds -Wformat-security
-Wimplicit-fallthrough -Wno-register -Wno-unused-function
-Wno-unused-parameter -Wnon-virtual-dtor -Woverloaded-virtual -Wvla
-fsized-deallocation -fno-exceptions -fmath-errno
-DJPEGXL_ENABLE_SKCMS=3D1 -DHWY_STATIC_DEFINE -Wno-psabi -MD -MT
lib/CMakeFiles/jxl_cms.dir/__/third_party/skcms/skcms.cc.o -MF
lib/CMakeFiles/jxl_cms.dir/__/third_party/skcms/skcms.cc.o.d -o
lib/CMakeFiles/jxl_cms.dir/__/third_party/skcms/skcms.cc.o -c
TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2/git=
/third_party/skcms/skcms.cc
In file included from
TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2/git=
/third_party/skcms/skcms.cc:18:
TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2/rec=
ipe-sysroot-native/usr/lib/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/14=
.0.1/include/arm_neon.h:
In function 'baseline::F baseline::F_from_Half(U16)':
TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2/rec=
ipe-sysroot-native/usr/lib/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/14=
.0.1/include/arm_neon.h:7526:1:
error: inlining failed in call to 'always_inline' 'float32x4_t
vcvt_f32_f16(float16x4_t)': target specific option mismatch
 7526 | vcvt_f32_f16 (float16x4_t __a)
      | ^~~~~~~~~~~~
In file included from
TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2/git=
/third_party/skcms/skcms.cc:2315:
TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-oe-linux-gnueabi/libjxl/0.10.2/git=
/third_party/skcms/src/Transform_inl.h:155:24:
note: called from here
  155 |     return vcvt_f32_f16((float16x4_t)half);
      |            ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~

On Fri, Apr 5, 2024 at 8:48=E2=80=AFAM <f_l_k@t-online.de> wrote:
>
> Does this also happen if you add '-mfpu=3Dneon' to CXXFLAGS ?
>
> On Fri, Apr 5 2024 at 07:54:47 AM +02:00:00, Martin Jansa <martin.jansa@g=
mail.com> wrote:
>
> I'm seeing build failure in 32bit arm builds (with multilib): lib32-libjx=
l/0.10.2/recipe-sysroot-native/usr/lib/arm-oemllib32-linux-gnueabi/gcc/arm-=
oemllib32-linux-gnueabi/13.2.0/include/arm_neon.h:7526:1: error: inlining f=
ailed in call to 'always_inline' 'float32x4_t vcvt_f32_f16(float16x4_t)': t=
arget specific option mismatch 7526 | vcvt_f32_f16 (float16x4_t __a) | ^~~~=
~~~~~~~~ In file included from TOPDIR/BUILD/work/mach-oemllib32-linux-gnuea=
bi/lib32-libjxl/0.10.2/git/third_party/skcms/skcms.cc:2315: TOPDIR/BUILD/wo=
rk/mach-oemllib32-linux-gnueabi/lib32-libjxl/0.10.2/git/third_party/skcms/s=
rc/Transform_inl.h:155:24: note: called from here 155 | return vcvt_f32_f16=
((float16x4_t)half); | ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~ should I try to repr=
oduce on some publicly available arm MACHINE (like qemuarm) or is someone e=
lse seeing this as well? On Tue, Apr 2, 2024 at 7:50=E2=80=AFAM Markus Volk=
 <f_l_k@t-online.de> wrote:
>
> Import this recipe from meta-wayland, because it is a prerequisite for th=
e Gnome desktop. The recently updated gnome-backgrounds package has convert=
ed most of the backgrounds to jxl and to keep them usable the gdk-pixbuf-lo=
ader for jpegxl must be provided. This is included in the libjxl package it=
self. Signed-off-by: Markus Volk <f_l_k@t-online.de> --- .../libjxl/libjxl_=
2.10.0.bb | 42 +++++++++++++++++++ 1 file changed, 42 insertions(+) create =
mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb diff --git a=
/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb b/meta-oe/recipes-multi=
media/libjxl/libjxl_2.10.0.bb new file mode 100644 index 000000000..0c4f79f=
db --- /dev/null +++ b/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb @=
@ -0,0 +1,42 @@ +SUMMARY =3D "Reference implementation of JPEG XL (encoder =
and decoder)" +HOMEPAGE =3D "https://github.com/libjxl/libjxl/" + +LICENSE =
=3D "BSD-3-Clause" +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6a905a337cc2=
28a1f68f0b5416f52a7f" + +inherit cmake pkgconfig mime + +DEPENDS =3D "highw=
ay brotli" + +SRC_URI =3D "gitsm://github.com/libjxl/libjxl.git;protocol=3D=
https;nobranch=3D1" + +SRCREV =3D "e1489592a770b989303b0edc5cc1dc447bbe0515=
" +S =3D "${WORKDIR}/git" + +EXTRA_OECMAKE =3D " \ + -DCMAKE_BUILD_TYPE=3DR=
elease \ + -DJPEGXL_ENABLE_PLUGINS=3DON \ + -DBUILD_TESTING=3DOFF \ + -DJPE=
GXL_WARNINGS_AS_ERRORS=3DOFF \ + -DJPEGXL_ENABLE_SIZELESS_VECTORS=3DON \ + =
-DJPEGXL_ENABLE_SJPEG=3DOFF \ + -DJPEGXL_ENABLE_BENCHMARK=3DOFF \ + -DJPEGX=
L_ENABLE_EXAMPLES=3DOFF \ + -DJPEGXL_ENABLE_MANPAGES=3DOFF \ + -DJPEGXL_ENA=
BLE_SKCMS=3DON \ + -DJPEGXL_FORCE_SYSTEM_BROTLI=3DON \ + -DJPEGXL_FORCE_SYS=
TEM_HWY=3DON \ + -DJPEGXL_ENABLE_JNI=3DOFF \ + -DJPEGXL_ENABLE_TCMALLOC=3DO=
FF \ + -DJPEGXL_ENABLE_TOOLS=3DOFF \ +" + +PACKAGECONFIG ?=3D "mime gdk-pix=
buf-loader" +PACKAGECONFIG[gdk-pixbuf-loader] =3D "-DJPEGXL_ENABLE_PLUGIN_G=
DKPIXBUF=3DON,-DJPEGXL_ENABLE_PLUGIN_GDKPIXBUF=3DOFF,gdk-pixbuf" +PACKAGECO=
NFIG[gimp] =3D "-DJPEGXL_ENABLE_PLUGIN_GIMP210=3DON,-DJPEGXL_ENABLE_PLUGIN_=
GIMP210=3DOFF,gimp" +PACKAGECONFIG[mime] =3D "-DJPEGXL_ENABLE_PLUGIN_MIME=
=3DON,-DJPEGXL_ENABLE_PLUGIN_MIME=3DOFF" + +FILES:${PN} +=3D "${libdir}/gdk=
-pixbuf-2.0 ${datadir}" + +CXXFLAGS:append:arm =3D " -mfp16-format=3Dieee" =
+ -- 2.44.0 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receiv=
e all messages sent to this group. View/Reply Online (#109774): https://lis=
ts.openembedded.org/g/openembedded-devel/message/109774 Mute This Topic: ht=
tps://lists.openembedded.org/mt/105282918/3617156 Group Owner: openembedded=
-devel+owner@lists.openembedded.org Unsubscribe: https://lists.openembedded=
.org/g/openembedded-devel/unsub [martin.jansa@gmail.com] -=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-=3D-=3D-

