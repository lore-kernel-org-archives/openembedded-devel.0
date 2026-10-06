Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06201CA5FFC
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 10:49:46 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42580.1791283783461098958
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2026 03:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=Y5QZndTT;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd90.aul.t-online.de (fwd90.aul.t-online.de [10.223.144.116])
	by mailout11.t-online.de (Postfix) with SMTP id 84ECB1C6C7
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Oct 2026 12:49:08 +0200 (CEST)
Received: from [192.168.178.36] ([84.163.33.153]) by fwd90.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xE2jL-10xNEu0; Tue, 6 Oct 2026 12:49:07 +0200
Date: Tue, 06 Oct 2026 12:49:01 +0200
From: "Markus Volk" <f_l_k@t-online.de>
Subject: Re: [oe] [RFC][meta-gnome][PATCHv2] ibus: upgrade 1.5.34 -> 1.5.35
To: openembedded-devel@lists.openembedded.org
Message-Id: <QDFHMT.PFOWTNG5DUV42@t-online>
In-Reply-To: <18DBEB0375CBE45F.3017527@lists.openembedded.org>
References: <18DBEB0375CBE45F.3017527@lists.openembedded.org>
X-Mailer: net.donnybeelo.Convey/50.2-1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-03TqROyeIPIMmxh4eoEd"
X-TOI-EXPURGATEID: 150726::1791283747-FEFFA9BF-463CB4CE/0/0 CLEAN NORMAL
X-TOI-MSGID: eb5fdc0a-5705-4254-9e44-504403fc0844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1791283748; i=f_l_k@t-online.de;
	bh=Bd3lwnuDu55Dh6FF4UISQTdDrgkGGDVdqyUUKGBekZA=;
	h=Date:From:Subject:To:In-Reply-To:References;
	b=Y5QZndTT/0MR7we6WYB70LK94sjdTjFh6JSTnZKLrEnrL38VmvQ+tLCECb2ua0UJL
	 vq7QlKxo+wzjou5TI3kf/epHwLmzFF1gI2pm8ta7mdgVYYMKD8QmCBJCqR5pisn6VL
	 jAzBiaLfICvEGSPuFjUx3tnuLQs+x+qRxj+F7PhWJeyCjKhojJ8h5B4zs7eXOVKZKy
	 F43xJYPCQN6T6+zX70UoUFQvy7amI9dfjch85w1bb45HKmh67Hrbk4SoLZYKSD2aee
	 uDuXbuPXG9JS5c5dhJ2GaXXrm1tGrKLHHSS/Ii0mM64dwrQPAs7xxgdjgUQegZUKrV
	 zUUIB32bpbEeQ==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2026 10:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130637

--=-03TqROyeIPIMmxh4eoEd
Content-Type: text/plain; charset=iso-8859-1; format=flowed

v2: add missing signoff

On Tue, Oct 6 2026 at 12:47:46 +02:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> 1.5.35 is not released yet; this is built from the 1.5.35-rc1 tag and
> will be resent against the release tag.
> 
> Build with meson, which 1.5.35 ships. The tools that generate the
> compose table and the unicode dictionaries are built for the target 
> and
> run through the meson exe wrapper, so the bundled 
> ax_prog_cc_for_build.m4
> and its patch go away. The compose table is read from libx11's locale
> data in the target sysroot, so libx11-native is no longer needed.
> 
> This needs the oe-core RFC "libx11: stage the X11 locale data in the
> target sysroot" and applies on top of "ibus: let the build compiler 
> find
> its own C standard option".
> 
> Drop the two IBusAttrList backports, which are part of the release, 
> and
> rebase the dbus-launch patch onto the reworked 
> make-dconf-override-db.sh.
> Add a patch that defines pyoverridesdir without pygobject-3.0, which 
> the
> meson summary needs (Upstream-Status: Pending).
> 
> ibus-setup gets the path of the python3 used at build time, so point 
> it
> at ${bindir}/python3.
> 
> Tested by building ibus for x86-64.
> 
> AI-Generated: Uses Claude Code (Claude Opus 5.5)
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...start-dbus-we-do-not-have-dbus-lauch.patch |  10 +-
>  ...ax_prog_cc_for_build.m4-to-serial-26.patch | 178 
> ------------------
>  ...Text-own-an-updated-IBusAttrList-ref.patch |  99 ----------
>  ...ine-pyoverridesdir-without-PyGObject.patch |  26 +++
>  ...usAttrList-leak-when-converting-text.patch | 120 ------------
>  .../recipes-support/ibus/ibus_1.5.34.bb       |  73 -------
>  .../recipes-support/ibus/ibus_1.5.35.bb       |  63 +++++++
>  7 files changed, 94 insertions(+), 475 deletions(-)
>  delete mode 100644 
> meta-gnome/recipes-support/ibus/ibus/0001-m4-update-ax_prog_cc_for_build.m4-to-serial-26.patch
>  delete mode 100644 
> meta-gnome/recipes-support/ibus/ibus/0001-src-make-an-IBusText-own-an-updated-IBusAttrList-ref.patch
>  create mode 100644 
> meta-gnome/recipes-support/ibus/ibus/0002-meson-define-pyoverridesdir-without-PyGObject.patch
>  delete mode 100644 
> meta-gnome/recipes-support/ibus/ibus/0002-src-Fix-IBusAttrList-leak-when-converting-text.patch
>  delete mode 100644 meta-gnome/recipes-support/ibus/ibus_1.5.34.bb
>  create mode 100644 meta-gnome/recipes-support/ibus/ibus_1.5.35.bb
> 
> diff --git 
> a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch 
> b/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
> index 64ad6b0857..1de2353d06 100644
> --- 
> a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
> +++ 
> b/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
> @@ -1,4 +1,4 @@
> -From f567bcbc2108d722faa90afeb03d3a3bcdf5f58b Mon Sep 17 00:00:00 
> 2001
> +From f42b98063fe91efb5be6145e6b5f68b058bf4260 Mon Sep 17 00:00:00 
> 2001
>  From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com 
> <mailto:schnitzeltony@gmail.com>>
>  Date: Fri, 10 May 2019 14:30:08 +0200
>  Subject: [PATCH] Do not try to start dbus - we do not have dbus-lauch
> @@ -14,10 +14,10 @@ Signed-off-by: Andreas M�ller 
> <schnitzeltony@gmail.com>
>   1 file changed, 11 deletions(-)
> 
>  diff --git a/data/dconf/make-dconf-override-db.sh 
> b/data/dconf/make-dconf-override-db.sh
> -index 32cb153..375baa4 100755
> +index fb5890e2..ff7ede4b 100755
>  --- a/data/dconf/make-dconf-override-db.sh
>  +++ b/data/dconf/make-dconf-override-db.sh
> -@@ -12,15 +12,6 @@ export XDG_CACHE_HOME="$TMPDIR/cache"
> +@@ -24,15 +24,6 @@ export XDG_CACHE_HOME="$TMPDIR/cache"
>   export GSETTINGS_SCHEMA_DIR="$TMPDIR/schemas"
>   mkdir -p $XDG_CONFIG_HOME $XDG_CACHE_HOME $GSETTINGS_SCHEMA_DIR
> 
> @@ -31,9 +31,9 @@ index 32cb153..375baa4 100755
>  -}
>  -
>   # in case that schema is not installed on the system
> - glib-compile-schemas --targetdir "$GSETTINGS_SCHEMA_DIR" "$PWD"
> + glib-compile-schemas --targetdir "$GSETTINGS_SCHEMA_DIR" "$SRCDIR"
> 
> -@@ -57,5 +48,3 @@ if [ -d $TMPDIR/cache/gvfs ] ; then
> +@@ -69,5 +60,3 @@ if [ -d $TMPDIR/cache/gvfs ] ; then
>       umount $TMPDIR/cache/gvfs
>   fi
>   rm -rf $TMPDIR
> diff --git 
> a/meta-gnome/recipes-support/ibus/ibus/0001-m4-update-ax_prog_cc_for_build.m4-to-serial-26.patch 
> b/meta-gnome/recipes-support/ibus/ibus/0001-m4-update-ax_prog_cc_for_build.m4-to-serial-26.patch
> deleted file mode 100644
> index 5029d9a86c..0000000000
> --- 
> a/meta-gnome/recipes-support/ibus/ibus/0001-m4-update-ax_prog_cc_for_build.m4-to-serial-26.patch
> +++ /dev/null
> @@ -1,178 +0,0 @@
> -From 14547094541136957eee60bd6665263c0a69f17c Mon Sep 17 00:00:00 
> 2001
> -From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> -Date: Tue, 6 Oct 2026 11:13:24 +0200
> -Subject: [PATCH] m4: update ax_prog_cc_for_build.m4 to serial 26
> -
> -Serial 21 renames the cache variables of AC_PROG_CC only up to
> -ac_cv_prog_cc_c11. Autoconf 2.73 adds ac_cv_prog_cc_c23, so the build
> -compiler inherits the result of the host compiler. When the host
> -compiler needs -std=gnu23, CC_FOR_BUILD becomes "gcc -std=gnu23" and
> -fails with GCC 13 and older.
> -
> -Serial 26 from autoconf-archive also renames ac_cv_prog_cc_c23.
> -
> -Upstream-Status: Pending
> ----
> - m4/ax_prog_cc_for_build.m4 | 78 
> ++++++++++++++++++++++++--------------
> - 1 file changed, 49 insertions(+), 29 deletions(-)
> -
> -diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
> -index 1db8d73f..4d1de993 100644
> ---- a/m4/ax_prog_cc_for_build.m4
> -+++ b/m4/ax_prog_cc_for_build.m4
> -@@ -32,7 +32,7 @@
> - #   and this notice are preserved. This file is offered as-is, 
> without any
> - #   warranty.
> -
> --#serial 21
> -+#serial 26
> -
> - AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
> - AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
> -@@ -43,16 +43,16 @@ AC_REQUIRE([AC_CANONICAL_BUILD])dnl
> - dnl Use the standard macros, but make them use other variable names
> - dnl
> - pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
> -+pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
> - pushdef([ac_cv_prog_cc_c89], ac_cv_build_prog_cc_c89)dnl
> - pushdef([ac_cv_prog_cc_c99], ac_cv_build_prog_cc_c99)dnl
> - pushdef([ac_cv_prog_cc_c11], ac_cv_build_prog_cc_c11)dnl
> --pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
> -+pushdef([ac_cv_prog_cc_c23], ac_cv_build_prog_cc_c23)dnl
> -+pushdef([ac_cv_prog_cc_stdc], ac_cv_build_prog_cc_stdc)dnl
> - pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
> - pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
> - pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
> --pushdef([ac_cv_c_compiler_gnu], ac_cv_build_c_compiler_gnu)dnl
> --pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
> --pushdef([ac_cv_objext], ac_cv_build_objext)dnl
> -+pushdef([ac_prog_cc_stdc], ac_build_prog_cc_stdc)dnl
> - pushdef([ac_exeext], ac_build_exeext)dnl
> - pushdef([ac_objext], ac_build_objext)dnl
> - pushdef([CC], CC_FOR_BUILD)dnl
> -@@ -60,9 +60,7 @@ pushdef([CPP], CPP_FOR_BUILD)dnl
> - pushdef([GCC], GCC_FOR_BUILD)dnl
> - pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
> - pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
> --pushdef([EXEEXT], BUILD_EXEEXT)dnl
> - pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
> --pushdef([OBJEXT], BUILD_OBJEXT)dnl
> - pushdef([host], build)dnl
> - pushdef([host_alias], build_alias)dnl
> - pushdef([host_cpu], build_cpu)dnl
> -@@ -77,6 +75,32 @@ pushdef([ac_tool_prefix], ac_build_tool_prefix)dnl
> - pushdef([am_cv_CC_dependencies_compiler_type], 
> am_cv_build_CC_dependencies_compiler_type)dnl
> - pushdef([am_cv_prog_cc_c_o], am_cv_build_prog_cc_c_o)dnl
> - pushdef([cross_compiling], cross_compiling_build)dnl
> -+dnl
> -+dnl These variables are problematic to rename by M4 macros, so we 
> save
> -+dnl their values in alternative names, and restore the values later.
> -+dnl
> -+dnl _AC_COMPILER_EXEEXT and _AC_COMPILER_OBJEXT internally call
> -+dnl AC_SUBST which prevents the renaming of EXEEXT and OBJEXT
> -+dnl variables. It's not a good idea to rename ac_cv_exeext and
> -+dnl ac_cv_objext either as they're related.
> -+dnl Renaming ac_exeext and ac_objext is safe though.
> -+dnl
> -+ac_cv_host_exeext=$ac_cv_exeext
> -+AS_VAR_SET_IF([ac_cv_build_exeext],
> -+  [ac_cv_exeext=$ac_cv_build_exeext],
> -+  [AS_UNSET([ac_cv_exeext])])
> -+ac_cv_host_objext=$ac_cv_objext
> -+AS_VAR_SET_IF([ac_cv_build_objext],
> -+  [ac_cv_objext=$ac_cv_build_objext],
> -+  [AS_UNSET([ac_cv_objext])])
> -+dnl
> -+dnl ac_cv_c_compiler_gnu is used in _AC_LANG_COMPILER_GNU (called by
> -+dnl AC_PROG_CC) indirectly.
> -+dnl
> -+ac_cv_host_c_compiler_gnu=$ac_cv_c_compiler_gnu
> -+AS_VAR_SET_IF([ac_cv_build_c_compiler_gnu],
> -+  [ac_cv_c_compiler_gnu=$ac_cv_build_c_compiler_gnu],
> -+  [AS_UNSET([ac_cv_c_compiler_gnu])])
> -
> - cross_compiling_build=no
> -
> -@@ -85,25 +109,14 @@ AS_IF([test -n "$build"],      
> [ac_build_tool_prefix="$build-"],
> -       [test -n 
> "$build_alias"],[ac_build_tool_prefix="$build_alias-"])
> -
> - AC_LANG_PUSH([C])
> --
> --dnl The pushdef([ac_cv_c_compiler_gnu], ...) currently does not 
> cover
> --dnl the use of this variable in _AC_LANG_COMPILER_GNU called by
> --dnl AC_PROG_CC. Unset this cache variable temporarily as a 
> workaround.
> --was_set_c_compiler_gnu=${[ac_cv_c_compiler_gnu]+y}
> --AS_IF([test ${was_set_c_compiler_gnu}],
> --    [saved_c_compiler_gnu=$[ac_cv_c_compiler_gnu]
> --    AS_UNSET([[ac_cv_c_compiler_gnu]])])
> --
> - AC_PROG_CC
> --
> --dnl Restore ac_cv_c_compiler_gnu
> --AS_IF([test ${was_set_c_compiler_gnu}],
> --  [[ac_cv_c_compiler_gnu]=$[saved_c_compiler_gnu]])
> --
> - _AC_COMPILER_EXEEXT
> - _AC_COMPILER_OBJEXT
> - AC_PROG_CPP
> -
> -+BUILD_EXEEXT=$ac_cv_exeext
> -+BUILD_OBJEXT=$ac_cv_objext
> -+
> - dnl Restore the old definitions
> - dnl
> - popdef([cross_compiling])dnl
> -@@ -120,9 +133,7 @@ popdef([host_vendor])dnl
> - popdef([host_cpu])dnl
> - popdef([host_alias])dnl
> - popdef([host])dnl
> --popdef([OBJEXT])dnl
> - popdef([LDFLAGS])dnl
> --popdef([EXEEXT])dnl
> - popdef([CPPFLAGS])dnl
> - popdef([CFLAGS])dnl
> - popdef([GCC])dnl
> -@@ -130,25 +141,34 @@ popdef([CPP])dnl
> - popdef([CC])dnl
> - popdef([ac_objext])dnl
> - popdef([ac_exeext])dnl
> --popdef([ac_cv_objext])dnl
> --popdef([ac_cv_exeext])dnl
> --popdef([ac_cv_c_compiler_gnu])dnl
> -+popdef([ac_prog_cc_stdc])dnl
> - popdef([ac_cv_prog_cc_g])dnl
> - popdef([ac_cv_prog_cc_cross])dnl
> - popdef([ac_cv_prog_cc_works])dnl
> -+popdef([ac_cv_prog_cc_stdc])dnl
> -+popdef([ac_cv_prog_cc_c23])dnl
> -+popdef([ac_cv_prog_cc_c11])dnl
> -+popdef([ac_cv_prog_cc_c99])dnl
> - popdef([ac_cv_prog_cc_c89])dnl
> - popdef([ac_cv_prog_gcc])dnl
> - popdef([ac_cv_prog_CPP])dnl
> -+dnl
> -+ac_cv_exeext=$ac_cv_host_exeext
> -+EXEEXT=$ac_cv_host_exeext
> -+ac_cv_objext=$ac_cv_host_objext
> -+OBJEXT=$ac_cv_host_objext
> -+ac_cv_c_compiler_gnu=$ac_cv_host_c_compiler_gnu
> -+ac_compiler_gnu=$ac_cv_host_c_compiler_gnu
> -
> - dnl restore global variables ac_ext, ac_cpp, ac_compile,
> --dnl ac_link, ac_compiler_gnu (dependant on the current
> -+dnl ac_link, ac_compiler_gnu (dependent on the current
> - dnl language after popping):
> - AC_LANG_POP([C])
> -
> - dnl Finally, set Makefile variables
> - dnl
> --AC_SUBST(BUILD_EXEEXT)dnl
> --AC_SUBST(BUILD_OBJEXT)dnl
> -+AC_SUBST([BUILD_EXEEXT])dnl
> -+AC_SUBST([BUILD_OBJEXT])dnl
> - AC_SUBST([CFLAGS_FOR_BUILD])dnl
> - AC_SUBST([CPPFLAGS_FOR_BUILD])dnl
> - AC_SUBST([LDFLAGS_FOR_BUILD])dnl
> ---
> -2.55.0
> -
> diff --git 
> a/meta-gnome/recipes-support/ibus/ibus/0001-src-make-an-IBusText-own-an-updated-IBusAttrList-ref.patch 
> b/meta-gnome/recipes-support/ibus/ibus/0001-src-make-an-IBusText-own-an-updated-IBusAttrList-ref.patch
> deleted file mode 100644
> index b255e889b9..0000000000
> --- 
> a/meta-gnome/recipes-support/ibus/ibus/0001-src-make-an-IBusText-own-an-updated-IBusAttrList-ref.patch
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -From b69a9906acba1111bcb39c654fc885a079fd31f9 Mon Sep 17 00:00:00 
> 2001
> -From: Tianhao Chai <cth451@gmail.com <mailto:cth451@gmail.com>>
> -Date: Wed, 27 May 2026 13:11:28 +0900
> -Subject: [PATCH 1/2] src: make an IBusText own an updated 
> IBusAttrList
> - reference
> -
> -For all usages of IBusAttrList, the list is an owned reference 
> within a
> -IBusText struct. `ibus_panel_convert_text()` and
> -`ibus_input_context_convert_text()` violate the invarient by 
> assigning a
> -**floating** IBusAttrList reference to anIBusText without sinking it.
> -
> -When GJS attempts to create a JS representation of an existing 
> GObject,
> -it unconditionally sinks the incoming reference.[1] For a 
> non-floating
> -reference this up-refs the object.
> -
> -For this floating IBusAttrLit, `g_object_ref_sink` converts it to a
> -strong reference in-place leaving ref-count at 1. At this point the
> -`IBusAttrList` is referenced by both the enclosing `IBusText` and the
> -newly created GJS wrapper. When one of them is ref-downed the object
> -is recycled, leaving the other reference dangling.
> -
> -To fix this we just need to maintain the list as a non-floating ref.
> -We already have a `ibus_text_set_attributes()` that does the intended
> -ref sinking, so just use that instead of manually assigning pointers.
> -
> -[1]: 
> <https://gitlab.gnome.org/GNOME/gjs/-/blob/db450465ab0161e131a92992c2509507aa6152aa/gi/object.cpp#L3597>
> -
> -Closes: #2889
> -
> -Upstream-Status: Backport 
> [<https://github.com/ibus/ibus/commit/5bbe88a1936246185a65f76e58cc85871401e59a>]
> -Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ----
> - src/ibusinputcontext.c | 12 ++++--------
> - src/ibuspanelservice.c | 12 ++++--------
> - 2 files changed, 8 insertions(+), 16 deletions(-)
> -
> -diff --git a/src/ibusinputcontext.c b/src/ibusinputcontext.c
> -index 68d12fb..bdfd166 100644
> ---- a/src/ibusinputcontext.c
> -+++ b/src/ibusinputcontext.c
> -@@ -569,10 +569,8 @@ ibus_input_context_convert_text 
> (IBusInputContext *context,
> -                        text->text, error->message);
> -             g_error_free (error);
> -         }
> --        if (new_attrs) {
> --            g_object_unref (text->attrs);
> --            text->attrs = new_attrs;
> --        }
> -+        if (new_attrs)
> -+            ibus_text_set_attributes (text, new_attrs);
> -         break;
> -     case IBUS_PREEDIT_FORMAT_HINT:
> -         new_attrs = ibus_attr_list_copy_format_to_hint 
> (text->attrs, &error);
> -@@ -581,10 +579,8 @@ ibus_input_context_convert_text 
> (IBusInputContext *context,
> -                        text->text, error->message);
> -             g_error_free (error);
> -         }
> --        if (new_attrs) {
> --            g_object_unref (text->attrs);
> --            text->attrs = new_attrs;
> --        }
> -+        if (new_attrs)
> -+            ibus_text_set_attributes (text, new_attrs);
> -         break;
> -     default:
> -         g_assert_not_reached ();
> -diff --git a/src/ibuspanelservice.c b/src/ibuspanelservice.c
> -index 1622982..f50cea1 100644
> ---- a/src/ibuspanelservice.c
> -+++ b/src/ibuspanelservice.c
> -@@ -1203,10 +1203,8 @@ ibus_panel_convert_text (IBusPanelService 
> *panel,
> -                        text->text, error->message);
> -             g_error_free (error);
> -         }
> --        if (new_attrs) {
> --            g_object_unref (text->attrs);
> --            text->attrs = new_attrs;
> --        }
> -+        if (new_attrs)
> -+            ibus_text_set_attributes (text, new_attrs);
> -         break;
> -     case IBUS_PREEDIT_FORMAT_HINT:
> -         new_attrs = ibus_attr_list_copy_format_to_hint 
> (text->attrs, &error);
> -@@ -1215,10 +1213,8 @@ ibus_panel_convert_text (IBusPanelService 
> *panel,
> -                        text->text, error->message);
> -             g_error_free (error);
> -         }
> --        if (new_attrs) {
> --            g_object_unref (text->attrs);
> --            text->attrs = new_attrs;
> --        }
> -+        if (new_attrs)
> -+            ibus_text_set_attributes (text, new_attrs);
> -         break;
> -     default:
> -         g_assert_not_reached ();
> ---
> -2.55.0
> -
> diff --git 
> a/meta-gnome/recipes-support/ibus/ibus/0002-meson-define-pyoverridesdir-without-PyGObject.patch 
> b/meta-gnome/recipes-support/ibus/ibus/0002-meson-define-pyoverridesdir-without-PyGObject.patch
> new file mode 100644
> index 0000000000..331b60d889
> --- /dev/null
> +++ 
> b/meta-gnome/recipes-support/ibus/ibus/0002-meson-define-pyoverridesdir-without-PyGObject.patch
> @@ -0,0 +1,26 @@
> +From 85ce9c83f919090687adc303fad8d27486574d75 Mon Sep 17 00:00:00 
> 2001
> +From: Markus Volk <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>
> +Date: Tue, 6 Oct 2026 11:38:08 +0200
> +Subject: [PATCH] meson: define pyoverridesdir without PyGObject
> +
> +The summary prints pyoverridesdir, which is only set when 
> pygobject-3.0
> +is found, so meson setup fails with 'Unknown variable name
> +"pyoverridesdir"' when it is not.
> +
> +Upstream-Status: Pending
> +---
> + meson.build | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/meson.build b/meson.build
> +index afcb7544..271737f2 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -237,6 +237,7 @@ endif
> + pygobject_dep = dependency('pygobject-3.0', version: '>= 3.0.0',
> +                            required: false)
> + enable_pygobject = pygobject_dep.found()
> ++pyoverridesdir = ''
> + if enable_pygobject
> +   pyoverridesdir = get_option('python-overrides-dir')
> +   if pyoverridesdir == ''
> diff --git 
> a/meta-gnome/recipes-support/ibus/ibus/0002-src-Fix-IBusAttrList-leak-when-converting-text.patch 
> b/meta-gnome/recipes-support/ibus/ibus/0002-src-Fix-IBusAttrList-leak-when-converting-text.patch
> deleted file mode 100644
> index d714febcef..0000000000
> --- 
> a/meta-gnome/recipes-support/ibus/ibus/0002-src-Fix-IBusAttrList-leak-when-converting-text.patch
> +++ /dev/null
> @@ -1,120 +0,0 @@
> -From a9c89af52127b6c718395e6cd8439e8c92c471b1 Mon Sep 17 00:00:00 
> 2001
> -From: Sebastian Keller <skeller@gnome.org <mailto:skeller@gnome.org>>
> -Date: Thu, 27 Aug 2026 21:07:58 +0200
> -Subject: [PATCH 2/2] src: Fix IBusAttrList leak when converting text
> -
> -After 5bbe88a1 the attribute list set on the text was getting leaked
> -when the list passed to `ibus_attr_list_copy_format_to_*()` had a 
> length
> -of 0. In that case the list is already non-floating before the copy
> -function adds a ref and returns it. This then is passed to
> -`ibus_text_set_attributes()` which calls `g_object_ref_sink()`. Since
> -the list is not floating, this adds another ref that would not be 
> added
> -in the length > 0 case. This surplus ref is causing the list to be
> -leaked.
> -
> -To fix this leak we need to unref the list after calling
> -`ibus_text_set_attributes()`.
> -
> -However in the length > 0 case the new list returned by
> -`ibus_attr_list_copy_format_to_*()` is floating, so this would drop 
> the
> -refcount to 0. To avoid this we need to ensure that if the list is 
> floating the
> -floating ref is sunk before calling `ibus_text_set_attributes()`, so 
> the
> -call to `g_object_ref_sink()` in there adds a ref, such that we can
> -safely unref this after the call to `ibus_text_set_attributes()`.
> -
> -This also keeps the guarantee that the list is not floating anymore
> -after converting text to not regress the issue fixed by 5bbe88a1.
> -
> -Fixes: <https://github.com/ibus/ibus/commit/5bbe88a1>
> -Closes: <https://github.com/ibus/ibus/issues/2941>
> -
> -Upstream-Status: Backport 
> [<https://github.com/ibus/ibus/commit/1a331e695d84fc6bae8f2d11c52d4776df49647b>]
> -Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ----
> - src/ibusinputcontext.c | 20 ++++++++++++++++++--
> - src/ibuspanelservice.c | 20 ++++++++++++++++++--
> - 2 files changed, 36 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/ibusinputcontext.c b/src/ibusinputcontext.c
> -index bdfd166..d0e162f 100644
> ---- a/src/ibusinputcontext.c
> -+++ b/src/ibusinputcontext.c
> -@@ -569,8 +569,16 @@ ibus_input_context_convert_text 
> (IBusInputContext *context,
> -                        text->text, error->message);
> -             g_error_free (error);
> -         }
> --        if (new_attrs)
> -+        if (new_attrs) {
> -+#if GLIB_CHECK_VERSION (2, 70, 0)
> -+            g_object_take_ref (new_attrs);
> -+#else
> -+            if (g_object_is_floating (new_attrs)
> -+                g_object_ref_sink (new_attrs);
> -+#endif
> -             ibus_text_set_attributes (text, new_attrs);
> -+            g_object_unref (new_attrs);
> -+        }
> -         break;
> -     case IBUS_PREEDIT_FORMAT_HINT:
> -         new_attrs = ibus_attr_list_copy_format_to_hint 
> (text->attrs, &error);
> -@@ -579,8 +587,16 @@ ibus_input_context_convert_text 
> (IBusInputContext *context,
> -                        text->text, error->message);
> -             g_error_free (error);
> -         }
> --        if (new_attrs)
> -+        if (new_attrs) {
> -+#if GLIB_CHECK_VERSION (2, 70, 0)
> -+            g_object_take_ref (new_attrs);
> -+#else
> -+            if (g_object_is_floating (new_attrs)
> -+                g_object_ref_sink (new_attrs);
> -+#endif
> -             ibus_text_set_attributes (text, new_attrs);
> -+            g_object_unref (new_attrs);
> -+        }
> -         break;
> -     default:
> -         g_assert_not_reached ();
> -diff --git a/src/ibuspanelservice.c b/src/ibuspanelservice.c
> -index f50cea1..3d59a21 100644
> ---- a/src/ibuspanelservice.c
> -+++ b/src/ibuspanelservice.c
> -@@ -1203,8 +1203,16 @@ ibus_panel_convert_text (IBusPanelService 
> *panel,
> -                        text->text, error->message);
> -             g_error_free (error);
> -         }
> --        if (new_attrs)
> -+        if (new_attrs) {
> -+#if GLIB_CHECK_VERSION (2, 70, 0)
> -+            g_object_take_ref (new_attrs);
> -+#else
> -+            if (g_object_is_floating (new_attrs)
> -+                g_object_ref_sink (new_attrs);
> -+#endif
> -             ibus_text_set_attributes (text, new_attrs);
> -+            g_object_unref (new_attrs);
> -+        }
> -         break;
> -     case IBUS_PREEDIT_FORMAT_HINT:
> -         new_attrs = ibus_attr_list_copy_format_to_hint 
> (text->attrs, &error);
> -@@ -1213,8 +1221,16 @@ ibus_panel_convert_text (IBusPanelService 
> *panel,
> -                        text->text, error->message);
> -             g_error_free (error);
> -         }
> --        if (new_attrs)
> -+        if (new_attrs) {
> -+#if GLIB_CHECK_VERSION (2, 70, 0)
> -+            g_object_take_ref (new_attrs);
> -+#else
> -+            if (g_object_is_floating (new_attrs)
> -+                g_object_ref_sink (new_attrs);
> -+#endif
> -             ibus_text_set_attributes (text, new_attrs);
> -+            g_object_unref (new_attrs);
> -+        }
> -         break;
> -     default:
> -         g_assert_not_reached ();
> ---
> -2.55.0
> -
> diff --git a/meta-gnome/recipes-support/ibus/ibus_1.5.34.bb 
> b/meta-gnome/recipes-support/ibus/ibus_1.5.34.bb
> deleted file mode 100644
> index b9f2beb7d3..0000000000
> --- a/meta-gnome/recipes-support/ibus/ibus_1.5.34.bb
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -SUMMARY = "Intelligent Input Bus for Linux/Unix"
> -HOMEPAGE = "<https://github.com/ibus/ibus/wiki>"
> -LICENSE = "LGPL-2.1-only"
> -LIC_FILES_CHKSUM = 
> "file://COPYING;md5=fbc093901857fcd118f065f900982c24" 
> <file://copying;md5=fbc093901857fcd118f065f900982c24/>
> -
> -DEPENDS = "unicode-ucd libx11-native glib-2.0-native glib-2.0 dbus 
> iso-codes"
> -
> -SRC_URI = " \
> -    
> git://github.com/ibus/ibus.git;branch=main;protocol=https;tag=${PV} \
> -    
> file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch 
> <file://0001-do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch/> 
> \
> -    
> file://0001-src-make-an-IBusText-own-an-updated-IBusAttrList-ref.patch 
> <file://0001-src-make-an-ibustext-own-an-updated-ibusattrlist-ref.patch/> 
> \
> -    file://0002-src-Fix-IBusAttrList-leak-when-converting-text.patch 
> <file://0002-src-fix-ibusattrlist-leak-when-converting-text.patch/> \
> -    file://0001-m4-update-ax_prog_cc_for_build.m4-to-serial-26.patch 
> <file://0001-m4-update-ax_prog_cc_for_build.m4-to-serial-26.patch/> \
> -"
> -SRCREV = "1f7af28437afd62a6d145bfc81035e698a37411d"
> -
> -# brokensep needed as vapi fails to build correctly
> -inherit autotools-brokensep gettext features_check pkgconfig
> -inherit bash-completion gobject-introspection gtk-doc gtk-icon-cache 
> vala
> -
> -PACKAGECONFIG ??= " \
> -    ${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'systemd wayland x11', 
> d)} \
> -    ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>_any('DISTRO_FEATURES', [ 'wayland', 
> 'x11' ], 'gtk3 gtk4', '', d)} \
> -    ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11', 'libnotify', 
> '', d)} \
> -    dconf vala \
> -"
> -PACKAGECONFIG[appindicator] = 
> "--enable-appindicator,--disable-appindicator,qtbase"
> -PACKAGECONFIG[dconf] = "--enable-dconf,--disable-dconf,dconf"
> -PACKAGECONFIG[gtk2] = "--enable-gtk2,--disable-gtk2,gtk+"
> -PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3,gtk+3"
> -PACKAGECONFIG[gtk4] = "--enable-gtk4,--disable-gtk4,gtk4"
> -PACKAGECONFIG[libnotify] = 
> "--enable-libnotify,--disable-libnotify,libnotify"
> -PACKAGECONFIG[systemd] = 
> "--enable-systemd-services,--disable-systemd-services,systemd"
> -PACKAGECONFIG[wayland]  = 
> "--enable-wayland,--disable-wayland,wayland"
> -PACKAGECONFIG[vala]  = "--enable-vala,--disable-vala"
> -PACKAGECONFIG[x11]  = "--enable-xim --enable-ui,--disable-xim 
> --disable-ui,virtual/libx11"
> -
> -EXTRA_OECONF = " \
> -    --disable-tests \
> -    --disable-emoji-dict \
> -    --disable-python2 \
> -    --with-python=${bindir}/python3 \
> -    --with-ucd-dir=${STAGING_DATADIR}/unicode/ucd \
> -"
> -
> -do_configure:prepend() {
> -    touch ${S}/ChangeLog ${S}/ABOUT-NLS
> -    # Remove vapigen.m4 bundled with sources so that the one shipped 
> by vala is used instead.
> -    rm -f ${S}/m4/vapigen.m4
> -}
> -
> -do_compile:prepend() {
> -    export GIR_EXTRA_LIBS_PATH="${B}/src/.libs"
> -    cp ${STAGING_DATADIR_NATIVE}/X11/locale/en_US.UTF-8/Compose 
> ${B}/src/Compose
> -}
> -
> -FILES:${PN} += " \
> -    ${datadir}/dbus-1 \
> -    ${datadir}/GConf \
> -    ${datadir}/glib-2.0 \
> -    ${libdir}/gtk-2.0 \
> -    ${libdir}/gtk-3.0 \
> -    ${libdir}/gtk-4.0 \
> -    ${systemd_user_unitdir} \
> -"
> -
> -FILES:${PN}-dev += " \
> -    ${datadir}/gettext \
> -"
> -
> -RDEPENDS:${PN} += "python3-core"
> -
> -REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'gtk4', 'opengl', '', 
> d)}"
> diff --git a/meta-gnome/recipes-support/ibus/ibus_1.5.35.bb 
> b/meta-gnome/recipes-support/ibus/ibus_1.5.35.bb
> new file mode 100644
> index 0000000000..2bd860a46a
> --- /dev/null
> +++ b/meta-gnome/recipes-support/ibus/ibus_1.5.35.bb
> @@ -0,0 +1,63 @@
> +SUMMARY = "Intelligent Input Bus for Linux/Unix"
> +HOMEPAGE = "<https://github.com/ibus/ibus/wiki>"
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=fbc093901857fcd118f065f900982c24" 
> <file://copying;md5=fbc093901857fcd118f065f900982c24/>
> +
> +DEPENDS = "unicode-ucd libx11 glib-2.0-native glib-2.0 dbus 
> iso-codes"
> +
> +SRC_URI = " \
> +    
> git://github.com/ibus/ibus.git;branch=main;protocol=https;tag=${PV}-rc1 
> \
> +    
> file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch 
> <file://0001-do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch/> 
> \
> +    file://0002-meson-define-pyoverridesdir-without-PyGObject.patch 
> <file://0002-meson-define-pyoverridesdir-without-pygobject.patch/> \
> +"
> +SRCREV = "d464316d9b9613005c5573a010fec7f9b40b93b6"
> +
> +inherit meson gettext features_check pkgconfig python3native
> +inherit bash-completion gobject-introspection gtk-doc gtk-icon-cache 
> vala
> +
> +PACKAGECONFIG ??= " \
> +    ${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'systemd wayland x11', 
> d)} \
> +    ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>_any('DISTRO_FEATURES', [ 'wayland', 
> 'x11' ], 'gtk3 gtk4', '', d)} \
> +    ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11', 'libnotify', 
> '', d)} \
> +    dconf vala \
> +"
> +PACKAGECONFIG[appindicator] = 
> "-Dappindicator=true,-Dappindicator=false,qtbase"
> +PACKAGECONFIG[dconf] = "-Ddconf=enabled,-Ddconf=disabled,dconf"
> +PACKAGECONFIG[gtk2] = "-Dgtk2=enabled,-Dgtk2=disabled,gtk+"
> +PACKAGECONFIG[gtk3] = "-Dgtk3=true,-Dgtk3=false,gtk+3"
> +PACKAGECONFIG[gtk4] = "-Dgtk4=true,-Dgtk4=false,gtk4"
> +PACKAGECONFIG[libnotify] = 
> "-Dlibnotify=true,-Dlibnotify=false,libnotify"
> +PACKAGECONFIG[systemd] = 
> "-Dsystemd-services=enabled,-Dsystemd-services=disabled,systemd"
> +PACKAGECONFIG[wayland] = 
> "-Dwayland=enabled,-Dwayland=disabled,wayland wayland-native"
> +PACKAGECONFIG[vala] = "-Dvapi=enabled,-Dvapi=disabled"
> +PACKAGECONFIG[x11] = "-Dxim=enabled -Dui=true,-Dxim=disabled 
> -Dui=false,virtual/libx11"
> +
> +GTKDOC_MESON_OPTION = "gtk-doc"
> +
> +EXTRA_OEMESON = " \
> +    -Dtests=false \
> +    -Demoji-dict=false \
> +    -Ducd-dir=${STAGING_DATADIR}/unicode/ucd \
> +"
> +
> +do_install:append() {
> +    sed -i -e 's|${PYTHON}|${bindir}/python3|' 
> ${D}${bindir}/ibus-setup
> +}
> +
> +FILES:${PN} += " \
> +    ${datadir}/dbus-1 \
> +    ${datadir}/GConf \
> +    ${datadir}/glib-2.0 \
> +    ${libdir}/gtk-2.0 \
> +    ${libdir}/gtk-3.0 \
> +    ${libdir}/gtk-4.0 \
> +    ${systemd_user_unitdir} \
> +"
> +
> +FILES:${PN}-dev += " \
> +    ${datadir}/gettext \
> +"
> +
> +RDEPENDS:${PN} += "python3-core"
> +
> +REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'gtk4', 'opengl', '', 
> d)}"
> --
> 2.55.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130636): 
> <https://lists.openembedded.org/g/openembedded-devel/message/130636>
> Mute This Topic: <https://lists.openembedded.org/mt/121607584/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-03TqROyeIPIMmxh4eoEd
Content-Type: text/html; charset=iso-8859-1

<div id="convey-body" dir="auto">v2: add missing signoff</div><div id="convey-quote" dir="auto"><br>On Tue, Oct 6 2026 at 12:47:46 +02:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">1.5.35 is not released yet; this is built from the 1.5.35-rc1 tag and
will be resent against the release tag.

Build with meson, which 1.5.35 ships. The tools that generate the
compose table and the unicode dictionaries are built for the target and
run through the meson exe wrapper, so the bundled ax_prog_cc_for_build.m4
and its patch go away. The compose table is read from libx11's locale
data in the target sysroot, so libx11-native is no longer needed.

This needs the oe-core RFC "libx11: stage the X11 locale data in the
target sysroot" and applies on top of "ibus: let the build compiler find
its own C standard option".

Drop the two IBusAttrList backports, which are part of the release, and
rebase the dbus-launch patch onto the reworked make-dconf-override-db.sh.
Add a patch that defines pyoverridesdir without pygobject-3.0, which the
meson summary needs (Upstream-Status: Pending).

ibus-setup gets the path of the python3 used at build time, so point it
at ${bindir}/python3.

Tested by building ibus for x86-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...start-dbus-we-do-not-have-dbus-lauch.patch |  10 +-
 ...ax_prog_cc_for_build.m4-to-serial-26.patch | 178 ------------------
 ...Text-own-an-updated-IBusAttrList-ref.patch |  99 ----------
 ...ine-pyoverridesdir-without-PyGObject.patch |  26 +++
 ...usAttrList-leak-when-converting-text.patch | 120 ------------
 .../recipes-support/ibus/ibus_1.5.34.bb       |  73 -------
 .../recipes-support/ibus/ibus_1.5.35.bb       |  63 +++++++
 7 files changed, 94 insertions(+), 475 deletions(-)
 delete mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-m4-update-ax_prog_cc_for_build.m4-to-serial-26.patch
 delete mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-src-make-an-IBusText-own-an-updated-IBusAttrList-ref.patch
 create mode 100644 meta-gnome/recipes-support/ibus/ibus/0002-meson-define-pyoverridesdir-without-PyGObject.patch
 delete mode 100644 meta-gnome/recipes-support/ibus/ibus/0002-src-Fix-IBusAttrList-leak-when-converting-text.patch
 delete mode 100644 meta-gnome/recipes-support/ibus/ibus_1.5.34.bb
 create mode 100644 meta-gnome/recipes-support/ibus/ibus_1.5.35.bb

diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch b/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
index 64ad6b0857..1de2353d06 100644
--- a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
+++ b/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch
@@ -1,4 +1,4 @@
-From f567bcbc2108d722faa90afeb03d3a3bcdf5f58b Mon Sep 17 00:00:00 2001
+From f42b98063fe91efb5be6145e6b5f68b058bf4260 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= &lt;<a href="mailto:schnitzeltony@gmail.com">schnitzeltony@gmail.com</a>&gt;
 Date: Fri, 10 May 2019 14:30:08 +0200
 Subject: [PATCH] Do not try to start dbus - we do not have dbus-lauch
@@ -14,10 +14,10 @@ Signed-off-by: Andreas M�ller &lt;schnitzeltony@gmail.com&gt;
  1 file changed, 11 deletions(-)
 
 diff --git a/data/dconf/make-dconf-override-db.sh b/data/dconf/make-dconf-override-db.sh
-index 32cb153..375baa4 100755
+index fb5890e2..ff7ede4b 100755
 --- a/data/dconf/make-dconf-override-db.sh
 +++ b/data/dconf/make-dconf-override-db.sh
-@@ -12,15 +12,6 @@ export XDG_CACHE_HOME="$TMPDIR/cache"
+@@ -24,15 +24,6 @@ export XDG_CACHE_HOME="$TMPDIR/cache"
  export GSETTINGS_SCHEMA_DIR="$TMPDIR/schemas"
  mkdir -p $XDG_CONFIG_HOME $XDG_CACHE_HOME $GSETTINGS_SCHEMA_DIR
  
@@ -31,9 +31,9 @@ index 32cb153..375baa4 100755
 -}
 -
  # in case that schema is not installed on the system
- glib-compile-schemas --targetdir "$GSETTINGS_SCHEMA_DIR" "$PWD"
+ glib-compile-schemas --targetdir "$GSETTINGS_SCHEMA_DIR" "$SRCDIR"
  
-@@ -57,5 +48,3 @@ if [ -d $TMPDIR/cache/gvfs ] ; then
+@@ -69,5 +60,3 @@ if [ -d $TMPDIR/cache/gvfs ] ; then
      umount $TMPDIR/cache/gvfs
  fi
  rm -rf $TMPDIR
diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-m4-update-ax_prog_cc_for_build.m4-to-serial-26.patch b/meta-gnome/recipes-support/ibus/ibus/0001-m4-update-ax_prog_cc_for_build.m4-to-serial-26.patch
deleted file mode 100644
index 5029d9a86c..0000000000
--- a/meta-gnome/recipes-support/ibus/ibus/0001-m4-update-ax_prog_cc_for_build.m4-to-serial-26.patch
+++ /dev/null
@@ -1,178 +0,0 @@
-From 14547094541136957eee60bd6665263c0a69f17c Mon Sep 17 00:00:00 2001
-From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
-Date: Tue, 6 Oct 2026 11:13:24 +0200
-Subject: [PATCH] m4: update ax_prog_cc_for_build.m4 to serial 26
-
-Serial 21 renames the cache variables of AC_PROG_CC only up to
-ac_cv_prog_cc_c11. Autoconf 2.73 adds ac_cv_prog_cc_c23, so the build
-compiler inherits the result of the host compiler. When the host
-compiler needs -std=gnu23, CC_FOR_BUILD becomes "gcc -std=gnu23" and
-fails with GCC 13 and older.
-
-Serial 26 from autoconf-archive also renames ac_cv_prog_cc_c23.
-
-Upstream-Status: Pending
----
- m4/ax_prog_cc_for_build.m4 | 78 ++++++++++++++++++++++++--------------
- 1 file changed, 49 insertions(+), 29 deletions(-)
-
-diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
-index 1db8d73f..4d1de993 100644
---- a/m4/ax_prog_cc_for_build.m4
-+++ b/m4/ax_prog_cc_for_build.m4
-@@ -32,7 +32,7 @@
- #   and this notice are preserved. This file is offered as-is, without any
- #   warranty.
- 
--#serial 21
-+#serial 26
- 
- AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
- AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
-@@ -43,16 +43,16 @@ AC_REQUIRE([AC_CANONICAL_BUILD])dnl
- dnl Use the standard macros, but make them use other variable names
- dnl
- pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
-+pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
- pushdef([ac_cv_prog_cc_c89], ac_cv_build_prog_cc_c89)dnl
- pushdef([ac_cv_prog_cc_c99], ac_cv_build_prog_cc_c99)dnl
- pushdef([ac_cv_prog_cc_c11], ac_cv_build_prog_cc_c11)dnl
--pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
-+pushdef([ac_cv_prog_cc_c23], ac_cv_build_prog_cc_c23)dnl
-+pushdef([ac_cv_prog_cc_stdc], ac_cv_build_prog_cc_stdc)dnl
- pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
- pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
- pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
--pushdef([ac_cv_c_compiler_gnu], ac_cv_build_c_compiler_gnu)dnl
--pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
--pushdef([ac_cv_objext], ac_cv_build_objext)dnl
-+pushdef([ac_prog_cc_stdc], ac_build_prog_cc_stdc)dnl
- pushdef([ac_exeext], ac_build_exeext)dnl
- pushdef([ac_objext], ac_build_objext)dnl
- pushdef([CC], CC_FOR_BUILD)dnl
-@@ -60,9 +60,7 @@ pushdef([CPP], CPP_FOR_BUILD)dnl
- pushdef([GCC], GCC_FOR_BUILD)dnl
- pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
- pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
--pushdef([EXEEXT], BUILD_EXEEXT)dnl
- pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
--pushdef([OBJEXT], BUILD_OBJEXT)dnl
- pushdef([host], build)dnl
- pushdef([host_alias], build_alias)dnl
- pushdef([host_cpu], build_cpu)dnl
-@@ -77,6 +75,32 @@ pushdef([ac_tool_prefix], ac_build_tool_prefix)dnl
- pushdef([am_cv_CC_dependencies_compiler_type], am_cv_build_CC_dependencies_compiler_type)dnl
- pushdef([am_cv_prog_cc_c_o], am_cv_build_prog_cc_c_o)dnl
- pushdef([cross_compiling], cross_compiling_build)dnl
-+dnl
-+dnl These variables are problematic to rename by M4 macros, so we save
-+dnl their values in alternative names, and restore the values later.
-+dnl
-+dnl _AC_COMPILER_EXEEXT and _AC_COMPILER_OBJEXT internally call
-+dnl AC_SUBST which prevents the renaming of EXEEXT and OBJEXT
-+dnl variables. It's not a good idea to rename ac_cv_exeext and
-+dnl ac_cv_objext either as they're related.
-+dnl Renaming ac_exeext and ac_objext is safe though.
-+dnl
-+ac_cv_host_exeext=$ac_cv_exeext
-+AS_VAR_SET_IF([ac_cv_build_exeext],
-+  [ac_cv_exeext=$ac_cv_build_exeext],
-+  [AS_UNSET([ac_cv_exeext])])
-+ac_cv_host_objext=$ac_cv_objext
-+AS_VAR_SET_IF([ac_cv_build_objext],
-+  [ac_cv_objext=$ac_cv_build_objext],
-+  [AS_UNSET([ac_cv_objext])])
-+dnl
-+dnl ac_cv_c_compiler_gnu is used in _AC_LANG_COMPILER_GNU (called by
-+dnl AC_PROG_CC) indirectly.
-+dnl
-+ac_cv_host_c_compiler_gnu=$ac_cv_c_compiler_gnu
-+AS_VAR_SET_IF([ac_cv_build_c_compiler_gnu],
-+  [ac_cv_c_compiler_gnu=$ac_cv_build_c_compiler_gnu],
-+  [AS_UNSET([ac_cv_c_compiler_gnu])])
- 
- cross_compiling_build=no
- 
-@@ -85,25 +109,14 @@ AS_IF([test -n "$build"],      [ac_build_tool_prefix="$build-"],
-       [test -n "$build_alias"],[ac_build_tool_prefix="$build_alias-"])
- 
- AC_LANG_PUSH([C])
--
--dnl The pushdef([ac_cv_c_compiler_gnu], ...) currently does not cover
--dnl the use of this variable in _AC_LANG_COMPILER_GNU called by
--dnl AC_PROG_CC. Unset this cache variable temporarily as a workaround.
--was_set_c_compiler_gnu=${[ac_cv_c_compiler_gnu]+y}
--AS_IF([test ${was_set_c_compiler_gnu}],
--    [saved_c_compiler_gnu=$[ac_cv_c_compiler_gnu]
--    AS_UNSET([[ac_cv_c_compiler_gnu]])])
--
- AC_PROG_CC
--
--dnl Restore ac_cv_c_compiler_gnu
--AS_IF([test ${was_set_c_compiler_gnu}],
--  [[ac_cv_c_compiler_gnu]=$[saved_c_compiler_gnu]])
--
- _AC_COMPILER_EXEEXT
- _AC_COMPILER_OBJEXT
- AC_PROG_CPP
- 
-+BUILD_EXEEXT=$ac_cv_exeext
-+BUILD_OBJEXT=$ac_cv_objext
-+
- dnl Restore the old definitions
- dnl
- popdef([cross_compiling])dnl
-@@ -120,9 +133,7 @@ popdef([host_vendor])dnl
- popdef([host_cpu])dnl
- popdef([host_alias])dnl
- popdef([host])dnl
--popdef([OBJEXT])dnl
- popdef([LDFLAGS])dnl
--popdef([EXEEXT])dnl
- popdef([CPPFLAGS])dnl
- popdef([CFLAGS])dnl
- popdef([GCC])dnl
-@@ -130,25 +141,34 @@ popdef([CPP])dnl
- popdef([CC])dnl
- popdef([ac_objext])dnl
- popdef([ac_exeext])dnl
--popdef([ac_cv_objext])dnl
--popdef([ac_cv_exeext])dnl
--popdef([ac_cv_c_compiler_gnu])dnl
-+popdef([ac_prog_cc_stdc])dnl
- popdef([ac_cv_prog_cc_g])dnl
- popdef([ac_cv_prog_cc_cross])dnl
- popdef([ac_cv_prog_cc_works])dnl
-+popdef([ac_cv_prog_cc_stdc])dnl
-+popdef([ac_cv_prog_cc_c23])dnl
-+popdef([ac_cv_prog_cc_c11])dnl
-+popdef([ac_cv_prog_cc_c99])dnl
- popdef([ac_cv_prog_cc_c89])dnl
- popdef([ac_cv_prog_gcc])dnl
- popdef([ac_cv_prog_CPP])dnl
-+dnl
-+ac_cv_exeext=$ac_cv_host_exeext
-+EXEEXT=$ac_cv_host_exeext
-+ac_cv_objext=$ac_cv_host_objext
-+OBJEXT=$ac_cv_host_objext
-+ac_cv_c_compiler_gnu=$ac_cv_host_c_compiler_gnu
-+ac_compiler_gnu=$ac_cv_host_c_compiler_gnu
- 
- dnl restore global variables ac_ext, ac_cpp, ac_compile,
--dnl ac_link, ac_compiler_gnu (dependant on the current
-+dnl ac_link, ac_compiler_gnu (dependent on the current
- dnl language after popping):
- AC_LANG_POP([C])
- 
- dnl Finally, set Makefile variables
- dnl
--AC_SUBST(BUILD_EXEEXT)dnl
--AC_SUBST(BUILD_OBJEXT)dnl
-+AC_SUBST([BUILD_EXEEXT])dnl
-+AC_SUBST([BUILD_OBJEXT])dnl
- AC_SUBST([CFLAGS_FOR_BUILD])dnl
- AC_SUBST([CPPFLAGS_FOR_BUILD])dnl
- AC_SUBST([LDFLAGS_FOR_BUILD])dnl
--- 
-2.55.0
-
diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-src-make-an-IBusText-own-an-updated-IBusAttrList-ref.patch b/meta-gnome/recipes-support/ibus/ibus/0001-src-make-an-IBusText-own-an-updated-IBusAttrList-ref.patch
deleted file mode 100644
index b255e889b9..0000000000
--- a/meta-gnome/recipes-support/ibus/ibus/0001-src-make-an-IBusText-own-an-updated-IBusAttrList-ref.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From b69a9906acba1111bcb39c654fc885a079fd31f9 Mon Sep 17 00:00:00 2001
-From: Tianhao Chai &lt;<a href="mailto:cth451@gmail.com">cth451@gmail.com</a>&gt;
-Date: Wed, 27 May 2026 13:11:28 +0900
-Subject: [PATCH 1/2] src: make an IBusText own an updated IBusAttrList
- reference
-
-For all usages of IBusAttrList, the list is an owned reference within a
-IBusText struct. `ibus_panel_convert_text()` and
-`ibus_input_context_convert_text()` violate the invarient by assigning a
-**floating** IBusAttrList reference to anIBusText without sinking it.
-
-When GJS attempts to create a JS representation of an existing GObject,
-it unconditionally sinks the incoming reference.[1] For a non-floating
-reference this up-refs the object.
-
-For this floating IBusAttrLit, `g_object_ref_sink` converts it to a
-strong reference in-place leaving ref-count at 1. At this point the
-`IBusAttrList` is referenced by both the enclosing `IBusText` and the
-newly created GJS wrapper. When one of them is ref-downed the object
-is recycled, leaving the other reference dangling.
-
-To fix this we just need to maintain the list as a non-floating ref.
-We already have a `ibus_text_set_attributes()` that does the intended
-ref sinking, so just use that instead of manually assigning pointers.
-
-[1]: <a href="https://gitlab.gnome.org/GNOME/gjs/-/blob/db450465ab0161e131a92992c2509507aa6152aa/gi/object.cpp#L3597">https://gitlab.gnome.org/GNOME/gjs/-/blob/db450465ab0161e131a92992c2509507aa6152aa/gi/object.cpp#L3597</a>
-
-Closes: #2889
-
-Upstream-Status: Backport [<a href="https://github.com/ibus/ibus/commit/5bbe88a1936246185a65f76e58cc85871401e59a">https://github.com/ibus/ibus/commit/5bbe88a1936246185a65f76e58cc85871401e59a</a>]
-Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
----
- src/ibusinputcontext.c | 12 ++++--------
- src/ibuspanelservice.c | 12 ++++--------
- 2 files changed, 8 insertions(+), 16 deletions(-)
-
-diff --git a/src/ibusinputcontext.c b/src/ibusinputcontext.c
-index 68d12fb..bdfd166 100644
---- a/src/ibusinputcontext.c
-+++ b/src/ibusinputcontext.c
-@@ -569,10 +569,8 @@ ibus_input_context_convert_text (IBusInputContext *context,
-                        text-&gt;text, error-&gt;message);
-             g_error_free (error);
-         }
--        if (new_attrs) {
--            g_object_unref (text-&gt;attrs);
--            text-&gt;attrs = new_attrs;
--        }
-+        if (new_attrs)
-+            ibus_text_set_attributes (text, new_attrs);
-         break;
-     case IBUS_PREEDIT_FORMAT_HINT:
-         new_attrs = ibus_attr_list_copy_format_to_hint (text-&gt;attrs, &amp;error);
-@@ -581,10 +579,8 @@ ibus_input_context_convert_text (IBusInputContext *context,
-                        text-&gt;text, error-&gt;message);
-             g_error_free (error);
-         }
--        if (new_attrs) {
--            g_object_unref (text-&gt;attrs);
--            text-&gt;attrs = new_attrs;
--        }
-+        if (new_attrs)
-+            ibus_text_set_attributes (text, new_attrs);
-         break;
-     default:
-         g_assert_not_reached ();
-diff --git a/src/ibuspanelservice.c b/src/ibuspanelservice.c
-index 1622982..f50cea1 100644
---- a/src/ibuspanelservice.c
-+++ b/src/ibuspanelservice.c
-@@ -1203,10 +1203,8 @@ ibus_panel_convert_text (IBusPanelService *panel,
-                        text-&gt;text, error-&gt;message);
-             g_error_free (error);
-         }
--        if (new_attrs) {
--            g_object_unref (text-&gt;attrs);
--            text-&gt;attrs = new_attrs;
--        }
-+        if (new_attrs)
-+            ibus_text_set_attributes (text, new_attrs);
-         break;
-     case IBUS_PREEDIT_FORMAT_HINT:
-         new_attrs = ibus_attr_list_copy_format_to_hint (text-&gt;attrs, &amp;error);
-@@ -1215,10 +1213,8 @@ ibus_panel_convert_text (IBusPanelService *panel,
-                        text-&gt;text, error-&gt;message);
-             g_error_free (error);
-         }
--        if (new_attrs) {
--            g_object_unref (text-&gt;attrs);
--            text-&gt;attrs = new_attrs;
--        }
-+        if (new_attrs)
-+            ibus_text_set_attributes (text, new_attrs);
-         break;
-     default:
-         g_assert_not_reached ();
--- 
-2.55.0
-
diff --git a/meta-gnome/recipes-support/ibus/ibus/0002-meson-define-pyoverridesdir-without-PyGObject.patch b/meta-gnome/recipes-support/ibus/ibus/0002-meson-define-pyoverridesdir-without-PyGObject.patch
new file mode 100644
index 0000000000..331b60d889
--- /dev/null
+++ b/meta-gnome/recipes-support/ibus/ibus/0002-meson-define-pyoverridesdir-without-PyGObject.patch
@@ -0,0 +1,26 @@
+From 85ce9c83f919090687adc303fad8d27486574d75 Mon Sep 17 00:00:00 2001
+From: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
+Date: Tue, 6 Oct 2026 11:38:08 +0200
+Subject: [PATCH] meson: define pyoverridesdir without PyGObject
+
+The summary prints pyoverridesdir, which is only set when pygobject-3.0
+is found, so meson setup fails with 'Unknown variable name
+"pyoverridesdir"' when it is not.
+
+Upstream-Status: Pending
+---
+ meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/meson.build b/meson.build
+index afcb7544..271737f2 100644
+--- a/meson.build
++++ b/meson.build
+@@ -237,6 +237,7 @@ endif
+ pygobject_dep = dependency('pygobject-3.0', version: '&gt;= 3.0.0',
+                            required: false)
+ enable_pygobject = pygobject_dep.found()
++pyoverridesdir = ''
+ if enable_pygobject
+   pyoverridesdir = get_option('python-overrides-dir')
+   if pyoverridesdir == ''
diff --git a/meta-gnome/recipes-support/ibus/ibus/0002-src-Fix-IBusAttrList-leak-when-converting-text.patch b/meta-gnome/recipes-support/ibus/ibus/0002-src-Fix-IBusAttrList-leak-when-converting-text.patch
deleted file mode 100644
index d714febcef..0000000000
--- a/meta-gnome/recipes-support/ibus/ibus/0002-src-Fix-IBusAttrList-leak-when-converting-text.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From a9c89af52127b6c718395e6cd8439e8c92c471b1 Mon Sep 17 00:00:00 2001
-From: Sebastian Keller &lt;<a href="mailto:skeller@gnome.org">skeller@gnome.org</a>&gt;
-Date: Thu, 27 Aug 2026 21:07:58 +0200
-Subject: [PATCH 2/2] src: Fix IBusAttrList leak when converting text
-
-After 5bbe88a1 the attribute list set on the text was getting leaked
-when the list passed to `ibus_attr_list_copy_format_to_*()` had a length
-of 0. In that case the list is already non-floating before the copy
-function adds a ref and returns it. This then is passed to
-`ibus_text_set_attributes()` which calls `g_object_ref_sink()`. Since
-the list is not floating, this adds another ref that would not be added
-in the length &gt; 0 case. This surplus ref is causing the list to be
-leaked.
-
-To fix this leak we need to unref the list after calling
-`ibus_text_set_attributes()`.
-
-However in the length &gt; 0 case the new list returned by
-`ibus_attr_list_copy_format_to_*()` is floating, so this would drop the
-refcount to 0. To avoid this we need to ensure that if the list is floating the
-floating ref is sunk before calling `ibus_text_set_attributes()`, so the
-call to `g_object_ref_sink()` in there adds a ref, such that we can
-safely unref this after the call to `ibus_text_set_attributes()`.
-
-This also keeps the guarantee that the list is not floating anymore
-after converting text to not regress the issue fixed by 5bbe88a1.
-
-Fixes: <a href="https://github.com/ibus/ibus/commit/5bbe88a1">https://github.com/ibus/ibus/commit/5bbe88a1</a>
-Closes: <a href="https://github.com/ibus/ibus/issues/2941">https://github.com/ibus/ibus/issues/2941</a>
-
-Upstream-Status: Backport [<a href="https://github.com/ibus/ibus/commit/1a331e695d84fc6bae8f2d11c52d4776df49647b">https://github.com/ibus/ibus/commit/1a331e695d84fc6bae8f2d11c52d4776df49647b</a>]
-Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
----
- src/ibusinputcontext.c | 20 ++++++++++++++++++--
- src/ibuspanelservice.c | 20 ++++++++++++++++++--
- 2 files changed, 36 insertions(+), 4 deletions(-)
-
-diff --git a/src/ibusinputcontext.c b/src/ibusinputcontext.c
-index bdfd166..d0e162f 100644
---- a/src/ibusinputcontext.c
-+++ b/src/ibusinputcontext.c
-@@ -569,8 +569,16 @@ ibus_input_context_convert_text (IBusInputContext *context,
-                        text-&gt;text, error-&gt;message);
-             g_error_free (error);
-         }
--        if (new_attrs)
-+        if (new_attrs) {
-+#if GLIB_CHECK_VERSION (2, 70, 0)
-+            g_object_take_ref (new_attrs);
-+#else
-+            if (g_object_is_floating (new_attrs)
-+                g_object_ref_sink (new_attrs);
-+#endif
-             ibus_text_set_attributes (text, new_attrs);
-+            g_object_unref (new_attrs);
-+        }
-         break;
-     case IBUS_PREEDIT_FORMAT_HINT:
-         new_attrs = ibus_attr_list_copy_format_to_hint (text-&gt;attrs, &amp;error);
-@@ -579,8 +587,16 @@ ibus_input_context_convert_text (IBusInputContext *context,
-                        text-&gt;text, error-&gt;message);
-             g_error_free (error);
-         }
--        if (new_attrs)
-+        if (new_attrs) {
-+#if GLIB_CHECK_VERSION (2, 70, 0)
-+            g_object_take_ref (new_attrs);
-+#else
-+            if (g_object_is_floating (new_attrs)
-+                g_object_ref_sink (new_attrs);
-+#endif
-             ibus_text_set_attributes (text, new_attrs);
-+            g_object_unref (new_attrs);
-+        }
-         break;
-     default:
-         g_assert_not_reached ();
-diff --git a/src/ibuspanelservice.c b/src/ibuspanelservice.c
-index f50cea1..3d59a21 100644
---- a/src/ibuspanelservice.c
-+++ b/src/ibuspanelservice.c
-@@ -1203,8 +1203,16 @@ ibus_panel_convert_text (IBusPanelService *panel,
-                        text-&gt;text, error-&gt;message);
-             g_error_free (error);
-         }
--        if (new_attrs)
-+        if (new_attrs) {
-+#if GLIB_CHECK_VERSION (2, 70, 0)
-+            g_object_take_ref (new_attrs);
-+#else
-+            if (g_object_is_floating (new_attrs)
-+                g_object_ref_sink (new_attrs);
-+#endif
-             ibus_text_set_attributes (text, new_attrs);
-+            g_object_unref (new_attrs);
-+        }
-         break;
-     case IBUS_PREEDIT_FORMAT_HINT:
-         new_attrs = ibus_attr_list_copy_format_to_hint (text-&gt;attrs, &amp;error);
-@@ -1213,8 +1221,16 @@ ibus_panel_convert_text (IBusPanelService *panel,
-                        text-&gt;text, error-&gt;message);
-             g_error_free (error);
-         }
--        if (new_attrs)
-+        if (new_attrs) {
-+#if GLIB_CHECK_VERSION (2, 70, 0)
-+            g_object_take_ref (new_attrs);
-+#else
-+            if (g_object_is_floating (new_attrs)
-+                g_object_ref_sink (new_attrs);
-+#endif
-             ibus_text_set_attributes (text, new_attrs);
-+            g_object_unref (new_attrs);
-+        }
-         break;
-     default:
-         g_assert_not_reached ();
--- 
-2.55.0
-
diff --git a/meta-gnome/recipes-support/ibus/ibus_1.5.34.bb b/meta-gnome/recipes-support/ibus/ibus_1.5.34.bb
deleted file mode 100644
index b9f2beb7d3..0000000000
--- a/meta-gnome/recipes-support/ibus/ibus_1.5.34.bb
+++ /dev/null
@@ -1,73 +0,0 @@
-SUMMARY = "Intelligent Input Bus for Linux/Unix"
-HOMEPAGE = "<a href="https://github.com/ibus/ibus/wiki">https://github.com/ibus/ibus/wiki</a>"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=fbc093901857fcd118f065f900982c24" "="">file://COPYING;md5=fbc093901857fcd118f065f900982c24"</a>
-
-DEPENDS = "unicode-ucd libx11-native glib-2.0-native glib-2.0 dbus iso-codes"
-
-SRC_URI = " \
-    git://github.com/ibus/ibus.git;branch=main;protocol=https;tag=${PV} \
-    <a href="file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch">file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch</a> \
-    <a href="file://0001-src-make-an-IBusText-own-an-updated-IBusAttrList-ref.patch">file://0001-src-make-an-IBusText-own-an-updated-IBusAttrList-ref.patch</a> \
-    <a href="file://0002-src-Fix-IBusAttrList-leak-when-converting-text.patch">file://0002-src-Fix-IBusAttrList-leak-when-converting-text.patch</a> \
-    <a href="file://0001-m4-update-ax_prog_cc_for_build.m4-to-serial-26.patch">file://0001-m4-update-ax_prog_cc_for_build.m4-to-serial-26.patch</a> \
-"
-SRCREV = "1f7af28437afd62a6d145bfc81035e698a37411d"
-
-# brokensep needed as vapi fails to build correctly
-inherit autotools-brokensep gettext features_check pkgconfig
-inherit bash-completion gobject-introspection gtk-doc gtk-icon-cache vala
-
-PACKAGECONFIG ??= " \
-    <a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'systemd wayland x11', d)} \
-    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>_any('DISTRO_FEATURES', [ 'wayland', 'x11' ], 'gtk3 gtk4', '', d)} \
-    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'x11', 'libnotify', '', d)} \
-    dconf vala \
-"
-PACKAGECONFIG[appindicator] = "--enable-appindicator,--disable-appindicator,qtbase"
-PACKAGECONFIG[dconf] = "--enable-dconf,--disable-dconf,dconf"
-PACKAGECONFIG[gtk2] = "--enable-gtk2,--disable-gtk2,gtk+"
-PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3,gtk+3"
-PACKAGECONFIG[gtk4] = "--enable-gtk4,--disable-gtk4,gtk4"
-PACKAGECONFIG[libnotify] = "--enable-libnotify,--disable-libnotify,libnotify"
-PACKAGECONFIG[systemd] = "--enable-systemd-services,--disable-systemd-services,systemd"
-PACKAGECONFIG[wayland]  = "--enable-wayland,--disable-wayland,wayland"
-PACKAGECONFIG[vala]  = "--enable-vala,--disable-vala"
-PACKAGECONFIG[x11]  = "--enable-xim --enable-ui,--disable-xim --disable-ui,virtual/libx11"
-
-EXTRA_OECONF = " \
-    --disable-tests \
-    --disable-emoji-dict \
-    --disable-python2 \
-    --with-python=${bindir}/python3 \
-    --with-ucd-dir=${STAGING_DATADIR}/unicode/ucd \
-"
-
-do_configure:prepend() {
-    touch ${S}/ChangeLog ${S}/ABOUT-NLS
-    # Remove vapigen.m4 bundled with sources so that the one shipped by vala is used instead.
-    rm -f ${S}/m4/vapigen.m4
-}
-
-do_compile:prepend() {
-    export GIR_EXTRA_LIBS_PATH="${B}/src/.libs"
-    cp ${STAGING_DATADIR_NATIVE}/X11/locale/en_US.UTF-8/Compose ${B}/src/Compose
-}
-
-FILES:${PN} += " \
-    ${datadir}/dbus-1 \
-    ${datadir}/GConf \
-    ${datadir}/glib-2.0 \
-    ${libdir}/gtk-2.0 \
-    ${libdir}/gtk-3.0 \
-    ${libdir}/gtk-4.0 \
-    ${systemd_user_unitdir} \
-"
-
-FILES:${PN}-dev += " \
-    ${datadir}/gettext \
-"
-
-RDEPENDS:${PN} += "python3-core"
-
-REQUIRED_DISTRO_FEATURES = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'gtk4', 'opengl', '', d)}"
diff --git a/meta-gnome/recipes-support/ibus/ibus_1.5.35.bb b/meta-gnome/recipes-support/ibus/ibus_1.5.35.bb
new file mode 100644
index 0000000000..2bd860a46a
--- /dev/null
+++ b/meta-gnome/recipes-support/ibus/ibus_1.5.35.bb
@@ -0,0 +1,63 @@
+SUMMARY = "Intelligent Input Bus for Linux/Unix"
+HOMEPAGE = "<a href="https://github.com/ibus/ibus/wiki">https://github.com/ibus/ibus/wiki</a>"
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=fbc093901857fcd118f065f900982c24" "="">file://COPYING;md5=fbc093901857fcd118f065f900982c24"</a>
+
+DEPENDS = "unicode-ucd libx11 glib-2.0-native glib-2.0 dbus iso-codes"
+
+SRC_URI = " \
+    git://github.com/ibus/ibus.git;branch=main;protocol=https;tag=${PV}-rc1 \
+    <a href="file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch">file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch</a> \
+    <a href="file://0002-meson-define-pyoverridesdir-without-PyGObject.patch">file://0002-meson-define-pyoverridesdir-without-PyGObject.patch</a> \
+"
+SRCREV = "d464316d9b9613005c5573a010fec7f9b40b93b6"
+
+inherit meson gettext features_check pkgconfig python3native
+inherit bash-completion gobject-introspection gtk-doc gtk-icon-cache vala
+
+PACKAGECONFIG ??= " \
+    <a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'systemd wayland x11', d)} \
+    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>_any('DISTRO_FEATURES', [ 'wayland', 'x11' ], 'gtk3 gtk4', '', d)} \
+    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'x11', 'libnotify', '', d)} \
+    dconf vala \
+"
+PACKAGECONFIG[appindicator] = "-Dappindicator=true,-Dappindicator=false,qtbase"
+PACKAGECONFIG[dconf] = "-Ddconf=enabled,-Ddconf=disabled,dconf"
+PACKAGECONFIG[gtk2] = "-Dgtk2=enabled,-Dgtk2=disabled,gtk+"
+PACKAGECONFIG[gtk3] = "-Dgtk3=true,-Dgtk3=false,gtk+3"
+PACKAGECONFIG[gtk4] = "-Dgtk4=true,-Dgtk4=false,gtk4"
+PACKAGECONFIG[libnotify] = "-Dlibnotify=true,-Dlibnotify=false,libnotify"
+PACKAGECONFIG[systemd] = "-Dsystemd-services=enabled,-Dsystemd-services=disabled,systemd"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,wayland wayland-native"
+PACKAGECONFIG[vala] = "-Dvapi=enabled,-Dvapi=disabled"
+PACKAGECONFIG[x11] = "-Dxim=enabled -Dui=true,-Dxim=disabled -Dui=false,virtual/libx11"
+
+GTKDOC_MESON_OPTION = "gtk-doc"
+
+EXTRA_OEMESON = " \
+    -Dtests=false \
+    -Demoji-dict=false \
+    -Ducd-dir=${STAGING_DATADIR}/unicode/ucd \
+"
+
+do_install:append() {
+    sed -i -e 's|${PYTHON}|${bindir}/python3|' ${D}${bindir}/ibus-setup
+}
+
+FILES:${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/GConf \
+    ${datadir}/glib-2.0 \
+    ${libdir}/gtk-2.0 \
+    ${libdir}/gtk-3.0 \
+    ${libdir}/gtk-4.0 \
+    ${systemd_user_unitdir} \
+"
+
+FILES:${PN}-dev += " \
+    ${datadir}/gettext \
+"
+
+RDEPENDS:${PN} += "python3-core"
+
+REQUIRED_DISTRO_FEATURES = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'gtk4', 'opengl', '', d)}"
<div>-- 
</div>2.55.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#130636): <a href="https://lists.openembedded.org/g/openembedded-devel/message/130636">https://lists.openembedded.org/g/openembedded-devel/message/130636</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/121607584/3618223">https://lists.openembedded.org/mt/121607584/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-03TqROyeIPIMmxh4eoEd--


