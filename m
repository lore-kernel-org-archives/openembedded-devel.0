Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C5BC021A3
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:18 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.46627.1739178121940360202
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ieNg7BYx;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178133; x=1770714133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tuXbqImX2hMazwZTQ/zpA3mOWmTccySku/mb30c4wMk=;
  b=ieNg7BYxwBav/sZajUChYBRc6tpDQMsw1omsDuOA+12u/sN2Dp9Qvzmu
   JRUY8n2S8qnPOrE6i5rDJPATkzocqYdNECn7dEuqxo3LgNYQr8ETtPxp+
   HBNfY6qLyoUsF2rQ+dUhklMw4dc8CE5rlKqzm5A0MjAlZDwa/SK2Xc5Ik
   iEpHcFxWgf7kbOHnyO/HhgYb5tHg0WTibwY+2e/7r8j5TXP3jojdGkDz8
   5FgwOG7VMMJZwb2r4Y0jxYrZjjhsjjfOzRaYxnZbQY4Y23lqbjqKcQyXN
   WbWt9MC3y/m+yKu2boYWYbdgEZXGkoyjdzU6MThIdiKsL1/YA+8I8CBSw
   A==;
X-CSE-ConnectionGUID: EOuPwPDbT3CKW39Dx77XsA==
X-CSE-MsgGUID: y1yxntpUQ9mB/yaR+dXNnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189490542"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189490542"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:11 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E87D2DC69F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id AAE75D7492
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:08 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 500261A0071;
	Mon, 10 Feb 2025 17:02:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 63/66] python3-web3: upgrade 7.7.0 -> 7.8.0
Date: Mon, 10 Feb 2025 17:01:32 +0800
Message-Id: <1739178095-26432-63-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115390

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025.

Changelog:
 https://github.com/ethereum/web3.py/blob/main/docs/release_notes.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_7.7.0.bb => python3-web3_7.8.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-web3_7.7.0.bb => python3-web3_7.8.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_7.7.0.bb b/meta-python/recipes-devtools/python/python3-web3_7.8.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-web3_7.7.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_7.8.0.bb
index 3d8acd9d28..3b8c098280 100644
--- a/meta-python/recipes-devtools/python/python3-web3_7.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_7.8.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "A Python library for interacting with Ethereum."
 HOMEPAGE = "https://github.com/ethereum/web3.py"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c8694da5a97575618474d9caf8c812da"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1d34d9701a1461e4bd71a904ac4cf7be"
 
-SRC_URI[sha256sum] = "4d0332b9a78b855e57ccebd9e1e74c8e855b95869ac7b8fe5878731593e76408"
+SRC_URI[sha256sum] = "712bc9fd6b1ef6e467ee24c25b581e1951cab2cba17f9f548f12587734f2c857"
 
 inherit pypi setuptools3
 
-- 
2.43.0


