Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78D1D44018
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:16 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.37263.1731922210075530382
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tUT8is7Y;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922210; x=1763458210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=3cHm5VtuiD0wjuMVB7O2IXFHVVeqPcPG+me2ln37ACg=;
  b=tUT8is7YMdepqSVryTXjTcZe4YvfoFuO/QwlkvGsCR/QGTGtz9UK15EM
   G3Q5B2g1qE6P3JldHSvGDv8MNC7jSODoJoUuAAByCVwv51NY8MXVIoDn4
   zcmMIm6GcoFMR7l+2qLYavMpjcsyQllyzRipQCAd/CJ2IrAr0vtHKKz4e
   2udYevLMgkRhG70s0FKqMcpESrDigxKp0zCjAi92ZgnzAJU1JUyhFUBzL
   9zzCCkyRLkispdreM9+7kxMYbzenNvPB5oA9o+38Lv4OWsGsC1ryRfNPu
   rd5KhCgKSI/ZsoMRM1TpPlxSt09IrVdz/qXv7d/XMa+1Ql61d53hKbnl/
   A==;
X-CSE-ConnectionGUID: P2EVK/aGSk6F0A00nMnm4g==
X-CSE-MsgGUID: dn12YkjbR8aJAemOZ6A6SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="183056062"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="183056062"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:07 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A863BDBB89
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:05 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A8B2E42A1
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BEC8C2007CA87
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:04 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6EE511A000B;
	Mon, 18 Nov 2024 17:30:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/32] libblockdev: upgrade 3.2.0 -> 3.2.1
Date: Mon, 18 Nov 2024 17:29:28 +0800
Message-Id: <1731922195-5266-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10--4.112200-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrjeDfyjN4mgffc2Xd6VJ+yjur
	Vh7NYTzjAzcLC7Tow8TcDeX4EkgAiSupJvqHf1A8a87CDXaKRVILwteD+QnyUNzF9+c9xkabn0y
	b56lxfCuW7B9aJpMK4eSNp8ThQ5CdAM0/G7XUdeM/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bqjWdM+b7wddNIi7EG8+unOS2jwAoINujmgws6g0ewz22FA7wK9mP9c0EE1cHlv0zLsVj
	+wJQ/DTu+U+TVUiqnWAMuqetGVetnyef22ep6XYxlblqLlYqXJL531YmrBLSlbKJG8Zxw5T+AEC
	V8mxXyUwWEI8S/sxjPbRguOTZkNx8WdThcmMENqK3mqaf2zsvzlwyERt+6oDDusJmc+Kn6H+v9v
	52ZIoWjoAf389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113871

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- crypto: check that IOC_OPAL_GET_STATUS is defined
- smart: Clarify use of ID_ATA_SMART_ACCESS udev property
- smart: Clarify ID_ATA_SMART_ACCESS udev property values
- nvme: Avoid element-type g-i annotations
- README: Update supported technologies
- dist: Fix source URL in spec
- packit: Fix generating spec from template
- dist: Sync spec with downstream
- misc: Fix installing test dependencies on Debian/Ubuntu
- ci: Do not try to install test dependencies for CodeQL analysis
- lvm: Clarify the global config functionallity in libblockdev
- ci: Install 'python3-libdnf5' for TMT test plans
- Makefile: Fix generating RPM log during bumpver

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libblockdev_3.2.0.bb => libblockdev_3.2.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_3.2.0.bb => libblockdev_3.2.1.bb} (96%)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.0.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
similarity index 96%
rename from meta-oe/recipes-extended/libblockdev/libblockdev_3.2.0.bb
rename to meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
index baf2acca5..5a685fc74 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.0.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
@@ -12,10 +12,10 @@ inherit autotools gobject-introspection pkgconfig lib_package
 
 DEPENDS = "autoconf-archive-native glib-2.0 kmod udev libnvme"
 
-SRC_URI = "git://github.com/storaged-project/libblockdev;branch=master;protocol=https \
+SRC_URI = "git://github.com/storaged-project/libblockdev;branch=3.2.x-branch;protocol=https \
            file://0001-fix-pythondir-for-multilib-when-cross-compiling.patch \
            "
-SRCREV = "27881cb6e57eb0146c51d032ea72fbb3cd6bda7e"
+SRCREV = "b829b60d9ff049abb190f09a3b9a5fac648cd5a3"
 S = "${WORKDIR}/git"
 
 FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}"
-- 
2.34.1


