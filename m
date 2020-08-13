Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.1456.1597342377263427492
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 11:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KMibBKfW;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id f193so3204290pfa.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 11:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wrFePGqwFahrjUquq3vAEQRFvoL92QkCVuN/EqfideQ=;
        b=KMibBKfWyRujKJAhwCGoi37yN4Bc2dfY+HCKRofQXXQjZVPVhmYJivDWEy58YVtR1G
         YF79ZzqbnH2uAZ1nrL/q7FKBGeWBJPWPEhngxzf62R8VBIsvWaoQ8Lk1n0lK1wD4oQSk
         IsRweU9CtRO9UwSGBiRpVppVGXBftnjffUuGqzUNc56K58bvDqUBAgliwMYiU425DoEc
         IAi59s+RNCT3WOqlNU9+oktsg1Rc2jYhMqZZgsNc3qVzz6Wr9EuwrAHIy6uHyHsj2J2u
         urEw0Dvry4N0PXDWyoCZfQwnGDNi4Fhzi5l5akFETrRlJexSG2VUMB3ITbxuiH0uUSPH
         G1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wrFePGqwFahrjUquq3vAEQRFvoL92QkCVuN/EqfideQ=;
        b=RnvcJIuUaUHnDbX7YJZlyZC9B2SWGThV6b02WAG+PB/3Hks0Cjw+VK0NYZp1O55bRR
         OSe80zLZ9W0WYpUPUCVce/nEdUBXbieJpuD1mq5euXYJr3cx8zSZ6/YM02GzB/MUIvtf
         nLWDlsBeIpvv+Lkh9E/r8u5hSd3OJEgn+vYwJlmZ7BEhYIkojroH2jtY/B+ewEdIUJmb
         Xb8iKpoqtuPmHs8YgX4JOc2t7bmWWu6NbrMkc06bfMD/CB39gU0RoaF9/PBw1XTQ0KPt
         jrWzixxsg0PwdWb/Gk0kw6uwa6bbdfIczDDgvHk9DHvPJK0Hvc2ROKEpZ47/eruwR6cd
         tZ+g==
X-Gm-Message-State: AOAM532+L505hIbjnW9CO7b2v0u15+925qilcIeIUqryjTKWcmZrIpzS
	/KVnVUTrU02wMwTQip80L4Ql7V7Q3UU=
X-Google-Smtp-Source: ABdhPJxOfGYtrMPlX/CYhmrPssIhL4NMvb0zkxl8EMQhAsXOD9zSnI2agpdHBXbF4vu6Lazc4+XfaA==
X-Received: by 2002:a62:7ac2:: with SMTP id v185mr5560149pfc.277.1597342376431;
        Thu, 13 Aug 2020 11:12:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id h12sm6719678pfr.143.2020.08.13.11.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 11:12:55 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 3/3] owfs: Fix build with -fno-common
Date: Thu, 13 Aug 2020 11:12:52 -0700
Message-Id: <20200813181252.805078-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813181252.805078-1-raj.khem@gmail.com>
References: <20200813181252.805078-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-compilation-with-GCC10.patch     | 44 +++++++++++++++++++
 .../recipes-filesystems/owfs/owfs_3.2p3.bb    |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/owfs/owfs/0001-Fix-compilation-with-GCC10.patch

diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs/0001-Fix-compilation-with-GCC10.patch b/meta-filesystems/recipes-filesystems/owfs/owfs/0001-Fix-compilation-with-GCC10.patch
new file mode 100644
index 0000000000..6426ecb247
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/owfs/owfs/0001-Fix-compilation-with-GCC10.patch
@@ -0,0 +1,44 @@
+From a812202d22a2861318b8e39f1cd74cd222f8e76f Mon Sep 17 00:00:00 2001
+From: "Azamat H. Hackimov" <azamat.hackimov@gmail.com>
+Date: Tue, 9 Jun 2020 11:30:38 +0300
+Subject: [PATCH] Fix compilation with GCC10
+
+Fixed compilation with -fno-common, which enabled in GCC 10 by default.
+See https://bugs.gentoo.org/707438.
+
+Upstream-Status: Backport [https://github.com/owfs/owfs/pull/62]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ module/owserver/src/c/owserver.c       | 2 ++
+ module/owserver/src/include/owserver.h | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/module/owserver/src/c/owserver.c b/module/owserver/src/c/owserver.c
+index db29988e..2ed29161 100644
+--- a/module/owserver/src/c/owserver.c
++++ b/module/owserver/src/c/owserver.c
+@@ -36,6 +36,8 @@
+ 
+ #include "owserver.h"
+ 
++pthread_mutex_t persistence_mutex ;
++
+ /* --- Prototypes ------------ */
+ static void SetupAntiloop(int argc, char **argv);
+ 
+diff --git a/module/owserver/src/include/owserver.h b/module/owserver/src/include/owserver.h
+index 8be582f0..a257ed02 100644
+--- a/module/owserver/src/include/owserver.h
++++ b/module/owserver/src/include/owserver.h
+@@ -18,7 +18,7 @@
+ #include "ow.h"
+ #include "ow_connection.h"
+ 
+-pthread_mutex_t persistence_mutex ;
++extern pthread_mutex_t persistence_mutex ;
+ #define PERSISTENCELOCK    _MUTEX_LOCK(   persistence_mutex ) ;
+ #define PERSISTENCEUNLOCK  _MUTEX_UNLOCK( persistence_mutex ) ;
+ 
+-- 
+2.28.0
+
diff --git a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
index 414084449f..7f56c88fcc 100644
--- a/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
+++ b/meta-filesystems/recipes-filesystems/owfs/owfs_3.2p3.bb
@@ -12,6 +12,7 @@ DEPENDS = "fuse virtual/libusb0"
 SRCREV = "3744375dfaa350e31c9b360eb1e1a517bbeb5c47"
 SRC_URI = "git://github.com/owfs/owfs \
            file://0001-Add-build-rule-for-README.patch \
+           file://0001-Fix-compilation-with-GCC10.patch \
            file://owhttpd \
            file://owserver \
            "
-- 
2.28.0

