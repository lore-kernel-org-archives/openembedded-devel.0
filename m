Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 620C4CFA46B
	for <webhook@archiver.kernel.org>; Sun, 23 Nov 2025 16:17:39 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16390.1763914656025744262
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Nov 2025 08:17:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CgcErVaw;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b3108f41fso2056982f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 08:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763914654; x=1764519454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q2ACN2c0h49+R6xlW8XM7LrZBEhBoVeQJcTBuzKqDBo=;
        b=CgcErVaw2ESeuqaBz3Dmq8geC6HTHEjsFVQhp2iyuy9HJP7joEuRAdEKvI5nn6GQVX
         qcOeruTV4rfasDRKrYSHT1/6K7d0rRRR6Q+Uz3j46EXCWMFBv2W3uxt8yccTLDRCusHf
         +JlTzwwRCjxBlpOPsLFfAiagKeF817LuKFg88Tj90jrL3Oxv+a6PKH8hwxaHGFZ2L4h3
         alylgFY3xz6/shPsixg+BtIoMAeafb3aeQF7p/Ciu1HnslGyHFgrGHfYUz4m+rmCnyvU
         6qzxNVDcV2W2+/hcPC+ho2kCd4W9uykZj5TCDCDH+CtXnX4OyPQsUEdAJ/Zj2RgRdOg3
         aWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763914654; x=1764519454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q2ACN2c0h49+R6xlW8XM7LrZBEhBoVeQJcTBuzKqDBo=;
        b=QpwbVcvtEsZILIZZxiRzZITuiZBYupUBMQAsOZRS2nx/rXK1nTyOZMqooM/482MNNM
         MyQnXYs1n7yD2TSECaUm4ooJ/7gPt97g/dqliRsHWEobUX4PZqYU2X5KQ2FNUNXx7cds
         i6IDY9o3W8zNmVc9rz3ZGM87XAJ9H/j90Aq4WDlInvHT596VAXnJbN6aktlvnL9YkuU/
         7n7GQwYEa+ctlYcPfdF3bafkOY4J4KqBrD50UcD/ys1IwAHZIR2wCgqnuiBfVq7UJgBV
         RZrtj4/25TNYQdWQL2Pe3r8rDm5LqT42ftXrMYktfP8Arg/DCIO+kkRMxe0x/wzbtAKe
         kIaA==
X-Gm-Message-State: AOJu0YzFmnDkbqxiWKeKEB/8s0FnxNLftlAbK2sFzvWNApI60REwOBnF
	8WSgr2F/JLwn8y0wxIkzn7Ta5b0GyRFOIKG7uyI8No/JKvlQscBMhrHLQHLECv9T
X-Gm-Gg: ASbGnctXkEz/kysIv6DocodY8/CcdhzQqk2cUzH9uWjW6J82CsBme7HS99yg58RWeGx
	jtCj5N/Ks/AKfCpnJ7T28+lig2X2OstTC0ck/NXqHnat1WhMskEVfealOd0+aIHmtTCkoKaoqGQ
	VEtfMJEIfdIIJ+AOgxIX1lvuhZ4CgTVovJs9G9Npz5ReJDLDdnkjcxJmcyHmHOGGVmLBrMeSRq8
	XnbbrQwpJuBDq6nbLcM0Ir+2X/jT0l8viIBbU4ldKpGNK4gtRKaD4XGjnwuyz9byrdmSqaxfTTZ
	jgYMTnBwW2WCigyvaWCyUYTGq58dIa5dygccJ+0I1gMjt4H1BXtjLcznY+7idoABC1GIg20ZA4r
	TUfh1Wq/zRRbAYRYBhaIXqcforyLs9epnVmHpt/hktyC3AXskfS8+sE7tzWRipGtAbEnJ9TpbPq
	/5Jf58FD2V
X-Google-Smtp-Source: AGHT+IEtGRNzbSMImyu+xnvsqydAxs9D1FEhtnjW+qFR+vdM2+Cc47+cTOs8cSivW8r95g4vTcUmDA==
X-Received: by 2002:a5d:64c7:0:b0:42b:4061:2416 with SMTP id ffacd0b85a97d-42cc1d19643mr9007432f8f.52.1763914654253;
        Sun, 23 Nov 2025 08:17:34 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3592sm22279416f8f.21.2025.11.23.08.17.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 08:17:33 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/4] redis: upgrade 6.2.12 -> 6.2.21
Date: Sun, 23 Nov 2025 17:17:30 +0100
Message-ID: <20251123161732.1875494-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251123161732.1875494-1-skandigraun@gmail.com>
References: <20251123161732.1875494-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 16:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121994

This upgrade contains a list of vunerability fixes: CVE-2025-49844,
CVE-2025-46817, CVE-2025-46818, CVE-2025-46819, CVE-2025-32023,
CVE-2025-48367, CVE-2025-21605, CVE-2024-46981, CVE-2024-31449,
CVE-2024-31228, CVE-2023-45145, CVE-2022-24834

Dropped the CVE patches that are included above.

Release notes: https://github.com/redis/redis/blob/6.2.21/00-RELEASENOTES

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../redis/redis/CVE-2023-45145.patch          | 72 -------------------
 .../redis/redis/CVE-2024-31228.patch          | 68 ------------------
 .../redis/redis/CVE-2024-31449.patch          | 49 -------------
 .../redis/redis/CVE-2024-46981.patch          | 39 ----------
 .../{redis_6.2.12.bb => redis_6.2.21.bb}      |  6 +-
 5 files changed, 1 insertion(+), 233 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2023-45145.patch
 delete mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2024-31228.patch
 delete mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2024-31449.patch
 delete mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2024-46981.patch
 rename meta-oe/recipes-extended/redis/{redis_6.2.12.bb => redis_6.2.21.bb} (90%)

diff --git a/meta-oe/recipes-extended/redis/redis/CVE-2023-45145.patch b/meta-oe/recipes-extended/redis/redis/CVE-2023-45145.patch
deleted file mode 100644
index f132deb83a..0000000000
--- a/meta-oe/recipes-extended/redis/redis/CVE-2023-45145.patch
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
-index a121c27..91f6171 100644
---- a/src/anet.c
-+++ b/src/anet.c
-@@ -397,13 +397,16 @@ int anetUnixGenericConnect(char *err, const char *path, int flags)
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
-@@ -447,7 +450,7 @@ static int _anetTcpServer(char *err, int port, char *bindaddr, int af, int backl
- 
-         if (af == AF_INET6 && anetV6Only(err,s) == ANET_ERR) goto error;
-         if (anetSetReuseAddr(err,s) == ANET_ERR) goto error;
--        if (anetListen(err,s,p->ai_addr,p->ai_addrlen,backlog) == ANET_ERR) s = ANET_ERR;
-+        if (anetListen(err,s,p->ai_addr,p->ai_addrlen,backlog,0) == ANET_ERR) s = ANET_ERR;
-         goto end;
-     }
-     if (p == NULL) {
-@@ -484,10 +487,8 @@ int anetUnixServer(char *err, char *path, mode_t perm, int backlog)
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
diff --git a/meta-oe/recipes-extended/redis/redis/CVE-2024-31228.patch b/meta-oe/recipes-extended/redis/redis/CVE-2024-31228.patch
deleted file mode 100644
index d86e6c9e72..0000000000
--- a/meta-oe/recipes-extended/redis/redis/CVE-2024-31228.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 9317bf64659b33166a943ec03d5d9b954e86afb0 Mon Sep 17 00:00:00 2001
-From: Oran Agra <oran@redislabs.com>
-Date: Wed, 2 Oct 2024 20:11:01 +0300
-Subject: [PATCH] Prevent pattern matching abuse (CVE-2024-31228)
-
-CVE: CVE-2024-31228
-
-Upstream-Status: Backport[https://github.com/redis/redis/commit/9317bf64659b33166a943ec03d5d9b954e86afb0]
-
-Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
----
- src/util.c              | 9 ++++++---
- tests/unit/keyspace.tcl | 6 ++++++
- 2 files changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/src/util.c b/src/util.c
-index e122a26..5763a2b 100644
---- a/src/util.c
-+++ b/src/util.c
-@@ -46,8 +46,11 @@
- 
- /* Glob-style pattern matching. */
- static int stringmatchlen_impl(const char *pattern, int patternLen,
--        const char *string, int stringLen, int nocase, int *skipLongerMatches)
-+        const char *string, int stringLen, int nocase, int *skipLongerMatches, int nesting)
- {
-+    /* Protection against abusive patterns. */
-+    if (nesting > 1000) return 0;
-+
-     while(patternLen && stringLen) {
-         switch(pattern[0]) {
-         case '*':
-@@ -59,7 +62,7 @@ static int stringmatchlen_impl(const char *pattern, int patternLen,
-                 return 1; /* match */
-             while(stringLen) {
-                 if (stringmatchlen_impl(pattern+1, patternLen-1,
--                            string, stringLen, nocase, skipLongerMatches))
-+                            string, stringLen, nocase, skipLongerMatches, nesting+1))
-                     return 1; /* match */
-                 if (*skipLongerMatches)
-                     return 0; /* no match */
-@@ -181,7 +184,7 @@ static int stringmatchlen_impl(const char *pattern, int patternLen,
- int stringmatchlen(const char *pattern, int patternLen,
-         const char *string, int stringLen, int nocase) {
-     int skipLongerMatches = 0;
--    return stringmatchlen_impl(pattern,patternLen,string,stringLen,nocase,&skipLongerMatches);
-+    return stringmatchlen_impl(pattern,patternLen,string,stringLen,nocase,&skipLongerMatches,0);
- }
- 
- int stringmatch(const char *pattern, const char *string, int nocase) {
-diff --git a/tests/unit/keyspace.tcl b/tests/unit/keyspace.tcl
-index 92029a7..70bc252 100644
---- a/tests/unit/keyspace.tcl
-+++ b/tests/unit/keyspace.tcl
-@@ -485,4 +485,10 @@ start_server {tags {"keyspace"}} {
-         r SET aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa 1
-         r KEYS "a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*b"
-     } {}
-+
-+    test {Regression for pattern matching very long nested loops} {
-+        r flushdb
-+        r SET [string repeat "a" 50000] 1
-+        r KEYS [string repeat "*?" 50000]
-+    } {}
- }
--- 
-2.40.0
-
diff --git a/meta-oe/recipes-extended/redis/redis/CVE-2024-31449.patch b/meta-oe/recipes-extended/redis/redis/CVE-2024-31449.patch
deleted file mode 100644
index 5004cd5ab6..0000000000
--- a/meta-oe/recipes-extended/redis/redis/CVE-2024-31449.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 1f7c148be2cbacf7d50aa461c58b871e87cc5ed9 Mon Sep 17 00:00:00 2001
-From: Oran Agra <oran@redislabs.com>
-Date: Wed, 2 Oct 2024 19:54:06 +0300
-Subject: [PATCH] Fix lua bit.tohex (CVE-2024-31449)
-
-INT_MIN value must be explicitly checked, and cannot be negated.
-
-CVE: CVE-2024-31449
-
-Upstream-Status: Backport [https://github.com/redis/redis/commit/1f7c148be2cbacf7d50aa461c58b871e87cc5ed9]
-
-Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
----
- deps/lua/src/lua_bit.c   | 1 +
- tests/unit/scripting.tcl | 6 ++++++
- 2 files changed, 7 insertions(+)
-
-diff --git a/deps/lua/src/lua_bit.c b/deps/lua/src/lua_bit.c
-index 690df7d..a459ca9 100644
---- a/deps/lua/src/lua_bit.c
-+++ b/deps/lua/src/lua_bit.c
-@@ -131,6 +131,7 @@ static int bit_tohex(lua_State *L)
-   const char *hexdigits = "0123456789abcdef";
-   char buf[8];
-   int i;
-+  if (n == INT32_MIN) n = INT32_MIN+1;
-   if (n < 0) { n = -n; hexdigits = "0123456789ABCDEF"; }
-   if (n > 8) n = 8;
-   for (i = (int)n; --i >= 0; ) { buf[i] = hexdigits[b & 15]; b >>= 4; }
-diff --git a/tests/unit/scripting.tcl b/tests/unit/scripting.tcl
-index 9f5ee77..5e2a7f8 100644
---- a/tests/unit/scripting.tcl
-+++ b/tests/unit/scripting.tcl
-@@ -406,6 +406,12 @@ start_server {tags {"scripting"}} {
-         set e
-     } {ERR*Attempt to modify a readonly table*}
- 
-+    test {lua bit.tohex bug} {
-+        set res [r eval {return bit.tohex(65535, -2147483648)} 0]
-+        r ping
-+        set res
-+    } {0000FFFF}
-+
-     test {Test an example script DECR_IF_GT} {
-         set decr_if_gt {
-             local current
--- 
-2.40.0
-
diff --git a/meta-oe/recipes-extended/redis/redis/CVE-2024-46981.patch b/meta-oe/recipes-extended/redis/redis/CVE-2024-46981.patch
deleted file mode 100644
index c02dd21271..0000000000
--- a/meta-oe/recipes-extended/redis/redis/CVE-2024-46981.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From e344b2b5879aa52870e6838212dfb78b7968fcbf Mon Sep 17 00:00:00 2001
-From: YaacovHazan <yaacov.hazan@redis.com>
-Date: Sun, 15 Dec 2024 21:33:11 +0200
-Subject: [PATCH] Fix LUA garbage collector (CVE-2024-46981)
-
-Reset GC state before closing the lua VM to prevent user data
-to be wrongly freed while still might be used on destructor callbacks.
-
-Conflicts:
-Since luaCtx lctx structure  introduced in later versions [1]
-used already existed redisServer server structure.
-
-Reference:
-[1] https://github.com/redis/redis/commit/e0cd580aefe13e49df802fec5135e4f22d46e758
-
-CVE: CVE-2024-46981
-
-Upstream-Status: Backport [https://github.com/redis/redis/commit/e344b2b5879aa52870e6838212dfb78b7968fcbf]
-
-Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
----
- src/scripting.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/scripting.c b/src/scripting.c
-index 9b926e8..656d4dd 100644
---- a/src/scripting.c
-+++ b/src/scripting.c
-@@ -1467,6 +1467,7 @@ void scriptingRelease(int async) {
-     else
-         dictRelease(server.lua_scripts);
-     server.lua_scripts_mem = 0;
-+    lua_gc(server.lua, LUA_GCCOLLECT, 0);
-     lua_close(server.lua);
- }
- 
--- 
-2.40.0
-
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.12.bb b/meta-oe/recipes-extended/redis/redis_6.2.21.bb
similarity index 90%
rename from meta-oe/recipes-extended/redis/redis_6.2.12.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.21.bb
index 5de97c5e77..e81984c081 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.21.bb
@@ -16,12 +16,8 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
-           file://CVE-2023-45145.patch \
-           file://CVE-2024-31228.patch \
-           file://CVE-2024-31449.patch \
-           file://CVE-2024-46981.patch \
            "
-SRC_URI[sha256sum] = "75352eef41e97e84bfa94292cbac79e5add5345fc79787df5cbdff703353fb1b"
+SRC_URI[sha256sum] = "6383b32ba8d246f41bbbb83663381f5a5f4c4713235433cec22fc4a47e9b6d5f"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 

