Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7808DC83F2C
	for <webhook@archiver.kernel.org>; Sun,  3 Sep 2023 13:32:46 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.27429.1693747956134655241
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Sep 2023 06:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ExDaYC6q;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-52683b68c2fso723297a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Sep 2023 06:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693747954; x=1694352754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOAsK9yGewhlljVjjkKRA8dRZqj2ipNpBRwMXZuLUL0=;
        b=ExDaYC6qxpi0VgwRVHrNzg4xBAoC14RZll5HKvkAbHOAQF491XJz8smhh+1Eou5hvc
         3pyjAJzi/7dSGrdqzgdOMlvgAa7Bkzxq7bhgI4zxo0UgJy2w55CX828qW3sKpxjfMvbE
         rKK3y8fpYVh8WACip1s2kg0KIR2TDnP7IkJIDKU4+R3FuaEYsXHeM1VdsuHxL9LpDntm
         dkbHxJWhLI7EycO9We7R+boRygep/GNuDm+lvr1G4FBU60gE36l8bWO4qBHvI1ik56mA
         //2wL19OuPIfWpTpjmMJAJ9LPhOSGzJrymV8aCtQnuQsshA4VmyWwNu31y9y6SZy/qeP
         CK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693747954; x=1694352754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOAsK9yGewhlljVjjkKRA8dRZqj2ipNpBRwMXZuLUL0=;
        b=SeAX46D0G8tukUeRB3govOoXfJksfL6xAIFs+DovggC4ZfFxUE8bWaeTSVxDuNgvZ6
         URYeYnWPj7XrYSYbVbrMkH6hnwSGD1i5UR/RDmtPUdtFxsc6PYGxp8hTSJQMW7+HDnR1
         Z0GKA/i9rF53/IqbjCI3EaGmoPOHsxl11XQzYnLTkMNvlPwhoxDkXT9xTBhx3Zo2Gjbc
         6GyjeI6qxiHyA7HTZ+uxXKJKSh9onmEEeDyufz707AU/KdA6jGQnmRTdZy3R3b5oAVAW
         uZcfyhxYxxy1qg+XwS88lRsa5Q3Q67E4erppd3boiP6yi1mdUW/8MZByngNPseFBQ1ul
         P42Q==
X-Gm-Message-State: AOJu0YzLMwIJim/DI+XW01rit57/K9jXkytmW9163ZNpYMg5Z2RvEuZY
	C7CT4I5wBOJ6U+QhCQvJDUQLgL6u0M4=
X-Google-Smtp-Source: AGHT+IE9SdV7/auJgKYdTWr2+Q6HaUUXjbmvJOaUNxRUbPKz113/MCkQLaAuxOeNGNlOueBHUcwFrQ==
X-Received: by 2002:aa7:d9cd:0:b0:522:3a89:a7bc with SMTP id v13-20020aa7d9cd000000b005223a89a7bcmr4909432eds.42.1693747954562;
        Sun, 03 Sep 2023 06:32:34 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id r7-20020aa7cb87000000b0052996528b81sm4478602edt.45.2023.09.03.06.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 06:32:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/4] libcyusbserial: fix installed-vs-shipped QA issue with multilib
Date: Sun,  3 Sep 2023 15:32:10 +0200
Message-ID: <20230903133212.455899-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230903133212.455899-1-Martin.Jansa@gmail.com>
References: <20230903133212.455899-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Sep 2023 13:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104698

* testing ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR} existence
  doesn't really work in cross compilation and on some hosts was causing:

  ERROR: QA Issue: libcyusbserial: Files/directories were installed but not shipped in any package:
    /usr/lib/libcyusbserial.so.1
    /usr/lib/libcyusbserial.so
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  libcyusbserial: 2 installed and not shipped files. [installed-vs-shipped]

  with multilib using /usr/lib32 or /usr/lib64 when the same didn't
  exist on host.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...on-t-fall-back-CMAKE_INSTALL_LIBDIR-.patch | 43 +++++++++++++++++++
 .../libcyusbserial/libcyusbserial_git.bb      |  4 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libcyusbserial/libcyusbserial/0001-CMakeLists.txt-don-t-fall-back-CMAKE_INSTALL_LIBDIR-.patch

diff --git a/meta-oe/recipes-support/libcyusbserial/libcyusbserial/0001-CMakeLists.txt-don-t-fall-back-CMAKE_INSTALL_LIBDIR-.patch b/meta-oe/recipes-support/libcyusbserial/libcyusbserial/0001-CMakeLists.txt-don-t-fall-back-CMAKE_INSTALL_LIBDIR-.patch
new file mode 100644
index 0000000000..d9e10469d3
--- /dev/null
+++ b/meta-oe/recipes-support/libcyusbserial/libcyusbserial/0001-CMakeLists.txt-don-t-fall-back-CMAKE_INSTALL_LIBDIR-.patch
@@ -0,0 +1,43 @@
+From 655c5c32b37a2bea12389ed69c0869215fcf5abe Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sun, 3 Sep 2023 11:22:35 +0200
+Subject: [PATCH] CMakeLists.txt: don't fall back CMAKE_INSTALL_LIBDIR to lib
+
+* testing ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR} existence
+  doesn't really work in cross compilation and on some hosts was causing:
+
+  ERROR: QA Issue: libcyusbserial: Files/directories were installed but not shipped in any package:
+    /usr/lib/libcyusbserial.so.1
+    /usr/lib/libcyusbserial.so
+  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
+  libcyusbserial: 2 installed and not shipped files. [installed-vs-shipped]
+
+  with multilib using /usr/lib32 or /usr/lib64 when the same didn't
+  exist on host.
+
+Upstream-Status: Pending
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ lib/CMakeLists.txt | 9 ---------
+ 1 file changed, 9 deletions(-)
+
+diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
+index 2b031cb..53a7263 100644
+--- a/lib/CMakeLists.txt
++++ b/lib/CMakeLists.txt
+@@ -6,15 +6,6 @@ if (NOT CMAKE_INSTALL_LIBDIR)
+ include(GNUInstallDirs)
+ endif (NOT CMAKE_INSTALL_LIBDIR)
+ 
+-# Fall back to just "lib" if the item provided by GNUInstallDirs doesn't exist
+-# For example, on Ubuntu 13.10 with CMake 2.8.11.2,
+-# /usr/lib/${CMAKE_LIBRARY_ARCHITECTURE} doesn't exist.
+-if (NOT EXISTS "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}")
+-    message(STATUS "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR} does not exist. Defaulting libcyusbserial install location to ${CMAKE_INSTALL_PREFIX}/lib.")
+-        set(CMAKE_INSTALL_LIBDIR lib)
+-endif()
+-
+-
+ ################################################################################
+ # Include paths
+ ################################################################################
diff --git a/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb b/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
index 81453fb888..a69194996b 100644
--- a/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
+++ b/meta-oe/recipes-support/libcyusbserial/libcyusbserial_git.bb
@@ -8,7 +8,9 @@ DEPENDS = "libusb udev"
 PV = "1.0.0+git${SRCPV}"
 
 SRCREV = "655e2d544183d094f0e2d119c7e0c6206a0ddb3f"
-SRC_URI = "git://github.com/cyrozap/${BPN}.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/cyrozap/${BPN}.git;branch=master;protocol=https \
+    file://0001-CMakeLists.txt-don-t-fall-back-CMAKE_INSTALL_LIBDIR-.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.42.0


