Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8EB9C77B7D
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 13:05:45 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.66057.1684069538603761216
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 06:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vQkCEVlJ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1684069536; i=@fujitsu.com;
	bh=MbZ0wG56gsO1LA4bTj0Yuwxe14Xwn7j+eVKFFEdsS5Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=vQkCEVlJ0xdxnCk8jfcN+JenrLJJ1vzB8y79umdkmdfrmo+c9N/JqTifAeuWpgrj9
	 B+YsltbV0Ha//I7nrc5nYOai0KSP+YQtC3g8wKTmuiZ9iMfun+nFL/9DDKqDWno8HR
	 jmzQhp9Heukocmqy4dvgB3ZIyAmRP58NZ8qroceYkRFVlZJkfHkrn1xpSnN2z7h+Ix
	 phOSJFgqUT9IG3FHb87rmvpETTcsVT4OHK0DASrhM1VnId8DGKV+gNE0L4+FVzfEk9
	 LFlcKN2ovbBOjxT6tA/IKX6jD38ngYdqJPAvR+lNRn1YJD70QxOudt1I/fywRtzhhE
	 ZJwRFMTAFwVpA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDLMWRWlGSWpSXmKPExsViZ8ORpDv/TkK
  KweEFxhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bve4+ZC56IVyydntPAuFe0i5GLQ0hgI6PE
  y+/7mSGcqUwSrc/vADmcHGwCEhLT955kB7FFBHQlPn6YywhiMwuoSMyYfISpi5GDQ1jAQaJjv
  RVImEVAVWLyhdOsIDavgJPEj3e/wMZICChITHn4HszmFHCW+HHrBROILQRU8/TeZFaIGjWJq+
  c2MU9g5FnAyLCK0aw4tagstUjXXC+pKDM9oyQ3MTNHL7FKN1EvtVQ3L7+oJEPXUC+xvFgvtbh
  Yr7gyNzknRS8vtWQTIzAgUopTPXcwtu36q3eIUZKDSUmU91pJXIoQX1J+SmVGYnFGfFFpTmrx
  IUYZDg4lCV6dmwkpQoJFqempFWmZOcDghElLcPAoifDGXQVK8xYXJOYWZ6ZDpE4x6nJs2td1g
  FmIJS8/L1VKnPcAyAwBkKKM0jy4EbBIucQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmJfnBt
  AUnsy8ErhNr4COYAI64taeeJAjShIRUlINTDNjfJzjJ/urnzdYxjDx3vQlHzLvXbJ1XeEvv+f
  EiQDWTYl+j29uWWEoNSWq1aB6aaWl6uvUrQv5Xm7u76tfzP9dfULaeuW9WROFd4Us9F/w5k35
  tQxzv3brqFoH5rqQqTuDkorjah79kV/kzXaz5s+tb/Ok2zZXr5j+Qk/oSnGz1yMpl6q6zIPyr
  tJ7Xx848M303JEFU88JvtXQKd5VnOFWIlgb8mCGvsf2y490ue69Ob9b7LV9ssHlA4Zc73+nJP
  5Z0bmhYOuruz8UppY/e+2dscBv6+6j0+RM669N6g9cUJdZn3DS4W3Q173PDn2Ifvs65Iv3U4U
  3kgt3nJ3p+upAwJEs6fio5oPq1tcPvhNQYinOSDTUYi4qTgQAdIEpSw8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-732.messagelabs.com!1684069535!170291!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20475 invoked from network); 14 May 2023 13:05:35 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2023 13:05:35 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4B2721AE;
	Sun, 14 May 2023 14:05:35 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 71F747B;
	Sun, 14 May 2023 14:05:34 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] postgresql: upgrade 15.2 -> 15.3
Date: Sun, 14 May 2023 21:05:18 +0800
Message-Id: <1684069520-12282-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684069520-12282-1-git-send-email-wangmy@fujitsu.com>
References: <1684069520-12282-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 13:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102573

From: Wang Mingyu <wangmy@fujitsu.com>

0001-configure.ac-bypass-autoconf-2.69-version-check.patch
refreshed for 15.3

Changelog:
https://www.postgresql.org/docs/release/15.3/

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nfigure.ac-bypass-autoconf-2.69-version-check.patch | 10 ++++------
 .../{postgresql_15.2.bb => postgresql_15.3.bb}         |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_15.2.bb => postgresql_15.3.bb} (84%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index 467b5c4f5e..3c8187d1a2 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -1,4 +1,4 @@
-From 258c6bd2ad96f2c42f1cb5f4c84e4ca5865059f0 Mon Sep 17 00:00:00 2001
+From 5f9dedc91a0a9710033fa155ea759f765ce5b58b Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Fri, 5 Feb 2021 17:15:42 -0500
 Subject: [PATCH] configure.ac: bypass autoconf 2.69 version check
@@ -8,17 +8,18 @@ for upgrade to autoconf 2.71
 Upstream-Status: Inappropriate [disable feature]
 
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+
 ---
  configure.ac | 4 ----
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 48d7256..9bee38f 100644
+index 998ff31..912e490 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [15.2], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [15.3], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
@@ -27,6 +28,3 @@ index 48d7256..9bee38f 100644
  AC_COPYRIGHT([Copyright (c) 1996-2022, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_15.2.bb b/meta-oe/recipes-dbs/postgresql/postgresql_15.3.bb
similarity index 84%
rename from meta-oe/recipes-dbs/postgresql/postgresql_15.2.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_15.3.bb
index 5c95e4da32..c4d4124f9a 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_15.2.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_15.3.bb
@@ -11,7 +11,7 @@ SRC_URI += "\
    file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "99a2171fc3d6b5b5f56b757a7a3cb85d509a38e4273805def23941ed2b8468c7"
+SRC_URI[sha256sum] = "ffc7d4891f00ffbf5c3f4eab7fbbced8460b8c0ee63c5a5167133b9e6599d932"
 
 CVE_CHECK_IGNORE += "\
    CVE-2017-8806 \
-- 
2.34.1


