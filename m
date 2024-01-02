Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338E6C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 11:04:07 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.26602.1704193444703548797
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jan 2024 03:04:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=gkUVyQH8;
 spf=pass (domain: konsulko.com, ip: 209.85.208.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5534dcfdd61so15831492a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 03:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1704193443; x=1704798243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DqkBvqfgwh3OSd2uQwf5O33jYmdFW97uDtq/kEEGhow=;
        b=gkUVyQH87oigPrTsPNwumqfQcAyYjHQB6R30YAL80nNwe6YwH/Khuwl7RYLKnZZDlK
         j6lyoNjnwhw0ygsS+cWwTUD8AnManqyCePCbm8B7M5iuh+MorzIoh8K2RC1wN68IGRiy
         W0W3wJ0wb/hjYDUrtfSdprfXMsvZrhvlIEqyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704193443; x=1704798243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DqkBvqfgwh3OSd2uQwf5O33jYmdFW97uDtq/kEEGhow=;
        b=ePX6CtTxRx6qGRA/i8J4cmbIlTYEXCSBfwY9KqlKzZ3Sdos1rx7jt5KLcysmHPmvb5
         WRMIg5yanwfQYZ+S9R77sg2evNcEknNKIKgJlDUNKOQTUQMDQo4hlMzZZz21vkEkWaR3
         DnLCLhetlVywoa/uCz6pIBuTOLfUhnG0TfxH8X4umHMBv4RUckfe7jtIIF6J3vIZtrY3
         WIUFuv6m3d99UZT/CmmglZrXWpvVi6hOjHhr9+khp1Im7QFdXUmowlsEPZBjvC03cldv
         9Zr/u5H/O2TgnpizkR6RIU8fCxxGXZkdN3mICgpxIvKJKxCMdzXoZC+kRyKjI8MzLOcW
         3lCg==
X-Gm-Message-State: AOJu0YyfHZ4hUCV9Imhdac2cmPsGEEq414ge43KBkm+r0XLEz5Y7zZs5
	c+fV7Uj5x/Sd6Tnx8EX90AFnvw+Vit5H0HzW51JsBC2BueY=
X-Google-Smtp-Source: AGHT+IG9upgY8xZTPoCJtnILd7hgEmG2bHE6wEC1rwfhWwUCR82eyl+cufgaJHRqibYrQcAyYi7sBg==
X-Received: by 2002:a05:6402:35c4:b0:554:89f6:3626 with SMTP id z4-20020a05640235c400b0055489f63626mr18846702edc.18.1704193442725;
        Tue, 02 Jan 2024 03:04:02 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id d5-20020a50fe85000000b0054cb88a353dsm15697907edt.14.2024.01.02.03.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 03:04:02 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCHv2] ssd1306_git.bb: Add ssd1306_linux
Date: Tue,  2 Jan 2024 13:04:00 +0200
Message-Id: <20240102110400.1707120-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 11:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108007

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
 .../ssd1306/0001-Use-include-filename.patch   | 52 +++++++++++++++++++
 .../recipes-devtools/ssd1306/ssd1306_git.bb   | 25 +++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.patch
 create mode 100644 meta-oe/recipes-devtools/ssd1306/ssd1306_git.bb

diff --git a/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.patch b/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.patch
new file mode 100644
index 000000000..a43116084
--- /dev/null
+++ b/meta-oe/recipes-devtools/ssd1306/ssd1306/0001-Use-include-filename.patch
@@ -0,0 +1,52 @@
+From cb32ebbb1efb3202808809861ec3cbd811c55bd2 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Sat, 30 Dec 2023 13:23:31 +0000
+Subject: [PATCH] Use include "filename"
+
+Use include "filename" to include programmer-defined header files
+from the same directory as the file containing the directive.
+
+GitHub pull request to the upstream of the project:
+https://github.com/armlabs/ssd1306_linux/pull/4
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


