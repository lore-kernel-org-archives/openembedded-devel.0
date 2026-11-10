Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12418.1794280230236828185
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2026 19:10:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ULK7CnZS;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-679334baa1fso2051719d50.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2026 19:10:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794280229; cv=none;
        d=google.com; s=arc-20260327;
        b=LUXlfG2iJJTjCom9eVqR2cu+0rtT7l/Zz4H5ICJlVXxErl41RJQC7RvNoLJGEM/aVG
         b8wIx+pS5H8xuN8is+6CJY89oa8qdTDuhsxud4/PpTxbYI2O7n2KMVpkfFEYZMs6vyUl
         9hIEuR0Huquy8zglEKba+ZLaObIN8RsckugjFH4QC9s8mpNiJWZpFOFjo+8QdGye6PyK
         FPxo0ENoltubsC3bPNzFIcd/D4Y6MgiaMe5Z2964bYjSsreDDQvqlQWCZFkpUtd6adwq
         LFpK+SgqMZ1Ztd/YUZDYw1PFD19EHoYe1JVbdbmQ0wobCvzi19+24cW4nB2X7mdTxGfn
         HsFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4NJYpKO7HpW7FdI+L8q9KBHLPUPttQspcA1EVz1u4kA=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=ONwvkgrR6MLFW/Af/EEHYUcszCpob0xVScRv4UmF+YDAKt9RDN9KpuBClgU4Fbgg4Q
         8qmFh9txQGiHmUbZKS+O6q0NrXYSaoBFec7S0Yl73eUuyRDvcVvwAbOY4qjMwwUcYsqM
         LBV6j9CHU2pFJqgRcEJsjgHOhGUhMUcAZMfZNPg5DOYMOFEVbWeV99zWZnPW1rwX44bf
         Xm013eJjD2sDI689Q6HLtl+798SYzJlThPjIEQk8SslW3+ZVkTwW9zHldVC0PfDl6YK9
         Sc0MJtmGgjFCK9UfXqMMlS/4JG5SVeErkWSFqM14XpeuY/FR8Rnqm+nBY0Q2OD/ihbiO
         wGhw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280229; x=1794885029; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4NJYpKO7HpW7FdI+L8q9KBHLPUPttQspcA1EVz1u4kA=;
        b=ULK7CnZS2C7B5S88QY4mDhV4QX8sn6wXtv0ybgzEZO0Y5NUzldQsvWNtyq0MzcXYq3
         H+qHWSnU3SDwA6aNHobJIA5hCuVsnLdkoTtURKbnH0XcGQZHP1j1Iy6RTqRE1suI7kFA
         FTMmfrR44Ju5YlewWejBSMdMNjPvZwf17WekZloG8xD4VNP5qJGEusz8N+ug62REBKG3
         a/EvmBM3Nh8V8xatkmWgaup3ROrJrCRDtshKzMzOVX5Ly/HvRxbkbZPUnhJ8uV7Gu3oH
         sVtDWmFAajuB1N6/2CmcfjpfVqBslII/UzYwQXV9tqCTOaweOuLvcPalQ0lcgR+cdgp4
         otpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280229; x=1794885029;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4NJYpKO7HpW7FdI+L8q9KBHLPUPttQspcA1EVz1u4kA=;
        b=Mf2HxhDwgKFNzkIm6P9Wd59T8vIlu3RWhOOCwPBUYynd6vRy+RmE37mrLECoC4vPiX
         HWiIgVYx0kM6CcIOaNqsiZV8N72Zg5jw7/dRlGs8a5BSd2DgEz2sOknMvqxaPz5fiSe3
         ULyeKNhMLKHYBwpgebwui3dEnObdNIcuMps64NCUvDJqkLmI3ty+CnfJkDFlT+Ctxp8R
         yYWVGMGZnB1lD2DiPBngynQox0mtqcx1TT8xKTj2RkYKyYgCmVfcF534aEWeRR7yG5Qb
         prZEJIBp0EMmge8n4ZnW0ol3y76roY0h1GJRdWRDpFb8TpTxIv2s9p6wvXDdicFPc94D
         hJ6Q==
X-Gm-Message-State: APuU4Z/n3c1kWVJo7Po4Gl8GeVaLzFrJnRbeRQSe/YYU5ne8uSQCmT4U
	9FpY3Jw7lOYLO8mcX7sA23wQxBilPd5eYiDxkqHqpLULpKrYywgMWNkkwmtM4lctOkLkQdfCEW5
	1whqwZGmlQ0WA9lins1BMnZe7UyaLyHcDbqdTkZE=
X-Gm-Gg: AYBFou1gKmF8eCa8/nh5H2ofFBvaYj9YBQHfKazzBSnXEosQaFOUcrBXAd3i/SMwSSQ
	RFhPf2Us7izZwd6sNU+ga2lh2eWo4wMkKeL6tAl6ZPaON/f6vlpxn9e4wV7ihikSxkjZuDp599t
	7o5jY5ptkDWC1/nchkGw7Nv3R1elXfmAPxsxc7VjYqwB+xCCjwcIFDUZYwcCrfjGx2QLzRT6Dj1
	pQ6RFDB4WszU9JSc0Y5Jt6IoeowYxHX/ed7vvPnhrZom2BR4qtXJGSgvBxGArGxPDVtcMzXtZC6
	3txBPnQEVCBZg4tHKg/3Cx5DBVcCT9eMD7OAY+FZLWweLPB87hjp++7TLx2hBQFF6O3XyK9PnrS
	ALG9Pu3cqLSjqIDdbdRI3A958hFvlcCQqpP9PiYKVczIjId7f5OtN1oRhaTGYBuFUFr03shEPq1
	lblQ25ybiPmb4ZUhsiQOe1fqOjeIfyZ+IBBCuoaSDzFHVObNzw6nfmJcjG4H2ZziNBfqKuuRnhx
	mvz6YOKv0ELi4qD1HFCwC/ard0HPpNrMHU24+spCxGSJBHiNfZ8iNQG/QoGXXChEahiBSYUAa5+
	LtcZILfXK44rCoOU3gYBmGiIW0Fad7Yk/jEwV77/ptoL9Y9gKMJr6LXUyzTbJX5lPQ==
X-Received: by 2002:a05:690e:4853:b0:679:95cd:1aed with SMTP id
 956f58d0204a3-67c5676564cmr400370d50.60.1794280228649; Mon, 09 Nov 2026
 19:10:28 -0800 (PST)
MIME-Version: 1.0
References: <20261109115426.1051480-1-f_l_k@t-online.de>
In-Reply-To: <20261109115426.1051480-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Nov 2026 19:10:01 -0800
X-Gm-Features: AclHuK9yTKFMOSx7n44qOxd5kohSx3EQ97Y5390B7xBzuFJajkV5wguYe4yyX6M
Message-ID: <CAMKF1spqvQZe=YsMiqpyXP_JJ8ro-LTnuDW=Q1BDFEtv+PfcBg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 1/2] ibus: upgrade 1.5.34 -> 1.5.35
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a7ffb9065fe36b16"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 03:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132065

--000000000000a7ffb9065fe36b16
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ERROR: Nothing PROVIDES 'libx11' (but
/home/ubuntu/yoe/sources/meta-openembedded/meta-gnome/recipes-support/ibus/
ibus_1.5.35.bb DEPENDS on or otherwise requires it)
this is on distros using pure wayland without x11 in distro features.

On Mon, Nov 9, 2026 at 3:54=E2=80=AFAM Markus Volk via openembedded-devel <=
f_l_k=3D
t-online.de@lists.openembedded.org> wrote:

> Build with meson, which 1.5.35 ships. The tools that generate the
> compose table and the unicode dictionaries are built for the target and
> run through the meson exe wrapper, so the bundled ax_prog_cc_for_build.m4
> and its patch go away, and so does PKG_CONFIG_FOR_BUILD. The compose
> table is read from libx11's locale data in the target sysroot, so
> libx11-native is no longer needed.
>
> Drop the two IBusAttrList backports, which are part of the release, and
> rebase the dbus-launch patch onto the reworked make-dconf-override-db.sh.
> Add a patch that defines pyoverridesdir without pygobject-3.0, which the
> meson summary needs (Upstream-Status: Pending).
>
> ibus-setup gets the path of the python3 used at build time, so point it
> at ${bindir}/python3.
>
> Tested by building ibus for x86-64.
>
> AI-Generated: Uses Claude Code (Claude Opus 5.5)
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...start-dbus-we-do-not-have-dbus-lauch.patch |  10 +-
>  ...ax_prog_cc_for_build.m4-to-serial-26.patch | 178 ------------------
>  ...Text-own-an-updated-IBusAttrList-ref.patch |  99 ----------
>  ...ine-pyoverridesdir-without-PyGObject.patch |  26 +++
>  ...usAttrList-leak-when-converting-text.patch | 120 ------------
>  .../recipes-support/ibus/ibus_1.5.34.bb       |  74 --------
>  .../recipes-support/ibus/ibus_1.5.35.bb       |  63 +++++++
>  7 files changed, 94 insertions(+), 476 deletions(-)
>  delete mode 100644
> meta-gnome/recipes-support/ibus/ibus/0001-m4-update-ax_prog_cc_for_build.=
m4-to-serial-26.patch
>  delete mode 100644
> meta-gnome/recipes-support/ibus/ibus/0001-src-make-an-IBusText-own-an-upd=
ated-IBusAttrList-ref.patch
>  create mode 100644
> meta-gnome/recipes-support/ibus/ibus/0002-meson-define-pyoverridesdir-wit=
hout-PyGObject.patch
>  delete mode 100644
> meta-gnome/recipes-support/ibus/ibus/0002-src-Fix-IBusAttrList-leak-when-=
converting-text.patch
>  delete mode 100644 meta-gnome/recipes-support/ibus/ibus_1.5.34.bb
>  create mode 100644 meta-gnome/recipes-support/ibus/ibus_1.5.35.bb
>
> diff --git
> a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-d=
o-not-have-dbus-lauch.patch
> b/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-d=
o-not-have-dbus-lauch.patch
> index 64ad6b0857..1de2353d06 100644
> ---
> a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-d=
o-not-have-dbus-lauch.patch
> +++
> b/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we-d=
o-not-have-dbus-lauch.patch
> @@ -1,4 +1,4 @@
> -From f567bcbc2108d722faa90afeb03d3a3bcdf5f58b Mon Sep 17 00:00:00 2001
> +From f42b98063fe91efb5be6145e6b5f68b058bf4260 Mon Sep 17 00:00:00 2001
>  From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
>  Date: Fri, 10 May 2019 14:30:08 +0200
>  Subject: [PATCH] Do not try to start dbus - we do not have dbus-lauch
> @@ -14,10 +14,10 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gma=
il.com
> >
>   1 file changed, 11 deletions(-)
>
>  diff --git a/data/dconf/make-dconf-override-db.sh
> b/data/dconf/make-dconf-override-db.sh
> -index 32cb153..375baa4 100755
> +index fb5890e2..ff7ede4b 100755
>  --- a/data/dconf/make-dconf-override-db.sh
>  +++ b/data/dconf/make-dconf-override-db.sh
> -@@ -12,15 +12,6 @@ export XDG_CACHE_HOME=3D"$TMPDIR/cache"
> +@@ -24,15 +24,6 @@ export XDG_CACHE_HOME=3D"$TMPDIR/cache"
>   export GSETTINGS_SCHEMA_DIR=3D"$TMPDIR/schemas"
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
> a/meta-gnome/recipes-support/ibus/ibus/0001-m4-update-ax_prog_cc_for_buil=
d.m4-to-serial-26.patch
> b/meta-gnome/recipes-support/ibus/ibus/0001-m4-update-ax_prog_cc_for_buil=
d.m4-to-serial-26.patch
> deleted file mode 100644
> index 5029d9a86c..0000000000
> ---
> a/meta-gnome/recipes-support/ibus/ibus/0001-m4-update-ax_prog_cc_for_buil=
d.m4-to-serial-26.patch
> +++ /dev/null
> @@ -1,178 +0,0 @@
> -From 14547094541136957eee60bd6665263c0a69f17c Mon Sep 17 00:00:00 2001
> -From: Markus Volk <f_l_k@t-online.de>
> -Date: Tue, 6 Oct 2026 11:13:24 +0200
> -Subject: [PATCH] m4: update ax_prog_cc_for_build.m4 to serial 26
> -
> -Serial 21 renames the cache variables of AC_PROG_CC only up to
> -ac_cv_prog_cc_c11. Autoconf 2.73 adds ac_cv_prog_cc_c23, so the build
> -compiler inherits the result of the host compiler. When the host
> -compiler needs -std=3Dgnu23, CC_FOR_BUILD becomes "gcc -std=3Dgnu23" and
> -fails with GCC 13 and older.
> -
> -Serial 26 from autoconf-archive also renames ac_cv_prog_cc_c23.
> -
> -Upstream-Status: Pending
> ----
> - m4/ax_prog_cc_for_build.m4 | 78 ++++++++++++++++++++++++--------------
> - 1 file changed, 49 insertions(+), 29 deletions(-)
> -
> -diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
> -index 1db8d73f..4d1de993 100644
> ---- a/m4/ax_prog_cc_for_build.m4
> -+++ b/m4/ax_prog_cc_for_build.m4
> -@@ -32,7 +32,7 @@
> - #   and this notice are preserved. This file is offered as-is, without
> any
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
> -+dnl These variables are problematic to rename by M4 macros, so we save
> -+dnl their values in alternative names, and restore the values later.
> -+dnl
> -+dnl _AC_COMPILER_EXEEXT and _AC_COMPILER_OBJEXT internally call
> -+dnl AC_SUBST which prevents the renaming of EXEEXT and OBJEXT
> -+dnl variables. It's not a good idea to rename ac_cv_exeext and
> -+dnl ac_cv_objext either as they're related.
> -+dnl Renaming ac_exeext and ac_objext is safe though.
> -+dnl
> -+ac_cv_host_exeext=3D$ac_cv_exeext
> -+AS_VAR_SET_IF([ac_cv_build_exeext],
> -+  [ac_cv_exeext=3D$ac_cv_build_exeext],
> -+  [AS_UNSET([ac_cv_exeext])])
> -+ac_cv_host_objext=3D$ac_cv_objext
> -+AS_VAR_SET_IF([ac_cv_build_objext],
> -+  [ac_cv_objext=3D$ac_cv_build_objext],
> -+  [AS_UNSET([ac_cv_objext])])
> -+dnl
> -+dnl ac_cv_c_compiler_gnu is used in _AC_LANG_COMPILER_GNU (called by
> -+dnl AC_PROG_CC) indirectly.
> -+dnl
> -+ac_cv_host_c_compiler_gnu=3D$ac_cv_c_compiler_gnu
> -+AS_VAR_SET_IF([ac_cv_build_c_compiler_gnu],
> -+  [ac_cv_c_compiler_gnu=3D$ac_cv_build_c_compiler_gnu],
> -+  [AS_UNSET([ac_cv_c_compiler_gnu])])
> -
> - cross_compiling_build=3Dno
> -
> -@@ -85,25 +109,14 @@ AS_IF([test -n "$build"],
> [ac_build_tool_prefix=3D"$build-"],
> -       [test -n "$build_alias"],[ac_build_tool_prefix=3D"$build_alias-"]=
)
> -
> - AC_LANG_PUSH([C])
> --
> --dnl The pushdef([ac_cv_c_compiler_gnu], ...) currently does not cover
> --dnl the use of this variable in _AC_LANG_COMPILER_GNU called by
> --dnl AC_PROG_CC. Unset this cache variable temporarily as a workaround.
> --was_set_c_compiler_gnu=3D${[ac_cv_c_compiler_gnu]+y}
> --AS_IF([test ${was_set_c_compiler_gnu}],
> --    [saved_c_compiler_gnu=3D$[ac_cv_c_compiler_gnu]
> --    AS_UNSET([[ac_cv_c_compiler_gnu]])])
> --
> - AC_PROG_CC
> --
> --dnl Restore ac_cv_c_compiler_gnu
> --AS_IF([test ${was_set_c_compiler_gnu}],
> --  [[ac_cv_c_compiler_gnu]=3D$[saved_c_compiler_gnu]])
> --
> - _AC_COMPILER_EXEEXT
> - _AC_COMPILER_OBJEXT
> - AC_PROG_CPP
> -
> -+BUILD_EXEEXT=3D$ac_cv_exeext
> -+BUILD_OBJEXT=3D$ac_cv_objext
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
> -+ac_cv_exeext=3D$ac_cv_host_exeext
> -+EXEEXT=3D$ac_cv_host_exeext
> -+ac_cv_objext=3D$ac_cv_host_objext
> -+OBJEXT=3D$ac_cv_host_objext
> -+ac_cv_c_compiler_gnu=3D$ac_cv_host_c_compiler_gnu
> -+ac_compiler_gnu=3D$ac_cv_host_c_compiler_gnu
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
> a/meta-gnome/recipes-support/ibus/ibus/0001-src-make-an-IBusText-own-an-u=
pdated-IBusAttrList-ref.patch
> b/meta-gnome/recipes-support/ibus/ibus/0001-src-make-an-IBusText-own-an-u=
pdated-IBusAttrList-ref.patch
> deleted file mode 100644
> index b255e889b9..0000000000
> ---
> a/meta-gnome/recipes-support/ibus/ibus/0001-src-make-an-IBusText-own-an-u=
pdated-IBusAttrList-ref.patch
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -From b69a9906acba1111bcb39c654fc885a079fd31f9 Mon Sep 17 00:00:00 2001
> -From: Tianhao Chai <cth451@gmail.com>
> -Date: Wed, 27 May 2026 13:11:28 +0900
> -Subject: [PATCH 1/2] src: make an IBusText own an updated IBusAttrList
> - reference
> -
> -For all usages of IBusAttrList, the list is an owned reference within a
> -IBusText struct. `ibus_panel_convert_text()` and
> -`ibus_input_context_convert_text()` violate the invarient by assigning a
> -**floating** IBusAttrList reference to anIBusText without sinking it.
> -
> -When GJS attempts to create a JS representation of an existing GObject,
> -it unconditionally sinks the incoming reference.[1] For a non-floating
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
> https://gitlab.gnome.org/GNOME/gjs/-/blob/db450465ab0161e131a92992c250950=
7aa6152aa/gi/object.cpp#L3597
> -
> -Closes: #2889
> -
> -Upstream-Status: Backport [
> https://github.com/ibus/ibus/commit/5bbe88a1936246185a65f76e58cc85871401e=
59a
> ]
> -Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ----
> - src/ibusinputcontext.c | 12 ++++--------
> - src/ibuspanelservice.c | 12 ++++--------
> - 2 files changed, 8 insertions(+), 16 deletions(-)
> -
> -diff --git a/src/ibusinputcontext.c b/src/ibusinputcontext.c
> -index 68d12fb..bdfd166 100644
> ---- a/src/ibusinputcontext.c
> -+++ b/src/ibusinputcontext.c
> -@@ -569,10 +569,8 @@ ibus_input_context_convert_text (IBusInputContext
> *context,
> -                        text->text, error->message);
> -             g_error_free (error);
> -         }
> --        if (new_attrs) {
> --            g_object_unref (text->attrs);
> --            text->attrs =3D new_attrs;
> --        }
> -+        if (new_attrs)
> -+            ibus_text_set_attributes (text, new_attrs);
> -         break;
> -     case IBUS_PREEDIT_FORMAT_HINT:
> -         new_attrs =3D ibus_attr_list_copy_format_to_hint (text->attrs,
> &error);
> -@@ -581,10 +579,8 @@ ibus_input_context_convert_text (IBusInputContext
> *context,
> -                        text->text, error->message);
> -             g_error_free (error);
> -         }
> --        if (new_attrs) {
> --            g_object_unref (text->attrs);
> --            text->attrs =3D new_attrs;
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
> -@@ -1203,10 +1203,8 @@ ibus_panel_convert_text (IBusPanelService *panel,
> -                        text->text, error->message);
> -             g_error_free (error);
> -         }
> --        if (new_attrs) {
> --            g_object_unref (text->attrs);
> --            text->attrs =3D new_attrs;
> --        }
> -+        if (new_attrs)
> -+            ibus_text_set_attributes (text, new_attrs);
> -         break;
> -     case IBUS_PREEDIT_FORMAT_HINT:
> -         new_attrs =3D ibus_attr_list_copy_format_to_hint (text->attrs,
> &error);
> -@@ -1215,10 +1213,8 @@ ibus_panel_convert_text (IBusPanelService *panel,
> -                        text->text, error->message);
> -             g_error_free (error);
> -         }
> --        if (new_attrs) {
> --            g_object_unref (text->attrs);
> --            text->attrs =3D new_attrs;
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
> a/meta-gnome/recipes-support/ibus/ibus/0002-meson-define-pyoverridesdir-w=
ithout-PyGObject.patch
> b/meta-gnome/recipes-support/ibus/ibus/0002-meson-define-pyoverridesdir-w=
ithout-PyGObject.patch
> new file mode 100644
> index 0000000000..331b60d889
> --- /dev/null
> +++
> b/meta-gnome/recipes-support/ibus/ibus/0002-meson-define-pyoverridesdir-w=
ithout-PyGObject.patch
> @@ -0,0 +1,26 @@
> +From 85ce9c83f919090687adc303fad8d27486574d75 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Tue, 6 Oct 2026 11:38:08 +0200
> +Subject: [PATCH] meson: define pyoverridesdir without PyGObject
> +
> +The summary prints pyoverridesdir, which is only set when pygobject-3.0
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
> + pygobject_dep =3D dependency('pygobject-3.0', version: '>=3D 3.0.0',
> +                            required: false)
> + enable_pygobject =3D pygobject_dep.found()
> ++pyoverridesdir =3D ''
> + if enable_pygobject
> +   pyoverridesdir =3D get_option('python-overrides-dir')
> +   if pyoverridesdir =3D=3D ''
> diff --git
> a/meta-gnome/recipes-support/ibus/ibus/0002-src-Fix-IBusAttrList-leak-whe=
n-converting-text.patch
> b/meta-gnome/recipes-support/ibus/ibus/0002-src-Fix-IBusAttrList-leak-whe=
n-converting-text.patch
> deleted file mode 100644
> index d714febcef..0000000000
> ---
> a/meta-gnome/recipes-support/ibus/ibus/0002-src-Fix-IBusAttrList-leak-whe=
n-converting-text.patch
> +++ /dev/null
> @@ -1,120 +0,0 @@
> -From a9c89af52127b6c718395e6cd8439e8c92c471b1 Mon Sep 17 00:00:00 2001
> -From: Sebastian Keller <skeller@gnome.org>
> -Date: Thu, 27 Aug 2026 21:07:58 +0200
> -Subject: [PATCH 2/2] src: Fix IBusAttrList leak when converting text
> -
> -After 5bbe88a1 the attribute list set on the text was getting leaked
> -when the list passed to `ibus_attr_list_copy_format_to_*()` had a length
> -of 0. In that case the list is already non-floating before the copy
> -function adds a ref and returns it. This then is passed to
> -`ibus_text_set_attributes()` which calls `g_object_ref_sink()`. Since
> -the list is not floating, this adds another ref that would not be added
> -in the length > 0 case. This surplus ref is causing the list to be
> -leaked.
> -
> -To fix this leak we need to unref the list after calling
> -`ibus_text_set_attributes()`.
> -
> -However in the length > 0 case the new list returned by
> -`ibus_attr_list_copy_format_to_*()` is floating, so this would drop the
> -refcount to 0. To avoid this we need to ensure that if the list is
> floating the
> -floating ref is sunk before calling `ibus_text_set_attributes()`, so the
> -call to `g_object_ref_sink()` in there adds a ref, such that we can
> -safely unref this after the call to `ibus_text_set_attributes()`.
> -
> -This also keeps the guarantee that the list is not floating anymore
> -after converting text to not regress the issue fixed by 5bbe88a1.
> -
> -Fixes: https://github.com/ibus/ibus/commit/5bbe88a1
> -Closes: https://github.com/ibus/ibus/issues/2941
> -
> -Upstream-Status: Backport [
> https://github.com/ibus/ibus/commit/1a331e695d84fc6bae8f2d11c52d4776df496=
47b
> ]
> -Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ----
> - src/ibusinputcontext.c | 20 ++++++++++++++++++--
> - src/ibuspanelservice.c | 20 ++++++++++++++++++--
> - 2 files changed, 36 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/ibusinputcontext.c b/src/ibusinputcontext.c
> -index bdfd166..d0e162f 100644
> ---- a/src/ibusinputcontext.c
> -+++ b/src/ibusinputcontext.c
> -@@ -569,8 +569,16 @@ ibus_input_context_convert_text (IBusInputContext
> *context,
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
> -         new_attrs =3D ibus_attr_list_copy_format_to_hint (text->attrs,
> &error);
> -@@ -579,8 +587,16 @@ ibus_input_context_convert_text (IBusInputContext
> *context,
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
> -@@ -1203,8 +1203,16 @@ ibus_panel_convert_text (IBusPanelService *panel,
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
> -         new_attrs =3D ibus_attr_list_copy_format_to_hint (text->attrs,
> &error);
> -@@ -1213,8 +1221,16 @@ ibus_panel_convert_text (IBusPanelService *panel,
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
> index 274ca1f1b8..0000000000
> --- a/meta-gnome/recipes-support/ibus/ibus_1.5.34.bb
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -SUMMARY =3D "Intelligent Input Bus for Linux/Unix"
> -HOMEPAGE =3D "https://github.com/ibus/ibus/wiki"
> -LICENSE =3D "LGPL-2.1-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
> -
> -DEPENDS =3D "unicode-ucd libx11-native glib-2.0-native glib-2.0 dbus
> iso-codes"
> -
> -SRC_URI =3D " \
> -    git://github.com/ibus/ibus.git;branch=3Dmain;protocol=3Dhttps;tag=3D=
${PV}
> <http://github.com/ibus/ibus.git;branch=3Dmain;protocol=3Dhttps;tag=3D$%7=
BPV%7D>
> \
> -    file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch=
 \
> -
> file://0001-src-make-an-IBusText-own-an-updated-IBusAttrList-ref.patch \
> -    file://0002-src-Fix-IBusAttrList-leak-when-converting-text.patch \
> -    file://0001-m4-update-ax_prog_cc_for_build.m4-to-serial-26.patch \
> -"
> -SRCREV =3D "1f7af28437afd62a6d145bfc81035e698a37411d"
> -
> -# brokensep needed as vapi fails to build correctly
> -inherit autotools-brokensep gettext features_check pkgconfig
> -inherit bash-completion gobject-introspection gtk-doc gtk-icon-cache val=
a
> -
> -PACKAGECONFIG ??=3D " \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
> -    ${@bb.utils.contains_any('DISTRO_FEATURES', [ 'wayland', 'x11' ],
> 'gtk3 gtk4', '', d)} \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libnotify', '', d)} =
\
> -    dconf vala \
> -"
> -PACKAGECONFIG[appindicator] =3D
> "--enable-appindicator,--disable-appindicator,qtbase"
> -PACKAGECONFIG[dconf] =3D "--enable-dconf,--disable-dconf,dconf"
> -PACKAGECONFIG[gtk2] =3D "--enable-gtk2,--disable-gtk2,gtk+"
> -PACKAGECONFIG[gtk3] =3D "--enable-gtk3,--disable-gtk3,gtk+3"
> -PACKAGECONFIG[gtk4] =3D "--enable-gtk4,--disable-gtk4,gtk4"
> -PACKAGECONFIG[libnotify] =3D
> "--enable-libnotify,--disable-libnotify,libnotify"
> -PACKAGECONFIG[systemd] =3D
> "--enable-systemd-services,--disable-systemd-services,systemd"
> -PACKAGECONFIG[wayland]  =3D "--enable-wayland,--disable-wayland,wayland"
> -PACKAGECONFIG[vala]  =3D "--enable-vala,--disable-vala"
> -PACKAGECONFIG[x11]  =3D "--enable-xim --enable-ui,--disable-xim
> --disable-ui,virtual/libx11"
> -
> -EXTRA_OECONF =3D " \
> -    --disable-tests \
> -    --disable-emoji-dict \
> -    --disable-python2 \
> -    --with-python=3D${bindir}/python3 \
> -    --with-ucd-dir=3D${STAGING_DATADIR}/unicode/ucd \
> -    PKG_CONFIG_FOR_BUILD=3D${STAGING_BINDIR_NATIVE}/pkg-config-native \
> -"
> -
> -do_configure:prepend() {
> -    touch ${S}/ChangeLog ${S}/ABOUT-NLS
> -    # Remove vapigen.m4 bundled with sources so that the one shipped by
> vala is used instead.
> -    rm -f ${S}/m4/vapigen.m4
> -}
> -
> -do_compile:prepend() {
> -    export GIR_EXTRA_LIBS_PATH=3D"${B}/src/.libs"
> -    cp ${STAGING_DATADIR_NATIVE}/X11/locale/en_US.UTF-8/Compose
> ${B}/src/Compose
> -}
> -
> -FILES:${PN} +=3D " \
> -    ${datadir}/dbus-1 \
> -    ${datadir}/GConf \
> -    ${datadir}/glib-2.0 \
> -    ${libdir}/gtk-2.0 \
> -    ${libdir}/gtk-3.0 \
> -    ${libdir}/gtk-4.0 \
> -    ${systemd_user_unitdir} \
> -"
> -
> -FILES:${PN}-dev +=3D " \
> -    ${datadir}/gettext \
> -"
> -
> -RDEPENDS:${PN} +=3D "python3-core"
> -
> -REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKAGECONFIG', 'gtk=
4',
> 'opengl', '', d)}"
> diff --git a/meta-gnome/recipes-support/ibus/ibus_1.5.35.bb
> b/meta-gnome/recipes-support/ibus/ibus_1.5.35.bb
> new file mode 100644
> index 0000000000..891013ee03
> --- /dev/null
> +++ b/meta-gnome/recipes-support/ibus/ibus_1.5.35.bb
> @@ -0,0 +1,63 @@
> +SUMMARY =3D "Intelligent Input Bus for Linux/Unix"
> +HOMEPAGE =3D "https://github.com/ibus/ibus/wiki"
> +LICENSE =3D "LGPL-2.1-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982=
c24"
> +
> +DEPENDS =3D "unicode-ucd libx11 glib-2.0-native glib-2.0 dbus iso-codes"
> +
> +SRC_URI =3D " \
> +    git://github.com/ibus/ibus.git;branch=3Dmain;protocol=3Dhttps;tag=3D=
${PV}
> <http://github.com/ibus/ibus.git;branch=3Dmain;protocol=3Dhttps;tag=3D$%7=
BPV%7D>
> \
> +    file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch=
 \
> +    file://0002-meson-define-pyoverridesdir-without-PyGObject.patch \
> +"
> +SRCREV =3D "d464316d9b9613005c5573a010fec7f9b40b93b6"
> +
> +inherit meson gettext features_check pkgconfig python3native
> +inherit bash-completion gobject-introspection gtk-doc gtk-icon-cache val=
a
> +
> +PACKAGECONFIG ??=3D " \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
> +    ${@bb.utils.contains_any('DISTRO_FEATURES', [ 'wayland', 'x11' ],
> 'gtk3 gtk4', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libnotify', '', d)} =
\
> +    dconf vala \
> +"
> +PACKAGECONFIG[appindicator] =3D
> "-Dappindicator=3Dtrue,-Dappindicator=3Dfalse,qtbase"
> +PACKAGECONFIG[dconf] =3D "-Ddconf=3Denabled,-Ddconf=3Ddisabled,dconf"
> +PACKAGECONFIG[gtk2] =3D "-Dgtk2=3Denabled,-Dgtk2=3Ddisabled,gtk+"
> +PACKAGECONFIG[gtk3] =3D "-Dgtk3=3Dtrue,-Dgtk3=3Dfalse,gtk+3"
> +PACKAGECONFIG[gtk4] =3D "-Dgtk4=3Dtrue,-Dgtk4=3Dfalse,gtk4"
> +PACKAGECONFIG[libnotify] =3D "-Dlibnotify=3Dtrue,-Dlibnotify=3Dfalse,lib=
notify"
> +PACKAGECONFIG[systemd] =3D
> "-Dsystemd-services=3Denabled,-Dsystemd-services=3Ddisabled,systemd"
> +PACKAGECONFIG[wayland] =3D "-Dwayland=3Denabled,-Dwayland=3Ddisabled,way=
land
> wayland-native"
> +PACKAGECONFIG[vala] =3D "-Dvapi=3Denabled,-Dvapi=3Ddisabled"
> +PACKAGECONFIG[x11] =3D "-Dxim=3Denabled -Dui=3Dtrue,-Dxim=3Ddisabled
> -Dui=3Dfalse,virtual/libx11"
> +
> +GTKDOC_MESON_OPTION =3D "gtk-doc"
> +
> +EXTRA_OEMESON =3D " \
> +    -Dtests=3Dfalse \
> +    -Demoji-dict=3Dfalse \
> +    -Ducd-dir=3D${STAGING_DATADIR}/unicode/ucd \
> +"
> +
> +do_install:append() {
> +    sed -i -e 's|${PYTHON}|${bindir}/python3|' ${D}${bindir}/ibus-setup
> +}
> +
> +FILES:${PN} +=3D " \
> +    ${datadir}/dbus-1 \
> +    ${datadir}/GConf \
> +    ${datadir}/glib-2.0 \
> +    ${libdir}/gtk-2.0 \
> +    ${libdir}/gtk-3.0 \
> +    ${libdir}/gtk-4.0 \
> +    ${systemd_user_unitdir} \
> +"
> +
> +FILES:${PN}-dev +=3D " \
> +    ${datadir}/gettext \
> +"
> +
> +RDEPENDS:${PN} +=3D "python3-core"
> +
> +REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('PACKAGECONFIG', 'gtk=
4',
> 'opengl', '', d)}"
> --
> 2.56.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#132058):
> https://lists.openembedded.org/g/openembedded-devel/message/132058
> Mute This Topic: https://lists.openembedded.org/mt/122172228/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a7ffb9065fe36b16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ERROR: Nothing PROVIDES &#39;libx11&#39; (but /home/ubuntu=
/yoe/sources/meta-openembedded/meta-gnome/recipes-support/ibus/<a href=3D"h=
ttp://ibus_1.5.35.bb">ibus_1.5.35.bb</a> DEPENDS on or otherwise requires i=
t)<div>this is on distros using pure wayland without x11 in distro features=
.</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Nov 9, 2026 at 3:54=E2=80=AFAM Markus=
 Volk via openembedded-devel &lt;f_l_k=3D<a href=3D"mailto:t-online.de@list=
s.openembedded.org">t-online.de@lists.openembedded.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Build with meson, whi=
ch 1.5.35 ships. The tools that generate the<br>
compose table and the unicode dictionaries are built for the target and<br>
run through the meson exe wrapper, so the bundled ax_prog_cc_for_build.m4<b=
r>
and its patch go away, and so does PKG_CONFIG_FOR_BUILD. The compose<br>
table is read from libx11&#39;s locale data in the target sysroot, so<br>
libx11-native is no longer needed.<br>
<br>
Drop the two IBusAttrList backports, which are part of the release, and<br>
rebase the dbus-launch patch onto the reworked make-dconf-override-db.sh.<b=
r>
Add a patch that defines pyoverridesdir without pygobject-3.0, which the<br=
>
meson summary needs (Upstream-Status: Pending).<br>
<br>
ibus-setup gets the path of the python3 used at build time, so point it<br>
at ${bindir}/python3.<br>
<br>
Tested by building ibus for x86-64.<br>
<br>
AI-Generated: Uses Claude Code (Claude Opus 5.5)<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0...start-dbus-we-do-not-have-dbus-lauch.patch |=C2=A0 10 +-<br>
=C2=A0...ax_prog_cc_for_build.m4-to-serial-26.patch | 178 -----------------=
-<br>
=C2=A0...Text-own-an-updated-IBusAttrList-ref.patch |=C2=A0 99 ----------<b=
r>
=C2=A0...ine-pyoverridesdir-without-PyGObject.patch |=C2=A0 26 +++<br>
=C2=A0...usAttrList-leak-when-converting-text.patch | 120 ------------<br>
=C2=A0.../recipes-support/ibus/<a href=3D"http://ibus_1.5.34.bb" rel=3D"nor=
eferrer" target=3D"_blank">ibus_1.5.34.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 74 --------<br>
=C2=A0.../recipes-support/ibus/<a href=3D"http://ibus_1.5.35.bb" rel=3D"nor=
eferrer" target=3D"_blank">ibus_1.5.35.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 63 +++++++<br>
=C2=A07 files changed, 94 insertions(+), 476 deletions(-)<br>
=C2=A0delete mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-m4-updat=
e-ax_prog_cc_for_build.m4-to-serial-26.patch<br>
=C2=A0delete mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-src-make=
-an-IBusText-own-an-updated-IBusAttrList-ref.patch<br>
=C2=A0create mode 100644 meta-gnome/recipes-support/ibus/ibus/0002-meson-de=
fine-pyoverridesdir-without-PyGObject.patch<br>
=C2=A0delete mode 100644 meta-gnome/recipes-support/ibus/ibus/0002-src-Fix-=
IBusAttrList-leak-when-converting-text.patch<br>
=C2=A0delete mode 100644 meta-gnome/recipes-support/ibus/<a href=3D"http://=
ibus_1.5.34.bb" rel=3D"noreferrer" target=3D"_blank">ibus_1.5.34.bb</a><br>
=C2=A0create mode 100644 meta-gnome/recipes-support/ibus/<a href=3D"http://=
ibus_1.5.35.bb" rel=3D"noreferrer" target=3D"_blank">ibus_1.5.35.bb</a><br>
<br>
diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-=
dbus-we-do-not-have-dbus-lauch.patch b/meta-gnome/recipes-support/ibus/ibus=
/0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch<br>
index 64ad6b0857..1de2353d06 100644<br>
--- a/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we=
-do-not-have-dbus-lauch.patch<br>
+++ b/meta-gnome/recipes-support/ibus/ibus/0001-Do-not-try-to-start-dbus-we=
-do-not-have-dbus-lauch.patch<br>
@@ -1,4 +1,4 @@<br>
-From f567bcbc2108d722faa90afeb03d3a3bcdf5f58b Mon Sep 17 00:00:00 2001<br>
+From f42b98063fe91efb5be6145e6b5f68b058bf4260 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D &lt;<a href=3D"mail=
to:schnitzeltony@gmail.com" target=3D"_blank">schnitzeltony@gmail.com</a>&g=
t;<br>
=C2=A0Date: Fri, 10 May 2019 14:30:08 +0200<br>
=C2=A0Subject: [PATCH] Do not try to start dbus - we do not have dbus-lauch=
<br>
@@ -14,10 +14,10 @@ Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailt=
o:schnitzeltony@gmail.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt=
;<br>
=C2=A0 1 file changed, 11 deletions(-)<br>
<br>
=C2=A0diff --git a/data/dconf/make-dconf-override-db.sh b/data/dconf/make-d=
conf-override-db.sh<br>
-index 32cb153..375baa4 100755<br>
+index fb5890e2..ff7ede4b 100755<br>
=C2=A0--- a/data/dconf/make-dconf-override-db.sh<br>
=C2=A0+++ b/data/dconf/make-dconf-override-db.sh<br>
-@@ -12,15 +12,6 @@ export XDG_CACHE_HOME=3D&quot;$TMPDIR/cache&quot;<br>
+@@ -24,15 +24,6 @@ export XDG_CACHE_HOME=3D&quot;$TMPDIR/cache&quot;<br>
=C2=A0 export GSETTINGS_SCHEMA_DIR=3D&quot;$TMPDIR/schemas&quot;<br>
=C2=A0 mkdir -p $XDG_CONFIG_HOME $XDG_CACHE_HOME $GSETTINGS_SCHEMA_DIR<br>
<br>
@@ -31,9 +31,9 @@ index 32cb153..375baa4 100755<br>
=C2=A0-}<br>
=C2=A0-<br>
=C2=A0 # in case that schema is not installed on the system<br>
- glib-compile-schemas --targetdir &quot;$GSETTINGS_SCHEMA_DIR&quot; &quot;=
$PWD&quot;<br>
+ glib-compile-schemas --targetdir &quot;$GSETTINGS_SCHEMA_DIR&quot; &quot;=
$SRCDIR&quot;<br>
<br>
-@@ -57,5 +48,3 @@ if [ -d $TMPDIR/cache/gvfs ] ; then<br>
+@@ -69,5 +60,3 @@ if [ -d $TMPDIR/cache/gvfs ] ; then<br>
=C2=A0 =C2=A0 =C2=A0 umount $TMPDIR/cache/gvfs<br>
=C2=A0 fi<br>
=C2=A0 rm -rf $TMPDIR<br>
diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-m4-update-ax_prog_cc=
_for_build.m4-to-serial-26.patch b/meta-gnome/recipes-support/ibus/ibus/000=
1-m4-update-ax_prog_cc_for_build.m4-to-serial-26.patch<br>
deleted file mode 100644<br>
index 5029d9a86c..0000000000<br>
--- a/meta-gnome/recipes-support/ibus/ibus/0001-m4-update-ax_prog_cc_for_bu=
ild.m4-to-serial-26.patch<br>
+++ /dev/null<br>
@@ -1,178 +0,0 @@<br>
-From 14547094541136957eee60bd6665263c0a69f17c Mon Sep 17 00:00:00 2001<br>
-From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blan=
k">f_l_k@t-online.de</a>&gt;<br>
-Date: Tue, 6 Oct 2026 11:13:24 +0200<br>
-Subject: [PATCH] m4: update ax_prog_cc_for_build.m4 to serial 26<br>
-<br>
-Serial 21 renames the cache variables of AC_PROG_CC only up to<br>
-ac_cv_prog_cc_c11. Autoconf 2.73 adds ac_cv_prog_cc_c23, so the build<br>
-compiler inherits the result of the host compiler. When the host<br>
-compiler needs -std=3Dgnu23, CC_FOR_BUILD becomes &quot;gcc -std=3Dgnu23&q=
uot; and<br>
-fails with GCC 13 and older.<br>
-<br>
-Serial 26 from autoconf-archive also renames ac_cv_prog_cc_c23.<br>
-<br>
-Upstream-Status: Pending<br>
----<br>
- m4/ax_prog_cc_for_build.m4 | 78 ++++++++++++++++++++++++--------------<br=
>
- 1 file changed, 49 insertions(+), 29 deletions(-)<br>
-<br>
-diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4<br>
-index 1db8d73f..4d1de993 100644<br>
---- a/m4/ax_prog_cc_for_build.m4<br>
-+++ b/m4/ax_prog_cc_for_build.m4<br>
-@@ -32,7 +32,7 @@<br>
- #=C2=A0 =C2=A0and this notice are preserved. This file is offered as-is, =
without any<br>
- #=C2=A0 =C2=A0warranty.<br>
- <br>
--#serial 21<br>
-+#serial 26<br>
- <br>
- AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])<br>
- AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl<br>
-@@ -43,16 +43,16 @@ AC_REQUIRE([AC_CANONICAL_BUILD])dnl<br>
- dnl Use the standard macros, but make them use other variable names<br>
- dnl<br>
- pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl<br>
-+pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl<br>
- pushdef([ac_cv_prog_cc_c89], ac_cv_build_prog_cc_c89)dnl<br>
- pushdef([ac_cv_prog_cc_c99], ac_cv_build_prog_cc_c99)dnl<br>
- pushdef([ac_cv_prog_cc_c11], ac_cv_build_prog_cc_c11)dnl<br>
--pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl<br>
-+pushdef([ac_cv_prog_cc_c23], ac_cv_build_prog_cc_c23)dnl<br>
-+pushdef([ac_cv_prog_cc_stdc], ac_cv_build_prog_cc_stdc)dnl<br>
- pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl<br>
- pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl<br>
- pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl<br>
--pushdef([ac_cv_c_compiler_gnu], ac_cv_build_c_compiler_gnu)dnl<br>
--pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl<br>
--pushdef([ac_cv_objext], ac_cv_build_objext)dnl<br>
-+pushdef([ac_prog_cc_stdc], ac_build_prog_cc_stdc)dnl<br>
- pushdef([ac_exeext], ac_build_exeext)dnl<br>
- pushdef([ac_objext], ac_build_objext)dnl<br>
- pushdef([CC], CC_FOR_BUILD)dnl<br>
-@@ -60,9 +60,7 @@ pushdef([CPP], CPP_FOR_BUILD)dnl<br>
- pushdef([GCC], GCC_FOR_BUILD)dnl<br>
- pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl<br>
- pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl<br>
--pushdef([EXEEXT], BUILD_EXEEXT)dnl<br>
- pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl<br>
--pushdef([OBJEXT], BUILD_OBJEXT)dnl<br>
- pushdef([host], build)dnl<br>
- pushdef([host_alias], build_alias)dnl<br>
- pushdef([host_cpu], build_cpu)dnl<br>
-@@ -77,6 +75,32 @@ pushdef([ac_tool_prefix], ac_build_tool_prefix)dnl<br>
- pushdef([am_cv_CC_dependencies_compiler_type], am_cv_build_CC_dependencie=
s_compiler_type)dnl<br>
- pushdef([am_cv_prog_cc_c_o], am_cv_build_prog_cc_c_o)dnl<br>
- pushdef([cross_compiling], cross_compiling_build)dnl<br>
-+dnl<br>
-+dnl These variables are problematic to rename by M4 macros, so we save<br=
>
-+dnl their values in alternative names, and restore the values later.<br>
-+dnl<br>
-+dnl _AC_COMPILER_EXEEXT and _AC_COMPILER_OBJEXT internally call<br>
-+dnl AC_SUBST which prevents the renaming of EXEEXT and OBJEXT<br>
-+dnl variables. It&#39;s not a good idea to rename ac_cv_exeext and<br>
-+dnl ac_cv_objext either as they&#39;re related.<br>
-+dnl Renaming ac_exeext and ac_objext is safe though.<br>
-+dnl<br>
-+ac_cv_host_exeext=3D$ac_cv_exeext<br>
-+AS_VAR_SET_IF([ac_cv_build_exeext],<br>
-+=C2=A0 [ac_cv_exeext=3D$ac_cv_build_exeext],<br>
-+=C2=A0 [AS_UNSET([ac_cv_exeext])])<br>
-+ac_cv_host_objext=3D$ac_cv_objext<br>
-+AS_VAR_SET_IF([ac_cv_build_objext],<br>
-+=C2=A0 [ac_cv_objext=3D$ac_cv_build_objext],<br>
-+=C2=A0 [AS_UNSET([ac_cv_objext])])<br>
-+dnl<br>
-+dnl ac_cv_c_compiler_gnu is used in _AC_LANG_COMPILER_GNU (called by<br>
-+dnl AC_PROG_CC) indirectly.<br>
-+dnl<br>
-+ac_cv_host_c_compiler_gnu=3D$ac_cv_c_compiler_gnu<br>
-+AS_VAR_SET_IF([ac_cv_build_c_compiler_gnu],<br>
-+=C2=A0 [ac_cv_c_compiler_gnu=3D$ac_cv_build_c_compiler_gnu],<br>
-+=C2=A0 [AS_UNSET([ac_cv_c_compiler_gnu])])<br>
- <br>
- cross_compiling_build=3Dno<br>
- <br>
-@@ -85,25 +109,14 @@ AS_IF([test -n &quot;$build&quot;],=C2=A0 =C2=A0 =C2=
=A0 [ac_build_tool_prefix=3D&quot;$build-&quot;],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0[test -n &quot;$build_alias&quot;],[ac_build_to=
ol_prefix=3D&quot;$build_alias-&quot;])<br>
- <br>
- AC_LANG_PUSH([C])<br>
--<br>
--dnl The pushdef([ac_cv_c_compiler_gnu], ...) currently does not cover<br>
--dnl the use of this variable in _AC_LANG_COMPILER_GNU called by<br>
--dnl AC_PROG_CC. Unset this cache variable temporarily as a workaround.<br=
>
--was_set_c_compiler_gnu=3D${[ac_cv_c_compiler_gnu]+y}<br>
--AS_IF([test ${was_set_c_compiler_gnu}],<br>
--=C2=A0 =C2=A0 [saved_c_compiler_gnu=3D$[ac_cv_c_compiler_gnu]<br>
--=C2=A0 =C2=A0 AS_UNSET([[ac_cv_c_compiler_gnu]])])<br>
--<br>
- AC_PROG_CC<br>
--<br>
--dnl Restore ac_cv_c_compiler_gnu<br>
--AS_IF([test ${was_set_c_compiler_gnu}],<br>
--=C2=A0 [[ac_cv_c_compiler_gnu]=3D$[saved_c_compiler_gnu]])<br>
--<br>
- _AC_COMPILER_EXEEXT<br>
- _AC_COMPILER_OBJEXT<br>
- AC_PROG_CPP<br>
- <br>
-+BUILD_EXEEXT=3D$ac_cv_exeext<br>
-+BUILD_OBJEXT=3D$ac_cv_objext<br>
-+<br>
- dnl Restore the old definitions<br>
- dnl<br>
- popdef([cross_compiling])dnl<br>
-@@ -120,9 +133,7 @@ popdef([host_vendor])dnl<br>
- popdef([host_cpu])dnl<br>
- popdef([host_alias])dnl<br>
- popdef([host])dnl<br>
--popdef([OBJEXT])dnl<br>
- popdef([LDFLAGS])dnl<br>
--popdef([EXEEXT])dnl<br>
- popdef([CPPFLAGS])dnl<br>
- popdef([CFLAGS])dnl<br>
- popdef([GCC])dnl<br>
-@@ -130,25 +141,34 @@ popdef([CPP])dnl<br>
- popdef([CC])dnl<br>
- popdef([ac_objext])dnl<br>
- popdef([ac_exeext])dnl<br>
--popdef([ac_cv_objext])dnl<br>
--popdef([ac_cv_exeext])dnl<br>
--popdef([ac_cv_c_compiler_gnu])dnl<br>
-+popdef([ac_prog_cc_stdc])dnl<br>
- popdef([ac_cv_prog_cc_g])dnl<br>
- popdef([ac_cv_prog_cc_cross])dnl<br>
- popdef([ac_cv_prog_cc_works])dnl<br>
-+popdef([ac_cv_prog_cc_stdc])dnl<br>
-+popdef([ac_cv_prog_cc_c23])dnl<br>
-+popdef([ac_cv_prog_cc_c11])dnl<br>
-+popdef([ac_cv_prog_cc_c99])dnl<br>
- popdef([ac_cv_prog_cc_c89])dnl<br>
- popdef([ac_cv_prog_gcc])dnl<br>
- popdef([ac_cv_prog_CPP])dnl<br>
-+dnl<br>
-+ac_cv_exeext=3D$ac_cv_host_exeext<br>
-+EXEEXT=3D$ac_cv_host_exeext<br>
-+ac_cv_objext=3D$ac_cv_host_objext<br>
-+OBJEXT=3D$ac_cv_host_objext<br>
-+ac_cv_c_compiler_gnu=3D$ac_cv_host_c_compiler_gnu<br>
-+ac_compiler_gnu=3D$ac_cv_host_c_compiler_gnu<br>
- <br>
- dnl restore global variables ac_ext, ac_cpp, ac_compile,<br>
--dnl ac_link, ac_compiler_gnu (dependant on the current<br>
-+dnl ac_link, ac_compiler_gnu (dependent on the current<br>
- dnl language after popping):<br>
- AC_LANG_POP([C])<br>
- <br>
- dnl Finally, set Makefile variables<br>
- dnl<br>
--AC_SUBST(BUILD_EXEEXT)dnl<br>
--AC_SUBST(BUILD_OBJEXT)dnl<br>
-+AC_SUBST([BUILD_EXEEXT])dnl<br>
-+AC_SUBST([BUILD_OBJEXT])dnl<br>
- AC_SUBST([CFLAGS_FOR_BUILD])dnl<br>
- AC_SUBST([CPPFLAGS_FOR_BUILD])dnl<br>
- AC_SUBST([LDFLAGS_FOR_BUILD])dnl<br>
--- <br>
-2.55.0<br>
-<br>
diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-src-make-an-IBusText=
-own-an-updated-IBusAttrList-ref.patch b/meta-gnome/recipes-support/ibus/ib=
us/0001-src-make-an-IBusText-own-an-updated-IBusAttrList-ref.patch<br>
deleted file mode 100644<br>
index b255e889b9..0000000000<br>
--- a/meta-gnome/recipes-support/ibus/ibus/0001-src-make-an-IBusText-own-an=
-updated-IBusAttrList-ref.patch<br>
+++ /dev/null<br>
@@ -1,99 +0,0 @@<br>
-From b69a9906acba1111bcb39c654fc885a079fd31f9 Mon Sep 17 00:00:00 2001<br>
-From: Tianhao Chai &lt;<a href=3D"mailto:cth451@gmail.com" target=3D"_blan=
k">cth451@gmail.com</a>&gt;<br>
-Date: Wed, 27 May 2026 13:11:28 +0900<br>
-Subject: [PATCH 1/2] src: make an IBusText own an updated IBusAttrList<br>
- reference<br>
-<br>
-For all usages of IBusAttrList, the list is an owned reference within a<br=
>
-IBusText struct. `ibus_panel_convert_text()` and<br>
-`ibus_input_context_convert_text()` violate the invarient by assigning a<b=
r>
-**floating** IBusAttrList reference to anIBusText without sinking it.<br>
-<br>
-When GJS attempts to create a JS representation of an existing GObject,<br=
>
-it unconditionally sinks the incoming reference.[1] For a non-floating<br>
-reference this up-refs the object.<br>
-<br>
-For this floating IBusAttrLit, `g_object_ref_sink` converts it to a<br>
-strong reference in-place leaving ref-count at 1. At this point the<br>
-`IBusAttrList` is referenced by both the enclosing `IBusText` and the<br>
-newly created GJS wrapper. When one of them is ref-downed the object<br>
-is recycled, leaving the other reference dangling.<br>
-<br>
-To fix this we just need to maintain the list as a non-floating ref.<br>
-We already have a `ibus_text_set_attributes()` that does the intended<br>
-ref sinking, so just use that instead of manually assigning pointers.<br>
-<br>
-[1]: <a href=3D"https://gitlab.gnome.org/GNOME/gjs/-/blob/db450465ab0161e1=
31a92992c2509507aa6152aa/gi/object.cpp#L3597" rel=3D"noreferrer" target=3D"=
_blank">https://gitlab.gnome.org/GNOME/gjs/-/blob/db450465ab0161e131a92992c=
2509507aa6152aa/gi/object.cpp#L3597</a><br>
-<br>
-Closes: #2889<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/ibus/ibus/commit/=
5bbe88a1936246185a65f76e58cc85871401e59a" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/ibus/ibus/commit/5bbe88a1936246185a65f76e58cc8587140=
1e59a</a>]<br>
-Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
----<br>
- src/ibusinputcontext.c | 12 ++++--------<br>
- src/ibuspanelservice.c | 12 ++++--------<br>
- 2 files changed, 8 insertions(+), 16 deletions(-)<br>
-<br>
-diff --git a/src/ibusinputcontext.c b/src/ibusinputcontext.c<br>
-index 68d12fb..bdfd166 100644<br>
---- a/src/ibusinputcontext.c<br>
-+++ b/src/ibusinputcontext.c<br>
-@@ -569,10 +569,8 @@ ibus_input_context_convert_text (IBusInputContext *co=
ntext,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 text-&gt;text, error-&gt;message);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_error_free (error);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (new_attrs) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_object_unref (text-&gt;attrs)=
;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 text-&gt;attrs =3D new_attrs;<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (new_attrs)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibus_text_set_attributes (text,=
 new_attrs);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0case IBUS_PREEDIT_FORMAT_HINT:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_attrs =3D ibus_attr_list_copy_format=
_to_hint (text-&gt;attrs, &amp;error);<br>
-@@ -581,10 +579,8 @@ ibus_input_context_convert_text (IBusInputContext *co=
ntext,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 text-&gt;text, error-&gt;message);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_error_free (error);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (new_attrs) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_object_unref (text-&gt;attrs)=
;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 text-&gt;attrs =3D new_attrs;<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (new_attrs)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibus_text_set_attributes (text,=
 new_attrs);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_not_reached ();<br>
-diff --git a/src/ibuspanelservice.c b/src/ibuspanelservice.c<br>
-index 1622982..f50cea1 100644<br>
---- a/src/ibuspanelservice.c<br>
-+++ b/src/ibuspanelservice.c<br>
-@@ -1203,10 +1203,8 @@ ibus_panel_convert_text (IBusPanelService *panel,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 text-&gt;text, error-&gt;message);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_error_free (error);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (new_attrs) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_object_unref (text-&gt;attrs)=
;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 text-&gt;attrs =3D new_attrs;<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (new_attrs)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibus_text_set_attributes (text,=
 new_attrs);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0case IBUS_PREEDIT_FORMAT_HINT:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_attrs =3D ibus_attr_list_copy_format=
_to_hint (text-&gt;attrs, &amp;error);<br>
-@@ -1215,10 +1213,8 @@ ibus_panel_convert_text (IBusPanelService *panel,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 text-&gt;text, error-&gt;message);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_error_free (error);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (new_attrs) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_object_unref (text-&gt;attrs)=
;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 text-&gt;attrs =3D new_attrs;<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (new_attrs)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibus_text_set_attributes (text,=
 new_attrs);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_not_reached ();<br>
--- <br>
-2.55.0<br>
-<br>
diff --git a/meta-gnome/recipes-support/ibus/ibus/0002-meson-define-pyoverr=
idesdir-without-PyGObject.patch b/meta-gnome/recipes-support/ibus/ibus/0002=
-meson-define-pyoverridesdir-without-PyGObject.patch<br>
new file mode 100644<br>
index 0000000000..331b60d889<br>
--- /dev/null<br>
+++ b/meta-gnome/recipes-support/ibus/ibus/0002-meson-define-pyoverridesdir=
-without-PyGObject.patch<br>
@@ -0,0 +1,26 @@<br>
+From 85ce9c83f919090687adc303fad8d27486574d75 Mon Sep 17 00:00:00 2001<br>
+From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blan=
k">f_l_k@t-online.de</a>&gt;<br>
+Date: Tue, 6 Oct 2026 11:38:08 +0200<br>
+Subject: [PATCH] meson: define pyoverridesdir without PyGObject<br>
+<br>
+The summary prints pyoverridesdir, which is only set when pygobject-3.0<br=
>
+is found, so meson setup fails with &#39;Unknown variable name<br>
+&quot;pyoverridesdir&quot;&#39; when it is not.<br>
+<br>
+Upstream-Status: Pending<br>
+---<br>
+ meson.build | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/meson.build b/meson.build<br>
+index afcb7544..271737f2 100644<br>
+--- a/meson.build<br>
++++ b/meson.build<br>
+@@ -237,6 +237,7 @@ endif<br>
+ pygobject_dep =3D dependency(&#39;pygobject-3.0&#39;, version: &#39;&gt;=
=3D 3.0.0&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 required: false)<br>
+ enable_pygobject =3D pygobject_dep.found()<br>
++pyoverridesdir =3D &#39;&#39;<br>
+ if enable_pygobject<br>
+=C2=A0 =C2=A0pyoverridesdir =3D get_option(&#39;python-overrides-dir&#39;)=
<br>
+=C2=A0 =C2=A0if pyoverridesdir =3D=3D &#39;&#39;<br>
diff --git a/meta-gnome/recipes-support/ibus/ibus/0002-src-Fix-IBusAttrList=
-leak-when-converting-text.patch b/meta-gnome/recipes-support/ibus/ibus/000=
2-src-Fix-IBusAttrList-leak-when-converting-text.patch<br>
deleted file mode 100644<br>
index d714febcef..0000000000<br>
--- a/meta-gnome/recipes-support/ibus/ibus/0002-src-Fix-IBusAttrList-leak-w=
hen-converting-text.patch<br>
+++ /dev/null<br>
@@ -1,120 +0,0 @@<br>
-From a9c89af52127b6c718395e6cd8439e8c92c471b1 Mon Sep 17 00:00:00 2001<br>
-From: Sebastian Keller &lt;<a href=3D"mailto:skeller@gnome.org" target=3D"=
_blank">skeller@gnome.org</a>&gt;<br>
-Date: Thu, 27 Aug 2026 21:07:58 +0200<br>
-Subject: [PATCH 2/2] src: Fix IBusAttrList leak when converting text<br>
-<br>
-After 5bbe88a1 the attribute list set on the text was getting leaked<br>
-when the list passed to `ibus_attr_list_copy_format_to_*()` had a length<b=
r>
-of 0. In that case the list is already non-floating before the copy<br>
-function adds a ref and returns it. This then is passed to<br>
-`ibus_text_set_attributes()` which calls `g_object_ref_sink()`. Since<br>
-the list is not floating, this adds another ref that would not be added<br=
>
-in the length &gt; 0 case. This surplus ref is causing the list to be<br>
-leaked.<br>
-<br>
-To fix this leak we need to unref the list after calling<br>
-`ibus_text_set_attributes()`.<br>
-<br>
-However in the length &gt; 0 case the new list returned by<br>
-`ibus_attr_list_copy_format_to_*()` is floating, so this would drop the<br=
>
-refcount to 0. To avoid this we need to ensure that if the list is floatin=
g the<br>
-floating ref is sunk before calling `ibus_text_set_attributes()`, so the<b=
r>
-call to `g_object_ref_sink()` in there adds a ref, such that we can<br>
-safely unref this after the call to `ibus_text_set_attributes()`.<br>
-<br>
-This also keeps the guarantee that the list is not floating anymore<br>
-after converting text to not regress the issue fixed by 5bbe88a1.<br>
-<br>
-Fixes: <a href=3D"https://github.com/ibus/ibus/commit/5bbe88a1" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/ibus/ibus/commit/5bbe88a1</a>=
<br>
-Closes: <a href=3D"https://github.com/ibus/ibus/issues/2941" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/ibus/ibus/issues/2941</a><br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/ibus/ibus/commit/=
1a331e695d84fc6bae8f2d11c52d4776df49647b" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/ibus/ibus/commit/1a331e695d84fc6bae8f2d11c52d4776df4=
9647b</a>]<br>
-Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
----<br>
- src/ibusinputcontext.c | 20 ++++++++++++++++++--<br>
- src/ibuspanelservice.c | 20 ++++++++++++++++++--<br>
- 2 files changed, 36 insertions(+), 4 deletions(-)<br>
-<br>
-diff --git a/src/ibusinputcontext.c b/src/ibusinputcontext.c<br>
-index bdfd166..d0e162f 100644<br>
---- a/src/ibusinputcontext.c<br>
-+++ b/src/ibusinputcontext.c<br>
-@@ -569,8 +569,16 @@ ibus_input_context_convert_text (IBusInputContext *co=
ntext,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 text-&gt;text, error-&gt;message);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_error_free (error);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (new_attrs)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (new_attrs) {<br>
-+#if GLIB_CHECK_VERSION (2, 70, 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_object_take_ref (new_attrs);<=
br>
-+#else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_object_is_floating (new_a=
ttrs)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_object_ref_sink=
 (new_attrs);<br>
-+#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ibus_text_set_attributes (=
text, new_attrs);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_object_unref (new_attrs);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0case IBUS_PREEDIT_FORMAT_HINT:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_attrs =3D ibus_attr_list_copy_format=
_to_hint (text-&gt;attrs, &amp;error);<br>
-@@ -579,8 +587,16 @@ ibus_input_context_convert_text (IBusInputContext *co=
ntext,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 text-&gt;text, error-&gt;message);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_error_free (error);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (new_attrs)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (new_attrs) {<br>
-+#if GLIB_CHECK_VERSION (2, 70, 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_object_take_ref (new_attrs);<=
br>
-+#else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_object_is_floating (new_a=
ttrs)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_object_ref_sink=
 (new_attrs);<br>
-+#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ibus_text_set_attributes (=
text, new_attrs);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_object_unref (new_attrs);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_not_reached ();<br>
-diff --git a/src/ibuspanelservice.c b/src/ibuspanelservice.c<br>
-index f50cea1..3d59a21 100644<br>
---- a/src/ibuspanelservice.c<br>
-+++ b/src/ibuspanelservice.c<br>
-@@ -1203,8 +1203,16 @@ ibus_panel_convert_text (IBusPanelService *panel,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 text-&gt;text, error-&gt;message);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_error_free (error);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (new_attrs)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (new_attrs) {<br>
-+#if GLIB_CHECK_VERSION (2, 70, 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_object_take_ref (new_attrs);<=
br>
-+#else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_object_is_floating (new_a=
ttrs)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_object_ref_sink=
 (new_attrs);<br>
-+#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ibus_text_set_attributes (=
text, new_attrs);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_object_unref (new_attrs);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0case IBUS_PREEDIT_FORMAT_HINT:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_attrs =3D ibus_attr_list_copy_format=
_to_hint (text-&gt;attrs, &amp;error);<br>
-@@ -1213,8 +1221,16 @@ ibus_panel_convert_text (IBusPanelService *panel,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 text-&gt;text, error-&gt;message);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_error_free (error);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (new_attrs)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (new_attrs) {<br>
-+#if GLIB_CHECK_VERSION (2, 70, 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_object_take_ref (new_attrs);<=
br>
-+#else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_object_is_floating (new_a=
ttrs)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_object_ref_sink=
 (new_attrs);<br>
-+#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ibus_text_set_attributes (=
text, new_attrs);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_object_unref (new_attrs);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_assert_not_reached ();<br>
--- <br>
-2.55.0<br>
-<br>
diff --git a/meta-gnome/recipes-support/ibus/<a href=3D"http://ibus_1.5.34.=
bb" rel=3D"noreferrer" target=3D"_blank">ibus_1.5.34.bb</a> b/meta-gnome/re=
cipes-support/ibus/<a href=3D"http://ibus_1.5.34.bb" rel=3D"noreferrer" tar=
get=3D"_blank">ibus_1.5.34.bb</a><br>
deleted file mode 100644<br>
index 274ca1f1b8..0000000000<br>
--- a/meta-gnome/recipes-support/ibus/<a href=3D"http://ibus_1.5.34.bb" rel=
=3D"noreferrer" target=3D"_blank">ibus_1.5.34.bb</a><br>
+++ /dev/null<br>
@@ -1,74 +0,0 @@<br>
-SUMMARY =3D &quot;Intelligent Input Bus for Linux/Unix&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://github.com/ibus/ibus/wiki" rel=3D"no=
referrer" target=3D"_blank">https://github.com/ibus/ibus/wiki</a>&quot;<br>
-LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dfbc093901857fcd118f065f900=
982c24&quot;<br>
-<br>
-DEPENDS =3D &quot;unicode-ucd libx11-native glib-2.0-native glib-2.0 dbus =
iso-codes&quot;<br>
-<br>
-SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 git://<a href=3D"http://github.com/ibus/ibus.git;branch=3Dma=
in;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/ibus/ibus.git;branch=3Dmain;protocol=3Dhttps;tag=3D${PV}</a> \<br=
>
-=C2=A0 =C2=A0 file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lau=
ch.patch \<br>
-=C2=A0 =C2=A0 file://0001-src-make-an-IBusText-own-an-updated-IBusAttrList=
-ref.patch \<br>
-=C2=A0 =C2=A0 file://0002-src-Fix-IBusAttrList-leak-when-converting-text.p=
atch \<br>
-=C2=A0 =C2=A0 file://0001-m4-update-ax_prog_cc_for_build.m4-to-serial-26.p=
atch \<br>
-&quot;<br>
-SRCREV =3D &quot;1f7af28437afd62a6d145bfc81035e698a37411d&quot;<br>
-<br>
-# brokensep needed as vapi fails to build correctly<br>
-inherit autotools-brokensep gettext features_check pkgconfig<br>
-inherit bash-completion gobject-introspection gtk-doc gtk-icon-cache vala<=
br>
-<br>
-PACKAGECONFIG ??=3D &quot; \<br>
-=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;systemd w=
ayland x11&#39;, d)} \<br>
-=C2=A0 =C2=A0 ${@bb.utils.contains_any(&#39;DISTRO_FEATURES&#39;, [ &#39;w=
ayland&#39;, &#39;x11&#39; ], &#39;gtk3 gtk4&#39;, &#39;&#39;, d)} \<br>
-=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39=
;, &#39;libnotify&#39;, &#39;&#39;, d)} \<br>
-=C2=A0 =C2=A0 dconf vala \<br>
-&quot;<br>
-PACKAGECONFIG[appindicator] =3D &quot;--enable-appindicator,--disable-appi=
ndicator,qtbase&quot;<br>
-PACKAGECONFIG[dconf] =3D &quot;--enable-dconf,--disable-dconf,dconf&quot;<=
br>
-PACKAGECONFIG[gtk2] =3D &quot;--enable-gtk2,--disable-gtk2,gtk+&quot;<br>
-PACKAGECONFIG[gtk3] =3D &quot;--enable-gtk3,--disable-gtk3,gtk+3&quot;<br>
-PACKAGECONFIG[gtk4] =3D &quot;--enable-gtk4,--disable-gtk4,gtk4&quot;<br>
-PACKAGECONFIG[libnotify] =3D &quot;--enable-libnotify,--disable-libnotify,=
libnotify&quot;<br>
-PACKAGECONFIG[systemd] =3D &quot;--enable-systemd-services,--disable-syste=
md-services,systemd&quot;<br>
-PACKAGECONFIG[wayland]=C2=A0 =3D &quot;--enable-wayland,--disable-wayland,=
wayland&quot;<br>
-PACKAGECONFIG[vala]=C2=A0 =3D &quot;--enable-vala,--disable-vala&quot;<br>
-PACKAGECONFIG[x11]=C2=A0 =3D &quot;--enable-xim --enable-ui,--disable-xim =
--disable-ui,virtual/libx11&quot;<br>
-<br>
-EXTRA_OECONF =3D &quot; \<br>
-=C2=A0 =C2=A0 --disable-tests \<br>
-=C2=A0 =C2=A0 --disable-emoji-dict \<br>
-=C2=A0 =C2=A0 --disable-python2 \<br>
-=C2=A0 =C2=A0 --with-python=3D${bindir}/python3 \<br>
-=C2=A0 =C2=A0 --with-ucd-dir=3D${STAGING_DATADIR}/unicode/ucd \<br>
-=C2=A0 =C2=A0 PKG_CONFIG_FOR_BUILD=3D${STAGING_BINDIR_NATIVE}/pkg-config-n=
ative \<br>
-&quot;<br>
-<br>
-do_configure:prepend() {<br>
-=C2=A0 =C2=A0 touch ${S}/ChangeLog ${S}/ABOUT-NLS<br>
-=C2=A0 =C2=A0 # Remove vapigen.m4 bundled with sources so that the one shi=
pped by vala is used instead.<br>
-=C2=A0 =C2=A0 rm -f ${S}/m4/vapigen.m4<br>
-}<br>
-<br>
-do_compile:prepend() {<br>
-=C2=A0 =C2=A0 export GIR_EXTRA_LIBS_PATH=3D&quot;${B}/src/.libs&quot;<br>
-=C2=A0 =C2=A0 cp ${STAGING_DATADIR_NATIVE}/X11/locale/en_US.UTF-8/Compose =
${B}/src/Compose<br>
-}<br>
-<br>
-FILES:${PN} +=3D &quot; \<br>
-=C2=A0 =C2=A0 ${datadir}/dbus-1 \<br>
-=C2=A0 =C2=A0 ${datadir}/GConf \<br>
-=C2=A0 =C2=A0 ${datadir}/glib-2.0 \<br>
-=C2=A0 =C2=A0 ${libdir}/gtk-2.0 \<br>
-=C2=A0 =C2=A0 ${libdir}/gtk-3.0 \<br>
-=C2=A0 =C2=A0 ${libdir}/gtk-4.0 \<br>
-=C2=A0 =C2=A0 ${systemd_user_unitdir} \<br>
-&quot;<br>
-<br>
-FILES:${PN}-dev +=3D &quot; \<br>
-=C2=A0 =C2=A0 ${datadir}/gettext \<br>
-&quot;<br>
-<br>
-RDEPENDS:${PN} +=3D &quot;python3-core&quot;<br>
-<br>
-REQUIRED_DISTRO_FEATURES =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG=
&#39;, &#39;gtk4&#39;, &#39;opengl&#39;, &#39;&#39;, d)}&quot;<br>
diff --git a/meta-gnome/recipes-support/ibus/<a href=3D"http://ibus_1.5.35.=
bb" rel=3D"noreferrer" target=3D"_blank">ibus_1.5.35.bb</a> b/meta-gnome/re=
cipes-support/ibus/<a href=3D"http://ibus_1.5.35.bb" rel=3D"noreferrer" tar=
get=3D"_blank">ibus_1.5.35.bb</a><br>
new file mode 100644<br>
index 0000000000..891013ee03<br>
--- /dev/null<br>
+++ b/meta-gnome/recipes-support/ibus/<a href=3D"http://ibus_1.5.35.bb" rel=
=3D"noreferrer" target=3D"_blank">ibus_1.5.35.bb</a><br>
@@ -0,0 +1,63 @@<br>
+SUMMARY =3D &quot;Intelligent Input Bus for Linux/Unix&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/ibus/ibus/wiki" rel=3D"no=
referrer" target=3D"_blank">https://github.com/ibus/ibus/wiki</a>&quot;<br>
+LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dfbc093901857fcd118f065f900=
982c24&quot;<br>
+<br>
+DEPENDS =3D &quot;unicode-ucd libx11 glib-2.0-native glib-2.0 dbus iso-cod=
es&quot;<br>
+<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://github.com/ibus/ibus.git;branch=3Dma=
in;protocol=3Dhttps;tag=3D$%7BPV%7D" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/ibus/ibus.git;branch=3Dmain;protocol=3Dhttps;tag=3D${PV}</a> \<br=
>
+=C2=A0 =C2=A0 file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lau=
ch.patch \<br>
+=C2=A0 =C2=A0 file://0002-meson-define-pyoverridesdir-without-PyGObject.pa=
tch \<br>
+&quot;<br>
+SRCREV =3D &quot;d464316d9b9613005c5573a010fec7f9b40b93b6&quot;<br>
+<br>
+inherit meson gettext features_check pkgconfig python3native<br>
+inherit bash-completion gobject-introspection gtk-doc gtk-icon-cache vala<=
br>
+<br>
+PACKAGECONFIG ??=3D &quot; \<br>
+=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;systemd w=
ayland x11&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains_any(&#39;DISTRO_FEATURES&#39;, [ &#39;w=
ayland&#39;, &#39;x11&#39; ], &#39;gtk3 gtk4&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39=
;, &#39;libnotify&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 dconf vala \<br>
+&quot;<br>
+PACKAGECONFIG[appindicator] =3D &quot;-Dappindicator=3Dtrue,-Dappindicator=
=3Dfalse,qtbase&quot;<br>
+PACKAGECONFIG[dconf] =3D &quot;-Ddconf=3Denabled,-Ddconf=3Ddisabled,dconf&=
quot;<br>
+PACKAGECONFIG[gtk2] =3D &quot;-Dgtk2=3Denabled,-Dgtk2=3Ddisabled,gtk+&quot=
;<br>
+PACKAGECONFIG[gtk3] =3D &quot;-Dgtk3=3Dtrue,-Dgtk3=3Dfalse,gtk+3&quot;<br>
+PACKAGECONFIG[gtk4] =3D &quot;-Dgtk4=3Dtrue,-Dgtk4=3Dfalse,gtk4&quot;<br>
+PACKAGECONFIG[libnotify] =3D &quot;-Dlibnotify=3Dtrue,-Dlibnotify=3Dfalse,=
libnotify&quot;<br>
+PACKAGECONFIG[systemd] =3D &quot;-Dsystemd-services=3Denabled,-Dsystemd-se=
rvices=3Ddisabled,systemd&quot;<br>
+PACKAGECONFIG[wayland] =3D &quot;-Dwayland=3Denabled,-Dwayland=3Ddisabled,=
wayland wayland-native&quot;<br>
+PACKAGECONFIG[vala] =3D &quot;-Dvapi=3Denabled,-Dvapi=3Ddisabled&quot;<br>
+PACKAGECONFIG[x11] =3D &quot;-Dxim=3Denabled -Dui=3Dtrue,-Dxim=3Ddisabled =
-Dui=3Dfalse,virtual/libx11&quot;<br>
+<br>
+GTKDOC_MESON_OPTION =3D &quot;gtk-doc&quot;<br>
+<br>
+EXTRA_OEMESON =3D &quot; \<br>
+=C2=A0 =C2=A0 -Dtests=3Dfalse \<br>
+=C2=A0 =C2=A0 -Demoji-dict=3Dfalse \<br>
+=C2=A0 =C2=A0 -Ducd-dir=3D${STAGING_DATADIR}/unicode/ucd \<br>
+&quot;<br>
+<br>
+do_install:append() {<br>
+=C2=A0 =C2=A0 sed -i -e &#39;s|${PYTHON}|${bindir}/python3|&#39; ${D}${bin=
dir}/ibus-setup<br>
+}<br>
+<br>
+FILES:${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${datadir}/dbus-1 \<br>
+=C2=A0 =C2=A0 ${datadir}/GConf \<br>
+=C2=A0 =C2=A0 ${datadir}/glib-2.0 \<br>
+=C2=A0 =C2=A0 ${libdir}/gtk-2.0 \<br>
+=C2=A0 =C2=A0 ${libdir}/gtk-3.0 \<br>
+=C2=A0 =C2=A0 ${libdir}/gtk-4.0 \<br>
+=C2=A0 =C2=A0 ${systemd_user_unitdir} \<br>
+&quot;<br>
+<br>
+FILES:${PN}-dev +=3D &quot; \<br>
+=C2=A0 =C2=A0 ${datadir}/gettext \<br>
+&quot;<br>
+<br>
+RDEPENDS:${PN} +=3D &quot;python3-core&quot;<br>
+<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG=
&#39;, &#39;gtk4&#39;, &#39;opengl&#39;, &#39;&#39;, d)}&quot;<br>
-- <br>
2.56.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#132058): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/132058" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/132058</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122172228/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122172228/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000a7ffb9065fe36b16--
