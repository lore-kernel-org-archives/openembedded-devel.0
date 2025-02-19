Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1394C021B0
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 13:18:33 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.21915.1739971110685042232
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Feb 2025 05:18:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=kvvOxypW;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.50, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38f3ac22948so2036105f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Feb 2025 05:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739971109; x=1740575909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aUdfRWMuubkwQY7X4eRgSXkzAzIlnBQq7w7Fh1jsAGs=;
        b=kvvOxypWhCpl/2W+qlShI2aYXj6SNSStWPROa6lpuqSNQE+EaKSTOLhSjkhm0aU/zr
         MNTwh6xmZsEnL5K2RK+2kEwAQCr8CzZivslJsWWIYHup0qcw4wNwe64WwdMdbSS/0gMC
         YKmfpfGnt9OjUBXHqBBHnEexE28aaHNxjnvV+iPsBK5KKyOlInjF7EnbUkFydNRu7DmI
         pam3bnlceJiBAioMkJ86lrhRa00qIOlvNbToXfYN3THuVRFHKiE7Toriipu2x/DyYjLq
         9NfTtj+fHFXEDviXlQdC7hbba7nEUk+rgep3D/25IS0jjmyivy+N7MRGu3Fh2orlzJ1j
         Muqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739971109; x=1740575909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aUdfRWMuubkwQY7X4eRgSXkzAzIlnBQq7w7Fh1jsAGs=;
        b=Ut4hoWiCokBrpkEYtChEuGgT9sOsDAiTSyIz5ev5+hwMGYLhXTcurfV1uuHSDhfKsD
         CHXrylkltYjoFGSjTyny6UBaC5AaMC71RYoyBhoDP26WYWFlwnKuKJNBFJwgxP77BtTo
         xkPXvqckhTmHGMcrGhg6vrm+JQXWmkfDb5eJoou+pq7lFJn8BmQxwuYtiAGFu8CRVBiA
         jJaBGchCsBS/aFrfxoQXAMyrogbm3A9WlwWRIODa0WqZ6UXHYNNan3mlKBMMt1eMVcxk
         wydVzlOnHu7d+kiCfzpB1koYkiUv2nNojeuU6g4HZZ+k1n6YTvIUqlw+0y/hwC7Lp8+k
         pmmw==
X-Forwarded-Encrypted: i=1; AJvYcCU5ooZTFZ14xilSsjf8jhvnyTbmqjpEwEwnuAEknYALVzdMe1AnyqVtVK9sML9L2j3JGLrgKlYUdlkaZLUx8LxcPQA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YygTKSn2xjX756B4OGWO0NmN7pEO3M8ZlbCvnMIziMdRPtvZfjy
	N/Ru/HKnGScL2Mh7ut67prc1J84wf8HJhrd9fEc8dYtdYQf5LItMyvNOg7IWRss=
X-Gm-Gg: ASbGncv4hMrHWiOiir3ndebJCUfX51DvVz0mWxWo03It1aeVcVd1wqXaJN4kMoo3BVD
	kgmZCnUN5SumAgQ8j9Xl6FglKtuwTd+7tHBn/11VBVggcZKiUvtfb/oYYlD8Yu3u7nC456Dfv9i
	Lo47VbtJkyyGbnVMnQqbO17N5xKfv6T/fFXYiqswKbIVWd174VFgfnT+SlI53029ZP//uwxyGL+
	14cvpryPSXaFrOG8q4SasOmVF5qk0a/6XJHdmBsSL6ii4MoEp9M8EgeD4Yber5lXT8pPWxniaO8
	FW0BNIXfJ6uLVg==
X-Google-Smtp-Source: AGHT+IHrQCXkcznNa2+stq4HJfdrKy4pJDa6ouC+skW5Ywm+yU6IWAFIlzdfFRz2MPZt8REA6AXbEw==
X-Received: by 2002:adf:f60f:0:b0:38d:dc4d:3476 with SMTP id ffacd0b85a97d-38f33f58da4mr14486038f8f.52.1739971108802;
        Wed, 19 Feb 2025 05:18:28 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:f0ed:3532:fe6:315c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ccd95sm17833607f8f.25.2025.02.19.05.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 05:18:28 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-oe][PATCH 1/2] libgpiod: update to v2.2.1
Date: Wed, 19 Feb 2025 14:18:24 +0100
Message-ID: <20250219131826.239050-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Feb 2025 13:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115524

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The main set of changes in this release doesn't concern yocto - it
brings in proper sphinx docs infrastructure for publishin on
readthedocs. We still have a bunch of code fixes though and we can also
remove the patch we're carrying in the recipe as it's upstream now.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 ...ts-disable-GPIO-simulator-before-rel.patch | 34 -------------------
 .../{libgpiod_2.2.bb => libgpiod_2.2.1.bb}    |  7 ++--
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-tests-disable-GPIO-simulator-before-rel.patch
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.2.bb => libgpiod_2.2.1.bb} (95%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-tests-disable-GPIO-simulator-before-rel.patch b/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-tests-disable-GPIO-simulator-before-rel.patch
deleted file mode 100644
index 9747613aa6..0000000000
--- a/meta-oe/recipes-support/libgpiod/libgpiod-2.x/0001-bindings-cxx-tests-disable-GPIO-simulator-before-rel.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 7df2bb4f51281166633d4acbcff5763150add3fa Mon Sep 17 00:00:00 2001
-From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-Date: Mon, 3 Feb 2025 13:20:41 +0100
-Subject: [PATCH] bindings: cxx: tests: disable GPIO simulator before releasing it
-
-Linux kernel commit 8bd76b3d3f3a ("gpio: sim: lock up configfs that an
-instantiated device depends on") uncovered an issue in C++ bindings
-tests where the GPIO simulator device is not disabled before removing its
-configfs entries. Add a call to gpiosim_dev_disable() to the
-gpiosim::chip's destructor.
-
-Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
-
-Upstream-Status: Submitted [https://lore.kernel.org/all/20250203-fix-gpiosim-in-bindings-v1-1-d2c9e0f3a29d@linaro.org/]
----
- bindings/cxx/tests/gpiosim.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/bindings/cxx/tests/gpiosim.cpp b/bindings/cxx/tests/gpiosim.cpp
-index 4bda5a2..cdecd8d 100644
---- a/bindings/cxx/tests/gpiosim.cpp
-+++ b/bindings/cxx/tests/gpiosim.cpp
-@@ -115,7 +115,7 @@ chip::chip(chip&& other)
- 
- chip::~chip()
- {
--
-+	::gpiosim_dev_disable(this->_m_priv->dev.get());
- }
- 
- chip& chip::operator=(chip&& other)
--- 
-2.45.2
-
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb
similarity index 95%
rename from meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb
index 054d378451..b72d960c10 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb
@@ -11,12 +11,9 @@ LIC_FILES_CHKSUM = " \
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-2.x:"
 
-SRC_URI += " \
-    file://gpio-manager.init \
-    file://0001-bindings-cxx-tests-disable-GPIO-simulator-before-rel.patch \
-"
+SRC_URI += "file://gpio-manager.init"
 
-SRC_URI[sha256sum] = "ee29735890eb1cc0e4b494001da5163d1a9c4735343201d22485db313601ca07"
+SRC_URI[sha256sum] = "0e948049c309b87c220fb24ee0d605d7cd5b72f22376e608470903fffa2d4b18"
 
 # Enable all project features for ptest
 PACKAGECONFIG[tests] = " \
-- 
2.45.2


