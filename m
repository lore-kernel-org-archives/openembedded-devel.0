Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776C2C982FD
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 04:33:31 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.721.1790224406839364771
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 21:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Cpbslsqu;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e211a3so877766b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 21:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224406; x=1790829206; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jNpz5bu3EtBX3wZBwhshpLFuwiVrEnqZ+vNL4WKg+mw=;
        b=CpbslsquUKpLGp2wzUPerHAhXuSBURDNVK9AAiwhB072ayyiyTUvEjJzu0ERAajAs8
         hsBQstZCd8ri0v6sYttJOa7Iqt8dbBiGYrrxato84PhYZ4nH1X9ItOKU5h4s9x3ZhsLv
         4W8cl95vWrSisXJxPeRfoVH5tmHvzAHKWBpjvtcimFn3X4yh7bp3EGf2pD2txarqQXeN
         F1aRMB2eNaegnTBif+tO0kWBnANyUtFQCzWJG8kB1NjSzISxiv2Pwbw3w9lL/0AkxqjY
         oya02WM1sXi8Qc+OZTAuKmQqwhZ5pNpl8sq+yyQSOMVCZwyPXQfefPv8L2jOmduPCgPm
         Sirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224406; x=1790829206;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jNpz5bu3EtBX3wZBwhshpLFuwiVrEnqZ+vNL4WKg+mw=;
        b=0NurueZ+wqOBX8oHqzTm8pvz+VdT442uDr1bkyEKuMD/KF5wUtki5kK3/RbQVl9qzB
         eezihzvFUIdbKr96vl436Tt1FiIiiep0K616TFJkzVtMIi4XmuHxlb9yPzItUIGqRDzA
         Z5lL/dGb3VOaEpKloUNwyVgCnoGwh24wQn/xpNo/GaNreM4umEf3WucdWTkaRkLK7dBT
         CBepoc/IBqty8A3U4rSVnf36+cLBNvl8EGBOTGzKLDFL1YqjnkHC2px6s4cNzW4my2As
         wO1wNVUxrjPLbeU58hLt0LKf+XB7zNxgg6JBBG1/Bm0fna8qUPiSEvSqqzHpnGV0L2Hq
         VQ2w==
X-Gm-Message-State: AFuF++nC1ZyVMtZIGhVIsmRKaMuhonJ5k7yxtKCr0H2RoXVmuS4O+FBv
	quY5TeQyy2UqPkKBARtcp8pAuf6RfrY4H8HHS7oA5phgrsgoDGT0SA1sMtP1AQ==
X-Gm-Gg: AYBFou1R7qlkTkUtYWWEfJ73UM79kObST+3iBA+XRE2eTyTRVbPprP6OQy5ufzmZgTl
	lMUydMpkhpxwsMmFCH+GEVdX0iDPALNjOvQDEU8jFVJrhsVjcvbx5ozKY+glkdbQu4ZfCKFqOO3
	x0FzgiVGo2MZtzWvIadg36fWAGWC7okOANld4CywlMGhL9vbiiz7AVYJCIQzT/BEK03KRH8ot29
	LgD0IUxrFi58NZIxk9JFvC+MEJU3EWxFeLRXh+IdKw+AoJ7+CravFO0FJzwJ1PcHveuGGhxkX5K
	j8sMm9qzna9oDo3XcMYtVtDfoLpqE1sjJqMgYfLtUHW2h9yW0AIrIb3y6voDdXuoGNn779+0LGa
	NCktpUmX4zpLMqJHlJ3DsEz7VNqbVhlaBz3Ks/11WbdCf6xWANPvbnwsQ9ptJJ1oLxcwogoUzn0
	lYGFqvv3TbUDRyecaskKnbjFvAzrU+H5HlHTOelkqANK/ew1Tljbqxufl6Xs3G/ixQhbsEjF8Nv
	oXWBQJkFtQESQv20SNjP8/kBP+lAnHCIQ==
X-Received: by 2002:a05:6a00:6ca7:b0:87d:fa7:87c1 with SMTP id d2e1a72fcca58-87e9f053fa5mr1057389b3a.29.1790224406139;
        Wed, 23 Sep 2026 21:33:26 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e601b5dsm2189686b3a.61.2026.09.23.21.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:33:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 3/24] redis: patch CVE-2026-81934
Date: Thu, 24 Sep 2026 16:32:53 +1200
Message-ID: <20260924043315.1663186-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
References: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 04:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130251

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-81934

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../redis/redis-8.0.6/CVE-2026-81934.patch    | 53 +++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_8.0.6.bb |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-81934.patch

diff --git a/meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-81934.patch b/meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-81934.patch
new file mode 100644
index 0000000000..80a9118d92
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-81934.patch
@@ -0,0 +1,53 @@
+From 83b6dda66e69bdaf7927140d70666f838b33cbf0 Mon Sep 17 00:00:00 2001
+From: Sergei Georgiev <s_ggeorgiev@yahoo.com>
+Date: Tue, 9 Jun 2026 14:22:50 +0300
+Subject: [PATCH] Fix use-after-free in tlsProcessPendingData() pending-list
+ iteration (#1391)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+`tlsProcessPendingData()` iterates `pending_list` using a `listIter`, which pre-caches the `next` node pointer on every `listNext()` call. This cached pointer can dangle and be dereferenced after the node it points to has been freed, causing a use-after-free and a server crash (SIGSEGV).
+
+The issue occurs because `tlsHandleEvent()` runs the connection's read handler, which can execute a command (e.g. `CLIENT KILL`) that closes a *different* pending TLS connection. That close path goes through `freeClient()` → `connClose()` → `connTLSClose()`, which calls `listDelNode()` and frees the victim connection's `pending_list` node. If the iterator's cached `next` pointer referenced that node, the following `listNext()` reads freed memory. The `listNext()` contract only permits removing the *current* node, not arbitrary other nodes.
+
+Replace the `listIter`-based iteration with a detach-from-head, bounded drain so that no list node pointer is ever held across a handler call:
+
+- Re-read `listFirst()` on each iteration instead of relying on a pre-cached `next` pointer
+- Detach the head via `tlsPendingRemove()` *before* calling `tlsHandleEvent()`, so the loop always makes forward progress
+- Semantics are preserved: in the common case each connection is handled exactly once per cycle, in order
+
+(cherry picked from commit 98ff29b2828bf3245167b416ee23e6797f551a37)
+(cherry picked from commit 6d088c335d5c3ec49a6c28486140b498e70b7834)
+
+CVE: CVE-2026-81934
+Upstream-Status: Backport [https://github.com/redis/redis/commit/6d088c335d5c3ec49a6c28486140b498e70b7834]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/tls.c | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/src/tls.c b/src/tls.c
+index a0733a4b6..0fa468cfc 100644
+--- a/src/tls.c
++++ b/src/tls.c
+@@ -1098,15 +1098,14 @@ static int tlsHasPendingData(struct aeEventLoop *el) {
+ }
+ 
+ static int tlsProcessPendingData(struct aeEventLoop *el) {
+-    listIter li;
+-    listNode *ln;
+-
+     list *pending_list = el->privdata[1];
+     if (!pending_list) return 0;
+     int processed = listLength(pending_list);
+-    listRewind(pending_list,&li);
+-    while((ln = listNext(&li))) {
++    for (int i = 0; i < processed; i++) {
++        listNode *ln = listFirst(pending_list);
++        if (!ln) break;
+         tls_connection *conn = listNodeValue(ln);
++        tlsPendingRemove(conn);
+         tlsHandleEvent(conn, AE_READABLE);
+     }
+     return processed;
diff --git a/meta-oe/recipes-extended/redis/redis_8.0.6.bb b/meta-oe/recipes-extended/redis/redis_8.0.6.bb
index fe31033328..67126c9fcf 100644
--- a/meta-oe/recipes-extended/redis/redis_8.0.6.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.0.6.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0003-hack-to-force-use-of-libc-malloc.patch \
            file://0004-src-Do-not-reset-FINAL_LIBS.patch \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
+           file://CVE-2026-81934.patch \
           "
 SRC_URI[sha256sum] = "6d0a9913887a4972536f9da226f1575859c34d86354129163260a5f9c6bd4229"
 

