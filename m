Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2E8C5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 07:10:06 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37552.1786086603991541735
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Aug 2026 00:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tNzvf43s;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso2473100a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 00:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786086603; x=1786691403; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/a2fEXljaJZOc6XUYZ9moL15ID97UfTHZHYd5wn1q4=;
        b=tNzvf43sHi0lOPLKDfxdqH7weaoiVHU++yIIJ8k1GCmkgztaB9aZVCeqsO0D3vgAe3
         YJTkoKjGFTOK7DdXR1Z9yKhBPoIZ/Sbk7m50heEpNz1NTsKv9w14MHbEPqnjAQNTzr6F
         I8S4owt38/QFg+/LcdZV/+v06lFcV8y+GSQaezh1VmNNAojYrQ4l2U20U1Xke3NXSvye
         NHVEnX80O0bwoN79F2pXyJUzT09u/r+BZVNGYU3JDnKFKkuVfKQ09fVXQoyQe1wOxnus
         5vl8yGsPU5HMJE66HEOuGou4UQ/Zh2LhRlCFZDI5CG0Y1wi+cHGaqDO6QQLk+uexxAo5
         9WVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786086603; x=1786691403;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g/a2fEXljaJZOc6XUYZ9moL15ID97UfTHZHYd5wn1q4=;
        b=rBhG8WC57W29edk4rg5+uf4ffMawbK0edGrrhm2kD1QU7F/USrAIdePadyXQiblqtF
         HynElDSuf8hMXPOyO9neuURVikW0SriQmeft+Er+RApPIrLvmYu+yp1Kz8urqdHwRV3U
         EJ0DHyw4TpjaSh6XSojUZ9UD6f+XSmwKkAmwwWIDPUyUrhf8tkDzcnls1cPzpk3pxaxC
         yb+1OZ2D8F1doIB6zX0CBmjaIhkmAwZuv9NjX6g4Zt+oHq6cgrojN17FgNRDTQWSHIA8
         oLNu2hKiL1kIS/IqtxUGTJU7Q2+0CaUYxGy5DS2nCThSRx2JVX/4GsNixFedfDVHLHxm
         yBHw==
X-Gm-Message-State: AOJu0YydStveb3bbns3PmLGgx9WH/rLPLq9Np/PaZZ+RlSMROeFJ83Iz
	oipdndGxmVoSBnycQqZF2vlu0vV5pSguPrGUdCwZcXc88X0BTIKsJoVRFjjnD9AI
X-Gm-Gg: AR+sD11niqhQ5/JEaYX+Dj8O4PCBgCw8TBVpdO9rmNxVSJ5LMc4awLbmJk17G70eK2U
	xbnAgqg132/hqzLY6CpvbbmZydMmlQL8F4f6IwoUJONVYPHSO1B9KCRF+Fm5fDu8VF72ATL7pO4
	rGvnvaM1yKYMFrMrOK8s3Qgfdd2eG+xvYN6DtK6ews2byL/6OwTXKj9uRiMJJPyyYFUbY+aPVJ5
	JUV7E/8G7SIHt2d3Rz+OuVih8VQ7hln8NznUijXVmti05huyvXd4a5WDCzGF/x7dN9yrovTA6Ra
	ptW14RJMXC3gx7t+mwVdVXHwGqNBJfnqXU9nuiuq20lS/H1VM1advp3rUIV8K9mzKBZueG2oPxq
	xmigXEKkeb+osG/theguzW0hCmaoW3QPsmtsrLhjS+TFGJNIeoqayGKESpM0QzdOZVCvc8Dbbcu
	Svkw/JtmCwMXOR3fc5GPBiiMvB/mESt4qdB6NYfOYqa/1PwVSYhCpo/9WJZdI/HU05HUOKlIDW/
	A==
X-Received: by 2002:a05:6a00:3928:b0:84e:d5e6:a085 with SMTP id d2e1a72fcca58-84f2de7e930mr19849560b3a.0.1786086603121;
        Fri, 07 Aug 2026 00:10:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a51e99asm520440b3a.33.2026.08.07.00.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:10:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 1/6] redis: upgrade 7.2.12 -> 7.2.15
Date: Fri,  7 Aug 2026 19:09:46 +1200
Message-ID: <20260807070953.2275518-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 07:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128858

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Refreshed patches for this version.

https://github.com/redis/redis/releases/tag/7.2.13
https://github.com/redis/redis/releases/tag/7.2.14
https://github.com/redis/redis/releases/tag/7.2.15

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-hiredis-use-default-CC-if-it-is-set.patch             | 3 ++-
 ...-lua-update-Makefile-to-use-environment-build-setting.patch | 3 ++-
 .../0003-hack-to-force-use-of-libc-malloc.patch                | 3 ++-
 .../0004-src-Do-not-reset-FINAL_LIBS.patch                     | 3 ++-
 ...5-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch | 3 ++-
 .../0006-Define-correct-gregs-for-RISCV32.patch                | 3 ++-
 .../redis/{redis-7.2.12 => redis-7.2.15}/init-redis-server     | 0
 .../redis/{redis-7.2.12 => redis-7.2.15}/redis.conf            | 0
 .../redis/{redis-7.2.12 => redis-7.2.15}/redis.service         | 0
 .../redis/{redis_7.2.12.bb => redis_7.2.15.bb}                 | 2 +-
 10 files changed, 13 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.15}/0001-hiredis-use-default-CC-if-it-is-set.patch (92%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.15}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (94%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.15}/0003-hack-to-force-use-of-libc-malloc.patch (90%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.15}/0004-src-Do-not-reset-FINAL_LIBS.patch (87%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.15}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (86%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.15}/0006-Define-correct-gregs-for-RISCV32.patch (95%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.15}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.15}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.12 => redis-7.2.15}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_7.2.12.bb => redis_7.2.15.bb} (97%)

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.12/0001-hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.2.15/0001-hiredis-use-default-CC-if-it-is-set.patch
similarity index 92%
rename from meta-oe/recipes-extended/redis/redis-7.2.12/0001-hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.15/0001-hiredis-use-default-CC-if-it-is-set.patch
index 99783ce237..f9f126842e 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.12/0001-hiredis-use-default-CC-if-it-is-set.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.15/0001-hiredis-use-default-CC-if-it-is-set.patch
@@ -1,4 +1,4 @@
-From 2fec7733df9a6224875f3ecd3aaafc2857a546c0 Mon Sep 17 00:00:00 2001
+From 47f7923c89362328d9c447898b5b3a4661b86b99 Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 17:39:52 -0600
 Subject: [PATCH] hiredis: use default CC if it is set
@@ -22,6 +22,7 @@ Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
 
 Reworked for 6.0.4
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
 ---
  deps/hiredis/Makefile | 2 --
  1 file changed, 2 deletions(-)
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.12/0002-lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.2.15/0002-lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 94%
rename from meta-oe/recipes-extended/redis/redis-7.2.12/0002-lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.15/0002-lua-update-Makefile-to-use-environment-build-setting.patch
index a3365043b5..813f665861 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.12/0002-lua-update-Makefile-to-use-environment-build-setting.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.15/0002-lua-update-Makefile-to-use-environment-build-setting.patch
@@ -1,4 +1,4 @@
-From 71d92a24da61eab1e3697cc83ebc387b57bb6c3b Mon Sep 17 00:00:00 2001
+From c94f05e81555aa0ff4b203198830c8779ad0c652 Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 20:22:19 -0600
 Subject: [PATCH] lua: update Makefile to use environment build settings
@@ -16,6 +16,7 @@ Signed-off-by: Armin Kuster <akust808@gmail.com>
 
 updated to work wtih 6.2.1
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
 ---
  deps/Makefile         |  1 -
  deps/lua/Makefile     |  1 -
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.12/0003-hack-to-force-use-of-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-7.2.15/0003-hack-to-force-use-of-libc-malloc.patch
similarity index 90%
rename from meta-oe/recipes-extended/redis/redis-7.2.12/0003-hack-to-force-use-of-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.15/0003-hack-to-force-use-of-libc-malloc.patch
index 4ab1ca0ca8..a480fa44fd 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.12/0003-hack-to-force-use-of-libc-malloc.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.15/0003-hack-to-force-use-of-libc-malloc.patch
@@ -1,4 +1,4 @@
-From 577335d0309c852d9f6099c255d5a80603fcbdb9 Mon Sep 17 00:00:00 2001
+From 3be5a588bf8ef420b9e95ccdeb6879fd6dee035a Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Wed, 6 Feb 2013 20:51:02 -0600
 Subject: [PATCH] hack to force use of libc malloc
@@ -15,6 +15,7 @@ Signed-off-by: Venture Research <tech@ventureresearch.com>
 
 Update to work with 4.0.8
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
 ---
  src/Makefile | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.12/0004-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.2.15/0004-src-Do-not-reset-FINAL_LIBS.patch
similarity index 87%
rename from meta-oe/recipes-extended/redis/redis-7.2.12/0004-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.15/0004-src-Do-not-reset-FINAL_LIBS.patch
index 71044365af..d4493e498d 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.12/0004-src-Do-not-reset-FINAL_LIBS.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.15/0004-src-Do-not-reset-FINAL_LIBS.patch
@@ -1,4 +1,4 @@
-From 225f45d5fbeaa8998fac983fcb78d7912d6d6dd3 Mon Sep 17 00:00:00 2001
+From 9289dd9d8773deeaaed9a8f798bca600443c2a40 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 10 Sep 2019 20:04:26 -0700
 Subject: [PATCH] src: Do not reset FINAL_LIBS
@@ -11,6 +11,7 @@ e.g. -latomic is needed on clang/x86 to provide for 64bit atomics
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
 ---
  src/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.12/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch b/meta-oe/recipes-extended/redis/redis-7.2.15/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
similarity index 86%
rename from meta-oe/recipes-extended/redis/redis-7.2.12/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.15/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
index a45de28e0e..728eaf6d2f 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.12/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.15/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
@@ -1,4 +1,4 @@
-From b636c748fb4047b1ef3a4062c675e1ee4584230b Mon Sep 17 00:00:00 2001
+From 7f8137f3875579f7c82bdb0182071e3a324f5660 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 21 Dec 2019 12:09:51 -0800
 Subject: [PATCH] Define _GNU_SOURCE to get PTHREAD_MUTEX_INITIALIZER
@@ -11,6 +11,7 @@ Fixes
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
 ---
  src/zmalloc.c | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.12/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.2.15/0006-Define-correct-gregs-for-RISCV32.patch
similarity index 95%
rename from meta-oe/recipes-extended/redis/redis-7.2.12/0006-Define-correct-gregs-for-RISCV32.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.15/0006-Define-correct-gregs-for-RISCV32.patch
index bf44858d16..e4e0b9324a 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.12/0006-Define-correct-gregs-for-RISCV32.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.15/0006-Define-correct-gregs-for-RISCV32.patch
@@ -1,4 +1,4 @@
-From 8984a5df54fc80de1c99b311f117d28c2a42d959 Mon Sep 17 00:00:00 2001
+From 82749b35860ef3c317f85af4d7c5f45473355692 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 26 Oct 2020 21:32:22 -0700
 Subject: [PATCH] Define correct gregs for RISCV32
@@ -9,6 +9,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Updated patch for 6.2.8
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
 ---
  src/debug.c | 26 ++++++++++++++++++++++++--
  1 file changed, 24 insertions(+), 2 deletions(-)
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.12/init-redis-server b/meta-oe/recipes-extended/redis/redis-7.2.15/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.12/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-7.2.15/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.12/redis.conf b/meta-oe/recipes-extended/redis/redis-7.2.15/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.12/redis.conf
rename to meta-oe/recipes-extended/redis/redis-7.2.15/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.12/redis.service b/meta-oe/recipes-extended/redis/redis-7.2.15/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.12/redis.service
rename to meta-oe/recipes-extended/redis/redis-7.2.15/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb b/meta-oe/recipes-extended/redis/redis_7.2.15.bb
similarity index 97%
rename from meta-oe/recipes-extended/redis/redis_7.2.12.bb
rename to meta-oe/recipes-extended/redis/redis_7.2.15.bb
index 2b4087a74b..7ff1110752 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.15.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
           "
-SRC_URI[sha256sum] = "97c60478a7c777ac914ca9d87a7e88ba265926456107e758c62d8f971d0196bc"
+SRC_URI[sha256sum] = "7bf7975331511fdb788e85dae63964b128fccee1df026a10db57444babc9c9c4"
 
 inherit autotools-brokensep pkgconfig update-rc.d systemd useradd
 

