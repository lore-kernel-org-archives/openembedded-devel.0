Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC2F2C624D6
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 14:56:57 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9743.1788447407651011502
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 07:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GKivJ2V/;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-861145fc841so27513947b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 07:56:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788447407; cv=none;
        d=google.com; s=arc-20260327;
        b=dGUyclPjAlZamAnqMi6/y4Haz7nX7SNvkPAJ9meUzviJKsrXCfTk+iEXo6gHgqpPGM
         rZjuXzIDhFOQn4Eba45YUkaPtL2LIUIpLmNKW1/0JE4JY6Lou2uKDybXYzKdKKNHf0Z1
         TndEmc3pPwHphhRruILzQ70AO5nZ2tOl359wxA4+XS08WoUV3yvx9Nv1u/3FSnw8L2Iq
         KJgnVFLVlEJqIIRF+mr00e5euB+dVQ+93C+9KJNUskJ5LDK4am0IYTC2uwMKQ+pC5x34
         +p/mjBcz119sjAcm856wF7KoK0Ei4D+3vXiXWImuNFjbPCONx+V/980SoNrGdQIdx/55
         Gwgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o8GZVwte5juMuG6LoSs4VAeBAhCjdNKH/wo81LDmHrc=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=XHyLU2CAMGkNG+ecoEgbOJw2/rras0DvVRngba9exYKFEbAZNHRq4i17lwHvDUoF4E
         JDxo91QzFWN/CntFrJBhyQhUtykbLE6GS7AX8ODFbtH/6UYPtjDaYXFrmFTUeZf2KY7P
         jCoI11bzjYHt0H438Wreuv/k8syktbVl6M0snraQYwxGWPJpAm3XqA3Vhjf2Yx4j/HmW
         VIg8D+ub2zP31Un431gNzkf3Me+6xHtKl0NVljFAjztQaTUaiPk4Uyv9oLNsmEmMsAml
         RUHoNMv2MFGnazcL5pxRqvaOc77ijCz40ybAAu9M2XiuLvJMSk6dPHW4YMHogvCKykF2
         heew==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788447407; x=1789052207; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o8GZVwte5juMuG6LoSs4VAeBAhCjdNKH/wo81LDmHrc=;
        b=GKivJ2V/qIW2i1Kzk9siStlw94B++yG6WmVawaW+jEurzHy2pvn25hv5db0EFGo2JC
         IA+P2WTBWxrKQnEp0OfJYNS+Kd9CoK9KR466C4mswXsOeOo82BTenkzVIj1NBRQ4CG30
         0ZBvHl78QimKCeju4HNSVNtqghcaCqo9l4/PUm3FIqpkGJy9aB60WEjRS/fqIPhhV1hX
         +J7Nax2/WOOj4kuPIoUeoTx6CUDs1Sxai/Ff7dDwHCqncwgofLDRPMIp7h03LR7VpEPx
         o7odz7auF+SPKiWacvdMwI2/C15T89pLx3uaiOh73FcXkp6Qk6T5X4LqCjDgHHP5/RXY
         DyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788447407; x=1789052207;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o8GZVwte5juMuG6LoSs4VAeBAhCjdNKH/wo81LDmHrc=;
        b=Mmhq+iy5sqwY7dEtNz14O0MaBunit9PuzaWaCTOxmhspxZkMpv4IuVbu78gASBaUzr
         wDwC1GliPvmk7mf8S6FTKKukSDSi6FmjNcYsviMWgzEa/ZYAwzbiJ2naFyky9cRfKOzO
         Vg3NhYxzmPIYvtGh8/Dorojmsz1011X3x+M1PdpMT/H/5XY2Xz1+KVkkKz1DG//kESU8
         OO3SaRDCC4igrE/NfZT+/1/rCp2+r5MaaHBmWDrqVrLF5WEGSNP/DKc9r0fhnI/RYsMd
         VIaN/e2zEFtEs5fISM/nmVUo0GOxc24oxkGaAzWbcJtr7pHbWM2CIFvl3ae/p5j0PCVX
         1MGA==
X-Gm-Message-State: AFuF++lqG8qagaw+hDXEtakBYBeMbVIN32H9OZmTzGZTYyD454kR0MZI
	1mhxCQ+5ETjGsEMY7e2XEmF05DpO6e6ZRdarC9Y1jMOONof4eLgJKvMf3ffvuG1oTU5bsshO6Pm
	C8azNzJ4jv2aTLPTWLM/LU9ys4IA4Q+U=
X-Gm-Gg: AYBFou1G9vGuG6xmcLVbkBwv3uEPtpSk4AasKfUwUn4bDq5ucCiXlv+TinCMEdUNFRv
	Q6hciYmLo91XfkdVBBKp2pBNs2JD3OLXOcau/DCopNA84I4TQXNQv8RhqknQXgldXUnU3SPBQqy
	LFxROeVinxBhgAUnrQOs9XOcaH/5CQadX4dHLXXfc7YxeISTVwOzmq/TgXoJZePzHolhEbPpdk3
	mG51ez4o3Xz49Ltw07FC2aeeUvKqlMarb/12KW5y3pYi4VeWRpOK8V3Ws3vjad8+Ea9opKnnJDS
	FKyrxv4uZBEio84aoBrYzl9zk6/cKSEMuNpB6/8H3kJ35O/ZD2gGc1k1sFgL2GixmLtzPlSAUkZ
	TDyuk2aj2LrS1nbQYrBuZTj3Vs20OkZZ+SIHAwVt6/unzwR2DJsTEie5IhHHjJWHCp9UHu9ENDK
	W7fqtFQRYoQNrw5tOecNn6SATU46soQm0iu9vnfXINFqtx1u6Yl66fdCtj3ZBL5zw0fdqS9iY1k
	BL5fZkcxHIsXg==
X-Received: by 2002:a05:690c:e0cf:20b0:81e:1b3c:9e4 with SMTP id
 00721157ae682-86c4ecabf52mr49071537b3.14.1788447406330; Thu, 03 Sep 2026
 07:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260903081916.156273-1-f_l_k@t-online.de> <20260903081916.156273-6-f_l_k@t-online.de>
In-Reply-To: <20260903081916.156273-6-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Sep 2026 07:56:19 -0700
X-Gm-Features: AcwNN1U4hCB58NNXp_C5vvCK7WOCPljFNtKm9OI9qKaJCMZWpd5NFxboS7NzOkg
Message-ID: <CAMKF1srr+ZODm06Cp6Evrk3se1rvibqeg6u_6okSTUg_TY7umA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 6/6] mozjs: update 128->140
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005a9819065a955c66"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 14:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129739

--0000000000005a9819065a955c66
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

libpeas depends on 'mozjs-128' that needs to be addressed as well.

On Thu, Sep 3, 2026 at 1:19=E2=80=AFAM Markus Volk via lists.openembedded.o=
rg
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> Dropped versus mozjs-128, both now fixed upstream in 140:
> 0002-moz.configure-do-not-look-for-llvm-objdump.patch
> The LLVM_OBJDUMP check_prog block is gone from moz.configure entirely.
> 0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch
> js/moz.configure already asks for "icu-uc icu-i18n >=3D 76.1".
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...nfigure-do-not-look-for-llvm-objdump.patch | 43 -----------------
>  ...ix-one-occasionally-reproduced-confi.patch | 47 -------------------
>  ...with-icu-uc-to-fix-build-with-ICU-76.patch | 27 -----------
>  ...001-Cargo.toml-do-not-abort-on-panic.patch |  0
>  ...-not-try-to-find-a-suitable-upstrea.patch} |  0
>  .../0003-use-asm-sgidefs.h.patch}             |  0
>  .../0004-Add-RISCV32-support.patch}           |  0
>  ...ix-one-occasionally-reproduced-confi.patch | 29 ++++++++++++
>  ...ewrite-cargo-host-linker-in-python3.patch} |  2 +-
>  ...e-stack-unwinder-like-glibc-therefo.patch} |  0
>  ...om-firefox-bugzilla-to-fix-compile-.patch} |  0
>  ...on-isn-t-available-in-ARMv5-or-v6-s.patch} |  0
>  ...gc-and-riscv32gc-as-valid-architect.patch} | 38 ++++++++-------
>  .../0011-Fix-build-error-with-musl.patch}     |  0
>  ...d-ast.Str-and-ast.Index-with-ast.Co.patch} | 30 +++++++-----
>  ...-128_128.14.0.bb =3D> mozjs-140_140.15.0.bb} | 42 ++++++++++-------
>  16 files changed, 93 insertions(+), 165 deletions(-)
>  delete mode 100644
> meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-look-f=
or-llvm-objdump.patch
>  delete mode 100644
> meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.configure-fix-one-occa=
sionally-reproduced-confi.patch
>  delete mode 100644
> meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-with-icu-uc-to-fix-bui=
ld-with-ICU-76.patch
>  rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D>
> mozjs-140}/0001-Cargo.toml-do-not-abort-on-panic.patch (100%)
>  rename
> meta-oe/recipes-extended/mozjs/{mozjs-128/0003-rust.configure-do-not-try-=
to-find-a-suitable-upstrea.patch
> =3D>
> mozjs-140/0002-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch=
}
> (100%)
>  rename
> meta-oe/recipes-extended/mozjs/{mozjs-128/0004-use-asm-sgidefs.h.patch =
=3D>
> mozjs-140/0003-use-asm-sgidefs.h.patch} (100%)
>  rename
> meta-oe/recipes-extended/mozjs/{mozjs-128/0005-Add-RISCV32-support.patch =
=3D>
> mozjs-140/0004-Add-RISCV32-support.patch} (100%)
>  create mode 100644
> meta-oe/recipes-extended/mozjs/mozjs-140/0005-util.configure-fix-one-occa=
sionally-reproduced-confi.patch
>  rename
> meta-oe/recipes-extended/mozjs/{mozjs-128/0007-Rewrite-cargo-host-linker-=
in-python3.patch
> =3D> mozjs-140/0006-Rewrite-cargo-host-linker-in-python3.patch} (96%)
>  rename
> meta-oe/recipes-extended/mozjs/{mozjs-128/0008-Musl-does-not-have-stack-u=
nwinder-like-glibc-therefo.patch
> =3D>
> mozjs-140/0007-Musl-does-not-have-stack-unwinder-like-glibc-therefo.patch=
}
> (100%)
>  rename
> meta-oe/recipes-extended/mozjs/{mozjs-128/0009-Backport-patch-from-firefo=
x-bugzilla-to-fix-compile-.patch
> =3D>
> mozjs-140/0008-Backport-patch-from-firefox-bugzilla-to-fix-compile-.patch=
}
> (100%)
>  rename
> meta-oe/recipes-extended/mozjs/{mozjs-128/0010-The-ISB-instruction-isn-t-=
available-in-ARMv5-or-v6-s.patch
> =3D>
> mozjs-140/0009-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.patch=
}
> (100%)
>  rename
> meta-oe/recipes-extended/mozjs/{mozjs-128/0012-Recognise-riscv64gc-and-ri=
scv32gc-as-valid-architect.patch
> =3D>
> mozjs-140/0010-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.patch=
}
> (62%)
>  rename
> meta-oe/recipes-extended/mozjs/{mozjs-128/0013-Fix-build-error-with-musl.=
patch
> =3D> mozjs-140/0011-Fix-build-error-with-musl.patch} (100%)
>  rename meta-oe/recipes-extended/mozjs/{mozjs-128/D261512.1755672843.patc=
h
> =3D>
> mozjs-140/0012-Replace-deprecated-ast.Str-and-ast.Index-with-ast.Co.patch=
}
> (72%)
>  rename meta-oe/recipes-extended/mozjs/{mozjs-128_128.14.0.bb =3D>
> mozjs-140_140.15.0.bb} (64%)
>
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-look=
-for-llvm-objdump.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-look=
-for-llvm-objdump.patch
> deleted file mode 100644
> index 0616aa3ee7..0000000000
> ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-look=
-for-llvm-objdump.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 0f885ae37ef7cd94fd0712cefb5d3314fbcfdf44 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Fri, 1 Oct 2021 13:01:10 +0200
> -Subject: [PATCH] moz.configure: do not look for llvm-objdump
> -
> -This avoid dragging in a dependency that isn't even needed
> -for js builds.
> -
> -Upstream-Status: Inappropriate [oe-core specific]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - moz.configure | 18 +++++++++---------
> - 1 file changed, 9 insertions(+), 9 deletions(-)
> -
> -diff --git a/moz.configure b/moz.configure
> -index 804b9a375a..402e79e3b3 100755
> ---- a/moz.configure
> -+++ b/moz.configure
> -@@ -390,15 +390,15 @@ def plain_llvm_or_prefixed(name, llvm_name=3DNone)=
:
> -     return plain_llvm_or_prefixed
> -
> -
> --llvm_objdump =3D check_prog(
> --    "LLVM_OBJDUMP",
> --    llvm_tool("llvm-objdump"),
> --    what=3D"llvm-objdump",
> --    when=3D"--enable-compile-environment",
> --    paths=3Dclang_search_path,
> --)
> --
> --add_old_configure_assignment("LLVM_OBJDUMP", llvm_objdump)
> -+#llvm_objdump =3D check_prog(
> -+#    "LLVM_OBJDUMP",
> -+#    llvm_tool("llvm-objdump"),
> -+#    what=3D"llvm-objdump",
> -+#    when=3D"--enable-compile-environment",
> -+#    paths=3Dclang_search_path,
> -+#)
> -+#
> -+#add_old_configure_assignment("LLVM_OBJDUMP", llvm_objdump)
> -
> -
> - def validate_readelf(path):
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.configure-fix-one-oc=
casionally-reproduced-confi.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.configure-fix-one-oc=
casionally-reproduced-confi.patch
> deleted file mode 100644
> index 9cc7831876..0000000000
> ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.configure-fix-one-oc=
casionally-reproduced-confi.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 13b544e4ed51f41138bf200eb84552e169df87b0 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Thu, 11 Nov 2021 16:05:54 +0800
> -Subject: [PATCH] util.configure: fix one occasionally reproduced configu=
re
> - failure
> -
> -error:
> -| checking whether the C++ compiler supports -Wno-range-loop-analysis...
> -| DEBUG: Creating /tmp/conftest.jr1qrcw3.cpp with content:
> -| DEBUG: | int
> -| DEBUG: | main(void)
> -| DEBUG: | {
> -| DEBUG: |
> -| DEBUG: | ;
> -| DEBUG: | return 0;
> -| DEBUG: | }
> -| DEBUG: Executing: aarch64-wrs-linux-g++ -mcpu=3Dcortex-a53
> -march=3Darmv8-a+crc -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2
> -Wformat -Wformat-security -Werror=3Dformat-security
> --sysroot=3D/mozjs/91.1.0-r0/recipe-sysroot /tmp/conftest.jr1qrcw3.cpp
> -Werror -Wrange-loop-analysis -c
> -| DEBUG: The command returned non-zero exit status 1.
> -| DEBUG: Its error output was:
> -...
> -| File
> "/mozjs/91.1.0-r0/firefox-91.1.0/build/moz.configure/util.configure", lin=
e
> 239, in try_invoke_compiler
> -| os.remove(path)
> -| FileNotFoundError: [Errno 2] No such file or directory:
> '/tmp/conftest.jr1qrcw3.cpp'
> -
> -It should be another process that deleted this file by using
> -"rm -rf conftest*" inappropriately
> -
> -Upstream-Status: Submitted [
> https://bugzilla.mozilla.org/show_bug.cgi?id=3D1740667]
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - build/moz.configure/util.configure | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/build/moz.configure/util.configure
> b/build/moz.configure/util.configure
> -index d93b91fcdd..47ab8b92b9 100644
> ---- a/build/moz.configure/util.configure
> -+++ b/build/moz.configure/util.configure
> -@@ -256,7 +256,7 @@ def try_invoke_compiler(
> -         "C++": ".cpp",
> -     }[language]
> -
> --    fd, path =3D mkstemp(prefix=3D"conftest.", suffix=3Dsuffix, text=3D=
True)
> -+    fd, path =3D mkstemp(prefix=3D"try_invoke_compiler_conftest.",
> suffix=3Dsuffix, text=3DTrue)
> -     try:
> -         source =3D source.encode("ascii", "replace")
> -
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-with-icu-uc-to-fix-b=
uild-with-ICU-76.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-with-icu-uc-to-fix-b=
uild-with-ICU-76.patch
> deleted file mode 100644
> index 2d85e29005..0000000000
> ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-with-icu-uc-to-fix-b=
uild-with-ICU-76.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From 8290fd619582651334fbfdfe7be887d539ce0f2c Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 23 Nov 2024 13:28:33 -0800
> -Subject: [PATCH] Link with icu-uc to fix build with ICU-76
> -
> -Fixes
> -https://bugzilla.mozilla.org/show_bug.cgi?id=3D1927380
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - js/moz.configure | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/js/moz.configure b/js/moz.configure
> -index 593b93acee..2181dca34b 100644
> ---- a/js/moz.configure
> -+++ b/js/moz.configure
> -@@ -1305,7 +1305,7 @@ def enable_system_icu_option(enable_system_icu):
> -     return enable_system_icu
> -
> -
> --system_icu =3D pkg_check_modules("MOZ_ICU", "icu-i18n >=3D 73.1",
> when=3D"--with-system-icu")
> -+system_icu =3D pkg_check_modules("MOZ_ICU", "icu-i18n >=3D 73.1 icu-uc"=
,
> when=3D"--with-system-icu")
> -
> -
> - @depends(enable_system_icu_option)
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-not-abort-o=
n-panic.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0001-Cargo.toml-do-not-abort-o=
n-panic.patch
> similarity index 100%
> rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-not-abort-on-=
panic.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-140/0001-Cargo.toml-do-not-abort-on-=
panic.patch
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-do-not-try=
-to-find-a-suitable-upstrea.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0002-rust.configure-do-not-try=
-to-find-a-suitable-upstrea.patch
> similarity index 100%
> rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-do-not-try-t=
o-find-a-suitable-upstrea.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-140/0002-rust.configure-do-not-try-t=
o-find-a-suitable-upstrea.patch
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0003-use-asm-sgidefs.h.patch
> similarity index 100%
> rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-140/0003-use-asm-sgidefs.h.patch
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV32-support.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0004-Add-RISCV32-support.patch
> similarity index 100%
> rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV32-support.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-140/0004-Add-RISCV32-support.patch
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-140/0005-util.configure-fix-one-oc=
casionally-reproduced-confi.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0005-util.configure-fix-one-oc=
casionally-reproduced-confi.patch
> new file mode 100644
> index 0000000000..6430de38f2
> --- /dev/null
> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0005-util.configure-fix-one-oc=
casionally-reproduced-confi.patch
> @@ -0,0 +1,29 @@
> +From fe1c2336dfe5e8b4357d5e382edd1eba30cfa7d7 Mon Sep 17 00:00:00 2001
> +From: x <a@b.c>
> +Date: Wed, 2 Sep 2026 20:23:10 +0000
> +Subject: [PATCH] util.configure: fix one occasionally reproduced configu=
re
> + failure
> +
> +try_invoke_compiler() creates its temporary files with the prefix
> "conftest",
> +which collides with the files other configure checks create under the sa=
me
> +name. Under parallel builds this occasionally makes a check pick up a
> stale
> +file and fail. Use a distinct prefix.
> +
> +Upstream-Status: Pending
> +---
> + build/moz.configure/util.configure | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/build/moz.configure/util.configure
> b/build/moz.configure/util.configure
> +index 8d31d112a..cb0884496 100644
> +--- a/build/moz.configure/util.configure
> ++++ b/build/moz.configure/util.configure
> +@@ -169,7 +169,7 @@ normalize_path =3D normalize_path()
> + def make_create_temporary_file():
> +     @contextmanager
> +     def create_temporary_file(suffix):
> +-        fd, path =3D mkstemp(prefix=3D"conftest", suffix=3Dsuffix)
> ++        fd, path =3D mkstemp(prefix=3D"try_invoke_compiler_conftest",
> suffix=3Dsuffix)
> +         os.close(fd)
> +         yield path
> +         try:
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-cargo-host-linker=
-in-python3.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0006-Rewrite-cargo-host-linker=
-in-python3.patch
> similarity index 96%
> rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-cargo-host-linker-i=
n-python3.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-140/0006-Rewrite-cargo-host-linker-i=
n-python3.patch
> index 9d6a89214b..71ec4b29b6 100644
> ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-cargo-host-linker=
-in-python3.patch
> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0006-Rewrite-cargo-host-linker=
-in-python3.patch
> @@ -29,7 +29,7 @@ index cbd0472bf7..87d43ce9ec 100755
>  @@ -1,3 +1,21 @@
>  -#!/bin/sh
>  -# See comment in cargo-linker.
> --eval ${MOZ_CARGO_WRAP_HOST_LD} ${MOZ_CARGO_WRAP_HOST_LDFLAGS} '"$@"'
> +-eval ${MOZ_CARGO_WRAP_HOST_LD} '"$@"' ${MOZ_CARGO_WRAP_HOST_LDFLAGS}
>  +#!/usr/bin/env python3
>  +
>  +import os,sys
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-not-have-stack-=
unwinder-like-glibc-therefo.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0007-Musl-does-not-have-stack-=
unwinder-like-glibc-therefo.patch
> similarity index 100%
> rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-not-have-stack-un=
winder-like-glibc-therefo.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-140/0007-Musl-does-not-have-stack-un=
winder-like-glibc-therefo.patch
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0009-Backport-patch-from-firef=
ox-bugzilla-to-fix-compile-.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0008-Backport-patch-from-firef=
ox-bugzilla-to-fix-compile-.patch
> similarity index 100%
> rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0009-Backport-patch-from-firefox=
-bugzilla-to-fix-compile-.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-140/0008-Backport-patch-from-firefox=
-bugzilla-to-fix-compile-.patch
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0010-The-ISB-instruction-isn-t=
-available-in-ARMv5-or-v6-s.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0009-The-ISB-instruction-isn-t=
-available-in-ARMv5-or-v6-s.patch
> similarity index 100%
> rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0010-The-ISB-instruction-isn-t-a=
vailable-in-ARMv5-or-v6-s.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-140/0009-The-ISB-instruction-isn-t-a=
vailable-in-ARMv5-or-v6-s.patch
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv64gc-and-r=
iscv32gc-as-valid-architect.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0010-Recognise-riscv64gc-and-r=
iscv32gc-as-valid-architect.patch
> similarity index 62%
> rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv64gc-and-ris=
cv32gc-as-valid-architect.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-140/0010-Recognise-riscv64gc-and-ris=
cv32gc-as-valid-architect.patch
> index 9cdb9fe913..21d79e8686 100644
> ---
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv64gc-and-r=
iscv32gc-as-valid-architect.patch
> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0010-Recognise-riscv64gc-and-r=
iscv32gc-as-valid-architect.patch
> @@ -1,35 +1,37 @@
> -From 93d586d712bf34c243c6174425c78d3ab274c6a0 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 7 Jan 2025 15:17:16 -0800
> +From 6fac6696adffc7b4f2bd47e12e8cae842736813f Mon Sep 17 00:00:00 2001
> +From: x <a@b.c>
> +Date: Wed, 2 Sep 2026 20:23:36 +0000
>  Subject: [PATCH] Recognise riscv64gc and riscv32gc as valid architecture=
s
>
> -Rust uses above for architecture in tuples
> +rust names the riscv targets riscv64gc-* and riscv32gc-*, and OE passes
> that
> +triple straight through to configure. config.sub rejects it.
>
>  Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> - build/autoconf/config.sub                                     | 2 +-
> + build/autoconf/config.sub                                     | 2 ++
>   .../mozbuild/test/configure/test_toolchain_configure.py       | 4 ++++
> - 2 files changed, 5 insertions(+), 1 deletion(-)
> + 2 files changed, 6 insertions(+)
>
>  diff --git a/build/autoconf/config.sub b/build/autoconf/config.sub
> -index 2c6a07ab3c..f7ee82380c 100755
> +index 4aaae46f6..10020ca01 100755
>  --- a/build/autoconf/config.sub
>  +++ b/build/autoconf/config.sub
> -@@ -1236,7 +1236,7 @@ case $cpu-$vendor in
> -                       | powerpc | powerpc64 | powerpc64le | powerpcle |
> powerpcspe \
> -                       | pru \
> +@@ -1395,8 +1395,10 @@ case $cpu-$vendor in
>                         | pyramid \
> --                      | riscv | riscv32 | riscv32be | riscv64 |
> riscv64be \
> -+                      | riscv | riscv32 | riscv32be | riscv32gc |
> riscv64 | riscv64be | riscv64gc \
> -                       | rl78 | romp | rs6000 | rx \
> -                       | s390 | s390x \
> -                       | score \
> +                       | riscv \
> +                       | riscv32 \
> ++                      | riscv32gc \
> +                       | riscv32be \
> +                       | riscv64 \
> ++                      | riscv64gc \
> +                       | riscv64be \
> +                       | rl78 \
> +                       | romp \
>  diff --git
> a/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
> b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.py
> -index 1be0d02e54..a476d787b2 100644
> +index 481ce4687..b5ce7785b 100644
>  --- a/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.p=
y
>  +++ b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.p=
y
> -@@ -1327,6 +1327,10 @@ class
> LinuxCrossCompileToolchainTest(BaseToolchainTest):
> +@@ -1328,6 +1328,10 @@ class
> LinuxCrossCompileToolchainTest(BaseToolchainTest):
>           "mips-unknown-linux-gnu": big_endian + {"__mips__": 1},
>           "riscv32-unknown-linux-gnu": little_endian + {"__riscv": 1,
> "__riscv_xlen": 32},
>           "riscv64-unknown-linux-gnu": little_endian + {"__riscv": 1,
> "__riscv_xlen": 64},
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-error-with-musl=
.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0011-Fix-build-error-with-musl=
.patch
> similarity index 100%
> rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-error-with-musl.p=
atch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-140/0011-Fix-build-error-with-musl.p=
atch
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-128/D261512.1755672843.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0012-Replace-deprecated-ast.St=
r-and-ast.Index-with-ast.Co.patch
> similarity index 72%
> rename from
> meta-oe/recipes-extended/mozjs/mozjs-128/D261512.1755672843.patch
> rename to
> meta-oe/recipes-extended/mozjs/mozjs-140/0012-Replace-deprecated-ast.Str-=
and-ast.Index-with-ast.Co.patch
> index 1b35d2c094..7838de39d0 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-128/D261512.1755672843.patch
> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-140/0012-Replace-deprecated-ast.St=
r-and-ast.Index-with-ast.Co.patch
> @@ -1,14 +1,22 @@
> -This patch fixes configure with python 3.14
> +From 459a43a9b1f767cde9a8bbb6016b5f9d17890370 Mon Sep 17 00:00:00 2001
> +From: x <a@b.c>
> +Date: Wed, 2 Sep 2026 20:23:13 +0000
> +Subject: [PATCH] Replace deprecated ast.Str and ast.Index with
> ast.Constant
>
> -Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +ast.Str and ast.Index were removed in Python 3.12, which makes mozbuild
> fail
> +to read moz.build files when the build host provides a newer python3.
>
> -Upstream-Status: Backport [
> https://github.com/mozilla-firefox/firefox/commit/d497aa4f770ca02f6083e93=
b94996a8fe32c2ff4
> ]
> +Upstream-Status: Backport [
> https://phabricator.services.mozilla.com/D261512]
> +---
> + python/mozbuild/mozbuild/frontend/reader.py        | 14 +++++++-------
> + .../mozbuild/mozbuild/vendor/rewrite_mozbuild.py   |  6 ++----
> + 2 files changed, 9 insertions(+), 11 deletions(-)
>
>  diff --git a/python/mozbuild/mozbuild/frontend/reader.py
> b/python/mozbuild/mozbuild/frontend/reader.py
> -index 5cb627b..c2dcafe 100644
> +index 9f6292cb9..89bf9995c 100644
>  --- a/python/mozbuild/mozbuild/frontend/reader.py
>  +++ b/python/mozbuild/mozbuild/frontend/reader.py
> -@@ -470,7 +470,7 @@ class TemplateFunction(object):
> +@@ -470,7 +470,7 @@ class TemplateFunction:
>               return c(
>                   ast.Subscript(
>                       value=3Dc(ast.Name(id=3Dself._global_name,
> ctx=3Dast.Load())),
> @@ -17,7 +25,7 @@ index 5cb627b..c2dcafe 100644
>                       ctx=3Dnode.ctx,
>                   )
>               )
> -@@ -1035,8 +1035,8 @@ class BuildReader(object):
> +@@ -1039,8 +1039,8 @@ class BuildReader:
>                   else:
>                       # Others
>                       assert isinstance(target.slice, ast.Index)
> @@ -25,10 +33,10 @@ index 5cb627b..c2dcafe 100644
>  -                    key =3D target.slice.value.s
>  +                    assert isinstance(target.slice.value, ast.Constant)
>  +                    key =3D target.slice.value.value
> -
> -             return name, key
> -
> -@@ -1044,11 +1044,11 @@ class BuildReader(object):
> +             elif isinstance(target, ast.Attribute):
> +                 assert isinstance(target.attr, str)
> +                 key =3D target.attr
> +@@ -1051,11 +1051,11 @@ class BuildReader:
>               value =3D node.value
>               if isinstance(value, ast.List):
>                   for v in value.elts:
> @@ -45,7 +53,7 @@ index 5cb627b..c2dcafe 100644
>           assignments =3D []
>
>  diff --git a/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py
> b/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py
> -index 1590267..151d27c 100644
> +index cfcc0f18b..de06b5881 100644
>  --- a/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py
>  +++ b/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py
>  @@ -327,15 +327,13 @@ def assignment_node_to_source_filename_list(code,
> node):
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128_128.14.0.bb
> b/meta-oe/recipes-extended/mozjs/mozjs-140_140.15.0.bb
> similarity index 64%
> rename from meta-oe/recipes-extended/mozjs/mozjs-128_128.14.0.bb
> rename to meta-oe/recipes-extended/mozjs/mozjs-140_140.15.0.bb
> index 635cad96cf..7b1418cf29 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs-128_128.14.0.bb
> +++ b/meta-oe/recipes-extended/mozjs/mozjs-140_140.15.0.bb
> @@ -6,23 +6,22 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Ddc9b6ecd19a14a54a628edaaf23733bf"
>  SRC_URI =3D " \
>
> https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/firefox-=
${PV}esr.source.tar.xz
> \
>      file://0001-Cargo.toml-do-not-abort-on-panic.patch \
> -    file://0002-moz.configure-do-not-look-for-llvm-objdump.patch \
> -
> file://0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch \
> -    file://0004-use-asm-sgidefs.h.patch \
> -    file://0005-Add-RISCV32-support.patch \
> -
> file://0006-util.configure-fix-one-occasionally-reproduced-confi.patch \
> -    file://0007-Rewrite-cargo-host-linker-in-python3.patch  \
> -
> file://0008-Musl-does-not-have-stack-unwinder-like-glibc-therefo.patch \
> -
> file://0009-Backport-patch-from-firefox-bugzilla-to-fix-compile-.patch \
> -
> file://0010-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.patch \
> -    file://0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch \
> -
> file://0012-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.patch \
> -    file://0013-Fix-build-error-with-musl.patch \
> -    file://D261512.1755672843.patch \
> +
> file://0002-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch \
> +    file://0003-use-asm-sgidefs.h.patch \
> +    file://0004-Add-RISCV32-support.patch \
> +
> file://0005-util.configure-fix-one-occasionally-reproduced-confi.patch \
> +    file://0006-Rewrite-cargo-host-linker-in-python3.patch \
> +
> file://0007-Musl-does-not-have-stack-unwinder-like-glibc-therefo.patch \
> +
> file://0008-Backport-patch-from-firefox-bugzilla-to-fix-compile-.patch \
> +
> file://0009-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.patch \
> +
> file://0010-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.patch \
> +    file://0011-Fix-build-error-with-musl.patch \
> +
> file://0012-Replace-deprecated-ast.Str-and-ast.Index-with-ast.Co.patch \
>  "
> -SRC_URI[sha256sum] =3D
> "93b9ef6229f41cb22ff109b95bbf61a78395a0fe4b870192eeca22947cb09a53"
>
> -UPSTREAM_CHECK_URI =3D "https://tracker.debian.org/pkg/mozjs128"
> +SRC_URI[sha256sum] =3D
> "358bb03c550f95172f1e31694e4287da3411560df91e931cb25210efdf90e524"
> +
> +UPSTREAM_CHECK_URI =3D "https://tracker.debian.org/pkg/mozjs140"
>  UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
>
>  S =3D "${UNPACKDIR}/firefox-${PV}"
> @@ -70,6 +69,7 @@ ICU:mipsarch =3D ""
>  ICU:powerpc:toolchain-clang =3D ""
>
>  LDFLAGS:append:riscv32 =3D " -latomic"
> +SECURITY_STRINGFORMAT =3D ""
>
>  do_configure() {
>      cd ${B}
> @@ -86,9 +86,9 @@ do_configure() {
>  }
>  do_configure[cleandirs] +=3D "${B}"
>
> -# The main build system is a Makefile that call cargo downstream.
> -# We inherit cargo to get the environnement but need to switch back to
> -# base_do_compile to do the Makefile base compilation.
> +# The main build system is a Makefile that calls cargo downstream.
> +# We inherit cargo to get the environment but need to switch back to
> +# base_do_compile to do the Makefile based compilation.
>  do_compile() {
>      base_do_compile
>  }
> @@ -107,6 +107,12 @@ do_install:append() {
>      sed -e 's@${STAGING_DIR_HOST}@@g' \
>          -i ${D}${bindir}/js${MAJ_VER}-config
>      rm -f ${D}${libdir}/libjs_static.ajs
> +    # The installed SpiderMonkey headers require the consumer to define
> XP_UNIX
> +    # or XP_WIN; mozilla/UniquePtrExtensions.h #errors out otherwise.
> js.pc.in
> +    # ships only -isystem, and js-confdefs.h (which carries -DXP_UNIX in
> the
> +    # internal build) is deliberately not in EXPORTS, so declare it here=
.
> +    sed -i -e 's|^Cflags: |Cflags: -DXP_UNIX |' \
> +        ${D}${libdir}/pkgconfig/mozjs-${MAJ_VER}.pc
>  }
>
>  INSANE_SKIP +=3D "32bit-time"
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129708):
> https://lists.openembedded.org/g/openembedded-devel/message/129708
> Mute This Topic: https://lists.openembedded.org/mt/121065949/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005a9819065a955c66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">libpeas depends on=C2=A0&#39;mozjs-128&#39; that needs to =
be addressed as well.</div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 3, 2026 at 1:19=E2=
=80=AFAM Markus Volk via <a href=3D"http://lists.openembedded.org">lists.op=
enembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.openembe=
dded.org">t-online.de@lists.openembedded.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Dropped versus mozjs-128, both =
now fixed upstream in 140:<br>
0002-moz.configure-do-not-look-for-llvm-objdump.patch<br>
The LLVM_OBJDUMP check_prog block is gone from moz.configure entirely.<br>
0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch<br>
js/moz.configure already asks for &quot;icu-uc icu-i18n &gt;=3D 76.1&quot;.=
<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0...nfigure-do-not-look-for-llvm-objdump.patch | 43 -----------------<=
br>
=C2=A0...ix-one-occasionally-reproduced-confi.patch | 47 ------------------=
-<br>
=C2=A0...with-icu-uc-to-fix-build-with-ICU-76.patch | 27 -----------<br>
=C2=A0...001-Cargo.toml-do-not-abort-on-panic.patch |=C2=A0 0<br>
=C2=A0...-not-try-to-find-a-suitable-upstrea.patch} |=C2=A0 0<br>
=C2=A0.../0003-use-asm-sgidefs.h.patch}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 0<br>
=C2=A0.../0004-Add-RISCV32-support.patch}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 0<br>
=C2=A0...ix-one-occasionally-reproduced-confi.patch | 29 ++++++++++++<br>
=C2=A0...ewrite-cargo-host-linker-in-python3.patch} |=C2=A0 2 +-<br>
=C2=A0...e-stack-unwinder-like-glibc-therefo.patch} |=C2=A0 0<br>
=C2=A0...om-firefox-bugzilla-to-fix-compile-.patch} |=C2=A0 0<br>
=C2=A0...on-isn-t-available-in-ARMv5-or-v6-s.patch} |=C2=A0 0<br>
=C2=A0...gc-and-riscv32gc-as-valid-architect.patch} | 38 ++++++++-------<br=
>
=C2=A0.../0011-Fix-build-error-with-musl.patch}=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
0<br>
=C2=A0...d-ast.Str-and-ast.Index-with-ast.Co.patch} | 30 +++++++-----<br>
=C2=A0...-<a href=3D"http://128_128.14.0.bb" rel=3D"noreferrer" target=3D"_=
blank">128_128.14.0.bb</a> =3D&gt; <a href=3D"http://mozjs-140_140.15.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">mozjs-140_140.15.0.bb</a>} | 42 +++++=
+++++-------<br>
=C2=A016 files changed, 93 insertions(+), 165 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.=
configure-do-not-look-for-llvm-objdump.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0006-util=
.configure-fix-one-occasionally-reproduced-confi.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link=
-with-icu-uc-to-fix-build-with-ICU-76.patch<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D&gt; mozjs-140}/0=
001-Cargo.toml-do-not-abort-on-panic.patch (100%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/{mozjs-128/0003-rust.configure-=
do-not-try-to-find-a-suitable-upstrea.patch =3D&gt; mozjs-140/0002-rust.con=
figure-do-not-try-to-find-a-suitable-upstrea.patch} (100%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/{mozjs-128/0004-use-asm-sgidefs=
.h.patch =3D&gt; mozjs-140/0003-use-asm-sgidefs.h.patch} (100%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/{mozjs-128/0005-Add-RISCV32-sup=
port.patch =3D&gt; mozjs-140/0004-Add-RISCV32-support.patch} (100%)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-140/0005-util=
.configure-fix-one-occasionally-reproduced-confi.patch<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/{mozjs-128/0007-Rewrite-cargo-h=
ost-linker-in-python3.patch =3D&gt; mozjs-140/0006-Rewrite-cargo-host-linke=
r-in-python3.patch} (96%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/{mozjs-128/0008-Musl-does-not-h=
ave-stack-unwinder-like-glibc-therefo.patch =3D&gt; mozjs-140/0007-Musl-doe=
s-not-have-stack-unwinder-like-glibc-therefo.patch} (100%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/{mozjs-128/0009-Backport-patch-=
from-firefox-bugzilla-to-fix-compile-.patch =3D&gt; mozjs-140/0008-Backport=
-patch-from-firefox-bugzilla-to-fix-compile-.patch} (100%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/{mozjs-128/0010-The-ISB-instruc=
tion-isn-t-available-in-ARMv5-or-v6-s.patch =3D&gt; mozjs-140/0009-The-ISB-=
instruction-isn-t-available-in-ARMv5-or-v6-s.patch} (100%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/{mozjs-128/0012-Recognise-riscv=
64gc-and-riscv32gc-as-valid-architect.patch =3D&gt; mozjs-140/0010-Recognis=
e-riscv64gc-and-riscv32gc-as-valid-architect.patch} (62%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/{mozjs-128/0013-Fix-build-error=
-with-musl.patch =3D&gt; mozjs-140/0011-Fix-build-error-with-musl.patch} (1=
00%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/{mozjs-128/D261512.1755672843.p=
atch =3D&gt; mozjs-140/0012-Replace-deprecated-ast.Str-and-ast.Index-with-a=
st.Co.patch} (72%)<br>
=C2=A0rename meta-oe/recipes-extended/mozjs/{<a href=3D"http://mozjs-128_12=
8.14.0.bb" rel=3D"noreferrer" target=3D"_blank">mozjs-128_128.14.0.bb</a> =
=3D&gt; <a href=3D"http://mozjs-140_140.15.0.bb" rel=3D"noreferrer" target=
=3D"_blank">mozjs-140_140.15.0.bb</a>} (64%)<br>
<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do=
-not-look-for-llvm-objdump.patch b/meta-oe/recipes-extended/mozjs/mozjs-128=
/0002-moz.configure-do-not-look-for-llvm-objdump.patch<br>
deleted file mode 100644<br>
index 0616aa3ee7..0000000000<br>
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-lo=
ok-for-llvm-objdump.patch<br>
+++ /dev/null<br>
@@ -1,43 +0,0 @@<br>
-From 0f885ae37ef7cd94fd0712cefb5d3314fbcfdf44 Mon Sep 17 00:00:00 2001<br>
-From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" target=
=3D"_blank">alex@linutronix.de</a>&gt;<br>
-Date: Fri, 1 Oct 2021 13:01:10 +0200<br>
-Subject: [PATCH] moz.configure: do not look for llvm-objdump<br>
-<br>
-This avoid dragging in a dependency that isn&#39;t even needed<br>
-for js builds.<br>
-<br>
-Upstream-Status: Inappropriate [oe-core specific]<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de"=
 target=3D"_blank">alex@linutronix.de</a>&gt;<br>
----<br>
- moz.configure | 18 +++++++++---------<br>
- 1 file changed, 9 insertions(+), 9 deletions(-)<br>
-<br>
-diff --git a/moz.configure b/moz.configure<br>
-index 804b9a375a..402e79e3b3 100755<br>
---- a/moz.configure<br>
-+++ b/moz.configure<br>
-@@ -390,15 +390,15 @@ def plain_llvm_or_prefixed(name, llvm_name=3DNone):<=
br>
-=C2=A0 =C2=A0 =C2=A0return plain_llvm_or_prefixed<br>
- <br>
- <br>
--llvm_objdump =3D check_prog(<br>
--=C2=A0 =C2=A0 &quot;LLVM_OBJDUMP&quot;,<br>
--=C2=A0 =C2=A0 llvm_tool(&quot;llvm-objdump&quot;),<br>
--=C2=A0 =C2=A0 what=3D&quot;llvm-objdump&quot;,<br>
--=C2=A0 =C2=A0 when=3D&quot;--enable-compile-environment&quot;,<br>
--=C2=A0 =C2=A0 paths=3Dclang_search_path,<br>
--)<br>
--<br>
--add_old_configure_assignment(&quot;LLVM_OBJDUMP&quot;, llvm_objdump)<br>
-+#llvm_objdump =3D check_prog(<br>
-+#=C2=A0 =C2=A0 &quot;LLVM_OBJDUMP&quot;,<br>
-+#=C2=A0 =C2=A0 llvm_tool(&quot;llvm-objdump&quot;),<br>
-+#=C2=A0 =C2=A0 what=3D&quot;llvm-objdump&quot;,<br>
-+#=C2=A0 =C2=A0 when=3D&quot;--enable-compile-environment&quot;,<br>
-+#=C2=A0 =C2=A0 paths=3Dclang_search_path,<br>
-+#)<br>
-+#<br>
-+#add_old_configure_assignment(&quot;LLVM_OBJDUMP&quot;, llvm_objdump)<br>
- <br>
- <br>
- def validate_readelf(path):<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.configure-f=
ix-one-occasionally-reproduced-confi.patch b/meta-oe/recipes-extended/mozjs=
/mozjs-128/0006-util.configure-fix-one-occasionally-reproduced-confi.patch<=
br>
deleted file mode 100644<br>
index 9cc7831876..0000000000<br>
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.configure-fix-one-=
occasionally-reproduced-confi.patch<br>
+++ /dev/null<br>
@@ -1,47 +0,0 @@<br>
-From 13b544e4ed51f41138bf200eb84552e169df87b0 Mon Sep 17 00:00:00 2001<br>
-From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" targe=
t=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
-Date: Thu, 11 Nov 2021 16:05:54 +0800<br>
-Subject: [PATCH] util.configure: fix one occasionally reproduced configure=
<br>
- failure<br>
-<br>
-error:<br>
-| checking whether the C++ compiler supports -Wno-range-loop-analysis...<b=
r>
-| DEBUG: Creating /tmp/conftest.jr1qrcw3.cpp with content:<br>
-| DEBUG: | int<br>
-| DEBUG: | main(void)<br>
-| DEBUG: | {<br>
-| DEBUG: |<br>
-| DEBUG: | ;<br>
-| DEBUG: | return 0;<br>
-| DEBUG: | }<br>
-| DEBUG: Executing: aarch64-wrs-linux-g++ -mcpu=3Dcortex-a53 -march=3Darmv=
8-a+crc -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wforma=
t-security -Werror=3Dformat-security --sysroot=3D/mozjs/91.1.0-r0/recipe-sy=
sroot /tmp/conftest.jr1qrcw3.cpp -Werror -Wrange-loop-analysis -c<br>
-| DEBUG: The command returned non-zero exit status 1.<br>
-| DEBUG: Its error output was:<br>
-...<br>
-| File &quot;/mozjs/91.1.0-r0/firefox-91.1.0/build/moz.configure/util.conf=
igure&quot;, line 239, in try_invoke_compiler<br>
-| os.remove(path)<br>
-| FileNotFoundError: [Errno 2] No such file or directory: &#39;/tmp/confte=
st.jr1qrcw3.cpp&#39;<br>
-<br>
-It should be another process that deleted this file by using<br>
-&quot;rm -rf conftest*&quot; inappropriately<br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://bugzilla.mozilla.org/show_b=
ug.cgi?id=3D1740667" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.=
mozilla.org/show_bug.cgi?id=3D1740667</a>]<br>
-<br>
-Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
----<br>
- build/moz.configure/util.configure | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/build/moz.configure/util.configure b/build/moz.configure/util=
.configure<br>
-index d93b91fcdd..47ab8b92b9 100644<br>
---- a/build/moz.configure/util.configure<br>
-+++ b/build/moz.configure/util.configure<br>
-@@ -256,7 +256,7 @@ def try_invoke_compiler(<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;C++&quot;: &quot;.cpp&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0}[language]<br>
- <br>
--=C2=A0 =C2=A0 fd, path =3D mkstemp(prefix=3D&quot;conftest.&quot;, suffix=
=3Dsuffix, text=3DTrue)<br>
-+=C2=A0 =C2=A0 fd, path =3D mkstemp(prefix=3D&quot;try_invoke_compiler_con=
ftest.&quot;, suffix=3Dsuffix, text=3DTrue)<br>
-=C2=A0 =C2=A0 =C2=A0try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source =3D source.encode(&quot;ascii&quo=
t;, &quot;replace&quot;)<br>
- <br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-with-icu-uc=
-to-fix-build-with-ICU-76.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/=
0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch<br>
deleted file mode 100644<br>
index 2d85e29005..0000000000<br>
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-with-icu-uc-to-fix=
-build-with-ICU-76.patch<br>
+++ /dev/null<br>
@@ -1,27 +0,0 @@<br>
-From 8290fd619582651334fbfdfe7be887d539ce0f2c Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Sat, 23 Nov 2024 13:28:33 -0800<br>
-Subject: [PATCH] Link with icu-uc to fix build with ICU-76<br>
-<br>
-Fixes<br>
-<a href=3D"https://bugzilla.mozilla.org/show_bug.cgi?id=3D1927380" rel=3D"=
noreferrer" target=3D"_blank">https://bugzilla.mozilla.org/show_bug.cgi?id=
=3D1927380</a><br>
-<br>
-Upstream-Status: Pending<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- js/moz.configure | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/js/moz.configure b/js/moz.configure<br>
-index 593b93acee..2181dca34b 100644<br>
---- a/js/moz.configure<br>
-+++ b/js/moz.configure<br>
-@@ -1305,7 +1305,7 @@ def enable_system_icu_option(enable_system_icu):<br>
-=C2=A0 =C2=A0 =C2=A0return enable_system_icu<br>
- <br>
- <br>
--system_icu =3D pkg_check_modules(&quot;MOZ_ICU&quot;, &quot;icu-i18n &gt;=
=3D 73.1&quot;, when=3D&quot;--with-system-icu&quot;)<br>
-+system_icu =3D pkg_check_modules(&quot;MOZ_ICU&quot;, &quot;icu-i18n &gt;=
=3D 73.1 icu-uc&quot;, when=3D&quot;--with-system-icu&quot;)<br>
- <br>
- <br>
- @depends(enable_system_icu_option)<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-no=
t-abort-on-panic.patch b/meta-oe/recipes-extended/mozjs/mozjs-140/0001-Carg=
o.toml-do-not-abort-on-panic.patch<br>
similarity index 100%<br>
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-not=
-abort-on-panic.patch<br>
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0001-Cargo.toml-do-not-a=
bort-on-panic.patch<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-d=
o-not-try-to-find-a-suitable-upstrea.patch b/meta-oe/recipes-extended/mozjs=
/mozjs-140/0002-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch<=
br>
similarity index 100%<br>
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-do=
-not-try-to-find-a-suitable-upstrea.patch<br>
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0002-rust.configure-do-n=
ot-try-to-find-a-suitable-upstrea.patch<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.=
h.patch b/meta-oe/recipes-extended/mozjs/mozjs-140/0003-use-asm-sgidefs.h.p=
atch<br>
similarity index 100%<br>
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h=
.patch<br>
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0003-use-asm-sgidefs.h.p=
atch<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV32-supp=
ort.patch b/meta-oe/recipes-extended/mozjs/mozjs-140/0004-Add-RISCV32-suppo=
rt.patch<br>
similarity index 100%<br>
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV32-suppo=
rt.patch<br>
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0004-Add-RISCV32-support=
.patch<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-140/0005-util.configure-f=
ix-one-occasionally-reproduced-confi.patch b/meta-oe/recipes-extended/mozjs=
/mozjs-140/0005-util.configure-fix-one-occasionally-reproduced-confi.patch<=
br>
new file mode 100644<br>
index 0000000000..6430de38f2<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/mozjs/mozjs-140/0005-util.configure-fix-one-=
occasionally-reproduced-confi.patch<br>
@@ -0,0 +1,29 @@<br>
+From fe1c2336dfe5e8b4357d5e382edd1eba30cfa7d7 Mon Sep 17 00:00:00 2001<br>
+From: x &lt;a@b.c&gt;<br>
+Date: Wed, 2 Sep 2026 20:23:10 +0000<br>
+Subject: [PATCH] util.configure: fix one occasionally reproduced configure=
<br>
+ failure<br>
+<br>
+try_invoke_compiler() creates its temporary files with the prefix &quot;co=
nftest&quot;,<br>
+which collides with the files other configure checks create under the same=
<br>
+name. Under parallel builds this occasionally makes a check pick up a stal=
e<br>
+file and fail. Use a distinct prefix.<br>
+<br>
+Upstream-Status: Pending<br>
+---<br>
+ build/moz.configure/util.configure | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/build/moz.configure/util.configure b/build/moz.configure/util=
.configure<br>
+index 8d31d112a..cb0884496 100644<br>
+--- a/build/moz.configure/util.configure<br>
++++ b/build/moz.configure/util.configure<br>
+@@ -169,7 +169,7 @@ normalize_path =3D normalize_path()<br>
+ def make_create_temporary_file():<br>
+=C2=A0 =C2=A0 =C2=A0@contextmanager<br>
+=C2=A0 =C2=A0 =C2=A0def create_temporary_file(suffix):<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd, path =3D mkstemp(prefix=3D&quot;conftest&=
quot;, suffix=3Dsuffix)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd, path =3D mkstemp(prefix=3D&quot;try_invok=
e_compiler_conftest&quot;, suffix=3Dsuffix)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.close(fd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yield path<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-cargo-ho=
st-linker-in-python3.patch b/meta-oe/recipes-extended/mozjs/mozjs-140/0006-=
Rewrite-cargo-host-linker-in-python3.patch<br>
similarity index 96%<br>
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-cargo-hos=
t-linker-in-python3.patch<br>
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0006-Rewrite-cargo-host-=
linker-in-python3.patch<br>
index 9d6a89214b..71ec4b29b6 100644<br>
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-cargo-host-link=
er-in-python3.patch<br>
+++ b/meta-oe/recipes-extended/mozjs/mozjs-140/0006-Rewrite-cargo-host-link=
er-in-python3.patch<br>
@@ -29,7 +29,7 @@ index cbd0472bf7..87d43ce9ec 100755<br>
=C2=A0@@ -1,3 +1,21 @@<br>
=C2=A0-#!/bin/sh<br>
=C2=A0-# See comment in cargo-linker.<br>
--eval ${MOZ_CARGO_WRAP_HOST_LD} ${MOZ_CARGO_WRAP_HOST_LDFLAGS} &#39;&quot;=
$@&quot;&#39;<br>
+-eval ${MOZ_CARGO_WRAP_HOST_LD} &#39;&quot;$@&quot;&#39; ${MOZ_CARGO_WRAP_=
HOST_LDFLAGS}<br>
=C2=A0+#!/usr/bin/env python3<br>
=C2=A0+<br>
=C2=A0+import os,sys<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-not-ha=
ve-stack-unwinder-like-glibc-therefo.patch b/meta-oe/recipes-extended/mozjs=
/mozjs-140/0007-Musl-does-not-have-stack-unwinder-like-glibc-therefo.patch<=
br>
similarity index 100%<br>
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-not-hav=
e-stack-unwinder-like-glibc-therefo.patch<br>
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0007-Musl-does-not-have-=
stack-unwinder-like-glibc-therefo.patch<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0009-Backport-patch-f=
rom-firefox-bugzilla-to-fix-compile-.patch b/meta-oe/recipes-extended/mozjs=
/mozjs-140/0008-Backport-patch-from-firefox-bugzilla-to-fix-compile-.patch<=
br>
similarity index 100%<br>
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0009-Backport-patch-fr=
om-firefox-bugzilla-to-fix-compile-.patch<br>
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0008-Backport-patch-from=
-firefox-bugzilla-to-fix-compile-.patch<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0010-The-ISB-instruct=
ion-isn-t-available-in-ARMv5-or-v6-s.patch b/meta-oe/recipes-extended/mozjs=
/mozjs-140/0009-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.patch<=
br>
similarity index 100%<br>
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0010-The-ISB-instructi=
on-isn-t-available-in-ARMv5-or-v6-s.patch<br>
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0009-The-ISB-instruction=
-isn-t-available-in-ARMv5-or-v6-s.patch<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv6=
4gc-and-riscv32gc-as-valid-architect.patch b/meta-oe/recipes-extended/mozjs=
/mozjs-140/0010-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.patch<=
br>
similarity index 62%<br>
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv64=
gc-and-riscv32gc-as-valid-architect.patch<br>
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0010-Recognise-riscv64gc=
-and-riscv32gc-as-valid-architect.patch<br>
index 9cdb9fe913..21d79e8686 100644<br>
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv64gc-and=
-riscv32gc-as-valid-architect.patch<br>
+++ b/meta-oe/recipes-extended/mozjs/mozjs-140/0010-Recognise-riscv64gc-and=
-riscv32gc-as-valid-architect.patch<br>
@@ -1,35 +1,37 @@<br>
-From 93d586d712bf34c243c6174425c78d3ab274c6a0 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Tue, 7 Jan 2025 15:17:16 -0800<br>
+From 6fac6696adffc7b4f2bd47e12e8cae842736813f Mon Sep 17 00:00:00 2001<br>
+From: x &lt;a@b.c&gt;<br>
+Date: Wed, 2 Sep 2026 20:23:36 +0000<br>
=C2=A0Subject: [PATCH] Recognise riscv64gc and riscv32gc as valid architect=
ures<br>
<br>
-Rust uses above for architecture in tuples<br>
+rust names the riscv targets riscv64gc-* and riscv32gc-*, and OE passes th=
at<br>
+triple straight through to configure. config.sub rejects it.<br>
<br>
=C2=A0Upstream-Status: Pending<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0---<br>
- build/autoconf/config.sub=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>
+ build/autoconf/config.sub=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 ++<br>
=C2=A0 .../mozbuild/test/configure/test_toolchain_configure.py=C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 4 ++++<br>
- 2 files changed, 5 insertions(+), 1 deletion(-)<br>
+ 2 files changed, 6 insertions(+)<br>
<br>
=C2=A0diff --git a/build/autoconf/config.sub b/build/autoconf/config.sub<br=
>
-index 2c6a07ab3c..f7ee82380c 100755<br>
+index 4aaae46f6..10020ca01 100755<br>
=C2=A0--- a/build/autoconf/config.sub<br>
=C2=A0+++ b/build/autoconf/config.sub<br>
-@@ -1236,7 +1236,7 @@ case $cpu-$vendor in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| powerpc | powerpc64 | powerpc64le | powerpcle | powerpcspe \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| pru \<br>
+@@ -1395,8 +1395,10 @@ case $cpu-$vendor in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | pyramid \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | riscv | riscv32 | riscv32be | riscv64 | riscv64be \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | riscv | riscv32 | riscv32be | riscv32gc | riscv64 | riscv64be | riscv=
64gc \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| rl78 | romp | rs6000 | rx \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| s390 | s390x \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| score \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| riscv \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| riscv32 \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | riscv32gc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| riscv32be \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| riscv64 \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | riscv64gc \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| riscv64be \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| rl78 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| romp \<br>
=C2=A0diff --git a/python/mozbuild/mozbuild/test/configure/test_toolchain_c=
onfigure.py b/python/mozbuild/mozbuild/test/configure/test_toolchain_config=
ure.py<br>
-index 1be0d02e54..a476d787b2 100644<br>
+index 481ce4687..b5ce7785b 100644<br>
=C2=A0--- a/python/mozbuild/mozbuild/test/configure/test_toolchain_configur=
e.py<br>
=C2=A0+++ b/python/mozbuild/mozbuild/test/configure/test_toolchain_configur=
e.py<br>
-@@ -1327,6 +1327,10 @@ class LinuxCrossCompileToolchainTest(BaseToolchainT=
est):<br>
+@@ -1328,6 +1328,10 @@ class LinuxCrossCompileToolchainTest(BaseToolchainT=
est):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;mips-unknown-linux-gnu&quot;: big_=
endian + {&quot;__mips__&quot;: 1},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;riscv32-unknown-linux-gnu&quot;: l=
ittle_endian + {&quot;__riscv&quot;: 1, &quot;__riscv_xlen&quot;: 32},<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;riscv64-unknown-linux-gnu&quot;: l=
ittle_endian + {&quot;__riscv&quot;: 1, &quot;__riscv_xlen&quot;: 64},<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-error-=
with-musl.patch b/meta-oe/recipes-extended/mozjs/mozjs-140/0011-Fix-build-e=
rror-with-musl.patch<br>
similarity index 100%<br>
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-error-w=
ith-musl.patch<br>
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0011-Fix-build-error-wit=
h-musl.patch<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/D261512.1755672843.pa=
tch b/meta-oe/recipes-extended/mozjs/mozjs-140/0012-Replace-deprecated-ast.=
Str-and-ast.Index-with-ast.Co.patch<br>
similarity index 72%<br>
rename from meta-oe/recipes-extended/mozjs/mozjs-128/D261512.1755672843.pat=
ch<br>
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0012-Replace-deprecated-=
ast.Str-and-ast.Index-with-ast.Co.patch<br>
index 1b35d2c094..7838de39d0 100644<br>
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/D261512.1755672843.patch<br>
+++ b/meta-oe/recipes-extended/mozjs/mozjs-140/0012-Replace-deprecated-ast.=
Str-and-ast.Index-with-ast.Co.patch<br>
@@ -1,14 +1,22 @@<br>
-This patch fixes configure with python 3.14<br>
+From 459a43a9b1f767cde9a8bbb6016b5f9d17890370 Mon Sep 17 00:00:00 2001<br>
+From: x &lt;a@b.c&gt;<br>
+Date: Wed, 2 Sep 2026 20:23:13 +0000<br>
+Subject: [PATCH] Replace deprecated ast.Str and ast.Index with ast.Constan=
t<br>
<br>
-Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
+ast.Str and ast.Index were removed in Python 3.12, which makes mozbuild fa=
il<br>
+to read moz.build files when the build host provides a newer python3.<br>
<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/mozilla-firefox/f=
irefox/commit/d497aa4f770ca02f6083e93b94996a8fe32c2ff4" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/mozilla-firefox/firefox/commit/d497aa4=
f770ca02f6083e93b94996a8fe32c2ff4</a>]<br>
+Upstream-Status: Backport [<a href=3D"https://phabricator.services.mozilla=
.com/D261512" rel=3D"noreferrer" target=3D"_blank">https://phabricator.serv=
ices.mozilla.com/D261512</a>]<br>
+---<br>
+ python/mozbuild/mozbuild/frontend/reader.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
14 +++++++-------<br>
+ .../mozbuild/mozbuild/vendor/rewrite_mozbuild.py=C2=A0 =C2=A0|=C2=A0 6 ++=
----<br>
+ 2 files changed, 9 insertions(+), 11 deletions(-)<br>
<br>
=C2=A0diff --git a/python/mozbuild/mozbuild/frontend/reader.py b/python/moz=
build/mozbuild/frontend/reader.py<br>
-index 5cb627b..c2dcafe 100644<br>
+index 9f6292cb9..89bf9995c 100644<br>
=C2=A0--- a/python/mozbuild/mozbuild/frontend/reader.py<br>
=C2=A0+++ b/python/mozbuild/mozbuild/frontend/reader.py<br>
-@@ -470,7 +470,7 @@ class TemplateFunction(object):<br>
+@@ -470,7 +470,7 @@ class TemplateFunction:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return c(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ast.Subscrip=
t(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 value=3Dc(ast.Name(id=3Dself._global_name, ctx=3Dast.Load())),<br>
@@ -17,7 +25,7 @@ index 5cb627b..c2dcafe 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ctx=3Dnode.ctx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
-@@ -1035,8 +1035,8 @@ class BuildReader(object):<br>
+@@ -1039,8 +1039,8 @@ class BuildReader:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 # Others<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 assert isinstance(target.slice, ast.Index)<br>
@@ -25,10 +33,10 @@ index 5cb627b..c2dcafe 100644<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 key =3D target.slice.value.s<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 assert isinstance(target.slice.value, ast.Constant)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 key =3D target.slice.value.value<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return name, key<br>
- <br>
-@@ -1044,11 +1044,11 @@ class BuildReader(object):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elif isinstance(target, as=
t.Attribute):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert isins=
tance(target.attr, str)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0key =3D targ=
et.attr<br>
+@@ -1051,11 +1051,11 @@ class BuildReader:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D node.value<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(value, ast.L=
ist):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for v in val=
ue.elts:<br>
@@ -45,7 +53,7 @@ index 5cb627b..c2dcafe 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assignments =3D []<br>
<br>
=C2=A0diff --git a/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py b/py=
thon/mozbuild/mozbuild/vendor/rewrite_mozbuild.py<br>
-index 1590267..151d27c 100644<br>
+index cfcc0f18b..de06b5881 100644<br>
=C2=A0--- a/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py<br>
=C2=A0+++ b/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py<br>
=C2=A0@@ -327,15 +327,13 @@ def assignment_node_to_source_filename_list(cod=
e, node):<br>
diff --git a/meta-oe/recipes-extended/mozjs/<a href=3D"http://mozjs-128_128=
.14.0.bb" rel=3D"noreferrer" target=3D"_blank">mozjs-128_128.14.0.bb</a> b/=
meta-oe/recipes-extended/mozjs/<a href=3D"http://mozjs-140_140.15.0.bb" rel=
=3D"noreferrer" target=3D"_blank">mozjs-140_140.15.0.bb</a><br>
similarity index 64%<br>
rename from meta-oe/recipes-extended/mozjs/<a href=3D"http://mozjs-128_128.=
14.0.bb" rel=3D"noreferrer" target=3D"_blank">mozjs-128_128.14.0.bb</a><br>
rename to meta-oe/recipes-extended/mozjs/<a href=3D"http://mozjs-140_140.15=
.0.bb" rel=3D"noreferrer" target=3D"_blank">mozjs-140_140.15.0.bb</a><br>
index 635cad96cf..7b1418cf29 100644<br>
--- a/meta-oe/recipes-extended/mozjs/<a href=3D"http://mozjs-128_128.14.0.b=
b" rel=3D"noreferrer" target=3D"_blank">mozjs-128_128.14.0.bb</a><br>
+++ b/meta-oe/recipes-extended/mozjs/<a href=3D"http://mozjs-140_140.15.0.b=
b" rel=3D"noreferrer" target=3D"_blank">mozjs-140_140.15.0.bb</a><br>
@@ -6,23 +6,22 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Ddc9b6ecd1=
9a14a54a628edaaf23733bf&quot;<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0<a href=3D"https://archive.mozilla.org/pub/firefox/rele=
ases/$%7BPV%7Desr/source/firefox-$%7BPV%7Desr.source.tar.xz" rel=3D"norefer=
rer" target=3D"_blank">https://archive.mozilla.org/pub/firefox/releases/${P=
V}esr/source/firefox-${PV}esr.source.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-Cargo.toml-do-not-abort-on-panic.patch \<br=
>
-=C2=A0 =C2=A0 file://0002-moz.configure-do-not-look-for-llvm-objdump.patch=
 \<br>
-=C2=A0 =C2=A0 file://0003-rust.configure-do-not-try-to-find-a-suitable-ups=
trea.patch \<br>
-=C2=A0 =C2=A0 file://0004-use-asm-sgidefs.h.patch \<br>
-=C2=A0 =C2=A0 file://0005-Add-RISCV32-support.patch \<br>
-=C2=A0 =C2=A0 file://0006-util.configure-fix-one-occasionally-reproduced-c=
onfi.patch \<br>
-=C2=A0 =C2=A0 file://0007-Rewrite-cargo-host-linker-in-python3.patch=C2=A0=
 \<br>
-=C2=A0 =C2=A0 file://0008-Musl-does-not-have-stack-unwinder-like-glibc-the=
refo.patch \<br>
-=C2=A0 =C2=A0 file://0009-Backport-patch-from-firefox-bugzilla-to-fix-comp=
ile-.patch \<br>
-=C2=A0 =C2=A0 file://0010-The-ISB-instruction-isn-t-available-in-ARMv5-or-=
v6-s.patch \<br>
-=C2=A0 =C2=A0 file://0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch =
\<br>
-=C2=A0 =C2=A0 file://0012-Recognise-riscv64gc-and-riscv32gc-as-valid-archi=
tect.patch \<br>
-=C2=A0 =C2=A0 file://0013-Fix-build-error-with-musl.patch \<br>
-=C2=A0 =C2=A0 file://D261512.1755672843.patch \<br>
+=C2=A0 =C2=A0 file://0002-rust.configure-do-not-try-to-find-a-suitable-ups=
trea.patch \<br>
+=C2=A0 =C2=A0 file://0003-use-asm-sgidefs.h.patch \<br>
+=C2=A0 =C2=A0 file://0004-Add-RISCV32-support.patch \<br>
+=C2=A0 =C2=A0 file://0005-util.configure-fix-one-occasionally-reproduced-c=
onfi.patch \<br>
+=C2=A0 =C2=A0 file://0006-Rewrite-cargo-host-linker-in-python3.patch \<br>
+=C2=A0 =C2=A0 file://0007-Musl-does-not-have-stack-unwinder-like-glibc-the=
refo.patch \<br>
+=C2=A0 =C2=A0 file://0008-Backport-patch-from-firefox-bugzilla-to-fix-comp=
ile-.patch \<br>
+=C2=A0 =C2=A0 file://0009-The-ISB-instruction-isn-t-available-in-ARMv5-or-=
v6-s.patch \<br>
+=C2=A0 =C2=A0 file://0010-Recognise-riscv64gc-and-riscv32gc-as-valid-archi=
tect.patch \<br>
+=C2=A0 =C2=A0 file://0011-Fix-build-error-with-musl.patch \<br>
+=C2=A0 =C2=A0 file://0012-Replace-deprecated-ast.Str-and-ast.Index-with-as=
t.Co.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[sha256sum] =3D &quot;93b9ef6229f41cb22ff109b95bbf61a78395a0fe4b870=
192eeca22947cb09a53&quot;<br>
<br>
-UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://tracker.debian.org/pkg/moz=
js128" rel=3D"noreferrer" target=3D"_blank">https://tracker.debian.org/pkg/=
mozjs128</a>&quot;<br>
+SRC_URI[sha256sum] =3D &quot;358bb03c550f95172f1e31694e4287da3411560df91e9=
31cb25210efdf90e524&quot;<br>
+<br>
+UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://tracker.debian.org/pkg/moz=
js140" rel=3D"noreferrer" target=3D"_blank">https://tracker.debian.org/pkg/=
mozjs140</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d+)+)&quot;<br>
<br>
=C2=A0S =3D &quot;${UNPACKDIR}/firefox-${PV}&quot;<br>
@@ -70,6 +69,7 @@ ICU:mipsarch =3D &quot;&quot;<br>
=C2=A0ICU:powerpc:toolchain-clang =3D &quot;&quot;<br>
<br>
=C2=A0LDFLAGS:append:riscv32 =3D &quot; -latomic&quot;<br>
+SECURITY_STRINGFORMAT =3D &quot;&quot;<br>
<br>
=C2=A0do_configure() {<br>
=C2=A0 =C2=A0 =C2=A0cd ${B}<br>
@@ -86,9 +86,9 @@ do_configure() {<br>
=C2=A0}<br>
=C2=A0do_configure[cleandirs] +=3D &quot;${B}&quot;<br>
<br>
-# The main build system is a Makefile that call cargo downstream.<br>
-# We inherit cargo to get the environnement but need to switch back to<br>
-# base_do_compile to do the Makefile base compilation.<br>
+# The main build system is a Makefile that calls cargo downstream.<br>
+# We inherit cargo to get the environment but need to switch back to<br>
+# base_do_compile to do the Makefile based compilation.<br>
=C2=A0do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0base_do_compile<br>
=C2=A0}<br>
@@ -107,6 +107,12 @@ do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0sed -e &#39;s@${STAGING_DIR_HOST}@@g&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-i ${D}${bindir}/js${MAJ_VER}-config<br>
=C2=A0 =C2=A0 =C2=A0rm -f ${D}${libdir}/libjs_static.ajs<br>
+=C2=A0 =C2=A0 # The installed SpiderMonkey headers require the consumer to=
 define XP_UNIX<br>
+=C2=A0 =C2=A0 # or XP_WIN; mozilla/UniquePtrExtensions.h #errors out other=
wise. <a href=3D"http://js.pc.in" rel=3D"noreferrer" target=3D"_blank">js.p=
c.in</a><br>
+=C2=A0 =C2=A0 # ships only -isystem, and js-confdefs.h (which carries -DXP=
_UNIX in the<br>
+=C2=A0 =C2=A0 # internal build) is deliberately not in EXPORTS, so declare=
 it here.<br>
+=C2=A0 =C2=A0 sed -i -e &#39;s|^Cflags: |Cflags: -DXP_UNIX |&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${libdir}/pkgconfig/mozjs-${MAJ_VER}.pc<br=
>
=C2=A0}<br>
<br>
=C2=A0INSANE_SKIP +=3D &quot;32bit-time&quot;<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#129708): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/129708" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/129708</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121065949/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121065949/1997914</a><br>
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

--0000000000005a9819065a955c66--

