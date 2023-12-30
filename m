Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A01C46CD2
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 17:11:06 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.188250.1703956261693338109
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 09:11:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=k9Y3rlET;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40d2764c0f2so100833885e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 09:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1703956260; x=1704561060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/t31yVxGkAhKvMQwJdYRa4fCGaZvHjituTrBd4ZY67I=;
        b=k9Y3rlETXE6Jc3I4GMrdb01ic6Y70kLy9OXEszF32p02l8Pha1TTm8hgtLn0J2QDFS
         J1n/a1b0J9QGvir2vrBMOcnnUDaI78RmyDFnIBjSSmK+9CQj1y2tMY/REFo06v03K1wf
         lqDsSYayTJ8LqJSUHkl4Gez5ltl0BAQIvNUbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703956260; x=1704561060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/t31yVxGkAhKvMQwJdYRa4fCGaZvHjituTrBd4ZY67I=;
        b=beabBLwGEp8977qzPdyY92EBIZa5VoTb4w4xuTDFrMeYPuCG28pZhQulb94y9rrNco
         fE095nMV/0FYGu9V4WBA70E7YCR+ynVPevyheY42nTbUskPTbfo6hDfVueHttA8DdwsQ
         HY9QiR2T/xRxZHZDEIjCDiPHBIGCiLujQYLkUG3xwTd/VLlT9CJXplXy0GRYSS3/P2NH
         x+OcjBufIFfTqCX+mLhzjrakrMN4cIfa6TEU5eNA6qhdkI6k461gLJCdgZzGkaG45Jqa
         fb2CsM9y9Q0bTLNmyzoGYA9JMz+rvlox8LyMv6+0g5a6j6UW4a1O5m1CdO5kywycwOtR
         ogHg==
X-Gm-Message-State: AOJu0Yymg/2ntb/tg0Zzx8PutmXyGj0zZYpqDynzpyJxT0u2u80Yphr5
	vcXT5wJGMQBKhd+0qtlXLAr6MshH1PdQTZkLCHC+4Jez1bc=
X-Google-Smtp-Source: AGHT+IEGHBdkLOTyt7e6KXrZpdB78BjxYrPIH4OcWvAnDjaFVvBTkR51CraUzVhPHn2RXlV1///iag==
X-Received: by 2002:a05:600c:21c3:b0:40c:24dc:1166 with SMTP id x3-20020a05600c21c300b0040c24dc1166mr6489037wmj.189.1703956259608;
        Sat, 30 Dec 2023 09:10:59 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id l24-20020a170906231800b00a27a2243e5asm1358051eja.212.2023.12.30.09.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 09:10:59 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] ssd1306_git.bb: Add ssd1306_linux
Date: Sat, 30 Dec 2023 19:10:56 +0200
Message-Id: <20231230171056.1297800-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 17:11:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107908

Add ssd1306_linux, a simple OLED I2C SSD1306 Linux driver based on
the i2c library libi2c from i2c-tools. Example usage for a
compatible display with resolution 128x64 pixels:

ssd1306_bin -n 1 -I 128x64
ssd1306_bin -n 1 -c
ssd1306_bin -n 1 -r 0
ssd1306_bin -n 1 -x 1 -y 1
ssd1306_bin -n 1 -l "Hello World"

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../ssd1306/0001-Use-include-filename.patch   | 49 +++++++++++++++++++
 .../recipes-devtools/ssd1306/ssd1306_git.bb   | 25 ++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.patch
 create mode 100644 meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb

diff --git a/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.patch b/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.patch
new file mode 100644
index 000000000..9ec682c7b
--- /dev/null
+++ b/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.patch
@@ -0,0 +1,49 @@
+From cb32ebbb1efb3202808809861ec3cbd811c55bd2 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Sat, 30 Dec 2023 13:23:31 +0000
+Subject: [PATCH] Use include "filename"
+
+Use include "filename" to include programmer-defined header files
+from the same directory as the file containing the directive.
+
+Upstream-Status: Pending
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ main.c    | 2 +-
+ ssd1306.c | 6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/main.c b/main.c
+index c1ffc2f..18e2b84 100644
+--- a/main.c
++++ b/main.c
+@@ -6,7 +6,7 @@
+ #include <string.h>
+ #include <fcntl.h>
+ #include <sys/ioctl.h>
+-#include <ssd1306.h>
++#include "ssd1306.h"
+ 
+ void print_help()
+ {
+diff --git a/ssd1306.c b/ssd1306.c
+index a03674a..2e6ba97 100644
+--- a/ssd1306.c
++++ b/ssd1306.c
+@@ -8,9 +8,9 @@
+ #include <string.h>
+ #include <fcntl.h>
+ #include <sys/ioctl.h>
+-#include <linux_i2c.h>
+-#include <ssd1306.h>
+-#include <font.h>
++#include "linux_i2c.h"
++#include "ssd1306.h"
++#include "font.h"
+ 
+ const char init_oled_type_file[] = "/tmp/.ssd1306_oled_type";
+ 
+-- 
+2.39.2
+
diff --git a/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
new file mode 100644
index 000000000..5adfd3ed6
--- /dev/null
+++ b/meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb
@@ -0,0 +1,25 @@
+SUMMARY="SSD1306 OLED I2C drive"
+DESCRIPTION = "SSD1306 OLED I2C driver working in Linux"
+HOMEPAGE = "https://github.com/armlabs/ssd1306_linux"
+SECTION = "console/utils"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7b694e603a996c3bfdc6093ed1f70c8f"
+
+SRC_URI = " \
+    git://github.com/armlabs/ssd1306_linux.git;protocol=https;branch=master \
+    file://0001-Use-include-filename.patch \
+"
+SRCREV = "7375f1088732d243f7167c9a17725f1a860da587"
+
+S = "${WORKDIR}/git"
+
+# coreutils provides fmt which is used in the Makefile
+DEPENDS = "i2c-tools coreutils-native"
+
+EXTRA_OEMAKE = "CC='${CC}' CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}'"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${B}/ssd1306_bin ${D}${bindir}
+}
-- 
2.39.2


