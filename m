Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF9DCA0EE8
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 23:43:02 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.web11.20566.1757893381558568922
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Sep 2025 16:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gfzL8j9c;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-632adbd6050so136d50.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Sep 2025 16:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757893381; x=1758498181; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PlYGzh2mdmOESvoWow5Yn6cu53BzEZRVTJcYFxWD6g8=;
        b=gfzL8j9cdhxVz25a0KKHq/ziIhD9WUinK5c8+6Qc04cMOcjiSRALGfS/VTVamwS4Zs
         7L6Fx+/h6yWro7PLAv6YlAVN4SbDrsWYF58Utw5ttiPoOe1747tw2fcQXQ5Oyi7TSfqb
         PJ6HRPPOLnHuVoo19/rViB2AkS5RqesLZbmZxMOeVIjlvp5YHMyrFUwqsCHM0MCKzU3j
         dBrpjAGXxbkXKhxSaDClKqHmm6dvXP61UcoDbEElKF5J4rpVboBRw10FsIVFds1ZsnsJ
         ei1uZSesx/72mg2XfJ6uqOcruMXEHbUATAhNvQNY6oHcsYqKnVpqzJv7rOZMmJXVYTjm
         Lnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757893381; x=1758498181;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PlYGzh2mdmOESvoWow5Yn6cu53BzEZRVTJcYFxWD6g8=;
        b=elug3RDeZu4BBOVNXu1E+rosLZDaR0yywErh+GbBN//CJSp5BuHC2IkPs6zti9MKQ6
         pqQ/2/igD3aAyophGPI+85qXOyrLTSvCeaS8zHvqXr4bkkLnwKRFFfjE84BO/JVgd8pi
         eS1aLi37zYeWC8TRH6KLKO7YB/8OaE6dENeLqH9pywOKbJFV35NulRAbArRX+cysu19W
         nq8rm7zHEjTQNyUowLIUuwJP4fKvTOezAsbU9awy6EEAvnicZXtOzHswbAqxX8VXDd9B
         8jfdL/BKKnJYFYiGy6aOCxmirXn6hV1l/yNNxcFLD0Q02tH+NNmDEUC1h8/tQAw/abXr
         rwLA==
X-Gm-Message-State: AOJu0YyYnLoSXK+uak0JHWoxatTIpLsbfj4YNVqRQ9n03PmfrJByg6is
	hfvjnngYkTMNTjer6EWP9EZ4VmGZsvjF56diBIuFssYnOAYbOn9UFt49sR16K0iOI+k4T7eNbOE
	mOLC0KP+f/9AwFUyqV6hdUEiQSP0xPHIMzuyy
X-Gm-Gg: ASbGnctTkhU9gujpieDg1dy2J3n7rFwwTDJSKkdpCB3YuUwn4e5bZCMY8ZmDZ/oAIKy
	pXoQ9Lj2Karszl8IGWOvUHXhyDV8ArldtBaU5IWpxB/CXjpopIjoeRWmQtTuwuOj9jVVHFlhNXn
	SyL+KjbA/8qxAP9LBnks1/eqMV4ezTURLe2n1BmtfIsqug7uVjracjz/31FLJai33XANwBU1r+l
	/62zDdGFygyjdp75g/IkX7xoWLWKdumg2F3lmXeZWX16tUZ2/n6PUtqUCS88EE/NlM/9pcVOMdt
	W3tBZ/UGlHRq3piYH0DdOEUaftyJ8CfrFXqOQEn/qTLElUXrqzBAtOMNCcDh8L6Deo0E
X-Google-Smtp-Source: AGHT+IFzVej/XYX+ZqJbqMzb4/7ruqULzM3lCDs3bLlYD2Xw3uGwSQYz5tutf42GWebkx4PzsbtCJS2nd7k1Ab8vvK4=
X-Received: by 2002:a53:9304:0:b0:611:ecfe:3655 with SMTP id
 956f58d0204a3-627225a7bdemr7005960d50.30.1757893380339; Sun, 14 Sep 2025
 16:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <186511276CF969C9.5932@lists.openembedded.org> <8HEK2T.LCBU3EWSYQJ13@t-online.de>
In-Reply-To: <8HEK2T.LCBU3EWSYQJ13@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Sep 2025 16:42:49 -0700
X-Gm-Features: Ac12FXzN3tyOy7cB44gh6wLRSg6ZHMqloQL2Sz1sxrpK9Vz1lO2r1MuNZWjwUZE
Message-ID: <CAMKF1srUtVScbGN0F9hBOsTrP+sjF=meH5r3u4OXWo+UAW+8tg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][RFC][PATCH 1/2] mozjs: update 128 > 140
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007cfbe7063ecb7232"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Sep 2025 23:43:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119398

--0000000000007cfbe7063ecb7232
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, I wonder what to do about these patches then
Do you have gnome upgrade in pipeline or something that needs it ?

On Sat, Sep 13, 2025 at 11:10=E2=80=AFPM Markus Volk via lists.openembedded=
.org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> These recipes break gnome 48
>
> On Sun, Sep 14 2025 at 08:07:57 +02:00:00, Markus Volk via
> lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org> wrote=
:
>
> - rework some patches - drop applied patches - add some additional patche=
s
> from debian - add clang-native dependency since it is available in oe-cor=
e
> and llvm-objdump is needed in more places now Signed-off-by: Markus Volk =
<
> f_l_k@t-online.de> --- ...with-icu-uc-to-fix-build-with-ICU-76.patch | 27
> ------------ ...nfigure-do-not-look-for-llvm-objdump.patch | 43
> ------------------- ...001-Cargo.toml-do-not-abort-on-panic.patch | 0
> .../0001-add-arm-to-list-of-mozinline.patch | 0
> ...rewrite-cargo-host-linker-in-python3.patch | 13 +++---
> ...ix-one-occasionally-reproduced-confi.patch | 19 ++++----
> ...o-not-try-to-find-a-suitable-upstrea.patch | 0
> .../0004-use-asm-sgidefs.h.patch | 0
> ...ecurity-warning-when-disabling-forma.patch | 21 +++++++++
> ...nicalizedNaNBits-on-architectures-th.patch | 30 +++++++++++++
> .../Fix-math_private.h-for-i386-FTBFS.patch | 29 +++++++++++++
> .../{mozjs-128 =3D> mozjs-140}/armv5.patch | 0
> .../musl-disable-stackwalk.patch | 0 .../{mozjs-128 =3D>
> mozjs-140}/riscv.patch | 29 +++++++------ .../{mozjs-128 =3D>
> mozjs-140}/riscv32.patch | 0 ...js-128_128.5.2.bb =3D> mozjs-140_140.2.0.=
bb}
> | 11 ++--- 16 files changed, 118 insertions(+), 104 deletions(-) delete
> mode 100644
> meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-uc-to-fix-bui=
ld-with-ICU-76.patch
> delete mode 100644
> meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-look-f=
or-llvm-objdump.patch
> rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D>
> mozjs-140}/0001-Cargo.toml-do-not-abort-on-panic.patch (100%) rename
> meta-oe/recipes-extended/mozjs/{mozjs-128 =3D>
> mozjs-140}/0001-add-arm-to-list-of-mozinline.patch (100%) rename
> meta-oe/recipes-extended/mozjs/{mozjs-128 =3D>
> mozjs-140}/0001-rewrite-cargo-host-linker-in-python3.patch (86%) rename
> meta-oe/recipes-extended/mozjs/{mozjs-128 =3D>
> mozjs-140}/0001-util.configure-fix-one-occasionally-reproduced-confi.patc=
h
> (81%) rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D>
> mozjs-140}/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patc=
h
> (100%) rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D>
> mozjs-140}/0004-use-asm-sgidefs.h.patch (100%) create mode 100644
> meta-oe/recipes-extended/mozjs/mozjs-140/Disable-format-security-warning-=
when-disabling-forma.patch
> create mode 100644
> meta-oe/recipes-extended/mozjs/mozjs-140/Export-js-detail-CanonicalizedNa=
NBits-on-architectures-th.patch
> create mode 100644
> meta-oe/recipes-extended/mozjs/mozjs-140/Fix-math_private.h-for-i386-FTBF=
S.patch
> rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D> mozjs-140}/armv5.pa=
tch
> (100%) rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D>
> mozjs-140}/musl-disable-stackwalk.patch (100%) rename
> meta-oe/recipes-extended/mozjs/{mozjs-128 =3D> mozjs-140}/riscv.patch (53=
%)
> rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D>
> mozjs-140}/riscv32.patch (100%) rename meta-oe/recipes-extended/mozjs/{
> mozjs-128_128.5.2.bb =3D> mozjs-140_140.2.0.bb} (88%) diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-uc-to-fix-b=
uild-with-ICU-76.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-uc-to-fix-b=
uild-with-ICU-76.patch
> deleted file mode 100644 index 4fb7a28eeb..0000000000 ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-uc-to-fix-b=
uild-with-ICU-76.patch
> +++ /dev/null @@ -1,27 +0,0 @@ -From
> cbb5cc1022cc27edefc8eabbe21458cac9bda6fb Mon Sep 17 00:00:00 2001 -From:
> Khem Raj <raj.khem@gmail.com> -Date: Sat, 23 Nov 2024 13:28:33 -0800
> -Subject: [PATCH] Link with icu-uc to fix build with ICU-76 - -Fixes -
> https://bugzilla.mozilla.org/show_bug.cgi?id=3D1927380 - -Upstream-Status=
:
> Pending -Signed-off-by: Khem Raj <raj.khem@gmail.com> ---- -
> js/moz.configure | 2 +- - 1 file changed, 1 insertion(+), 1 deletion(-) -
> -diff --git a/js/moz.configure b/js/moz.configure -index
> 593b93acee..2181dca34b 100644 ---- a/js/moz.configure -+++
> b/js/moz.configure -@@ -1305,7 +1305,7 @@ def
> enable_system_icu_option(enable_system_icu): - return enable_system_icu -=
 -
> --system_icu =3D pkg_check_modules("MOZ_ICU", "icu-i18n >=3D 73.1",
> when=3D"--with-system-icu") -+system_icu =3D pkg_check_modules("MOZ_ICU",
> "icu-i18n >=3D 73.1 icu-uc", when=3D"--with-system-icu") - - -
> @depends(enable_system_icu_option) diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-look=
-for-llvm-objdump.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-look=
-for-llvm-objdump.patch
> deleted file mode 100644 index 9a82acf77b..0000000000 ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-look=
-for-llvm-objdump.patch
> +++ /dev/null @@ -1,43 +0,0 @@ -From
> 1a5331f1997788e9a25bbc2b10eb14e2ee418be9 Mon Sep 17 00:00:00 2001 -From:
> Alexander Kanavin <alex@linutronix.de> -Date: Fri, 1 Oct 2021 13:01:10
> +0200 -Subject: [PATCH] moz.configure: do not look for llvm-objdump - -Th=
is
> avoid dragging in a dependency that isn't even needed -for js builds. -
> -Upstream-Status: Inappropriate [oe-core specific] -Signed-off-by:
> Alexander Kanavin <alex@linutronix.de> ---- - moz.configure | 18
> +++++++++--------- - 1 file changed, 9 insertions(+), 9 deletions(-) -
> -diff --git a/moz.configure b/moz.configure -index 804b9a375a..402e79e3b3
> 100755 ---- a/moz.configure -+++ b/moz.configure -@@ -390,15 +390,15 @@ d=
ef
> plain_llvm_or_prefixed(name, llvm_name=3DNone): - return
> plain_llvm_or_prefixed - - --llvm_objdump =3D check_prog( -- "LLVM_OBJDUM=
P",
> -- llvm_tool("llvm-objdump"), -- what=3D"llvm-objdump", --
> when=3D"--enable-compile-environment", -- paths=3Dclang_search_path, --) =
--
> --add_old_configure_assignment("LLVM_OBJDUMP", llvm_objdump)
> -+#llvm_objdump =3D check_prog( -+# "LLVM_OBJDUMP", -+#
> llvm_tool("llvm-objdump"), -+# what=3D"llvm-objdump", -+#
> when=3D"--enable-compile-environment", -+# paths=3Dclang_search_path, -+#=
) -+#
> -+#add_old_configure_assignment("LLVM_OBJDUMP", llvm_objdump) - - - def
> validate_readelf(path): diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-not-abort-o=
n-panic.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0001-Cargo.toml-do-not-abort-o=
n-panic.patch
> similarity index 100% rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-not-abort-on-=
panic.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-140/0001-Cargo.toml-do-not-abort-on-=
panic.patch
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-list-of-mozinl=
ine.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0001-add-arm-to-list-of-mozinl=
ine.patch
> similarity index 100% rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-list-of-mozinlin=
e.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-140/0001-add-arm-to-list-of-mozinlin=
e.patch
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-host-linker=
-in-python3.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0001-rewrite-cargo-host-linker=
-in-python3.patch
> similarity index 86% rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-host-linker-i=
n-python3.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-140/0001-rewrite-cargo-host-linker-i=
n-python3.patch
> index 94e1651b33..b1a0243939 100644 ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-host-linker=
-in-python3.patch
> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0001-rewrite-cargo-host-linker=
-in-python3.patch
> @@ -18,18 +18,19 @@ rewrite cargo-host-linker in python3 Upstream-Status:
> Inappropriate [oe specific] Signed-off-by: Changqing Li <
> changqing.li@windriver.com> +Signed-off-by: Markus Volk <f_l_k@t-online.d=
e>
> --- build/cargo-host-linker | 24 +++++++++++++++++++++--- 1 file changed,
> 21 insertions(+), 3 deletions(-) -diff --git a/build/cargo-host-linker
> b/build/cargo-host-linker +diff --git a/build/cargo-host-linker.bat
> b/build/cargo-host-linker.bat index cbd0472bf7..87d43ce9ec 100755 ----
> a/build/cargo-host-linker -+++ b/build/cargo-host-linker +---
> a/build/cargo-host-linker.bat ++++ b/build/cargo-host-linker.bat @@ -1,3
> +1,21 @@ --#!/bin/sh --# See comment in cargo-linker. --eval
> ${MOZ_CARGO_WRAP_HOST_LD} ${MOZ_CARGO_WRAP_HOST_LDFLAGS} '"$@"' +-@echo o=
ff
> +-REM See comment in cargo-linker (without extension)
> +-%MOZ_CARGO_WRAP_HOST_LD% %* %MOZ_CARGO_WRAP_HOST_LDFLAGS% +#!/usr/bin/e=
nv
> python3 + +import os,sys diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure-fix-one-oc=
casionally-reproduced-confi.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0001-util.configure-fix-one-oc=
casionally-reproduced-confi.patch
> similarity index 81% rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure-fix-one-occa=
sionally-reproduced-confi.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-140/0001-util.configure-fix-one-occa=
sionally-reproduced-confi.patch
> index d53cc2bd41..99b0d28754 100644 ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure-fix-one-oc=
casionally-reproduced-confi.patch
> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0001-util.configure-fix-one-oc=
casionally-reproduced-confi.patch
> @@ -28,6 +28,7 @@ It should be another process that deleted this file by
> using Upstream-Status: Submitted [
> https://bugzilla.mozilla.org/show_bug.cgi?id=3D1740667] Signed-off-by:
> Changqing Li <changqing.li@windriver.com> +Signed-off-by: Markus Volk <
> f_l_k@t-online.de> --- build/moz.configure/util.configure | 2 +- 1 file
> changed, 1 insertion(+), 1 deletion(-) @@ -36,12 +37,12 @@ diff --git
> a/build/moz.configure/util.configure b/build/moz.configure/util.confi ind=
ex
> d93b91fcdd..47ab8b92b9 100644 --- a/build/moz.configure/util.configure ++=
+
> b/build/moz.configure/util.configure -@@ -256,7 +256,7 @@ def
> try_invoke_compiler( - "C++": ".cpp", - }[language] - -- fd, path =3D
> mkstemp(prefix=3D"conftest.", suffix=3Dsuffix, text=3DTrue) -+ fd, path =
=3D
> mkstemp(prefix=3D"try_invoke_compiler_conftest.", suffix=3Dsuffix, text=
=3DTrue) -
> try: - source =3D source.encode("ascii", "replace") - +@@ -169,7 +169,7 @=
@ +
> def make_create_temporary_file(): + @contextmanager + def
> create_temporary_file(suffix): +- fd, path =3D mkstemp(prefix=3D"conftest=
",
> suffix=3Dsuffix) ++ fd, path =3D
> mkstemp(prefix=3D"try_invoke_compiler_conftest.", suffix=3Dsuffix, text=
=3DTrue) +
> os.close(fd) + yield path + try: diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-do-not-try=
-to-find-a-suitable-upstrea.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0003-rust.configure-do-not-try=
-to-find-a-suitable-upstrea.patch
> similarity index 100% rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-do-not-try-t=
o-find-a-suitable-upstrea.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-140/0003-rust.configure-do-not-try-t=
o-find-a-suitable-upstrea.patch
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0004-use-asm-sgidefs.h.patch
> similarity index 100% rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-140/0004-use-asm-sgidefs.h.patch dif=
f
> --git
> a/meta-oe/recipes-extended/mozjs/mozjs-140/Disable-format-security-warnin=
g-when-disabling-forma.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/Disable-format-security-warnin=
g-when-disabling-forma.patch
> new file mode 100644 index 0000000000..27b8b71b5d --- /dev/null +++
> b/meta-oe/recipes-extended/mozjs/mozjs-140/Disable-format-security-warnin=
g-when-disabling-forma.patch
> @@ -0,0 +1,21 @@ +From: Mike Hommey <mh@glandium.org> +Date: Wed, 5 Mar
> 2025 07:16:17 +0900 +Subject: Disable format-security warning when
> disabling format warning + +Upstream-Status: Pending [Not my work. Taken
> from debian] + +Signed-off-by: Markus Volk <f_l_k@t-online.de> +--- +
> js/src/xsum/moz.build | 2 +- + 1 file changed, 1 insertion(+), 1
> deletion(-) + +diff --git a/js/src/xsum/moz.build b/js/src/xsum/moz.build
> +index dc7a4f2..30f64cd 100644 +--- a/js/src/xsum/moz.build ++++
> b/js/src/xsum/moz.build +@@ -17,4 +17,4 @@ SOURCES +=3D [ + ] + + # Suppr=
ess
> warnings in third-party code. +-SOURCES['xsum.cpp'].flags +=3D
> ['-Wno-implicit-fallthrough', '-Wno-format', '-Wno-unused-value']
> ++SOURCES['xsum.cpp'].flags +=3D ['-Wno-implicit-fallthrough', '-Wno-form=
at',
> '-Wno-format-security', '-Wno-unused-value'] diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-140/Export-js-detail-Canonicalized=
NaNBits-on-architectures-th.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/Export-js-detail-Canonicalized=
NaNBits-on-architectures-th.patch
> new file mode 100644 index 0000000000..0b90eaf909 --- /dev/null +++
> b/meta-oe/recipes-extended/mozjs/mozjs-140/Export-js-detail-Canonicalized=
NaNBits-on-architectures-th.patch
> @@ -0,0 +1,30 @@ +From: Simon McVittie <smcv@debian.org> +Date: Thu, 8
> Feb 2024 10:36:53 +0000 +Subject: Export js::detail::CanonicalizedNaNBits
> on architectures that use it + +Otherwise the inline function
> JS::CanonicalizeNaN(double), which is +called by gjs, cannot validly refe=
r
> to it. + +Bug-Debian: https://bugs.debian.org/1063446 +Signed-off-by:
> Simon McVittie <smcv@debian.org> + +Upstream-Status: Pending [Not my
> work. Taken from debian] + +Signed-off-by: Markus Volk <f_l_k@t-online.de=
>
> +--- + js/public/Value.h | 2 +- + 1 file changed, 1 insertion(+), 1
> deletion(-) + +diff --git a/js/public/Value.h b/js/public/Value.h +index
> c70d5b6..4bee5bc 100644 +--- a/js/public/Value.h ++++ b/js/public/Value.h
> +@@ -426,7 +426,7 @@ constexpr uint64_t CanonicalizedNaNSignificand =3D
> 0x8000000000000; + #endif + + #if defined(JS_RUNTIME_CANONICAL_NAN)
> +-extern uint64_t CanonicalizedNaNBits; ++extern JS_PUBLIC_DATA uint64_t
> CanonicalizedNaNBits; + #else + constexpr uint64_t CanonicalizedNaNBits =
=3D +
> mozilla::SpecificNaNBits<double, detail::CanonicalizedNaNSignBit, diff
> --git
> a/meta-oe/recipes-extended/mozjs/mozjs-140/Fix-math_private.h-for-i386-FT=
BFS.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/Fix-math_private.h-for-i386-FT=
BFS.patch
> new file mode 100644 index 0000000000..18d53cd068 --- /dev/null +++
> b/meta-oe/recipes-extended/mozjs/mozjs-140/Fix-math_private.h-for-i386-FT=
BFS.patch
> @@ -0,0 +1,29 @@ +From: Mike Hommey <mh@glandium.org> +Date: Sat, 27 Nov
> 2021 06:49:44 +0900 +Subject: Fix math_private.h for i386 FTBFS + +Origin=
:
> firefox-esr packaging, commit:
> https://salsa.debian.org/mozilla-team/firefox/-/commit/fc1e93ab0fd2068000=
6d6e25f301ec47b1969518
> + +Upstream-Status: Pending [Not my work. Taken from debian] +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de> +--- +
> modules/fdlibm/src/math_private.h | 4 ++++ + 1 file changed, 4
> insertions(+) + +diff --git a/modules/fdlibm/src/math_private.h
> b/modules/fdlibm/src/math_private.h +index 45f7401..29ca8a8 100644 +---
> a/modules/fdlibm/src/math_private.h ++++
> b/modules/fdlibm/src/math_private.h +@@ -30,7 +30,11 @@ + * Adapted from
> https://github.com/freebsd/freebsd-src/search?q=3D__double_t + */ + ++#if
> defined __FLT_EVAL_METHOD__ && (__FLT_EVAL_METHOD__ =3D=3D 2) ++typedef l=
ong
> double __double_t; ++#else + typedef double __double_t; ++#endif + typede=
f
> __double_t double_t; + typedef float __float_t; + diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/armv5.patch similarity index
> 100% rename from meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch
> rename to meta-oe/recipes-extended/mozjs/mozjs-140/armv5.patch diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackwalk.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/musl-disable-stackwalk.patch
> similarity index 100% rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackwalk.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-140/musl-disable-stackwalk.patch dif=
f
> --git a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/riscv.patch similarity index 5=
3%
> rename from meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch rename t=
o
> meta-oe/recipes-extended/mozjs/mozjs-140/riscv.patch index
> cb2dc66525..9967bb75cc 100644 ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch +++
> b/meta-oe/recipes-extended/mozjs/mozjs-140/riscv.patch @@ -4,27 +4,28 @@
> Rust uses above for architecture in tuples Upstream-Status: Pending
> Signed-off-by: Khem Raj <raj.khem@gmail.com> +Signed-off-by: Markus Volk =
<
> f_l_k@t-online.de> ---
> a/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py +++
> b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py -@@
> -1327,6 +1327,10 @@ class LinuxCrossCompileToolchainTest(Bas +@@ -1328,6
> +1328,8 @@ "mips-unknown-linux-gnu": big_endian + {"__mips__": 1},
> "riscv32-unknown-linux-gnu": little_endian + {"__riscv": 1, "__riscv_xlen=
":
> 32}, "riscv64-unknown-linux-gnu": little_endian + {"__riscv": 1,
> "__riscv_xlen": 64}, -+ "riscv32gc-unknown-linux-gnu": little_endian -+ +
> {"__riscv": 1, "__riscv_xlen": 32}, -+ "riscv64gc-unknown-linux-gnu":
> little_endian -+ + {"__riscv": 1, "__riscv_xlen": 64}, ++
> "riscv32gc-unknown-linux-gnu": little_endian + {"__riscv": 1,
> "__riscv_xlen": 32}, ++ "riscv64gc-unknown-linux-gnu": little_endian +
> {"__riscv": 1, "__riscv_xlen": 64}, "sh4-unknown-linux-gnu": little_endia=
n
> + {"__sh__": 1}, } --- a/build/autoconf/config.sub +++
> b/build/autoconf/config.sub -@@ -1236,7 +1236,7 @@ case $cpu-$vendor in -=
 |
> powerpc | powerpc64 | powerpc64le | powerpcle | powerpcspe \ - | pru \ - =
|
> pyramid \ -- | riscv | riscv32 | riscv32be | riscv64 | riscv64be \ -+ |
> riscv | riscv32 | riscv32be | riscv32gc | riscv64 | riscv64be | riscv64gc=
 \
> - | rl78 | romp | rs6000 | rx \ - | s390 | s390x \ - | score \ +@@ -1396,=
8
> +1396,10 @@ + | riscv \ + | riscv32 \ + | riscv32be \ ++ | riscv32gc \ + =
|
> riscv64 \ + | riscv64be \ ++ | riscv64gc \ + | rl78 \ + | romp \ + | rs60=
00
> \ diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/riscv32.patch similarity index
> 100% rename from meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch
> rename to meta-oe/recipes-extended/mozjs/mozjs-140/riscv32.patch diff --g=
it
> a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
> b/meta-oe/recipes-extended/mozjs/mozjs-140_140.2.0.bb similarity index
> 88% rename from meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
> rename to meta-oe/recipes-extended/mozjs/mozjs-140_140.2.0.bb index
> ceb81d07e5..e9e1c96921 100644 --- a/meta-oe/recipes-extended/mozjs/
> mozjs-128_128.5.2.bb +++ b/meta-oe/recipes-extended/mozjs/
> mozjs-140_140.2.0.bb @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Ddc9b6ecd19a14a54a628edaaf23733bf" SRC_URI =3D "
> https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/firefox-=
${PV}esr.source.tar.xz
> \ file://0001-Cargo.toml-do-not-abort-on-panic.patch \ -
> file://0002-moz.configure-do-not-look-for-llvm-objdump.patch \
> file://0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch \
> file://0004-use-asm-sgidefs.h.patch \ file://riscv32.patch \ @@ -14,19
> +13,21 @@ SRC_URI =3D "
> https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire
> file://musl-disable-stackwalk.patch \
> file://0001-add-arm-to-list-of-mozinline.patch \ file://armv5.patch \ -
> file://0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patch \
> file://riscv.patch \ +
> file://Disable-format-security-warning-when-disabling-forma.patch \ +
> file://Export-js-detail-CanonicalizedNaNBits-on-architectures-th.patch \
> + file://Fix-math_private.h-for-i386-FTBFS.patch \ " -SRC_URI[sha256sum]
> =3D "25d633eb81499cbda44b8c64fa1c1a5879d55024b864ef495d4997154d68358f"
> +SRC_URI[sha256sum] =3D
> "956dce675c3b706d563caf07ed3ca9af632ab830be710dfd4351da78a0a2ef55"
> -UPSTREAM_CHECK_URI =3D "https://tracker.debian.org/pkg/mozjs128"
> +UPSTREAM_CHECK_URI =3D "https://tracker.debian.org/pkg/mozjs140"
> UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)" S =3D
> "${UNPACKDIR}/firefox-${PV}" inherit pkgconfig perlnative python3native
> rust cargo -DEPENDS +=3D "zlib cbindgen-native python3 icu" +DEPENDS +=3D=
 "zlib
> cbindgen-native python3 icu clang-native" DEPENDS:remove:mipsarch =3D "ic=
u"
> DEPENDS:remove:powerpc:toolchain-clang =3D "icu"
> --
> 2.50.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119391):
> https://lists.openembedded.org/g/openembedded-devel/message/119391
> Mute This Topic: https://lists.openembedded.org/mt/115233753/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007cfbe7063ecb7232
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok, I wonder what to do about these patches then</div><di=
v dir=3D"auto">Do you have gnome upgrade in pipeline or something that need=
s it ?</div><div><br><div class=3D"gmail_quote gmail_quote_container"><div =
dir=3D"ltr" class=3D"gmail_attr">On Sat, Sep 13, 2025 at 11:10=E2=80=AFPM M=
arkus Volk via <a href=3D"http://lists.openembedded.org">lists.openembedded=
.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.openembedded.org">=
t-online.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div id=3D"m_-7295923986437580768geary-body" dir=3D"auto"><d=
iv>These recipes break gnome 48</div></div><div id=3D"m_-729592398643758076=
8geary-quote" dir=3D"auto"><br>On Sun, Sep 14 2025 at 08:07:57 +02:00:00, M=
arkus Volk via <a href=3D"http://lists.openembedded.org" target=3D"_blank">=
lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.=
openembedded.org" target=3D"_blank">t-online.de@lists.openembedded.org</a>&=
gt; wrote:<br><blockquote type=3D"cite"><div style=3D"white-space:break-spa=
ces">- rework some patches
- drop applied patches
- add some additional patches from debian
- add clang-native dependency since it is available in oe-core
  and llvm-objdump is needed in more places now

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;
---
 ...with-icu-uc-to-fix-build-with-ICU-76.patch | 27 ------------
 ...nfigure-do-not-look-for-llvm-objdump.patch | 43 -------------------
 ...001-Cargo.toml-do-not-abort-on-panic.patch |  0
 .../0001-add-arm-to-list-of-mozinline.patch   |  0
 ...rewrite-cargo-host-linker-in-python3.patch | 13 +++---
 ...ix-one-occasionally-reproduced-confi.patch | 19 ++++----
 ...o-not-try-to-find-a-suitable-upstrea.patch |  0
 .../0004-use-asm-sgidefs.h.patch              |  0
 ...ecurity-warning-when-disabling-forma.patch | 21 +++++++++
 ...nicalizedNaNBits-on-architectures-th.patch | 30 +++++++++++++
 .../Fix-math_private.h-for-i386-FTBFS.patch   | 29 +++++++++++++
 .../{mozjs-128 =3D&gt; mozjs-140}/armv5.patch      |  0
 .../musl-disable-stackwalk.patch              |  0
 .../{mozjs-128 =3D&gt; mozjs-140}/riscv.patch      | 29 +++++++------
 .../{mozjs-128 =3D&gt; mozjs-140}/riscv32.patch    |  0
 ...<a href=3D"http://js-128_128.5.2.bb" target=3D"_blank">js-128_128.5.2.b=
b</a> =3D&gt; <a href=3D"http://mozjs-140_140.2.0.bb" target=3D"_blank">moz=
js-140_140.2.0.bb</a>} | 11 ++---
 16 files changed, 118 insertions(+), 104 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with=
-icu-uc-to-fix-build-with-ICU-76.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.confi=
gure-do-not-look-for-llvm-objdump.patch
 rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D&gt; mozjs-140}/0001-C=
argo.toml-do-not-abort-on-panic.patch (100%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D&gt; mozjs-140}/0001-a=
dd-arm-to-list-of-mozinline.patch (100%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D&gt; mozjs-140}/0001-r=
ewrite-cargo-host-linker-in-python3.patch (86%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D&gt; mozjs-140}/0001-u=
til.configure-fix-one-occasionally-reproduced-confi.patch (81%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D&gt; mozjs-140}/0003-r=
ust.configure-do-not-try-to-find-a-suitable-upstrea.patch (100%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D&gt; mozjs-140}/0004-u=
se-asm-sgidefs.h.patch (100%)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-140/Disable-format=
-security-warning-when-disabling-forma.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-140/Export-js-deta=
il-CanonicalizedNaNBits-on-architectures-th.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-140/Fix-math_priva=
te.h-for-i386-FTBFS.patch
 rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D&gt; mozjs-140}/armv5.=
patch (100%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D&gt; mozjs-140}/musl-d=
isable-stackwalk.patch (100%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D&gt; mozjs-140}/riscv.=
patch (53%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D&gt; mozjs-140}/riscv3=
2.patch (100%)
 rename meta-oe/recipes-extended/mozjs/{<a href=3D"http://mozjs-128_128.5.2=
.bb" target=3D"_blank">mozjs-128_128.5.2.bb</a> =3D&gt; <a href=3D"http://m=
ozjs-140_140.2.0.bb" target=3D"_blank">mozjs-140_140.2.0.bb</a>} (88%)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-uc=
-to-fix-build-with-ICU-76.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/=
0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patch
deleted file mode 100644
index 4fb7a28eeb..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-uc-to-fix=
-build-with-ICU-76.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From cbb5cc1022cc27edefc8eabbe21458cac9bda6fb Mon Sep 17 00:00:00 2001
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;
-Date: Sat, 23 Nov 2024 13:28:33 -0800
-Subject: [PATCH] Link with icu-uc to fix build with ICU-76
-
-Fixes
-<a href=3D"https://bugzilla.mozilla.org/show_bug.cgi?id=3D1927380" target=
=3D"_blank">https://bugzilla.mozilla.org/show_bug.cgi?id=3D1927380</a>
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;
----
- js/moz.configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/js/moz.configure b/js/moz.configure
-index 593b93acee..2181dca34b 100644
---- a/js/moz.configure
-+++ b/js/moz.configure
-@@ -1305,7 +1305,7 @@ def enable_system_icu_option(enable_system_icu):
-     return enable_system_icu
-=20
-=20
--system_icu =3D pkg_check_modules(&quot;MOZ_ICU&quot;, &quot;icu-i18n &gt;=
=3D 73.1&quot;, when=3D&quot;--with-system-icu&quot;)
-+system_icu =3D pkg_check_modules(&quot;MOZ_ICU&quot;, &quot;icu-i18n &gt;=
=3D 73.1 icu-uc&quot;, when=3D&quot;--with-system-icu&quot;)
-=20
-=20
- @depends(enable_system_icu_option)
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do=
-not-look-for-llvm-objdump.patch b/meta-oe/recipes-extended/mozjs/mozjs-128=
/0002-moz.configure-do-not-look-for-llvm-objdump.patch
deleted file mode 100644
index 9a82acf77b..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-lo=
ok-for-llvm-objdump.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 1a5331f1997788e9a25bbc2b10eb14e2ee418be9 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" target=
=3D"_blank">alex@linutronix.de</a>&gt;
-Date: Fri, 1 Oct 2021 13:01:10 +0200
-Subject: [PATCH] moz.configure: do not look for llvm-objdump
-
-This avoid dragging in a dependency that isn&#39;t even needed
-for js builds.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
 target=3D"_blank">alex@linutronix.de</a>&gt;
----
- moz.configure | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/moz.configure b/moz.configure
-index 804b9a375a..402e79e3b3 100755
---- a/moz.configure
-+++ b/moz.configure
-@@ -390,15 +390,15 @@ def plain_llvm_or_prefixed(name, llvm_name=3DNone):
-     return plain_llvm_or_prefixed
-=20
-=20
--llvm_objdump =3D check_prog(
--    &quot;LLVM_OBJDUMP&quot;,
--    llvm_tool(&quot;llvm-objdump&quot;),
--    what=3D&quot;llvm-objdump&quot;,
--    when=3D&quot;--enable-compile-environment&quot;,
--    paths=3Dclang_search_path,
--)
--
--add_old_configure_assignment(&quot;LLVM_OBJDUMP&quot;, llvm_objdump)
-+#llvm_objdump =3D check_prog(
-+#    &quot;LLVM_OBJDUMP&quot;,
-+#    llvm_tool(&quot;llvm-objdump&quot;),
-+#    what=3D&quot;llvm-objdump&quot;,
-+#    when=3D&quot;--enable-compile-environment&quot;,
-+#    paths=3Dclang_search_path,
-+#)
-+#
-+#add_old_configure_assignment(&quot;LLVM_OBJDUMP&quot;, llvm_objdump)
-=20
-=20
- def validate_readelf(path):
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-no=
t-abort-on-panic.patch b/meta-oe/recipes-extended/mozjs/mozjs-140/0001-Carg=
o.toml-do-not-abort-on-panic.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-not=
-abort-on-panic.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0001-Cargo.toml-do-not-a=
bort-on-panic.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-list-=
of-mozinline.patch b/meta-oe/recipes-extended/mozjs/mozjs-140/0001-add-arm-=
to-list-of-mozinline.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-list-o=
f-mozinline.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0001-add-arm-to-list-of-=
mozinline.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-ho=
st-linker-in-python3.patch b/meta-oe/recipes-extended/mozjs/mozjs-140/0001-=
rewrite-cargo-host-linker-in-python3.patch
similarity index 86%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-hos=
t-linker-in-python3.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0001-rewrite-cargo-host-=
linker-in-python3.patch
index 94e1651b33..b1a0243939 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-host-link=
er-in-python3.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-140/0001-rewrite-cargo-host-link=
er-in-python3.patch
@@ -18,18 +18,19 @@ rewrite cargo-host-linker in python3
 Upstream-Status: Inappropriate [oe specific]
=20
 Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;
+Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;
 ---
  build/cargo-host-linker | 24 +++++++++++++++++++++---
  1 file changed, 21 insertions(+), 3 deletions(-)
=20
-diff --git a/build/cargo-host-linker b/build/cargo-host-linker
+diff --git a/build/cargo-host-linker.bat b/build/cargo-host-linker.bat
 index cbd0472bf7..87d43ce9ec 100755
---- a/build/cargo-host-linker
-+++ b/build/cargo-host-linker
+--- a/build/cargo-host-linker.bat
++++ b/build/cargo-host-linker.bat
 @@ -1,3 +1,21 @@
--#!/bin/sh
--# See comment in cargo-linker.
--eval ${MOZ_CARGO_WRAP_HOST_LD} ${MOZ_CARGO_WRAP_HOST_LDFLAGS} &#39;&quot;=
$@&quot;&#39;
+-@echo off
+-REM See comment in cargo-linker (without extension)
+-%MOZ_CARGO_WRAP_HOST_LD% %* %MOZ_CARGO_WRAP_HOST_LDFLAGS%
 +#!/usr/bin/env python3
 +
 +import os,sys
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure-f=
ix-one-occasionally-reproduced-confi.patch b/meta-oe/recipes-extended/mozjs=
/mozjs-140/0001-util.configure-fix-one-occasionally-reproduced-confi.patch
similarity index 81%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure-fi=
x-one-occasionally-reproduced-confi.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0001-util.configure-fix-=
one-occasionally-reproduced-confi.patch
index d53cc2bd41..99b0d28754 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure-fix-one-=
occasionally-reproduced-confi.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-140/0001-util.configure-fix-one-=
occasionally-reproduced-confi.patch
@@ -28,6 +28,7 @@ It should be another process that deleted this file by us=
ing
 Upstream-Status: Submitted [<a href=3D"https://bugzilla.mozilla.org/show_b=
ug.cgi?id=3D1740667" target=3D"_blank">https://bugzilla.mozilla.org/show_bu=
g.cgi?id=3D1740667</a>]
=20
 Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;
+Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;
 ---
  build/moz.configure/util.configure | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -36,12 +37,12 @@ diff --git a/build/moz.configure/util.configure b/build=
/moz.configure/util.confi
 index d93b91fcdd..47ab8b92b9 100644
 --- a/build/moz.configure/util.configure
 +++ b/build/moz.configure/util.configure
-@@ -256,7 +256,7 @@ def try_invoke_compiler(
-         &quot;C++&quot;: &quot;.cpp&quot;,
-     }[language]
-=20
--    fd, path =3D mkstemp(prefix=3D&quot;conftest.&quot;, suffix=3Dsuffix,=
 text=3DTrue)
-+    fd, path =3D mkstemp(prefix=3D&quot;try_invoke_compiler_conftest.&quo=
t;, suffix=3Dsuffix, text=3DTrue)
-     try:
-         source =3D source.encode(&quot;ascii&quot;, &quot;replace&quot;)
-=20
+@@ -169,7 +169,7 @@
+ def make_create_temporary_file():
+     @contextmanager
+     def create_temporary_file(suffix):
+-        fd, path =3D mkstemp(prefix=3D&quot;conftest&quot;, suffix=3Dsuff=
ix)
++        fd, path =3D mkstemp(prefix=3D&quot;try_invoke_compiler_conftest.=
&quot;, suffix=3Dsuffix, text=3DTrue)
+         os.close(fd)
+         yield path
+         try:
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-d=
o-not-try-to-find-a-suitable-upstrea.patch b/meta-oe/recipes-extended/mozjs=
/mozjs-140/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-do=
-not-try-to-find-a-suitable-upstrea.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0003-rust.configure-do-n=
ot-try-to-find-a-suitable-upstrea.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.=
h.patch b/meta-oe/recipes-extended/mozjs/mozjs-140/0004-use-asm-sgidefs.h.p=
atch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h=
.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0004-use-asm-sgidefs.h.p=
atch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-140/Disable-format-securi=
ty-warning-when-disabling-forma.patch b/meta-oe/recipes-extended/mozjs/mozj=
s-140/Disable-format-security-warning-when-disabling-forma.patch
new file mode 100644
index 0000000000..27b8b71b5d
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-140/Disable-format-security-warn=
ing-when-disabling-forma.patch
@@ -0,0 +1,21 @@
+From: Mike Hommey &lt;<a href=3D"mailto:mh@glandium.org" target=3D"_blank"=
>mh@glandium.org</a>&gt;
+Date: Wed, 5 Mar 2025 07:16:17 +0900
+Subject: Disable format-security warning when disabling format warning
+
+Upstream-Status: Pending [Not my work. Taken from debian]
+
+Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;
+---
+ js/src/xsum/moz.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/js/src/xsum/moz.build b/js/src/xsum/moz.build
+index dc7a4f2..30f64cd 100644
+--- a/js/src/xsum/moz.build
++++ b/js/src/xsum/moz.build
+@@ -17,4 +17,4 @@ SOURCES +=3D [
+ ]
+=20
+ # Suppress warnings in third-party code.
+-SOURCES[&#39;xsum.cpp&#39;].flags +=3D [&#39;-Wno-implicit-fallthrough&#3=
9;, &#39;-Wno-format&#39;, &#39;-Wno-unused-value&#39;]
++SOURCES[&#39;xsum.cpp&#39;].flags +=3D [&#39;-Wno-implicit-fallthrough&#3=
9;, &#39;-Wno-format&#39;, &#39;-Wno-format-security&#39;, &#39;-Wno-unused=
-value&#39;]
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-140/Export-js-detail-Cano=
nicalizedNaNBits-on-architectures-th.patch b/meta-oe/recipes-extended/mozjs=
/mozjs-140/Export-js-detail-CanonicalizedNaNBits-on-architectures-th.patch
new file mode 100644
index 0000000000..0b90eaf909
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-140/Export-js-detail-Canonicaliz=
edNaNBits-on-architectures-th.patch
@@ -0,0 +1,30 @@
+From: Simon McVittie &lt;<a href=3D"mailto:smcv@debian.org" target=3D"_bla=
nk">smcv@debian.org</a>&gt;
+Date: Thu, 8 Feb 2024 10:36:53 +0000
+Subject: Export js::detail::CanonicalizedNaNBits on architectures that use=
 it
+
+Otherwise the inline function JS::CanonicalizeNaN(double), which is
+called by gjs, cannot validly refer to it.
+
+Bug-Debian: <a href=3D"https://bugs.debian.org/1063446" target=3D"_blank">=
https://bugs.debian.org/1063446</a>
+Signed-off-by: Simon McVittie &lt;<a href=3D"mailto:smcv@debian.org" targe=
t=3D"_blank">smcv@debian.org</a>&gt;
+
+Upstream-Status: Pending [Not my work. Taken from debian]
+
+Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;
+---
+ js/public/Value.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/js/public/Value.h b/js/public/Value.h
+index c70d5b6..4bee5bc 100644
+--- a/js/public/Value.h
++++ b/js/public/Value.h
+@@ -426,7 +426,7 @@ constexpr uint64_t CanonicalizedNaNSignificand =3D 0x8=
000000000000;
+ #endif
+=20
+ #if defined(JS_RUNTIME_CANONICAL_NAN)
+-extern uint64_t CanonicalizedNaNBits;
++extern JS_PUBLIC_DATA uint64_t CanonicalizedNaNBits;
+ #else
+ constexpr uint64_t CanonicalizedNaNBits =3D
+     mozilla::SpecificNaNBits&lt;double, detail::CanonicalizedNaNSignBit,
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-140/Fix-math_private.h-fo=
r-i386-FTBFS.patch b/meta-oe/recipes-extended/mozjs/mozjs-140/Fix-math_priv=
ate.h-for-i386-FTBFS.patch
new file mode 100644
index 0000000000..18d53cd068
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-140/Fix-math_private.h-for-i386-=
FTBFS.patch
@@ -0,0 +1,29 @@
+From: Mike Hommey &lt;<a href=3D"mailto:mh@glandium.org" target=3D"_blank"=
>mh@glandium.org</a>&gt;
+Date: Sat, 27 Nov 2021 06:49:44 +0900
+Subject: Fix math_private.h for i386 FTBFS
+
+Origin: firefox-esr packaging, commit:<a href=3D"https://salsa.debian.org/=
mozilla-team/firefox/-/commit/fc1e93ab0fd20680006d6e25f301ec47b1969518" tar=
get=3D"_blank">https://salsa.debian.org/mozilla-team/firefox/-/commit/fc1e9=
3ab0fd20680006d6e25f301ec47b1969518</a>
+
+Upstream-Status: Pending [Not my work. Taken from debian]
+
+Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;
+---
+ modules/fdlibm/src/math_private.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/modules/fdlibm/src/math_private.h b/modules/fdlibm/src/math_p=
rivate.h
+index 45f7401..29ca8a8 100644
+--- a/modules/fdlibm/src/math_private.h
++++ b/modules/fdlibm/src/math_private.h
+@@ -30,7 +30,11 @@
+  * Adapted from <a href=3D"https://github.com/freebsd/freebsd-src/search?=
q=3D__double_t" target=3D"_blank">https://github.com/freebsd/freebsd-src/se=
arch?q=3D__double_t</a>
+  */
+=20
++#if defined __FLT_EVAL_METHOD__ &amp;&amp; (__FLT_EVAL_METHOD__ =3D=3D 2)
++typedef long double      __double_t;
++#else
+ typedef double      __double_t;
++#endif
+ typedef __double_t  double_t;
+ typedef float       __float_t;
+=20
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch b/meta-oe=
/recipes-extended/mozjs/mozjs-140/armv5.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/armv5.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackwal=
k.patch b/meta-oe/recipes-extended/mozjs/mozjs-140/musl-disable-stackwalk.p=
atch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackwalk=
.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/musl-disable-stackwalk.p=
atch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch b/meta-oe=
/recipes-extended/mozjs/mozjs-140/riscv.patch
similarity index 53%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/riscv.patch
index cb2dc66525..9967bb75cc 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-140/riscv.patch
@@ -4,27 +4,28 @@ Rust uses above for architecture in tuples
=20
 Upstream-Status: Pending
 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;
+Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;
 --- a/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
 +++ b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
-@@ -1327,6 +1327,10 @@ class LinuxCrossCompileToolchainTest(Bas
+@@ -1328,6 +1328,8 @@
          &quot;mips-unknown-linux-gnu&quot;: big_endian + {&quot;__mips__&=
quot;: 1},
          &quot;riscv32-unknown-linux-gnu&quot;: little_endian + {&quot;__r=
iscv&quot;: 1, &quot;__riscv_xlen&quot;: 32},
          &quot;riscv64-unknown-linux-gnu&quot;: little_endian + {&quot;__r=
iscv&quot;: 1, &quot;__riscv_xlen&quot;: 64},
-+        &quot;riscv32gc-unknown-linux-gnu&quot;: little_endian
-+        + {&quot;__riscv&quot;: 1, &quot;__riscv_xlen&quot;: 32},
-+        &quot;riscv64gc-unknown-linux-gnu&quot;: little_endian
-+        + {&quot;__riscv&quot;: 1, &quot;__riscv_xlen&quot;: 64},
++        &quot;riscv32gc-unknown-linux-gnu&quot;: little_endian + {&quot;_=
_riscv&quot;: 1, &quot;__riscv_xlen&quot;: 32},
++        &quot;riscv64gc-unknown-linux-gnu&quot;: little_endian + {&quot;_=
_riscv&quot;: 1, &quot;__riscv_xlen&quot;: 64},
          &quot;sh4-unknown-linux-gnu&quot;: little_endian + {&quot;__sh__&=
quot;: 1},
      }
 =20
 --- a/build/autoconf/config.sub
 +++ b/build/autoconf/config.sub
-@@ -1236,7 +1236,7 @@ case $cpu-$vendor in
- 			| powerpc | powerpc64 | powerpc64le | powerpcle | powerpcspe \
- 			| pru \
- 			| pyramid \
--			| riscv | riscv32 | riscv32be | riscv64 | riscv64be \
-+			| riscv | riscv32 | riscv32be | riscv32gc | riscv64 | riscv64be | risc=
v64gc \
- 			| rl78 | romp | rs6000 | rx \
- 			| s390 | s390x \
- 			| score \
+@@ -1396,8 +1396,10 @@
+ 			| riscv \
+ 			| riscv32 \
+ 			| riscv32be \
++			| riscv32gc \
+ 			| riscv64 \
+ 			| riscv64be \
++			| riscv64gc \
+ 			| rl78 \
+ 			| romp \
+ 			| rs6000 \
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch b/meta-=
oe/recipes-extended/mozjs/mozjs-140/riscv32.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/riscv32.patch
diff --git a/meta-oe/recipes-extended/mozjs/<a href=3D"http://mozjs-128_128=
.5.2.bb" target=3D"_blank">mozjs-128_128.5.2.bb</a> b/meta-oe/recipes-exten=
ded/mozjs/<a href=3D"http://mozjs-140_140.2.0.bb" target=3D"_blank">mozjs-1=
40_140.2.0.bb</a>
similarity index 88%
rename from meta-oe/recipes-extended/mozjs/<a href=3D"http://mozjs-128_128.=
5.2.bb" target=3D"_blank">mozjs-128_128.5.2.bb</a>
rename to meta-oe/recipes-extended/mozjs/<a href=3D"http://mozjs-140_140.2.=
0.bb" target=3D"_blank">mozjs-140_140.2.0.bb</a>
index ceb81d07e5..e9e1c96921 100644
--- a/meta-oe/recipes-extended/mozjs/<a href=3D"http://mozjs-128_128.5.2.bb=
" target=3D"_blank">mozjs-128_128.5.2.bb</a>
+++ b/meta-oe/recipes-extended/mozjs/<a href=3D"http://mozjs-140_140.2.0.bb=
" target=3D"_blank">mozjs-140_140.2.0.bb</a>
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Ddc9b6ecd19a=
14a54a628edaaf23733bf&quot;
=20
 SRC_URI =3D &quot;<a href=3D"https://archive.mozilla.org/pub/firefox/relea=
ses/$%7BPV%7Desr/source/firefox-$%7BPV%7Desr.source.tar.xz" target=3D"_blan=
k">https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/firefox=
-${PV}esr.source.tar.xz</a> \
            <a>file://0001-Cargo.toml-do-not-abort-on-panic.patch</a> \
-           <a>file://0002-moz.configure-do-not-look-for-llvm-objdump.patch=
</a> \
            <a>file://0003-rust.configure-do-not-try-to-find-a-suitable-ups=
trea.patch</a> \
            <a>file://0004-use-asm-sgidefs.h.patch</a> \
            <a>file://riscv32.patch</a> \
@@ -14,19 +13,21 @@ SRC_URI =3D &quot;<a href=3D"https://archive.mozilla.or=
g/pub/firefox/releases/$%7BPV%7Desr/source/fire" target=3D"_blank">https://=
archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire</a>
            <a>file://musl-disable-stackwalk.patch</a> \
            <a>file://0001-add-arm-to-list-of-mozinline.patch</a> \
            <a>file://armv5.patch</a> \
-           <a>file://0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patch<=
/a> \
            <a>file://riscv.patch</a> \
+           <a>file://Disable-format-security-warning-when-disabling-forma.=
patch</a> \
+           <a>file://Export-js-detail-CanonicalizedNaNBits-on-architecture=
s-th.patch</a> \
+           <a>file://Fix-math_private.h-for-i386-FTBFS.patch</a> \
            &quot;
-SRC_URI[sha256sum] =3D &quot;25d633eb81499cbda44b8c64fa1c1a5879d55024b864e=
f495d4997154d68358f&quot;
+SRC_URI[sha256sum] =3D &quot;956dce675c3b706d563caf07ed3ca9af632ab830be710=
dfd4351da78a0a2ef55&quot;
=20
-UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://tracker.debian.org/pkg/moz=
js128" target=3D"_blank">https://tracker.debian.org/pkg/mozjs128</a>&quot;
+UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://tracker.debian.org/pkg/moz=
js140" target=3D"_blank">https://tracker.debian.org/pkg/mozjs140</a>&quot;
 UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d+)+)&quot;
=20
 S =3D &quot;${UNPACKDIR}/firefox-${PV}&quot;
=20
 inherit pkgconfig perlnative python3native rust cargo
=20
-DEPENDS +=3D &quot;zlib cbindgen-native python3 icu&quot;
+DEPENDS +=3D &quot;zlib cbindgen-native python3 icu clang-native&quot;
 DEPENDS:remove:mipsarch =3D &quot;icu&quot;
 DEPENDS:remove:powerpc:toolchain-clang =3D &quot;icu&quot;
=20
<div>--=20
</div>2.50.1

</div><div style=3D"white-space:break-spaces">


</div></blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#119391): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/119391" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/119391</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115233753/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115233753/1997914</a><br>
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

--0000000000007cfbe7063ecb7232--

