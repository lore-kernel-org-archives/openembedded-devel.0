Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web10.32042.1598570888847140531
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 16:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vK4udqdG;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id l191so4455952pgd.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2020 16:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IyyM5bPdez/8U3Huep60VVOCbnn4VYrszHObkrPlcxQ=;
        b=vK4udqdGnBuPxQNnDmzUb0TDcP39SMGtaDCozq6xu6wCHKw0U67XHjR/41NN2SPjwN
         OIavtgZk1rtlzgiOC51u0Gbw0xGacVU6HWcjSf4qbmJilNDRXu7ACRqr9UCI8LXxg5se
         dK1ol7pqIYSXfTZZCbwHvHbpi13VYXefAig4UtYjcG14FZ1o2mrSKO5I/OeDxIY/WbA7
         GLLxFGPtPbIbzTao0soymGM6rJuurZDRU9zOsLo1Y3KOySrF7xJfd9cM9xtkh4tCXb43
         lzcsSFdtoM7rjtIpWQV5LIo1F6llt63umuSqLcB0g3DMtLBZZsNuGi1/YBlujm+nct8y
         oMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IyyM5bPdez/8U3Huep60VVOCbnn4VYrszHObkrPlcxQ=;
        b=auXlUA1petH0miQSUlz7idvnFDpbjT1JP1A0LssEFlX+z4vGfINeCMrkjmaFZDXGGF
         hKxl+gjLLCZpgUUEcGZRxjIghOGe5CD7BPrIBzYEfU4blRREFY0JLoaUGFojvxjkPg7N
         74vCmc/Lc0fW1jrRTKu8T90eyP0u8c6HczFwL97mfBKcXCUJqs5kuf7u85L3UcEAADeO
         QcN44yU6OudOcA1jkljjRT1kl2ACkDpZLLRQfB6n3l2jWh5rcUwawRuNz8C718HqwCLP
         mkdeBZSw28hINqtBzljoeFA8i+5TX/8xuaqWHvhuFqDK9CMFyYDBjkUgYCHp8guahNDu
         er4g==
X-Gm-Message-State: AOAM532cnRj17BLmZpwPihBuNu7XtJbs1AaShzeyTegCkUglOKX0MjOl
	PacWaDcFJHYnnRPmak2yg6CdThMwi6n9ig==
X-Google-Smtp-Source: ABdhPJxjU8XVcLeovAFZ//Hz/9TOm9wtsGsTAPAgl+xewZeFHQFWZ96/tcadmDYNAFb8E15cE9YUhA==
X-Received: by 2002:a17:902:c408:: with SMTP id k8mr18216462plk.102.1598570887969;
        Thu, 27 Aug 2020 16:28:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4fbd])
        by smtp.gmail.com with ESMTPSA id z15sm3588935pjz.12.2020.08.27.16.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 16:28:07 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] nss: Disable Werror across all recipe types
Date: Thu, 27 Aug 2020 16:28:04 -0700
Message-Id: <20200827232804.8943-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We are seeing warnigs with gcc-10 even on target builds e.g.

| In file included from nsinstall.c:20:
| /usr/include/unistd.h:520:14: note: in a call to function ‘getcwd’ declared with attribute ‘write_only (1, 2)’
|   520 | extern char *getcwd (char *__buf, size_t __size) __THROW __wur
|       |              ^~~~~~
| nsinstall.c:70:16: error: argument 1 is null but the corresponding size argument 2 value is 4096 [-Werror=nonnull]
|    70 | #define GETCWD getcwd
|       |                ^
| nsinstall.c:246:13: note: in expansion of macro ‘GETCWD’
|   246 |     todir = GETCWD(0, PATH_MAX);
|       |             ^~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/nss/nss_3.54.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/nss/nss_3.54.bb b/meta-oe/recipes-support/nss/nss_3.54.bb
index 882145c1ef..1cc94735bb 100644
--- a/meta-oe/recipes-support/nss/nss_3.54.bb
+++ b/meta-oe/recipes-support/nss/nss_3.54.bb
@@ -58,7 +58,6 @@ do_configure_prepend_libc-musl () {
 do_compile_prepend_class-native() {
     export NSPR_INCLUDE_DIR=${STAGING_INCDIR_NATIVE}/nspr
     export NSPR_LIB_DIR=${STAGING_LIBDIR_NATIVE}
-    export NSS_ENABLE_WERROR=0
 }
 
 do_compile_prepend_class-nativesdk() {
@@ -72,6 +71,7 @@ do_compile_prepend_class-native() {
 
 do_compile() {
     export NSPR_INCLUDE_DIR=${STAGING_INCDIR}/nspr
+    export NSS_ENABLE_WERROR=0
 
     export CROSS_COMPILE=1
     export NATIVE_CC="${BUILD_CC}"
-- 
2.28.0

