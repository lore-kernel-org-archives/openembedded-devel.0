Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF0FC7EE33
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:11:57 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.13710.1750662714697552044
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=exZKnvAz;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662715; x=1782198715;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dTfU+E6uLu5tw55yMSPXmjRsm/17PGgLopBQv2mf5q0=;
  b=exZKnvAzQqsezXBPRC3rL0PnDN1dRzuvFxjG5xa1CNC7A1/W4hc7QRBS
   +gVeb0qUgnlWJMF/LaK0J7gStJm0Jpt9h1wk+k1dMqkXsIGZmYjrsOdCG
   RU5BNZ0e20jVTaFsQDtIqQUN3iHYrdNj8AVv8ABxQSS+hBxYvGANEA4N+
   ghWpmkUM3Fr8wsOkkQAXUczV1zKUSK0GGzKKpDJ4VtZIR4dDyAqR/Bz77
   HQlukE4aYyzImDYvOaQfccKSvO/OGiSe7KQTCWTu4bm/0Vqc5XPYfusaa
   6kd8VKTO71czXDESoDyf2LJzE2hFpUHoUxWu5TP+wj5P/Y1E3s9szJzOT
   A==;
X-CSE-ConnectionGUID: N3Ss93rhQeucVZRptlaeRA==
X-CSE-MsgGUID: DF/gO/GDSGKBKnC2tSJ8YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="191003687"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="191003687"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:52 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 56430D5004
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E729D5053
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:50 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 793991A0073;
	Mon, 23 Jun 2025 15:11:49 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/30] python3-cantools: upgrade 40.2.2 -> 40.2.3
Date: Mon, 23 Jun 2025 15:11:18 +0800
Message-ID: <20250623071138.402-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118042

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Fix compiler error for code generated with --node arg

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cantools_40.2.2.bb => python3-cantools_40.2.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_40.2.2.bb => python3-cantools_40.2.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_40.2.2.bb b/meta-python/recipes-devtools/python/python3-cantools_40.2.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_40.2.2.bb
rename to meta-python/recipes-devtools/python/python3-cantools_40.2.3.bb
index cca44af5dc..0e7a692200 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_40.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_40.2.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "6dae46caa8a200bdbf988bc32f0e3fbcb1db384eb097ece7ca73c079e5eed81c"
+SRC_URI[sha256sum] = "3c55cbd7d7d527a565b98123fbbb8f5df09132f74ceb722ff541fd80b5991424"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.43.0


