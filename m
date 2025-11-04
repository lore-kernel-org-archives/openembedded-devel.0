Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC91CCFA04
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 11:32:02 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15553.1762255917315558116
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 03:31:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WMXIDIDa;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-429cf861327so260433f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 03:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762255916; x=1762860716; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cbiKzyhsTXX6rbx+UpTER6KivZ+txz4j2KgVfr/XbtU=;
        b=WMXIDIDapRowNV7qe9dfdV/wgwsAUH2aIv6FokvjxLeBNcTlBL5ld+41h1h0lNvaBd
         i8BJ38G6ax2rkkA1erDWsDZ9ZQG0f7hQu7FX7NhycEOI1lCanqzWZx5xwmNPH+IApaQu
         tajsEf+ZZxIHnAGfj/jEyTFhz3duirzElEZ86kZG1fO2H6AIzDiBKX0Xe7QlWD4AP2ke
         v4D83plB0JbWskIzWpzCV78IIWajBag403LoF7U+mc/gzOue4CkUVQtJB0agQDuO/aQS
         0rPiG60hETkF73xXUnsqqaHgf7/nsI0gqh3xJW3uDpiNsjVj54iw6OTq5tmeDzOxisf1
         DApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762255916; x=1762860716;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cbiKzyhsTXX6rbx+UpTER6KivZ+txz4j2KgVfr/XbtU=;
        b=pbyjAZ8DZOzVLGnquXaDRbaTMq5tfJBTnHtVYQRGzTYiYhmLOnH3QPiEYOqXLhcaC4
         3u0c4OMCsCQh3mEBj1V2++zGIkasr2WK6E5v78v/Vpwfnr4tVCPhSCXHl8+quw744rLp
         jMnFatcpuLeDc8WX2KbuSWM8exM9/Ndq+XF6YjSKEWiceY6jT7Jgbj/+0W8dlER8K0Mz
         0rSbeFg3amXoP8NyomZGIbu6Ny9Bk0wEQpMT6EeGta2hyT3So8kltpziPA/j83zsz4dD
         fFoC/vlo2ZnbZwce5TARxd+pDaawYNMhPgd//ODcabKrAkn+rnUTS88qvt9py5zO9Dt5
         QR2A==
X-Forwarded-Encrypted: i=1; AJvYcCXdXWLuPBeHYjZ4fRjm5FGtmgW5WBrZrQQg+0+8F+CJNctEbmIMbQLjEZWhMefpyHmoPbRYrSNDj2uWUNlh0kUPWJI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwCupLsBLsEtrJmZaYqcuUIGrEDHXrQc+THwPaXeM2p43EZL3v6
	8dZddHI2h0CEOVrsRMB+wsXMq77b0GuP0YYCbxvyZcczyyngOO8LuVldHLxG0dTU
X-Gm-Gg: ASbGnct2EG7XMinlnJWkPkvZq88GVIEjQwdOvOUAmaSxTjTJKfGhD4sIZl3KfZmMC4s
	eQV0X1x9j8Qwo14avjYCADVZz1Ct+nVJ2jgP5nMDpn1LEu1Wx0r4gCePb0emhaJ0hJXeYU2z7C3
	GE+K2up97+3kFGchVaf1q9Qzq4u6fuz9Vj+YZ5iCxDxQx3D9t230qnDtEouRKg9ASb+ABmNJaju
	uDlXqmIVN2GxJ5r/DqgfQBD748WxADMtG8yshrxdITXnHM4n6ds81S1BnJZK+8EcBMhqIvP6orl
	2Qm37iWFctmX6TjooSyqKeTsnjDo7BgK2km2Oe8fKnLuKbyXbfwEtS13tJtf0kJQtzFEKOpYLSU
	eWDjerYGo2dFC8cg7UbHozYv0N42epnRXMqHlWBJw8rjN1+2h+21WJlmViixo17qOihok8ZeDTM
	u/1woCVWwP
X-Google-Smtp-Source: AGHT+IFDXRxQu6uoiqP3n875zTSKbOkUjhBOvBlPeqNqA0ciCLtGiZxhkJTFS6enKMlCIUgxLTCLYw==
X-Received: by 2002:a05:6000:491b:b0:429:d48c:eed with SMTP id ffacd0b85a97d-429d48c1058mr5719249f8f.24.1762255915508;
        Tue, 04 Nov 2025 03:31:55 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc19258bsm4316741f8f.12.2025.11.04.03.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 03:31:55 -0800 (PST)
Message-ID: <f2bd6712-c346-42b8-b7e3-4dbf11a0a1a7@gmail.com>
Date: Tue, 4 Nov 2025 12:31:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/2] fluentbit: add support for in-ebpf
 plugin
To: timotheus.giuliani@philips.com, openembedded-devel@lists.openembedded.org
References: <20251104093017.474084-1-timotheus.giuliani@philips.com>
 <20251104093017.474084-2-timotheus.giuliani@philips.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251104093017.474084-2-timotheus.giuliani@philips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 11:32:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121296

Please make sure to add Upstream-Status tag to the patches, otherwise
they will fail a fatal QA check:
https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status


On 11/4/25 10:30, Timotheus Giuliani via lists.openembedded.org wrote:
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
>  create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0006-cmake-add-recipe-sysroot-include-path-for-system-headers.patch
>  create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0007-bpf-remove-hardcoded-target-architecture-definition.patch
>  create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0008-cmake-allow-setting-LIBC_PATH-from-external-config.patch
>
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0006-cmake-add-recipe-sysroot-include-path-for-system-headers.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0006-cmake-add-recipe-sysroot-include-path-for-system-headers.patch
> new file mode 100644
> index 0000000000..2b73f48334
> --- /dev/null
> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0006-cmake-add-recipe-sysroot-include-path-for-system-headers.patch
> @@ -0,0 +1,31 @@
> +From 9f47cc69683a842efdf6c31ea25b7b423ba3fc7e Mon Sep 17 00:00:00 2001
> +From: Timotheus Giuliani <timotheus.giuliani@philips.com>
> +Date: Tue, 7 Oct 2025 17:33:14 +0200
> +Subject: [PATCH 1/3] cmake: add recipe sysroot include path for system headers
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
> +---
> + plugins/in_ebpf/CMakeLists.txt | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/plugins/in_ebpf/CMakeLists.txt b/plugins/in_ebpf/CMakeLists.txt
> +index 476c07774..216b2ffce 100644
> +--- a/plugins/in_ebpf/CMakeLists.txt
> ++++ b/plugins/in_ebpf/CMakeLists.txt
> +@@ -91,6 +91,7 @@ foreach(TRACE_C_FILE ${TRACE_C_FILES})
> +             -I${CMAKE_SOURCE_DIR}/plugins/in_ebpf/traces/includes/external
> +             -I${CMAKE_SOURCE_DIR}/plugins/in_ebpf/traces/includes
> +             -I${VMLINUX_PATH}         # Include the correct vmlinux.h based on architecture
> ++            --sysroot=${CMAKE_SYSROOT}  # Add yocto recipe sysroot to find "system headers"
> +             -c ${TRACE_C_FILE}
> +             -o ${TRACE_OBJ_FILE}
> +     DEPENDS ${TRACE_C_FILE} ebpf-generated-directory
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0007-bpf-remove-hardcoded-target-architecture-definition.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0007-bpf-remove-hardcoded-target-architecture-definition.patch
> new file mode 100644
> index 0000000000..f30005e986
> --- /dev/null
> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0007-bpf-remove-hardcoded-target-architecture-definition.patch
> @@ -0,0 +1,54 @@
> +From df05870068f0d1fe092650bb1ba0a518fb540550 Mon Sep 17 00:00:00 2001
> +From: Timotheus Giuliani <timotheus.giuliani@philips.com>
> +Date: Tue, 7 Oct 2025 17:34:28 +0200
> +Subject: [PATCH 2/3] bpf: remove hardcoded target architecture definition
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
> +diff --git a/plugins/in_ebpf/traces/bind/bpf.c b/plugins/in_ebpf/traces/bind/bpf.c
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
> +diff --git a/plugins/in_ebpf/traces/malloc/bpf.c.in b/plugins/in_ebpf/traces/malloc/bpf.c.in
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
> +diff --git a/plugins/in_ebpf/traces/signal/bpf.c b/plugins/in_ebpf/traces/signal/bpf.c
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
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0008-cmake-allow-setting-LIBC_PATH-from-external-config.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0008-cmake-allow-setting-LIBC_PATH-from-external-config.patch
> new file mode 100644
> index 0000000000..57f4d899cd
> --- /dev/null
> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0008-cmake-allow-setting-LIBC_PATH-from-external-config.patch
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
> +diff --git a/plugins/in_ebpf/CMakeLists.txt b/plugins/in_ebpf/CMakeLists.txt
> +index 216b2ffce..1c5e55785 100644
> +--- a/plugins/in_ebpf/CMakeLists.txt
> ++++ b/plugins/in_ebpf/CMakeLists.txt
> +@@ -25,27 +25,30 @@ include_directories(
> + add_library(gadget INTERFACE)
> + target_include_directories(gadget INTERFACE ${CMAKE_SOURCE_DIR}/plugins/in_ebpf/traces/includes/external/gadget)
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
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
> index 4d82abc783..05dcd2cca7 100644
> --- a/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
> @@ -23,6 +23,9 @@ SRC_URI = "\
>      file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch \
>      file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch \
>      file://0003-CMakeLists.txt-Revise-init-manager-deduction.patch \
> +    file://0006-cmake-add-recipe-sysroot-include-path-for-system-headers.patch \
> +    file://0007-bpf-remove-hardcoded-target-architecture-definition.patch \
> +    file://0008-cmake-allow-setting-LIBC_PATH-from-external-config.patch \
>  "
>  SRC_URI:append:libc-musl = "\
>      file://0004-chunkio-Link-with-fts-library-with-musl.patch \
> @@ -112,6 +115,10 @@ PACKAGECONFIG[minimal] = "-DFLB_MINIMAL=Yes,-DFLB_MINIMAL=No"
>  PACKAGECONFIG[in-kafka] = "-DFLB_KAFKA=ON -DFLB_IN_KAFKA=ON,-DFLB_KAFKA=OFF -DFLB_IN_KAFKA=OFF,librdkafka curl"
>  PACKAGECONFIG[out-kafka] = "-DFLB_KAFKA=ON -DFLB_OUT_KAFKA=ON,-DFLB_KAFKA=OFF -DFLB_OUT_KAFKA=OFF,librdkafka curl"
>  
> +# Add ebpf input
> +PACKAGECONFIG[in-ebpf] = "-DFLB_IN_EBPF=Yes,-DFLB_IN_EBPF=No, bpftool-native clang-native libbpf"
> +EXTRA_OECMAKE:append = " ${@bb.utils.contains('PACKAGECONFIG', 'in-ebpf', '-DLIBC_PATH=${libdir}/libc.so.6', '', d)}"
> +
>  SYSTEMD_SERVICE:${PN} = "fluent-bit.service"
>  
>  inherit cmake systemd pkgconfig
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121292): https://lists.openembedded.org/g/openembedded-devel/message/121292
> Mute This Topic: https://lists.openembedded.org/mt/116115058/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


