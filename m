Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A7B9C7EE43
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:40:53 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.3823.1686620448468767684
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="108063138"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="108063138"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:49 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id F02B8DAE0C
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:47 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 456ECD5E8F
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:47 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C537020074724;
	Tue, 13 Jun 2023 10:40:46 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-platformdirs: upgrade 3.5.1 -> 3.5.3
Date: Tue, 13 Jun 2023 09:40:05 +0800
Message-Id: <1686620422-29962-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10--1.595800-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mregIHHX2L4YyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNEzEoOqAAVLOuLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXLEHL0n/Ct8P//rZUB10/iFZ62ZcGMwiO/+82
	6j4mtwYcf6XKVKM/1sOOxjmx9leJ2YB/+tXp6eP1+xGdNrhbT7sb/YfE8gBbf+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103233

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add 3.12 marker

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-platformdirs_3.5.1.bb => python3-platformdirs_3.5.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_3.5.1.bb => python3-platformdirs_3.5.3.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_3.5.1.bb b/meta-python/recipes-devtools/python/python3-platformdirs_3.5.3.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-platformdirs_3.5.1.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_3.5.3.bb
index c5c3d9fe6..c91d9111f 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_3.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_3.5.3.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRCREV ?= "b8c42ddca4def1fba38b9815a7d94ec2ac630b29"
+SRCREV ?= "50e638eec6cadee0dfe47197464241be8a70718d"
 SRC_URI[sha256sum] = "7954a68d0ba23558d753f73437c55f89027cf8f5108c19844d4b82e5af396335"
 
 inherit python_setuptools_build_meta ptest
-- 
2.34.1


