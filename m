Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707F5C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 09:26:11 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.4099.1659432369630070208
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 02:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CVWqcV7F;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: ptsneves@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id x39so11515272lfu.7
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 02:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D7aoziwvX8vAyL4Y97puwsu89hBbzxt1Ldiwr9E0Ves=;
        b=CVWqcV7FXlYIcAWA99Xw/GFwfoNUIijbGWV51bmhpDJq+h2gfVpvsY6D1xN/dCWy0H
         4uQjt06VhjEsq6UzB6hyqEv727owgfjw24OYRr7v8/TWA9DT/TvKBDg++Y2XoFXJGcqy
         3cCTXKS4N1RkN6kLkkJo/o/SZWoM+ZfgMS9HBT9bX6839vvqbLWT8/2f0uuLmdVOUGYf
         QRfxV/rJbGyKQ68qkfY/a14QpQZ/LJLyNvpuJSwhSBsdNF6d0zPX6kvISNwZo21uDtpQ
         BR2yx4084OiDuXQn8BbLhvIIs8j0tJKC9nwWYHr5hzacow2YsgdQClQxgFAaw/OP+w7C
         mSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D7aoziwvX8vAyL4Y97puwsu89hBbzxt1Ldiwr9E0Ves=;
        b=4EtJmPvNnG56ZB+DV7Vq4X58himChVIAWN4FCVwy5J526L9mbOTQZIqU0NUZJCbsDD
         Zg5lBcpa/oehno27J5NEJu2DkRcbPmtgPE2NqISAxPv0FFzW4CydyVSpGz6srzHtOxg1
         V7hZnujUYqWg7xvQYpfEm8vYDuY16fmqPuJySqyaoweFdccq7lFS9jPW3Z0y6mmkPx1n
         aFoQi6iuW+tYqCkRA5RwCSWvW0mg1mw97yG+O2ikiCosmOFkO8KE0FTwo01CBZ6+pKhD
         K2SZKv4Qtah32UnDINCxGICSwRzZwW5GaHN1+PGNMy24SwzZPVjPmqV7X6rGl05fvO90
         SPYQ==
X-Gm-Message-State: AJIora+U41AL503K91X+GKOZ2MYAepVNcqM54zwZyoetZGUrPu6hWntz
	45HYgJOnCakvEFaG1/700vdQyRNAsw==
X-Google-Smtp-Source: 
 AGRyM1t36InbTZbH4Z+cks9rcsIOK2XXrQwLEsGr/DRj2PUOCHZQs0UX1XAiU4blMXy4OjM46+p28Q==
X-Received: by 2002:a05:6512:3d01:b0:48a:9e41:b45e with SMTP id
 d1-20020a0565123d0100b0048a9e41b45emr6729468lfv.282.1659432367503;
        Tue, 02 Aug 2022 02:26:07 -0700 (PDT)
Received: from localhost.localdomain
 (031011128142.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.142])
        by smtp.gmail.com with ESMTPSA id
 b13-20020a056512070d00b00489c8c6c055sm2042953lfs.50.2022.08.02.02.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 02:26:06 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [oe][meta-oe][PATCH v2 1/1] fluentbit Upgrade to 1.3.5 -> 1.9.6
Date: Tue,  2 Aug 2022 11:26:00 +0200
Message-Id: <20220802092600.1138225-1-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 09:26:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98079

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 ...t-Do-not-use-private-makefile-target.patch | 71 ++++++++++++++++
 ...nit-install-location-with-SYSTEM_DIR.patch | 28 -------
 ...caused-by-using-flb_free-instead-of-.patch | 43 ----------
 ...-ppc-Fix-signature-for-co_create-API.patch | 38 ---------
 ...-not-hardcode-compilation-directorie.patch | 26 ++++++
 ...GV-caused-by-using-flb_free-instead-.patch | 82 -------------------
 ...0003-mbedtls-Do-not-overwrite-CFLAGS.patch | 28 +++++++
 ...md-init-systemd-detection-contingent.patch | 64 +++++++++++++++
 .../fluentbit/fluentbit/builtin-nan.patch     | 27 ------
 .../cross-build-init-system-detection.patch   | 38 ---------
 .../fluentbit/fluentbit_1.3.5.bb              | 69 ----------------
 .../fluentbit/fluentbit_1.9.6.bb              | 72 ++++++++++++++++
 12 files changed, 261 insertions(+), 325 deletions(-)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Do-not-use-private-makefile-target.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-bin-fix-SIGSEGV-caused-by-using-flb_free-instead-of-.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-ppc-Fix-signature-for-co_create-API.patch
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-instead-.patch
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0004-build-Make-systemd-init-systemd-detection-contingent.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/builtin-nan.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/cross-build-init-system-detection.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit_1.9.6.bb

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Do-not-use-private-makefile-target.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Do-not-use-private-makefile-target.patch
new file mode 100644
index 000000000..b4634a244
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Do-not-use-private-makefile-target.patch
@@ -0,0 +1,71 @@
+From 6a704ab7bf69cd5d6970b3a7d3ae7798b26027c1 Mon Sep 17 00:00:00 2001
+From: Paulo Neves <ptsneves@gmail.com>
+Date: Thu, 28 Jul 2022 11:28:41 +0200
+Subject: [PATCH] CMakeLists.txt Do not use private makefile $< target
+
+$< is a private detail from the Makefile generated by CMakefile and
+are not under control or to be used at the CMakeLists level. In 3.20
+that private generation changed pre-requisite targets[1] and now logs
+contain the path compiler_depend.ts instead of the actual file.
+
+Upstream status: Pending [1]
+[1] https://github.com/fluent/fluent-bit/issues/5492
+---
+ CMakeLists.txt              | 6 +-----
+ lib/chunkio/CMakeLists.txt  | 7 +------
+ lib/cmetrics/CMakeLists.txt | 7 +------
+ 3 files changed, 3 insertions(+), 17 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 3dba5a8..d94b988 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -46,11 +46,7 @@ else()
+   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
+ endif()
+ 
+-if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
+-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__='\"$(subst ${CMAKE_SOURCE_DIR}/,,$(abspath $<))\"'")
+-else()
+-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
+-endif()
++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
+ 
+ if(${CMAKE_SYSTEM_PROCESSOR} MATCHES "armv7l")
+   set(CMAKE_C_LINK_FLAGS "${CMAKE_C_LINK_FLAGS} -latomic")
+diff --git a/lib/chunkio/CMakeLists.txt b/lib/chunkio/CMakeLists.txt
+index bbe1f39..809ea93 100644
+--- a/lib/chunkio/CMakeLists.txt
++++ b/lib/chunkio/CMakeLists.txt
+@@ -14,12 +14,7 @@ else()
+   set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall ")
+ endif()
+ 
+-# Set __FILENAME__
+-if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
+-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__='\"$(subst ${CMAKE_SOURCE_DIR}/,,$(abspath $<))\"'")
+-else()
+-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
+-endif()
++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
+ 
+ include(cmake/macros.cmake)
+ 
+diff --git a/lib/cmetrics/CMakeLists.txt b/lib/cmetrics/CMakeLists.txt
+index 60e8774..e3d6149 100644
+--- a/lib/cmetrics/CMakeLists.txt
++++ b/lib/cmetrics/CMakeLists.txt
+@@ -34,12 +34,7 @@ set(CMT_VERSION_MINOR  3)
+ set(CMT_VERSION_PATCH  5)
+ set(CMT_VERSION_STR "${CMT_VERSION_MAJOR}.${CMT_VERSION_MINOR}.${CMT_VERSION_PATCH}")
+ 
+-# Define __FILENAME__ consistently across Operating Systems
+-if(NOT ${CMAKE_SYSTEM_NAME} MATCHES "Windows")
+-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__='\"$(subst ${CMAKE_SOURCE_DIR}/,,$(abspath $<))\"'")
+-else()
+-  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
+-endif()
++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D__FILENAME__=__FILE__")
+ 
+ # Configuration options
+ option(CMT_DEV             "Enable development mode"                   No)
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch
deleted file mode 100644
index bf4cda08f..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 5571f949fa2048b79c197b5b10a11ecb1891cbe9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 23 Apr 2022 08:24:34 -0700
-Subject: [PATCH] Control sytemd unit install location with SYSTEM_DIR
-
-This helps building when usrmerge is on
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/CMakeLists.txt | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -323,7 +323,11 @@ if(FLB_BINARY)
-       "${PROJECT_SOURCE_DIR}/init/systemd.in"
-       ${FLB_SYSTEMD_SCRIPT}
-       )
--    install(FILES ${FLB_SYSTEMD_SCRIPT} DESTINATION /lib/systemd/system)
-+    if(SYSTEMD_DIR)
-+        install(FILES ${FLB_SYSTEMD_SCRIPT} DESTINATION ${SYSTEMD_DIR})
-+    else()
-+        install(FILES ${FLB_SYSTEMD_SCRIPT} DESTINATION /lib/systemd/system)
-+    endif()
-     install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR})
-   elseif(FLB_UPSTART)
-     set(FLB_UPSTART_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.conf")
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-bin-fix-SIGSEGV-caused-by-using-flb_free-instead-of-.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-bin-fix-SIGSEGV-caused-by-using-flb_free-instead-of-.patch
deleted file mode 100644
index a6ff5991c..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-bin-fix-SIGSEGV-caused-by-using-flb_free-instead-of-.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 3d7390c89c2205d1eed0384be0bb65adb675e60d Mon Sep 17 00:00:00 2001
-From: Ramon Fried <ramon@neureality.ai>
-Date: Tue, 9 Feb 2021 18:59:59 +0200
-Subject: [PATCH] bin: fix SIGSEGV caused by using flb_free instead of
- mk_mem_free
-
-Upstream-Status: Accepted
-Signed-off-by: Ramon Fried <ramon@neureality.ai>
----
- src/fluent-bit.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/fluent-bit.c b/src/fluent-bit.c
-index c0c73b4..989cfde 100644
---- a/src/fluent-bit.c
-+++ b/src/fluent-bit.c
-@@ -289,7 +289,7 @@ static int input_set_property(struct flb_input_instance *in, char *kv)
-                 in->p->name, key);
-     }
- 
--    flb_free(key);
-+    mk_mem_free(key);
-     return ret;
- }
- 
-@@ -314,7 +314,7 @@ static int output_set_property(struct flb_output_instance *out, char *kv)
-     }
- 
-     ret = flb_output_set_property(out, key, value);
--    flb_free(key);
-+    mk_mem_free(key);
-     return ret;
- }
- 
-@@ -340,7 +340,7 @@ static int filter_set_property(struct flb_filter_instance *filter, char *kv)
-     }
- 
-     ret = flb_filter_set_property(filter, key, value);
--    flb_free(key);
-+    mk_mem_free(key);
-     return ret;
- }
- 
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-ppc-Fix-signature-for-co_create-API.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-ppc-Fix-signature-for-co_create-API.patch
deleted file mode 100644
index 1f36c657e..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-ppc-Fix-signature-for-co_create-API.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From be4032079c931704f52e29f5da5c01cde24ac842 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 16 Jan 2020 10:44:58 -0800
-Subject: [PATCH] ppc: Fix signature for co_create API
-
-Upstream-Status: Submitted [https://github.com/fluent/fluent-bit/pull/1886]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/flb_libco/ppc.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/lib/flb_libco/ppc.c b/lib/flb_libco/ppc.c
-index e6536d56..533256b3 100644
---- a/lib/flb_libco/ppc.c
-+++ b/lib/flb_libco/ppc.c
-@@ -279,7 +279,9 @@ static uint32_t* co_create_(unsigned size, uintptr_t entry) {
-   return t;
- }
- 
--cothread_t co_create(unsigned int size, void (*entry_)(void)) {
-+cothread_t co_create(unsigned int size, void (*entry_)(void),
-+                     size_t *out_size) {
-+
-   uintptr_t entry = (uintptr_t)entry_;
-   uint32_t* t = 0;
- 
-@@ -325,7 +327,7 @@ cothread_t co_create(unsigned int size, void (*entry_)(void)) {
-     t[10] = (uint32_t)(sp >> shift >> shift);
-     t[11] = (uint32_t)sp;
-   }
--
-+  *out_size = size;
-   return t;
- }
- 
--- 
-2.25.0
-
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch
new file mode 100644
index 000000000..4358b2a51
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch
@@ -0,0 +1,26 @@
+From 71dab751a27a2e582b711de22873065dd28f4b65 Mon Sep 17 00:00:00 2001
+From: Paulo Neves <ptsneves@gmail.com>
+Date: Thu, 28 Jul 2022 11:42:31 +0200
+Subject: [PATCH] flb_info.h.in: Do not hardcode compilation directories
+
+Including the source dir in the header makes the header not
+reproducible and contaminates it with host builder paths. Instead
+make it take CMAKE_DEBUG_SRCDIR that can be set to a known
+reproducible value
+---
+ include/fluent-bit/flb_info.h.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/fluent-bit/flb_info.h.in b/include/fluent-bit/flb_info.h.in
+index a89485c..2579afc 100644
+--- a/include/fluent-bit/flb_info.h.in
++++ b/include/fluent-bit/flb_info.h.in
+@@ -23,7 +23,7 @@
+ #define STR_HELPER(s)      #s
+ #define STR(s)             STR_HELPER(s)
+ 
+-#define FLB_SOURCE_DIR "@CMAKE_SOURCE_DIR@"
++#define FLB_SOURCE_DIR "@CMAKE_DEBUG_SRCDIR@"
+ 
+ /* General flags set by CMakeLists.txt */
+ @FLB_BUILD_FLAGS@
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-instead-.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-instead-.patch
deleted file mode 100644
index 91675dfc6..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-instead-.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 7c3b1dfb174312594d3317c24ed71c60398f653f Mon Sep 17 00:00:00 2001
-From: Ramon Fried <ramon@neureality.ai>
-Date: Wed, 10 Feb 2021 04:23:36 +0200
-Subject: [PATCH] parser: Fix SIGSEGV caused by using flb_free instead of
- mk_mem_free
-
-Upstream-Status: Backport (fix only for 1.3.5)
-Signed-off-by: Ramon Fried <ramon@neureality.ai>
----
- src/flb_parser.c | 28 ++++++++++++++--------------
- 1 file changed, 14 insertions(+), 14 deletions(-)
-
-diff --git a/src/flb_parser.c b/src/flb_parser.c
-index d35c568..7c20e12 100644
---- a/src/flb_parser.c
-+++ b/src/flb_parser.c
-@@ -490,7 +490,7 @@ int flb_parser_conf_file(const char *file, struct flb_config *config)
-                                        MK_RCONF_STR);
-         if (str) {
-             time_keep = flb_utils_bool(str);
--            flb_free(str);
-+            mk_mem_free(str);
-         }
-         else {
-             time_keep = FLB_FALSE;
-@@ -522,23 +522,23 @@ int flb_parser_conf_file(const char *file, struct flb_config *config)
- 
-         flb_debug("[parser] new parser registered: %s", name);
- 
--        flb_free(name);
--        flb_free(format);
-+        mk_mem_free(name);
-+        mk_mem_free(format);
- 
-         if (regex) {
--            flb_free(regex);
-+            mk_mem_free(regex);
-         }
-         if (time_fmt) {
--            flb_free(time_fmt);
-+            mk_mem_free(time_fmt);
-         }
-         if (time_key) {
--            flb_free(time_key);
-+            mk_mem_free(time_key);
-         }
-         if (time_offset) {
--            flb_free(time_offset);
-+            mk_mem_free(time_offset);
-         }
-         if (types_str) {
--            flb_free(types_str);
-+            mk_mem_free(types_str);
-         }
- 
-         decoders = NULL;
-@@ -548,19 +548,19 @@ int flb_parser_conf_file(const char *file, struct flb_config *config)
-     return 0;
- 
-  fconf_error:
--    flb_free(name);
--    flb_free(format);
-+    mk_mem_free(name);
-+    mk_mem_free(format);
-     if (regex) {
--        flb_free(regex);
-+        mk_mem_free(regex);
-     }
-     if (time_fmt) {
--        flb_free(time_fmt);
-+        mk_mem_free(time_fmt);
-     }
-     if (time_key) {
--        flb_free(time_key);
-+        mk_mem_free(time_key);
-     }
-     if (types_str) {
--        flb_free(types_str);
-+        mk_mem_free(types_str);
-     }
-     if (decoders) {
-         flb_parser_decoder_list_destroy(decoders);
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch
new file mode 100644
index 000000000..a7d7dc889
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch
@@ -0,0 +1,28 @@
+From 8486b912281ae85db0c9fc05bb546f16872e114c Mon Sep 17 00:00:00 2001
+From: Paulo Neves <ptsneves@gmail.com>
+Date: Thu, 28 Jul 2022 14:37:18 +0200
+Subject: [PATCH] mbedtls: Do not overwrite CFLAGS
+
+bitbake passes CFLAGS that are often in conflict with the ones set
+in mbedtls' CMakeLists.txt. Such conflicts are the inability to use
+FORTIFY_SOURCE=2 except in release mode
+
+Upstream status: Innapropriate due to fluent-bit having it's own Release
+flags that also overwrite bitbake ones.
+---
+ lib/mbedtls-2.28.0/CMakeLists.txt | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/lib/mbedtls-2.28.0/CMakeLists.txt b/lib/mbedtls-2.28.0/CMakeLists.txt
+index d76bddc..e717846 100644
+--- a/lib/mbedtls-2.28.0/CMakeLists.txt
++++ b/lib/mbedtls-2.28.0/CMakeLists.txt
+@@ -204,8 +204,6 @@ if(CMAKE_COMPILER_IS_GNU)
+     if (GCC_VERSION VERSION_GREATER 7.0 OR GCC_VERSION VERSION_EQUAL 7.0)
+       set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wformat-overflow=2 -Wformat-truncation")
+     endif()
+-    set(CMAKE_C_FLAGS_RELEASE     "-O2")
+-    set(CMAKE_C_FLAGS_DEBUG       "-O0 -g3")
+     set(CMAKE_C_FLAGS_COVERAGE    "-O0 -g3 --coverage")
+     set(CMAKE_C_FLAGS_ASAN        "-fsanitize=address -fno-common -fsanitize=undefined -fno-sanitize-recover=all -O3")
+     set(CMAKE_C_FLAGS_ASANDBG     "-fsanitize=address -fno-common -fsanitize=undefined -fno-sanitize-recover=all -O1 -g3 -fno-omit-frame-pointer -fno-optimize-sibling-calls")
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0004-build-Make-systemd-init-systemd-detection-contingent.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0004-build-Make-systemd-init-systemd-detection-contingent.patch
new file mode 100644
index 000000000..9d4d950d1
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0004-build-Make-systemd-init-systemd-detection-contingent.patch
@@ -0,0 +1,64 @@
+From 7a792624925d46690c1f07fe4b194b5f4c510db6 Mon Sep 17 00:00:00 2001
+From: Paulo Neves <ptsneves@gmail.com>
+Date: Tue, 2 Aug 2022 09:57:05 +0200
+Subject: [PATCH 1/1] build: Make systemd init systemd detection contingent on
+ pkgconfig
+
+Use pkg-config to get systemd.pc variables and systemdunitdir. Those
+variable ensure that .service files are installed in the correct paths
+and only when systemd is detected.
+
+Upstream Status: Pending [1]
+[1] https://github.com/fluent/fluent-bit/pull/5818
+
+---
+ cmake/FindJournald.cmake | 4 ++++
+ src/CMakeLists.txt       | 4 ++--
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/cmake/FindJournald.cmake b/cmake/FindJournald.cmake
+index f5a3a832b..9e6657a29 100644
+--- a/cmake/FindJournald.cmake
++++ b/cmake/FindJournald.cmake
+@@ -5,6 +5,8 @@
+ #  JOURNALD_INCLUDE_DIR - the Journald include directory
+ #  JOURNALD_LIBRARIES - Link these to use Journald
+ #  JOURNALD_DEFINITIONS - Compiler switches required for using Journald
++#  SYSTEMD_UNITDIR - The systemd units' directory
++#
+ # Redistribution and use is allowed according to the terms of the BSD license.
+ # For details see the accompanying COPYING-CMAKE-SCRIPTS file.
+ #
+@@ -16,7 +18,9 @@
+ # in the FIND_PATH() and FIND_LIBRARY() calls
+ find_package(PkgConfig)
+ pkg_check_modules(PC_JOURNALD QUIET systemd)
++pkg_get_variable(PC_SYSTEMD_UNITDIR systemd "systemdsystemunitdir")
+ 
++set(SYSTEMD_UNITDIR ${PC_SYSTEMD_UNITDIR})
+ set(JOURNALD_FOUND ${PC_JOURNALD_FOUND})
+ set(JOURNALD_DEFINITIONS ${PC_JOURNALD_CFLAGS_OTHER})
+ 
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 522bbf9bd..30743d8d6 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -480,13 +480,13 @@ if(FLB_BINARY)
+   endif()
+ 
+   # Detect init system, install upstart, systemd or init.d script
+-  if(IS_DIRECTORY /lib/systemd/system)
++  if(DEFINED SYSTEMD_UNITDIR)
+     set(FLB_SYSTEMD_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.service")
+     configure_file(
+       "${PROJECT_SOURCE_DIR}/init/systemd.in"
+       ${FLB_SYSTEMD_SCRIPT}
+       )
+-    install(FILES ${FLB_SYSTEMD_SCRIPT} COMPONENT binary DESTINATION /lib/systemd/system)
++    install(FILES ${FLB_SYSTEMD_SCRIPT} COMPONENT binary DESTINATION ${SYSTEMD_UNITDIR})
+     install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR} COMPONENT binary)
+   elseif(IS_DIRECTORY /usr/share/upstart)
+     set(FLB_UPSTART_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.conf")
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/builtin-nan.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/builtin-nan.patch
deleted file mode 100644
index 8ffc3be3e..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/builtin-nan.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-help complier to use intrinsics, clang in few cases e.g. aarch64 can not
-and then requires linking with libm, its the only function needed from libm then
-its good to avoid needing it.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/include/fluent-bit/stream_processor/flb_sp_timeseries.h
-+++ b/include/fluent-bit/stream_processor/flb_sp_timeseries.h
-@@ -207,7 +207,7 @@ void cb_forecast_calc(struct timeseries
-         result = b0 + b1 * (val->f64 + *forecast->latest_x);
-         break;
-     default:
--        result = nan("");
-+        result = __builtin_nan("");
-         break;
-     }
- 
-@@ -283,7 +283,7 @@ void cb_forecast_r_calc(struct timeserie
-             result = ((val->i64 - b0) / b1) - *forecast->latest_x;
-             break;
-         default:
--            result = nan("");
-+            result = __builtin_nan("");
-             break;
-         }
- 
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/cross-build-init-system-detection.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/cross-build-init-system-detection.patch
deleted file mode 100644
index d3822fc8d..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/cross-build-init-system-detection.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Define CMake variables to indicate init system for target
-incase of cross compile, detecting systemd support based on
-host directory structure is not right thing to do
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.kheem@gmail.com>
-
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -317,7 +317,7 @@ if(FLB_BINARY)
-   install(TARGETS fluent-bit-bin RUNTIME DESTINATION ${FLB_INSTALL_BINDIR})
- 
-   # Detect init system, install upstart, systemd or init.d script
--  if(IS_DIRECTORY /lib/systemd/system)
-+  if(FLB_SYSTEMD)
-     set(FLB_SYSTEMD_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.service")
-     configure_file(
-       "${PROJECT_SOURCE_DIR}/init/systemd.in"
-@@ -325,7 +325,7 @@ if(FLB_BINARY)
-       )
-     install(FILES ${FLB_SYSTEMD_SCRIPT} DESTINATION /lib/systemd/system)
-     install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR})
--  elseif(IS_DIRECTORY /usr/share/upstart)
-+  elseif(FLB_UPSTART)
-     set(FLB_UPSTART_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.conf")
-     configure_file(
-       "${PROJECT_SOURCE_DIR}/init/upstart.in"
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -70,6 +70,8 @@ option(FLB_RECORD_ACCESSOR    "Enable re
- option(FLB_SYSTEM_STRPTIME    "Use strptime in system libc"  Yes)
- option(FLB_STATIC_CONF        "Build binary using static configuration")
- option(FLB_STREAM_PROCESSOR   "Enable Stream Processor"      Yes)
-+option(FLB_SYSTEMD            "Enable systemd init system"   No)
-+option(FLB_UPSTART            "Enable upstart init system"   No)
- option(FLB_CORO_STACK_SIZE    "Set coroutine stack size")
- 
- # Metrics: Experimental Feature, disabled by default on 0.12 series
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
deleted file mode 100644
index b231cc287..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
+++ /dev/null
@@ -1,69 +0,0 @@
-SUMMARY = "Fast Log processor and Forwarder"
-DESCRIPTION = "Fluent Bit is a data collector, processor and  \
-forwarder for Linux. It supports several input sources and \
-backends (destinations) for your data. \
-"
-
-HOMEPAGE = "http://fluentbit.io"
-BUGTRACKER = "https://github.com/fluent/fluent-bit/issues"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
-SECTION = "net"
-
-SRC_URI = "http://fluentbit.io/releases/1.3/fluent-bit-${PV}.tar.gz \
-           file://jemalloc.patch \
-           file://cross-build-init-system-detection.patch \
-           file://builtin-nan.patch \
-           file://0001-ppc-Fix-signature-for-co_create-API.patch \
-           file://0001-bin-fix-SIGSEGV-caused-by-using-flb_free-instead-of-.patch \
-           file://0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-instead-.patch \
-           file://0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch \
-           "
-SRC_URI[md5sum] = "6eae6dfd0a874e5dd270c36e9c68f747"
-SRC_URI[sha256sum] = "e037c76c89269c8dc4027a08e442fefd2751b0f1e0f9c38f9a4b12d781a9c789"
-
-S = "${WORKDIR}/fluent-bit-${PV}"
-DEPENDS = "zlib bison-native flex-native"
-DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-
-DEPENDS:append:libc-musl = " fts "
-
-INSANE_SKIP:${PN}-dev += "dev-elf"
-
-LTO = ""
-
-# Use CMake 'Unix Makefiles' generator
-OECMAKE_GENERATOR ?= "Unix Makefiles"
-
-# Fluent Bit build options
-# ========================
-
-# Host related setup
-EXTRA_OECMAKE += "-DGNU_HOST=${HOST_SYS} -DFLB_ALL=ON -DFLB_TD=1"
-
-# Disable LuaJIT and filter_lua support
-EXTRA_OECMAKE += "-DFLB_LUAJIT=Off -DFLB_FILTER_LUA=Off "
-
-# Disable Library and examples
-EXTRA_OECMAKE += "-DFLB_SHARED_LIB=Off -DFLB_EXAMPLES=Off "
-
-# Enable systemd iff systemd is in DISTRO_FEATURES
-EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES','systemd','-DFLB_SYSTEMD=On -DSYSTEMD_DIR=${systemd_system_unitdir}','-DFLB_SYSTEMD=Off',d)}"
-
-EXTRA_OECMAKE:append:riscv64 = " -DFLB_DEPS='atomic'"
-EXTRA_OECMAKE:append:riscv32 = " -DFLB_DEPS='atomic'"
-
-# Kafka Output plugin (disabled by default): note that when
-# enabling Kafka output plugin, the backend library librdkafka
-# requires 'openssl' as a dependency.
-#
-# DEPENDS += "openssl "
-# EXTRA_OECMAKE += "-DFLB_OUT_KAFKA=On "
-
-inherit cmake systemd
-
-CFLAGS += "-fcommon"
-
-SYSTEMD_SERVICE:${PN} = "td-agent-bit.service"
-TARGET_CC_ARCH:append = " ${SELECTED_OPTIMIZATION}"
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.6.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.6.bb
new file mode 100644
index 000000000..f98d416b2
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.6.bb
@@ -0,0 +1,72 @@
+SUMMARY = "Fast Log processor and Forwarder"
+DESCRIPTION = "Fluent Bit is a data collector, processor and  \
+forwarder for Linux. It supports several input sources and \
+backends (destinations) for your data. \
+"
+
+HOMEPAGE = "http://fluentbit.io"
+BUGTRACKER = "https://github.com/fluent/fluent-bit/issues"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+SECTION = "net"
+
+SRC_URI = "https://releases.fluentbit.io/1.9/source-${PV}.tar.gz;subdir=fluent-bit-${PV} \
+           file://0001-CMakeLists.txt-Do-not-use-private-makefile-target.patch \
+           file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch \
+           file://0003-mbedtls-Do-not-overwrite-CFLAGS.patch \
+           file://0004-build-Make-systemd-init-systemd-detection-contingent.patch \
+           "
+SRC_URI[sha256sum] = "5ef7dd97e10936269fe5f4e5d3ebf16559333066f7d6757ba12464a9d6186570"
+
+S = "${WORKDIR}/fluent-bit-${PV}"
+
+DEPENDS = "zlib bison-native flex-native openssl"
+DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+
+PACKAGECONFIG[yaml] = "-DFLB_CONFIG_YAML=On,-DFLB_CONFIG_YAML=Off,libyaml"
+PACKAGECONFIG[kafka] = "-DFLB_OUT_KAFKA=On,-DFLB_OUT_KAFKA=Off,librdkafka"
+PACKAGECONFIG[examples] = "-DFLB_EXAMPLES=On,-DFLB_EXAMPLES=Off"
+PACKAGECONFIG[jemalloc] = "-DFLB_JEMALLOC=On,-DFLB_JEMALLOC=Off,jemalloc"
+#TODO add more fluentbit options to PACKAGECONFIG[]
+
+DEPENDS:append:libc-musl = " fts "
+
+# flex hardcodes the input file in #line directives leading to TMPDIR contamination of debug sources.
+do_compile:append() {
+    find ${B} -name '*.c' -or -name '*.h' | xargs sed -i -e 's|${TMPDIR}|/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/|g'
+}
+
+FLB_JEMALLOC_OPTIONS_LIST = "--with-jemalloc-prefix=je_ --with-lg-quantum=3"
+
+PACKAGECONFIG ?= "yaml"
+
+LTO = ""
+
+# Use CMake 'Unix Makefiles' generator
+OECMAKE_GENERATOR ?= "Unix Makefiles"
+
+# Fluent Bit build options
+# ========================
+
+# Host related setup
+EXTRA_OECMAKE += "-DGNU_HOST=${HOST_SYS} -DFLB_TD=1"
+
+# Disable LuaJIT and filter_lua support
+EXTRA_OECMAKE += "-DFLB_LUAJIT=Off -DFLB_FILTER_LUA=Off "
+
+# Disable Library and examples
+EXTRA_OECMAKE += "-DFLB_SHARED_LIB=Off"
+
+# Enable systemd iff systemd is in DISTRO_FEATURES
+EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES','systemd','-DFLB_SYSTEMD=On','-DFLB_SYSTEMD=Off',d)}"
+
+EXTRA_OECMAKE:append:riscv64 = " -DFLB_DEPS='atomic'"
+EXTRA_OECMAKE:append:riscv32 = " -DFLB_DEPS='atomic'"
+
+inherit cmake systemd pkgconfig
+
+SYSTEMD_SERVICE:${PN} = "td-agent-bit.service"
+
+EXTRA_OECMAKE += "-DCMAKE_DEBUG_SRCDIR=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/"
+TARGET_CC_ARCH += " ${SELECTED_OPTIMIZATION}"
-- 
2.25.1


