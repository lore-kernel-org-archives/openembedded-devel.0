Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53FCC3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 10:19:08 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.46599.1743070739054587229
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Mar 2025 03:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i3lDEDAg;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ecfa716ec1so7327626d6.2;
        Thu, 27 Mar 2025 03:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743070738; x=1743675538; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fB0vKgVDvYrUdELXjjvZcRBVlhpxYeNZoJP5cMZbheU=;
        b=i3lDEDAglFp3omh7sbknxq78roICocLIw2Ew0IbcR39QOqENiAwwohOBZiVC6LEtrh
         OSlnvQPJVRJVis0unMoFTKWCmlXj3zSMsxazUtE2q7lOzrXrKp8b/IZ9OziXbHZ2mc0b
         s4eEg/Djbz/JDf42GThasseg8lmiFIJIJDF+Br1DbdFUPbx97KOBelZYaGuHDPCWkwTx
         ISXgfy6Gp+oqMjjqEG222cXHM3SaebxsySCmYgoTXGc+LdXA6uBkSZCS11JJv7e0VxHr
         HCVPnKDimf+l4+oKkWKT9+jD/1HV51UMJcYbWF5Ibqn+I1AGZA3Fbi4S7y5ScPkWgsOx
         CIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070738; x=1743675538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fB0vKgVDvYrUdELXjjvZcRBVlhpxYeNZoJP5cMZbheU=;
        b=wz/Svc6kayNkKCVuF7RYZTQYoc8zmUp7cDNjRHY5FY5GEsR+M846nY4x98A3Nuxa4r
         49TUipYXv+RXUvYLnsIJor6eQwtJLTz4/cH7SKPuvHvXSH9C43ghmP3qZTHEELtmQfiI
         CkCpl/EFn4TmLwKgWLykFWX9WdUb3du75cZxFMl+z9N3ORtWjtLvveQuo7ST/Fro4P6w
         BQOoxmY3TD4JqOmqKglRgJ/7Kfiebrs0i+KCmirmE9yCdjjuIpvrbKluQfLMAnpOd7Ab
         mLjQ+45cOvAz5BRXaUypjLbDcpcawqBrnLUlGEtTVMTK1GGYNorX33Ixl1QJqHwlT4kK
         ufhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmd5r9ZK59bNfNa5paygP4wH/W7Y9p5a40XCvACniSBM9HwvvxyK9B+atvzy8xaJ4FxpR8lLnRVq4W7GncYfiB/Bc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyRoD2CHksVKNGN9v/LfkDkIY6y4Uiro2WWvYEkwIU0orQSCm3T
	TlTjnpCf4rqUI1Vmwi/sjuz4RXdVjVuE7zuSkoZw9BzlD5xa5FOo7zhm2iYNUz5fxUOctYX9F0N
	XQfnUL2siyTITGbdAbMPABTwTVNt5EQ==
X-Gm-Gg: ASbGncvbdQH67ZYlYm67LtZcx/7CeLlzHw0r895KhTspjPBLnW7u5cDW5rT9zM2dYWo
	XO2Ju3y/08eNs0Ucu3vnw41r7TqmNCtJFi/w/H8SZ5BpPIqLjq99HkW6bBZMnpNpVtIlireo3DV
	HqEgdcW2Rr/m7oQ/tQo4AdOazgpOWmru0KqCZS7w+mwbgJh0T1TZWbxfuQf31B
X-Google-Smtp-Source: AGHT+IEnVCZ1r5NcZN8RVzNzlDgkkSEMeXUL/XVrRm0xSWaapANRb8tADkKYjXVENuDeT5fcBQvXoRuLfKj8DdN6GCo=
X-Received: by 2002:ad4:5bc8:0:b0:6e8:fec9:87ff with SMTP id
 6a1803df08f44-6ed238ad8e1mr51631726d6.23.1743070737749; Thu, 27 Mar 2025
 03:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250327015621.77527-1-f_l_k@t-online.de> <CANNYZj-dzSajh6AF6sV8Au1uDosh9A+WgJiQ18bLee=uYfDNjw@mail.gmail.com>
 <IY0STS.0LHRDIA5XZPF@t-online.de>
In-Reply-To: <IY0STS.0LHRDIA5XZPF@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Mar 2025 11:18:46 +0100
X-Gm-Features: AQ5f1JroGevKk5gB5y7Hc40UIZg5TKSBd2rcSU7_6qkAQTQkBBlIsuV-iGXGxaM
Message-ID: <CANNYZj8zXFB0ifwavAzqsQPdHF7PWk2-rY0ojG=tfA2EAV4amQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCHv2] gimp: update 2.10.38 - 3.0.2
To: Markus Volk <f_l_k@t-online.de>
Cc: "Alexander Kanavin via lists.openembedded.org" <alex.kanavin=gmail.com@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 10:19:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116320

I'd suggest you just add a couple of links to the commit, instead of
the actual content:

- a nice high level 3.0 release announcement kind of thing
- the full changelog.

Alex

On Thu, 27 Mar 2025 at 10:56, Markus Volk <f_l_k@t-online.de> wrote:
>
> The complete changelog would be about 3500 lines and I thought that would=
 be too much
> https://gitlab.gnome.org/GNOME/gimp/-/blob/GIMP_3_0_0/NEWS?ref_type=3Dtag=
s
>
> Should it be added to the commit?
>
> On Thu, Mar 27 2025 at 10:49:19 +01:00:00, Alexander Kanavin via lists.op=
enembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
>
> I appreciate the effort to provide changelogs, but the update is from gim=
p 2.x, to gimp 3.x, representing many years of feature development. I'd sug=
gest that either the provided changelog reflects that, or it is not include=
d at all (gimp users usually know the deal with 2.x vs 3.x). Alex On Thu, 2=
7 Mar 2025 at 02:55, Markus Volk via lists.openembedded.org <f_l_k=3Dt-onli=
ne.de@lists.openembedded.org> wrote:
>
> ------------------------------ GNU Image Manipulation Program Development=
 Branch ------------------------------ Overview of Changes from GIMP 3.0.0 =
to GIMP 3.0.2 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D This is a bug-fix only release. Core: - Mark some strings tran=
slatable. - Fix crash when choosing a brush in grid view. - Windows: tempor=
ary revert of some Input Device handling code which was breaking pressure s=
ensitivity for some graphics tablets (though this revert may make issues wi=
th the eraser tip). - Fix crash when choosing a non-existing font in text t=
ool options. Tools: - Reorder Line Art Detection options per design decisio=
n. Graphical User Interface: - Keep headerbar color consistent when out of =
focus. - Histogram uses the luminance value of the foreground color as a th=
reshold to lighten or darken the border color for contrast with the histogr=
am itself. - Improve separation between panels in dark theme. - Add default=
 response for GimpQueryBox dialogues. - Spacing between toolbox widgets imp=
roved. - GimpSpinScale slider colors inverted. - New icons: "gimp-toggle-on=
" and "gimp-toggle-off" and using them in the Search Action's list as icons=
 for toggle actions. Plug-ins: - Python Console uses the luminance of the b=
ackground color for error text. - Metadata Editor: fix buffer overflow. - G=
radient Flare: fix crash when setting the size to 0. - Screenshot: X11 impl=
ementation is bypassed (in favor of portals) when running on XWayland. Buil=
d: - Various packaging fixes and cleanup. - The Windows installer now promp=
ts (only in user installation) about deleting GIMP config files when uninst=
alling. - GEGL 0.4.58 is now our minimum requirement. - Windows installer: =
create Restore Point on system-wide install. Signed-off-by: Markus Volk <f_=
l_k@t-online.de> --- ...irst-line-of-compiler-version-string.patch | 30 ---=
- ...f-load-fix-mismatching-variable-type.patch | 24 ---- .../0001-gimp-cro=
ss-compile-fix-for-bz2.patch | 30 ++++ ...1-gimptool-allow-default-CC-overr=
ide.patch | 85 ------------ ...dd-build-time-library-paths-to-LD_LI.patch |=
 34 ----- ...001-metadata-shut-up-a-weird-warning.patch | 22 --- ...0002-me=
son.build-reproducibility-fix.patch | 56 ++++++++ meta-gnome/recipes-gimp/g=
imp/gimp_2.10.38.bb | 101 -------------- meta-gnome/recipes-gimp/gimp/gimp_=
3.0.2.bb | 130 ++++++++++++++++++ 9 files changed, 216 insertions(+), 296 d=
eletions(-) delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-confi=
gure-Keep-first-line-of-compiler-version-string.patch delete mode 100644 me=
ta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mismatching-variabl=
e-type.patch create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-gimp=
-cross-compile-fix-for-bz2.patch delete mode 100644 meta-gnome/recipes-gimp=
/gimp/gimp/0001-gimptool-allow-default-CC-override.patch delete mode 100644=
 meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-time-libra=
ry-paths-to-LD_LI.patch delete mode 100644 meta-gnome/recipes-gimp/gimp/gim=
p/0001-metadata-shut-up-a-weird-warning.patch create mode 100644 meta-gnome=
/recipes-gimp/gimp/gimp/0002-meson.build-reproducibility-fix.patch delete m=
ode 100644 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb create mode 100644 =
meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb diff --git a/meta-gnome/recipes-=
gimp/gimp/gimp/0001-configure-Keep-first-line-of-compiler-version-string.pa=
tch b/meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of-c=
ompiler-version-string.patch deleted file mode 100644 index 618b4cc7a7..000=
0000000 --- a/meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-l=
ine-of-compiler-version-string.patch +++ /dev/null @@ -1,30 +0,0 @@ -From 5=
711ccfab40e304ced7f5be39a4083e3fcecff91 Mon Sep 17 00:00:00 2001 -From: Khe=
m Raj <raj.khem@gmail.com> -Date: Wed, 24 May 2023 22:22:41 -0700 -Subject:=
 [PATCH] configure: Keep first line of compiler version string - -Full outp=
ut of cc -v may contain additional information which could -contain build p=
ath information, which is unnessasary - -Upstream-Status: Submitted [https:=
//gitlab.gnome.org/GNOME/gimp/-/merge_requests/926] -Signed-off-by: Khem Ra=
j <raj.khem@gmail.com> ---- - configure.ac | 2 +- - 1 file changed, 1 inser=
tion(+), 1 deletion(-) - -diff --git a/configure.ac b/configure.ac -index c=
25415d..68707a0 100644 ---- a/configure.ac -+++ b/configure.ac -@@ -599,7 +=
599,7 @@ fi - for CC_VERSION_OPT in $CC_VERSION_OPTS; do - # We run $CC, an=
d escape and format its output, in a single step, - # since some shells exp=
and escape sequences in "echo" arguments. -- CC_VERSION=3D"`$CC $CC_VERSION=
_OPT 2>&1 | sed -e 's/\\\\/\\\\\\\\\\\\\\\\/g;s/^/\\\\t/;s/$/\\\\n/' | tr -=
d '\n'`" -+ CC_VERSION=3D"`$CC $CC_VERSION_OPT 2>&1 | head -1 | sed -e 's/\=
\\\/\\\\\\\\\\\\\\\\/g;s/^/\\\\t/;s/$/\\\\n/' | tr -d '\n'`" - if test $? -=
eq 0; then - break - fi --- -2.40.1 - diff --git a/meta-gnome/recipes-gimp/=
gimp/gimp/0001-file-tiff-load-fix-mismatching-variable-type.patch b/meta-gn=
ome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mismatching-variable-typ=
e.patch deleted file mode 100644 index 13b3dda144..0000000000 --- a/meta-gn=
ome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mismatching-variable-typ=
e.patch +++ /dev/null @@ -1,24 +0,0 @@ -From a2458f1528e5733574bb26ff5452b1=
329116e6db Mon Sep 17 00:00:00 2001 -From: Simon Budig <simon@budig.de> -Da=
te: Sat, 20 May 2023 18:40:41 +0200 -Subject: [PATCH] file-tiff-load: fix m=
ismatching variable type - -Upstream-Status: Backport [https://gitlab.gnome=
.org/GNOME/gimp/-/commit/a2458f1528e5733574bb26ff5452b1329116e6db] -Signed-=
off-by: Khem Raj <raj.khem@gmai.com> ---- - plug-ins/file-tiff/file-tiff-lo=
ad.c | 6 +++--- - 1 file changed, 3 insertions(+), 3 deletions(-) - ---- a/=
plug-ins/file-tiff/file-tiff-load.c -+++ b/plug-ins/file-tiff/file-tiff-loa=
d.c -@@ -1301,8 +1301,8 @@ load_image (GFile *file, - - /* any resolution i=
nfo in the file? */ - { -- gfloat xres =3D 72.0; -- gfloat yres =3D 72.0; -=
+ gdouble xres =3D 72.0; -+ gdouble yres =3D 72.0; - gushort read_unit; - G=
impUnit unit =3D GIMP_UNIT_PIXEL; /* invalid unit */ - diff --git a/meta-gn=
ome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-bz2.patch b/meta=
-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-bz2.patch new=
 file mode 100644 index 0000000000..721225c8b3 --- /dev/null +++ b/meta-gno=
me/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-bz2.patch @@ -0,0=
 +1,30 @@ +From a7e40e19d17404cf5ec4135fc1becd5a90f5e1e1 Mon Sep 17 00:00:0=
0 2001 +From: Markus Volk <f_l_k@t-online.de> +Date: Wed, 25 Dec 2024 07:27=
:04 +0100 +Subject: [PATCH] gimp: cross-compile fix for bz2 + +autotools bz=
ip2 build does not create pkgconfig files so looking for the dependency fai=
ls. + +Signed-off-by: Markus Volk <f_l_k@t-online.de> + +Upstream-Status: I=
nappropriate [can probably be removed once bzip2 is built with meson or cma=
ke] +--- + meson.build | 2 +- + 1 file changed, 1 insertion(+), 1 deletion(=
-) + +diff --git a/meson.build b/meson.build +index 4e48f8c64c..d5dce47015 =
100644 +--- a/meson.build ++++ b/meson.build +@@ -765,7 +765,7 @@ zlib =3D =
dependency('zlib') + MIMEtypes +=3D 'image/x-psp' + + # Compiler-provided h=
eaders can't be found in crossroads environment +-if not meson.is_cross_bui=
ld() ++if true + bz2 =3D cc.find_library('bz2') + else + bz2 =3D dependency=
('bzip2') +-- +2.47.1 + diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001=
-gimptool-allow-default-CC-override.patch b/meta-gnome/recipes-gimp/gimp/gi=
mp/0001-gimptool-allow-default-CC-override.patch deleted file mode 100644 i=
ndex b04a16cec7..0000000000 --- a/meta-gnome/recipes-gimp/gimp/gimp/0001-gi=
mptool-allow-default-CC-override.patch +++ /dev/null @@ -1,85 +0,0 @@ -From=
 7e5b986cb7797a6535fe2471b9a5fb7c00821f51 Mon Sep 17 00:00:00 2001 -From: Y=
oann Congal <yoann.congal@smile.fr> -Date: Sun, 13 Oct 2024 01:00:10 +0200 =
-Subject: [PATCH] gimptool: allow default CC override - -From: Yoann Congal=
 <yoann.congal@smile.fr> - -In OE, CC contains sysroot path. Storing CC in =
binary then leads to -non-reproducibility. - -This commit add a new configu=
re option "--with-default-cc=3D'cmd'" for -force the CC stored in gimptool =
to a reproducible value. - -Upstream-Status: Inappropriate [does not apply =
on master (upstream has moved to meson)] -Signed-off-by: Yoann Congal <yoan=
n.congal@smile.fr> ---- - app-tools/Makefile.am | 2 +- - configure.ac | 13 =
+++++++++++++ - tools/Makefile.am | 2 +- - tools/gimptool.c | 2 +- - 4 file=
s changed, 16 insertions(+), 3 deletions(-) - -diff --git a/app-tools/Makef=
ile.am b/app-tools/Makefile.am -index a7cd4ce..81a3a00 100644 ---- a/app-to=
ols/Makefile.am -+++ b/app-tools/Makefile.am -@@ -67,7 +67,7 @@ AM_CPPFLAGS=
 =3D \ - -DMANDIR=3D\""$(mandir)"\" \ - -DGIMPPLUGINDIR=3D\""$(gimpplugindi=
r)"\" \ - -DGIMPDATADIR=3D\""$(gimpdatadir)"\" \ -- -DCC=3D\""$(CC)"\" \ -+=
 -DDEFAULT_CC=3D\""@DEFAULT_CC@"\" \ - -DGIMPDIR=3D\""$(gimpdir)"\" \ - -DG=
IMP_PLUGIN_VERSION=3D\""$(GIMP_PLUGIN_VERSION)"\" \ - -I$(top_srcdir) \ -di=
ff --git a/configure.ac b/configure.ac -index a88b7cc..d90b6db 100644 ---- =
a/configure.ac -+++ b/configure.ac -@@ -2457,6 +2457,19 @@ fi - AM_CONDITIO=
NAL(DESKTOP_DATADIR, test "x$with_desktop_dir" !=3D xno) - AC_SUBST(DESKTOP=
_DATADIR) - -+###################### -+# Determine default CC -+###########=
########### -+ -+AC_ARG_WITH(default-cc, [ --with-default-cc=3D"cmd" defaul=
t CC to print in gimptool (default=3DCC)]) -+ -+if test "x$with_default_cc"=
 !=3D x; then -+ DEFAULT_CC=3D$with_default_cc -+else -+ DEFAULT_CC=3DCC -+=
fi -+ -+AC_SUBST(DEFAULT_CC) - - ##################### - # Check for XML to=
ols -diff --git a/tools/Makefile.am b/tools/Makefile.am -index 420b9b1..cca=
bde8 100644 ---- a/tools/Makefile.am -+++ b/tools/Makefile.am -@@ -87,7 +87=
,7 @@ AM_CPPFLAGS =3D \ - -DMANDIR=3D\""$(mandir)"\" \ - -DGIMPPLUGINDIR=3D=
\""$(gimpplugindir)"\" \ - -DGIMPDATADIR=3D\""$(gimpdatadir)"\" \ -- -DCC=
=3D\""$(CC)"\" \ -+ -DDEFAULT_CC=3D\""@DEFAULT_CC@"\" \ - -DGIMPDIR=3D\""$(=
gimpdir)"\" \ - -DGIMP_PLUGIN_VERSION=3D\""$(GIMP_PLUGIN_VERSION)"\" \ - -I=
$(top_srcdir) \ -diff --git a/tools/gimptool.c b/tools/gimptool.c -index 21=
fc043..bbf3fa5 100644 ---- a/tools/gimptool.c -+++ b/tools/gimptool.c -@@ -=
280,7 +280,7 @@ find_out_env_flags (void) - else if (msvc_syntax) - env_cc =
=3D "cl -MD"; - else -- env_cc =3D CC; -+ env_cc =3D DEFAULT_CC; - - if (g_=
ascii_strncasecmp (env_cc, "cl", 2) =3D=3D 0 && - g_ascii_strncasecmp (env_=
cc, "clang", 5) !=3D 0) diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001=
-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch b/meta-gnome/re=
cipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-time-library-paths-to-LD=
_LI.patch deleted file mode 100644 index cec0055284..0000000000 --- a/meta-=
gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-time-library-pat=
hs-to-LD_LI.patch +++ /dev/null @@ -1,34 +0,0 @@ -From c720df90dfe3a3e92e34=
bfb36a04cc792064a501 Mon Sep 17 00:00:00 2001 -From: Khem Raj <raj.khem@gma=
il.com> -Date: Wed, 24 May 2023 22:39:02 -0700 -Subject: [PATCH] libtool: D=
o not add build time library paths to - LD_LIBRARY_PATH - -This does not se=
rve much purpose on cross builds as it will add build -time paths which are=
 only useful when trying to run these tools from -build area but when they =
are cross built this is not possible to run -them like this. - -Upstream-St=
atus: Inappropriate [Cross-compile specific] - -Signed-off-by: Khem Raj <ra=
j.khem@gmail.com> ---- - ltmain.sh | 2 +- - 1 file changed, 1 insertion(+),=
 1 deletion(-) - -diff --git a/ltmain.sh b/ltmain.sh -index 134902c..068d74=
a 100644 ---- a/ltmain.sh -+++ b/ltmain.sh -@@ -5748,7 +5748,7 @@ func_exec=
_program () - if test yes =3D "$shlibpath_overrides_runpath" && test -n "$s=
hlibpath_var" && test -n "$temp_rpath"; then - $ECHO "\ - # Add our own lib=
rary path to $shlibpath_var -- $shlibpath_var=3D\"$temp_rpath\$$shlibpath_v=
ar\" -+ $shlibpath_var=3D\"$shlibpath_var\" - - # Some systems cannot cope =
with colon-terminated $shlibpath_var - # The second colon is a workaround f=
or a bug in BeOS R4 sed --- -2.40.1 - diff --git a/meta-gnome/recipes-gimp/=
gimp/gimp/0001-metadata-shut-up-a-weird-warning.patch b/meta-gnome/recipes-=
gimp/gimp/gimp/0001-metadata-shut-up-a-weird-warning.patch deleted file mod=
e 100644 index 4f04ac8250..0000000000 --- a/meta-gnome/recipes-gimp/gimp/gi=
mp/0001-metadata-shut-up-a-weird-warning.patch +++ /dev/null @@ -1,22 +0,0 =
@@ -From 51311f913d9f417d121f59b83d560c7b4b853d1c Mon Sep 17 00:00:00 2001 =
-From: Simon Budig <simon@budig.de> -Date: Sat, 20 May 2023 22:25:40 +0200 =
-Subject: [PATCH] metadata: shut up a weird warning - -Upstream-Status: Bac=
kport [https://gitlab.gnome.org/GNOME/gimp/-/commit/51311f913d9f417d121f59b=
83d560c7b4b853d1c] -Signed-off-by: Khem Raj <raj.khem@gmail.com> ---- - plu=
g-ins/metadata/metadata-editor.c | 2 +- - 1 file changed, 1 insertion(+), 1=
 deletion(-) - ---- a/plug-ins/metadata/metadata-editor.c -+++ b/plug-ins/m=
etadata/metadata-editor.c -@@ -2140,7 +2140,7 @@ metadata_dialog_editor_set=
_metadata (GEx - } - else - { -- if (! g_strv_contains (values, equiv_value=
s[evi])) -+ if (! g_strv_contains ((const gchar * const *) values, equiv_va=
lues[evi])) - { - gchar *tmpvalue; - diff --git a/meta-gnome/recipes-gimp/g=
imp/gimp/0002-meson.build-reproducibility-fix.patch b/meta-gnome/recipes-gi=
mp/gimp/gimp/0002-meson.build-reproducibility-fix.patch new file mode 10064=
4 index 0000000000..532715d588 --- /dev/null +++ b/meta-gnome/recipes-gimp/=
gimp/gimp/0002-meson.build-reproducibility-fix.patch @@ -0,0 +1,56 @@ +From=
 bf19c5687703769e406a8086036d4ed6421c33cb Mon Sep 17 00:00:00 2001 +From: M=
arkus Volk <f_l_k@t-online.de> +Date: Mon, 13 Jan 2025 10:04:33 +0100 +Subj=
ect: [PATCH] meson.build: reproducibility fix + +Signed-off-by: Markus Volk=
 <f_l_k@t-online.de> + +Upstream-Status: Inappropriate [oe-specific] +--- +=
 meson.build | 28 ++++++++++++++-------------- + 1 file changed, 14 inserti=
ons(+), 14 deletions(-) + +diff --git a/meson.build b/meson.build +index 97=
cd621780..e47180db87 100644 +--- a/meson.build ++++ b/meson.build +@@ -1599=
,23 +1599,23 @@ conf.set('HAVE_FUNC_ATTRIBUTE_DESTRUCTOR', + conf.set_quote=
d('CC', cc.get_id()) + + cc_version=3D'' +-if cc.get_id() =3D=3D 'gcc' or c=
c.get_id() =3D=3D 'clang' +- cc_cmd =3D run_command(cc, '-v', check: false)=
 ++#if cc.get_id() =3D=3D 'gcc' or cc.get_id() =3D=3D 'clang' ++# cc_cmd =
=3D run_command(cc, '-v', check: false) + # Note: the call might actually f=
ail when using ccache. + # See: https://github.com/mesonbuild/meson/issues/=
6174 +- if cc_cmd.returncode() =3D=3D 0 +- cc_version =3D cc_cmd.stdout() +=
 cc_cmd.stderr() +- endif +-else ++# if cc_cmd.returncode() =3D=3D 0 ++# cc=
_version =3D cc_cmd.stdout() + cc_cmd.stderr() ++# endif ++#else + # Variou=
s compilers have various options. Try most common ones. This + # list of op=
tions comes from autotools checks. +- foreach arg : [ '--version', '-v', '-=
V', '-qversion' ] +- cc_cmd =3D run_command(cc, arg, check: false) +- if cc=
_cmd.returncode() =3D=3D 0 +- cc_version =3D cc_cmd.stdout() +- endif +- en=
dforeach +-endif ++# foreach arg : [ '--version', '-v', '-V', '-qversion' ]=
 ++# cc_cmd =3D run_command(cc, arg, check: false) ++# if cc_cmd.returncode=
() =3D=3D 0 ++# cc_version =3D cc_cmd.stdout() ++# endif ++# endforeach ++#=
endif + if cc_version =3D=3D '' + # We didn't manage to get a meaningful ve=
rbose version from the + # compiler. Just save its name and version. +-- +2=
.47.1 + diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gn=
ome/recipes-gimp/gimp/gimp_2.10.38.bb deleted file mode 100644 index 0272e0=
5e96..0000000000 --- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb +++ /de=
v/null @@ -1,101 +0,0 @@ -SUMMARY =3D "The GIMP is the GNU Image Manipulati=
on Program" -HOMEPAGE =3D "http://www.gimp.org" -SECTION =3D "x11/graphics"=
 -LICENSE =3D "GPL-3.0-only" -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc6=
78957b0c8e964aa6c70fd77641a71e" - -DEPENDS =3D " \ - alsa-lib \ - atk \ - c=
airo \ - fontconfig \ - freetype \ - gdk-pixbuf-native \ - intltool-native =
\ - libxslt-native \ - gegl-native \ - dbus-glib \ - gtk+ \ - babl \ - gegl=
 \ - libmypaint \ - mypaint-brushes-1.0 \ - gexiv2 \ - jpeg \ - libmng \ - =
libpng \ - libexif \ - tiff \ - lcms \ - poppler \ - poppler-data \ - jaspe=
r \ - bzip2 \ - libgudev \ - libmng \ - ${@bb.utils.contains('DISTRO_FEATUR=
ES', 'x11', 'libxmu libxpm', '', d)} \ -" -DEPENDS:append:libc-musl =3D " l=
ibexecinfo" - -GNOMEBASEBUILDCLASS =3D "autotools" -inherit features_check =
gnomebase gtk-icon-cache gtk-doc mime-xdg - -REQUIRED_DISTRO_FEATURES =3D "=
x11" - -SHPV =3D "${@gnome_verdir("${PV}")}" - -SRC_URI =3D "https://downlo=
ad.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \ - file://0001-configure-Kee=
p-first-line-of-compiler-version-string.patch \ - file://0001-libtool-Do-no=
t-add-build-time-library-paths-to-LD_LI.patch \ - file://0001-file-tiff-loa=
d-fix-mismatching-variable-type.patch \ - file://0001-metadata-shut-up-a-we=
ird-warning.patch \ - file://0001-gimptool-allow-default-CC-override.patch =
\ - " -SRC_URI[sha256sum] =3D "50a845eec11c8831fe8661707950f5b8446e35f30edf=
b9acf98f85c1133f856e" - -EXTRA_OECONF =3D "--disable-python \ - --without-w=
ebkit \ - --disable-check-update \ - --without-wmf" - -EXTRA_OECONF +=3D "$=
{@oe.utils.conditional('SITEINFO_BITS', '32', ' --disable-vector-icons', ''=
, d)}" - -do_configure:append() { - find ${B} -name Makefile | xargs sed -i=
 s:'-I$(includedir)':'-I.':g - find ${B} -name Makefile | xargs sed -i s:'-=
I/usr/include':'-I${STAGING_INCDIR}':g -} - -do_compile:prepend() { - # Let=
 native babl/gegl find their plugins - export BABL_PATH=3D`find ${STAGING_L=
IBDIR_NATIVE} -maxdepth 1 -name 'babl-*'` - export GEGL_PATH=3D`find ${STAG=
ING_LIBDIR_NATIVE} -maxdepth 1 -name 'gegl-*'` -} - -FILES:${PN} +=3D "${da=
tadir}/metainfo" - -RDEPENDS:${PN} +=3D "mypaint-brushes-1.0" - - -# gimpto=
ol - -# gimptool needs a CC definition, use current CC without sysroot -pyt=
hon __anonymous() { - import shlex - CC_WITHOUT_SYSROOT =3D shlex.join(filt=
er(lambda x: not x.startswith("--sysroot=3D"), shlex.split(d.getVar("CC")))=
) - d.setVar("CC_WITHOUT_SYSROOT", CC_WITHOUT_SYSROOT) -} -EXTRA_OECONF +=
=3D "--with-default-cc=3D'${CC_WITHOUT_SYSROOT}'" - -# Split gimptool in it=
s own package -PACKAGE_BEFORE_PN +=3D "${PN}-gimptool" -FILES:${PN}-gimptoo=
l +=3D "${bindir}/gimptool-2.0" - -# gimptool depends on gimp .pc file bein=
g installed and tools to build the plugin. -RDEPENDS:${PN}-gimptool +=3D "$=
{PN}-dev packagegroup-core-buildessential" -INSANE_SKIP:${PN}-gimptool +=3D=
 "dev-deps" - - -CVE_STATUS[CVE-2007-3741] =3D "not-applicable-platform: Th=
is only applies for Mandriva Linux" -CVE_STATUS[CVE-2009-0581] =3D "cpe-inc=
orrect: The current version (2.10.38) is not affected." -CVE_STATUS[CVE-200=
9-0723] =3D "cpe-incorrect: The current version (2.10.38) is not affected."=
 -CVE_STATUS[CVE-2009-0733] =3D "cpe-incorrect: The current version (2.10.3=
8) is not affected." diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.b=
b b/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb new file mode 100644 index 0=
000000000..8e44f2ca23 --- /dev/null +++ b/meta-gnome/recipes-gimp/gimp/gimp=
_3.0.2.bb @@ -0,0 +1,130 @@ +SUMMARY =3D "The GIMP is the GNU Image Manipul=
ation Program" +HOMEPAGE =3D "http://www.gimp.org" +SECTION =3D "graphics" =
+LICENSE =3D "GPL-3.0-only" +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc67=
8957b0c8e964aa6c70fd77641a71e" + +DEPENDS =3D " \ + appstream-glib \ + atk =
\ + babl \ + bzip2 \ + bison-native \ + cairo \ + fontconfig \ + freetype \=
 + gdk-pixbuf-native \ + gegl \ + gexiv2 \ + glib-2.0 \ + glib-2.0-native \=
 + gtk+3 \ + harfbuzz \ + iso-codes \ + jpeg \ + json-glib \ + lcms \ + lib=
archive \ + libexif \ + libmypaint \ + libpng \ + librsvg \ + librsvg-nativ=
e \ + libxmu \ + libxslt-native \ + mypaint-brushes-1.0 \ + pango \ + poppl=
er \ + poppler-data \ + python3-pygobject-native \ + tiff \ + xz \ + zlib \=
 +" + +DEPENDS:append:libc-musl =3D " libexecinfo" + +inherit meson gtk-ico=
n-cache mime-xdg pkgconfig gettext gobject-introspection vala + +GIR_MESON_=
OPTION =3D 'can-crosscompile-gir' +VALA_MESON_OPTION =3D "vala" +VALA_MESON=
_ENABLE_FLAG =3D "enabled" +VALA_MESON_DISABLE_FLAG =3D "disabled" +GIDOCGE=
N_MESON_OPTION =3D "gi-docgen" +GIDOCGEN_MESON_ENABLE_FLAG =3D "enabled" +G=
IDOCGEN_MESON_DISABLE_FLAG =3D "disabled" + +SRC_URI =3D "https://download.=
gimp.org/gimp/v${@oe.utils.trim_version('${PV}', 2)}/gimp-${PV}.tar.xz" +SR=
C_URI +=3D "file://0001-gimp-cross-compile-fix-for-bz2.patch" +SRC_URI +=3D=
 "file://0002-meson.build-reproducibility-fix.patch" +SRC_URI[sha256sum] =
=3D "546ddc30cb2d0e79123c7fcb4d78211e1ee7a6aace91a6a0ad8cbcbf6ea571a2" + +P=
ACKAGECONFIG[aa] =3D "-Daa=3Denabled,-Daa=3Ddisabled,aalib" +PACKAGECONFIG[=
alsa] =3D "-Dalsa=3Denabled,-Dalsa=3Ddisabled,alsa-lib" +PACKAGECONFIG[appd=
ata-test] =3D "-Dappdata-test=3Denabled,-Dappdata-test=3Ddisabled,appstream=
-glib-native" +PACKAGECONFIG[cairo-pdf] =3D "-Dcairo-pdf=3Denabled,-Dcairo-=
pdf=3Ddisabled" +PACKAGECONFIG[check-update] =3D "-Dcheck-update=3Dyes,-Dch=
eck-update=3Dno" +PACKAGECONFIG[ghostscript] =3D "-Dghostscript=3Denabled,-=
Dghostscript=3Ddisabled,ghostscript,ghostscript" +PACKAGECONFIG[gudev] =3D =
"-Dgudev=3Denabled,-Dgudev=3Ddisabled,libgudev" +PACKAGECONFIG[heif] =3D "-=
Dheif=3Denabled,-Dheif=3Ddisabled,libheif" +PACKAGECONFIG[javascript] =3D "=
-Djavascript=3Denabled,-Djavascript=3Ddisabled,,gjs" +PACKAGECONFIG[jpeg200=
0] =3D "-Djpeg2000=3Denabled,-Djpeg2000=3Ddisabled,jasper" +PACKAGECONFIG[j=
peg-xl] =3D "-Djpeg-xl=3Denabled,-Djpeg-xl=3Ddisabled,libjxl" +PACKAGECONFI=
G[libunwind] =3D "-Dlibunwind=3Dtrue,-Dlibunwind=3Dfalse,libunwind" +PACKAG=
ECONFIG[libbacktrace] =3D "-Dlibbacktrace=3Dtrue,-Dlibbacktrace=3Dfalse,lib=
backtrace" +PACKAGECONFIG[lua] =3D "-Dlua=3Dtrue,-Dlua=3Dfalse,,luajit lua-=
lgi" +PACKAGECONFIG[mng] =3D "-Dmng=3Denabled,-Dmng=3Ddisabled,libmng" +PAC=
KAGECONFIG[openmp] =3D "-Dopenmp=3Denabled,-Dopenmp=3Ddisabled,gcc-runtime"=
 +PACKAGECONFIG[vector-icons] =3D "-Dvector-icons=3Dtrue,-Dvector-icons=3Df=
alse,librsvg shared-mime-info" +PACKAGECONFIG[webp] =3D "-Dwebp=3Denabled,-=
Dwebp=3Ddisabled,libwebp" +PACKAGECONFIG[xcursor] =3D "-Dxcursor=3Denabled,=
-Dxcursor=3Ddisabled,libxcursor" +PACKAGECONFIG[x11] =3D "-Dxpm=3Denabled,-=
Dxpm=3Ddisabled,libxpm libxext libxfixes" + +PACKAGECONFIG ?=3D " \ + alsa =
\ + cairo-pdf \ + ghostscript \ + gudev \ + javascript \ + jpeg2000 \ + jpe=
g-xl \ + lua \ + mng \ + vector-icons \ + webp \ + ${@bb.utils.contains('LI=
CENSE_FLAGS_ACCEPTED', 'commercial', 'heif', '', d)} \ + ${@bb.utils.contai=
ns('DISTRO_FEATURES', 'x11', 'x11 xcursor', '', d)} \ +" + +PACKAGECONFIG:r=
emove:riscv32 =3D "lua" +PACKAGECONFIG:remove:riscv64 =3D "lua" +PACKAGECON=
FIG:remove:powerpc64 =3D "lua" +PACKAGECONFIG:remove:powerpc64le =3D "lua" =
+ +EXTRA_OEMESON +=3D " \ + -Dshmem-type=3Dposix \ + -Dlinux-input=3Denable=
d \ + --buildtype release \ + --cross-file=3D${WORKDIR}/meson-${PN}.cross \=
 +" + +do_write_config:append() { + cat >${WORKDIR}/meson-${PN}.cross <<EOF=
 +[binaries] +gjs =3D '${bindir}/gjs' +luajit =3D '${bindir}/luajit' +EOF +=
} + +do_configure:append () { + sed -i -e "s|build_by_default: true|build_b=
y_default: false|" ${S}/gimp-data/images/meson.build +} + +do_install:prepe=
nd() { + sed -i -e "s|${B}||" ${B}/app/widgets/gimplanguagestore-data.h + s=
ed -i -e "s|${B}||" ${B}/plug-ins/file-bmp/huffman.h +} + +FILES:${PN} +=3D=
 "${datadir}/metainfo" + +RDEPENDS:${PN} =3D "mypaint-brushes-1.0 glib-netw=
orking python3-pygobject" -- 2.49.0
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all mess=
ages sent to this group. View/Reply Online (#116318): https://lists.openemb=
edded.org/g/openembedded-devel/message/116318 Mute This Topic: https://list=
s.openembedded.org/mt/111929688/3618223 Group Owner: openembedded-devel+own=
er@lists.openembedded.org Unsubscribe: https://lists.openembedded.org/g/ope=
nembedded-devel/unsub [f_l_k@t-online.de] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-

