Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED43EB64DC
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 06:50:31 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.2317.1687157429528853418
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 23:50:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="121337611"
X-IronPort-AV: E=Sophos;i="6.00,254,1681138800"; 
   d="scan'208";a="121337611"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 15:50:27 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1FA4BE8523
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:25 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 52084D5E95
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:24 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 923F62FC8442;
	Mon, 19 Jun 2023 15:50:23 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.23.2 -> 4.23.3
Date: Mon, 19 Jun 2023 14:48:20 +0800
Message-Id: <1687157308-17342-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
References: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27700.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27700.005
X-TMASE-Result: 10-6.831700-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrfrTt+hmA5bI6FHRWx2FGsI2u
	oxPlAC61aguqpxC4cf6zo1yg2UoOsZtXm3VbfqeOM10nOFd6RPYnhzAhgvoq55Tx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q1v+ggm5QAi4ZiQDIJsDspX/rvCkqsgk0E6tN
	XWm3vJYvOGImoNbpXYeTjw/FyRX6QfE8yM4pjsDxZ4ylU2GwzAxEHRux+uk8jHUU+U0ACZwDocp
	0Q4r9zIJiWsRAdlDpN5+uv/9BaEZHekAMu5khbpyUrEIMi3arsJmw1xbzL2Nn+MpF6cdc0QnpHQ
	0q6CwuG+j225mDeWcw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103372

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
C++
------
 Regenerate stale files (#13046) (58b6ddb)
 Use the same ABI for static and shared libraries on non-Windows platforms (#12983) (efa1ec7)

Objective-C
-----------
 Regenerate stale files (#13046) (58b6ddb)

UPB (Python/PHP/Ruby C-Extension)
----------------------------------
 Fixed a bug in upb_Map_Delete() that caused crashes in map.delete(k) for Ruby when string-keyed maps were in use.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_4.23.2.bb => python3-protobuf_4.23.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.23.2.bb => python3-protobuf_4.23.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.23.2.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.23.2.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb
index 6aa4f636e..84fa9f866 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.23.2.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.23.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "20874e7ca4436f683b64ebdbee2129a5a2c301579a67d1a7dda2cdf62fb7f5f7"
+SRC_URI[sha256sum] = "7a92beb30600332a52cdadbedb40d33fd7c8a0d7f549c440347bc606fb3fe34b"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.34.1


