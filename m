Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D79AC02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 08:26:46 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.7588.1738744000589141323
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Feb 2025 00:26:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=relez6GR;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1738744001; x=1770280001;
  h=from:to:cc:subject:date:message-id;
  bh=5Qg7OR7nXzQhIsLpH+HmpOU/i8jYFr39FBOtG53da3w=;
  b=relez6GRhHexEgK4PiJroDgV5fAo1aRBnJbT+aaWcxAq81wRIOltgdPs
   QELnT0HJBmSjBdETmB784WsTqXSZPLUOATw5RZeA2yBYE/cniaKvUzHfg
   egiCYymM78Mf/M9y3EWQ262KUqaPIANRSoHdadAn/UkJQyYzANKQjNegU
   lxk7IQluRR5cjKMGocCYio1C++Wol2NZvrXPWVHMB2yvLAL1551loGEQa
   wCLiLdlYwqiGV9R9aFKypuRBBcvkOb3capm0BEV0zZwrmqnvtNXbiSHhX
   9AWLNm6gV+/oIaweeG5IR58SHVkQKAWAYBXl9gnxRpZGbGOr69keMLYLx
   A==;
X-CSE-ConnectionGUID: OJNDHoy9Qf6JJtrH4z/FrA==
X-CSE-MsgGUID: jvH9z2b8QwqQZK/wo3l3Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="188982730"
X-IronPort-AV: E=Sophos;i="6.13,260,1732546800"; 
   d="scan'208";a="188982730"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 17:26:38 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4A56C7C24E
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Feb 2025 17:26:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 11FBDD8B7D
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Feb 2025 17:26:36 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8626D1A000B;
	Wed,  5 Feb 2025 16:26:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gjs: Fix install conflict when  enable multilib.
Date: Wed,  5 Feb 2025 16:26:29 +0800
Message-Id: <1738743989-16870-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Feb 2025 08:26:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115282

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/libexec/installed-tests/gjs/GIMarshallingTests-1.0.typelib conflicts between attempted installs of lib32-gjs-1.82.1-r0.core2_32 and gjs-1.82.1-r0.core2_64
  file /usr/libexec/installed-tests/gjs/Regress-1.0.typelib conflicts between attempted installs of lib32-gjs-1.82.1-r0.core2_32 and gjs-1.82.1-r0.core2_64
  file /usr/libexec/installed-tests/gjs/Utility-1.0.typelib conflicts between attempted installs of lib32-gjs-1.82.1-r0.core2_32 and gjs-1.82.1-r0.core2_64
  file /usr/libexec/installed-tests/gjs/WarnLib-1.0.typelib conflicts between attempted installs of lib32-gjs-1.82.1-r0.core2_32 and gjs-1.82.1-r0.core2_64

The .typelib file is a binary file that contains runtime information for the GObject type system.
These information include function signature, type size, alignment, etc., which may vary depending on the architecture (32-bit vs 64 bit).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/gjs/gjs_1.82.1.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.82.1.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.82.1.bb
index 55af04e4a5..fd4e9c6f8a 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.82.1.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.82.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8dcea832f6acf45d856abfeb2d51ec48"
 
 DEPENDS = "mozjs-128 cairo"
 
-inherit gnomebase gobject-introspection gettext features_check upstream-version-is-even pkgconfig
+inherit gnomebase gobject-introspection gettext features_check upstream-version-is-even pkgconfig multilib_script
 
 SRC_URI[archive.sha256sum] = "fb39aa5636576de0e5a1171f56a1a5825e2bd1a69972fb120ba78bd109b5693c"
 SRC_URI += " \
@@ -37,3 +37,9 @@ RDEPENDS:${PN}-valgrind += "valgrind"
 # Valgrind not yet available on rv32/rv64
 RDEPENDS:${PN}-valgrind:remove:riscv32 = "valgrind"
 RDEPENDS:${PN}-valgrind:remove:riscv64 = "valgrind"
+
+MULTILIB_SCRIPTS:append = "${PN}:${libexecdir}/installed-tests/gjs/GIMarshallingTests-1.0.typelib \
+                    ${PN}:${libexecdir}/installed-tests/gjs/Regress-1.0.typelib \
+                    ${PN}:${libexecdir}/installed-tests/gjs/Utility-1.0.typelib \
+                    ${PN}:${libexecdir}/installed-tests/gjs/WarnLib-1.0.typelib \
+                    "
-- 
2.43.0


