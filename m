Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDEAAC433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 02:03:45 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.2943.1653617017901838492
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 19:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TCVyRqa3;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id dm17so2819060qvb.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 19:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LGdaybhO6Z0SNs3yR7KBJNTmvJcGxauJAC8KTyGyw9M=;
        b=TCVyRqa3n15RUbsrkNijI+iKbm1BPWSgUglaoyKQ7gwf4+AsmF6W9AHl0Y2dBd3t2/
         XQKwwDfSRXMEDMdNiHPxXOBYrVDNmN6GE6BjuuST6N9A5x9nvWaz81A2xR7kH94587gs
         qcxQigweQMHen6yW4I7XVP20Fs6SwYRNR1uYUqwVKii1W9e33Zjap1ynl5rV0jK63pkt
         8GkTXQLEX7BScmkc2i/lxvhMpnPuGmKbxLZY/sZVUF7JiqQ2LICx9FQtwujbnOlXC/NU
         UVw9kH75VoNKqbPiBd5uORH9S5CYoeV4n9izgZnT6VjUrAIeki5deOzftqi+UckJMfO9
         Tshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LGdaybhO6Z0SNs3yR7KBJNTmvJcGxauJAC8KTyGyw9M=;
        b=5wzAcVH6sCRYOh0F+J/AN4HLHAD1egWMJYj66dOt/QZFawE1Rf61QxNdGKNEz/cWPH
         UTxiZP1tRKD3mX84UMk/vO8aUze4ifhN0AW1NteOIutxXTNRt1aZ+3eRSbTrKdw39/t5
         U/lUAjIeXncNeUNj0M60Hpn/T2SZxErXFanLWMoui4y2VA0Basa5KpzZ7nfdTptk2Qdi
         CJrni+dOQVlSglWMBQxRM3tvJ45Ezyc+PKmOi3xV5c6JYUX7KJ3Synmfuyyu7nAYxgP4
         H3FVTlBU8E8u545iuUaPoDR9n1bsADfPFC/yxAk3m8DZVN182VyXNoUI5ia87TxASysx
         qkXw==
X-Gm-Message-State: AOAM531EaEOQbuT4JNwQrwvlcIzqwMfuZ/4yNeb73RufhfmJIYw9hHQ4
	nLBUTeXJMiOF+zrt54pCtJpqmNCZHqvFSNIFXKE=
X-Google-Smtp-Source: 
 ABdhPJzGmX80MRiTCDKJGhJveiPoCp6KYIz8eQPzOrzNj3kERWdL7SzR9D/GsOihHB32gBXZo8ylI6fk4gaY105tzG8=
X-Received: by 2002:ad4:5de6:0:b0:462:180d:7038 with SMTP id
 jn6-20020ad45de6000000b00462180d7038mr26826093qvb.16.1653617016828; Thu, 26
 May 2022 19:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220526193224.1739376-1-akuster808@gmail.com>
In-Reply-To: <20220526193224.1739376-1-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 May 2022 19:03:10 -0700
Message-ID: 
 <CAMKF1sr+CVJJH3pLqf6GpHAURp+RQhgAd799v=RPNPJZqxWGCA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][master][kirkstone][PATCH] mariadb: update to
 10.7.4
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 02:03:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97303

on x86 ( qemux86 ) This fails with

pfs_instr.cc:(.text+0x10a5): undefined reference to `__atomic_fetch_add_8'

see
https://errors.yoctoproject.org/Errors/Details/657260/

somewhere we need to link with latomic on x86

On Thu, May 26, 2022 at 12:32 PM Armin Kuster <akuster808@gmail.com> wrote:
>
> LTS version, bugfix only update.
>
> Drop clang-64bit-atomics.patch as the patched code was removed in this update.
> https://github.com/MariaDB/server/commit/cf483a7766d0730872232fdedd727d30a493fe29
>
> Includes these CVES:
> CVE-2022-27458
> CVE-2022-27457
> CVE-2022-27456
> CVE-2022-27455
> CVE-2022-27452
> CVE-2022-27451
> CVE-2022-27449
> CVE-2022-27448
> CVE-2022-27447
> CVE-2022-27446
> CVE-2022-27445
> CVE-2022-27444
> CVE-2022-27387
> CVE-2022-27386
> CVE-2022-27384
> CVE-2022-27383
> CVE-2022-27382
> CVE-2022-27381
> CVE-2022-27380
> CVE-2022-27379
> CVE-2022-27378
> CVE-2022-27377
> CVE-2022-27376
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  ...ive_10.7.3.bb => mariadb-native_10.7.4.bb} |   0
>  meta-oe/recipes-dbs/mysql/mariadb.inc         |   3 +-
>  .../mysql/mariadb/clang-64bit-atomics.patch   | 178 ------------------
>  .../{mariadb_10.7.3.bb => mariadb_10.7.4.bb}  |   0
>  4 files changed, 1 insertion(+), 180 deletions(-)
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.7.3.bb => mariadb-native_10.7.4.bb} (100%)
>  delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/clang-64bit-atomics.patch
>  rename meta-oe/recipes-dbs/mysql/{mariadb_10.7.3.bb => mariadb_10.7.4.bb} (100%)
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.7.3.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.7.4.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.7.3.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.7.4.bb
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
> index 855f124834..3f246dc0a5 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -20,11 +20,10 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>             file://mm_malloc.patch \
>             file://sys_futex.patch \
>             file://mariadb-openssl3.patch \
> -           file://clang-64bit-atomics.patch \
>            "
>  SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
>
> -SRC_URI[sha256sum] = "da286919ffc9c913282202349709b6ba4ebcd342815e8dae0aa6b6bd8f515cd4"
> +SRC_URI[sha256sum] = "73dd9c9d325520f20ca5e0ef16f94b7be1146bed7e4a78e735c20daebf3a4173"
>
>  UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/clang-64bit-atomics.patch b/meta-oe/recipes-dbs/mysql/mariadb/clang-64bit-atomics.patch
> deleted file mode 100644
> index cdc2947b7b..0000000000
> --- a/meta-oe/recipes-dbs/mysql/mariadb/clang-64bit-atomics.patch
> +++ /dev/null
> @@ -1,178 +0,0 @@
> -Prevent Clang from emitting atomic libcalls
> -
> -Clang expects 8-byte alignment for some 64-bit atomic operations
> -in some 32-bit targets. Native instruction lock cmpxchg8b (for x86)
> -should only require 4-byte alignment.
> -
> -This patch tries to add 8-byte alignents to data needing atomic ops
> -which helps clang to not generate the libatomic calls but emit
> -builtins directly.
> -
> -Upstream-Status: Submitted[https://jira.mariadb.org/browse/MDEV-28162]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ---- a/include/my_atomic.h
> -+++ b/include/my_atomic.h
> -@@ -115,6 +115,16 @@
> - #include "atomic/gcc_builtins.h"
> - #endif
> -
> -+#include <stdint.h>
> -+
> -+# ifdef __GNUC__
> -+typedef __attribute__((__aligned__(8))) int64 ATOMIC_I64;
> -+typedef __attribute__((__aligned__(8))) uint64 ATOMIC_U64;
> -+# else
> -+typedef int64 ATOMIC_I64;
> -+typedef uint64 ATOMIC_U64;
> -+# endif
> -+
> - #if SIZEOF_LONG == 4
> - #define my_atomic_addlong(A,B) my_atomic_add32((int32*) (A), (B))
> - #define my_atomic_loadlong(A) my_atomic_load32((int32*) (A))
> -@@ -123,12 +133,12 @@
> - #define my_atomic_faslong(A,B) my_atomic_fas32((int32*) (A), (B))
> - #define my_atomic_caslong(A,B,C) my_atomic_cas32((int32*) (A), (int32*) (B), (C))
> - #else
> --#define my_atomic_addlong(A,B) my_atomic_add64((int64*) (A), (B))
> --#define my_atomic_loadlong(A) my_atomic_load64((int64*) (A))
> --#define my_atomic_loadlong_explicit(A,O) my_atomic_load64_explicit((int64*) (A), (O))
> --#define my_atomic_storelong(A,B) my_atomic_store64((int64*) (A), (B))
> --#define my_atomic_faslong(A,B) my_atomic_fas64((int64*) (A), (B))
> --#define my_atomic_caslong(A,B,C) my_atomic_cas64((int64*) (A), (int64*) (B), (C))
> -+#define my_atomic_addlong(A,B) my_atomic_add64((ATOMIC_I64*) (A), (B))
> -+#define my_atomic_loadlong(A) my_atomic_load64((ATOMIC_I64*) (A))
> -+#define my_atomic_loadlong_explicit(A,O) my_atomic_load64_explicit((ATOMIC_I64*) (A), (O))
> -+#define my_atomic_storelong(A,B) my_atomic_store64((ATOMIC_I64*) (A), (B))
> -+#define my_atomic_faslong(A,B) my_atomic_fas64((ATOMIC_I64*) (A), (B))
> -+#define my_atomic_caslong(A,B,C) my_atomic_cas64((ATOMIC_I64*) (A), (ATOMIC_I64*) (B), (C))
> - #endif
> -
> - #ifndef MY_MEMORY_ORDER_SEQ_CST
> ---- a/storage/perfschema/pfs_atomic.h
> -+++ b/storage/perfschema/pfs_atomic.h
> -@@ -41,7 +41,7 @@ public:
> -   }
> -
> -   /** Atomic load. */
> --  static inline int64 load_64(int64 *ptr)
> -+  static inline int64 load_64(ATOMIC_I64 *ptr)
> -   {
> -     return my_atomic_load64(ptr);
> -   }
> -@@ -53,9 +53,9 @@ public:
> -   }
> -
> -   /** Atomic load. */
> --  static inline uint64 load_u64(uint64 *ptr)
> -+  static inline uint64 load_u64(ATOMIC_U64 *ptr)
> -   {
> --    return (uint64) my_atomic_load64((int64*) ptr);
> -+    return (uint64) my_atomic_load64((ATOMIC_I64*) ptr);
> -   }
> -
> -   /** Atomic store. */
> -@@ -65,7 +65,7 @@ public:
> -   }
> -
> -   /** Atomic store. */
> --  static inline void store_64(int64 *ptr, int64 value)
> -+  static inline void store_64(ATOMIC_I64 *ptr, int64 value)
> -   {
> -     my_atomic_store64(ptr, value);
> -   }
> -@@ -77,9 +77,9 @@ public:
> -   }
> -
> -   /** Atomic store. */
> --  static inline void store_u64(uint64 *ptr, uint64 value)
> -+  static inline void store_u64(ATOMIC_U64 *ptr, uint64 value)
> -   {
> --    my_atomic_store64((int64*) ptr, (int64) value);
> -+    my_atomic_store64((ATOMIC_I64*) ptr, (int64) value);
> -   }
> -
> -   /** Atomic add. */
> -@@ -89,7 +89,7 @@ public:
> -   }
> -
> -   /** Atomic add. */
> --  static inline int64 add_64(int64 *ptr, int64 value)
> -+  static inline int64 add_64(ATOMIC_I64 *ptr, int64 value)
> -   {
> -     return my_atomic_add64(ptr, value);
> -   }
> -@@ -101,9 +101,9 @@ public:
> -   }
> -
> -   /** Atomic add. */
> --  static inline uint64 add_u64(uint64 *ptr, uint64 value)
> -+  static inline uint64 add_u64(ATOMIC_U64 *ptr, uint64 value)
> -   {
> --    return (uint64) my_atomic_add64((int64*) ptr, (int64) value);
> -+    return (uint64) my_atomic_add64((ATOMIC_I64*) ptr, (int64) value);
> -   }
> -
> -   /** Atomic compare and swap. */
> -@@ -114,7 +114,7 @@ public:
> -   }
> -
> -   /** Atomic compare and swap. */
> --  static inline bool cas_64(int64 *ptr, int64 *old_value,
> -+  static inline bool cas_64(ATOMIC_I64 *ptr, ATOMIC_I64 *old_value,
> -                             int64 new_value)
> -   {
> -     return my_atomic_cas64(ptr, old_value, new_value);
> -@@ -129,10 +129,10 @@ public:
> -   }
> -
> -   /** Atomic compare and swap. */
> --  static inline bool cas_u64(uint64 *ptr, uint64 *old_value,
> -+  static inline bool cas_u64(ATOMIC_U64 *ptr, ATOMIC_U64 *old_value,
> -                              uint64 new_value)
> -   {
> --    return my_atomic_cas64((int64*) ptr, (int64*) old_value,
> -+    return my_atomic_cas64((ATOMIC_I64*) ptr, (ATOMIC_I64*) old_value,
> -                             (uint64) new_value);
> -   }
> - };
> ---- a/sql/sql_class.h
> -+++ b/sql/sql_class.h
> -@@ -1049,7 +1049,7 @@ static inline void update_global_memory_
> -                       (longlong) global_status_var.global_memory_used,
> -                       size));
> -   // workaround for gcc 4.2.4-1ubuntu4 -fPIE (from DEB_BUILD_HARDENING=1)
> --  int64 volatile * volatile ptr= &global_status_var.global_memory_used;
> -+  ATOMIC_I64 volatile * volatile ptr= &global_status_var.global_memory_used;
> -   my_atomic_add64_explicit(ptr, size, MY_MEMORY_ORDER_RELAXED);
> - }
> -
> ---- a/storage/innobase/include/srv0mon.h
> -+++ b/storage/innobase/include/srv0mon.h
> -@@ -49,7 +49,7 @@ enum monitor_running_status {
> - typedef enum monitor_running_status   monitor_running_t;
> -
> - /** Monitor counter value type */
> --typedef       int64_t                         mon_type_t;
> -+typedef       ATOMIC_I64                      mon_type_t;
> -
> - /** Two monitor structures are defined in this file. One is
> - "monitor_value_t" which contains dynamic counter values for each
> -@@ -568,7 +568,7 @@ Use MONITOR_INC if appropriate mutex pro
> -       if (enabled) {                                                  \
> -               ib_uint64_t     value;                                  \
> -               value  = my_atomic_add64_explicit(                      \
> --                      (int64*) &MONITOR_VALUE(monitor), 1,            \
> -+                      (ATOMIC_I64*) &MONITOR_VALUE(monitor), 1,       \
> -                       MY_MEMORY_ORDER_RELAXED) + 1;                   \
> -               /* Note: This is not 100% accurate because of the       \
> -               inherent race, we ignore it due to performance. */      \
> -@@ -585,7 +585,7 @@ Use MONITOR_DEC if appropriate mutex pro
> -       if (enabled) {                                                  \
> -               ib_uint64_t     value;                                  \
> -               value = my_atomic_add64_explicit(                       \
> --                      (int64*) &MONITOR_VALUE(monitor), -1,           \
> -+                      (ATOMIC_I64*) &MONITOR_VALUE(monitor), -1,      \
> -                       MY_MEMORY_ORDER_RELAXED) - 1;                   \
> -               /* Note: This is not 100% accurate because of the       \
> -               inherent race, we ignore it due to performance. */      \
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97280): https://lists.openembedded.org/g/openembedded-devel/message/97280
> Mute This Topic: https://lists.openembedded.org/mt/91362003/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

