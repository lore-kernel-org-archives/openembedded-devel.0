Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
 by mx.groups.io with SMTP id smtpd.web10.10584.1603103344688649579
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 03:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.2, mailfrom: andrej.valek@siemens.com)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 09JAT2Qu000876
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2020 12:29:03 +0200
Received: from dev.vm6.ccp.siemens.com ([167.87.137.119])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id 09JAT1Ik031624;
	Mon, 19 Oct 2020 12:29:02 +0200
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 8341A950AAA;
	Mon, 19 Oct 2020 12:28:59 +0200 (CEST)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrej.kozemcak@siemens.com, Andrej Valek <andrej.valek@siemens.com>
Subject: [oe][meta-oe][PATCH 1/2] nss: upgrade 3.56 -> 3.57
Date: Mon, 19 Oct 2020 12:25:58 +0200
Message-Id: <20201019102559.19491-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201019102559.19491-1-andrej.valek@siemens.com>
References: <20201019102559.19491-1-andrej.valek@siemens.com>

- Refresh freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
- Drop pkix-Do-not-use-NULL-where-0-is-needed.patch

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 ...a-configure-option-to-disable-ARM-HW-cryp.patch | 36 +++++++++++------
 ...01-pkix-Do-not-use-NULL-where-0-is-needed.patch | 46 ----------------------
 .../nss/{nss_3.56.bb => nss_3.57.bb}               |  3 +-
 3 files changed, 24 insertions(+), 61 deletions(-)
 delete mode 100644 meta-oe/recipes-support/nss/nss/0001-pkix-Do-not-use-NULL-where-0-is-needed.patch
 rename meta-oe/recipes-support/nss/{nss_3.56.bb => nss_3.57.bb} (98%)

diff --git a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
index bfc375e83..65e1500ae 100644
--- a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
+++ b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
@@ -10,22 +10,24 @@ Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- nss/lib/freebl/Makefile | 4 ++++
+ nss/lib/freebl/Makefile | 3 +++
  nss/lib/freebl/gcm.c    | 2 ++
- 2 files changed, 6 insertions(+)
+ 2 files changed, 5 insertions(+)
 
+diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
+index fe8c526..922f67c 100644
 --- a/nss/lib/freebl/Makefile
 +++ b/nss/lib/freebl/Makefile
-@@ -126,6 +126,8 @@ else
+@@ -125,6 +125,8 @@ else
+         DEFINES += -DNSS_X86
  endif
  endif
- ifdef NS_USE_GCC
 +ifdef NSS_USE_ARM_HW_CRYPTO
 +    DEFINES += -DNSS_USE_ARM_HW_CRYPTO
  ifeq ($(CPU_ARCH),aarch64)
-     DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
-     EXTRA_SRCS += aes-armv8.c gcm-aarch64.c sha1-armv8.c sha256-armv8.c
-@@ -150,6 +152,7 @@ endif
+     ifdef CC_IS_CLANG
+         DEFINES += -DUSE_HW_AES -DUSE_HW_SHA1 -DUSE_HW_SHA2
+@@ -166,6 +168,7 @@ endif
          endif
      endif
  endif
@@ -33,15 +35,23 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  
  ifeq ($(OS_TARGET),OSF1)
      DEFINES += -DMP_ASSEMBLY_MULTIPLY -DMP_NO_MP_WORD
+diff --git a/nss/lib/freebl/gcm.c b/nss/lib/freebl/gcm.c
+index c2cc18d..b77f573 100644
 --- a/nss/lib/freebl/gcm.c
 +++ b/nss/lib/freebl/gcm.c
-@@ -21,7 +21,9 @@
+@@ -18,6 +18,7 @@
+ 
+ #include <limits.h>
+ 
++#ifdef NSS_USE_ARM_HW_CRYPTO
  /* old gcc doesn't support some poly64x2_t intrinsic */
  #if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && \
      (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
-+# ifdef NSS_USE_ARM_HW_CRYPTO
- #define USE_ARM_GCM
-+# endif
- #elif defined(__arm__) && defined(IS_LITTLE_ENDIAN) && \
-     !defined(NSS_DISABLE_ARM32_NEON)
+@@ -27,6 +28,7 @@
  /* We don't test on big endian platform, so disable this on big endian. */
+ #define USE_ARM_GCM
+ #endif
++#endif
+ 
+ /* Forward declarations */
+ SECStatus gcm_HashInit_hw(gcmHashContext *ghash);
diff --git a/meta-oe/recipes-support/nss/nss/0001-pkix-Do-not-use-NULL-where-0-is-needed.patch b/meta-oe/recipes-support/nss/nss/0001-pkix-Do-not-use-NULL-where-0-is-needed.patch
deleted file mode 100644
index 432312da2..000000000
--- a/meta-oe/recipes-support/nss/nss/0001-pkix-Do-not-use-NULL-where-0-is-needed.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 1136cad77c2dc7d8e1daa317877676733e805f29 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 26 Aug 2020 17:30:40 -0700
-Subject: [PATCH] pkix: Do not use NULL where 0 is needed
-
-Clang finds this error
-
-pkix_logger.c:316:32: error: cast to smaller integer type 'PKIX_ERRORCLASS' from 'void *' [-Werror,-Wvoid-pointer-to-enum-cast]
-        logger->logComponent = (PKIX_ERRORCLASS)NULL;
-                               ^~~~~~~~~~~~~~~~~~~~~
-pkix_logger.c:617:32: error: cast to smaller integer type 'PKIX_ERRORCLASS' from 'void *' [-Werror,-Wvoid-pointer-to-enum-cast]
-        logger->logComponent = (PKIX_ERRORCLASS)NULL;
-                               ^~~~~~~~~~~~~~~~~~~~~
-2 errors generated.
-
-Upstream-Status: Submitted [https://bugzilla.mozilla.org/show_bug.cgi?id=1661378]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- nss/lib/libpkix/pkix/util/pkix_logger.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/nss/lib/libpkix/pkix/util/pkix_logger.c b/nss/lib/libpkix/pkix/util/pkix_logger.c
-index a916e6e..10f537a 100644
---- a/nss/lib/libpkix/pkix/util/pkix_logger.c
-+++ b/nss/lib/libpkix/pkix/util/pkix_logger.c
-@@ -313,7 +313,7 @@ pkix_Logger_Destroy(
- 
-         logger->callback = NULL;
-         PKIX_DECREF(logger->context);
--        logger->logComponent = (PKIX_ERRORCLASS)NULL;
-+        logger->logComponent = (PKIX_ERRORCLASS)0;
- 
- cleanup:
- 
-@@ -614,7 +614,7 @@ PKIX_Logger_Create(
- 
-         logger->callback = callback;
-         logger->maxLevel = 0;
--        logger->logComponent = (PKIX_ERRORCLASS)NULL;
-+        logger->logComponent = (PKIX_ERRORCLASS)0;
- 
-         PKIX_INCREF(loggerContext);
-         logger->context = loggerContext;
--- 
-2.28.0
-
diff --git a/meta-oe/recipes-support/nss/nss_3.56.bb b/meta-oe/recipes-support/nss/nss_3.57.bb
similarity index 98%
rename from meta-oe/recipes-support/nss/nss_3.56.bb
rename to meta-oe/recipes-support/nss/nss_3.57.bb
index 997f8950f..5d9318a92 100644
--- a/meta-oe/recipes-support/nss/nss_3.56.bb
+++ b/meta-oe/recipes-support/nss/nss_3.57.bb
@@ -31,9 +31,8 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://system-pkcs11.txt \
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
-           file://0001-pkix-Do-not-use-NULL-where-0-is-needed.patch \
            "
-SRC_URI[sha256sum] = "f875e0e8ed3b5ce92d675be4a55aa25a8c1199789a4a01f69b5f2327e2048e9c"
+SRC_URI[sha256sum] = "55a86c01be860381d64bb4e5b94eb198df9b0f098a8af0e58c014df398bdc382"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.11.0

