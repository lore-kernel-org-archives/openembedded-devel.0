Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8DC4C433EF
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 07:44:21 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.41335.1635752661141400986
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 00:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SDWeIFnG;
 spf=pass (domain: gmail.com, ip: 209.85.216.44,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id om14so11559819pjb.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 00:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=u4Fu2TJ56X8E6pEeh8HV5I+aKcYGTMv5l9F9kbKoBws=;
        b=SDWeIFnGrTIeU43cfZse/GnzvV7io6RQ/4EOS/Ea9nW905eETa7S5D22edGKImEZbu
         bGkGBxIASBPVi9BIOKtmype3yOOq4mIDjV3gS4NJgZbmx2OVdUPUywoiCunuUjD+9G5a
         Rq7/3sjw9GlgxITJTeKvrvPioL9IUoY9paAIsFAfY8VBU5fK4rbD565oQCh2LGqqcdzC
         FEzl0PnjSmIOtvNBkMzBU75dkjnqrD44wuyopjmUF8a3ttYjn7AzNqF0h8mPDGgLffs3
         wrkp2gAEIoWs1vk/hRK+M6mL3jg1bhTGv2vBAgv73NNJIJl3+rRzFt2FjEctZa/Ad0jV
         C9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=u4Fu2TJ56X8E6pEeh8HV5I+aKcYGTMv5l9F9kbKoBws=;
        b=4+i5anMnJ8NvJ8DwFeEoye9XJkDpM5AUvIkrMVBfkyemc2P0H2P4ghMHvRvLqPmQ3F
         bdsk3GGbzLWKVO8JUmn3XSq7gQDyiPC4SuSeKwJ8RPcVRx8bTvuog6X814IIGfzksTfN
         v/8Hehr6GcAGAJmecpH4BPYtqEvm3HN4h9x7aTh+feI6iRT5RK4+qvProXNGHKnhkKIC
         LuaFWGNUn29iSew6+UmZ2t8nufK8q0e9D2YjJ0js2WNcZ0vbOlR/6usL4boHG3VKR4c8
         HdBO3ebuGKOz2MzV13gdMDDgjQny+gNLFfIjA77Aald7oU1BEAcLEa2e5k+6H7qysPBm
         cIhg==
X-Gm-Message-State: AOAM533nCbwZJeqSQtrkY6QOFB2dqUFjj3rtlo2GtlICyCfFcZnX/qUC
	RdZQSwTiSncasqwc04GYDfOzV9ZwxK/nq2vql4c=
X-Google-Smtp-Source: 
 ABdhPJwtM8lPW3evtUtyPRve2/iU8RlNMPC+O4h7hrAxBC1x2CuBW1+8AYA5l1smFy70af040NcmK+in3GN84bDrA3s=
X-Received: by 2002:a17:902:b716:b0:141:d36c:78fc with SMTP id
 d22-20020a170902b71600b00141d36c78fcmr9062935pls.59.1635752660409; Mon, 01
 Nov 2021 00:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211101065228.1430262-1-raj.khem@gmail.com>
 <20211101065228.1430262-3-raj.khem@gmail.com>
In-Reply-To: <20211101065228.1430262-3-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 1 Nov 2021 08:44:08 +0100
Message-ID: 
 <CALbNGRSJwoQt20sSmTpK3H0H6aGFhFync_xxK-4Cc3nbgenUNg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 3/4] gjs: Upgrade to 1.70.0 + mozjs-91
 branch
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 07:44:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93692

Please don't add this but wait few hours: Have mozjzs-78 and stable
gjs. [1] It tool me a while to get mozjs-78/gjs build on all  arches
(yes I mean it: all qemu machines oe-core offers).

Hope I am in the final test-iteration and can send out today...

[1] https://github.com/schnitzeltony/meta-openembedded/tree/de-rotten-meta-=
gnome-part-I

Cheers,

Andreas

On Mon, Nov 1, 2021 at 7:52 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> This is an attempt to fix the build, its needs some more work though
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../gjs/gjs/0001-Disable-tests-on-host.patch  | 33 --------
>  ...id-g_once_init_enter-error-in-GCC-11.patch | 77 -------------------
>  .../0001-meson-Disable-runtime-checks.patch   | 48 ++++++++++++
>  meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb    | 42 ----------
>  meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb    | 34 ++++++++
>  5 files changed, 82 insertions(+), 152 deletions(-)
>  delete mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-o=
n-host.patch
>  delete mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-maint-Avoid-g_o=
nce_init_enter-error-in-GCC-11.patch
>  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs/0001-meson-Disable-r=
untime-checks.patch
>  delete mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb
>  create mode 100644 meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb
>
> diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-host.=
patch b/meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-host.patch
> deleted file mode 100644
> index 0953214fbf..0000000000
> --- a/meta-gnome/recipes-gnome/gjs/gjs/0001-Disable-tests-on-host.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 95379de2132786f855e8caec1fd5869225774d02 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> -Date: Sat, 18 May 2019 01:14:07 +0200
> -Subject: [PATCH] Disable tests on host
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Upstream-Status: Inappropriate [OE-specific]
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ----
> - configure.ac | 4 +---
> - 1 file changed, 1 insertion(+), 3 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index fa4e136..056e96e 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -335,9 +335,7 @@ AS_IF([test "x$with_dbus_tests" !=3D "xno"], [
> - ])
> - AM_CONDITIONAL([DBUS_TESTS], [test "x$with_dbus_tests" !=3D "xno"])
> -
> --AC_MSG_CHECKING([for a suitable UTF-8 locale to run the tests in])
> --TESTS_LOCALE=3D$($srcdir/build/choose-tests-locale.sh)
> --AC_MSG_RESULT([$TESTS_LOCALE])
> -+TESTS_LOCALE=3DC
> - AC_SUBST([TESTS_LOCALE])
> -
> - AC_SUBST([gjsjsdir], [\${datadir}/gjs-1.0])
> ---
> -2.20.1
> -
> diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0001-maint-Avoid-g_once_ini=
t_enter-error-in-GCC-11.patch b/meta-gnome/recipes-gnome/gjs/gjs/0001-maint=
-Avoid-g_once_init_enter-error-in-GCC-11.patch
> deleted file mode 100644
> index 6343a24a2d..0000000000
> --- a/meta-gnome/recipes-gnome/gjs/gjs/0001-maint-Avoid-g_once_init_enter=
-error-in-GCC-11.patch
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -From dae0055be61937fe70252f3f4ee09b355aba2b8f Mon Sep 17 00:00:00 2001
> -From: Philip Chimento <philip.chimento@gmail.com>
> -Date: Sun, 14 Feb 2021 12:20:09 -0800
> -Subject: [PATCH] maint: Avoid g_once_init_enter error in GCC 11
> -
> -On platforms where g_once_init_enter() is defined to use C11 atomic
> -builtins, passing a pointer to a volatile value is an error in GCC 11 an=
d
> -later, in C++.
> -
> -More info about the GCC change:
> -https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D95378
> -https://gcc.gnu.org/pipermail/gcc-patches/2020-June/548283.html
> -
> -However, it's my understanding that in modern C++ there is no longer a
> -need to guard the initialization of these variables. Since C++11, static
> -local variables in a function are guaranteed to be initialized only once=
,
> -the first time control passes through that function. So we can just remo=
ve
> -the g_once_init_enter guard.
> -
> -More info:
> -https://en.cppreference.com/w/cpp/language/storage_duration#Static_local=
_variables
> -
> -Stack Overflow answers with quotations from the C++ standard:
> -https://stackoverflow.com/a/58804/172999
> -https://stackoverflow.com/a/8102145/172999
> -
> -Closes: #376
> ----
> - gjs/error-types.cpp | 32 +++++++++++++-------------------
> - 1 file changed, 13 insertions(+), 19 deletions(-)
> -
> -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gjs/-/commit/f=
02eaf3a9d3465915eb849428c2d9615e2184a4c]
> -diff --git a/gjs/error-types.cpp b/gjs/error-types.cpp
> -index 86cb878..5eba61b 100644
> ---- a/gjs/error-types.cpp
> -+++ b/gjs/error-types.cpp
> -@@ -31,24 +31,18 @@ G_DEFINE_QUARK(gjs-js-error-quark, gjs_js_error)
> - // clang-format on
> -
> - GType gjs_js_error_get_type(void) {
> --    static volatile GType g_type_id;
> --
> --    if (g_once_init_enter(&g_type_id)) {
> --        static GEnumValue errors[] =3D {
> --            { GJS_JS_ERROR_ERROR, "Error", "error" },
> --            { GJS_JS_ERROR_EVAL_ERROR, "EvalError", "eval-error" },
> --            { GJS_JS_ERROR_INTERNAL_ERROR, "InternalError", "internal-e=
rror" },
> --            { GJS_JS_ERROR_RANGE_ERROR, "RangeError", "range-error" },
> --            { GJS_JS_ERROR_REFERENCE_ERROR, "ReferenceError", "referenc=
e-error" },
> --            { GJS_JS_ERROR_STOP_ITERATION, "StopIteration", "stop-itera=
tion" },
> --            { GJS_JS_ERROR_SYNTAX_ERROR, "SyntaxError", "syntax-error" =
},
> --            { GJS_JS_ERROR_TYPE_ERROR, "TypeError", "type-error" },
> --            { GJS_JS_ERROR_URI_ERROR, "URIError", "uri-error" },
> --            { 0, nullptr, nullptr }
> --        };
> --
> --        g_type_id =3D g_enum_register_static("GjsJSError", errors);
> --    }
> --
> -+    static const GEnumValue errors[] =3D {
> -+        {GJS_JS_ERROR_ERROR, "Error", "error"},
> -+        {GJS_JS_ERROR_EVAL_ERROR, "EvalError", "eval-error"},
> -+        {GJS_JS_ERROR_INTERNAL_ERROR, "InternalError", "internal-error"=
},
> -+        {GJS_JS_ERROR_RANGE_ERROR, "RangeError", "range-error"},
> -+        {GJS_JS_ERROR_REFERENCE_ERROR, "ReferenceError", "reference-err=
or"},
> -+        {GJS_JS_ERROR_STOP_ITERATION, "StopIteration", "stop-iteration"=
},
> -+        {GJS_JS_ERROR_SYNTAX_ERROR, "SyntaxError", "syntax-error"},
> -+        {GJS_JS_ERROR_TYPE_ERROR, "TypeError", "type-error"},
> -+        {GJS_JS_ERROR_URI_ERROR, "URIError", "uri-error"},
> -+        {0, nullptr, nullptr}};
> -+    // Initialization of static local variable guaranteed only once in =
C++11
> -+    static GType g_type_id =3D g_enum_register_static("GjsJSError", err=
ors);
> -     return g_type_id;
> - }
> ---
> -2.31.1
> -
> diff --git a/meta-gnome/recipes-gnome/gjs/gjs/0001-meson-Disable-runtime-=
checks.patch b/meta-gnome/recipes-gnome/gjs/gjs/0001-meson-Disable-runtime-=
checks.patch
> new file mode 100644
> index 0000000000..da5a990326
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gjs/gjs/0001-meson-Disable-runtime-checks.=
patch
> @@ -0,0 +1,48 @@
> +From 399ad6ab6d5234199e17df2a16509549943646ce Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 20 Oct 2021 20:31:55 -0700
> +Subject: [PATCH] meson: Disable runtime checks
> +
> +Wont work in cross compile case
> +
> +Upstream-Status: Inappropriate [Cross-compile specific]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + meson.build | 21 ---------------------
> + 1 file changed, 21 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index b8112c16..37c6fdd4 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -252,27 +252,6 @@ release builds of SpiderMonkey. Try configuring Spi=
derMonkey with
> + --disable-debug.''')
> + endif
> +
> +-# Check if a minimal SpiderMonkey program compiles, links, and runs. If=
 not,
> +-# it's most likely the case that SpiderMonkey was configured incorrectl=
y, for
> +-# example by building mozglue as a shared library.
> +-minimal_program =3D cxx.run('''
> +-#include <js/Initialization.h>
> +-int main(void) {
> +-    if (!JS_Init()) return 1;
> +-    JS_ShutDown();
> +-    return 0;
> +-}
> +-''',
> +-    args: debug_arg, dependencies: spidermonkey,
> +-    name: 'SpiderMonkey sanity check')
> +-
> +-if not minimal_program.compiled() or minimal_program.returncode() !=3D =
0
> +-    error('''A minimal SpiderMonkey program
> +-could not be compiled, linked, or run. Most likely you should build it =
with a
> +-different configuration. Check the recommended configuration:
> +-https://github.com/spidermonkey-embedders/spidermonkey-embedding-exampl=
es/blob/esr91/docs/Building%20SpiderMonkey.md''')
> +-endif
> +-
> + have_printf_alternative_int =3D cc.compiles('''
> + #include <stdio.h>
> + int main(void) {
> +--
> +2.33.1
> +
> diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb b/meta-gnome/reci=
pes-gnome/gjs/gjs_1.58.8.bb
> deleted file mode 100644
> index 096e277bb4..0000000000
> --- a/meta-gnome/recipes-gnome/gjs/gjs_1.58.8.bb
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -SUMMARY =3D "Javascript bindings for GNOME"
> -LICENSE =3D "MIT & LGPLv2+"
> -LIC_FILES_CHKSUM =3D " \
> -    file://COPYING;md5=3Dbeb29cf17fabe736f0639b09ee6e76fa \
> -    file://COPYING.LGPL;md5=3D3bf50002aefd002f49e7bb854063f7e7 \
> -"
> -
> -GNOMEBASEBUILDCLASS =3D "autotools"
> -
> -DEPENDS =3D "mozjs gtk+3"
> -
> -inherit gnomebase gsettings gobject-introspection vala gettext features_=
check upstream-version-is-even pkgconfig
> -
> -SRC_URI[archive.sha256sum] =3D "7fb3eb746c17363d9ee47f4a5d0bb048f0075611=
763eb0da11d85e0e57aff381"
> -SRC_URI +=3D "file://0001-Disable-tests-on-host.patch \
> -            file://0001-maint-Avoid-g_once_init_enter-error-in-GCC-11.pa=
tch \
> -"
> -
> -# gobject-introspection is mandatory and cannot be configured
> -REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
> -UNKNOWN_CONFIGURE_WHITELIST:append =3D " --enable-introspection --disabl=
e-introspection"
> -
> -EXTRA_OECONF =3D " \
> -    --without-dbus-tests \
> -    --disable-installed-tests \
> -"
> -
> -do_configure:prepend() {
> -    # make configure find gobject-introspection test code. Although we s=
et
> -    # --disable-installed-tests gjs builds them
> -    sed -i 's|:$GI_DATADIR|:${STAGING_DIR_NATIVE}$GI_DATADIR|g' ${S}/con=
figure.ac
> -}
> -
> -FILES:${PN} +=3D "${datadir}/gjs-1.0/lsan"
> -
> -PACKAGES =3D+ "${PN}-valgrind"
> -FILES:${PN}-valgrind =3D "${datadir}/gjs-1.0/valgrind"
> -RDEPENDS:${PN}-valgrind +=3D "valgrind"
> -
> -# Valgrind not yet available on rv32/rv64
> -RDEPENDS:${PN}-valgrind:remove:riscv32 =3D "valgrind"
> -RDEPENDS:${PN}-valgrind:remove:riscv64 =3D "valgrind"
> diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb b/meta-gnome/reci=
pes-gnome/gjs/gjs_1.70.0.bb
> new file mode 100644
> index 0000000000..d5f10ff3f5
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb
> @@ -0,0 +1,34 @@
> +SUMMARY =3D "Javascript bindings for GNOME"
> +LICENSE =3D "MIT & LGPLv2+"
> +LIC_FILES_CHKSUM =3D " \
> +    file://COPYING;md5=3D8dcea832f6acf45d856abfeb2d51ec48 \
> +"
> +
> +GNOMEBASEBUILDCLASS =3D "meson"
> +
> +DEPENDS =3D "mozjs gtk+3 dbus gobject-introspection libffi cairo"
> +
> +inherit gnomebase gsettings gobject-introspection gobject-introspection-=
data vala gettext features_check upstream-version-is-even pkgconfig
> +
> +PV .=3D "+git${SRCPV}"
> +SRCREV =3D "e41f247f8c170d125ce968ed236ae7249e966178"
> +SRC_URI =3D "git://gitlab.gnome.org/GNOME/gjs;protocol=3Dhttps;branch=3D=
mozjs91 \
> +           file://0001-meson-Disable-runtime-checks.patch \
> +          "
> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OEMESON +=3D "-Dinstalled_tests=3Dfalse -Dskip_dbus_tests=3Dtrue -=
Dskip_gtk_tests=3Dtrue -Dprofiler=3Ddisabled"
> +
> +# gobject-introspection is mandatory and cannot be configured
> +REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
> +
> +FILES:${PN} +=3D "${datadir}/gjs-1.0/lsan"
> +
> +PACKAGES =3D+ "${PN}-valgrind"
> +FILES:${PN}-valgrind =3D "${datadir}/gjs-1.0/valgrind"
> +RDEPENDS:${PN}-valgrind +=3D "valgrind"
> +
> +# Valgrind not yet available on rv32/rv64
> +RDEPENDS:${PN}-valgrind:remove:riscv32 =3D "valgrind"
> +RDEPENDS:${PN}-valgrind:remove:riscv64 =3D "valgrind"
> --
> 2.33.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93690): https://lists.openembedded.org/g/openembedded=
-devel/message/93690
> Mute This Topic: https://lists.openembedded.org/mt/86734007/3617609
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [s=
chnitzeltony@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

