Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29429C001DF
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:14:25 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.7505.1687850059217278055
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="101082624"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="101082624"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:14:15 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BD312F0770
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:13 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id EB0A7D9471
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:12 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1CE2588D20;
	Tue, 27 Jun 2023 16:14:12 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-platformdirs: upgrade 3.6.0 -> 3.8.0
Date: Tue, 27 Jun 2023 15:12:04 +0800
Message-Id: <1687849939-19941-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
References: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27716.005
X-TMASE-Result: 10--2.362800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwkBp9p98ztEb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74C0oMqkY991yQIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFDb0Em+PCOdrcCfLEYkgI74+3H
	n+Z0jrP7phjliaMzaWFYCZIhnpZRmm1rdeZ03NTdUPIsre2zAHHgYRvlmPrlkNcEHcmHWZdex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 07:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103601

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add missing user media directory docs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-platformdirs_3.6.0.bb => python3-platformdirs_3.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_3.6.0.bb => python3-platformdirs_3.8.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_3.6.0.bb b/meta-python/recipes-devtools/python/python3-platformdirs_3.8.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-platformdirs_3.6.0.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_3.8.0.bb
index 20b3299ac7..cda46ff754 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_3.8.0.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRCREV ?= "85b0b67eb33a835b797c1d52dab4a06c5554b7ee"
+SRCREV ?= "d5111a720733d2dcab9abdb94c0ab7377cdb6a9c"
 SRC_URI[sha256sum] = "7954a68d0ba23558d753f73437c55f89027cf8f5108c19844d4b82e5af396335"
 
 inherit python_setuptools_build_meta ptest
-- 
2.34.1


