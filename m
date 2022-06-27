Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D03C43334
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 07:00:46 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.38607.1656313244817823511
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 00:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oSDYBZeC;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656313242; i=@fujitsu.com;
	bh=Sx+YsvXbH93v2nUXK2k5eNwHNldcpRDyrSvQlt8dDWI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=oSDYBZeCr8NyGSZULZA/wFwRGX6snkRqngnBiPWRYxmQ9rBH/G1Ttm7KJ1gylJz8r
	 j6O1k+xf67kMtWJwk8JajmhqcNi8YEU5mXxbMaE9uTo/kREzvPDS4lEJi8avZTC6dp
	 NILnd7ed7OVypO12Oayr58RxfqiJdfVM7lYax5h7/n+2ClV/LaTCPPdjF7Kkelx+hE
	 +7SrQ01FIDv7bCBRG0leUKbql15lEFe7jN6UJE/HfZkTC3Je3zhHBjMlCP4xUkPAh6
	 ZWdf331tmmE0helTHW9Tm+PcRTm4Vt43Xj+LefBNI1cZFvARIJUaYuHiONJs1Vd/a4
	 SrPop3qIm3OZg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNIsWRWlGSWpSXmKPExsViZ8MxSXdW6M4
  kg+4+dYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePP616mglfCFRM/iDUw9gp1MXJxCAk8YZS4
  snkSM4RznUli2+oF7BDOHkaJje+XAjmcHGwCahLTb91gBbFFBPQlls7ewwxiMwuoSLz43QNWI
  yzgIPF0zyYmEJtFQFViT/8PNhCbV8BJ4vbn34wgtoSAgsSUh+/BejkFnCUuTtwCZgsB1bxaeJ
  4Zol5Q4uTMJywQ8yUkDr54wQzRqygx+3IzC4RdITFjxjY2CFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkbbpKLM9IyS3MTMHF1DAwNdQ0NTIG2sa2hipJdYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdc
  mZuck6KXl1qyiREYyinF6X07GDfu+6V3iFGSg0lJlPeU2s4kIb6k/JTKjMTijPii0pzU4kOMM
  hwcShK8ViFAOcGi1PTUirTMHGBcwaQlOHiURHjbvIHSvMUFibnFmekQqVOM9hxTZ//bz8yxHE
  zO/Np2gJlj076uA8xCLHn5ealS4ry7g4DaBEDaMkrz4IbC0sAlRlkpYV5GBgYGIZ6C1KLczBJ
  U+VeM4hyMSsK8bCC38WTmlcDtfgV0FhPQWX4Td4CcVZKIkJJqYJpr9UtQ5kfSrAurJ1x6rXd5
  W3buajtn2/W2d7sfs69YGspcY5xoebpohYLZo3Usz+suXv10dHanz9qF8ldijJ+4blgzVWBVU
  tXLxFOVTSI39tlI5X9S4DO6+PSk8/EZP36suJ+hdtG9oauW2cdW5v/dAJ+0BUbFfjma8u5n/7
  mV2dzu9IvmvDvRdfWewukF3a/nB/VqzOh4sr1nz3GxZVazncVfVsnvcRLy7pD9/V19pydP7Hm
  T469rV65u/2ZU4TaL/agGi44Rg5Gz951YbfXpOcqf41kDZLe4PfwYtyrutbiW+9YOrxmTX6at
  6vv6N+tXhFteY81nV4s9Jd5zWmqF/27MmbbrdIL0LNeQUiWW4oxEQy3mouJEAPWQEDN+AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-745.messagelabs.com!1656313242!150938!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20760 invoked from network); 27 Jun 2022 07:00:42 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jun 2022 07:00:42 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 0FA951000CD
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 08:00:42 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 02CCF1000C0
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 08:00:42 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 27 Jun 2022 08:00:40 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] postgresql: upgrade 14.3 -> 14.4
Date: Mon, 27 Jun 2022 15:00:25 +0800
Message-ID: <1656313226-23852-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656313226-23852-1-git-send-email-wangmy@fujitsu.com>
References: <1656313226-23852-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jun 2022 07:00:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97596

0001-configure.ac-bypass-autoconf-2.69-version-check.patch
refreshed for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...01-configure.ac-bypass-autoconf-2.69-version-check.patch | 6 +++---
 .../postgresql/{postgresql_14.3.bb => postgresql_14.4.bb}   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.3.bb => postgresql_14.4.bb} (80%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index 78f24585e..2256bccec 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -1,4 +1,4 @@
-From f7084ba49758a6b8db46b917b7c0f831bd65a08f Mon Sep 17 00:00:00 2001
+From 07e605015fad0621c3e67133ff9330a5c6318daa Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Fri, 5 Feb 2021 17:15:42 -0500
 Subject: [PATCH] configure.ac: bypass autoconf 2.69 version check
@@ -14,12 +14,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index d3c55f2..9120184 100644
+index 04ef7be..0eb595b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [14.3], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [14.4], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.3.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb
similarity index 80%
rename from meta-oe/recipes-dbs/postgresql/postgresql_14.3.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb
index c686c9b35..01a6ee635 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.3.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb
@@ -10,4 +10,4 @@ SRC_URI += "\
    file://remove_duplicate.patch \
 "
 
-SRC_URI[sha256sum] = "279057368bf59a919c05ada8f95c5e04abb43e74b9a2a69c3d46a20e07a9af38"
+SRC_URI[sha256sum] = "c23b6237c5231c791511bdc79098617d6852e9e3bdf360efd8b5d15a1a3d8f6a"
-- 
2.25.1


