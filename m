Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6749ACFC518
	for <webhook@archiver.kernel.org>; Sun, 23 Nov 2025 16:17:39 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16392.1763914657935808532
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Nov 2025 08:17:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U56wcRJR;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b3669ca3dso1423080f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 08:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763914656; x=1764519456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0Nulbj7A6RnQntK6pTXJ+pmrfbDhgFs+iq4SOnHlPU=;
        b=U56wcRJR/R0hHaowDWo2h4a8Rgia8veqe2hFbVjLrSoGwOa4uVyT7WJtd/w0F1qtXY
         +ySKvGtNplRPWbLe87tT7nedI6tXAJzlanKVOf8pcbfWp7g8ZXwNEfplGVsXs1lyr5j1
         dAuKDN9AZS44l+IBAGnXDkJD4oGgFFPv37/+Epdatym4TmlN8IFxV5XcIMRrnPxuIa7p
         HogMs8H0MVJSqZFTX71kwpvOiRnbTmrgOulpdfnA2HmuhtLzjNJPIWFBHJhZZGhI6xJ5
         C44olTJK99iKcRhNKmCQZNvqH9shOcYWxuPjW8bfYXhOY/QwjrugFUrjphHrlu6/efJZ
         AAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763914656; x=1764519456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N0Nulbj7A6RnQntK6pTXJ+pmrfbDhgFs+iq4SOnHlPU=;
        b=O/dqljiiIxDSv7pt5XB9sxjn5abVTS3EMwQsXEEChJ1l0XEQxXf722gF5uEqCpMf1C
         m2qUHHgn8VRiQly1EMxMfnemUoRxSq91DAPiTJHcJc6zptGV3h7MtJ0xeHsy/BbXjEFy
         Yl3IHT8oLH35RB81b6VuP9cttyuFeY2ROe3fFe71b0IkAPSoNU/zKJkVWyX1kvwBcde/
         ryNoJ6R2eJgL/tTY8joItE4uspRqkMn00q5PW/6nrzZHBu5f9wr8n5xYN1R+tlUnogSg
         8D79qqjG/VDdSVD/qUP9w0QBYTjRByfgl/VYbLAQ2ypDtg6+hl2HQ8bkKQE92tOY7XlR
         Y/Lg==
X-Gm-Message-State: AOJu0Yz8pzGnVX4j/E6ZME5ZCrljW4pfdOlsyzYcAhcia5YARBjXHZlg
	9IH6jIL5vgB4uZmlbM+bGAb1ENhBRxeGKdklciDpb60SxM/gI+DTpGOsdL1q7awB
X-Gm-Gg: ASbGncuBuR6+fUhVNxJJfxXh8NT58X44T1/OLd4E0dy3sY61qGSz5xgED8Nvc52tNCc
	0Mo8aMqRQ1x20XRgqoS6R6kHSrbKNnBoMXbyJt+r2mBUKadClTcTWSa6ICzeZo8tgVyeDFry2Q1
	hqRFQBlsD60org7eXQZFAKhCTI2p+EIXSk1EySzp21ooftK7SpCQo5pDziHpF4zYtGDDI/wJx0+
	LysK3VwNwt6F2G+H2d846ZcAwwyQVPedSYlghsTx+b9z6wAfUmINwPaYJdMufO7Ug8Ku2yeiWJb
	J/xT5dwTaz0/NY3KPsEPypoUpySCUNOe9yhgbmy7qLxOwJfgWNafe7I5z5AxMuXBWJHXIpOjZrH
	fEwq0FbbVXKcoDwjZCS21b94/qf5eec0LKg2rrYWEIcwHiRa7KEknB0BwTSXCl2/P3Qr0OBCSnr
	7TH8swZqiJ
X-Google-Smtp-Source: AGHT+IGjPe1Ts8Es2BMllhxH3MyFRZwnqH9cvx5gZkltjPmgyRQL3w+lfZC64OQs3rO2tYFOj9cdTw==
X-Received: by 2002:a05:6000:230c:b0:42b:3272:c4a7 with SMTP id ffacd0b85a97d-42cc1d0cfc3mr8437365f8f.29.1763914656037;
        Sun, 23 Nov 2025 08:17:36 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3592sm22279416f8f.21.2025.11.23.08.17.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 08:17:34 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/4] redis: upgrade 7.0.13 -> 7.0.15
Date: Sun, 23 Nov 2025 17:17:31 +0100
Message-ID: <20251123161732.1875494-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251123161732.1875494-1-skandigraun@gmail.com>
References: <20251123161732.1875494-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 16:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121995

Contains fixes for CVE-2023-41056 and CVE-2023-45145.

Dropped the backported patches that are included.

Release notes: https://github.com/redis/redis/blob/7.0.15/00-RELEASENOTES

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../redis/redis-7.0.13/CVE-2023-41056.patch   | 63 ----------------
 .../redis/redis-7.0.13/CVE-2023-45145.patch   | 72 -------------------
 .../0001-src-Do-not-reset-FINAL_LIBS.patch    |  0
 ...006-Define-correct-gregs-for-RISCV32.patch |  0
 .../CVE-2024-31227.patch                      |  0
 .../CVE-2024-31228.patch                      |  0
 .../CVE-2024-31449.patch                      |  0
 .../CVE-2024-46981.patch                      |  0
 .../CVE-2024-51741.patch                      |  0
 .../CVE-2025-21605.patch                      |  0
 .../CVE-2025-27151.patch                      |  0
 .../CVE-2025-32023.patch                      |  0
 .../CVE-2025-46817.patch                      |  0
 .../CVE-2025-46818.patch                      |  0
 .../CVE-2025-46819.patch                      |  0
 .../CVE-2025-48367.patch                      |  0
 .../CVE-2025-49844.patch                      |  0
 .../GNU_SOURCE-7.patch                        |  0
 .../hiredis-use-default-CC-if-it-is-set.patch |  0
 .../init-redis-server                         |  0
 ...ile-to-use-environment-build-setting.patch |  0
 .../oe-use-libc-malloc.patch                  |  0
 .../{redis-7.0.13 => redis-7.0.15}/redis.conf |  0
 .../redis.service                             |  0
 .../{redis_7.0.13.bb => redis_7.0.15.bb}      |  4 +-
 25 files changed, 1 insertion(+), 138 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2023-41056.patch
 delete mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2023-45145.patch
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/0001-src-Do-not-reset-FINAL_LIBS.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/0006-Define-correct-gregs-for-RISCV32.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2024-31227.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2024-31228.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2024-31449.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2024-46981.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2024-51741.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2025-21605.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2025-27151.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2025-32023.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2025-46817.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2025-46818.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2025-46819.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2025-48367.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/CVE-2025-49844.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/GNU_SOURCE-7.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/hiredis-use-default-CC-if-it-is-set.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/lua-update-Makefile-to-use-environment-build-setting.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/oe-use-libc-malloc.patch (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.0.13 => redis-7.0.15}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_7.0.13.bb => redis_7.0.15.bb} (94%)

diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2023-41056.patch b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2023-41056.patch
deleted file mode 100644
index 036e62c8f0..0000000000
--- a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2023-41056.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From e351099e1119fb89496be578f5232c61ce300224 Mon Sep 17 00:00:00 2001
-From: Oran Agra <oran@redislabs.com>
-Date: Sun, 7 Jan 2024 12:32:44 +0200
-Subject: [PATCH] Fix possible corruption in sdsResize (CVE-2023-41056)
-
-#11766 introduced a bug in sdsResize where it could forget to update
-the sds type in the sds header and then cause an overflow in sdsalloc.
-it looks like the only implication of that is a possible assertion in HLL,
-but it's hard to rule out possible heap corruption issues with clientsCronResizeQueryBuffer
-
-CVE: CVE-2023-41056
-
-Upstream-Status: Backport [https://github.com/redis/redis/commit/e351099e1119fb89496be578f5232c61ce300224]
-
-Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
----
- src/sds.c | 30 ++++++++++++++++--------------
- 1 file changed, 16 insertions(+), 14 deletions(-)
-
-diff --git a/src/sds.c b/src/sds.c
-index 8e5863a..71490d5 100644
---- a/src/sds.c
-+++ b/src/sds.c
-@@ -348,20 +348,22 @@ sds sdsResize(sds s, size_t size, int would_regrow) {
-      * type. */
-     int use_realloc = (oldtype==type || (type < oldtype && type > SDS_TYPE_8));
-     size_t newlen = use_realloc ? oldhdrlen+size+1 : hdrlen+size+1;
--    int alloc_already_optimal = 0;
--    #if defined(USE_JEMALLOC)
--        /* je_nallocx returns the expected allocation size for the newlen.
--         * We aim to avoid calling realloc() when using Jemalloc if there is no
--         * change in the allocation size, as it incurs a cost even if the
--         * allocation size stays the same. */
--        alloc_already_optimal = (je_nallocx(newlen, 0) == zmalloc_size(sh));
--    #endif
--
--    if (use_realloc && !alloc_already_optimal) {
--        newsh = s_realloc(sh, newlen);
--        if (newsh == NULL) return NULL;
--        s = (char*)newsh+oldhdrlen;
--    } else if (!alloc_already_optimal) {
-+
-+    if (use_realloc) {
-+        int alloc_already_optimal = 0;
-+        #if defined(USE_JEMALLOC)
-+            /* je_nallocx returns the expected allocation size for the newlen.
-+             * We aim to avoid calling realloc() when using Jemalloc if there is no
-+             * change in the allocation size, as it incurs a cost even if the
-+             * allocation size stays the same. */
-+            alloc_already_optimal = (je_nallocx(newlen, 0) == zmalloc_size(sh));
-+        #endif
-+        if (!alloc_already_optimal) {
-+            newsh = s_realloc(sh, newlen);
-+            if (newsh == NULL) return NULL;
-+            s = (char*)newsh+oldhdrlen;
-+        }
-+    } else {
-         newsh = s_malloc(newlen);
-         if (newsh == NULL) return NULL;
-         memcpy((char*)newsh+hdrlen, s, len);
--- 
-2.40.0
-
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2023-45145.patch b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2023-45145.patch
deleted file mode 100644
index aab1bbfeb0..0000000000
--- a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2023-45145.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 7f486ea6eebf0afce74f2e59763b9b82b78629dc Mon Sep 17 00:00:00 2001
-From: Yossi Gottlieb <yossigo@gmail.com>
-Date: Wed, 11 Oct 2023 22:45:34 +0300
-Subject: [PATCH] Fix issue of listen before chmod on Unix sockets 
- (CVE-2023-45145)
-
-Before this commit, Unix socket setup performed chmod(2) on the socket
-file after calling listen(2). Depending on what umask is used, this
-could leave the file with the wrong permissions for a short period of
-time. As a result, another process could exploit this race condition and
-establish a connection that would otherwise not be possible.
-
-We now make sure the socket permissions are set up prior to calling
-listen(2).
-
-(cherry picked from commit a11b3bc34a054818f2ac70e50adfc542ca1cba42)
-
-CVE: CVE-2023-45145
-
-Upstream-Status: Backport [https://github.com/redis/redis/commit/7f486ea6eebf0afce74f2e59763b9b82b78629dc]
-
-Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
----
- src/anet.c | 11 ++++++-----
- 1 file changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/src/anet.c b/src/anet.c
-index 4ea201d..10840fc 100644
---- a/src/anet.c
-+++ b/src/anet.c
-@@ -407,13 +407,16 @@ int anetUnixGenericConnect(char *err, const char *path, int flags)
-     return s;
- }
- 
--static int anetListen(char *err, int s, struct sockaddr *sa, socklen_t len, int backlog) {
-+static int anetListen(char *err, int s, struct sockaddr *sa, socklen_t len, int backlog, mode_t perm) {
-     if (bind(s,sa,len) == -1) {
-         anetSetError(err, "bind: %s", strerror(errno));
-         close(s);
-         return ANET_ERR;
-     }
- 
-+    if (sa->sa_family == AF_LOCAL && perm)
-+        chmod(((struct sockaddr_un *) sa)->sun_path, perm);
-+
-     if (listen(s, backlog) == -1) {
-         anetSetError(err, "listen: %s", strerror(errno));
-         close(s);
-@@ -457,7 +460,7 @@ static int _anetTcpServer(char *err, int port, char *bindaddr, int af, int backl
- 
-         if (af == AF_INET6 && anetV6Only(err,s) == ANET_ERR) goto error;
-         if (anetSetReuseAddr(err,s) == ANET_ERR) goto error;
--        if (anetListen(err,s,p->ai_addr,p->ai_addrlen,backlog) == ANET_ERR) s = ANET_ERR;
-+        if (anetListen(err,s,p->ai_addr,p->ai_addrlen,backlog,0) == ANET_ERR) s = ANET_ERR;
-         goto end;
-     }
-     if (p == NULL) {
-@@ -498,10 +501,8 @@ int anetUnixServer(char *err, char *path, mode_t perm, int backlog)
-     memset(&sa,0,sizeof(sa));
-     sa.sun_family = AF_LOCAL;
-     strncpy(sa.sun_path,path,sizeof(sa.sun_path)-1);
--    if (anetListen(err,s,(struct sockaddr*)&sa,sizeof(sa),backlog) == ANET_ERR)
-+    if (anetListen(err,s,(struct sockaddr*)&sa,sizeof(sa),backlog,perm) == ANET_ERR)
-         return ANET_ERR;
--    if (perm)
--        chmod(sa.sun_path, perm);
-     return s;
- }
- 
--- 
-2.40.0
-
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/0001-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.0.15/0001-src-Do-not-reset-FINAL_LIBS.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.13/0001-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.15/0001-src-Do-not-reset-FINAL_LIBS.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.0.15/0006-Define-correct-gregs-for-RISCV32.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.13/0006-Define-correct-gregs-for-RISCV32.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.15/0006-Define-correct-gregs-for-RISCV32.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-31227.patch b/meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2024-31227.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-31227.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2024-31227.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-31228.patch b/meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2024-31228.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-31228.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2024-31228.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-31449.patch b/meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2024-31449.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-31449.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2024-31449.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-46981.patch b/meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2024-46981.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-46981.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2024-46981.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-51741.patch b/meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2024-51741.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2024-51741.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2024-51741.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-21605.patch b/meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2025-21605.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-21605.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2025-21605.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-27151.patch b/meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2025-27151.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-27151.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2025-27151.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-32023.patch b/meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2025-32023.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-32023.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2025-32023.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46817.patch b/meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2025-46817.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46817.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2025-46817.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46818.patch b/meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2025-46818.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46818.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2025-46818.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46819.patch b/meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2025-46819.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46819.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2025-46819.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-48367.patch b/meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2025-48367.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-48367.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2025-48367.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-49844.patch b/meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2025-49844.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-49844.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.15/CVE-2025-49844.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/GNU_SOURCE-7.patch b/meta-oe/recipes-extended/redis/redis-7.0.15/GNU_SOURCE-7.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.13/GNU_SOURCE-7.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.15/GNU_SOURCE-7.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.0.15/hiredis-use-default-CC-if-it-is-set.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.13/hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.15/hiredis-use-default-CC-if-it-is-set.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/init-redis-server b/meta-oe/recipes-extended/redis/redis-7.0.15/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.13/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-7.0.15/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.0.15/lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.13/lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.15/lua-update-Makefile-to-use-environment-build-setting.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/oe-use-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-7.0.15/oe-use-libc-malloc.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.13/oe-use-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-7.0.15/oe-use-libc-malloc.patch
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/redis.conf b/meta-oe/recipes-extended/redis/redis-7.0.15/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.13/redis.conf
rename to meta-oe/recipes-extended/redis/redis-7.0.15/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/redis.service b/meta-oe/recipes-extended/redis/redis-7.0.15/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.0.13/redis.service
rename to meta-oe/recipes-extended/redis/redis-7.0.15/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.13.bb b/meta-oe/recipes-extended/redis/redis_7.0.15.bb
similarity index 94%
rename from meta-oe/recipes-extended/redis/redis_7.0.13.bb
rename to meta-oe/recipes-extended/redis/redis_7.0.15.bb
index c3d98694d5..7b5d55467d 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.13.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.15.bb
@@ -16,8 +16,6 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
-           file://CVE-2023-41056.patch \
-           file://CVE-2023-45145.patch \
            file://CVE-2024-31227.patch \
            file://CVE-2024-31228.patch \
            file://CVE-2024-31449.patch \
@@ -32,7 +30,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://CVE-2025-46819.patch \
            file://CVE-2025-49844.patch \
            "
-SRC_URI[sha256sum] = "97065774d5fb8388eb0d8913458decfcb167d356e40d31dd01cd30c1cc391673"
+SRC_URI[sha256sum] = "98066f5363504b26c34dd20fbcc3c957990d764cdf42576c836fc021073f4341"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 

