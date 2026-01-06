Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D644ECD0437
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 04:42:25 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83752.1767674536365923986
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 20:42:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=edlqP1B6;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4557f0e5e60so408869b6e.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 20:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767674535; x=1768279335; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maf28Tnj6NNfsWyesMnS3wEX9tgpjjC5QuB3Yq2mZBs=;
        b=edlqP1B64VUzXr4N7VZSsMZLU4KPzS9ARw5cN6iLa8ub4egog5o3OURZBQR5fBdLdF
         hXhMhcQE5usU+CaMiQc6IvkTngUljnK/Nrh0ndcSJdW8ME0NhN81CubUdv0uYA5kKgjZ
         UPEKh1x0hZx832xuiHJO2sJVYajKmYgCO3WLE0QKJM+0jggs6A2Z1t9YLe/Sqf4qx2YJ
         8brBZmUKi2tjFZDwl4yzdJCy8/xXrPGe1kYbYNckNT6O5iSpPele7w/EfDPN8Cq3AX6s
         qEmgUHLKuZjrTq/eS2Upadvnpk3CvYDIzkxRHzpsbTgJI0U3CEVRL/gao1dIbA+hGekC
         hJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767674535; x=1768279335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=maf28Tnj6NNfsWyesMnS3wEX9tgpjjC5QuB3Yq2mZBs=;
        b=P8RQ42A2cPRad18/C1DAikQnkcB3fp/6kEAKaWN2u1EKVM6GhJRJuT45ULqWlgItPR
         WNiiJrIXAtekPWdYTzpOqwYAbBroDztM5IYrzXBCOdC7eslXNQxVg+T3xgFX+R2WImys
         fj9LIrMKqT6pMmXp6PXul+VVjAYa/4RTDP+eZyDsYtTkOiDmPC+m8RsPfCZu6bBxzfWk
         SnWW36fbt3qKH26buLQuifln5nclbatnS7P+lIIuTEHYyZHGQv5mCVNyFveSgb/+nAWH
         47qMbquCsNRFVS9o2/xHu0JG7lcItuCLmyExm3pdsO9p22ZQx4y8bDRW57E9NhdYH8/J
         yGww==
X-Gm-Message-State: AOJu0Yw32dTHFYs8dn1YhZCsL2ZfmYLokxzUzCJi+1Wty7m8InlXXSZO
	8Z1NZ8JNJKD2nnw754j+HTSYQHhg6dbAqN6VPb0ebTXP/08LrIh5+AIkeTPUr+GAZXfan+FLtB2
	dZ6C8SGT+dDKBbOJXntlZfVQ94vfxIjs=
X-Gm-Gg: AY/fxX5pNPjok75ddC5QJhhpbTYUPWGqKkhTfR1U1iqTt9k8TREVttOliqi0yGOVh3D
	rN0h/Hhf4r6X44BOGpZrBc0rSSdXvjI6AsGhf3s72HPbjX96vMWHXr78lAEhALBHRgAguFMOCMh
	ZiSWJilG/0F3UqZ54mi4SqzmX5gN0MA/G36SJ8yxTrRM2Haggu+2ByrmJxBZkQZJ8lon0xbL6vt
	O82IgPfky/0aawCCNbJ8RfrnUqqcMNfOC57+3337vD0OVXoPYK91OqHF2bNnil3Kxul+zFd
X-Google-Smtp-Source: AGHT+IEoZgh9OY+UPhyEqp9zBrVERASX4n6uJxIPUti2j8fvnRPbfTZk1oWJ00x7bnhBte1MtQ/650p60/U9cHG4j+4=
X-Received: by 2002:a05:6820:8389:b0:65b:5745:6123 with SMTP id
 006d021491bc7-65f479a5d8amr1076073eaf.16.1767674535324; Mon, 05 Jan 2026
 20:42:15 -0800 (PST)
MIME-Version: 1.0
References: <20260105100237.3081345-1-skandigraun@gmail.com> <20260105100237.3081345-4-skandigraun@gmail.com>
In-Reply-To: <20260105100237.3081345-4-skandigraun@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 6 Jan 2026 10:12:04 +0530
X-Gm-Features: AQt7F2oS9aLfoLa7mrEvRm3X-KFVcT9Si5BQDvmOqxl-BGVY7Lv1KOOl6dvkyPY
Message-ID: <CADySD0Gv8qkYZuYtuuu+5FCdM1gcvNcjmTjskMdNG6rAusemcg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][whinlatter][PATCH 04/17] gimp: patch CVE-2025-14422
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 04:42:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123162

Hi Gyorgy,

This is causing following build failures on qemuarm with musl and clang

mozjs:
| /usr/src/debug/mozjs-128/128.5.2/mozglue/misc/StackWalk.cpp:810:(.text._Z=
L15unwind_callbackP15_Unwind_ContextPv+0x4):
undefined reference to `_Unwind_GetIP'
| arm-poky-linux-musleabi-clang++: error: linker command failed with
exit code 1 (use -v to see invocation)

libjxl:
FAILED: [code=3D1] lib/CMakeFiles/jxl_dec-obj.dir/jxl/convolve_separable5.c=
c.o
/yocto/bitbake-builds/poky-whinlatter/build/tmp/work/cortexa15t2hf-neon-pok=
y-linux-musleabi/libjxl/0.11.1/recipe-sysroot-native/usr/bin/arm-poky-linux=
-musleabi/arm-poky-linux-musleabi-clang++
--sysroot=3D/yocto/bitbake-builds/poky-whinlatter/build/tmp/work/cortexa15t=
2hf-neon-poky-linux-musleabi/libjxl/0.11.1/recipe-sysroot
-DFJXL_ENABLE_AVX512=3D0 -DJXL_INTERNAL_LIBRARY_BUILD
-D__DATE__=3D\"redacted\" -D__TIMESTAMP__=3D\"redacted\"
-D__TIME__=3D\"redacted\"
-I/yocto/bitbake-builds/poky-whinlatter/build/tmp/work/cortexa15t2hf-neon-p=
oky-linux-musleabi/libjxl/0.11.1/sources/libjxl-0.11.1
-isystem /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/cortexa15t2hf=
-neon-poky-linux-musleabi/libjxl/0.11.1/build/lib/include
-mthumb -mfpu=3Dneon -mfloat-abi=3Dhard -mcpu=3Dcortex-a15
--dyld-prefix=3D/usr -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2
-Wformat -Wformat-security -Werror=3Dformat-security -D_TIME_BITS=3D64
-D_FILE_OFFSET_BITS=3D64
--sysroot=3D/yocto/bitbake-builds/poky-whinlatter/build/tmp/work/cortexa15t=
2hf-neon-poky-linux-musleabi/libjxl/0.11.1/recipe-sysroot
 -O2 -g   -ffile-prefix-map=3D/yocto/bitbake-builds/poky-whinlatter/build/t=
mp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/sources/libjxl=
-0.11.1=3D/usr/src/debug/libjxl/0.11.1
 -ffile-prefix-map=3D/yocto/bitbake-builds/poky-whinlatter/build/tmp/work/c=
ortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/build=3D/usr/src/debug/=
libjxl/0.11.1
 -ffile-prefix-map=3D/yocto/bitbake-builds/poky-whinlatter/build/tmp/work/c=
ortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/recipe-sysroot=3D
 -ffile-prefix-map=3D/yocto/bitbake-builds/poky-whinlatter/build/tmp/work/c=
ortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/recipe-sysroot-native=
=3D
 -pipe -fvisibility-inlines-hidden -fno-rtti -DNDEBUG -std=3Dc++17 -fPIC
-fvisibility=3Dhidden -fvisibility-inlines-hidden
-fmacro-prefix-map=3D/yocto/bitbake-builds/poky-whinlatter/build/tmp/work/c=
ortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/sources/libjxl-0.11.1=
=3D.
"-DHWY_DISABLED_TARGETS=3D(HWY_SSSE3|HWY_AVX3|HWY_AVX3_SPR|HWY_AVX3_ZEN4)"
-funwind-tables -Xclang -mrelax-all -fno-omit-frame-pointer
-Wno-builtin-macro-redefined -Wall -fmerge-all-constants
-fno-builtin-fwrite -fno-builtin-fread -Wextra -Wc++11-compat
-Warray-bounds -Wformat-security -Wimplicit-fallthrough -Wno-register
-Wno-unused-function -Wno-unused-parameter -Wnon-virtual-dtor
-Woverloaded-virtual -Wvla -Wdeprecated-increment-bool
-Wfloat-overflow-conversion -Wfloat-zero-conversion
-Wfor-loop-analysis -Wgnu-redeclared-enum -Winfinite-recursion
-Wliteral-conversion -Wno-c++98-compat
-Wno-unused-command-line-argument -Wprivate-header -Wself-assign
-Wstring-conversion -Wtautological-overlap-compare
-Wthread-safety-analysis -Wundefined-func-template -Wunreachable-code
-Wunused-comparison -fsized-deallocation -fno-exceptions -fmath-errno
-fnew-alignment=3D8 -fno-cxx-exceptions -fno-slp-vectorize
-fno-vectorize -disable-free -disable-llvm-verifier
-DJPEGXL_ENABLE_SKCMS=3D1 -DJPEGXL_ENABLE_TRANSCODE_JPEG=3D1
-DJPEGXL_ENABLE_BOXES=3D1 -MD -MT
lib/CMakeFiles/jxl_dec-obj.dir/jxl/convolve_separable5.cc.o -MF
lib/CMakeFiles/jxl_dec-obj.dir/jxl/convolve_separable5.cc.o.d -o
lib/CMakeFiles/jxl_dec-obj.dir/jxl/convolve_separable5.cc.o -c
/yocto/bitbake-builds/poky-whinlatter/build/tmp/work/cortexa15t2hf-neon-pok=
y-linux-musleabi/libjxl/0.11.1/sources/libjxl-0.11.1/lib/jxl/convolve_separ=
able5.cc
error: out of range pc-relative fixup value
1 error generated.
ninja: build stopped: subcommand failed.

It builds on qemux86 with musl and clang though.

Having said that, I don't think the problem is due to your patch as
gimp fails to build on qemuarm with musl and clang even without your
patches.

So this needs to be investigated separately.

cheers
Ankur

On Mon, Jan 5, 2026 at 11:02=E2=80=AFPM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14422
>
> Pick the patch referenced by the NVD report.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit a0b41204afe57f9b2b3f2e8ff496be72d04e0eb7)
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../gimp/gimp/CVE-2025-14422.patch            | 66 +++++++++++++++++++
>  meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb    | 12 ++--
>  2 files changed, 73 insertions(+), 5 deletions(-)
>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patc=
h
>
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch b/met=
a-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch
> new file mode 100644
> index 0000000000..420e013916
> --- /dev/null
> +++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch
> @@ -0,0 +1,66 @@
> +From 0a941cab81396d65a8ab547847f8c542039e214f Mon Sep 17 00:00:00 2001
> +From: Gyorgy Sarvari <skandigraun@gmail.com>
> +Date: Sun, 23 Nov 2025 16:43:51 +0000
> +Subject: [PATCH] plug-ins: Fix ZDI-CAN-28273
> +
> +From: Alx Sa <cmyk.student@gmail.com>
> +
> +Resolves #15286
> +Adds a check to the memory allocation
> +in pnm_load_raw () with g_size_checked_mul ()
> +to see if the size would go out of bounds.
> +If so, we don't try to allocate and load the
> +image.
> +
> +CVE: CVE-2025-14422
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/=
4ff2d773d58064e6130495de498e440f4a6d5edb]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + plug-ins/common/file-pnm.c | 13 +++++++++++--
> + 1 file changed, 11 insertions(+), 2 deletions(-)
> +
> +diff --git a/plug-ins/common/file-pnm.c b/plug-ins/common/file-pnm.c
> +index 32a33a4..9d349e9 100644
> +--- a/plug-ins/common/file-pnm.c
> ++++ b/plug-ins/common/file-pnm.c
> +@@ -674,7 +674,7 @@ load_image (GFile   *file,
> +             GError **error)
> + {
> +   GInputStream    *input;
> +-  GeglBuffer      *buffer;
> ++  GeglBuffer      *buffer    =3D NULL;
> +   GimpImage * volatile image =3D NULL;
> +   GimpLayer       *layer;
> +   char             buf[BUFLEN + 4];  /* buffer for random things like s=
canning */
> +@@ -708,6 +708,9 @@ load_image (GFile   *file,
> +       g_object_unref (input);
> +       g_free (pnminfo);
> +
> ++      if (buffer)
> ++        g_object_unref (buffer);
> ++
> +       if (image)
> +         gimp_image_delete (image);
> +
> +@@ -1060,6 +1063,7 @@ pnm_load_raw (PNMScanner *scan,
> +   const Babl   *format =3D NULL;
> +   gint          bpc;
> +   guchar       *data, *d;
> ++  gsize         data_size;
> +   gushort      *s;
> +   gint          x, y, i;
> +   gint          start, end, scanlines;
> +@@ -1070,7 +1074,12 @@ pnm_load_raw (PNMScanner *scan,
> +     bpc =3D 1;
> +
> +   /* No overflow as long as gimp_tile_height() < 1365 =3D 2^(31 - 18) /=
 6 */
> +-  data =3D g_new (guchar, gimp_tile_height () * info->xres * info->np *=
 bpc);
> ++  if (! g_size_checked_mul (&data_size, gimp_tile_height (), info->xres=
) ||
> ++      ! g_size_checked_mul (&data_size, data_size, info->np)           =
  ||
> ++      ! g_size_checked_mul (&data_size, data_size, bpc))
> ++    CHECK_FOR_ERROR (FALSE, info->jmpbuf, _("Unsupported maximum value.=
"));
> ++
> ++  data =3D g_new (guchar, data_size);
> +
> +   input =3D pnmscanner_input (scan);
> +
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb b/meta-gnome/reci=
pes-gimp/gimp/gimp_3.0.6.bb
> index 9f38cdcd03..f529930dff 100644
> --- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
> +++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
> @@ -56,11 +56,13 @@ GIDOCGEN_MESON_OPTION =3D "gi-docgen"
>  GIDOCGEN_MESON_ENABLE_FLAG =3D "enabled"
>  GIDOCGEN_MESON_DISABLE_FLAG =3D "disabled"
>
> -SRC_URI =3D "https://download.gimp.org/gimp/v3.0/${BP}.tar.xz"
> -SRC_URI +=3D "file://0001-gimp-cross-compile-fix-for-bz2.patch"
> -SRC_URI +=3D "file://0002-meson.build-reproducibility-fix.patch"
> -SRC_URI +=3D "file://0001-meson.build-dont-check-for-lgi.patch"
> -SRC_URI +=3D "file://0001-meson.build-require-iso-codes-native.patch"
> +SRC_URI =3D "https://download.gimp.org/gimp/v3.0/${BP}.tar.xz \
> +           file://0001-gimp-cross-compile-fix-for-bz2.patch \
> +           file://0002-meson.build-reproducibility-fix.patch \
> +           file://0001-meson.build-dont-check-for-lgi.patch \
> +           file://0001-meson.build-require-iso-codes-native.patch \
> +           file://CVE-2025-14422.patch \
> +           "
>  SRC_URI[sha256sum] =3D "246c225383c72ef9f0dc7703b7d707084bbf177bd2900e94=
ce466a62862e296b"
>
>  PACKAGECONFIG[aa] =3D "-Daa=3Denabled,-Daa=3Ddisabled,aalib"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123135): https://lists.openembedded.org/g/openembedde=
d-devel/message/123135
> Mute This Topic: https://lists.openembedded.org/mt/117084023/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

