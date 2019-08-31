Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3D4A87F4AE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:31:57 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id m9so4888846pls.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZQUaN7kzgdZ80sSuuS/GERktM31GmfI5/rpzEkFRlZI=;
	b=p5hqTRFp7bobl+tRB5OfXyqh9Joq0LtF8kc2jUHz1VJ+I+M2BpZmzUOzNjkhnaK679
	MUF0EXV8PfmU3mn4q1XAEMBX4k2OTWL2Rb/lr0Nkw3qFa1nIwj5Ii7Qd3rAcYUHIgrJV
	37s0dluJsGtxtug+TIE3cTBDtjoGEHZ3zCpz6G7hm9lIjRBC5PTdOPpydfGvosW/ADu4
	R1drTVd/HX5W/Ir/3ZnFHHej0Gnh8UTXW45paRwBZkXw+ynIjbklxl0isNq3IX1C2ssX
	ifmGYk9vYjdbqPugSguw1Dr8gpiqtpuvfGdN6TiTwnOOqCZWMqU+6ZurFBf+ZN9YxKQX
	HiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZQUaN7kzgdZ80sSuuS/GERktM31GmfI5/rpzEkFRlZI=;
	b=tzsH1u8jduQWG1NxgXhsu0ehYUH2H7Xu8KunoulgXzUWUqTN4rIQpJLmwaFwJx9Msj
	Q1X04dg+H6LzRUsKe3sb7Qy/EUtmqXVi1143fSy7zvbzDLR6Xt19LlzOCW5xrbrmRP3H
	PBu5AjcmhBNRua8/Ea2hccOwvzpRiR68VbVFOJqOct/OF1zp+kEWY6oQn9GryvPrEpS/
	xlmrjhXhYcF2ujvjdyQ3zRFqf6RzKqkHQ76qiQ/IYc+/t5TH2MYRFeRpFB04Wcj/U4/c
	iQ5TTRYiEazpTixVhnsopimkGWFMtAnqLI2HyjKouh4Hl5NrrTQ9zWhguF9ZyCJRkRUz
	XCqA==
X-Gm-Message-State: APjAAAXxL6Qy3xZEppaq415fqU/PoGM4SoMs0cksC2dHO5pC5yf7+U4Q
	Gy8eGiPMPiKmNY2GRfeRGAnQ3tcG
X-Google-Smtp-Source: APXvYqyhVnd3lXOcpJKQV4b5vX28+8kOCwN1T32kk/C0y2dUgZTJBd1+Iny1P9GXRBGuZGI2STn3FA==
X-Received: by 2002:a17:902:d24:: with SMTP id
	33mr22717208plu.133.1567287118465; 
	Sat, 31 Aug 2019 14:31:58 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.31.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:31:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:33 -0700
Message-Id: <7525b914e436ab90164be3a1eff0835387a00a56.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567286967.git.akuster808@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
Subject: [warrior 12/23] redis: backport a fix for stack trace generation on aarch64
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 31 Aug 2019 21:31:58 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../Fixed-stack-trace-generation-on-aarch64.patch  | 45 ++++++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_4.0.14.bb     |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis/Fixed-stack-trace-generation-on-aarch64.patch

diff --git a/meta-oe/recipes-extended/redis/redis/Fixed-stack-trace-generation-on-aarch64.patch b/meta-oe/recipes-extended/redis/redis/Fixed-stack-trace-generation-on-aarch64.patch
new file mode 100644
index 0000000..82ca307
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/Fixed-stack-trace-generation-on-aarch64.patch
@@ -0,0 +1,45 @@
+From c8ca71d40bc51e255457cd4374dd45ec9ebf8ae1 Mon Sep 17 00:00:00 2001
+From: Jun He <jun.he@arm.com>
+Date: Mon, 3 Jul 2017 07:18:32 +0000
+Subject: [PATCH] Fixed stack trace generation on aarch64
+
+Change-Id: I9801239c98cb7362ed07e8b9ec2ba7e45749dba7
+Signed-off-by: Jun He <jun.he@arm.com>
+
+* fixes also this error when building with -Werror=return-type:
+  debug.c:698:1: error: no return statement in function returning non-void [-Werror=return-type]
+
+Upstream-Status: Backport [https://github.com/antirez/redis/commit/c8ca71d40bc51e255457cd4374dd45ec9ebf8ae1]
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/Makefile | 2 +-
+ src/debug.c  | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 24e960593eb..a1ff4258a9d 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -40,7 +40,7 @@
+ endif
+ 
+ # To get ARM stack traces if Redis crashes we need a special C flag.
+-ifneq (,$(findstring armv,$(uname_M)))
++ifneq (,$(filter aarch64 armv,$(uname_M)))
+         CFLAGS+=-funwind-tables
+ endif
+ 
+diff --git a/src/debug.c b/src/debug.c
+index a4caa49f285..c976d0ed919 100644
+--- a/src/debug.c
++++ b/src/debug.c
+@@ -691,6 +691,8 @@
+     return (void*) uc->uc_mcontext.sc_ip;
+     #elif defined(__arm__) /* Linux ARM */
+     return (void*) uc->uc_mcontext.arm_pc;
++    #elif defined(__aarch64__) /* Linux AArch64 */
++    return (void*) uc->uc_mcontext.pc;
+     #endif
+ #else
+     return NULL;
diff --git a/meta-oe/recipes-extended/redis/redis_4.0.14.bb b/meta-oe/recipes-extended/redis/redis_4.0.14.bb
index 63ab44b..5df5312 100644
--- a/meta-oe/recipes-extended/redis/redis_4.0.14.bb
+++ b/meta-oe/recipes-extended/redis/redis_4.0.14.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://hiredis-use-default-CC-if-it-is-set.patch \
            file://lua-update-Makefile-to-use-environment-build-setting.patch \
            file://oe-use-libc-malloc.patch \
+           file://Fixed-stack-trace-generation-on-aarch64.patch \
            file://redis.conf \
            file://init-redis-server \
            file://redis.service \
-- 
2.7.4


