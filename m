Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web10.12564.1597383426515300822
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 22:37:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pAlPCyei;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id d188so4021252pfd.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 22:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OUhlWV1rfKI3ryaEBMXVAgkSNuixW1kUp45BKJ1U4Yc=;
        b=pAlPCyeiCgC/gc7wJTnw7w9802BFAlvJVpBpQVWx4VHYWnzGHmtG9xIS75BFtVk6TJ
         ECaKNzbteQIWkQnpu+uQCDXKUJStMwwz5x0NtdOLOPlwj3EYHh6qatWhVGjQY68ANgVV
         PLtXB0gCDOlyZNzid4jASWdjUeUvY55pSUk0BzjTRK3wMvW2WJzM8vtOoaSM554FckS3
         1u7avIi6OKfrm3z33LAqzU6cbzwZ2wIKhj8sJU4zwzrJyPprXgmCuppDptZat0Tyr/5F
         weWjaVmxKYXndCHeVZR6zEGpPCo0MxaU7PFkZmsHy2bAOOowu+1WiogK7YwVVRMjtZQS
         S9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OUhlWV1rfKI3ryaEBMXVAgkSNuixW1kUp45BKJ1U4Yc=;
        b=WFMqdu08Lpiqb3ivOu8Ot10Es8v8dW9YlVcgGSfhyMNHlOfMqkHADF67Dp9ygv+hlD
         /bU1O3EzNBKTY4FNCI23gcw4NVq0i30gram/4//Bpxt4eCVd8GMY6HvD9VtNqeooIQpF
         AziSyxCVi6DPUJ+0jQQeHr7t2WRD2yloGtKh/HEcgWUgN54LwcFID43c4PNuvpWqPamT
         Zh3wtddrb/YbT0Oao/WAJFKTmMbB5bKd/UlovMULIQHaWlLPfPkER9kbeH5+S9stivO3
         DG2jbEsVoW6bsNweK2XNGfcMcJAyUVRyyZFVvWNMI9HN2ixMJMVMOZDrLnMn5gPpBJM7
         nS3Q==
X-Gm-Message-State: AOAM532+iFR22MjJJZ1EqcsVDXaXIa9NjAY+ToGqyu7ryto8q89RZHSR
	wzvj1GjCgwt+/VSTQg31Gp355teg9UB6oA==
X-Google-Smtp-Source: ABdhPJwBbAkTmUhfk49eabrgp7TJWajVqogNoMBzRcZppa70m16s55UrQrMAjgE9Ex7ulU4NoSuGdw==
X-Received: by 2002:a62:79d7:: with SMTP id u206mr649922pfc.97.1597383425254;
        Thu, 13 Aug 2020 22:37:05 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id k21sm7013974pgl.0.2020.08.13.22.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 22:37:04 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/21] sblim-sfcb: Fix build with -fno-common
Date: Thu, 13 Aug 2020 22:36:43 -0700
Message-Id: <20200814053657.1701247-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814053657.1701247-1-raj.khem@gmail.com>
References: <20200814053657.1701247-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-variable-definition-in-header-files.patch | 100 ++++++++++++++++++
 ...d-for-error.h-when-it-does-not-exist.patch |   0
 ...tdint.h-system-header-for-UINT16_MAX.patch |   0
 ...m-sfcb-1.3.15-fix-provider-debugging.patch |   0
 .../sblim-sfcb-1.3.16-maxMsgLen.patch         |   0
 .../sblim-sfcb-1.3.16-multilib-man-cfg.patch  |   0
 ...sfcb-1.3.9-sfcbrepos-schema-location.patch |   0
 .../sblim-sfcb-1.4.5-service.patch            |   0
 ...m-sfcb-1.4.8-default-ecdh-curve-name.patch |   0
 .../sblim-sfcb-1.4.9-fix-ftbfs.patch          |   0
 .../sblim-sfcb-1.4.9-fix-sfcbinst2mof.patch   |   0
 .../{files => sblim-sfcb}/sfcb.service        |   0
 .../sblim-sfcb/sblim-sfcb_1.4.9.bb            |   1 +
 13 files changed, 101 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-Avoid-variable-definition-in-header-files.patch
 rename meta-oe/recipes-extended/sblim-sfcb/{sblim-sfcb-1.4.9 => sblim-sfcb}/0001-Replace-need-for-error.h-when-it-does-not-exist.patch (100%)
 rename meta-oe/recipes-extended/sblim-sfcb/{sblim-sfcb-1.4.9 => sblim-sfcb}/0001-include-stdint.h-system-header-for-UINT16_MAX.patch (100%)
 rename meta-oe/recipes-extended/sblim-sfcb/{sblim-sfcb-1.4.9 => sblim-sfcb}/sblim-sfcb-1.3.15-fix-provider-debugging.patch (100%)
 rename meta-oe/recipes-extended/sblim-sfcb/{sblim-sfcb-1.4.9 => sblim-sfcb}/sblim-sfcb-1.3.16-maxMsgLen.patch (100%)
 rename meta-oe/recipes-extended/sblim-sfcb/{sblim-sfcb-1.4.9 => sblim-sfcb}/sblim-sfcb-1.3.16-multilib-man-cfg.patch (100%)
 rename meta-oe/recipes-extended/sblim-sfcb/{sblim-sfcb-1.4.9 => sblim-sfcb}/sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch (100%)
 rename meta-oe/recipes-extended/sblim-sfcb/{sblim-sfcb-1.4.9 => sblim-sfcb}/sblim-sfcb-1.4.5-service.patch (100%)
 rename meta-oe/recipes-extended/sblim-sfcb/{sblim-sfcb-1.4.9 => sblim-sfcb}/sblim-sfcb-1.4.8-default-ecdh-curve-name.patch (100%)
 rename meta-oe/recipes-extended/sblim-sfcb/{sblim-sfcb-1.4.9 => sblim-sfcb}/sblim-sfcb-1.4.9-fix-ftbfs.patch (100%)
 rename meta-oe/recipes-extended/sblim-sfcb/{sblim-sfcb-1.4.9 => sblim-sfcb}/sblim-sfcb-1.4.9-fix-sfcbinst2mof.patch (100%)
 rename meta-oe/recipes-extended/sblim-sfcb/{files => sblim-sfcb}/sfcb.service (100%)

diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-Avoid-variable-definition-in-header-files.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-Avoid-variable-definition-in-header-files.patch
new file mode 100644
index 0000000000..b0b43f357c
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-Avoid-variable-definition-in-header-files.patch
@@ -0,0 +1,100 @@
+From fccbb85beb89b9ca35cac87fb553ef124a6c516b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Aug 2020 17:26:14 -0700
+Subject: [PATCH] Avoid variable definition in header files
+
+This can cause multiple definitions to be emitted into objects and link
+fail as a result with gcc-10+ since it defaults to -fno-common, patch
+moves the definitions to source files
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ control.h     | 2 +-
+ providerMgr.c | 1 +
+ providerMgr.h | 2 +-
+ sfcBroker.c   | 2 +-
+ trace.c       | 1 +
+ trace.h       | 2 +-
+ 6 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/control.h b/control.h
+index e41e4b9..5e15363 100644
+--- a/control.h
++++ b/control.h
+@@ -28,7 +28,7 @@ int             getControlUNum(char *id, unsigned int *val);
+ int             getControlULong(char *id, unsigned long *val);
+ int             getControlNum(char *id, long *val);
+ int             getControlBool(char *id, int *val);
+-const char      * sfcBrokerStart;
++extern const char * sfcBrokerStart;
+ 
+ #endif
+ /* MODELINES */
+diff --git a/providerMgr.c b/providerMgr.c
+index c38a7d3..ff6d38d 100644
+--- a/providerMgr.c
++++ b/providerMgr.c
+@@ -53,6 +53,7 @@
+ #define SFCB_ASM(x)
+ #endif
+ 
++sigset_t mask, old_mask;
+ static pthread_mutex_t resultsocketMutex = PTHREAD_MUTEX_INITIALIZER;
+ 
+ extern CMPIBroker *Broker;
+diff --git a/providerMgr.h b/providerMgr.h
+index 3cc7745..fbbfecd 100644
+--- a/providerMgr.h
++++ b/providerMgr.h
+@@ -398,7 +398,7 @@ BinResponseHdr **invokeProviders(BinRequestContext * binCtx, int *err,
+ BinResponseHdr *invokeProvider(BinRequestContext * ctx);
+ void            freeResponseHeaders(BinResponseHdr ** resp,
+                                     BinRequestContext * ctx);
+-sigset_t mask, old_mask;
++extern sigset_t mask, old_mask;
+ 
+ #endif
+ /* MODELINES */
+diff --git a/sfcBroker.c b/sfcBroker.c
+index ca043c9..85581f5 100644
+--- a/sfcBroker.c
++++ b/sfcBroker.c
+@@ -53,7 +53,7 @@
+ #endif
+ 
+ int             sfcBrokerPid = 0;
+-
++const char     *sfcBrokerStart;
+ extern int      sfcbUseSyslog;
+ 
+ extern void     setExFlag(unsigned long f);
+diff --git a/trace.c b/trace.c
+index 438af46..23597e1 100644
+--- a/trace.c
++++ b/trace.c
+@@ -52,6 +52,7 @@ char           *processName = NULL;
+ int             providerProcess = 0;
+ int             idleThreadId = 0;
+ int             terminating = 0;
++int             colorTrace;
+ 
+ int             _sfcb_debug = 0;
+ unsigned long   _sfcb_trace_mask = 0;
+diff --git a/trace.h b/trace.h
+index 2c6d8be..ea39850 100644
+--- a/trace.h
++++ b/trace.h
+@@ -130,7 +130,7 @@ typedef struct traceId {
+ #define CYAN            6
+ #define WHITE           7
+ void            changeTextColor(int reset);
+-int             colorTrace;
++extern int      colorTrace;
+ 
+ #define MAX_MSG_SIZE 1024       /* max length of trace message */
+ 
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/0001-Replace-need-for-error.h-when-it-does-not-exist.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-Replace-need-for-error.h-when-it-does-not-exist.patch
similarity index 100%
rename from meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/0001-Replace-need-for-error.h-when-it-does-not-exist.patch
rename to meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-Replace-need-for-error.h-when-it-does-not-exist.patch
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/0001-include-stdint.h-system-header-for-UINT16_MAX.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-include-stdint.h-system-header-for-UINT16_MAX.patch
similarity index 100%
rename from meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/0001-include-stdint.h-system-header-for-UINT16_MAX.patch
rename to meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/0001-include-stdint.h-system-header-for-UINT16_MAX.patch
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.3.15-fix-provider-debugging.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.15-fix-provider-debugging.patch
similarity index 100%
rename from meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.3.15-fix-provider-debugging.patch
rename to meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.15-fix-provider-debugging.patch
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.3.16-maxMsgLen.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.16-maxMsgLen.patch
similarity index 100%
rename from meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.3.16-maxMsgLen.patch
rename to meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.16-maxMsgLen.patch
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.3.16-multilib-man-cfg.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.16-multilib-man-cfg.patch
similarity index 100%
rename from meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.3.16-multilib-man-cfg.patch
rename to meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.16-multilib-man-cfg.patch
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch
similarity index 100%
rename from meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch
rename to meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.3.9-sfcbrepos-schema-location.patch
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.4.5-service.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.4.5-service.patch
similarity index 100%
rename from meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.4.5-service.patch
rename to meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.4.5-service.patch
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.4.8-default-ecdh-curve-name.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.4.8-default-ecdh-curve-name.patch
similarity index 100%
rename from meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.4.8-default-ecdh-curve-name.patch
rename to meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.4.8-default-ecdh-curve-name.patch
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.4.9-fix-ftbfs.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.4.9-fix-ftbfs.patch
similarity index 100%
rename from meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.4.9-fix-ftbfs.patch
rename to meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.4.9-fix-ftbfs.patch
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.4.9-fix-sfcbinst2mof.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.4.9-fix-sfcbinst2mof.patch
similarity index 100%
rename from meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/sblim-sfcb-1.4.9-fix-sfcbinst2mof.patch
rename to meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sblim-sfcb-1.4.9-fix-sfcbinst2mof.patch
diff --git a/meta-oe/recipes-extended/sblim-sfcb/files/sfcb.service b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sfcb.service
similarity index 100%
rename from meta-oe/recipes-extended/sblim-sfcb/files/sfcb.service
rename to meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb/sfcb.service
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index a527f773a6..3e4ed7c03c 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://downloads.sourceforge.net/sblim/${BP}.tar.bz2 \
            file://0001-include-stdint.h-system-header-for-UINT16_MAX.patch \
            file://0001-Replace-need-for-error.h-when-it-does-not-exist.patch \
            file://sblim-sfcb-1.4.9-fix-sfcbinst2mof.patch \
+           file://0001-Avoid-variable-definition-in-header-files.patch \
 "
 
 SRC_URI[md5sum] = "28021cdabc73690a94f4f9d57254ce30"
-- 
2.28.0

