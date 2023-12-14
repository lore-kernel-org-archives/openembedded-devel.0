Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A2CC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 08:39:56 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.17624.1702543188868738735
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 00:39:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="143159456"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="143159456"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 17:39:47 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 96008CA244
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:39:44 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BDC4CD8AE7
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:39:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C7BCA354C6E;
	Thu, 14 Dec 2023 17:39:42 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-alembic: upgrade 1.12.1 -> 1.13.0
Date: Thu, 14 Dec 2023 16:39:34 +0800
Message-Id: <1702543174-27307-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28056.006
X-TMASE-Result: 10-1.473700-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrBgA+oehWZhGU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa0BQOqUsWgx5gIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFODeSwmIL3cFCCWOn8YuuUis4L
	QJsVfGagbprO+qza97F8bp1oJxeZULiMAaywnNzDhL2oUySnz1hyey6YztZglozbbYGB339+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 08:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107422

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://alembic.sqlalchemy.org/en/latest/changelog.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.12.1.bb => python3-alembic_1.13.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.12.1.bb => python3-alembic_1.13.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.12.1.bb b/meta-python/recipes-devtools/python/python3-alembic_1.13.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-alembic_1.12.1.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.13.0.bb
index 107546dbf..865dd017c 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.13.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3023b042cb6002cb398344b51c67093"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "bca5877e9678b454706347bc10b97cb7d67f300320fa5c3a94423e8266e2823f"
+SRC_URI[sha256sum] = "ab4b3b94d2e1e5f81e34be8a9b7b7575fc9dd5398fccb0bef351ec9b14872623"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.34.1


