Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D21EE7718C
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 15:37:43 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.154472.1734709056312646187
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Dec 2024 07:37:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=qrAyFTMT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20241220153737e2e82f1ff5566e1469-_noouy@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20241220153737e2e82f1ff5566e1469
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 20 Dec 2024 16:37:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=uIGM4eAR5TulLDTBjquXe+jkEdGCGnycbxJVY0K77V4=;
 b=qrAyFTMTEjX5e8nK4AVovjLdmCPbiPrIVRuOztqtzY/AQQqpRbFLCUMGUxvHNNYZa+WQuI
 HsgmGUKfuV+gf3VAWdeebsTWVLisdkjIuHy6qjSxZH9W0L2NB47ZME7syX8sl2izq+SgGkDp
 M1Nf1NcspLxIgCTL3FGCWZpid5iNinlIe66ZfmRp0e9edSjbWA88m0S1UjFRd1Vi0zjdo+Bb
 OFA39Z6nEWCsv4j+D8TAty6IzfbPIYXswzpeqWpuPcg7wESiPjP6tq8sFjaMZx3E2w9ChXE6
 v8+mNbVU1DlmpAS1aXT6u75uAJh4Vy9LWSB66JHyOfC1dzmRK/9NpZng==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 04/11] memcached: upgrade 1.6.17 -> 1.6.33
Date: Fri, 20 Dec 2024 16:36:22 +0100
Message-Id: <20241220153629.2499631-5-peter.marko@siemens.com>
In-Reply-To: <20241220153629.2499631-1-peter.marko@siemens.com>
References: <20241220153629.2499631-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 15:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114440

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2023-46852 and CVE-2023-46853.

Upgrade done via "devtool upgrade".

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../0001-Fix-function-protypes.patch          | 110 ------------------
 .../memcached-add-hugetlbfs-check.patch       |  13 ++-
 ...emcached_1.6.17.bb => memcached_1.6.33.bb} |   3 +-
 3 files changed, 10 insertions(+), 116 deletions(-)
 delete mode 100644 meta-networking/recipes-support/memcached/memcached/0001-Fix-function-protypes.patch
 rename meta-networking/recipes-support/memcached/{memcached_1.6.17.bb => memcached_1.6.33.bb} (93%)

diff --git a/meta-networking/recipes-support/memcached/memcached/0001-Fix-function-protypes.patch b/meta-networking/recipes-support/memcached/memcached/0001-Fix-function-protypes.patch
deleted file mode 100644
index 15ef54f80e..0000000000
--- a/meta-networking/recipes-support/memcached/memcached/0001-Fix-function-protypes.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 6021d3d60e64d9174f41515d2d962df9b5d7645e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 29 Aug 2022 17:15:28 -0700
-Subject: [PATCH] Fix function protypes
-
-clang-15+ has started diagnosing them as errors
-
-thread.c:925:18: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
-| void STATS_UNLOCK() {
-|                  ^
-|                   void
-
-Upstream-Status: Submitted [https://github.com/memcached/memcached/pull/928]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- assoc.c     | 4 ++--
- memcached.c | 4 ++--
- slabs.c     | 2 +-
- testapp.c   | 2 +-
- thread.c    | 4 ++--
- 5 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/assoc.c b/assoc.c
-index bc68695..01063a9 100644
---- a/assoc.c
-+++ b/assoc.c
-@@ -261,7 +261,7 @@ static void *assoc_maintenance_thread(void *arg) {
- 
- static pthread_t maintenance_tid;
- 
--int start_assoc_maintenance_thread() {
-+int start_assoc_maintenance_thread(void) {
-     int ret;
-     char *env = getenv("MEMCACHED_HASH_BULK_MOVE");
-     if (env != NULL) {
-@@ -279,7 +279,7 @@ int start_assoc_maintenance_thread() {
-     return 0;
- }
- 
--void stop_assoc_maintenance_thread() {
-+void stop_assoc_maintenance_thread(void) {
-     mutex_lock(&maintenance_lock);
-     do_run_maintenance_thread = 0;
-     pthread_cond_signal(&maintenance_cond);
-diff --git a/memcached.c b/memcached.c
-index 7871fe8..4d3b54a 100644
---- a/memcached.c
-+++ b/memcached.c
-@@ -84,7 +84,7 @@ static int try_read_command_udp(conn *c);
- static enum try_read_result try_read_network(conn *c);
- static enum try_read_result try_read_udp(conn *c);
- 
--static int start_conn_timeout_thread();
-+static int start_conn_timeout_thread(void);
- 
- /* stats */
- static void stats_init(void);
-@@ -374,7 +374,7 @@ static void *conn_timeout_thread(void *arg) {
-     return NULL;
- }
- 
--static int start_conn_timeout_thread() {
-+static int start_conn_timeout_thread(void) {
-     int ret;
- 
-     if (settings.idle_timeout == 0)
-diff --git a/slabs.c b/slabs.c
-index 3c78d8a..0dadd35 100644
---- a/slabs.c
-+++ b/slabs.c
-@@ -638,7 +638,7 @@ static void *memory_allocate(size_t size) {
- }
- 
- /* Must only be used if all pages are item_size_max */
--static void memory_release() {
-+static void memory_release(void) {
-     void *p = NULL;
-     if (mem_base != NULL)
-         return;
-diff --git a/testapp.c b/testapp.c
-index 5face54..387a847 100644
---- a/testapp.c
-+++ b/testapp.c
-@@ -80,7 +80,7 @@ static struct conn *con = NULL;
- static bool allow_closed_read = false;
- static bool enable_ssl = false;
- 
--static void close_conn() {
-+static void close_conn(void) {
-     if (con == NULL) return;
- #ifdef TLS
-     if (con->ssl) {
-diff --git a/thread.c b/thread.c
-index d5ed052..f5efdc3 100644
---- a/thread.c
-+++ b/thread.c
-@@ -918,11 +918,11 @@ enum store_item_type store_item(item *item, int comm, conn* c) {
- 
- /******************************* GLOBAL STATS ******************************/
- 
--void STATS_LOCK() {
-+void STATS_LOCK(void) {
-     pthread_mutex_lock(&stats_lock);
- }
- 
--void STATS_UNLOCK() {
-+void STATS_UNLOCK(void) {
-     pthread_mutex_unlock(&stats_lock);
- }
- 
diff --git a/meta-networking/recipes-support/memcached/memcached/memcached-add-hugetlbfs-check.patch b/meta-networking/recipes-support/memcached/memcached/memcached-add-hugetlbfs-check.patch
index 45428ed234..26281e73ef 100644
--- a/meta-networking/recipes-support/memcached/memcached/memcached-add-hugetlbfs-check.patch
+++ b/meta-networking/recipes-support/memcached/memcached/memcached-add-hugetlbfs-check.patch
@@ -1,4 +1,7 @@
-memcached: add knob to detect whether hugetlbfs are checked
+From dfa90817a08f206f7e2dbba44d913968ae7f7d94 Mon Sep 17 00:00:00 2001
+From: Chong Lu <Chong.Lu@windriver.com>
+Date: Tue, 19 Aug 2014 17:38:32 +0800
+Subject: [PATCH] memcached: add knob to detect whether hugetlbfs are checked
 
 Add knob to detect whether hugetlbfs are checked or not.
 
@@ -6,12 +9,14 @@ Upstream-Status: Pending
 
 Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
 ---
- configure.ac | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
+ configure.ac | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
 
+diff --git a/configure.ac b/configure.ac
+index 6f2ef97..bd7dd96 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -488,8 +488,12 @@ if test "x$enable_static" = "xyes"; then
+@@ -559,8 +559,12 @@ if test "x$enable_static" = "xyes"; then
  fi
  
  dnl ----------------------------------------------------------------------------
diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.17.bb b/meta-networking/recipes-support/memcached/memcached_1.6.33.bb
similarity index 93%
rename from meta-networking/recipes-support/memcached/memcached_1.6.17.bb
rename to meta-networking/recipes-support/memcached/memcached_1.6.33.bb
index dabe393573..346754c6ad 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.33.bb
@@ -21,9 +21,8 @@ RDEPENDS:${PN} += "perl perl-module-posix perl-module-autoloader \
 
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            file://memcached-add-hugetlbfs-check.patch \
-           file://0001-Fix-function-protypes.patch \
            "
-SRC_URI[sha256sum] = "2055e373613d8fc21529aff9f0adce3e23b9ce01ba0478d30e7941d9f2bd1224"
+SRC_URI[sha256sum] = "707f74c4c6876b61532b998ca8f118b0b82a0d96365d7a1d70ebfc40dfe83dad"
 
 CVE_STATUS[CVE-2022-26635] = "disputed: this is a problem of applications using php-memcached inproperly"
 
-- 
2.30.2


