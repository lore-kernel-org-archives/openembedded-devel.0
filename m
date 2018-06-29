Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DB90A7507C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 06:23:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5T6N9F6027320
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2018 23:23:09 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 28 Jun 2018 23:23:07 -0700
From: Changqing Li <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Jun 2018 14:22:16 +0800
Message-ID: <1530253337-32732-5-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530253337-32732-1-git-send-email-changqing.li@windriver.com>
References: <1530253337-32732-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe] syslog-ng: upgrade 3.15.1 -> 3.16.1
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
X-List-Received-Date: Fri, 29 Jun 2018 06:23:08 -0000
Content-Type: text/plain

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../rename-PAGESIZE-variables-to-pagesize.patch    | 72 ----------------------
 .../recipes-support/syslog-ng/syslog-ng_3.15.1.bb  | 11 ----
 .../recipes-support/syslog-ng/syslog-ng_3.16.1.bb  | 15 +++++
 3 files changed, 15 insertions(+), 83 deletions(-)
 delete mode 100644 meta-oe/recipes-support/syslog-ng/files/rename-PAGESIZE-variables-to-pagesize.patch
 delete mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_3.15.1.bb
 create mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_3.16.1.bb

diff --git a/meta-oe/recipes-support/syslog-ng/files/rename-PAGESIZE-variables-to-pagesize.patch b/meta-oe/recipes-support/syslog-ng/files/rename-PAGESIZE-variables-to-pagesize.patch
deleted file mode 100644
index 56ffb4a..0000000
--- a/meta-oe/recipes-support/syslog-ng/files/rename-PAGESIZE-variables-to-pagesize.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 29f0de401b9df056c7eeb47a025c341654ca579d Mon Sep 17 00:00:00 2001
-From: Andrej Valek <andrej.valek@siemens.com>
-Date: Thu, 14 Jun 2018 08:54:14 +0200
-Subject: [PATCH] secret-storage: rename PAGESIZE variables to pagesize
-
-PAGESIZE is a define in some libc libraries, which conflicts with these
-local variables.
-
-Upstream-Status: Submitted [https://github.com/balabit/syslog-ng/pull/2111]
-
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-Signed-off-by: Marko Peter <peter.marko@siemens.com>
----
- lib/secret-storage/nondumpable-allocator.c            | 4 ++--
- lib/secret-storage/tests/test_nondumpable_allocator.c | 6 +++---
- lib/secret-storage/tests/test_secret_storage.c        | 4 ++--
- 3 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/lib/secret-storage/nondumpable-allocator.c b/lib/secret-storage/nondumpable-allocator.c
-index 07d94fbb0..314ce571f 100644
---- a/lib/secret-storage/nondumpable-allocator.c
-+++ b/lib/secret-storage/nondumpable-allocator.c
-@@ -104,8 +104,8 @@ gpointer
- nondumpable_buffer_alloc(gsize len)
- {
-   gsize minimum_size = len + ALLOCATION_HEADER_SIZE;
--  gsize PAGESIZE = sysconf(_SC_PAGE_SIZE);
--  gsize alloc_size = round_to_nearest(minimum_size, PAGESIZE);
-+  gsize pagesize = sysconf(_SC_PAGE_SIZE);
-+  gsize alloc_size = round_to_nearest(minimum_size, pagesize);
- 
-   Allocation *buffer = _mmap(alloc_size);
-   if (!buffer)
-diff --git a/lib/secret-storage/tests/test_nondumpable_allocator.c b/lib/secret-storage/tests/test_nondumpable_allocator.c
-index 6ef5b3035..a20b287ff 100644
---- a/lib/secret-storage/tests/test_nondumpable_allocator.c
-+++ b/lib/secret-storage/tests/test_nondumpable_allocator.c
-@@ -34,10 +34,10 @@ Test(nondumpableallocator, malloc_realloc_free)
-   strcpy(buffer, test_string);
-   cr_assert_str_eq(buffer, test_string);
- 
--  const gsize PAGESIZE = sysconf(_SC_PAGE_SIZE);
--  gpointer buffer_realloc = nondumpable_buffer_realloc(buffer, 2*PAGESIZE);
-+  const gsize pagesize = sysconf(_SC_PAGE_SIZE);
-+  gpointer buffer_realloc = nondumpable_buffer_realloc(buffer, 2*pagesize);
-   cr_assert_str_eq(buffer_realloc, test_string);
--  ((gchar *)buffer_realloc)[2*PAGESIZE] = 'a';
-+  ((gchar *)buffer_realloc)[2*pagesize] = 'a';
- 
-   nondumpable_buffer_free(buffer_realloc);
- }
-diff --git a/lib/secret-storage/tests/test_secret_storage.c b/lib/secret-storage/tests/test_secret_storage.c
-index 5297d4f60..89122cada 100644
---- a/lib/secret-storage/tests/test_secret_storage.c
-+++ b/lib/secret-storage/tests/test_secret_storage.c
-@@ -263,11 +263,11 @@ Test(secretstorage, test_rlimit)
-   cr_assert(!getrlimit(RLIMIT_MEMLOCK, &locked_limit));
-   locked_limit.rlim_cur = MIN(locked_limit.rlim_max, 64 * 1024);
-   cr_assert(!setrlimit(RLIMIT_MEMLOCK, &locked_limit));
--  const gsize PAGESIZE = sysconf(_SC_PAGE_SIZE);
-+  const gsize pagesize = sysconf(_SC_PAGE_SIZE);
- 
-   gchar *key_fmt = g_strdup("keyXXX");
-   int i = 0;
--  int for_limit = locked_limit.rlim_cur/PAGESIZE;
-+  int for_limit = locked_limit.rlim_cur/pagesize;
-   for (; i < for_limit; i++)
-     {
-       sprintf(key_fmt, "key%03d", i);
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.15.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.15.1.bb
deleted file mode 100644
index 6d48cc3..0000000
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.15.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require syslog-ng.inc
-
-SRC_URI += " \
-    file://fix-config-libnet.patch \
-    file://fix-invalid-ownership.patch \
-    file://syslog-ng.service-the-syslog-ng-service.patch \
-    file://rename-PAGESIZE-variables-to-pagesize.patch \
-"
-
-SRC_URI[md5sum] = "da59a65cd5e293ec0fa3d3ecf4984af9"
-SRC_URI[sha256sum] = "a2dabd28674e2b558e4fb92484ad111d77bf7150070aa28556827130b479f9ef"
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.16.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.16.1.bb
new file mode 100644
index 0000000..2fd57fb
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.16.1.bb
@@ -0,0 +1,15 @@
+require syslog-ng.inc
+
+SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.tar.gz \
+           file://syslog-ng.conf.systemd \
+           file://syslog-ng.conf.sysvinit \
+           file://initscript \
+           file://volatiles.03_syslog-ng \
+           file://configure.ac-add-option-enable-thread-tls-to-manage-.patch \
+           file://fix-config-libnet.patch \
+           file://fix-invalid-ownership.patch \
+           file://syslog-ng.service-the-syslog-ng-service.patch \
+           "
+
+SRC_URI[md5sum] = "72d44ad02c2e9ba0748b3ecd3f15a7ff"
+SRC_URI[sha256sum] = "c7ee6f1d5e98d86f191964e580111bfa71081ecbb3275cea035bbba177b73a29"
-- 
2.7.4


