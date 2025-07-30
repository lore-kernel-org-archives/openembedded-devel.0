Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2B3C87FCC
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:19 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.31372.1753869308718567579
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MTZKNQsX;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869310; x=1785405310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ERnGi+OAopnHSWm09H/zNn0zOWnipLZqvbPuwrOMwSo=;
  b=MTZKNQsXv7ttbJCw89S9mnMzm5J3JPjqayILpCCGbQB6XgrZkIPdPDHP
   vg3BXEb6WmKRHUvV7tZBW4XZczC9tKkvBiiSUJWf7SX7Tdh35JTnkW231
   tKq3Oi4IA2ZpAhI7lcNFfdeMayB1IPbpEaEuZin6hLXgsT5xRf9C6/QDp
   Q5MT39CBfXDfuxBwyTIXTLIbqP3iJ4uboap1aeMzZkVaYXJxWG4OnE2uM
   c/gk+oPo94r3UQ2k+2QSOzglAt9lOryy3Cu/MO6ZzL/UZceRFvxTSSO9B
   RuamKD8rrVyDnNrjPeGEHFc/CVxZ9n9jKcm91x7+xwWFjwBw3bTCj1z/i
   A==;
X-CSE-ConnectionGUID: Mve0QM9FQxydPKHZTdpE7w==
X-CSE-MsgGUID: ygwOjbDTQFS9IKsCeC9YSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="211191712"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="211191712"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:09 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id E9A0D42A305
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:08 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 5501A1802AF4
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 50BAF1A00AE;
	Wed, 30 Jul 2025 17:55:05 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 19/40] pcp: upgrade 6.3.7 -> 6.3.8
Date: Wed, 30 Jul 2025 17:54:35 +0800
Message-ID: <20250730095456.695-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118784

From: Wang Mingyu <wangmy@fujitsu.com>

0001-htop-Change-dependency-order-of-header-and-sourcefil.patch
refreshed for 6.3.8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pcp/{pcp-native_6.3.7.bb => pcp-native_6.3.8.bb}        | 1 +
 meta-oe/recipes-support/pcp/pcp.inc                         | 4 ++--
 ...op-Change-dependency-order-of-header-and-sourcefil.patch | 6 ++++--
 meta-oe/recipes-support/pcp/{pcp_6.3.7.bb => pcp_6.3.8.bb}  | 0
 4 files changed, 7 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/pcp/{pcp-native_6.3.7.bb => pcp-native_6.3.8.bb} (99%)
 rename meta-oe/recipes-support/pcp/{pcp_6.3.7.bb => pcp_6.3.8.bb} (100%)

diff --git a/meta-oe/recipes-support/pcp/pcp-native_6.3.7.bb b/meta-oe/recipes-support/pcp/pcp-native_6.3.8.bb
similarity index 99%
rename from meta-oe/recipes-support/pcp/pcp-native_6.3.7.bb
rename to meta-oe/recipes-support/pcp/pcp-native_6.3.8.bb
index 806ef668e2..e90efea9cb 100644
--- a/meta-oe/recipes-support/pcp/pcp-native_6.3.7.bb
+++ b/meta-oe/recipes-support/pcp/pcp-native_6.3.8.bb
@@ -47,3 +47,4 @@ do_install () {
     PCP_DOC_DIR=${D}/${docdir} \
     PCP_SYSTEMDUNIT_DIR=${D}${systemd_system_unitdir}
 }
+
diff --git a/meta-oe/recipes-support/pcp/pcp.inc b/meta-oe/recipes-support/pcp/pcp.inc
index c54c054cf8..07de1d5328 100644
--- a/meta-oe/recipes-support/pcp/pcp.inc
+++ b/meta-oe/recipes-support/pcp/pcp.inc
@@ -7,13 +7,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=37ab75b580d5aad4ada04260efa3702f \
                     "
 COMPATIBLE_HOST:libc-musl = "null"
 
-SRC_URI = "git://github.com/performancecopilot/pcp;branch=stable;protocol=https \
+SRC_URI = "git://github.com/performancecopilot/pcp;branch=stable;protocol=https;tag=${PV} \
            file://0001-configure-Limit-the-header-search-to-sysroot.patch \
            file://0001-htop-Change-dependency-order-of-header-and-sourcefil.patch \
            file://config.linux \
 	   "
 
-SRCREV = "d8d97b79ee47d9dfb076a3242564ed3cae04eba9"
+SRCREV = "7b0943ade0bcecaf50ed4b4c2cc9084150420eff"
 
 
 inherit setuptools3-base pkgconfig autotools-brokensep
diff --git a/meta-oe/recipes-support/pcp/pcp/0001-htop-Change-dependency-order-of-header-and-sourcefil.patch b/meta-oe/recipes-support/pcp/pcp/0001-htop-Change-dependency-order-of-header-and-sourcefil.patch
index 2915d48f04..817695ef84 100644
--- a/meta-oe/recipes-support/pcp/pcp/0001-htop-Change-dependency-order-of-header-and-sourcefil.patch
+++ b/meta-oe/recipes-support/pcp/pcp/0001-htop-Change-dependency-order-of-header-and-sourcefil.patch
@@ -1,4 +1,4 @@
-From c123980d6bf1bc2bf93ee0dd0d7f8fee3d4ddc96 Mon Sep 17 00:00:00 2001
+From 66aa3efbd182c5597b66d9237c213449f31acdac Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 5 Jul 2023 08:45:14 -0700
 Subject: [PATCH] htop: Change dependency order of header and sourcefiles
@@ -16,9 +16,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/pcp/htop/GNUmakefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/src/pcp/htop/GNUmakefile b/src/pcp/htop/GNUmakefile
+index 167b4b048..3e29638d6 100644
 --- a/src/pcp/htop/GNUmakefile
 +++ b/src/pcp/htop/GNUmakefile
-@@ -210,8 +210,8 @@ CFGCOLUMNS = $(patsubst %,pcp/columns/%,
+@@ -210,8 +210,8 @@ CFGCOLUMNS = $(patsubst %,pcp/columns/%,$(COLUMNS))
  CFGSCREENS = $(patsubst %,pcp/screens/%,$(SCREENS))
  
  CFGXFILES = $(CFGMETERS) $(CFGCOLUMNS) $(CFGSCREENS)
diff --git a/meta-oe/recipes-support/pcp/pcp_6.3.7.bb b/meta-oe/recipes-support/pcp/pcp_6.3.8.bb
similarity index 100%
rename from meta-oe/recipes-support/pcp/pcp_6.3.7.bb
rename to meta-oe/recipes-support/pcp/pcp_6.3.8.bb
-- 
2.43.0


