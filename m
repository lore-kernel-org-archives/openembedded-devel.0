Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50826EE6441
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:31:29 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.2193.1695108683897334310
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="120421452"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="120421452"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:31:21 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 27429DE6AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:31:19 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 545E2D9467
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:31:18 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 76B7F2FC6B2A;
	Tue, 19 Sep 2023 16:31:17 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] gensio: upgrade 2.7.5 -> 2.7.6
Date: Tue, 19 Sep 2023 15:31:09 +0800
Message-Id: <1695108669-7000-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.005
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZOdKnCeVjjIZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SmaTOM8PGI0zJiyU0LyTpeIV/BPX9/vvwEXj5nczPSJCVTY
	kkjgXHnj1BapFULWvmGIcYt7rOlfEKXBc95tjdFVhLdfg1+troS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:31:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104963

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gensio/{gensio_2.7.5.bb => gensio_2.7.6.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.7.5.bb => gensio_2.7.6.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.7.5.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.7.6.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.7.5.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.7.6.bb
index 00053c8ee2..21b9f3f3bf 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.7.5.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.7.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
 
-SRCREV = "ecfc538d516cee1d2c7904a645cb74bba48b6514"
+SRCREV = "7a26bcec16453d01790b41d9d5495f40cc668bb6"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master"
 
-- 
2.34.1


