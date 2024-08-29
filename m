Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7B7C77B7A
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 06:20:42 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.6337.1724912437770704331
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 23:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QtEIS+3n;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724912438; x=1756448438;
  h=from:to:cc:subject:date:message-id;
  bh=EgQijhgNaSvCYw5VQP24ZwfZVe5bPO1anxJYXpp9D78=;
  b=QtEIS+3nURW2Bu/rnkI6Lcq90sORYNVFjn1Rc82/nRTx7e9axLmyplFy
   rEWi5ZWOCKXeQ9w58kSk5EHUkdPryWo9MSpWw9GGiUDez/3tsZXP56COB
   MF0UnFOzcb/FN3gNrufiOITZgwTVRWIyVvdlwF9JCaH7EcrX+MWhv+ing
   PFQd4GOF5m9egdX8RIbHUzo9b2Ny+DqFufi8SSqn13FFLq0A+Pv7TYS9/
   fQczikdBlKqMRUYS9oSZUfWzcdTXQUwfBAf0ua0iftNqyUxS6i7xdAKUM
   beBqvHOyt5c6qgxsGJ00owjGswKGK05QCEcW+qOXDhW+zgtGS7SAX4XBQ
   g==;
X-CSE-ConnectionGUID: BVFe3T9YSf+UbgvpzKwLDQ==
X-CSE-MsgGUID: vtCR46+JSIS+WJIEmJaCGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="159391542"
X-IronPort-AV: E=Sophos;i="6.10,184,1719846000"; 
   d="scan'208";a="159391542"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 15:20:34 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 62296D64AF
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 15:20:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B35B6BF4AE
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 15:20:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E6B72007CDF0
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 15:20:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B6FD41A000B;
	Thu, 29 Aug 2024 14:20:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] lastlog2: remove recipe since it has been merged into util-linux
Date: Thu, 29 Aug 2024 14:20:26 +0800
Message-Id: <1724912426-9977-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28626.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28626.005
X-TMASE-Result: 10--1.902300-10.000000
X-TMASE-MatchedRID: XlsFykBqdyQRcrxK+AdK77U+IyHhkXf1sat+wgYyTWyjEIt+uIPPOJUh
	t+myr0XM28kKXD7bCdnGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BSuvtBzlaEqEPRcdZ0KZk8Z6g
	74IvJxeSKbindmE5bmJu91RWVjlmQIYiqWqYhUFI7Cl8sx4HBG67YaZ2V2aJQ+cbDHfpxITXGD0
	/NuzV8Cxab+AC2MJ3sTL6ux7wE5fDIY6JevWs4vlk1hIeTdmvRMrX+p1uNztBvdIm9AxfnXgJsf
	U4xXHDpLWjrz2LT/1O0bnmXZseGk91SmtXVFKbJngIgpj8eDcBpkajQR5gb3t/C2riNn8beKrau
	Xd3MZDU1qnetUPxv5Lzb26JHLEXa4Zx/qVBF0C9Ps7uQj78vFvc8iYnyCaW90ff6oh1joGUJ9kN
	8DBAQgQsgPjsrXgI6tO1sK7Z4xpz87Nf3vaFHKFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLW
	lXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 06:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112032

From: Wang Mingyu <wangmy@fujitsu.com>

The lastlog2 has been merged into util-linux:
https://github.com/thkukuk/lastlog2/commit/60bea9dcee0fa18ea3dce0372a14f5e4f177ada6

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lastlog2/lastlog2_1.2.0.bb                | 36 -------------------
 1 file changed, 36 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/lastlog2/lastlog2_1.2.0.bb

diff --git a/meta-oe/recipes-extended/lastlog2/lastlog2_1.2.0.bb b/meta-oe/recipes-extended/lastlog2/lastlog2_1.2.0.bb
deleted file mode 100644
index 0b3ab1f82..000000000
--- a/meta-oe/recipes-extended/lastlog2/lastlog2_1.2.0.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "Y2038 safe version of lastlog"
-HOMEPAGE = "https://github.com/thkukuk/lastlog2"
-DESCRIPTION = "lastlog reports the last login of a given user or of all users who did ever login on a system."
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=020090a00b69dd2af9ab82eb0003ea2c"
-SECTION = "libs"
-
-SRCREV = "6138dff6f2a5216065fa4833a223b56d98cb62f3"
-
-SRC_URI = "git://github.com/thkukuk/lastlog2.git;branch=main;protocol=https \
-           file://0001-remove-lto-to-fix-link-error-of-clang.patch \
-"
-
-S = "${WORKDIR}/git"
-
-inherit meson pkgconfig systemd features_check
-
-DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} sqlite3 "
-REQUIRED_DISTRO_FEATURES = "pam"
-
-SYSTEMD_SERVICE:${PN} = "lastlog2-import.service"
-
-EXTRA_OEMESON = " -Dpamlibdir=${base_libdir}/security"
-
-do_install:append () {
-      if [ -d ${D}${prefix}/lib/systemd -a ${D}${prefix}/lib != `dirname ${D}${systemd_unitdir}` ]; then
-          # Fix makefile hardcoded path assumptions for systemd (assumes $prefix)
-          # without usrmerge distro feature enabled
-          install -d `dirname ${D}${systemd_unitdir}`
-          mv ${D}${prefix}/lib/systemd `dirname ${D}${systemd_unitdir}`
-      fi
-}
-
-FILES:${PN} += " ${systemd_system_unitdir} "
-FILES:${PN} += " ${libdir} "
-FILES:${PN} += " ${nonarch_libdir}/tmpfiles.d/* "
-- 
2.34.1


