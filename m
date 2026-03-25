Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A23FEC0F4
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 01:11:46 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12677.1774401099878180217
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 18:11:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ARoGZFVg;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64c9707fc11so3195515d50.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 18:11:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774401099; cv=none;
        d=google.com; s=arc-20240605;
        b=MEkQPCfyazEF/6BiOyJ+NX2gS/i0bVLZwCj4nsm9fVnTI5Z0MhbFnLy4T2qSpJPq0a
         SkNFsEkC+FYc37chv3+qxPgk4rLhStEMKUPNHC27+ar1G242ohjllD/n+USO5xh5Kh+W
         D2q8jWNOKcm1ktsxZGo8EneH31faYensKD8f6GBgjBOjrUAw1w4AsfNDQYLDOyaGy4Mo
         DsCvaqwTVGDjQIosy2JNrZWS7WoD4tK90MJpUzY6gFs45mI4cUHu3veOZGuZmJeZexbL
         PaxdkhFkQGOtWH3MBfb2RxrXn1VQsB7QqFMtWh3YpGRbJpXySMcXYwEwGsvDtpedaCeo
         2Cxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W+8zGnFF6JXgT0yhV2Jvh6J32AbSw9qH076SjXGLRzc=;
        fh=tQ6KEAer5pzwHtEZU5ve0iS4XpDO1dGUnDwKiQ3fOvU=;
        b=aZAix2gu9l1zVxV345CHsIoWcmYip90lplRvMZuc50aFmrqeSqB/GtraqrzPQO9qDI
         Ag4vo8WIZetre6QhzUf8icySbsAHjloKQHRElZ/J396cozLG5fJdkuP+1IRayupozlu0
         M8COKhRn5IkBSOyFHIZ5/SToAovz8hrUmtFuY7gvuq2uU87iDEsOM22Rkrgqf5QWRHUO
         JJSJSNwyhoqY55Xaz0uwXdMOG4nr1VxxowjQRcGanw7X1csRiTIyCocNbojZOOE8mXEt
         H3o80OUmvWxqmrwaWaqH3nFfy49n3m0F7xDIqclG3QZZcld14MONT85t3Z1Ex5KU0zkE
         lfUg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774401099; x=1775005899; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W+8zGnFF6JXgT0yhV2Jvh6J32AbSw9qH076SjXGLRzc=;
        b=ARoGZFVgHDbLVoSmFiUmYsCE9gZMU5qd8N4VMXHQOV/0qx4Z9quoRe+z8TMB7Zz5Az
         swEYmJeIPxdhz48mtpvBGIKX++BoFKX27IWv+5b/75DZrnd4oiaPqpd+roaFL5pZW9q7
         cvON7uoL0/t5g3W0AY4qJjz5t534LwRaTLqiDE0g3ZeMykXDGteDEBISOBp88fnSHMxE
         IhvrFDRn5t9KwA755CU2437N/zGXj7hwqQh7B0LD6ZTCwvKSFpmdGzwncZxGZtPStJqp
         b/j0HooJ901J/CGdUYwSyVtDfTP/a+fp0GgigM0zuRCvHfYys9X1xj4Nx+ckqxxnqfgc
         G7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774401099; x=1775005899;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+8zGnFF6JXgT0yhV2Jvh6J32AbSw9qH076SjXGLRzc=;
        b=KQF/5pFHHlW5/zz3gYbR8CpPzl6cBky2/IQtErIFTsZ8P8K7cnQJz0jPLXr8rX/O9Z
         Sf7KqGPTO/DvELiVFS7aY64yYgwu5fQuq6nIPAx0Xd/0j4O7U//vQ3S3dyC9mJZjJ/Vy
         eqIiTrWQII5yKsD71r4Qvw3RA+AW+cAL4RhQtBbv80yQ76lOzNt6LnfbZKwu2w5U/TUG
         OFyrLksZIfUQkUdxCPiwIW0kGj93mdvmIYvVgGi1VB0y8kkk7UJD0dU8PtymigSlhirE
         rzVmpeVTJYPBMna9VUfrQuONXLWVPCff/HEpo5eS1QGK2KIZZTWfk4naXDI3lRMj1Ub7
         c8Yg==
X-Gm-Message-State: AOJu0YwlBO07o2uxt3m2CPGqBIC8mhA7oklcK20blx73Ykrrjt69b5B4
	VEZrbPs561Jg1kJt5iGobtFrMIKE4DT4nEvIF3Y63Vf2YTIsyl8jQZVDxkt+fQpvhMSEn7z3OLD
	OCg2FpdZp5g+sTvhbqF87kBAXv4BoPpY=
X-Gm-Gg: ATEYQzwrWF6O+MfQ6e5pOFHBM7ddADINbrHhhDKO2PMgqFW1Xm8lZ/wVgvnACuqdGQu
	EDxUDgV9rFm8aSVnGiAkseWoyRSNGGZ+cA7s5hDPEYYKGCmXNE4itKT26Ri5NnLSeofY+xsF0Yj
	14w8T8akBzLimjMZKj3f87XyzZwkni4eZmZfDw/TwVsgvSH3u+9o4yosVr7tCMdCd06DcjAFM+J
	F7dDYr4K1E0s3/mv7lUQRyGpPY3JU5tMwdmILrK29Yb/ZR1MYJ8wVy8nb038W27nKyuUunHG0eg
	H7cYEJIXOPcQjnxvLLFF5I/dzovTc0kvlBZ6L4O4xPva1/fybOhDzs3IuEKWqaRopcDjmY1QD6s
	K3MreAu1Ii/gLbLs8KKLvmfuI
X-Received: by 2002:a05:690e:d55:b0:64c:f288:9870 with SMTP id
 956f58d0204a3-64ee608315cmr1496894d50.8.1774401098695; Tue, 24 Mar 2026
 18:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260322182651.4090587-1-khem.raj@oss.qualcomm.com>
 <20260322182651.4090587-2-khem.raj@oss.qualcomm.com> <23edc667-003c-4ced-af66-5d802f1a6636@windriver.com>
In-Reply-To: <23edc667-003c-4ced-af66-5d802f1a6636@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Mar 2026 18:11:11 -0700
X-Gm-Features: AaiRm53o2JIpHl6AhJae1x4SJUtb-vf3NUlAtiWYD20IJZOrWBeRatTnxIzu7Qs
Message-ID: <CAMKF1sqFVzC99pAs5iN7qPc3iQ0b1nTY2ins6T24J5PWCpbTVQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 2/2] netcf: Stick to shell
 implementation of gnulib-tool
To: kai.kang@windriver.com
Cc: openembedded-devel@lists.openembedded.org, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="0000000000002d4843064dcef35f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 01:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125594

--0000000000002d4843064dcef35f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 5:54=E2=80=AFPM Kai Kang via lists.openembedded.org
<kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:

> On 3/23/26 02:26, Khem Raj via lists.openembedded.org wrote:
> > Fix build with newer autotools and gnulib
> >
> > Newer gnulib use python implementation by default if it
> > finds py3 on the system. However, netcf is old package
> > and its not expecting python implementation, therefore
> > make the shell implementation be used.
> >
> > REALLOC_N is gone in latest gnulib so house a local
> > macro
> >
> > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> > ---
> >   ...nulib-read_file-fread_file-signature.patch | 41 ++++++++-----
> >   ...bootstrap-with-newer-gnulib-automake.patch | 61 ++++++++++++++++++=
+
> >   .../recipes-support/netcf/netcf_0.2.8.bb      |  6 +-
> >   3 files changed, 91 insertions(+), 17 deletions(-)
> >   create mode 100644
> meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootstrap-with=
-newer-gnulib-automake.patch
> >
> > diff --git
> a/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-re=
ad_file-fread_file-signature.patch
> b/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-re=
ad_file-fread_file-signature.patch
> > index b188248fff..83fdfded52 100644
> > ---
> a/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-re=
ad_file-fread_file-signature.patch
> > +++
> b/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gnulib-re=
ad_file-fread_file-signature.patch
> > @@ -17,11 +17,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >    src/ncftransform.c | 2 +-
> >    4 files changed, 5 insertions(+), 5 deletions(-)
> >
> > -diff --git a/src/dutil_linux.c b/src/dutil_linux.c
> > -index 742153a..eb72eb2 100644
> >   --- a/src/dutil_linux.c
> >   +++ b/src/dutil_linux.c
> > -@@ -1113,7 +1113,7 @@ static void add_link_info(struct netcf *ncf,
> > +@@ -1113,7 +1113,7 @@ static void add_link_info(struct netcf *
> >
> >        xasprintf(&path, "/sys/class/net/%s/operstate", ifname);
> >        ERR_NOMEM(!path, ncf);
> > @@ -30,7 +28,7 @@ index 742153a..eb72eb2 100644
> >        if (!state) {
> >            /* missing operstate is *not* an error. It could be due to a=
n
> >             * alias interface, which has no entry in /sys/class/net at
> > -@@ -1132,7 +1132,7 @@ static void add_link_info(struct netcf *ncf,
> > +@@ -1132,7 +1132,7 @@ static void add_link_info(struct netcf *
> >            FREE(path);
> >            xasprintf(&path, "/sys/class/net/%s/speed", ifname);
> >            ERR_NOMEM(path =3D=3D NULL, ncf);
> > @@ -39,11 +37,9 @@ index 742153a..eb72eb2 100644
> >            if (!speed && errno =3D=3D EINVAL) {
> >                /* attempts to read $ifname/speed result in EINVAL if th=
e
> >                 * interface is ifconfiged down (which isn't exactly the
> > -diff --git a/src/dutil_posix.c b/src/dutil_posix.c
> > -index 1313514..b9884f0 100644
> >   --- a/src/dutil_posix.c
> >   +++ b/src/dutil_posix.c
> > -@@ -211,7 +211,7 @@ int run_program(struct netcf *ncf, const char
> *const *argv, char **output)
> > +@@ -211,7 +211,7 @@ int run_program(struct netcf *ncf, const
> >                           "Failed to create file stream for output whil=
e
> executing '%s': %s",
> >                           argv_str, errbuf);
> >
> > @@ -52,11 +48,9 @@ index 1313514..b9884f0 100644
> >        ERR_THROW_STRERROR(*output =3D=3D NULL, ncf, EEXEC,
> >                           "Error while reading output from execution of
> '%s': %s",
> >                           argv_str, errbuf);
> > -diff --git a/src/ncftool.c b/src/ncftool.c
> > -index f1b5642..c878cb0 100644
> >   --- a/src/ncftool.c
> >   +++ b/src/ncftool.c
> > -@@ -351,7 +351,7 @@ static int cmd_define(const struct command *cmd) {
> > +@@ -351,7 +351,7 @@ static int cmd_define(const struct comma
> >        struct netcf_if *nif =3D NULL;
> >        int result =3D CMD_RES_ERR;
> >
> > @@ -65,8 +59,6 @@ index f1b5642..c878cb0 100644
> >        if (xml =3D=3D NULL) {
> >            fprintf(stderr, "Failed to read %s\n", fname);
> >            goto done;
> > -diff --git a/src/ncftransform.c b/src/ncftransform.c
> > -index fbabfc3..4c9a56d 100644
> >   --- a/src/ncftransform.c
> >   +++ b/src/ncftransform.c
> >   @@ -54,7 +54,7 @@ int main(int argc, char **argv) {
> > @@ -78,6 +70,25 @@ index fbabfc3..4c9a56d 100644
> >        if (in_xml =3D=3D NULL)
> >            die("Failed to read %s\n", argv[2]);
> >
> > ---
> > -2.44.0
> > -
> > +--- a/src/internal.h
> > ++++ b/src/internal.h
> > +@@ -30,6 +30,7 @@
> > +
> > + #include <string.h>
> > + #include <stdarg.h>
> > ++#include <stdlib.h>
> > +
> > + #include <libxslt/transform.h>
> > + #include <libxml/relaxng.h>
> > +@@ -85,6 +86,11 @@
> > + #define ATTRIBUTE_NOINLINE
> > + #endif                                   /* __GNUC__ */
> > +
> > ++#ifndef REALLOC_N
> > ++# define REALLOC_N(ptr, count) \
> > ++    (((ptr) =3D realloc((ptr), sizeof(*(ptr)) * (count))) =3D=3D NULL=
 ? -1 :
> 0)
> > ++#endif
> > ++
> > + /* This needs ATTRIBUTE_RETURN_CHECK */
> > + #include "ref.h"
> > +
> > diff --git
> a/meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootstrap-wi=
th-newer-gnulib-automake.patch
> b/meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootstrap-wi=
th-newer-gnulib-automake.patch
> > new file mode 100644
> > index 0000000000..62daeff812
> > --- /dev/null
> > +++
> b/meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-bootstrap-wi=
th-newer-gnulib-automake.patch
> > @@ -0,0 +1,61 @@
> > +From dded6e3321e304f50922e61c553d4e4eb0f80fd0 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <khem.raj@oss.qualcomm.com>
> > +Date: Sun, 22 Mar 2026 11:05:34 -0700
> > +Subject: [PATCH] netcf: fix bootstrap with newer gnulib/automake
> > +
> > +Upstream netcf is old enough that bootstrap/autoreconf now trips over:
> > +- gnulib-tool.py wrapper expectations in newer gnulib
> > +- stricter automake handling of AM_CFLAGS +=3D from generated gnulib.m=
k
> > +- subdir source warnings
> > +- deprecated INCLUDES usage
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> > +---
> > + configure.ac             | 2 +-
> > + gnulib/lib/Makefile.am   | 2 +-
> > + gnulib/tests/Makefile.am | 2 ++
> > + tests/Makefile.am        | 2 +-
> > + 4 files changed, 5 insertions(+), 3 deletions(-)
> > +
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -3,7 +3,7 @@ AC_CONFIG_SRCDIR([src/netcf.c])
> > + AC_CONFIG_AUX_DIR([build-aux])
> > + AC_CONFIG_MACRO_DIR([gnulib/m4])
> > + AC_CONFIG_HEADERS([config.h])
> > +-AM_INIT_AUTOMAKE([-Wno-portability 1.11 color-tests parallel-tests])
> > ++AM_INIT_AUTOMAKE([-Wno-portability 1.11 subdir-objects color-tests
> parallel-tests])
> > + AM_SILENT_RULES([yes]) # make --enable-silent-rules the default.
> > + AC_CANONICAL_HOST
> > +
> > +--- a/gnulib/lib/Makefile.am
> > ++++ b/gnulib/lib/Makefile.am
> > +@@ -13,4 +13,4 @@ CLEANFILES=3D
> > +
> > + include gnulib.mk
> > +
> > +-INCLUDES =3D $(GETTEXT_CPPFLAGS)
> > ++AM_CPPFLAGS =3D $(GETTEXT_CPPFLAGS)
> > +--- a/gnulib/tests/Makefile.am
> > ++++ b/gnulib/tests/Makefile.am
> > +@@ -3,6 +3,6 @@
> > + ## Copyright (C) 2011 Red Hat, Inc.
> > + ## See COPYING.LIB for the License of this software
> > +
> > +-include gnulib.mk
> > ++AM_CFLAGS =3D
> > +
> > +-INCLUDES =3D $(GETTEXT_CPPFLAGS)
> > ++include gnulib.mk
> > +--- a/tests/Makefile.am
> > ++++ b/tests/Makefile.am
> > +@@ -14,7 +14,7 @@ TESTS_ENVIRONMENT =3D \
> > +   abs_top_builddir=3D'$(abs_top_builddir)' \
> > +   abs_top_srcdir=3D'$(abs_top_srcdir)'
> > +
> > +-INCLUDES =3D -I$(top_srcdir)/src
> > ++AM_CPPFLAGS =3D -I$(top_srcdir)/src
> > +
> > + TESTS=3D
> > + check_PROGRAMS=3D
> > diff --git a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> > index 4170e9fab0..d1f9e29d3a 100644
> > --- a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> > +++ b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
> > @@ -10,6 +10,7 @@ SRCREV =3D "2c5d4255857531bc09d91dcd02e86545f29004d4"
> >   PV .=3D "+git"
> >
> >   SRC_URI =3D "git://pagure.io/netcf.git;protocol=3Dhttps;branch=3Dmast=
er \
> > +
>  file://0001-netcf-fix-bootstrap-with-newer-gnulib-automake.patch \
> >
> file://0001-Adopt-to-new-gnulib-read_file-fread_file-signature.patch"
> >
> >   UPSTREAM_CHECK_GITTAGREGEX =3D "release-(?P<pver>(\d+(\.\d+)+))"
> > @@ -27,6 +28,7 @@ PACKAGECONFIG ??=3D
> "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> >   PACKAGECONFIG[systemd] =3D
> "--with-sysinit=3Dsystemd,--with-sysinit=3Dinitscripts,"
> >
> >   do_configure:prepend() {
> > +    export GNULIB_TOOL_IMPL=3Dsh
>
> It seems this line is missing after merge.
>

Good eye. But its not needed anymore since the fix works with python
version too, sticking to shell version was a stop gap anyway


>
> Regards,
> Kai
>
> >       currdir=3D`pwd`
> >       cd ${S}
> >
> > @@ -50,11 +52,11 @@ do_install:append() {
> >       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
> 'false', d)}; then
> >          install -d ${D}${systemd_unitdir}/system
> >          if [ -d "${D}${libdir}/systemd/system" ]; then
> > -           if [ "${systemd_unitdir}" !=3D "${libdir}/systemd" ] ; then
> > +           if [ "${systemd_unitdir}" !=3D "${libdir}/systemd" ] ; then
> >                  mv ${D}${libdir}/systemd/system/*
> ${D}${systemd_unitdir}/system/
> >                  rm -rf ${D}${libdir}/systemd/
> >          fi
> > -       elif [ "${systemd_unitdir}" !=3D "${nonarch_libdir}/systemd" ] =
;
> then
> > +       elif [ "${systemd_unitdir}" !=3D "${nonarch_libdir}/systemd" ] =
;
> then
> >              mv ${D}${nonarch_libdir}/systemd/system/*
> ${D}${systemd_unitdir}/system/
> >              rm -rf ${D}${nonarch_libdir}/systemd/
> >          fi
> >
> >
> >
>
> --
> Kai Kang
> Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125593):
> https://lists.openembedded.org/g/openembedded-devel/message/125593
> Mute This Topic: https://lists.openembedded.org/mt/118452427/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002d4843064dcef35f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 24,=
 2026 at 5:54=E2=80=AFPM Kai Kang via <a href=3D"http://lists.openembedded.=
org">lists.openembedded.org</a> &lt;kai.kang=3D<a href=3D"mailto:windriver.=
com@lists.openembedded.org">windriver.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 3/23/26 =
02:26, Khem Raj via <a href=3D"http://lists.openembedded.org" rel=3D"norefe=
rrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Fix build with newer autotools and gnulib<br>
&gt;<br>
&gt; Newer gnulib use python implementation by default if it<br>
&gt; finds py3 on the system. However, netcf is old package<br>
&gt; and its not expecting python implementation, therefore<br>
&gt; make the shell implementation be used.<br>
&gt;<br>
&gt; REALLOC_N is gone in latest gnulib so house a local<br>
&gt; macro<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.co=
m" target=3D"_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0...nulib-read_file-fread_file-signature.patch | 41 +++++++=
+-----<br>
&gt;=C2=A0 =C2=A0...bootstrap-with-newer-gnulib-automake.patch | 61 +++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A0.../recipes-support/netcf/<a href=3D"http://netcf_0.2.8.bb=
" rel=3D"noreferrer" target=3D"_blank">netcf_0.2.8.bb</a>=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 6 +-<br>
&gt;=C2=A0 =C2=A03 files changed, 91 insertions(+), 17 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-networking/recipes-support/netcf/n=
etcf/0001-netcf-fix-bootstrap-with-newer-gnulib-automake.patch<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to=
-new-gnulib-read_file-fread_file-signature.patch b/meta-networking/recipes-=
support/netcf/netcf/0001-Adopt-to-new-gnulib-read_file-fread_file-signature=
.patch<br>
&gt; index b188248fff..83fdfded52 100644<br>
&gt; --- a/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gn=
ulib-read_file-fread_file-signature.patch<br>
&gt; +++ b/meta-networking/recipes-support/netcf/netcf/0001-Adopt-to-new-gn=
ulib-read_file-fread_file-signature.patch<br>
&gt; @@ -17,11 +17,9 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 src/ncftransform.c | 2 +-<br>
&gt;=C2=A0 =C2=A0 4 files changed, 5 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; -diff --git a/src/dutil_linux.c b/src/dutil_linux.c<br>
&gt; -index 742153a..eb72eb2 100644<br>
&gt;=C2=A0 =C2=A0--- a/src/dutil_linux.c<br>
&gt;=C2=A0 =C2=A0+++ b/src/dutil_linux.c<br>
&gt; -@@ -1113,7 +1113,7 @@ static void add_link_info(struct netcf *ncf,<br=
>
&gt; +@@ -1113,7 +1113,7 @@ static void add_link_info(struct netcf *<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 xasprintf(&amp;path, &quot;/sys/class/net/%=
s/operstate&quot;, ifname);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_NOMEM(!path, ncf);<br>
&gt; @@ -30,7 +28,7 @@ index 742153a..eb72eb2 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!state) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* missing operstate is *not*=
 an error. It could be due to an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* alias interface, whic=
h has no entry in /sys/class/net at<br>
&gt; -@@ -1132,7 +1132,7 @@ static void add_link_info(struct netcf *ncf,<br=
>
&gt; +@@ -1132,7 +1132,7 @@ static void add_link_info(struct netcf *<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FREE(path);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xasprintf(&amp;path, &quot;/s=
ys/class/net/%s/speed&quot;, ifname);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_NOMEM(path =3D=3D NULL, n=
cf);<br>
&gt; @@ -39,11 +37,9 @@ index 742153a..eb72eb2 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!speed &amp;&amp; errno =
=3D=3D EINVAL) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* attempts to =
read $ifname/speed result in EINVAL if the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* interfa=
ce is ifconfiged down (which isn&#39;t exactly the<br>
&gt; -diff --git a/src/dutil_posix.c b/src/dutil_posix.c<br>
&gt; -index 1313514..b9884f0 100644<br>
&gt;=C2=A0 =C2=A0--- a/src/dutil_posix.c<br>
&gt;=C2=A0 =C2=A0+++ b/src/dutil_posix.c<br>
&gt; -@@ -211,7 +211,7 @@ int run_program(struct netcf *ncf, const char *co=
nst *argv, char **output)<br>
&gt; +@@ -211,7 +211,7 @@ int run_program(struct netcf *ncf, const<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Failed to create file stream for output wh=
ile executing &#39;%s&#39;: %s&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0argv_str, errbuf);<br>
&gt;<br>
&gt; @@ -52,11 +48,9 @@ index 1313514..b9884f0 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERR_THROW_STRERROR(*output =3D=3D NULL, ncf=
, EEXEC,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Error while reading output from execution =
of &#39;%s&#39;: %s&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0argv_str, errbuf);<br>
&gt; -diff --git a/src/ncftool.c b/src/ncftool.c<br>
&gt; -index f1b5642..c878cb0 100644<br>
&gt;=C2=A0 =C2=A0--- a/src/ncftool.c<br>
&gt;=C2=A0 =C2=A0+++ b/src/ncftool.c<br>
&gt; -@@ -351,7 +351,7 @@ static int cmd_define(const struct command *cmd) =
{<br>
&gt; +@@ -351,7 +351,7 @@ static int cmd_define(const struct comma<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct netcf_if *nif =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 int result =3D CMD_RES_ERR;<br>
&gt;<br>
&gt; @@ -65,8 +59,6 @@ index f1b5642..c878cb0 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (xml =3D=3D NULL) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Failed =
to read %s\n&quot;, fname);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done;<br>
&gt; -diff --git a/src/ncftransform.c b/src/ncftransform.c<br>
&gt; -index fbabfc3..4c9a56d 100644<br>
&gt;=C2=A0 =C2=A0--- a/src/ncftransform.c<br>
&gt;=C2=A0 =C2=A0+++ b/src/ncftransform.c<br>
&gt;=C2=A0 =C2=A0@@ -54,7 +54,7 @@ int main(int argc, char **argv) {<br>
&gt; @@ -78,6 +70,25 @@ index fbabfc3..4c9a56d 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (in_xml =3D=3D NULL)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 die(&quot;Failed to read %s\n=
&quot;, argv[2]);<br>
&gt;<br>
&gt; ---<br>
&gt; -2.44.0<br>
&gt; -<br>
&gt; +--- a/src/internal.h<br>
&gt; ++++ b/src/internal.h<br>
&gt; +@@ -30,6 +30,7 @@<br>
&gt; +<br>
&gt; + #include &lt;string.h&gt;<br>
&gt; + #include &lt;stdarg.h&gt;<br>
&gt; ++#include &lt;stdlib.h&gt;<br>
&gt; +<br>
&gt; + #include &lt;libxslt/transform.h&gt;<br>
&gt; + #include &lt;libxml/relaxng.h&gt;<br>
&gt; +@@ -85,6 +86,11 @@<br>
&gt; + #define ATTRIBUTE_NOINLINE<br>
&gt; + #endif=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* __GNUC__ =
*/<br>
&gt; +<br>
&gt; ++#ifndef REALLOC_N<br>
&gt; ++# define REALLOC_N(ptr, count) \<br>
&gt; ++=C2=A0 =C2=A0 (((ptr) =3D realloc((ptr), sizeof(*(ptr)) * (count))) =
=3D=3D NULL ? -1 : 0)<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; + /* This needs ATTRIBUTE_RETURN_CHECK */<br>
&gt; + #include &quot;ref.h&quot;<br>
&gt; +<br>
&gt; diff --git a/meta-networking/recipes-support/netcf/netcf/0001-netcf-fi=
x-bootstrap-with-newer-gnulib-automake.patch b/meta-networking/recipes-supp=
ort/netcf/netcf/0001-netcf-fix-bootstrap-with-newer-gnulib-automake.patch<b=
r>
&gt; new file mode 100644<br>
&gt; index 0000000000..62daeff812<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-networking/recipes-support/netcf/netcf/0001-netcf-fix-boots=
trap-with-newer-gnulib-automake.patch<br>
&gt; @@ -0,0 +1,61 @@<br>
&gt; +From dded6e3321e304f50922e61c553d4e4eb0f80fd0 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.com" targe=
t=3D"_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
&gt; +Date: Sun, 22 Mar 2026 11:05:34 -0700<br>
&gt; +Subject: [PATCH] netcf: fix bootstrap with newer gnulib/automake<br>
&gt; +<br>
&gt; +Upstream netcf is old enough that bootstrap/autoreconf now trips over=
:<br>
&gt; +- gnulib-tool.py wrapper expectations in newer gnulib<br>
&gt; +- stricter automake handling of AM_CFLAGS +=3D from generated <a href=
=3D"http://gnulib.mk" rel=3D"noreferrer" target=3D"_blank">gnulib.mk</a><br=
>
&gt; +- subdir source warnings<br>
&gt; +- deprecated INCLUDES usage<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.c=
om" target=3D"_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
&gt; +---<br>
&gt; + <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt; + gnulib/lib/Makefile.am=C2=A0 =C2=A0| 2 +-<br>
&gt; + gnulib/tests/Makefile.am | 2 ++<br>
&gt; + tests/Makefile.am=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt; + 4 files changed, 5 insertions(+), 3 deletions(-)<br>
&gt; +<br>
&gt; +--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; ++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; +@@ -3,7 +3,7 @@ AC_CONFIG_SRCDIR([src/netcf.c])<br>
&gt; + AC_CONFIG_AUX_DIR([build-aux])<br>
&gt; + AC_CONFIG_MACRO_DIR([gnulib/m4])<br>
&gt; + AC_CONFIG_HEADERS([config.h])<br>
&gt; +-AM_INIT_AUTOMAKE([-Wno-portability 1.11 color-tests parallel-tests])=
<br>
&gt; ++AM_INIT_AUTOMAKE([-Wno-portability 1.11 subdir-objects color-tests p=
arallel-tests])<br>
&gt; + AM_SILENT_RULES([yes]) # make --enable-silent-rules the default.<br>
&gt; + AC_CANONICAL_HOST<br>
&gt; +<br>
&gt; +--- a/gnulib/lib/Makefile.am<br>
&gt; ++++ b/gnulib/lib/Makefile.am<br>
&gt; +@@ -13,4 +13,4 @@ CLEANFILES=3D<br>
&gt; +<br>
&gt; + include <a href=3D"http://gnulib.mk" rel=3D"noreferrer" target=3D"_b=
lank">gnulib.mk</a><br>
&gt; +<br>
&gt; +-INCLUDES =3D $(GETTEXT_CPPFLAGS)<br>
&gt; ++AM_CPPFLAGS =3D $(GETTEXT_CPPFLAGS)<br>
&gt; +--- a/gnulib/tests/Makefile.am<br>
&gt; ++++ b/gnulib/tests/Makefile.am<br>
&gt; +@@ -3,6 +3,6 @@<br>
&gt; + ## Copyright (C) 2011 Red Hat, Inc.<br>
&gt; + ## See COPYING.LIB for the License of this software<br>
&gt; +<br>
&gt; +-include <a href=3D"http://gnulib.mk" rel=3D"noreferrer" target=3D"_b=
lank">gnulib.mk</a><br>
&gt; ++AM_CFLAGS =3D<br>
&gt; +<br>
&gt; +-INCLUDES =3D $(GETTEXT_CPPFLAGS)<br>
&gt; ++include <a href=3D"http://gnulib.mk" rel=3D"noreferrer" target=3D"_b=
lank">gnulib.mk</a><br>
&gt; +--- a/tests/Makefile.am<br>
&gt; ++++ b/tests/Makefile.am<br>
&gt; +@@ -14,7 +14,7 @@ TESTS_ENVIRONMENT =3D \<br>
&gt; +=C2=A0 =C2=A0abs_top_builddir=3D&#39;$(abs_top_builddir)&#39; \<br>
&gt; +=C2=A0 =C2=A0abs_top_srcdir=3D&#39;$(abs_top_srcdir)&#39;<br>
&gt; +<br>
&gt; +-INCLUDES =3D -I$(top_srcdir)/src<br>
&gt; ++AM_CPPFLAGS =3D -I$(top_srcdir)/src<br>
&gt; +<br>
&gt; + TESTS=3D<br>
&gt; + check_PROGRAMS=3D<br>
&gt; diff --git a/meta-networking/recipes-support/netcf/<a href=3D"http://n=
etcf_0.2.8.bb" rel=3D"noreferrer" target=3D"_blank">netcf_0.2.8.bb</a> b/me=
ta-networking/recipes-support/netcf/<a href=3D"http://netcf_0.2.8.bb" rel=
=3D"noreferrer" target=3D"_blank">netcf_0.2.8.bb</a><br>
&gt; index 4170e9fab0..d1f9e29d3a 100644<br>
&gt; --- a/meta-networking/recipes-support/netcf/<a href=3D"http://netcf_0.=
2.8.bb" rel=3D"noreferrer" target=3D"_blank">netcf_0.2.8.bb</a><br>
&gt; +++ b/meta-networking/recipes-support/netcf/<a href=3D"http://netcf_0.=
2.8.bb" rel=3D"noreferrer" target=3D"_blank">netcf_0.2.8.bb</a><br>
&gt; @@ -10,6 +10,7 @@ SRCREV =3D &quot;2c5d4255857531bc09d91dcd02e86545f29=
004d4&quot;<br>
&gt;=C2=A0 =C2=A0PV .=3D &quot;+git&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0SRC_URI =3D &quot;git://<a href=3D"http://pagure.io/netcf.=
git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">=
pagure.io/netcf.git;protocol=3Dhttps;branch=3Dmaster</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-netcf-fix-bootst=
rap-with-newer-gnulib-automake.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Adopt-to-n=
ew-gnulib-read_file-fread_file-signature.patch&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;release-(?P&lt;pver&g=
t;(\d+(\.\d+)+))&quot;<br>
&gt; @@ -27,6 +28,7 @@ PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DI=
STRO_FEATURES&#39;, &#39;systemd&#39;, d)}&quot;<br>
&gt;=C2=A0 =C2=A0PACKAGECONFIG[systemd] =3D &quot;--with-sysinit=3Dsystemd,=
--with-sysinit=3Dinitscripts,&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0do_configure:prepend() {<br>
&gt; +=C2=A0 =C2=A0 export GNULIB_TOOL_IMPL=3Dsh<br>
<br>
It seems this line is missing after merge.<br></blockquote><div><br></div><=
div>Good eye. But its not needed anymore since the fix works with python ve=
rsion too, sticking to shell version was a stop gap anyway</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Regards,<br>
Kai<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0currdir=3D`pwd`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}<br>
&gt;<br>
&gt; @@ -50,11 +52,11 @@ do_install:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;DISTRO_FEATURES=
&#39;, &#39;systemd&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${systemd_unitdir}/sy=
stem<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -d &quot;${D}${libdir}/systemd/=
system&quot; ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${systemd_unitdir=
}&quot; !=3D &quot;${libdir}/systemd&quot; ] ; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${systemd_unitdir=
}&quot; !=3D &quot;${libdir}/systemd&quot; ] ; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}$=
{libdir}/systemd/system/* ${D}${systemd_unitdir}/system/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf $=
{D}${libdir}/systemd/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0elif [ &quot;${systemd_unitdir}&quot; !=3D=
 &quot;${nonarch_libdir}/systemd&quot; ] ; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0elif [ &quot;${systemd_unitdir}&quot; !=3D=
 &quot;${nonarch_libdir}/systemd&quot; ] ; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}${nonarch_libdi=
r}/systemd/system/* ${D}${systemd_unitdir}/system/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${nonarch_l=
ibdir}/systemd/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-- <br>
Kai Kang<br>
Wind River Linux<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125593): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125593" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125593</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118452427/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118452427/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000002d4843064dcef35f--

