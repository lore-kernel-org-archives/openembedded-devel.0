Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA245C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 05:33:20 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.7358.1648099999917184282
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 22:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AmUNiemP;
 spf=pass (domain: gmail.com, ip: 209.85.215.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id c2so2969453pga.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 22:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=arM2xO6m1xfbjYcSfe1xzFJLdgFDGQCQJXMfEDM02UQ=;
        b=AmUNiemPgpUAxLobFgeV6R0IMlhBn5eSgisKTx2qvbztHpwEk0q3YVxmGoo2UuJwoI
         /cI6CBAEkfhRSSy6IaEsutyqlovz+RvBS0QHWGv7b63XdLwihjoi+rSUmMqhGplRZDzM
         UMRLb1089H6G2dTUS7R5ofVxqx7231/miBrWVwUbHKLGk+4g+y50D68NtlQAtSJvY5nx
         WPOYNAUS38wT9IekTUM7VRG3Fr6bmC+Twn+/J0sRXUIW96h0wv1HoLcaeGMl2dPYdfVA
         LcB4VwsgzjBekrT26pDEpadt9sx3PNNkHU2NchjEsjXvUCUGc4qQkZROgufBgBnCG5iY
         HU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=arM2xO6m1xfbjYcSfe1xzFJLdgFDGQCQJXMfEDM02UQ=;
        b=CAb4d3Db4r1vL0QJFEPV8CCTJ264jtcIvATV503QeapEcOyW9nGQdM8I9tXfGQqkOb
         zajk7FwYTc6uQqB9AhvxB0KiktMtxKVr3LG2twuDK/6NHq75otsUHWf+lvk9NQV6a9s9
         Zec0f1mv6nvBQxoPNekJZt06KPihyG3SvCz0t59UTTy5b0xxZ8MxwMdvmoAewk+VxeBm
         +bLTMTf/QG4PFX/Oy9wGGgHc3vpjZFGiv+kRKZA4mHRrNZ09nhkf9iHqYGVBzw/kTzk0
         cbLus3Wa7M1rXrFVEz/eB6e7PWDhU+g2CkMNqyl2CLd2esbZAsMqn3cNmJvbdSt0O+YO
         90MQ==
X-Gm-Message-State: AOAM533W9LnEezrnc0f6mDGA649n8IrMkOTyWD7PgBsKz0RaPDpTBaCS
	tvfVWfjCTSZwpJ9YrN08HmQxDdl2QZebDQ==
X-Google-Smtp-Source: 
 ABdhPJzBQyBwecscz/eW6qslOS93XK2mKrC1BfPz8yqIqfLqDFVAg+5O8CI5dWtmx+p4eyG/baC3eg==
X-Received: by 2002:a63:3f8f:0:b0:386:3116:a1f3 with SMTP id
 m137-20020a633f8f000000b003863116a1f3mr2634762pga.136.1648099999052;
        Wed, 23 Mar 2022 22:33:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 my18-20020a17090b4c9200b001c75aeac7fdsm7637232pjb.27.2022.03.23.22.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 22:33:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Mingli Yu <mingli.yu@windriver.com>
Subject: [PATCH v2] mariadb: Align atomic ops to help clang on x86
Date: Wed, 23 Mar 2022 22:33:16 -0700
Message-Id: <20220324053316.3322188-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Mar 2022 05:33:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96180

clang complains about alignments on 64bit atomics and falls back to
using these functions from libatomic. And the configure part does not
detect this condition and thinks that system can support 64bit atomics
just fine.

clang needs this patch to fix

| pfs_instr.cc:(.text+0x10a5): undefined reference to `__atomic_fetch_add_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Mingli Yu <mingli.yu@windriver.com>
---
v2: Use int64/uint64 instead of int64_t/uint64_t

 meta-oe/recipes-dbs/mysql/mariadb.inc         |   2 +
 .../mysql/mariadb/clang-64bit-atomics.patch   | 178 ++++++++++++++++++
 2 files changed, 180 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/clang-64bit-atomics.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 02ca5f96f2..855f124834 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -20,6 +20,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://mm_malloc.patch \
            file://sys_futex.patch \
            file://mariadb-openssl3.patch \
+           file://clang-64bit-atomics.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
 
@@ -73,6 +74,7 @@ PACKAGECONFIG[openssl] = "-DWITH_SSL='system',-DWITH_SSL='bundled',openssl"
 # https://mariadb.atlassian.net/browse/MDEV-5982
 TARGET_CFLAGS += "-fuse-ld=bfd"
 LDFLAGS += " -pthread"
+
 BUILD_CFLAGS += "-fuse-ld=bfd"
 BUILD_CXXFLAGS += "-fuse-ld=bfd"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/clang-64bit-atomics.patch b/meta-oe/recipes-dbs/mysql/mariadb/clang-64bit-atomics.patch
new file mode 100644
index 0000000000..cdc2947b7b
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/clang-64bit-atomics.patch
@@ -0,0 +1,178 @@
+Prevent Clang from emitting atomic libcalls
+
+Clang expects 8-byte alignment for some 64-bit atomic operations
+in some 32-bit targets. Native instruction lock cmpxchg8b (for x86)
+should only require 4-byte alignment.
+
+This patch tries to add 8-byte alignents to data needing atomic ops
+which helps clang to not generate the libatomic calls but emit
+builtins directly.
+
+Upstream-Status: Submitted[https://jira.mariadb.org/browse/MDEV-28162]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/include/my_atomic.h
++++ b/include/my_atomic.h
+@@ -115,6 +115,16 @@
+ #include "atomic/gcc_builtins.h"
+ #endif
+ 
++#include <stdint.h>
++
++# ifdef __GNUC__
++typedef __attribute__((__aligned__(8))) int64 ATOMIC_I64;
++typedef __attribute__((__aligned__(8))) uint64 ATOMIC_U64;
++# else
++typedef int64 ATOMIC_I64;
++typedef uint64 ATOMIC_U64;
++# endif
++
+ #if SIZEOF_LONG == 4
+ #define my_atomic_addlong(A,B) my_atomic_add32((int32*) (A), (B))
+ #define my_atomic_loadlong(A) my_atomic_load32((int32*) (A))
+@@ -123,12 +133,12 @@
+ #define my_atomic_faslong(A,B) my_atomic_fas32((int32*) (A), (B))
+ #define my_atomic_caslong(A,B,C) my_atomic_cas32((int32*) (A), (int32*) (B), (C))
+ #else
+-#define my_atomic_addlong(A,B) my_atomic_add64((int64*) (A), (B))
+-#define my_atomic_loadlong(A) my_atomic_load64((int64*) (A))
+-#define my_atomic_loadlong_explicit(A,O) my_atomic_load64_explicit((int64*) (A), (O))
+-#define my_atomic_storelong(A,B) my_atomic_store64((int64*) (A), (B))
+-#define my_atomic_faslong(A,B) my_atomic_fas64((int64*) (A), (B))
+-#define my_atomic_caslong(A,B,C) my_atomic_cas64((int64*) (A), (int64*) (B), (C))
++#define my_atomic_addlong(A,B) my_atomic_add64((ATOMIC_I64*) (A), (B))
++#define my_atomic_loadlong(A) my_atomic_load64((ATOMIC_I64*) (A))
++#define my_atomic_loadlong_explicit(A,O) my_atomic_load64_explicit((ATOMIC_I64*) (A), (O))
++#define my_atomic_storelong(A,B) my_atomic_store64((ATOMIC_I64*) (A), (B))
++#define my_atomic_faslong(A,B) my_atomic_fas64((ATOMIC_I64*) (A), (B))
++#define my_atomic_caslong(A,B,C) my_atomic_cas64((ATOMIC_I64*) (A), (ATOMIC_I64*) (B), (C))
+ #endif
+ 
+ #ifndef MY_MEMORY_ORDER_SEQ_CST
+--- a/storage/perfschema/pfs_atomic.h
++++ b/storage/perfschema/pfs_atomic.h
+@@ -41,7 +41,7 @@ public:
+   }
+ 
+   /** Atomic load. */
+-  static inline int64 load_64(int64 *ptr)
++  static inline int64 load_64(ATOMIC_I64 *ptr)
+   {
+     return my_atomic_load64(ptr);
+   }
+@@ -53,9 +53,9 @@ public:
+   }
+ 
+   /** Atomic load. */
+-  static inline uint64 load_u64(uint64 *ptr)
++  static inline uint64 load_u64(ATOMIC_U64 *ptr)
+   {
+-    return (uint64) my_atomic_load64((int64*) ptr);
++    return (uint64) my_atomic_load64((ATOMIC_I64*) ptr);
+   }
+ 
+   /** Atomic store. */
+@@ -65,7 +65,7 @@ public:
+   }
+ 
+   /** Atomic store. */
+-  static inline void store_64(int64 *ptr, int64 value)
++  static inline void store_64(ATOMIC_I64 *ptr, int64 value)
+   {
+     my_atomic_store64(ptr, value);
+   }
+@@ -77,9 +77,9 @@ public:
+   }
+ 
+   /** Atomic store. */
+-  static inline void store_u64(uint64 *ptr, uint64 value)
++  static inline void store_u64(ATOMIC_U64 *ptr, uint64 value)
+   {
+-    my_atomic_store64((int64*) ptr, (int64) value);
++    my_atomic_store64((ATOMIC_I64*) ptr, (int64) value);
+   }
+ 
+   /** Atomic add. */
+@@ -89,7 +89,7 @@ public:
+   }
+ 
+   /** Atomic add. */
+-  static inline int64 add_64(int64 *ptr, int64 value)
++  static inline int64 add_64(ATOMIC_I64 *ptr, int64 value)
+   {
+     return my_atomic_add64(ptr, value);
+   }
+@@ -101,9 +101,9 @@ public:
+   }
+ 
+   /** Atomic add. */
+-  static inline uint64 add_u64(uint64 *ptr, uint64 value)
++  static inline uint64 add_u64(ATOMIC_U64 *ptr, uint64 value)
+   {
+-    return (uint64) my_atomic_add64((int64*) ptr, (int64) value);
++    return (uint64) my_atomic_add64((ATOMIC_I64*) ptr, (int64) value);
+   }
+ 
+   /** Atomic compare and swap. */
+@@ -114,7 +114,7 @@ public:
+   }
+ 
+   /** Atomic compare and swap. */
+-  static inline bool cas_64(int64 *ptr, int64 *old_value,
++  static inline bool cas_64(ATOMIC_I64 *ptr, ATOMIC_I64 *old_value,
+                             int64 new_value)
+   {
+     return my_atomic_cas64(ptr, old_value, new_value);
+@@ -129,10 +129,10 @@ public:
+   }
+ 
+   /** Atomic compare and swap. */
+-  static inline bool cas_u64(uint64 *ptr, uint64 *old_value,
++  static inline bool cas_u64(ATOMIC_U64 *ptr, ATOMIC_U64 *old_value,
+                              uint64 new_value)
+   {
+-    return my_atomic_cas64((int64*) ptr, (int64*) old_value,
++    return my_atomic_cas64((ATOMIC_I64*) ptr, (ATOMIC_I64*) old_value,
+                             (uint64) new_value);
+   }
+ };
+--- a/sql/sql_class.h
++++ b/sql/sql_class.h
+@@ -1049,7 +1049,7 @@ static inline void update_global_memory_
+                       (longlong) global_status_var.global_memory_used,
+                       size));
+   // workaround for gcc 4.2.4-1ubuntu4 -fPIE (from DEB_BUILD_HARDENING=1)
+-  int64 volatile * volatile ptr= &global_status_var.global_memory_used;
++  ATOMIC_I64 volatile * volatile ptr= &global_status_var.global_memory_used;
+   my_atomic_add64_explicit(ptr, size, MY_MEMORY_ORDER_RELAXED);
+ }
+ 
+--- a/storage/innobase/include/srv0mon.h
++++ b/storage/innobase/include/srv0mon.h
+@@ -49,7 +49,7 @@ enum monitor_running_status {
+ typedef enum monitor_running_status	monitor_running_t;
+ 
+ /** Monitor counter value type */
+-typedef	int64_t				mon_type_t;
++typedef	ATOMIC_I64			mon_type_t;
+ 
+ /** Two monitor structures are defined in this file. One is
+ "monitor_value_t" which contains dynamic counter values for each
+@@ -568,7 +568,7 @@ Use MONITOR_INC if appropriate mutex pro
+ 	if (enabled) {							\
+ 		ib_uint64_t	value;					\
+ 		value  = my_atomic_add64_explicit(			\
+-			(int64*) &MONITOR_VALUE(monitor), 1,		\
++			(ATOMIC_I64*) &MONITOR_VALUE(monitor), 1,	\
+ 			MY_MEMORY_ORDER_RELAXED) + 1;			\
+ 		/* Note: This is not 100% accurate because of the	\
+ 		inherent race, we ignore it due to performance. */	\
+@@ -585,7 +585,7 @@ Use MONITOR_DEC if appropriate mutex pro
+ 	if (enabled) {							\
+ 		ib_uint64_t	value;					\
+ 		value = my_atomic_add64_explicit(			\
+-			(int64*) &MONITOR_VALUE(monitor), -1,		\
++			(ATOMIC_I64*) &MONITOR_VALUE(monitor), -1,	\
+ 			MY_MEMORY_ORDER_RELAXED) - 1;			\
+ 		/* Note: This is not 100% accurate because of the	\
+ 		inherent race, we ignore it due to performance. */	\
-- 
2.35.1


