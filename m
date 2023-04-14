Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02653C77B78
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 11:52:01 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.7191.1681473116921369791
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Apr 2023 04:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=l8wGnO9H;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.46, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f46.google.com with SMTP id s12so8741180wrb.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 04:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1681473115; x=1684065115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Nko0SVHaBLOMhCMTOpCHE36UhhgQiShNg1KWSlBAwM=;
        b=l8wGnO9HI57Bh3ydyl8ZpTsZJ6C7Xr0paMiweJ8ZryQqhS8XoKWsJtkAb2NDdEbE+3
         1hnJX6dMM9gG8IQJEpsZMXjAAw+KE2X7o8oxomfdUZ28t7dnRfquPNOwNXH9gEWfKRVx
         Kt+Qwffk3zvBVKhvcU52xKPZlS9k/gt05QMIYkNQw1KZcv97g6+pSqY9952SePf55m95
         mWYLwAaQYERZmlG9Q1falNiqK3iqy+cAdKndjwHqpWQtCOAcsZeSRpTLoK6G8ZLi1ccX
         uWuoiK0kvlXKeeJ3/H5Ho7E+puqudLilQWpT1NXbC5q5yuV1FrcLNjG2qqCDQgVWYpQU
         iDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681473115; x=1684065115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Nko0SVHaBLOMhCMTOpCHE36UhhgQiShNg1KWSlBAwM=;
        b=QQFYBFwpA97t61kgE7lkOjj4IGI7jIA3ad1S8KgOOiKKiv5iiNTdS8+pF1VOsALMui
         01ouDQ2KfY30dwn+otAr2clfCPqtkviBV4q56GT7kb7e+lzywpwSeO1vJUubvX6bWvWQ
         uqMwGS5dDO8wPmgwfeQio/C1pMp5DHSvLj5JeivAio5DM85TQFf7AgMkoZvEL/uo1RB1
         9R0RsA5F3c+/Fhs8/DKIhGfBJwjhTavnRE3SFlvfYHnR7aBIouUmmhFNDp2iQqi0Ify3
         b2TrvqAKCoH/BzuyM2X9uVYXxW7qz0DQ4/Ry/sBBJicntiLiAnkxKaONrxgYY7lOoVWt
         Oe9A==
X-Gm-Message-State: AAQBX9eiMxkVQlkgmQ4eAJysGmhFPuq5O+wWB0D9e/PDwLBO0YRa/AvT
	LOBjAhU3vVzwpFzs2KIw5wBrTg==
X-Google-Smtp-Source: AKy350bvTnCnWD1vhwnrO+j3VDX7Kp8xJaYZUfmPvcKdcgCgHxw1KhvJUjcR2r9GL3fBEgonyIJDKg==
X-Received: by 2002:adf:fe49:0:b0:2ef:b8ae:8791 with SMTP id m9-20020adffe49000000b002efb8ae8791mr3720225wrs.10.1681473115523;
        Fri, 14 Apr 2023 04:51:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e6b0:9ea2:8124:b254])
        by smtp.gmail.com with ESMTPSA id f15-20020adff58f000000b002efb3566b0asm3379523wro.52.2023.04.14.04.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 04:51:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH v2 4/4] libgpiod: fold libgpiod-src.inc into libgpiod.inc
Date: Fri, 14 Apr 2023 13:51:47 +0200
Message-Id: <20230414115147.136593-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230414115147.136593-1-brgl@bgdev.pl>
References: <20230414115147.136593-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Apr 2023 11:52:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102097

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Now that python3-gpiod fetches the sources from pypi, we no longer need
to provide the SRC_URI in a separate include. Fold it into the
libgpiod.inc used locally only.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-oe/recipes-support/libgpiod/libgpiod-src.inc | 1 -
 meta-oe/recipes-support/libgpiod/libgpiod.inc     | 7 ++++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-src.inc

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-src.inc b/meta-oe/recipes-support/libgpiod/libgpiod-src.inc
deleted file mode 100644
index 6bab4c1f4..000000000
--- a/meta-oe/recipes-support/libgpiod/libgpiod-src.inc
+++ /dev/null
@@ -1 +0,0 @@
-SRC_URI += "https://www.kernel.org/pub/software/libs/libgpiod/libgpiod-${PV}.tar.xz"
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/recipes-support/libgpiod/libgpiod.inc
index abb6544ec..53f9ec49c 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod.inc
+++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
@@ -1,11 +1,12 @@
 SUMMARY = "C library and tools for interacting with the linux GPIO character device"
 AUTHOR = "Bartosz Golaszewski <brgl@bgdev.pl>"
 
-require libgpiod-src.inc
-
 inherit autotools pkgconfig ptest
 
-SRC_URI += "file://run-ptest"
+SRC_URI += " \
+    https://www.kernel.org/pub/software/libs/libgpiod/libgpiod-${PV}.tar.xz \
+    file://run-ptest \
+"
 
 PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
 
-- 
2.37.2


