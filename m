Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3D7CD4F28
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:20:25 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17711.1763014821990339814
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:20:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JyPtg81r;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7afc154e411so253971b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014821; x=1763619621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qR9eWV6EuECE6F0gFc2Op9vbFe+JC3cbWoqj0Jnd7lY=;
        b=JyPtg81rKuURLcmhuO6+xQHgEgRKUEsyVURDTINUMc/NY4CQJ0dLRVd9+5BvGJfzNn
         Qu6h78YoO6HKUqk1KeJq6+FiQJZU93rqMSy0WavMmYpfW3FKhrbcUPZo/OQh12+4sUJc
         44mHcoYrRKGD4XZ4AflnjytVv/wXGAc5ix3pKrhWWp4F8253T7UOZbXU7w0e61YkA0N7
         FilI/W9xqhUV3DoNMPnV5qec6Wvkc2xngJ0tire9bN1ohoxSOzvSM86GLLZEoZ/V5gxQ
         CTdP5gtGbZdf+DdPwY94qPd11t+nfapC9aLfx7QkI06hmVMMk1T5X2KF18CFZPHVPvT/
         p1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014821; x=1763619621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qR9eWV6EuECE6F0gFc2Op9vbFe+JC3cbWoqj0Jnd7lY=;
        b=GMCdDdxGo+PNzz2KZwiuwhKxHZYkEH3Iku3+6k6CJn6tU5mxF8D+uLxIOCpGgxS8on
         j1lWBYTX6iHariAi5bTCwXLqhvev9TwUisU62x5dBLl4ScAnxKFZLuwwZUcNU5Qd5IFN
         Y6F7y63QYCGqngTuwtvB1Iu0Qk8UTn3z2li/hJACcJBjoAmx5ejYa0gKsOTp65vOY+qg
         lBEJnA509dq8X53ODVjTGqubhOkuaWS4gOiVJTq++rm+3yzpiauNShdxIIiaRz1QnSqq
         8wfi/b4wT0xME9OBzcDEn+Z+/zkTyKEvOStVDQt854ksB/CYqWn7rywUDb/y5qK80I6C
         Yg4Q==
X-Gm-Message-State: AOJu0YxzoiEcdwdlnloPRk7EMzuYt/ib+buBpWMSYN5kvBfRJwW/Hw5W
	izguMTB/wQa/MYA4HzeQnFjlsPhmWfPFoCPXh6kPA7rkNI0e2tlO66+LaVcYgg==
X-Gm-Gg: ASbGncsHbDUlhq/SU1hw1vh3EDbHp9CxJPyW/0JPM6WdQI61QfHkctd5ZhD3td4feVX
	cdQbxDrGyGmU/Qf1ayWOQIBfF9W0TH3K7mFo0ZGaNvNvzGEGsdZwHEHKt9sKc+7f92pmGCAjgh7
	eZiooqp2Xwl068rIbzv1Y0REEe5tiXJf0nyuZkUKWKsS3rxeOS3doC0X+l+QSKQRwmP35znrlk9
	kzy2wHNhQ3n1QTcaeIbKWd2881R6SqHbdO/KlNYzZ97aJoNhhurtNSDw+JJm5FQ0MOubgEV5zFu
	bEVnRIxdSIZ+XO1+5pXrc+9IoRXVLKDuZnjHxtmir9DYs/YGrXXUcDk/bLJxiR5mdx65NpQOPnC
	gK8pn+1/9BpZtX/VgZ7ikmW1i5d4F8E1q1AbKi3WqVqscP9QIGaXYnN3bLeWUpdJ/drMhKLhtVn
	LRsm/x/0l8PQYn2w==
X-Google-Smtp-Source: AGHT+IG1S/puSDQYa7U/iwrE4DucmWTCGisLJ/s0wwHqnenSqwRqwCjtYeOd/EX6Agkjq492kJ7mhQ==
X-Received: by 2002:aa7:88c1:0:b0:780:ed4f:e191 with SMTP id d2e1a72fcca58-7b7a4fd9172mr5572320b3a.23.1763014821262;
        Wed, 12 Nov 2025 22:20:21 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:20:20 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 17/38] libgpiod: update v2.1.2 -> v2.1.3
Date: Thu, 13 Nov 2025 19:18:52 +1300
Message-ID: <20251113061914.3756301-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:20:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121615

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bug fixes:
- fix C++ tests with recent kernels which introduced stricter reconfigure
  behavior
- fix a use-after-free bug in python bindings
- fix passing the event clock property to line requests in python bindings
- fix a memory leak in tools
- make sure the string buffers in line-info and chip-info are big enough to not
  truncate the strings they hold below the size accepted by the kernel

Dropped patch which is merged in the upstream

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9958590b703a79b735874ea59b54aa4bb7233811)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ts-set-direction-when-reconfiguring-.patch | 38 -------------------
 .../{libgpiod_2.1.2.bb => libgpiod_2.1.3.bb}  |  4 +-
 2 files changed, 1 insertion(+), 41 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-tests-set-direction-when-reconfiguring-.patch
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.1.2.bb => libgpiod_2.1.3.bb} (87%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-tests-set-direction-when-reconfiguring-.patch b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-tests-set-direction-when-reconfiguring-.patch
deleted file mode 100644
index f8b94f0b99..0000000000
--- a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-tests-set-direction-when-reconfiguring-.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 8c7126b7b5dee0ed5433cf9265ccc79095d53939 Mon Sep 17 00:00:00 2001
-From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-Date: Mon, 8 Jul 2024 11:48:27 +0200
-Subject: [PATCH] bindings: cxx: tests: set direction when reconfiguring lines
-
-Linux kernel commit b44039638741 ("gpiolib: cdev: Ignore reconfiguration
-without direction") made the direction setting mandatory for line config
-passed to the kernel when reconfiguring requested lines. Fix the C++ test
-case which doesn't do it and now fails due to the rest of the settings
-being ignored.
-
-Reviewed-by: Kent Gibson <warthog618@gmail.com>
-Link: https://lore.kernel.org/r/20240708094827.84986-1-brgl@bgdev.pl
-Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-Upstream-Status: Backport
-[https://web.git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?id=3e224d885b1de54fe5510b9c5e7296260a1a4507]
-
-Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
----
- bindings/cxx/tests/tests-line-request.cpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/bindings/cxx/tests/tests-line-request.cpp b/bindings/cxx/tests/tests-line-request.cpp
-index 9632ae0..6e29532 100644
---- a/bindings/cxx/tests/tests-line-request.cpp
-+++ b/bindings/cxx/tests/tests-line-request.cpp
-@@ -208,6 +208,7 @@ TEST_CASE("values can be read", "[line-request]")
- 				.add_line_settings(
- 					offs,
- 					::gpiod::line_settings()
-+						.set_direction(direction::INPUT)
- 						.set_active_low(true))
- 		);
- 
--- 
-2.44.1
-
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.3.bb
similarity index 87%
rename from meta-oe/recipes-support/libgpiod/libgpiod_2.1.2.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_2.1.3.bb
index edbde0f7a7..4463f7d4df 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.1.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.1.3.bb
@@ -7,11 +7,9 @@ LIC_FILES_CHKSUM = " \
     file://LICENSES/CC-BY-SA-4.0.txt;md5=fba3b94d88bfb9b81369b869a1e9a20f \
 "
 
-SRC_URI += "file://0001-bindings-cxx-tests-set-direction-when-reconfiguring-.patch"
-
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-2.x:"
 
-SRC_URI[sha256sum] = "7a148a5a7d1c97a1abb40474b9a392b6edd7a42fe077dfd7ff42cfba24308548"
+SRC_URI[sha256sum] = "2be4c0b03e995d236c0e476e14aeb475d7b431dd1439609b6d65c540f91eaf58"
 
 # Enable all project features for ptest
 PACKAGECONFIG[tests] = "--enable-tests --enable-tools --enable-bindings-cxx --enable-gpioset-interactive,--disable-tests,kmod util-linux glib-2.0 catch2 libedit"

