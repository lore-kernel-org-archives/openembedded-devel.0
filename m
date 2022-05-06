Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E201BC433FE
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 15:09:11 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.30236.1652713749734820343
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 08:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nlsBNPAj;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652713748; i=@fujitsu.com;
	bh=E29/TJU/T1gxGAEdBk2WA2oaSfUIgfIp2WXi1ioUTuQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nlsBNPAjF00LgVmj+ONoLqUu0P4FGmUsHyo1FLQbA7TvjWwhgMv4iepBjV8Jyqmsx
	 xiAf5sBWu2h53R/XaH5KwtzZv42LWFXmBGdHVErWEs5kAubELERjdg225IJVaVIcba
	 o0R5nl1kVpoZaGQNOe8EH/d5+s1WjbxX1vX6cwVD9tQYx0l8bZOw9k0ZwDLjkS9Bk1
	 OLO+Rqz5cZukc3ggylE/cJrJEVCn8Qrh4Zfpg7IHvAJ0n9ucURnN4KLStwCyryz7Xz
	 uztZF3ld1oehobssJE6niOWCkozTOrowEe72DCS4QqXYzteb1XVH0A2yWOAc71MZT1
	 lvXed+SRSAinA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRWlGSWpSXmKPExsViZ8ORqCuc2ZR
  ksPW0hsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFhv1vBK+GKtueX2RsYe4W6GLk4hASeMEoc
  +TOXHcK5wCTx7+kHKGcPo8S703eZuxg5OdgE1CSm37rBCmKLCOhLLJ29ByzOLKAi8eJ3D1ADB
  4ewgIPEhvfCIGEWoPCeJZsZQWxeASeJeUcmgNkSAgoSUx6+B2vlFHCW2LZwLwuILQRUs3zSF1
  aIekGJkzOfsECMl5A4+OIFM0SvosTsy80sEHaFxIwZ29ggbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGO2SijLTM0pyEzNzdA0NDHQNDU11zQ11DS0N9BKrdBP1Ukt1k1PzSooSgdJ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiBoZxS7L5vB+OLvp96hxglOZiURHnXJDclCfEl5adUZiQWZ8QXleakFh9il
  OHgUJLgbUgDygkWpaanVqRl5gDjCiYtwcGjJMJ7PB4ozVtckJhbnJkOkTrFaMxxd+HevcwcO7
  dc3sssxJKXn5cqJc57MgGoVACkNKM0D24QLN4vMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBL
  mVc4AmsKTmVcCt+8V0ClMQKeI6DeCnFKSiJCSamBa5O43Tcv57obYtOUzmiK2Nd/9Xa+j0NMS
  ycd+oLvSWIqB20Dw/KVVs5rtt1uG2s6LU2Vy21sfrPzrIsc0I6c7ioqL5mju0VpWtt7o/YZnM
  nN7Wxt2mhSumeL36+Hhm3zKahpPO5KmfmrZzn75InfiRu22w7NL17B08m/vkH3gIan0xMX62P
  LDdr+FWjau2Wrf4H25fN6MhTPkHBkWFwvNPhw8PfD1PNdrv5/7li3raU5TvHXZYCdHc8TlGo0
  diTflV70rWPypQWqGUu3BSu9/ZVevPoj9kSo8rUj9gJKM27eV837KC0kaiXl8vxlt2H4o6dhD
  zjL9aVbn559OU4mfukr/dZGghpXeppWzjuxWYinOSDTUYi4qTgQAFk2hXnIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-528.messagelabs.com!1652713747!17681!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17504 invoked from network); 16 May 2022 15:09:07 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 May 2022 15:09:07 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 33BFB10018B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 16:09:07 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 26A7A100183
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 16:09:07 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 16 May 2022 16:08:54 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] postgresql: upgrade 14.2 -> 14.3
Date: Fri, 6 May 2022 22:51:02 +0800
Message-ID: <1651848662-13051-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651848662-13051-1-git-send-email-wangmy@fujitsu.com>
References: <1651848662-13051-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 May 2022 15:09:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97131

0001-configure.ac-bypass-autoconf-2.69-version-check.patch
refreshed for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...01-configure.ac-bypass-autoconf-2.69-version-check.patch | 6 +++---
 .../postgresql/{postgresql_14.2.bb => postgresql_14.3.bb}   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.2.bb => postgresql_14.3.bb} (80%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index 39ec7c2c8..78f24585e 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -1,4 +1,4 @@
-From 9c9ac8b64f940bf69ecdc92abca9b58f12b401c3 Mon Sep 17 00:00:00 2001
+From f7084ba49758a6b8db46b917b7c0f831bd65a08f Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Fri, 5 Feb 2021 17:15:42 -0500
 Subject: [PATCH] configure.ac: bypass autoconf 2.69 version check
@@ -14,12 +14,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 3b148b6..94f39c5 100644
+index d3c55f2..9120184 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [14.2], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [14.3], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.2.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.3.bb
similarity index 80%
rename from meta-oe/recipes-dbs/postgresql/postgresql_14.2.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_14.3.bb
index 52e886714..c686c9b35 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.2.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.3.bb
@@ -10,4 +10,4 @@ SRC_URI += "\
    file://remove_duplicate.patch \
 "
 
-SRC_URI[sha256sum] = "2cf78b2e468912f8101d695db5340cf313c2e9f68a612fb71427524e8c9a977a"
+SRC_URI[sha256sum] = "279057368bf59a919c05ada8f95c5e04abb43e74b9a2a69c3d46a20e07a9af38"
-- 
2.25.1


