Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C99EC02182
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 02:53:49 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.3428.1737687225364197879
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jan 2025 18:53:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cJHerVUS;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737687226; x=1769223226;
  h=from:to:cc:subject:date:message-id;
  bh=/XLBFYlKQHxIaJfAoGv8bqeaRcmcGPeTSas8CpmDMUU=;
  b=cJHerVUSU6BH9mAeyeWX7HD8PHXagnJ4HwgiToB4KLegd0XeEo8/px8f
   k1Tz/hgGqM34apqC7FlCINs8f3esFFQvHUH7RGjG9FPe6EKPrZQgpnkVt
   97O7uRchNIOEe/MIKkvKWtcBTcKb+y+NAY9BZAB/YaRiw/YwybVTMb2PM
   +wkvfKrrGfqv9NOW+yXtWK3JcmacZRFwAZMrdP/jfFFd9vVAfatHp8wBe
   AOuBIFvdHT4PxsWSTgIRsVXJAz53yBjZdgDkD6lAAPuRyNovzYFTRswRK
   Yt4Jx0cTVG8vqubzJt/h0ajRlSeUS/StO18xjo6qHLH/oByt/Da5XSeH+
   g==;
X-CSE-ConnectionGUID: Y6AW3uPiTPO8Ulzl0Jt1Rg==
X-CSE-MsgGUID: wkfylQFgQcaK+dNDWaBFmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="190107962"
X-IronPort-AV: E=Sophos;i="6.13,230,1732546800"; 
   d="scan'208";a="190107962"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 11:53:43 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 52440D500C
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 11:53:40 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1E20FD50FB
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 11:53:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 865B76B4EE
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 11:53:39 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0989C1A000B;
	Fri, 24 Jan 2025 10:53:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] smarty: update 4.5.5 -> 5.4.2
Date: Fri, 24 Jan 2025 10:53:35 +0800
Message-Id: <1737687215-11485-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28942.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28942.004
X-TMASE-Result: 10--6.863000-10.000000
X-TMASE-MatchedRID: B4VcMIpPJ83RhEyb9f1sjvLeH1FBnhK0CZa9cSpBObmkob0Y35+HFOvn
	/O99cHKFlHVH/UHDB9Hmn3xyPJAJoo3oygjMeK7eSs47mbT7SAQXjfR3d0weRllDV0KgHSWHh+t
	oLLKXwRFaXB4a+1zK4ndNoXv6UJm+uEVa2AYyQQm3D7EeeyZCM5iQDIJsDspXsp5O052MzLqbV4
	X+HXCyWRh5GPceNmDj6OG4wZVzsQH3FZ31mJ166AvBTB90+he+fS0Ip2eEHnyFh/DzryTTljOrH
	oO19Vm2joczmuoPCq0Y3lWAXSb8w/tjj+6hcX3Goi3QbzxLfPR5lcKOQ1xSg8Qn7PUS8cgYj/iM
	yh0meCNhRyTmXlK7djN0AWnpB297JGeZfctgEsUdJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhF
	TP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 02:53:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115046

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/smarty/smarty_4.5.5.bb    | 28 -------------
 .../recipes-support/smarty/smarty_5.4.2.bb    | 40 +++++++++++++++++++
 2 files changed, 40 insertions(+), 28 deletions(-)
 delete mode 100644 meta-oe/recipes-support/smarty/smarty_4.5.5.bb
 create mode 100644 meta-oe/recipes-support/smarty/smarty_5.4.2.bb

diff --git a/meta-oe/recipes-support/smarty/smarty_4.5.5.bb b/meta-oe/recipes-support/smarty/smarty_4.5.5.bb
deleted file mode 100644
index e8a63a74a7..0000000000
--- a/meta-oe/recipes-support/smarty/smarty_4.5.5.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "the compiling PHP template engine"
-SECTION = "console/network"
-HOMEPAGE = "https://www.smarty.net/"
-
-LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
-
-DEPENDS += "php"
-
-SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=support/4"
-
-SRCREV = "c4851c12e34ff80073ddeb7d98b059d57dea9de2"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-        install -d ${D}${datadir}/php/smarty3/libs/
-        install -m 0644 ${S}/libs/*.php ${D}${datadir}/php/smarty3/libs/
-
-        install -d ${D}${datadir}/php/smarty3/libs/plugins
-        install -m 0644 ${S}/libs/plugins/*.php ${D}${datadir}/php/smarty3/libs/plugins/
-
-        install -d ${D}${datadir}/php/smarty3/libs/sysplugins
-        install -m 0644 ${S}/libs/sysplugins/*.php ${D}${datadir}/php/smarty3/libs/sysplugins/
-}
-FILES:${PN} = "${datadir}/php/smarty3/"
-
-CVE_STATUS[CVE-2020-10375] = "cpe-incorrect: The recipe used in the meta-openembedded is a different smarty package compared to the one which has the CVE issue."
diff --git a/meta-oe/recipes-support/smarty/smarty_5.4.2.bb b/meta-oe/recipes-support/smarty/smarty_5.4.2.bb
new file mode 100644
index 0000000000..95673e2bb9
--- /dev/null
+++ b/meta-oe/recipes-support/smarty/smarty_5.4.2.bb
@@ -0,0 +1,40 @@
+SUMMARY = "Template engine for PHP"
+DESCRIPTION = "\
+    Smarty facilitates the separation of presentation (HTML/CSS) from \
+    application logic. This implies that PHP code is application logic, and is \
+    separated from the presentation. \
+"
+HOMEPAGE = "https://smarty-php.github.io/smarty/"
+BUGTRACKER = "https://github.com/smarty-php/smarty/issues"
+
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
+
+SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master"
+
+SRCREV = "642a97adcc2bf6c1b2458d6afeeb36ae001c1c2f"
+
+S = "${UNPACKDIR}/git"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+inherit allarch
+
+# `make clean` removes files, they can't be rebuild with `make all` 
+CLEANBROKEN = "1"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+do_install() {
+        install -d ${D}${datadir}/php/smarty3/libs/
+        install -m 0644 ${S}/libs/*.php ${D}${datadir}/php/smarty3/libs/
+
+        install -d ${D}${datadir}/php/smarty3/src/
+        cp -rf ${S}/src/* ${D}${datadir}/php/smarty3/src/
+}
+FILES:${PN} += "${datadir}/php/smarty3/"
+
+RDEPENDS:${PN} = "php"
+
+CVE_STATUS[CVE-2020-10375] = "cpe-incorrect: The recipe used in the meta-openembedded is a different smarty package compared to the one which has the CVE issue."
-- 
2.43.0


