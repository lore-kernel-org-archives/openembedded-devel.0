Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE72EC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 09:05:16 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.17932.1702544714413943858
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 01:05:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="143323879"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="143323879"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 18:05:12 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id F3C10D4F5B
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 18:05:09 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F5FEDA239
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 18:05:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 31CEE883E1;
	Thu, 14 Dec 2023 18:05:08 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyzmq: upgrade 25.1.1 -> 25.1.2
Date: Thu, 14 Dec 2023 17:04:59 +0800
Message-Id: <1702544699-28431-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28056.006
X-TMASE-Result: 10--2.507400-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yTo39wOA02LhXLILvyEBT87fUZT83lbkENb2
	e7N2CFQy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AZskwWqoib3Pq6lFCYGFn0f6O
	+FEJQpgDsQp6MCEEcpaWMAni28OXVzCK25xPd0TsTMSg6oABUs64sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq1b/0/42eOiI1gr2IIqyfg11N22Uxm278vOQ9ytPFedPjPbJ
	zSVS0U1hFlz/bDvlga7ksXRCYWE9LEqlMiFv29JuHapK5TysegdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 09:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107447

From: Wang Mingyu <wangmy@fujitsu.com>

club-rpath-out.patch
refreshed for version 25.1.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-pyzmq/club-rpath-out.patch               | 6 +++---
 .../{python3-pyzmq_25.1.1.bb => python3-pyzmq_25.1.2.bb}    | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_25.1.1.bb => python3-pyzmq_25.1.2.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq/club-rpath-out.patch b/meta-python/recipes-devtools/python/python3-pyzmq/club-rpath-out.patch
index 61aeaca5f..2dae7d1e2 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq/club-rpath-out.patch
+++ b/meta-python/recipes-devtools/python/python3-pyzmq/club-rpath-out.patch
@@ -1,4 +1,4 @@
-From efae4e08d13e0958d929ea524e21c0a210b31982 Mon Sep 17 00:00:00 2001
+From 8ef6a7bdc0669e85822188f7734b53bc64f54a89 Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Fri, 22 Jan 2021 11:41:12 +0200
 Subject: [PATCH] setup.py: Adjust _add_rpath
@@ -14,10 +14,10 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 3 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index b634d94..7f6a2f1 100755
+index 4ac4788..e917825 100755
 --- a/setup.py
 +++ b/setup.py
-@@ -235,9 +235,6 @@ def _add_rpath(settings, path):
+@@ -215,9 +215,6 @@ def _add_rpath(settings, path):
      """
      if sys.platform == 'darwin':
          settings['extra_link_args'].extend(['-Wl,-rpath', '-Wl,%s' % path])
diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_25.1.1.bb b/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pyzmq_25.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
index 504ef7abc..658dbe6e2 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_25.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
@@ -13,7 +13,7 @@ SRC_URI:append = " \
     file://club-rpath-out.patch \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "259c22485b71abacdfa8bf79720cd7bcf4b9d128b30ea554f01ae71fdbfdaa23"
+SRC_URI[sha256sum] = "93f1aa311e8bb912e34f004cf186407a4e90eec4f0ecc0efd26056bf7eda0226"
 
 inherit pypi pkgconfig python_setuptools_build_meta ptest
 
-- 
2.34.1


