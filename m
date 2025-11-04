Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F52CCF9E3
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 16:01:33 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21402.1762272085034012541
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 08:01:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VFU4sn/z;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7866c61a9bbso25851817b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 08:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762272084; x=1762876884; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pam4oLbqCmTRumC1Of/Sxfd7zb9ZbU2HxrQuOUEVvTg=;
        b=VFU4sn/z0aYmFyKgagiYCESF7jetrcaWVH2pAusX6LjgaFkuSxlyDry4NeQFxYKLBV
         j5+CykdZM+Ebe7C+5m3YJwB7IKt/+Dl5NnzOachJS/usQB/F7mM4/qI8erzilNuY2sMU
         e736cwVHzDJCSdtXIS+AoarQws+bQYr1V95KGR558rerwNqui20KY7lupVQBPpgEDmYc
         cFGuatUa3HdGyXtGLt+AW5mSCFqEi4BtMEfVauSWdkV7hNF+P6qoIRY1R73mpYSM+UhY
         vhCr6lGS3cFmKsLkrTgr7c9ARKxxrTcnmz9qJ5eEQrFgWveeQpCkC+/YcNMe0y/B8EFp
         JvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762272084; x=1762876884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pam4oLbqCmTRumC1Of/Sxfd7zb9ZbU2HxrQuOUEVvTg=;
        b=ByZDh5A2bgxG800kyhJ1HPH/Qc1rRybCWolDLPi7cd8SAcgCesw0ut3a778Fnu4a8v
         wBLWodfekfBO5o4O17zvyLgsGF9/weXss5DcIs9uKahR7k4y1b7zXwB/lOPyiYcNYYZ/
         X5k7u7q16ThlhNPfliBffyxCt5LbFw6tTM9r1Vqpz3uVBpF8V6ITGVusDxcFV4jhCbyC
         JJajWKpv3PjoxpJKyqmd5GG11+kMkRwkySWyPxskvN1lfStSBOK9mmYAeaXUA4ETrd3V
         TI7eUM9UQ07UEZt0Ikf5iZGFBYH4rYzKymBaIyG78bOQQjsAImJPZwfvGDCxILV1uBB4
         PCxw==
X-Forwarded-Encrypted: i=1; AJvYcCULSMokhHoTZJw1gNUkgaoyxRdcfogm8XcDL6kKyPEeCPZfHwQ1XF9QmLph9oRvUggzeIujgYudcwCVpYjB7KaDOig=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz85Q/uSbemcuQpt9kY8vgl4b9H0NrpbSeEuWvSjnc+n7llr5cK
	Ls+9laGcYKG//YXALJY7Kc2NhOUUNv7UaKWAF3eaSKGB2JlLqxuO+BHImWbBGXLhH/60PmbgLdM
	JKp2/XBmS0wdMhXPL3TVs39JgljMxhxc=
X-Gm-Gg: ASbGncsemV3ikY+vBQG2sIMu01kY/lh6Zhs9KDvy++rjlCr+W2lBq+XE54fCR4YK2qF
	lcy0QHUJ0nt3H6GU8j5tMLkrcHSfLQUnlVXePSVkd9BVgYZKWE1jh//QvLSPT472ahtkwhoaMWG
	5blTWcv6qNXqc6T3tLICsWGSXk2ld+Hh2HGZlqoR4Hh7FlM4SDKwNKNRyl8DU0Sg3xzQZbC7PjC
	adThoHAIucSUZzq0ftwMl8HdC+ek/cXTcRuoCk4hIh2UHKiZWDRc2xwFKzfAbwdNA94akxQ6Waw
	2CwrsX5c0o5xQkel3c+LqOegQ2beQQrpJj1usrS4n5Api/dxfa96lLABonM6nDZwDwYIauD3igi
	cVw==
X-Google-Smtp-Source: AGHT+IGQK6kJ4coLz1ZI3k6B4ATKiUjEGHVGNHqpn6FYbFhgJJdUAW4Lae8cXQVGaunXkvuVT6OSQGK7qdxsNRAW96w=
X-Received: by 2002:a53:d04a:0:20b0:63f:bca7:fff6 with SMTP id
 956f58d0204a3-63fbca809d6mr4354512d50.36.1762272079323; Tue, 04 Nov 2025
 08:01:19 -0800 (PST)
MIME-Version: 1.0
References: <20251104093017.474084-1-timotheus.giuliani@philips.com>
 <20251104093017.474084-2-timotheus.giuliani@philips.com> <f2bd6712-c346-42b8-b7e3-4dbf11a0a1a7@gmail.com>
In-Reply-To: <f2bd6712-c346-42b8-b7e3-4dbf11a0a1a7@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Nov 2025 08:00:52 -0800
X-Gm-Features: AWmQ_bl0Ul60k-PEhQXyQ-U4Q7xsX0PqXNn3xj0z06pik0wRSzyErmIU2Az79Lo
Message-ID: <CAMKF1spxfALcbokAvArYDRPOcroG_1J22wfwxRTK703SBK3HoA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] fluentbit: add support for in-ebpf plugin
To: skandigraun@gmail.com
Cc: timotheus.giuliani@philips.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 16:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121299

On Tue, Nov 4, 2025 at 3:32=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Please make sure to add Upstream-Status tag to the patches, otherwise
> they will fail a fatal QA check:
> https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#p=
atch-upstream-status
>
>
> On 11/4/25 10:30, Timotheus Giuliani via lists.openembedded.org wrote:
> > Introduce support for the in-ebpf plugin in the Fluent Bit recipe,
> > which was added as an experimental feature in Fluent Bit version 4.0.
> > The new PACKAGECONFIG option enables building the eBPF input plugin
> > when explicitly configured, adding the necessary build dependencies
> > including bpftool-native, clang-native, and libbpf.
> > The recipe also configures the LIBC_PATH for compilation environments
> > to ensure to point to the correct target system's C library when the
> > eBPF plugin is enabled.
> >
> > Signed-off-by: Timotheus Giuliani <timotheus.giuliani@philips.com>
> > ---
> >  ...root-include-path-for-system-headers.patch | 31 ++++++++
> >  ...coded-target-architecture-definition.patch | 54 ++++++++++++++
> >  ...tting-LIBC_PATH-from-external-config.patch | 73 +++++++++++++++++++
> >  .../fluentbit/fluentbit_4.0.1.bb              |  7 ++
> >  4 files changed, 165 insertions(+)
> >  create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0006-c=
make-add-recipe-sysroot-include-path-for-system-headers.patch
> >  create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0007-b=
pf-remove-hardcoded-target-architecture-definition.patch
> >  create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0008-c=
make-allow-setting-LIBC_PATH-from-external-config.patch
> >
> > diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0006-cmake-ad=
d-recipe-sysroot-include-path-for-system-headers.patch b/meta-oe/recipes-ex=
tended/fluentbit/fluentbit/0006-cmake-add-recipe-sysroot-include-path-for-s=
ystem-headers.patch
> > new file mode 100644
> > index 0000000000..2b73f48334
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0006-cmake-add-recip=
e-sysroot-include-path-for-system-headers.patch
> > @@ -0,0 +1,31 @@
> > +From 9f47cc69683a842efdf6c31ea25b7b423ba3fc7e Mon Sep 17 00:00:00 2001
> > +From: Timotheus Giuliani <timotheus.giuliani@philips.com>
> > +Date: Tue, 7 Oct 2025 17:33:14 +0200
> > +Subject: [PATCH 1/3] cmake: add recipe sysroot include path for system=
 headers
> > +
> > +The CMakeLists.txt was missing the recipe sysroot include path, which
> > +prevented the build system from finding required system headers during
> > +compilation. This commit adds the recipe sysroot directory to the
> > +include path so that headers provided by the sysroot, such as
> > +BPF headers and other system dependencies, can be properly located and
> > +included during the build process.
> > +Without this change, the build would fail to find essential headers
> > +when building in compilation environment.
> > +
> > +Signed-off-by: Timotheus Giuliani <timotheus.giuliani@philips.com>
> > +---
> > + plugins/in_ebpf/CMakeLists.txt | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/plugins/in_ebpf/CMakeLists.txt b/plugins/in_ebpf/CMakeLis=
ts.txt
> > +index 476c07774..216b2ffce 100644
> > +--- a/plugins/in_ebpf/CMakeLists.txt
> > ++++ b/plugins/in_ebpf/CMakeLists.txt
> > +@@ -91,6 +91,7 @@ foreach(TRACE_C_FILE ${TRACE_C_FILES})
> > +             -I${CMAKE_SOURCE_DIR}/plugins/in_ebpf/traces/includes/ext=
ernal
> > +             -I${CMAKE_SOURCE_DIR}/plugins/in_ebpf/traces/includes
> > +             -I${VMLINUX_PATH}         # Include the correct vmlinux.h=
 based on architecture
> > ++            --sysroot=3D${CMAKE_SYSROOT}  # Add yocto recipe sysroot =
to find "system headers"
> > +             -c ${TRACE_C_FILE}
> > +             -o ${TRACE_OBJ_FILE}
> > +     DEPENDS ${TRACE_C_FILE} ebpf-generated-directory
> > diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0007-bpf-remo=
ve-hardcoded-target-architecture-definition.patch b/meta-oe/recipes-extende=
d/fluentbit/fluentbit/0007-bpf-remove-hardcoded-target-architecture-definit=
ion.patch
> > new file mode 100644
> > index 0000000000..f30005e986
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0007-bpf-remove-hard=
coded-target-architecture-definition.patch
> > @@ -0,0 +1,54 @@
> > +From df05870068f0d1fe092650bb1ba0a518fb540550 Mon Sep 17 00:00:00 2001
> > +From: Timotheus Giuliani <timotheus.giuliani@philips.com>
> > +Date: Tue, 7 Oct 2025 17:34:28 +0200
> > +Subject: [PATCH 2/3] bpf: remove hardcoded target architecture definit=
ion
> > +
> > +The BPF programs was hardcoding the TARGET_ARCH_x86 definition, which
> > +prevented successful builds on other architectures such as ARM64.
> > +This commit removes the hardcoded architecture definition from the bpf
> > +source files, allowing the CMake build system to properly set the
> > +target architecture based on the actual build environment.
> > +
> > +Signed-off-by: Timotheus Giuliani <timotheus.giuliani@philips.com>
> > +---
> > + plugins/in_ebpf/traces/bind/bpf.c      | 2 --
> > + plugins/in_ebpf/traces/malloc/bpf.c.in | 3 ---
> > + plugins/in_ebpf/traces/signal/bpf.c    | 2 --
> > + 3 files changed, 7 deletions(-)
> > +
> > +diff --git a/plugins/in_ebpf/traces/bind/bpf.c b/plugins/in_ebpf/trace=
s/bind/bpf.c
> > +index 1712bf67e..da9d7c3f1 100644
> > +--- a/plugins/in_ebpf/traces/bind/bpf.c
> > ++++ b/plugins/in_ebpf/traces/bind/bpf.c
> > +@@ -2,8 +2,6 @@
> > + /* Copyright (c) 2021 Hengqi Chen */
> > + /* Copyright (c) 2024 The Inspektor Gadget authors */
> > +
> > +-#define __TARGET_ARCH_x86
> > +-
> > + #include <vmlinux.h>
> > +
> > + #define _LINUX_TYPES_H        // Prevent redefinition of linux/types.=
h
> > +diff --git a/plugins/in_ebpf/traces/malloc/bpf.c.in b/plugins/in_ebpf/=
traces/malloc/bpf.c.in
> > +index c37d3952a..ace4acdbe 100644
> > +--- a/plugins/in_ebpf/traces/malloc/bpf.c.in
> > ++++ b/plugins/in_ebpf/traces/malloc/bpf.c.in
> > +@@ -1,6 +1,3 @@
> > +-#define __TARGET_ARCH_x86
> > +-
> > +-
> > + #include <vmlinux.h>
> > +
> > + #define _LINUX_TYPES_H        // Prevent redefinition of linux/types.=
h
> > +diff --git a/plugins/in_ebpf/traces/signal/bpf.c b/plugins/in_ebpf/tra=
ces/signal/bpf.c
> > +index 7d4503c22..3f017b325 100644
> > +--- a/plugins/in_ebpf/traces/signal/bpf.c
> > ++++ b/plugins/in_ebpf/traces/signal/bpf.c
> > +@@ -1,7 +1,5 @@
> > + // SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause)
> > + /* Copyright (c) 2021~2022 Hengqi Chen */
> > +-#define __TARGET_ARCH_x86_64
> > +-
> > + #include <vmlinux.h>
> > +
> > + #define _LINUX_TYPES_H        // Prevent redefinition of linux/types.=
h
> > diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0008-cmake-al=
low-setting-LIBC_PATH-from-external-config.patch b/meta-oe/recipes-extended=
/fluentbit/fluentbit/0008-cmake-allow-setting-LIBC_PATH-from-external-confi=
g.patch
> > new file mode 100644
> > index 0000000000..57f4d899cd
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0008-cmake-allow-set=
ting-LIBC_PATH-from-external-config.patch
> > @@ -0,0 +1,73 @@
> > +From ab01dffe9bf2f1208ec4cea0a1582196cfbc0f87 Mon Sep 17 00:00:00 2001
> > +From: Timotheus Giuliani <timotheus.giuliani@philips.com>
> > +Date: Wed, 8 Oct 2025 14:24:36 +0200
> > +Subject: [PATCH 3/3] cmake: allow setting LIBC_PATH from external
> > + configuration
> > +
> > +The CMakeLists.txt file was automatically detecting the libc library
> > +path based on the system distribution. This change allows the LIBC_PAT=
H
> > +to be set externally through build configuration, which is useful for
> > +compilation environments where the library path is known in advance.
> > +The auto-detection logic is kept as a fallback when LIBC_PATH is not
> > +provided from external configuration.
> > +
> > +Signed-off-by: Timotheus Giuliani <timotheus.giuliani@philips.com>
> > +---
> > + plugins/in_ebpf/CMakeLists.txt | 43 ++++++++++++++++++---------------=
-
> > + 1 file changed, 23 insertions(+), 20 deletions(-)
> > +
> > +diff --git a/plugins/in_ebpf/CMakeLists.txt b/plugins/in_ebpf/CMakeLis=
ts.txt
> > +index 216b2ffce..1c5e55785 100644
> > +--- a/plugins/in_ebpf/CMakeLists.txt
> > ++++ b/plugins/in_ebpf/CMakeLists.txt
> > +@@ -25,27 +25,30 @@ include_directories(
> > + add_library(gadget INTERFACE)
> > + target_include_directories(gadget INTERFACE ${CMAKE_SOURCE_DIR}/plugi=
ns/in_ebpf/traces/includes/external/gadget)
> > +
> > +-set(LIBC_PATH "/lib64/libc.so.6")
> > +
> > +-find_program(LSB_RELEASE_EXEC lsb_release)
> > +-if (LSB_RELEASE_EXEC)
> > +-  execute_process(COMMAND ${LSB_RELEASE_EXEC} -i
> > +-      OUTPUT_VARIABLE LSB_RELEASE_ID_SHORT
> > +-      OUTPUT_STRIP_TRAILING_WHITESPACE
> > +-  )
> > +-
> > +-  message(STATUS "##### lsb_release -i -- ${LSB_RELEASE_ID_SHORT}")
> > +-
> > +-  if (LSB_RELEASE_ID_SHORT MATCHES "Ubuntu" OR
> > +-      LSB_RELEASE_ID_SHORT MATCHES "Debian" OR
> > +-      LSB_RELEASE_ID_SHORT MATCHES "LinuxMint")
> > +-    # Just added for the future enhancement
> > +-    if (CMAKE_SYSTEM_PROCESSOR MATCHES "^(arm64|aarch64)")
> > +-      set(LIBC_PATH "/usr/lib/aarch64-linux-gnu/libc.so.6")
> > +-    elseif (CMAKE_SIZEOF_VOID_P EQUAL 8)
> > +-      set(LIBC_PATH "/usr/lib/x86_64-linux-gnu/libc.so.6")
> > +-    elseif (CMAKE_SIZEOF_VOID_P EQUAL 4)
> > +-      set(LIBC_PATH "/usr/lib/i386-linux-gnu/libc.so.6")
> > ++if(NOT DEFINED LIBC_PATH OR LIBC_PATH STREQUAL "")
> > ++  set(LIBC_PATH "/lib64/libc.so.6")
> > ++
> > ++  find_program(LSB_RELEASE_EXEC lsb_release)
> > ++  if (LSB_RELEASE_EXEC)
> > ++    execute_process(COMMAND ${LSB_RELEASE_EXEC} -i
> > ++        OUTPUT_VARIABLE LSB_RELEASE_ID_SHORT
> > ++        OUTPUT_STRIP_TRAILING_WHITESPACE
> > ++    )
> > ++
> > ++    message(STATUS "##### lsb_release -i -- ${LSB_RELEASE_ID_SHORT}")
> > ++
> > ++    if (LSB_RELEASE_ID_SHORT MATCHES "Ubuntu" OR
> > ++        LSB_RELEASE_ID_SHORT MATCHES "Debian" OR
> > ++        LSB_RELEASE_ID_SHORT MATCHES "LinuxMint")
> > ++      # Just added for the future enhancement
> > ++      if (CMAKE_SYSTEM_PROCESSOR MATCHES "^(arm64|aarch64)")
> > ++        set(LIBC_PATH "/usr/lib/aarch64-linux-gnu/libc.so.6")
> > ++      elseif (CMAKE_SIZEOF_VOID_P EQUAL 8)
> > ++        set(LIBC_PATH "/usr/lib/x86_64-linux-gnu/libc.so.6")
> > ++      elseif (CMAKE_SIZEOF_VOID_P EQUAL 4)
> > ++        set(LIBC_PATH "/usr/lib/i386-linux-gnu/libc.so.6")
> > ++      endif()
> > +     endif()
> > +   endif()
> > + endif()
> > diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb b/me=
ta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
> > index 4d82abc783..05dcd2cca7 100644
> > --- a/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
> > +++ b/meta-oe/recipes-extended/fluentbit/fluentbit_4.0.1.bb
> > @@ -23,6 +23,9 @@ SRC_URI =3D "\
> >      file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.p=
atch \
> >      file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.p=
atch \
> >      file://0003-CMakeLists.txt-Revise-init-manager-deduction.patch \
> > +    file://0006-cmake-add-recipe-sysroot-include-path-for-system-heade=
rs.patch \
> > +    file://0007-bpf-remove-hardcoded-target-architecture-definition.pa=
tch \
> > +    file://0008-cmake-allow-setting-LIBC_PATH-from-external-config.pat=
ch \
> >  "
> >  SRC_URI:append:libc-musl =3D "\
> >      file://0004-chunkio-Link-with-fts-library-with-musl.patch \
> > @@ -112,6 +115,10 @@ PACKAGECONFIG[minimal] =3D "-DFLB_MINIMAL=3DYes,-D=
FLB_MINIMAL=3DNo"
> >  PACKAGECONFIG[in-kafka] =3D "-DFLB_KAFKA=3DON -DFLB_IN_KAFKA=3DON,-DFL=
B_KAFKA=3DOFF -DFLB_IN_KAFKA=3DOFF,librdkafka curl"
> >  PACKAGECONFIG[out-kafka] =3D "-DFLB_KAFKA=3DON -DFLB_OUT_KAFKA=3DON,-D=
FLB_KAFKA=3DOFF -DFLB_OUT_KAFKA=3DOFF,librdkafka curl"
> >
> > +# Add ebpf input
> > +PACKAGECONFIG[in-ebpf] =3D "-DFLB_IN_EBPF=3DYes,-DFLB_IN_EBPF=3DNo, bp=
ftool-native clang-native libbpf"
> > +EXTRA_OECMAKE:append =3D " ${@bb.utils.contains('PACKAGECONFIG', 'in-e=
bpf', '-DLIBC_PATH=3D${libdir}/libc.so.6', '', d)}"

libc.so.6 is glibc, what happens on musl ? maybe it should depend on
gcompat package but it will need some testing.
secondly, can it use +=3D instead of append?

> > +
> >  SYSTEMD_SERVICE:${PN} =3D "fluent-bit.service"
> >
> >  inherit cmake systemd pkgconfig
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121296): https://lists.openembedded.org/g/openembedde=
d-devel/message/121296
> Mute This Topic: https://lists.openembedded.org/mt/116115058/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

