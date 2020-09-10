Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web11.26935.1599757054505154210
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2020 09:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M5fy6XS1;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id y6so1218378plt.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2020 09:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hna1bytfAMfq1fyJMZE860i1BDnrAMp14/dE9a6DXGE=;
        b=M5fy6XS1u3umOV2l+WuWVvC8A4S5oXo/oVFPlJB9s40ko0wbYDCGWq4Ybs3ZdpR53O
         TE6EA1MHwNKCgawB/kVQMrIUcGYizQLCjwFEOVvSvhjgts+uM6I7kIpGe9YwJyyy2Ztt
         fpwo4YcBMM64PHTTEhQ6V8zQ9yaa7mUKx+vUgV26gE4M9haPCFvZC0Fs0CamzwIalE4r
         fkdW0kDkrKpKSGLJ6cddr9XcxhKjqvdfT12aFMC1pq+HFwTOURl8JLCoChH+SOPVpKoH
         4fgemc/Ocl8TaZEONx62iJx8JVHojrkGbllMlCk/P9ZFe6cRZOMlMiiATrzh6oQTt8zF
         meeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hna1bytfAMfq1fyJMZE860i1BDnrAMp14/dE9a6DXGE=;
        b=SzONTBga5zJvVS8FUuogdYQamMeWc6/r1ilTeSgkG5c7jyBHv4li3LBytf94sl+hV3
         3Ez76GDY8Tlza8iqPKLJHn3HeZxeN/v2D4oIq5eNPcVY4z5FP/GmnfuZBVBOTP42vN0p
         pihL7dLxbId3xvWGgPyIXKNpO3bVLVBAu8hUYP0lozJHAuF6JRsxvWTe2SfmCQNMvqNe
         FawCDOyvIfNuimxSEZqRpLGPtk3okPDKNAuSLUD/pAA7Mj9JGYbR7klV7rh1Qw2Ik7r5
         2jlrpooWZmtLf9hVnNT5VPkazytMdLWqWiuR8BUDSVO/h3uF+DTUoYE8ETCu/L6Waike
         6Fxw==
X-Gm-Message-State: AOAM533dFUIEPqJVwMDMgigeqWgZmYfHI2njFzb0emS/N7SQyzgWh3fc
	keEGfYcD2OeAKW6aD4G/umBuADyBxukhiA==
X-Google-Smtp-Source: ABdhPJzUk21rTgGTI88agcWRFpmR6iP4F0mn/f0NloRfirgOF789Wbr0WBe/5EkzuZFrAs5vAZPyyw==
X-Received: by 2002:a17:90a:e609:: with SMTP id j9mr755787pjy.129.1599757053380;
        Thu, 10 Sep 2020 09:57:33 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d92c])
        by smtp.gmail.com with ESMTPSA id z4sm6449349pfr.197.2020.09.10.09.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 09:57:32 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] android-tools: Support libselinux to build with musl which now has gettid
Date: Thu, 10 Sep 2020 09:57:30 -0700
Message-Id: <20200910165730.2269899-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-define-gettid-if-glibc-2.30-is-use.patch | 21 ++++++++-----------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch b/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
index 8524517cb6..87771cba85 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
@@ -29,24 +29,21 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/src/procattr.c
 +++ b/src/procattr.c
-@@ -8,7 +8,19 @@
+@@ -8,12 +8,16 @@
  #include "selinux_internal.h"
  #include "policy.h"
  
 -#ifndef __BIONIC__
 +/* Bionic and glibc >= 2.30 declare gettid() system call wrapper in unistd.h and
 + * has a definition for it */
-+#ifdef __BIONIC__
-+  #define OVERRIDE_GETTID 0
-+#elif !defined(__GLIBC_PREREQ)
-+  #define OVERRIDE_GETTID 1
-+#elif !__GLIBC_PREREQ(2,29)
-+  #define OVERRIDE_GETTID 1
-+#else
-+  #define OVERRIDE_GETTID 0
-+#endif
-+
-+#if OVERRIDE_GETTID
++#if defined(__GLIBC_)
++#if !__GLIBC_PREREQ(2,30)
  static pid_t gettid(void)
  {
  	return syscall(__NR_gettid);
+ }
+ #endif
++#endif
+ 
+ static int getprocattrcon(char ** context,
+ 			  pid_t pid, const char *attr)
-- 
2.28.0

