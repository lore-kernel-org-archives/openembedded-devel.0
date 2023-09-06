Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930ABCCFA1E
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:03:55 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.2505.1693965833315228541
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="130904686"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="130904686"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:03:52 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 093B1D500B
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:03:49 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 432A0F999
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:03:48 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C328B6B346;
	Wed,  6 Sep 2023 11:03:47 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-soupsieve: upgrade 2.4.1 -> 2.5
Date: Wed,  6 Sep 2023 10:03:40 +0800
Message-Id: <1693965820-14884-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27858.004
X-TMASE-Result: 10-0.685700-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrRealVAhocE+U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8QhNjZQYyI3Cl6ppmExqcYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFN4sdjv7ZLoqQ+EOUIQLLcF8fx
	I34+vPYonL6TSIhUHfuoXRrKy4pCoUw1+SJsRUVsvV+RORFFe15144LSkKq03yCX3nLJdH/Ox9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 02:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104759

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    NEW: Update to support Python 3.12.
    NEW: Drop support for Python 3.7.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-soupsieve_2.4.1.bb => python3-soupsieve_2.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.4.1.bb => python3-soupsieve_2.5.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.4.1.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.5.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-soupsieve_2.4.1.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.5.bb
index 70c35844a1..585613dd5f 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=520586fa71ed2cbda50b4a8c89621e09"
 
-SRC_URI[sha256sum] = "89d12b2d5dfcd2c9e8c22326da9d9aa9cb3dfab0a83a024f05704076ee8d35ea"
+SRC_URI[sha256sum] = "5663d5a7b3bfaeee0bc4372e7fc48f9cff4940b3eec54a6451cc5299f1097690"
 
 inherit pypi python_hatchling python_setuptools_build_meta ptest
 
-- 
2.34.1


