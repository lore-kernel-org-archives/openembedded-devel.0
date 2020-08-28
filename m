Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web12.34344.1598580255384020805
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 19:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eNr+rtRl;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id k15so4962133pfc.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2020 19:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J5E54N8/D6bndnZUyq4Pbe5BEArzQlIQdsP+B5qeVLo=;
        b=eNr+rtRl7Y4OUJ2qYLiF1y+U6ydp0H7tdVNw7Wn7D3lvi8xNbHS0mG1Tp7wx3CLsRo
         bh+5bdIyXdD5mOycML36THcC7dk+2K2Sc9uKg+vgfXWNPGBa2dZFWJGHqAqny2hLK6ss
         lbGJovDUhKIhdIP+VFgEi2WxfzsuMhKlaIKAfPnePT5HCaKFhEDnoPDu1mxHpxAofdOo
         UR5CSXDVdWxWWDVK440IOX27jYWj6lfQQf+GQ0+mL/uPeOhjRXNXmDSToBzpRp2qWHQC
         173eHT38HTz5VfgvFAG0VVdrdFCZizyup+5h5kwQb7xHjChmA9kjwEg4OGHDYB1NzMaM
         tuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J5E54N8/D6bndnZUyq4Pbe5BEArzQlIQdsP+B5qeVLo=;
        b=CKrpk0bW4QwifxWjKD0wlzmXYeVwb2Ek7jebnGNDIQRiNgnFK0hp7pTCuev1TSP39E
         THVttLD8ZjsM9z5lnR3cEsmtM/11FgRD9BadjGt5i1XUOIeJpUtA+ydD9eSsTjfVqQ69
         fggWpmMzDBhui57SpBnIOIlR0kiUAKzQs43i3UrbOaiu2oSsBhBysK99UqheYl7YD7aP
         +nK/Sudtj+CwqagfZO/O/moed2sYPzVOuopA2Xga79hw5pfQXD2QtNGu5teZ9oEawT5D
         oAAh+2s/QnieIq7hnQn9HD4c380dMT1kB26gypsDqDyN/6ECftNkfagWrRNXxcJsd8tO
         627g==
X-Gm-Message-State: AOAM530oit2hq1WJPttyG/9EvJllXpGl1aQWJKLNMbwrxBiX34AuJRBf
	pGF7ewjYwSarEPCiZH5sBGK5pI1Xm6c9Kg==
X-Google-Smtp-Source: ABdhPJzZMz6uj8AlkgEhwqRMt08JczJLsl8oC1yT7qI7DQniFRlNhO2KQkTQtDzVcegbIUHIchaFww==
X-Received: by 2002:a62:754f:: with SMTP id q76mr12498576pfc.284.1598580254132;
        Thu, 27 Aug 2020 19:04:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4fbd])
        by smtp.gmail.com with ESMTPSA id u25sm1196384pfn.79.2020.08.27.19.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 19:04:13 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] nss: Upgrade to 3.56
Date: Thu, 27 Aug 2020 19:04:11 -0700
Message-Id: <20200828020411.1988431-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Forward port 0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Update armv8 hw crypto patch to work on arm32

 ...figure-option-to-disable-ARM-HW-cryp.patch | 32 ++++++-------------
 .../nss/{nss_3.54.bb => nss_3.56.bb}          |  3 +-
 2 files changed, 11 insertions(+), 24 deletions(-)
 rename meta-oe/recipes-support/nss/{nss_3.54.bb => nss_3.56.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
index 1a87a0577f..f1f76bd1b7 100644
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
@@ -36,23 +33,14 @@ index f99f769..b0ec81b 100644
  
  ifeq ($(OS_TARGET),OSF1)
      DEFINES += -DMP_ASSEMBLY_MULTIPLY -DMP_NO_MP_WORD
-diff --git a/nss/lib/freebl/gcm.c b/nss/lib/freebl/gcm.c
-index c2cc18d..b77f573 100644
 --- a/nss/lib/freebl/gcm.c
 +++ b/nss/lib/freebl/gcm.c
-@@ -18,6 +18,7 @@
+@@ -20,7 +20,7 @@
  
- #include <limits.h>
- 
-+#ifdef NSS_USE_ARM_HW_CRYPTO
  /* old gcc doesn't support some poly64x2_t intrinsic */
  #if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && \
-     (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
-@@ -27,6 +28,7 @@
- /* We don't test on big endian platform, so disable this on big endian. */
+-    (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
++    (defined(__clang__) && defined(NSS_USE_ARM_HW_CRYPTO) || defined(__GNUC__) && __GNUC__ > 6)
  #define USE_ARM_GCM
- #endif
-+#endif
- 
- /* Forward declarations */
- SECStatus gcm_HashInit_hw(gcmHashContext *ghash);
+ #elif defined(__arm__) && defined(IS_LITTLE_ENDIAN) && \
+     !defined(NSS_DISABLE_ARM32_NEON)
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

