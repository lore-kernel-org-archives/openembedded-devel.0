Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED02DC001DE
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:38:35 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.151952.1692149911975418894
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="115966146"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="115966146"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:38:29 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E1323D3EBD
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:38:26 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3AB06D39C8
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:38:26 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B15EA2007685C;
	Wed, 16 Aug 2023 10:38:25 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] postgresql: upgrade 15.3 -> 15.4
Date: Wed, 16 Aug 2023 09:38:03 +0800
Message-Id: <1692149883-5071-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27816.003
X-TMASE-Result: 10-1.848600-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yWOho7buv7d9XLILvyEBT87fc2Xd6VJ+ynYW
	2eXId8+tdB9aRZ3DyIRaosFST81rSwDNPxu11HXjuce7gFxhKa3Vy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYoPY+q3Rjt7nYW2F8jkDYf1/OBWacv+iVdG3Y6ijqBt3K2lU67dNkZmq2s
	h3fGrDN2UVI5FRUTheEgykP1mc9SdJ6sKfyz0AbQzrPeIO/OIH7xtPw/8I7HTn3ZLCt3rRSSiaS
	qRpkfBtx5WfkUb/fHZ5OPD8XJFfpB8TzIzimOwPC24oEZ6SpSmcfuxsiY4QFGYo7JQTrrLX3Av0
	oy6DZF5JZQI+oTw3B3u5ZqaDJH0aWyOZJiY6401d4ViKejy4I2rJxZQE1rHujYKF2/pVSSM9QAC
	9q0X4A+x9n1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104377

From: Wang Mingyu <wangmy@fujitsu.com>

0001-configure.ac-bypass-autoconf-2.69-version-check.patch
refreshed for 15.4

Changelog:
https://www.postgresql.org/docs/release/15.4/

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-configure.ac-bypass-autoconf-2.69-version-check.patch | 8 +++++---
 .../postgresql/{postgresql_15.3.bb => postgresql_15.4.bb} | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_15.3.bb => postgresql_15.4.bb} (86%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index 3c8187d1a2..fb70b22720 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -8,18 +8,17 @@ for upgrade to autoconf 2.71
 Upstream-Status: Inappropriate [disable feature]
 
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
-
 ---
  configure.ac | 4 ----
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 998ff31..912e490 100644
+index 524fdf1..3bea642 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [15.3], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [15.4], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
@@ -28,3 +27,6 @@ index 998ff31..912e490 100644
  AC_COPYRIGHT([Copyright (c) 1996-2022, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_15.3.bb b/meta-oe/recipes-dbs/postgresql/postgresql_15.4.bb
similarity index 86%
rename from meta-oe/recipes-dbs/postgresql/postgresql_15.3.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_15.4.bb
index e1d49895f0..3aa2662891 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_15.3.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_15.4.bb
@@ -11,6 +11,6 @@ SRC_URI += "\
    file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "ffc7d4891f00ffbf5c3f4eab7fbbced8460b8c0ee63c5a5167133b9e6599d932"
+SRC_URI[sha256sum] = "baec5a4bdc4437336653b6cb5d9ed89be5bd5c0c58b94e0becee0a999e63c8f9"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Ddoesn't apply to out configuration of postgresql so we can safely ignore it."
-- 
2.34.1


