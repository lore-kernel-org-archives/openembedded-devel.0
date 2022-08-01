Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC53C00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 14:28:09 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.25283.1659364087281887207
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Aug 2022 07:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X5kEN5/X;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: ptsneves@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id z25so17604220lfr.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Aug 2022 07:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EH+MyTeNuV+53vOfaMkeV4zkTzlaUeBncS1CE5djZsA=;
        b=X5kEN5/XEjtNu4pwZYFwtoyXkHPxwWDtJEE7+mmrKARLZKyg8RiGU2r0kJ9bUOmzWj
         5GbQ5SUulo1g1KmP9Sk0YNin/ZbTxg9t9XxA+iD0UoYhkWVP5MhhrrNgeObeAkJwGV1y
         qPK0iU6imjMDGGSxmLv7oUH7OI4DHCzBx+9QmiLnu7Hfr31By9lKsD3nTzl+F08BMRvg
         n1yZdAbQZ9jodiZ+GfP6cTme6Z6i5X5ebpO3AKym6WGlOcRtC8hLwY1FF8zlDKvh4D9l
         nSrZOL5keq6WSN1D0PqaHowqkJMPJMDmcZccsOKPU2I3emcVoHi4lFIQEztPJqc0JYvM
         fmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EH+MyTeNuV+53vOfaMkeV4zkTzlaUeBncS1CE5djZsA=;
        b=ZKKWI84AitFcsplJa6du3eYdTJMOV29jkFQWj9692oQ6UMf9QdnSBDde7MXVS6f0O0
         Pnui/hTlNUEtCEnZyKalbl3uMuq5AD1mbGXrsxs1fVhe+vDyN7CB1f4VUYT58p3Amtms
         scnRYQHqRR9dOENtaY6ttjBTB3I7SauXy1k+hqG1fC2A4150nzwz+zAOLBC1+Jn6fCwz
         mXOl5ww82xFtGj7oG5RiFnNZGr4lcf8IfMpjZhpQD+9GhSs+8K9kzCgYd0C1Y3OOY8SO
         KPztgCGQtBtTJ+8teIgkVy94INS7pg+xHMhtrKatTPLcIi4vBDg49wbC6QqI6pIOCQY4
         PPTg==
X-Gm-Message-State: ACgBeo1UfJCo1WFlnov3gO1bX/FEfCRSoC2wAu+8c01LtEfLtwCCOh1n
	aiJKbwGRN5EMnMMghd6cow==
X-Google-Smtp-Source: 
 AGRyM1tyMG0Yg2BKmFp6uR/KO8WqXXoIwF2BzoUviyLQ5cnRIq4awBmCL+TcnYUiqyIw8cWc1VQq+A==
X-Received: by 2002:a05:6512:695:b0:487:cc8c:7520 with SMTP id
 t21-20020a056512069500b00487cc8c7520mr5702071lfe.522.1659364085008;
        Mon, 01 Aug 2022 07:28:05 -0700 (PDT)
Received: from [192.168.1.248]
 (031011128142.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.142])
        by smtp.gmail.com with ESMTPSA id
 o20-20020a056512053400b0048a73d83b7csm912508lfc.133.2022.08.01.07.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 07:28:04 -0700 (PDT)
Message-ID: <e545e85b-adb6-6a81-da9b-c3bd64b1d58f@gmail.com>
Date: Mon, 1 Aug 2022 16:28:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [oe][meta-oe][ 1/1] fluentbit Upgrade to 1.3.5 -> 1.9.6
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220728140330.3449041-1-ptsneves@gmail.com>
 <CAMKF1so1Z9VV0=5QyGWDsr+pdRm6c2EzSfcX+gzbvJ-Kv6hAPA@mail.gmail.com>
From: Paulo Neves <ptsneves@gmail.com>
In-Reply-To: 
 <CAMKF1so1Z9VV0=5QyGWDsr+pdRm6c2EzSfcX+gzbvJ-Kv6hAPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Aug 2022 14:28:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98075

Thanks for the review. Some more stuff was wrong after all and i am 
reworking the patch.

I looked at the usrmerge patch and indeed i removed it incorrectly.

I tried to rework it so that it uses systemd.pc's systemdunitdir 
variable but that variable relies on rootprefix. I cannot find a reason 
why we are not setting systemd ROOTFSPREFIX in systemd and instead are 
using 
meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch. 
Is there any mismatch where prefix would not match? Would ROOTFSPREFIX 
only be valid when usrmerge is active?

Paulo Neves

On 7/29/22 04:44, Khem Raj wrote:
> Hi Paulo
>
>
> On Thu, Jul 28, 2022 at 10:03 AM Paulo Neves <ptsneves@gmail.com> wrote:
>> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
>> ---
>>   ...t-Do-not-use-private-makefile-target.patch | 68 +++++++++++++++
>>   ...nit-install-location-with-SYSTEM_DIR.patch | 28 -------
>>   ...caused-by-using-flb_free-instead-of-.patch | 43 ----------
>>   ...-ppc-Fix-signature-for-co_create-API.patch | 38 ---------
>>   ...-not-hardcode-compilation-directorie.patch | 26 ++++++
>>   ...GV-caused-by-using-flb_free-instead-.patch | 82 -------------------
>>   ...0003-mbedtls-Do-not-overwrite-CFLAGS.patch | 25 ++++++
>>   .../fluentbit/fluentbit/builtin-nan.patch     | 27 ------
>>   .../cross-build-init-system-detection.patch   | 38 ---------
>>   ...{fluentbit_1.3.5.bb => fluentbit_1.9.6.bb} | 44 +++++-----
>>   10 files changed, 139 insertions(+), 280 deletions(-)
>>   create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Do-not-use-private-makefile-target.patch
>>   delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch
>>   delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-bin-fix-SIGSEGV-caused-by-using-flb_free-instead-of-.patch
>>   delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-ppc-Fix-signature-for-co_create-API.patch
>>   create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch
>>   delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-instead-.patch
>>   create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch
>>   delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/builtin-nan.patch
>>   delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/cross-build-init-system-detection.patch
>>   rename meta-oe/recipes-extended/fluentbit/{fluentbit_1.3.5.bb => fluentbit_1.9.6.bb} (53%)
>>
>> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Do-not-use-private-makefile-target.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Do-not-use-private-makefile-target.patch
>> new file mode 100644
>> index 000000000..0a80a92ed
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Do-not-use-private-makefile-target.patch
>> @@ -0,0 +1,68 @@
>> +From 6a704ab7bf69cd5d6970b3a7d3ae7798b26027c1 Mon Sep 17 00:00:00 2001
>> +From: Paulo Neves <ptsneves@gmail.com>
>> +Date: Thu, 28 Jul 2022 11:28:41 +0200
>> +Subject: [PATCH] CMakeLists.txt Do not use private makefile $< target
>> +
>> +$< is a private detail from the Makefile generated by CMakefile and
>> +are not under control or to be used at the CMakeLists level. In 3.20
>> +that private generation changed pre-requisite targets[1] and now logs
>> +contain the path compiler_depend.ts instead of the actual file.
>> +---
>> + CMakeLists.txt              | 6 +-----
>> + lib/chunkio/CMakeLists.txt  | 7 +------
>> + lib/cmetrics/CMakeLists.txt | 7 +------
>> + 3 files changed, 3 insertions(+), 17 deletions(-)
>> +
>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>> +index 3dba5a8..d94b988 100644
>> +--- a/CMakeLists.txt
>> ++++ b/CMakeLists.txt
>> +@@ -46,11 +46,7 @@ else()
>> +   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
>> + endif()
>> +
>> +-if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
>> +-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__='\"$(subst ${CMAKE_SOURCE_DIR}/,,$(abspath $<))\"'")
>> +-else()
>> +-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
>> +-endif()
>> ++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
>> +
>> + if(${CMAKE_SYSTEM_PROCESSOR} MATCHES "armv7l")
>> +   set(CMAKE_C_LINK_FLAGS "${CMAKE_C_LINK_FLAGS} -latomic")
>> +diff --git a/lib/chunkio/CMakeLists.txt b/lib/chunkio/CMakeLists.txt
>> +index bbe1f39..809ea93 100644
>> +--- a/lib/chunkio/CMakeLists.txt
>> ++++ b/lib/chunkio/CMakeLists.txt
>> +@@ -14,12 +14,7 @@ else()
>> +   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall ")
>> + endif()
>> +
>> +-# Set __FILENAME__
>> +-if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
>> +-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__='\"$(subst ${CMAKE_SOURCE_DIR}/,,$(abspath $<))\"'")
>> +-else()
>> +-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
>> +-endif()
>> ++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
>> +
>> + include(cmake/macros.cmake)
>> +
>> +diff --git a/lib/cmetrics/CMakeLists.txt b/lib/cmetrics/CMakeLists.txt
>> +index 60e8774..e3d6149 100644
>> +--- a/lib/cmetrics/CMakeLists.txt
>> ++++ b/lib/cmetrics/CMakeLists.txt
>> +@@ -34,12 +34,7 @@ set(CMT_VERSION_MINOR  3)
>> + set(CMT_VERSION_PATCH  5)
>> + set(CMT_VERSION_STR "${CMT_VERSION_MAJOR}.${CMT_VERSION_MINOR}.${CMT_VERSION_PATCH}")
>> +
>> +-# Define __FILENAME__ consistently across Operating Systems
>> +-if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
>> +-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__='\"$(subst ${CMAKE_SOURCE_DIR}/,,$(abspath $<))\"'")
>> +-else()
>> +-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
>> +-endif()
>> ++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
>> +
>> + # Configuration options
>> + option(CMT_DEV             "Enable development mode"                   No)
>> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch
>> deleted file mode 100644
>> index bf4cda08f..000000000
>> --- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch
>> +++ /dev/null
>> @@ -1,28 +0,0 @@
>> -From 5571f949fa2048b79c197b5b10a11ecb1891cbe9 Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Sat, 23 Apr 2022 08:24:34 -0700
>> -Subject: [PATCH] Control sytemd unit install location with SYSTEM_DIR
>> -
>> -This helps building when usrmerge is on
>> -
>> -Upstream-Status: Pending
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - src/CMakeLists.txt | 6 +++++-
>> - 1 file changed, 5 insertions(+), 1 deletion(-)
>> -
>> ---- a/src/CMakeLists.txt
>> -+++ b/src/CMakeLists.txt
>> -@@ -323,7 +323,11 @@ if(FLB_BINARY)
>> -       "${PROJECT_SOURCE_DIR}/init/systemd.in"
>> -       ${FLB_SYSTEMD_SCRIPT}
>> -       )
>> --    install(FILES ${FLB_SYSTEMD_SCRIPT} DESTINATION /lib/systemd/system)
>> -+    if(SYSTEMD_DIR)
>> -+        install(FILES ${FLB_SYSTEMD_SCRIPT} DESTINATION ${SYSTEMD_DIR})
>> -+    else()
>> -+        install(FILES ${FLB_SYSTEMD_SCRIPT} DESTINATION /lib/systemd/system)
>> -+    endif()
>> -     install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR})
>> -   elseif(FLB_UPSTART)
>> -     set(FLB_UPSTART_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.conf")
>> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-bin-fix-SIGSEGV-caused-by-using-flb_free-instead-of-.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-bin-fix-SIGSEGV-caused-by-using-flb_free-instead-of-.patch
>> deleted file mode 100644
>> index a6ff5991c..000000000
>> --- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-bin-fix-SIGSEGV-caused-by-using-flb_free-instead-of-.patch
>> +++ /dev/null
>> @@ -1,43 +0,0 @@
>> -From 3d7390c89c2205d1eed0384be0bb65adb675e60d Mon Sep 17 00:00:00 2001
>> -From: Ramon Fried <ramon@neureality.ai>
>> -Date: Tue, 9 Feb 2021 18:59:59 +0200
>> -Subject: [PATCH] bin: fix SIGSEGV caused by using flb_free instead of
>> - mk_mem_free
>> -
>> -Upstream-Status: Accepted
>> -Signed-off-by: Ramon Fried <ramon@neureality.ai>
>> ----
>> - src/fluent-bit.c | 6 +++---
>> - 1 file changed, 3 insertions(+), 3 deletions(-)
>> -
>> -diff --git a/src/fluent-bit.c b/src/fluent-bit.c
>> -index c0c73b4..989cfde 100644
>> ---- a/src/fluent-bit.c
>> -+++ b/src/fluent-bit.c
>> -@@ -289,7 +289,7 @@ static int input_set_property(struct flb_input_instance *in, char *kv)
>> -                 in->p->name, key);
>> -     }
>> -
>> --    flb_free(key);
>> -+    mk_mem_free(key);
>> -     return ret;
>> - }
>> -
>> -@@ -314,7 +314,7 @@ static int output_set_property(struct flb_output_instance *out, char *kv)
>> -     }
>> -
>> -     ret = flb_output_set_property(out, key, value);
>> --    flb_free(key);
>> -+    mk_mem_free(key);
>> -     return ret;
>> - }
>> -
>> -@@ -340,7 +340,7 @@ static int filter_set_property(struct flb_filter_instance *filter, char *kv)
>> -     }
>> -
>> -     ret = flb_filter_set_property(filter, key, value);
>> --    flb_free(key);
>> -+    mk_mem_free(key);
>> -     return ret;
>> - }
>> -
>> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-ppc-Fix-signature-for-co_create-API.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-ppc-Fix-signature-for-co_create-API.patch
>> deleted file mode 100644
>> index 1f36c657e..000000000
>> --- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-ppc-Fix-signature-for-co_create-API.patch
>> +++ /dev/null
>> @@ -1,38 +0,0 @@
>> -From be4032079c931704f52e29f5da5c01cde24ac842 Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Thu, 16 Jan 2020 10:44:58 -0800
>> -Subject: [PATCH] ppc: Fix signature for co_create API
>> -
>> -Upstream-Status: Submitted [https://github.com/fluent/fluent-bit/pull/1886]
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - lib/flb_libco/ppc.c | 6 ++++--
>> - 1 file changed, 4 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/lib/flb_libco/ppc.c b/lib/flb_libco/ppc.c
>> -index e6536d56..533256b3 100644
>> ---- a/lib/flb_libco/ppc.c
>> -+++ b/lib/flb_libco/ppc.c
>> -@@ -279,7 +279,9 @@ static uint32_t* co_create_(unsigned size, uintptr_t entry) {
>> -   return t;
>> - }
>> -
>> --cothread_t co_create(unsigned int size, void (*entry_)(void)) {
>> -+cothread_t co_create(unsigned int size, void (*entry_)(void),
>> -+                     size_t *out_size) {
>> -+
>> -   uintptr_t entry = (uintptr_t)entry_;
>> -   uint32_t* t = 0;
>> -
>> -@@ -325,7 +327,7 @@ cothread_t co_create(unsigned int size, void (*entry_)(void)) {
>> -     t[10] = (uint32_t)(sp >> shift >> shift);
>> -     t[11] = (uint32_t)sp;
>> -   }
>> --
>> -+  *out_size = size;
>> -   return t;
>> - }
>> -
>> ---
>> -2.25.0
>> -
>> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch
>> new file mode 100644
>> index 000000000..4358b2a51
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch
>> @@ -0,0 +1,26 @@
>> +From 71dab751a27a2e582b711de22873065dd28f4b65 Mon Sep 17 00:00:00 2001
>> +From: Paulo Neves <ptsneves@gmail.com>
>> +Date: Thu, 28 Jul 2022 11:42:31 +0200
>> +Subject: [PATCH] flb_info.h.in: Do not hardcode compilation directories
>> +
>> +Including the source dir in the header makes the header not
>> +reproducible and contaminates it with host builder paths. Instead
>> +make it take CMAKE_DEBUG_SRCDIR that can be set to a known
>> +reproducible value
>> +---
>> + include/fluent-bit/flb_info.h.in | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/include/fluent-bit/flb_info.h.in b/include/fluent-bit/flb_info.h.in
>> +index a89485c..2579afc 100644
>> +--- a/include/fluent-bit/flb_info.h.in
>> ++++ b/include/fluent-bit/flb_info.h.in
>> +@@ -23,7 +23,7 @@
>> + #define STR_HELPER(s)      #s
>> + #define STR(s)             STR_HELPER(s)
>> +
>> +-#define FLB_SOURCE_DIR "@CMAKE_SOURCE_DIR@"
>> ++#define FLB_SOURCE_DIR "@CMAKE_DEBUG_SRCDIR@"
>> +
>> + /* General flags set by CMakeLists.txt */
>> + @FLB_BUILD_FLAGS@
>> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-instead-.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-instead-.patch
>> deleted file mode 100644
>> index 91675dfc6..000000000
>> --- a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-instead-.patch
>> +++ /dev/null
>> @@ -1,82 +0,0 @@
>> -From 7c3b1dfb174312594d3317c24ed71c60398f653f Mon Sep 17 00:00:00 2001
>> -From: Ramon Fried <ramon@neureality.ai>
>> -Date: Wed, 10 Feb 2021 04:23:36 +0200
>> -Subject: [PATCH] parser: Fix SIGSEGV caused by using flb_free instead of
>> - mk_mem_free
>> -
>> -Upstream-Status: Backport (fix only for 1.3.5)
>> -Signed-off-by: Ramon Fried <ramon@neureality.ai>
>> ----
>> - src/flb_parser.c | 28 ++++++++++++++--------------
>> - 1 file changed, 14 insertions(+), 14 deletions(-)
>> -
>> -diff --git a/src/flb_parser.c b/src/flb_parser.c
>> -index d35c568..7c20e12 100644
>> ---- a/src/flb_parser.c
>> -+++ b/src/flb_parser.c
>> -@@ -490,7 +490,7 @@ int flb_parser_conf_file(const char *file, struct flb_config *config)
>> -                                        MK_RCONF_STR);
>> -         if (str) {
>> -             time_keep = flb_utils_bool(str);
>> --            flb_free(str);
>> -+            mk_mem_free(str);
>> -         }
>> -         else {
>> -             time_keep = FLB_FALSE;
>> -@@ -522,23 +522,23 @@ int flb_parser_conf_file(const char *file, struct flb_config *config)
>> -
>> -         flb_debug("[parser] new parser registered: %s", name);
>> -
>> --        flb_free(name);
>> --        flb_free(format);
>> -+        mk_mem_free(name);
>> -+        mk_mem_free(format);
>> -
>> -         if (regex) {
>> --            flb_free(regex);
>> -+            mk_mem_free(regex);
>> -         }
>> -         if (time_fmt) {
>> --            flb_free(time_fmt);
>> -+            mk_mem_free(time_fmt);
>> -         }
>> -         if (time_key) {
>> --            flb_free(time_key);
>> -+            mk_mem_free(time_key);
>> -         }
>> -         if (time_offset) {
>> --            flb_free(time_offset);
>> -+            mk_mem_free(time_offset);
>> -         }
>> -         if (types_str) {
>> --            flb_free(types_str);
>> -+            mk_mem_free(types_str);
>> -         }
>> -
>> -         decoders = NULL;
>> -@@ -548,19 +548,19 @@ int flb_parser_conf_file(const char *file, struct flb_config *config)
>> -     return 0;
>> -
>> -  fconf_error:
>> --    flb_free(name);
>> --    flb_free(format);
>> -+    mk_mem_free(name);
>> -+    mk_mem_free(format);
>> -     if (regex) {
>> --        flb_free(regex);
>> -+        mk_mem_free(regex);
>> -     }
>> -     if (time_fmt) {
>> --        flb_free(time_fmt);
>> -+        mk_mem_free(time_fmt);
>> -     }
>> -     if (time_key) {
>> --        flb_free(time_key);
>> -+        mk_mem_free(time_key);
>> -     }
>> -     if (types_str) {
>> --        flb_free(types_str);
>> -+        mk_mem_free(types_str);
>> -     }
>> -     if (decoders) {
>> -         flb_parser_decoder_list_destroy(decoders);
>> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch
>> new file mode 100644
>> index 000000000..0611af9ec
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch
>> @@ -0,0 +1,25 @@
>> +From 8486b912281ae85db0c9fc05bb546f16872e114c Mon Sep 17 00:00:00 2001
>> +From: Paulo Neves <ptsneves@gmail.com>
>> +Date: Thu, 28 Jul 2022 14:37:18 +0200
>> +Subject: [PATCH] mbedtls: Do not overwrite CFLAGS
>> +
>> +bitbake passes CFLAGS that are often in conflict with the ones set
>> +in mbedtls' CMakeLists.txt. Such conflicts are the inability to use
>> +FORTIFY_SOURCE=2 except in release mode
>> +---
>> + lib/mbedtls-2.28.0/CMakeLists.txt | 2 --
>> + 1 file changed, 2 deletions(-)
>> +
>> +diff --git a/lib/mbedtls-2.28.0/CMakeLists.txt b/lib/mbedtls-2.28.0/CMakeLists.txt
>> +index d76bddc..e717846 100644
>> +--- a/lib/mbedtls-2.28.0/CMakeLists.txt
>> ++++ b/lib/mbedtls-2.28.0/CMakeLists.txt
>> +@@ -204,8 +204,6 @@ if(CMAKE_COMPILER_IS_GNU)
>> +     if (GCC_VERSION VERSION_GREATER 7.0 OR GCC_VERSION VERSION_EQUAL 7.0)
>> +       set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wformat-overflow=2 -Wformat-truncation")
>> +     endif()
>> +-    set(CMAKE_C_FLAGS_RELEASE     "-O2")
>> +-    set(CMAKE_C_FLAGS_DEBUG       "-O0 -g3")
>> +     set(CMAKE_C_FLAGS_COVERAGE    "-O0 -g3 --coverage")
>> +     set(CMAKE_C_FLAGS_ASAN        "-fsanitize=address -fno-common -fsanitize=undefined -fno-sanitize-recover=all -O3")
>> +     set(CMAKE_C_FLAGS_ASANDBG     "-fsanitize=address -fno-common -fsanitize=undefined -fno-sanitize-recover=all -O1 -g3 -fno-omit-frame-pointer -fno-optimize-sibling-calls")
>> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/builtin-nan.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/builtin-nan.patch
>> deleted file mode 100644
>> index 8ffc3be3e..000000000
>> --- a/meta-oe/recipes-extended/fluentbit/fluentbit/builtin-nan.patch
>> +++ /dev/null
>> @@ -1,27 +0,0 @@
>> -help complier to use intrinsics, clang in few cases e.g. aarch64 can not
>> -and then requires linking with libm, its the only function needed from libm then
>> -its good to avoid needing it.
>> -
>> -Upstream-Status: Pending
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -
>> ---- a/include/fluent-bit/stream_processor/flb_sp_timeseries.h
>> -+++ b/include/fluent-bit/stream_processor/flb_sp_timeseries.h
>> -@@ -207,7 +207,7 @@ void cb_forecast_calc(struct timeseries
>> -         result = b0 + b1 * (val->f64 + *forecast->latest_x);
>> -         break;
>> -     default:
>> --        result = nan("");
>> -+        result = __builtin_nan("");
>> -         break;
>> -     }
>> -
>> -@@ -283,7 +283,7 @@ void cb_forecast_r_calc(struct timeserie
>> -             result = ((val->i64 - b0) / b1) - *forecast->latest_x;
>> -             break;
>> -         default:
>> --            result = nan("");
>> -+            result = __builtin_nan("");
>> -             break;
>> -         }
>> -
>> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/cross-build-init-system-detection.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/cross-build-init-system-detection.patch
>> deleted file mode 100644
>> index d3822fc8d..000000000
>> --- a/meta-oe/recipes-extended/fluentbit/fluentbit/cross-build-init-system-detection.patch
>> +++ /dev/null
>> @@ -1,38 +0,0 @@
>> -Define CMake variables to indicate init system for target
>> -incase of cross compile, detecting systemd support based on
>> -host directory structure is not right thing to do
>> -
>> -Upstream-Status: Pending
>> -Signed-off-by: Khem Raj <raj.kheem@gmail.com>
>> -
>> ---- a/src/CMakeLists.txt
>> -+++ b/src/CMakeLists.txt
>> -@@ -317,7 +317,7 @@ if(FLB_BINARY)
>> -   install(TARGETS fluent-bit-bin RUNTIME DESTINATION ${FLB_INSTALL_BINDIR})
>> -
>> -   # Detect init system, install upstart, systemd or init.d script
>> --  if(IS_DIRECTORY /lib/systemd/system)
>> -+  if(FLB_SYSTEMD)
>> -     set(FLB_SYSTEMD_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.service")
>> -     configure_file(
>> -       "${PROJECT_SOURCE_DIR}/init/systemd.in"
>> -@@ -325,7 +325,7 @@ if(FLB_BINARY)
>> -       )
>> -     install(FILES ${FLB_SYSTEMD_SCRIPT} DESTINATION /lib/systemd/system)
>> -     install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR})
>> --  elseif(IS_DIRECTORY /usr/share/upstart)
>> -+  elseif(FLB_UPSTART)
>> -     set(FLB_UPSTART_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.conf")
>> -     configure_file(
>> -       "${PROJECT_SOURCE_DIR}/init/upstart.in"
>> ---- a/CMakeLists.txt
>> -+++ b/CMakeLists.txt
>> -@@ -70,6 +70,8 @@ option(FLB_RECORD_ACCESSOR    "Enable re
>> - option(FLB_SYSTEM_STRPTIME    "Use strptime in system libc"  Yes)
>> - option(FLB_STATIC_CONF        "Build binary using static configuration")
>> - option(FLB_STREAM_PROCESSOR   "Enable Stream Processor"      Yes)
>> -+option(FLB_SYSTEMD            "Enable systemd init system"   No)
>> -+option(FLB_UPSTART            "Enable upstart init system"   No)
>> - option(FLB_CORO_STACK_SIZE    "Set coroutine stack size")
>> -
>> - # Metrics: Experimental Feature, disabled by default on 0.12 series
>> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.6.bb
>> similarity index 53%
>> rename from meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
>> rename to meta-oe/recipes-extended/fluentbit/fluentbit_1.9.6.bb
>> index b231cc287..1ff62767d 100644
>> --- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
>> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.6.bb
>> @@ -11,25 +11,28 @@ LICENSE = "Apache-2.0"
>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
>>   SECTION = "net"
>>
>> -SRC_URI = "http://fluentbit.io/releases/1.3/fluent-bit-${PV}.tar.gz \
>> +PR = "r0"
> We don't need to set PR in recipe anymore
>
>> +PV = "1.9.6"
> We don't need PV either since it's in the recipe name already.
>
>> +
>> +SRC_URI = "https://releases.fluentbit.io/1.9/source-${PV}.tar.gz;subdir=fluent-bit-${PV} \
>> +           file://0001-CMakeLists.txt-Do-not-use-private-makefile-target.patch \
>> +           file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch \
>> +           file://0003-mbedtls-Do-not-overwrite-CFLAGS.patch \
>>              file://jemalloc.patch \
>> -           file://cross-build-init-system-detection.patch \
>> -           file://builtin-nan.patch \
>> -           file://0001-ppc-Fix-signature-for-co_create-API.patch \
>> -           file://0001-bin-fix-SIGSEGV-caused-by-using-flb_free-instead-of-.patch \
>> -           file://0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-instead-.patch \
>> -           file://0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch \
> does this work without patch with usrmerge distro feature on ?
>
>>              "
>> -SRC_URI[md5sum] = "6eae6dfd0a874e5dd270c36e9c68f747"
>> -SRC_URI[sha256sum] = "e037c76c89269c8dc4027a08e442fefd2751b0f1e0f9c38f9a4b12d781a9c789"
>> +SRC_URI[md5sum] = "ad65bb3ca55d203a467a63426e17bfae"
> we don't need md5sum anymore.
>
>> +SRC_URI[sha256sum] = "5ef7dd97e10936269fe5f4e5d3ebf16559333066f7d6757ba12464a9d6186570"
>>
>>   S = "${WORKDIR}/fluent-bit-${PV}"
>> -DEPENDS = "zlib bison-native flex-native"
>> +DEPENDS = "zlib bison-native flex-native openssl"
>>   DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
>> -
>> +PACKAGECONFIG[yaml] = "-DFLB_CONFIG_YAML=On,-DFLB_CONFIG_YAML=Off, yaml,"
>> +PACKAGECONFIG[kafka] = "-DFLB_OUT_KAFKA=On,-DFLB_OUT_KAFKA=Off,librdkafka"
>> +PACKAGECONFIG[examples] = "-DFLB_EXAMPLES=On,-DFLB_EXAMPLES=Off"
>> +PACKAGECONFIG[jemalloc] = "-DFLB_JEMALLOC=On,-DFLB_JEMALLOC=Off,jemalloc"
>>   DEPENDS:append:libc-musl = " fts "
>>
>> -INSANE_SKIP:${PN}-dev += "dev-elf"
>> +PACKAGECONFIG ?= "yaml"
> There is no recipe providing yaml in core or meta-oe, perhaps you
> meant libyaml maybe ?
>
>>   LTO = ""
>>
>> @@ -40,13 +43,13 @@ OECMAKE_GENERATOR ?= "Unix Makefiles"
>>   # ========================
>>
>>   # Host related setup
>> -EXTRA_OECMAKE += "-DGNU_HOST=${HOST_SYS} -DFLB_ALL=ON -DFLB_TD=1"
>> +EXTRA_OECMAKE += "-DGNU_HOST=${HOST_SYS} -DFLB_TD=1"
>>
>>   # Disable LuaJIT and filter_lua support
>>   EXTRA_OECMAKE += "-DFLB_LUAJIT=Off -DFLB_FILTER_LUA=Off "
>>
>>   # Disable Library and examples
>> -EXTRA_OECMAKE += "-DFLB_SHARED_LIB=Off -DFLB_EXAMPLES=Off "
>> +EXTRA_OECMAKE += "-DFLB_SHARED_LIB=Off"
>>
>>   # Enable systemd iff systemd is in DISTRO_FEATURES
>>   EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES','systemd','-DFLB_SYSTEMD=On -DSYSTEMD_DIR=${systemd_system_unitdir}','-DFLB_SYSTEMD=Off',d)}"
>> @@ -54,16 +57,9 @@ EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES','systemd','-DFLB_SYSTEM
>>   EXTRA_OECMAKE:append:riscv64 = " -DFLB_DEPS='atomic'"
>>   EXTRA_OECMAKE:append:riscv32 = " -DFLB_DEPS='atomic'"
>>
>> -# Kafka Output plugin (disabled by default): note that when
>> -# enabling Kafka output plugin, the backend library librdkafka
>> -# requires 'openssl' as a dependency.
>> -#
>> -# DEPENDS += "openssl "
>> -# EXTRA_OECMAKE += "-DFLB_OUT_KAFKA=On "
>> -
>>   inherit cmake systemd
>>
>> -CFLAGS += "-fcommon"
>> -
>>   SYSTEMD_SERVICE:${PN} = "td-agent-bit.service"
>> -TARGET_CC_ARCH:append = " ${SELECTED_OPTIMIZATION}"
>> +
>> +EXTRA_OECMAKE += "-DCMAKE_DEBUG_SRCDIR=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/"
>> +TARGET_CC_ARCH += " ${SELECTED_OPTIMIZATION}"
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#98034): https://lists.openembedded.org/g/openembedded-devel/message/98034
>> Mute This Topic: https://lists.openembedded.org/mt/92670787/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


