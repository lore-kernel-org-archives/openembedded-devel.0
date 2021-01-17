Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.21303.1610905596514938505
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nl5e9nXu;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id v1so7985742pjr.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8qK2V/aK7QfMjdkgtmoSn4NTofnL8mMLIRBkBI1xzpo=;
        b=nl5e9nXu8NhevyCICCsZgiusa0+JezRJf3vEnkw6O+Rb6UEx1wRScOke0sGxKlSZgo
         koBkXZJzUQninQT/UA7vQMwsXgWOA1inho3v55hXGkBkXa7jDZgK+VMmIigmBSeKRzMr
         tGh/7DDxV7MvCqiGeSbKUGrpLFrZUGUG77KDmKnIid6/k1LzFjjPMyL7nwFG4Vngrt3l
         A5GGMnYtvGa97Dtr8c6/jSMhxNI98AtzWGQCPyXvrxgUEDH+JxDys0H1jIjdNT8LYmqU
         LG+eQ4Tbd2K8bhGjJgRLjvumbqptcmCEMYXvXFM7iz5bChUSw25RwKcOv9Djiq6hvoue
         08mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8qK2V/aK7QfMjdkgtmoSn4NTofnL8mMLIRBkBI1xzpo=;
        b=rtfOozrPKa+fcVGtc4mSXhaIA0AuAlzmhWzulJS9TS1uLA59++zxxqYyQ0y1khFFnm
         E5UseZjyRc139/R0g90o4Yg2o+MkXLej0SAm5k8HX0DUzlotq7kJD6ky7TC2cLQ2f+N6
         yKWdnUO2KQbDhLKyuHsyLbCdQy64zMmgbw6RSp0yl3jbaurZI5EtGatc0VEJJrrILOBB
         M7PaCgpS+jF8A/K2bfhlnfDTsh5Rb1GOwYY7QnEbvXDwutZ14Ua0zBFaEWQN7XjCkpOu
         2J/oxZCrJdczhqj3JV74WMA/hYTLMSD1Hj+YABJlt7Y7wL6K/gGbd5iRvIL7SW3qzEXX
         BPAQ==
X-Gm-Message-State: AOAM530Eptf6cVYLzx15vw9/6Qj+pjf4bxDZEs4rAFmJGhb842AIO3MB
	FXAi4/mLk9jH5lz7ow07NQi1Cp4SaB42jA==
X-Google-Smtp-Source: ABdhPJwWase9qRCj24LOPPwi1lZl2grhqCdniUyHYfOI2XlQC92t0vLMH+A6wfh6sgZbi7S4GZRm6w==
X-Received: by 2002:a17:90b:33ca:: with SMTP id lk10mr22151708pjb.186.1610905595815;
        Sun, 17 Jan 2021 09:46:35 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:35 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 05/28] mcpp: Normalize the patch format of CVE
Date: Sun, 17 Jan 2021 09:46:03 -0800
Message-Id: <aaaf03ada11b7f0207c34bc5f72ffff942fee8b6.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

Because CVE-2019-14274.patch is included in ice-mcpp.patch, the cve-check-tool fails to correctly judge the CVE of the OSS. CVE-2019-14274.patch is separated from ice-mcpp.patch to fix the problem.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9301b77e3266160ffb7e9bfd69d445f0392076c8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 81874b239287126805aa176907bd52e9a7801655)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../mcpp/files/CVE-2019-14274.patch           | 34 +++++++++++++++++++
 .../mcpp/files/ice-mcpp.patch                 | 31 -----------------
 meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb   |  3 +-
 3 files changed, 36 insertions(+), 32 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/mcpp/files/CVE-2019-14274.patch

diff --git a/meta-oe/recipes-devtools/mcpp/files/CVE-2019-14274.patch b/meta-oe/recipes-devtools/mcpp/files/CVE-2019-14274.patch
new file mode 100644
index 0000000000..a0c6584ecb
--- /dev/null
+++ b/meta-oe/recipes-devtools/mcpp/files/CVE-2019-14274.patch
@@ -0,0 +1,34 @@
+From ea453aca2742be6ac43ba4ce0da6f938a7e5a5d8 Mon Sep 17 00:00:00 2001
+From: He Liu <liulonnie@gmail.com>
+Date: Tue, 4 Feb 2014 11:00:40 -0800
+Subject: [PATCH] line comment bug
+
+---
+ src/support.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/support.c b/src/support.c
+index c57eaef..e3357e4 100644
+--- a/src/support.c
++++ b/src/support.c
+@@ -188,7 +188,7 @@ static char *   append_to_buffer(
+     size_t      length
+ )
+ {
+-    if (mem_buf_p->bytes_avail < length) {  /* Need to allocate more memory */
++    if (mem_buf_p->bytes_avail < length + 1) {  /* Need to allocate more memory */
+         size_t size = MAX( BUF_INCR_SIZE, length);
+ 
+         if (mem_buf_p->buffer == NULL) {            /* 1st append   */
+@@ -1722,6 +1722,8 @@ com_start:
+                     sp -= 2;
+                     while (*sp != '\n')     /* Until end of line    */
+                         mcpp_fputc( *sp++, OUT);
++                    mcpp_fputc('\n', OUT);
++                    wrong_line = TRUE;
+                 }
+                 goto  end_line;
+             default:                        /* Not a comment        */
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/mcpp/files/ice-mcpp.patch b/meta-oe/recipes-devtools/mcpp/files/ice-mcpp.patch
index 8103cf0920..1df3ae55bc 100644
--- a/meta-oe/recipes-devtools/mcpp/files/ice-mcpp.patch
+++ b/meta-oe/recipes-devtools/mcpp/files/ice-mcpp.patch
@@ -114,37 +114,6 @@ diff -r -c -N ../mcpp-2.7.2-old/src/main.c ./src/main.c
   }
   
   int     mcpp_lib_main
-diff -r -c -N ../mcpp-2.7.2-old/src/support.c ./src/support.c
-*** ../mcpp-2.7.2-old/src/support.c	Tue Jun 10 06:02:33 2008
---- ./src/support.c	Fri May 14 12:40:56 2010
-***************
-*** 188,194 ****
-      size_t      length
-  )
-  {
-!     if (mem_buf_p->bytes_avail < length) {  /* Need to allocate more memory */
-          size_t size = MAX( BUF_INCR_SIZE, length);
-  
-          if (mem_buf_p->buffer == NULL) {            /* 1st append   */
---- 188,194 ----
-      size_t      length
-  )
-  {
-!     if (mem_buf_p->bytes_avail < length + 1) {  /* Need to allocate more memory */
-          size_t size = MAX( BUF_INCR_SIZE, length);
-  
-          if (mem_buf_p->buffer == NULL) {            /* 1st append   */
-***************
-*** 1722,1727 ****
---- 1722,1729 ----
-                      sp -= 2;
-                      while (*sp != '\n')     /* Until end of line    */
-                          mcpp_fputc( *sp++, OUT);
-+                     mcpp_fputc( '\n', OUT);
-+                     wrong_line = TRUE;
-                  }
-                  goto  end_line;
-              default:                        /* Not a comment        */
 diff -r -c -N ../mcpp-2.7.2-old/src/system.c ./src/system.c
 *** ../mcpp-2.7.2-old/src/system.c      2008-11-26 10:53:51.000000000 +0100
 --- ./src/system.c      2011-02-21 16:18:05.678058106 +0100
diff --git a/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb b/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
index b5ca495663..f8125f72d9 100644
--- a/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
+++ b/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
@@ -4,7 +4,8 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5ca370b75ec890321888a00cea9bc1d5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
-           file://ice-mcpp.patch "
+           file://ice-mcpp.patch \
+           file://CVE-2019-14274.patch"
 SRC_URI[md5sum] = "512de48c87ab023a69250edc7a0c7b05"
 SRC_URI[sha256sum] = "3b9b4421888519876c4fc68ade324a3bbd81ceeb7092ecdbbc2055099fcb8864"
 
-- 
2.17.1

