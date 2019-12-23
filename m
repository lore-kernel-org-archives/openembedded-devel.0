Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id CC9467FBCA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 22:58:57 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id n96so375105pjc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 14:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OtOI+3Yr61VozHpxJFTYJSBzx7uV8kkvE7+hI3Z31SI=;
	b=MlOIQnExvrX21IXG//ttjxlEZdg9fxU5aud3qfQKdUwqGQxPlqM1M3YAWi89owkWaG
	gNOZkXO2FAdcaMvgneBhZYxsQZB/B1WWITar/scH9FM6kgZ+Ooa+a6AiUGPjZwfR/nX2
	JmJ8YXkfP7ktFSoQKsmkC+nor+8gOVHYaJZZS84OJgZgbQG+Px5IvcZ6MHtk5ZcX1jmf
	unMgcUYUtNiuAuE2H7Q33xifN7WsvW9MURFQl0z6/4pFleKvwTRiS9SfEX0iDlEKNWC5
	KFacONqABLwSFnoRqXlZ6jng3zkYz4xdj7EtM6XMbAlPBXuue6+KQSEwSqlSDgGGvo+M
	eh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OtOI+3Yr61VozHpxJFTYJSBzx7uV8kkvE7+hI3Z31SI=;
	b=cMdP75WHba/GJekQhuSVW1en6HagKEDyvYaFKdGpt1+7D+AEkrkg4Vt0+O0Xfy8TM+
	kd6UC8y2cjgTFEVQNfOvLID+lniQ9/9/kdU7x9T/E3+TP51TomBWWa+Uq8SlKL7Q+kIO
	CcGBJOUujqob241tnxqqfnSTiE5gteoea1zy1P9jVMxBoTIfQmc/pZrgcZCEl6SSrB/n
	KVWnyQZ4Ldbdn1sLrQ59EhHuJYIS2oioNHlSpjGOwX0zkzQ7bHP6eDxOCKRjMJtnTRC3
	7PUaTBtYPRj9JxwWykxKGg9Cho94/wXZjsm4hPnCLU+oIe4zX9jjMSKBHXO8gou65on8
	920Q==
X-Gm-Message-State: APjAAAWfPcPc0WeAz780g/Hjg8ueVsH3gUR0KbYjOsG67Px8vu2ds28q
	NfcIcfsf+gv4regIJtsGb80I46Ay17g=
X-Google-Smtp-Source: APXvYqzSzI75M0ONOVu/k/6/V3igXOdVV8VEeuyEFW2DHuXj51zuahRXec84/q6xR/FqOlD++V6JCg==
X-Received: by 2002:a17:90a:5896:: with SMTP id
	j22mr1834444pji.126.1577141938465; 
	Mon, 23 Dec 2019 14:58:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id c2sm526448pjq.27.2019.12.23.14.58.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Dec 2019 14:58:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Dec 2019 14:58:45 -0800
Message-Id: <20191223225846.2277629-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191223225846.2277629-1-raj.khem@gmail.com>
References: <20191223225846.2277629-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/4] redis: Upgrade to 5.0.7
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
X-List-Received-Date: Mon, 23 Dec 2019 22:58:57 -0000
Content-Transfer-Encoding: 8bit

Remove an upstreamed patch
Add patches to build with new glibc/gcc
Drop atomic removal patch and link with libatomic when needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rn-definition-of-SDS_NOINIT-in-sds.h.patch | 27 +++++++
 ...ed-stack-trace-generation-on-aarch64.patch | 45 ------------
 .../redis/redis/GNU_SOURCE.patch              | 19 +++++
 .../redis/redis/remove-atomics.patch          | 72 -------------------
 .../redis/{redis_4.0.14.bb => redis_5.0.7.bb} | 23 +++---
 5 files changed, 58 insertions(+), 128 deletions(-)
 create mode 100644 meta-oe/recipes-extended/redis/redis/0005-Mark-extern-definition-of-SDS_NOINIT-in-sds.h.patch
 delete mode 100644 meta-oe/recipes-extended/redis/redis/Fixed-stack-trace-generation-on-aarch64.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis/GNU_SOURCE.patch
 delete mode 100644 meta-oe/recipes-extended/redis/redis/remove-atomics.patch
 rename meta-oe/recipes-extended/redis/{redis_4.0.14.bb => redis_5.0.7.bb} (84%)

diff --git a/meta-oe/recipes-extended/redis/redis/0005-Mark-extern-definition-of-SDS_NOINIT-in-sds.h.patch b/meta-oe/recipes-extended/redis/redis/0005-Mark-extern-definition-of-SDS_NOINIT-in-sds.h.patch
new file mode 100644
index 0000000000..4675687c3f
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/0005-Mark-extern-definition-of-SDS_NOINIT-in-sds.h.patch
@@ -0,0 +1,27 @@
+From 7f7f710c8821b7254baeaf945ca3ca263b9845e2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 21 Dec 2019 11:17:50 -0800
+Subject: [PATCH] Mark extern definition of SDS_NOINIT in sds.h
+
+This helps avoiding multiple definition of this variable, its also
+defined globally in sds.c
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/sds.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sds.h b/src/sds.h
+index 1bdb60d..adcc12c 100644
+--- a/src/sds.h
++++ b/src/sds.h
+@@ -34,7 +34,7 @@
+ #define __SDS_H
+ 
+ #define SDS_MAX_PREALLOC (1024*1024)
+-const char *SDS_NOINIT;
++extern const char *SDS_NOINIT;
+ 
+ #include <sys/types.h>
+ #include <stdarg.h>
diff --git a/meta-oe/recipes-extended/redis/redis/Fixed-stack-trace-generation-on-aarch64.patch b/meta-oe/recipes-extended/redis/redis/Fixed-stack-trace-generation-on-aarch64.patch
deleted file mode 100644
index 82ca307391..0000000000
--- a/meta-oe/recipes-extended/redis/redis/Fixed-stack-trace-generation-on-aarch64.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From c8ca71d40bc51e255457cd4374dd45ec9ebf8ae1 Mon Sep 17 00:00:00 2001
-From: Jun He <jun.he@arm.com>
-Date: Mon, 3 Jul 2017 07:18:32 +0000
-Subject: [PATCH] Fixed stack trace generation on aarch64
-
-Change-Id: I9801239c98cb7362ed07e8b9ec2ba7e45749dba7
-Signed-off-by: Jun He <jun.he@arm.com>
-
-* fixes also this error when building with -Werror=return-type:
-  debug.c:698:1: error: no return statement in function returning non-void [-Werror=return-type]
-
-Upstream-Status: Backport [https://github.com/antirez/redis/commit/c8ca71d40bc51e255457cd4374dd45ec9ebf8ae1]
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/Makefile | 2 +-
- src/debug.c  | 2 ++
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 24e960593eb..a1ff4258a9d 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -40,7 +40,7 @@
- endif
- 
- # To get ARM stack traces if Redis crashes we need a special C flag.
--ifneq (,$(findstring armv,$(uname_M)))
-+ifneq (,$(filter aarch64 armv,$(uname_M)))
-         CFLAGS+=-funwind-tables
- endif
- 
-diff --git a/src/debug.c b/src/debug.c
-index a4caa49f285..c976d0ed919 100644
---- a/src/debug.c
-+++ b/src/debug.c
-@@ -691,6 +691,8 @@
-     return (void*) uc->uc_mcontext.sc_ip;
-     #elif defined(__arm__) /* Linux ARM */
-     return (void*) uc->uc_mcontext.arm_pc;
-+    #elif defined(__aarch64__) /* Linux AArch64 */
-+    return (void*) uc->uc_mcontext.pc;
-     #endif
- #else
-     return NULL;
diff --git a/meta-oe/recipes-extended/redis/redis/GNU_SOURCE.patch b/meta-oe/recipes-extended/redis/redis/GNU_SOURCE.patch
new file mode 100644
index 0000000000..9a40d832f1
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/GNU_SOURCE.patch
@@ -0,0 +1,19 @@
+Define _GNU_SOURCE to get PTHREAD_MUTEX_INITIALIZER
+
+Fixes
+| zmalloc.c:87:37: error: 'PTHREAD_MUTEX_DEFAULT' undeclared here (not in a function)
+|    87 | pthread_mutex_t used_memory_mutex = PTHREAD_MUTEX_INITIALIZER;
+|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/src/zmalloc.c
++++ b/src/zmalloc.c
+@@ -28,6 +28,7 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
++#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <stdint.h>
diff --git a/meta-oe/recipes-extended/redis/redis/remove-atomics.patch b/meta-oe/recipes-extended/redis/redis/remove-atomics.patch
deleted file mode 100644
index 23b2f2aaf0..0000000000
--- a/meta-oe/recipes-extended/redis/redis/remove-atomics.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From c486455e0691f9915018b9d8b133200a6c61a3c5 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Thu, 24 May 2018 09:58:42 -0700
-Subject: [PATCH] Remove atomics
-
-Based on this patch:
-https://github.com/patrikx3/lede-redis/blob/master/redis/patches/010-redis.patch
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
----
- deps/jemalloc/src/pages.c | 22 +---------------------
- src/atomicvar.h           |  4 ++--
- 2 files changed, 3 insertions(+), 23 deletions(-)
-
-diff --git a/deps/jemalloc/src/pages.c b/deps/jemalloc/src/pages.c
-index 83a167f6..8e82c78d 100644
---- a/deps/jemalloc/src/pages.c
-+++ b/deps/jemalloc/src/pages.c
-@@ -147,27 +147,7 @@ pages_purge(void *addr, size_t size)
- {
- 	bool unzeroed;
- 
--#ifdef _WIN32
--	VirtualAlloc(addr, size, MEM_RESET, PAGE_READWRITE);
--	unzeroed = true;
--#elif defined(JEMALLOC_HAVE_MADVISE)
--#  ifdef JEMALLOC_PURGE_MADVISE_DONTNEED
--#    define JEMALLOC_MADV_PURGE MADV_DONTNEED
--#    define JEMALLOC_MADV_ZEROS true
--#  elif defined(JEMALLOC_PURGE_MADVISE_FREE)
--#    define JEMALLOC_MADV_PURGE MADV_FREE
--#    define JEMALLOC_MADV_ZEROS false
--#  else
--#    error "No madvise(2) flag defined for purging unused dirty pages."
--#  endif
--	int err = madvise(addr, size, JEMALLOC_MADV_PURGE);
--	unzeroed = (!JEMALLOC_MADV_ZEROS || err != 0);
--#  undef JEMALLOC_MADV_PURGE
--#  undef JEMALLOC_MADV_ZEROS
--#else
--	/* Last resort no-op. */
--	unzeroed = true;
--#endif
-+	unzeroed = false;
- 	return (unzeroed);
- }
- 
-diff --git a/src/atomicvar.h b/src/atomicvar.h
-index 84a5bbc5..f9b563c2 100644
---- a/src/atomicvar.h
-+++ b/src/atomicvar.h
-@@ -68,7 +68,7 @@
-  * is reported. */
- // #define __ATOMIC_VAR_FORCE_SYNC_MACROS
- 
--#if !defined(__ATOMIC_VAR_FORCE_SYNC_MACROS) && defined(__ATOMIC_RELAXED) && !defined(__sun) && (!defined(__clang__) || !defined(__APPLE__) || __apple_build_version__ > 4210057)
-+#if defined(CONFIG_EDAC_ATOMIC_SCRUB) &&  !defined(__ATOMIC_VAR_FORCE_SYNC_MACROS) && defined(__ATOMIC_RELAXED) && !defined(__sun) && (!defined(__clang__) || !defined(__APPLE__) || __apple_build_version__ > 4210057)
- /* Implementation using __atomic macros. */
- 
- #define atomicIncr(var,count) __atomic_add_fetch(&var,(count),__ATOMIC_RELAXED)
-@@ -82,7 +82,7 @@
- #define atomicSet(var,value) __atomic_store_n(&var,value,__ATOMIC_RELAXED)
- #define REDIS_ATOMIC_API "atomic-builtin"
- 
--#elif defined(HAVE_ATOMIC)
-+#elif defined(CONFIG_EDAC_ATOMIC_SCRUB) && defined(HAVE_ATOMIC)
- /* Implementation using __sync macros. */
- 
- #define atomicIncr(var,count) __sync_add_and_fetch(&var,(count))
--- 
-2.17.0
-
diff --git a/meta-oe/recipes-extended/redis/redis_4.0.14.bb b/meta-oe/recipes-extended/redis/redis_5.0.7.bb
similarity index 84%
rename from meta-oe/recipes-extended/redis/redis_4.0.14.bb
rename to meta-oe/recipes-extended/redis/redis_5.0.7.bb
index 7dc6f97115..b91575552d 100644
--- a/meta-oe/recipes-extended/redis/redis_4.0.14.bb
+++ b/meta-oe/recipes-extended/redis/redis_5.0.7.bb
@@ -7,26 +7,27 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3c01b49fed4df1a79843688fa3f7b9d6"
 DEPENDS = "readline lua ncurses"
 
 SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
+           file://redis.conf \
+           file://init-redis-server \
+           file://redis.service \
            file://hiredis-use-default-CC-if-it-is-set.patch \
            file://lua-update-Makefile-to-use-environment-build-setting.patch \
            file://oe-use-libc-malloc.patch \
-           file://Fixed-stack-trace-generation-on-aarch64.patch \
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
-           file://redis.conf \
-           file://init-redis-server \
-           file://redis.service \
-"
+           file://0005-Mark-extern-definition-of-SDS_NOINIT-in-sds.h.patch \
+           file://GNU_SOURCE.patch \
+           "
 
-SRC_URI_append_mips = " file://remove-atomics.patch"
-SRC_URI_append_arm = " file://remove-atomics.patch"
-SRC_URI_append_powerpc = " file://remove-atomics.patch"
-
-SRC_URI[md5sum] = "96ae20ffd68b9daee24b702b754d89f3"
-SRC_URI[sha256sum] = "1e1e18420a86cfb285933123b04a82e1ebda20bfb0a289472745a087587e93a7"
+SRC_URI[md5sum] = "612ec43075a888bc8b8a7dd8ccb2e0f7"
+SRC_URI[sha256sum] = "61db74eabf6801f057fd24b590232f2f337d422280fd19486eca03be87d3a82b"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
 FINAL_LIBS_x86_toolchain-clang = "-latomic"
+FINAL_LIBS_mips = "-latomic"
+FINAL_LIBS_arm = "-latomic"
+FINAL_LIBS_powerpc = "-latomic"
+
 export FINAL_LIBS
 
 USERADD_PACKAGES = "${PN}"
-- 
2.24.1


