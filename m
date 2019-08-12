Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4969B7D3B1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 07:34:19 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id g67so10855629wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 00:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hm9w1vxusCnivyr74sG2O7vkJdekyNKhyqclWDtOY9A=;
	b=l2F6q5qzX8zPHvesohEFSYP32gMYSPXMGTFeb+sLXqL/8DCKFpokS78FuOegUQTL40
	8Bhmf4Z6F9L0Kh7173J9dpsJy7wJp95Kk6YCkOWP4Y2w8vtdxYQbcis0aDydIeSbKtwQ
	zuFkDcfBX7q0ncDB9Tp/Mq8OlJ/b9JZg5kZKYXZxu/uJG/HbzqQXxpBZVQze5roFefYQ
	9IH4st0vGtzbYtyclWPFUJ8llAMkXZn6m0ZRgQeyS4KhqHKuBlYfzgZLXBgj5vZZE0NT
	Zc9mdBUSjCkMjpgK2MH7IIorBlkDBsjAUMsn3b3BXOkQnaTKnhlk74kn6iBKMCMd3E7D
	/pIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hm9w1vxusCnivyr74sG2O7vkJdekyNKhyqclWDtOY9A=;
	b=LN2OmXOmVGBU+7PfBVhjtnsL/15f+PG6pOhKz6sLVb66WxwMtxXTs7NmBYfLootctz
	9lpH/ytcxZhF6z8h5bNOhGZv5SU4V4P3iQqCzp3tck/K/j8ARupOMTReUEKrBas8Ozka
	mHXbBFfGRCtL8xKsX8lmFS7tCHx7TWpCc2cyonOcEtDpFv1TTv9MV1sdXdVpZ566NuKc
	9F+jn0KjDrqvaa08M8Dv8NruSkEBJzjg9FLTNLzO38db+bgaDzl2lDPuU9C1JK1NyNWQ
	5pLKt9AxURRNHLO5K49BcaAkFGdYieI9f7bkC+jgShqXbdLxjI1tm37H+jYOrNT98Nu1
	icSQ==
X-Gm-Message-State: APjAAAWOlSoWnjJcjJ5XEmoUR4nPG8bF0RctwBw/za7AEdQsgSAkUKTj
	sFngU+U2noS189Na0GxzyUUpvSJ+
X-Google-Smtp-Source: APXvYqxxgXXagp7G3dr5deL0gToq+8HXk/miu7rP0Iek3o+3wGp1J/qtmbt/86EMP1tbLJRSzZ9eZw==
X-Received: by 2002:a1c:f618:: with SMTP id w24mr20035773wmc.112.1565595259584;
	Mon, 12 Aug 2019 00:34:19 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	h97sm29210551wrh.74.2019.08.12.00.34.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Aug 2019 00:34:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Aug 2019 07:34:17 +0000
Message-Id: <20190812073417.21-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] redis: backport a fix for stack trace generation on aarch64
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
X-List-Received-Date: Mon, 12 Aug 2019 07:34:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ed-stack-trace-generation-on-aarch64.patch | 45 +++++++++++++++++++
 .../recipes-extended/redis/redis_4.0.14.bb    |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis/Fixed-stack-trace-generation-on-aarch64.patch

diff --git a/meta-oe/recipes-extended/redis/redis/Fixed-stack-trace-generation-on-aarch64.patch b/meta-oe/recipes-extended/redis/redis/Fixed-stack-trace-generation-on-aarch64.patch
new file mode 100644
index 0000000000..82ca307391
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
index 63ab44b6a4..5df5312a0f 100644
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
2.17.1


