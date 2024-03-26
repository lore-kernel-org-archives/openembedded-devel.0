Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3913C54E58
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 01:51:04 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.9274.1711417857891234869
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 18:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OYNGfZZo;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e0000cdf99so39096345ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 18:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711417857; x=1712022657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZ3sQJYhiMFP55gpQ24LpiZj3ArZD0ZzSKQ2j7MfJas=;
        b=OYNGfZZoZU3Tcc7lvKqA8Ah3VPPDxL/rwiSvPOF8NY6YPuQ7X8jwNCdY3+HuBTbWH0
         7xgxNCtokPr1olHx0JRrzWbb48ITY99vOh/EQE6sWeEJgULlMbWSzVWpnL1PA3NIwgwS
         nopdDARwLNsT5liuLyMprerhWBeSrOK0738FMN4gAmO9H5lS9sYgCiZAW/04xkLSnJLh
         H3FdYqAazYY5ZpJAnjVMWUvznjNE3bptmltusG4x5/XBUcbqVoQDgdwH6qFNDCoYoTJx
         /W7ULhFbWsGMCYjngso1sKalHpGbMD9dy1T1zXN2NAg+1yXxjUfYix1SHi/lB2P6MfN6
         jJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711417857; x=1712022657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZ3sQJYhiMFP55gpQ24LpiZj3ArZD0ZzSKQ2j7MfJas=;
        b=kwsPjQoOHCiJXRijfICtDAOxeoG5clGMJJPtZ0tDMoHyLvWZW6UflazTzCWjWN6jcY
         T42p/MS/ME3XipXpu6IPAjdHmB0/hnwLIHwbqyokoUlROZae87LjbBIBmF7pty7vcgCL
         IUwWyx/Oe2Tw7xWHsa1DdjRaj+kUAUUTZHhec3V4i+u/+iCo+n2DMZA5Rrn7DPFmC4A4
         xZKJY91P3c3HqQ7U0A91+cn78Icx3CIMqrv7M5MKTIo95BMe6q50cwxpbezfrgxPOvqt
         XK5MqDxCEiCG3wzx6Fstv5vbZKlPPEMU5d1dosx+jxRplaHklvRUU0S5jowAahsiawTz
         Zpzw==
X-Gm-Message-State: AOJu0Yx4oTpTl2QGPvQl5XAsY27qG94gcIgxv+miLYofCpe+r430mCnk
	85b0aEfmIj9jjlL/A5v+G+4uhPPoug7FIh+AUQNZ6V6sTVYzPl5R2yl+Doy3
X-Google-Smtp-Source: AGHT+IFktvyeMf/7vEJkbLBnkKV/hxxb8/u18JsU4d+43t6HfPE3oD3yfbWsjbvQR8gU0J+qXG9+1w==
X-Received: by 2002:a17:902:e952:b0:1e0:c571:d644 with SMTP id b18-20020a170902e95200b001e0c571d644mr4713721pll.8.1711417857089;
        Mon, 25 Mar 2024 18:50:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5eba])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902e54100b001dcfc68e7desm5425070plf.75.2024.03.25.18.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 18:50:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 08/10] i2cdev: Include libgen.h on musl
Date: Mon, 25 Mar 2024 18:50:43 -0700
Message-ID: <20240326015047.543274-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240326015047.543274-1-raj.khem@gmail.com>
References: <20240326015047.543274-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 01:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109617

This helps in getting prototype for basename() and fix build errors
on clang-18+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-bsp/i2cdev/i2cdev/fix-musl.patch  | 28 ++++++-------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/meta-oe/recipes-bsp/i2cdev/i2cdev/fix-musl.patch b/meta-oe/recipes-bsp/i2cdev/i2cdev/fix-musl.patch
index 59fd379dec..a15514bafe 100644
--- a/meta-oe/recipes-bsp/i2cdev/i2cdev/fix-musl.patch
+++ b/meta-oe/recipes-bsp/i2cdev/i2cdev/fix-musl.patch
@@ -20,8 +20,6 @@ Upstream-Status: Submitted [https://github.com/costad2/i2cdev/pull/5]
  lsi2c/lsi2c.c              | 4 ++--
  7 files changed, 2 insertions(+), 9 deletions(-)
 
-diff --git a/libi2cdev/access.c b/libi2cdev/access.c
-index 62a3f59..2e77659 100644
 --- a/libi2cdev/access.c
 +++ b/libi2cdev/access.c
 @@ -16,7 +16,6 @@
@@ -32,20 +30,19 @@ index 62a3f59..2e77659 100644
  #include "sysfs.h"
  
  #include "i2cdiscov.h"
-diff --git a/libi2cdev/i2c-bus-parser.c b/libi2cdev/i2c-bus-parser.c
-index c4b8688..8c760e0 100644
 --- a/libi2cdev/i2c-bus-parser.c
 +++ b/libi2cdev/i2c-bus-parser.c
-@@ -27,7 +27,6 @@
+@@ -27,9 +27,9 @@
  #include <dirent.h>
  #include <fcntl.h>
  #include <errno.h>
 -#include <error.h>
  #include <alloca.h>
  #include <search.h>
++#include <libgen.h>
  
-diff --git a/libi2cdev/i2c-dev-path.c b/libi2cdev/i2c-dev-path.c
-index b156db7..361761c 100644
+ #include "common.h"
+ #include "sysfs.h"
 --- a/libi2cdev/i2c-dev-path.c
 +++ b/libi2cdev/i2c-dev-path.c
 @@ -11,7 +11,6 @@
@@ -56,8 +53,6 @@ index b156db7..361761c 100644
  
  #include <linux/limits.h>
  
-diff --git a/libi2cdev/i2c-error.c b/libi2cdev/i2c-error.c
-index f92fb6b..540c112 100644
 --- a/libi2cdev/i2c-error.c
 +++ b/libi2cdev/i2c-error.c
 @@ -9,7 +9,6 @@
@@ -68,8 +63,6 @@ index f92fb6b..540c112 100644
  #include <errno.h>
  #include <stdbool.h>
  #include <stdarg.h>
-diff --git a/libi2cdev/init.c b/libi2cdev/init.c
-index 99a7edd..dfc4090 100644
 --- a/libi2cdev/init.c
 +++ b/libi2cdev/init.c
 @@ -16,10 +16,8 @@
@@ -83,20 +76,18 @@ index 99a7edd..dfc4090 100644
  #include <fcntl.h>
  #include <assert.h>
  
-diff --git a/libi2cdev/sysfs.c b/libi2cdev/sysfs.c
-index 2811500..a7e13a8 100644
 --- a/libi2cdev/sysfs.c
 +++ b/libi2cdev/sysfs.c
-@@ -17,7 +17,6 @@
+@@ -17,8 +17,8 @@
  #include <assert.h>
  #include <string.h>
  #include <fcntl.h>
 -#include <error.h>
  #include <errno.h>
++#include <libgen.h>
  
  #include <sys/types.h>
-diff --git a/lsi2c/lsi2c.c b/lsi2c/lsi2c.c
-index 7af5313..34c6225 100644
+ #include <sys/stat.h>
 --- a/lsi2c/lsi2c.c
 +++ b/lsi2c/lsi2c.c
 @@ -38,7 +38,6 @@
@@ -107,7 +98,7 @@ index 7af5313..34c6225 100644
  #include <getopt.h>
  #include <stdbool.h>
  
-@@ -205,7 +204,8 @@ static int read_config_file(const char *config_file_name)
+@@ -205,7 +204,8 @@ static int read_config_file(const char *
          if (err < 0) {
              err = -err;
          }
@@ -117,6 +108,3 @@ index 7af5313..34c6225 100644
          if (config_file) {
              fclose(config_file);
          }
--- 
-2.34.1
-
-- 
2.44.0


