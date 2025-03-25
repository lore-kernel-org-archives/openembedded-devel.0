Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43754C369A1
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:30 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.61531.1742893340436711089
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KpWQTikW;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893342; x=1774429342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=sYe6MCY6SdBI2ngCSYUfWIfPGo9yv3RKoPDbhPsTrr0=;
  b=KpWQTikWEMYgisgGY1PnHRSuDOyu6eConv1QbQ4TTc6exwbmNKOkL0Rv
   L2xSE3SDjlDVH6PnorEVSugr4gXp/Ek/gbuo2CvVHIoawqytPjULdwqkG
   IoWwXa8h0eJsupUD2OGC9x0ga0mUg9u4V1efuzRRj3R3ynRMqYjHWPDE4
   NXBdnv2pDi3rSZckWv+l7KKQQRUfY0oPMEEiRR7ZkIEmYvdoL30kk83hu
   S6bbz1Ba0SsGqUB2qE52aOiRMHR3lDoa3nZRvy9K4nffNaB3jrz9SXEXD
   5f4iC2GeU6BvL0uZPeMYeK2tM1sjZbb6nzFVWsHewZ3EXfpkgpRMcNyQ8
   Q==;
X-CSE-ConnectionGUID: WLD9r4SqRZSmMof9ghFFUQ==
X-CSE-MsgGUID: E7vgJvgHQcCPxC+0w31EOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="196914928"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="196914928"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:21 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D2F1E6889
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 500EED72BC
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:18 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 37DC91A0078;
	Tue, 25 Mar 2025 17:02:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/45] python3-grpcio: upgrade 1.70.0 -> 1.71.0
Date: Tue, 25 Mar 2025 17:01:36 +0800
Message-Id: <1742893312-3809-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116253

From: Wang Mingyu <wangmy@fujitsu.com>

0001-python-enable-unbundled-cross-compilation.patch
refreshed for 1.71.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-python-enable-unbundled-cross-compilation.patch    | 6 +++---
 .../{python3-grpcio_1.70.0.bb => python3-grpcio_1.71.0.bb}  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.70.0.bb => python3-grpcio_1.71.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch
index 782b348815..b2b2713559 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch
@@ -1,4 +1,4 @@
-From ff01ac8908a7267503ffbb85efd24755da0502d8 Mon Sep 17 00:00:00 2001
+From ed9f268774838d279e23b4ae9fb95ca7650942b2 Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Wed, 5 Feb 2025 21:06:50 +0100
 Subject: [PATCH] python: enable unbundled cross compilation
@@ -13,10 +13,10 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 3b6edbe..d3a0d04 100644
+index 4d13d87..f002ab2 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -317,25 +317,25 @@ if BUILD_WITH_SYSTEM_OPENSSL:
+@@ -318,25 +318,25 @@ if BUILD_WITH_SYSTEM_OPENSSL:
          lambda x: "third_party/boringssl" not in x, CORE_C_FILES
      )
      CORE_C_FILES = filter(lambda x: "src/boringssl" not in x, CORE_C_FILES)
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.70.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.71.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.70.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.71.0.bb
index b858a3b050..da677dc1ab 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.70.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.71.0.bb
@@ -13,7 +13,7 @@ DEPENDS += "c-ares openssl python3-protobuf re2 zlib"
 SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
            file://abseil-ppc-fixes.patch \
            "
-SRC_URI[sha256sum] = "8d1584a68d5922330025881e63a6c1b54cc8117291d382e4fa69339b6d914c56"
+SRC_URI[sha256sum] = "2b85f7820475ad3edec209d3d89a7909ada16caab05d3f2e08a7e8ae3200a55c"
 
 RDEPENDS:${PN} = "python3-protobuf"
 
-- 
2.43.0


