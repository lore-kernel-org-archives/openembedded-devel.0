Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0ED3C0015E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:38 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.7619.1690875751491869790
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126603507"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126603507"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:29 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 03105D4F59
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:27 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4487CCF7CA
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:26 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C20D310232;
	Tue,  1 Aug 2023 16:42:25 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.71.0 -> 0.71.4
Date: Tue,  1 Aug 2023 15:41:55 +0800
Message-Id: <1690875717-21608-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10--1.134300-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrP9kI+hf1Euqgo0DxI7WwdI9o
	An9Fae9umWUCyP5MvRGjrLRBxwnZS2Io6q3zeo5wqhcdnP91eXGDd2tqN5JYyZTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2dVNZaI2n6/wmWvXEqQTm5gw1mV69cpTMGp0
	VGMd0huFslxAfd+6tXeTjw/FyRX6QfE8yM4pjsD67rlQMPRoOCxEHRux+uk8hxKpvEGAbTDlJWH
	WLa94suYxjRca/JT6u66quCJGlsR5oBVEGC7KPuKpV3oWTU5QA1HRQim8VtyMc+nd19HRNlNTXI
	OYk2VSpYC7VXZZjYSYK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104195

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Cleanup naming from previous refactoring in ServiceInfo
 Pin python-semantic-release to fix release process
 No change re-release to fix wheel builds
 Add missing if TYPE_CHECKING guard to generate_service_query

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-zeroconf_0.71.0.bb => python3-zeroconf_0.71.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.71.0.bb => python3-zeroconf_0.71.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.71.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.71.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.71.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.71.4.bb
index 78bdfc6f0c..ce92c6478a 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.71.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.71.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "c3040b3ad60f77fd29ca90b013c99aa7a0266eab9e4953106fc6f5fc8ba5641a"
+SRC_URI[sha256sum] = "b988425f6bd0d4f11f05fa258a6c49d9f9956777e9af00ca98c4ed3f743bd677"
 
 inherit pypi setuptools3
 
-- 
2.34.1


