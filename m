Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D626C88E63
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 23:55:11 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16612.1789257303914448397
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Sep 2026 16:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lEfBMe+G;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: raj.khem@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea48edcso510830a12.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 16:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789257303; x=1789862103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MNfcTdrzUQk/Dn2jIhcDnzPspd26NOi5/9a0EHv7KXI=;
        b=lEfBMe+GMrH8Srl2sfdWBoZs3iuUpEo/m4lxmjwQJQYy6x2+rq+Xh+SKc2fnO2uerw
         eYNirqJuLf6S03x55xDZdWcZpNNyFEeNqtdXZtH3BfCDvOWLM2jduj05S0foCVRO0DPg
         JIpLWZcwgFDH49SKbm8OjCISI2nOOLAMOyg8gW/WrUxX/DGRWLgZUyLeLkuNSp5BwzzU
         r7ai/iy6o98NafSQdmIw6XA1gLyDcg0WPHyllhbGXjc1K+OlPN0CIKrN6CJvZBnnUZjy
         kiaqZbzW+QxW+r42CWfGz/juQxQb8hDw/tjAVT4zC9TV9PvV8fdldPgHiBIUI0/dSW/j
         erBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789257303; x=1789862103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MNfcTdrzUQk/Dn2jIhcDnzPspd26NOi5/9a0EHv7KXI=;
        b=Tf+85mEO581bkzJSfW8Kyqi7x9593nG9+miQtBsHEiWLQrLo5gqbwBhIxxMjXdwZz0
         m8ILIgHHsbLxvW5wBYgWZ3c8VwsxmxLeu+PyZ0Dh5n6ar6F9NhKLc2dcvhAmXfZSlyj3
         OcBMKazb7iqsfW/osgYJpooJ07fq3wsegnK+TrjOaNVCQsb7aW9dhUXl6V6VWsIJyiWR
         yRzziW4qaPbImm9ZNLAxDg3EgNt8xOP8vBsECcQ1YTGEOCCyUOmo+r/lZNTmcM/OQ4wr
         zXD0jcR16xz0tn0f1ctvdWJmkVb6xtDNpOWgnaZ91Ejwxn3ORyBjqh7pGS9uM3OqkYJQ
         gpqA==
X-Gm-Message-State: AFuF++mQ0ZJscxVek/6+b/avHzI4id7hhsAluYZBTyYmZOVv+oFCHTyo
	1IPz1Rf4KZywt3euCqYxprXrydRCeuJ+DyZXXmRWq0BoE1JC2n2G7dSMQZMcTQ==
X-Gm-Gg: AYBFou2hIjqCM7O8JFLc+bqYSQl7zAf7LcXXjNkzx5j8O9CQEMXLVwp249YvWvxp+Mx
	Ik3AXmjZ9f1UJlcHxX4pJlkezC2Vsj0kMpKfyDxX5qkRaZYE+is7fiRytqZwMMIHfWInuZGNzEO
	y+r5W5zJ1Ub3zjNNazUfdvSURB/JQDXlaNj2QhCIRZ/PpTFqRPuxZwIqZe3J96ig3H70OMAXRiq
	BZfkC9ykrtJZud29xjDI7CPl+QUhaJXvSm+ApBP8pgAjx2lCcnakryVRqUnFcTWkSkNgFjM8tBY
	HS/nklwRLnKNSEr+9XXYWW4eS+2SAf3V2mqCTeXgc++55MyspApWjZcP2jmUS68eaNlWk2EwxQo
	PHPUWflwWbZtnywawnaPUTmiqjolcJSXoaiU+itGV5+A/FeMGlRfRXyZ4r5H2/0qRTLTrAAcL3V
	e8iUSCuF/OTMQxME/w7iONH1SLfsFoc0P06KdoI/aXWAUFYHyl3Prw4uE/Fq/wayOGCpwlTLjzP
	SO0HggKYENdFQ4KA0Zi65YF/kY2ZEVNZZXYoNTmByjey94b38UDPHwTS2idaHheR0Z0g0fVIH5a
	bmb9rxUWpkgI3Rl1urKfcUW3YdBCyxkwpJnV6s5KTy3obQpSK+lSTHHm+QkPLjYWcmONsNBvjl2
	pVrjxMlrgMXEv4NgsuThhpmKXxXQHAHppIbdTa433+fqbTESNzjvHicWd
X-Received: by 2002:a05:6300:220c:b0:3d0:57c3:65f4 with SMTP id adf61e73a8af0-3db0e0ad192mr8471434637.5.1789257303232;
        Sat, 12 Sep 2026 16:55:03 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bbeb053a5sm4524372eec.27.2026.09.12.16.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 16:55:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/6] redis: Do not build the test modules during cross compile
Date: Sat, 12 Sep 2026 16:54:55 -0700
Message-ID: <20260912235456.2358617-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912235456.2358617-1-khem.raj@oss.qualcomm.com>
References: <20260912235456.2358617-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Sep 2026 23:55:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129990

src/Makefile's `all` target carries a module_tests prerequisite, which
recurses into tests/modules. That Makefile pins the compiler to whatever
gcc is in PATH:

  # This is a hack to override the default CC. When running with SANITIZER=memory
  # tough we want to keep the compiler as clang as MSan is not supported for gcc
  ifeq ($(uname_S),Linux)
  ifneq ($(SANITIZER),memory)
          LD = gcc
          CC = gcc
  endif
  endif

while still taking CFLAGS/LDFLAGS from the environment, so a cross build
compiles and links all 47 test modules with the build host's gcc using
the target compiler flags. With the gcc toolchain those flags include
-fcanon-prefix-map (DEBUG_PREFIX_MAP_EXTRA in
meta/classes/toolchain/gcc.bbclass), which only exists in GCC >= 13. The
cross compiler always has it, the build host's gcc may not, and the build
then fails:

  | gcc -I../../src -O2 -g -fcanon-prefix-map \
      -ffile-prefix-map=.../sources/redis-8.10.1=/usr/src/debug/redis/8.10.1 \
      ... -std=gnu11 -O2 -fPIC -c commandfilter.c -o commandfilter.xo
  | gcc: error: unrecognized command-line option '-fcanon-prefix-map';
        did you mean '-fmacro-prefix-map='?

The modules are test-only artifacts: nothing links or installs them, and
only the tcl suite that `make test` drives from the build tree consumes
them. Drop them from `all` so no host compiler takes part in the cross
build at all; `test` keeps its own module_tests prerequisite. This has to
happen in the Makefile rather than by naming narrower goals in
do_compile, because `install: all` re-runs the phony target on its own.

With the patch applied the only compiler left in log.do_compile is
${TARGET_PREFIX}gcc, where 47 host gcc compile and 47 host gcc link
invocations used to be.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-not-build-the-test-modules-from-all.patch | 58 +++++++++++++++++++
 .../recipes-extended/redis/redis_8.10.1.bb    |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-8.10.1/0006-src-Makefile-do-not-build-the-test-modules-from-all.patch

diff --git a/meta-oe/recipes-extended/redis/redis-8.10.1/0006-src-Makefile-do-not-build-the-test-modules-from-all.patch b/meta-oe/recipes-extended/redis/redis-8.10.1/0006-src-Makefile-do-not-build-the-test-modules-from-all.patch
new file mode 100644
index 0000000000..2070faaf75
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-8.10.1/0006-src-Makefile-do-not-build-the-test-modules-from-all.patch
@@ -0,0 +1,58 @@
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 12 Sep 2026 09:10:00 -0700
+Subject: [PATCH] src/Makefile: do not build the test modules from `all`
+
+`all` carries a module_tests prerequisite, which recurses into
+../tests/modules. That Makefile deliberately pins the compiler to the
+one found in PATH:
+
+  # This is a hack to override the default CC. When running with SANITIZER=memory
+  # tough we want to keep the compiler as clang as MSan is not supported for gcc
+  ifeq ($(uname_S),Linux)
+  ifneq ($(SANITIZER),memory)
+          LD = gcc
+          CC = gcc
+  endif
+  endif
+
+but it keeps taking CFLAGS/LDFLAGS from the environment. In a cross
+build that combination compiles and links the 47 test modules with the
+*build host* gcc while handing it the *target* compiler flags:
+
+  gcc -I../../src -O2 -g -fcanon-prefix-map \
+      -ffile-prefix-map=.../sources/redis-8.10.1=/usr/src/debug/redis/8.10.1 \
+      ... -fPIC -c commandfilter.c -o commandfilter.xo
+  gcc: error: unrecognized command-line option '-fcanon-prefix-map';
+       did you mean '-fmacro-prefix-map='?
+
+-fcanon-prefix-map only exists in GCC >= 13, and the target toolchain's
+support for it says nothing about the build host's, so the build breaks
+on any host with an older gcc.
+
+The modules are test-only artifacts: nothing links or installs them,
+and they are consumed solely by the tcl suite that `make test` drives
+from the build tree. Drop them from `all` (`test` keeps its own
+module_tests prerequisite) so no host compiler is involved in the
+cross build at all. This has to happen in the Makefile rather than by
+picking narrower goals in the caller, because `install: all` re-runs
+the phony module_tests target on its own.
+
+Upstream-Status: Inappropriate [oe-specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 5cb4f67..4fb643b 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -410,7 +410,7 @@ REDIS_CHECK_RDB_NAME=redis-check-rdb$(PROG_SUFFIX)
+ REDIS_CHECK_AOF_NAME=redis-check-aof$(PROG_SUFFIX)
+ ALL_SOURCES=$(sort $(patsubst %.o,%.c,$(REDIS_SERVER_OBJ) $(REDIS_VEC_SETS_OBJ) $(REDIS_CLI_OBJ) $(REDIS_BENCHMARK_OBJ)))
+
+-all: $(REDIS_SERVER_NAME) $(REDIS_SENTINEL_NAME) $(REDIS_CLI_NAME) $(REDIS_BENCHMARK_NAME) $(REDIS_CHECK_RDB_NAME) $(REDIS_CHECK_AOF_NAME) $(TLS_MODULE) module_tests
++all: $(REDIS_SERVER_NAME) $(REDIS_SENTINEL_NAME) $(REDIS_CLI_NAME) $(REDIS_BENCHMARK_NAME) $(REDIS_CHECK_RDB_NAME) $(REDIS_CHECK_AOF_NAME) $(TLS_MODULE)
+ 	@echo ""
+ 	@echo "Hint: It's a good idea to run 'make test' ;)"
+ 	@echo ""
diff --git a/meta-oe/recipes-extended/redis/redis_8.10.1.bb b/meta-oe/recipes-extended/redis/redis_8.10.1.bb
index d0220d228b..40e92dc318 100644
--- a/meta-oe/recipes-extended/redis/redis_8.10.1.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.10.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0003-hack-to-force-use-of-libc-malloc.patch \
            file://0004-src-Do-not-reset-FINAL_LIBS.patch \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
+           file://0006-src-Makefile-do-not-build-the-test-modules-from-all.patch \
           "
 SRC_URI[sha256sum] = "60166c95ab7aedaa9dfe516de685be0a4dd87be95ded59ba429df14c13f1b663"


