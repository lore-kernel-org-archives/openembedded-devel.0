Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A48C3DA6B
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 07:14:32 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.8679.1661843670884521705
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i7UV5VSl;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id p185so10469932pfb.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=fP2WAuzLy4jGATYaCBQROgk+fhCjp2T6XHdrx91PS1Y=;
        b=i7UV5VSlh69amMSTK5p8I3oyYkmOvFa3qXgXThp1hcXjauORVklGfUl/pkScs2a4Uv
         oB8Ts2jqZpyebdwGg3r3wLQYopCFkX7rfmNuKIwS7+G5aeJhmVvpK/T+9M4oBWc0+lsL
         2kb4M8Xlo++eLtj+MiWRpQ2uhIP6GrIpi6H9+gYmEO8mdFvo9ET0y1P/0qaflkDXrwE/
         jsGw1OgrLNg5qIaB3qXoPXbdqb2PMTCW6vJkJD/ebFL0jSrPFP4VZCvTMYHEkD2PtLzU
         3Oj7ZSTpLP5Mad1a/uNPmHGGRzdPajP+PHcF7shVfXLaigfy4QYIPTxnAnAY9SR4Qt4+
         pTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=fP2WAuzLy4jGATYaCBQROgk+fhCjp2T6XHdrx91PS1Y=;
        b=Jee1XDN7v4CHoQO3XKJNhQ6hOqwtXTdwK7b8qwQe1uRPisQiM6lT2TKmeK26PKMeTy
         XSkftD/0R0AgCGgBKFSW8JhTFfSFp6hRRZo1EUrpp9WYfAdrcZ0ctlWhuTIKrg8nCqYy
         SwA+Sm3f5ifTDD3RUtT4e//NN9K7InLk5rRRhd9pLuCR0CAHPEbo3tSoYiXGx1TfketF
         ZpQwrhaXpe4jNdZ00DcLcgqVCPChykpQKhw3XoSsrsNwkpQMpnbi/wKaVCBpJrigsQzZ
         5fAKdiNJBe3olv509bxx72JLJo1eJ2KOQTVKTP9tKd4dGOvWTX3APbjYaTHrUzl5ZbNz
         644w==
X-Gm-Message-State: ACgBeo1c9G9Ml9wU4OCZYXS70bysjPW8wIDsF7dxTLoj+Xs32TgiRJSe
	f24C7BWgu2HgzMfQIvN7ae7wa/l5Oth47A==
X-Google-Smtp-Source: 
 AA6agR7lJcmp/iq7O2YThqtH5s/Vt2souXkoDvyoVE6vAwCxauMD51RViQb9X+3WbylA4KdTU3cCBw==
X-Received: by 2002:a63:54a:0:b0:42b:22fa:bc4c with SMTP id
 71-20020a63054a000000b0042b22fabc4cmr17254094pgf.434.1661843670012;
        Tue, 30 Aug 2022 00:14:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 z24-20020aa79f98000000b00537f9e32b00sm6041616pfr.37.2022.08.30.00.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 00:14:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 16/21] memcached: Upgrade to 1.6.17
Date: Tue, 30 Aug 2022 00:14:08 -0700
Message-Id: <20220830071413.3887189-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830071413.3887189-1-raj.khem@gmail.com>
References: <20220830071413.3887189-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 07:14:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98553

Fix build with clang while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-function-protypes.patch          | 110 ++++++++++++++++++
 ...emcached_1.6.15.bb => memcached_1.6.17.bb} |   8 +-
 2 files changed, 116 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/memcached/memcached/0001-Fix-function-protypes.patch
 rename meta-networking/recipes-support/memcached/{memcached_1.6.15.bb => memcached_1.6.17.bb} (84%)

diff --git a/meta-networking/recipes-support/memcached/memcached/0001-Fix-function-protypes.patch b/meta-networking/recipes-support/memcached/memcached/0001-Fix-function-protypes.patch
new file mode 100644
index 0000000000..15ef54f80e
--- /dev/null
+++ b/meta-networking/recipes-support/memcached/memcached/0001-Fix-function-protypes.patch
@@ -0,0 +1,110 @@
+From 6021d3d60e64d9174f41515d2d962df9b5d7645e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 29 Aug 2022 17:15:28 -0700
+Subject: [PATCH] Fix function protypes
+
+clang-15+ has started diagnosing them as errors
+
+thread.c:925:18: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
+| void STATS_UNLOCK() {
+|                  ^
+|                   void
+
+Upstream-Status: Submitted [https://github.com/memcached/memcached/pull/928]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ assoc.c     | 4 ++--
+ memcached.c | 4 ++--
+ slabs.c     | 2 +-
+ testapp.c   | 2 +-
+ thread.c    | 4 ++--
+ 5 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/assoc.c b/assoc.c
+index bc68695..01063a9 100644
+--- a/assoc.c
++++ b/assoc.c
+@@ -261,7 +261,7 @@ static void *assoc_maintenance_thread(void *arg) {
+ 
+ static pthread_t maintenance_tid;
+ 
+-int start_assoc_maintenance_thread() {
++int start_assoc_maintenance_thread(void) {
+     int ret;
+     char *env = getenv("MEMCACHED_HASH_BULK_MOVE");
+     if (env != NULL) {
+@@ -279,7 +279,7 @@ int start_assoc_maintenance_thread() {
+     return 0;
+ }
+ 
+-void stop_assoc_maintenance_thread() {
++void stop_assoc_maintenance_thread(void) {
+     mutex_lock(&maintenance_lock);
+     do_run_maintenance_thread = 0;
+     pthread_cond_signal(&maintenance_cond);
+diff --git a/memcached.c b/memcached.c
+index 7871fe8..4d3b54a 100644
+--- a/memcached.c
++++ b/memcached.c
+@@ -84,7 +84,7 @@ static int try_read_command_udp(conn *c);
+ static enum try_read_result try_read_network(conn *c);
+ static enum try_read_result try_read_udp(conn *c);
+ 
+-static int start_conn_timeout_thread();
++static int start_conn_timeout_thread(void);
+ 
+ /* stats */
+ static void stats_init(void);
+@@ -374,7 +374,7 @@ static void *conn_timeout_thread(void *arg) {
+     return NULL;
+ }
+ 
+-static int start_conn_timeout_thread() {
++static int start_conn_timeout_thread(void) {
+     int ret;
+ 
+     if (settings.idle_timeout == 0)
+diff --git a/slabs.c b/slabs.c
+index 3c78d8a..0dadd35 100644
+--- a/slabs.c
++++ b/slabs.c
+@@ -638,7 +638,7 @@ static void *memory_allocate(size_t size) {
+ }
+ 
+ /* Must only be used if all pages are item_size_max */
+-static void memory_release() {
++static void memory_release(void) {
+     void *p = NULL;
+     if (mem_base != NULL)
+         return;
+diff --git a/testapp.c b/testapp.c
+index 5face54..387a847 100644
+--- a/testapp.c
++++ b/testapp.c
+@@ -80,7 +80,7 @@ static struct conn *con = NULL;
+ static bool allow_closed_read = false;
+ static bool enable_ssl = false;
+ 
+-static void close_conn() {
++static void close_conn(void) {
+     if (con == NULL) return;
+ #ifdef TLS
+     if (con->ssl) {
+diff --git a/thread.c b/thread.c
+index d5ed052..f5efdc3 100644
+--- a/thread.c
++++ b/thread.c
+@@ -918,11 +918,11 @@ enum store_item_type store_item(item *item, int comm, conn* c) {
+ 
+ /******************************* GLOBAL STATS ******************************/
+ 
+-void STATS_LOCK() {
++void STATS_LOCK(void) {
+     pthread_mutex_lock(&stats_lock);
+ }
+ 
+-void STATS_UNLOCK() {
++void STATS_UNLOCK(void) {
+     pthread_mutex_unlock(&stats_lock);
+ }
+ 
diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.15.bb b/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
similarity index 84%
rename from meta-networking/recipes-support/memcached/memcached_1.6.15.bb
rename to meta-networking/recipes-support/memcached/memcached_1.6.17.bb
index b28bfe72b7..270ad5486d 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.15.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.17.bb
@@ -12,7 +12,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7e5ded7363d335e1bb18013ca08046ff"
 
-inherit autotools
+inherit autotools pkgconfig
 
 DEPENDS += "libevent"
 RDEPENDS:${PN} += "perl perl-module-posix perl-module-autoloader \
@@ -21,12 +21,16 @@ RDEPENDS:${PN} += "perl perl-module-posix perl-module-autoloader \
 
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            file://memcached-add-hugetlbfs-check.patch \
+           file://0001-Fix-function-protypes.patch \
            "
-SRC_URI[sha256sum] = "8d7abe3d649378edbba16f42ef1d66ca3f2ac075f2eb97145ce164388e6ed515"
+SRC_URI[sha256sum] = "2055e373613d8fc21529aff9f0adce3e23b9ce01ba0478d30e7941d9f2bd1224"
 
 # set the same COMPATIBLE_HOST as libhugetlbfs
 COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
 
+# assoc.c:83:9: error: variable 'depth' set but not used [-Werror,-Wunused-but-set-variable]
+CFLAGS:append:toolchain-clang = " -Wno-error=unused-but-set-variable"
+
 python __anonymous () {
     endianness = d.getVar('SITEINFO_ENDIANNESS')
     if endianness == 'le':
-- 
2.37.2


