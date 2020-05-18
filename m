Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.43425.1589813423881963365
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jWYacxFd;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id f23so4943898pgj.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=V592fcuqtB/ZhoABL1llHOjIlyr/c5zJt9xvAeEwhq4=;
        b=jWYacxFdcuuIQIR+u9jdHQ047abs1zg38zNFgrgVy5yDJtcGfTXjUVrGaDxzwX9pgy
         lSsUUMZQZXxO5zzKZ7xdg7JuIK0KXtAwZB8J1Pc+BFTHDD5amlTksbd6Lr1cZExx5Vtk
         b3o1Og72TjB7uYCuvIL0cJHBsWrI0rBs1EEqoE/l1kk7QpHckbtvdIr4OqRNcGWAk50G
         MvNrv4fxGfzMtFuHc5R8Ebw8l5JUFf23+vqkbMbAftSAN5yb0CHRv4fL1V4HEkWJqRUf
         DtkXXx0GjpqjWSCufJKJQwlW6RZP0JlrfrkcyPcWGNQ9SYa4mS/WFJSxoJT80KdGOCMd
         7HbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=V592fcuqtB/ZhoABL1llHOjIlyr/c5zJt9xvAeEwhq4=;
        b=KYqCBsBooo3NXjpfRBCPPehcQwYS7SfyKFDWYWJ5g9qBrtIvO3Vywd88MtLsKJ2eJe
         mBs5HSrob2AjaMB1uq3QVFzUfaMNGPQ9DspPNyZnIo1In/uhwgEyu0zRoc1aKQ4YuLJh
         9NRiLE4OjTdgvrb+5WgfxjnKXYtcp01QXI/G+P5jNnymd0lIx/z5xt98KIfIff9nGN5j
         YCKpAp2+PEsMGcHqWnEGjfIh8d48uI+EiSqitQB89BYYxTEu4VGrkTgvwtzHvVWLRjHz
         b74UlroiwZiz8dTey+4NmHcKx6LVac/N3TpEAbtXxl7tE2Dspwexsq/iEdFpMzHt01/d
         4RoA==
X-Gm-Message-State: AOAM532HoXh3WdFQb4gqfGgYP88w1g6zWJ6LtWMIpmuZkJfhrf2fpn5X
	CJzrorbUFloGENo/qzYJpfjAIZs9
X-Google-Smtp-Source: ABdhPJzyoz/zve/0h/a23T9EMNWcyi7wsj/pQTtQFDqJc0GymUaF54LdKb2O70NEEr8HXB9I2J4Dyw==
X-Received: by 2002:a62:1ccb:: with SMTP id c194mr16596794pfc.325.1589813423138;
        Mon, 18 May 2020 07:50:23 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:22 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 16/57] php: update fix for opcache link issue in 7.4.4
Date: Mon, 18 May 2020 07:49:21 -0700
Message-Id: <a6c9ad397bfcf40c11d74d926b8fdd6c3dfb98eb.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Claude Bing <cbing@cybernetics.com>

The source of the issue is the update for PHP 7.4 support in
0001-opcache-config.m4-enable-opcache.patch (commit 7cc7a9ec).  Instead
of working around the issue in the recipe file, update the patch to
restore the call to PHP_ADD_LIBRARY().

Signed-off-by: Claude Bing <cbing@cybernetics.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3cfd16be4e1b62efe8ac640cecc080709cf2b9f9)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...001-opcache-config.m4-enable-opcache.patch | 19 +++++++++++++------
 meta-oe/recipes-devtools/php/php_7.4.4.bb     |  5 -----
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
index ee0d5edcdb..1f3e683a0f 100644
--- a/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
+++ b/meta-oe/recipes-devtools/php/php/0001-opcache-config.m4-enable-opcache.patch
@@ -1,4 +1,7 @@
-opcache/config.m4: enable opcache
+From a74b42098aededd296ec6a3cd4cf5a17e59d6f29 Mon Sep 17 00:00:00 2001
+From: Claude Bing <cbing@cybernetics.com>
+Date: Fri, 8 May 2020 10:15:32 -0400
+Subject: [PATCH] opcache/config.m4: enable opcache
 
 We can't use AC_TRY_RUN to run programs in a cross compile environment.
 Set
@@ -12,15 +15,18 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 
 update patch to version 7.4.4
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+fix issue linking with librt
+Signed-off-by: Claude Bing <cbing@cybernetics.com>
 ---
- ext/opcache/config.m4 | 194 +-------------------------------------------------
- 1 file changed, 3 insertions(+), 191 deletions(-)
+ ext/opcache/config.m4 | 195 +-----------------------------------------
+ 1 file changed, 4 insertions(+), 191 deletions(-)
 
 diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
-index 6c40caf..84ddf1e 100644
+index 6c40cafc1c..6569aa9e1c 100644
 --- a/ext/opcache/config.m4
 +++ b/ext/opcache/config.m4
-@@ -23,201 +23,13 @@ if test "$PHP_OPCACHE" != "no"; then
+@@ -23,201 +23,14 @@ if test "$PHP_OPCACHE" != "no"; then
    AC_CHECK_FUNCS([mprotect])
  
    AC_MSG_CHECKING(for sysvipc shared memory support)
@@ -222,9 +228,10 @@ index 6c40caf..84ddf1e 100644
 -    AC_MSG_RESULT([no])
 -  ])
 +  AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
++  PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
  
    PHP_NEW_EXTENSION(opcache,
  	ZendAccelerator.c \
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-oe/recipes-devtools/php/php_7.4.4.bb b/meta-oe/recipes-devtools/php/php_7.4.4.bb
index 07c3115060..1d93902e72 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.4.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.4.bb
@@ -110,11 +110,6 @@ export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
 export PHP_PEAR_PHP_BIN = "${STAGING_BINDIR_NATIVE}/php"
 CFLAGS += " -D_GNU_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
 
-# link against librt (libc) if opcache is specified in order to avoid the
-# following error:
-# Failed loading /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so: /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so: undefined symbol: shm_unlink
-LDFLAGS += "${@ " -lrt " if bb.utils.contains('PACKAGECONFIG', 'opcache', 'true', 'false', d) else "" }"
-
 # Adding these flags enables dynamic library support, which is disabled by
 # default when cross compiling
 # See https://bugs.php.net/bug.php?id=60109
-- 
2.17.1

