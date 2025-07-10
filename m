Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF03C83F21
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 17:39:09 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.1046.1752169142525529554
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 10:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f4mUcyRf;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32b7cf56cacso12721621fa.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 10:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752169140; x=1752773940; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lh/z4ecFPAfaS9VjIwhZexM32Gtd1kSIBHqSUc5StEQ=;
        b=f4mUcyRfghGWHTdXqdXqgu2sb26iTbfyHG8idXRbc+bZTLbTHph+T5QLAyt9xY2jxf
         NUUwKLCAudWrjVQnD80WokltjnUulmcmhuPozHs/0OImcCrUvSoXqhZeGSof0S01pmpZ
         IEryvKdGEFAJeNCO527ysuFx0MRtGn5/st3ffhmk0c2sNNVyzVs6aNo/4HIwuU1DdHGK
         Kc4UhpF45HwG/g/UIFk9o9SFXJ3y6tiUJSnz2XoxA1p+uNlnyr1Ot6CxCgq0CHXSKzul
         trOhLi6wRH2ZC50RyAcUKXWO26aWbc7Issyq2/BmqmCSFvvFzL6yB1vc2j5I9aXHXaza
         s5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169140; x=1752773940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lh/z4ecFPAfaS9VjIwhZexM32Gtd1kSIBHqSUc5StEQ=;
        b=bdbqByrJAa+v8Y01EmxE0ep1+c9Nqd1GEM4h5M3haEMl6r98Ph9+F5XYgnc16lig9R
         ujLtIFV1FRfCosJ2uasWXA8BBS6YNSWy7pt7TZZ+QEX3HhFxbtf4ZtmMEQ+qP6zmZ8rO
         6L6Ir3XUhV7r/H5QKMQWeJTGzu+I5Fjd/xMSSBWNE83jE+CkQoaAav2rSRAbv1sgbkYW
         6DIPyn0OD6oNwHmMngiJbpPJ/A9mTuAa4Fs2msK3cAhJ6/v7iX1oP0xMXIiEzQg7+Fw0
         WGL/s20r2VhpQEL9Gu+XF6FkOnoFi5HioU+K6RE/Lfdd/f8fH0dMRVrQy/4QYmjk6XnW
         2ZDA==
X-Gm-Message-State: AOJu0YxTnFHmGebXHA8OK+5qQ8ZOb20ZuaBFxJOcbd4noCkMym1FyPaL
	sKHXFFBViijNqd6NOskdwe/h/qyo6yeDIXBOYEYJkBho6HHCKbw/SxaU9wnSlA==
X-Gm-Gg: ASbGnctWmfBfuJxVN8Ejus3nJ9viq6rv5nc9RTWoY3a62Atpef8ZHuiBUhuUUaHVG8y
	sVLlg32MTDNiL4asWOMQTwF76xN0m7p1fNO411G779gKkY1DG2G+JTLbnRgtWKnkIj3fFDRt7Zb
	vs3qk2/45fhnN39g+awPcz/x1aGOxm7A++/LCPu1AsXo2CK1WBY0REclkBqIgG1xeS+k5Xrxsm4
	F8Et5mc+opkS6csvpK7CXSQtBUQTYRYzFc2NtL/wrP68NiIkSrL2x5KBebhLSs2kPcIhvsHUaaf
	ncZzAoqKPDv+HlP8NUqfy3FOptq93HtktYQqrWp7bKovSMnIfMWU4cxo8ScfJvJkIIT0u+VQLkG
	GrPZ6ayYqY0dRwQ==
X-Google-Smtp-Source: AGHT+IHc8Oeysh1zd/3c/MJAxfuVtumW8LgR8di58HJ9YVeX3I6YDXp4kXj/gs55syfZG24jyTR0lw==
X-Received: by 2002:a05:6512:4013:b0:549:38eb:d694 with SMTP id 2adb3069b0e04-558fa8f915fmr2504822e87.26.1752169139652;
        Thu, 10 Jul 2025 10:38:59 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b8185csm431191e87.246.2025.07.10.10.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:38:58 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 5/5] linux-serial-test: Add patch for CMake 4+ compatibility
Date: Thu, 10 Jul 2025 20:38:27 +0300
Message-ID: <20250710173827.43239-5-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250710173827.43239-1-alperyasinak1@gmail.com>
References: <20250710173827.43239-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 17:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118420

Fix:

| CMake Error at CMakeLists.txt:4 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../0001-allow-build-with-cmake-4.patch       | 43 +++++++++++++++++++
 .../linux-serial-test_git.bb                  |  3 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-test/linux-serial-test/linux-serial-test/0001-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-test/linux-serial-test/linux-serial-test/0001-allow-build-with-cmake-4.patch b/meta-oe/recipes-test/linux-serial-test/linux-serial-test/0001-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..0b67ad03b1
--- /dev/null
+++ b/meta-oe/recipes-test/linux-serial-test/linux-serial-test/0001-allow-build-with-cmake-4.patch
@@ -0,0 +1,43 @@
+From 83ec3d72913cbdee0c0f27fe74f77bf2ef1d1901 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Thu, 10 Jul 2025 14:11:22 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:4 (cmake_minimum_required):
+|   Compatibility with CMake < 3.5 has been removed from CMake.
+|
+|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+|   to tell CMake that the project requires at least <min> but has been updated
+|   to work with policies introduced by <max> or earlier.
+|
+|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Upstream-Status: Submitted [https://github.com/cbrake/linux-serial-test/pull/60]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 10e3968..4ce6ef1 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ # SPDX-License-Identifier: MIT
+ 
+ project(linux-serial-test C)
+-cmake_minimum_required(VERSION 2.6)
++cmake_minimum_required(VERSION 3.5)
+ add_executable(linux-serial-test linux-serial-test.c)
+ target_link_libraries(linux-serial-test rt)
+ install(TARGETS linux-serial-test DESTINATION bin)
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
index c617cf09a3..a451db2a76 100644
--- a/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
+++ b/meta-oe/recipes-test/linux-serial-test/linux-serial-test_git.bb
@@ -3,7 +3,8 @@ HOMEPAGE = "https://github.com/cbrake/linux-serial-test"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSES/MIT;md5=544799d0b492f119fa04641d1b8868ed"
 
-SRC_URI = "git://github.com/cbrake/linux-serial-test.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/cbrake/linux-serial-test.git;protocol=https;branch=master \
+        file://0001-allow-build-with-cmake-4.patch"
 
 PV = "0+git"
 SRCREV = "2ee61484167eab846f7b7c565284d7c350d738d3"
-- 
2.43.0


