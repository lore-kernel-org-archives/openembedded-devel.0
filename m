Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70E8109022B
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 13:53:00 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11511.1773928370491083446
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 06:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Unstl6G6;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: skandigraun@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38bd15d82bdso7328851fa.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 06:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773928369; x=1774533169; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uJ0oF++EwkxkIhmfHVuDNWloM4a7v9YcOPSgYWWgoVA=;
        b=Unstl6G6/jHRtq1w4rDFoswW28WYLSPWw4+DBMWEK+zPsM2htiuO1VG+ZIDUE0cdze
         +piL0yrQEoOtb5QRS6Kamj9VRrgOca/fcuqUPz0h38+YqOSXEPJlc8IjKlxIYrKrpSaW
         EjOyj4rb9i/Ja4+4BkMI0YVBALv85CsS79BAi33mU35A5W0Kd7XkHJmfa/aAelCtUGdR
         GrNZGC6WQJoZd6I5PeApKWaKVNMhSns9yGWl8hV+NVirl7CN4cFraqJ1Ko6X0LxzHwuw
         2biCzwrp5LbwrDOnOYu4VZsoUUjxQHQNwV2+Mhxu2cNPK6I7YGJp2U4jxP/gw8Lj4GDz
         5eRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773928369; x=1774533169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJ0oF++EwkxkIhmfHVuDNWloM4a7v9YcOPSgYWWgoVA=;
        b=mpmeZzG7VnR3vFkl78tpcIFZvJJ9ddgVc2K+TVWXsYCSia7MYxpgt5TS665/WR9nOr
         2qwNJ9O1pkTR4t6qctQLUoXyK/d/tbMV9q9Qm9Sbmevsvl7Ptbb1E7fbjqPThT4nFbzj
         RnI8a5arfaVna1eYvl3nXYHUlMMuXi4Tz9ECmhD5P5ro4UKK35C1CtZTyFwb3UZDtc4U
         Klaeku9s5vMDvtdSL6g/BoObQFNoPQ49RKUPm3WZ3E5rrBXOB/yQl+cPTovXAVj48im7
         3riefT9H5jfRuFBiZQ2cOn+6VrgLxri9tRlNBFggk6Nj9HtFXZkOtXmQfjrNUtS+iWvB
         GVLw==
X-Gm-Message-State: AOJu0Yy/7LzUTSQOo+0iGTk/OH14cdsOwyS95hBHY3U3anzK/FmxGUOu
	iEluEPLN/DYNc9/bJoF2L4/6Q07Iz1TtOT9xCMM0X8Ew/l/YyIkjFkUj
X-Gm-Gg: ATEYQzxQNx3lRag4RZVCoHmY+JKjAMTuwd7vy6oNBoD9yEzZoFRX+0pOx0UNUi7jzy0
	KhH5+cRGXsZD+UePOExBSVxOJieXVlK50KVM1V/RebNd3jXeyukaFwUPeEY4H/h9LBbgFfk52cz
	Cri00zYLYQ5SU3Z5l//x51w0lD0esmpQwVm7QrspnEg+000gdWEP2NMktrZ0eSlP22Vcl63Gm3V
	IOoCqVdyCxONtTXW92mIIr2j8FWC9+4kVN08uF2qp6lykap4DyNQgCZavo/eQQdqSssNTE30zPe
	JqimEVWikvelSlOzNyHFlJFSMozlOsH4W8gf91tOeGFq8ElmR8i9oZL35zUM+xX+4apEO5YXBn/
	i8znwew7W18pipAwt0qTRxuYDmWgfalX1h+rLv2PKS1Enk2+JNwIV5lyGiuK21Vl1OriZ7PLPBI
	85ScTg6+64DP08Gk4Q2FhLBpZucJgzWZ8=
X-Received: by 2002:a2e:bc08:0:b0:38b:dae9:87ee with SMTP id 38308e7fff4ca-38bdae98945mr25303661fa.36.1773928367991;
        Thu, 19 Mar 2026 06:52:47 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd54bc645sm11498311fa.30.2026.03.19.06.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 06:52:47 -0700 (PDT)
Message-ID: <6469a907-d93c-45ca-afb6-f0ed3220775c@gmail.com>
Date: Thu, 19 Mar 2026 14:52:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][PATCH] sysdig: upgrade 0.28.0 -> 0.39.0
To: liuyd.fnst@fujitsu.com, Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20260313032649.4383-1-liuyd.fnst@fujitsu.com>
 <CAMKF1spaPcV+r8EMNrwiJCWhB9-YbG2c6=Vdsztw2vR9-oLLTw@mail.gmail.com>
 <OS7PR01MB144441C4000FF5BABC2824D779B4FA@OS7PR01MB14444.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <OS7PR01MB144441C4000FF5BABC2824D779B4FA@OS7PR01MB14444.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 13:53:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125402

On 3/19/26 07:54, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
> Hi Khem
>    There is no build fail on my environment.
>    I use the default local.conf with target qemux86-64, and oe-core,
> meta-oe is the latest commit.
> Build Configuration:
> BB_VERSION           = "2.16.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "x86_64-poky-linux"
> MACHINE              = "qemux86-64"
> SDKMACHINE           = "x86_64"
> DISTRO               = "poky"
> DISTRO_VERSION       =
> "5.3.99+snapshot-71c5fd2bbdeb00b4200b3b94627ce43500b6b081"
> TUNE_FEATURES        = "m64 x86-64-v3"
> meta                 = "master:71c5fd2bbdeb00b4200b3b94627ce43500b6b081"
> meta-poky
> meta-yocto-bsp       = "master:31e68c7cf6a3686bedbcbdd99056bbd23dda2551"
> meta-oe
> meta-filesystems
> meta-networking
> meta-python
> meta-webserver
> meta-perl
> meta-gnome
> meta-multimedia      = "master:f8936cc03a5d69ea3ea2788309f06903da5eecdd" 
> 
>    So I want to ensure the difference from AB environment to check the
> issue further.
> 

Something doesn't look right with this recipe/application, it seems to
break out of the sandbox(?)

I can build it successfully too, without a problem, but look at these
do_config logs[1] - it not only tries to download things from the
internet, it even succeeds?!
The recipe doesn't have network enabled.

[1]:
https://gist.github.com/OldManYellsAtCloud/511fdbe5a9c185d98f7e4419b0997d2f


> Liu
> ------------------------------------------------------------------------
> *发件人:* Khem Raj <raj.khem@gmail.com>
> *发送时间:* 2026年3月19日 05:33
> *收件人:* Liu, Yiding/刘 乙丁 <liuyd.fnst@fujitsu.com>
> *抄送:* openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org>
> *主题:* Re: [oe][meta-oe][PATCH] sysdig: upgrade 0.28.0 -> 0.39.0
>  
> This is failing to build on AB see
> 
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5867932/
> raw_inline <https://autobuilder.yoctoproject.org/valkyrie/api/v2/
> logs/5867932/raw_inline>
> 
> On Thu, Mar 12, 2026 at 8:26 PM Yiding Liu (Fujitsu) via
> lists.openembedded.org <http://
> lists.openembedded.org> <liuyd.fnst=fujitsu.com@lists.openembedded.org
> <mailto:fujitsu.com@lists.openembedded.org>> wrote:
> 
>     Upgrade sysdig to solve build failure after upgrading valijson to 1.1.0.
> 
>     1.Changelog
>       https://github.com/draios/sysdig/releases/tag/0.39.0 <https://
>     github.com/draios/sysdig/releases/tag/0.39.0>
> 
>     2.Update 0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch for 0.39.0
> 
>     3.Remove following patches as merged upstream
>       0001-Add-cstdint-for-uintXX_t-types.patch
>       0001-libsinsp-fix-build-with-gcc-15.patch
> 
>     4.Add 0001-Avoid-duplicate-operations-of-add_library.patch to fix
>     do_configure errors
>       -- Existing strlcat found, will *not* use local definition
>       CMake Error at falcosecurity-libs/userspace/libscap/
>     CMakeLists.txt:64 (add_library):
>         add_library cannot create target "scap_error" because another
>     target with
>         the same name already exists.  The existing target is a static
>     library
> 
>     5.Add CMAKE option -DBUILD_SYSDIG_MODERN_BPF=OFF to fix bpf header
>     file not found issue
>       sysdig/0.39.0/recipe-sysroot/usr/include/bits/syscall.h:23:10:
>     fatal error: 'bits/syscall-32.h' file not found
>       |    23 | #include <bits/syscall-32.h>
> 
>     6.Add do_configure:prepend() function and CFLAGS/CXXFLAGS to fix
>     header file not found issue
>       sysdig/0.39.0/sources/sysdig-0.39.0/falcosecurity-libs/userspace/
>     libscap/engine/kmod/scap_kmod.c:30:10: fatal error: driver_config.h:
>     No such file or directory
>       |    30 | #include <driver_config.h>
> 
>     7.Add do_compile:append() function to fix do_package QA Issue
> 
>     Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com
>     <mailto:liuyd.fnst@fujitsu.com>>
>     ---
>      .../0001-Add-cstdint-for-uintXX_t-types.patch | 38 ---------------
>      ...-duplicate-operations-of-add_library.patch | 47 +++++++++++++++++++
>      ...001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch | 21 +++++----
>      .../0001-libsinsp-fix-build-with-gcc-15.patch | 31 ------------
>      .../{sysdig_0.28.0.bb <http://sysdig_0.28.0.bb> => sysdig_0.39.0.bb
>     <http://sysdig_0.39.0.bb>}    | 43 ++++++++++++++---
>      5 files changed, 95 insertions(+), 85 deletions(-)
>      delete mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-Add-
>     cstdint-for-uintXX_t-types.patch
>      create mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-
>     Avoid-duplicate-operations-of-add_library.patch
>      delete mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-
>     libsinsp-fix-build-with-gcc-15.patch
>      rename meta-oe/recipes-extended/sysdig/{sysdig_0.28.0.bb <http://
>     sysdig_0.28.0.bb> => sysdig_0.39.0.bb <http://sysdig_0.39.0.bb>} (56%)
> 
>     diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-Add-
>     cstdint-for-uintXX_t-types.patch b/meta-oe/recipes-extended/sysdig/
>     sysdig/0001-Add-cstdint-for-uintXX_t-types.patch
>     deleted file mode 100644
>     index e564958dad..0000000000
>     --- a/meta-oe/recipes-extended/sysdig/sysdig/0001-Add-cstdint-for-
>     uintXX_t-types.patch
>     +++ /dev/null
>     @@ -1,38 +0,0 @@
>     -From 3d076ea588eb3c7f334133b4c31172a14beadf5b Mon Sep 17 00:00:00 2001
>     -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     -Date: Thu, 2 Feb 2023 20:18:27 -0800
>     -Subject: [PATCH] Add <cstdint> for uintXX_t types
>     -
>     -gcc 13 moved some includes around and as a result <cstdint> is no
>     -longer transitively included [1]. Explicitly include it
>     -for uintXX_t.
>     -
>     -[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
>     <https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes>
>     -
>     -Upstream-Status: Submitted [https://github.com/falcosecurity/libs/
>     pull/862 <https://github.com/falcosecurity/libs/pull/862>]
>     -Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     ----
>     - userspace/libsinsp/filter/parser.h | 1 +
>     - userspace/libsinsp/filter_value.h  | 1 +
>     - 2 files changed, 2 insertions(+)
>     -
>     ---- a/userspace/libsinsp/filter/parser.h
>     -+++ b/userspace/libsinsp/filter/parser.h
>     -@@ -18,6 +18,7 @@ limitations under the License.
>     - #pragma once
>     -
>     - #include "ast.h"
>     -+#include <cstdint>
>     -
>     - //
>     - // Context-free Grammar for Sinsp Filters
>     ---- a/userspace/libsinsp/filter_value.h
>     -+++ b/userspace/libsinsp/filter_value.h
>     -@@ -18,6 +18,7 @@ limitations under the License.
>     - #pragma once
>     -
>     - #include <string.h>
>     -+#include <cstdint>
>     - #include <utility>
>     -
>     - // Used for CO_IN/CO_PMATCH filterchecks using PT_CHARBUFs to allow
>     diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-Avoid-
>     duplicate-operations-of-add_library.patch b/meta-oe/recipes-
>     extended/sysdig/sysdig/0001-Avoid-duplicate-operations-of-
>     add_library.patch
>     new file mode 100644
>     index 0000000000..b8ca7dd38b
>     --- /dev/null
>     +++ b/meta-oe/recipes-extended/sysdig/sysdig/0001-Avoid-duplicate-
>     operations-of-add_library.patch
>     @@ -0,0 +1,47 @@
>     +From 74dec208d95821855130f6ed7b167327f1247e99 Mon Sep 17 00:00:00 2001
>     +From: Liu Yiding <liuyd.fnst@fujitsu.com
>     <mailto:liuyd.fnst@fujitsu.com>>
>     +Date: Thu, 5 Mar 2026 09:28:03 +0000
>     +Subject: [PATCH] Avoid duplicate operations of add_library.
>     +
>     +To fix following configure error
>     +| -- Existing strlcat found, will *not* use local definition
>     +| CMake Error at falcosecurity-libs/userspace/libscap/
>     CMakeLists.txt:64 (add_library):
>     +|   add_library cannot create target "scap_error" because another
>     target with
>     +|   the same name already exists.  The existing target is a static
>     library
>     +
>     +Upstream-Status: Inappropriate [oe-specific]
>     +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com
>     <mailto:liuyd.fnst@fujitsu.com>>
>     +---
>     + cmake/modules/libscap.cmake  | 2 +-
>     + cmake/modules/libsinsp.cmake | 2 +-
>     + 2 files changed, 2 insertions(+), 2 deletions(-)
>     +
>     +diff --git a/cmake/modules/libscap.cmake b/cmake/modules/libscap.cmake
>     +index b41b12ff3..1753598e9 100644
>     +--- a/cmake/modules/libscap.cmake
>     ++++ b/cmake/modules/libscap.cmake
>     +@@ -14,7 +14,7 @@
>     + #
>     +
>     + if(NOT HAVE_LIBSCAP)
>     +-      set(HAVE_LIBSCAP On)
>     ++        set(HAVE_LIBSCAP On CACHE INTERNAL "Flag to indicate
>     libscap has been processed")
>     +
>     +       if(NOT LIBS_DIR)
>     +               get_filename_component(LIBS_DIR
>     ${CMAKE_CURRENT_LIST_DIR}/../.. ABSOLUTE)
>     +diff --git a/cmake/modules/libsinsp.cmake b/cmake/modules/
>     libsinsp.cmake
>     +index ff336e27f..0fdd2d4a9 100644
>     +--- a/cmake/modules/libsinsp.cmake
>     ++++ b/cmake/modules/libsinsp.cmake
>     +@@ -14,7 +14,7 @@
>     + #
>     +
>     + if(NOT HAVE_LIBSINSP)
>     +-      set(HAVE_LIBSINSP On)
>     ++        set(HAVE_LIBSINSP On CACHE INTERNAL "Flag to indicate
>     libsinsp has been processed")
>     +
>     +       if(NOT LIBS_DIR)
>     +               get_filename_component(LIBS_DIR
>     ${CMAKE_CURRENT_LIST_DIR}/../.. ABSOLUTE)
>     +--
>     +2.43.0
>     +
>     diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pass-
>     PROBE_NAME-via-CFLAGS.patch b/meta-oe/recipes-extended/sysdig/
>     sysdig/0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch
>     index 903ccdf36a..bcf5da4f2c 100644
>     --- a/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pass-
>     PROBE_NAME-via-CFLAGS.patch
>     +++ b/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pass-
>     PROBE_NAME-via-CFLAGS.patch
>     @@ -1,6 +1,6 @@
>     -From ed8969a233adb6bf701de96d0fd0570e5ddcc787 Mon Sep 17 00:00:00 2001
>     -From: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     -Date: Mon, 21 Mar 2022 19:35:48 -0700
>     +From 6ff4114dcbb87f34751064249967aa96c7b8b030 Mon Sep 17 00:00:00 2001
>     +From: Liu Yiding <liuyd.fnst@fujitsu.com
>     <mailto:liuyd.fnst@fujitsu.com>>
>     +Date: Wed, 4 Mar 2026 10:02:10 +0000
>      Subject: [PATCH] cmake: Pass PROBE_NAME via CFLAGS
> 
>      This helps compliation of driver code where its calling modprobe on the
>     @@ -8,22 +8,25 @@ given kernel module via system() API
> 
>      Upstream-Status: Pending
>      Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     +
>     +Update for 0.39.0
>     +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com
>     <mailto:liuyd.fnst@fujitsu.com>>
>      ---
>       CMakeLists.txt | 1 +
>       1 file changed, 1 insertion(+)
> 
>      diff --git a/CMakeLists.txt b/CMakeLists.txt
>     -index 7dceb7ae..e156c36f 100644
>     +index 8e8850dbe..c6d725c05 100644
>      --- a/CMakeLists.txt
>      +++ b/CMakeLists.txt
>     -@@ -149,6 +149,7 @@ if(CMAKE_SYSTEM_NAME MATCHES "Linux")
>     -       if(NOT DEFINED PROBE_NAME)
>     -               set(PROBE_NAME "scap")
>     +@@ -174,6 +174,7 @@ if(CMAKE_SYSTEM_NAME MATCHES "Linux")
>     +       if(NOT DEFINED DRIVER_NAME)
>     +               set(DRIVER_NAME "scap")
>             endif()
>     -+      add_definitions(-DPROBE_NAME="${PROBE_NAME}")
>     ++       add_definitions(-DPROBE_NAME="${PROBE_NAME}")
> 
>             set(DRIVERS_REPO "https://download.sysdig.com/scap-drivers
>     <https://download.sysdig.com/scap-drivers>")
> 
>      --
>     -2.35.1
>     +2.43.0
> 
>     diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-
>     fix-build-with-gcc-15.patch b/meta-oe/recipes-extended/sysdig/
>     sysdig/0001-libsinsp-fix-build-with-gcc-15.patch
>     deleted file mode 100644
>     index 9a81f1c74c..0000000000
>     --- a/meta-oe/recipes-extended/sysdig/sysdig/0001-libsinsp-fix-
>     build-with-gcc-15.patch
>     +++ /dev/null
>     @@ -1,31 +0,0 @@
>     -From 47a86dabd065096ffc8818a1cffca96964d18120 Mon Sep 17 00:00:00 2001
>     -From: Martin Jansa <martin.jansa@gmail.com
>     <mailto:martin.jansa@gmail.com>>
>     -Date: Tue, 22 Apr 2025 18:43:46 +0200
>     -Subject: [PATCH] libsinsp: fix build with gcc-15
>     -
>     -fixes:
>     -http://errors.yoctoproject.org/Errors/Details/852848/ <http://
>     errors.yoctoproject.org/Errors/Details/852848/>
>     -
>     -In file included from TOPDIR/tmp/work/core2-64-oe-linux/
>     sysdig/0.28.0/git/falcosecurity-libs/userspace/chisel/lua_parser.cpp:20:
>     -TOPDIR/tmp/work/core2-64-oe-linux/sysdig/0.28.0/git/falcosecurity-
>     libs/userspace/libsinsp/./gen_filter.h:87:17: error: 'uint64_t' does
>     not name a type
>     -   87 |         virtual uint64_t get_ts() const = 0;
>     -      |                 ^~~~~~~~
>     -
>     -Upstream-Status: Pending [gen_filter is removed in newer version
>     with https://github.com/falcosecurity/libs/
>     commit/47e245f3d343eff27ed178ec2449caa3a01faabb <https://github.com/
>     falcosecurity/libs/commit/47e245f3d343eff27ed178ec2449caa3a01faabb>]
>     -Signed-off-by: Martin Jansa <martin.jansa@gmail.com
>     <mailto:martin.jansa@gmail.com>>
>     ----
>     - userspace/libsinsp/gen_filter.h | 1 +
>     - 1 file changed, 1 insertion(+)
>     -
>     -diff --git a/userspace/libsinsp/gen_filter.h b/userspace/libsinsp/
>     gen_filter.h
>     -index f4cfa08b1..79ac30dc3 100644
>     ---- a/userspace/libsinsp/gen_filter.h
>     -+++ b/userspace/libsinsp/gen_filter.h
>     -@@ -16,6 +16,7 @@ along with Falco.  If not, see <http://
>     www.gnu.org/licenses/ <http://www.gnu.org/licenses/>>.
>     -
>     - #pragma once
>     -
>     -+#include <cstdint>
>     - #include <set>
>     - #include <list>
>     - #include <map>
>     diff --git a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
>     <http://sysdig_0.28.0.bb> b/meta-oe/recipes-extended/sysdig/
>     sysdig_0.39.0.bb <http://sysdig_0.39.0.bb>
>     similarity index 56%
>     rename from meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
>     <http://sysdig_0.28.0.bb>
>     rename to meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb <http://
>     sysdig_0.39.0.bb>
>     index c988b0af59..85e687a17b 100644
>     --- a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb <http://
>     sysdig_0.28.0.bb>
>     +++ b/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb <http://
>     sysdig_0.39.0.bb>
>     @@ -19,21 +19,30 @@ JIT:powerpc64le = ""
>      JIT:powerpc64 = ""
> 
>      DEPENDS += "libb64 lua${JIT} zlib c-ares grpc-native grpc curl
>     ncurses jsoncpp \
>     -            tbb jq openssl elfutils protobuf protobuf-native jq-
>     native valijson"
>     +            tbb jq openssl elfutils protobuf protobuf-native jq-
>     native valijson \
>     +            uthash libbpf clang-native bpftool-native yaml-cpp
>     nlohmann-json"
>      RDEPENDS:${PN} = "bash"
> 
>      SRC_URI = "git://github.com/draios/
>     sysdig.git;branch=dev;protocol=https;name=sysdig <http://github.com/
>     draios/sysdig.git;branch=dev;protocol=https;name=sysdig> \
>     -           git://github.com/falcosecurity/
>     libs;protocol=https;branch=master;name=falco;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/falcosecurity-libs <http://github.com/falcosecurity/libs;protocol=https;branch=master;name=falco;subdir=$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/falcosecurity-libs> \
>     +           git://github.com/falcosecurity/
>     libs;protocol=https;branch=release/0.18.x;name=falco;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/falcosecurity-libs <http://github.com/falcosecurity/libs;protocol=https;branch=release/0.18.x;name=falco;subdir=$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/falcosecurity-libs> \
>     +           git://github.com/falcosecurity/
>     libs;protocol=https;branch=release/0.18.x;name=driver;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/driver <http://github.com/falcosecurity/libs;protocol=https;branch=release/0.18.x;name=driver;subdir=$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/driver> \
>                 file://0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch \
>     -           file://0001-Add-cstdint-for-uintXX_t-
>     types.patch;patchdir=./falcosecurity-libs \
>     -           file://0001-libsinsp-fix-build-with-
>     gcc-15.patch;patchdir=./falcosecurity-libs \
>     -           file://0001-update-cmake-Only-add-dependencies-when-we-
>     bundle.patch;patchdir=./falcosecurity-libs \
>     +           file://0001-Avoid-duplicate-operations-of-
>     add_library.patch;patchdir=./falcosecurity-libs \
>                "
>     -SRCREV_sysdig = "4fb6288275f567f63515df0ff0a6518043ecfa9b"
>     -SRCREV_falco = "caa0e4d0044fdaaebab086592a97f0c7f32aeaa9"
>     +SRCREV_sysdig = "6ef29110cf1add746e10ab5b38957e22730b7349"
>     +SRCREV_falco = "e1999d079880d10800c57e004fca794a03cd060a"
>     +SRCREV_driver = "d4efc80ece48174a71c1a420cb52d233fa94f946"
> 
>      SRCREV_FORMAT = "sysdig_falco"
> 
>     +#Add this function to generate driver_config.h
>     +do_configure:prepend() {
>     +    mkdir -p ${WORKDIR}/driver_Make
>     +    cd ${WORKDIR}/driver_Make
>     +    cmake ${S}/driver -DMINIMAL_BUILD=ON
>     +    cd -
>     +}
>     +do_configure[cleandirs] = "${WORKDIR}/driver_Make"
> 
>      EXTRA_OECMAKE = "\
>                      -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
>     @@ -44,11 +53,31 @@ EXTRA_OECMAKE = "\
>                      -DDIR_ETC=${sysconfdir} \
>                      -DLUA_INCLUDE_DIR=${STAGING_INCDIR}/luajit-2.1 \
>                      -DFALCOSECURITY_LIBS_SOURCE_DIR=${S}/falcosecurity-
>     libs \
>     +                -DDRIVER_SOURCE_DIR=${S}/driver \
>                      -DVALIJSON_INCLUDE=${STAGING_INCDIR}/valijson \
>     +                -DUSE_BUNDLED_RE2=OFF \
>     +                -DUSE_BUNDLED_TBB=OFF \
>     +                -DUSE_BUNDLED_JSONCPP=OFF \
>     +                -DBUILD_SYSDIG_MODERN_BPF=OFF \
>     +                -DCREATE_TEST_TARGETS=OFF \
>      "
> 
>     +#Add include dir to find driver_config.h
>     +CXXFLAGS:append = " -I${WORKDIR}/driver_Make/driver/src"
>     +CFLAGS:append = " -I${WORKDIR}/driver_Make/driver/src"
>     +
>     +#To fix do_package QA Issue
>     +do_compile:append() {
>     +    sed -i -e "s,${WORKDIR},,g" ${B}/libsinsp/libsinsp.pc
>     +    sed -i -e "s,${WORKDIR},,g" ${B}/driver/libscap/libscap.pc
>     +    mkdir -p ${B}/driver/libsinsp
>     +    cp ${B}/libsinsp/libsinsp.pc ${B}/driver/libsinsp/
>     +}
>     +do_compile[cleandirs] = "${B}/driver/libsinsp"
>     +
>      #CMAKE_VERBOSE = "VERBOSE=1"
> 
>     +
>      FILES:${PN} += " \
>          ${DIR_ETC}/* \
>          ${datadir}/zsh/* \
>     --
>     2.43.0
> 
> 
> 
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125379): https://lists.openembedded.org/g/openembedded-devel/message/125379
> Mute This Topic: https://lists.openembedded.org/mt/118291998/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


