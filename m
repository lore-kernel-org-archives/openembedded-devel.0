Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498F6E810C6
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 10:49:30 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.14599.1695811768661154996
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 03:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ae3/N7JA;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5041cc983f9so17432446e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 03:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695811767; x=1696416567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwL75gD2WDijNS4bevubDhn4myinkDmMRrRknPTDRC0=;
        b=Ae3/N7JAZqa3md7fPOvKu16Je2VuOJdNgpj6RqShQGH+YX+cpF8ZtZmJHn7mD+qabV
         0z6QmuYB84gLLzLPRRWwxyb1pNcfyv4W7Sp5K8FJrbYTY8aZRnlS8HQ55f1QPw7PfwKs
         KwEzPDWnI9IOZzEN+zOnqYV+KbHANLCutkXI3tkF+yvKw8JlpRQWgHrib8GjZ5AB+EO1
         cPcjSdFFeNBkI+kI+8vvaYIbOQbBsKvOqtkYbxva7mrsTLyUxvPIBH6BIcjmYKjqvipp
         qSQ4PrW/Of9OsvGuE+uceLBq6uZwJitKhA+ZCngx/2wREcWyEZ4G6ksAzmVuFAUyF7pr
         BMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695811767; x=1696416567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwL75gD2WDijNS4bevubDhn4myinkDmMRrRknPTDRC0=;
        b=Rqx1Pna+nPEuqcpEHdwWLH+NYaOHWvGDw9n4QisbnvBxl07B3IbQu4uzM7/EXkKU3i
         QQ/BXNsYz9PtWaIfQ/ujB9mlH6rDdqv+qu0IRnoUMTRhkrmImO32Z7uVZZPR1sYWcUuE
         wLz5XVHH05MFoqRCJmTNblO01o3PHIkGNtetHEUrqErEciJW5OCLPNRnZg+DR+OMh757
         vTI1PyRR023WhDVoLSLXnJtmWM6CJF7TZwpZqz3K7R0P3buQ7+MXYIOxjZ7yLmouvyZA
         54SiANdZxuO3vXbNUlK4ExrKp1qisNfr1+TYS7xGX334S3ei/hzDPNQ5oJ2CkOmg79pL
         Z/5g==
X-Gm-Message-State: AOJu0YzovrBtTPcvKTy7cm4fK6DpspycBKdF2jeggog7KqS9IUgPyNAb
	3u9A69DziOYIkpct2+LVBf147z9sG4M=
X-Google-Smtp-Source: AGHT+IFlyZBrnMtPcHNhuyVDrjd8Cep+4sKas1HuTeIQxkfOqbyLxi4QpTIBnmM6zTAxKKDwkzbdRg==
X-Received: by 2002:a05:6512:3b06:b0:503:364d:b93d with SMTP id f6-20020a0565123b0600b00503364db93dmr1597889lfv.20.1695811766485;
        Wed, 27 Sep 2023 03:49:26 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a25-20020aa7d759000000b0051dd19d6d6esm8048264eds.73.2023.09.27.03.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 03:49:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 2/4] minifi-cpp, mozjs-115, redis-7.2.1, pv: add missing Upstream-Status
Date: Wed, 27 Sep 2023 12:49:16 +0200
Message-ID: <20230927104920.2052173-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230927104920.2052173-1-martin.jansa@gmail.com>
References: <20230927104920.2052173-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 10:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105187

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../0001-BundledOSSPUUID.cmake-Pass-CFLAGS-to-compiler.patch    | 2 ++
 ...1-Fix-the-constness-issues-around-autovector-iterator_.patch | 2 ++
 meta-oe/recipes-extended/mozjs/mozjs-115/fix-musl-build.patch   | 2 ++
 .../redis/redis-7.2.1/hiredis-use-default-CC-if-it-is-set.patch | 2 ++
 .../recipes-extended/redis/redis-7.2.1/oe-use-libc-malloc.patch | 2 ++
 ...1-pv-display-handle-error-of-tcgetpgrp-in-pv_in_foregr.patch | 2 ++
 6 files changed, 12 insertions(+)

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-BundledOSSPUUID.cmake-Pass-CFLAGS-to-compiler.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-BundledOSSPUUID.cmake-Pass-CFLAGS-to-compiler.patch
index a0265eaa32..ceb8ec34b1 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/0001-BundledOSSPUUID.cmake-Pass-CFLAGS-to-compiler.patch
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-BundledOSSPUUID.cmake-Pass-CFLAGS-to-compiler.patch
@@ -12,6 +12,8 @@ Upsteam-Status: Pending
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
+Upstream-Status: Pending
+
  cmake/BundledOSSPUUID.cmake | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-the-constness-issues-around-autovector-iterator_.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-the-constness-issues-around-autovector-iterator_.patch
index acb96f40d5..cd837d8de4 100644
--- a/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-the-constness-issues-around-autovector-iterator_.patch
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-the-constness-issues-around-autovector-iterator_.patch
@@ -19,6 +19,8 @@ Pulled By: ltamasi
 
 fbshipit-source-id: 04e82d73bc0c67fb0ded018383af8dfc332050cc
 ---
+Upstream-Status: Pending
+
  thirdparty/rocksdb/util/autovector.h | 15 ++++-----------
  1 file changed, 4 insertions(+), 11 deletions(-)
 
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/fix-musl-build.patch b/meta-oe/recipes-extended/mozjs/mozjs-115/fix-musl-build.patch
index d2b87e8033..22f31e05f8 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-115/fix-musl-build.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115/fix-musl-build.patch
@@ -8,6 +8,8 @@ Reason: mozjs60 miscompiles on musl if built with HAVE_THREAD_TLS_KEYWORD:
 https://github.com/void-linux/void-packages/issues/2598
 
 ---
+Upstream-Status: Pending
+
  js/src/old-configure.in | 3 +++
  1 file changed, 3 insertions(+)
 
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.1/hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.2.1/hiredis-use-default-CC-if-it-is-set.patch
index 5b9b71ea69..7785acca5c 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.1/hiredis-use-default-CC-if-it-is-set.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.1/hiredis-use-default-CC-if-it-is-set.patch
@@ -18,6 +18,8 @@ Reworked for 6.0.4
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 
 ---
+Upstream-Status: Pending
+
  deps/hiredis/Makefile | 2 --
  1 file changed, 2 deletions(-)
 
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.1/oe-use-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-7.2.1/oe-use-libc-malloc.patch
index be186b57da..7b601e02a9 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.1/oe-use-libc-malloc.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.1/oe-use-libc-malloc.patch
@@ -15,6 +15,8 @@ Update to work with 4.0.8
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
 
 ---
+Upstream-Status: Pending
+
  src/Makefile | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-support/pv/pv/0001-pv-display-handle-error-of-tcgetpgrp-in-pv_in_foregr.patch b/meta-oe/recipes-support/pv/pv/0001-pv-display-handle-error-of-tcgetpgrp-in-pv_in_foregr.patch
index 3c364dcc4e..c51fb1cfdb 100644
--- a/meta-oe/recipes-support/pv/pv/0001-pv-display-handle-error-of-tcgetpgrp-in-pv_in_foregr.patch
+++ b/meta-oe/recipes-support/pv/pv/0001-pv-display-handle-error-of-tcgetpgrp-in-pv_in_foregr.patch
@@ -15,6 +15,8 @@ correctly and pv_in_foreground() returns also true in that case.
 
 Signed-off-by: Michael Weiß <michael.weiss@aisec.fraunhofer.de>
 ---
+Upstream-Status: Pending
+
  src/pv/display.c | 4 ++++
  1 file changed, 4 insertions(+)
 
-- 
2.42.0


