Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8AB0C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 08:51:26 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.17765.1702543878602908319
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 00:51:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="143321351"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="143321351"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 17:51:16 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C8544D4F7F
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:51:13 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 145ADC8BF9
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:51:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id CFEE12FC829A;
	Thu, 14 Dec 2023 17:51:11 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-django: upgrade 4.2.7 -> 5.0
Date: Thu, 14 Dec 2023 16:50:58 +0800
Message-Id: <1702543858-27712-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28056.006
X-TMASE-Result: 10--1.967500-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BV4BnlVId1nZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62Sdkg+VhXzgqSgMHgbm0YYPhE6qrK08yXV91uWFlNIg8KO4p
	x7bxEO37KrMjjZmLL7icHJva2fFBYJZAaTtTJ3Cf4Vy9HPtUhzS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 08:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107430

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  https://docs.djangoproject.com/en/5.0/releases/5.0/

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-django_4.2.7.bb => python3-django_5.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.7.bb => python3-django_5.0.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.7.bb b/meta-python/recipes-devtools/python/python3-django_5.0.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_4.2.7.bb
rename to meta-python/recipes-devtools/python/python3-django_5.0.bb
index 100db9bd7..bad424523 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.7.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "8e0f1c2c2786b5c0e39fe1afce24c926040fad47c8ea8ad30aaf1188df29fc41"
+SRC_URI[sha256sum] = "7d29e14dfbc19cb6a95a4bd669edbde11f5d4c6a71fdaa42c2d40b6846e807f7"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.34.1


