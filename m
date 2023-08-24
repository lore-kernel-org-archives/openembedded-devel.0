Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5633FC6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:15:24 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.6323.1692864915721589703
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="108636968"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="108636968"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:15:14 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 970F8D4F59
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:15:11 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DC814D67A8
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:15:10 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 129D82FC85E6;
	Thu, 24 Aug 2023 17:15:10 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-oauth2client: upgrade 4.1.2 -> 4.1.3
Date: Thu, 24 Aug 2023 16:14:37 +0800
Message-Id: <1692864877-2711-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27832.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27832.006
X-TMASE-Result: 10--0.123600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr4zE7uPNJiiaU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa0BQOqUsWgx5gIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFChayO86V/K9H/Vp34zBN0xowj
	tJ0kDSw5wxa4veKtTclsDPEbbFO47y4yIqjPpQEtVkXrG3zLAHONod4uXPneWbF4AoPk29Dex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:15:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104574

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Changed OAuth2 endpoints to use oauth2.googleapis.com variants.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-oauth2client_4.1.2.bb => python3-oauth2client_4.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3_oauth2client/{python3-oauth2client_4.1.2.bb => python3-oauth2client_4.1.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python3_oauth2client/python3-oauth2client_4.1.2.bb b/meta-python/recipes-devtools/python3_oauth2client/python3-oauth2client_4.1.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python3_oauth2client/python3-oauth2client_4.1.2.bb
rename to meta-python/recipes-devtools/python3_oauth2client/python3-oauth2client_4.1.3.bb
index 0301763030..c0b111838c 100644
--- a/meta-python/recipes-devtools/python3_oauth2client/python3-oauth2client_4.1.2.bb
+++ b/meta-python/recipes-devtools/python3_oauth2client/python3-oauth2client_4.1.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=038e1390e94fe637991fa5569daa62bc"
 
 inherit pypi
 
-SRC_URI[sha256sum] = "bd3062c06f8b10c6ef7a890b22c2740e5f87d61b6e1f4b1c90d069cdfc9dadb5"
+SRC_URI[sha256sum] = "d486741e451287f69568a4d26d70d9acd73a2bbfa275746c535b4209891cccc6"
 
 RDEPENDS:${PN} += " \
         ${PYTHON_PN}-httplib2 \
-- 
2.34.1


