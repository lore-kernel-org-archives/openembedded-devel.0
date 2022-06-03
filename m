Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8F1CCA481
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 19:19:45 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.2397.1654283971622849270
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hppgMlk/;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id gd1so8047066pjb.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jun 2022 12:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SpGlpp8MWxSTcEPwvgNOi3DniWNRMascJOCe1isLu1E=;
        b=hppgMlk/q37c5FCTk4/azi6cOiLG+VxidJueIgiXlCrXSs4SLlIz2pgvzVMxEC3QhW
         kioqE32U1gNOgtH/cVxJK0AVezAgEAXnd3L099ez8umjWwBi7G117HQEAICj6sLxH1dc
         VouXeHcr2djMrB6lD81aQIKjRIs2aU9cKTuCFhdWQHu5ppj4E681kklqdKYIcB7gVVuf
         HczaWFx8MYnSrxgnoORTrT61fSr9R9g6GQKdug30Cta3KOlUUrm+1cKoF2jR6DM2iycd
         hBgBrSIL8ZREDtRf/GhQ22jxowaTnpi68ngj3Nj9KOXiCFQaTf0HfWGFbZmb0ixfEY0m
         VReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SpGlpp8MWxSTcEPwvgNOi3DniWNRMascJOCe1isLu1E=;
        b=3+LVMg/t+ojCm3vwOb3zhKX0fn96ECHz4VA4Nnc3Izt0hX9lg/bTirc3e7erz70adP
         RVOOhuZGRI/Iis2f2VYHD6Sj06kY3I622Aoso3B1CFeozzmQA+8VyTx23+EVRQ5wh8qd
         m7NIjcR1pPVULBnxNeo5xad8HQUTxMthd4G/ffo7hloHmg+QxvNiZ0o38S9bFzdvSmNl
         VOzGQ3xEiVpQHiiD5QqM++fB2bRhQ0dfzKFHvwDTL7ssXoul8yHS9S3R5UTNq1EcgtkA
         BAnX/ZibhVzEGz2sTkaS0G069vNskdIGG6/xDK3d7hLd/WwLbJ9XdDtUBJVHKaSMlSDw
         /S7g==
X-Gm-Message-State: AOAM531mhySqqO6P0Ho/2pU0pv5549Vnd+6Cgs6Euw/s+FAdvjNbLV8n
	EXI0VEdnrLWVqCzynv5sgKHD1/GIlDo=
X-Google-Smtp-Source: 
 ABdhPJyohTuOLhbrX1Rfr98cqhl2NPMxwP1VqQZUlTJLnBKMG5KfxiL2CvEYwmp2qfmNJUiDM7hASw==
X-Received: by 2002:a17:90b:224e:b0:1e6:8ae1:8e1a with SMTP id
 hk14-20020a17090b224e00b001e68ae18e1amr9886935pjb.59.1654283975817;
        Fri, 03 Jun 2022 12:19:35 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a170902c70200b001617541c94fsm5770620plp.60.2022.06.03.12.19.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 12:19:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 09/20] mariadb: update to 10.7.4
Date: Fri,  3 Jun 2022 12:17:08 -0700
Message-Id: 
 <367e8927b9df348edfb9a761895c36f9c6454fba.1654282423.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654282423.git.akuster808@gmail.com>
References: <cover.1654282423.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jun 2022 19:19:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97398

LTS version, bugfix only update.

Drop clang-64bit-atomics.patch as the patched code was removed in this update.
https://github.com/MariaDB/server/commit/cf483a7766d0730872232fdedd727d30a493fe29

Includes these CVES:
CVE-2022-27458
CVE-2022-27457
CVE-2022-27456
CVE-2022-27455
CVE-2022-27452
CVE-2022-27451
CVE-2022-27449
CVE-2022-27448
CVE-2022-27447
CVE-2022-27446
CVE-2022-27445
CVE-2022-27444
CVE-2022-27387
CVE-2022-27386
CVE-2022-27384
CVE-2022-27383
CVE-2022-27382
CVE-2022-27381
CVE-2022-27380
CVE-2022-27379
CVE-2022-27378
CVE-2022-27377
CVE-2022-27376

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c1720935bd80fa6023f2fcec7c252c0fea183029)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ive_10.7.3.bb => mariadb-native_10.7.4.bb} |   0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |   3 +-
 .../mysql/mariadb/clang-64bit-atomics.patch   | 178 ------------------
 .../{mariadb_10.7.3.bb => mariadb_10.7.4.bb}  |   0
 4 files changed, 1 insertion(+), 180 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.7.3.bb => mariadb-native_10.7.4.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/clang-64bit-atomics.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.7.3.bb => mariadb_10.7.4.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.7.3.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.7.4.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.7.3.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.7.4.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 855f124834..3f246dc0a5 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -20,11 +20,10 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://mm_malloc.patch \
            file://sys_futex.patch \
            file://mariadb-openssl3.patch \
-           file://clang-64bit-atomics.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
 
-SRC_URI[sha256sum] = "da286919ffc9c913282202349709b6ba4ebcd342815e8dae0aa6b6bd8f515cd4"
+SRC_URI[sha256sum] = "73dd9c9d325520f20ca5e0ef16f94b7be1146bed7e4a78e735c20daebf3a4173"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/clang-64bit-atomics.patch b/meta-oe/recipes-dbs/mysql/mariadb/clang-64bit-atomics.patch
deleted file mode 100644
index cdc2947b7b..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/clang-64bit-atomics.patch
+++ /dev/null
@@ -1,178 +0,0 @@
-Prevent Clang from emitting atomic libcalls
-
-Clang expects 8-byte alignment for some 64-bit atomic operations
-in some 32-bit targets. Native instruction lock cmpxchg8b (for x86)
-should only require 4-byte alignment.
-
-This patch tries to add 8-byte alignents to data needing atomic ops
-which helps clang to not generate the libatomic calls but emit
-builtins directly.
-
-Upstream-Status: Submitted[https://jira.mariadb.org/browse/MDEV-28162]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/include/my_atomic.h
-+++ b/include/my_atomic.h
-@@ -115,6 +115,16 @@
- #include "atomic/gcc_builtins.h"
- #endif
- 
-+#include <stdint.h>
-+
-+# ifdef __GNUC__
-+typedef __attribute__((__aligned__(8))) int64 ATOMIC_I64;
-+typedef __attribute__((__aligned__(8))) uint64 ATOMIC_U64;
-+# else
-+typedef int64 ATOMIC_I64;
-+typedef uint64 ATOMIC_U64;
-+# endif
-+
- #if SIZEOF_LONG == 4
- #define my_atomic_addlong(A,B) my_atomic_add32((int32*) (A), (B))
- #define my_atomic_loadlong(A) my_atomic_load32((int32*) (A))
-@@ -123,12 +133,12 @@
- #define my_atomic_faslong(A,B) my_atomic_fas32((int32*) (A), (B))
- #define my_atomic_caslong(A,B,C) my_atomic_cas32((int32*) (A), (int32*) (B), (C))
- #else
--#define my_atomic_addlong(A,B) my_atomic_add64((int64*) (A), (B))
--#define my_atomic_loadlong(A) my_atomic_load64((int64*) (A))
--#define my_atomic_loadlong_explicit(A,O) my_atomic_load64_explicit((int64*) (A), (O))
--#define my_atomic_storelong(A,B) my_atomic_store64((int64*) (A), (B))
--#define my_atomic_faslong(A,B) my_atomic_fas64((int64*) (A), (B))
--#define my_atomic_caslong(A,B,C) my_atomic_cas64((int64*) (A), (int64*) (B), (C))
-+#define my_atomic_addlong(A,B) my_atomic_add64((ATOMIC_I64*) (A), (B))
-+#define my_atomic_loadlong(A) my_atomic_load64((ATOMIC_I64*) (A))
-+#define my_atomic_loadlong_explicit(A,O) my_atomic_load64_explicit((ATOMIC_I64*) (A), (O))
-+#define my_atomic_storelong(A,B) my_atomic_store64((ATOMIC_I64*) (A), (B))
-+#define my_atomic_faslong(A,B) my_atomic_fas64((ATOMIC_I64*) (A), (B))
-+#define my_atomic_caslong(A,B,C) my_atomic_cas64((ATOMIC_I64*) (A), (ATOMIC_I64*) (B), (C))
- #endif
- 
- #ifndef MY_MEMORY_ORDER_SEQ_CST
---- a/storage/perfschema/pfs_atomic.h
-+++ b/storage/perfschema/pfs_atomic.h
-@@ -41,7 +41,7 @@ public:
-   }
- 
-   /** Atomic load. */
--  static inline int64 load_64(int64 *ptr)
-+  static inline int64 load_64(ATOMIC_I64 *ptr)
-   {
-     return my_atomic_load64(ptr);
-   }
-@@ -53,9 +53,9 @@ public:
-   }
- 
-   /** Atomic load. */
--  static inline uint64 load_u64(uint64 *ptr)
-+  static inline uint64 load_u64(ATOMIC_U64 *ptr)
-   {
--    return (uint64) my_atomic_load64((int64*) ptr);
-+    return (uint64) my_atomic_load64((ATOMIC_I64*) ptr);
-   }
- 
-   /** Atomic store. */
-@@ -65,7 +65,7 @@ public:
-   }
- 
-   /** Atomic store. */
--  static inline void store_64(int64 *ptr, int64 value)
-+  static inline void store_64(ATOMIC_I64 *ptr, int64 value)
-   {
-     my_atomic_store64(ptr, value);
-   }
-@@ -77,9 +77,9 @@ public:
-   }
- 
-   /** Atomic store. */
--  static inline void store_u64(uint64 *ptr, uint64 value)
-+  static inline void store_u64(ATOMIC_U64 *ptr, uint64 value)
-   {
--    my_atomic_store64((int64*) ptr, (int64) value);
-+    my_atomic_store64((ATOMIC_I64*) ptr, (int64) value);
-   }
- 
-   /** Atomic add. */
-@@ -89,7 +89,7 @@ public:
-   }
- 
-   /** Atomic add. */
--  static inline int64 add_64(int64 *ptr, int64 value)
-+  static inline int64 add_64(ATOMIC_I64 *ptr, int64 value)
-   {
-     return my_atomic_add64(ptr, value);
-   }
-@@ -101,9 +101,9 @@ public:
-   }
- 
-   /** Atomic add. */
--  static inline uint64 add_u64(uint64 *ptr, uint64 value)
-+  static inline uint64 add_u64(ATOMIC_U64 *ptr, uint64 value)
-   {
--    return (uint64) my_atomic_add64((int64*) ptr, (int64) value);
-+    return (uint64) my_atomic_add64((ATOMIC_I64*) ptr, (int64) value);
-   }
- 
-   /** Atomic compare and swap. */
-@@ -114,7 +114,7 @@ public:
-   }
- 
-   /** Atomic compare and swap. */
--  static inline bool cas_64(int64 *ptr, int64 *old_value,
-+  static inline bool cas_64(ATOMIC_I64 *ptr, ATOMIC_I64 *old_value,
-                             int64 new_value)
-   {
-     return my_atomic_cas64(ptr, old_value, new_value);
-@@ -129,10 +129,10 @@ public:
-   }
- 
-   /** Atomic compare and swap. */
--  static inline bool cas_u64(uint64 *ptr, uint64 *old_value,
-+  static inline bool cas_u64(ATOMIC_U64 *ptr, ATOMIC_U64 *old_value,
-                              uint64 new_value)
-   {
--    return my_atomic_cas64((int64*) ptr, (int64*) old_value,
-+    return my_atomic_cas64((ATOMIC_I64*) ptr, (ATOMIC_I64*) old_value,
-                             (uint64) new_value);
-   }
- };
---- a/sql/sql_class.h
-+++ b/sql/sql_class.h
-@@ -1049,7 +1049,7 @@ static inline void update_global_memory_
-                       (longlong) global_status_var.global_memory_used,
-                       size));
-   // workaround for gcc 4.2.4-1ubuntu4 -fPIE (from DEB_BUILD_HARDENING=1)
--  int64 volatile * volatile ptr= &global_status_var.global_memory_used;
-+  ATOMIC_I64 volatile * volatile ptr= &global_status_var.global_memory_used;
-   my_atomic_add64_explicit(ptr, size, MY_MEMORY_ORDER_RELAXED);
- }
- 
---- a/storage/innobase/include/srv0mon.h
-+++ b/storage/innobase/include/srv0mon.h
-@@ -49,7 +49,7 @@ enum monitor_running_status {
- typedef enum monitor_running_status	monitor_running_t;
- 
- /** Monitor counter value type */
--typedef	int64_t				mon_type_t;
-+typedef	ATOMIC_I64			mon_type_t;
- 
- /** Two monitor structures are defined in this file. One is
- "monitor_value_t" which contains dynamic counter values for each
-@@ -568,7 +568,7 @@ Use MONITOR_INC if appropriate mutex pro
- 	if (enabled) {							\
- 		ib_uint64_t	value;					\
- 		value  = my_atomic_add64_explicit(			\
--			(int64*) &MONITOR_VALUE(monitor), 1,		\
-+			(ATOMIC_I64*) &MONITOR_VALUE(monitor), 1,	\
- 			MY_MEMORY_ORDER_RELAXED) + 1;			\
- 		/* Note: This is not 100% accurate because of the	\
- 		inherent race, we ignore it due to performance. */	\
-@@ -585,7 +585,7 @@ Use MONITOR_DEC if appropriate mutex pro
- 	if (enabled) {							\
- 		ib_uint64_t	value;					\
- 		value = my_atomic_add64_explicit(			\
--			(int64*) &MONITOR_VALUE(monitor), -1,		\
-+			(ATOMIC_I64*) &MONITOR_VALUE(monitor), -1,	\
- 			MY_MEMORY_ORDER_RELAXED) - 1;			\
- 		/* Note: This is not 100% accurate because of the	\
- 		inherent race, we ignore it due to performance. */	\
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb
-- 
2.25.1


