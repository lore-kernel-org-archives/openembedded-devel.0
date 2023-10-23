Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3D4C25B41
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:39:19 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.116034.1698050354217630971
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="137001355"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="137001355"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:39:12 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E06ADD3EC0
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:39:09 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E5B2CFB9A
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:39:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 636A36BA7B;
	Mon, 23 Oct 2023 17:39:08 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-engineio: upgrade 4.7.1 -> 4.8.0
Date: Mon, 23 Oct 2023 16:38:56 +0800
Message-Id: <1698050336-25373-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10--1.701600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrJF8tFEtOdqs+yMbBXXWKeTB9
	ccde3hbUz8qfPKN6j3INyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl/qzSYnI5VS9npt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFMT4pmJx9tHkhPD/m+PGPUp/+A
	lSWAzBvl3NErRIDBi/T8SfzTMYTF+S9EolToiPzEtc3rMVie8bHJV/bgzjJZE7RUptlKzRhOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105660

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Return consistent responses after Websocket connection ends
Migrate Python package metadata to pyproject.toml
Remove Python 3.7 from builds
Internal code restructure (no functional changes)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-engineio_4.7.1.bb => python3-engineio_4.8.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.7.1.bb => python3-engineio_4.8.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.7.1.bb b/meta-python/recipes-devtools/python/python3-engineio_4.8.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-engineio_4.7.1.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.8.0.bb
index 0ef64268a7..1cc79f1a9b 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.8.0.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 	python3-asyncio \
 "
 
-SRC_URI[sha256sum] = "a8422e345cd9a21451303380b160742ff02197975b1c3a02cef115febe2b1b20"
+SRC_URI[sha256sum] = "2a32585d8fecd0118264fe0c39788670456ca9aa466d7c026d995cfff68af164"
-- 
2.34.1


