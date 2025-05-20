Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADB3C54E65
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:20 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.16221.1747731319117717335
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lcjMq3Ha;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731320; x=1779267320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=piXPZGgoIA8LVwW9ozu3y92h0UIKVJQsPmhZBjcla3w=;
  b=lcjMq3HaKWrrVuoBXxf+owH/VBPSt2dsxzz/PpU83yRnqXMPE5JIBfYr
   ph75bTb/YCogEp/pGNZ8zVHfWuRDTARqLkX+bO/R1BvmRmZOy3gxLNlnm
   NtPx/63SR1/9zAhTAfiMR8bjtuNkmqf2ta7WncaIriebVnDyzELZ8wsea
   lD2yigqN1TivOSSnGx9/jJAUij9Mw62aQMnrjf2JM5hhhzbYfFZGLVnbr
   Xe2hLl3xR/p5SmdLK8+7c7kXMEq1JB/Kx6+2vmh4PoLQBw4yvH38KT6RN
   /sRbL8R05tuTWjJcRCNf0K1Wdnvla4yPpB7ZVZnlMoJ0L+5NLhZ1TBMOE
   A==;
X-CSE-ConnectionGUID: 6Lns+pMrQVGkhmjhNGrdkA==
X-CSE-MsgGUID: BezbJENdQHuhYpAZE9GCJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="202995230"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="202995230"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:17 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D6DF1D4C32
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 93D5DBDC83
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:14 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2D8161A009A;
	Tue, 20 May 2025 16:55:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 14/27] mbedtls: upgrade 3.6.3 -> 3.6.3.1
Date: Tue, 20 May 2025 16:54:46 +0800
Message-Id: <1747731299-20448-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
References: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117494

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mbedtls/{mbedtls_3.6.3.bb => mbedtls_3.6.3.1.bb}       | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.3.bb => mbedtls_3.6.3.1.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
index b700c27a65..1e99f92306 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.3.1.bb
@@ -23,10 +23,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6 \
-           file://run-ptest"
+SRC_URI = "git://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=main;tag=v${PV} \
+           file://run-ptest \
+           "
 
-SRCREV = "22098d41c6620ce07cf8a0134d37302355e1e5ef"
+SRCREV = "6fb5120fde4ab889bea402f5ab230c720b0a3b9a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


