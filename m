Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA872CD54A4
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:59:59 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.2818.1695110394496618322
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="132616308"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="132616308"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:59:53 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0F510C68E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:59:50 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4DF3ED5E9D
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:59:49 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C92FC2007911B;
	Tue, 19 Sep 2023 16:59:48 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.97.0 -> 0.112.0
Date: Tue, 19 Sep 2023 15:58:51 +0800
Message-Id: <1695110331-8371-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27884.005
X-TMASE-Result: 10-1.734100-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mr/sIPIaRXioBTmrdms4Mo9W2N
	lYzGZgQkwJpduEGhwZUNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSz/0XMJYfpi/YX7AlQI2uSFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRMpg5
	yOcdoVgo6HM5rqDwqtNllbf62PH7mEpPyVMGyxYufVn/wKAxQv63x/JLFzFNq5yoJvipNTaF4L9
	WXqrcHZ7JLcVbnXIU4V/gXxYZelDfJ9+Koy3wYxHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104998

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 Improve AsyncServiceBrowser performance (#1273) (0c88ecf)
 Speed up question and answer internals (#1272) (d24722b)
 Small speed ups to ServiceBrowser (#1271) (22c433d)
 Speed up ServiceBrowsers with a cython pxd (#1270) (4837876)
 Improve performance of constructing outgoing queries (#1267) (00c439a)
 Speed up responding to queries (#1266) (24a0a00)
 Speed up answering questions (#1265) (37bfaf2)
 Speed up ServiceInfo with a cython pxd (#1264) (7ca690a)
 Speed up generating answers (#1262) (50a8f06)
 Avoid calling get_running_loop when resolving ServiceInfo (#1261) (33a2714)
 Significantly speed up writing outgoing dns records (#1260) (bf2f366)
 Speed up writing outgoing dns records (#1259) (248655f)
 Small speed up to writing outgoing dns records (#1258) (1ed6bd2)
 Reduce IP Address parsing overhead in ServiceInfo (#1257) (83d0b7f)
 Speed up decoding incoming packets (#1256) (ac081cf)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-zeroconf_0.97.0.bb => python3-zeroconf_0.112.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.97.0.bb => python3-zeroconf_0.112.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.97.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.112.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.97.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.112.0.bb
index 9662c3fe3d..6ff4fffb08 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.97.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.112.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "9a06cd21182250100df6c4f4e9de2a47a0ea927c7d5a0446035bb3dfcc17a647"
+SRC_URI[sha256sum] = "f2457ed290c70dbca686b411f2351c3ff9f367afaae668d75cf378e9a439b8aa"
 
 inherit pypi setuptools3
 
-- 
2.34.1


