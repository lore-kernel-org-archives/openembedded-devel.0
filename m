Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4478AC433EF
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 19:32:35 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.24314.1653593547582594800
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 12:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UyBLWPJ+;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id c65so1924926pfb.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 12:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=leq1xGkRe/j82V6zBEU3W8tDUSaAVPV9y+rO74AuGo8=;
        b=UyBLWPJ+7/5L7nkzlPFPm6v+gFlcWxB5l0LV7Uww2GpA9gsbnUTS/ZXxzwkW4vZOZb
         XqTm9IBpAGmRHVw3tcrpYzdcW/eHGX70EsJACkAFf2khucbZlRpSN5FFqnt6egNdaeDY
         iNCVEzhjIqbSMEkd5nldYSFypL6+yt8kq3AvXROUeUkuwcXSbxOsfUByUbZCeEM0B9Ol
         pdE1V08etHL0QaCSPHnlRZVevK2EIGlF7DBoRekyVqIk6ZeidPT9mCGvGO2YkTJy07oL
         ITccjI8IWSJABVTeaxracfjf6OUwR55YmZKA7f1Y6not+mi7Vr2Bv098VS3m5IAnQ7tQ
         xbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=leq1xGkRe/j82V6zBEU3W8tDUSaAVPV9y+rO74AuGo8=;
        b=nFRQi0uR+Ku5X+Lbcz/+pDt0p2cC/+UTZFENQseZlXD+Hqb8wsnH5EYp8QRV4sQCpE
         Jo07h2H0fzjf5WNDSI575/Y9yrca8sdSOUzbBRVoEgzWVlnxaphDtBTQKmmKIx5E7apU
         y/SLirHojhFB6Ptadw8uQPkEUKWUWJmC8xax614yJccThJ4nVDb77KJtNwarZQekmEwL
         5oQY9qkgvxNihdRvL/xuCZ1INhGojHUrjx8yt0D//3UIl6dpP6SxJiu7loejOyY4R/uY
         8+6jOiZSzs75ebQXyrrLuVp+Vkqx1+7gpdvPHss90Os8YZoFGjKJC7keb/vNWcs39/4R
         AZsQ==
X-Gm-Message-State: AOAM5331/ildRbDZOGiUgY+/FEWxsMB4L2se9Palos+YfDfSH0yN71T4
	zRqdg3/mWTGCRVSI694ynjgt2nx3KPdP0A==
X-Google-Smtp-Source: 
 ABdhPJziE2zLdo7VX8q6OzXvA13Bk/mkzG+W2Eb5ufw8gs+vVU/kcLdHrOzkXoBLzqjXU2rlU93sLw==
X-Received: by 2002:aa7:888c:0:b0:505:7832:98fc with SMTP id
 z12-20020aa7888c000000b00505783298fcmr39818216pfe.0.1653593546390;
        Thu, 26 May 2022 12:32:26 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:c5c:7325:b02a:1f3c])
        by smtp.gmail.com with ESMTPSA id
 n8-20020a638f08000000b003f27f91135asm1915336pgd.76.2022.05.26.12.32.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 12:32:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][master][kirkstone][PATCH] mariadb: update to 10.7.4
Date: Thu, 26 May 2022 12:32:24 -0700
Message-Id: <20220526193224.1739376-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 May 2022 19:32:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97280

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


