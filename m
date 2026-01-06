Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6655DC47BCB
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 09:08:37 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86288.1767690512624985582
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jan 2026 01:08:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d0/UGLKa;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-3e0f19a38d0so572537fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 01:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767690512; x=1768295312; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RjJSy+zEHmwHBnES99U4RrSle78Bl+Hg2KKBi4LlqVo=;
        b=d0/UGLKaNQP7pUXa5MVZ4iygOztKyYCC7KldoXm2cwu+kZzp2OVU0rUqHwd+k9sl8W
         r2FqB+/iaSFQYICSFu2jwNdinmpXCOlE/fn6NsDDO20QORXFYOCGyiRHJDujAPxfzmqS
         vNn0jOA4MEXYD6dx2Py5OUjd2S0qgjtlq6ExJmCKXDugyJtoHumn6me8cgEVCPbmwCeD
         V5O40iWipyaiZqSwSLQg83eB1/XRVn3RamsrlS9ixY3Y2FILmTs8p65W1gXnf07Ag2Za
         92p6ZTW+F0ML4h56THg/f5jUMGF15fm4FIeEbpeLCts1h1MEIA/2E57+tzesh90kC2cI
         FUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690512; x=1768295312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RjJSy+zEHmwHBnES99U4RrSle78Bl+Hg2KKBi4LlqVo=;
        b=vsgk3eu1j6PfCy+eAlx9a1ldCjde/79cWnZryVQIP5w0se50AYM0iwX8qDtbiMIuM5
         +qkjT3YkwKrg+a3ZyPvpw9vv1QfjdCt9k0PbzYMEFVkj1FQwCez6cxpTcACVOZ1USSnm
         1WYrTHDqmfCsHMDZ/FPuIEk9t5T6cgP2PZeEC9PPPmhb9SwyyYeJFWbrLRIn+blfmHB/
         gRUfySw1IRZk+SZrc/LMsy+waJkN21ndnMJJuOUf72hta650Ez4d01cnLKdLWcuv8LvX
         KlGubq/J1HDTae2l5uSjPXGFig3ldlMTr9QVMql++5oWlB1FKTRA4p9DxQu6pP7Zq8r7
         JpMg==
X-Gm-Message-State: AOJu0Yxbznxiio5WfkRyw3cJoYpJatxcyzvIGs937diFuwdLiWnR+2Kq
	DBlq8uBvKGOiuTt+SWLZe4CEeAndbB+GleXwydbnUH7lOdA1mYKA10ESOYhVIhoXiXX2GEE+B2v
	hpczbv+mCvprxSUw7DQJwQHoheiOMs2s=
X-Gm-Gg: AY/fxX7Hg9MIhTB93xaCLvkSE0yBJdDMe7Da8MyeyIyG50JIMDJBLw73iyLZ6dNuOtp
	869R4aygglj7cpPDV6zkDQXDCeqUy/qAdEqi9impoDHSmK3Ljir4n35HlWPW9QktD8L3xCE2s/K
	4RB3vWR0a6HiQW8gB+/SiUwC3IKSXS7kaoKjZqlG+yRPJVijC/ChTGFs2FhQH6JWk8hX/Bca5iu
	kDVJOhBbyOQ1NU8GeCX+WqQpd8HV5dW9FLTXrlK/lrjg4mgjI7eN8EtpcwXgqmI7IQOTbvWFHp0
	IpTub5Q=
X-Google-Smtp-Source: AGHT+IGFlaBc40Jqvjoh8bkf8X3SPpOT+EVeYwf+xCtbPocf+tLsJPjrf2uUGsQlqQNrmGI9hXlhjwJWy4BLlkSss1s=
X-Received: by 2002:a05:6870:65ab:b0:3e0:fd27:2623 with SMTP id
 586e51a60fabf-3ffa0963029mr1427474fac.4.1767690511593; Tue, 06 Jan 2026
 01:08:31 -0800 (PST)
MIME-Version: 1.0
References: <20260105100237.3081345-1-skandigraun@gmail.com>
 <20260105100237.3081345-4-skandigraun@gmail.com> <CADySD0Gv8qkYZuYtuuu+5FCdM1gcvNcjmTjskMdNG6rAusemcg@mail.gmail.com>
 <1d9c77dd-c059-4624-b978-b0fc6e68aa85@gmail.com>
In-Reply-To: <1d9c77dd-c059-4624-b978-b0fc6e68aa85@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 6 Jan 2026 14:38:20 +0530
X-Gm-Features: AQt7F2ovd-HffpPcC5Vvh7wD9Wzjl14M-ClBvPy1BMrUrkaMp9r2_XTJoBDpNiI
Message-ID: <CADySD0GG55C3xYx+9U=-O=F7FSqv4SMN0APZE7zATZ9OxWgygg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][whinlatter][PATCH 04/17] gimp: patch CVE-2025-14422
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 09:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123169

On Tue, Jan 6, 2026 at 9:58=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.co=
m> wrote:
>
> I don't really see the relation between these and the gimp patches...

Agree, I also mentioned that the build errors and gimp patches are not rela=
ted.

> For mozjs you could take a look at this[1] patch - I believe it solves
> the same problem.
> For libjxl, Khem has commited a line some time ago[2] that touches
> CFLAGS. Try to do the same, but for CXXFLAGS.
>

Thanks for the pointers, I'll try them.

> [1]:
> https://github.com/OSSystems/meta-browser/blob/master/meta-firefox/recipe=
s-browser/firefox/firefox/0001-add-musl-support.patch
> [2]:
> https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-multi=
media/libjxl/libjxl_0.11.1.bb#n47
>
> On 1/6/26 05:42, Ankur Tyagi wrote:
> > Hi Gyorgy,
> >
> > This is causing following build failures on qemuarm with musl and clang
> >
> > mozjs:
> > | /usr/src/debug/mozjs-128/128.5.2/mozglue/misc/StackWalk.cpp:810:(.tex=
t._ZL15unwind_callbackP15_Unwind_ContextPv+0x4):
> > undefined reference to `_Unwind_GetIP'
> > | arm-poky-linux-musleabi-clang++: error: linker command failed with
> > exit code 1 (use -v to see invocation)
> >
> > libjxl:
> > FAILED: [code=3D1] lib/CMakeFiles/jxl_dec-obj.dir/jxl/convolve_separabl=
e5.cc.o
> > /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/cortexa15t2hf-neon=
-poky-linux-musleabi/libjxl/0.11.1/recipe-sysroot-native/usr/bin/arm-poky-l=
inux-musleabi/arm-poky-linux-musleabi-clang++
> > --sysroot=3D/yocto/bitbake-builds/poky-whinlatter/build/tmp/work/cortex=
a15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/recipe-sysroot
> > -DFJXL_ENABLE_AVX512=3D0 -DJXL_INTERNAL_LIBRARY_BUILD
> > -D__DATE__=3D\"redacted\" -D__TIMESTAMP__=3D\"redacted\"
> > -D__TIME__=3D\"redacted\"
> > -I/yocto/bitbake-builds/poky-whinlatter/build/tmp/work/cortexa15t2hf-ne=
on-poky-linux-musleabi/libjxl/0.11.1/sources/libjxl-0.11.1
> > -isystem /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/cortexa15=
t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/build/lib/include
> > -mthumb -mfpu=3Dneon -mfloat-abi=3Dhard -mcpu=3Dcortex-a15
> > --dyld-prefix=3D/usr -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D=
2
> > -Wformat -Wformat-security -Werror=3Dformat-security -D_TIME_BITS=3D64
> > -D_FILE_OFFSET_BITS=3D64
> > --sysroot=3D/yocto/bitbake-builds/poky-whinlatter/build/tmp/work/cortex=
a15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/recipe-sysroot
> >  -O2 -g   -ffile-prefix-map=3D/yocto/bitbake-builds/poky-whinlatter/bui=
ld/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/sources/li=
bjxl-0.11.1=3D/usr/src/debug/libjxl/0.11.1
> >  -ffile-prefix-map=3D/yocto/bitbake-builds/poky-whinlatter/build/tmp/wo=
rk/cortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/build=3D/usr/src/de=
bug/libjxl/0.11.1
> >  -ffile-prefix-map=3D/yocto/bitbake-builds/poky-whinlatter/build/tmp/wo=
rk/cortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/recipe-sysroot=3D
> >  -ffile-prefix-map=3D/yocto/bitbake-builds/poky-whinlatter/build/tmp/wo=
rk/cortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/recipe-sysroot-nati=
ve=3D
> >  -pipe -fvisibility-inlines-hidden -fno-rtti -DNDEBUG -std=3Dc++17 -fPI=
C
> > -fvisibility=3Dhidden -fvisibility-inlines-hidden
> > -fmacro-prefix-map=3D/yocto/bitbake-builds/poky-whinlatter/build/tmp/wo=
rk/cortexa15t2hf-neon-poky-linux-musleabi/libjxl/0.11.1/sources/libjxl-0.11=
.1=3D.
> > "-DHWY_DISABLED_TARGETS=3D(HWY_SSSE3|HWY_AVX3|HWY_AVX3_SPR|HWY_AVX3_ZEN=
4)"
> > -funwind-tables -Xclang -mrelax-all -fno-omit-frame-pointer
> > -Wno-builtin-macro-redefined -Wall -fmerge-all-constants
> > -fno-builtin-fwrite -fno-builtin-fread -Wextra -Wc++11-compat
> > -Warray-bounds -Wformat-security -Wimplicit-fallthrough -Wno-register
> > -Wno-unused-function -Wno-unused-parameter -Wnon-virtual-dtor
> > -Woverloaded-virtual -Wvla -Wdeprecated-increment-bool
> > -Wfloat-overflow-conversion -Wfloat-zero-conversion
> > -Wfor-loop-analysis -Wgnu-redeclared-enum -Winfinite-recursion
> > -Wliteral-conversion -Wno-c++98-compat
> > -Wno-unused-command-line-argument -Wprivate-header -Wself-assign
> > -Wstring-conversion -Wtautological-overlap-compare
> > -Wthread-safety-analysis -Wundefined-func-template -Wunreachable-code
> > -Wunused-comparison -fsized-deallocation -fno-exceptions -fmath-errno
> > -fnew-alignment=3D8 -fno-cxx-exceptions -fno-slp-vectorize
> > -fno-vectorize -disable-free -disable-llvm-verifier
> > -DJPEGXL_ENABLE_SKCMS=3D1 -DJPEGXL_ENABLE_TRANSCODE_JPEG=3D1
> > -DJPEGXL_ENABLE_BOXES=3D1 -MD -MT
> > lib/CMakeFiles/jxl_dec-obj.dir/jxl/convolve_separable5.cc.o -MF
> > lib/CMakeFiles/jxl_dec-obj.dir/jxl/convolve_separable5.cc.o.d -o
> > lib/CMakeFiles/jxl_dec-obj.dir/jxl/convolve_separable5.cc.o -c
> > /yocto/bitbake-builds/poky-whinlatter/build/tmp/work/cortexa15t2hf-neon=
-poky-linux-musleabi/libjxl/0.11.1/sources/libjxl-0.11.1/lib/jxl/convolve_s=
eparable5.cc
> > error: out of range pc-relative fixup value
> > 1 error generated.
> > ninja: build stopped: subcommand failed.
> >
> > It builds on qemux86 with musl and clang though.
> >
> > Having said that, I don't think the problem is due to your patch as
> > gimp fails to build on qemuarm with musl and clang even without your
> > patches.
> >
> > So this needs to be investigated separately.
> >
> > cheers
> > Ankur
> >
> > On Mon, Jan 5, 2026 at 11:02=E2=80=AFPM Gyorgy Sarvari via
> > lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
> > wrote:
> >> Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14422
> >>
> >> Pick the patch referenced by the NVD report.
> >>
> >> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> (cherry picked from commit a0b41204afe57f9b2b3f2e8ff496be72d04e0eb7)
> >> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> >> ---
> >>  .../gimp/gimp/CVE-2025-14422.patch            | 66 ++++++++++++++++++=
+
> >>  meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb    | 12 ++--
> >>  2 files changed, 73 insertions(+), 5 deletions(-)
> >>  create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.p=
atch
> >>
> >> diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch b/=
meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch
> >> new file mode 100644
> >> index 0000000000..420e013916
> >> --- /dev/null
> >> +++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch
> >> @@ -0,0 +1,66 @@
> >> +From 0a941cab81396d65a8ab547847f8c542039e214f Mon Sep 17 00:00:00 200=
1
> >> +From: Gyorgy Sarvari <skandigraun@gmail.com>
> >> +Date: Sun, 23 Nov 2025 16:43:51 +0000
> >> +Subject: [PATCH] plug-ins: Fix ZDI-CAN-28273
> >> +
> >> +From: Alx Sa <cmyk.student@gmail.com>
> >> +
> >> +Resolves #15286
> >> +Adds a check to the memory allocation
> >> +in pnm_load_raw () with g_size_checked_mul ()
> >> +to see if the size would go out of bounds.
> >> +If so, we don't try to allocate and load the
> >> +image.
> >> +
> >> +CVE: CVE-2025-14422
> >> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/comm=
it/4ff2d773d58064e6130495de498e440f4a6d5edb]
> >> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> >> +---
> >> + plug-ins/common/file-pnm.c | 13 +++++++++++--
> >> + 1 file changed, 11 insertions(+), 2 deletions(-)
> >> +
> >> +diff --git a/plug-ins/common/file-pnm.c b/plug-ins/common/file-pnm.c
> >> +index 32a33a4..9d349e9 100644
> >> +--- a/plug-ins/common/file-pnm.c
> >> ++++ b/plug-ins/common/file-pnm.c
> >> +@@ -674,7 +674,7 @@ load_image (GFile   *file,
> >> +             GError **error)
> >> + {
> >> +   GInputStream    *input;
> >> +-  GeglBuffer      *buffer;
> >> ++  GeglBuffer      *buffer    =3D NULL;
> >> +   GimpImage * volatile image =3D NULL;
> >> +   GimpLayer       *layer;
> >> +   char             buf[BUFLEN + 4];  /* buffer for random things lik=
e scanning */
> >> +@@ -708,6 +708,9 @@ load_image (GFile   *file,
> >> +       g_object_unref (input);
> >> +       g_free (pnminfo);
> >> +
> >> ++      if (buffer)
> >> ++        g_object_unref (buffer);
> >> ++
> >> +       if (image)
> >> +         gimp_image_delete (image);
> >> +
> >> +@@ -1060,6 +1063,7 @@ pnm_load_raw (PNMScanner *scan,
> >> +   const Babl   *format =3D NULL;
> >> +   gint          bpc;
> >> +   guchar       *data, *d;
> >> ++  gsize         data_size;
> >> +   gushort      *s;
> >> +   gint          x, y, i;
> >> +   gint          start, end, scanlines;
> >> +@@ -1070,7 +1074,12 @@ pnm_load_raw (PNMScanner *scan,
> >> +     bpc =3D 1;
> >> +
> >> +   /* No overflow as long as gimp_tile_height() < 1365 =3D 2^(31 - 18=
) / 6 */
> >> +-  data =3D g_new (guchar, gimp_tile_height () * info->xres * info->n=
p * bpc);
> >> ++  if (! g_size_checked_mul (&data_size, gimp_tile_height (), info->x=
res) ||
> >> ++      ! g_size_checked_mul (&data_size, data_size, info->np)        =
     ||
> >> ++      ! g_size_checked_mul (&data_size, data_size, bpc))
> >> ++    CHECK_FOR_ERROR (FALSE, info->jmpbuf, _("Unsupported maximum val=
ue."));
> >> ++
> >> ++  data =3D g_new (guchar, data_size);
> >> +
> >> +   input =3D pnmscanner_input (scan);
> >> +
> >> diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb b/meta-gnome/r=
ecipes-gimp/gimp/gimp_3.0.6.bb
> >> index 9f38cdcd03..f529930dff 100644
> >> --- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
> >> +++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
> >> @@ -56,11 +56,13 @@ GIDOCGEN_MESON_OPTION =3D "gi-docgen"
> >>  GIDOCGEN_MESON_ENABLE_FLAG =3D "enabled"
> >>  GIDOCGEN_MESON_DISABLE_FLAG =3D "disabled"
> >>
> >> -SRC_URI =3D "https://download.gimp.org/gimp/v3.0/${BP}.tar.xz"
> >> -SRC_URI +=3D "file://0001-gimp-cross-compile-fix-for-bz2.patch"
> >> -SRC_URI +=3D "file://0002-meson.build-reproducibility-fix.patch"
> >> -SRC_URI +=3D "file://0001-meson.build-dont-check-for-lgi.patch"
> >> -SRC_URI +=3D "file://0001-meson.build-require-iso-codes-native.patch"
> >> +SRC_URI =3D "https://download.gimp.org/gimp/v3.0/${BP}.tar.xz \
> >> +           file://0001-gimp-cross-compile-fix-for-bz2.patch \
> >> +           file://0002-meson.build-reproducibility-fix.patch \
> >> +           file://0001-meson.build-dont-check-for-lgi.patch \
> >> +           file://0001-meson.build-require-iso-codes-native.patch \
> >> +           file://CVE-2025-14422.patch \
> >> +           "
> >>  SRC_URI[sha256sum] =3D "246c225383c72ef9f0dc7703b7d707084bbf177bd2900=
e94ce466a62862e296b"
> >>
> >>  PACKAGECONFIG[aa] =3D "-Daa=3Denabled,-Daa=3Ddisabled,aalib"
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#123135): https://lists.openembedded.org/g/openembe=
dded-devel/message/123135
> >> Mute This Topic: https://lists.openembedded.org/mt/117084023/3619737
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [ankur.tyagi85@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

