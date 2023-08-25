Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE373C3DA6F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 18:09:58 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.1832.1692986990811112484
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Aug 2023 11:09:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=lk2qQ/nB;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-401bdff4cb4so2545775e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 11:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692986989; x=1693591789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XrE3JnF417dvQPGKTlS7zrgB8xatK3nllklmhmqjbRE=;
        b=lk2qQ/nBfsLPU+BXuEYjILnWVXIcTZTyMqSgdcVS4WMpjYrVAJuHbWHJyNh68pbW3O
         b+gBOcpKMoBweTQJFvZx9inmrXzuTDyOsRqP7sXMQrX/2jiY2ImXuaDXCPJsNdJvda2C
         /7lFwyLBvcCe4Rogb88sjiZ6Ih3uq2r3pX2C4KgZbyadIzMUZMWgJpOxSbA2QUYMdONq
         +f5SyVex3mMYpikjKDoQtlp4pXok2zYS9rrpulb/oFSZW7ftVz4KfaQmEhk/DjjW3lbb
         7VeHYiev+dskNPkhCqjV6Zz5wwAV9mSlRl6oe+rhF2T1Spm4kzOjxeDKPbEHGqIvPlDG
         MxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692986989; x=1693591789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrE3JnF417dvQPGKTlS7zrgB8xatK3nllklmhmqjbRE=;
        b=SnbfnPoAAKvUzCX4N8tEFTKTCryKqybYiQdc/nPic03Mz5fPL/cI+QutLxkdCZGr5Q
         +6pn9Lc6q1kfKeUb1xq8cDzkHfELt5oY/6/84/KgypYPfrbNU/bKJdVRohQWtuMbHR1t
         f+uWmSK/VlyO9Cvd/aKvbkSmFMAjE7MwSj2XGIADpBQSkY4DgyJH+wklsa9dTFsX/vha
         csc0yfiJrFxGLEfKvt1E9a095IyjXXws1+WkXgUIliWs45fQZccJsJTmqfTfS1WboKEp
         puGr5GMcfvVniLQ5dJYeALMtp2Z2VZ57XT0eXdCZ06Ir9UXzACtoyn9lPd0FnX26p9P3
         zDig==
X-Gm-Message-State: AOJu0YyTlLBoXgwFOWUuYauvp5/041dX5DIaqhdPzRQ8BQm7jdhr6s1p
	VOH/0NWztcy8z0NQviavNtZKvQ==
X-Google-Smtp-Source: AGHT+IE00mW1hXfYa72iow27bJ+G51lDkI3lzaLk3VkL8QkjpjZ59W4+Leceo0uvEUMv6e8m27m0iQ==
X-Received: by 2002:a05:600c:3653:b0:401:b0f2:88cf with SMTP id y19-20020a05600c365300b00401b0f288cfmr3521325wmq.40.1692986988973;
        Fri, 25 Aug 2023 11:09:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:5caa:2f18:428d:7bed])
        by smtp.gmail.com with ESMTPSA id u2-20020a05600c00c200b003fe2a40d287sm2821098wmm.1.2023.08.25.11.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 11:09:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH] libgpiod: update to v2.0.2
Date: Fri, 25 Aug 2023 20:09:46 +0200
Message-Id: <20230825180946.46988-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 18:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104611

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is a small bug-fix release addressing a segfault, a memory
corruption bug and a couple minor issues.

This also removes the patch that's already upstream.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../gpio-tools-test-bats-modify.patch         | 67 -------------------
 .../{libgpiod_2.0.1.bb => libgpiod_2.0.2.bb}  |  4 +-
 2 files changed, 1 insertion(+), 70 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-test-bats-modify.patch
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.0.1.bb => libgpiod_2.0.2.bb} (87%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-test-bats-modify.patch b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-test-bats-modify.patch
deleted file mode 100644
index 0b2a5e6a8..000000000
--- a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/gpio-tools-test-bats-modify.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 53f9670d6af1bd0745c1df9c469b269c72607b23 Mon Sep 17 00:00:00 2001
-From: Joe Slater <joe.slater@windriver.com>
-Date: Tue, 6 Jun 2023 08:04:27 -0700
-Subject: [PATCH] tools: tests: modify delays in toggle test
-
-The test "gpioset: toggle (continuous)" uses fixed delays to test
-toggling values. This is not reliable, so we switch to looking
-for transitions from one value to another.
-
-We wait for a transition up to 1.5 seconds.
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-Upstream-Status: Accepted
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
----
- tools/gpio-tools-test.bats | 21 ++++++++++++++++-----
- 1 file changed, 16 insertions(+), 5 deletions(-)
-
-diff --git a/tools/gpio-tools-test.bats b/tools/gpio-tools-test.bats
-index c83ca7d..929c35a 100755
---- a/tools/gpio-tools-test.bats
-+++ b/tools/gpio-tools-test.bats
-@@ -141,6 +141,20 @@ gpiosim_check_value() {
- 	[ "$VAL" = "$EXPECTED" ]
- }
- 
-+gpiosim_wait_value() {
-+	local OFFSET=$2
-+	local EXPECTED=$3
-+	local DEVNAME=${GPIOSIM_DEV_NAME[$1]}
-+	local CHIPNAME=${GPIOSIM_CHIP_NAME[$1]}
-+	local PORT=$GPIOSIM_SYSFS/$DEVNAME/$CHIPNAME/sim_gpio$OFFSET/value
-+
-+	for i in {1..15}; do
-+		[ "$(<$PORT)" = "$EXPECTED" ] && return
-+		sleep 0.1
-+	done
-+	return 1
-+}
-+
- gpiosim_cleanup() {
- 	for CHIP in ${!GPIOSIM_CHIP_NAME[@]}
- 	do
-@@ -1567,15 +1581,12 @@ request_release_line() {
- 	gpiosim_check_value sim0 4 0
- 	gpiosim_check_value sim0 7 0
- 
--	sleep 1
--
--	gpiosim_check_value sim0 1 0
-+	gpiosim_wait_value sim0 1 0
- 	gpiosim_check_value sim0 4 1
- 	gpiosim_check_value sim0 7 1
- 
--	sleep 1
- 
--	gpiosim_check_value sim0 1 1
-+	gpiosim_wait_value sim0 1 1
- 	gpiosim_check_value sim0 4 0
- 	gpiosim_check_value sim0 7 0
- }
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.2.bb
similarity index 87%
rename from meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_2.0.2.bb
index 6958f2d84..7533e0a25 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.0.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.0.2.bb
@@ -9,9 +9,7 @@ LIC_FILES_CHKSUM = " \
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-2.x:"
 
-SRC_URI += "file://gpio-tools-test-bats-modify.patch"
-
-SRC_URI[sha256sum] = "b5367d28d045b36007a4ffd42cceda4c358737ef4f2ce22b0c1d05ec57a38392"
+SRC_URI[sha256sum] = "c3c923dc63b7b1b02639c9179c81e3d9febf0887bbaa59775990229cdbedb88b"
 
 # Enable all project features for ptest
 PACKAGECONFIG[tests] = "--enable-tests --enable-tools --enable-bindings-cxx --enable-gpioset-interactive,--disable-tests,kmod util-linux glib-2.0 catch2 libedit"
-- 
2.39.2


