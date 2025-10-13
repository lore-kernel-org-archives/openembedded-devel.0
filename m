Return-Path: <jakubszczudlo40@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F5DCCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 15:44:30 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.47176.1760370265845458321
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 08:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Snr8793e;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: jakubszczudlo40@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb7ae31caso939025266b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 08:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760370264; x=1760975064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=glZsS9fkiogCLv4GsLNaPCzg+BbUgYx4M+ajTPOLUQE=;
        b=Snr8793eR1AEOVwePo9OcqB07G6Z4IavD+200vOP3o5KkXcnJam4AlwQ+6OWdzwSni
         oOAAsQJ+Q8HLZi1oflG+sm44wjR9DB61+G9uZ2mzYJE4eR9JdvnMfjmd4oYtmTYP/5+J
         OqjGs7turOMQGyRFA4c08W38/pLWURIZqJ0g1bPhgnaL+kXq/vuJreZnVv1/pibEHYNx
         OW4Q98yffIv98CGDvcW+jLUAflm1PjA7izMkME9E7KuFvP2W8zk/1t1vol8GN1sPX1qo
         oz9QsYVOS8SYV1FAk2lyNcN3xwWe1z9k5FZ4iDQ1dAkzVjon8XD7GYUU4Dfl0lFZlBva
         tc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760370264; x=1760975064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=glZsS9fkiogCLv4GsLNaPCzg+BbUgYx4M+ajTPOLUQE=;
        b=vI3yuTF1mFrOtiKsjssDq2C8F6KpGQ/42I6aW5CfJJTGqxfYHgenKisvrJLsGOh7BE
         jF1LF5p0uQ/vE+zphq4CKH3glzlzP6S884ElYtjJCalh5DCJaXljXo9Y097tRRhONUFI
         o6dtTIWQUVGdZMhe8nDRZ6+A8fZmXdZp38UVJLv2KGb98Yv7bg3HZ5rnh828PxDdrlQy
         SMJ+jDgGp7LepmNmDmwuy16/XzW0H/oMR7hS11XrXXrRGA894l9qDIiPo3Zq2ThEuJIe
         TGgrsFnHtd44ufAb5YoobDOnKIvTC79r25zleIPEH4xxEkwNGEvjJGwZjvFqqBgDiRCQ
         HtDg==
X-Gm-Message-State: AOJu0YxyerBYU9Nu4Yw5yFbI5/HaYXCRa8e2G4HMkY8L+rVVrGR7SY6m
	hP31FeJTw1725scbrZhgdWZeVtE4GIRPVq0baX2MD1hJ5Rcvz0Lcp1kWTf0E5ofe
X-Gm-Gg: ASbGnctZfqVk5PFOKnFArhyQ2B9DdwEYmql4/BHsD/9TJpgGtZsbrvtcWpPdZQYy9fZ
	s63QqI9Wg0WCjmfSa5BgaSkB2hYIDD6XaOEaHdUoDngONvY0CFjLNkPxWM65iIg6gHueElWwK3y
	yWtmtqb0K7E5QJthQb67UviKjOJ+qx5Uokrs6a9MoFq7mDOi3zSc4JGXG1n4UpxibsLhH7x8I+0
	P3XxSHKPyqyvwsHj0o7VuhuosxSJCsO2xbgmoQS0elTxrhzjXLEUd6uLARK9tQiCDjrHvPGmlhU
	jgq+MJwKf+OV+KPsbnEICU33gWUSUeuGwIVHKfyjuInEOXW6qZ1FPLVuMC6iRJKFETp3ysKvz4w
	coxci9xZOXsBbctn3j+s/H5SuQkv0uYoUEyfZVFWak/TN9OcpqqoyhJcLHD86SYlgcpOmd81wUf
	X+
X-Google-Smtp-Source: AGHT+IHMaGMXokfBaVgplg41VFRdAAV0zXwK7Njp6Ci3Pf6Xx6jL6vWQ52Ua/DANyt9GOZ5Puotd0g==
X-Received: by 2002:a17:906:c105:b0:b4a:d60d:fb68 with SMTP id a640c23a62f3a-b50aa3872dfmr1993279066b.6.1760370263453;
        Mon, 13 Oct 2025 08:44:23 -0700 (PDT)
Received: from MSI-LINUX.kielce.vectranet.pl ([2a02:2a40:27ec:2900:18ae:dcf1:8e76:b3b3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d2ce9sm950398466b.35.2025.10.13.08.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 08:44:23 -0700 (PDT)
From: Jakub Szczudlo <jakubszczudlo40@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jakub Szczudlo <jakubszczudlo40@gmail.com>
Subject: [PATCH] redis: patch CVE-2025-49844
Date: Mon, 13 Oct 2025 17:44:05 +0200
Message-Id: <20251013154405.2796929-1-jakubszczudlo40@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 15:44:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120541

Patch backported from redis repository:
https://github.com/redis/redis/commit/db884a49bfbbccd7a0463ddc6aa486b52f28386f
https://github.com/redis/redis/commit/5785f3e6e5aa13a9f0e5e1576b398eb4f7d3bb13

Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
---
 .../redis/redis-7.2.8/CVE-2025-49844.patch    | 36 +++++++++++++++++++
 .../redis/redis/CVE-2025-49844.patch          | 35 ++++++++++++++++++
 .../recipes-extended/redis/redis_6.2.14.bb    |  1 +
 meta-oe/recipes-extended/redis/redis_7.2.8.bb |  1 +
 4 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-7.2.8/CVE-2025-49844.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2025-49844.patch

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/CVE-2025-49844.patch b/meta-oe/recipes-extended/redis/redis-7.2.8/CVE-2025-49844.patch
new file mode 100644
index 0000000000..2f3be11711
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-7.2.8/CVE-2025-49844.patch
@@ -0,0 +1,36 @@
+From d5728cb5795c966c5b5b1e0f0ac576a7e69af539 Mon Sep 17 00:00:00 2001
+From: Mincho Paskalev <minchopaskal@gmail.com>
+Date: Mon, 23 Jun 2025 11:41:37 +0300
+Subject: [PATCH] Lua script may lead to remote code execution (CVE-2025-49844)
+
+
+Upstream-Status: Backport [https://github.com/redis/redis/commit/db884a49bfbbccd7a0463ddc6aa486b52f28386f]
+CVE: CVE-2025-49844
+Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
+---
+ deps/lua/src/lparser.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/deps/lua/src/lparser.c b/deps/lua/src/lparser.c
+index dda7488dcad..ee7d90c90d7 100644
+--- a/deps/lua/src/lparser.c
++++ b/deps/lua/src/lparser.c
+@@ -384,13 +384,17 @@ Proto *luaY_parser (lua_State *L, ZIO *z, Mbuffer *buff, const char *name) {
+   struct LexState lexstate;
+   struct FuncState funcstate;
+   lexstate.buff = buff;
+-  luaX_setinput(L, &lexstate, z, luaS_new(L, name));
++  TString *tname = luaS_new(L, name);
++  setsvalue2s(L, L->top, tname);
++  incr_top(L);
++  luaX_setinput(L, &lexstate, z, tname);
+   open_func(&lexstate, &funcstate);
+   funcstate.f->is_vararg = VARARG_ISVARARG;  /* main func. is always vararg */
+   luaX_next(&lexstate);  /* read first token */
+   chunk(&lexstate);
+   check(&lexstate, TK_EOS);
+   close_func(&lexstate);
++  --L->top;
+   lua_assert(funcstate.prev == NULL);
+   lua_assert(funcstate.f->nups == 0);
+   lua_assert(lexstate.fs == NULL);
diff --git a/meta-oe/recipes-extended/redis/redis/CVE-2025-49844.patch b/meta-oe/recipes-extended/redis/redis/CVE-2025-49844.patch
new file mode 100644
index 0000000000..68974b3d3b
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/CVE-2025-49844.patch
@@ -0,0 +1,35 @@
+From d5728cb5795c966c5b5b1e0f0ac576a7e69af539 Mon Sep 17 00:00:00 2001
+From: Mincho Paskalev <minchopaskal@gmail.com>
+Date: Mon, 23 Jun 2025 11:41:37 +0300
+Subject: [PATCH] Lua script may lead to remote code execution (CVE-2025-49844)
+
+Upstream-Status: Backport [https://github.com/redis/redis/commit/5785f3e6e5aa13a9f0e5e1576b398eb4f7d3bb13]
+CVE: CVE-2025-49844
+Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
+---
+ deps/lua/src/lparser.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/deps/lua/src/lparser.c b/deps/lua/src/lparser.c
+index dda7488dcad..ee7d90c90d7 100644
+--- a/deps/lua/src/lparser.c
++++ b/deps/lua/src/lparser.c
+@@ -384,13 +384,17 @@ Proto *luaY_parser (lua_State *L, ZIO *z, Mbuffer *buff, const char *name) {
+   struct LexState lexstate;
+   struct FuncState funcstate;
+   lexstate.buff = buff;
+-  luaX_setinput(L, &lexstate, z, luaS_new(L, name));
++  TString *tname = luaS_new(L, name);
++  setsvalue2s(L, L->top, tname);
++  incr_top(L);
++  luaX_setinput(L, &lexstate, z, tname);
+   open_func(&lexstate, &funcstate);
+   funcstate.f->is_vararg = VARARG_ISVARARG;  /* main func. is always vararg */
+   luaX_next(&lexstate);  /* read first token */
+   chunk(&lexstate);
+   check(&lexstate, TK_EOS);
+   close_func(&lexstate);
++  --L->top;
+   lua_assert(funcstate.prev == NULL);
+   lua_assert(funcstate.f->nups == 0);
+   lua_assert(lexstate.fs == NULL);
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.14.bb b/meta-oe/recipes-extended/redis/redis_6.2.14.bb
index fa430ce402..7383a83842 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.14.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.14.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
+           file://CVE-2025-49844.patch \
            "
 SRC_URI[sha256sum] = "34e74856cbd66fdb3a684fb349d93961d8c7aa668b06f81fd93ff267d09bc277"
 
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.8.bb b/meta-oe/recipes-extended/redis/redis_7.2.8.bb
index a1739b4f30..6b5509f542 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.8.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.8.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            file://CVE-2025-32023.patch \
+           file://CVE-2025-49844.patch \
           "
 
 SRC_URI[sha256sum] = "6be4fdfcdb2e5ac91454438246d00842d2671f792673390e742dfcaf1bf01574"
-- 
2.39.5


