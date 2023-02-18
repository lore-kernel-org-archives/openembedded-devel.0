Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F243EC636D7
	for <webhook@archiver.kernel.org>; Sat, 18 Feb 2023 10:26:10 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.9362.1676715968798777495
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Feb 2023 02:26:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JWVKSg8S;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676715967; i=@fujitsu.com;
	bh=plrcCRqnms/KMXw6vSs5VzvoK7ArtNXUZ1nslLre3pE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=JWVKSg8SVRuox+WeXg/gKu3WJYFkCqqmXsTVLssZxT4mutxHnAC7HS9kzQdorzbPt
	 ROublIN9Twh3f5w5/r/dCGoOy7WmVugXT+2VNBFjeb69NocYn7m8DZIh8kom+Hbz+X
	 K2lSQHkoSNZu10ULgMYB03UBfLmaKPvyDfx91Fl71pLasfvhUhXwYJSivOzZQ9Gk7N
	 rjIN0QArWIcTc9Ut8KXg/6sBkZOEJA3e6sICjtB7VZNG9m7YcFOFvO84G05VvsdqIG
	 90vKGq76YdpyU/fE05Bt6aLmu0dTNkbRrKf3pAIrG6VNDcQuJzEXYkEd3dmCvRGf6H
	 sdkH2BuJaKPuw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORpLtv+Yd
  kgyWP+CwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxrn86yFyySrZi27hJLA+MLyS5GLg4hgYeM
  Eu9ubGCFcK4ySSx4+IcFwtnLKHHqwyq2LkZODjYBKYkb9/+D2SIC+hJLZ+9hBrGZBVQkXvzuY
  QexhQXcJDYffMkIYrMIqEo0rlgJFucVcJKYOucDE4gtIaAgMeXhe7BeTgFniSsLV4HZQkA1p/
  bvYYGoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdKtH74BWWrSVw9t4l5AqPgLCTts5C0L2B
  kWsVoWpxaVJZapGuil1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuck6KX
  l1qyiREYvCnFisd2MP7r/at3iFGSg0lJlPfztvfJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR46
  +Z+SBYSLEpNT61Iy8wBRhJMWoKDR0mEt3I2UJq3uCAxtzgzHSJ1ilGXY9O+rgPMQix5+XmpUu
  K83MC4FBIAKcoozYMbAYvqS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEedcsA5rCk5lXArf
  pFdARTEBHLGB+C3JESSJCSqqBifeA9I+VbG0LapqYN4cnqFQt0YxJMnjvKv8+ZOa2OzWtHHYn
  XP23NBypF17IY7Z9TXXxlj2KG0QudXanM2juLa0KjN75rb2qc7qyjf+LxhqrZqegMxu6TY4/7
  ssomV4nzT+r9oO/Q/9106d35+91ndZ0t+rWzudLtyxcFHH9z95sjyNO/xZMPStrNaEgPdD1ol
  7tG94dGS3T9GPZuZoWTVe80feZ+UjN9FDxrtADHE18Oslrohndr5sUfM3fu942aKsWc7nF4wk
  HDZdUzZQ/eZ31plxxcsO0Uq6Gp9kL/XWcO3J2qW9L7spxbL31WnOJvJumxcN7k448/S0TXfVk
  nfr66ycedhSkHNvLPO2sEktxRqKhFnNRcSIAMSUdZWUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-565.messagelabs.com!1676715966!387004!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21707 invoked from network); 18 Feb 2023 10:26:06 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Feb 2023 10:26:06 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E70C11AF
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 10:26:05 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id DB49E1AC
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 10:26:05 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 18 Feb 2023 10:26:04 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] minicoredumper: upgrade 2.0.2 -> 2.0.3
Date: Sat, 18 Feb 2023 18:25:43 +0800
Message-ID: <1676715946-32075-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676715946-32075-1-git-send-email-wangmy@fujitsu.com>
References: <1676715946-32075-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 10:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101139

From: Wang Mingyu <wangmy@fujitsu.com>

0001-minicoredumper_demo-Use-optnone-attribute-with-clang.patch
removed since it's included in 2.0.3

Changelog:
==========
* Dump zero-blocks as 4KB blocks instead of single bytes to speed up
   piping to the compressor. (Only relevant if tar is not used.)

 * Drop core data exceeding the ustar 8GB limit. The core file is
   appropriately truncated and the actions are logged. This fixes tar
   file corruption for core files >8GB.

 * Known problems:

     - If tar is active, core files larger than 8GB will be
       truncated. If it is known that the core files will be >8GB and
       the full core file is needed, tar must be disabled.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...emo-Use-optnone-attribute-with-clang.patch | 37 -------------------
 ...umper_2.0.2.bb => minicoredumper_2.0.3.bb} |  3 +-
 2 files changed, 1 insertion(+), 39 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper_demo-Use-optnone-attribute-with-clang.patch
 rename meta-oe/recipes-kernel/minicoredumper/{minicoredumper_2.0.2.bb => minicoredumper_2.0.3.bb} (93%)

diff --git a/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper_demo-Use-optnone-attribute-with-clang.patch b/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper_demo-Use-optnone-attribute-with-clang.patch
deleted file mode 100644
index 05371e5cd..000000000
--- a/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper_demo-Use-optnone-attribute-with-clang.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From abaac31d1cb4d0ba0e8e9ef7f344e62de3b150de Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 4 Feb 2023 16:50:46 -0800
-Subject: [PATCH] minicoredumper_demo: Use 'optnone' attribute with clang
-
-clang does not support optimize("On") yet, therefore use optnone which
-should give intended results with clang compiler
-
-Upstream-Status: Submitted [https://github.com/diamon/minicoredumper/pull/7]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/minicoredumper_demo/main.c | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/src/minicoredumper_demo/main.c b/src/minicoredumper_demo/main.c
-index 65aac46..e60eb82 100644
---- a/src/minicoredumper_demo/main.c
-+++ b/src/minicoredumper_demo/main.c
-@@ -11,8 +11,13 @@
- #include <sys/types.h>
- 
- #include "minicoredumper.h"
--
--int __attribute__((optimize("O0"))) main(int argc, char *argv[])
-+int
-+#ifdef __clang__
-+__attribute__((optnone))
-+#else
-+__attribute__((optimize("O0")))
-+#endif
-+main(int argc, char *argv[])
- {
- 	char *str1 = "This is string 1.";
- 	unsigned long val1 = 0x1abc123f;
--- 
-2.39.1
-
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.2.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.3.bb
similarity index 93%
rename from meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.2.bb
rename to meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.3.bb
index 5763f845a..2c4111bc3 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.2.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.3.bb
@@ -9,10 +9,9 @@ DEPENDS = "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-linux json-c"
 
 inherit autotools pkgconfig ptest systemd update-rc.d
 
-SRCREV = "0bed11b3d69877ce59b1a71359349af60f2009ff"
+SRCREV = "e4706bf28a0699094add5d77a4b97145c2292c47"
 
 SRC_URI = "git://github.com/diamon/minicoredumper;protocol=https;branch=master \
-           file://0001-minicoredumper_demo-Use-optnone-attribute-with-clang.patch \
            file://minicoredumper.service \
            file://minicoredumper.init \
            file://run-ptest \
-- 
2.34.1


