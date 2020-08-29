Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.2382.1598660361005604974
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2020 17:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GedO3dF1;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id z15so398685plo.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2020 17:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pnJ+DrMP5iDKduTuLWoSMZsYOhqRTcduBa+dhT4Zf0I=;
        b=GedO3dF1JI36zTKn+D8hB2YEby9JdTb9DlCv56ZVdHGrU39F8Jo783kdLFAynimegc
         IidWZ8zGi61ppLMjF+Da76azgYQrK7ALP+Lyjp+BMqPqAirGdhqqD7HuR8sQ28T3FFeP
         wUZcbmRNpJaNKGSAh7OEeG2+2glDn8GOHpXz6wANn2TIwe2LIp7YWSCqtLLBUY4DUvQd
         12jiyV/3Vy3skxaiE+rTkY8QJ3gJJ7mpuDD6J/8BPNMPmxY/NXAMuS0+2XbaLRYhOq1i
         HCAc/gPwXfnMiooA28QhtVkNO6VGLJZTGWHAwX3C4lNpAbTnaI1uBHEjTt9WrDMXuCIz
         yutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pnJ+DrMP5iDKduTuLWoSMZsYOhqRTcduBa+dhT4Zf0I=;
        b=ZmzCCr9sXaUv5/eznanKqSbvvuBmN+3c7IZjD/9gz9dGJlb8Ltcu8eJVWLKWVz/1ge
         lNuirRWwIW4tuW2mnmX/ngNTImifA/4i20aDT4xsoWMxj9Qkjzt3vaGyelpjBPVVAGb7
         55A7d2YKJVmUtjewhzSo0FsQk9Djy8IIQ0Y55syiADCy5W5ENjdrk+H1NypWcYvd0sMt
         8lY2IhpCq+0qS1p+uWd/dWSZcctpdz8IxBzjY0Mq0WLzGlKFw2W4DiOt36GpTeUy3YMM
         cL1v1XlgJmheDFjjevL+Ij+8UlHXiIvxI2GGl+0Jyc8chN7amkHG6h+qFaIwJ6jQDLhf
         AN3w==
X-Gm-Message-State: AOAM530ammsPKmH5+wqz071lwuOOf0OPivfGtcBWisHZH/etxnKAPueY
	5Dl9I3a506MavUXPhOTteiIRtHmPBy9ctw==
X-Google-Smtp-Source: ABdhPJzRgJ2ZABEnYROzNQmiSkabeUW9F3dhshBRSaH9xtITEhySkHN58KG/GZ8y+eD5bg5h6MxrAQ==
X-Received: by 2002:a17:90a:2bc8:: with SMTP id n8mr1188494pje.189.1598660359817;
        Fri, 28 Aug 2020 17:19:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4fbd])
        by smtp.gmail.com with ESMTPSA id v10sm561431pff.192.2020.08.28.17.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 17:19:18 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v3] nss: Upgrade to 3.56
Date: Fri, 28 Aug 2020 17:19:16 -0700
Message-Id: <20200829001916.1598276-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Forward port 0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Update armv8 hw crypto patch to work on arm32
v3: Check for compiler passed define instead of Makefile/env one

 ...figure-option-to-disable-ARM-HW-cryp.patch | 33 +++++++------------
 .../nss/{nss_3.54.bb => nss_3.56.bb}          |  3 +-
 2 files changed, 12 insertions(+), 24 deletions(-)
 rename meta-oe/recipes-support/nss/{nss_3.54.bb => nss_3.56.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
index 1a87a0577f..bfc375e83a 100644
--- a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
+++ b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
@@ -14,21 +14,18 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  nss/lib/freebl/gcm.c    | 2 ++
  2 files changed, 6 insertions(+)
 
-diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
-index f99f769..b0ec81b 100644
 --- a/nss/lib/freebl/Makefile
 +++ b/nss/lib/freebl/Makefile
-@@ -125,6 +125,9 @@ else
-         DEFINES += -DNSS_X86
+@@ -126,6 +126,8 @@ else
  endif
  endif
-+
+ ifdef NS_USE_GCC
 +ifdef NSS_USE_ARM_HW_CRYPTO
 +    DEFINES += -DNSS_USE_ARM_HW_CRYPTO
  ifeq ($(CPU_ARCH),aarch64)
-     DEFINES += -DUSE_HW_AES -DUSE_HW_SHA2
-     EXTRA_SRCS += aes-armv8.c gcm-aarch64.c sha256-armv8.c
-@@ -148,6 +151,7 @@ endif
+     DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
+     EXTRA_SRCS += aes-armv8.c gcm-aarch64.c sha1-armv8.c sha256-armv8.c
+@@ -150,6 +152,7 @@ endif
          endif
      endif
  endif
@@ -36,23 +33,15 @@ index f99f769..b0ec81b 100644
  
  ifeq ($(OS_TARGET),OSF1)
      DEFINES += -DMP_ASSEMBLY_MULTIPLY -DMP_NO_MP_WORD
-diff --git a/nss/lib/freebl/gcm.c b/nss/lib/freebl/gcm.c
-index c2cc18d..b77f573 100644
 --- a/nss/lib/freebl/gcm.c
 +++ b/nss/lib/freebl/gcm.c
-@@ -18,6 +18,7 @@
- 
- #include <limits.h>
- 
-+#ifdef NSS_USE_ARM_HW_CRYPTO
+@@ -21,7 +21,9 @@
  /* old gcc doesn't support some poly64x2_t intrinsic */
  #if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && \
      (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
-@@ -27,6 +28,7 @@
- /* We don't test on big endian platform, so disable this on big endian. */
++# ifdef NSS_USE_ARM_HW_CRYPTO
  #define USE_ARM_GCM
- #endif
-+#endif
- 
- /* Forward declarations */
- SECStatus gcm_HashInit_hw(gcmHashContext *ghash);
++# endif
+ #elif defined(__arm__) && defined(IS_LITTLE_ENDIAN) && \
+     !defined(NSS_DISABLE_ARM32_NEON)
+ /* We don't test on big endian platform, so disable this on big endian. */
diff --git a/meta-oe/recipes-support/nss/nss_3.54.bb b/meta-oe/recipes-support/nss/nss_3.56.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.54.bb
rename to meta-oe/recipes-support/nss/nss_3.56.bb
index 1cc94735bb..4aa5d29ec2 100644
--- a/meta-oe/recipes-support/nss/nss_3.54.bb
+++ b/meta-oe/recipes-support/nss/nss_3.56.bb
@@ -34,8 +34,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            file://0001-pkix-Do-not-use-NULL-where-0-is-needed.patch \
            "
-
-SRC_URI[sha256sum] = "dab18bbfcf5e347934cda664df75ce9fd912a5772686c40d3c805e53c08d6e43"
+SRC_URI[sha256sum] = "f875e0e8ed3b5ce92d675be4a55aa25a8c1199789a4a01f69b5f2327e2048e9c"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.28.0

