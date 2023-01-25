Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE2DCC636CB
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:32:06 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.44978.1674653508098724592
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GXukRYJg;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id z12-20020a4a490c000000b004f21c72be42so3136076ooa.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k39p6gQRFOEF2nBeg5lDs+Ed9fL17Akywqu04ZD9o6I=;
        b=GXukRYJgwqNo3bldCAYAgBND/VlfOeqTP3fVeL8dnA6MDHTfzSdnKAB+kkGFbzhfQe
         3ZgdkZw0CK+eHPQgZ3J+gJxJhjv/AcouV843rHYHpTt4OerypuInH7uPncoy6Kpil5us
         fzkOyDZ7gYx8Mw31MS7TAK+j9zki5UaQZaX+0lFd9Untf4Y2b/IuViOjiA9VtesaUrMO
         Hr80zEf2zWLryvbqp8GP0hsa+wyhzozSxiA7TxTk2NplpYHP9LvUYxYMfi4658u6fWpU
         zw8b7iK57uQ1vXJFOrkBCEmGX+v481QBkx2eL2NiG9i5QdEEUayVPS5yCPOImS5r1AmM
         +8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k39p6gQRFOEF2nBeg5lDs+Ed9fL17Akywqu04ZD9o6I=;
        b=v8kyFRop5iVJT+NSc7s/vTBOU3L2TX9apOdGIAndDjN7PDB/dGGV3StqsHhRYqNF9b
         iKu95fDgC18fk9bEij29gP9ojerOisIanHxhUdyPyGgh8T9AOVHmlFPrU418Dbaf/GPA
         RESKAis91Tj4XU480UKWdnvmK5CkMbtJVJQzVi8br27HpQwkUmaCGBrwXW7zLQ73oq/s
         AJfhppFIDUUUMLaMuRqZ/t6QUw0A0cWYjFomwpZyLBZKpzNm/e5Nwx+l4pN8AI5TddoT
         8IaBTmzjxW0n1cCB+pvaK4dvmtja7gS3yhqQFhxjDVePylqDfB90LbXwylXZaWtAu3Gf
         Y9qw==
X-Gm-Message-State: AFqh2kqpCXm5OFuEPaWChhpjv0oNqvpnW+tI4ocinqlISBkNd73Q40me
	G3t7poEzlPQpXE0B8TYci9gQrYN6svI=
X-Google-Smtp-Source: AMrXdXtCbMRg2lHcnfbDVuL7WjkryHXsxdnJaSHEpo/qQFSiGVCMpZNNUWw7RPePRvspo2Isenkmmg==
X-Received: by 2002:a4a:c594:0:b0:4ff:4687:dc6c with SMTP id x20-20020a4ac594000000b004ff4687dc6cmr10177810oop.0.1674653517097;
        Wed, 25 Jan 2023 05:31:57 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 30/41] redis: 6.2.7 -> 6.2.8
Date: Wed, 25 Jan 2023 08:31:12 -0500
Message-Id: <005143057e6a17c17fb678e118ea662ec89bd471.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100765

From: Changqing Li <changqing.li@windriver.com>

This upgrade include fix for CVE-2022-3647

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0006-Define-correct-gregs-for-RISCV32.patch   | 15 +++++++++------
 .../redis/{redis_6.2.7.bb => redis_6.2.8.bb}      |  2 +-
 2 files changed, 10 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.7.bb => redis_6.2.8.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
index b2d1a32eda..9d7e502717 100644
--- a/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
+++ b/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
@@ -1,4 +1,4 @@
-From 6134b471c35df826ccb41aab9a47e5c89e15a0c4 Mon Sep 17 00:00:00 2001
+From 26bd72f3b8de22e5036d86e6c79f815853b83473 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 26 Oct 2020 21:32:22 -0700
 Subject: [PATCH] Define correct gregs for RISCV32
@@ -13,10 +13,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 24 insertions(+), 2 deletions(-)
 
 diff --git a/src/debug.c b/src/debug.c
-index e7fec29..5abb404 100644
+index 5318c14..8c21b47 100644
 --- a/src/debug.c
 +++ b/src/debug.c
-@@ -1039,7 +1039,9 @@ static void *getMcontextEip(ucontext_t *uc) {
+@@ -1055,7 +1055,9 @@ static void* getAndSetMcontextEip(ucontext_t *uc, void *eip) {
      #endif
  #elif defined(__linux__)
      /* Linux */
@@ -24,10 +24,10 @@ index e7fec29..5abb404 100644
 +    #if defined(__riscv) && __riscv_xlen == 32
 +    return (void*) uc->uc_mcontext.__gregs[REG_PC];
 +    #elif defined(__i386__) || ((defined(__X86_64__) || defined(__x86_64__)) && defined(__ILP32__))
-     return (void*) uc->uc_mcontext.gregs[14]; /* Linux 32 */
+     GET_SET_RETURN(uc->uc_mcontext.gregs[14], eip);
      #elif defined(__X86_64__) || defined(__x86_64__)
-     return (void*) uc->uc_mcontext.gregs[16]; /* Linux 64 */
-@@ -1206,8 +1208,28 @@ void logRegisters(ucontext_t *uc) {
+     GET_SET_RETURN(uc->uc_mcontext.gregs[16], eip);
+@@ -1222,8 +1224,28 @@ void logRegisters(ucontext_t *uc) {
      #endif
  /* Linux */
  #elif defined(__linux__)
@@ -57,3 +57,6 @@ index e7fec29..5abb404 100644
      serverLog(LL_WARNING,
      "\n"
      "EAX:%08lx EBX:%08lx ECX:%08lx EDX:%08lx\n"
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.7.bb b/meta-oe/recipes-extended/redis/redis_6.2.8.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.7.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.8.bb
index 7f922a4e0f..02ee19fb7d 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.7.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.8.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "b7a79cc3b46d3c6eb52fa37dde34a4a60824079ebdfb3abfbbfa035947c55319"
+SRC_URI[sha256sum] = "f91ab24bcb42673cb853292eb5d43c2017d11d659854808ed6a529c97297fdfe"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


