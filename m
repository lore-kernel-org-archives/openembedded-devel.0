Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F2DFC47074
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 18:54:19 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.36564.1704221656099629078
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jan 2024 10:54:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Pp2TdUSh;
 spf=pass (domain: konsulko.com, ip: 209.85.167.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50ea226bda8so583033e87.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 10:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1704221654; x=1704826454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YUMJcAf+vh2NanGPAlJ0nx+/E5yCKRksml+wkAU5fj8=;
        b=Pp2TdUShnywJtrrHi5WBK+ajDShVU/Dw9QNkSTxam5pF6MG31JhHhLEuiFy/lSGDff
         A2Ow9a1UcpqcBja81ZBv/2Y2VpAIhI2SwbhIgmQZsloKTV5HSya7qbGor0tOiRdsjysl
         O3hy3piFwsUDS20taacHyohFmlYa7DqGtfAbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704221654; x=1704826454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YUMJcAf+vh2NanGPAlJ0nx+/E5yCKRksml+wkAU5fj8=;
        b=FpOjjHQeaAiY8pcNtFoMS79Pwr2LoDD77lK6gEXzpynF6q/AwMEX0WSRSZP0F6tuaU
         HjsxiorQcxIqi5Itt+PnBoUiOr+O236O9+m7zhmtCS0e2aIuHoZVBLPgnM07ZRXF0Ohc
         n0tdPTetHooLrNtQCAeOLwxcSGwKrRA9KabsaFuMlijK0ahI+UoKa/Y/OKG+9SWu+zSQ
         DvaHfbUsdNmXcOwbqbLpdSo32PC4x3vVeeIAt22bLophWUpU5SmHChJtUmW7eQogiMp7
         h9XOWDASVhRUSEucHxOM0+xM/NsRyes9pn1aBXGndsSDVL8IgLQRyQsC56qUvk1MubKT
         thOQ==
X-Gm-Message-State: AOJu0YwCurSrBW6EZc1QGgujRMg3cC6U4Qq4ffOX8kOGRVBis7rbHRl9
	3npwB0ItC9E4F0V68t15aV5QYlCmybg4Kws9Hji8vOMpPzs=
X-Google-Smtp-Source: AGHT+IGTJozJkDROauy9kAyesXD0cfUr3Em5YbiFnk/sKKzhrsbGPY2G+OZZ2fyDSwfHwMQ/eOe3cw==
X-Received: by 2002:ac2:4c14:0:b0:50e:698c:3426 with SMTP id t20-20020ac24c14000000b0050e698c3426mr7205116lfq.118.1704221653696;
        Tue, 02 Jan 2024 10:54:13 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id le19-20020a170906ae1300b00a2798d33c31sm4118353ejb.77.2024.01.02.10.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 10:54:13 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCHv3] ssd1306_git.bb: Add ssd1306_linux
Date: Tue,  2 Jan 2024 20:54:10 +0200
Message-Id: <20240102185410.3720762-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 18:54:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108014

Add ssd1306_linux, a simple OLED I2C SSD1306 Linux driver based on
the i2c library libi2c from i2c-tools. Example usage for a
compatible display with resolution 128x64 pixels:

ssd1306_bin -n 1 -I 128x64
ssd1306_bin -n 1 -c
ssd1306_bin -n 1 -r 0
ssd1306_bin -n 1 -x 1 -y 1
ssd1306_bin -n 1 -l "Hello World"

Pending GitHub pull request to the upstream of the project:
https://github.com/armlabs/ssd1306_linux/pull/4

After fixing the upstream 0001-Use-include-filename.patch should
be removed from the recipe.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../ssd1306/0001-Use-include-filename.patch   | 49 +++++++++++++++++++
 .../recipes-devtools/ssd1306/ssd1306_git.bb   | 25 ++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.patch
 create mode 100644 meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb

diff --git a/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.patch b/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.patch
new file mode 100644
index 000000000..dfe48175a
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
+Upstream-Status: Submitted [https://github.com/armlabs/ssd1306_linux/pull/4]
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


