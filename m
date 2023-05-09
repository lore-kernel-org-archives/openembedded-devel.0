Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BADE6C7EE2D
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 07:07:10 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.25853.1683616028524249602
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 00:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HVm1EJYS;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f423ac6e2dso14864195e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 00:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683616027; x=1686208027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9ieuQPCEI5ko4usvpKPzFADY7xrSoakE4gV5esaV7M=;
        b=HVm1EJYSctNS7VYVbAM8Q1r2yiZyEhmaXa8nD5TVZIxYGYQttIA6oJXmN/kGe0/iBg
         haIAVI+ns+t6iYUld2EubwmfoCSQ3qNXFyikZSaQCC9L15dVLXFVhE+jSg2oCOjZcst7
         3VObJB28V+YzBBrXQ70APQVcaiJckbriY936a8Bn8q6AyoI5WCZde40SuTrrMM1ll9vw
         OxN1YdHW4NXEXDAMEBmLg4vaURRNxtvyhopPu+5r8wI5xOod2ZuwYaDZSwfLX5BZABF7
         TEv4N2pgiPqU7BcOWk01HF3ICyMGZetiGP+yR1N31H3XpAFPjdY53XBt3PWlSO0MqINR
         38Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683616027; x=1686208027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9ieuQPCEI5ko4usvpKPzFADY7xrSoakE4gV5esaV7M=;
        b=lRR3WKL1CVmRWBNscuFnroJh7GhtAVW5A6ZmaE7MJk9pce9QuT6LqRRlTb8zYhYaZS
         IkQscszsb7zIjjBrmKsA9GzuS+5vBQjciynDeXTYN9jtWaffRMDIGqvF8SO+qWlobmYz
         yR25aRkYGreUNf+jIrGX79O3evMjpf4b5DwDc0SeMGIIx2mjRlV98Vaz7ebtDx+4lWa1
         0KxDNCAICv82KCz4JXQLVfLqY9cF5K1i9GzA92Ss00qPfqwPaGjjdApCLknQ6Esd1XK1
         JyAdsRSPMlBi+NdSI5qzWnhnoyEwjr48R6yYdYfjcxzppVtqATSOIbfgZnQ7e+79VM3r
         HMMg==
X-Gm-Message-State: AC+VfDxbp4HaBcnGmKB/k/yzaNcNjWtntUUFfT3fMjXyIf6aWnrvLjyY
	DvfNlclVRub56EhdHMT5RU7uGQrcmJY=
X-Google-Smtp-Source: ACHHUZ4MryZVe4HnzrQF2v9CQV2p354WspFJSV1nmLL/tfugD+mBI77GIQTBjdMJpOsXZ8DH8nZoRg==
X-Received: by 2002:a7b:c7cb:0:b0:3f4:2cb2:a6cf with SMTP id z11-20020a7bc7cb000000b003f42cb2a6cfmr317691wmk.10.1683616027030;
        Tue, 09 May 2023 00:07:07 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id t6-20020a1c7706000000b003f42cc7aac4sm400302wmi.37.2023.05.09.00.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:07:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][mickledore][PATCH 11/16] libnfs: fix installed-vs-shipped issues with multilib
Date: Tue,  9 May 2023 09:06:50 +0200
Message-Id: <20230509070655.70784-11-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509070655.70784-1-Martin.Jansa@gmail.com>
References: <20230509070655.70784-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 07:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102479

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...espect-CMAKE_INSTALL_LIBDIR-for-mult.patch | 61 +++++++++++++++++++
 .../libnfs/libnfs_5.0.2.bb                    |  4 +-
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/libnfs/libnfs/0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch

diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs/0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch b/meta-oe/recipes-connectivity/libnfs/libnfs/0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch
new file mode 100644
index 0000000000..55595104aa
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs/0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch
@@ -0,0 +1,61 @@
+From 95708ff427c12b58e53fab225a08c811ca358394 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 3 May 2023 22:27:10 +0200
+Subject: [PATCH] CMakeLists.txt: respect ${CMAKE_INSTALL_LIBDIR} for multilib
+
+* fixes:
+  ERROR: libnfs-5.0.2-r0 do_package: QA Issue: libnfs: Files/directories were installed but not shipped in any package:
+    /usr/lib/libnfs.so
+    /usr/lib/libnfs.so.11.1.0
+    /usr/lib/libnfs.so.5.0.2
+    /usr/lib/pkgconfig
+    /usr/lib/cmake
+    /usr/lib/pkgconfig/libnfs.pc
+    /usr/lib/cmake/libnfs
+    /usr/lib/cmake/libnfs/libnfs-config-version.cmake
+    /usr/lib/cmake/libnfs/libnfs-config.cmake
+    /usr/lib/cmake/libnfs/libnfs-config-noconfig.cmake
+    /usr/lib/cmake/libnfs/FindNFS.cmake
+  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
+  libnfs: 11 installed and not shipped files. [installed-vs-shipped]
+
+  when libdir is /usr/lib64 with multilib
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Upstream-Status: Pending
+---
+ CMakeLists.txt     | 6 +++---
+ lib/CMakeLists.txt | 4 ++--
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4fb0fe7..8e5a0e4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -6,11 +6,11 @@ project(libnfs
+ 
+ set(SOVERSION 11.1.0 CACHE STRING "" FORCE)
+ 
+-set(INSTALL_LIB_DIR "${CMAKE_INSTALL_PREFIX}/lib" CACHE PATH "Installation directory for libraries")
++set(INSTALL_LIB_DIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}" CACHE PATH "Installation directory for libraries")
+ set(INSTALL_INC_DIR "${CMAKE_INSTALL_PREFIX}/include" CACHE PATH "Installation directory for headers")
+ set(INSTALL_MAN_DIR "${CMAKE_INSTALL_PREFIX}/share/man" CACHE PATH "Installation directory for manual pages")
+-set(INSTALL_PKGCONFIG_DIR "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" CACHE PATH "Installation directory for pkgconfig (.pc) files")
+-set(INSTALL_CMAKE_DIR "${CMAKE_INSTALL_PREFIX}/lib/cmake/libnfs" CACHE PATH "Installation directory for cmake (.cmake) files")
++set(INSTALL_PKGCONFIG_DIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/pkgconfig" CACHE PATH "Installation directory for pkgconfig (.pc) files")
++set(INSTALL_CMAKE_DIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/cmake/libnfs" CACHE PATH "Installation directory for cmake (.cmake) files")
+ 
+ option(BUILD_SHARED_LIBS "Build shared libraries" ON)
+ option(ENABLE_TESTS "Build and run test programs" OFF)
+diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
+index 88ba7b8..5ff89dc 100644
+--- a/lib/CMakeLists.txt
++++ b/lib/CMakeLists.txt
+@@ -23,5 +23,5 @@ set_target_properties(nfs PROPERTIES
+ 
+ install(TARGETS nfs EXPORT libnfs
+                     RUNTIME DESTINATION bin
+-                    ARCHIVE DESTINATION lib
+-                    LIBRARY DESTINATION lib)
++                    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
++                    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb b/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb
index 7a40f4efc3..e0df18a50c 100644
--- a/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://github.com/sahlberg/libnfs"
 LICENSE = "LGPL-2.1-only & BSD-2-Clause & GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=825301ba17efc9d188ee0abd4b924ada"
 
-SRC_URI = "git://github.com/sahlberg/libnfs.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/sahlberg/libnfs.git;protocol=https;branch=master \
+    file://0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch \
+"
 SRCREV = "40348f45d6beb8a8f50b6b63414a98fc1a061b7d"
 S = "${WORKDIR}/git"
 
-- 
2.40.1


