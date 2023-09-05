Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99ED4CA0FF3
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 13:02:52 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.20709.1693918964248609856
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 06:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=kHhR7gDj;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9a5dff9d2d9so369282666b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Sep 2023 06:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693918962; x=1694523762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OASM69LxDTU3Ppv42MzUnZEAGrg8ZLUJmzn0IVdcUiw=;
        b=kHhR7gDjeL0zrd+kIzdqB+kiP2g3xch2kHbwIye3baMgPztwlmC8kA8ztinz23PSGX
         S8FPgr3VpG0zv9W4XKnNIwDG5GlZBMELa6VxH6Zksr2+2Jolgkuhbq9neP911krH095n
         LgOWkPYjQ2eyQ5mLDxMDdjcO42UnKN8RXB0pr9XWn1jN9QZf/Mviya07aFSa9wZFaQU6
         1ednfIqOTtPV+Sb8X3Xc6ORUYjCPhNbpnVTQm7RHhk8KsHI+eNEG0qzVje77H/5reVDA
         f5lxvFkM2T9gZhA780BNkTvUVRcCqJ7pXSHHic8n4h8ibi4kLKBHS5PnZlag7u9KJzJS
         LrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693918962; x=1694523762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OASM69LxDTU3Ppv42MzUnZEAGrg8ZLUJmzn0IVdcUiw=;
        b=EKNOLdCoy1pDaZnV5XN6bjfGxcHvOFbcMYBggntQ6FNBvC30otp2UdTuQBt0vGT2bd
         GKgjfvQVH4MTX7cK9Si4s2onv88wLyG2ITm6zqLEtwKycPtTuYUCkAmMp9ntq4EP5jRk
         CcvuwrnuRZdIWis6iNw9r//MMIl5AwwkzOrFtugFfIWELPOW2AQ47M/QAqw4pKrAuyOO
         FC0uRL+iR0P+f55lDIPIZKD9T1NxNh3HGG4Bu1uHbmM4rcbMQZnAFhb+owC8V3avmnH9
         eC0kZn0aVtBzoONjhY26Yad2ZweP2H9FDT+xC44l2grkgIEC9TRhQ8VptT0x7jmOyioL
         MJ7g==
X-Gm-Message-State: AOJu0YyxrZAS/mf92zihR2fYKIYfa4HNbzPCmUOT0yRCvol93FEJZazF
	fT6j/eKvxiyKfH6U7n8QdmT600o3+e0=
X-Google-Smtp-Source: AGHT+IGx7uTZ+nlQTF7IrIPu2PMUDcXkpTEBqLqULrGh3Cdbi37w6OX+QwBhscSXgnXT6DGFrbhLUw==
X-Received: by 2002:a17:906:3149:b0:9a5:cade:8044 with SMTP id e9-20020a170906314900b009a5cade8044mr9104699eje.21.1693918962267;
        Tue, 05 Sep 2023 06:02:42 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id sb5-20020a170906edc500b0099293cdbc98sm7721626ejb.145.2023.09.05.06.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 06:02:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 3/4] libcyusbserial: fix installed-vs-shipped QA issue with multilib
Date: Tue,  5 Sep 2023 15:02:21 +0200
Message-ID: <20230905130222.1448129-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230905130222.1448129-1-Martin.Jansa@gmail.com>
References: <20230905130222.1448129-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Sep 2023 13:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104724

From: Martin Jansa <martin.jansa@gmail.com>

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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


