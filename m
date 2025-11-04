Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8261CCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 16:09:33 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21737.1762272566252094288
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 08:09:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FglNcAVS;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7866a2e932aso27622057b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 08:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762272565; x=1762877365; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9/uJFtqKLaPgcm/YippJkRsTXGTcBOWZ0GT+1+JSk4=;
        b=FglNcAVSBtL7aJvK2WGzngVZOgwpGMgQ5HQ0EnWEGcsFm0Am9XBr8QQqbcRbaIruN+
         3wryRk4OL51Lk+4AK5O92GnAQGBECnvRuraVewhzWPgGjy1rf3Kf94Hcr6Bbq5xVRuZd
         MDqzvcjDQhOy/Sbb+QtoEj9DhqZbMCeX2m2zFu1RNGJuCe2c1JPQ8NGgDxbNCMC+xvF7
         J1vkNIflFjibuRcyCcCgInES24ffoxoanH9f+7JP531B3VkHQ+iALhwqgpwTKuyba/bO
         Uk8n6rg1L6PX2U0+x3AgFPju1gbGJglKA7uAQdAg3n4eZ5YOAcBpeaq2+cgdFphdjpLH
         SD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762272565; x=1762877365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9/uJFtqKLaPgcm/YippJkRsTXGTcBOWZ0GT+1+JSk4=;
        b=gS4B7kUrxO8DMbkGoc6m5aSkuYCbP8k/w9KIvfSZ1uRFXtNkStI8Q6i2BLqKkPI4vr
         adhs5bIbcAn1CVIv+yM8rrheHWHxKNqWiEkgnPl9JBoYTrAfYjkRW+iJcbfX5ECLyyHv
         BbicwoYYvMn9FJUMpyPEVh9+Yfze/301KILHDBv0B57iYu7Yom5AmMslSyCN8P5JDPYc
         t4PDCx4Ik/cdsIYk4pkzG/F7RtP7Vkr53SlqbJMJIwvLWXElkWhuOoprJyvraxo3Ur2k
         Ulnja4EnOvG7mfs4bLPvyeMzenXwd1erIz9pIJcco94a4Cx/xKwWBlRR2UhVdJDjH/46
         NJ0A==
X-Gm-Message-State: AOJu0YzK8Blr/yLlkquRn9sI7psWgtUbz+tXPr9HgC/vidnNZAK6mjtA
	l1et5d0Nzs1qjwLp3eQ676suHKR6fbvlm5iPTg/vf9B+nvMqDT3ApUQman9Nx9l70XQlKeVPNSF
	SRS6NF3bBupj2MJnKMj/jyhQgoWivyoq8g6Xh
X-Gm-Gg: ASbGncuod15WBkfg492/k1L22lpJARgF6oOuPC4eMPpUJBF+MMDU5g3o2QWiBYSq5iQ
	T+vr6bqqArdMS4N8v+nKc8kPMU2Ij80LND/8/VQiVPGau9vMA/KxiYlSmd9DLRGhdAon5ZrJEhp
	VlyOAvx7a5BvBTu108wHdSqhiRZdHHVkj4lqZki8yjugViDAsdEJW+YRX0/hHPRJCdhxahituP0
	ljOxBfB8c/0v1uEarPyU3iX7E82EMycKccgPr3WUruFCJ4S8pFkH31hPnuOx1gy516kafq16Ney
	69iBbYP9JD81JouvPiCniDqwXZmO4sM1E+lGuHNp0/k5sZQs8L3YBTf+7KZwues0Z4/VJi2R2eW
	fAA==
X-Google-Smtp-Source: AGHT+IHyOicTdyX+Fra62+UWwWu19DPghMzHEECQvGgUoVGeVa9Lg5XT/mkrrN4lnz+607pRK+W1FcnmVjdPKHIOC2s=
X-Received: by 2002:a05:690c:e4af:b0:784:ac13:4494 with SMTP id
 00721157ae682-786a412243bmr129357b3.31.1762272565212; Tue, 04 Nov 2025
 08:09:25 -0800 (PST)
MIME-Version: 1.0
References: <20251104093017.474084-1-timotheus.giuliani@philips.com> <20251104093017.474084-2-timotheus.giuliani@philips.com>
In-Reply-To: <20251104093017.474084-2-timotheus.giuliani@philips.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Nov 2025 08:08:59 -0800
X-Gm-Features: AWmQ_bkcLKjFKIF79FTYKEB1Ny8uz3v7ZdJ5Zc8-0wcQBKb9BdR7p9YYjuGscCs
Message-ID: <CAMKF1soqVrWpZesbAvq-O-ydsWvzrY7mZ2-DB0C6Wi3Hztj+Fw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] fluentbit: add support for in-ebpf plugin
To: timotheus.giuliani@philips.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 16:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121301

On Tue, Nov 4, 2025 at 3:24=E2=80=AFAM Timotheus Giuliani via
lists.openembedded.org
<timotheus.giuliani=3Dphilips.com@lists.openembedded.org> wrote:
>
> Introduce support for the in-ebpf plugin in the Fluent Bit recipe,
> which was added as an experimental feature in Fluent Bit version 4.0.
> The new PACKAGECONFIG option enables building the eBPF input plugin
> when explicitly configured, adding the necessary build dependencies
> including bpftool-native, clang-native, and libbpf.
> The recipe also configures the LIBC_PATH for compilation environments
> to ensure to point to the correct target system's C library when the
> eBPF plugin is enabled.
>
> Signed-off-by: Timotheus Giuliani <timotheus.giuliani@philips.com>
> ---
>  ...root-include-path-for-system-headers.patch | 31 ++++++++
>  ...coded-target-architecture-definition.patch | 54 ++++++++++++++
>  ...tting-LIBC_PATH-from-external-config.patch | 73 +++++++++++++++++++
>  .../fluentbit/fluentbit_4.0.1.bb              |  7 ++
>  4 files changed, 165 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0006-cma=
ke-add-recipe-sysroot-include-path-for-system-headers.patch
>  create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0007-bpf=
-remove-hardcoded-target-architecture-definition.patch
>  create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0008-cma=
ke-allow-setting-LIBC_PATH-from-external-config.patch
>
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0006-cmake-add-=
recipe-sysroot-include-path-for-system-headers.patch b/meta-oe/recipes-exte=
nded/fluentbit/fluentbit/0006-cmake-add-recipe-sysroot-include-path-for-sys=
tem-headers.patch
> new file mode 100644
> index 0000000000..2b73f48334
> --- /dev/null
> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0006-cmake-add-recipe-=
sysroot-include-path-for-system-headers.patch
> @@ -0,0 +1,31 @@
> +From 9f47cc69683a842efdf6c31ea25b7b423ba3fc7e Mon Sep 17 00:00:00 2001
> +From: Timotheus Giuliani <timotheus.giuliani@philips.com>
> +Date: Tue, 7 Oct 2025 17:33:14 +0200
> +Subject: [PATCH 1/3] cmake: add recipe sysroot include path for system h=
eaders
> +
> +The CMakeLists.txt was missing the recipe sysroot include path, which
> +prevented the build system from finding required system headers during
> +compilation. This commit adds the recipe sysroot directory to the
> +include path so that headers provided by the sysroot, such as
> +BPF headers and other system dependencies, can be properly located and
> +included during the build process.
> +Without this change, the build would fail to find essential headers
> +when building in compilation environment.
> +
> +Signed-off-by: Timotheus Giuliani <timotheus.giuliani@philips.com>

These patches should have Upstream-Status: tag and it will be good to
also submit them to upstream
fluentbit as well.

> +---
> + plugins/in_ebpf/CMakeLists.txt | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/plugins/in_ebpf/CMakeLists.txt b/plugins/in_ebpf/CMakeLists=
.txt
> +index 476c07774..216b2ffce 100644
> +--- a/plugins/in_ebpf/CMakeLists.txt
> ++++ b/plugins/in_ebpf/CMakeLists.txt
> +@@ -91,6 +91,7 @@ foreach(TRACE_C_FILE ${TRACE_C_FILES})
> +             -I${CMAKE_SOURCE_DIR}/plugins/in_ebpf/traces/includes/exter=
nal
> +             -I${CMAKE_SOURCE_DIR}/plugins/in_ebpf/traces/includes
> +             -I${VMLINUX_PATH}         # Include the correct vmlinux.h b=
ased on architecture
> ++            --sysroot=3D${CMAKE_SYSROOT}  # Add yocto recipe sysroot to=
 find "system headers"
> +             -c ${TRACE_C_FILE}
> +             -o ${TRACE_OBJ_FILE}
> +     DEPENDS ${TRACE_C_FILE} ebpf-generated-directory
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0007-bpf-remove=
-hardcoded-target-architecture-definition.patch b/meta-oe/recipes-extended/=
fluentbit/fluentbit/0007-bpf-remove-hardcoded-target-architecture-definitio=
n.patch
> new file mode 100644
> index 0000000000..f30005e986
> --- /dev/null
> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0007-bpf-remove-hardco=
ded-target-architecture-definition.patch
> @@ -0,0 +1,54 @@
> +From df05870068f0d1fe092650bb1ba0a518fb540550 Mon Sep 17 00:00:00 2001
> +From: Timotheus Giuliani <timotheus.giuliani@philips.com>
> +Date: Tue, 7 Oct 2025 17:34:28 +0200
> +Subject: [PATCH 2/3] bpf: remove hardcoded target architecture definitio=
n
> +
> +The BPF programs was hardcoding the TARGET_ARCH_x86 definition, which
> +prevented successful builds on other architectures such as ARM64.
> +This commit removes the hardcoded architecture definition from the bpf
> +source files, allowing the CMake build system to properly set the
> +target architecture based on the actual build environment.
> +
> +Signed-off-by: Timotheus Giuliani <timotheus.giuliani@philips.com>
> +---
> + plugins/in_ebpf/traces/bind/bpf.c      | 2 --
> + plugins/in_ebpf/traces/malloc/bpf.c.in | 3 ---
> + plugins/in_ebpf/traces/signal/bpf.c    | 2 --
> + 3 files changed, 7 deletions(-)
> +
> +diff --git a/plugins/in_ebpf/traces/bind/bpf.c b/plugins/in_ebpf/traces/=
bind/bpf.c
> +index 1712bf67e..da9d7c3f1 100644
> +--- a/plugins/in_ebpf/traces/bind/bpf.c
> ++++ b/plugins/in_ebpf/traces/bind/bpf.c
> +@@ -2,8 +2,6 @@
> + /* Copyright (c) 2021 Hengqi Chen */
> + /* Copyright (c) 2024 The Inspektor Gadget authors */
> +
> +-#define __TARGET_ARCH_x86
> +-
> + #include <vmlinux.h>
> +
> + #define _LINUX_TYPES_H        // Prevent redefinition of linux/types.h
> +diff --git a/plugins/in_ebpf/traces/malloc/bpf.c.in b/plugins/in_ebpf/tr=
aces/malloc/bpf.c.in
> +index c37d3952a..ace4acdbe 100644
> +--- a/plugins/in_ebpf/traces/malloc/bpf.c.in
> ++++ b/plugins/in_ebpf/traces/malloc/bpf.c.in
> +@@ -1,6 +1,3 @@
> +-#define __TARGET_ARCH_x86
> +-
> +-
> + #include <vmlinux.h>
> +
> + #define _LINUX_TYPES_H        // Prevent redefinition of linux/types.h
> +diff --git a/plugins/in_ebpf/traces/signal/bpf.c b/plugins/in_ebpf/trace=
s/signal/bpf.c
> +index 7d4503c22..3f017b325 100644
> +--- a/plugins/in_ebpf/traces/signal/bpf.c
> ++++ b/plugins/in_ebpf/traces/signal/bpf.c
> +@@ -1,7 +1,5 @@
> + // SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause)
> + /* Copyright (c) 2021~2022 Hengqi Chen */
> +-#define __TARGET_ARCH_x86_64
> +-
> + #include <vmlinux.h>
> +
> + #define _LINUX_TYPES_H        // Prevent redefinition of linux/types.h
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0008-cmake-allo=
w-setting-LIBC_PATH-from-external-config.patch b/meta-oe/recipes-extended/f=
luentbit/fluentbit/0008-cmake-allow-setting-LIBC_PATH-from-external-config.=
patch
> new file mode 100644
> index 0000000000..57f4d899cd
> --- /dev/null
> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0008-cmake-allow-setti=
ng-LIBC_PATH-from-external-config.patch
> @@ -0,0 +1,73 @@
> +From ab01dffe9bf2f1208ec4cea0a1582196cfbc0f87 Mon Sep 17 00:00:00 2001
> +From: Timotheus Giuliani <timotheus.giuliani@philips.com>
> +Date: Wed, 8 Oct 2025 14:24:36 +0200
> +Subject: [PATCH 3/3] cmake: allow setting LIBC_PATH from external
> + configuration
> +
> +The CMakeLists.txt file was automatically detecting the libc library
> +path based on the system distribution. This change allows the LIBC_PATH
> +to be set externally through build configuration, which is useful for
> +compilation environments where the library path is known in advance.
> +The auto-detection logic is kept as a fallback when LIBC_PATH is not
> +provided from external configuration.
> +
> +Signed-off-by: Timotheus Giuliani <timotheus.giuliani@philips.com>
> +---
> + plugins/in_ebpf/CMakeLists.txt | 43 ++++++++++++++++++----------------
> + 1 file changed, 23 insertions(+), 20 deletions(-)
> +
> +diff --git a/plugins/in_ebpf/CMakeLists.txt b/plugins/in_ebpf/CMakeLists=
.txt
> +index 216b2ffce..1c5e55785 100644
> +--- a/plugins/in_ebpf/CMakeLists.txt
> ++++ b/plugins/in_ebpf/CMakeLists.txt
> +@@ -25,27 +25,30 @@ include_directories(
> + add_library(gadget INTERFACE)
> + target_include_directories(gadget INTERFACE ${CMAKE_SOURCE_DIR}/plugins=
/in_ebpf/traces/includes/external/gadget)
> +
> +-set(LIBC_PATH "/lib64/libc.so.6")
> +
> +-find_program(LSB_RELEASE_EXEC lsb_release)
> +-if (LSB_RELEASE_EXEC)
> +-  execute_process(COMMAND ${LSB_RELEASE_EXEC} -i
> +-      OUTPUT_VARIABLE LSB_RELEASE_ID_SHORT
> +-      OUTPUT_STRIP_TRAILING_WHITESPACE
> +-  )
> +-
> +-  message(STATUS "##### lsb_release -i -- ${LSB_RELEASE_ID_SHORT}")
> +-
> +-  if (LSB_RELEASE_ID_SHORT MATCHES "Ubuntu" OR
> +-      LSB_RELEASE_ID_SHORT MATCHES "Debian" OR
> +-      LSB_RELEASE_ID_SHORT MATCHES "LinuxMint")
> +-    # Just added for the future enhancement
> +-    if (CMAKE_SYSTEM_PROCESSOR MATCHES "^(arm64|aarch64)")
> +-      set(LIBC_PATH "/usr/lib/aarch64-linux-gnu/libc.so.6")
> +-    elseif (CMAKE_SIZEOF_VOID_P EQUAL 8)
> +-      set(LIBC_PATH "/usr/lib/x86_64-linux-gnu/libc.so.6")
> +-    elseif (CMAKE_SIZEOF_VOID_P EQUAL 4)
> +-      set(LIBC_PATH "/usr/lib/i386-linux-gnu/libc.so.6")
> ++if(NOT DEFINED LIBC_PATH OR LIBC_PATH STREQUAL "")
> ++  set(LIBC_PATH "/lib64/libc.so.6")
> ++
> ++  find_program(LSB_RELEASE_EXEC lsb_release)
> ++  if (LSB_RELEASE_EXEC)
> ++    execute_process(COMMAND ${LSB_RELEASE_EXEC} -i
> ++        OUTPUT_VARIABLE LSB_RELEASE_ID_SHORT
> ++        OUTPUT_STRIP_TRAILING_WHITESPACE
> ++    )
> ++
> ++    message(STATUS "##### lsb_release -i -- ${LSB_RELEASE_ID_SHORT}")
> ++
> ++    if (LSB_RELEASE_ID_SHORT MATCHES "Ubuntu" OR
> ++        LSB_RELEASE_ID_SHORT MATCHES "Debian" OR
> ++        LSB_RELEASE_ID_SHORT MATCHES "LinuxMint")
> ++      # Just added for the future enhancement
> ++      if (CMAKE_SYSTEM_PROCESSOR MATCHES "^(arm64|aarch64)")
> ++        set(LIBC_PATH "/usr/lib/aarch64-linux-gnu/libc.so.6")
> ++      elseif (CMAKE_SIZEOF_VOID_P EQUAL 8)
> ++        set(LIBC_PATH "/usr/lib/x86_64-linux-gnu/libc.so.6")
> ++      elseif (CMAKE_SIZEOF_VOID_P EQUAL 4)
> ++        set(LIBC_PATH "/usr/lib/i386-linux-gnu/libc.so.6")
> ++      endif()
> +     endif()
> +   endif()
> + endif()
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb b/meta=
-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
> index 4d82abc783..05dcd2cca7 100644
> --- a/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
> @@ -23,6 +23,9 @@ SRC_URI =3D "\
>      file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.pat=
ch \
>      file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.pat=
ch \
>      file://0003-CMakeLists.txt-Revise-init-manager-deduction.patch \
> +    file://0006-cmake-add-recipe-sysroot-include-path-for-system-headers=
.patch \
> +    file://0007-bpf-remove-hardcoded-target-architecture-definition.patc=
h \
> +    file://0008-cmake-allow-setting-LIBC_PATH-from-external-config.patch=
 \
>  "
>  SRC_URI:append:libc-musl =3D "\
>      file://0004-chunkio-Link-with-fts-library-with-musl.patch \
> @@ -112,6 +115,10 @@ PACKAGECONFIG[minimal] =3D "-DFLB_MINIMAL=3DYes,-DFL=
B_MINIMAL=3DNo"
>  PACKAGECONFIG[in-kafka] =3D "-DFLB_KAFKA=3DON -DFLB_IN_KAFKA=3DON,-DFLB_=
KAFKA=3DOFF -DFLB_IN_KAFKA=3DOFF,librdkafka curl"
>  PACKAGECONFIG[out-kafka] =3D "-DFLB_KAFKA=3DON -DFLB_OUT_KAFKA=3DON,-DFL=
B_KAFKA=3DOFF -DFLB_OUT_KAFKA=3DOFF,librdkafka curl"
>
> +# Add ebpf input
> +PACKAGECONFIG[in-ebpf] =3D "-DFLB_IN_EBPF=3DYes,-DFLB_IN_EBPF=3DNo, bpft=
ool-native clang-native libbpf"
> +EXTRA_OECMAKE:append =3D " ${@bb.utils.contains('PACKAGECONFIG', 'in-ebp=
f', '-DLIBC_PATH=3D${libdir}/libc.so.6', '', d)}"
> +
>  SYSTEMD_SERVICE:${PN} =3D "fluent-bit.service"
>
>  inherit cmake systemd pkgconfig
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121292): https://lists.openembedded.org/g/openembedde=
d-devel/message/121292
> Mute This Topic: https://lists.openembedded.org/mt/116115058/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

