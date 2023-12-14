Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E9FC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 08:59:26 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.17848.1702544365328638424
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 00:59:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="131333639"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="131333639"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 17:59:23 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 23F7FD7AE4
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:59:21 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F8EEBF4AE
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:59:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A7680202EA677;
	Thu, 14 Dec 2023 17:59:19 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-path: upgrade 16.7.1 -> 16.9.0
Date: Thu, 14 Dec 2023 16:59:02 +0800
Message-Id: <1702544342-28156-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28056.006
X-TMASE-Result: 10--0.531600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrzoS4pqkGrkO3amyQ6US3ar6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3FCedixYXzOr31w
	l3qzgklJbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7jXG
	dWGDTm01BSkdYpxPpUA8lLTTX8RmvFwNQt9DdwXeUCDMaSdog5/84kfqbSW5f7RFfiZHFpypL71
	6WURe1XfeX8vvv4lcyCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 08:59:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107441

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Added .iterdir() and deprecated .listdir().
-Use '.' as the default path.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-path_16.7.1.bb => python3-path_16.9.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-path_16.7.1.bb => python3-path_16.9.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-path_16.7.1.bb b/meta-python/recipes-devtools/python/python3-path_16.9.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-path_16.7.1.bb
rename to meta-python/recipes-devtools/python/python3-path_16.9.0.bb
index d9576ed0b..19bf11b6c 100644
--- a/meta-python/recipes-devtools/python/python3-path_16.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-path_16.9.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "A module wrapper for os.path"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
-SRC_URI[sha256sum] = "2b477f5887033f3cbea1cfd8553ee6a6a498eb2540a19f4aa082822aadcea30a"
+SRC_URI[sha256sum] = "dfd31c2af60e8889a13538bef302ade7adacdb5351836be22638e2349ddd5d7b"
 
 SRC_URI += "\
     file://run-ptest \
-- 
2.34.1


