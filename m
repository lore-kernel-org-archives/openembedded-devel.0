Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4235C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 09:00:56 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.17870.1702544452558783178
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 01:00:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="144921921"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="144921921"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 18:00:51 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D64DD9D92
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 18:00:48 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 332D1D94C7
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 18:00:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7119F202E5870;
	Thu, 14 Dec 2023 18:00:46 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-platformdirs: upgrade 4.0.0 -> 4.1.0
Date: Thu, 14 Dec 2023 17:00:34 +0800
Message-Id: <1702544434-28230-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28056.006
X-TMASE-Result: 10--4.644800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuOVdQAiMmbZ5Fz
	JQEhbMPxn/EJVrBwPHwNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG231w
	l3qzgklKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzOPk6G40LSSluni
	jRnR7o106H8hJ3BMj7igMK10gS3IGL2AgcWDhmcMTiNQ11ZoCDgQweozetUZBoHoDuNrbKSTiTN
	iMyAZVFiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 09:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107443

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Update changelog for 4.0.0
-docs: fix Linux user_log_dir example in README
-Drop support for EOL Python 3.7

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-platformdirs_4.0.0.bb => python3-platformdirs_4.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_4.0.0.bb => python3-platformdirs_4.1.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.0.0.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.1.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-platformdirs_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_4.1.0.bb
index 5a33be400..b4fb9356c 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.1.0.bb
@@ -7,7 +7,7 @@ SRC_URI += " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "cb633b2bcf10c51af60beb0ab06d2f1d69064b43abf4c185ca6b28865f3f9731"
+SRC_URI[sha256sum] = "906d548203468492d432bcb294d4bc2fff751bf84971fbb2c10918cc206ee420"
 
 inherit pypi python_hatchling ptest
 
-- 
2.34.1


