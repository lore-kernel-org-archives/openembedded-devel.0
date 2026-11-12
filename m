Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7994.1794465772346086787
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:42:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=oemDS8bT;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso1950500a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465772; x=1795070572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F5jzSNEJClV1Z6x8TdEByfn1QaCbziZdI+hFJz5DJSA=;
        b=oemDS8bT6oWIEuK3z3k9kh84UhQzEO624m4vGui39eLugAkOXFqU5Ikcb9OMKdSY0F
         dp1C4CfOASxj8h6YoU4dY5A4kgGeqx0XwQJjMBKIpG1siWSjAwZh99vB9xgJaDwtyscb
         wjdHh4ZKRBWSrEUTNgm9G2ftsVQhELbD59a76BKGq7lUE6MgCQQPS2bHp8Uatd+yxYjM
         asOBFBofp0mntDTFvV3h9aT6Mh5CZy5uzxv6PJxwku5wYHrnfMH2Gtt/TCLRj7sHmW9d
         Ce7a1AjXIK2CIR+SwOnY/RZA6MilpDyaCddwOMdZlAxwZha7TZ22W/vbWQgKxuyD0gAl
         0now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465772; x=1795070572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F5jzSNEJClV1Z6x8TdEByfn1QaCbziZdI+hFJz5DJSA=;
        b=0GPe3W6Xfys3CJJobKR90MsV9zzm0X/GrwqPkDXhFcqhXBO8QV0enk/55kA+sYsU9Y
         ZB8UOgV5vdyCqXDVuEfyA+4C4CNXQU0IcxPuJw/Oz9La32xl/iqOXWueT0BAJXx8mgOp
         7O6mF/nOhbAvG7DY0q4zdOWsD2yzOmTTQI9rfcx0QrmZoTA0lzHd2+fcjoTX9EmVD2o2
         ofjIxqKsFVdwG8zgV2NKr891oF26DRZAqAu2Z3WzqjV1hRRJjj0lxXsH42iwYlixaBvN
         ZF4Jhz7KsIcpWkcoHf2dXD97Ri3aIqJNuMvgKhrKleoyDyKQRbPGwnvhWTX8Afcb6UA1
         iRJg==
X-Gm-Message-State: APuU4Z/MaqolY0zs78reohxhFhttJD6AUmsUEgxqbJOhdlI9h1khh9Bp
	Pchv1mKTKzRrj2q7A85jps6dBO7DBS8XJQeLWfzQPadGh9Xl3+pogGbnSDtopQ==
X-Gm-Gg: AYBFou1yMMBjAaSLBU71335USnUc18Y5zd7BJSXH8RhFl5MXT4+nNIfyEG/Eqba1G+r
	WSEKtpnn1XXxocgAV2vCtSTgq6BmwywQwLTG/V73KLWYhXPSl9FjfruLdTSE3ZzWdluRKToERT2
	7D3emEveNqLwH+pm0s8WaRIFuKmceLkmFbo4y9cxTBMSKP3fgZQsMB9xpUslYhZpXFKDQ5IRMDn
	wUbMfsO+1hRR/rvePo+C0VPPMPfgQ+uCIo39S0+LXger+cyOJ4/BhOhavh0jyvowq6kNRSN9dgs
	G7sxggi3jmMRfJK4aYtKzp3CWSRRN44oWkdy28AhQaxsaJC1gy+BXDuX7GsHt3lu774wHFDSHQQ
	/en/b6cM/xSuuIE6drtpECVIZqvBBUuXJ5EwAL7PpWuVPZkURz1AYO/A+gqVbIzXGt32shWRKxR
	dWK/WDoAW/TAvFWxCOr/t+xaz9o15e532VJZbr/38Zee4l9PXl2WqBchNpA5fil4Z+ut8yvP5g0
	8CNrv40EbECt1tucWkVmttk4JyT/KrtO+0TvGe3usqo3mr+SFLcm1a6NnWaldv8FCekBPz9r85O
	ceKcQQDMzmY1EyEiphTgaAEDCHGjbgmYMJO0lpYZto9wkvUf70VES82q8gShLGBSpIIVGBfGVe+
	QH5izl7JhTmPcCYmYYR0T9g5btxzlw/3cKeR8ioEDbNUJOHG6jPrhZBIGFzpNQfIGSZThvFTwAG
	89q+WugyTPYy96jNoZ/tkQq7e/TkVcGIkZxlfgT4lSTb9kZu2CGiz88/+Jun3mo4D9xlCQu5uME
	qxwW6T4T6zb/xxzHr7XT/zb2C4W0VxrnBX0N3iimoRaiaF2D2ClrJA4/etFs6IjOI3waU7qmYt9
	mnqW
X-Received: by 2002:a17:90b:3c04:b0:3ad:c482:ae9a with SMTP id 98e67ed59e1d1-3b182e13d62mr4194288a91.1.1794465771577;
        Wed, 11 Nov 2026 22:42:51 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm2984715a91.11.2026.11.11.22.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:42:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 18/24] vsomeip: upgrade 3.7.3 -> 3.8.0
Date: Wed, 11 Nov 2026 22:42:18 -0800
Message-ID: <20261112064225.2410019-18-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
References: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:43:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132187
Content-Type: text/plain; charset="utf-8"

Refresh 0001-Fix-pkgconfig-dir-for-multilib.patch through
0005-Do-not-treat-warnings-as-errors-with-clang.patch; the memory tests
were rewritten and no longer need the scanf fix.

The policy manager unit test now gets its build directory from a CMake
compile definition instead of policy_manager_impl_unit_test_macro.hpp,
so point that at the installed test directory to avoid embedding ${B}.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-Fix-pkgconfig-dir-for-multilib.patch |  9 +-
 ...e-configuration-files-to-etc-vsomeip.patch |  9 +-
 ...3-Do-not-specify-PIE-flag-explicitly.patch | 17 ++--
 ...04-Fix-scanning-64-bit-integer-types.patch | 93 +++++--------------
 ...-treat-warnings-as-errors-with-clang.patch | 17 ++--
 .../{vsomeip_3.7.3.bb => vsomeip_3.8.0.bb}    |  8 +-
 6 files changed, 47 insertions(+), 106 deletions(-)
 rename meta-networking/recipes-protocols/vsomeip/{vsomeip_3.7.3.bb => vsomeip_3.8.0.bb} (88%)

diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch
index 52ec294579..5e410ae93b 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch
@@ -1,4 +1,4 @@
-From 3d1ddf162616978eeb9af8e2f64d4b3b63dba0f6 Mon Sep 17 00:00:00 2001
+From 1737c66707c3d7cbbd355c05af2e1b479568bd57 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 2 Mar 2022 14:51:13 +0800
 Subject: [PATCH] Fix pkgconfig dir for multilib
@@ -11,10 +11,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index aa4ad1cc..27e7b517 100644
+index b160ac4..7b2aaa8 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -670,7 +670,7 @@ endif()
+@@ -575,7 +575,7 @@ endif()
  # create pkg-config file
  if(NOT WIN32)
          configure_file(${VSOMEIP_NAME}.pc.in ${PROJECT_BINARY_DIR}/${VSOMEIP_NAME}.pc @ONLY)
@@ -23,6 +23,3 @@ index aa4ad1cc..27e7b517 100644
  endif()
  
  ##############################################################################
--- 
-2.34.1
-
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch
index dde27b37f7..ebeb8cb10b 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch
@@ -1,4 +1,4 @@
-From 17f606e9ede2e3a1871c98dffff89e5285dd8c21 Mon Sep 17 00:00:00 2001
+From 05ffeb652a838a07346c3eeb8c312fb861d415e4 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 9 Mar 2022 11:48:44 +0800
 Subject: [PATCH] Install example configuration files to /etc/vsomeip
@@ -11,10 +11,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 27e7b517..67ecb365 100644
+index 7b2aaa8..332f8f2 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -586,7 +586,7 @@ install (
+@@ -490,7 +490,7 @@ install (
  )
  
  install (
@@ -23,6 +23,3 @@ index 27e7b517..67ecb365 100644
  )
  
  # Add all targets to the build-tree export set
--- 
-2.34.1
-
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-specify-PIE-flag-explicitly.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-specify-PIE-flag-explicitly.patch
index 066fc1c4c5..fe30e0f8cb 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-specify-PIE-flag-explicitly.patch
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-specify-PIE-flag-explicitly.patch
@@ -1,4 +1,4 @@
-From 0b68560853035ff557e60902144be71bcbe0e3bc Mon Sep 17 00:00:00 2001
+From 9a894772b6bfd266d8516b1dcde72092194ea84b Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Mon, 17 Jul 2023 14:33:32 +0800
 Subject: [PATCH] Do not specify PIE flag explicitly
@@ -24,13 +24,13 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 67ecb365..bda9c69a 100644
+index 332f8f2..f07d408 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -78,7 +78,7 @@ if (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
  if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
      # This is only relevant for GCC and causes warnings on Clang
-     set(EXPORTSYMBOLS "-Wl,-export-dynamic -Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/exportmap.gcc")
+     set(EXPORTSYMBOLS "-Wl,-export-dynamic -Wl,--version-script=${PROJECT_SOURCE_DIR}/exportmap.gcc")
 -    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -pie -Wno-tsan -Wl,-z,relro,-z,now")
 +    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -Wno-tsan -Wl,-z,relro,-z,now")
  endif()
@@ -40,11 +40,8 @@ index 67ecb365..bda9c69a 100644
      if(NOT DEFINED _FORTIFY_SOURCE)
          set(_FORTIFY_SOURCE 2)
      endif()
--    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic -Werror -fPIE -Wno-inconsistent-missing-override")
-+    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic -Werror -Wno-inconsistent-missing-override")
+-    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -Wformat -Wformat-security -Wpedantic -Werror -fPIE -Wno-inconsistent-missing-override")
++    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -Wformat -Wformat-security -Wpedantic -Werror -Wno-inconsistent-missing-override")
  
-     # force all use of std::mutex and std::recursive_mutex to use runtime init
-     # instead of static initialization so mutexes can be hooked to enable PI as needed
--- 
-2.34.1
-
+     # _FORTIFY_SOURCE requires an optimized build; defining it under -O0
+     # is a no-op at best and a hard error with newer glibc + -Werror.
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Fix-scanning-64-bit-integer-types.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Fix-scanning-64-bit-integer-types.patch
index ff3510618a..c03c3bef7b 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Fix-scanning-64-bit-integer-types.patch
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Fix-scanning-64-bit-integer-types.patch
@@ -1,4 +1,4 @@
-From 097d74721be56a1e6c1551cf53965d1055746b65 Mon Sep 17 00:00:00 2001
+From c93089e134ba5ff9f2d99668feb909d2b82be323 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Tue, 4 Nov 2025 12:50:51 +0800
 Subject: [PATCH] Fix scanning 64-bit integer types
@@ -22,24 +22,22 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
  implementation/routing/src/routing_manager_impl.cpp     | 4 +++-
  test/network_tests/cpu_load_tests/cpu_load_measurer.cpp | 6 ++++--
- test/network_tests/memory_tests/memory_test_client.cpp  | 4 +++-
- test/network_tests/memory_tests/memory_test_service.cpp | 4 +++-
- 4 files changed, 13 insertions(+), 5 deletions(-)
+ 2 files changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/implementation/routing/src/routing_manager_impl.cpp b/implementation/routing/src/routing_manager_impl.cpp
-index 8a2f1fdf..3e98143b 100644
+index 27d9a3c..11e9f36 100644
 --- a/implementation/routing/src/routing_manager_impl.cpp
 +++ b/implementation/routing/src/routing_manager_impl.cpp
-@@ -9,6 +9,7 @@
- #include <sstream>
- #include <forward_list>
- #include <thread>
-+#include <cinttypes>
+@@ -4,6 +4,7 @@
+ // file, You can obtain one at http://mozilla.org/MPL/2.0/.
  
- #if defined(__linux__) || defined(__QNX__)
- #include <unistd.h>
-@@ -3307,7 +3308,8 @@ void routing_manager_impl::memory_log_timer_cbk(boost::system::error_code const&
-     std::uint64_t its_dirtypages(0);
+ #include "vsomeip/defines.hpp"
++#include <cinttypes>
+ #include <climits>
+ #include <iomanip>
+ #include <memory>
+@@ -3536,7 +3537,8 @@ void routing_manager_impl::memory_log_timer_cbk(boost::system::error_code const&
+     uint64_t its_dirtypages(0);
  
      if (EOF
 -        == std::fscanf(its_file, "%lu %lu %lu %lu %lu %lu %lu", &its_size, &its_rsssize, &its_sharedpages, &its_text, &its_lib, &its_data,
@@ -49,19 +47,19 @@ index 8a2f1fdf..3e98143b 100644
          VSOMEIP_ERROR << "memory_log_timer_cbk: error reading: errno " << errno;
      }
 diff --git a/test/network_tests/cpu_load_tests/cpu_load_measurer.cpp b/test/network_tests/cpu_load_tests/cpu_load_measurer.cpp
-index 7386b0bb..7fe7af5f 100644
+index 630e0a7..ff07b6a 100644
 --- a/test/network_tests/cpu_load_tests/cpu_load_measurer.cpp
 +++ b/test/network_tests/cpu_load_tests/cpu_load_measurer.cpp
-@@ -12,6 +12,7 @@
+@@ -11,6 +11,7 @@
+ #include <sstream>
  #include <vector>
  #include <stdexcept>
- #include <cstdio>
 +#include <cinttypes>
+ #include <cstdio>
  
  #include <sys/types.h>
- #include <unistd.h>
-@@ -86,7 +87,7 @@ std::uint64_t cpu_load_measurer::read_proc_pid_stat() {
-     std::int64_t cstime(0);
+@@ -86,7 +87,7 @@ uint64_t cpu_load_measurer::read_proc_pid_stat() {
+     int64_t cstime(0);
      if (std::fscanf(f,
                      "%*d %*s %*c %*d %*d %*d %*d %*d %*u %*u %*u %*u %*u "
 -                    "%lu %lu %ld %ld", // utime, stime, cutime, cstime
@@ -69,60 +67,13 @@ index 7386b0bb..7fe7af5f 100644
                      &utime, &stime, &cutime, &cstime)
          == EOF) {
          std::cerr << "Failed to read " + path << std::endl;
-@@ -116,7 +117,8 @@ std::uint64_t cpu_load_measurer::read_proc_stat(std::uint64_t* _idle) {
-     std::uint64_t steal(0);
-     std::uint64_t guest(0);
-     std::uint64_t guest_nice(0);
+@@ -116,7 +117,8 @@ uint64_t cpu_load_measurer::read_proc_stat(uint64_t* _idle) {
+     uint64_t steal(0);
+     uint64_t guest(0);
+     uint64_t guest_nice(0);
 -    if (std::fscanf(f, "%*s %lu %lu %lu %lu %lu %lu %lu %lu %lu %lu", &user, &nice, &system, &idle, &iowait, &irq, &softirq, &steal, &guest,
 +    if (std::fscanf(f, "%*s %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64,
 +                    &user, &nice, &system, &idle, &iowait, &irq, &softirq, &steal, &guest,
                      &guest_nice)
          == EOF) {
          std::cerr << "Failed to read /proc/stat" << std::endl;
-diff --git a/test/network_tests/memory_tests/memory_test_client.cpp b/test/network_tests/memory_tests/memory_test_client.cpp
-index 9d3aedfd..a502c8e9 100644
---- a/test/network_tests/memory_tests/memory_test_client.cpp
-+++ b/test/network_tests/memory_tests/memory_test_client.cpp
-@@ -6,6 +6,7 @@
- #include <chrono>
- #include <iomanip>
- #include <cstring>
-+#include <cinttypes>
- 
- #include <vsomeip/internal/logger.hpp>
- #include "common/test_main.hpp"
-@@ -31,7 +32,8 @@ void check_memory(std::vector<std::uint64_t>& test_memory_, std::atomic<bool>& s
-         std::uint64_t its_dirtypages(0);
- 
-         if (EOF
--            == std::fscanf(its_file, "%lu %lu %lu %lu %lu %lu %lu", &its_size, &its_rsssize, &its_sharedpages, &its_text, &its_lib,
-+            == std::fscanf(its_file, "%" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64,
-+                           &its_size, &its_rsssize, &its_sharedpages, &its_text, &its_lib,
-                            &its_data, &its_dirtypages)) {
-             VSOMEIP_ERROR << "check_memory: error reading: errno " << errno;
-         }
-diff --git a/test/network_tests/memory_tests/memory_test_service.cpp b/test/network_tests/memory_tests/memory_test_service.cpp
-index 549adbef..0b78a207 100644
---- a/test/network_tests/memory_tests/memory_test_service.cpp
-+++ b/test/network_tests/memory_tests/memory_test_service.cpp
-@@ -6,6 +6,7 @@
- #include <vsomeip/internal/logger.hpp>
- #include <cstring>
- #include "common/test_main.hpp"
-+#include <cinttypes>
- 
- #include "memory_test_service.hpp"
- 
-@@ -29,7 +30,8 @@ void check_memory(std::vector<std::uint64_t>& test_memory_, std::atomic<bool>& s
-         std::uint64_t its_dirtypages(0);
- 
-         if (EOF
--            == std::fscanf(its_file, "%lu %lu %lu %lu %lu %lu %lu", &its_size, &its_rsssize, &its_sharedpages, &its_text, &its_lib,
-+            == std::fscanf(its_file, "%" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64,
-+                           &its_size, &its_rsssize, &its_sharedpages, &its_text, &its_lib,
-                            &its_data, &its_dirtypages)) {
-             VSOMEIP_ERROR << "check_memory: error reading: errno " << errno;
-         }
--- 
-2.34.1
-
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Do-not-treat-warnings-as-errors-with-clang.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Do-not-treat-warnings-as-errors-with-clang.patch
index a9c00baa5e..36c66cd4c0 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Do-not-treat-warnings-as-errors-with-clang.patch
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Do-not-treat-warnings-as-errors-with-clang.patch
@@ -1,4 +1,4 @@
-From 6d5da6a08d04c314bd5065dcb178beb10dc609e2 Mon Sep 17 00:00:00 2001
+From 9a7c3dc1c796e9f870eb05baa55ef41622f14a41 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 5 Nov 2025 22:17:14 +0800
 Subject: [PATCH] Do not treat warnings as errors with clang
@@ -14,13 +14,13 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index bda9c69a..718ff23d 100644
+index f07d408..beafdc6 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -78,7 +78,7 @@ if (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
  if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
      # This is only relevant for GCC and causes warnings on Clang
-     set(EXPORTSYMBOLS "-Wl,-export-dynamic -Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/exportmap.gcc")
+     set(EXPORTSYMBOLS "-Wl,-export-dynamic -Wl,--version-script=${PROJECT_SOURCE_DIR}/exportmap.gcc")
 -    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -Wno-tsan -Wl,-z,relro,-z,now")
 +    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -Wno-tsan -Wl,-z,relro,-z,now -Werror")
  endif()
@@ -30,11 +30,8 @@ index bda9c69a..718ff23d 100644
      if(NOT DEFINED _FORTIFY_SOURCE)
          set(_FORTIFY_SOURCE 2)
      endif()
--    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic -Werror -Wno-inconsistent-missing-override")
-+    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -Wall -Wextra -Wformat -Wformat-security -Wno-conversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic -Wno-inconsistent-missing-override")
+-    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -Wformat -Wformat-security -Wpedantic -Werror -Wno-inconsistent-missing-override")
++    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -Wall -Wextra -Wformat -Wformat-security -Wno-conversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -Wformat -Wformat-security -Wpedantic -Wno-inconsistent-missing-override")
  
-     # force all use of std::mutex and std::recursive_mutex to use runtime init
-     # instead of static initialization so mutexes can be hooked to enable PI as needed
--- 
-2.34.1
-
+     # _FORTIFY_SOURCE requires an optimized build; defining it under -O0
+     # is a no-op at best and a hard error with newer glibc + -Werror.
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.7.3.bb b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.8.0.bb
similarity index 88%
rename from meta-networking/recipes-protocols/vsomeip/vsomeip_3.7.3.bb
rename to meta-networking/recipes-protocols/vsomeip/vsomeip_3.8.0.bb
index dc110fd9ca..0c21230e6d 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.7.3.bb
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.8.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/GENIVI/${BPN}.git;branch=master;protocol=https;name=
            file://0005-Do-not-treat-warnings-as-errors-with-clang.patch \
           "
 
-SRCREV = "6171fdfe109a3af8fb64190136029aadd1fa0c6f"
+SRCREV = "f1518b369f5ee9684fd01af0f9d147fb04523060"
 SRC_URI[gtest.sha256sum] = "65fab701d9829d38cb77c14acdc431d2108bfdbf8979e40eb8ae567edf10b27c"
 
 COMPATIBLE_HOST:mips = "null"
@@ -49,8 +49,10 @@ RDEPENDS:${PN}-test = "bash lsof"
 
 OECMAKE_TARGET_COMPILE += "vsomeip_ctrl examples build_tests"
 
-do_compile:prepend() {
-    sed -i -e 's#${S}/build#/opt/${PN}-test#g' ${S}/test/unit_tests/security_policy_manager_impl_tests/policy_manager_impl_unit_test_macro.hpp
+# Point the policy manager unit test at its installed location instead of ${B}
+do_configure:prepend() {
+    sed -i -e 's#UNIT_TEST_BUILD_DIR_PATH="${CMAKE_CURRENT_BINARY_DIR}"#UNIT_TEST_BUILD_DIR_PATH="/opt/${PN}-test/test/unit_tests/security_policy_manager_impl_tests"#' \
+        ${S}/test/unit_tests/security_policy_manager_impl_tests/CMakeLists.txt
 }
 
 do_install:append() {
