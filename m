Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BFFEB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 06:52:01 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.2331.1687157516285280167
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 23:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="109589363"
X-IronPort-AV: E=Sophos;i="6.00,254,1681138800"; 
   d="scan'208";a="109589363"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 15:51:53 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 74B4AF0760
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:51:51 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9DC5BD946B
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:51:50 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 134EA6B80C;
	Mon, 19 Jun 2023 15:51:50 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] rdfind: upgrade 1.5.0 -> 1.6.0
Date: Mon, 19 Jun 2023 14:50:05 +0800
Message-Id: <1687157405-17416-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27700.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27700.005
X-TMASE-Result: 10--12.186600-10.000000
X-TMASE-MatchedRID: mL9wGNQYBVujz0nOeth/ySrLqyE6Ur/jBGvINcfHqhdXGTbsQqHbkraf
	/KdY+tw+6oHv+vDBrw3vOpaxrqKQ/dFMBnmJRh/JA9lly13c/gEJlr1xKkE5uaShvRjfn4cU6+f
	8731wcoUILxoCYZ47qepe9co8GDkGZWMJGq5h2T4ReM8i8p3vgFK6+0HOVoSoNS9A3X1uuOBmeC
	LE2iu14Mg3ed8enodofJL38u1VtO7sFMterP8CElXyxzHVg5CopPcjstv5lWIM74Nf6tTB9uWhN
	KYuM7eNnC7F+qVaTtoxTTjXdJoS151OGPOtOV85qoeab9Xgz89IvK4LrXs1aZTFYAEf108B6dCT
	p1R4Uo0jH86oKTknXZldTBPPT0s/VoG8mkAKgzyQJOFc+qyqK00s9CXRACW0ugVDwZELU+vc0S0
	1sqTtcWmnDA95/4OZvGu4mGn+c/8zWRkhrzmyQbGWmeVAULKHuPoXxx7oSDoPa94jf+HCb9ftCr
	F2sVs+4vM1YF6AJbbGXyXDzkRpVAtuKBGekqUpI/NGWt0UYPDq5vM2ZAHJKsIiFZ6TzrdN+SXQu
	ggDFNqYICjS/l/W8U6WXwDCV26K
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:52:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103380

From: Wang Mingyu <wangmy@fujitsu.com>

0001-configure-Fix-check-for-AC_CHECK_LIB.patch
0001-include-standard-headers-limits-and-cstdint.patch
0001-configure.ac-fix-C-11-support-check.patch
removed since they're included in 1.6.0

Changelog:
 add sha512 support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...configure-Fix-check-for-AC_CHECK_LIB.patch | 25 ---------
 ...-configure.ac-fix-C-11-support-check.patch | 37 -------------
 ...-standard-headers-limits-and-cstdint.patch | 54 -------------------
 .../{rdfind_1.5.0.bb => rdfind_1.6.0.bb}      |  8 +--
 4 files changed, 2 insertions(+), 122 deletions(-)
 delete mode 100644 meta-oe/recipes-support/rdfind/rdfind/0001-configure-Fix-check-for-AC_CHECK_LIB.patch
 delete mode 100644 meta-oe/recipes-support/rdfind/rdfind/0001-configure.ac-fix-C-11-support-check.patch
 delete mode 100644 meta-oe/recipes-support/rdfind/rdfind/0001-include-standard-headers-limits-and-cstdint.patch
 rename meta-oe/recipes-support/rdfind/{rdfind_1.5.0.bb => rdfind_1.6.0.bb} (44%)

diff --git a/meta-oe/recipes-support/rdfind/rdfind/0001-configure-Fix-check-for-AC_CHECK_LIB.patch b/meta-oe/recipes-support/rdfind/rdfind/0001-configure-Fix-check-for-AC_CHECK_LIB.patch
deleted file mode 100644
index a65d8cb77..000000000
--- a/meta-oe/recipes-support/rdfind/rdfind/0001-configure-Fix-check-for-AC_CHECK_LIB.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 823a4deb61f6f9b91b0cfc4a7e7b20922c635777 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 1 Sep 2022 13:13:50 -0700
-Subject: [PATCH] configure: Fix check for AC_CHECK_LIB
-
-Check for nettle_pbkdf2_hmac_sha256 from libnettle instead of main()
-which is not in nettle library
-
-Upstream-Status: Submitted [https://github.com/pauldreik/rdfind/pull/115]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -46,7 +46,7 @@ AC_CHECK_HEADER(nettle/sha.h,,[AC_MSG_ER
-  On Debian-ish systems, use "apt-get install nettle-dev" to get a system
-  wide nettle install.
- ])]) 
--AC_CHECK_LIB(nettle,main,,[AC_MSG_ERROR([
-+AC_CHECK_LIB(nettle,nettle_pbkdf2_hmac_sha256,,[AC_MSG_ERROR([
-  Could not link to libnettle. Please install nettle
-  first. If you have already done so; please run ldconfig
-  as root or check whether the path libnettle was installed
diff --git a/meta-oe/recipes-support/rdfind/rdfind/0001-configure.ac-fix-C-11-support-check.patch b/meta-oe/recipes-support/rdfind/rdfind/0001-configure.ac-fix-C-11-support-check.patch
deleted file mode 100644
index 815939b82..000000000
--- a/meta-oe/recipes-support/rdfind/rdfind/0001-configure.ac-fix-C-11-support-check.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 9070bc210b2ecff641b73e4ade30040c1461969c Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 3 May 2023 18:31:57 +0200
-Subject: [PATCH] configure.ac: fix C++11 support check
-
-* with -Werror=return-type in CFLAGS this test fails with:
-
-  configure:4290: checking for C++11 support or better
-  configure:4303: x86_64-webos-linux-g++  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Werror=return-type --sysroot=/OE/lge/build/webos/mickledore/BUILD/work/qemux86_64-webos-linux/rdfind/1.5.0-r0/recipe-sysroot -c  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/OE/lge/build/webos/mickledore/BUILD/work/qemux86_64-webos-linux/rdfind/1.5.0-r0/rdfind-1.5.0=/usr/src/debug/rdfind/1.5.0-r0  -fdebug-prefix-map=/OE/lge/build/webos/mickledore/BUILD/work/qemux86_64-webos-linux/rdfind/1.5.0-r0/rdfind-1.5.0=/usr/src/debug/rdfind/1.5.0-r0  -fmacro-prefix-map=/OE/lge/build/webos/mickledore/BUILD/work/qemux86_64-webos-linux/rdfind/1.5.0-r0/build=/usr/src/debug/rdfind/1.5.0-r0  -fdebug-prefix-map=/OE/lge/build/webos/mickledore/BUILD/work/qemux86_64-webos-linux/rdfind/1.5.0-r0/build=/usr/src/debug/rdfind/1.5.0-r0  -fdebug-prefix-map=/OE/lge/build/webos/mickledore/BUILD/work/qe
 mux86_64-webos-linux/rdfind/1.5.0-r0/recipe-sysroot=  -fmacro-prefix-map=/OE/lge/build/webos/mickledore/BUILD/work/qemux86_64-webos-linux/rdfind/1.5.0-r0/recipe-sysroot=  -fdebug-prefix-map=/OE/lge/build/webos/mickledore/BUILD/work/qemux86_64-webos-linux/rdfind/1.5.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden   conftest.cpp >&5
-  conftest.cpp: In function 'int f()':
-  conftest.cpp:22:20: error: no return statement in function returning non-void [-Werror=return-type]
-     22 | int f() { auto a=1;}                                                                                                                                                                                                                        |                    ^
-  cc1plus: some warnings being treated as errors
-  ...
-  configure:4308: error: no c++11 support, please set CXXFLAGS properly
-
-* fix the test to pass
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Upstream-Status: Submitted [https://github.com/pauldreik/rdfind/pull/132]
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index be1b2fd..9c3513c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -64,7 +64,7 @@ AC_SYS_LARGEFILE
- 
- dnl make sure we have c++11 or better,
- AC_MSG_CHECKING([for C++11 support or better])
--AC_COMPILE_IFELSE([AC_LANG_PROGRAM([int f() { auto a=1;}])],
-+AC_COMPILE_IFELSE([AC_LANG_PROGRAM([int f() { auto a=1;return a;}])],
-                   [AC_MSG_RESULT([yes])],
- 		  [AC_MSG_ERROR([no c++11 support, please set CXXFLAGS properly])])
- 
diff --git a/meta-oe/recipes-support/rdfind/rdfind/0001-include-standard-headers-limits-and-cstdint.patch b/meta-oe/recipes-support/rdfind/rdfind/0001-include-standard-headers-limits-and-cstdint.patch
deleted file mode 100644
index bd59b7441..000000000
--- a/meta-oe/recipes-support/rdfind/rdfind/0001-include-standard-headers-limits-and-cstdint.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 8c317f0fd5fde95a9aae2319053a196a166aec88 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 25 Jan 2023 21:12:47 -0800
-Subject: [PATCH] include standard headers <limits> and <cstdint>
-
-gcc 13 moved some includes around and as a result <cstdint> is no longer
-transitively included [1]. Explicitly include it for uint64_t.
-
-Fixes errors like below
-
-../rdfind-1.5.0/rdfind.cc:225:30: error: 'numeric_limits' is not a member of 'std'
-  225 |     o.maximumfilesize = std::numeric_limits<decltype(o.maximumfilesize)>::max();
-      |                              ^~~~~~~~~~~~~~
-
-...
-
-| ../rdfind-1.5.0/Fileinfo.hh:70:20: error: 'std::int64_t' has not been declared
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Upstream-Status: Submitted [https://github.com/pauldreik/rdfind/pull/129]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Fileinfo.hh | 1 +
- rdfind.cc   | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/Fileinfo.hh b/Fileinfo.hh
-index 3ffb837..23ed54e 100644
---- a/Fileinfo.hh
-+++ b/Fileinfo.hh
-@@ -8,6 +8,7 @@
- #define Fileinfo_hh
- 
- #include <array>
-+#include <cstdint>
- #include <string>
- 
- // os specific headers
-diff --git a/rdfind.cc b/rdfind.cc
-index fbd6cb8..64dd8f6 100644
---- a/rdfind.cc
-+++ b/rdfind.cc
-@@ -9,6 +9,7 @@
- // std
- #include <algorithm>
- #include <iostream>
-+#include <limits>
- #include <string>
- #include <vector>
- 
--- 
-2.39.1
-
diff --git a/meta-oe/recipes-support/rdfind/rdfind_1.5.0.bb b/meta-oe/recipes-support/rdfind/rdfind_1.6.0.bb
similarity index 44%
rename from meta-oe/recipes-support/rdfind/rdfind_1.5.0.bb
rename to meta-oe/recipes-support/rdfind/rdfind_1.6.0.bb
index dab66c382..c64519e77 100644
--- a/meta-oe/recipes-support/rdfind/rdfind_1.5.0.bb
+++ b/meta-oe/recipes-support/rdfind/rdfind_1.6.0.bb
@@ -5,13 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fa22e16ebbe6638b2bd253338fbded9f"
 
 DEPENDS = "nettle autoconf-archive"
 
-SRC_URI = "https://rdfind.pauldreik.se/${BP}.tar.gz \
-           file://0001-configure-Fix-check-for-AC_CHECK_LIB.patch \
-           file://0001-include-standard-headers-limits-and-cstdint.patch \
-           file://0001-configure.ac-fix-C-11-support-check.patch \
-"
+SRC_URI = "https://rdfind.pauldreik.se/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "4150ed1256f7b12b928c65113c485761552b9496c433778aac3f9afc3e767080"
+SRC_URI[sha256sum] = "7a406e8ef1886a5869655604618dd98f672f12c6a6be4926d053be65070f3279"
 
 inherit autotools
 
-- 
2.34.1


