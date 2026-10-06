Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2E4CA5FF0
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 09:46:43 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41693.1791279994381001848
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2026 02:46:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=bHpH4A6X;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout02.t-online.de (Postfix) with SMTP id 43612E775
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Oct 2026 11:46:30 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.33.153]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xE1kW-2V4Tzs0; Tue, 6 Oct 2026 11:46:16 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] ibus: let the build compiler find its own C standard option
Date: Tue,  6 Oct 2026 11:46:10 +0200
Message-ID: <20261006094610.1636779-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1791279976-227FB9F8-E5883C39/0/0 CLEAN NORMAL
X-TOI-MSGID: 163b4a82-15dd-45a1-8713-a8997d3b6068
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1791279990; i=f_l_k@t-online.de;
	bh=8CcGK0a2HL5Nt+mnjTAuShA8qvCR00WKtGDMTfjdtyU=;
	h=From:To:Subject:Date;
	b=bHpH4A6Xzilx4PYiP44Wlmnqsg9yX//BBsJBOaS6xK0Obdu7qtWVjgvVuOcc6MYoe
	 tIbAZn11NIKfAeCGLGHoNShpBJAM9kjsSsnTB5qZZGmTvX9m95ExnX9YLj76hOAQq5
	 3C+AxQL3rAvhQjsb34GDYYIBqGyhNRVRc8e0prWHP8VX69u26OCxIqUr1schL1GaVQ
	 USDSyZ7tQJI8zsc73A9nbQtwNMnoq6Hv4MM1gpzfxsmjQQLbNwADYe/wqaPGC7esaE
	 H163BEoUtqmXfy6B9Wvffl63/q/BTIdiA+5yZtfLX5PttV23EjWtR+diqckpb+eHP7
	 WdHJUvF2960zw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2026 09:46:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130632

ibus bundles ax_prog_cc_for_build.m4 serial 21, which does not rename
the ac_cv_prog_cc_c23 cache variable of autoconf 2.73. CC_FOR_BUILD then
takes the option of the cross compiler: with clang it becomes
"gcc -std=3Dgnu23", which GCC 13 and older reject when unicode-parser is
built. Update the macro to serial 26 from autoconf-archive.

Upstream-Status: Pending

Tested by building ibus for x86-64 with ac_cv_prog_cc_c23=3D-std=3Dgnu23
preset for the target compiler; CC_FOR_BUILD is plain gcc.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ax_prog_cc_for_build.m4-to-serial-26.patch | 178 ++++++++++++++++++
 .../recipes-support/ibus/ibus_1.5.34.bb       |   1 +
 2 files changed, 179 insertions(+)
 create mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-m4-update-a=
x_prog_cc_for_build.m4-to-serial-26.patch

diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-m4-update-ax_prog_=
cc_for_build.m4-to-serial-26.patch b/meta-gnome/recipes-support/ibus/ibus=
/0001-m4-update-ax_prog_cc_for_build.m4-to-serial-26.patch
new file mode 100644
index 0000000000..5029d9a86c
--- /dev/null
+++ b/meta-gnome/recipes-support/ibus/ibus/0001-m4-update-ax_prog_cc_for_=
build.m4-to-serial-26.patch
@@ -0,0 +1,178 @@
+From 14547094541136957eee60bd6665263c0a69f17c Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Tue, 6 Oct 2026 11:13:24 +0200
+Subject: [PATCH] m4: update ax_prog_cc_for_build.m4 to serial 26
+
+Serial 21 renames the cache variables of AC_PROG_CC only up to
+ac_cv_prog_cc_c11. Autoconf 2.73 adds ac_cv_prog_cc_c23, so the build
+compiler inherits the result of the host compiler. When the host
+compiler needs -std=3Dgnu23, CC_FOR_BUILD becomes "gcc -std=3Dgnu23" and
+fails with GCC 13 and older.
+
+Serial 26 from autoconf-archive also renames ac_cv_prog_cc_c23.
+
+Upstream-Status: Pending
+---
+ m4/ax_prog_cc_for_build.m4 | 78 ++++++++++++++++++++++++--------------
+ 1 file changed, 49 insertions(+), 29 deletions(-)
+
+diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
+index 1db8d73f..4d1de993 100644
+--- a/m4/ax_prog_cc_for_build.m4
++++ b/m4/ax_prog_cc_for_build.m4
+@@ -32,7 +32,7 @@
+ #   and this notice are preserved. This file is offered as-is, without =
any
+ #   warranty.
+=20
+-#serial 21
++#serial 26
+=20
+ AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
+ AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
+@@ -43,16 +43,16 @@ AC_REQUIRE([AC_CANONICAL_BUILD])dnl
+ dnl Use the standard macros, but make them use other variable names
+ dnl
+ pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
++pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
+ pushdef([ac_cv_prog_cc_c89], ac_cv_build_prog_cc_c89)dnl
+ pushdef([ac_cv_prog_cc_c99], ac_cv_build_prog_cc_c99)dnl
+ pushdef([ac_cv_prog_cc_c11], ac_cv_build_prog_cc_c11)dnl
+-pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
++pushdef([ac_cv_prog_cc_c23], ac_cv_build_prog_cc_c23)dnl
++pushdef([ac_cv_prog_cc_stdc], ac_cv_build_prog_cc_stdc)dnl
+ pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
+ pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
+ pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
+-pushdef([ac_cv_c_compiler_gnu], ac_cv_build_c_compiler_gnu)dnl
+-pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
+-pushdef([ac_cv_objext], ac_cv_build_objext)dnl
++pushdef([ac_prog_cc_stdc], ac_build_prog_cc_stdc)dnl
+ pushdef([ac_exeext], ac_build_exeext)dnl
+ pushdef([ac_objext], ac_build_objext)dnl
+ pushdef([CC], CC_FOR_BUILD)dnl
+@@ -60,9 +60,7 @@ pushdef([CPP], CPP_FOR_BUILD)dnl
+ pushdef([GCC], GCC_FOR_BUILD)dnl
+ pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
+ pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
+-pushdef([EXEEXT], BUILD_EXEEXT)dnl
+ pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
+-pushdef([OBJEXT], BUILD_OBJEXT)dnl
+ pushdef([host], build)dnl
+ pushdef([host_alias], build_alias)dnl
+ pushdef([host_cpu], build_cpu)dnl
+@@ -77,6 +75,32 @@ pushdef([ac_tool_prefix], ac_build_tool_prefix)dnl
+ pushdef([am_cv_CC_dependencies_compiler_type], am_cv_build_CC_dependenc=
ies_compiler_type)dnl
+ pushdef([am_cv_prog_cc_c_o], am_cv_build_prog_cc_c_o)dnl
+ pushdef([cross_compiling], cross_compiling_build)dnl
++dnl
++dnl These variables are problematic to rename by M4 macros, so we save
++dnl their values in alternative names, and restore the values later.
++dnl
++dnl _AC_COMPILER_EXEEXT and _AC_COMPILER_OBJEXT internally call
++dnl AC_SUBST which prevents the renaming of EXEEXT and OBJEXT
++dnl variables. It's not a good idea to rename ac_cv_exeext and
++dnl ac_cv_objext either as they're related.
++dnl Renaming ac_exeext and ac_objext is safe though.
++dnl
++ac_cv_host_exeext=3D$ac_cv_exeext
++AS_VAR_SET_IF([ac_cv_build_exeext],
++  [ac_cv_exeext=3D$ac_cv_build_exeext],
++  [AS_UNSET([ac_cv_exeext])])
++ac_cv_host_objext=3D$ac_cv_objext
++AS_VAR_SET_IF([ac_cv_build_objext],
++  [ac_cv_objext=3D$ac_cv_build_objext],
++  [AS_UNSET([ac_cv_objext])])
++dnl
++dnl ac_cv_c_compiler_gnu is used in _AC_LANG_COMPILER_GNU (called by
++dnl AC_PROG_CC) indirectly.
++dnl
++ac_cv_host_c_compiler_gnu=3D$ac_cv_c_compiler_gnu
++AS_VAR_SET_IF([ac_cv_build_c_compiler_gnu],
++  [ac_cv_c_compiler_gnu=3D$ac_cv_build_c_compiler_gnu],
++  [AS_UNSET([ac_cv_c_compiler_gnu])])
+=20
+ cross_compiling_build=3Dno
+=20
+@@ -85,25 +109,14 @@ AS_IF([test -n "$build"],      [ac_build_tool_prefi=
x=3D"$build-"],
+       [test -n "$build_alias"],[ac_build_tool_prefix=3D"$build_alias-"]=
)
+=20
+ AC_LANG_PUSH([C])
+-
+-dnl The pushdef([ac_cv_c_compiler_gnu], ...) currently does not cover
+-dnl the use of this variable in _AC_LANG_COMPILER_GNU called by
+-dnl AC_PROG_CC. Unset this cache variable temporarily as a workaround.
+-was_set_c_compiler_gnu=3D${[ac_cv_c_compiler_gnu]+y}
+-AS_IF([test ${was_set_c_compiler_gnu}],
+-    [saved_c_compiler_gnu=3D$[ac_cv_c_compiler_gnu]
+-    AS_UNSET([[ac_cv_c_compiler_gnu]])])
+-
+ AC_PROG_CC
+-
+-dnl Restore ac_cv_c_compiler_gnu
+-AS_IF([test ${was_set_c_compiler_gnu}],
+-  [[ac_cv_c_compiler_gnu]=3D$[saved_c_compiler_gnu]])
+-
+ _AC_COMPILER_EXEEXT
+ _AC_COMPILER_OBJEXT
+ AC_PROG_CPP
+=20
++BUILD_EXEEXT=3D$ac_cv_exeext
++BUILD_OBJEXT=3D$ac_cv_objext
++
+ dnl Restore the old definitions
+ dnl
+ popdef([cross_compiling])dnl
+@@ -120,9 +133,7 @@ popdef([host_vendor])dnl
+ popdef([host_cpu])dnl
+ popdef([host_alias])dnl
+ popdef([host])dnl
+-popdef([OBJEXT])dnl
+ popdef([LDFLAGS])dnl
+-popdef([EXEEXT])dnl
+ popdef([CPPFLAGS])dnl
+ popdef([CFLAGS])dnl
+ popdef([GCC])dnl
+@@ -130,25 +141,34 @@ popdef([CPP])dnl
+ popdef([CC])dnl
+ popdef([ac_objext])dnl
+ popdef([ac_exeext])dnl
+-popdef([ac_cv_objext])dnl
+-popdef([ac_cv_exeext])dnl
+-popdef([ac_cv_c_compiler_gnu])dnl
++popdef([ac_prog_cc_stdc])dnl
+ popdef([ac_cv_prog_cc_g])dnl
+ popdef([ac_cv_prog_cc_cross])dnl
+ popdef([ac_cv_prog_cc_works])dnl
++popdef([ac_cv_prog_cc_stdc])dnl
++popdef([ac_cv_prog_cc_c23])dnl
++popdef([ac_cv_prog_cc_c11])dnl
++popdef([ac_cv_prog_cc_c99])dnl
+ popdef([ac_cv_prog_cc_c89])dnl
+ popdef([ac_cv_prog_gcc])dnl
+ popdef([ac_cv_prog_CPP])dnl
++dnl
++ac_cv_exeext=3D$ac_cv_host_exeext
++EXEEXT=3D$ac_cv_host_exeext
++ac_cv_objext=3D$ac_cv_host_objext
++OBJEXT=3D$ac_cv_host_objext
++ac_cv_c_compiler_gnu=3D$ac_cv_host_c_compiler_gnu
++ac_compiler_gnu=3D$ac_cv_host_c_compiler_gnu
+=20
+ dnl restore global variables ac_ext, ac_cpp, ac_compile,
+-dnl ac_link, ac_compiler_gnu (dependant on the current
++dnl ac_link, ac_compiler_gnu (dependent on the current
+ dnl language after popping):
+ AC_LANG_POP([C])
+=20
+ dnl Finally, set Makefile variables
+ dnl
+-AC_SUBST(BUILD_EXEEXT)dnl
+-AC_SUBST(BUILD_OBJEXT)dnl
++AC_SUBST([BUILD_EXEEXT])dnl
++AC_SUBST([BUILD_OBJEXT])dnl
+ AC_SUBST([CFLAGS_FOR_BUILD])dnl
+ AC_SUBST([CPPFLAGS_FOR_BUILD])dnl
+ AC_SUBST([LDFLAGS_FOR_BUILD])dnl
+--=20
+2.55.0
+
diff --git a/meta-gnome/recipes-support/ibus/ibus_1.5.34.bb b/meta-gnome/=
recipes-support/ibus/ibus_1.5.34.bb
index b4d24ed702..b9f2beb7d3 100644
--- a/meta-gnome/recipes-support/ibus/ibus_1.5.34.bb
+++ b/meta-gnome/recipes-support/ibus/ibus_1.5.34.bb
@@ -10,6 +10,7 @@ SRC_URI =3D " \
     file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch=
 \
     file://0001-src-make-an-IBusText-own-an-updated-IBusAttrList-ref.pat=
ch \
     file://0002-src-Fix-IBusAttrList-leak-when-converting-text.patch \
+    file://0001-m4-update-ax_prog_cc_for_build.m4-to-serial-26.patch \
 "
 SRCREV =3D "1f7af28437afd62a6d145bfc81035e698a37411d"
=20
--=20
2.55.0


