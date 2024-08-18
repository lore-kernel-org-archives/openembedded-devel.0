Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB4A0C531DF
	for <webhook@archiver.kernel.org>; Sun, 18 Aug 2024 22:56:32 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.198863.1724021783815988888
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Aug 2024 15:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yt/jTRym;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70d1d6369acso2996141b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Aug 2024 15:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724021783; x=1724626583; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6c7GBZh26005cOHpiMFroS0J8XRj3xnc21XDJhcJf6Y=;
        b=Yt/jTRymZX8O+S0mL2TNSn1XPE5fiG+6caknFE4/89iG49eQMffWbG4hbZI11Q+gOP
         +8T6z5U+pBInkYgjB4PY0+h9xwXEfyaW31V2maXaHV4V3cQVpH8y5foHL1G44XIRskBL
         4wmAx9zWTlnPprxU/Mp/ZOJOEVVs82Z4B/kpCQQ4om/3EHKhblZ85sFpCDhor8DEF4/Q
         EsZVFmatnG0Q9lhGdEZdoPDrrWVa9+WrZriTsCVYUc73CmhN/ZmN1xMsGlY7tR4PQsGV
         vKFlka4UIiiJi1vh2ah0YmxX4gpTnFnZ2qngVH94gtml7Kcn2iN5rmKCt/2DdKHwPgOd
         bjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724021783; x=1724626583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6c7GBZh26005cOHpiMFroS0J8XRj3xnc21XDJhcJf6Y=;
        b=OHWvTcL7SBSPrlbO3m46rUF3Y0QBUlJBI0VuzgcyyDpYYzO8kXa+8g+oKf4vwfFkXI
         4kBrrBwVxHVLE/2ufLbgy0b4uWyuP9tcgz+eBwF0hKOq1KFeBFrobHqG9Sge+dHt/FiW
         WdRLi89UcJHT0vYpZQ6EdI7JgdnHsqL1iwjWs2ALzDsgaH3es5oVzqAxlyEKe07TmfsG
         G8wRVsKYrGmCmddimghpalNZObUTchM1+pfIz9axwCK3TG8ruBuXFI49FAHV2K0Llexd
         83+R1h9URLdga9V2yVqAslrQv2EH4rFDW4QIU9B62xOfd46+H9nFRwC5E/bc8kmo8D+N
         i7NA==
X-Gm-Message-State: AOJu0YwwcgNrFzRoqlhc6+mQZysALZnrRTtqqDZo9efU0D/UgfPexpn8
	K8dsKXUhRUTibvxJNH3m3yPb2+kkwx7HmK0Onula+RjpzL6n4ccR/ufj9w==
X-Google-Smtp-Source: AGHT+IE3JEh5n0Of/6fJdyLPVHgJ0EZZOCTaCqaRPEFzwihu+HVrBp9IHgJtsmjQxS74RpJe3xZ/iQ==
X-Received: by 2002:a05:6a20:d528:b0:1c2:a29b:efb4 with SMTP id adf61e73a8af0-1c9aad2bb9cmr13627704637.24.1724021782647;
        Sun, 18 Aug 2024 15:56:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9149])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b61c6730sm6564146a12.26.2024.08.18.15.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 15:56:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/5] fwknop: Upgrade to 2.6.11
Date: Sun, 18 Aug 2024 15:56:16 -0700
Message-ID: <20240818225620.2226473-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Aug 2024 22:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111839

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...with-GCC-s-fno-common-flag-fixes-305.patch | 27 -----------------
 ...figure.ac-Fix-missing-comma-in-AS_IF.patch | 29 -------------------
 .../{fwknop_2.6.10.bb => fwknop_2.6.11.bb}    |  8 ++---
 3 files changed, 3 insertions(+), 61 deletions(-)
 delete mode 100644 meta-networking/recipes-support/fwknop/fwknop/0001-Fix-compilation-with-GCC-s-fno-common-flag-fixes-305.patch
 delete mode 100644 meta-networking/recipes-support/fwknop/fwknop/0001-configure.ac-Fix-missing-comma-in-AS_IF.patch
 rename meta-networking/recipes-support/fwknop/{fwknop_2.6.10.bb => fwknop_2.6.11.bb} (77%)

diff --git a/meta-networking/recipes-support/fwknop/fwknop/0001-Fix-compilation-with-GCC-s-fno-common-flag-fixes-305.patch b/meta-networking/recipes-support/fwknop/fwknop/0001-Fix-compilation-with-GCC-s-fno-common-flag-fixes-305.patch
deleted file mode 100644
index e696ac4ead..0000000000
--- a/meta-networking/recipes-support/fwknop/fwknop/0001-Fix-compilation-with-GCC-s-fno-common-flag-fixes-305.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 5aea816f27a71e6c88ad50e7326fa6584eeb7ad9 Mon Sep 17 00:00:00 2001
-From: Francois Marier <francois@debian.org>
-Date: Fri, 24 Jul 2020 21:22:47 -0700
-Subject: [PATCH] Fix compilation with GCC's -fno-common flag (fixes #305)
-
-Upstream-Status: Submitted [https://github.com/mrash/fwknop/pull/319]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- client/log_msg.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/client/log_msg.h b/client/log_msg.h
-index cc17716..3dda161 100644
---- a/client/log_msg.h
-+++ b/client/log_msg.h
-@@ -38,7 +38,7 @@ enum
-     LOG_VERBOSITY_INFO,         /*!< Constant to define a INFO message */
-     LOG_VERBOSITY_DEBUG,        /*!< Constant to define a DEBUG message */
-     LOG_LAST_VERBOSITY
--} log_level_t;
-+};
- 
- #define LOG_DEFAULT_VERBOSITY   LOG_VERBOSITY_NORMAL    /*!< Default verbosity to use */
- 
--- 
-2.28.0
-
diff --git a/meta-networking/recipes-support/fwknop/fwknop/0001-configure.ac-Fix-missing-comma-in-AS_IF.patch b/meta-networking/recipes-support/fwknop/fwknop/0001-configure.ac-Fix-missing-comma-in-AS_IF.patch
deleted file mode 100644
index f3e1707408..0000000000
--- a/meta-networking/recipes-support/fwknop/fwknop/0001-configure.ac-Fix-missing-comma-in-AS_IF.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From fee4cb0ae2d1fcd012cb7f501c3db0d8ec910798 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 2 Apr 2023 10:01:51 -0700
-Subject: [PATCH] configure.ac: Fix missing  comma in AS_IF
-
-this is flagged with autconf 2.72
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 47a069e..9cdfd3f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -744,7 +744,7 @@ dnl
-             IPFW_EXE=""
-             IPTABLES_EXE=""
-             FIREWALLD_EXE=""
--          ]
-+          ],
-         ]
-       ]
-     ]
--- 
-2.40.0
-
diff --git a/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb b/meta-networking/recipes-support/fwknop/fwknop_2.6.11.bb
similarity index 77%
rename from meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb
rename to meta-networking/recipes-support/fwknop/fwknop_2.6.11.bb
index a1f56cdf16..c9f9596eb4 100644
--- a/meta-networking/recipes-support/fwknop/fwknop_2.6.10.bb
+++ b/meta-networking/recipes-support/fwknop/fwknop_2.6.11.bb
@@ -1,16 +1,14 @@
 SUMMARY = "fwknop - Single Packet Authorization"
 HOMEPAGE = "http://www.cipherdyne.org/fwknop/"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-		    "
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
 inherit autotools-brokensep pkgconfig
 
 SRC_URI = "http://www.cipherdyne.org/${BPN}/download/${BPN}-${PV}.tar.bz2 \
-           file://0001-Fix-compilation-with-GCC-s-fno-common-flag-fixes-305.patch \
            file://0001-Use-pkg-config-to-find-gpgme.patch \
-	   file://0001-configure.ac-Fix-missing-comma-in-AS_IF.patch \
           "
-SRC_URI[sha256sum] = "f6c09bec97ed8e474a98ae14f9f53e1bcdda33393f20667b6af3fb6bb894ca77"
+SRC_URI[sha256sum] = "a4ec7c22dd90dd684f9f7b96d3a901c4131ec8c7a3b9db26d0428513f6774c64"
 
 DEPENDS = "libpcap gpgme"
 

