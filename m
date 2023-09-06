Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E66CCFA06
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:53:55 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2293.1693965227519281915
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 18:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="130427360"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="130427360"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:53:45 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2245BF0763
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:53:43 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 51744BF49C
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:53:42 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DA70620050193;
	Wed,  6 Sep 2023 10:53:41 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] gensio: upgrade 2.7.4 -> 2.7.5
Date: Wed,  6 Sep 2023 09:53:30 +0800
Message-Id: <1693965210-13954-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27858.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27858.003
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPauLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXLYKYZYCwMRwC4hmw8KKzpLW4dIG3U+M2zkNk
	q3Zdvq6phHBAPAoL8UCfO5Z7tleOSjHs1ZNyo34ZaEyeHizcWYxZKXVtrqMy7+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 01:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104735

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gensio/{gensio_2.7.4.bb => gensio_2.7.5.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.7.4.bb => gensio_2.7.5.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.7.4.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.7.5.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.7.4.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.7.5.bb
index d82c785184..00053c8ee2 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.7.4.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.7.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
 
-SRCREV = "f241aa349ccb02a15ff90676bf6d3aa44d50090b"
+SRCREV = "ecfc538d516cee1d2c7904a645cb74bba48b6514"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master"
 
-- 
2.34.1


