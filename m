Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4361C27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 18:21:02 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.26965.1718043661550820875
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jun 2024 11:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ced5/bQj;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-704090c11easo3433643b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 11:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718043661; x=1718648461; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D1xeo1/AbiMczR4rmua7htsEAROk3Wu70Px0H3VHwIQ=;
        b=ced5/bQjyNbwS3ooRl0WrsZnV1uQW7oxBazURyNx4L/Tl7q4ooB0L05E2bU2DR8bgL
         rX/Fkvf9fn8cIyTwtIBxTfarf76MgTGoTAAEqyGLzPaK6RkU8VvQTBYv4RVQS/QNL/ys
         izvkBfmAZH/Bogs0Tuge9TXLe2VYp3GPgsmWC1n9bjWJanB4J4ciDZOu+pGixVNf1/wl
         BjL0vUb0jSB75evguzzOaoDAD1jec3IwkQWhS7sA9cnAWupxTaDyOHCQQ6tCDcSi908v
         rJTelOt8EJarrhfpsCJlbR9vIq3qFm18Jv7Tr/tt6n20aXwsotZg8MYDX0wJijC+Oumx
         mCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718043661; x=1718648461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1xeo1/AbiMczR4rmua7htsEAROk3Wu70Px0H3VHwIQ=;
        b=cs+XTnDsIesos6az1KDB3VrlU1EeIBOw5uPBtV19hLEAnmmeTWyti89pqP/jx0jbXT
         tusicCJFOy/JTPSkoKU+bZHXuplSFuvUhZnUER4SPTvBYGkCxM2GI6TJgIXCqbnxTfYM
         8l6/kxxtRqYmf4RpAjitv0WvfR9MRTIqZq0YZ8DvXrJJ5A93JrDJmBSOd1VDPcNstaWY
         AYr7D1Z5U6pjAmGXyKsrNIdg3ZTn/3O2xcdzCUHGzxKUHkfM/4958utMh3wrXQQ/lZ03
         3ZahmNA64eAEKZ8egdTjApuW+4gcZs9hItK1ZiO5Ea6gFfNppC1qr3Fzwo+J2SNGPQxP
         nyXw==
X-Gm-Message-State: AOJu0YyLhX2oDtmHfw32QntXT7YcRIIBtyw2yCvBbTXh+WBB0j9HjOQW
	v7Ut5ShD01A9CnQuSu4mH1o4Ke+BrDA/htfpO4d049+/RspAYosH9OJAfg==
X-Google-Smtp-Source: AGHT+IGfjFVdEu8GCAFRQavgR4cnSlEhebRuN8RTVARosPqIPc/1ani23R/jzDk1z1I/WGIpX/qtaw==
X-Received: by 2002:a05:6a00:14d2:b0:705:9f39:dd7a with SMTP id d2e1a72fcca58-7059f39e0ebmr2607484b3a.2.1718043660502;
        Mon, 10 Jun 2024 11:21:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e5ec82dd8asm4480506a12.33.2024.06.10.11.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 11:21:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH] libgpiod-1.x: Disable ptests and fix build on musl
Date: Mon, 10 Jun 2024 11:20:58 -0700
Message-ID: <20240610182058.2286377-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 18:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110800

libgpiod-1.x is still in use by some BSPs e.g.
variscite SOMs, so we can not get rid of completely
so give some time to move away from 1.x and disable
ptests as they need older version of catch2 which is
being removed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 ...nclude-missing-libgen.h-for-basename.patch | 25 +++++++++++++++++++
 .../libgpiod/libgpiod_1.6.4.bb                | 16 ++++++------
 2 files changed, 32 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-1.x/0001-Include-missing-libgen.h-for-basename.patch

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0001-Include-missing-libgen.h-for-basename.patch b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0001-Include-missing-libgen.h-for-basename.patch
new file mode 100644
index 0000000000..4a250015ba
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod-1.x/0001-Include-missing-libgen.h-for-basename.patch
@@ -0,0 +1,25 @@
+From b0ea35260ded2fbd41af46f2f18a61fb783a35be Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 10 Jun 2024 11:09:31 -0700
+Subject: [PATCH] Include missing libgen.h for basename()
+
+This is an error with newer musl otherwise
+
+Upstream-Status: Inappropriate [ Code removed in upstream ]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/core.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/core.c b/lib/core.c
+index 35dcd8e..cf1d677 100644
+--- a/lib/core.c
++++ b/lib/core.c
+@@ -10,6 +10,7 @@
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <gpiod.h>
++#include <libgen.h>
+ #include <limits.h>
+ #include <linux/gpio.h>
+ #include <poll.h>
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
index 111a5727ba..9eec936f17 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.4.bb
@@ -3,12 +3,16 @@ require libgpiod.inc
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
 
+SRC_URI += "file://0001-Include-missing-libgen.h-for-basename.patch"
 SRC_URI[sha256sum] = "7b146e12f28fbca3df7557f176eb778c5ccf952ca464698dba8a61b2e1e3f9b5"
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-1.x:"
 
 inherit python3native
 
+# catch2 v2.x is no longer available
+PACKAGECONFIG:remove = "tests"
+
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev glib-2.0 catch2"
 PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3"
 
@@ -32,14 +36,8 @@ RRECOMMENDS:${PN}-ptest += " \
 "
 RDEPENDS:${PN}-ptest += " \
     python3-packaging \
-    ${@bb.utils.contains('PTEST_ENABLED', '1', 'bats', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'tests', 'bats', '', d)} \
 "
 
-do_install_ptest:append() {
-    install -m 0755 ${S}/tools/gpio-tools-test ${D}${PTEST_PATH}/tests/
-    install -m 0755 ${S}/tools/gpio-tools-test.bats ${D}${PTEST_PATH}/tests/
-
-    if ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'true', 'false', d)}; then
-        install -m 0755 ${S}/bindings/python/tests/gpiod_py_test.py ${D}${PTEST_PATH}/tests/
-    fi
-}
+deltask do_install_ptest
+deltask do_install_ptest_base

