Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A9AC07E8E
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:49 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.2724.1713318100237325034
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fO3wkBE8;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318100; x=1744854100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4sfRZ3JFknWuHVUpbZY4w+DhXT4CiSV5mAmLRrNUSi4=;
  b=fO3wkBE8yKADh3UAB5mTXCOgXK6PO6hDJz4RS1vt41xdRr3XmlbCX5A4
   1SN9lDGt85h/BjA2d+zpy95WvEbgurRIQMxLN/ghaNdsaoxgGTdol1sZ0
   JMF1hffYsPNAMst5fegWhVr69TLto3lwO9rLfylSV3JipIyKrhQ7YxkZY
   DKk/49WNFDPKAuOPgOAzQW2sE77ka224L1LcZn5EdmIVhpObiIsvYuX7s
   jY8SUvxx//zW0KtFlHt/Espbu50js+ERXzc3v/UOfAF13WzWlxLiIWKqZ
   KvlSC0iTSSeTHmnS6EqrF/7MJNELYHrVo+lJWU7xT6q5hF9C0FN59GnYj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="156073680"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="156073680"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:38 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0FBE0D4800
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 403E4D5B33
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C19B06B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6CD941A0002;
	Wed, 17 Apr 2024 09:41:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/49] python3-pulsectl: upgrade 23.5.2 -> 24.4.0
Date: Wed, 17 Apr 2024 09:40:43 +0800
Message-Id: <1713318061-17128-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10-1.744700-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqy8B7vl7G5M0Ty7
	zxidHhYp8KbwGrmD2pENyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSyBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNdiczXyD4PAHfIBJWxiNd181yVsNsLZHXwZ9tC/4ahxGO3nAqLVy1eORKeXsRzFjjao4L
	WauaWrE2v0TG9xnDNNI2N69VXwmtKoEGG3M+VOyU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110017

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add more obvious sink_default_get/source_default_get wrappers around server_info

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pulsectl_23.5.2.bb => python3-pulsectl_24.4.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pulsectl_23.5.2.bb => python3-pulsectl_24.4.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_23.5.2.bb b/meta-python/recipes-devtools/python/python3-pulsectl_24.4.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pulsectl_23.5.2.bb
rename to meta-python/recipes-devtools/python/python3-pulsectl_24.4.0.bb
index 4da72904f..3bc15bb08 100644
--- a/meta-python/recipes-devtools/python/python3-pulsectl_23.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pulsectl_24.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
 
-SRC_URI[sha256sum] = "e911d398eaf0539cf3c63b4217357b51a3d1b7e4a50607d1591cf2b49f5d2c6a"
+SRC_URI[sha256sum] = "697ed50e7d452e78678ae38e2ab935843008bec448955283cd0fb362867e3165"
 
 RDEPENDS:${PN} += " \
 	libpulse \
-- 
2.34.1


