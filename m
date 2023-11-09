Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91374C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 04:09:02 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.114643.1699502940577990336
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 20:09:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="139198988"
X-IronPort-AV: E=Sophos;i="6.03,288,1694703600"; 
   d="scan'208";a="139198988"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 13:08:58 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 627D5D9DAD
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 13:08:55 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A41EECF7CB
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 13:08:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D2748647C;
	Thu,  9 Nov 2023 13:08:53 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] gensio: upgrade 2.7.6 -> 2.7.7
Date: Thu,  9 Nov 2023 12:08:23 +0800
Message-Id: <1699502903-16038-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27986.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27986.002
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZOdKnCeVjjIZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62Szw+Pgu9TELPnafj3LF6dyYwS023hKBwD+CtcFuRp9PpIxU
	pjFelfSKuO2493O+vlmC1IUZioRvm3XzyOhDySsf+fpJ07f6/YS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 04:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106492

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gensio/{gensio_2.7.6.bb => gensio_2.7.7.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.7.6.bb => gensio_2.7.7.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.7.6.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.7.7.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.7.6.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.7.7.bb
index 21b9f3f3b..3deab25ea 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.7.6.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.7.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
 
-SRCREV = "7a26bcec16453d01790b41d9d5495f40cc668bb6"
+SRCREV = "6af40181c33bf97bde8cb99cccc4c2168abcd24e"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master"
 
-- 
2.34.1


