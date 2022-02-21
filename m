Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E19C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 13:22:41 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.10446.1645449760201288690
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 05:22:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ThWXtP3t;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645449758; i=@fujitsu.com;
	bh=f8lKJDu5ox3SyYjKpuTFJKCPO6ZTZM5cr+iLJP+IQNk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ThWXtP3t8EVxVXRmR/3pKyOzgowCASyK1H6vvA9l6NKHIQQ61u05MSbX4uj9IwIOq
	 K3roDdecVthtCJZWkKUVFIxu+sSOTdYnacyeYFIO2GL10tvdFGY1pRCzQkil0Xf1ZF
	 w+Hmvdh2vJ77gqKotijsH9YAkOk7MKvJlTT5kxZbhsAmMM2cSSGnZ3kvby3cHzPuWP
	 NgM+MutceHgWDW0Ky2eGgUsh+YWd+PMxtmaLxyRJs55E5NYSYbKD1pT/sUhhwYxI9A
	 ROQC7FG9rY2mi+N9+KOXUUSp+DqFE5ZtmEg+qggx5t8ElPXsixDaPI6pWbmPUE9epg
	 pv5K6Vkr52/iA==
Received: from [100.115.69.48] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 A8/68-25243-E1293126; Mon, 21 Feb 2022 13:22:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLIsWRWlGSWpSXmKPExsViZ8ORqCs3STj
  J4NZeTouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePE5aVsBQ3iFVNOHWVrYPwu0sXIxSEk8IRR
  4s3nY0wQzgUmia4Pp1kgnBOMErNv/ALKcHKwCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAt8XnHZhYQm0VAVWLGs3NgNq+Ak8Sc5vdg9RICChJTHkLYnALOEuc7nrCB2EJANWfa90
  DVC0qcnPmEBWK+hMTBFy+gehUlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gVFwFpL2WUjaFzAyrWK
  0SyrKTM8oyU3MzNE1NDDQNTQ01TWz1DU0NdNLrNJN1Est1U1OzSspSgRK6yWWF+ulFhfrFVfm
  Juek6OWllmxiBIZzSrHrnB2MF/p+6h1ilORgUhLlrW0XThLiS8pPqcxILM6ILyrNSS0+xCjDw
  aEkwSvcD5QTLEpNT61Iy8wBxhZMWoKDR0mEt7wZKM1bXJCYW5yZDpE6xWjPsXPL5b3MHFevXA
  GSN8DkpjU39jILseTl56VKifMKTgRqEwBpyyjNgxsKSwWXGGWlhHkZGRgYhHgKUotyM0tQ5V8
  xinMwKgnzBoNM4cnMK4Hb/QroLCags6ZkCYGcVZKIkJJqYLr85e0UMVPWxB0nVt3jD9xt6uD/
  46ZfsvHnmrAJzEmb75y6vHCpF/OTJZNPBW2cJ8i0reXR5Of7zsxb8eLd9Q1Bis1F8jmlrN37O
  87rb1I24uh9P+m9mfiNFjvDo6Jsq9T5i5mV6rUfrNsm9y/RguH6nbkbUkzDEswuutr+nVUuzC
  lz7GvJI+5Kx2m8a9j0r4t7pz5h+yi5Pf7vopAlszkvqHS0lNefLI/kOb53/sUAa3HPplTFmul
  qkYrcbj827FjWIG9iGV/Xm/yH3e5OXKDLplilD23lJdLPnrLHiVxdesihy1fkk93TrG3b3u2f
  yLCdWXNe11mBJ+Fq1w6fCWaJzdj9Nv3i/jsb1T8rvFdiKc5INNRiLipOBAAg8O0VgAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-532.messagelabs.com!1645449757!19118!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25194 invoked from network); 21 Feb 2022 13:22:38 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Feb 2022 13:22:38 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A2A741001A2
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:22:37 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 95E30100199
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:22:37 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 21 Feb 2022 13:22:22 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] inotify-tools: upgrade 3.21.9.6 -> 3.22.1.0
Date: Mon, 21 Feb 2022 21:22:08 +0800
Message-ID: <1645449729-23271-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645449729-23271-1-git-send-email-wangmy@fujitsu.com>
References: <1645449729-23271-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 13:22:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95413

0001-libinotifytools-Include-limit.h-for-PATH_MAX.patch
removed since it's included in 3.22.1.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...fytools-Include-limit.h-for-PATH_MAX.patch | 29 -------------------
 ..._3.21.9.6.bb => inotify-tools_3.22.1.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 31 deletions(-)
 delete mode 100644 meta-oe/recipes-support/inotify-tools/inotify-tools/0001-libinotifytools-Include-limit.h-for-PATH_MAX.patch
 rename meta-oe/recipes-support/inotify-tools/{inotify-tools_3.21.9.6.bb => inotify-tools_3.22.1.0.bb} (86%)

diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools/0001-libinotifytools-Include-limit.h-for-PATH_MAX.patch b/meta-oe/recipes-support/inotify-tools/inotify-tools/0001-libinotifytools-Include-limit.h-for-PATH_MAX.patch
deleted file mode 100644
index f30a62d594..0000000000
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools/0001-libinotifytools-Include-limit.h-for-PATH_MAX.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 1e37cc3aa674c4b052f0655fef59a910fd7325cb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 16 Dec 2021 14:53:25 -0800
-Subject: [PATCH 1/2] libinotifytools: Include limit.h for PATH_MAX
-
-musl builds fail since the required header which defines PATH_MAX is
-missing, its perhaps included indirectly via glibc based systems
-
-Upstream-Status: Submitted [https://github.com/inotify-tools/inotify-tools/pull/153]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libinotifytools/src/inotifytools.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libinotifytools/src/inotifytools.c b/libinotifytools/src/inotifytools.c
-index 8bdfdb6..902eac2 100644
---- a/libinotifytools/src/inotifytools.c
-+++ b/libinotifytools/src/inotifytools.c
-@@ -17,6 +17,7 @@
- #include "inotifytools_p.h"
- #include "stats.h"
- 
-+#include <limits.h>
- #include <string.h>
- #include <strings.h>
- #include <stdlib.h>
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.21.9.6.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.1.0.bb
similarity index 86%
rename from meta-oe/recipes-support/inotify-tools/inotify-tools_3.21.9.6.bb
rename to meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.1.0.bb
index 89c3a00b71..38ba91552c 100644
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools_3.21.9.6.bb
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_3.22.1.0.bb
@@ -5,10 +5,9 @@ SECTION = "console/devel"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ac6c26e52aea428ee7f56dc2c56424c6"
 
-SRCREV = "8f8fcdffb7e80928bea6c1fccd3527a9f5d8fe77"
+SRCREV = "4b72dcd15299e1d0cb096397d9aab513ffed1657"
 
 SRC_URI = "git://github.com/${BPN}/${BPN};branch=master;protocol=https \
-           file://0001-libinotifytools-Include-limit.h-for-PATH_MAX.patch \
            file://0002-libinotifytools-Bridge-differences-between-musl-glib.patch \
           "
 
-- 
2.25.1


