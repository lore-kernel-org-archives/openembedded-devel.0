Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF4AC41513
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:38 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.7615.1690875748108024973
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="105999839"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="105999839"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:26 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C69CDD29E1
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:23 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 026E1D9487
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:23 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8137BE5E58;
	Tue,  1 Aug 2023 16:42:22 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-portion: upgrade 2.4.0 -> 2.4.1
Date: Tue,  1 Aug 2023 15:41:49 +0800
Message-Id: <1690875717-21608-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10-0.982400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrJ4cwIYL6KueU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa0BQOqUsWgx5gIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFHB2W4z77YjmYAaioWsGbBDVGG
	grjd6uChHdTGd8QF83yEhRkpLOzVrJ22SqxocqAxgEt6Ynf5G1J3lNn2YpNI0/+2ulX3m9VOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104192

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Import error when using create_api outside a REPL

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-portion_2.4.0.bb => python3-portion_2.4.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-portion_2.4.0.bb => python3-portion_2.4.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-portion_2.4.0.bb b/meta-python/recipes-devtools/python/python3-portion_2.4.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-portion_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-portion_2.4.1.bb
index 942f1204c0..a340ba7fce 100644
--- a/meta-python/recipes-devtools/python/python3-portion_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-portion_2.4.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "deb16389e844dbf9aeb654261fce5febd720e4786c6690efbb9dc11608226840"
+SRC_URI[sha256sum] = "9dcbf1808898f440aed304a5e9f0742a2859eca3b0ac7f1f58e50502852a8ef9"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-sortedcontainers \
-- 
2.34.1


