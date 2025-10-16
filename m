Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02129CCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 10:10:42 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.4597.1760609438529497966
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 03:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=buon0kt+;
 spf=pass (domain: mvista.com, ip: 209.85.215.170, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b608df6d2a0so449192a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 03:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1760609437; x=1761214237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9jKo5OeUSAPOx/AVd5tGNd4hbE3hrwLvUcyxvdoKh0=;
        b=buon0kt+fnt7/Do1buZm8YNLokCs2jt1BVbUme/SvcRgki6W7lHwU+jpW4MCwZIFrY
         9F1QlvoL1uYrQTU9Df2wVbWdpyYebMuBQb75Uy/DjSWQS6L2tXj2RBj79qp1TNGRUulV
         0z52GoQ5/WdLI147RzfHKQDTehYRHZJCjOiuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760609437; x=1761214237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9jKo5OeUSAPOx/AVd5tGNd4hbE3hrwLvUcyxvdoKh0=;
        b=PK3onLlwN3r/YSSXEoYNQZvYxr82IVCdvko/wEKjkpBj/PkM+vUORAh2+nKtd6hsdg
         1F22Icps2lD0VVttw7szV0f+F6gQdc/XP9vK68HeWhWcSyZ5guhF50gduTOHHU+U76Mi
         6Cp1l2AIj+8OngtIZYkliU5fXgayuQzJ7U5VvWQNw1cfazyAodQ2/sXSiqGK7tfHWpXN
         VT5RlNlRAlgj1dtSe32/nBNGtIAq1gHQxbPoKcsTJ+adh0rklFVTJZDKpKPe5U6R7Wuy
         P3AqZAPAt8XyR5ZAqWlORen7CFam4P7VdvuxjWLrdOdv9pvseWJIcp1QJ7xhYHKW5KNt
         0J1g==
X-Gm-Message-State: AOJu0YxwrZBMhEeG9IQC1JIlYS1cckczVQqT6E+EdrDBN6eBS0h7VraJ
	9rO4Tc+sicQNSjE9zjZo2rN9jyKNhimuwJdQIG7OSZ4gSeXKNmygwnZvVMjNMOVCRE6uQqPIv1E
	MQ3dD+Vs=
X-Gm-Gg: ASbGncvx9Kblefx6LRk+w7e6dbzq/iCvd2a8OV+hU0b4Xr6zf8CG4VdRvYNe7iW7C6S
	IFHv3XfQjPGwhioQYIH16eNKMDMQBU7qZ7mKdn3gvHjSZDbCC32j/q9kG6/UqCqf4Z2HVib+YvT
	/NZiZ0qYzzyiPvyWyz5nLjOfkFb8/IUdcXluc2RRc8JUtvrjbdJcTyiQ/1kNfjHxlp7Z9r72+3o
	y8fNmn/J9jB+c4Z9bZ5VZyz4RGd9fxesJVr39eqYS2sCa/PEFIYZeDsEQ2TYF8rKnrLO5ms8Qga
	qW7BxZ6UWs2FCj8t08D5vAzFglk80uJIGUy8XGaz+I1eIX9n+j3HQuYKWo1QBykWT4iJsvcrsqo
	1AZdf83AgsI2VQNlIw72ibvotRMw5s6MinUKz4LoHVCiMmGOPs9n0WYl02C3F5JCwVAik0qlAXg
	r+JEwhGTxgTWsfgQk=
X-Google-Smtp-Source: AGHT+IHvSEH5ir/Dcuk7M/FeVte67a2arwTDLrpAeetwUMufctfMjpWvLk7PccNaQG1HbsfRvY61ZA==
X-Received: by 2002:a17:903:2d1:b0:277:3488:787e with SMTP id d9443c01a7336-29027356933mr375303305ad.12.1760609437520;
        Thu, 16 Oct 2025 03:10:37 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:8fcc:1614:2a1b:7928:3155:7a64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7cebbsm24617685ad.64.2025.10.16.03.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 03:10:36 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH 4/7] redis: Fix CVE-2025-46817
Date: Thu, 16 Oct 2025 15:40:17 +0530
Message-Id: <20251016101020.279084-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251016101020.279084-1-vanusuri@mvista.com>
References: <20251016101020.279084-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 10:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120732

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/redis/redis/commit/fc282edb61b56e7fe1e6bacf9400252145852fdc

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../redis/redis-7.0.13/CVE-2025-46817.patch   | 101 ++++++++++++++++++
 .../recipes-extended/redis/redis_7.0.13.bb    |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46817.patch

diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46817.patch b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46817.patch
new file mode 100644
index 0000000000..97b722b03e
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46817.patch
@@ -0,0 +1,101 @@
+From fc282edb61b56e7fe1e6bacf9400252145852fdc Mon Sep 17 00:00:00 2001
+From: Ozan Tezcan <ozantezcan@gmail.com>
+Date: Mon, 23 Jun 2025 13:33:00 +0300
+Subject: [PATCH] Lua script may lead to integer overflow and potential RCE
+ (CVE-2025-46817)
+
+Upstream-Status: Backport [https://github.com/redis/redis/commit/fc282edb61b56e7fe1e6bacf9400252145852fdc]
+CVE: CVE-2025-46817
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ deps/lua/src/lbaselib.c  |  7 ++++---
+ deps/lua/src/ltable.c    |  3 +--
+ tests/unit/scripting.tcl | 39 +++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 44 insertions(+), 5 deletions(-)
+
+diff --git a/deps/lua/src/lbaselib.c b/deps/lua/src/lbaselib.c
+index 2ab550bd48d..26172d15b40 100644
+--- a/deps/lua/src/lbaselib.c
++++ b/deps/lua/src/lbaselib.c
+@@ -340,13 +340,14 @@ static int luaB_assert (lua_State *L) {
+ 
+ 
+ static int luaB_unpack (lua_State *L) {
+-  int i, e, n;
++  int i, e;
++  unsigned int n;
+   luaL_checktype(L, 1, LUA_TTABLE);
+   i = luaL_optint(L, 2, 1);
+   e = luaL_opt(L, luaL_checkint, 3, luaL_getn(L, 1));
+   if (i > e) return 0;  /* empty range */
+-  n = e - i + 1;  /* number of elements */
+-  if (n <= 0 || !lua_checkstack(L, n))  /* n <= 0 means arith. overflow */
++  n = (unsigned int)e - (unsigned int)i;  /* number of elements minus 1 */
++  if (n >= INT_MAX || !lua_checkstack(L, ++n))
+     return luaL_error(L, "too many results to unpack");
+   lua_rawgeti(L, 1, i);  /* push arg[i] (avoiding overflow problems) */
+   while (i++ < e)  /* push arg[i + 1...e] */
+diff --git a/deps/lua/src/ltable.c b/deps/lua/src/ltable.c
+index f75fe19fe39..55575a8ace9 100644
+--- a/deps/lua/src/ltable.c
++++ b/deps/lua/src/ltable.c
+@@ -434,8 +434,7 @@ static TValue *newkey (lua_State *L, Table *t, const TValue *key) {
+ ** search function for integers
+ */
+ const TValue *luaH_getnum (Table *t, int key) {
+-  /* (1 <= key && key <= t->sizearray) */
+-  if (cast(unsigned int, key-1) < cast(unsigned int, t->sizearray))
++  if (1 <= key && key <= t->sizearray)
+     return &t->array[key-1];
+   else {
+     lua_Number nk = cast_num(key);
+diff --git a/tests/unit/scripting.tcl b/tests/unit/scripting.tcl
+index 333cc2692de..d45c63ceec3 100644
+--- a/tests/unit/scripting.tcl
++++ b/tests/unit/scripting.tcl
+@@ -315,6 +315,45 @@ start_server {tags {"scripting"}} {
+         set e
+     } {*against a key*}
+ 
++    test {EVAL - Test table unpack with invalid indexes} {
++        catch {run_script { return {unpack({1,2,3}, -2, 2147483647)} } 0} e
++        assert_match {*too many results to unpack*} $e
++        catch {run_script { return {unpack({1,2,3}, 0, 2147483647)} } 0} e
++        assert_match {*too many results to unpack*} $e
++        catch {run_script { return {unpack({1,2,3}, -2147483648, -2)} } 0} e
++        assert_match {*too many results to unpack*} $e
++        set res [run_script { return {unpack({1,2,3}, -1, -2)} } 0]
++        assert_match {} $res
++        set res [run_script { return {unpack({1,2,3}, 1, -1)} } 0]
++        assert_match {} $res
++
++        # unpack with range -1 to 5, verify nil indexes
++        set res [run_script {
++             local function unpack_to_list(t, i, j)
++               local n, v = select('#', unpack(t, i, j)), {unpack(t, i, j)}
++               for i = 1, n do v[i] = v[i] or '_NIL_' end
++               v.n = n
++               return v
++             end
++
++            return unpack_to_list({1,2,3}, -1, 5)
++        } 0]
++        assert_match {_NIL_ _NIL_ 1 2 3 _NIL_ _NIL_} $res
++
++        # unpack with negative range, verify nil indexes
++        set res [run_script {
++             local function unpack_to_list(t, i, j)
++               local n, v = select('#', unpack(t, i, j)), {unpack(t, i, j)}
++               for i = 1, n do v[i] = v[i] or '_NIL_' end
++               v.n = n
++               return v
++             end
++
++            return unpack_to_list({1,2,3}, -2147483648, -2147483646)
++        } 0]
++        assert_match {_NIL_ _NIL_ _NIL_} $res
++    } {}
++
+     test {EVAL - JSON numeric decoding} {
+         # We must return the table as a string because otherwise
+         # Redis converts floats to ints and we get 0 and 1023 instead
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.13.bb b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
index 9e4b158b7a..e3a302e582 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.13.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://CVE-2025-27151.patch \
            file://CVE-2025-32023.patch \
            file://CVE-2025-48367.patch \
+           file://CVE-2025-46817.patch \
            "
 SRC_URI[sha256sum] = "97065774d5fb8388eb0d8913458decfcb167d356e40d31dd01cd30c1cc391673"
 
-- 
2.25.1


