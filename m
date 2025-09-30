Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F6CCCA470
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 10:05:59 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.21934.1759226753176046922
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 03:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y13OF4/p;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b457d93c155so68228766b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 03:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759226751; x=1759831551; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6eCNbzadSZDdpSWDPMUG2RpzdStRScm6DcSHoXkTbMI=;
        b=Y13OF4/p55W/0STzoCvP3F98QsoM0Emk1rS7DpsTbghtSTSy++3/7Xyr1SufYK179v
         NDbB0FnkeQTriDH1AXPMr6v5hFcZx1FwTggLLmfsnFRrsMXP3t/4XEWWiJhqEv1LfuMT
         WFjgkg5LvXgT8+bJ+r72/nS4yk+2oALPMgMs2WZe5ykpQtDNt+cQFVojrmLuOFY6YEgU
         JNs4eFNVzheYL+l/b9x3nwTIsQ40wOYI+AbMJCq/RqCsqI+63P06z8nC6iPKWVFKu4zn
         uaWaKZREGRIXmZj4aN9Z4WXi5ftVuyCk+xs6ERAMwJNACnkMcBs8psv2P/XgocOwwZfk
         NtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759226751; x=1759831551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6eCNbzadSZDdpSWDPMUG2RpzdStRScm6DcSHoXkTbMI=;
        b=GSCEwjJDXaJOPSfwkAeEub0cNpULiJXBxPDoZTdRwCfd49xudBWGVPeHE418rV6012
         qNqaolz5TBWl7t5q/N8jYefS9OCp2GUq7Pjk2jVWYzNETUVKPBalhSSfHShhLS3tLnDF
         xb6mtByZqbHqGOUO/ZXCZ8elOZ9z3r40Dn5sh+jnE2CFkBXJBX5O0ZnBA2btnQa121+E
         nYYfgqjsEszCwKP3Se/3DxNS/6EUUjpk/7HYneTzNAsfG72Th66JUXEcBlYNXY5Rj5gG
         Mc/evKJWZqXFpTPy/5f4ldl8j4XivcYGWt+AJD6SvKw35qCPhUBmqW4AxMt0XKyGwags
         zzbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD5m8GWj52vHMGx1AqRDqD5gJpdBITLkD1Au9Ns91Sfr2YaRXz5ehH4uLDNmw0yGfuvELmAXfL1Fw6E5VVruIoqFE=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw46dJdagBeUzzpwIyj9SFuSiegxyeoxUSO0Bvh2ERMxculRqdZ
	556/aEU2whb/YaMH6yyOid5WSt50AkIA7r0Zbm0EdWwqis1f62ScukWQAxq7+A==
X-Gm-Gg: ASbGncs49gGZmFNlUhvX0YiPiypyeETKQE4Ezgq5A4c5+82eRu/IZ22VONtzJdzgDDk
	DKr0zOJHQnoZdDpcsCk0qE7CSQLTNyR2rAm+uV9SNYFZTn7mN5UgBDYMRcphO/yScQIa62ysgyQ
	+CezdEL99aaTMI1tp3VutGuBvtaLy0DlRJJpC37no9b3BgDWO55SIEH8wLlRTg7PMJ+ukqO1JZL
	fhXyEnPJamK096iyQ3FnShGsdMvTbcYPgcTb2ZW9j0hrKgSbFspVuufnMp8VLJ0+rn9FUOkbxlR
	48KSL6qSXwSA7izzzCqWNo5muCW34pT3ikQ/10smQoX88aRP2jm68gd/3DoB7KuqXA/q0pCZ664
	ZTqVXB9ImKAPijBsCLU99+wbzb9c9ORRrp9REzpPJdEgyPLwsPiTHG48B0a9TkrPb3g==
X-Google-Smtp-Source: AGHT+IFJuswNV1zK725qKKFo8WDlQl5NFu8ovgpuSh0tQGEK4tOZsw2ufu0NBnGysa2mimNuCkrPYQ==
X-Received: by 2002:a17:906:794d:b0:b3c:bd91:28a4 with SMTP id a640c23a62f3a-b3cbd912be8mr1005637666b.28.1759226750911;
        Tue, 30 Sep 2025 03:05:50 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b432788d967sm134317766b.66.2025.09.30.03.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 03:05:50 -0700 (PDT)
Message-ID: <7121a8c5-1148-45dd-80b3-38558b4070ed@gmail.com>
Date: Tue, 30 Sep 2025 12:05:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][scarthgap][PATCH 1/1] Revert "mariadb: upgrade
 10.11.9 -> 10.11.12"
To: Yogita.Urade@windriver.com, openembedded-devel@lists.openembedded.org
References: <20250926105137.3980107-1-yogita.urade@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250926105137.3980107-1-yogita.urade@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 10:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120077

On 9/26/25 12:51, Urade, Yogita via lists.openembedded.org wrote:
> From: Yogita Urade <yogita.urade@windriver.com>
>
> This reverts commit 7b57b8f1069f29981623ee30c6dd24b7781ed958.
>
> This upgradation causes timeout issue to start the mysqld services.

Could you please give some info, how to reproduce this issue? Does it
need anything special?
I think it would be better to bisect the issue and try to find the
solution (if possible) rather than going backwards.

>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
>  ..._10.11.12.bb => mariadb-native_10.11.9.bb} |  0
>  meta-oe/recipes-dbs/mysql/mariadb.inc         |  4 +-
>  ...-missing-includes-cstdint-and-cstdio.patch | 43 ++++++++++++-------
>  .../recipes-dbs/mysql/mariadb/mm_malloc.patch | 13 ++++++
>  .../mysql/mariadb/ppc-remove-glibc-dep.patch  | 43 +++++++++++++++++++
>  ...mariadb_10.11.12.bb => mariadb_10.11.9.bb} |  0
>  6 files changed, 87 insertions(+), 16 deletions(-)
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.12.bb => mariadb-native_10.11.9.bb} (100%)
>  create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
>  create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
>  rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.12.bb => mariadb_10.11.9.bb} (100%)
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.12.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.12.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
> index 6e7c01a775..abcf0b3cda 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -17,13 +17,15 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>             file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
>             file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch \
>             file://ssize_t.patch \
> +           file://mm_malloc.patch \
>             file://sys_futex.patch \
>             file://cross-compiling.patch \
>             file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
>             file://lfs64.patch \
>             file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
>            "
> -SRC_URI[sha256sum] = "d61f23090cfc14f43e8a27c2d3ce7f80247e74481bb26a2d3a6308b8d194e167"
> +SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
> +SRC_URI[sha256sum] = "0a00180864cd016187c986faab8010de23a117b9a75f91d6456421f894e48d20"
>  
>  UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
>  
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
> index fa580d039a..7fc2377f19 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
> @@ -11,14 +11,27 @@ Upstream-Status: Pending
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>  ---
> - storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h  | 1 +
> - .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h   | 1 +
> - storage/rocksdb/rocksdb/util/slice.cc                           | 2 +-
> - storage/rocksdb/rocksdb/util/string_util.h                      | 1 +
> - 4 files changed, 4 insertions(+), 1 deletion(-)
> + .../rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h   | 1 +
> + storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h   | 1 +
> + .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h    | 1 +
> + storage/rocksdb/rocksdb/util/slice.cc                            | 1 +
> + storage/rocksdb/rocksdb/util/string_util.h                       | 1 +
> + 5 files changed, 5 insertions(+)
>  
> +diff --git a/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
> +index 963c1d8e..73487edd 100644
> +--- a/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
> ++++ b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
> +@@ -5,6 +5,7 @@
> +
> + #pragma once
> +
> ++#include <cstdint>
> + #include "rocksdb/rocksdb_namespace.h"
> +
> + struct CompactionIterationStats {
>  diff --git a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
> -index 7fb9d489..f7b4e6f0 100644
> +index c7f93b4c..3c2ab805 100644
>  --- a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
>  +++ b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
>  @@ -8,6 +8,7 @@
> @@ -42,20 +55,20 @@ index f356395f..32152217 100644
>   #include <vector>
>   
>  diff --git a/storage/rocksdb/rocksdb/util/slice.cc b/storage/rocksdb/rocksdb/util/slice.cc
> -index 3c3656de..b18d7f5d 100644
> +index 6db11cc9..c26b6a21 100644
>  --- a/storage/rocksdb/rocksdb/util/slice.cc
>  +++ b/storage/rocksdb/rocksdb/util/slice.cc
> -@@ -12,7 +12,7 @@
> - #include <stdio.h>
> +@@ -8,6 +8,7 @@
> + // found in the LICENSE file. See the AUTHORS file for names of contributors.
>   
>   #include <algorithm>
> --
>  +#include <cstdint>
> - #include "rocksdb/convenience.h"
>   #include "rocksdb/slice_transform.h"
> - #include "rocksdb/utilities/object_registry.h"
> -diff --git a/storage/rocksdb/rocksdb/util/string_util.h b/storage/rocksdb/rocksdb/util/string_util.h
> -index 7794dbb0..b480177e 100644
> + #include "rocksdb/slice.h"
> + #include "util/string_util.h"
> +
> +diff --git a/util/string_util.h b/util/string_util.h
> +index 55d106fff02..11178fd1d7b 100644
>  --- a/storage/rocksdb/rocksdb/util/string_util.h
>  +++ b/storage/rocksdb/rocksdb/util/string_util.h
>  @@ -6,6 +6,7 @@
> @@ -67,5 +80,5 @@ index 7794dbb0..b480177e 100644
>   #include <string>
>   #include <unordered_map>
>  -- 
> -2.40.0
> +2.25.1
>  
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch b/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
> new file mode 100644
> index 0000000000..56ed480d33
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
> @@ -0,0 +1,13 @@
> +Upstream-Status: Pending
> +
> +--- a/storage/rocksdb/rocksdb/port/jemalloc_helper.h
> ++++ b/storage/rocksdb/rocksdb/port/jemalloc_helper.h
> +@@ -5,7 +5,7 @@
> +
> + #pragma once
> +
> +-#if defined(__clang__)
> ++#if defined(__clang__) && defined(__GLIBC__)
> + // glibc's `posix_memalign()` declaration specifies `throw()` while clang's
> + // declaration does not. There is a hack in clang to make its re-declaration
> + // compatible with glibc's if they are declared consecutively. That hack breaks
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
> new file mode 100644
> index 0000000000..3787b74ad1
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
> @@ -0,0 +1,43 @@
> +Upstream-Status: Pending
> +
> +Remove glibc specific function dependencies
> +
> +Sourced from: https://git.alpinelinux.org/aports/tree/main/mariadb/ppc-remove-glibc-dep.patch
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +diff --git a/include/my_cpu.h b/include/my_cpu.h
> +index f2e26fca..94599b74 100644
> +--- a/include/my_cpu.h
> ++++ b/include/my_cpu.h
> +@@ -24,17 +24,16 @@
> + */
> +
> + #ifdef _ARCH_PWR8
> +-#include <sys/platform/ppc.h>
> + /* Very low priority */
> +-#define HMT_very_low() __ppc_set_ppr_very_low()
> ++#define HMT_very_low() asm volatile("or 31,31,31")
> + /* Low priority */
> +-#define HMT_low() __ppc_set_ppr_low()
> ++#define HMT_low() asm volatile ("or 1,1,1")
> + /* Medium low priority */
> +-#define HMT_medium_low() __ppc_set_ppr_med_low()
> ++#define HMT_medium_low() asm volatile ("or 6,6,6")
> + /* Medium priority */
> +-#define HMT_medium() __ppc_set_ppr_med()
> ++#define HMT_medium() asm volatile ("or 2,2,2")
> + /* Medium high priority */
> +-#define HMT_medium_high() __ppc_set_ppr_med_high()
> ++#define HMT_medium_high() asm volatile("or 5,5,5")
> + /* High priority */
> + #define HMT_high() asm volatile("or 3,3,3")
> + #else
> +@@ -72,7 +71,7 @@ static inline void MY_RELAX_CPU(void)
> +   __asm__ __volatile__ ("pause");
> + #endif
> + #elif defined(_ARCH_PWR8)
> +-  __ppc_get_timebase();
> ++  __builtin_ppc_get_timebase();
> + #elif defined __GNUC__ && (defined __arm__ || defined __aarch64__)
> +   /* Mainly, prevent the compiler from optimizing away delay loops */
> +   __asm__ __volatile__ ("":::"memory");
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.12.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.12.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119905): https://lists.openembedded.org/g/openembedded-devel/message/119905
> Mute This Topic: https://lists.openembedded.org/mt/115446396/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


