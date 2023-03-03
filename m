Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D600C678D4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 01:45:33 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.12641.1677807923619703257
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Mar 2023 17:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GJ/mQMxj;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id q31-20020a17090a17a200b0023750b69614so819978pja.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 17:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677807923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bJ1jaWkF9VZX9p0Fl4+rawUyGVzo8qqn0JLfO8R6Dz8=;
        b=GJ/mQMxjkgCzuXM0FpCW4Kph8YnLnum0G5c43X5OpXhn0xPv8zn7K2OJpiWvbe6J1j
         nKKM7gdM8uJNsEKVI9NLR/r5M336Ex6SG02R5GsdWbBPDM6xZp7ePy6BUNF3fuhjiziQ
         Xnr95n+CpzjmmzJL7Uq/ipzSmOxY75hzWc5FuyP4ZAjmNN198tRZjdyELp/eeGhydrHp
         0GLPmELSC4EE5tLBi1V6Zih4NvezEO+3SoPH416lJ9C+KcYoXRTJ1CROStqPAi6j5b/K
         cvHD2YXdv76MO7rbxaI6TyloqFhvsEM9M+pIudwBdgVZtNNfnwybARWdaRBLS1kLLaRx
         DL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677807923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJ1jaWkF9VZX9p0Fl4+rawUyGVzo8qqn0JLfO8R6Dz8=;
        b=K2xI4NBLRSRLKw1XHo4lH/gabsI+LwMW7oVt/2nBlptJsj16VH4AqDHk6s04r77X2e
         I8OHgYZBBM2ePcFT3JQPC9QXiDV6x2LoYgQjvX3M4ZYZ/7xhNfueu8v7AQeGcBvPNue+
         xtJYnQeMqe9wvpHTBmHhQ0YfyLagw8WGiezVAle7kXHQzdNzVG+IF+g4HpOCg104B2iN
         OZCXOjX2aHFEyvtktrsAHQddCr0CbFfEQIgd/YZjOcwLuhT1IabdrYmqJFiQFWzesH2q
         HtjLoRvwplwQlb65zp0X24WL8eOUUVJNLJnFIq0FGGlJXWUCGNsNbZ9VGganuv5LOiQK
         KEVw==
X-Gm-Message-State: AO0yUKWsxknhuc40vvyJ4lNb/IJXhAadyceVqrHlPSEg88eD+3jOo9to
	BN+4mdsBqgd19vAL5Ft0inAD21595ok=
X-Google-Smtp-Source: AK7set9OqKOkbzke5Tvc5ltTUe0ZiwFkpCp16v4jCxy/HQROK8SEDhftQNhg9mVMU0jUFNH/o9tQ+Q==
X-Received: by 2002:a17:902:f815:b0:19c:ba57:b25a with SMTP id ix21-20020a170902f81500b0019cba57b25amr3324279plb.11.1677807922351;
        Thu, 02 Mar 2023 17:45:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id c17-20020a170903235100b0019e76a99cdbsm277345plh.243.2023.03.02.17.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 17:45:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] pmdk: Upgrade to 1.12.1
Date: Thu,  2 Mar 2023 17:45:19 -0800
Message-Id: <20230303014519.345810-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Mar 2023 01:45:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101342

Add a patch to fix build with clang16

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...unction-prototypes-of-enum_to_str_fn.patch | 43 ++++++++++++
 ...axctl.h-instead-of-ndctl-libdaxctl.h.patch | 69 -------------------
 .../pmdk/{pmdk_1.11.1.bb => pmdk_1.12.1.bb}   |  6 +-
 3 files changed, 46 insertions(+), 72 deletions(-)
 create mode 100644 meta-oe/recipes-extended/pmdk/pmdk/0001-pmempool-Match-function-prototypes-of-enum_to_str_fn.patch
 delete mode 100644 meta-oe/recipes-extended/pmdk/pmdk/0001-use-daxctl-libdaxctl.h-instead-of-ndctl-libdaxctl.h.patch
 rename meta-oe/recipes-extended/pmdk/{pmdk_1.11.1.bb => pmdk_1.12.1.bb} (87%)

diff --git a/meta-oe/recipes-extended/pmdk/pmdk/0001-pmempool-Match-function-prototypes-of-enum_to_str_fn.patch b/meta-oe/recipes-extended/pmdk/pmdk/0001-pmempool-Match-function-prototypes-of-enum_to_str_fn.patch
new file mode 100644
index 0000000000..b16b633a3b
--- /dev/null
+++ b/meta-oe/recipes-extended/pmdk/pmdk/0001-pmempool-Match-function-prototypes-of-enum_to_str_fn.patch
@@ -0,0 +1,43 @@
+From de6425acaa50426883e85a599001ae5e927aec5b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 2 Mar 2023 16:23:56 -0800
+Subject: [PATCH] pmempool: Match function prototypes of enum_to_str_fn
+ function pointer
+
+This is flagged by clang 16+
+common.c:844:4: error: cast from 'const char *(*)(enum chunk_type)' to 'enum_to_str_fn' (aka 'const char *(*)(int)') converts to incompatible function type [-Werror,-Wcast-function-type-strict]
+                        (enum_to_str_fn)out_get_chunk_type_str);
+                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+1 error generated.
+
+Upstream-Status: Submitted [https://github.com/pmem/pmdk/pull/5543]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/tools/pmempool/common.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/tools/pmempool/common.c b/src/tools/pmempool/common.c
+index 5e7e472cc..4b7e9b95f 100644
+--- a/src/tools/pmempool/common.c
++++ b/src/tools/pmempool/common.c
+@@ -41,7 +41,7 @@
+ 
+ #define REQ_BUFF_SIZE	2048U
+ #define Q_BUFF_SIZE	8192
+-typedef const char *(*enum_to_str_fn)(int);
++typedef const char *(*enum_to_str_fn)(enum chunk_type);
+ 
+ /*
+  * pmem_pool_type -- return pool type based on first two pages.
+@@ -790,7 +790,7 @@ util_parse_enum(const char *str, int first, int max, uint64_t *bitmap,
+ 		enum_to_str_fn enum_to_str)
+ {
+ 	for (int i = first; i < max; i++) {
+-		if (strcmp(str, enum_to_str(i)) == 0) {
++		if (strcmp(str, enum_to_str((enum chunk_type)i)) == 0) {
+ 			*bitmap |= (uint64_t)1<<i;
+ 			return 0;
+ 		}
+-- 
+2.39.2
+
diff --git a/meta-oe/recipes-extended/pmdk/pmdk/0001-use-daxctl-libdaxctl.h-instead-of-ndctl-libdaxctl.h.patch b/meta-oe/recipes-extended/pmdk/pmdk/0001-use-daxctl-libdaxctl.h-instead-of-ndctl-libdaxctl.h.patch
deleted file mode 100644
index 0b03ffdea5..0000000000
--- a/meta-oe/recipes-extended/pmdk/pmdk/0001-use-daxctl-libdaxctl.h-instead-of-ndctl-libdaxctl.h.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 932252c0ba54a51c8bcf58b747656e29cdebfa6a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 26 Mar 2022 13:06:50 -0700
-Subject: [PATCH] use daxctl/libdaxctl.h instead of ndctl/libdaxctl.h
-
-Upstream-Status: Submitted [https://github.com/pmem/pmdk/pull/5413]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/libpmem2/badblocks_ndctl.c        | 2 +-
- src/libpmem2/region_namespace_ndctl.c | 2 +-
- src/libpmem2/usc_ndctl.c              | 2 +-
- src/tools/daxio/daxio.c               | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/libpmem2/badblocks_ndctl.c b/src/libpmem2/badblocks_ndctl.c
-index 9a5910bba..cc637f7f4 100644
---- a/src/libpmem2/badblocks_ndctl.c
-+++ b/src/libpmem2/badblocks_ndctl.c
-@@ -16,7 +16,7 @@
- #include <sys/sysmacros.h>
- #include <fcntl.h>
- #include <ndctl/libndctl.h>
--#include <ndctl/libdaxctl.h>
-+#include <daxctl/libdaxctl.h>
- 
- #include "libpmem2.h"
- #include "pmem2_utils.h"
-diff --git a/src/libpmem2/region_namespace_ndctl.c b/src/libpmem2/region_namespace_ndctl.c
-index 1383796a9..e31185984 100644
---- a/src/libpmem2/region_namespace_ndctl.c
-+++ b/src/libpmem2/region_namespace_ndctl.c
-@@ -6,7 +6,7 @@
-  */
- 
- #include <ndctl/libndctl.h>
--#include <ndctl/libdaxctl.h>
-+#include <daxctl/libdaxctl.h>
- #include <sys/sysmacros.h>
- #include <fcntl.h>
- 
-diff --git a/src/libpmem2/usc_ndctl.c b/src/libpmem2/usc_ndctl.c
-index be63e879b..c58032a83 100644
---- a/src/libpmem2/usc_ndctl.c
-+++ b/src/libpmem2/usc_ndctl.c
-@@ -5,7 +5,7 @@
-  * usc_ndctl.c -- pmem2 usc function for platforms using ndctl
-  */
- #include <ndctl/libndctl.h>
--#include <ndctl/libdaxctl.h>
-+#include <daxctl/libdaxctl.h>
- #include <sys/types.h>
- #include <sys/sysmacros.h>
- #include <fcntl.h>
-diff --git a/src/tools/daxio/daxio.c b/src/tools/daxio/daxio.c
-index 66cd0b7ae..7f2c89d48 100644
---- a/src/tools/daxio/daxio.c
-+++ b/src/tools/daxio/daxio.c
-@@ -21,7 +21,7 @@
- #include <string.h>
- 
- #include <ndctl/libndctl.h>
--#include <ndctl/libdaxctl.h>
-+#include <daxctl/libdaxctl.h>
- #include <libpmem.h>
- 
- #include "util.h"
--- 
-2.35.1
-
diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.11.1.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.12.1.bb
similarity index 87%
rename from meta-oe/recipes-extended/pmdk/pmdk_1.11.1.bb
rename to meta-oe/recipes-extended/pmdk/pmdk_1.12.1.bb
index 33d04099c9..ccbb88ff67 100644
--- a/meta-oe/recipes-extended/pmdk/pmdk_1.11.1.bb
+++ b/meta-oe/recipes-extended/pmdk/pmdk_1.12.1.bb
@@ -11,9 +11,9 @@ DEPENDS:append:libc-musl = " fts"
 
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://github.com/pmem/pmdk.git;branch=stable-1.11;protocol=https \
-           file://0001-use-daxctl-libdaxctl.h-instead-of-ndctl-libdaxctl.h.patch"
-SRCREV = "5b21904a257eff47f2e87fcbf2de46111f03ddd8"
+SRC_URI = "git://github.com/pmem/pmdk.git;branch=stable-1.12;protocol=https \
+           file://0001-pmempool-Match-function-prototypes-of-enum_to_str_fn.patch"
+SRCREV = "786098a024c6fe60e746f2cb1041bcfcd21386c9"
 
 inherit autotools-brokensep pkgconfig
 
-- 
2.39.2


