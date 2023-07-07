Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1791FEB64DA
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:14:07 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.4898.1688699645531909664
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="103103817"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="103103817"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:14:03 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 35EBCCD6C2
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:01 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6D23BCF7F6
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:00 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7735487E03;
	Fri,  7 Jul 2023 12:13:59 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] glfw: upgrade 3.3 -> 3.3.8
Date: Fri,  7 Jul 2023 11:13:30 +0800
Message-Id: <1688699627-2519-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
References: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10-0.857100-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2vK8MDOu23EVaZY4PxfRMWEaDCzqDR7DPZC4sa7AidY08EguqiGeZ5Jo8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXIv7kLtPEs9LfBuhil/IQpXEnELGjDYXNLnA/
	C7a+3uda8CVtr38+I9O8rOsFJ47kDpOmxkuix73cjnwhHwzvLZmy8CUw6epHL+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 03:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103691

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-core/glfw/{glfw_3.3.bb => glfw_3.3.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/glfw/{glfw_3.3.bb => glfw_3.3.8.bb} (90%)

diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb b/meta-oe/recipes-core/glfw/glfw_3.3.8.bb
similarity index 90%
rename from meta-oe/recipes-core/glfw/glfw_3.3.bb
rename to meta-oe/recipes-core/glfw/glfw_3.3.8.bb
index f4d983a6e0..ad7a3a7ed4 100644
--- a/meta-oe/recipes-core/glfw/glfw_3.3.bb
+++ b/meta-oe/recipes-core/glfw/glfw_3.3.8.bb
@@ -11,8 +11,8 @@ SECTION = "lib"
 inherit pkgconfig cmake features_check
 
 PV .= "+git${SRCPV}"
-SRCREV = "781fbbadb0bccc749058177b1385c82da9ace880"
-SRC_URI = "git://github.com/glfw/glfw.git;branch=master;protocol=https"
+SRCREV = "7482de6071d21db77a7236155da44c172a7f6c9e"
+SRC_URI = "git://github.com/glfw/glfw.git;branch=3.3-stable;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


