Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62FD6C6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:22:44 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.6418.1692865363590529518
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="108099829"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="108099829"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:22:40 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8403CCA1E4
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:22:36 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BC374D8BB4
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:22:35 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4A7572FC5EBE;
	Thu, 24 Aug 2023 17:22:34 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] redis: upgrade 7.0.12 -> 7.2.0
Date: Thu, 24 Aug 2023 16:22:25 +0800
Message-Id: <1692865345-3149-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27832.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27832.006
X-TMASE-Result: 10--10.541200-10.000000
X-TMASE-MatchedRID: AFiVwG0qm0+jz0nOeth/ybi7edL7cQQOkdS3kPlaZyXfUZT83lbkEBUV
	v+O8YueGsOkqiHn42aiK8WnR386CVm0Xr+fj3ww/8t4fUUGeErRH1aKe7AETRkXM4yDw7dQ/vwU
	evDt+uW60W1cvADA9CnPW+etWlsJF8oWuLhK0Tf2qh5pv1eDPz9hQO8CvZj/XuBsk5njfgGzmn1
	MY2amWUSc8jsMsDzoT771LxOS+uHjpHzzvfxlA9YeZGkF0b0fXQR7lWMXPA1v0CSRcYO6eKrwAm
	z0iQUL1CgqSOSdIOy4zLmfGY6iDkURfCdMIZ+bdA34KY0g5BTdy4VFP6muDhq2EwWJsUOPMlIOV
	A+gJRdKxfbhqGxLk+1+24nCsUSFNBLPx9cDMrKbdB/CxWTRRu/558CedkGIvzP4Frv6e/e6TTT1
	7Ch1GN44B1qlX+irXV7QY3XfIgLuiAioSh75ceH7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104585

From: Wang Mingyu <wangmy@fujitsu.com>

hiredis-use-default-CC-if-it-is-set.patch
oe-use-libc-malloc.patch
refreshed for 7.2.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-src-Do-not-reset-FINAL_LIBS.patch             |  0
 .../0006-Define-correct-gregs-for-RISCV32.patch        |  0
 .../{redis-7.0.12 => redis-7.2.0}/GNU_SOURCE-7.patch   |  0
 .../hiredis-use-default-CC-if-it-is-set.patch          | 10 ++++------
 .../{redis-7.0.12 => redis-7.2.0}/init-redis-server    |  0
 ...ate-Makefile-to-use-environment-build-setting.patch |  0
 .../oe-use-libc-malloc.patch                           | 10 ++++------
 .../redis/{redis-7.0.12 => redis-7.2.0}/redis.conf     |  0
 .../redis/{redis-7.0.12 => redis-7.2.0}/redis.service  |  0
 .../redis/{redis_7.0.12.bb => redis_7.2.0.bb}          |  2 +-
 10 files changed, 9 insertions(+), 13 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis-7.0.12 => redis-7.2.0}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.12 => redis-7.2.0}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.12 => redis-7.2.0}/GNU_SOURCE-7.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.12 => redis-7.2.0}/hiredis-use-default-CC-if-it-is-set.patch (82%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.12 => redis-7.2.0}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.12 => redis-7.2.0}/lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.12 => redis-7.2.0}/oe-use-libc-malloc.patch (83%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.12 => redis-7.2.0}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.12 => redis-7.2.0}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_7.0.12.bb => redis_7.2.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis-7.0.12/0001-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.2.0/0001-src-Do-not-reset-FINAL_LIBS.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.12/0001-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.0/0001-src-Do-not-reset-FINAL_LIBS.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.12/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.2.0/0006-Define-correct-gregs-for-RISCV32.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.12/0006-Define-correct-gregs-for-RISCV32.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.0/0006-Define-correct-gregs-for-RISCV32.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.12/GNU_SOURCE-7.patch b/meta-oe/recipes-extended/redis/redis-7.2.0/GNU_SOURCE-7.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.12/GNU_SOURCE-7.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.0/GNU_SOURCE-7.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.12/hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.2.0/hiredis-use-default-CC-if-it-is-set.patch
similarity index 82%
rename from meta-oe/recipes-extended/redis/redis-7.0.12/hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.0/hiredis-use-default-CC-if-it-is-set.patch
index 250fdd0ff4..5b9b71ea69 100644
--- a/meta-oe/recipes-extended/redis/redis-7.0.12/hiredis-use-default-CC-if-it-is-set.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.0/hiredis-use-default-CC-if-it-is-set.patch
@@ -1,4 +1,4 @@
-From 9da2d12c9fabfff4b4460accf887658db89687e4 Mon Sep 17 00:00:00 2001
+From 41efa2f0cf08c91ff935bbb2d16ab233df7f5811 Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 17:39:52 -0600
 Subject: [PATCH] hiredis: use default CC if it is set
@@ -18,21 +18,19 @@ Reworked for 6.0.4
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 
 ---
-Upstream-Status: Pending
-
  deps/hiredis/Makefile | 2 --
  1 file changed, 2 deletions(-)
 
 diff --git a/deps/hiredis/Makefile b/deps/hiredis/Makefile
-index 7e41c97..54717e3 100644
+index bd2106b..9ce768d 100644
 --- a/deps/hiredis/Makefile
 +++ b/deps/hiredis/Makefile
-@@ -42,8 +42,6 @@ endef
+@@ -36,8 +36,6 @@ endef
  export REDIS_TEST_CONFIG
  
  # Fallback to gcc when $CC is not in $PATH.
 -CC:=$(shell sh -c 'type $${CC%% *} >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
 -CXX:=$(shell sh -c 'type $${CXX%% *} >/dev/null 2>/dev/null && echo $(CXX) || echo g++')
  OPTIMIZATION?=-O3
- WARNINGS=-Wall -W -Wstrict-prototypes -Wwrite-strings -Wno-missing-field-initializers
+ WARNINGS=-Wall -Wextra -Werror -Wstrict-prototypes -Wwrite-strings -Wno-missing-field-initializers
  DEBUG_FLAGS?= -g -ggdb
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.12/init-redis-server b/meta-oe/recipes-extended/redis/redis-7.2.0/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.12/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-7.2.0/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.12/lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.2.0/lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.12/lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.0/lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.12/oe-use-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-7.2.0/oe-use-libc-malloc.patch
similarity index 83%
rename from meta-oe/recipes-extended/redis/redis-7.0.12/oe-use-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.0/oe-use-libc-malloc.patch
index bf05fc4c50..be186b57da 100644
--- a/meta-oe/recipes-extended/redis/redis-7.0.12/oe-use-libc-malloc.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.0/oe-use-libc-malloc.patch
@@ -1,4 +1,4 @@
-From 88da6b19ecd00747769663e913aba5e9569c489d Mon Sep 17 00:00:00 2001
+From 38a5f403b033d03cdac3ff814687d83f61527d8e Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Wed, 6 Feb 2013 20:51:02 -0600
 Subject: [PATCH] hack to force use of libc malloc
@@ -15,13 +15,11 @@ Update to work with 4.0.8
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
 
 ---
-Upstream-Status: Pending
-
  src/Makefile | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 2a0d74d..ddabd44 100644
+index ecbd275..39decee 100644
 --- a/src/Makefile
 +++ b/src/Makefile
 @@ -13,7 +13,8 @@
@@ -32,5 +30,5 @@ index 2a0d74d..ddabd44 100644
 +# use fake uname option to force use of generic libc
 +uname_S := "USE_LIBC_MALLOC"
  uname_M := $(shell sh -c 'uname -m 2>/dev/null || echo not')
- OPTIMIZATION?=-O2
- DEPENDENCY_TARGETS=hiredis linenoise lua hdr_histogram
+ CLANG := $(findstring clang,$(shell sh -c '$(CC) --version | head -1'))
+ OPTIMIZATION?=-O3
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.12/redis.conf b/meta-oe/recipes-extended/redis/redis-7.2.0/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.12/redis.conf
rename to meta-oe/recipes-extended/redis/redis-7.2.0/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.12/redis.service b/meta-oe/recipes-extended/redis/redis-7.2.0/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.12/redis.service
rename to meta-oe/recipes-extended/redis/redis-7.2.0/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.12.bb b/meta-oe/recipes-extended/redis/redis_7.2.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.0.12.bb
rename to meta-oe/recipes-extended/redis/redis_7.2.0.bb
index 321b90dadf..4f1c97b7e4 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "9dd83d5b278bb2bf0e39bfeb75c3e8170024edbaf11ba13b7037b2945cf48ab7"
+SRC_URI[sha256sum] = "8b12e242647635b419a0e1833eda02b65bf64e39eb9e509d9db4888fb3124943"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.34.1


