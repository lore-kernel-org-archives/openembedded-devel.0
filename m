Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6340C47258
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 06:36:06 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.17503.1706855761101838347
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Feb 2024 22:36:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XxexbR3q;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706855760; x=1738391760;
  h=from:to:cc:subject:date:message-id;
  bh=rHgWB9iZxbpwi4cZNRl3hJXJwcMxKwmF8MvKR3rn0Qg=;
  b=XxexbR3qnhbgaCu1Engn/yL4BZRDBDWw6FnPFZ0+xZADtTnzL1aUgac1
   9qZShYDhz1MHLS3cH8X7rR4sh/ya1+wf5t1USId4EuZadgzouIyFxOrqr
   lt1cU6dvnepeJRkXVuweWPn7544l/cNbuTZWmywng1OC44sObkKYOrE9f
   zVDzXDfobBii3vs0O7Et0wDCDI96T3W42rVr92EooIoP4O1ArGGhSTnuD
   WyZ5AcXyiGYUITET6SEi8vflikTenEJ/srf0eLKGLsfHN2jVk8UHn7+Ec
   ckUnYsLyvf9yAPh9gExHeqdZgErIZvM1hjsSGviwUq+nQK49cwPXWQQnY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="149846451"
X-IronPort-AV: E=Sophos;i="6.05,237,1701097200"; 
   d="scan'208";a="149846451"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 15:35:56 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D8306DB832
	for <openembedded-devel@lists.openembedded.org>; Fri,  2 Feb 2024 15:35:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 097A7F36F8
	for <openembedded-devel@lists.openembedded.org>; Fri,  2 Feb 2024 15:35:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 85D37200989B8
	for <openembedded-devel@lists.openembedded.org>; Fri,  2 Feb 2024 15:35:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F3A771A006A;
	Fri,  2 Feb 2024 14:35:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 1/2] czmq: Fix install conflict when enable multilib.
Date: Fri,  2 Feb 2024 14:35:45 +0800
Message-Id: <1706855746-22640-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28158.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28158.005
X-TMASE-Result: 10--0.258800-10.000000
X-TMASE-MatchedRID: J8Qxq5eo31GtxhXyTqc02bstbCLHbulS96ryTp77YeG4GyTmeN+AbEaF
	+/5G+w6gaO3T8isc/8bLfuIBuocCTMQTSPZE5H8goHDoEp2TszEJlr1xKkE5uVkHcf3JmAmkxWM
	QQTjSQM0ILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q0D2WXLXdz+AcF6LYOqbPfhLQOOgimiPKajxY
	yRBa/qJcFwgTvxipFajoczmuoPCq0T6doHO1NZIpzhv3/nppzseF40FC7UaRNePWoYxz7mjo3V2
	uTp48VDyvQ/vA48yAeIdXARXRogYWqvmlfBU/5oqGXlbR3nZ9EdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 06:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108526

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/share/cmake/czmq/czmqConfigVersion.cmake conflicts between attempted installs of lib32-libczmq-dev-4.2.1-r0.armv7ahf_neon and libczmq-dev-4.2.1-r0.cortexa57
  file /usr/share/cmake/czmq/czmqTargets-release.cmake conflicts between attempted installs of lib32-libczmq-dev-4.2.1-r0.armv7ahf_neon and libczmq-dev-4.2.1-r0.cortexa57
  file /usr/share/cmake/czmq/czmqTargets.cmake conflicts between attempted installs of lib32-libczmq-dev-4.2.1-r0.armv7ahf_neon and libczmq-dev-4.2.1-r0.cortexa57

The differences of czmqConfigVersion.cmake are as follows:
@@ -31,13 +31,13 @@


 # if the installed or the using project don't have CMAKE_SIZEOF_VOID_P set, ignore it:
-if("${CMAKE_SIZEOF_VOID_P}" STREQUAL "" OR "4" STREQUAL "")
+if("${CMAKE_SIZEOF_VOID_P}" STREQUAL "" OR "8" STREQUAL "")
   return()
 endif()

 # check that the installed version has the same 32/64bit-ness as the one which is currently searching:
-if(NOT CMAKE_SIZEOF_VOID_P STREQUAL "4")
-  math(EXPR installedBits "4 * 8")
+if(NOT CMAKE_SIZEOF_VOID_P STREQUAL "8")
+  math(EXPR installedBits "8 * 8")
   set(PACKAGE_VERSION "${PACKAGE_VERSION} (${installedBits}bit)")
   set(PACKAGE_VERSION_UNSUITABLE TRUE)
 endif()


The differences of czmqTargets-release.cmake are as follows:
@@ -8,22 +8,22 @@
 # Import target "czmq" for configuration "Release"
 set_property(TARGET czmq APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
 set_target_properties(czmq PROPERTIES
-  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libczmq.so.4.2.1"
+  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib64/libczmq.so.4.2.1"
   IMPORTED_SONAME_RELEASE "libczmq.so.4"
   )

 list(APPEND _cmake_import_check_targets czmq )
-list(APPEND _cmake_import_check_files_for_czmq "${_IMPORT_PREFIX}/lib/libczmq.so.4.2.1" )
+list(APPEND _cmake_import_check_files_for_czmq "${_IMPORT_PREFIX}/lib64/libczmq.so.4.2.1" )

 # Import target "czmq-static" for configuration "Release"
 set_property(TARGET czmq-static APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
 set_target_properties(czmq-static PROPERTIES
   IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
-  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libczmq.a"
+  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib64/libczmq.a"
   )

 list(APPEND _cmake_import_check_targets czmq-static )
-list(APPEND _cmake_import_check_files_for_czmq-static "${_IMPORT_PREFIX}/lib/libczmq.a" )
+list(APPEND _cmake_import_check_files_for_czmq-static "${_IMPORT_PREFIX}/lib64/libczmq.a" )


The differences of czmqTargets.cmake are as follows:
@@ -60,7 +60,7 @@

 set_target_properties(czmq PROPERTIES
   INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
-  INTERFACE_LINK_LIBRARIES "/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/armv7ahf-neon-pokymllib32-linux-gnueabi/lib32-czmq/4.2.1/lib32-recipe-sysroot/usr/lib/libzmq.so;/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/armv7ahf-neon-pokymllib32-linux-gnueabi/lib32-czmq/4.2.1/lib32-recipe-sysroot/usr/lib/libuuid.so;/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/armv7ahf-neon-pokymllib32-linux-gnueabi/lib32-czmq/4.2.1/lib32-recipe-sysroot/usr/lib/libsystemd.so;/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/armv7ahf-neon-pokymllib32-linux-gnueabi/lib32-czmq/4.2.1/lib32-recipe-sysroot/usr/lib/liblz4.so;/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/armv7ahf-neon-pokymllib32-linux-gnueabi/lib32-czmq/4.2.1/lib32-recipe-sysroot/usr/lib/libcurl.so"
+  INTERFACE_LINK_LIBRARIES "/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/cortexa57-poky-linux/czmq/4.2.1/recipe-sysroot/usr/lib64/libzmq.so;/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/cortexa57-poky-linux/czmq/4.2.1/recipe-sysroot/usr/lib64/libuuid.so;/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/cortexa57-poky-linux/czmq/4.2.1/recipe-sysroot/usr/lib64/libsystemd.so;/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/cortexa57-poky-linux/czmq/4.2.1/recipe-sysroot/usr/lib64/liblz4.so;/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/cortexa57-poky-linux/czmq/4.2.1/recipe-sysroot/usr/lib64/libcurl.so"
 )

 # Create imported target czmq-static
@@ -69,7 +69,7 @@
 set_target_properties(czmq-static PROPERTIES
   INTERFACE_COMPILE_DEFINITIONS "CZMQ_STATIC"
   INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
-  INTERFACE_LINK_LIBRARIES "/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/armv7ahf-neon-pokymllib32-linux-gnueabi/lib32-czmq/4.2.1/lib32-recipe-sysroot/usr/lib/libzmq.so;/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/armv7ahf-neon-pokymllib32-linux-gnueabi/lib32-czmq/4.2.1/lib32-recipe-sysroot/usr/lib/libuuid.so;/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/armv7ahf-neon-pokymllib32-linux-gnueabi/lib32-czmq/4.2.1/lib32-recipe-sysroot/usr/lib/libsystemd.so;/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/armv7ahf-neon-pokymllib32-linux-gnueabi/lib32-czmq/4.2.1/lib32-recipe-sysroot/usr/lib/liblz4.so;/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/armv7ahf-neon-pokymllib32-linux-gnueabi/lib32-czmq/4.2.1/lib32-recipe-sysroot/usr/lib/libcurl.so"
+  INTERFACE_LINK_LIBRARIES "/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/cortexa57-poky-linux/czmq/4.2.1/recipe-sysroot/usr/lib64/libzmq.so;/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/cortexa57-poky-linux/czmq/4.2.1/recipe-sysroot/usr/lib64/libuuid.so;/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/cortexa57-poky-linux/czmq/4.2.1/recipe-sysroot/usr/lib64/libsystemd.so;/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/cortexa57-poky-linux/czmq/4.2.1/recipe-sysroot/usr/lib64/liblz4.so;/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/cortexa57-poky-linux/czmq/4.2.1/recipe-sysroot/usr/lib64/libcurl.so"
 )


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
index ce9d758d9..32be9cd09 100644
--- a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
+++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
@@ -15,9 +15,13 @@ inherit cmake pkgconfig
 
 PACKAGES = "lib${BPN} lib${BPN}-dev lib${BPN}-staticdev ${PN} ${PN}-dbg"
 
+EXTRA_OECMAKE = " \
+    -DCMAKECONFIG_INSTALL_DIR:PATH=${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix') + '/') + "/cmake/"} \
+"
+
 FILES:${PN} = "${bindir}/*"
 FILES:lib${BPN} = "${libdir}/*.so.*"
-FILES:lib${BPN}-dev = "${libdir}/*.so ${libdir}/pkgconfig ${includedir} ${datadir}/cmake"
+FILES:lib${BPN}-dev = "${libdir}/*.so ${libdir}/pkgconfig ${includedir} ${libdir}/cmake"
 FILES:lib${BPN}-staticdev = "${libdir}/lib*.a"
 
 RDEPENDS:lib${BPN}-dev = "zeromq-dev"
-- 
2.34.1


