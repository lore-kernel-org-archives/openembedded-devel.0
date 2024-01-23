Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34DEC46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:14:34 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.729.1705972470979516943
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:14:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="146784269"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="146784269"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:14:29 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C34EDD63DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:14:26 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0BC6FDA685
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:14:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9819B23E1A4
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:14:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1E31D1A006A;
	Tue, 23 Jan 2024 09:14:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] capnproto: upgrade 1.0.1.1 -> 1.0.2
Date: Tue, 23 Jan 2024 09:12:54 +0800
Message-Id: <1705972374-24919-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPaxZOddVMlEZwIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFE7U2bdIeWmBwBZwmjR4hJZyD7
	24PHaVllEgbSRBuLvjHlDbzlcXvEwJhRX6uN2ADJQ5BgAFHt9tknjW5mip6+YB7YR+jxyYIux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108390

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../capnproto/{capnproto_1.0.1.1.bb => capnproto_1.0.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/capnproto/{capnproto_1.0.1.1.bb => capnproto_1.0.2.bb} (93%)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_1.0.1.1.bb b/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
similarity index 93%
rename from meta-oe/recipes-devtools/capnproto/capnproto_1.0.1.1.bb
rename to meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
index 649bb3945..cb4aef522 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_1.0.1.1.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_1.0.2.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=a05663ae6cca874123bf667a60dca8c9"
 
 SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV};protocol=https"
-SRCREV = "15dc687f573311ac721c0df9d2123d2959268e92"
+SRCREV = "1a0e12c0a3ba1f0dbbad45ddfef555166e0a14fc"
 
 S = "${WORKDIR}/git/c++"
 
-- 
2.34.1


