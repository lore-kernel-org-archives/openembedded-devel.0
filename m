Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DD0C433EF
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 14:09:59 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.4016.1653660598768440180
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 07:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Nvlg2Ga6;
 spf=pass (domain: gmail.com, ip: 209.85.210.175,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id j6so4406433pfe.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 07:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=J+xSxLUMuK48JhwhM4VOh09PVel8KkE8sSnt+6xtP1w=;
        b=Nvlg2Ga68K+DsvvQcGqf1L3/pkVTk8B2m7QdVXcWkVAO8iNI/207NGinn1pnynGROx
         Mc5ZqttpEnllCPzImfRDj9pEB6ZTwqxW3U8gto+JZRRhOc1o72HpXVok028eJWkegO6p
         k7E9FYAcHS9V3j5sWlEcVWvMgI1ySqkq/u/evtU1sIW5C7L0jyS+DLcdSwLNmSziZlCa
         Hh4Bw9GsbrKtGgOmytYxHkdJXOpA4/OYiE0X8nE9CbVUeTLQuHXzM/2lv35OblMSF9Ql
         AKLWN7WRmw7ECKhSTnJ+a74O9fwTz7BEuESeB5a0sq5xvlg1zdPwu5eafWtWSc0hgPz0
         9wSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=J+xSxLUMuK48JhwhM4VOh09PVel8KkE8sSnt+6xtP1w=;
        b=2J4FTpN0rJMlYROETpULL/Xrvma+8A4ffhx/DUShAPU6Cr6p3cB948yHPZPmycUBbo
         TZ2OSAbsebwbxS9gUdIJAkmkzk01FAHK4Ssh8TcOQLMbxguYvQ5YyF0R53ZQTqQNrEpD
         chYaiErFc1mX1kP4qN8OBkEeZmxeuHJjry+f6Fojx9YwSzoJZ4AZGBZLlIFDOOOXtdSp
         C5aiDikvrI54Xyq6LBMJWihbkTBLDxtdXK6DncQHcvw2w8boVsdw9lNPLqBfuCSzulfV
         RmvoJLHjF6lwwD3jwu4LGBbShE2A9pm1FV4O/zLAFa1pPUrh//lbJI27lRCHrZc+ewyQ
         RlOA==
X-Gm-Message-State: AOAM530povS2T1qUzPsljzT/htsTHEFpMDG93+oh3EystC9QoHARFvKX
	+Cn1JSmcNSIZBTYimaIknro=
X-Google-Smtp-Source: 
 ABdhPJxZDa/bSJyFr6lP+h2A7FkbosPBB6ZpTPbpyuHKUq2cETd41KYKQxboXNVLlyNYCrF1CY+pog==
X-Received: by 2002:a05:6a00:1996:b0:518:da6a:defc with SMTP id
 d22-20020a056a00199600b00518da6adefcmr16575578pfl.16.1653660597963;
        Fri, 27 May 2022 07:09:57 -0700 (PDT)
Received: from ?IPV6:2601:202:4180:a5c0:85d6:b47b:4185:c902?
 ([2601:202:4180:a5c0:85d6:b47b:4185:c902])
        by smtp.gmail.com with ESMTPSA id
 66-20020a621545000000b0051849bc0c23sm3518441pfv.23.2022.05.27.07.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 May 2022 07:09:57 -0700 (PDT)
Message-ID: <06a706bf-4cee-a26d-f5ed-8bd3aa372dc2@gmail.com>
Date: Fri, 27 May 2022 07:09:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe] [meta-oe][master][kirkstone][PATCH] mariadb: update to
 10.7.4
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220526193224.1739376-1-akuster808@gmail.com>
 <CAMKF1sr+CVJJH3pLqf6GpHAURp+RQhgAd799v=RPNPJZqxWGCA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: 
 <CAMKF1sr+CVJJH3pLqf6GpHAURp+RQhgAd799v=RPNPJZqxWGCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 14:09:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97308



On 5/26/22 19:03, Khem Raj wrote:
> on x86 ( qemux86 ) This fails with
>
> pfs_instr.cc:(.text+0x10a5): undefined reference to `__atomic_fetch_add_8'
>
> see
> https://errors.yoctoproject.org/Errors/Details/657260/
>
> somewhere we need to link with latomic on x86

Ah. I can reproduce this with clang.

-armin
>
> On Thu, May 26, 2022 at 12:32 PM Armin Kuster <akuster808@gmail.com> wrote:
>> LTS version, bugfix only update.
>>
>> Drop clang-64bit-atomics.patch as the patched code was removed in this update.
>> https://github.com/MariaDB/server/commit/cf483a7766d0730872232fdedd727d30a493fe29
>>
>> Includes these CVES:
>> CVE-2022-27458
>> CVE-2022-27457
>> CVE-2022-27456
>> CVE-2022-27455
>> CVE-2022-27452
>> CVE-2022-27451
>> CVE-2022-27449
>> CVE-2022-27448
>> CVE-2022-27447
>> CVE-2022-27446
>> CVE-2022-27445
>> CVE-2022-27444
>> CVE-2022-27387
>> CVE-2022-27386
>> CVE-2022-27384
>> CVE-2022-27383
>> CVE-2022-27382
>> CVE-2022-27381
>> CVE-2022-27380
>> CVE-2022-27379
>> CVE-2022-27378
>> CVE-2022-27377
>> CVE-2022-27376
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   ...ive_10.7.3.bb => mariadb-native_10.7.4.bb} |   0
>>   meta-oe/recipes-dbs/mysql/mariadb.inc         |   3 +-
>>   .../mysql/mariadb/clang-64bit-atomics.patch   | 178 ------------------
>>   .../{mariadb_10.7.3.bb => mariadb_10.7.4.bb}  |   0
>>   4 files changed, 1 insertion(+), 180 deletions(-)
>>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.7.3.bb => mariadb-native_10.7.4.bb} (100%)
>>   delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/clang-64bit-atomics.patch
>>   rename meta-oe/recipes-dbs/mysql/{mariadb_10.7.3.bb => mariadb_10.7.4.bb} (100%)
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.7.3.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.7.4.bb
>> similarity index 100%
>> rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.7.3.bb
>> rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.7.4.bb
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> index 855f124834..3f246dc0a5 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> @@ -20,11 +20,10 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>>              file://mm_malloc.patch \
>>              file://sys_futex.patch \
>>              file://mariadb-openssl3.patch \
>> -           file://clang-64bit-atomics.patch \
>>             "
>>   SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
>>
>> -SRC_URI[sha256sum] = "da286919ffc9c913282202349709b6ba4ebcd342815e8dae0aa6b6bd8f515cd4"
>> +SRC_URI[sha256sum] = "73dd9c9d325520f20ca5e0ef16f94b7be1146bed7e4a78e735c20daebf3a4173"
>>
>>   UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/clang-64bit-atomics.patch b/meta-oe/recipes-dbs/mysql/mariadb/clang-64bit-atomics.patch
>> deleted file mode 100644
>> index cdc2947b7b..0000000000
>> --- a/meta-oe/recipes-dbs/mysql/mariadb/clang-64bit-atomics.patch
>> +++ /dev/null
>> @@ -1,178 +0,0 @@
>> -Prevent Clang from emitting atomic libcalls
>> -
>> -Clang expects 8-byte alignment for some 64-bit atomic operations
>> -in some 32-bit targets. Native instruction lock cmpxchg8b (for x86)
>> -should only require 4-byte alignment.
>> -
>> -This patch tries to add 8-byte alignents to data needing atomic ops
>> -which helps clang to not generate the libatomic calls but emit
>> -builtins directly.
>> -
>> -Upstream-Status: Submitted[https://jira.mariadb.org/browse/MDEV-28162]
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -
>> ---- a/include/my_atomic.h
>> -+++ b/include/my_atomic.h
>> -@@ -115,6 +115,16 @@
>> - #include "atomic/gcc_builtins.h"
>> - #endif
>> -
>> -+#include <stdint.h>
>> -+
>> -+# ifdef __GNUC__
>> -+typedef __attribute__((__aligned__(8))) int64 ATOMIC_I64;
>> -+typedef __attribute__((__aligned__(8))) uint64 ATOMIC_U64;
>> -+# else
>> -+typedef int64 ATOMIC_I64;
>> -+typedef uint64 ATOMIC_U64;
>> -+# endif
>> -+
>> - #if SIZEOF_LONG == 4
>> - #define my_atomic_addlong(A,B) my_atomic_add32((int32*) (A), (B))
>> - #define my_atomic_loadlong(A) my_atomic_load32((int32*) (A))
>> -@@ -123,12 +133,12 @@
>> - #define my_atomic_faslong(A,B) my_atomic_fas32((int32*) (A), (B))
>> - #define my_atomic_caslong(A,B,C) my_atomic_cas32((int32*) (A), (int32*) (B), (C))
>> - #else
>> --#define my_atomic_addlong(A,B) my_atomic_add64((int64*) (A), (B))
>> --#define my_atomic_loadlong(A) my_atomic_load64((int64*) (A))
>> --#define my_atomic_loadlong_explicit(A,O) my_atomic_load64_explicit((int64*) (A), (O))
>> --#define my_atomic_storelong(A,B) my_atomic_store64((int64*) (A), (B))
>> --#define my_atomic_faslong(A,B) my_atomic_fas64((int64*) (A), (B))
>> --#define my_atomic_caslong(A,B,C) my_atomic_cas64((int64*) (A), (int64*) (B), (C))
>> -+#define my_atomic_addlong(A,B) my_atomic_add64((ATOMIC_I64*) (A), (B))
>> -+#define my_atomic_loadlong(A) my_atomic_load64((ATOMIC_I64*) (A))
>> -+#define my_atomic_loadlong_explicit(A,O) my_atomic_load64_explicit((ATOMIC_I64*) (A), (O))
>> -+#define my_atomic_storelong(A,B) my_atomic_store64((ATOMIC_I64*) (A), (B))
>> -+#define my_atomic_faslong(A,B) my_atomic_fas64((ATOMIC_I64*) (A), (B))
>> -+#define my_atomic_caslong(A,B,C) my_atomic_cas64((ATOMIC_I64*) (A), (ATOMIC_I64*) (B), (C))
>> - #endif
>> -
>> - #ifndef MY_MEMORY_ORDER_SEQ_CST
>> ---- a/storage/perfschema/pfs_atomic.h
>> -+++ b/storage/perfschema/pfs_atomic.h
>> -@@ -41,7 +41,7 @@ public:
>> -   }
>> -
>> -   /** Atomic load. */
>> --  static inline int64 load_64(int64 *ptr)
>> -+  static inline int64 load_64(ATOMIC_I64 *ptr)
>> -   {
>> -     return my_atomic_load64(ptr);
>> -   }
>> -@@ -53,9 +53,9 @@ public:
>> -   }
>> -
>> -   /** Atomic load. */
>> --  static inline uint64 load_u64(uint64 *ptr)
>> -+  static inline uint64 load_u64(ATOMIC_U64 *ptr)
>> -   {
>> --    return (uint64) my_atomic_load64((int64*) ptr);
>> -+    return (uint64) my_atomic_load64((ATOMIC_I64*) ptr);
>> -   }
>> -
>> -   /** Atomic store. */
>> -@@ -65,7 +65,7 @@ public:
>> -   }
>> -
>> -   /** Atomic store. */
>> --  static inline void store_64(int64 *ptr, int64 value)
>> -+  static inline void store_64(ATOMIC_I64 *ptr, int64 value)
>> -   {
>> -     my_atomic_store64(ptr, value);
>> -   }
>> -@@ -77,9 +77,9 @@ public:
>> -   }
>> -
>> -   /** Atomic store. */
>> --  static inline void store_u64(uint64 *ptr, uint64 value)
>> -+  static inline void store_u64(ATOMIC_U64 *ptr, uint64 value)
>> -   {
>> --    my_atomic_store64((int64*) ptr, (int64) value);
>> -+    my_atomic_store64((ATOMIC_I64*) ptr, (int64) value);
>> -   }
>> -
>> -   /** Atomic add. */
>> -@@ -89,7 +89,7 @@ public:
>> -   }
>> -
>> -   /** Atomic add. */
>> --  static inline int64 add_64(int64 *ptr, int64 value)
>> -+  static inline int64 add_64(ATOMIC_I64 *ptr, int64 value)
>> -   {
>> -     return my_atomic_add64(ptr, value);
>> -   }
>> -@@ -101,9 +101,9 @@ public:
>> -   }
>> -
>> -   /** Atomic add. */
>> --  static inline uint64 add_u64(uint64 *ptr, uint64 value)
>> -+  static inline uint64 add_u64(ATOMIC_U64 *ptr, uint64 value)
>> -   {
>> --    return (uint64) my_atomic_add64((int64*) ptr, (int64) value);
>> -+    return (uint64) my_atomic_add64((ATOMIC_I64*) ptr, (int64) value);
>> -   }
>> -
>> -   /** Atomic compare and swap. */
>> -@@ -114,7 +114,7 @@ public:
>> -   }
>> -
>> -   /** Atomic compare and swap. */
>> --  static inline bool cas_64(int64 *ptr, int64 *old_value,
>> -+  static inline bool cas_64(ATOMIC_I64 *ptr, ATOMIC_I64 *old_value,
>> -                             int64 new_value)
>> -   {
>> -     return my_atomic_cas64(ptr, old_value, new_value);
>> -@@ -129,10 +129,10 @@ public:
>> -   }
>> -
>> -   /** Atomic compare and swap. */
>> --  static inline bool cas_u64(uint64 *ptr, uint64 *old_value,
>> -+  static inline bool cas_u64(ATOMIC_U64 *ptr, ATOMIC_U64 *old_value,
>> -                              uint64 new_value)
>> -   {
>> --    return my_atomic_cas64((int64*) ptr, (int64*) old_value,
>> -+    return my_atomic_cas64((ATOMIC_I64*) ptr, (ATOMIC_I64*) old_value,
>> -                             (uint64) new_value);
>> -   }
>> - };
>> ---- a/sql/sql_class.h
>> -+++ b/sql/sql_class.h
>> -@@ -1049,7 +1049,7 @@ static inline void update_global_memory_
>> -                       (longlong) global_status_var.global_memory_used,
>> -                       size));
>> -   // workaround for gcc 4.2.4-1ubuntu4 -fPIE (from DEB_BUILD_HARDENING=1)
>> --  int64 volatile * volatile ptr= &global_status_var.global_memory_used;
>> -+  ATOMIC_I64 volatile * volatile ptr= &global_status_var.global_memory_used;
>> -   my_atomic_add64_explicit(ptr, size, MY_MEMORY_ORDER_RELAXED);
>> - }
>> -
>> ---- a/storage/innobase/include/srv0mon.h
>> -+++ b/storage/innobase/include/srv0mon.h
>> -@@ -49,7 +49,7 @@ enum monitor_running_status {
>> - typedef enum monitor_running_status   monitor_running_t;
>> -
>> - /** Monitor counter value type */
>> --typedef       int64_t                         mon_type_t;
>> -+typedef       ATOMIC_I64                      mon_type_t;
>> -
>> - /** Two monitor structures are defined in this file. One is
>> - "monitor_value_t" which contains dynamic counter values for each
>> -@@ -568,7 +568,7 @@ Use MONITOR_INC if appropriate mutex pro
>> -       if (enabled) {                                                  \
>> -               ib_uint64_t     value;                                  \
>> -               value  = my_atomic_add64_explicit(                      \
>> --                      (int64*) &MONITOR_VALUE(monitor), 1,            \
>> -+                      (ATOMIC_I64*) &MONITOR_VALUE(monitor), 1,       \
>> -                       MY_MEMORY_ORDER_RELAXED) + 1;                   \
>> -               /* Note: This is not 100% accurate because of the       \
>> -               inherent race, we ignore it due to performance. */      \
>> -@@ -585,7 +585,7 @@ Use MONITOR_DEC if appropriate mutex pro
>> -       if (enabled) {                                                  \
>> -               ib_uint64_t     value;                                  \
>> -               value = my_atomic_add64_explicit(                       \
>> --                      (int64*) &MONITOR_VALUE(monitor), -1,           \
>> -+                      (ATOMIC_I64*) &MONITOR_VALUE(monitor), -1,      \
>> -                       MY_MEMORY_ORDER_RELAXED) - 1;                   \
>> -               /* Note: This is not 100% accurate because of the       \
>> -               inherent race, we ignore it due to performance. */      \
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb
>> similarity index 100%
>> rename from meta-oe/recipes-dbs/mysql/mariadb_10.7.3.bb
>> rename to meta-oe/recipes-dbs/mysql/mariadb_10.7.4.bb
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#97280): https://lists.openembedded.org/g/openembedded-devel/message/97280
>> Mute This Topic: https://lists.openembedded.org/mt/91362003/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


