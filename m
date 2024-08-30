Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF72FCA0ECD
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 00:56:44 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.2567.1724979401367649822
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Aug 2024 17:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZRYMtivg;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724979401; x=1756515401;
  h=from:to:cc:subject:date:message-id;
  bh=DQbl5epyQbu5rPGphA48wcfnO1x8TupCUc+Z4XXTaUk=;
  b=ZRYMtivgKEqEhriyK1Heg5XwLESOgkq4auHZjNydf+dfPt2GCqiRP2LI
   eXnciL2J4O9BLkJzvJL1BqkgTM+EtdkKtoQGBq1+RB89oySzWXZ7YaGYb
   JQ5SvOQWm31SGkpjdGOsGiO4CoVujEX2zhn6BnI1dHLo1cujJuV1015tv
   wnMDrFZe+F9LVufOwNoq/1LX3Hq/gmJyQQpExsSz/CRdi4QExTNRbnyXo
   ElqPwEQ0UtTAWZX1vtE6X8+JT2xK/tLjLSqFxQJkFpLbRgRh7MoSAvS/S
   XfoBn/74LcSuZeFNNHbO56whmiaEdkWlkq+dFNYRUyySa4ZCQ6LeYFy7y
   g==;
X-CSE-ConnectionGUID: IfiSH7BYTCi7y812tf3H7Q==
X-CSE-MsgGUID: JMA8vAu+QlWd/vW2794/6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="172219247"
X-IronPort-AV: E=Sophos;i="6.10,187,1719846000"; 
   d="scan'208";a="172219247"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 09:56:38 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 99C57D5A46
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 09:56:36 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D7719D549A
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 09:56:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6589220081323
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 09:56:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D51491A0002;
	Fri, 30 Aug 2024 08:56:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] lastlog2: remove recipe since it has  been merged into util-linux
Date: Fri, 30 Aug 2024 08:56:30 +0800
Message-Id: <1724979390-16559-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28628.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28628.003
X-TMASE-Result: 10--1.902300-10.000000
X-TMASE-MatchedRID: XlsFykBqdyQRcrxK+AdK77U+IyHhkXf1sat+wgYyTWyjEIt+uIPPOJUh
	t+myr0XM28kKXD7bCdnGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BSuvtBzlaEqEPRcdZ0KZk8Z6g
	74IvJxeSKbindmE5bmJu91RWVjlmQIYiqWqYhUFI7Cl8sx4HBG67YaZ2V2aJQ+cbDHfpxITXGD0
	/NuzV8Cxab+AC2MJ3sTL6ux7wE5fDIY6JevWs4vlk1hIeTdmvRMrX+p1uNztBvdIm9AxfnXgJsf
	U4xXHDpLWjrz2LT/1O0bnmXZseGk91SmtXVFKbJngIgpj8eDcBpkajQR5gb3t/C2riNn8beKrau
	Xd3MZDUY0jjCsbzh1cF2/SYyxiMcBF7PSeJgMyKWcgEBTjWJTj8nIMlaHAk60ff6oh1joGUJ9kN
	8DBAQgQsgPjsrXgI6tO1sK7Z4xpz87Nf3vaFHKFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLW
	lXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 00:56:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112039

From: Wang Mingyu <wangmy@fujitsu.com>

The lastlog2 has been merged into util-linux:
https://github.com/thkukuk/lastlog2/commit/60bea9dcee0fa18ea3dce0372a14f5e4f177ada6

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lastlog2/lastlog2_1.3.1.bb                | 36 -------------------
 1 file changed, 36 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/lastlog2/lastlog2_1.3.1.bb

diff --git a/meta-oe/recipes-extended/lastlog2/lastlog2_1.3.1.bb b/meta-oe/recipes-extended/lastlog2/lastlog2_1.3.1.bb
deleted file mode 100644
index ebabcfd40..000000000
--- a/meta-oe/recipes-extended/lastlog2/lastlog2_1.3.1.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "Y2038 safe version of lastlog"
-HOMEPAGE = "https://github.com/thkukuk/lastlog2"
-DESCRIPTION = "lastlog reports the last login of a given user or of all users who did ever login on a system."
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=020090a00b69dd2af9ab82eb0003ea2c"
-SECTION = "libs"
-
-SRCREV = "8a743b6559e7b8a9b40747866054d3fb5041a498"
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


