Return-Path: <stephen.arnold42@gmail.com>
X-Greylist: delayed 359 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 08 Jun 2016 00:29:16 UTC
Received: from gatekeeper.gentoogeek.org (gatekeeper.gentoogeek.org
	[66.159.242.209])
	by mail.openembedded.org (Postfix) with ESMTP id EDB5170178
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jun 2016 00:29:16 +0000 (UTC)
Received: from prime.arnolds.bogus (prime.arnolds.bogus [192.168.0.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by gatekeeper.gentoogeek.org (Postfix) with ESMTPS id 5EADA20A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jun 2016 17:23:16 -0700 (PDT)
Received: from ptolemy.arnolds.bogus (ptolemy.arnolds.bogus
	[::ffff:192.168.0.11])
	by prime.arnolds.bogus with ESMTP; Tue, 07 Jun 2016 17:23:13 -0700
	id 0000000000241F0D.57576573.00003D22
From: Stephen Arnold <sarnold@vctlabs.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Jun 2016 17:14:58 -0700
Message-Id: <1465344898-22391-1-git-send-email-sarnold@vctlabs.com>
X-Mailer: git-send-email 2.8.1
Cc: Stephen Arnold <sarnold@vctlabs.com>
Subject: [PATCH] redis: fix hiredis build so it's less failure-prone and links properly
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
X-List-Received-Date: Wed, 08 Jun 2016 00:29:19 -0000

This patch resets the default OPT flags to -O2 and adds the missing
ranlib command to index the static library.

Signed-off-by: Stephen Arnold <sarnold@vctlabs.com>
---
 ...-update-Makefile-to-add-symbols-to-staticlib.patch | 19 +++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_3.0.2.bb         |  2 ++
 2 files changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis/hiredis-update-Makefile-to-add-symbols-to-staticlib.patch

diff --git a/meta-oe/recipes-extended/redis/redis/hiredis-update-Makefile-to-add-symbols-to-staticlib.patch b/meta-oe/recipes-extended/redis/redis/hiredis-update-Makefile-to-add-symbols-to-staticlib.patch
new file mode 100644
index 0000000..2b3b587
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/hiredis-update-Makefile-to-add-symbols-to-staticlib.patch
@@ -0,0 +1,19 @@
+--- redis-3.0.2/deps/hiredis/Makefile.orig	2016-05-06 19:36:26.179003036 -0700
++++ redis-3.0.2/deps/hiredis/Makefile	2016-05-06 19:40:15.341340736 -0700
+@@ -25,7 +25,7 @@
+ 
+ # Fallback to gcc when $CC is not in $PATH.
+ CC?=$(shell sh -c 'type $(CC) >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
+-OPTIMIZATION?=-O3
++OPTIMIZATION?=-O2
+ WARNINGS=-Wall -W -Wstrict-prototypes -Wwrite-strings
+ DEBUG?= -g -ggdb
+ REAL_CFLAGS=$(OPTIMIZATION) -fPIC $(CFLAGS) $(WARNINGS) $(DEBUG) $(ARCH)
+@@ -68,6 +68,7 @@
+ 
+ $(STLIBNAME): $(OBJ)
+ 	$(STLIB_MAKE_CMD) $(OBJ)
++	$(RANLIB) $@
+ 
+ dynamic: $(DYLIBNAME)
+ static: $(STLIBNAME)
diff --git a/meta-oe/recipes-extended/redis/redis_3.0.2.bb b/meta-oe/recipes-extended/redis/redis_3.0.2.bb
index 55f2c96..2e4b760 100644
--- a/meta-oe/recipes-extended/redis/redis_3.0.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_3.0.2.bb
@@ -12,7 +12,9 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://oe-use-libc-malloc.patch \
            file://redis.conf \
            file://init-redis-server \
+           file://hiredis-update-Makefile-to-add-symbols-to-staticlib.patch \
 "
+
 SRC_URI[md5sum] = "87be8867447f62524b584813e5a7bd14"
 SRC_URI[sha256sum] = "93e422c0d584623601f89b956045be158889ebe594478a2c24e1bf218495633f"
 
-- 
2.8.1


