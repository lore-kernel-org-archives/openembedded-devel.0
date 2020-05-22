Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web12.15576.1590161999208543168
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 08:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dv2JbZiC;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id d3so4546769pln.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2020 08:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UivGb8Ejn/iGJTKiowmxk9CeRPcIm6TFhRi1tVXAjBc=;
        b=dv2JbZiCyPeLzHir9pJ5YWFhWLrVlURDhm1eKDwOXLpXgptMJHOP97LiHJKvTgDmZB
         SpkmIQ295ZHwem7icWylyGElXTT+P6rkmyZ2TPyT3WWiMirJ3c5rfQTrmZtW2QdN9shA
         oEEcBjf21ZbOrJLvJBfcujwrfw6uy1ooW2x942lAJyZBTSdY2gjBTXqBty0HPCCa0sON
         tZDGyLtdYI3+D8C4br3ojisC933v+txB6AYos0Udyac7Ka/4PLQfTNjtYCpz/XNHvz7F
         uRyzyR9do9e76CmcikNccZOa80RdDcY7EU8n837zd2vIlT271U86w5CERrapQHO2osq0
         ykLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UivGb8Ejn/iGJTKiowmxk9CeRPcIm6TFhRi1tVXAjBc=;
        b=ZEalkv9ZKKXUwE+PgXrme5cAD8BS8TaV0/lvef2YsE9NrZhv7IjkOOkpH1otoUkpRj
         B3wsz9+PJP4xsHTjwwoiT2KDYQhsO38aNIruygHxfyOsmIn6fzRPxRu2zfIQs7E7vDNP
         0zFBR6PntXOIcajGbrMtq5Rxk8ZLJL41bTL0wKjyGpffYhyCIemR2N58CBpUuBRd58pi
         547sUHTUZzUSU2Eoy2PityDkHSqrT5zJyW1p+q6xeh1DydXHR0WCUmQpwjT0ywAcDaQj
         7vNjreSJkxeWYidEyrxB7k5N4RV30hruO6Qfprmpz+1Ndx/Nafc58nvF2h+FQmq6FhM3
         yMUg==
X-Gm-Message-State: AOAM530LfV74teo77GOPlyM4OacI3pzlwhn6OXa9hmfTnk02UmkB743B
	FMT/McLfrUKbBdv7cxKFkOLv5SyoJHw=
X-Google-Smtp-Source: ABdhPJwh0p1wrKI1lMXgCwSKqpaEhC+mytzWjVovEZzZG5+0EsuOOoAfq7vuYJM5o8pf2riCs6VTCA==
X-Received: by 2002:a17:902:c1cb:: with SMTP id c11mr14157105plc.299.1590161998145;
        Fri, 22 May 2020 08:39:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id i184sm6625298pgc.36.2020.05.22.08.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 08:39:57 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] safec: Update to latest on 3.5.1 release tags
Date: Fri, 22 May 2020 08:39:55 -0700
Message-Id: <20200522153955.3441963-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It build fine on mips now.
Musl patch is no longer needed and musl provides memrchr

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...r-Use-_ISOC11_SOURCE-only-with-glibc.patch | 30 -------------------
 .../safec/{safec_3.5.bb => safec_3.5.1.bb}    |  8 ++---
 2 files changed, 3 insertions(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-core/safec/safec/0001-memrchr-Use-_ISOC11_SOURCE-only-with-glibc.patch
 rename meta-oe/recipes-core/safec/{safec_3.5.bb => safec_3.5.1.bb} (59%)

diff --git a/meta-oe/recipes-core/safec/safec/0001-memrchr-Use-_ISOC11_SOURCE-only-with-glibc.patch b/meta-oe/recipes-core/safec/safec/0001-memrchr-Use-_ISOC11_SOURCE-only-with-glibc.patch
deleted file mode 100644
index 8f18f48720..0000000000
--- a/meta-oe/recipes-core/safec/safec/0001-memrchr-Use-_ISOC11_SOURCE-only-with-glibc.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 57456b5d034c8965b11eceed1bf861c98a18c324 Mon Sep 17 00:00:00 2001
-From: "jenkins@kwaj" <jenkins@kwaj>
-Date: Wed, 11 Sep 2019 13:43:45 -0700
-Subject: [PATCH] memrchr: Use _ISOC11_SOURCE only with glibc
-
-this is a glibc feature test macro which is not available
-on other libraries e.g. musl
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/extmem/memrchr_s.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/extmem/memrchr_s.c b/src/extmem/memrchr_s.c
-index 8d10a7b9..e73d3579 100644
---- a/src/extmem/memrchr_s.c
-+++ b/src/extmem/memrchr_s.c
-@@ -36,7 +36,7 @@
- #endif
- 
- #ifdef HAVE_MEMRCHR
--#ifndef _ISOC11_SOURCE
-+#if defined (__GLIBC__) && !defined(_ISOC11_SOURCE)
- extern void *memrchr(const void *, int, size_t);
- #endif
- #endif
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-core/safec/safec_3.5.bb b/meta-oe/recipes-core/safec/safec_3.5.1.bb
similarity index 59%
rename from meta-oe/recipes-core/safec/safec_3.5.bb
rename to meta-oe/recipes-core/safec/safec_3.5.1.bb
index 94cdb3a3c3..91d8fc65a0 100644
--- a/meta-oe/recipes-core/safec/safec_3.5.bb
+++ b/meta-oe/recipes-core/safec/safec_3.5.1.bb
@@ -7,14 +7,12 @@ SECTION = "lib"
 inherit autotools pkgconfig
 
 S = "${WORKDIR}/git"
-SRCREV = "a99a052a56da409638c9fe7e096a5ae6661ca7cb"
+# v08112019
+SRCREV = "ad76c7b1dbd0403b0c9decf54164fcce271c590f"
 SRC_URI = "git://github.com/rurban/safeclib.git \
-           file://0001-memrchr-Use-_ISOC11_SOURCE-only-with-glibc.patch \
 "
 
-CPPFLAGS_append_libc-musl = " -D_GNU_SOURCE"
-
-COMPATIBLE_HOST = '(x86_64|i.86|powerpc|powerpc64|arm|aarch64).*-linux'
+COMPATIBLE_HOST = '(x86_64|i.86|powerpc|powerpc64|arm|aarch64|mips).*-linux'
 
 PACKAGES =+ "${PN}-check"
 
-- 
2.26.2

