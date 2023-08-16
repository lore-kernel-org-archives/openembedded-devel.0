Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17DCC001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:37:25 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.151702.1692149836500690109
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="128055321"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="128055321"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:37:02 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 51C82D3EB4
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:36:59 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 91A19D5049
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:36:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id ACFB72FC7919;
	Wed, 16 Aug 2023 10:36:57 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] gensio: upgrade 2.6.7 -> 2.7.2
Date: Wed, 16 Aug 2023 09:36:49 +0800
Message-Id: <1692149809-4797-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27816.003
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPauLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXLVLJ3xyJkymK/Gdg3F57+93I/lQiNnqK/xoR
	Q1cJUNZaE55YCQeGZjYOb/kq6eMKYWjtWXrrUwDqPt846a44wYs1bzLOGSKaT+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:37:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104371

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gensio/{gensio_2.6.7.bb => gensio_2.7.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.6.7.bb => gensio_2.7.2.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.6.7.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.7.2.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.6.7.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.7.2.bb
index c3ba96ff60..67c4aec51e 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.6.7.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.7.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
 
-SRCREV = "266277aeb39dc2db33e577335236f89ed7ca5918"
+SRCREV = "17c069ff4803bfbc0fcc1a141f645d7b8470638a"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master"
 
-- 
2.34.1


