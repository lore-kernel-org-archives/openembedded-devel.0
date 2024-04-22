Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055A2C10F16
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 09:16:21 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.14075.1713777375537617673
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 02:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gA9wcMR2;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713777375; x=1745313375;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/ByiZm/SLHCwokjApr7uBYCTaMH4xj9W0wEW1U7NTtw=;
  b=gA9wcMR2Ndwe0YCGuhvjQJKFVveMa9uL5Xt6d2NnCTMbF0R81tLmaWQq
   BkvIMSWzTs2CeiDpm9sQfdvxbpxki4sLPtAIjTVfrl5NMXuPpLAD2RAvo
   OzEanSrpcSY+jqDggA2fcSU7Eok/6rPcpdNIbE6x1N/2lPrpyFwnY0SKH
   VFmC7EE/GnZgRSF4Z2kXfXCOhqlPfVD7ufnKmVp+nDkGWrvo2U+5XooxY
   fxh4Wo5BcE6pEwtsVui9WUXQLtPd9AqS6+ReHh8XNukyaa+4igv8sJ+t7
   itwo9wxN231J+xfZYPDrDMXaAKeMkKnx1suTKjutfXBK/An/HSStnr328
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="135129205"
X-IronPort-AV: E=Sophos;i="6.07,220,1708354800"; 
   d="scan'208";a="135129205"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 18:16:13 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2758AD64BE
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:11 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 42EBBD4C0B
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:10 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D08816BD75
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 79A361A000B;
	Mon, 22 Apr 2024 17:16:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 15/15] sanlock: upgrade 3.9.1 -> 3.9.2
Date: Mon, 22 Apr 2024 17:15:45 +0800
Message-Id: <1713777345-29264-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
References: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28336.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28336.006
X-TMASE-Result: 10--5.033500-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yTo39wOA02LhGEfoClqBl87fUZT83lbkEJYv
	gWqjMEzaNYCBzzxsUnvZ5eN1eJMdpVpCIuRr0RxKP0HVIeixJdDBOVz0Jwcxl0fyM5VfgjG209D
	6Rw2zIrPxq3ixYTmGC+jks7hOzqOfl1bc/4UP/k6dVNZaI2n6/8oioCrSMgeKYUdWP7oX6sgD2d
	r8AN36j6YgFpxfciFKSBiMsK47m3VtdctxAOiWFqoXHZz/dXlxcycts50tWT8CGfvnVpx+256ba
	/D5x6cp4vM1YF6AJbbCCfuIMF6xLSAHAopEd76v0OjVSt/dbdLKD/79cx3Ljwrh+eLBs53D0kbg
	it/iCUGRwWyHq6zJQw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 09:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110097

From: Wang Mingyu <wangmy@fujitsu.com>

0001-include-libgen.h-for-basename.patch
removed since it's included in 3.9.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-include-libgen.h-for-basename.patch  | 32 -------------------
 .../{sanlock_3.9.1.bb => sanlock_3.9.2.bb}    |  5 ++-
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/sanlock/sanlock/0001-include-libgen.h-for-basename.patch
 rename meta-oe/recipes-extended/sanlock/{sanlock_3.9.1.bb => sanlock_3.9.2.bb} (93%)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock/0001-include-libgen.h-for-basename.patch b/meta-oe/recipes-extended/sanlock/sanlock/0001-include-libgen.h-for-basename.patch
deleted file mode 100644
index 439ffc647..000000000
--- a/meta-oe/recipes-extended/sanlock/sanlock/0001-include-libgen.h-for-basename.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From c955ac2a4d57f21351e53a5209346fdc2325a747 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 25 Mar 2024 15:12:02 -0700
-Subject: [PATCH] include libgen.h for basename
-
-basename prototype has been removed from string.h from latest musl [1]
-compilers e.g. clang-18 flags the absense of prototype as error. therefore
-include libgen.h for providing it.
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- wdmd/main.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/wdmd/main.c b/wdmd/main.c
-index 38a99f3..7014462 100644
---- a/wdmd/main.c
-+++ b/wdmd/main.c
-@@ -15,6 +15,7 @@
- #include <stddef.h>
- #include <grp.h>
- #include <fcntl.h>
-+#include <libgen.h>
- #include <string.h>
- #include <errno.h>
- #include <limits.h>
--- 
-2.44.0
-
diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.9.1.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.9.2.bb
similarity index 93%
rename from meta-oe/recipes-extended/sanlock/sanlock_3.9.1.bb
rename to meta-oe/recipes-extended/sanlock/sanlock_3.9.2.bb
index 1d0f8b010..d369af1c6 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.9.1.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.9.2.bb
@@ -16,9 +16,8 @@ PV .= "+git"
 SRC_URI = "git://pagure.io/sanlock.git;protocol=http;branch=master \
            file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch \
            file://0001-add-missing-system-header-string.h.patch \
-           file://0001-include-libgen.h-for-basename.patch \
-          "
-SRCREV = "ecf30a1ccf756776dfea440e4cf9b0b54581075f"
+           "
+SRCREV = "e005fbec2324aa8de7e2f302e5a17483c525b1d1"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


