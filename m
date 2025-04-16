Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA89C369D0
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:43 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.14609.1744794150722222430
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bfHJCFo8;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794152; x=1776330152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Q4s19J1PcOxN90dM7D7/XxaelqQeyxzWxILyTdTRbVU=;
  b=bfHJCFo8FHvud5SEg7u0+Cssw4et07tSRHP7kTxbg2X9/uO4zN3o/k9j
   +by35wzIw0NWwmRPgcF4an4y2E4QylPoqsAKkVZFgQN6rI6I3iQVQbm+J
   bidzQoF3tDZhyYgp0RJjmrFXoOdszqkXHPbO8bwH7lcxj72lI5PqofRkB
   ZeqNHgzmTwFuzfO/z0XLomz7WQQj5coKOVokJu3zpzUAgKiyXGTIbUfWy
   mRgL8NuquZk8kF8BwEKGPV4FThc5xxqGNWkUm1rWRMKhnZgNinqRi8vDR
   8/vYH79GOMfYI2W5rLjA30dZzAWICes12DK9kAT7NX5nFXk7buAF+zVzx
   Q==;
X-CSE-ConnectionGUID: 4U+g0p+zRIuATF+zbtfrdw==
X-CSE-MsgGUID: V7cVm8XEQguJccnTxnAUgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="175523875"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="175523875"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:30 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 81A8ED501D
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3EC7ED50F4
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EC3401A00AE;
	Wed, 16 Apr 2025 17:02:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/31] opentelemetry-cpp: upgrade 1.19.0 -> 1.20.0
Date: Wed, 16 Apr 2025 17:01:58 +0800
Message-Id: <1744794136-908-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116880

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...pentelemetry-cpp_1.19.0.bb => opentelemetry-cpp_1.20.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/opentelemetry/{opentelemetry-cpp_1.19.0.bb => opentelemetry-cpp_1.20.0.bb} (94%)

diff --git a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.19.0.bb b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.20.0.bb
similarity index 94%
rename from meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.19.0.bb
rename to meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.20.0.bb
index c98bc826ad..e022b407a0 100644
--- a/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.19.0.bb
+++ b/meta-oe/recipes-support/opentelemetry/opentelemetry-cpp_1.20.0.bb
@@ -7,8 +7,8 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 DEPENDS = "nlohmann-json"
-SRC_URI = "gitsm://github.com/open-telemetry/opentelemetry-cpp.git;protocol=https;branch=main"
-SRCREV = "ced79860f8c8a091a2eabfee6d47783f828a9b59"
+SRC_URI = "gitsm://github.com/open-telemetry/opentelemetry-cpp.git;protocol=https;branch=main;tag=v${PV}"
+SRCREV = "6175aa0b213eea053247e43b4f35b8d201fa356e"
 
 S = "${WORKDIR}/git"
 inherit cmake pkgconfig lib_package
-- 
2.43.0


