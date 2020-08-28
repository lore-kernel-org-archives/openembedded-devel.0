Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web10.32780.1598573673055806848
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 17:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iKQXB3FB;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id kx11so3437308pjb.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2020 17:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uDca/6rrXm+Ix4ZoOp1xPxPLuidTxeP8tm4kjMcTscE=;
        b=iKQXB3FBVrXdPk3nCWEm9xknw4BI/TLOUT/440flflD32Smwjc+1Pwck5W1FCcDp+2
         ejyJ7pYJTCyE/cYSWUGxc/95xakqICZ+4iz4ApmDfIOZGjlpFQ7mkWGqDHWJhoiEsONm
         vrieIwLQ4kI0/85Mvq2uDdss0DCI0lWhRgOe2ZY41Ul6YQ5+2z5jyXNAbwrWYQ7ALVGz
         aR0TXa79olmFIuoD25/HV+8I/d+2zdSZsV+zR5oNFTY21/MGtP/a1g6Du3hlPPlvC32y
         AwsFAUNyd/8KY6peeUB9JIV14Ypp+eWivmzNrhbJPyWF8LNFoz1MCSOU0+eQ0IIG7SLD
         lJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uDca/6rrXm+Ix4ZoOp1xPxPLuidTxeP8tm4kjMcTscE=;
        b=oHEIMnLM0Db6BVMExpkf23L4r1XzzWv+fnmLe/qeMsmNytctWfQHgAfou0OR1eFAHz
         6Qpsw1d8/m6kvfE2SxVSDtZqd744wzKVbtCnTxfWcU7Z4GP43Rx1bFDFcDa+GYD/W3RP
         3jPYfZBo7q1WtbOKHROB5WRfxIcr2jKC+7fgh0qGf810UxwmWBXUna1p8OnQNoHklFQo
         TWN5vCHKf+tdan3pn6bJtoQWHxLRWir4akIm+3j5pUVWlP8VwH/RRDb9ofzVUQJyWQCA
         m0wyXIreBQjnMi/6TnFp6gWbC6YiHJ6b2Cc7XgL1OhBR79MsbdE5KcLWT5qmYGYkYFt1
         WzwQ==
X-Gm-Message-State: AOAM531iYIKCf7hPRXP6SV/uW45KWh9hFNjWaKl4yfcRbppqlmgaUF52
	MmXSVoG+GRwwiWi/nGVOz4H7rOSZ+VxSVQ==
X-Google-Smtp-Source: ABdhPJwK6FQFAuZq7e5xAHuWxBzS1tK1UK4t36uVGimAZxerSWCXELHFVHVUTLfJb704a45vxOMC8g==
X-Received: by 2002:a17:90a:80c6:: with SMTP id k6mr74653pjw.81.1598573671845;
        Thu, 27 Aug 2020 17:14:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4fbd])
        by smtp.gmail.com with ESMTPSA id d127sm3872451pfc.175.2020.08.27.17.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 17:14:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] nss: Upgrade to 3.56
Date: Thu, 27 Aug 2020 17:14:29 -0700
Message-Id: <20200828001429.1369170-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Forward port 0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-configure-option-to-disable-ARM-HW-cryp.patch | 15 +++++----------
 .../nss/{nss_3.54.bb => nss_3.56.bb}              |  3 +--
 2 files changed, 6 insertions(+), 12 deletions(-)
 rename meta-oe/recipes-support/nss/{nss_3.54.bb => nss_3.56.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch b/meta-oe/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
index 1a87a0577f..f3463012e1 100644
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
@@ -36,8 +33,6 @@ index f99f769..b0ec81b 100644
  
  ifeq ($(OS_TARGET),OSF1)
      DEFINES += -DMP_ASSEMBLY_MULTIPLY -DMP_NO_MP_WORD
-diff --git a/nss/lib/freebl/gcm.c b/nss/lib/freebl/gcm.c
-index c2cc18d..b77f573 100644
 --- a/nss/lib/freebl/gcm.c
 +++ b/nss/lib/freebl/gcm.c
 @@ -18,6 +18,7 @@
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

