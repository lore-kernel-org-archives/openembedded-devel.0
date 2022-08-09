Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B986EC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 19:31:49 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.16242.1660073508142403681
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Aug 2022 12:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KFoV7XAc;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 d65-20020a17090a6f4700b001f303a97b14so13185475pjk.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Aug 2022 12:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=c15pPgxZnLkb344EcT54WdgEaGHwG1kVOWZscuwclLQ=;
        b=KFoV7XAcMPAYZ2KXt8P5jqa6nXC7q/AlKcR2NeezFHIfrFQ/hruIGVFWIX1bTc5oMo
         +3BJH+akhzJ7Kc/MO7eozpz2QXilqY4QF4hr+5DO7f3BkBlQ0hxMknrJhpaOhIQXSh41
         auv/4NzvHni+cM9EQqLj1dDqmEA3Ix2zu5VPsh3l7Y3jK8kERAF+LiL6I+RIRalwIVmk
         crQ3iGbIWRw2dFYvC3sLZWPC5ptNtjkX3F9y2YX6hGJopmG1zWpc7bwPhhmyBC9urozp
         afb1kBzhn2aO6q6BDkH+HvZ/3mdAuhcdF72RWv462xGZPyAGphOtAdir263fHERDPnjw
         HZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=c15pPgxZnLkb344EcT54WdgEaGHwG1kVOWZscuwclLQ=;
        b=zLcm2H8VpfWuqAXdullN+2JV2LJwujVNwPqNzw2soKgezwM2Ygudql91d/A0D2GoEU
         reFd58hamFAueEAizDWsAxk//vaUDd41OI7rsZ1Sv9xzzesakDxgKDRe49wch6bZCvQN
         Y5ohi45fPhdws8OTw9O0byv/TEUgTYt5SzzOs8THy0UbjBRVEFtM0zk/tyvx2Wa7tCJf
         a7hokAVtTssJagco+IAk5Kfnwu7fhbD7w87VIKVvymgQrzWZYnUDFZ3IBYEnOuWvjV3n
         zY2ceHRaeX/Zcz7ydaUIQynXVkz4Y6v6US6miyJu6c9KgyvslPA6zCk85/NqNLsVjlpS
         uaeg==
X-Gm-Message-State: ACgBeo0CW4RlBGN6myI5j5u77m5hBsnkfzCTC0Y6aXGwXmH+u9YO1Vn9
	z4buUj9akcBLDSI/v25KKsH7JNuD/ig=
X-Google-Smtp-Source: 
 AA6agR5e5euUQN7a1erYqbqWyhPu9+4QJ2HbXwWwzu6aJ1MrFopkhqoo2aI+S7q91wkq2G+/UcxmVQ==
X-Received: by 2002:a17:90b:3141:b0:1f7:75cf:a449 with SMTP id
 ip1-20020a17090b314100b001f775cfa449mr74090pjb.18.1660073506932;
        Tue, 09 Aug 2022 12:31:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 c18-20020a170902d49200b0016bfafffa0esm11358628plg.227.2022.08.09.12.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 12:31:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Paulo Neves <ptsneves@gmail.com>
Subject: [meta-oe][PATCH] fluentbit: Fix build with clang
Date: Tue,  9 Aug 2022 12:31:43 -0700
Message-Id: <20220809193143.2308014-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Aug 2022 19:31:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98183

Fix build using clang-15 which is even stricter then clang-14
These patches are worth upstream too

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Paulo Neves <ptsneves@gmail.com>
---
 ...ine-_GNU_SOURCE-for-memmem-API-check.patch | 28 ++++++++++++
 .../0002-mbedtls-Remove-unused-variable.patch | 38 ++++++++++++++++
 ...documentation-warning-as-error-with-.patch | 30 +++++++++++++
 ...0003-mbedtls-Do-not-overwrite-CFLAGS.patch | 11 ++++-
 ...-to-store-return-from-flb_kv_item_cr.patch | 43 +++++++++++++++++++
 ...stackdriver-Fix-return-type-mismatch.patch | 31 +++++++++++++
 ...06-monkey-Fix-TLS-detection-testcase.patch | 34 +++++++++++++++
 .../fluentbit/fluentbit_1.9.6.bb              | 11 ++++-
 8 files changed, 223 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-monkey-Define-_GNU_SOURCE-for-memmem-API-check.patch
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0002-mbedtls-Remove-unused-variable.patch
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Disable-documentation-warning-as-error-with-.patch
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0004-Use-correct-type-to-store-return-from-flb_kv_item_cr.patch
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0005-stackdriver-Fix-return-type-mismatch.patch
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0006-monkey-Fix-TLS-detection-testcase.patch

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-monkey-Define-_GNU_SOURCE-for-memmem-API-check.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-monkey-Define-_GNU_SOURCE-for-memmem-API-check.patch
new file mode 100644
index 0000000000..e70664031b
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-monkey-Define-_GNU_SOURCE-for-memmem-API-check.patch
@@ -0,0 +1,28 @@
+From 0d22024c5defba7007e3e633753790e20209c6f6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 9 Aug 2022 09:59:41 -0700
+Subject: [PATCH 1/5] monkey: Define _GNU_SOURCE for memmem API check
+
+This define is necessary to get this API on glibc based systems
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/monkey/mk_core/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/monkey/mk_core/CMakeLists.txt b/lib/monkey/mk_core/CMakeLists.txt
+index 0e74f8d..739fff3 100644
+--- a/lib/monkey/mk_core/CMakeLists.txt
++++ b/lib/monkey/mk_core/CMakeLists.txt
+@@ -62,6 +62,7 @@ set(src "${src}"
+   )
+ 
+ check_c_source_compiles("
++  #define _GNU_SOURCE
+   #include <string.h>
+   int main() {
+      char  haystack[] = \"1234\";
+-- 
+2.37.1
+
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-mbedtls-Remove-unused-variable.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-mbedtls-Remove-unused-variable.patch
new file mode 100644
index 0000000000..d4451bcaef
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-mbedtls-Remove-unused-variable.patch
@@ -0,0 +1,38 @@
+From c7b969d1a2a6b61bd179214ee2516b7b6cd55b27 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 9 Aug 2022 11:21:57 -0700
+Subject: [PATCH 2/5] mbedtls: Remove unused variable
+
+Fixes
+library/bignum.c:1395:29: error: variable 't' set but not used [-Werror,-Wunused-but-set-variable]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/mbedtls-2.28.0/library/bignum.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/lib/mbedtls-2.28.0/library/bignum.c b/lib/mbedtls-2.28.0/library/bignum.c
+index 62e7f76..9c256ae 100644
+--- a/lib/mbedtls-2.28.0/library/bignum.c
++++ b/lib/mbedtls-2.28.0/library/bignum.c
+@@ -1392,7 +1392,7 @@ void mpi_mul_hlp( size_t i,
+                   mbedtls_mpi_uint *d,
+                   mbedtls_mpi_uint b )
+ {
+-    mbedtls_mpi_uint c = 0, t = 0;
++    mbedtls_mpi_uint c = 0;
+ 
+ #if defined(MULADDC_HUIT)
+     for( ; i >= 8; i -= 8 )
+@@ -1443,8 +1443,6 @@ void mpi_mul_hlp( size_t i,
+     }
+ #endif /* MULADDC_HUIT */
+ 
+-    t++;
+-
+     while( c != 0 )
+     {
+         *d += c; c = ( *d < c ); d++;
+-- 
+2.37.1
+
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Disable-documentation-warning-as-error-with-.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Disable-documentation-warning-as-error-with-.patch
new file mode 100644
index 0000000000..2d7b4efda7
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Disable-documentation-warning-as-error-with-.patch
@@ -0,0 +1,30 @@
+From 2d12629f768d2459b1fc8a8ca0c38024d84bc195 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 9 Aug 2022 11:32:12 -0700
+Subject: [PATCH 3/5] mbedtls: Disable documentation warning as error with
+ clang
+
+There are shortcomings with doxygen info which clang-15+ flags, dont
+treat them as errors
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/mbedtls-2.28.0/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/mbedtls-2.28.0/CMakeLists.txt b/lib/mbedtls-2.28.0/CMakeLists.txt
+index b33c088..c5f886f 100644
+--- a/lib/mbedtls-2.28.0/CMakeLists.txt
++++ b/lib/mbedtls-2.28.0/CMakeLists.txt
+@@ -212,7 +212,7 @@ if(CMAKE_COMPILER_IS_GNU)
+ endif(CMAKE_COMPILER_IS_GNU)
+ 
+ if(CMAKE_COMPILER_IS_CLANG)
+-    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wwrite-strings -Wpointer-arith -Wimplicit-fallthrough -Wshadow -Wvla -Wformat=2 -Wno-format-nonliteral")
++	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wwrite-strings -Wpointer-arith -Wimplicit-fallthrough -Wshadow -Wvla -Wformat=2 -Wno-format-nonliteral -Wno-error=documentation")
+     set(CMAKE_C_FLAGS_COVERAGE    "-O0 -g3 --coverage")
+     set(CMAKE_C_FLAGS_ASAN        "-fsanitize=address -fno-common -fsanitize=undefined -fno-sanitize-recover=all -O3")
+     set(CMAKE_C_FLAGS_ASANDBG     "-fsanitize=address -fno-common -fsanitize=undefined -fno-sanitize-recover=all -O1 -g3 -fno-omit-frame-pointer -fno-optimize-sibling-calls")
+-- 
+2.37.1
+
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch
index a7d7dc8897..af31b436db 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch
@@ -13,8 +13,6 @@ flags that also overwrite bitbake ones.
  lib/mbedtls-2.28.0/CMakeLists.txt | 2 --
  1 file changed, 2 deletions(-)
 
-diff --git a/lib/mbedtls-2.28.0/CMakeLists.txt b/lib/mbedtls-2.28.0/CMakeLists.txt
-index d76bddc..e717846 100644
 --- a/lib/mbedtls-2.28.0/CMakeLists.txt
 +++ b/lib/mbedtls-2.28.0/CMakeLists.txt
 @@ -204,8 +204,6 @@ if(CMAKE_COMPILER_IS_GNU)
@@ -26,3 +24,12 @@ index d76bddc..e717846 100644
      set(CMAKE_C_FLAGS_COVERAGE    "-O0 -g3 --coverage")
      set(CMAKE_C_FLAGS_ASAN        "-fsanitize=address -fno-common -fsanitize=undefined -fno-sanitize-recover=all -O3")
      set(CMAKE_C_FLAGS_ASANDBG     "-fsanitize=address -fno-common -fsanitize=undefined -fno-sanitize-recover=all -O1 -g3 -fno-omit-frame-pointer -fno-optimize-sibling-calls")
+@@ -215,8 +213,6 @@ endif(CMAKE_COMPILER_IS_GNU)
+ 
+ if(CMAKE_COMPILER_IS_CLANG)
+     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wwrite-strings -Wpointer-arith -Wimplicit-fallthrough -Wshadow -Wvla -Wformat=2 -Wno-format-nonliteral")
+-    set(CMAKE_C_FLAGS_RELEASE     "-O2")
+-    set(CMAKE_C_FLAGS_DEBUG       "-O0 -g3")
+     set(CMAKE_C_FLAGS_COVERAGE    "-O0 -g3 --coverage")
+     set(CMAKE_C_FLAGS_ASAN        "-fsanitize=address -fno-common -fsanitize=undefined -fno-sanitize-recover=all -O3")
+     set(CMAKE_C_FLAGS_ASANDBG     "-fsanitize=address -fno-common -fsanitize=undefined -fno-sanitize-recover=all -O1 -g3 -fno-omit-frame-pointer -fno-optimize-sibling-calls")
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-Use-correct-type-to-store-return-from-flb_kv_item_cr.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0004-Use-correct-type-to-store-return-from-flb_kv_item_cr.patch
new file mode 100644
index 0000000000..224b8ccf1b
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0004-Use-correct-type-to-store-return-from-flb_kv_item_cr.patch
@@ -0,0 +1,43 @@
+From a797b79483940ed4adcaa5fe2c40dd0487c7c2c7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 9 Aug 2022 11:39:08 -0700
+Subject: [PATCH 4/5] Use correct type to store return from flb_kv_item_create
+
+Fix
+error: incompatible pointer to integer conversion assigning to 'int' from 'struct flb_kv *'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ plugins/out_stackdriver/stackdriver_conf.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/plugins/out_stackdriver/stackdriver_conf.c b/plugins/out_stackdriver/stackdriver_conf.c
+index a9a8eb0..e4f969e 100644
+--- a/plugins/out_stackdriver/stackdriver_conf.c
++++ b/plugins/out_stackdriver/stackdriver_conf.c
+@@ -176,12 +176,12 @@ static int read_credentials_file(const char *cred_file, struct flb_stackdriver *
+ 
+ static int parse_configuration_labels(struct flb_stackdriver *ctx)
+ {
+-    int ret;
+     char *p;
+     flb_sds_t key;
+     flb_sds_t val;
+     struct mk_list *head;
+     struct flb_slist_entry *entry;
++    struct flb_kv *ret;
+     msgpack_object_kv *kv = NULL;
+ 
+     if (ctx->labels) {
+@@ -216,7 +216,7 @@ static int parse_configuration_labels(struct flb_stackdriver *ctx)
+             flb_sds_destroy(key);
+             flb_sds_destroy(val);
+ 
+-            if (ret == -1) {
++            if (!ret) {
+                 return -1;
+             }
+         }
+-- 
+2.37.1
+
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0005-stackdriver-Fix-return-type-mismatch.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0005-stackdriver-Fix-return-type-mismatch.patch
new file mode 100644
index 0000000000..cdbbb6b2c1
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0005-stackdriver-Fix-return-type-mismatch.patch
@@ -0,0 +1,31 @@
+From 27f0bd5a3339612e03112e6b490900a9fabc3337 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 9 Aug 2022 11:44:25 -0700
+Subject: [PATCH 5/5] stackdriver: Fix return type mismatch
+
+Fix
+error: incompatible integer to pointer conversion returning 'int' from a function with result type 'flb_sds_t' (aka 'char *') [-Wint-conversion]
+            return -1;
+                   ^~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ plugins/out_stackdriver/stackdriver.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/plugins/out_stackdriver/stackdriver.c b/plugins/out_stackdriver/stackdriver.c
+index ae66bf2..e01755c 100644
+--- a/plugins/out_stackdriver/stackdriver.c
++++ b/plugins/out_stackdriver/stackdriver.c
+@@ -2033,7 +2033,7 @@ static flb_sds_t stackdriver_format(struct flb_stackdriver *ctx,
+             flb_sds_destroy(operation_producer);
+             msgpack_unpacked_destroy(&result);
+             msgpack_sbuffer_destroy(&mp_sbuf);
+-            return -1;
++            return NULL; 
+         }
+ 
+         /* Number of parsed labels */
+-- 
+2.37.1
+
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0006-monkey-Fix-TLS-detection-testcase.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0006-monkey-Fix-TLS-detection-testcase.patch
new file mode 100644
index 0000000000..eef1a56ba7
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0006-monkey-Fix-TLS-detection-testcase.patch
@@ -0,0 +1,34 @@
+From f88d9b82e8bd8ae38fba666b5825ffb41769f81a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 9 Aug 2022 12:25:22 -0700
+Subject: [PATCH] monkey: Fix TLS detection testcase
+
+Clang15 errors out on compiling the check and disables TLS
+
+Fixes errors like
+
+error: call to undeclared function '__tls_get_addr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+         __tls_get_addr(0);
+         ^
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/monkey/CMakeLists.txt | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/monkey/CMakeLists.txt b/lib/monkey/CMakeLists.txt
+index 15e62e8..96ac2bd 100644
+--- a/lib/monkey/CMakeLists.txt
++++ b/lib/monkey/CMakeLists.txt
+@@ -178,6 +178,8 @@ endif()
+ # Use old Pthread TLS
+ if(NOT MK_PTHREAD_TLS)
+   check_c_source_compiles("
++     #include <sys/types.h>
++     extern void *__tls_get_addr(size_t *v);
+      __thread int a;
+      int main() {
+          __tls_get_addr(0);
+-- 
+2.37.1
+
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.6.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.6.bb
index f98d416b24..77fed7fcfb 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.6.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.6.bb
@@ -16,12 +16,18 @@ SRC_URI = "https://releases.fluentbit.io/1.9/source-${PV}.tar.gz;subdir=fluent-b
            file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch \
            file://0003-mbedtls-Do-not-overwrite-CFLAGS.patch \
            file://0004-build-Make-systemd-init-systemd-detection-contingent.patch \
+           file://0001-monkey-Define-_GNU_SOURCE-for-memmem-API-check.patch \
+           file://0002-mbedtls-Remove-unused-variable.patch \
+           file://0003-mbedtls-Disable-documentation-warning-as-error-with-.patch \
+           file://0004-Use-correct-type-to-store-return-from-flb_kv_item_cr.patch \
+           file://0005-stackdriver-Fix-return-type-mismatch.patch \
+           file://0006-monkey-Fix-TLS-detection-testcase.patch \
            "
 SRC_URI[sha256sum] = "5ef7dd97e10936269fe5f4e5d3ebf16559333066f7d6757ba12464a9d6186570"
 
 S = "${WORKDIR}/fluent-bit-${PV}"
 
-DEPENDS = "zlib bison-native flex-native openssl"
+DEPENDS = "zlib bison-native flex-native"
 DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
 PACKAGECONFIG[yaml] = "-DFLB_CONFIG_YAML=On,-DFLB_CONFIG_YAML=Off,libyaml"
@@ -61,6 +67,9 @@ EXTRA_OECMAKE += "-DFLB_SHARED_LIB=Off"
 # Enable systemd iff systemd is in DISTRO_FEATURES
 EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES','systemd','-DFLB_SYSTEMD=On','-DFLB_SYSTEMD=Off',d)}"
 
+# Enable release builds
+EXTRA_OECMAKE += "-DFLB_RELEASE=On"
+
 EXTRA_OECMAKE:append:riscv64 = " -DFLB_DEPS='atomic'"
 EXTRA_OECMAKE:append:riscv32 = " -DFLB_DEPS='atomic'"
 
-- 
2.37.1


