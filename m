Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E72C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:20:54 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.28272.1701159647473770827
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:20:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="128890163"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="128890163"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:20:44 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8C106D9DAC
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:20:42 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D201CD5E9F
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:20:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id B12CD88995;
	Tue, 28 Nov 2023 17:20:40 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] capnproto: upgrade 1.0.1 -> 1.0.1.1
Date: Tue, 28 Nov 2023 16:18:46 +0800
Message-Id: <1701159526-27824-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28024.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28024.006
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPaxZOddVMlEZwIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFH+tlY/GjTU5E++Mqjgri4qaeh
	7AfzzPTpUVZa1UdF4sTkAavzaJ242RHLyFwTjSpY+82Dm2uzhbC7/hSsQ0QWmhrxQVKG7Qdex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107073

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../capnproto/{capnproto_1.0.1.bb => capnproto_1.0.1.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/capnproto/{capnproto_1.0.1.bb => capnproto_1.0.1.1.bb} (93%)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_1.0.1.bb b/meta-oe/recipes-devtools/capnproto/capnproto_1.0.1.1.bb
similarity index 93%
rename from meta-oe/recipes-devtools/capnproto/capnproto_1.0.1.bb
rename to meta-oe/recipes-devtools/capnproto/capnproto_1.0.1.1.bb
index 99a76d454..649bb3945 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_1.0.1.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_1.0.1.1.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=a05663ae6cca874123bf667a60dca8c9"
 
 SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV};protocol=https"
-SRCREV = "c7f810a76ca88ff28613fa165927e0269255aab0"
+SRCREV = "15dc687f573311ac721c0df9d2123d2959268e92"
 
 S = "${WORKDIR}/git/c++"
 
-- 
2.34.1


