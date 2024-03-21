Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C6DC54E67
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 01:04:07 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web10.3754.1710983038836693447
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Mar 2024 18:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cNAvLGt1;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5a4f9f94e77so240605eaf.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 18:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710983038; x=1711587838; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xCOE7dxbg9QSbaH/0yyacYOknBcqNjeJKYfrYWoExM=;
        b=cNAvLGt1S2JuMQT6QsqKcTBEzt9fcoFNc3ux34/j5u2yakxQ6nwoz/me9xMOMhOPeH
         fKhQNdCZh7mEXomP0WSTSbyKvSM/Myz8TTIdv9O9jMbu14p8vr11xGlaQi8FZmSOJXUl
         Zap6JIurM/zwIC8AV3b4zqU0MM+/9h/QU+KiOSmlId/jl4t7zsAfusLQCNpDJNbxE4S3
         EXfyj1DNjjwtSZDIlXmfyK2V9V7jCw8v3aY3p2A8JrLfaoXZGGKRHH2VW5tOKTxWN9gl
         eKRp+ETgRLtrdtIGfAGP5Rc6JFbLW3RTlwLlIZsQGV2TU93tZu0tnKXTGo09+jmJX4CS
         Xt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710983038; x=1711587838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xCOE7dxbg9QSbaH/0yyacYOknBcqNjeJKYfrYWoExM=;
        b=PjV97cFlydIVGtFnQC46HMiy9/xHh0spCBXhvk+QUZCcZE/q/+Yj2CRBOltJmfkMH4
         dext39TQGRfGsi7n5N6yAzY2ZgzRr/a5kQNgYJYRq1xUHnvFqRvMSSK7CB6tpXS5kLE+
         p90I7SiArylLCKfS6yz1hBR+y+jiL921K3b3DqwLzQfm9BA/SQmVDmnY1IXHPP1xoPDp
         P/c1SMZUH95fKfWGD8EPVW3s6NNXuNB3dKpAqturbn8B2dJ8rss6hNxk8FmF3WNdYPYl
         +FS9FEQK2IU8Kq6L9flcAhSwdPd7aIyhrQP8ziwdtjXrtOB7Ytszwd3HQ+15CLua68GW
         NWqg==
X-Gm-Message-State: AOJu0YxAZc0YEvi57BglOHPtqzkHOxxBN6dfZdyZ0rlOPlsoiSEON4fu
	x2rjrM9392HBiDpy8OssYkunkQFABydlGEW1nwyypyHOGmDbQn9hq2QpefclUOtzSpIBh/SBcsi
	pf5qJwpSavGsTll9J2rUlmLeYRQA3s5DRXSg=
X-Google-Smtp-Source: AGHT+IHY11eKm4vFOhABN9U9Vkm0FVItFo0wJKTbnlO/GwMfPmYX5r4oylzltEIpUz/P4PAXXYkew/+Ru0oCGOq+Mac=
X-Received: by 2002:a05:6870:420f:b0:21e:4a2a:f05e with SMTP id
 u15-20020a056870420f00b0021e4a2af05emr4129539oac.8.1710983037403; Wed, 20 Mar
 2024 18:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240320082441.3738166-1-yi.zhao@windriver.com>
In-Reply-To: <20240320082441.3738166-1-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Mar 2024 18:03:30 -0700
Message-ID: <CAMKF1srSr68QjmH01w6aApZDCK8jGKvgEkYUn6GowkeqOXDWJQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] minifi-cpp: upgrade 0.7.0 -> 0.15.0
To: Yi Zhao <yi.zhao@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Mar 2024 01:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109499

it seems to demand ccache installed see
http://sprunge.us/xpaFly

On Wed, Mar 20, 2024 at 1:24=E2=80=AFAM Yi Zhao <yi.zhao@eng.windriver.com>=
 wrote:
>
> Release Notes:
> https://cwiki.apache.org/confluence/pages/viewpage.action?pageId=3D651453=
25#ReleaseNotesMiNiFi(C++)-Versioncpp-0.15.0
>
> * Use external dependencies where possible to get rid of bundled
>   packages.
> * Add PACKAGECONFIGs.
> * Use its own systemd service file.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  ...l2-to-linker-cmdline-of-xml-is-found.patch |  39 ----
>  ...-missing-includes-cstdint-and-cstdio.patch |  70 ------
>  ...SPUUID.cmake-Pass-CFLAGS-to-compiler.patch |  35 ---
>  ...1-CMakeLists.txt-Pass-the-OPENSSLDIR.patch |  31 ---
>  ...ts.txt-use-curl-local-source-tarball.patch |  34 ---
>  ...ot-use-LFS64-functions-on-linux-musl.patch |  35 ---
>  .../0001-Do-not-use-bundled-packages.patch    | 108 ++++++++++
>  .../files/0001-Fix-build-with-libc.patch      |  36 ----
>  ...s-issues-around-autovector-iterator_.patch |  65 ------
>  ...sts.txt-do-not-search-gcc-ar-and-gcc.patch |  34 ---
>  .../files/0001-civetweb-Disable-lto.patch     |  33 ---
>  ...onfig.guess-Support-build-on-aarch64.patch |  31 ---
>  .../0001-cxxopts-Add-limits-header.patch      |  34 ---
>  .../files/0002-Fix-build-with-clang-17.patch  |  37 ----
>  .../files/0002-Fix-osspuuid-build.patch       |  78 +++++++
>  ...make-use-libressl-local-source-tarba.patch |  32 ---
>  .../files/0003-Fix-libsodium-build.patch      |  39 ++++
>  ...PUUID.cmake-use-ossp-uuid-local-sour.patch |  34 ---
>  .../files/0004-Fix-spdlog-build.patch         |  44 ++++
>  .../files/0005-Pass-noline-flag-to-flex.patch |  31 +++
>  ...d-missing-header-cstdint-for-int64_t.patch |  36 ++++
>  ...essl-avoid-BSWAP-assembly-for-ARM-v6.patch |  36 ----
>  .../files/fix-libressl-compile.patch          |  45 ----
>  .../minifi-cpp/files/fix-minifi-compile.patch |  62 ------
>  .../files/fix-osspuuid-compile.patch          |  38 ----
>  .../files/fix-osspuuid-cross-compile.patch    |  39 ----
>  .../files/fix-osspuuid-musl-compile.patch     |  27 ---
>  .../files/fix-rocksdb-cross-compile.patch     |  14 --
>  .../minifi-cpp/files/minifi.service           |  13 --
>  .../remove_const_due_to_std_lock_guard.patch  |  40 ----
>  .../minifi-cpp/minifi-cpp_0.15.0.bb           | 199 ++++++++++++++++++
>  .../minifi-cpp/minifi-cpp_0.7.0.bb            | 169 ---------------
>  32 files changed, 535 insertions(+), 1063 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Add-lx=
ml2-to-linker-cmdline-of-xml-is-found.patch
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Add-mi=
ssing-includes-cstdint-and-cstdio.patch
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Bundle=
dOSSPUUID.cmake-Pass-CFLAGS-to-compiler.patch
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-CMakeL=
ists.txt-Pass-the-OPENSSLDIR.patch
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-CMakeL=
ists.txt-use-curl-local-source-tarball.patch
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not=
-use-LFS64-functions-on-linux-musl.patch
>  create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not=
-use-bundled-packages.patch
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-bu=
ild-with-libc.patch
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-th=
e-constness-issues-around-autovector-iterator_.patch
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-civetw=
eb-CMakeLists.txt-do-not-search-gcc-ar-and-gcc.patch
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-civetw=
eb-Disable-lto.patch
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-config=
.guess-Support-build-on-aarch64.patch
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-cxxopt=
s-Add-limits-header.patch
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-bu=
ild-with-clang-17.patch
>  create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-os=
spuuid-build.patch
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0002-cmake-=
LibreSSL.cmake-use-libressl-local-source-tarba.patch
>  create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-li=
bsodium-build.patch
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0003-cmake-=
BundledOSSPUUID.cmake-use-ossp-uuid-local-sour.patch
>  create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0004-Fix-sp=
dlog-build.patch
>  create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0005-Pass-n=
oline-flag-to-flex.patch
>  create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0006-OsUtil=
s.h-add-missing-header-cstdint-for-int64_t.patch
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-libress=
l-avoid-BSWAP-assembly-for-ARM-v6.patch
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-libress=
l-compile.patch
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-minifi-=
compile.patch
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-osspuui=
d-compile.patch
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-osspuui=
d-cross-compile.patch
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-osspuui=
d-musl-compile.patch
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-rocksdb=
-cross-compile.patch
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/minifi.serv=
ice
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/files/remove_cons=
t_due_to_std_lock_guard.patch
>  create mode 100644 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0=
.bb
>  delete mode 100644 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.=
bb
>
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Add-lxml2-to-=
linker-cmdline-of-xml-is-found.patch b/meta-oe/recipes-extended/minifi-cpp/=
files/0001-Add-lxml2-to-linker-cmdline-of-xml-is-found.patch
> deleted file mode 100644
> index d813b37f9..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0001-Add-lxml2-to-linker-=
cmdline-of-xml-is-found.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 609e1745d26d6f42d426018a4dd8d2342d6fc170 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 18 Aug 2020 08:37:57 -0700
> -Subject: [PATCH] Add -lxml2 to linker cmdline of xml is found
> -
> -When cross compiling for systems where static libs
> -for libxml are not available cmake's detection mechanism
> -resort to linking with libxml.so but doesnt use -lxml2
> -liblldbHost.a however requires libxml on linker
> -cmdline _after_ itself so its use of symbols from libxml2
> -can be resolved. Here check for libxml2 being detected and
> -add it if its found.
> -
> -Fixes
> -minifi-cpp/0.7.0-r0/recipe-sysroot-native/usr/lib/libxml2.so is incompat=
ible with elf32-i386
> -| clang-11: error: linker command failed with exit code 1 (use -v to see=
 invocation)
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - thirdparty/libarchive-3.3.2/CMakeLists.txt | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/thirdparty/libarchive-3.3.2/CMakeLists.txt b/thirdparty/lib=
archive-3.3.2/CMakeLists.txt
> -index 0c1ea6f7..cde0cc51 100644
> ---- a/thirdparty/libarchive-3.3.2/CMakeLists.txt
> -+++ b/thirdparty/libarchive-3.3.2/CMakeLists.txt
> -@@ -1031,7 +1031,7 @@ ENDIF()
> - IF(LIBXML2_FOUND)
> -   CMAKE_PUSH_CHECK_STATE()    # Save the state of the variables
> -   INCLUDE_DIRECTORIES(${LIBXML2_INCLUDE_DIR})
> --  LIST(APPEND ADDITIONAL_LIBS ${LIBXML2_LIBRARIES})
> -+  LIST(APPEND ADDITIONAL_LIBS xml2)
> -   SET(HAVE_LIBXML2 1)
> -   # libxml2's include files use iconv.h
> -   SET(CMAKE_REQUIRED_INCLUDES ${ICONV_INCLUDE_DIR} ${LIBXML2_INCLUDE_DI=
R})
> ---
> -2.28.0
> -
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Add-missing-i=
ncludes-cstdint-and-cstdio.patch b/meta-oe/recipes-extended/minifi-cpp/file=
s/0001-Add-missing-includes-cstdint-and-cstdio.patch
> deleted file mode 100644
> index 0fce8dc64..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0001-Add-missing-includes=
-cstdint-and-cstdio.patch
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -From 6e376601c990abaa5e261d1311f92acb3b370b8f Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 24 Jan 2023 21:40:43 -0800
> -Subject: [PATCH] Add missing includes <cstdint> and <cstdio>
> -
> -This is needed with GCC 13 and newer [1]
> -
> -[1] https://www.gnu.org/software/gcc/gcc-13/porting_to.html
> -
> -Upstream-Status: Backport [https://github.com/facebook/rocksdb/commit/88=
edfbfb5e1cac228f7cc31fbec24bb637fe54b1]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - .../rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h   | 1 +
> - storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h   | 1 +
> - .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h    | 1 +
> - storage/rocksdb/rocksdb/util/slice.cc                            | 1 +
> - storage/rocksdb/rocksdb/util/string_util.h                       | 1 +
> - tpool/aio_linux.cc                                               | 1 +
> - 6 files changed, 6 insertions(+)
> -
> ---- a/thirdparty/rocksdb/include/rocksdb/utilities/checkpoint.h
> -+++ b/thirdparty/rocksdb/include/rocksdb/utilities/checkpoint.h
> -@@ -8,6 +8,7 @@
> - #pragma once
> - #ifndef ROCKSDB_LITE
> -
> -+#include <cstdint>
> - #include <string>
> - #include "rocksdb/status.h"
> -
> ---- a/thirdparty/rocksdb/util/string_util.h
> -+++ b/thirdparty/rocksdb/util/string_util.h
> -@@ -6,6 +6,7 @@
> -
> - #pragma once
> -
> -+#include <cstdint>
> - #include <sstream>
> - #include <string>
> - #include <unordered_map>
> ---- a/extensions/expression-language/common/Value.h
> -+++ b/extensions/expression-language/common/Value.h
> -@@ -15,6 +15,7 @@
> -  * limitations under the License.
> -  */
> -
> -+#include <cstdint>
> - #include <string>
> - #include <sstream>
> - #include <iomanip>
> ---- a/libminifi/include/utils/StringUtils.h
> -+++ b/libminifi/include/utils/StringUtils.h
> -@@ -18,6 +18,7 @@
> - #define LIBMINIFI_INCLUDE_IO_STRINGUTILS_H_
> - #include <iostream>
> - #include <cstring>
> -+#include <cstdint>
> - #include <functional>
> - #ifdef WIN32
> -       #include <cwctype>
> ---- a/thirdparty/rocksdb/db/compaction_iteration_stats.h
> -+++ b/thirdparty/rocksdb/db/compaction_iteration_stats.h
> -@@ -5,6 +5,7 @@
> -
> - #pragma once
> -
> -+#include <cstdint>
> - struct CompactionIterationStats {
> -   // Compaction statistics
> -
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-BundledOSSPUU=
ID.cmake-Pass-CFLAGS-to-compiler.patch b/meta-oe/recipes-extended/minifi-cp=
p/files/0001-BundledOSSPUUID.cmake-Pass-CFLAGS-to-compiler.patch
> deleted file mode 100644
> index ceb8ec34b..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0001-BundledOSSPUUID.cmak=
e-Pass-CFLAGS-to-compiler.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From ab031c2b1f8c03e23a8dc8a95c9c9e9b8ce397b2 Mon Sep 17 00:00:00 2001
> -From: Mingli Yu <mingli.yu@windriver.com>
> -Date: Fri, 15 Sep 2023 11:32:11 +0800
> -Subject: [PATCH] BundledOSSPUUID.cmake: Pass CFLAGS to compiler
> -
> -Make sure -fdebug-prefix-map options are passed to compiler to fix the
> -below warning:
> -  WARNING: minifi-cpp-0.7.0-r0 do_package_qa: QA Issue: File /usr/bin/.d=
ebug/minificontroller in package minifi-cpp-dbg contains reference to TMPDI=
R
> -File /usr/bin/.debug/minifi in package minifi-cpp-dbg contains reference=
 to TMPDIR [buildpaths]
> -
> -Upsteam-Status: Pending
> -
> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ----
> -Upstream-Status: Pending
> -
> - cmake/BundledOSSPUUID.cmake | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/cmake/BundledOSSPUUID.cmake b/cmake/BundledOSSPUUID.cmake
> -index 0cf4bac0..ec57ef51 100644
> ---- a/cmake/BundledOSSPUUID.cmake
> -+++ b/cmake/BundledOSSPUUID.cmake
> -@@ -37,7 +37,7 @@ function(use_bundled_osspuuid SOURCE_DIR BINARY_DIR)
> -     ENDFOREACH(BYPRODUCT)
> -
> -     # Build project
> --    set(CONFIGURE_COMMAND ac_cv_va_copy=3DC99 ./configure CFLAGS=3D-fPI=
C CXXFLAGS=3D-fPIC --host=3D${HOST_SYS}
> -+    set(CONFIGURE_COMMAND ac_cv_va_copy=3DC99 ./configure CXXFLAGS=3D-f=
PIC --host=3D${HOST_SYS}
> -         --with-cxx --without-perl --without-php --without-pgsql
> -         --prefix=3D${BINARY_DIR}/thirdparty/ossp-uuid-install)
> -     string(TOLOWER "${CMAKE_BUILD_TYPE}" build_type)
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-CMakeLists.tx=
t-Pass-the-OPENSSLDIR.patch b/meta-oe/recipes-extended/minifi-cpp/files/000=
1-CMakeLists.txt-Pass-the-OPENSSLDIR.patch
> deleted file mode 100644
> index 158fed559..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0001-CMakeLists.txt-Pass-=
the-OPENSSLDIR.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 0c5735a0a02e15c3eae94d25fb8756285d121ddb Mon Sep 17 00:00:00 2001
> -From: Mingli Yu <mingli.yu@windriver.com>
> -Date: Fri, 15 Sep 2023 10:59:05 +0800
> -Subject: [PATCH] CMakeLists.txt: Pass the OPENSSLDIR
> -
> -Fixes:
> -  WARNING: minifi-cpp-0.7.0-r0 do_package_qa: QA Issue: File /usr/bin/mi=
nificontroller in package minifi-cpp contains reference to TMPDIR
> -  File /usr/bin/minifi in package minifi-cpp contains reference to TMPDI=
R [buildpaths]
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ----
> - CMakeLists.txt | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 215a4ef4..6fe8101f 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -75,6 +75,7 @@ set(PASSTHROUGH_CMAKE_ARGS -DANDROID_ABI=3D${ANDROID_A=
BI}
> -                            -DCMAKE_FIND_ROOT_PATH_MODE_LIBRARY=3D${CMAK=
E_FIND_ROOT_PATH_MODE_LIBRARY}
> -                            -DCMAKE_FIND_ROOT_PATH_MODE_INCLUDE=3D${CMAK=
E_FIND_ROOT_PATH_MODE_INCLUDE}
> -                            -DCMAKE_INSTALL_PREFIX=3D${CMAKE_INSTALL_PRE=
FIX}
> -+                           -DOPENSSLDIR=3D${OPENSSLDIR}
> -                                                  ${OPENSSL_PASSTHROUGH}
> -                            -G${CMAKE_GENERATOR})
> -
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-CMakeLists.tx=
t-use-curl-local-source-tarball.patch b/meta-oe/recipes-extended/minifi-cpp=
/files/0001-CMakeLists.txt-use-curl-local-source-tarball.patch
> deleted file mode 100644
> index 183a006e8..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0001-CMakeLists.txt-use-c=
url-local-source-tarball.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 8d99edeefb23c9d7574a0b5a0e2e3f41b0433490 Mon Sep 17 00:00:00 2001
> -From: Yi Zhao <yi.zhao@windriver.com>
> -Date: Thu, 10 Sep 2020 16:14:10 +0800
> -Subject: [PATCH] CMakeLists.txt: use curl local source tarball
> -
> -Do not download curl source during compile.
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ----
> - CMakeLists.txt | 6 +-----
> - 1 file changed, 1 insertion(+), 5 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 7cd550fb..215a4ef4 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -314,11 +314,7 @@ endif()
> -
> -   ExternalProject_Add(
> -     curl-external
> --    GIT_REPOSITORY "https://github.com/curl/curl.git"
> --    GIT_TAG "f3294d9d86e6a7915a967efff2842089b8b0d071"  # Version 7.64.=
0
> --    SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/thirdparty/curl-src"
> --    LIST_SEPARATOR % # This is needed for passing semicolon-separated l=
ists
> --    TLS_VERIFY OFF
> -+    SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/thirdparty/curl-7.64.0"
> -     CMAKE_ARGS ${PASSTHROUGH_CMAKE_ARGS}
> -                "-DCMAKE_INSTALL_PREFIX=3D${CMAKE_CURRENT_BINARY_DIR}/th=
irdparty/curl-install"
> -                "-DCMAKE_INSTALL_LIBDIR=3Dlib${LIBSUFFIX}"
> ---
> -2.17.1
> -
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-LF=
S64-functions-on-linux-musl.patch b/meta-oe/recipes-extended/minifi-cpp/fil=
es/0001-Do-not-use-LFS64-functions-on-linux-musl.patch
> deleted file mode 100644
> index 29f5b94a0..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-LFS64-fun=
ctions-on-linux-musl.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 6690e7fe566445e20fec178e9e209e5f9f2fdde3 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 5 Apr 2023 23:33:46 -0700
> -Subject: [PATCH] Do not use LFS64 functions on linux/musl
> -
> -On musl, off_t is 64bit always ( even on 32bit platforms ), therefore us=
ing
> -LFS64 funcitons is not needed on such platforms. Moreover, musl has stop=
ped
> -providing aliases for these functions [1] which means it wont compile on
> -newer musl systems. Therefore only use it on 32bit glibc/linux platforms
> -and exclude musl like cygwin or OSX
> -
> -[1] https://git.musl-libc.org/cgit/musl/commit/?id=3D246f1c811448f37a44b=
41cd8df8d0ef9736d95f4
> -
> -Upstream-Status: Submitted [https://github.com/gabime/spdlog/pull/2589]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - thirdparty/spdlog-20170710/include/spdlog/details/os.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/thirdparty/spdlog-20170710/include/spdlog/details/os.h b/th=
irdparty/spdlog-20170710/include/spdlog/details/os.h
> -index 735f60147..639b07a79 100644
> ---- a/thirdparty/spdlog-20170710/include/spdlog/details/os.h
> -+++ b/thirdparty/spdlog-20170710/include/spdlog/details/os.h
> -@@ -237,7 +237,7 @@ inline size_t filesize(FILE *f)
> - #else // unix
> -     int fd =3D fileno(f);
> -     //64 bits(but not in osx, where fstat64 is deprecated)
> --#if !defined(__FreeBSD__) && !defined(__APPLE__) && (defined(__x86_64__=
) || defined(__ppc64__))
> -+#if !defined(__FreeBSD__) && !defined(__APPLE__) && ((defined(__x86_64_=
_) || defined(__ppc64__)) && (!defined(__linux__)))
> -     struct stat64 st;
> -     if (fstat64(fd, &st) =3D=3D 0)
> -         return static_cast<size_t>(st.st_size);
> ---
> -2.40.0
> -
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-bu=
ndled-packages.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-no=
t-use-bundled-packages.patch
> new file mode 100644
> index 000000000..b997d6ce7
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-Do-not-use-bundled-p=
ackages.patch
> @@ -0,0 +1,108 @@
> +From 65923a872e44cb461ef1a03374057351f0bc5efe Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Tue, 19 Mar 2024 19:39:04 +0800
> +Subject: [PATCH] Do not use bundled packages
> +
> +Use external dependencies for openssl, curl, bzip2, zlib, libarchive,
> +xz, yaml-cpp and libxml2.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + CMakeLists.txt                       | 23 ++++++-----------------
> + extensions/libarchive/CMakeLists.txt |  7 ++-----
> + 2 files changed, 8 insertions(+), 22 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 13a2b992..8a1dd6d9 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -222,9 +222,7 @@ else()
> + endif()
> +
> + if (NOT DISABLE_BZIP2 AND (NOT DISABLE_LIBARCHIVE OR (NOT DISABLE_ROCKS=
DB AND NOT WIN32)))
> +-    include(BundledBZip2)
> +-    use_bundled_bzip2(${CMAKE_SOURCE_DIR} ${CMAKE_BINARY_DIR})
> +-    list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/bzip2/dumm=
y")
> ++    find_package(BZip2 REQUIRED)
> + endif()
> +
> + if(NOT WIN32)
> +@@ -247,9 +245,7 @@ endif()
> +
> + # OpenSSL
> + if (NOT OPENSSL_OFF)
> +-    include(BundledOpenSSL)
> +-    use_openssl("${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_BINARY_D=
IR}")
> +-    list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/ssl")
> ++    find_package(OpenSSL REQUIRED)
> +
> +     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DOPENSSL_SUPPORT")
> +     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DOPENSSL_SUPPORT")
> +@@ -262,9 +258,7 @@ set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DSODIUM_STA=
TIC=3D1")
> + set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DSODIUM_STATIC=3D1")
> +
> + # zlib
> +-include(BundledZLIB)
> +-use_bundled_zlib(${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_DIR=
})
> +-list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/zlib/dummy")
> ++find_package(ZLIB REQUIRED)
> +
> + # uthash
> + add_library(ut INTERFACE)
> +@@ -272,9 +266,7 @@ target_include_directories(ut SYSTEM INTERFACE "${CM=
AKE_CURRENT_SOURCE_DIR}/thir
> +
> + # cURL
> + if(NOT DISABLE_CURL)
> +-    include(BundledLibcURL)
> +-    use_bundled_curl(${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY=
_DIR})
> +-    list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/curl/dummy=
")
> ++    find_package(CURL REQUIRED)
> + else()
> +     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DDISABLE_CURL")
> +     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DDISABLE_CURL")
> +@@ -285,8 +277,7 @@ include(BundledSpdlog)
> + use_bundled_spdlog(${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_D=
IR})
> +
> + # yaml-cpp
> +-include(BundledYamlCpp)
> +-use_bundled_yamlcpp(${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BINARY_=
DIR})
> ++find_package(yaml-cpp REQUIRED)
> +
> + # concurrentqueue
> + add_library(concurrentqueue INTERFACE)
> +@@ -357,9 +348,7 @@ include(Extensions)
> + add_subdirectory(libminifi)
> +
> + if ((ENABLE_OPENWSMAN AND NOT DISABLE_CIVET AND NOT DISABLE_CURL) OR EN=
ABLE_ALL OR ENABLE_AZURE)
> +-    include(BundledLibXml2)
> +-    use_bundled_libxml2(${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BIN=
ARY_DIR})
> +-    list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/libxml2/du=
mmy")
> ++    find_package(LibXml2 REQUIRED)
> + endif()
> +
> + if (ENABLE_ALL OR ENABLE_PROMETHEUS OR NOT DISABLE_CIVET)
> +diff --git a/extensions/libarchive/CMakeLists.txt b/extensions/libarchiv=
e/CMakeLists.txt
> +index 2b89d3ea..49e13e21 100644
> +--- a/extensions/libarchive/CMakeLists.txt
> ++++ b/extensions/libarchive/CMakeLists.txt
> +@@ -22,13 +22,10 @@ if (DISABLE_LIBARCHIVE)
> + endif()
> +
> + if (NOT DISABLE_LZMA)
> +-    include(BundledLibLZMA)
> +-    use_bundled_liblzma(${CMAKE_SOURCE_DIR} ${CMAKE_BINARY_DIR})
> +-    list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/liblzma/du=
mmy")
> ++    find_package(LibLZMA REQUIRED)
> + endif()
> +
> +-include(BundledLibArchive)
> +-use_bundled_libarchive(${CMAKE_SOURCE_DIR} ${CMAKE_BINARY_DIR})
> ++find_package(LibArchive REQUIRED)
> +
> + include(${CMAKE_SOURCE_DIR}/extensions/ExtensionHeader.txt)
> +
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-wit=
h-libc.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-wit=
h-libc.patch
> deleted file mode 100644
> index c1c118196..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-with-libc.=
patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 72e0fe484444169007e481c9b33d8f78ebe03674 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 27 May 2021 15:44:10 -0700
> -Subject: [PATCH] Fix build with libc++
> -
> -In libc++ on 32-bit platforms, int64_t is defined as alias of long long.=
 On 64-bit platforms: long.
> -
> -On the other hand in definition of std::chrono::duration aliases, that y=
ou can find here long long is used
> -
> -Therefore create custom unit to avoid incompatibility between libstdc++
> -and libc++
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - extensions/expression-language/Expression.cpp | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/extensions/expression-language/Expression.cpp b/extensions/=
expression-language/Expression.cpp
> -index a25e1d3f..68d6320c 100644
> ---- a/extensions/expression-language/Expression.cpp
> -+++ b/extensions/expression-language/Expression.cpp
> -@@ -629,7 +629,8 @@ Value expr_toDate(const std::vector<Value> &args) {
> - #endif  // EXPRESSION_LANGUAGE_USE_DATE
> -
> - Value expr_now(const std::vector<Value> &args) {
> --  return Value(std::chrono::duration_cast<std::chrono::milliseconds>(st=
d::chrono::system_clock::now().time_since_epoch()).count());
> -+  using Milliseconds =3D std::chrono::duration<std::int64_t, std::chron=
o::milliseconds::period>;
> -+  return Value(std::chrono::duration_cast<Milliseconds>(std::chrono::sy=
stem_clock::now().time_since_epoch()).count());
> - }
> -
> - Value expr_unescapeCsv(const std::vector<Value> &args) {
> ---
> -2.31.1
> -
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-the-const=
ness-issues-around-autovector-iterator_.patch b/meta-oe/recipes-extended/mi=
nifi-cpp/files/0001-Fix-the-constness-issues-around-autovector-iterator_.pa=
tch
> deleted file mode 100644
> index cd837d8de..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-the-constness-is=
sues-around-autovector-iterator_.patch
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -From 787d5052a6034cc722b073c652cc610ae037f933 Mon Sep 17 00:00:00 2001
> -From: Levi Tamasi <ltamasi@fb.com>
> -Date: Fri, 22 Nov 2019 18:12:35 -0800
> -Subject: [PATCH 1/2] Fix the constness issues around
> - autovector::iterator_impl's dereference operators (#6057)
> -
> -Summary:
> -As described in detail in issue https://github.com/facebook/rocksdb/issu=
es/6048, iterators' dereference operators
> -(`*`, `->`, and `[]`) should return `pointer`s/`reference`s (as opposed =
to
> -`const_pointer`s/`const_reference`s) even if the iterator itself is `con=
st`
> -to be in sync with the standard's iterator concept.
> -Pull Request resolved: https://github.com/facebook/rocksdb/pull/6057
> -
> -Test Plan: make check
> -
> -Differential Revision: D18623235
> -
> -Pulled By: ltamasi
> -
> -fbshipit-source-id: 04e82d73bc0c67fb0ded018383af8dfc332050cc
> ----
> -Upstream-Status: Pending
> -
> - thirdparty/rocksdb/util/autovector.h | 15 ++++-----------
> - 1 file changed, 4 insertions(+), 11 deletions(-)
> -
> -diff --git a/thirdparty/rocksdb/util/autovector.h b/thirdparty/rocksdb/u=
til/autovector.h
> -index b5c84712..6d337908 100644
> ---- a/thirdparty/rocksdb/util/autovector.h
> -+++ b/thirdparty/rocksdb/util/autovector.h
> -@@ -120,27 +120,20 @@ class autovector {
> -     }
> -
> -     // -- Reference
> --    reference operator*() {
> -+    reference operator*() const {
> -       assert(vect_->size() >=3D index_);
> -       return (*vect_)[index_];
> -     }
> -
> --    const_reference operator*() const {
> --      assert(vect_->size() >=3D index_);
> --      return (*vect_)[index_];
> --    }
> --
> --    pointer operator->() {
> -+    pointer operator->() const {
> -       assert(vect_->size() >=3D index_);
> -       return &(*vect_)[index_];
> -     }
> -
> --    const_pointer operator->() const {
> --      assert(vect_->size() >=3D index_);
> --      return &(*vect_)[index_];
> -+    reference operator[](difference_type len) const {
> -+      return *(*this + len);
> -     }
> -
> --
> -     // -- Logical Operators
> -     bool operator=3D=3D(const self_type& other) const {
> -       assert(vect_ =3D=3D other.vect_);
> ---
> -2.41.0
> -
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-civetweb-CMak=
eLists.txt-do-not-search-gcc-ar-and-gcc.patch b/meta-oe/recipes-extended/mi=
nifi-cpp/files/0001-civetweb-CMakeLists.txt-do-not-search-gcc-ar-and-gcc.pa=
tch
> deleted file mode 100644
> index bc480d969..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0001-civetweb-CMakeLists.=
txt-do-not-search-gcc-ar-and-gcc.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 0eee3fb85dad084b6b42f7b219d8aa3a62620a27 Mon Sep 17 00:00:00 2001
> -From: Yi Zhao <yi.zhao@windriver.com>
> -Date: Wed, 28 Oct 2020 09:52:40 +0800
> -Subject: [PATCH] civetweb/CMakeLists.txt: do not search gcc-ar and gcc-r=
anlib
> -
> -Do not search gcc-ar and gcc-ranlib. Specify GCC_AR and GCC_RANLIB in
> -EXTRA_OECMAKE to avoid host contamination.
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ----
> - thirdparty/civetweb-1.10/CMakeLists.txt | 2 --
> - 1 file changed, 2 deletions(-)
> -
> -diff --git a/thirdparty/civetweb-1.10/CMakeLists.txt b/thirdparty/civetw=
eb-1.10/CMakeLists.txt
> -index f559a04e..0689e3f6 100644
> ---- a/thirdparty/civetweb-1.10/CMakeLists.txt
> -+++ b/thirdparty/civetweb-1.10/CMakeLists.txt
> -@@ -246,11 +246,9 @@ set_property(CACHE CIVETWEB_CXX_STANDARD PROPERTY S=
TRINGS auto c++14 c++11 c++98
> -
> - # Configure the linker
> - if ("${CMAKE_C_COMPILER_ID}" STREQUAL "GNU")
> --  find_program(GCC_AR gcc-ar)
> -   if (GCC_AR)
> -     set(CMAKE_AR ${GCC_AR})
> -   endif()
> --  find_program(GCC_RANLIB gcc-ranlib)
> -   if (GCC_RANLIB)
> -     set(CMAKE_RANLIB ${GCC_RANLIB})
> -   endif()
> ---
> -2.17.1
> -
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-civetweb-Disa=
ble-lto.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-civetweb-Dis=
able-lto.patch
> deleted file mode 100644
> index ec4e6ffc4..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0001-civetweb-Disable-lto=
.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 120c708d51f72ade4a31d3d8f35bcfad7b12e723 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 6 Sep 2022 20:38:03 -0700
> -Subject: [PATCH] civetweb: Disable lto
> -
> -lto does not work everywhere, therefore disable it atleast in the cmake
> -file, we can still enable it via environment
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - thirdparty/civetweb-1.10/CMakeLists.txt | 4 ----
> - 1 file changed, 4 deletions(-)
> -
> ---- a/thirdparty/civetweb-1.10/CMakeLists.txt
> -+++ b/thirdparty/civetweb-1.10/CMakeLists.txt
> -@@ -298,7 +298,6 @@ add_c_compiler_flag(/WX)
> - add_c_compiler_flag(-pedantic-errors)
> - add_c_compiler_flag(-fvisibility=3Dhidden)
> - add_c_compiler_flag(-fstack-protector-strong RELEASE)
> --add_c_compiler_flag(-flto RELEASE)
> -
> - add_c_compiler_flag(-fstack-protector-all DEBUG)
> - if (MINGW)
> -@@ -361,7 +360,6 @@ if (CIVETWEB_ENABLE_CXX)
> -   add_cxx_compiler_flag(-pedantic-errors)
> -   add_cxx_compiler_flag(-fvisibility=3Dhidden)
> -   add_cxx_compiler_flag(-fstack-protector-strong RELEASE)
> --  add_cxx_compiler_flag(-flto RELEASE)
> -
> -   add_cxx_compiler_flag(-fstack-protector-all DEBUG)
> -   if (MINGW)
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-config.guess-=
Support-build-on-aarch64.patch b/meta-oe/recipes-extended/minifi-cpp/files/=
0001-config.guess-Support-build-on-aarch64.patch
> deleted file mode 100644
> index 3086a7045..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0001-config.guess-Support=
-build-on-aarch64.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 92fdbfdd6b55ff0b65edd9a283ac85ad349e325b Mon Sep 17 00:00:00 2001
> -From: Robert Yang <liezhi.yang@windriver.com>
> -Date: Tue, 12 Dec 2023 07:27:52 +0000
> -Subject: [PATCH] config.guess: Fix do_configure error builder aarch64
> -
> -Fixed configure error when build on aarch64 host:
> -error: cannot guess build type; you must specify one
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ----
> - config.guess      |   2 +-
> - 1 files changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/thirdparty/uuid-1.6.2/config.guess b/thirdparty/uuid-1.6.2/=
config.guess
> -index ca2a03c..a858bfd 100755
> ---- a/thirdparty/uuid-1.6.2/config.guess
> -+++ b/thirdparty/uuid-1.6.2/config.guess
> -@@ -835,7 +835,7 @@ EOF
> -     i*86:Minix:*:*)
> -       echo ${UNAME_MACHINE}-pc-minix
> -       exit ;;
> --    arm*:Linux:*:*)
> -+    arm*:Linux:*:*|aarch64:Linux:*:*)
> -       eval $set_cc_for_build
> -       if echo __ARM_EABI__ | $CC_FOR_BUILD -E - 2>/dev/null \
> -           | grep -q __ARM_EABI__
> ---
> -2.34.1
> -
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-cxxopts-Add-l=
imits-header.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-cxxopts=
-Add-limits-header.patch
> deleted file mode 100644
> index ef26c475d..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0001-cxxopts-Add-limits-h=
eader.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From fda0713ce3e07786757a057abe7ebf2146d33780 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 2 Mar 2021 18:31:45 -0800
> -Subject: [PATCH] cxxopts: Add limits header
> -
> -needed for numeric_limits
> -
> -Upstream-Status: Submitted [https://github.com/apache/nifi-minifi-cpp/pu=
ll/1021]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - thirdparty/cxxopts/include/cxxopts.hpp | 1 +
> - 1 file changed, 1 insertion(+)
> -
> ---- a/thirdparty/cxxopts/include/cxxopts.hpp
> -+++ b/thirdparty/cxxopts/include/cxxopts.hpp
> -@@ -29,6 +29,7 @@ THE SOFTWARE.
> - #include <cctype>
> - #include <exception>
> - #include <iostream>
> -+#include <limits>
> - #include <map>
> - #include <memory>
> - #include <regex>
> ---- a/libminifi/src/utils/StringUtils.cpp
> -+++ b/libminifi/src/utils/StringUtils.cpp
> -@@ -21,6 +21,8 @@
> - #include <Windows.h>
> - #endif
> -
> -+#include <limits>
> -+
> - namespace org {
> - namespace apache {
> - namespace nifi {
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-build-wit=
h-clang-17.patch b/meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-build=
-with-clang-17.patch
> deleted file mode 100644
> index 7581efc76..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-build-with-clang=
-17.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From a784973e500753747992a51dc0fb1caabbbb03be Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 6 Jul 2023 17:52:38 -0700
> -Subject: [PATCH 2/2] Fix build with clang 17
> -
> -Part of https://github.com/jarro2783/cxxopts/commit/513afbc6dcfe2952cb2f=
fab0dae2415b11bba2d0
> -
> -Upstream-Status: Backport [https://github.com/jarro2783/cxxopts/commit/5=
13afbc6dcfe2952cb2ffab0dae2415b11bba2d0]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - thirdparty/cxxopts/include/cxxopts.hpp | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/thirdparty/cxxopts/include/cxxopts.hpp b/thirdparty/cxxopts=
/include/cxxopts.hpp
> -index e87416f1..bd2d81cf 100644
> ---- a/thirdparty/cxxopts/include/cxxopts.hpp
> -+++ b/thirdparty/cxxopts/include/cxxopts.hpp
> -@@ -468,14 +468,14 @@ namespace cxxopts
> -         {
> -           if (negative)
> -           {
> --            if (u > static_cast<U>(-std::numeric_limits<T>::min()))
> -+            if (u > static_cast<U>((std::numeric_limits<T>::min)()))
> -             {
> -               throw argument_incorrect_type(text);
> -             }
> -           }
> -           else
> -           {
> --            if (u > static_cast<U>(std::numeric_limits<T>::max()))
> -+            if (u > static_cast<U>((std::numeric_limits<T>::max)()))
> -             {
> -               throw argument_incorrect_type(text);
> -             }
> ---
> -2.41.0
> -
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-osspuuid-=
build.patch b/meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-osspuuid-b=
uild.patch
> new file mode 100644
> index 000000000..65c52c633
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minifi-cpp/files/0002-Fix-osspuuid-build.p=
atch
> @@ -0,0 +1,78 @@
> +From 4e8e1943541d3b887ba86dc1b488cbb058c7d1cd Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Tue, 19 Mar 2024 20:48:25 +0800
> +Subject: [PATCH] Fix osspuuid build
> +
> +* Specify correct configure options to fix osspuuid cross build.
> +* Do not download osspuuid source during compile.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + cmake/BundledOSSPUUID.cmake                         | 10 +++++-----
> + .../ossp-uuid/ossp-uuid-cross-compile-fix.patch     | 13 +++++++++++++
> + 2 files changed, 18 insertions(+), 5 deletions(-)
> + create mode 100644 thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.pat=
ch
> +
> +diff --git a/cmake/BundledOSSPUUID.cmake b/cmake/BundledOSSPUUID.cmake
> +index c4fa1523..1faf2e5c 100644
> +--- a/cmake/BundledOSSPUUID.cmake
> ++++ b/cmake/BundledOSSPUUID.cmake
> +@@ -23,10 +23,12 @@ function(use_bundled_osspuuid SOURCE_DIR BINARY_DIR)
> +     set(PATCH_FILE1 "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-mac-f=
ix.patch")
> +     set(PATCH_FILE2 "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-no-pr=
og.patch")
> +     set(PATCH_FILE3 "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-updat=
e-config-guess.patch")
> ++    set(PATCH_FILE4 "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-cross=
-compile-fix.patch")
> +     set(PC ${Bash_EXECUTABLE} -c "set -x &&\
> +             (\"${Patch_EXECUTABLE}\" -p1 -R -s -f --dry-run -i \"${PATC=
H_FILE1}\" || \"${Patch_EXECUTABLE}\" -p1 -N -i \"${PATCH_FILE1}\") &&\
> +             (\"${Patch_EXECUTABLE}\" -p1 -R -s -f --dry-run -i \"${PATC=
H_FILE2}\" || \"${Patch_EXECUTABLE}\" -p1 -N -i \"${PATCH_FILE2}\") &&\
> +-            (\"${Patch_EXECUTABLE}\" -p1 -R -s -f --dry-run -i \"${PATC=
H_FILE3}\" || \"${Patch_EXECUTABLE}\" -p1 -N -i \"${PATCH_FILE3}\") ")
> ++            (\"${Patch_EXECUTABLE}\" -p1 -R -s -f --dry-run -i \"${PATC=
H_FILE3}\" || \"${Patch_EXECUTABLE}\" -p1 -N -i \"${PATCH_FILE3}\") &&\
> ++            (\"${Patch_EXECUTABLE}\" -p1 -R -s -f --dry-run -i \"${PATC=
H_FILE4}\" || \"${Patch_EXECUTABLE}\" -p1 -N -i \"${PATCH_FILE4}\") ")
> +
> +     # Define byproducts
> +     set(BYPRODUCTS "lib/libuuid.a"
> +@@ -39,7 +41,7 @@ function(use_bundled_osspuuid SOURCE_DIR BINARY_DIR)
> +     ENDFOREACH(BYPRODUCT)
> +
> +     # Build project
> +-    set(CONFIGURE_COMMAND ./configure "CC=3D${CMAKE_C_COMPILER}" "CXX=
=3D${CMAKE_CXX_COMPILER}" "CFLAGS=3D${PASSTHROUGH_CMAKE_C_FLAGS} -fPIC" "CX=
XFLAGS=3D${PASSTHROUGH_CMAKE_CXX_FLAGS} -fPIC" --enable-shared=3Dno --with-=
cxx --without-perl --without-php --without-pgsql "--prefix=3D${BINARY_DIR}/=
thirdparty/ossp-uuid-install")
> ++    set(CONFIGURE_COMMAND ac_cv_va_copy=3DC99 ./configure --host=3D${HO=
ST_SYS} --build=3D${BUILD_SYS} "CC=3D${CMAKE_C_COMPILER}" "CXX=3D${CMAKE_CX=
X_COMPILER}" "CFLAGS=3D${PASSTHROUGH_CMAKE_C_FLAGS} -fPIC" "CXXFLAGS=3D${PA=
SSTHROUGH_CMAKE_CXX_FLAGS} -fPIC" --enable-shared=3Dno --with-cxx --without=
-perl --without-php --without-pgsql "--prefix=3D${BINARY_DIR}/thirdparty/os=
sp-uuid-install")
> +     string(TOLOWER "${CMAKE_BUILD_TYPE}" build_type)
> +     if(NOT build_type MATCHES debug)
> +         list(APPEND CONFIGURE_COMMAND --enable-debug=3Dyes)
> +@@ -47,10 +49,8 @@ function(use_bundled_osspuuid SOURCE_DIR BINARY_DIR)
> +
> +     ExternalProject_Add(
> +             ossp-uuid-external
> +-            URL "https://deb.debian.org/debian/pool/main/o/ossp-uuid/os=
sp-uuid_1.6.2.orig.tar.gz"
> +-            URL_HASH "SHA256=3D11a615225baa5f8bb686824423f50e4427acd3f7=
0d394765bdff32801f0fd5b0"
> +             BUILD_IN_SOURCE true
> +-            SOURCE_DIR "${BINARY_DIR}/thirdparty/ossp-uuid-src"
> ++            SOURCE_DIR "${SOURCE_DIR}/thirdparty/uuid-1.6.2"
> +             BUILD_COMMAND make
> +             CMAKE_COMMAND ""
> +             UPDATE_COMMAND ""
> +diff --git a/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch b/th=
irdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch
> +new file mode 100644
> +index 00000000..b8d7b0bb
> +--- /dev/null
> ++++ b/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch
> +@@ -0,0 +1,13 @@
> ++diff --git a/shtool b/shtool
> ++index a2d2567..ab4fe17 100755
> ++--- a/shtool
> +++++ b/shtool
> ++@@ -1400,7 +1400,7 @@ install )
> ++             if [ ".$opt_t" =3D .yes ]; then
> ++                 echo "strip $dsttmp" 1>&2
> ++             fi
> ++-            strip $dsttmp || shtool_exit $?
> +++            $STRIP $dsttmp || shtool_exit $?
> ++         fi
> ++         if [ ".$opt_o" !=3D . ]; then
> ++             if [ ".$opt_t" =3D .yes ]; then
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0002-cmake-LibreSS=
L.cmake-use-libressl-local-source-tarba.patch b/meta-oe/recipes-extended/mi=
nifi-cpp/files/0002-cmake-LibreSSL.cmake-use-libressl-local-source-tarba.pa=
tch
> deleted file mode 100644
> index da5ee9754..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0002-cmake-LibreSSL.cmake=
-use-libressl-local-source-tarba.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 5a5317044b0039e9e19aabcecb7b666a3f13e136 Mon Sep 17 00:00:00 2001
> -From: Yi Zhao <yi.zhao@windriver.com>
> -Date: Thu, 10 Sep 2020 15:08:19 +0800
> -Subject: [PATCH] cmake/LibreSSL.cmake: use libressl local source tarball
> -
> -Do not download libressl source during compile.
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ----
> - cmake/LibreSSL.cmake | 4 +---
> - 1 file changed, 1 insertion(+), 3 deletions(-)
> -
> -diff --git a/cmake/LibreSSL.cmake b/cmake/LibreSSL.cmake
> -index 57319e40..bab30129 100644
> ---- a/cmake/LibreSSL.cmake
> -+++ b/cmake/LibreSSL.cmake
> -@@ -43,9 +43,7 @@ function(use_libre_ssl SOURCE_DIR BINARY_DIR)
> -
> -       ExternalProject_Add(
> -       libressl-portable
> --      URL https://cdn.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.8.3.t=
ar.gz https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.8.3.tar.gz ht=
tps://gentoo.osuosl.org/distfiles/libressl-2.8.3.tar.gz
> --      URL_HASH "SHA256=3D9b640b13047182761a99ce3e4f000be9687566e0828b4a=
72709e9e6a3ef98477"
> --      SOURCE_DIR "${BINARY_DIR}/thirdparty/libressl-src"
> -+      SOURCE_DIR "${SOURCE_DIR}/thirdparty/libressl-2.8.3"
> -       PATCH_COMMAND ${PATCH}
> -       CMAKE_ARGS ${PASSTHROUGH_CMAKE_ARGS}
> -                               "-DCMAKE_INSTALL_PREFIX=3D${BINARY_DIR}/t=
hirdparty/libressl-install"
> ---
> -2.17.1
> -
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium=
-build.patch b/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium=
-build.patch
> new file mode 100644
> index 000000000..a08962724
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minifi-cpp/files/0003-Fix-libsodium-build.=
patch
> @@ -0,0 +1,39 @@
> +From 1c697e4d75f0045d5364d622960ff8047a4ad3ec Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Tue, 19 Mar 2024 20:56:05 +0800
> +Subject: [PATCH] Fix libsodium build
> +
> +* Specify correct configure options to fix libsodium cross build.
> +* Do not download libsodium source during compile.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + cmake/BundledLibSodium.cmake | 6 ++----
> + 1 file changed, 2 insertions(+), 4 deletions(-)
> +
> +diff --git a/cmake/BundledLibSodium.cmake b/cmake/BundledLibSodium.cmake
> +index 3a3daf41..d851f753 100644
> +--- a/cmake/BundledLibSodium.cmake
> ++++ b/cmake/BundledLibSodium.cmake
> +@@ -58,14 +58,12 @@ function(use_bundled_libsodium SOURCE_DIR BINARY_DIR=
)
> +                 EXCLUDE_FROM_ALL TRUE
> +         )
> +     else()
> +-        set(CONFIGURE_COMMAND ./configure --disable-pie --enable-minima=
l "--prefix=3D${LIBSODIUM_BIN_DIR}")
> ++        set(CONFIGURE_COMMAND ./configure --host=3D${HOST_SYS} --build=
=3D${BUILD_SYS} --disable-pie --enable-minimal "--prefix=3D${LIBSODIUM_BIN_=
DIR}")
> +
> +         ExternalProject_Add(
> +                 libsodium-external
> +-                URL "${LIBSODIUM_OFFICIAL_MIRROR_URL} ${LIBSODIUM_GITHU=
B_MIRROR_URL} ${LIBSODIUM_GENTOO_MIRROR_URL}"
> +-                URL_HASH ${LIBSODIUM_URL_HASH}
> +                 BUILD_IN_SOURCE true
> +-                SOURCE_DIR "${BINARY_DIR}/thirdparty/libsodium-src"
> ++                SOURCE_DIR "${SOURCE_DIR}/thirdparty/libsodium-stable"
> +                 BUILD_COMMAND make
> +                 CMAKE_COMMAND ""
> +                 UPDATE_COMMAND ""
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0003-cmake-Bundled=
OSSPUUID.cmake-use-ossp-uuid-local-sour.patch b/meta-oe/recipes-extended/mi=
nifi-cpp/files/0003-cmake-BundledOSSPUUID.cmake-use-ossp-uuid-local-sour.pa=
tch
> deleted file mode 100644
> index a39e15b79..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/0003-cmake-BundledOSSPUUI=
D.cmake-use-ossp-uuid-local-sour.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From 74ade26f7ccd0dbc4ad97cb3082204118a67c92b Mon Sep 17 00:00:00 2001
> -From: Yi Zhao <yi.zhao@windriver.com>
> -Date: Thu, 10 Sep 2020 15:12:41 +0800
> -Subject: [PATCH] cmake/BundledOSSPUUID.cmake: use ossp-uuid local source
> - tarball
> -
> -Do not download ossp-uuid source during compile.
> -
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ----
> - cmake/BundledOSSPUUID.cmake | 4 +---
> - 1 file changed, 1 insertion(+), 3 deletions(-)
> -
> -diff --git a/cmake/BundledOSSPUUID.cmake b/cmake/BundledOSSPUUID.cmake
> -index 1103156d..0cf4bac0 100644
> ---- a/cmake/BundledOSSPUUID.cmake
> -+++ b/cmake/BundledOSSPUUID.cmake
> -@@ -47,10 +47,8 @@ function(use_bundled_osspuuid SOURCE_DIR BINARY_DIR)
> -
> -     ExternalProject_Add(
> -             ossp-uuid-external
> --            URL "https://deb.debian.org/debian/pool/main/o/ossp-uuid/os=
sp-uuid_1.6.2.orig.tar.gz"
> --            URL_HASH "SHA256=3D11a615225baa5f8bb686824423f50e4427acd3f7=
0d394765bdff32801f0fd5b0"
> -             BUILD_IN_SOURCE true
> --            SOURCE_DIR "${BINARY_DIR}/thirdparty/ossp-uuid-src"
> -+            SOURCE_DIR "${SOURCE_DIR}/thirdparty/uuid-1.6.2"
> -             BUILD_COMMAND make
> -             CMAKE_COMMAND ""
> -             UPDATE_COMMAND ""
> ---
> -2.17.1
> -
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0004-Fix-spdlog-bu=
ild.patch b/meta-oe/recipes-extended/minifi-cpp/files/0004-Fix-spdlog-build=
.patch
> new file mode 100644
> index 000000000..177c6adee
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minifi-cpp/files/0004-Fix-spdlog-build.pat=
ch
> @@ -0,0 +1,44 @@
> +From 8a5fe73f722718aa5c9a467c28a26913771f7208 Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Tue, 19 Mar 2024 20:57:37 +0800
> +Subject: [PATCH] Fix spdlog build
> +
> +* Specify CMAKE_INSTALL_LIBDIR to fix multilib build.
> +* Do not download spdlog source during compile.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + cmake/BundledSpdlog.cmake | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/cmake/BundledSpdlog.cmake b/cmake/BundledSpdlog.cmake
> +index 974cbbaa..c0c45688 100644
> +--- a/cmake/BundledSpdlog.cmake
> ++++ b/cmake/BundledSpdlog.cmake
> +@@ -35,11 +35,12 @@ function(use_bundled_spdlog SOURCE_DIR BINARY_DIR)
> +     endif()
> +
> +     # Set build options
> +-    set(SPDLOG_SOURCE_DIR "${BINARY_DIR}/thirdparty/spdlog-src")
> ++    set(SPDLOG_SOURCE_DIR "${SOURCE_DIR}/thirdparty/spdlog-src")
> +     set(SPDLOG_INSTALL_DIR "${BINARY_DIR}/thirdparty/spdlog-install")
> +     set(SPDLOG_LIBRARY "${SPDLOG_INSTALL_DIR}/${BYPRODUCT}")
> +     set(SPDLOG_CMAKE_ARGS ${PASSTHROUGH_CMAKE_ARGS}
> +             "-DCMAKE_INSTALL_PREFIX=3D${SPDLOG_INSTALL_DIR}"
> ++            "-DCMAKE_INSTALL_LIBDIR=3D${LIBDIR}"
> +             "-DSPDLOG_BUILD_EXAMPLE=3DOFF"
> +             "-DSPDLOG_BUILD_TESTS=3DOFF"
> +             "-DSPDLOG_BUILD_TESTING=3DOFF"
> +@@ -49,7 +50,6 @@ function(use_bundled_spdlog SOURCE_DIR BINARY_DIR)
> +     # Build project
> +     ExternalProject_Add(
> +             spdlog-external
> +-            URL "https://github.com/gabime/spdlog/archive/v1.8.0.zip"
> +             SOURCE_DIR "${SPDLOG_SOURCE_DIR}"
> +             CMAKE_ARGS ${SPDLOG_CMAKE_ARGS}
> +             BUILD_BYPRODUCTS "${SPDLOG_LIBRARY}"
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0005-Pass-noline-f=
lag-to-flex.patch b/meta-oe/recipes-extended/minifi-cpp/files/0005-Pass-nol=
ine-flag-to-flex.patch
> new file mode 100644
> index 000000000..53939131f
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minifi-cpp/files/0005-Pass-noline-flag-to-=
flex.patch
> @@ -0,0 +1,31 @@
> +From 083babbd6c6cc6f31530fbac0227c1d426fb0863 Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Tue, 19 Mar 2024 21:00:59 +0800
> +Subject: [PATCH] Pass --noline flag to flex
> +
> +This ensures that line directive is not emitted into lexer output which
> +could be absolute build paths.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + extensions/expression-language/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/extensions/expression-language/CMakeLists.txt b/extensions/=
expression-language/CMakeLists.txt
> +index 775b4116..84edc617 100644
> +--- a/extensions/expression-language/CMakeLists.txt
> ++++ b/extensions/expression-language/CMakeLists.txt
> +@@ -77,7 +77,7 @@ flex_target(
> +     el-scanner
> +     ${CMAKE_CURRENT_SOURCE_DIR}/Scanner.ll
> +     ${CMAKE_CURRENT_SOURCE_DIR}/Scanner.cpp
> +-    COMPILE_FLAGS --c++
> ++    COMPILE_FLAGS "--c++ --noline"
> + )
> +
> + add_flex_bison_dependency(el-scanner el-parser)
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0006-OsUtils.h-add=
-missing-header-cstdint-for-int64_t.patch b/meta-oe/recipes-extended/minifi=
-cpp/files/0006-OsUtils.h-add-missing-header-cstdint-for-int64_t.patch
> new file mode 100644
> index 000000000..38893e74a
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minifi-cpp/files/0006-OsUtils.h-add-missin=
g-header-cstdint-for-int64_t.patch
> @@ -0,0 +1,36 @@
> +From 08d1b4b66fedde97eefb5e3ff6aa98fd02be7c21 Mon Sep 17 00:00:00 2001
> +From: Yi Zhao <yi.zhao@windriver.com>
> +Date: Wed, 20 Mar 2024 10:03:14 +0800
> +Subject: [PATCH] OsUtils.h: add missing header <cstdint> for int64_t
> +
> +Fix build with musl:
> +libminifi/include/utils/OsUtils.h:31:1: error: 'int64_t' does not name a=
 type
> +   31 | int64_t getCurrentProcessPhysicalMemoryUsage();
> +      | ^~~~~~~
> +libminifi/include/utils/OsUtils.h:22:1: note: 'int64_t' is defined in he=
ader '<cstdint>'; did you forget to '#include <cstdint>'?
> +   21 | #include <system_error>
> +  +++ |+#include <cstdint>
> +   22 |
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + libminifi/include/utils/OsUtils.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/libminifi/include/utils/OsUtils.h b/libminifi/include/utils=
/OsUtils.h
> +index a7117233..5e623d1a 100644
> +--- a/libminifi/include/utils/OsUtils.h
> ++++ b/libminifi/include/utils/OsUtils.h
> +@@ -19,6 +19,7 @@
> + #include <string>
> + #include <optional>
> + #include <system_error>
> ++#include <cstdint>
> +
> + struct sockaddr;
> +
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-avoid=
-BSWAP-assembly-for-ARM-v6.patch b/meta-oe/recipes-extended/minifi-cpp/file=
s/fix-libressl-avoid-BSWAP-assembly-for-ARM-v6.patch
> deleted file mode 100644
> index a7dc35ae5..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-avoid-BSWAP-=
assembly-for-ARM-v6.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -Upstream-Status: Pending
> -
> -diff -urN -x .git orig/thirdparty/libressl/avoid-BSWAP-assembly-for-ARM-=
v6.patch patched/thirdparty/libressl/avoid-BSWAP-assembly-for-ARM-v6.patch
> ---- orig/thirdparty/libressl/avoid-BSWAP-assembly-for-ARM-v6.patch     1=
970-01-01 09:00:00.000000000 +0900
> -+++ patched/thirdparty/libressl/avoid-BSWAP-assembly-for-ARM-v6.patch  2=
020-08-07 23:14:46.196764271 +0900
> -@@ -0,0 +1,30 @@
> -+This patch was imported from the libressl potable.
> -+https://github.com/libressl-portable/portable/commit/a9332ccecfce63bf54=
924e70c11f420edd3ae312
> -+
> -+From a9332ccecfce63bf54924e70c11f420edd3ae312 Mon Sep 17 00:00:00 2001
> -+From: Brent Cook <bcook@openbsd.org>
> -+Date: Sun, 17 Jul 2016 18:12:23 -0500
> -+Subject: [PATCH] avoid BSWAP assembly for ARM <=3D v6
> -+
> -+diff -urN orig/crypto/modes/modes_lcl.h patched/crypto/modes/modes_lcl.=
h
> -+--- orig/crypto/modes/modes_lcl.h     2018-11-18 21:27:10.000000000 +09=
00
> -++++ patched/crypto/modes/modes_lcl.h  2020-08-07 23:11:01.960764745 +09=
00
> -+@@ -45,14 +45,16 @@
> -+                      asm ("bswapl %0"                \
> -+                      : "+r"(ret));   ret;            })
> -+ # elif (defined(__arm__) || defined(__arm)) && !defined(__STRICT_ALIGN=
MENT)
> -+-#  define BSWAP8(x) ({       u32 lo=3D(u64)(x)>>32,hi=3D(x);     \
> -++#  if (__ARM_ARCH >=3D 6)
> -++#   define BSWAP8(x) ({      u32 lo=3D(u64)(x)>>32,hi=3D(x);     \
> -+                      asm ("rev %0,%0; rev %1,%1"     \
> -+                      : "+r"(hi),"+r"(lo));           \
> -+                      (u64)hi<<32|lo;                 })
> -+-#  define BSWAP4(x) ({       u32 ret;                        \
> -++#   define BSWAP4(x) ({      u32 ret;                        \
> -+                      asm ("rev %0,%1"                \
> -+                      : "=3Dr"(ret) : "r"((u32)(x)));   \
> -+                      ret;                            })
> -++#  endif
> -+ # endif
> -+ #endif
> -+ #endif
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-compi=
le.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-compile.p=
atch
> deleted file mode 100644
> index 32bcfbd2b..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/fix-libressl-compile.patc=
h
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -Upstream-Status: Pending
> -
> -diff -urN -x .git orig/cmake/LibreSSL.cmake patched/cmake/LibreSSL.cmake
> ---- orig/cmake/LibreSSL.cmake  2020-08-07 21:58:34.660773928 +0900
> -+++ patched/cmake/LibreSSL.cmake       2020-08-07 22:51:18.620767245 +09=
00
> -@@ -18,6 +18,9 @@
> - function(use_libre_ssl SOURCE_DIR BINARY_DIR)
> -       message("Using bundled LibreSSL from release")
> -
> -+      find_package(Patch REQUIRED)
> -+      set(PATCH "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/=
libressl/avoid-BSWAP-assembly-for-ARM-v6.patch")
> -+
> -       set(BYPRODUCT_PREFIX "lib" CACHE STRING "" FORCE)
> -       set(BYPRODUCT_SUFFIX ".a" CACHE STRING "" FORCE)
> -
> -@@ -27,16 +30,29 @@
> -               set(BYPRODUCT_PREFIX "" CACHE STRING "" FORCE)
> -       set(BUILD_ARGS " -GVisual Studio 15 2017")
> -       endif(WIN32)
> -+
> -+      set(BYPRODUCTS
> -+              "lib/${BYPRODUCT_PREFIX}crypto${BYPRODUCT_SUFFIX}"
> -+              "lib/${BYPRODUCT_PREFIX}ssl${BYPRODUCT_SUFFIX}"
> -+              "lib/${BYPRODUCT_PREFIX}tls${BYPRODUCT_SUFFIX}"
> -+      )
> -+      set(LIBRESSL_INSTALL_DIR "${BINARY_DIR}/thirdparty/libressl-insta=
ll" CACHE STRING "" FORCE)
> -+      FOREACH(BYPRODUCT ${BYPRODUCTS})
> -+              LIST(APPEND LIBRESSL_LIBRARIES_LIST "${LIBRESSL_INSTALL_D=
IR}/${BYPRODUCT}")
> -+      ENDFOREACH(BYPRODUCT)
> -+
> -       ExternalProject_Add(
> -       libressl-portable
> -       URL https://cdn.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.8.3.t=
ar.gz https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.8.3.tar.gz ht=
tps://gentoo.osuosl.org/distfiles/libressl-2.8.3.tar.gz
> -       URL_HASH "SHA256=3D9b640b13047182761a99ce3e4f000be9687566e0828b4a=
72709e9e6a3ef98477"
> -       SOURCE_DIR "${BINARY_DIR}/thirdparty/libressl-src"
> -+      PATCH_COMMAND ${PATCH}
> -       CMAKE_ARGS ${PASSTHROUGH_CMAKE_ARGS}
> -                               "-DCMAKE_INSTALL_PREFIX=3D${BINARY_DIR}/t=
hirdparty/libressl-install"
> -                               "-DLIBRESSL_APPS=3DOFF"
> -                               "-DLIBRESSL_TESTS=3DOFF"
> -                               "${BUILD_ARGS}"
> -+      BUILD_BYPRODUCTS ${LIBRESSL_LIBRARIES_LIST}
> -       )
> -
> -       add_library(crypto STATIC IMPORTED)
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-minifi-compile=
.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-minifi-compile.patch
> deleted file mode 100644
> index d5b4449b8..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/fix-minifi-compile.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -Upstream-Status: Pending
> -
> -diff -urN -x .git orig/CMakeLists.txt patched/CMakeLists.txt
> ---- orig/CMakeLists.txt        2020-08-07 21:58:34.656773928 +0900
> -+++ patched/CMakeLists.txt     2020-08-10 15:08:31.800278357 +0900
> -@@ -119,13 +119,28 @@
> -       endif()
> - endif()
> -
> -+include(CheckCXXSourceCompiles)
> -+CHECK_CXX_SOURCE_COMPILES("
> -+    #include <atomic>
> -+    int main(int argc, char **argv) {
> -+        uint8_t m;
> -+        __atomic_load_8(&m, 0);
> -+        __atomic_fetch_add_1(&m , 0, 0);
> -+        return 0;
> -+    }"
> -+    HAVE_ATOMIC
> -+)
> -+if(NOT HAVE_ATOMIC)
> -+    set(LIB_ATOMIC atomic)
> -+endif()
> -+
> - # Use ccache if present
> --find_program(CCACHE_FOUND ccache)
> --if(CCACHE_FOUND)
> --    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
> --    set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
> --    message("-- Found ccache: ${CCACHE_FOUND}")
> --endif(CCACHE_FOUND)
> -+#find_program(CCACHE_FOUND ccache)
> -+#if(CCACHE_FOUND)
> -+#    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
> -+#    set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
> -+#    message("-- Found ccache: ${CCACHE_FOUND}")
> -+#endif(CCACHE_FOUND)
> -
> - if (UNIX AND USE_GOLD_LINKER AND NOT APPLE )
> -   execute_process(COMMAND ${CMAKE_C_COMPILER} -fuse-ld=3Dgold -Wl,--ver=
sion ERROR_QUIET OUTPUT_VARIABLE ld_version)
> -@@ -303,8 +318,10 @@
> -     GIT_TAG "f3294d9d86e6a7915a967efff2842089b8b0d071"  # Version 7.64.=
0
> -     SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/thirdparty/curl-src"
> -     LIST_SEPARATOR % # This is needed for passing semicolon-separated l=
ists
> -+    TLS_VERIFY OFF
> -     CMAKE_ARGS ${PASSTHROUGH_CMAKE_ARGS}
> -                "-DCMAKE_INSTALL_PREFIX=3D${CMAKE_CURRENT_BINARY_DIR}/th=
irdparty/curl-install"
> -+               "-DCMAKE_INSTALL_LIBDIR=3Dlib${LIBSUFFIX}"
> -                 -DCMAKE_POSITION_INDEPENDENT_CODE=3DON
> -                 -DBUILD_CURL_EXE=3DOFF
> -                 -DBUILD_TESTING=3DOFF
> -diff -urN -x .git orig/libminifi/CMakeLists.txt patched/libminifi/CMakeL=
ists.txt
> ---- orig/libminifi/CMakeLists.txt      2020-08-07 21:58:34.676773928 +09=
00
> -+++ patched/libminifi/CMakeLists.txt   2020-08-10 15:06:17.124278642 +09=
00
> -@@ -108,6 +108,7 @@
> - add_library(spdlog STATIC ${SPD_SOURCES})
> - add_library(core-minifi STATIC ${SOURCES})
> - target_link_libraries(core-minifi ${CMAKE_DL_LIBS} yaml-cpp)
> -+target_link_libraries(core-minifi ${LIB_ATOMIC})
> -
> - #target_link_libraries(core-minifi  PRIVATE bsdiff )
> -
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-compi=
le.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-compile.p=
atch
> deleted file mode 100644
> index 903e72e07..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-compile.patc=
h
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -Upstream-Status: Pending
> -
> -diff -urN -x .git orig/cmake/BundledOSSPUUID.cmake patched/cmake/Bundled=
OSSPUUID.cmake
> ---- orig/cmake/BundledOSSPUUID.cmake   2020-08-07 21:58:34.660773928 +09=
00
> -+++ patched/cmake/BundledOSSPUUID.cmake        2020-08-07 22:05:57.40477=
2993 +0900
> -@@ -22,7 +22,9 @@
> -
> -     # Define patch step
> -     find_package(Patch REQUIRED)
> --    set(PC "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/ossp-=
uuid/ossp-uuid-mac-fix.patch")
> -+    set(PATCH1 "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/o=
ssp-uuid/ossp-uuid-mac-fix.patch")
> -+    set(PATCH2 "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/o=
ssp-uuid/ossp-uuid-cross-compile-fix.patch")
> -+    set(PATCH3 "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/o=
ssp-uuid/ossp-uuid-musl-compile-fix.patch")
> -
> -     # Define byproducts
> -     set(BYPRODUCTS "lib/libuuid.a"
> -@@ -35,7 +37,9 @@
> -     ENDFOREACH(BYPRODUCT)
> -
> -     # Build project
> --    set(CONFIGURE_COMMAND ./configure "CFLAGS=3D-fPIC" "CXXFLAGS=3D-fPI=
C" --with-cxx --without-perl --without-php --without-pgsql "--prefix=3D${BI=
NARY_DIR}/thirdparty/ossp-uuid-install")
> -+    set(CONFIGURE_COMMAND ac_cv_va_copy=3DC99 ./configure CFLAGS=3D-fPI=
C CXXFLAGS=3D-fPIC --host=3D${HOST_SYS}
> -+        --with-cxx --without-perl --without-php --without-pgsql
> -+        --prefix=3D${BINARY_DIR}/thirdparty/ossp-uuid-install)
> -     string(TOLOWER "${CMAKE_BUILD_TYPE}" build_type)
> -     if(NOT build_type MATCHES debug)
> -         list(APPEND CONFIGURE_COMMAND --enable-debug=3Dyes)
> -@@ -52,8 +56,8 @@
> -             UPDATE_COMMAND ""
> -             INSTALL_COMMAND make install
> -             BUILD_BYPRODUCTS ${OSSPUUID_LIBRARIES_LIST}
> --            CONFIGURE_COMMAND ""
> --            PATCH_COMMAND ${PC} && ${CONFIGURE_COMMAND}
> -+            CONFIGURE_COMMAND ${CONFIGURE_COMMAND}
> -+            PATCH_COMMAND ${PATCH1} && ${PATCH2} && ${PATCH3}
> -             STEP_TARGETS build
> -             EXCLUDE_FROM_ALL TRUE
> -     )
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-cross=
-compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-cro=
ss-compile.patch
> deleted file mode 100644
> index add1f6f2d..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-cross-compil=
e.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -Upstream-Status: Pending
> -
> -diff -urN -x .git orig/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.=
patch patched/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch
> ---- orig/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch        1=
970-01-01 09:00:00.000000000 +0900
> -+++ patched/thirdparty/ossp-uuid/ossp-uuid-cross-compile-fix.patch     2=
020-08-07 22:28:04.396770190 +0900
> -@@ -0,0 +1,33 @@
> -+diff -urN orig/config.sub patched/config.sub
> -+--- orig/config.sub   2008-07-05 06:43:08.000000000 +0900
> -++++ patched/config.sub        2020-08-07 22:23:48.412770731 +0900
> -+@@ -238,6 +238,8 @@
> -+      # Some are omitted here because they have special meanings below.
> -+      1750a | 580 \
> -+      | a29k \
> -++     | aarch64 | aarch64_be \
> -++     | riscv32 | riscv64 \
> -+      | alpha | alphaev[4-8] | alphaev56 | alphaev6[78] | alphapca5[67]=
 \
> -+      | alpha64 | alpha64ev[4-8] | alpha64ev56 | alpha64ev6[78] | alpha=
64pca5[67] \
> -+      | am33_2.0 \
> -+@@ -314,6 +316,8 @@
> -+      # Recognize the basic CPU types with company name.
> -+      580-* \
> -+      | a29k-* \
> -++     | aarch64-* | aarch64_be-* \
> -++     | riscv32-* | riscv64-* \
> -+      | alpha-* | alphaev[4-8]-* | alphaev56-* | alphaev6[78]-* \
> -+      | alpha64-* | alpha64ev[4-8]-* | alpha64ev56-* | alpha64ev6[78]-*=
 \
> -+      | alphapca5[67]-* | alpha64pca5[67]-* | arc-* \
> -+diff -urN orig/shtool patched/shtool
> -+--- orig/shtool       2008-07-05 06:43:08.000000000 +0900
> -++++ patched/shtool    2020-08-07 22:21:23.192771037 +0900
> -+@@ -1400,7 +1400,7 @@
> -+             if [ ".$opt_t" =3D .yes ]; then
> -+                 echo "strip $dsttmp" 1>&2
> -+             fi
> -+-            strip $dsttmp || shtool_exit $?
> -++            $STRIP $dsttmp || shtool_exit $?
> -+         fi
> -+         if [ ".$opt_o" !=3D . ]; then
> -+             if [ ".$opt_t" =3D .yes ]; then
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-musl-=
compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-musl=
-compile.patch
> deleted file mode 100644
> index f8ba89dc3..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/fix-osspuuid-musl-compile=
.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Upstream-Status: Pending
> -
> -diff -urN -x .git orig/thirdparty/ossp-uuid/ossp-uuid-musl-compile-fix.p=
atch patched/thirdparty/ossp-uuid/ossp-uuid-musl-compile-fix.patch
> ---- orig/thirdparty/ossp-uuid/ossp-uuid-musl-compile-fix.patch 1970-01-0=
1 09:00:00.000000000 +0900
> -+++ patched/thirdparty/ossp-uuid/ossp-uuid-musl-compile-fix.patch      2=
020-08-07 11:22:49.344854508 +0900
> -@@ -0,0 +1,21 @@
> -+diff -urN orig/config.sub patched/config.sub
> -+--- orig/config.sub   2008-07-05 06:43:08.000000000 +0900
> -++++ patched/config.sub        2020-08-07 11:19:25.948854937 +0900
> -+@@ -120,7 +120,7 @@
> -+ # Here we must recognize all the valid KERNEL-OS combinations.
> -+ maybe_os=3D`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\2/'`
> -+ case $maybe_os in
> -+-  nto-qnx* | linux-gnu* | linux-dietlibc | linux-newlib* | linux-uclib=
c* | \
> -++  nto-qnx* | linux-gnu* | linux-dietlibc | linux-newlib* | linux-uclib=
c* | linux-musl* | \
> -+   uclinux-uclibc* | uclinux-gnu* | kfreebsd*-gnu* | knetbsd*-gnu* | ne=
tbsd*-gnu* | \
> -+   storm-chaos* | os2-emx* | rtmk-nova*)
> -+     os=3D-$maybe_os
> -+@@ -1250,7 +1250,7 @@
> -+            | -udi* | -eabi* | -lites* | -ieee* | -go32* | -aux* \
> -+            | -chorusos* | -chorusrdb* \
> -+            | -cygwin* | -pe* | -psos* | -moss* | -proelf* | -rtems* \
> -+-           | -mingw32* | -linux-gnu* | -linux-newlib* | -linux-uclibc*=
 \
> -++           | -mingw32* | -linux-gnu* | -linux-newlib* | -linux-uclibc*=
 | -linux-musl* \
> -+            | -uxpv* | -beos* | -mpeix* | -udk* \
> -+            | -interix* | -uwin* | -mks* | -rhapsody* | -darwin* | -ope=
ned* \
> -+            | -openstep* | -oskit* | -conix* | -pw32* | -nonstopux* \
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-rocksdb-cross-=
compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-rocksdb-cross=
-compile.patch
> deleted file mode 100644
> index 0a3194da9..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/fix-rocksdb-cross-compile=
.patch
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -Upstream-Status: Pending
> -
> -diff -urN orig/thirdparty/rocksdb/CMakeLists.txt patched/thirdparty/rock=
sdb/CMakeLists.txt
> ---- orig/thirdparty/rocksdb/CMakeLists.txt     2020-07-28 11:39:40.25467=
7515 +0900
> -+++ patched/thirdparty/rocksdb/CMakeLists.txt  2020-07-28 11:51:11.89867=
6054 +0900
> -@@ -618,6 +618,7 @@
> - add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES})
> - target_link_libraries(${ROCKSDB_STATIC_LIB}
> -   ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
> -+target_link_libraries(${ROCKSDB_STATIC_LIB} ${LIB_ATOMIC})
> -
> - if(WIN32)
> - #  add_library(${ROCKSDB_IMPORT_LIB} SHARED ${SOURCES})
> -
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/minifi.service b/m=
eta-oe/recipes-extended/minifi-cpp/files/minifi.service
> deleted file mode 100644
> index 059cdbcc2..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/minifi.service
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -[Unit]
> -Description=3DMiNiFi Service
> -After=3Dnetwork.target
> -RequiresMountsFor=3D/var
> -
> -[Service]
> -Type=3Dsimple
> -WorkingDirectory=3D@LOCALSTATEDIR@/lib/minifi
> -Environment=3DMINIFI_HOME=3D@SYSCONFDIR@/minifi
> -ExecStart=3D@BINDIR@/minifi
> -
> -[Install]
> -WantedBy=3Dmulti-user.target
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/remove_const_due_t=
o_std_lock_guard.patch b/meta-oe/recipes-extended/minifi-cpp/files/remove_c=
onst_due_to_std_lock_guard.patch
> deleted file mode 100644
> index 365dec9d4..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/files/remove_const_due_to_std_l=
ock_guard.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From bfce136fa9ff1e955928539484ba4dd55f98f05b Mon Sep 17 00:00:00 2001
> -From: Willem Jan Withagen <wjw@digiware.nl>
> -Date: Sun, 16 Aug 2020 23:38:55 +0200
> -Subject: [PATCH] Update channel.h
> -
> -Compiling this on FreeBSD with CLang fails due to:
> -```In file included from /usr/ports/net/ceph15/work/ceph-15.2.4/src/rock=
sdb/utilities/backupable/backupable_db.cc:16:
> -/usr/ports/net/ceph15/work/ceph-15.2.4/src/rocksdb/util/channel.h:35:33:=
 error: no matching constructor for initialization of 'std::lock_guard<std:=
:mutex>'
> -    std::lock_guard<std::mutex> lk(lock_);
> -                                ^  ~~~~~
> -/usr/include/c++/v1/__mutex_base:90:14: note: candidate constructor not =
viable: 1st argument ('const std::mutex') would lose const qualifier
> -    explicit lock_guard(mutex_type& __m) _LIBCPP_THREAD_SAFETY_ANNOTATIO=
N(acquire_capability(__m))
> -             ^
> -/usr/include/c++/v1/__mutex_base:100:5: note: candidate constructor not =
viable: no known conversion from 'const std::mutex' to 'const std::__1::loc=
k_guard<std::__1::mutex>' for 1st argument
> -    lock_guard(lock_guard const&) _LIBCPP_EQUAL_DELETE;
> -    ^
> -/usr/include/c++/v1/__mutex_base:94:5: note: candidate constructor not v=
iable: requires 2 arguments, but 1 was provided
> -    lock_guard(mutex_type& __m, adopt_lock_t) _LIBCPP_THREAD_SAFETY_ANNO=
TATION(requires_capability(__m))
> -    ^
> -1 error generated.
> -```
> ----
> -Upstream-Status: Pending
> -
> - thirdparty/rocksdb/util/channel.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/thirdparty/rocksdb/util/channel.h b/thirdparty/rocksdb/util=
/channel.h
> -index 705fa2d28f..993bef5bc0 100644
> ---- a/thirdparty/rocksdb/util/channel.h
> -+++ b/thirdparty/rocksdb/util/channel.h
> -@@ -31,7 +31,7 @@ class channel {
> -     return buffer_.empty() && eof_;
> -   }
> -
> --  size_t size() const {
> -+  size_t size() {
> -     std::lock_guard<std::mutex> lk(lock_);
> -     return buffer_.size();
> -   }
> diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb b/m=
eta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
> new file mode 100644
> index 000000000..4c3773239
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.15.0.bb
> @@ -0,0 +1,199 @@
> +SUMMARY =3D "A subproject of Apache NiFi to collect data where it origin=
ates."
> +DESCRIPTION =3D "MiNiFi--a subproject of Apache NiFi--is a complementary=
 \
> +data collection approach that supplements the core tenets of NiFi in dat=
aflow \
> +management, focusing on the collection of data at the source of its crea=
tion."
> +HOMEPAGE =3D "https://nifi.apache.org/minifi/index.html"
> +SECTION =3D "console/network"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc62efdfb90a8aa4cc3bc15f56baa3=
0b7"
> +
> +SRC_URI =3D "git://github.com/apache/nifi-minifi-cpp.git;protocol=3Dhttp=
s;branch=3Dmain \
> +           git://github.com/martinmoene/expected-lite.git;protocol=3Dhtt=
ps;branch=3Dmaster;name=3Dexpected-lite;destsuffix=3D${S}/thirdparty/expect=
ed-lite-src \
> +           git://github.com/ericniebler/range-v3.git;protocol=3Dhttps;br=
anch=3Dmaster;name=3Drange-v3;destsuffix=3D${S}/thirdparty/range-v3-src \
> +           git://github.com/Neargye/magic_enum.git;protocol=3Dhttps;bran=
ch=3Dmaster;name=3Dmagic-enum;destsuffix=3D${S}/thirdparty/magic-enum-src \
> +           git://github.com/jarro2783/cxxopts.git;protocol=3Dhttps;branc=
h=3Dv2_2;name=3Dcxxopts;destsuffix=3D${S}/thirdparty/cxxopts-src \
> +           git://github.com/gsl-lite/gsl-lite.git;protocol=3Dhttps;branc=
h=3Dmaster;name=3Dgsl-lite;destsuffix=3D${S}/thirdparty/gsl-lite-src \
> +           git://github.com/HowardHinnant/date.git;protocol=3Dhttps;bran=
ch=3Dmaster;name=3Ddate;destsuffix=3D${S}/thirdparty/date-src \
> +           git://github.com/chriskohlhoff/asio.git;protocol=3Dhttps;bran=
ch=3Dmaster;name=3Dasio;destsuffix=3D${S}/thirdparty/asio-src \
> +           git://github.com/gabime/spdlog.git;protocol=3Dhttps;branch=3D=
v1.x;name=3Dspdlog;destsuffix=3D${S}/thirdparty/spdlog-src \
> +           git://github.com/civetweb/civetweb.git;protocol=3Dhttps;branc=
h=3Dmaster;name=3Dcivetweb;destsuffix=3D${S}/thirdparty/civetweb-src \
> +           ${DEBIAN_MIRROR}/main/o/ossp-uuid/ossp-uuid_1.6.2.orig.tar.gz=
;name=3Dossp-uuid;subdir=3D${S}/thirdparty \
> +           https://download.libsodium.org/libsodium/releases/libsodium-1=
.0.19.tar.gz;name=3Dlibsodium;subdir=3D${S}/thirdparty \
> +           file://0001-Do-not-use-bundled-packages.patch \
> +           file://0002-Fix-osspuuid-build.patch \
> +           file://0003-Fix-libsodium-build.patch \
> +           file://0004-Fix-spdlog-build.patch \
> +           file://0005-Pass-noline-flag-to-flex.patch \
> +           file://0006-OsUtils.h-add-missing-header-cstdint-for-int64_t.=
patch \
> +           file://systemd-volatile.conf \
> +           file://sysvinit-volatile.conf \
> +          "
> +
> +SRCREV =3D "9b55dc0c0f17a190f3e9ade87070a28faf542c25"
> +SRCREV_expected-lite =3D "c8ffab649ba56e43c731b7017a69ddaebe2e1893"
> +SRCREV_range-v3 =3D "a81477931a8aa2ad025c6bda0609f38e09e4d7ec"
> +SRCREV_magic-enum =3D "e1ea11a93d0bdf6aae415124ded6126220fa4f28"
> +SRCREV_cxxopts =3D "302302b30839505703d37fb82f536c53cf9172fa"
> +SRCREV_gsl-lite =3D "755ba124b54914e672737acace6a9314f59e8d6f"
> +SRCREV_date =3D "6e921e1b1d21e84a5c82416ba7ecd98e33a436d0"
> +SRCREV_asio =3D "814f67e730e154547aea3f4d99f709cbdf1ea4a0"
> +SRCREV_spdlog =3D "7c02e204c92545f869e2f04edaab1f19fe8b19fd"
> +SRCREV_civetweb =3D "d7ba35bbb649209c66e582d5a0244ba988a15159"
> +
> +SRCREV_FORMAT .=3D "_expected-lite_range-v3_magic-enum_cxxopts_gsl-lite_=
date_asio_spdlog_civetweb"
> +
> +SRC_URI[ossp-uuid.sha256sum] =3D "11a615225baa5f8bb686824423f50e4427acd3=
f70d394765bdff32801f0fd5b0"
> +SRC_URI[libsodium.sha256sum] =3D "018d79fe0a045cca07331d37bd0cb57b2e838c=
51bc48fd837a1472e50068bbea"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit pkgconfig cmake systemd
> +
> +DEPENDS =3D "virtual/crypt bison-native flex-native flex openssl curl zl=
ib xz bzip2 yaml-cpp"
> +
> +OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM =3D "BOTH"
> +
> +EXTRA_OECMAKE =3D " \
> +                 -DCMAKE_BUILD_TYPE=3DRelease \
> +                 -DHOST_SYS=3D${HOST_SYS} -DBUILD_SYS=3D${BUILD_SYS} \
> +                 -DGCC_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${AR} \
> +                 -DGCC_RANLIB=3D${STAGING_BINDIR_TOOLCHAIN}/${RANLIB} \
> +                 -DFLEX_TARGET_ARG_COMPILE_FLAGS=3D'--noline' \
> +                 -DBISON_TARGET_ARG_COMPILE_FLAGS=3D'--no-lines --file-p=
refix-map=3D${S}=3D${TARGET_DBGSRC_DIR}' \
> +                 -DENABLE_ENCRYPT_CONFIG=3DON \
> +                 -DENABLE_LUA_SCRIPTING=3DOFF \
> +                 -DENABLE_PYTHON_SCRIPTING=3DOFF \
> +                 -DENABLE_AWS=3DOFF \
> +                 -DENABLE_AZURE=3DOFF \
> +                 -DENABLE_GCP=3DOFF \
> +                 -DENABLE_KUBERNETES=3DOFF \
> +                 -DENABLE_MQTT=3DOFF \
> +                 -DENABLE_ELASTICSEARCH=3DOFF \
> +                 -DENABLE_SQL=3DOFF \
> +                 -DENABLE_PROMETHEUS=3DOFF \
> +                 -DENABLE_PROCFS=3DOFF \
> +                 -DENABLE_SPLUNK=3DOFF \
> +                 -DENABLE_OPC=3DOFF \
> +                 -DENABLE_LIBRDKAFKA=3DOFF \
> +                 -DDISABLE_CURL=3DOFF \
> +                 -DDISABLE_BZIP2=3DOFF \
> +                 -DDISABLE_LZMA=3DOFF \
> +                 -DDISABLE_JEMALLOC=3DON \
> +                 -DSKIP_TESTS=3DON \
> +                 -DFETCHCONTENT_SOURCE_DIR_GSL-LITE=3D${S}/thirdparty/gs=
l-lite-src \
> +                 -DFETCHCONTENT_SOURCE_DIR_DATE_SRC=3D${S}/thirdparty/da=
te-src \
> +                 -DFETCHCONTENT_SOURCE_DIR_EXPECTED-LITE=3D${S}/thirdpar=
ty/expected-lite-src \
> +                 -DFETCHCONTENT_SOURCE_DIR_RANGE-V3_SRC=3D${S}/thirdpart=
y/range-v3-src \
> +                 -DFETCHCONTENT_SOURCE_DIR_MAGIC_ENUM=3D${S}/thirdparty/=
magic-enum-src \
> +                 -DFETCHCONTENT_SOURCE_DIR_ASIO=3D${S}/thirdparty/asio-s=
rc \
> +                 -DFETCHCONTENT_SOURCE_DIR_CXXOPTS_SRC=3D${S}/thirdparty=
/cxxopts-src \
> +                 -DFETCHCONTENT_SOURCE_DIR_CIVETWEB=3D${S}/thirdparty/ci=
vetweb-src \
> +                 ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-DE=
NABLE_SYSTEMD=3DON', '-DENABLE_SYSTEMD=3DOFF', d)} \
> +                "
> +
> +PACKAGECONFIG ??=3D "civetweb libarchive rocksdb expression-language"
> +PACKAGECONFIG[civetweb] =3D "-DDISABLE_CIVET=3DOFF,-DDISABLE_CIVET=3DON"
> +PACKAGECONFIG[openwsman] =3D "-DENABLE_OPENWSMAN=3DON,-DENABLE_OPENWSMAN=
=3DOFF,libxml2"
> +PACKAGECONFIG[libarchive] =3D "-DDISABLE_LIBARCHIVE=3DOFF,-DDISABLE_LIBA=
RCHIVE=3DON,libarchive"
> +PACKAGECONFIG[rocksdb] =3D "-DDISABLE_ROCKSDB=3DOFF -DBUILD_ROCKSDB=3DOF=
F,-DDISABLE_ROCKSDB=3DON,rocksdb"
> +PACKAGECONFIG[expression-language] =3D "-DDISABLE_EXPRESSION_LANGUAGE=3D=
OFF, -DDISABLE_EXPRESSION_LANGUAGE=3DON"
> +
> +SYSTEMD_PACKAGES =3D "minifi-cpp"
> +SYSTEMD_SERVICE:${PN} =3D "minifi.service"
> +SYSTEMD_AUTO_ENABLE =3D "disable"
> +
> +do_install[cleandirs] +=3D "${WORKDIR}/minifi-install"
> +PSEUDO_CONSIDER_PATHS .=3D ",${WORKDIR}/minifi-install"
> +
> +do_compile:prepend() {
> +    # Remove build host references
> +    sed -i -e 's,--sysroot=3D${STAGING_DIR_TARGET},,g' \
> +        -e 's|${DEBUG_PREFIX_MAP}||g' \
> +        -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
> +        ${B}/libminifi/agent_version.cpp
> +}
> +
> +do_install() {
> +    DESTDIR=3D'${WORKDIR}/minifi-install' cmake_runcmake_build --target =
${OECMAKE_TARGET_INSTALL}
> +    MINIFI_BIN=3D${bindir}
> +    MINIFI_HOME=3D${sysconfdir}/minifi
> +    MINIFI_RUN=3D${localstatedir}/lib/minifi
> +    MINIFI_LOG=3D${localstatedir}/log/minifi
> +
> +    install -m 755 -d ${D}${MINIFI_BIN}
> +    install -m 755 -d ${D}${MINIFI_HOME}/conf
> +    install -m 755 -d ${D}${localstatedir}/lib/minifi
> +
> +    for i in encrypt-config minifi minifi.sh minificontroller; do
> +        install -m 755 ${WORKDIR}/minifi-install/usr/bin/${i} ${D}${MINI=
FI_BIN}
> +    done
> +    for i in config.yml minifi-log.properties minifi.properties minifi-u=
id.properties; do
> +        install -m 644 ${WORKDIR}/minifi-install/usr/conf/${i} ${D}${MIN=
IFI_HOME}/conf
> +    done
> +
> +    install -m 755 -d ${D}${libdir}/minifi-extensions
> +    install -m 755 ${WORKDIR}/minifi-install/usr/bin/libcore-minifi.so $=
{D}${libdir}
> +    install -m 755 ${WORKDIR}/minifi-install/usr/extensions/*.so ${D}${l=
ibdir}/minifi-extensions
> +
> +    install -m 755 -d ${D}${libexecdir}/minifi-python
> +    for i in examples google h2o; do
> +        cp -rf ${WORKDIR}/minifi-install/usr/minifi-python/${i} ${D}${li=
bexecdir}/minifi-python
> +    done
> +
> +    sed -i "s|MINIFI_HOME=3D.*|MINIFI_HOME=3D${MINIFI_HOME}|g" ${D}${MIN=
IFI_BIN}/minifi.sh
> +    sed -i "s|bin_dir=3D.*|bin_dir=3D${MINIFI_BIN}|g" ${D}${MINIFI_BIN}/=
minifi.sh
> +
> +    sed -i "s|#appender.rolling.directory=3D.*|appender.rolling.director=
y=3D${MINIFI_LOG}|g" \
> +        ${D}${MINIFI_HOME}/conf/minifi-log.properties
> +    sed -i "s|nifi.provenance.repository.directory.default=3D.*|nifi.pro=
venance.repository.directory.default=3D${MINIFI_RUN}/provenance_repository|=
g" \
> +        ${D}${MINIFI_HOME}/conf/minifi.properties
> +    sed -i "s|nifi.flowfile.repository.directory.default=3D.*|nifi.flowf=
ile.repository.directory.default=3D${MINIFI_RUN}/flowfile_repository|g" \
> +        ${D}${MINIFI_HOME}/conf/minifi.properties
> +    sed -i "s|nifi.database.content.repository.directory.default=3D.*|ni=
fi.database.content.repository.directory.default=3D${MINIFI_RUN}/content_re=
pository|g" \
> +        ${D}${MINIFI_HOME}/conf/minifi.properties
> +    sed -i "s|nifi.flow.configuration.file=3D.*|nifi.flow.configuration.=
file=3D${MINIFI_HOME}/conf/config.yml|g" \
> +        ${D}${MINIFI_HOME}/conf/minifi.properties
> +    sed -i "s|nifi.python.processor.dir=3D.*|nifi.python.processor.dir=
=3D${libexecdir}/minifi-python|g" \
> +        ${D}${MINIFI_HOME}/conf/minifi.properties
> +    sed -i "s|nifi.extension.path=3D.*|nifi.extension.path=3D${libdir}/m=
inifi-extensions/*|g" \
> +        ${D}${MINIFI_HOME}/conf/minifi.properties
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d=
)}; then
> +        install -m 755 -d ${D}${sysconfdir}/tmpfiles.d
> +        install -m 644 ${WORKDIR}/systemd-volatile.conf ${D}${sysconfdir=
}/tmpfiles.d/minifi.conf
> +        sed -i "s|@MINIFI_LOG@|${MINIFI_LOG}|g" ${D}${sysconfdir}/tmpfil=
es.d/minifi.conf
> +
> +        install -m 755 -d ${D}${systemd_system_unitdir}
> +        install -m 644 ${WORKDIR}/minifi-install/usr/bin/minifi.service =
${D}${systemd_system_unitdir}
> +
> +        sed -i -e "s|^Environment=3D.*|Environment=3DMINIFI_HOME=3D${MIN=
IFI_HOME}|g" ${D}${systemd_system_unitdir}/minifi.service
> +        sed -i -e "s|^ExecStart=3D.*|ExecStart=3D${MINIFI_BIN}/minifi|g"=
 ${D}${systemd_system_unitdir}/minifi.service
> +    fi
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'fals=
e', d)}; then
> +        install -d ${D}${sysconfdir}/default/volatiles
> +        install -m 0644 ${WORKDIR}/sysvinit-volatile.conf ${D}${sysconfd=
ir}/default/volatiles/99_minifi
> +
> +        sed -i "s|@MINIFI_LOG@|${MINIFI_LOG}|g" ${D}${sysconfdir}/defaul=
t/volatiles/99_minifi
> +    fi
> +}
> +
> +pkg_postinst:${PN}() {
> +    if [ -z "$D" ]; then
> +        if type systemd-tmpfiles >/dev/null; then
> +            systemd-tmpfiles --create
> +        elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
> +            ${sysconfdir}/init.d/populate-volatile.sh update
> +        fi
> +    fi
> +}
> +
> +FILES:${PN}-dev =3D ""
> +FILES:${PN} +=3D "${libdir}/libcore-minifi.so \
> +                ${libdir}/minifi-extensions \
> +                ${libexecdir}/minifi-python \
> +               "
> +
> +INSANE_SKIP:${PN} +=3D "dev-deps"
> +
> +CLEANBROKEN =3D "1"
> diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/me=
ta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
> deleted file mode 100644
> index 5059b6321..000000000
> --- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
> +++ /dev/null
> @@ -1,169 +0,0 @@
> -SUMMARY =3D "A subproject of Apache NiFi to collect data where it origin=
ates."
> -DESCRIPTION =3D "MiNiFi--a subproject of Apache NiFi--is a complementary=
 \
> -data collection approach that supplements the core tenets of NiFi in dat=
aflow \
> -management, focusing on the collection of data at the source of its crea=
tion."
> -HOMEPAGE =3D "https://nifi.apache.org/minifi/index.html"
> -SECTION =3D "console/network"
> -LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df9534eb5f4ab800b573a37bffc62f=
3a7"
> -
> -DEPENDS =3D "virtual/crypt expat flex python3 bison-native libxml2 nettl=
e lz4"
> -RDEPENDS:${PN} =3D "python3-core"
> -
> -SRCREV =3D "aa42957a2e227df41510047cece3cd606dc1cb6a"
> -SRC_URI =3D "git://github.com/apache/nifi-minifi-cpp.git;branch=3Dmaster=
;protocol=3Dhttps \
> -            https://curl.haxx.se/download/curl-7.64.0.tar.bz2;name=3Dcur=
l;subdir=3Dgit/thirdparty \
> -            https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.8.3.=
tar.gz;name=3Dlibressl;subdir=3Dgit/thirdparty \
> -            ${DEBIAN_MIRROR}/main/o/ossp-uuid/ossp-uuid_1.6.2.orig.tar.g=
z;name=3Dossp-uuid;subdir=3Dgit/thirdparty \
> -            file://fix-minifi-compile.patch \
> -            file://fix-libressl-compile.patch \
> -            file://fix-libressl-avoid-BSWAP-assembly-for-ARM-v6.patch \
> -            file://fix-osspuuid-compile.patch \
> -            file://fix-osspuuid-cross-compile.patch \
> -            file://fix-osspuuid-musl-compile.patch \
> -            file://fix-rocksdb-cross-compile.patch \
> -            file://remove_const_due_to_std_lock_guard.patch \
> -            file://0001-Add-lxml2-to-linker-cmdline-of-xml-is-found.patc=
h \
> -            file://0001-CMakeLists.txt-use-curl-local-source-tarball.pat=
ch \
> -            file://0002-cmake-LibreSSL.cmake-use-libressl-local-source-t=
arba.patch \
> -            file://0003-cmake-BundledOSSPUUID.cmake-use-ossp-uuid-local-=
sour.patch \
> -            file://0001-civetweb-CMakeLists.txt-do-not-search-gcc-ar-and=
-gcc.patch \
> -            file://0001-cxxopts-Add-limits-header.patch \
> -            file://0001-Fix-build-with-libc.patch \
> -            file://0001-civetweb-Disable-lto.patch \
> -            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
> -            file://0001-Do-not-use-LFS64-functions-on-linux-musl.patch \
> -            file://0001-Fix-the-constness-issues-around-autovector-itera=
tor_.patch \
> -            file://0002-Fix-build-with-clang-17.patch \
> -            file://0001-CMakeLists.txt-Pass-the-OPENSSLDIR.patch \
> -            file://0001-BundledOSSPUUID.cmake-Pass-CFLAGS-to-compiler.pa=
tch \
> -            file://minifi.service \
> -            file://systemd-volatile.conf \
> -            file://sysvinit-volatile.conf \
> -            file://0001-config.guess-Support-build-on-aarch64.patch \
> -            "
> -
> -SRC_URI[curl.md5sum] =3D "d0bcc586873cfef08b4b9594e5395a33"
> -SRC_URI[curl.sha256sum] =3D "d573ba1c2d1cf9d8533fadcce480d778417964e8d04=
ccddcc76e591d544cf2eb"
> -SRC_URI[libressl.md5sum] =3D "0f1127bd21b4aa8495a910379c2ad936"
> -SRC_URI[libressl.sha256sum] =3D "9b640b13047182761a99ce3e4f000be9687566e=
0828b4a72709e9e6a3ef98477"
> -SRC_URI[ossp-uuid.md5sum] =3D "5db0d43a9022a6ebbbc25337ae28942f"
> -SRC_URI[ossp-uuid.sha256sum] =3D "11a615225baa5f8bb686824423f50e4427acd3=
f70d394765bdff32801f0fd5b0"
> -
> -S =3D "${WORKDIR}/git"
> -
> -inherit pkgconfig cmake systemd
> -
> -SYSTEMD_PACKAGES =3D "minifi-cpp"
> -SYSTEMD_SERVICE:${PN} =3D "minifi.service"
> -SYSTEMD_AUTO_ENABLE =3D "disable"
> -
> -OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM =3D "BOTH"
> -
> -EXTRA_OECMAKE +=3D " \
> -    -DHOST_SYS=3D${HOST_SYS} -DBUILD_SYS=3D${BUILD_SYS} \
> -    -DSKIP_TESTS=3DON \
> -    -DGCC_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${AR} \
> -    -DGCC_RANLIB=3D${STAGING_BINDIR_TOOLCHAIN}/${RANLIB} \
> -    -DDISABLE_PYTHON_SCRIPTING=3DON \
> -    -DFLEX_TARGET_ARG_COMPILE_FLAGS=3D'--noline' \
> -    -DBISON_TARGET_ARG_COMPILE_FLAGS=3D'--no-lines --file-prefix-map=3D$=
{S}=3D${TARGET_DBGSRC_DIR}' \
> -    -DOPENSSLDIR=3D${sysconfdir}/libressl \
> -    "
> -
> -CFLAGS:append =3D " -fPIC"
> -EXTRA_OECMAKE:append:toolchain-clang =3D " -DCMAKE_RANLIB=3D${STAGING_BI=
NDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib"
> -LDFLAGS:append:toolchain-clang =3D " -fuse-ld=3Dlld"
> -
> -# RV lld errors out:
> -# riscv64-yoe-linux-ld.lld: error: init.c:(.text+0x0): relocation R_RISC=
V_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax
> -LDFLAGS:remove:riscv32 =3D "-fuse-ld=3Dlld"
> -LDFLAGS:remove:riscv64 =3D "-fuse-ld=3Dlld"
> -
> -# There are endian issues when communicating with the x86 nifi on the th=
e mips and the ppc machines.
> -COMPATIBLE_MACHINE:mips =3D "(!.*mips).*"
> -COMPATIBLE_MACHINE:mips64 =3D "(!.*mips64).*"
> -COMPATIBLE_MACHINE:powerpc =3D "(!.*ppc).*"
> -
> -TARGET_CFLAGS:append:riscv32 =3D " -fpic"
> -TARGET_CXXFLAGS:append:riscv32 =3D " -fpic"
> -TARGET_CFLAGS:append:riscv64 =3D " -fpic"
> -TARGET_CXXFLAGS:append:riscv64 =3D " -fpic"
> -
> -do_install[cleandirs] +=3D "${WORKDIR}/minifi-install"
> -PSEUDO_CONSIDER_PATHS .=3D ",${WORKDIR}/minifi-install"
> -
> -do_configure:prepend:libc-musl() {
> -    sed -i -e 's/-DHAVE_GLIBC_STRERROR_R=3D1/-DHAVE_GLIBC_STRERROR_R=3D0=
/' ${S}/CMakeLists.txt
> -    sed -i -e 's/-DHAVE_POSIX_STRERROR_R=3D0/-DHAVE_POSIX_STRERROR_R=3D1=
/' ${S}/CMakeLists.txt
> -}
> -
> -do_configure:append() {
> -    sed -i -e 's|${WORKDIR}|<WORKDIR>|g' ${S}/libminifi/include/agent/ag=
ent_version.h
> -}
> -
> -CFLAGS:append:libc-glibc =3D " -D_GNU_SOURCE"
> -CXXFLAGS:append:libc-glibc =3D " -D_GNU_SOURCE"
> -
> -do_install() {
> -    DESTDIR=3D'${WORKDIR}/minifi-install' cmake_runcmake_build --target =
${OECMAKE_TARGET_INSTALL}
> -    MINIFI_BIN=3D${bindir}
> -    MINIFI_HOME=3D${sysconfdir}/minifi
> -    MINIFI_RUN=3D${localstatedir}/lib/minifi
> -    MINIFI_LOG=3D${localstatedir}/log/minifi
> -
> -    install -d ${D}${MINIFI_BIN}
> -    install -d ${D}${MINIFI_HOME}/conf
> -    install -m 755 -d ${D}${localstatedir}/lib/minifi
> -    install -m 755 -d ${D}${libexecdir}/minifi-python
> -    cp -a ${WORKDIR}/minifi-install/usr/bin/*   ${D}${MINIFI_BIN}/
> -    cp -a ${WORKDIR}/minifi-install/usr/conf/*  ${D}${MINIFI_HOME}/conf/
> -
> -    sed -i 's|#appender.rolling.directory=3D.*|appender.rolling.director=
y=3D'${MINIFI_LOG}'|g' \
> -        ${D}${MINIFI_HOME}/conf/minifi-log.properties
> -    sed -i 's|nifi.provenance.repository.directory.default=3D.*|nifi.pro=
venance.repository.directory.default=3D'${MINIFI_RUN}'/provenance_repositor=
y|g' \
> -        ${D}${MINIFI_HOME}/conf/minifi.properties
> -    sed -i 's|nifi.flowfile.repository.directory.default=3D.*|nifi.flowf=
ile.repository.directory.default=3D'${MINIFI_RUN}'/flowfile_repository|g' \
> -        ${D}${MINIFI_HOME}/conf/minifi.properties
> -    sed -i 's|nifi.database.content.repository.directory.default=3D.*|ni=
fi.database.content.repository.directory.default=3D'${MINIFI_RUN}'/content_=
repository|g' \
> -        ${D}${MINIFI_HOME}/conf/minifi.properties
> -    sed -i 's|nifi.flow.configuration.file=3D.*|nifi.flow.configuration.=
file=3D'${MINIFI_HOME}'/conf/config.yml|g' \
> -        ${D}${MINIFI_HOME}/conf/minifi.properties
> -    sed -i 's|nifi.python.processor.dir=3D.*|nifi.python.processor.dir=
=3D${libexecdir}/minifi-python|g' \
> -        ${D}${MINIFI_HOME}/conf/minifi.properties
> -
> -    sed -i 's|export MINIFI_HOME=3D.*|export MINIFI_HOME=3D'${MINIFI_HOM=
E}'|g' ${D}${MINIFI_BIN}/minifi.sh
> -    sed -i 's|bin_dir=3D${MINIFI_HOME}/bin|bin_dir=3D'${MINIFI_BIN}'|g' =
${D}${MINIFI_BIN}/minifi.sh
> -    sed -i 's|pid_file=3D${bin_dir}/.|pid_file=3D'${localstatedir}/run/'=
|g' ${D}${MINIFI_BIN}/minifi.sh
> -
> -    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d=
)}; then
> -        install -d ${D}${sysconfdir}/tmpfiles.d/
> -        install -m 0644 ${WORKDIR}/systemd-volatile.conf ${D}${sysconfdi=
r}/tmpfiles.d/minifi.conf
> -        install -m 0755 -d ${D}${systemd_unitdir}/system
> -        install -m 0644 ${WORKDIR}/minifi.service ${D}${systemd_unitdir}=
/system/
> -
> -        sed -i 's|@LOCALSTATEDIR@|${localstatedir}|g' ${D}${systemd_unit=
dir}/system/minifi.service
> -        sed -i 's|@SYSCONFDIR@|${sysconfdir}|g' ${D}${systemd_unitdir}/s=
ystem/minifi.service
> -        sed -i 's|@BINDIR@|${bindir}|g' ${D}${systemd_unitdir}/system/mi=
nifi.service
> -
> -        sed -i 's|@MINIFI_LOG@|'${MINIFI_LOG}'|g' ${D}${sysconfdir}/tmpf=
iles.d/minifi.conf
> -
> -    elif ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'fa=
lse', d)}; then
> -        install -d ${D}${sysconfdir}/default/volatiles
> -        install -m 0644 ${WORKDIR}/sysvinit-volatile.conf ${D}${sysconfd=
ir}/default/volatiles/99_minifi
> -
> -        sed -i 's|@MINIFI_LOG@|'${MINIFI_LOG}'|g' ${D}${sysconfdir}/defa=
ult/volatiles/99_minifi
> -    fi
> -}
> -
> -pkg_postinst:${PN}() {
> -    if [ -z "$D" ]; then
> -        if type systemd-tmpfiles >/dev/null; then
> -            systemd-tmpfiles --create
> -        elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
> -            ${sysconfdir}/init.d/populate-volatile.sh update
> -        fi
> -    fi
> -}
> -
> -CLEANBROKEN =3D "1"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109485): https://lists.openembedded.org/g/openembedde=
d-devel/message/109485
> Mute This Topic: https://lists.openembedded.org/mt/105041010/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

