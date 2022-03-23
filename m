Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E09C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 23:20:52 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.4392.1648077651773172865
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 16:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PH5so5N1;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id b8so3167386pjb.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 16:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y3xPs6NFhuUDvPXWZE3jzhPTYYR36zVGAWn9EQoyfgs=;
        b=PH5so5N1Ekl4pvAF2vi2QowzKkjcY7Y+iZwKqNL+YlU9bfkEIZ/4P0YATtHhGIPQL/
         Z/1hJjjbRcicEsuDoYJoWPbwQuBPUfWXEFfLfsSMWJVmW2xhJSlhPaS7ka8kx/98c0Lr
         wZTE8bvANV78DLgyHtIhu0LOsl8aq5NPBlCrnJjo4FUPNzpY94k2OiyXdLxMmkuTGuDi
         59pguVJguYaGyCQ8tL6vU8PUVYwuqoiK/AUyKPBUjH/T+c4bleTGnX3TvhfyW7dWJUlz
         Zj7llSzg7pNxk1h9ElJ0uxX+iH7LSGFTLt0GvSr1P3XjTQDSUjCZSlNE6OLl8oFc2t7G
         yS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y3xPs6NFhuUDvPXWZE3jzhPTYYR36zVGAWn9EQoyfgs=;
        b=ENR+4SYpPdUSFrkRaNBJcmwbecB/0v9NEbBkunBiUluBEB7wjE1NPnUcyRXoAEuHBX
         yiaxW1rvLQmShWiFRzbJl9kKTk2o7vswdEHbgbm2vEosfyIeyr+1r+d2A7NVZKLV9/RY
         Ynp5HqvNmEUF+/Z2rGOaN5cBrOdCg7ff5oaBUoWxwx94e5fY80iNASD9dCopvoXaIlVw
         rv8eHAw3Inj77Nc5zLcxiPUoEflBwplFjS9lBe11EpI1TR4s8IRzvHk/gfkzT/IgMjwz
         xglTqX+vGSvmBxpRlsN0hvaY4fmtTgq4Q14S5eXK8wmtZGDCSW81iER8dRwJdzW/luJt
         NitA==
X-Gm-Message-State: AOAM532fkk12mBiSsVGdvyqCp8Gio5WfAeEN9mGqczIFT84JCQlF82Rt
	CV/xD3LBvRF3H+u1tPwJ1DXz8kskdPBp+w==
X-Google-Smtp-Source: 
 ABdhPJxpD0S7hR6KDk6BP72xDsmtxpspr+faqDTE62wYK6JidWBVYMe19MLx4Fz/4Eo5XxPA/KV+uQ==
X-Received: by 2002:a17:902:c948:b0:154:1e4f:9837 with SMTP id
 i8-20020a170902c94800b001541e4f9837mr2512482pla.115.1648077650846;
        Wed, 23 Mar 2022 16:20:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 m18-20020a639412000000b003820bd9f2f2sm733427pge.53.2022.03.23.16.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 16:20:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Mingli Yu <mingli.yu@windriver.com>
Subject: [PATCH] mariadb: Align atomic ops to help clang on x86
Date: Wed, 23 Mar 2022 16:20:48 -0700
Message-Id: <20220323232048.1585948-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Mar 2022 23:20:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96168

clang complains about alignments on 64bit atomics and falls back to
using these functions from libatomic. And the configure part does not
detect this condition and thinks that system can support 64bit atomics
just fine.

clang needs this patch to fix

| pfs_instr.cc:(.text+0x10a5): undefined reference to `__atomic_fetch_add_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |   4 +
 .../mysql/mariadb/clang-64bit-atomics.patch   | 178 ++++++++++++++++++
 2 files changed, 182 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/clang-64bit-atomics.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 02ca5f96f2..7139ba08a4 100644
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
 
@@ -332,3 +334,5 @@ FILES:${PN}-server = "\
 
 DESCRIPTION:${PN}-leftovers = "unpackaged and probably unneeded files for ${PN}"
 FILES:${PN}-leftovers = "/"
+
+CMAKE_VERBOSE = "VERBOSE=1"
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/clang-64bit-atomics.patch b/meta-oe/recipes-dbs/mysql/mariadb/clang-64bit-atomics.patch
new file mode 100644
index 0000000000..50ee0adf94
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
++typedef __attribute__((__aligned__(8))) int64_t ATOMIC_I64;
++typedef __attribute__((__aligned__(8))) uint64_t ATOMIC_U64;
++# else
++typedef int64_t ATOMIC_I64;
++typedef uint64_t ATOMIC_U64;
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


