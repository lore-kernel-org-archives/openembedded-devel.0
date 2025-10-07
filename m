Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2ECCCD183
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 19:49:47 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.28495.1759866580780507046
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 12:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cOKRtn9F;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-637dbabdb32so13312194a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 12:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759866579; x=1760471379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2FREANwLidpn7+PSN9yZoyMwbI1yUpTjqYcNzADboU=;
        b=cOKRtn9FCCxqLMPsJDqyCutbbsescUqqJ/lys+TX7L9pMcNTDYtJQbVCXtvkYAdirE
         DW1/jl+pFKSIu6F+rzrB2xSbBShLwtA8Ibe/f4Ff/DhI+Y08adg0qGlIlV8hAXmeIZ6c
         fW/YDeIuWybilQVTNCFxKlRVOt1HrtHgM7C5b0OJHdgQZJ/ooVja6sNerXaypdVmZw6z
         QAv0XC43JZVP0zxlyYSSgDFhe1kjRbZmHYoM4vVKVzFRDWc58byT+HegZH0/+ae3qbVC
         M9hFGvp6OACONdImkI7p/oCpom0oqzMsA6UM0yqcNUM1weY6wpCXVSq0k5JxDuKQA5Wq
         UhgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759866579; x=1760471379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2FREANwLidpn7+PSN9yZoyMwbI1yUpTjqYcNzADboU=;
        b=kwu3aPF4bYGu3pz6F4D/qXk0TNwjlLjYZu09XRhgfC43LHGRkOZbut3wfIolZoKw1D
         1vaM/EefVl5jAXoKNUQPSrWtGUFUDfZu2To1Q6CRVmhFQ14tyBNzXrg5lolEr95WLnwQ
         9rIIT95uX5BQs5KiWUwyBpA1kg9hRqVbqqUO/fY95MJmkvvjv3wq9OroDXmaUQW7QGTw
         +CAzrvostiZEeROZKaBaVixgPlNkznevIeGw3PpZjAguq/c7nVaru0MzqD1Guad4GQRg
         9qXWj6XRyGqrTWG16mTFgTq7Xp092wbTpm27vYpcKxxr9qKB7WbwoyV3KCN2TwuRqAbl
         iiBg==
X-Gm-Message-State: AOJu0YwBqf4lInr+2oUsPp4YOENWkM57dLDOy9stW+i0soaaGcx8toM8
	lIN/yokw6xXzMqgRrZf3+l6DcPa6J/8MZPeTujj+W0NMo9KgG1PIbBe70t8fcg==
X-Gm-Gg: ASbGnctZzScqWhyBV6+QEA8IP4glAFEU4ivpWA7M2MVyV13rufO316oiKgkeW53d/T4
	u0kSl/XYw+9DANBnKabRZgedgWjm6I+3ra/Z+clOCoXTFL/q+RJJ7jq2b6ZtxDP3UJQ0Bf/7Yju
	uQM3WGpCx5WOVko26aHbl8JHJ4ydusDWFWGLQkbUa+rPHOmXdCa210FqEOBV2d+GKvdat6gTR1z
	B/xXx7VkBN8Y8rOE/iX/0E44ChVOTvuX31eWXqQYE6c0dkN7QYK/MzcKntQrcp3xDOQ1cxZKnVX
	nds9scjNM3ZnbmQSDAa3i0FCbtrn6zlRX0xrNcVg9/CcINK7xuwIgtRQGle2kb0DttyvKjBH7vF
	MDFs4csRtks/LlqvcdsPh/eJcUbz21sD1ut6BqNrWyxtZ
X-Google-Smtp-Source: AGHT+IFBGDfJZeRd97XNPhuDjXqaKWpg3JU2rEJWW1POz2jPXfxmx+JahyY+KlxUnQK/YrQq/ISTwg==
X-Received: by 2002:a05:6402:50d1:b0:631:b058:bef0 with SMTP id 4fb4d7f45d1cf-639d5c52eddmr619927a12.32.1759866578996;
        Tue, 07 Oct 2025 12:49:38 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6378810112bsm12961955a12.26.2025.10.07.12.49.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 12:49:37 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 2/4] redis: patch CVE-2025-27151
Date: Tue,  7 Oct 2025 21:49:34 +0200
Message-ID: <20251007194936.146845-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007194936.146845-1-skandigraun@gmail.com>
References: <20251007194936.146845-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 19:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120347

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-27151

Backport the patch mentioned in the details.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...AOF-file-name-in-redis-check-aof-CVE.patch | 34 +++++++++++++++++++
 .../redis/redis/0001-CVE-2025-27151.patch     | 31 +++++++++++++++++
 .../recipes-extended/redis/redis_6.2.18.bb    |  1 +
 meta-oe/recipes-extended/redis/redis_7.2.8.bb |  1 +
 4 files changed, 67 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-7.2.8/0001-Check-length-of-AOF-file-name-in-redis-check-aof-CVE.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis/0001-CVE-2025-27151.patch

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/0001-Check-length-of-AOF-file-name-in-redis-check-aof-CVE.patch b/meta-oe/recipes-extended/redis/redis-7.2.8/0001-Check-length-of-AOF-file-name-in-redis-check-aof-CVE.patch
new file mode 100644
index 0000000000..159f8341b2
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-7.2.8/0001-Check-length-of-AOF-file-name-in-redis-check-aof-CVE.patch
@@ -0,0 +1,34 @@
+From 1b71849d83940971b95b7c576cdfbc9ff60d48b2 Mon Sep 17 00:00:00 2001
+From: YaacovHazan <yaacov.hazan@redis.com>
+Date: Tue, 27 May 2025 10:23:27 +0300
+Subject: [PATCH] Check length of AOF file name in redis-check-aof
+ (CVE-2025-27151)
+
+Ensure that the length of the input file name does not exceed PATH_MAX
+
+CVE: CVE-2025-27151
+
+Upstream-Status: Backport [https://github.com/redis/redis/commit/d0eeee6e31f0fefb510007a8cfdf5dce729a8be9]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/redis-check-aof.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/redis-check-aof.c b/src/redis-check-aof.c
+index e28126d..5b3ee2a 100644
+--- a/src/redis-check-aof.c
++++ b/src/redis-check-aof.c
+@@ -547,6 +547,12 @@ int redis_check_aof_main(int argc, char **argv) {
+         goto invalid_args;
+     }
+ 
++    /* Check if filepath is longer than PATH_MAX */
++    if (strlen(filepath) > PATH_MAX) {
++        printf("Error: filepath is too long (exceeds PATH_MAX)\n");
++        goto invalid_args;
++    }
++
+     /* In the glibc implementation dirname may modify their argument. */
+     memcpy(temp_filepath, filepath, strlen(filepath) + 1);
+     dirpath = dirname(temp_filepath);
diff --git a/meta-oe/recipes-extended/redis/redis/0001-CVE-2025-27151.patch b/meta-oe/recipes-extended/redis/redis/0001-CVE-2025-27151.patch
new file mode 100644
index 0000000000..dd2ce977a7
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/0001-CVE-2025-27151.patch
@@ -0,0 +1,31 @@
+From 96f00cb60cb6e73c66375264227872053385bea2 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Tue, 7 Oct 2025 21:26:55 +0200
+Subject: [PATCH] CVE-2025-27151
+
+Ensure that the length of the input file name does not exceed PATH_MAX
+
+CVE: CVE-2025-27151
+Upstream-Status: Backport [https://github.com/redis/redis/commit/d0eeee6e31f0fefb510007a8cfdf5dce729a8be9]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/redis-check-aof.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/redis-check-aof.c b/src/redis-check-aof.c
+index 1507e0a..f7dd5cb 100644
+--- a/src/redis-check-aof.c
++++ b/src/redis-check-aof.c
+@@ -164,6 +164,11 @@ int redis_check_aof_main(int argc, char **argv) {
+         exit(1);
+     }
+ 
++    if (strlen(filename) > PATH_MAX) {
++        printf("Error: filename is too long (exceeds PATH_MAX)\n");
++        exit(1);
++    }
++
+     FILE *fp = fopen(filename,"r+");
+     if (fp == NULL) {
+         printf("Cannot open file: %s\n", filename);
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.18.bb b/meta-oe/recipes-extended/redis/redis_6.2.18.bb
index 13344beae4..179701bbf8 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.18.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.18.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0004-src-Do-not-reset-FINAL_LIBS.patch \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
+           file://0001-CVE-2025-27151.patch \
           "
 
 SRC_URI[sha256sum] = "470c75bac73d7390be4dd66479c6f29e86371c5d380ce0c7efb4ba2bbda3612d"
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.8.bb b/meta-oe/recipes-extended/redis/redis_7.2.8.bb
index 38d8e5ffe9..fe811dcc7e 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.8.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.8.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0004-src-Do-not-reset-FINAL_LIBS.patch \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
+           file://0001-Check-length-of-AOF-file-name-in-redis-check-aof-CVE.patch \
           "
 
 SRC_URI[sha256sum] = "6be4fdfcdb2e5ac91454438246d00842d2671f792673390e742dfcaf1bf01574"

