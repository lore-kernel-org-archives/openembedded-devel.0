Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA97CC3600B
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 00:16:22 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.412.1743120975123236474
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Mar 2025 17:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VWS5VVFk;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3f9832f798aso954852b6e.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 17:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743120974; x=1743725774; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZEs6K4x9EfkqwE9GUL0g38raCg65mawBoosUbzy5kQ=;
        b=VWS5VVFkREj8G8JPAPGb4MxGJ9BeSFZ8iPifRH6HeEqA3RqbLztGcOcQ8CDYN/E6DC
         F/jND7u+kcUNVCmewYtXJ259s40/w0Bb2zw4HGKIAuQ4Z8zoaANQo9gqClqYnBshegf1
         Qb+7A4CmD7rAQaRgMvd8z1SuOrnv7voOHPzbuoIVWytXw1FrMQbOX0UQma13lBNEpEKw
         Uv53ua1ADUGg9faMZzsYpvojG12Ek4mcbJ1e/6VeaKrdLeg8vYKhV6O3BHRnX8hfwgCi
         GeZoBCPrldTxXqwV0lrtDaAD/duE1rkIsXNTwb+FRDTUs+2S/awCO5eQnL3VI1NUh/Bh
         iytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743120974; x=1743725774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZEs6K4x9EfkqwE9GUL0g38raCg65mawBoosUbzy5kQ=;
        b=AGBVGYCbTouba5QyzBp/qhIuTU1lxhP0r6kw4+DCcGINc3Ci6j+rWMNqhEQbdhA/7W
         N3517PrBQlWkRIK+ILRbzn3AyTFHqJ+aKjPsu5tMR06JQl97mqBFrg8VpLpJfTgnps/3
         PZSqjj2gEQnRaa/EkDCFGBEwEiciKpmvZfSh3IYOAXYPI3GsN89RFgHDfPb3edapvWXs
         KVz6VgA/PlALH6r6/ix1YcKmHdlLq9eEwJoa4dvtAlmNeHJz+5n4QyKOuHhI1ciqwZ8Y
         +QbZdLBUAyguP2c1S5wTAiDU4JaVmHqa3DI4M+ZwcFqf2JUS8kaw5gyOIZ8fSKEv25+3
         tKNQ==
X-Gm-Message-State: AOJu0YzcKkftJU0YCmFVTcbwBRPMXbWH/NdzdxU2HJQTmsOjfu0hi9UB
	63/nDmoaQbcLMqquL10YPJOxpUld9P7KMxuDRNQBtXoKFSaSGFvhDsQiAtu2H4M+FG+9Ku3Jr2W
	EPaViClEUtw6cUYgYlQ3IZi+4xc0=
X-Gm-Gg: ASbGnctqi4cjFDFqoTw2LvkJdi1CJbn28bpzrEYeV9BiUjn00gT8vnbIj1RFoAENQLS
	jN28PuyGdHAtKA9Md9MahoL0Ef8/eVcClmAHskhWsGs9LWoRV+qOii9fIRTN5nVEDXNr1gXHy9+
	n5aOI46z7xGO6W0gD+9HE/yYJD
X-Google-Smtp-Source: AGHT+IFbD8WSb4kyb9K21Yn6xCpsP3c+odJ+DNYKnOCwqAzWSBXAtS8hDZZbcVWJuHEGD8RA/J1f87S2TjOrZ2yVcVs=
X-Received: by 2002:a05:6808:1924:b0:3f6:7c2c:6d07 with SMTP id
 5614622812f47-3fefa50f92fmr3727732b6e.13.1743120973755; Thu, 27 Mar 2025
 17:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <1830CCA5B3E0C5F1.807@lists.openembedded.org> <5N2TTS.ZF2GIHGYCJI23@t-online.de>
In-Reply-To: <5N2TTS.ZF2GIHGYCJI23@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Mar 2025 17:15:47 -0700
X-Gm-Features: AQ5f1JqR1gXX6LrnE_PxBoYNWKcFCEJu3VRYcgFjMr2KNOrgv9cG49OGExnaZFc
Message-ID: <CAMKF1sreEuWxq9ioBb-w=vYfzr4jU4UtkJDPfKeHcAjYtLw6NQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCHv6] gimp: update 2.10.38 - 3.0.2
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 00:16:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116336

v6 moved further but still fails elsewhere

http://0x0.st/8e2z.534

On Thu, Mar 27, 2025 at 4:29=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> v6: fix build if not having luajit/lgi installed on host
>
> On Fr, M=C4=86=C2=A4r 28 2025 at 00:28:22 +01:00:00, Markus Volk <f_l_k@t=
-online.de> wrote:
>
> At long last, the first release of GIMP 3.0 is here! This is the end resu=
lt of seven years of hard work by volunteer developers, designers, artists,=
 and community members (for reference, GIMP 2.10 was first published in 201=
8 and the initial development version of GIMP 3.0 was released in 2020). Wi=
th GIMP 3.0 you can do more than ever before, more easily, more quickly! Hi=
ghlights - Need to tweak a filter you applied hours ago? New in GIMP 3.0 is=
 non-destructive editing for most commonly-used filters. See the changes in=
 real time with on-canvas preview. - Exchange files with more applications,=
 including BC7 DDS files as well as better PSD export and many new formats.=
 - Don=C4=81 t know how big to make your drawing? Simply set your paint too=
l to expand layers automatically as needed. - Making pro-quality text got e=
asier, too. Style your text, apply outlines, shadows, bevels, and more, and=
 you can still edit your text, change font and size, and even tweak the sty=
le settings. - Organizing your layers has become much easier with the abili=
ty to select multiple items at once, move them or transform them all togeth=
er! - Color Management was again improved, as our long-term project to make=
 GIMP an advanced image editor for all usages. - Updated graphical toolkit =
(GTK3) for modern desktop usage. - New Wilber logo! https://gitlab.gnome.or=
g/GNOME/gimp/-/blob/GIMP_3_0_0/NEWS?ref_type=3Dtags Signed-off-by: Markus V=
olk <f_l_k@t-online.de> Signed-off-by: Khem Raj <raj.khem@gmail.com> --- ..=
.irst-line-of-compiler-version-string.patch | 30 ---- ...f-load-fix-mismatc=
hing-variable-type.patch | 24 ---- .../0001-gimp-cross-compile-fix-for-bz2.=
patch | 30 ++++ ...1-gimptool-allow-default-CC-override.patch | 85 --------=
---- ...dd-build-time-library-paths-to-LD_LI.patch | 34 ----- .../0001-meso=
n.build-dont-check-for-lgi.patch | 35 +++++ ...001-metadata-shut-up-a-weird=
-warning.patch | 22 --- ...0002-meson.build-reproducibility-fix.patch | 56 =
++++++++ meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb | 101 -------------- =
meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb | 131 ++++++++++++++++++ 10 file=
s changed, 252 insertions(+), 296 deletions(-) delete mode 100644 meta-gnom=
e/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of-compiler-version=
-string.patch delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-fil=
e-tiff-load-fix-mismatching-variable-type.patch create mode 100644 meta-gno=
me/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-bz2.patch delete =
mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-C=
C-override.patch delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-=
libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch create mode 1006=
44 meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-dont-check-for-lgi.pa=
tch delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut=
-up-a-weird-warning.patch create mode 100644 meta-gnome/recipes-gimp/gimp/g=
imp/0002-meson.build-reproducibility-fix.patch delete mode 100644 meta-gnom=
e/recipes-gimp/gimp/gimp_2.10.38.bb create mode 100644 meta-gnome/recipes-g=
imp/gimp/gimp_3.0.2.bb diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-=
configure-Keep-first-line-of-compiler-version-string.patch b/meta-gnome/rec=
ipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of-compiler-version-stri=
ng.patch deleted file mode 100644 index 618b4cc7a7..0000000000 --- a/meta-g=
nome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of-compiler-vers=
ion-string.patch +++ /dev/null @@ -1,30 +0,0 @@ -From 5711ccfab40e304ced7f5=
be39a4083e3fcecff91 Mon Sep 17 00:00:00 2001 -From: Khem Raj <raj.khem@gmai=
l.com> -Date: Wed, 24 May 2023 22:22:41 -0700 -Subject: [PATCH] configure: =
Keep first line of compiler version string - -Full output of cc -v may cont=
ain additional information which could -contain build path information, whi=
ch is unnessasary - -Upstream-Status: Submitted [https://gitlab.gnome.org/G=
NOME/gimp/-/merge_requests/926] -Signed-off-by: Khem Raj <raj.khem@gmail.co=
m> ---- - configure.ac | 2 +- - 1 file changed, 1 insertion(+), 1 deletion(=
-) - -diff --git a/configure.ac b/configure.ac -index c25415d..68707a0 1006=
44 ---- a/configure.ac -+++ b/configure.ac -@@ -599,7 +599,7 @@ fi - for CC=
_VERSION_OPT in $CC_VERSION_OPTS; do - # We run $CC, and escape and format =
its output, in a single step, - # since some shells expand escape sequences=
 in "echo" arguments. -- CC_VERSION=3D"`$CC $CC_VERSION_OPT 2>&1 | sed -e '=
s/\\\\/\\\\\\\\\\\\\\\\/g;s/^/\\\\t/;s/$/\\\\n/' | tr -d '\n'`" -+ CC_VERSI=
ON=3D"`$CC $CC_VERSION_OPT 2>&1 | head -1 | sed -e 's/\\\\/\\\\\\\\\\\\\\\\=
/g;s/^/\\\\t/;s/$/\\\\n/' | tr -d '\n'`" - if test $? -eq 0; then - break -=
 fi --- -2.40.1 - diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-file-=
tiff-load-fix-mismatching-variable-type.patch b/meta-gnome/recipes-gimp/gim=
p/gimp/0001-file-tiff-load-fix-mismatching-variable-type.patch deleted file=
 mode 100644 index 13b3dda144..0000000000 --- a/meta-gnome/recipes-gimp/gim=
p/gimp/0001-file-tiff-load-fix-mismatching-variable-type.patch +++ /dev/nul=
l @@ -1,24 +0,0 @@ -From a2458f1528e5733574bb26ff5452b1329116e6db Mon Sep 1=
7 00:00:00 2001 -From: Simon Budig <simon@budig.de> -Date: Sat, 20 May 2023=
 18:40:41 +0200 -Subject: [PATCH] file-tiff-load: fix mismatching variable =
type - -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/co=
mmit/a2458f1528e5733574bb26ff5452b1329116e6db] -Signed-off-by: Khem Raj <ra=
j.khem@gmai.com> ---- - plug-ins/file-tiff/file-tiff-load.c | 6 +++--- - 1 =
file changed, 3 insertions(+), 3 deletions(-) - ---- a/plug-ins/file-tiff/f=
ile-tiff-load.c -+++ b/plug-ins/file-tiff/file-tiff-load.c -@@ -1301,8 +130=
1,8 @@ load_image (GFile *file, - - /* any resolution info in the file? */ =
- { -- gfloat xres =3D 72.0; -- gfloat yres =3D 72.0; -+ gdouble xres =3D 7=
2.0; -+ gdouble yres =3D 72.0; - gushort read_unit; - GimpUnit unit =3D GIM=
P_UNIT_PIXEL; /* invalid unit */ - diff --git a/meta-gnome/recipes-gimp/gim=
p/gimp/0001-gimp-cross-compile-fix-for-bz2.patch b/meta-gnome/recipes-gimp/=
gimp/gimp/0001-gimp-cross-compile-fix-for-bz2.patch new file mode 100644 in=
dex 0000000000..721225c8b3 --- /dev/null +++ b/meta-gnome/recipes-gimp/gimp=
/gimp/0001-gimp-cross-compile-fix-for-bz2.patch @@ -0,0 +1,30 @@ +From a7e4=
0e19d17404cf5ec4135fc1becd5a90f5e1e1 Mon Sep 17 00:00:00 2001 +From: Markus=
 Volk <f_l_k@t-online.de> +Date: Wed, 25 Dec 2024 07:27:04 +0100 +Subject: =
[PATCH] gimp: cross-compile fix for bz2 + +autotools bzip2 build does not c=
reate pkgconfig files so looking for the dependency fails. + +Signed-off-by=
: Markus Volk <f_l_k@t-online.de> + +Upstream-Status: Inappropriate [can pr=
obably be removed once bzip2 is built with meson or cmake] +--- + meson.bui=
ld | 2 +- + 1 file changed, 1 insertion(+), 1 deletion(-) + +diff --git a/m=
eson.build b/meson.build +index 4e48f8c64c..d5dce47015 100644 +--- a/meson.=
build ++++ b/meson.build +@@ -765,7 +765,7 @@ zlib =3D dependency('zlib') +=
 MIMEtypes +=3D 'image/x-psp' + + # Compiler-provided headers can't be foun=
d in crossroads environment +-if not meson.is_cross_build() ++if true + bz2=
 =3D cc.find_library('bz2') + else + bz2 =3D dependency('bzip2') +-- +2.47.=
1 + diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-defa=
ult-CC-override.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-all=
ow-default-CC-override.patch deleted file mode 100644 index b04a16cec7..000=
0000000 --- a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default=
-CC-override.patch +++ /dev/null @@ -1,85 +0,0 @@ -From 7e5b986cb7797a6535f=
e2471b9a5fb7c00821f51 Mon Sep 17 00:00:00 2001 -From: Yoann Congal <yoann.c=
ongal@smile.fr> -Date: Sun, 13 Oct 2024 01:00:10 +0200 -Subject: [PATCH] gi=
mptool: allow default CC override - -From: Yoann Congal <yoann.congal@smile=
.fr> - -In OE, CC contains sysroot path. Storing CC in binary then leads to=
 -non-reproducibility. - -This commit add a new configure option "--with-de=
fault-cc=3D'cmd'" for -force the CC stored in gimptool to a reproducible va=
lue. - -Upstream-Status: Inappropriate [does not apply on master (upstream =
has moved to meson)] -Signed-off-by: Yoann Congal <yoann.congal@smile.fr> -=
--- - app-tools/Makefile.am | 2 +- - configure.ac | 13 +++++++++++++ - tool=
s/Makefile.am | 2 +- - tools/gimptool.c | 2 +- - 4 files changed, 16 insert=
ions(+), 3 deletions(-) - -diff --git a/app-tools/Makefile.am b/app-tools/M=
akefile.am -index a7cd4ce..81a3a00 100644 ---- a/app-tools/Makefile.am -+++=
 b/app-tools/Makefile.am -@@ -67,7 +67,7 @@ AM_CPPFLAGS =3D \ - -DMANDIR=3D=
\""$(mandir)"\" \ - -DGIMPPLUGINDIR=3D\""$(gimpplugindir)"\" \ - -DGIMPDATA=
DIR=3D\""$(gimpdatadir)"\" \ -- -DCC=3D\""$(CC)"\" \ -+ -DDEFAULT_CC=3D\""@=
DEFAULT_CC@"\" \ - -DGIMPDIR=3D\""$(gimpdir)"\" \ - -DGIMP_PLUGIN_VERSION=
=3D\""$(GIMP_PLUGIN_VERSION)"\" \ - -I$(top_srcdir) \ -diff --git a/configu=
re.ac b/configure.ac -index a88b7cc..d90b6db 100644 ---- a/configure.ac -++=
+ b/configure.ac -@@ -2457,6 +2457,19 @@ fi - AM_CONDITIONAL(DESKTOP_DATADI=
R, test "x$with_desktop_dir" !=3D xno) - AC_SUBST(DESKTOP_DATADIR) - -+####=
################## -+# Determine default CC -+###################### -+ -+A=
C_ARG_WITH(default-cc, [ --with-default-cc=3D"cmd" default CC to print in g=
imptool (default=3DCC)]) -+ -+if test "x$with_default_cc" !=3D x; then -+ D=
EFAULT_CC=3D$with_default_cc -+else -+ DEFAULT_CC=3DCC -+fi -+ -+AC_SUBST(D=
EFAULT_CC) - - ##################### - # Check for XML tools -diff --git a/=
tools/Makefile.am b/tools/Makefile.am -index 420b9b1..ccabde8 100644 ---- a=
/tools/Makefile.am -+++ b/tools/Makefile.am -@@ -87,7 +87,7 @@ AM_CPPFLAGS =
=3D \ - -DMANDIR=3D\""$(mandir)"\" \ - -DGIMPPLUGINDIR=3D\""$(gimpplugindir=
)"\" \ - -DGIMPDATADIR=3D\""$(gimpdatadir)"\" \ -- -DCC=3D\""$(CC)"\" \ -+ =
-DDEFAULT_CC=3D\""@DEFAULT_CC@"\" \ - -DGIMPDIR=3D\""$(gimpdir)"\" \ - -DGI=
MP_PLUGIN_VERSION=3D\""$(GIMP_PLUGIN_VERSION)"\" \ - -I$(top_srcdir) \ -dif=
f --git a/tools/gimptool.c b/tools/gimptool.c -index 21fc043..bbf3fa5 10064=
4 ---- a/tools/gimptool.c -+++ b/tools/gimptool.c -@@ -280,7 +280,7 @@ find=
_out_env_flags (void) - else if (msvc_syntax) - env_cc =3D "cl -MD"; - else=
 -- env_cc =3D CC; -+ env_cc =3D DEFAULT_CC; - - if (g_ascii_strncasecmp (e=
nv_cc, "cl", 2) =3D=3D 0 && - g_ascii_strncasecmp (env_cc, "clang", 5) !=3D=
 0) diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-=
build-time-library-paths-to-LD_LI.patch b/meta-gnome/recipes-gimp/gimp/gimp=
/0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch deleted fi=
le mode 100644 index cec0055284..0000000000 --- a/meta-gnome/recipes-gimp/g=
imp/gimp/0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch ++=
+ /dev/null @@ -1,34 +0,0 @@ -From c720df90dfe3a3e92e34bfb36a04cc792064a501=
 Mon Sep 17 00:00:00 2001 -From: Khem Raj <raj.khem@gmail.com> -Date: Wed, =
24 May 2023 22:39:02 -0700 -Subject: [PATCH] libtool: Do not add build time=
 library paths to - LD_LIBRARY_PATH - -This does not serve much purpose on =
cross builds as it will add build -time paths which are only useful when tr=
ying to run these tools from -build area but when they are cross built this=
 is not possible to run -them like this. - -Upstream-Status: Inappropriate =
[Cross-compile specific] - -Signed-off-by: Khem Raj <raj.khem@gmail.com> --=
-- - ltmain.sh | 2 +- - 1 file changed, 1 insertion(+), 1 deletion(-) - -di=
ff --git a/ltmain.sh b/ltmain.sh -index 134902c..068d74a 100644 ---- a/ltma=
in.sh -+++ b/ltmain.sh -@@ -5748,7 +5748,7 @@ func_exec_program () - if tes=
t yes =3D "$shlibpath_overrides_runpath" && test -n "$shlibpath_var" && tes=
t -n "$temp_rpath"; then - $ECHO "\ - # Add our own library path to $shlibp=
ath_var -- $shlibpath_var=3D\"$temp_rpath\$$shlibpath_var\" -+ $shlibpath_v=
ar=3D\"$shlibpath_var\" - - # Some systems cannot cope with colon-terminate=
d $shlibpath_var - # The second colon is a workaround for a bug in BeOS R4 =
sed --- -2.40.1 - diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-meson=
.build-dont-check-for-lgi.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-me=
son.build-dont-check-for-lgi.patch new file mode 100644 index 0000000000..6=
3a9159a43 --- /dev/null +++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.=
build-dont-check-for-lgi.patch @@ -0,0 +1,35 @@ +From e56a6330f1e29e489601e=
a3e7cb31bfd2ebb787a Mon Sep 17 00:00:00 2001 +From: Markus Volk <f_l_k@t-on=
line.de> +Date: Thu, 27 Mar 2025 21:02:22 +0100 +Subject: [PATCH] meson.bui=
ld: dont check for lgi + +Checking if host can run lgi is pointless for cro=
ss-compile +Set to be always true because we ensure to install lgi via PACK=
AGECONFIG + +Signed-off-by: Markus Volk <f_l_k@t-online.de> + +Upstream-Sta=
tus: Inappropriate [oe-specific] +--- + meson.build | 6 +----- + 1 file cha=
nged, 1 insertion(+), 5 deletions(-) + +diff --git a/meson.build b/meson.bu=
ild +index c91e8fc97d..efbc2d8175 100644 +--- a/meson.build ++++ b/meson.bu=
ild +@@ -1235,11 +1235,7 @@ if have_lua + endif + + if is_supported_lua +- =
have_lua_lgi =3D run_command(lua, '-e', +- ''' +- local lgi =3D require 'lg=
i' +- ''', +- check: false).returncode() =3D=3D 0 ++ have_lua_lgi =3D true =
+ endif + + if have_lua_lgi +-- +2.49.0 + diff --git a/meta-gnome/recipes-g=
imp/gimp/gimp/0001-metadata-shut-up-a-weird-warning.patch b/meta-gnome/reci=
pes-gimp/gimp/gimp/0001-metadata-shut-up-a-weird-warning.patch deleted file=
 mode 100644 index 4f04ac8250..0000000000 --- a/meta-gnome/recipes-gimp/gim=
p/gimp/0001-metadata-shut-up-a-weird-warning.patch +++ /dev/null @@ -1,22 +=
0,0 @@ -From 51311f913d9f417d121f59b83d560c7b4b853d1c Mon Sep 17 00:00:00 2=
001 -From: Simon Budig <simon@budig.de> -Date: Sat, 20 May 2023 22:25:40 +0=
200 -Subject: [PATCH] metadata: shut up a weird warning - -Upstream-Status:=
 Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/51311f913d9f417d121=
f59b83d560c7b4b853d1c] -Signed-off-by: Khem Raj <raj.khem@gmail.com> ---- -=
 plug-ins/metadata/metadata-editor.c | 2 +- - 1 file changed, 1 insertion(+=
), 1 deletion(-) - ---- a/plug-ins/metadata/metadata-editor.c -+++ b/plug-i=
ns/metadata/metadata-editor.c -@@ -2140,7 +2140,7 @@ metadata_dialog_editor=
_set_metadata (GEx - } - else - { -- if (! g_strv_contains (values, equiv_v=
alues[evi])) -+ if (! g_strv_contains ((const gchar * const *) values, equi=
v_values[evi])) - { - gchar *tmpvalue; - diff --git a/meta-gnome/recipes-gi=
mp/gimp/gimp/0002-meson.build-reproducibility-fix.patch b/meta-gnome/recipe=
s-gimp/gimp/gimp/0002-meson.build-reproducibility-fix.patch new file mode 1=
00644 index 0000000000..532715d588 --- /dev/null +++ b/meta-gnome/recipes-g=
imp/gimp/gimp/0002-meson.build-reproducibility-fix.patch @@ -0,0 +1,56 @@ +=
From bf19c5687703769e406a8086036d4ed6421c33cb Mon Sep 17 00:00:00 2001 +Fro=
m: Markus Volk <f_l_k@t-online.de> +Date: Mon, 13 Jan 2025 10:04:33 +0100 +=
Subject: [PATCH] meson.build: reproducibility fix + +Signed-off-by: Markus =
Volk <f_l_k@t-online.de> + +Upstream-Status: Inappropriate [oe-specific] +-=
-- + meson.build | 28 ++++++++++++++-------------- + 1 file changed, 14 ins=
ertions(+), 14 deletions(-) + +diff --git a/meson.build b/meson.build +inde=
x 97cd621780..e47180db87 100644 +--- a/meson.build ++++ b/meson.build +@@ -=
1599,23 +1599,23 @@ conf.set('HAVE_FUNC_ATTRIBUTE_DESTRUCTOR', + conf.set_q=
uoted('CC', cc.get_id()) + + cc_version=3D'' +-if cc.get_id() =3D=3D 'gcc' =
or cc.get_id() =3D=3D 'clang' +- cc_cmd =3D run_command(cc, '-v', check: fa=
lse) ++#if cc.get_id() =3D=3D 'gcc' or cc.get_id() =3D=3D 'clang' ++# cc_cm=
d =3D run_command(cc, '-v', check: false) + # Note: the call might actually=
 fail when using ccache. + # See: https://github.com/mesonbuild/meson/issue=
s/6174 +- if cc_cmd.returncode() =3D=3D 0 +- cc_version =3D cc_cmd.stdout()=
 + cc_cmd.stderr() +- endif +-else ++# if cc_cmd.returncode() =3D=3D 0 ++# =
cc_version =3D cc_cmd.stdout() + cc_cmd.stderr() ++# endif ++#else + # Vari=
ous compilers have various options. Try most common ones. This + # list of =
options comes from autotools checks. +- foreach arg : [ '--version', '-v', =
'-V', '-qversion' ] +- cc_cmd =3D run_command(cc, arg, check: false) +- if =
cc_cmd.returncode() =3D=3D 0 +- cc_version =3D cc_cmd.stdout() +- endif +- =
endforeach +-endif ++# foreach arg : [ '--version', '-v', '-V', '-qversion'=
 ] ++# cc_cmd =3D run_command(cc, arg, check: false) ++# if cc_cmd.returnco=
de() =3D=3D 0 ++# cc_version =3D cc_cmd.stdout() ++# endif ++# endforeach +=
+#endif + if cc_version =3D=3D '' + # We didn't manage to get a meaningful =
verbose version from the + # compiler. Just save its name and version. +-- =
+2.47.1 + diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-=
gnome/recipes-gimp/gimp/gimp_2.10.38.bb deleted file mode 100644 index 0272=
e05e96..0000000000 --- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb +++ /=
dev/null @@ -1,101 +0,0 @@ -SUMMARY =3D "The GIMP is the GNU Image Manipula=
tion Program" -HOMEPAGE =3D "http://www.gimp.org" -SECTION =3D "x11/graphic=
s" -LICENSE =3D "GPL-3.0-only" -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D=
c678957b0c8e964aa6c70fd77641a71e" - -DEPENDS =3D " \ - alsa-lib \ - atk \ -=
 cairo \ - fontconfig \ - freetype \ - gdk-pixbuf-native \ - intltool-nativ=
e \ - libxslt-native \ - gegl-native \ - dbus-glib \ - gtk+ \ - babl \ - ge=
gl \ - libmypaint \ - mypaint-brushes-1.0 \ - gexiv2 \ - jpeg \ - libmng \ =
- libpng \ - libexif \ - tiff \ - lcms \ - poppler \ - poppler-data \ - jas=
per \ - bzip2 \ - libgudev \ - libmng \ - ${@bb.utils.contains('DISTRO_FEAT=
URES', 'x11', 'libxmu libxpm', '', d)} \ -" -DEPENDS:append:libc-musl =3D "=
 libexecinfo" - -GNOMEBASEBUILDCLASS =3D "autotools" -inherit features_chec=
k gnomebase gtk-icon-cache gtk-doc mime-xdg - -REQUIRED_DISTRO_FEATURES =3D=
 "x11" - -SHPV =3D "${@gnome_verdir("${PV}")}" - -SRC_URI =3D "https://down=
load.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \ - file://0001-configure-K=
eep-first-line-of-compiler-version-string.patch \ - file://0001-libtool-Do-=
not-add-build-time-library-paths-to-LD_LI.patch \ - file://0001-file-tiff-l=
oad-fix-mismatching-variable-type.patch \ - file://0001-metadata-shut-up-a-=
weird-warning.patch \ - file://0001-gimptool-allow-default-CC-override.patc=
h \ - " -SRC_URI[sha256sum] =3D "50a845eec11c8831fe8661707950f5b8446e35f30e=
dfb9acf98f85c1133f856e" - -EXTRA_OECONF =3D "--disable-python \ - --without=
-webkit \ - --disable-check-update \ - --without-wmf" - -EXTRA_OECONF +=3D =
"${@oe.utils.conditional('SITEINFO_BITS', '32', ' --disable-vector-icons', =
'', d)}" - -do_configure:append() { - find ${B} -name Makefile | xargs sed =
-i s:'-I$(includedir)':'-I.':g - find ${B} -name Makefile | xargs sed -i s:=
'-I/usr/include':'-I${STAGING_INCDIR}':g -} - -do_compile:prepend() { - # L=
et native babl/gegl find their plugins - export BABL_PATH=3D`find ${STAGING=
_LIBDIR_NATIVE} -maxdepth 1 -name 'babl-*'` - export GEGL_PATH=3D`find ${ST=
AGING_LIBDIR_NATIVE} -maxdepth 1 -name 'gegl-*'` -} - -FILES:${PN} +=3D "${=
datadir}/metainfo" - -RDEPENDS:${PN} +=3D "mypaint-brushes-1.0" - - -# gimp=
tool - -# gimptool needs a CC definition, use current CC without sysroot -p=
ython __anonymous() { - import shlex - CC_WITHOUT_SYSROOT =3D shlex.join(fi=
lter(lambda x: not x.startswith("--sysroot=3D"), shlex.split(d.getVar("CC")=
))) - d.setVar("CC_WITHOUT_SYSROOT", CC_WITHOUT_SYSROOT) -} -EXTRA_OECONF +=
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
000000000..5ae50f7ccc --- /dev/null +++ b/meta-gnome/recipes-gimp/gimp/gimp=
_3.0.2.bb @@ -0,0 +1,131 @@ +SUMMARY =3D "The GIMP is the GNU Image Manipul=
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
 "file://0002-meson.build-reproducibility-fix.patch" +SRC_URI +=3D "file://=
0001-meson.build-dont-check-for-lgi.patch" +SRC_URI[sha256sum] =3D "546ddc3=
0cb2d0e79123c7fcb4d78211e1ee7a6aace91a6a0ad8cbcbf6ea571a2" + +PACKAGECONFIG=
[aa] =3D "-Daa=3Denabled,-Daa=3Ddisabled,aalib" +PACKAGECONFIG[alsa] =3D "-=
Dalsa=3Denabled,-Dalsa=3Ddisabled,alsa-lib" +PACKAGECONFIG[appdata-test] =
=3D "-Dappdata-test=3Denabled,-Dappdata-test=3Ddisabled,appstream-native" +=
PACKAGECONFIG[cairo-pdf] =3D "-Dcairo-pdf=3Denabled,-Dcairo-pdf=3Ddisabled"=
 +PACKAGECONFIG[check-update] =3D "-Dcheck-update=3Dyes,-Dcheck-update=3Dno=
" +PACKAGECONFIG[ghostscript] =3D "-Dghostscript=3Denabled,-Dghostscript=3D=
disabled,ghostscript,ghostscript" +PACKAGECONFIG[gudev] =3D "-Dgudev=3Denab=
led,-Dgudev=3Ddisabled,libgudev" +PACKAGECONFIG[heif] =3D "-Dheif=3Denabled=
,-Dheif=3Ddisabled,libheif" +PACKAGECONFIG[javascript] =3D "-Djavascript=3D=
enabled,-Djavascript=3Ddisabled,,gjs" +PACKAGECONFIG[jpeg2000] =3D "-Djpeg2=
000=3Denabled,-Djpeg2000=3Ddisabled,jasper" +PACKAGECONFIG[jpeg-xl] =3D "-D=
jpeg-xl=3Denabled,-Djpeg-xl=3Ddisabled,libjxl" +PACKAGECONFIG[libunwind] =
=3D "-Dlibunwind=3Dtrue,-Dlibunwind=3Dfalse,libunwind" +PACKAGECONFIG[libba=
cktrace] =3D "-Dlibbacktrace=3Dtrue,-Dlibbacktrace=3Dfalse,libbacktrace" +P=
ACKAGECONFIG[lua] =3D "-Dlua=3Dtrue,-Dlua=3Dfalse,,luajit lua-lgi" +PACKAGE=
CONFIG[mng] =3D "-Dmng=3Denabled,-Dmng=3Ddisabled,libmng" +PACKAGECONFIG[op=
enmp] =3D "-Dopenmp=3Denabled,-Dopenmp=3Ddisabled,gcc-runtime" +PACKAGECONF=
IG[vector-icons] =3D "-Dvector-icons=3Dtrue,-Dvector-icons=3Dfalse,librsvg =
shared-mime-info" +PACKAGECONFIG[webp] =3D "-Dwebp=3Denabled,-Dwebp=3Ddisab=
led,libwebp" +PACKAGECONFIG[xcursor] =3D "-Dxcursor=3Denabled,-Dxcursor=3Dd=
isabled,libxcursor" +PACKAGECONFIG[x11] =3D "-Dxpm=3Denabled,-Dxpm=3Ddisabl=
ed,libxpm libxext libxfixes" + +PACKAGECONFIG ?=3D " \ + alsa \ + cairo-pdf=
 \ + ghostscript \ + gudev \ + javascript \ + jpeg2000 \ + jpeg-xl \ + lua =
\ + mng \ + webp \ + ${@oe.utils.conditional('SITEINFO_BITS', '32', '', 've=
ctor-icons', d)} \ + ${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commer=
cial', 'heif', '', d)} \ + ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '=
x11 xcursor', '', d)} \ +" + +PACKAGECONFIG:remove:riscv32 =3D "lua" +PACKA=
GECONFIG:remove:riscv64 =3D "lua" +PACKAGECONFIG:remove:powerpc64 =3D "lua"=
 +PACKAGECONFIG:remove:powerpc64le =3D "lua" + +EXTRA_OEMESON +=3D " \ + -D=
shmem-type=3Dposix \ + -Dlinux-input=3Denabled \ + --buildtype release \ + =
--cross-file=3D${WORKDIR}/meson-${PN}.cross \ +" + +do_write_config:append(=
) { + cat >${WORKDIR}/meson-${PN}.cross <<EOF +[binaries] +gjs =3D '${bindi=
r}/gjs' +luajit =3D '${bindir}/luajit' +EOF +} + +do_configure:append () { =
+ sed -i -e "s|build_by_default: true|build_by_default: false|" ${S}/gimp-d=
ata/images/meson.build +} + +do_install:prepend() { + sed -i -e "s|${B}||" =
${B}/app/widgets/gimplanguagestore-data.h + sed -i -e "s|${B}||" ${B}/plug-=
ins/file-bmp/huffman.h +} + +FILES:${PN} +=3D "${datadir}/metainfo" + +RDEP=
ENDS:${PN} =3D "mypaint-brushes-1.0 glib-networking python3-pygobject"
> --
> 2.49.0
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all mess=
ages sent to this group. View/Reply Online (#116333): https://lists.openemb=
edded.org/g/openembedded-devel/message/116333 Mute This Topic: https://list=
s.openembedded.org/mt/111946232/3618223 Group Owner: openembedded-devel+own=
er@lists.openembedded.org Unsubscribe: https://lists.openembedded.org/g/ope=
nembedded-devel/unsub [f_l_k@t-online.de] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-

