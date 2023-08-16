Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7271C001DE
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:40:55 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.151759.1692150051210986822
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:40:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="115966396"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="115966396"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:40:48 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9BBCEC68E1
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:40:46 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D9F99CFBDD
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:40:45 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E89E21D157;
	Wed, 16 Aug 2023 10:40:45 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-alembic: upgrade 1.11.1 -> 1.11.2
Date: Wed, 16 Aug 2023 09:40:19 +0800
Message-Id: <1692150019-5254-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27816.003
X-TMASE-Result: 10--0.045200-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mr0bdjqKOoG3dH8jOVX4Ixtv7y
	OWod/KQ1TIkyrWv890oxONWxQSnHS/WZtOj0tJYAHWRJEfGP5nkooUkdlkMDvYQV1ekcARz8vqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW+5x7uAXGEprQFA6pSxaDHmAhn751acftuem2
	vw+cenKefOVcxjDhcwPcCXjNqUmkUnRE+fI6etksBWrYspZU7K6YhodzucF36BJKjHTxwPvK7jF
	4fLBrcRbPa7GWPv953yOslpcUTEVRmb1lFwAi/f8x0B8QXGLJrY4DMtpCZZZopebMSk1UmKlmXP
	gyQocYp5E1G2nFNyeETBf0diyKhk7DIVgUu7mCo=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:40:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104382

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- [feature] [operations] Added parameters if_exists and if_not_exists for index operations.
  Pull request courtesy of Max Adrian.
- [usecase] [typing] Added typing to the default script mako templates.
- [usecase] [autogenerate] Added support in autogenerate for NULLS NOT DISTINCT in
  the PostgreSQL dialect.
- [bug] Fixed format string logged when running a post write hook
  Pull request curtesy of Mathieu Défosse.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.11.1.bb => python3-alembic_1.11.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.11.1.bb => python3-alembic_1.11.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb b/meta-python/recipes-devtools/python/python3-alembic_1.11.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.11.2.bb
index feb2c419bc..6577e7f811 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.11.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3023b042cb6002cb398344b51c67093"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "6a810a6b012c88b33458fceb869aef09ac75d6ace5291915ba7fae44de372c01"
+SRC_URI[sha256sum] = "678f662130dc540dac12de0ea73de9f89caea9dbea138f60ef6263149bf84657"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.34.1


