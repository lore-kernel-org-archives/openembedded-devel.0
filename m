Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05DE1CAC5B8
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 19:10:30 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.2186.1759259424811827446
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 12:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q9v5dTTO;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b3da3b34950so498509366b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 12:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759259423; x=1759864223; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hknEFtZ1WzO/J+1xJQUFM2Yj5VdgWhJvXd+ZZxpYmXQ=;
        b=Q9v5dTTOJQmxP+7MtkpEX9MZzy4vUEEMXvTBHgqCycxfEEmkT+bE6vBwfLrV9uRdE7
         4669ZcjX3lQv/n8lGY1szUkYwSBUvXtI3UP43HTWLEEHJCeEpKkbIjvDdxzLFlxd3yOI
         W/RdF14xeh0dCsIZB5AaAAsFyNdEni8TQ/ft5wf8fXvOqrNy4MmMuH3OoCH0/IilIoSJ
         Wr+rswdiADUS7jXda3y0UqVzy5MJwlf3Bbb0gGX41V4y00nDVv0cCvIkj+zqGrl8C/Z3
         LZUR3SaE0TV/FLd4F2I6caEDlhk6gp/r4hWD5MN3RNX2K4eMpBET56GzaH0FWPXnO0qM
         zA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759259423; x=1759864223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hknEFtZ1WzO/J+1xJQUFM2Yj5VdgWhJvXd+ZZxpYmXQ=;
        b=FyWYowStXGEuHqU7aJAZZPvbvsHfueCTNM2eTdaHS9vq1m7x9REjjlxQC+XwnNpXhz
         WMa+IJ6EAGoIYsbDGHklrgIwztAAi3PeVdzn91K6CwmZzCuZuW8Kig0NeCSCwLFMX8d8
         Xg5tg6mVWX5hfZx6Q+H+4KuCBMeyoKZgsx1tflMmstVamkTSmsSurmJcUTpbe/Jk8ybO
         GFHLabOD6SLag/j7YleFC4u4jrfc5auYTGqiCKn/S0uqxxUSCarmw6K04L8Ro9/Mm1LP
         yWED7kys5l0AW9yXqAnt43WA2u/+CGCIBiMtzbL3bRJGuBJLUZkeJWALv3KDjsd72yBR
         Tmww==
X-Forwarded-Encrypted: i=1; AJvYcCUIGmKP8JqD5puBz1irW/vBuTLAmRbY4ydcg8aBXftufNb7aarXT15Cx27QVkIFVkn3fMfoVGeX/Y8LFQKSW9ggh/I=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw1AuWZrw4z6w3hkpdJAQ+YIBXS6Q9xfKI5TsFVrR3H3lM+oUgv
	xne1oTECduQ9tqIP7667MCy2OLiPQHueHG+p6eZtmVVvZScp3wBfwlcg
X-Gm-Gg: ASbGncvj0XC1EFUeOCK9k80CzCQKC3Anz1Pr6gkSJZ/Tq9qIX+hRJlxpQPM6CY3QmK+
	WilFc7hgaQ9hhuqJ7xQJJ3IR9YX3fMyT0D1ryOjdwOBBpv5ebnFU8Khg6PQL+ZAvLwuZgpcc3RK
	BVaKTRqmaZv+OI3wy82DjZq7Wte7HQYYbQUJL/RGV+9Xyz6QmVyzTPcMWlEC9IINf98e6rv0a5E
	9YHKR0y7SyWpeZllArZ3KXIA0ntcQa1uWXRDQXRiYYSbFvuImy3asRtRX9HY7nFJATei7ONjq55
	WYUAkOrKnCnbwRbutVTg5ptjQLjTEXQOvLq2ar7hWSG0rcpTRpKVQJqOdthozkY5RZDhq8tIXkx
	5Vf+5cyXl6ITsSA74nlbaEn0vtpLxWqK4Vv3wARxtVhetcgdGSvYcOeiWT+BRVtxLBA7IcsS1fM
	ii
X-Google-Smtp-Source: AGHT+IEoMD6xZvAyJxtwyIn5J70FWMjA8PX9CThTHS1C37nE5nfuMv6D9h8XwKYUaQW9sfzmsDkTyQ==
X-Received: by 2002:a17:906:c102:b0:b46:31be:e8f0 with SMTP id a640c23a62f3a-b46e2625369mr95346866b.3.1759259422685;
        Tue, 30 Sep 2025 12:10:22 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3539347676sm1217444266b.0.2025.09.30.12.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 12:10:22 -0700 (PDT)
Message-ID: <8c483402-ce57-493e-a344-3339cb04ee40@gmail.com>
Date: Tue, 30 Sep 2025 21:10:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][scarthgap][PATCH 1/1] Revert "mariadb: upgrade
 10.11.9 -> 10.11.12"
To: "Urade, Yogita" <yogita.urade@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20250926105137.3980107-1-yogita.urade@windriver.com>
 <7121a8c5-1148-45dd-80b3-38558b4070ed@gmail.com>
 <d6b18dfd-8f93-4256-a182-d5ce828ce321@windriver.com>
 <186A23AFED5E6B64.6422@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <186A23AFED5E6B64.6422@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 19:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120083

On 9/30/25 20:43, Gyorgy Sarvari via lists.openembedded.org wrote:
> On 9/30/25 12:20, Urade, Yogita wrote:
>>
>> On 30-09-2025 15:35, Gyorgy Sarvari wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>>
>>> On 9/26/25 12:51, Urade, Yogita via lists.openembedded.org wrote:
>>>> From: Yogita Urade <yogita.urade@windriver.com>
>>>>
>>>> This reverts commit 7b57b8f1069f29981623ee30c6dd24b7781ed958.
>>>>
>>>> This upgradation causes timeout issue to start the mysqld services.
>>> Could you please give some info, how to reproduce this issue? Does it
>>> need anything special?
>>> I think it would be better to bisect the issue and try to find the
>>> solution (if possible) rather than going backwards.
>> To reproduce this issue, added following parameters in local.conf:
>> DISTRO_FEATURES:append = " systemd usrmerge"
>> DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
>> VIRTUAL-RUNTIME_init_manager = "systemd"
>> VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
>>
>> After booting to image ran the following command:
>> root@qemux86-64:~# systemctl start mysqld
>>  Job for mysqld.service failed because a timeout was exceeded.
>>  See "systemctl status mysqld.service" and "journalctl -xeu
>> mysqld.service" for details. 
>>
>> Kindly let me know if you have any suggestions to fix this.
> It seems that a colleague of yours has ran into this issue some time
> ago: https://jira.mariadb.org/browse/MDEV-36051 - and at the first sight
> I think the observations made about the contradictory comments about
> stack-growing direction are correct.
>
> Try to add "-DSTACK_DIRECTION=-1" to EXTRA_OECMAKE, and give it a test
> (maybe with some data and queries also). Since AFAIK Yocto is not too
> widely used on SPARC and HP-UX (where the value of this macro should be
> different), I think it could be just added to the recipe, if it works.

Sorry for the spam: now I see that the STACK_DIRECTION is actually
defined in the recipe, with a seemingly incorrect value. I think it
could be removed from EXTRA_OECMAKE - if the macro is not defined, then
cmake tries to guess it (and I think its guesses it correctly). Looking
at git-blame, I think it might have gotten in accidentally, as a
not-deleted debug option.

>
>> ../Yogita
>>>> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
>>>> ---
>>>>  ..._10.11.12.bb => mariadb-native_10.11.9.bb} |  0
>>>>  meta-oe/recipes-dbs/mysql/mariadb.inc         |  4 +-
>>>>  ...-missing-includes-cstdint-and-cstdio.patch | 43 ++++++++++++-------
>>>>  .../recipes-dbs/mysql/mariadb/mm_malloc.patch | 13 ++++++
>>>>  .../mysql/mariadb/ppc-remove-glibc-dep.patch  | 43 +++++++++++++++++++
>>>>  ...mariadb_10.11.12.bb => mariadb_10.11.9.bb} |  0
>>>>  6 files changed, 87 insertions(+), 16 deletions(-)
>>>>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.12.bb => mariadb-native_10.11.9.bb} (100%)
>>>>  create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
>>>>  create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
>>>>  rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.12.bb => mariadb_10.11.9.bb} (100%)
>>>>
>>>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.12.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb
>>>> similarity index 100%
>>>> rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.12.bb
>>>> rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb
>>>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
>>>> index 6e7c01a775..abcf0b3cda 100644
>>>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>>>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>>>> @@ -17,13 +17,15 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>>>> file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
>>>> file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
>>>> \ file://ssize_t.patch \ + file://mm_malloc.patch \
>>>> file://sys_futex.patch \ file://cross-compiling.patch \
>>>> file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
>>>> file://lfs64.patch \
>>>> file://0001-Add-missing-includes-cstdint-and-cstdio.patch \ "
>>>> -SRC_URI[sha256sum] = "d61f23090cfc14f43e8a27c2d3ce7f80247e74481bb26a2d3a6308b8d194e167"
>>>> +SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
>>>> +SRC_URI[sha256sum] = "0a00180864cd016187c986faab8010de23a117b9a75f91d6456421f894e48d20"
>>>>
>>>>  UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
>>>>
>>>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
>>>> index fa580d039a..7fc2377f19 100644
>>>> --- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
>>>> +++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
>>>> @@ -11,14 +11,27 @@ Upstream-Status: Pending
>>>>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>  Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>>  ---
>>>> - storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h  | 1 +
>>>> - .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h   | 1 +
>>>> - storage/rocksdb/rocksdb/util/slice.cc                           | 2 +-
>>>> - storage/rocksdb/rocksdb/util/string_util.h                      | 1 +
>>>> - 4 files changed, 4 insertions(+), 1 deletion(-)
>>>> + .../rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h   | 1 +
>>>> + storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h   | 1 +
>>>> + .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h    | 1 +
>>>> + storage/rocksdb/rocksdb/util/slice.cc                            | 1 +
>>>> + storage/rocksdb/rocksdb/util/string_util.h                       | 1 +
>>>> + 5 files changed, 5 insertions(+)
>>>>
>>>> +diff --git a/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
>>>> +index 963c1d8e..73487edd 100644
>>>> +--- a/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
>>>> ++++ b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
>>>> +@@ -5,6 +5,7 @@
>>>> +
>>>> + #pragma once
>>>> +
>>>> ++#include <cstdint>
>>>> + #include "rocksdb/rocksdb_namespace.h"
>>>> +
>>>> + struct CompactionIterationStats {
>>>>  diff --git a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
>>>> -index 7fb9d489..f7b4e6f0 100644
>>>> +index c7f93b4c..3c2ab805 100644
>>>>  --- a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
>>>>  +++ b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
>>>>  @@ -8,6 +8,7 @@
>>>> @@ -42,20 +55,20 @@ index f356395f..32152217 100644
>>>>   #include <vector>
>>>>
>>>>  diff --git a/storage/rocksdb/rocksdb/util/slice.cc b/storage/rocksdb/rocksdb/util/slice.cc
>>>> -index 3c3656de..b18d7f5d 100644
>>>> +index 6db11cc9..c26b6a21 100644
>>>>  --- a/storage/rocksdb/rocksdb/util/slice.cc
>>>>  +++ b/storage/rocksdb/rocksdb/util/slice.cc
>>>> -@@ -12,7 +12,7 @@
>>>> - #include <stdio.h>
>>>> +@@ -8,6 +8,7 @@
>>>> + // found in the LICENSE file. See the AUTHORS file for names of contributors.
>>>>
>>>>   #include <algorithm>
>>>> --
>>>>  +#include <cstdint>
>>>> - #include "rocksdb/convenience.h"
>>>>   #include "rocksdb/slice_transform.h"
>>>> - #include "rocksdb/utilities/object_registry.h"
>>>> -diff --git a/storage/rocksdb/rocksdb/util/string_util.h b/storage/rocksdb/rocksdb/util/string_util.h
>>>> -index 7794dbb0..b480177e 100644
>>>> + #include "rocksdb/slice.h"
>>>> + #include "util/string_util.h"
>>>> +
>>>> +diff --git a/util/string_util.h b/util/string_util.h
>>>> +index 55d106fff02..11178fd1d7b 100644
>>>>  --- a/storage/rocksdb/rocksdb/util/string_util.h
>>>>  +++ b/storage/rocksdb/rocksdb/util/string_util.h
>>>>  @@ -6,6 +6,7 @@
>>>> @@ -67,5 +80,5 @@ index 7794dbb0..b480177e 100644
>>>>   #include <string>
>>>>   #include <unordered_map>
>>>>  --
>>>> -2.40.0
>>>> +2.25.1
>>>>
>>>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch b/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
>>>> new file mode 100644
>>>> index 0000000000..56ed480d33
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
>>>> @@ -0,0 +1,13 @@
>>>> +Upstream-Status: Pending
>>>> +
>>>> +--- a/storage/rocksdb/rocksdb/port/jemalloc_helper.h
>>>> ++++ b/storage/rocksdb/rocksdb/port/jemalloc_helper.h
>>>> +@@ -5,7 +5,7 @@
>>>> +
>>>> + #pragma once
>>>> +
>>>> +-#if defined(__clang__)
>>>> ++#if defined(__clang__) && defined(__GLIBC__)
>>>> + // glibc's `posix_memalign()` declaration specifies `throw()` while clang's
>>>> + // declaration does not. There is a hack in clang to make its re-declaration
>>>> + // compatible with glibc's if they are declared consecutively. That hack breaks
>>>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
>>>> new file mode 100644
>>>> index 0000000000..3787b74ad1
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
>>>> @@ -0,0 +1,43 @@
>>>> +Upstream-Status: Pending
>>>> +
>>>> +Remove glibc specific function dependencies
>>>> +
>>>> +Sourced from: https://git.alpinelinux.org/aports/tree/main/mariadb/ppc-remove-glibc-dep.patch
>>>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> +
>>>> +diff --git a/include/my_cpu.h b/include/my_cpu.h
>>>> +index f2e26fca..94599b74 100644
>>>> +--- a/include/my_cpu.h
>>>> ++++ b/include/my_cpu.h
>>>> +@@ -24,17 +24,16 @@
>>>> + */
>>>> +
>>>> + #ifdef _ARCH_PWR8
>>>> +-#include <sys/platform/ppc.h>
>>>> + /* Very low priority */
>>>> +-#define HMT_very_low() __ppc_set_ppr_very_low()
>>>> ++#define HMT_very_low() asm volatile("or 31,31,31")
>>>> + /* Low priority */
>>>> +-#define HMT_low() __ppc_set_ppr_low()
>>>> ++#define HMT_low() asm volatile ("or 1,1,1")
>>>> + /* Medium low priority */
>>>> +-#define HMT_medium_low() __ppc_set_ppr_med_low()
>>>> ++#define HMT_medium_low() asm volatile ("or 6,6,6")
>>>> + /* Medium priority */
>>>> +-#define HMT_medium() __ppc_set_ppr_med()
>>>> ++#define HMT_medium() asm volatile ("or 2,2,2")
>>>> + /* Medium high priority */
>>>> +-#define HMT_medium_high() __ppc_set_ppr_med_high()
>>>> ++#define HMT_medium_high() asm volatile("or 5,5,5")
>>>> + /* High priority */
>>>> + #define HMT_high() asm volatile("or 3,3,3")
>>>> + #else
>>>> +@@ -72,7 +71,7 @@ static inline void MY_RELAX_CPU(void)
>>>> +   __asm__ __volatile__ ("pause");
>>>> + #endif
>>>> + #elif defined(_ARCH_PWR8)
>>>> +-  __ppc_get_timebase();
>>>> ++  __builtin_ppc_get_timebase();
>>>> + #elif defined __GNUC__ && (defined __arm__ || defined __aarch64__)
>>>> +   /* Mainly, prevent the compiler from optimizing away delay loops */
>>>> +   __asm__ __volatile__ ("":::"memory");
>>>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.12.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb
>>>> similarity index 100%
>>>> rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.12.bb
>>>> rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb
>>>>
>>>>
>>>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120082): https://lists.openembedded.org/g/openembedded-devel/message/120082
> Mute This Topic: https://lists.openembedded.org/mt/115446396/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


