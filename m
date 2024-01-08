Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23099C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 10:18:14 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.3742.1704709092309371866
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 02:18:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=q2tRCgLK;
 spf=pass (domain: konsulko.com, ip: 209.85.208.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5572a9b3420so4460925a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1704709090; x=1705313890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JqaZ/gIXfvrRqFREVfXhTh3fWlQNq/2fy31AjQwJr8c=;
        b=q2tRCgLKeB7z1TMue5AJswmZpz3GznbugF+UHgqgMEmQ4JbWOdG592t0RgBlZM0/4O
         bBPIF6NpzZ45ZEclHsWAJ7yOaazoBGkbDqnREB9sDGV5S38tI5r9PKLLn1gIxz9dtPSD
         SJZhN9q8lsPsmWouCV82IRvjyruL/YIgFHnv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704709090; x=1705313890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JqaZ/gIXfvrRqFREVfXhTh3fWlQNq/2fy31AjQwJr8c=;
        b=GF0euENVSP3iDyHTDdfb6nH/mJB1zVz2W4LIrHQXD4nOeenmrAczstPRSZbghdku5S
         il0922Zt0B6PZwwuPcbYIl940hs+kN2plTFtsuFlv5kMfWPV7AyPlghfRBfnqBCDTzY8
         NF0GcRUgSA1CCEJ1MEgFunkwH2hDPt3mLQybHq2U5TSwKHNCLDMbiVMgCz7kN0vGv0h8
         56RPMDBImXwIT9yZVkiklhpX6RNkkeryNbFWr7fOdDmGe8F7e+9qaZdjbyMDF1CXaVDg
         BF8w2lzNdiWHq+FYP2SvWdlv6WE3MkmrO9LDmmcRf+H/eGe95M+Lonm8fBy39aw2CHJO
         7yUw==
X-Gm-Message-State: AOJu0YxhNirxt3tbQULpU2YrJSB1I/0ywlexsp90Wzk5w19904PG6QMO
	2PhZQTTf9Yt3fW/nGLFjCxUaQXi03A9Jl6vOWIa7ljgWE/0=
X-Google-Smtp-Source: AGHT+IF3JR99dwEeEeWrHP0ByW4BdD/TX7LbmbAK8Fx/D9MkVAVogztlBoCzpuwtkkohOC57lyNY9w==
X-Received: by 2002:a17:906:30c5:b0:a23:1b07:5c1b with SMTP id b5-20020a17090630c500b00a231b075c1bmr3393984ejb.10.1704709090277;
        Mon, 08 Jan 2024 02:18:10 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id n15-20020a170906688f00b00a281f88f2ebsm3774737ejr.38.2024.01.08.02.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 02:18:09 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] ssd1306: Update and remove patch
Date: Mon,  8 Jan 2024 12:18:07 +0200
Message-Id: <20240108101807.2132710-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 10:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108128

Update ssd1306_linux, OLED SSD1306 Linux user space driver, to the
latest version and remove a patch that has been merged in upstream
of the project in GitHub.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../ssd1306/0001-Use-include-filename.patch   | 49 -------------------
 .../recipes-devtools/ssd1306/ssd1306_git.bb   |  3 +-
 2 files changed, 1 insertion(+), 51 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.patch

diff --git a/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.patch b/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.patch
deleted file mode 100644
index dfe48175a..000000000
--- a/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From cb32ebbb1efb3202808809861ec3cbd811c55bd2 Mon Sep 17 00:00:00 2001
-From: Leon Anavi <leon.anavi@konsulko.com>
-Date: Sat, 30 Dec 2023 13:23:31 +0000
-Subject: [PATCH] Use include "filename"
-
-Use include "filename" to include programmer-defined header files
-from the same directory as the file containing the directive.
-
-Upstream-Status: Submitted [https://github.com/armlabs/ssd1306_linux/pull/4]
-
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
----
- main.c    | 2 +-
- ssd1306.c | 6 +++---
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/main.c b/main.c
-index c1ffc2f..18e2b84 100644
---- a/main.c
-+++ b/main.c
-@@ -6,7 +6,7 @@
- #include <string.h>
- #include <fcntl.h>
- #include <sys/ioctl.h>
--#include <ssd1306.h>
-+#include "ssd1306.h"
- 
- void print_help()
- {
-diff --git a/ssd1306.c b/ssd1306.c
-index a03674a..2e6ba97 100644
---- a/ssd1306.c
-+++ b/ssd1306.c
-@@ -8,9 +8,9 @@
- #include <string.h>
- #include <fcntl.h>
- #include <sys/ioctl.h>
--#include <linux_i2c.h>
--#include <ssd1306.h>
--#include <font.h>
-+#include "linux_i2c.h"
-+#include "ssd1306.h"
-+#include "font.h"
- 
- const char init_oled_type_file[] = "/tmp/.ssd1306_oled_type";
- 
--- 
-2.39.2
-
diff --git a/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
index 5adfd3ed6..f9e367959 100644
--- a/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
+++ b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
@@ -8,9 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7b694e603a996c3bfdc6093ed1f70c8f"
 
 SRC_URI = " \
     git://github.com/armlabs/ssd1306_linux.git;protocol=https;branch=master \
-    file://0001-Use-include-filename.patch \
 "
-SRCREV = "7375f1088732d243f7167c9a17725f1a860da587"
+SRCREV = "34b42992a43fda69c6ba2557b718601cafe16251"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


