Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BFBACA5FF0
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 09:50:13 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41748.1791280206329705329
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2026 02:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SS2qTUGj;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8ae8541a2f0so3942757b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2026 02:50:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791280205; cv=none;
        d=google.com; s=arc-20260327;
        b=jUIUYhMwaudXZlry/6ENlwsDDZTGCAwlwJURgZ5FPO84WNNzQgKCGvWDqvaO+7vm2F
         EUgnBBCgY/S+aF5Ktx1i7WEuCxBA3TbOcy4Su0dhM4NXIxrE51RM4AONGrFAoDK4SPA6
         JaPqEI6TgdKgYiVV7gTD4pCWqE0NDLyDAbWfDlbJ2/BDNx2WQ/xyvNCqMxMkbiDZM7/t
         hX3swXMNMJOPN6T6KLw9qdmAmUzfifmFWebAeKU3/yxA9Bo/QcNmc0ACaRtGIcBXcoFz
         Xvq1531dVGCXDsVXKGh7OVgkHr1Oh4Geesx4Dvki3JbJ4UOSL1JKAQkYRe4E1GZGt1px
         F+9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4fXqjCIjRoG+sHx1tTPbd70rThBoXH3fH7CMUgKeISg=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=JVfYf6PZ7noWujsPcfx3Irx+VnuwSkj/HOYyRkQRoeoRynqt1h5Hprs/12ruTHhxcF
         UpNuXi2X+KagCXTVdFny5449KeTfq7mcFNfecvlsk4fO748a6e278OIwdAJCybss4gdZ
         JxscMrVsWqn7f2waXQO6/qDFNor5hutTq+dD+ZzbT10UXAWMsChHgwMmpBBhIav45yIO
         QHDYj98gXW7pEQUY+CxAWQtt6rTyGFe4YD5+jHyutc2lI0qJrL+3om3irAmSH50Mn/xu
         XsCvVsBlLtEL+1rV0imMWAVAbSWOJeh2jUADx0pB3tDPlvcQ7qSJaf+g+m8eBbqOhqMq
         sFlA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791280205; x=1791885005; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4fXqjCIjRoG+sHx1tTPbd70rThBoXH3fH7CMUgKeISg=;
        b=SS2qTUGjt2l8HT8oWt/Tz4BF/qmpocEpeblHZJPCPFhmgpGyZFlQE0L4Mx84sHyBVL
         C9a+thSdhbt1z/vqdv7bdqcnsWOmyfgKc1IKyuKi45tsYYwGi3yAp+qjiW1rosp/rDQc
         350TBIuTvUGvsJlNC16Q+ejiKwl2A+QWhHcPPNMBy0FAwPHIMONe5cZz4DLx+UhQGBgL
         pF52qKgySBYirl173p7fszmw6WfVoxuSleX9otGLcmSF2BqqPtivC6xt+1CBtRg6BjnW
         8zuvM6Rc4emKgSCRluC8JlIn8Pe2TMxH7xyn+I7hY5qSH9fOBsOAfsxJ8011hXe9rXVF
         ZbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791280205; x=1791885005;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4fXqjCIjRoG+sHx1tTPbd70rThBoXH3fH7CMUgKeISg=;
        b=yj1PySZ1B88yK4eIXFfu1e+7oJ6FEhjIdMLP6W+AKfJ1PaQeXsyBKUN/64PNA+G2jr
         /a7Bxq3VoyneAww1b3Oo9O2QOrXE1trnQkmEr7zLIc3wP1vp0QNzw1el8Iw17IWxi0oT
         1rGWKJX6pQs8HQfrWq4z465+IeCdg4WRpjSRvN6GgPxHBo0IZ5S3+5c+FUCUhWQB43sH
         eG603q6CM8Jp2YPu/DHX3pt06M7DSd4B5gxxECzqrFObKzZQ7yoqqXAO0thItLjJj59j
         1dm5ChHeRQAvu5jbHEHLZIFG3YEzuvNK576q2vOvclTntNOA8MU69/8TMoQoQqIfRb8s
         IkMw==
X-Gm-Message-State: AFq9FYJCWPSvx7+aSkDabyivZeSuNsvXaPJglU7DO03nvYR0Un7O+A+v
	YdFt00v9i4VHAMhbC6UFboKGob2DSCGbTsZ6fnXHZ7FfbmtPm+vaX7V2dY8UslsNiGoGdhCKABP
	G8Baj587mEroxb7m61JOQIcliu0xBYtvp+PRnsP0=
X-Gm-Gg: AYBFou0JdE51z8M9x6KcY9V1Z61nFkkvTXks9Bvgv5h4/nnjCV0KS4lwqELbTUTFDWW
	u9miXrJu6Fvm9qYVivqIHK/L9mDlRGD26W00asDL3Fnwjh8hLSHcZ4Ft1LQ9eqE/AxKBQhMfoPR
	NyfdOA4HIOjF7JGY9OTvtxhXxynkl6bJraK8X+HspEYY2GA5vLD6RNs1VBZ/2Vu3AYw3e3rYl+9
	W2esmBUbu0MY8WV5OzaQ+lrhVhUij3LBlIF6gO7lwfSJ7iwXYJAKjCVNsfM1e6CBHOTfSaWHR7U
	ew+Tmdu4gB9hc+ku4ZRpSaHLODeJ4Qfgx4DnGOjdNE/acqp9dCqZRaSlfRthV1gEetAbK8CnXcG
	z5Sy6tqC1IaIcHTc1CPW/vZ3D4BRNo/BsLHF7vBBXsfgwVZSvMIyMIDrGZ9Bhlsu07juG0AneU8
	5CI6sSfh7baL7hUWK9uqu9cPCDTFIx5T8eaTveAh8LDlQGw01M/IIq8EKV/AtRL5AF9KFDd+t5n
	i/P0NLizX5fU412PCxY2lNISSTI88aY7LOmggYMyT/ebkXorYAByqdoddlNCtkp+OkstGnW+7Ui
	PYS7MMA=
X-Received: by 2002:a05:690c:5687:b0:8ae:e79f:2534 with SMTP id
 00721157ae682-8b04f44d93cmr1969617b3.52.1791280205216; Tue, 06 Oct 2026
 02:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20261006094610.1636779-1-f_l_k@t-online.de>
In-Reply-To: <20261006094610.1636779-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Oct 2026 11:49:38 +0200
X-Gm-Features: AclHuK-7690TPPZlBnqQe8YDql6nqLcfzZtg0M_O9EmRPNbD1aG3-ZihsKukLxg
Message-ID: <CAMKF1srjsORgQAGVfLTgR5GCEuaH96kxDHGxG_3jseR+nPYVWg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] ibus: let the build compiler find its
 own C standard option
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005343f8065d28ec1b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2026 09:50:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130633

--0000000000005343f8065d28ec1b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Patch looks ok, please submit it to ibus upstream as well.

On Tue, Oct 6, 2026 at 11:46=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> ibus bundles ax_prog_cc_for_build.m4 serial 21, which does not rename
> the ac_cv_prog_cc_c23 cache variable of autoconf 2.73. CC_FOR_BUILD then
> takes the option of the cross compiler: with clang it becomes
> "gcc -std=3Dgnu23", which GCC 13 and older reject when unicode-parser is
> built. Update the macro to serial 26 from autoconf-archive.
>
> Upstream-Status: Pending
>
> Tested by building ibus for x86-64 with ac_cv_prog_cc_c23=3D-std=3Dgnu23
> preset for the target compiler; CC_FOR_BUILD is plain gcc.
>
> AI-Generated: Uses Claude Code (Claude Opus 5.5)
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...ax_prog_cc_for_build.m4-to-serial-26.patch | 178 ++++++++++++++++++
>  .../recipes-support/ibus/ibus_1.5.34.bb       |   1 +
>  2 files changed, 179 insertions(+)
>  create mode 100644
> meta-gnome/recipes-support/ibus/ibus/0001-m4-update-ax_prog_cc_for_build.=
m4-to-serial-26.patch
>
> diff --git
> a/meta-gnome/recipes-support/ibus/ibus/0001-m4-update-ax_prog_cc_for_buil=
d.m4-to-serial-26.patch
> b/meta-gnome/recipes-support/ibus/ibus/0001-m4-update-ax_prog_cc_for_buil=
d.m4-to-serial-26.patch
> new file mode 100644
> index 0000000000..5029d9a86c
> --- /dev/null
> +++
> b/meta-gnome/recipes-support/ibus/ibus/0001-m4-update-ax_prog_cc_for_buil=
d.m4-to-serial-26.patch
> @@ -0,0 +1,178 @@
> +From 14547094541136957eee60bd6665263c0a69f17c Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Tue, 6 Oct 2026 11:13:24 +0200
> +Subject: [PATCH] m4: update ax_prog_cc_for_build.m4 to serial 26
> +
> +Serial 21 renames the cache variables of AC_PROG_CC only up to
> +ac_cv_prog_cc_c11. Autoconf 2.73 adds ac_cv_prog_cc_c23, so the build
> +compiler inherits the result of the host compiler. When the host
> +compiler needs -std=3Dgnu23, CC_FOR_BUILD becomes "gcc -std=3Dgnu23" and
> +fails with GCC 13 and older.
> +
> +Serial 26 from autoconf-archive also renames ac_cv_prog_cc_c23.
> +
> +Upstream-Status: Pending
> +---
> + m4/ax_prog_cc_for_build.m4 | 78 ++++++++++++++++++++++++--------------
> + 1 file changed, 49 insertions(+), 29 deletions(-)
> +
> +diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
> +index 1db8d73f..4d1de993 100644
> +--- a/m4/ax_prog_cc_for_build.m4
> ++++ b/m4/ax_prog_cc_for_build.m4
> +@@ -32,7 +32,7 @@
> + #   and this notice are preserved. This file is offered as-is, without
> any
> + #   warranty.
> +
> +-#serial 21
> ++#serial 26
> +
> + AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])
> + AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl
> +@@ -43,16 +43,16 @@ AC_REQUIRE([AC_CANONICAL_BUILD])dnl
> + dnl Use the standard macros, but make them use other variable names
> + dnl
> + pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
> ++pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
> + pushdef([ac_cv_prog_cc_c89], ac_cv_build_prog_cc_c89)dnl
> + pushdef([ac_cv_prog_cc_c99], ac_cv_build_prog_cc_c99)dnl
> + pushdef([ac_cv_prog_cc_c11], ac_cv_build_prog_cc_c11)dnl
> +-pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
> ++pushdef([ac_cv_prog_cc_c23], ac_cv_build_prog_cc_c23)dnl
> ++pushdef([ac_cv_prog_cc_stdc], ac_cv_build_prog_cc_stdc)dnl
> + pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
> + pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
> + pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
> +-pushdef([ac_cv_c_compiler_gnu], ac_cv_build_c_compiler_gnu)dnl
> +-pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
> +-pushdef([ac_cv_objext], ac_cv_build_objext)dnl
> ++pushdef([ac_prog_cc_stdc], ac_build_prog_cc_stdc)dnl
> + pushdef([ac_exeext], ac_build_exeext)dnl
> + pushdef([ac_objext], ac_build_objext)dnl
> + pushdef([CC], CC_FOR_BUILD)dnl
> +@@ -60,9 +60,7 @@ pushdef([CPP], CPP_FOR_BUILD)dnl
> + pushdef([GCC], GCC_FOR_BUILD)dnl
> + pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl
> + pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl
> +-pushdef([EXEEXT], BUILD_EXEEXT)dnl
> + pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl
> +-pushdef([OBJEXT], BUILD_OBJEXT)dnl
> + pushdef([host], build)dnl
> + pushdef([host_alias], build_alias)dnl
> + pushdef([host_cpu], build_cpu)dnl
> +@@ -77,6 +75,32 @@ pushdef([ac_tool_prefix], ac_build_tool_prefix)dnl
> + pushdef([am_cv_CC_dependencies_compiler_type],
> am_cv_build_CC_dependencies_compiler_type)dnl
> + pushdef([am_cv_prog_cc_c_o], am_cv_build_prog_cc_c_o)dnl
> + pushdef([cross_compiling], cross_compiling_build)dnl
> ++dnl
> ++dnl These variables are problematic to rename by M4 macros, so we save
> ++dnl their values in alternative names, and restore the values later.
> ++dnl
> ++dnl _AC_COMPILER_EXEEXT and _AC_COMPILER_OBJEXT internally call
> ++dnl AC_SUBST which prevents the renaming of EXEEXT and OBJEXT
> ++dnl variables. It's not a good idea to rename ac_cv_exeext and
> ++dnl ac_cv_objext either as they're related.
> ++dnl Renaming ac_exeext and ac_objext is safe though.
> ++dnl
> ++ac_cv_host_exeext=3D$ac_cv_exeext
> ++AS_VAR_SET_IF([ac_cv_build_exeext],
> ++  [ac_cv_exeext=3D$ac_cv_build_exeext],
> ++  [AS_UNSET([ac_cv_exeext])])
> ++ac_cv_host_objext=3D$ac_cv_objext
> ++AS_VAR_SET_IF([ac_cv_build_objext],
> ++  [ac_cv_objext=3D$ac_cv_build_objext],
> ++  [AS_UNSET([ac_cv_objext])])
> ++dnl
> ++dnl ac_cv_c_compiler_gnu is used in _AC_LANG_COMPILER_GNU (called by
> ++dnl AC_PROG_CC) indirectly.
> ++dnl
> ++ac_cv_host_c_compiler_gnu=3D$ac_cv_c_compiler_gnu
> ++AS_VAR_SET_IF([ac_cv_build_c_compiler_gnu],
> ++  [ac_cv_c_compiler_gnu=3D$ac_cv_build_c_compiler_gnu],
> ++  [AS_UNSET([ac_cv_c_compiler_gnu])])
> +
> + cross_compiling_build=3Dno
> +
> +@@ -85,25 +109,14 @@ AS_IF([test -n "$build"],
> [ac_build_tool_prefix=3D"$build-"],
> +       [test -n "$build_alias"],[ac_build_tool_prefix=3D"$build_alias-"]=
)
> +
> + AC_LANG_PUSH([C])
> +-
> +-dnl The pushdef([ac_cv_c_compiler_gnu], ...) currently does not cover
> +-dnl the use of this variable in _AC_LANG_COMPILER_GNU called by
> +-dnl AC_PROG_CC. Unset this cache variable temporarily as a workaround.
> +-was_set_c_compiler_gnu=3D${[ac_cv_c_compiler_gnu]+y}
> +-AS_IF([test ${was_set_c_compiler_gnu}],
> +-    [saved_c_compiler_gnu=3D$[ac_cv_c_compiler_gnu]
> +-    AS_UNSET([[ac_cv_c_compiler_gnu]])])
> +-
> + AC_PROG_CC
> +-
> +-dnl Restore ac_cv_c_compiler_gnu
> +-AS_IF([test ${was_set_c_compiler_gnu}],
> +-  [[ac_cv_c_compiler_gnu]=3D$[saved_c_compiler_gnu]])
> +-
> + _AC_COMPILER_EXEEXT
> + _AC_COMPILER_OBJEXT
> + AC_PROG_CPP
> +
> ++BUILD_EXEEXT=3D$ac_cv_exeext
> ++BUILD_OBJEXT=3D$ac_cv_objext
> ++
> + dnl Restore the old definitions
> + dnl
> + popdef([cross_compiling])dnl
> +@@ -120,9 +133,7 @@ popdef([host_vendor])dnl
> + popdef([host_cpu])dnl
> + popdef([host_alias])dnl
> + popdef([host])dnl
> +-popdef([OBJEXT])dnl
> + popdef([LDFLAGS])dnl
> +-popdef([EXEEXT])dnl
> + popdef([CPPFLAGS])dnl
> + popdef([CFLAGS])dnl
> + popdef([GCC])dnl
> +@@ -130,25 +141,34 @@ popdef([CPP])dnl
> + popdef([CC])dnl
> + popdef([ac_objext])dnl
> + popdef([ac_exeext])dnl
> +-popdef([ac_cv_objext])dnl
> +-popdef([ac_cv_exeext])dnl
> +-popdef([ac_cv_c_compiler_gnu])dnl
> ++popdef([ac_prog_cc_stdc])dnl
> + popdef([ac_cv_prog_cc_g])dnl
> + popdef([ac_cv_prog_cc_cross])dnl
> + popdef([ac_cv_prog_cc_works])dnl
> ++popdef([ac_cv_prog_cc_stdc])dnl
> ++popdef([ac_cv_prog_cc_c23])dnl
> ++popdef([ac_cv_prog_cc_c11])dnl
> ++popdef([ac_cv_prog_cc_c99])dnl
> + popdef([ac_cv_prog_cc_c89])dnl
> + popdef([ac_cv_prog_gcc])dnl
> + popdef([ac_cv_prog_CPP])dnl
> ++dnl
> ++ac_cv_exeext=3D$ac_cv_host_exeext
> ++EXEEXT=3D$ac_cv_host_exeext
> ++ac_cv_objext=3D$ac_cv_host_objext
> ++OBJEXT=3D$ac_cv_host_objext
> ++ac_cv_c_compiler_gnu=3D$ac_cv_host_c_compiler_gnu
> ++ac_compiler_gnu=3D$ac_cv_host_c_compiler_gnu
> +
> + dnl restore global variables ac_ext, ac_cpp, ac_compile,
> +-dnl ac_link, ac_compiler_gnu (dependant on the current
> ++dnl ac_link, ac_compiler_gnu (dependent on the current
> + dnl language after popping):
> + AC_LANG_POP([C])
> +
> + dnl Finally, set Makefile variables
> + dnl
> +-AC_SUBST(BUILD_EXEEXT)dnl
> +-AC_SUBST(BUILD_OBJEXT)dnl
> ++AC_SUBST([BUILD_EXEEXT])dnl
> ++AC_SUBST([BUILD_OBJEXT])dnl
> + AC_SUBST([CFLAGS_FOR_BUILD])dnl
> + AC_SUBST([CPPFLAGS_FOR_BUILD])dnl
> + AC_SUBST([LDFLAGS_FOR_BUILD])dnl
> +--
> +2.55.0
> +
> diff --git a/meta-gnome/recipes-support/ibus/ibus_1.5.34.bb
> b/meta-gnome/recipes-support/ibus/ibus_1.5.34.bb
> index b4d24ed702..b9f2beb7d3 100644
> --- a/meta-gnome/recipes-support/ibus/ibus_1.5.34.bb
> +++ b/meta-gnome/recipes-support/ibus/ibus_1.5.34.bb
> @@ -10,6 +10,7 @@ SRC_URI =3D " \
>      file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch=
 \
>
>  file://0001-src-make-an-IBusText-own-an-updated-IBusAttrList-ref.patch \
>      file://0002-src-Fix-IBusAttrList-leak-when-converting-text.patch \
> +    file://0001-m4-update-ax_prog_cc_for_build.m4-to-serial-26.patch \
>  "
>  SRCREV =3D "1f7af28437afd62a6d145bfc81035e698a37411d"
>
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130632):
> https://lists.openembedded.org/g/openembedded-devel/message/130632
> Mute This Topic: https://lists.openembedded.org/mt/121607124/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005343f8065d28ec1b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Patch looks ok, please submit it to ibus upstream as well.=
=C2=A0</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Oct 6, 2026 at 11:46=E2=80=AFAM Marku=
s Volk via <a href=3D"http://lists.openembedded.org">lists.openembedded.org=
</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.openembedded.org">t-on=
line.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">ibus bundles ax_prog_cc_for_build.m4 serial 2=
1, which does not rename<br>
the ac_cv_prog_cc_c23 cache variable of autoconf 2.73. CC_FOR_BUILD then<br=
>
takes the option of the cross compiler: with clang it becomes<br>
&quot;gcc -std=3Dgnu23&quot;, which GCC 13 and older reject when unicode-pa=
rser is<br>
built. Update the macro to serial 26 from autoconf-archive.<br>
<br>
Upstream-Status: Pending<br>
<br>
Tested by building ibus for x86-64 with ac_cv_prog_cc_c23=3D-std=3Dgnu23<br=
>
preset for the target compiler; CC_FOR_BUILD is plain gcc.<br>
<br>
AI-Generated: Uses Claude Code (Claude Opus 5.5)<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0...ax_prog_cc_for_build.m4-to-serial-26.patch | 178 +++++++++++++++++=
+<br>
=C2=A0.../recipes-support/ibus/<a href=3D"http://ibus_1.5.34.bb" rel=3D"nor=
eferrer" target=3D"_blank">ibus_1.5.34.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 179 insertions(+)<br>
=C2=A0create mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-m4-updat=
e-ax_prog_cc_for_build.m4-to-serial-26.patch<br>
<br>
diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-m4-update-ax_prog_cc=
_for_build.m4-to-serial-26.patch b/meta-gnome/recipes-support/ibus/ibus/000=
1-m4-update-ax_prog_cc_for_build.m4-to-serial-26.patch<br>
new file mode 100644<br>
index 0000000000..5029d9a86c<br>
--- /dev/null<br>
+++ b/meta-gnome/recipes-support/ibus/ibus/0001-m4-update-ax_prog_cc_for_bu=
ild.m4-to-serial-26.patch<br>
@@ -0,0 +1,178 @@<br>
+From 14547094541136957eee60bd6665263c0a69f17c Mon Sep 17 00:00:00 2001<br>
+From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blan=
k">f_l_k@t-online.de</a>&gt;<br>
+Date: Tue, 6 Oct 2026 11:13:24 +0200<br>
+Subject: [PATCH] m4: update ax_prog_cc_for_build.m4 to serial 26<br>
+<br>
+Serial 21 renames the cache variables of AC_PROG_CC only up to<br>
+ac_cv_prog_cc_c11. Autoconf 2.73 adds ac_cv_prog_cc_c23, so the build<br>
+compiler inherits the result of the host compiler. When the host<br>
+compiler needs -std=3Dgnu23, CC_FOR_BUILD becomes &quot;gcc -std=3Dgnu23&q=
uot; and<br>
+fails with GCC 13 and older.<br>
+<br>
+Serial 26 from autoconf-archive also renames ac_cv_prog_cc_c23.<br>
+<br>
+Upstream-Status: Pending<br>
+---<br>
+ m4/ax_prog_cc_for_build.m4 | 78 ++++++++++++++++++++++++--------------<br=
>
+ 1 file changed, 49 insertions(+), 29 deletions(-)<br>
+<br>
+diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4<br>
+index 1db8d73f..4d1de993 100644<br>
+--- a/m4/ax_prog_cc_for_build.m4<br>
++++ b/m4/ax_prog_cc_for_build.m4<br>
+@@ -32,7 +32,7 @@<br>
+ #=C2=A0 =C2=A0and this notice are preserved. This file is offered as-is, =
without any<br>
+ #=C2=A0 =C2=A0warranty.<br>
+ <br>
+-#serial 21<br>
++#serial 26<br>
+ <br>
+ AU_ALIAS([AC_PROG_CC_FOR_BUILD], [AX_PROG_CC_FOR_BUILD])<br>
+ AC_DEFUN([AX_PROG_CC_FOR_BUILD], [dnl<br>
+@@ -43,16 +43,16 @@ AC_REQUIRE([AC_CANONICAL_BUILD])dnl<br>
+ dnl Use the standard macros, but make them use other variable names<br>
+ dnl<br>
+ pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl<br>
++pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl<br>
+ pushdef([ac_cv_prog_cc_c89], ac_cv_build_prog_cc_c89)dnl<br>
+ pushdef([ac_cv_prog_cc_c99], ac_cv_build_prog_cc_c99)dnl<br>
+ pushdef([ac_cv_prog_cc_c11], ac_cv_build_prog_cc_c11)dnl<br>
+-pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl<br>
++pushdef([ac_cv_prog_cc_c23], ac_cv_build_prog_cc_c23)dnl<br>
++pushdef([ac_cv_prog_cc_stdc], ac_cv_build_prog_cc_stdc)dnl<br>
+ pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl<br>
+ pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl<br>
+ pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl<br>
+-pushdef([ac_cv_c_compiler_gnu], ac_cv_build_c_compiler_gnu)dnl<br>
+-pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl<br>
+-pushdef([ac_cv_objext], ac_cv_build_objext)dnl<br>
++pushdef([ac_prog_cc_stdc], ac_build_prog_cc_stdc)dnl<br>
+ pushdef([ac_exeext], ac_build_exeext)dnl<br>
+ pushdef([ac_objext], ac_build_objext)dnl<br>
+ pushdef([CC], CC_FOR_BUILD)dnl<br>
+@@ -60,9 +60,7 @@ pushdef([CPP], CPP_FOR_BUILD)dnl<br>
+ pushdef([GCC], GCC_FOR_BUILD)dnl<br>
+ pushdef([CFLAGS], CFLAGS_FOR_BUILD)dnl<br>
+ pushdef([CPPFLAGS], CPPFLAGS_FOR_BUILD)dnl<br>
+-pushdef([EXEEXT], BUILD_EXEEXT)dnl<br>
+ pushdef([LDFLAGS], LDFLAGS_FOR_BUILD)dnl<br>
+-pushdef([OBJEXT], BUILD_OBJEXT)dnl<br>
+ pushdef([host], build)dnl<br>
+ pushdef([host_alias], build_alias)dnl<br>
+ pushdef([host_cpu], build_cpu)dnl<br>
+@@ -77,6 +75,32 @@ pushdef([ac_tool_prefix], ac_build_tool_prefix)dnl<br>
+ pushdef([am_cv_CC_dependencies_compiler_type], am_cv_build_CC_dependencie=
s_compiler_type)dnl<br>
+ pushdef([am_cv_prog_cc_c_o], am_cv_build_prog_cc_c_o)dnl<br>
+ pushdef([cross_compiling], cross_compiling_build)dnl<br>
++dnl<br>
++dnl These variables are problematic to rename by M4 macros, so we save<br=
>
++dnl their values in alternative names, and restore the values later.<br>
++dnl<br>
++dnl _AC_COMPILER_EXEEXT and _AC_COMPILER_OBJEXT internally call<br>
++dnl AC_SUBST which prevents the renaming of EXEEXT and OBJEXT<br>
++dnl variables. It&#39;s not a good idea to rename ac_cv_exeext and<br>
++dnl ac_cv_objext either as they&#39;re related.<br>
++dnl Renaming ac_exeext and ac_objext is safe though.<br>
++dnl<br>
++ac_cv_host_exeext=3D$ac_cv_exeext<br>
++AS_VAR_SET_IF([ac_cv_build_exeext],<br>
++=C2=A0 [ac_cv_exeext=3D$ac_cv_build_exeext],<br>
++=C2=A0 [AS_UNSET([ac_cv_exeext])])<br>
++ac_cv_host_objext=3D$ac_cv_objext<br>
++AS_VAR_SET_IF([ac_cv_build_objext],<br>
++=C2=A0 [ac_cv_objext=3D$ac_cv_build_objext],<br>
++=C2=A0 [AS_UNSET([ac_cv_objext])])<br>
++dnl<br>
++dnl ac_cv_c_compiler_gnu is used in _AC_LANG_COMPILER_GNU (called by<br>
++dnl AC_PROG_CC) indirectly.<br>
++dnl<br>
++ac_cv_host_c_compiler_gnu=3D$ac_cv_c_compiler_gnu<br>
++AS_VAR_SET_IF([ac_cv_build_c_compiler_gnu],<br>
++=C2=A0 [ac_cv_c_compiler_gnu=3D$ac_cv_build_c_compiler_gnu],<br>
++=C2=A0 [AS_UNSET([ac_cv_c_compiler_gnu])])<br>
+ <br>
+ cross_compiling_build=3Dno<br>
+ <br>
+@@ -85,25 +109,14 @@ AS_IF([test -n &quot;$build&quot;],=C2=A0 =C2=A0 =C2=
=A0 [ac_build_tool_prefix=3D&quot;$build-&quot;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[test -n &quot;$build_alias&quot;],[ac_build_to=
ol_prefix=3D&quot;$build_alias-&quot;])<br>
+ <br>
+ AC_LANG_PUSH([C])<br>
+-<br>
+-dnl The pushdef([ac_cv_c_compiler_gnu], ...) currently does not cover<br>
+-dnl the use of this variable in _AC_LANG_COMPILER_GNU called by<br>
+-dnl AC_PROG_CC. Unset this cache variable temporarily as a workaround.<br=
>
+-was_set_c_compiler_gnu=3D${[ac_cv_c_compiler_gnu]+y}<br>
+-AS_IF([test ${was_set_c_compiler_gnu}],<br>
+-=C2=A0 =C2=A0 [saved_c_compiler_gnu=3D$[ac_cv_c_compiler_gnu]<br>
+-=C2=A0 =C2=A0 AS_UNSET([[ac_cv_c_compiler_gnu]])])<br>
+-<br>
+ AC_PROG_CC<br>
+-<br>
+-dnl Restore ac_cv_c_compiler_gnu<br>
+-AS_IF([test ${was_set_c_compiler_gnu}],<br>
+-=C2=A0 [[ac_cv_c_compiler_gnu]=3D$[saved_c_compiler_gnu]])<br>
+-<br>
+ _AC_COMPILER_EXEEXT<br>
+ _AC_COMPILER_OBJEXT<br>
+ AC_PROG_CPP<br>
+ <br>
++BUILD_EXEEXT=3D$ac_cv_exeext<br>
++BUILD_OBJEXT=3D$ac_cv_objext<br>
++<br>
+ dnl Restore the old definitions<br>
+ dnl<br>
+ popdef([cross_compiling])dnl<br>
+@@ -120,9 +133,7 @@ popdef([host_vendor])dnl<br>
+ popdef([host_cpu])dnl<br>
+ popdef([host_alias])dnl<br>
+ popdef([host])dnl<br>
+-popdef([OBJEXT])dnl<br>
+ popdef([LDFLAGS])dnl<br>
+-popdef([EXEEXT])dnl<br>
+ popdef([CPPFLAGS])dnl<br>
+ popdef([CFLAGS])dnl<br>
+ popdef([GCC])dnl<br>
+@@ -130,25 +141,34 @@ popdef([CPP])dnl<br>
+ popdef([CC])dnl<br>
+ popdef([ac_objext])dnl<br>
+ popdef([ac_exeext])dnl<br>
+-popdef([ac_cv_objext])dnl<br>
+-popdef([ac_cv_exeext])dnl<br>
+-popdef([ac_cv_c_compiler_gnu])dnl<br>
++popdef([ac_prog_cc_stdc])dnl<br>
+ popdef([ac_cv_prog_cc_g])dnl<br>
+ popdef([ac_cv_prog_cc_cross])dnl<br>
+ popdef([ac_cv_prog_cc_works])dnl<br>
++popdef([ac_cv_prog_cc_stdc])dnl<br>
++popdef([ac_cv_prog_cc_c23])dnl<br>
++popdef([ac_cv_prog_cc_c11])dnl<br>
++popdef([ac_cv_prog_cc_c99])dnl<br>
+ popdef([ac_cv_prog_cc_c89])dnl<br>
+ popdef([ac_cv_prog_gcc])dnl<br>
+ popdef([ac_cv_prog_CPP])dnl<br>
++dnl<br>
++ac_cv_exeext=3D$ac_cv_host_exeext<br>
++EXEEXT=3D$ac_cv_host_exeext<br>
++ac_cv_objext=3D$ac_cv_host_objext<br>
++OBJEXT=3D$ac_cv_host_objext<br>
++ac_cv_c_compiler_gnu=3D$ac_cv_host_c_compiler_gnu<br>
++ac_compiler_gnu=3D$ac_cv_host_c_compiler_gnu<br>
+ <br>
+ dnl restore global variables ac_ext, ac_cpp, ac_compile,<br>
+-dnl ac_link, ac_compiler_gnu (dependant on the current<br>
++dnl ac_link, ac_compiler_gnu (dependent on the current<br>
+ dnl language after popping):<br>
+ AC_LANG_POP([C])<br>
+ <br>
+ dnl Finally, set Makefile variables<br>
+ dnl<br>
+-AC_SUBST(BUILD_EXEEXT)dnl<br>
+-AC_SUBST(BUILD_OBJEXT)dnl<br>
++AC_SUBST([BUILD_EXEEXT])dnl<br>
++AC_SUBST([BUILD_OBJEXT])dnl<br>
+ AC_SUBST([CFLAGS_FOR_BUILD])dnl<br>
+ AC_SUBST([CPPFLAGS_FOR_BUILD])dnl<br>
+ AC_SUBST([LDFLAGS_FOR_BUILD])dnl<br>
+-- <br>
+2.55.0<br>
+<br>
diff --git a/meta-gnome/recipes-support/ibus/<a href=3D"http://ibus_1.5.34.=
bb" rel=3D"noreferrer" target=3D"_blank">ibus_1.5.34.bb</a> b/meta-gnome/re=
cipes-support/ibus/<a href=3D"http://ibus_1.5.34.bb" rel=3D"noreferrer" tar=
get=3D"_blank">ibus_1.5.34.bb</a><br>
index b4d24ed702..b9f2beb7d3 100644<br>
--- a/meta-gnome/recipes-support/ibus/<a href=3D"http://ibus_1.5.34.bb" rel=
=3D"noreferrer" target=3D"_blank">ibus_1.5.34.bb</a><br>
+++ b/meta-gnome/recipes-support/ibus/<a href=3D"http://ibus_1.5.34.bb" rel=
=3D"noreferrer" target=3D"_blank">ibus_1.5.34.bb</a><br>
@@ -10,6 +10,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbu=
s-lauch.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-src-make-an-IBusText-own-an-updated-IBusAtt=
rList-ref.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0002-src-Fix-IBusAttrList-leak-when-converting-t=
ext.patch \<br>
+=C2=A0 =C2=A0 file://0001-m4-update-ax_prog_cc_for_build.m4-to-serial-26.p=
atch \<br>
=C2=A0&quot;<br>
=C2=A0SRCREV =3D &quot;1f7af28437afd62a6d145bfc81035e698a37411d&quot;<br>
<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130632): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130632" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130632</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121607124/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121607124/1997914</a><br>
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

--0000000000005343f8065d28ec1b--

