Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16037103E19D
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 21:33:43 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25686.1773869620324820087
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 14:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WJXCBHXD;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64acd19e1dfso377929d50.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 14:33:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773869619; cv=none;
        d=google.com; s=arc-20240605;
        b=G5/TELP5bi7DNpyrOT3cbwqlkeQRb8MSo4OK1KlDeFCp1Ii32UbFxNDQItJY/0Q52w
         1bFAXL/+pjrryUnBC71zQlQFEer2yxliR61cb4o+7aJEGFGC15OUWn+zc6z1hIaOFzIq
         saaM1IYMFPZzV9SWjA4kfi5aeURZlIpJuQ797gTQNKSi5pwvpsOFUAntTRDuPyfNRzmp
         Wzucyis09/uKCbCdBuX7cV7hTyTzuyY43HmNbKhrmB9Fl0W/q7hztHgGTtB3hWQqcA5L
         /y9+ejbNRN/gBOBZwZKtFIux/Ea8zgN7hnKQOgKycFgkoEDrGfcA/K5kQ4xhNT73u/Ff
         oPzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/Yf+Bl8oZd9VHII3eLDa0fR4kFt4woKRGwLWuGCfGIY=;
        fh=XcM6YKs5XohCyQUPXjnlFet9+nD6e72ufuzytl2wGp8=;
        b=VNxuk/ej7Y+fvApcRaGX12vooNxn6Ww0qXY+tfPEHPMfec5xPZwwA+HMTRmFHx6RzW
         +uQx96UD8voi8SwUZIv1F9ujqL/c61oSE0V7Hp0+/CCEDWJAoCA2KPfxlwnexgD89+G7
         LBS+sSpGHOhiaYzEKlYS4otKRLjY/5AgA5uaP4YjtidCBLdid8to0RVeyLTFPiM7byVN
         2NS6QzJuBSm+ygafhVA7AbemC6y/cLUN+JSijRmszv/bgToK5qmjnpOfvofFKCXWFCL0
         wzmR0nGZl80WGDYUQ8/zTBfTJqvLpSvocpkN0G4mfBFx6EtmyRg7ecS/oMAwN4ncFT4U
         cDQQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773869619; x=1774474419; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/Yf+Bl8oZd9VHII3eLDa0fR4kFt4woKRGwLWuGCfGIY=;
        b=WJXCBHXDihxyCEiSrSbGXx50ATytQY/Ib8pORflIk85NA1N9W/kkK8MENTJkIWFlKL
         H2U6nkI23Qg88WBOHtySPyjFaUKaiNZRJRqsc/7T2BgynexV0EpSdJvwS1C/hiccH1eE
         PnnxD/FYk/SI4Q5psPC5iC89QWv09V6q0G5rxdTBj7UNqk+3eBB2M5v7R8S65cNqvU5v
         /twJb2rTUAIRmB9dBJY7F6p34AKmqcFSPtvjML/O7LQth+8U8aPaq+iqq4JKNbCng9Lz
         lZa0k9XAKigG34czSha/BJh52jxzIffe2xpjoepgavRn4VtnKP8wi+Xn4n2f3onkaiWn
         D02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773869619; x=1774474419;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Yf+Bl8oZd9VHII3eLDa0fR4kFt4woKRGwLWuGCfGIY=;
        b=SHsDm/dDGz5tAmXE40XBLozdns1kjjIAZEn55QclfEA9c0v5NQUmBIs8ji4Y1VJmsL
         SSAtLcUHaoM/HpGx8QY8g332gFMDAgUqIHNqrrdAZPMjagtU/qsaKMtUKMGsfEPtLcsD
         rhH5Fy+LD95HTrbDuOkIY9sgxZM4OXesfETTUqORS6hBbRM4d4jWR7/Vlmn+84mz7Noe
         HrNgrQlYRBeVXuNzWFp+PF1JhH6ymGgWAzyfjC/FsvTx1UMNtfgSxsq4wzfF5qqVntT8
         02Wt2gK0RNfmN/HlR81D+i10IbdB1KEcuGQSVNboJBhrZMZjS9kCkohsk2mbIcZw34Av
         thzg==
X-Gm-Message-State: AOJu0YxJyvWZc5pdNggZXLOkKk6IFr7O5zS9tTNvif+xvrnRVqeayLgA
	Zh6KuKM2pVRa6gusMctnvvJHPUxkJQlVkhTs2eI9Nh+l76pmObOWPmqxq0uiX4Wd8LfAUzdXRxQ
	+11WvIZXDtQ1PvRo3hmBGLeesETV3MdJx4V8T
X-Gm-Gg: ATEYQzy/kdmQyHGxmU7Z5nphkF5E2Z4nHB3FMpMqRsjFHv2hXQYu4CKOnMKnUCY9hCx
	lXLww1mnunYbbLtBa9XC3iRev3TSw8QO0Cb+5hjXheIPxlpTiFI5A9C8h1R3CEprIulABQVZdFH
	f4trFVCZMZWkesvk/2x/hFa9o8R8B8BdoXFdD+7UqUhfM+Bi23uxBGVfaLDByvvWV1vXMjTBoHW
	fbWiSDbO3OrqapUSBH+jsjZRdNruvx7a7rlpTI8PmBe77MRSfDmji78BTCM7Xxai/H4pfVGBKU6
	gtSGBskbWBGBHjdBusRbThCpqDC06/BI99fOvxiSr1SxKztrE8PheaKZmKgZYY052hUDSw0GSut
	TwGKxzlleCQaAbYPGrkrAzeBA
X-Received: by 2002:a53:c7cb:0:b0:649:e294:a380 with SMTP id
 956f58d0204a3-64e915ced27mr4422248d50.37.1773869618377; Wed, 18 Mar 2026
 14:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260313032649.4383-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20260313032649.4383-1-liuyd.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Mar 2026 14:33:09 -0700
X-Gm-Features: AaiRm50r2BSJRdIEXXfkioQiyzDHmC8G9GGStLr2hB5ler6ImXsiJuuN4YSTjnI
Message-ID: <CAMKF1spaPcV+r8EMNrwiJCWhB9-YbG2c6=Vdsztw2vR9-oLLTw@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] sysdig: upgrade 0.28.0 -> 0.39.0
To: liuyd.fnst@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007b3970064d5334f7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 21:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125367

--0000000000007b3970064d5334f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is failing to build on AB see

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5867932/raw_inlin=
e

On Thu, Mar 12, 2026 at 8:26=E2=80=AFPM Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=3Dfujitsu.com@lists.openembedded.org>
wrote:

> Upgrade sysdig to solve build failure after upgrading valijson to 1.1.0.
>
> 1.Changelog
>   https://github.com/draios/sysdig/releases/tag/0.39.0
>
> 2.Update 0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch for 0.39.0
>
> 3.Remove following patches as merged upstream
>   0001-Add-cstdint-for-uintXX_t-types.patch
>   0001-libsinsp-fix-build-with-gcc-15.patch
>
> 4.Add 0001-Avoid-duplicate-operations-of-add_library.patch to fix
> do_configure errors
>   -- Existing strlcat found, will *not* use local definition
>   CMake Error at falcosecurity-libs/userspace/libscap/CMakeLists.txt:64
> (add_library):
>     add_library cannot create target "scap_error" because another target
> with
>     the same name already exists.  The existing target is a static librar=
y
>
> 5.Add CMAKE option -DBUILD_SYSDIG_MODERN_BPF=3DOFF to fix bpf header file
> not found issue
>   sysdig/0.39.0/recipe-sysroot/usr/include/bits/syscall.h:23:10: fatal
> error: 'bits/syscall-32.h' file not found
>   |    23 | #include <bits/syscall-32.h>
>
> 6.Add do_configure:prepend() function and CFLAGS/CXXFLAGS to fix header
> file not found issue
>
> sysdig/0.39.0/sources/sysdig-0.39.0/falcosecurity-libs/userspace/libscap/=
engine/kmod/scap_kmod.c:30:10:
> fatal error: driver_config.h: No such file or directory
>   |    30 | #include <driver_config.h>
>
> 7.Add do_compile:append() function to fix do_package QA Issue
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  .../0001-Add-cstdint-for-uintXX_t-types.patch | 38 ---------------
>  ...-duplicate-operations-of-add_library.patch | 47 +++++++++++++++++++
>  ...001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch | 21 +++++----
>  .../0001-libsinsp-fix-build-with-gcc-15.patch | 31 ------------
>  .../{sysdig_0.28.0.bb =3D> sysdig_0.39.0.bb}    | 43 ++++++++++++++---
>  5 files changed, 95 insertions(+), 85 deletions(-)
>  delete mode 100644
> meta-oe/recipes-extended/sysdig/sysdig/0001-Add-cstdint-for-uintXX_t-type=
s.patch
>  create mode 100644
> meta-oe/recipes-extended/sysdig/sysdig/0001-Avoid-duplicate-operations-of=
-add_library.patch
>  delete mode 100644
> meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-fix-build-with-gcc-1=
5.patch
>  rename meta-oe/recipes-extended/sysdig/{sysdig_0.28.0.bb =3D>
> sysdig_0.39.0.bb} (56%)
>
> diff --git
> a/meta-oe/recipes-extended/sysdig/sysdig/0001-Add-cstdint-for-uintXX_t-ty=
pes.patch
> b/meta-oe/recipes-extended/sysdig/sysdig/0001-Add-cstdint-for-uintXX_t-ty=
pes.patch
> deleted file mode 100644
> index e564958dad..0000000000
> ---
> a/meta-oe/recipes-extended/sysdig/sysdig/0001-Add-cstdint-for-uintXX_t-ty=
pes.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 3d076ea588eb3c7f334133b4c31172a14beadf5b Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 2 Feb 2023 20:18:27 -0800
> -Subject: [PATCH] Add <cstdint> for uintXX_t types
> -
> -gcc 13 moved some includes around and as a result <cstdint> is no
> -longer transitively included [1]. Explicitly include it
> -for uintXX_t.
> -
> -[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
> -
> -Upstream-Status: Submitted [
> https://github.com/falcosecurity/libs/pull/862]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - userspace/libsinsp/filter/parser.h | 1 +
> - userspace/libsinsp/filter_value.h  | 1 +
> - 2 files changed, 2 insertions(+)
> -
> ---- a/userspace/libsinsp/filter/parser.h
> -+++ b/userspace/libsinsp/filter/parser.h
> -@@ -18,6 +18,7 @@ limitations under the License.
> - #pragma once
> -
> - #include "ast.h"
> -+#include <cstdint>
> -
> - //
> - // Context-free Grammar for Sinsp Filters
> ---- a/userspace/libsinsp/filter_value.h
> -+++ b/userspace/libsinsp/filter_value.h
> -@@ -18,6 +18,7 @@ limitations under the License.
> - #pragma once
> -
> - #include <string.h>
> -+#include <cstdint>
> - #include <utility>
> -
> - // Used for CO_IN/CO_PMATCH filterchecks using PT_CHARBUFs to allow
> diff --git
> a/meta-oe/recipes-extended/sysdig/sysdig/0001-Avoid-duplicate-operations-=
of-add_library.patch
> b/meta-oe/recipes-extended/sysdig/sysdig/0001-Avoid-duplicate-operations-=
of-add_library.patch
> new file mode 100644
> index 0000000000..b8ca7dd38b
> --- /dev/null
> +++
> b/meta-oe/recipes-extended/sysdig/sysdig/0001-Avoid-duplicate-operations-=
of-add_library.patch
> @@ -0,0 +1,47 @@
> +From 74dec208d95821855130f6ed7b167327f1247e99 Mon Sep 17 00:00:00 2001
> +From: Liu Yiding <liuyd.fnst@fujitsu.com>
> +Date: Thu, 5 Mar 2026 09:28:03 +0000
> +Subject: [PATCH] Avoid duplicate operations of add_library.
> +
> +To fix following configure error
> +| -- Existing strlcat found, will *not* use local definition
> +| CMake Error at falcosecurity-libs/userspace/libscap/CMakeLists.txt:64
> (add_library):
> +|   add_library cannot create target "scap_error" because another target
> with
> +|   the same name already exists.  The existing target is a static libra=
ry
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> +---
> + cmake/modules/libscap.cmake  | 2 +-
> + cmake/modules/libsinsp.cmake | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/cmake/modules/libscap.cmake b/cmake/modules/libscap.cmake
> +index b41b12ff3..1753598e9 100644
> +--- a/cmake/modules/libscap.cmake
> ++++ b/cmake/modules/libscap.cmake
> +@@ -14,7 +14,7 @@
> + #
> +
> + if(NOT HAVE_LIBSCAP)
> +-      set(HAVE_LIBSCAP On)
> ++        set(HAVE_LIBSCAP On CACHE INTERNAL "Flag to indicate libscap ha=
s
> been processed")
> +
> +       if(NOT LIBS_DIR)
> +               get_filename_component(LIBS_DIR
> ${CMAKE_CURRENT_LIST_DIR}/../.. ABSOLUTE)
> +diff --git a/cmake/modules/libsinsp.cmake b/cmake/modules/libsinsp.cmake
> +index ff336e27f..0fdd2d4a9 100644
> +--- a/cmake/modules/libsinsp.cmake
> ++++ b/cmake/modules/libsinsp.cmake
> +@@ -14,7 +14,7 @@
> + #
> +
> + if(NOT HAVE_LIBSINSP)
> +-      set(HAVE_LIBSINSP On)
> ++        set(HAVE_LIBSINSP On CACHE INTERNAL "Flag to indicate libsinsp
> has been processed")
> +
> +       if(NOT LIBS_DIR)
> +               get_filename_component(LIBS_DIR
> ${CMAKE_CURRENT_LIST_DIR}/../.. ABSOLUTE)
> +--
> +2.43.0
> +
> diff --git
> a/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pass-PROBE_NAME-via-C=
FLAGS.patch
> b/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pass-PROBE_NAME-via-C=
FLAGS.patch
> index 903ccdf36a..bcf5da4f2c 100644
> ---
> a/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pass-PROBE_NAME-via-C=
FLAGS.patch
> +++
> b/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pass-PROBE_NAME-via-C=
FLAGS.patch
> @@ -1,6 +1,6 @@
> -From ed8969a233adb6bf701de96d0fd0570e5ddcc787 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 21 Mar 2022 19:35:48 -0700
> +From 6ff4114dcbb87f34751064249967aa96c7b8b030 Mon Sep 17 00:00:00 2001
> +From: Liu Yiding <liuyd.fnst@fujitsu.com>
> +Date: Wed, 4 Mar 2026 10:02:10 +0000
>  Subject: [PATCH] cmake: Pass PROBE_NAME via CFLAGS
>
>  This helps compliation of driver code where its calling modprobe on the
> @@ -8,22 +8,25 @@ given kernel module via system() API
>
>  Upstream-Status: Pending
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Update for 0.39.0
> +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
>  ---
>   CMakeLists.txt | 1 +
>   1 file changed, 1 insertion(+)
>
>  diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 7dceb7ae..e156c36f 100644
> +index 8e8850dbe..c6d725c05 100644
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
> -@@ -149,6 +149,7 @@ if(CMAKE_SYSTEM_NAME MATCHES "Linux")
> -       if(NOT DEFINED PROBE_NAME)
> -               set(PROBE_NAME "scap")
> +@@ -174,6 +174,7 @@ if(CMAKE_SYSTEM_NAME MATCHES "Linux")
> +       if(NOT DEFINED DRIVER_NAME)
> +               set(DRIVER_NAME "scap")
>         endif()
> -+      add_definitions(-DPROBE_NAME=3D"${PROBE_NAME}")
> ++       add_definitions(-DPROBE_NAME=3D"${PROBE_NAME}")
>
>         set(DRIVERS_REPO "https://download.sysdig.com/scap-drivers")
>
>  --
> -2.35.1
> +2.43.0
>
> diff --git
> a/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-fix-build-with-gcc=
-15.patch
> b/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-fix-build-with-gcc=
-15.patch
> deleted file mode 100644
> index 9a81f1c74c..0000000000
> ---
> a/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-fix-build-with-gcc=
-15.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 47a86dabd065096ffc8818a1cffca96964d18120 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <martin.jansa@gmail.com>
> -Date: Tue, 22 Apr 2025 18:43:46 +0200
> -Subject: [PATCH] libsinsp: fix build with gcc-15
> -
> -fixes:
> -http://errors.yoctoproject.org/Errors/Details/852848/
> -
> -In file included from
> TOPDIR/tmp/work/core2-64-oe-linux/sysdig/0.28.0/git/falcosecurity-libs/us=
erspace/chisel/lua_parser.cpp:20:
> -TOPDIR/tmp/work/core2-64-oe-linux/sysdig/0.28.0/git/falcosecurity-libs/u=
serspace/libsinsp/./gen_filter.h:87:17:
> error: 'uint64_t' does not name a type
> -   87 |         virtual uint64_t get_ts() const =3D 0;
> -      |                 ^~~~~~~~
> -
> -Upstream-Status: Pending [gen_filter is removed in newer version with
> https://github.com/falcosecurity/libs/commit/47e245f3d343eff27ed178ec2449=
caa3a01faabb
> ]
> -Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ----
> - userspace/libsinsp/gen_filter.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/userspace/libsinsp/gen_filter.h
> b/userspace/libsinsp/gen_filter.h
> -index f4cfa08b1..79ac30dc3 100644
> ---- a/userspace/libsinsp/gen_filter.h
> -+++ b/userspace/libsinsp/gen_filter.h
> -@@ -16,6 +16,7 @@ along with Falco.  If not, see <
> http://www.gnu.org/licenses/>.
> -
> - #pragma once
> -
> -+#include <cstdint>
> - #include <set>
> - #include <list>
> - #include <map>
> diff --git a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
> b/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb
> similarity index 56%
> rename from meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
> rename to meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb
> index c988b0af59..85e687a17b 100644
> --- a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
> +++ b/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb
> @@ -19,21 +19,30 @@ JIT:powerpc64le =3D ""
>  JIT:powerpc64 =3D ""
>
>  DEPENDS +=3D "libb64 lua${JIT} zlib c-ares grpc-native grpc curl ncurses
> jsoncpp \
> -            tbb jq openssl elfutils protobuf protobuf-native jq-native
> valijson"
> +            tbb jq openssl elfutils protobuf protobuf-native jq-native
> valijson \
> +            uthash libbpf clang-native bpftool-native yaml-cpp
> nlohmann-json"
>  RDEPENDS:${PN} =3D "bash"
>
>  SRC_URI =3D "git://
> github.com/draios/sysdig.git;branch=3Ddev;protocol=3Dhttps;name=3Dsysdig =
\
> -           git://
> github.com/falcosecurity/libs;protocol=3Dhttps;branch=3Dmaster;name=3Dfal=
co;subdir=3D${BB_GIT_DEFAULT_DESTSUFFIX}/falcosecurity-libs
> <http://github.com/falcosecurity/libs;protocol=3Dhttps;branch=3Dmaster;na=
me=3Dfalco;subdir=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/falcosecurity-libs>
> \
> +           git://
> github.com/falcosecurity/libs;protocol=3Dhttps;branch=3Drelease/0.18.x;na=
me=3Dfalco;subdir=3D${BB_GIT_DEFAULT_DESTSUFFIX}/falcosecurity-libs
> <http://github.com/falcosecurity/libs;protocol=3Dhttps;branch=3Drelease/0=
.18.x;name=3Dfalco;subdir=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/falcosecurity-=
libs>
> \
> +           git://
> github.com/falcosecurity/libs;protocol=3Dhttps;branch=3Drelease/0.18.x;na=
me=3Ddriver;subdir=3D${BB_GIT_DEFAULT_DESTSUFFIX}/driver
> <http://github.com/falcosecurity/libs;protocol=3Dhttps;branch=3Drelease/0=
.18.x;name=3Ddriver;subdir=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/driver>
> \
>             file://0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch \
> -
>  file://0001-Add-cstdint-for-uintXX_t-types.patch;patchdir=3D./falcosecur=
ity-libs
> \
> -
>  file://0001-libsinsp-fix-build-with-gcc-15.patch;patchdir=3D./falcosecur=
ity-libs
> \
> -
>  file://0001-update-cmake-Only-add-dependencies-when-we-bundle.patch;patc=
hdir=3D./falcosecurity-libs
> \
> +
>  file://0001-Avoid-duplicate-operations-of-add_library.patch;patchdir=3D.=
/falcosecurity-libs
> \
>            "
> -SRCREV_sysdig =3D "4fb6288275f567f63515df0ff0a6518043ecfa9b"
> -SRCREV_falco =3D "caa0e4d0044fdaaebab086592a97f0c7f32aeaa9"
> +SRCREV_sysdig =3D "6ef29110cf1add746e10ab5b38957e22730b7349"
> +SRCREV_falco =3D "e1999d079880d10800c57e004fca794a03cd060a"
> +SRCREV_driver =3D "d4efc80ece48174a71c1a420cb52d233fa94f946"
>
>  SRCREV_FORMAT =3D "sysdig_falco"
>
> +#Add this function to generate driver_config.h
> +do_configure:prepend() {
> +    mkdir -p ${WORKDIR}/driver_Make
> +    cd ${WORKDIR}/driver_Make
> +    cmake ${S}/driver -DMINIMAL_BUILD=3DON
> +    cd -
> +}
> +do_configure[cleandirs] =3D "${WORKDIR}/driver_Make"
>
>  EXTRA_OECMAKE =3D "\
>                  -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 \
> @@ -44,11 +53,31 @@ EXTRA_OECMAKE =3D "\
>                  -DDIR_ETC=3D${sysconfdir} \
>                  -DLUA_INCLUDE_DIR=3D${STAGING_INCDIR}/luajit-2.1 \
>                  -DFALCOSECURITY_LIBS_SOURCE_DIR=3D${S}/falcosecurity-lib=
s \
> +                -DDRIVER_SOURCE_DIR=3D${S}/driver \
>                  -DVALIJSON_INCLUDE=3D${STAGING_INCDIR}/valijson \
> +                -DUSE_BUNDLED_RE2=3DOFF \
> +                -DUSE_BUNDLED_TBB=3DOFF \
> +                -DUSE_BUNDLED_JSONCPP=3DOFF \
> +                -DBUILD_SYSDIG_MODERN_BPF=3DOFF \
> +                -DCREATE_TEST_TARGETS=3DOFF \
>  "
>
> +#Add include dir to find driver_config.h
> +CXXFLAGS:append =3D " -I${WORKDIR}/driver_Make/driver/src"
> +CFLAGS:append =3D " -I${WORKDIR}/driver_Make/driver/src"
> +
> +#To fix do_package QA Issue
> +do_compile:append() {
> +    sed -i -e "s,${WORKDIR},,g" ${B}/libsinsp/libsinsp.pc
> +    sed -i -e "s,${WORKDIR},,g" ${B}/driver/libscap/libscap.pc
> +    mkdir -p ${B}/driver/libsinsp
> +    cp ${B}/libsinsp/libsinsp.pc ${B}/driver/libsinsp/
> +}
> +do_compile[cleandirs] =3D "${B}/driver/libsinsp"
> +
>  #CMAKE_VERBOSE =3D "VERBOSE=3D1"
>
> +
>  FILES:${PN} +=3D " \
>      ${DIR_ETC}/* \
>      ${datadir}/zsh/* \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125180):
> https://lists.openembedded.org/g/openembedded-devel/message/125180
> Mute This Topic: https://lists.openembedded.org/mt/118291998/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007b3970064d5334f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is failing to build on AB see<div><br></div><div><a h=
ref=3D"https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5867932/ra=
w_inline">https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5867932=
/raw_inline</a></div></div><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 12, 2026 at 8:26=E2=
=80=AFPM Yiding Liu (Fujitsu) via <a href=3D"http://lists.openembedded.org"=
>lists.openembedded.org</a> &lt;liuyd.fnst=3D<a href=3D"mailto:fujitsu.com@=
lists.openembedded.org">fujitsu.com@lists.openembedded.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Upgrade sysdig to=
 solve build failure after upgrading valijson to 1.1.0.<br>
<br>
1.Changelog<br>
=C2=A0 <a href=3D"https://github.com/draios/sysdig/releases/tag/0.39.0" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/draios/sysdig/releases=
/tag/0.39.0</a><br>
<br>
2.Update 0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch for 0.39.0<br>
<br>
3.Remove following patches as merged upstream<br>
=C2=A0 0001-Add-cstdint-for-uintXX_t-types.patch<br>
=C2=A0 0001-libsinsp-fix-build-with-gcc-15.patch<br>
<br>
4.Add 0001-Avoid-duplicate-operations-of-add_library.patch to fix do_config=
ure errors<br>
=C2=A0 -- Existing strlcat found, will *not* use local definition<br>
=C2=A0 CMake Error at falcosecurity-libs/userspace/libscap/CMakeLists.txt:6=
4 (add_library):<br>
=C2=A0 =C2=A0 add_library cannot create target &quot;scap_error&quot; becau=
se another target with<br>
=C2=A0 =C2=A0 the same name already exists.=C2=A0 The existing target is a =
static library<br>
<br>
5.Add CMAKE option -DBUILD_SYSDIG_MODERN_BPF=3DOFF to fix bpf header file n=
ot found issue<br>
=C2=A0 sysdig/0.39.0/recipe-sysroot/usr/include/bits/syscall.h:23:10: fatal=
 error: &#39;bits/syscall-32.h&#39; file not found<br>
=C2=A0 |=C2=A0 =C2=A0 23 | #include &lt;bits/syscall-32.h&gt;<br>
<br>
6.Add do_configure:prepend() function and CFLAGS/CXXFLAGS to fix header fil=
e not found issue<br>
=C2=A0 sysdig/0.39.0/sources/sysdig-0.39.0/falcosecurity-libs/userspace/lib=
scap/engine/kmod/scap_kmod.c:30:10: fatal error: driver_config.h: No such f=
ile or directory<br>
=C2=A0 |=C2=A0 =C2=A0 30 | #include &lt;driver_config.h&gt;<br>
<br>
7.Add do_compile:append() function to fix do_package QA Issue<br>
<br>
Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" tar=
get=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../0001-Add-cstdint-for-uintXX_t-types.patch | 38 ---------------<br=
>
=C2=A0...-duplicate-operations-of-add_library.patch | 47 ++++++++++++++++++=
+<br>
=C2=A0...001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch | 21 +++++----<br>
=C2=A0.../0001-libsinsp-fix-build-with-gcc-15.patch | 31 ------------<br>
=C2=A0.../{<a href=3D"http://sysdig_0.28.0.bb" rel=3D"noreferrer" target=3D=
"_blank">sysdig_0.28.0.bb</a> =3D&gt; <a href=3D"http://sysdig_0.39.0.bb" r=
el=3D"noreferrer" target=3D"_blank">sysdig_0.39.0.bb</a>}=C2=A0 =C2=A0 | 43=
 ++++++++++++++---<br>
=C2=A05 files changed, 95 insertions(+), 85 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-Add-cs=
tdint-for-uintXX_t-types.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-Avoid-=
duplicate-operations-of-add_library.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-libsin=
sp-fix-build-with-gcc-15.patch<br>
=C2=A0rename meta-oe/recipes-extended/sysdig/{<a href=3D"http://sysdig_0.28=
.0.bb" rel=3D"noreferrer" target=3D"_blank">sysdig_0.28.0.bb</a> =3D&gt; <a=
 href=3D"http://sysdig_0.39.0.bb" rel=3D"noreferrer" target=3D"_blank">sysd=
ig_0.39.0.bb</a>} (56%)<br>
<br>
diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-Add-cstdint-for-ui=
ntXX_t-types.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-Add-cstdin=
t-for-uintXX_t-types.patch<br>
deleted file mode 100644<br>
index e564958dad..0000000000<br>
--- a/meta-oe/recipes-extended/sysdig/sysdig/0001-Add-cstdint-for-uintXX_t-=
types.patch<br>
+++ /dev/null<br>
@@ -1,38 +0,0 @@<br>
-From 3d076ea588eb3c7f334133b4c31172a14beadf5b Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Thu, 2 Feb 2023 20:18:27 -0800<br>
-Subject: [PATCH] Add &lt;cstdint&gt; for uintXX_t types<br>
-<br>
-gcc 13 moved some includes around and as a result &lt;cstdint&gt; is no<br=
>
-longer transitively included [1]. Explicitly include it<br>
-for uintXX_t.<br>
-<br>
-[1] <a href=3D"https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-chang=
es" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/gcc-13/porting=
_to.html#header-dep-changes</a><br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/falcosecurity/li=
bs/pull/862" rel=3D"noreferrer" target=3D"_blank">https://github.com/falcos=
ecurity/libs/pull/862</a>]<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- userspace/libsinsp/filter/parser.h | 1 +<br>
- userspace/libsinsp/filter_value.h=C2=A0 | 1 +<br>
- 2 files changed, 2 insertions(+)<br>
-<br>
---- a/userspace/libsinsp/filter/parser.h<br>
-+++ b/userspace/libsinsp/filter/parser.h<br>
-@@ -18,6 +18,7 @@ limitations under the License.<br>
- #pragma once<br>
- <br>
- #include &quot;ast.h&quot;<br>
-+#include &lt;cstdint&gt;<br>
- <br>
- //<br>
- // Context-free Grammar for Sinsp Filters<br>
---- a/userspace/libsinsp/filter_value.h<br>
-+++ b/userspace/libsinsp/filter_value.h<br>
-@@ -18,6 +18,7 @@ limitations under the License.<br>
- #pragma once<br>
- <br>
- #include &lt;string.h&gt;<br>
-+#include &lt;cstdint&gt;<br>
- #include &lt;utility&gt;<br>
- <br>
- // Used for CO_IN/CO_PMATCH filterchecks using PT_CHARBUFs to allow<br>
diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-Avoid-duplicate-op=
erations-of-add_library.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001=
-Avoid-duplicate-operations-of-add_library.patch<br>
new file mode 100644<br>
index 0000000000..b8ca7dd38b<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/sysdig/sysdig/0001-Avoid-duplicate-operation=
s-of-add_library.patch<br>
@@ -0,0 +1,47 @@<br>
+From 74dec208d95821855130f6ed7b167327f1247e99 Mon Sep 17 00:00:00 2001<br>
+From: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" target=3D"_=
blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
+Date: Thu, 5 Mar 2026 09:28:03 +0000<br>
+Subject: [PATCH] Avoid duplicate operations of add_library.<br>
+<br>
+To fix following configure error<br>
+| -- Existing strlcat found, will *not* use local definition<br>
+| CMake Error at falcosecurity-libs/userspace/libscap/CMakeLists.txt:64 (a=
dd_library):<br>
+|=C2=A0 =C2=A0add_library cannot create target &quot;scap_error&quot; beca=
use another target with<br>
+|=C2=A0 =C2=A0the same name already exists.=C2=A0 The existing target is a=
 static library<br>
+<br>
+Upstream-Status: Inappropriate [oe-specific]<br>
+Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" ta=
rget=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
+---<br>
+ cmake/modules/libscap.cmake=C2=A0 | 2 +-<br>
+ cmake/modules/libsinsp.cmake | 2 +-<br>
+ 2 files changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/cmake/modules/libscap.cmake b/cmake/modules/libscap.cmake<br>
+index b41b12ff3..1753598e9 100644<br>
+--- a/cmake/modules/libscap.cmake<br>
++++ b/cmake/modules/libscap.cmake<br>
+@@ -14,7 +14,7 @@<br>
+ #<br>
+ <br>
+ if(NOT HAVE_LIBSCAP)<br>
+-=C2=A0 =C2=A0 =C2=A0 set(HAVE_LIBSCAP On)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 set(HAVE_LIBSCAP On CACHE INTERNAL &quot;Flag=
 to indicate libscap has been processed&quot;)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if(NOT LIBS_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_filename_compon=
ent(LIBS_DIR ${CMAKE_CURRENT_LIST_DIR}/../.. ABSOLUTE)<br>
+diff --git a/cmake/modules/libsinsp.cmake b/cmake/modules/libsinsp.cmake<b=
r>
+index ff336e27f..0fdd2d4a9 100644<br>
+--- a/cmake/modules/libsinsp.cmake<br>
++++ b/cmake/modules/libsinsp.cmake<br>
+@@ -14,7 +14,7 @@<br>
+ #<br>
+ <br>
+ if(NOT HAVE_LIBSINSP)<br>
+-=C2=A0 =C2=A0 =C2=A0 set(HAVE_LIBSINSP On)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 set(HAVE_LIBSINSP On CACHE INTERNAL &quot;Fla=
g to indicate libsinsp has been processed&quot;)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if(NOT LIBS_DIR)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_filename_compon=
ent(LIBS_DIR ${CMAKE_CURRENT_LIST_DIR}/../.. ABSOLUTE)<br>
+-- <br>
+2.43.0<br>
+<br>
diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pass-PROBE_N=
AME-via-CFLAGS.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pa=
ss-PROBE_NAME-via-CFLAGS.patch<br>
index 903ccdf36a..bcf5da4f2c 100644<br>
--- a/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pass-PROBE_NAME-via=
-CFLAGS.patch<br>
+++ b/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pass-PROBE_NAME-via=
-CFLAGS.patch<br>
@@ -1,6 +1,6 @@<br>
-From ed8969a233adb6bf701de96d0fd0570e5ddcc787 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Mon, 21 Mar 2022 19:35:48 -0700<br>
+From 6ff4114dcbb87f34751064249967aa96c7b8b030 Mon Sep 17 00:00:00 2001<br>
+From: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" target=3D"_=
blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
+Date: Wed, 4 Mar 2026 10:02:10 +0000<br>
=C2=A0Subject: [PATCH] cmake: Pass PROBE_NAME via CFLAGS<br>
<br>
=C2=A0This helps compliation of driver code where its calling modprobe on t=
he<br>
@@ -8,22 +8,25 @@ given kernel module via system() API<br>
<br>
=C2=A0Upstream-Status: Pending<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+<br>
+Update for 0.39.0<br>
+Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" ta=
rget=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 CMakeLists.txt | 1 +<br>
=C2=A0 1 file changed, 1 insertion(+)<br>
<br>
=C2=A0diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
-index 7dceb7ae..e156c36f 100644<br>
+index 8e8850dbe..c6d725c05 100644<br>
=C2=A0--- a/CMakeLists.txt<br>
=C2=A0+++ b/CMakeLists.txt<br>
-@@ -149,6 +149,7 @@ if(CMAKE_SYSTEM_NAME MATCHES &quot;Linux&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if(NOT DEFINED PROBE_NAME)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set(PROBE_NAME &quo=
t;scap&quot;)<br>
+@@ -174,6 +174,7 @@ if(CMAKE_SYSTEM_NAME MATCHES &quot;Linux&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if(NOT DEFINED DRIVER_NAME)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set(DRIVER_NAME &qu=
ot;scap&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 endif()<br>
-+=C2=A0 =C2=A0 =C2=A0 add_definitions(-DPROBE_NAME=3D&quot;${PROBE_NAME}&q=
uot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0add_definitions(-DPROBE_NAME=3D&quot;${PROBE_N=
AME}&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 set(DRIVERS_REPO &quot;<a href=3D"https://downl=
oad.sysdig.com/scap-drivers" rel=3D"noreferrer" target=3D"_blank">https://d=
ownload.sysdig.com/scap-drivers</a>&quot;)<br>
<br>
=C2=A0-- <br>
-2.35.1<br>
+2.43.0<br>
<br>
diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-fix-build=
-with-gcc-15.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-f=
ix-build-with-gcc-15.patch<br>
deleted file mode 100644<br>
index 9a81f1c74c..0000000000<br>
--- a/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-fix-build-with-g=
cc-15.patch<br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-From 47a86dabd065096ffc8818a1cffca96964d18120 Mon Sep 17 00:00:00 2001<br>
-From: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D=
"_blank">martin.jansa@gmail.com</a>&gt;<br>
-Date: Tue, 22 Apr 2025 18:43:46 +0200<br>
-Subject: [PATCH] libsinsp: fix build with gcc-15<br>
-<br>
-fixes:<br>
-<a href=3D"http://errors.yoctoproject.org/Errors/Details/852848/" rel=3D"n=
oreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Details/=
852848/</a><br>
-<br>
-In file included from TOPDIR/tmp/work/core2-64-oe-linux/sysdig/0.28.0/git/=
falcosecurity-libs/userspace/chisel/lua_parser.cpp:20:<br>
-TOPDIR/tmp/work/core2-64-oe-linux/sysdig/0.28.0/git/falcosecurity-libs/use=
rspace/libsinsp/./gen_filter.h:87:17: error: &#39;uint64_t&#39; does not na=
me a type<br>
-=C2=A0 =C2=A087 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virtual uint64_t get_ts=
() const =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~~~~~~<br>
-<br>
-Upstream-Status: Pending [gen_filter is removed in newer version with <a h=
ref=3D"https://github.com/falcosecurity/libs/commit/47e245f3d343eff27ed178e=
c2449caa3a01faabb" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
falcosecurity/libs/commit/47e245f3d343eff27ed178ec2449caa3a01faabb</a>]<br>
-Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
----<br>
- userspace/libsinsp/gen_filter.h | 1 +<br>
- 1 file changed, 1 insertion(+)<br>
-<br>
-diff --git a/userspace/libsinsp/gen_filter.h b/userspace/libsinsp/gen_filt=
er.h<br>
-index f4cfa08b1..79ac30dc3 100644<br>
---- a/userspace/libsinsp/gen_filter.h<br>
-+++ b/userspace/libsinsp/gen_filter.h<br>
-@@ -16,6 +16,7 @@ along with Falco.=C2=A0 If not, see &lt;<a href=3D"http:=
//www.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gn=
u.org/licenses/</a>&gt;.<br>
- <br>
- #pragma once<br>
- <br>
-+#include &lt;cstdint&gt;<br>
- #include &lt;set&gt;<br>
- #include &lt;list&gt;<br>
- #include &lt;map&gt;<br>
diff --git a/meta-oe/recipes-extended/sysdig/<a href=3D"http://sysdig_0.28.=
0.bb" rel=3D"noreferrer" target=3D"_blank">sysdig_0.28.0.bb</a> b/meta-oe/r=
ecipes-extended/sysdig/<a href=3D"http://sysdig_0.39.0.bb" rel=3D"noreferre=
r" target=3D"_blank">sysdig_0.39.0.bb</a><br>
similarity index 56%<br>
rename from meta-oe/recipes-extended/sysdig/<a href=3D"http://sysdig_0.28.0=
.bb" rel=3D"noreferrer" target=3D"_blank">sysdig_0.28.0.bb</a><br>
rename to meta-oe/recipes-extended/sysdig/<a href=3D"http://sysdig_0.39.0.b=
b" rel=3D"noreferrer" target=3D"_blank">sysdig_0.39.0.bb</a><br>
index c988b0af59..85e687a17b 100644<br>
--- a/meta-oe/recipes-extended/sysdig/<a href=3D"http://sysdig_0.28.0.bb" r=
el=3D"noreferrer" target=3D"_blank">sysdig_0.28.0.bb</a><br>
+++ b/meta-oe/recipes-extended/sysdig/<a href=3D"http://sysdig_0.39.0.bb" r=
el=3D"noreferrer" target=3D"_blank">sysdig_0.39.0.bb</a><br>
@@ -19,21 +19,30 @@ JIT:powerpc64le =3D &quot;&quot;<br>
=C2=A0JIT:powerpc64 =3D &quot;&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;libb64 lua${JIT} zlib c-ares grpc-native grpc curl=
 ncurses jsoncpp \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tbb jq openssl elfutils protobuf=
 protobuf-native jq-native valijson&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tbb jq openssl elfutils protobuf=
 protobuf-native jq-native valijson \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uthash libbpf clang-native bpfto=
ol-native yaml-cpp nlohmann-json&quot;<br>
=C2=A0RDEPENDS:${PN} =3D &quot;bash&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/draios/sysdig.gi=
t;branch=3Ddev;protocol=3Dhttps;name=3Dsysdig" rel=3D"noreferrer" target=3D=
"_blank">github.com/draios/sysdig.git;branch=3Ddev;protocol=3Dhttps;name=3D=
sysdig</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/falcosecurity/libs;protocol=3Dhttps;branch=3Dmaster;name=3Dfalco;subdir=
=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/falcosecurity-libs" rel=3D"noreferrer" =
target=3D"_blank">github.com/falcosecurity/libs;protocol=3Dhttps;branch=3Dm=
aster;name=3Dfalco;subdir=3D${BB_GIT_DEFAULT_DESTSUFFIX}/falcosecurity-libs=
</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/falcosecurity/libs;protocol=3Dhttps;branch=3Drelease/0.18.x;name=3Dfalco;=
subdir=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/falcosecurity-libs" rel=3D"norefe=
rrer" target=3D"_blank">github.com/falcosecurity/libs;protocol=3Dhttps;bran=
ch=3Drelease/0.18.x;name=3Dfalco;subdir=3D${BB_GIT_DEFAULT_DESTSUFFIX}/falc=
osecurity-libs</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/falcosecurity/libs;protocol=3Dhttps;branch=3Drelease/0.18.x;name=3Ddriver=
;subdir=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/driver" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/falcosecurity/libs;protocol=3Dhttps;branch=3Dreleas=
e/0.18.x;name=3Ddriver;subdir=3D${BB_GIT_DEFAULT_DESTSUFFIX}/driver</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-cmake-Pass-PROBE_NAME=
-via-CFLAGS.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Add-cstdint-for-uintX=
X_t-types.patch;patchdir=3D./falcosecurity-libs \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-libsinsp-fix-build-wi=
th-gcc-15.patch;patchdir=3D./falcosecurity-libs \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-update-cmake-Only-add=
-dependencies-when-we-bundle.patch;patchdir=3D./falcosecurity-libs \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Avoid-duplicate-opera=
tions-of-add_library.patch;patchdir=3D./falcosecurity-libs \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-SRCREV_sysdig =3D &quot;4fb6288275f567f63515df0ff0a6518043ecfa9b&quot;<br>
-SRCREV_falco =3D &quot;caa0e4d0044fdaaebab086592a97f0c7f32aeaa9&quot;<br>
+SRCREV_sysdig =3D &quot;6ef29110cf1add746e10ab5b38957e22730b7349&quot;<br>
+SRCREV_falco =3D &quot;e1999d079880d10800c57e004fca794a03cd060a&quot;<br>
+SRCREV_driver =3D &quot;d4efc80ece48174a71c1a420cb52d233fa94f946&quot;<br>
<br>
=C2=A0SRCREV_FORMAT =3D &quot;sysdig_falco&quot;<br>
<br>
+#Add this function to generate driver_config.h<br>
+do_configure:prepend() {<br>
+=C2=A0 =C2=A0 mkdir -p ${WORKDIR}/driver_Make<br>
+=C2=A0 =C2=A0 cd ${WORKDIR}/driver_Make<br>
+=C2=A0 =C2=A0 cmake ${S}/driver -DMINIMAL_BUILD=3DON<br>
+=C2=A0 =C2=A0 cd -<br>
+}<br>
+do_configure[cleandirs] =3D &quot;${WORKDIR}/driver_Make&quot;<br>
<br>
=C2=A0EXTRA_OECMAKE =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DCMAKE_POLIC=
Y_VERSION_MINIMUM=3D3.5 \<br>
@@ -44,11 +53,31 @@ EXTRA_OECMAKE =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DDIR_ETC=3D$=
{sysconfdir} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DLUA_INCLUDE=
_DIR=3D${STAGING_INCDIR}/luajit-2.1 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DFALCOSECURI=
TY_LIBS_SOURCE_DIR=3D${S}/falcosecurity-libs \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DDRIVER_SOURCE_DI=
R=3D${S}/driver \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DVALIJSON_IN=
CLUDE=3D${STAGING_INCDIR}/valijson \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DUSE_BUNDLED_RE2=
=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DUSE_BUNDLED_TBB=
=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DUSE_BUNDLED_JSON=
CPP=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DBUILD_SYSDIG_MOD=
ERN_BPF=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DCREATE_TEST_TARG=
ETS=3DOFF \<br>
=C2=A0&quot;<br>
<br>
+#Add include dir to find driver_config.h<br>
+CXXFLAGS:append =3D &quot; -I${WORKDIR}/driver_Make/driver/src&quot;<br>
+CFLAGS:append =3D &quot; -I${WORKDIR}/driver_Make/driver/src&quot;<br>
+<br>
+#To fix do_package QA Issue<br>
+do_compile:append() {<br>
+=C2=A0 =C2=A0 sed -i -e &quot;s,${WORKDIR},,g&quot; ${B}/libsinsp/libsinsp=
.pc<br>
+=C2=A0 =C2=A0 sed -i -e &quot;s,${WORKDIR},,g&quot; ${B}/driver/libscap/li=
bscap.pc<br>
+=C2=A0 =C2=A0 mkdir -p ${B}/driver/libsinsp<br>
+=C2=A0 =C2=A0 cp ${B}/libsinsp/libsinsp.pc ${B}/driver/libsinsp/<br>
+}<br>
+do_compile[cleandirs] =3D &quot;${B}/driver/libsinsp&quot;<br>
+<br>
=C2=A0#CMAKE_VERBOSE =3D &quot;VERBOSE=3D1&quot;<br>
<br>
+<br>
=C2=A0FILES:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${DIR_ETC}/* \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/zsh/* \<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125180): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125180" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125180</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118291998/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118291998/1997914</a><br>
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

--0000000000007b3970064d5334f7--

