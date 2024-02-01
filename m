Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BABC47DDF
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 08:15:30 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.10877.1706775323495517647
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Feb 2024 00:15:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mh/1YXK1;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706775323; x=1738311323;
  h=from:to:cc:subject:date:message-id;
  bh=BWlefsUuqY/4O7rUOFTrZG1YxWN8cbNxWild3EV+qec=;
  b=mh/1YXK1Le8KhjPzyZddRR6cA/zLDw+r9vMqTqbrJACvfb2wkVtqm7We
   nOIUeE1EG2j7krkD4MsrbJlQlXzzv7FHs8xAUsHqJnTCf6X1O0nGK13EZ
   k4zOX75XsNVamgw0nGM+4yutwzAt73hwfwOo0wZvWG7JsCd4qnJ0hyhF5
   1Qdb9h+sruVrEgXYZSO1mEjQc+s4mxqZZy7+U7H6UIy/hBWu5FLGAp4fw
   LmrsJB+WYuvigsXv50RKHHhxDDXowVxH8oZCuG2JNaJGRldSY9FyVQtex
   c4txm1h4ipbOecw6Ipw0m1lSxwl7BxSCqdlWYgbP03RXd0DP5FnYuOsK3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="127333901"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="127333901"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 17:15:20 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C7251ACAE7
	for <openembedded-devel@lists.openembedded.org>; Thu,  1 Feb 2024 17:15:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6EEB6D5635
	for <openembedded-devel@lists.openembedded.org>; Thu,  1 Feb 2024 17:15:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0485B220035
	for <openembedded-devel@lists.openembedded.org>; Thu,  1 Feb 2024 17:15:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 68F761A006D;
	Thu,  1 Feb 2024 16:15:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cmocka: Fix install conflict when enable multilib.
Date: Thu,  1 Feb 2024 16:15:08 +0800
Message-Id: <1706775308-14117-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.001
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.001
X-TMASE-Result: 10--1.596200-10.000000
X-TMASE-MatchedRID: hVaMx/vKxVStxhXyTqc02bstbCLHbulS96ryTp77YeFmvlFgD9KKSEwV
	UEAID5kTCC8aAmGeO6lV00+whwxVQy/7QU2czuUNA9lly13c/gEytf6nW43O0OTDRyP4fmgwo8W
	MkQWv6iXBcIE78YqRWo6HM5rqDwqtwTWfwxr/Xs7g1mQqitfDUPXY9GJl6zngYuXtPqU/YbgBjg
	oMO0II8Xs6czJXxJ7DypvzTWOo64c/siUUKtySBHoF7WNob2noHSbhGbmGylXFJK7yLnZRGZdO3
	Q67ImL8gi4RUz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Feb 2024 08:15:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108516

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/share/cmocka/example/mock/libproc_uptime.so conflicts between attempted installs of lib32-libcmocka-examples-1.1.7+git0+a01cc69ee9-r0.armv7ahf_neon and libcmocka-examples-1.1.7+git0+a01cc69ee9-r0.cortexa57

Change install directory from share to lib to resolve conflict.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb b/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
index 44077a0d3..7461fcc4d 100644
--- a/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
+++ b/meta-oe/recipes-test/cmocka/cmocka_1.1.7.bb
@@ -22,15 +22,15 @@ EXTRA_OECMAKE += "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCMAKE_BUILD_TYPE
 LTO = ""
 
 do_install:append () {
-    install -d ${D}${datadir}/${BPN}/example
-    install -d ${D}${datadir}/${BPN}/example/mock/chef_wrap
-    install -d ${D}${datadir}/${BPN}/example/mock/uptime
-
-    install -m 0755 ${B}/example/*_test ${D}/${datadir}/${BPN}/example
-    install -m 0755 ${B}/example/mock/chef_wrap/waiter_test_wrap ${D}/${datadir}/${BPN}/example/mock/chef_wrap
-    install -m 0755 ${B}/example/mock/uptime/uptime ${D}/${datadir}/${BPN}/example/mock/uptime
-    install -m 0755 ${B}/example/mock/uptime/test_uptime ${D}/${datadir}/${BPN}/example/mock/uptime
-    install -m 0644 ${B}/example/mock/uptime/libproc_uptime.so ${D}/${datadir}/${BPN}/example/mock/libproc_uptime.so
+    install -d ${D}${libdir}/${BPN}/example
+    install -d ${D}${libdir}/${BPN}/example/mock/chef_wrap
+    install -d ${D}${libdir}/${BPN}/example/mock/uptime
+
+    install -m 0755 ${B}/example/*_test ${D}/${libdir}/${BPN}/example
+    install -m 0755 ${B}/example/mock/chef_wrap/waiter_test_wrap ${D}/${libdir}/${BPN}/example/mock/chef_wrap
+    install -m 0755 ${B}/example/mock/uptime/uptime ${D}/${libdir}/${BPN}/example/mock/uptime
+    install -m 0755 ${B}/example/mock/uptime/test_uptime ${D}/${libdir}/${BPN}/example/mock/uptime
+    install -m 0644 ${B}/example/mock/uptime/libproc_uptime.so ${D}/${libdir}/${BPN}/example/mock/libproc_uptime.so
 }
 
 do_install_ptest () {
@@ -40,5 +40,4 @@ do_install_ptest () {
 
 PACKAGE_BEFORE_PN += "${PN}-examples"
 
-FILES:${PN}-examples = "${datadir}/${BPN}/example"
-INSANE_SKIP:${PN}-examples = "libdir"
+FILES:${PN}-examples = "${libdir}/${BPN}/example"
-- 
2.34.1


