Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99795C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 18:41:10 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.29509.1640630468770879143
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 10:41:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.194, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 2B62440003;
	Mon, 27 Dec 2021 18:41:05 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [meta-oe][dunfell][PATCH] postgresql: Update to 12.9
Date: Mon, 27 Dec 2021 10:40:03 -0800
Message-Id: <20211227184003.1125376-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 18:41:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94514

Bug and security fixes. Fix patch fuzz as well to remove bitbake
warning. Release notes available at:

https://www.postgresql.org/docs/release/12.8/
https://www.postgresql.org/docs/release/12.9/

12.8 fixes:
CVE-2021-3677

12.9 fixes:
CVE-2021-23214
CVE-2021-23222

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../postgresql/files/0001-Add-support-for-RISC-V.patch      | 6 +++---
 .../postgresql/{postgresql_12.7.bb => postgresql_12.9.bb}   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_12.7.bb => postgresql_12.9.bb} (73%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
index 865ad3287..a1f5b2a7b 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
@@ -13,7 +13,7 @@ diff --git a/src/include/storage/s_lock.h b/src/include/storage/s_lock.h
 index 3fe29ce..7cd578f 100644
 --- a/src/include/storage/s_lock.h
 +++ b/src/include/storage/s_lock.h
-@@ -316,11 +316,12 @@ tas(volatile slock_t *lock)
+@@ -317,11 +317,12 @@ tas(volatile slock_t *lock)
  
  /*
   * On ARM and ARM64, we use __sync_lock_test_and_set(int *, int) if available.
@@ -27,7 +27,7 @@ index 3fe29ce..7cd578f 100644
  #ifdef HAVE_GCC__SYNC_INT32_TAS
  #define HAS_TEST_AND_SET
  
-@@ -337,7 +338,7 @@ tas(volatile slock_t *lock)
+@@ -338,7 +339,7 @@ tas(volatile slock_t *lock)
  #define S_UNLOCK(lock) __sync_lock_release(lock)
  
  #endif	 /* HAVE_GCC__SYNC_INT32_TAS */
@@ -35,7 +35,7 @@ index 3fe29ce..7cd578f 100644
 +#endif	 /* __arm__ || __arm || __aarch64__ || __aarch64 || __riscv */
  
  
- /* S/390 and S/390x Linux (32- and 64-bit zSeries) */
+ /*
 -- 
 2.9.3
 
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_12.7.bb b/meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb
similarity index 73%
rename from meta-oe/recipes-dbs/postgresql/postgresql_12.7.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb
index 18ba2178f..b4c23ced2 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_12.7.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb
@@ -8,4 +8,4 @@ SRC_URI += "\
    file://0001-Improve-reproducibility.patch \
 "
 
-SRC_URI[sha256sum] = "8490741f47c88edc8b6624af009ce19fda4dc9b31c4469ce2551d84075d5d995"
+SRC_URI[sha256sum] = "89fda2de33ed04a98548e43f3ee5f15b882be17505d631fe0dd1a540a2b56dce"
-- 
2.33.1


