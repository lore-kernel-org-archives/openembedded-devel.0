Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824F3D3E79A
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:13 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.40126.1730874671191088944
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=e9nnIjq5;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874671; x=1762410671;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8KZ9l9UfGnDX5vIwBysBoofN6eW9FdzynbZPWc+6FLk=;
  b=e9nnIjq5MZMTG8LLlEA8L/dGq1uw+t/bqcTr7+aFWAKQnsO0RgnAOTYH
   04Pq8UQasY2wR2ElsQHd4GTdoUImTaVA+vMm9JCIwFAy+sXJFoWVqHpS8
   EgpLCrZjQIEZDJbt1badCgxHfDUZumDIBBExHWJZu7dRN44CSEEgQckhl
   bbiKw6b6GtoKhjJbK3yfjRRm6lsVIR55FCp5KQVP5nUJ/3FkoSYLthS/F
   73gv0OlUZ49QU3DPT5XVY9jJc/BPv5INdKdUaPe0Krl8sGnpiRy/X07cc
   Oad5TMINjY6/z5tZ1QCTnci8MnIU2WX1JXLRzH8PkwUcUJJ0hdLWHU5f+
   g==;
X-CSE-ConnectionGUID: Y5iKRxNSQju++2U6lUTX4w==
X-CSE-MsgGUID: TMD9GrXoRB6Vvo5Ui5cw5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="158171215"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="158171215"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:08 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 91557D8012
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:06 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C9F4DD7480
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E93620071A01
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:05 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0DFA21A000A;
	Wed,  6 Nov 2024 14:31:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 03/46] evolution-data-server: upgrade 3.54.0 -> 3.54.1
Date: Wed,  6 Nov 2024 14:30:17 +0800
Message-Id: <1730874660-2364-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10--0.963700-10.000000
X-TMASE-MatchedRID: 242WXRytjV6jz0nOeth/yRIRh9wkXSlFgbNN0R684zNDBvQWP2HhqrRL
	SS3efDto8YMGIR6ZqjXgWrJqIvGqvVdvtTbdcIRVKsurITpSv+NMkOX0Uoduub42hLbi424D6Ch
	K9oqyX+QelS7wdoCumsYoh/qEF/tV4zTx1vuCFPI7Cl8sx4HBGwv/9UzFeXITc3TcFmUDszxmeC
	LE2iu14Bx14Xc22OvfVPjc6svEv2chYREeQEM9SdDQPgxOmF8EnY+2FiS7N52M7c8RGpvM3UvF0
	FJqO0DYp3Z/y3zTL98ItUtkNASIoJ8vF/w0o6V8RRG1M1MIt79K/UZnhtRB4gLo77dSjupLiIwc
	fKZNL+BKVJfNkTKsj72l+GduHeV3DPIzF4wRfrCDGx/OQ1GV8t0H8LFZNFG7/nnwJ52QYi+Std8
	3kHCpUUPAkK9DgEf0K0JXOLVJCiNwsfnr1R7po1+blTLHs71EmAQ+B/9pGZIkOxQd8GeUPNDknQ
	lLOcYrk+0dFkqPaXs+wzevbIxHe0HvcRnPtcEI6nVdQb+HYw6J5Z1XsV8oBMtsCnR+b4I7
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113689

From: Wang Mingyu <wangmy@fujitsu.com>

0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch
0001-cmake-Do-not-export-CC-into-gir-compiler.patch
0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch
0004-call-native-helpers.patch

Bug Fixes:
==========
- Pass GError instead of CamelException to camel_movemail_solaris
- Fix argument types in ENABLE_BROKEN_SPOOL code
- Use GIConv instead of iconv_t with iconv wrappers
- ESoupSession: Sometimes accesses server without OAuth2 token

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../evolution-data-server/evolution-data-server.inc |  4 ++--
 ...01-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch |  9 +++------
 ...1-cmake-Do-not-export-CC-into-gir-compiler.patch | 13 +++++++++++--
 ...Lists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch | 11 ++++-------
 .../0004-call-native-helpers.patch                  | 11 ++++-------
 5 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 340c63998..516f94a66 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -10,5 +10,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 GNOMEBASEBUILDCLASS = "cmake"
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.sha256sum] = "a54b47b977a97030f738a412f4f5d5b2efbef5e0ebe8929b7cce00ac54681084"
-PV = "3.54.0"
+SRC_URI[archive.sha256sum] = "25b336c48a6babc36321d88094b382aeaf18abcbab4a9438b3fff90c29e105ae"
+PV = "3.54.1"
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch
index e8c6d6a76..9a00d0167 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch
@@ -1,4 +1,4 @@
-From 131b88a81aba3d72d566bc8a9d968941a98e0007 Mon Sep 17 00:00:00 2001
+From ab25af06d6eed4dfb785b4593e38112f8f376230 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Sun, 31 Mar 2019 18:11:55 +0200
 Subject: [PATCH] CMakeLists.txt: Remove TRY_RUN for iconv
@@ -17,10 +17,10 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  1 file changed, 11 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 1672daf..0b3e4e0 100644
+index 5ccbf9c..5dfe9ee 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -524,17 +524,6 @@ if(NOT HAVE_ICONV)
+@@ -569,17 +569,6 @@ if(NOT HAVE_ICONV)
  	message(FATAL_ERROR "You need to install a working iconv implementation, such as ftp://ftp.gnu.org/pub/gnu/libiconv")
  endif(NOT HAVE_ICONV)
  
@@ -38,6 +38,3 @@ index 1672daf..0b3e4e0 100644
  # ******************************
  # Backtraces for debugging
  # ******************************
--- 
-2.20.1
-
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-cmake-Do-not-export-CC-into-gir-compiler.patch b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
index 118d93a72..b89d5f25c 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
@@ -1,7 +1,16 @@
-Use G_IR_SCANNER without passing additional environment
+From 0f9763c77dcf44b1061517539287c79a59a6aede Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 6 Mar 2022 18:16:31 +0100
+Subject: [PATCH] Use G_IR_SCANNER without passing additional environment
 
 Upstream-Status: Inappropriate [OE-specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cmake/modules/GObjectIntrospection.cmake | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/cmake/modules/GObjectIntrospection.cmake b/cmake/modules/GObjectIntrospection.cmake
+index 9d2e6e7..3d8bb8c 100644
 --- a/cmake/modules/GObjectIntrospection.cmake
 +++ b/cmake/modules/GObjectIntrospection.cmake
 @@ -122,9 +122,7 @@ macro(gir_add_introspection gir)
@@ -15,7 +24,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  				${INTROSPECTION_SCANNER_ARGS}
  				--namespace=${_gir_namespace}
  				--nsversion=${_gir_version}
-@@ -240,7 +238,6 @@ macro(gir_add_introspection_simple gir_l
+@@ -240,7 +238,6 @@ macro(gir_add_introspection_simple gir_library pkg_export_prefix gir_library_ver
  		${_gir_identifies_prefixes}
  		${_gir_deps}
  		--add-include-path=${SHARE_INSTALL_PREFIX}/gir-1.0
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch
index 51eaf7cfe..b26d8f3b2 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch
@@ -1,7 +1,7 @@
-From 20bd8946a5c73290d961df151e82033171639c0d Mon Sep 17 00:00:00 2001
+From 57dcb88745bea5e14a8d8d2d0e3d0d3876ee8c8a Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Tue, 19 Dec 2017 16:55:13 +0100
-Subject: [PATCH 2/7] CMakeLists.txt: remove CHECK_C_SOURCE_RUNS check
+Subject: [PATCH] CMakeLists.txt: remove CHECK_C_SOURCE_RUNS check
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -16,10 +16,10 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  1 file changed, 23 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index ed99904..9a2e99f 100644
+index 5dfe9ee..42721b3 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -579,29 +579,6 @@ CHECK_C_SOURCE_COMPILES("#include <langinfo.h>
+@@ -619,29 +619,6 @@ CHECK_C_SOURCE_COMPILES("#include <langinfo.h>
  CHECK_C_SOURCE_COMPILES("#include <langinfo.h>
  			int main(void) { char *detail = nl_langinfo (_NL_ADDRESS_COUNTRY_AB2); return 0; }" HAVE__NL_ADDRESS_COUNTRY_AB2)
  
@@ -49,6 +49,3 @@ index ed99904..9a2e99f 100644
  # ******************************
  # system mail stuff
  # ******************************
--- 
-2.21.0
-
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0004-call-native-helpers.patch b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0004-call-native-helpers.patch
index 82f697250..c1d38bd0a 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0004-call-native-helpers.patch
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0004-call-native-helpers.patch
@@ -1,4 +1,4 @@
-From 9c375e3fcf8ff778a5010a07a7da4b6a58adec7c Mon Sep 17 00:00:00 2001
+From 621c3fe47376fe3bb28625114613eb4f636cdba7 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Sun, 31 Mar 2019 19:11:31 +0200
 Subject: [PATCH] call native helpers
@@ -15,7 +15,7 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/addressbook/libebook-contacts/CMakeLists.txt b/src/addressbook/libebook-contacts/CMakeLists.txt
-index e9e3259..e749d1b 100644
+index 480e3f6..fc40b20 100644
 --- a/src/addressbook/libebook-contacts/CMakeLists.txt
 +++ b/src/addressbook/libebook-contacts/CMakeLists.txt
 @@ -25,7 +25,7 @@ target_link_libraries(gen-western-table
@@ -28,10 +28,10 @@ index e9e3259..e749d1b 100644
  )
  
 diff --git a/src/camel/CMakeLists.txt b/src/camel/CMakeLists.txt
-index be626a8..14ac8b8 100644
+index 59bc77a..c5da19c 100644
 --- a/src/camel/CMakeLists.txt
 +++ b/src/camel/CMakeLists.txt
-@@ -10,7 +10,7 @@ target_include_directories(camel-gen-tables PUBLIC
+@@ -20,7 +20,7 @@ target_include_directories(camel-gen-tables PUBLIC
  
  add_custom_command(
  	OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/camel-mime-tables.c
@@ -40,6 +40,3 @@ index be626a8..14ac8b8 100644
  	DEPENDS camel-gen-tables
  )
  
--- 
-2.20.1
-
-- 
2.34.1


