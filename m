Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671F3C7EE2F
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:57:57 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.6079.1684997867817047362
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="117405227"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="117405227"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:57:43 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B4AC3D7733
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:40 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 02ADDD5040
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:40 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 216C62FC91FB;
	Thu, 25 May 2023 15:57:39 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-django: upgrade 4.1.7 -> 4.2.1
Date: Thu, 25 May 2023 14:57:25 +0800
Message-Id: <1684997851-2098-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
References: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27648.005
X-TMASE-Result: 10--0.832400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mr9pLnYtQ99xJoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BV4BnlVId1nZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SRvLgmK0vlNARnCPE1XgYni9ykVISFinNDQffSweqKPyokR
	4HYpCYlQmzYe/Z4WYOCDPIwiAh8IlGR5K0aN7dFk06Gayi0b1ES7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102829

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://docs.djangoproject.com/en/4.2/releases/4.2.1/

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-django_4.1.7.bb => python3-django_4.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.1.7.bb => python3-django_4.2.1.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.1.7.bb b/meta-python/recipes-devtools/python/python3-django_4.2.1.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_4.1.7.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.1.bb
index be806eefa..b1474cf05 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.1.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "44f714b81c5f190d9d2ddad01a532fe502fa01c4cb8faf1d081f4264ed15dcd8"
+SRC_URI[sha256sum] = "7efa6b1f781a6119a10ac94b4794ded90db8accbe7802281cd26f8664ffed59c"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.34.1


