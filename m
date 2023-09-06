Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BFB3CCFA10
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:58:15 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.2382.1693965490485219070
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 18:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="130902624"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="130902624"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:58:09 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C557D29EA
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:58:06 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A1D18D8B7D
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:58:05 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 312976B346;
	Wed,  6 Sep 2023 10:58:05 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-asttokens: upgrade 2.2.1 -> 2.4.0
Date: Wed,  6 Sep 2023 09:57:57 +0800
Message-Id: <1693965477-14340-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27858.004
X-TMASE-Result: 10--4.836800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxJEjJjpEhCnybY
	s25CxqEvVLAa8KXwKt4Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl/qzSYnI5VS9npt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFOwVyNVLv/CQCBTv5J66ubJykV
	GIzSntnzkYlfWCIyuXyODXhrSzNz0lFfNcYB0LZWgyW9cLvnl/BcycOqboQgjMMsBC3o4mwux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 01:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104745

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Add include_joined_str parameter to util.walk
setup.cfg shouldn't have version

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-asttokens_2.2.1.bb => python3-asttokens_2.4.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asttokens_2.2.1.bb => python3-asttokens_2.4.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-asttokens_2.2.1.bb b/meta-python/recipes-devtools/python/python3-asttokens_2.4.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-asttokens_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-asttokens_2.4.0.bb
index 7c7753034b..3942122d60 100644
--- a/meta-python/recipes-devtools/python/python3-asttokens_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-asttokens_2.4.0.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "asttokens"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "4622110b2a6f30b77e1473affaa97e711bc2f07d3f10848420ff1898edbe94f3"
+SRC_URI[sha256sum] = "2e0171b991b2c959acc6c49318049236844a5da1d65ba2672c4880c1c894834e"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


