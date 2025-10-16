Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08520CCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 10:10:42 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.4461.1760609441012072834
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 03:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=VkiyUeRn;
 spf=pass (domain: mvista.com, ip: 209.85.214.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2909448641eso5063715ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 03:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1760609440; x=1761214240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XhKdRj1sTimcQoF3rwq8tFSMZSuxR7ZGb4OGvvDwfoM=;
        b=VkiyUeRn7+jA1MThw/wrv9Pfn4dvFkIBvkACA4sVn676x/ziJwg12zhk/VCjUg9yWy
         ZyXoP3ShSfP7qQu6o2XofBn8UCoPlZwUh5meOC4kBETrZkNCN95qCES+7RJ0mDzRicNK
         WDQCy7CL+oqfisFwGs3IFKN6AY6jBowUaPX24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760609440; x=1761214240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XhKdRj1sTimcQoF3rwq8tFSMZSuxR7ZGb4OGvvDwfoM=;
        b=jxVxYlSLwWaFXnYJyx5Xc48G6eW9kiXp3RrNesLyPGGx/9uxdutkESUgB1f7Fg+hKT
         KNHKYQsRF+4burh8lF1ePUCEkedzdCNZgvfyXRpTlrvVLKkhy5k8dXYf9mmkGShnoy+i
         sbsEDCCeF2xIQJx1WlXtWuhTsBtjZLx5Ru2EvHZwktI1CCCcoAWgJ8Py5KlhvT07ax8u
         RLoEnwFjN7cXlmnBJK/67ZUd1Di0h4QfGUk0uSJi6ZXDPlx0+jkSiYqDs/autCEs0rmK
         e3pA5GLsbZMpRpNv8Lb7BLKVokYIed4yvZa6gCvb6yy2BkYySZv+AMh4659aelMnbEaT
         zpKQ==
X-Gm-Message-State: AOJu0YxLmsdKT05WdDr/VNsZNGMMaes7bdu/3NZOLe3BUGcupxs6SKwH
	x7tJTvz1gW520cWrbvVtsjA7wkhII+pG+ZuYqwtMoC8DGYN4vLJwbTYrr+wYAVpAkr6M3Ygnh3d
	ZZGxlHTE=
X-Gm-Gg: ASbGncvwvUjwkhEQ2xEJ8NdMRVcEPOwfuSB93Gh+At0GtEA93vt7SUdhkZAISdnU0+a
	osTyHhSPXBXabE4aLkJLk50LkiT3z5OfMhmFDN9xGYXEVg8Qt7IJTNIQ3nwDNb8V4fashXQuSiI
	GNn06z2k0mQBgTxg0fEBHmBjsfg34Hkj/Saoo2By1ni0Oqv+ZE9yh8uflMYxlPhVLWHRWt76QQR
	kGCGQE6IQCHCFfHdlvvyN2TMBkHWRckmHZAgr+XjDI8pfllO75XId2i5bSfZ0c7a39oA3dIt+Xq
	/fXrfmuT8mN36TLu9lffbS3ZFm9/IFyCpn9e5EV7GUGX5ZJMqmZgl2PfTIZvMGq5u0uYS0ABwjw
	YYpkJQX3WHlqsRumcrESyKGP6kylDDkZfuFv905HJ31aUaXlojN0gRenwSAK8TfVcf1yipr1uSR
	Q4jk+JRfNqfiXGZ8M=
X-Google-Smtp-Source: AGHT+IG/RyKEzhF4WhfcHY+2dsfYjD5ld6LoJD0e8ZJn9orOYCd5k1mTTtER97zi1om8dg4C7QQbdg==
X-Received: by 2002:a17:902:e750:b0:26c:4085:e3ef with SMTP id d9443c01a7336-29091b390e9mr39800615ad.21.1760609439826;
        Thu, 16 Oct 2025 03:10:39 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:8fcc:1614:2a1b:7928:3155:7a64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7cebbsm24617685ad.64.2025.10.16.03.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 03:10:39 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH 5/7] redis: Fix CVE-2025-46818
Date: Thu, 16 Oct 2025 15:40:18 +0530
Message-Id: <20251016101020.279084-5-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251016101020.279084-1-vanusuri@mvista.com>
References: <20251016101020.279084-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 10:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120733

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/redis/redis/commit/dccb672d838f05c940f040c27b74fde6fb47b2a7

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../redis/redis-7.0.13/CVE-2025-46818.patch   | 283 ++++++++++++++++++
 .../recipes-extended/redis/redis_7.0.13.bb    |   1 +
 2 files changed, 284 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46818.patch

diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46818.patch b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46818.patch
new file mode 100644
index 0000000000..0f7fc15cfc
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46818.patch
@@ -0,0 +1,283 @@
+From dccb672d838f05c940f040c27b74fde6fb47b2a7 Mon Sep 17 00:00:00 2001
+From: Ozan Tezcan <ozantezcan@gmail.com>
+Date: Mon, 23 Jun 2025 12:10:12 +0300
+Subject: [PATCH] Lua script can be executed in the context of another user
+ (CVE-2025-46818)
+
+Upstream-Status: Backport [https://github.com/redis/redis/commit/dccb672d838f05c940f040c27b74fde6fb47b2a7]
+CVE: CVE-2025-46818
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/config.c             |  1 +
+ src/eval.c               |  2 ++
+ src/function_lua.c       |  2 ++
+ src/script_lua.c         | 59 +++++++++++++++++++++++++++++----
+ src/script_lua.h         |  1 +
+ src/server.h             |  1 +
+ tests/unit/scripting.tcl | 70 ++++++++++++++++++++++++++++++++++++++++
+ 7 files changed, 129 insertions(+), 7 deletions(-)
+
+diff --git a/src/config.c b/src/config.c
+index bfb49ef..d232eaf 100644
+--- a/src/config.c
++++ b/src/config.c
+@@ -3011,6 +3011,7 @@ standardConfig static_configs[] = {
+     createBoolConfig("latency-tracking", NULL, MODIFIABLE_CONFIG, server.latency_tracking_enabled, 1, NULL, NULL),
+     createBoolConfig("aof-disable-auto-gc", NULL, MODIFIABLE_CONFIG, server.aof_disable_auto_gc, 0, NULL, updateAofAutoGCEnabled),
+     createBoolConfig("replica-ignore-disk-write-errors", NULL, MODIFIABLE_CONFIG, server.repl_ignore_disk_write_error, 0, NULL, NULL),
++    createBoolConfig("lua-enable-deprecated-api", NULL, IMMUTABLE_CONFIG | HIDDEN_CONFIG, server.lua_enable_deprecated_api, 0, NULL, NULL),
+ 
+     /* String Configs */
+     createStringConfig("aclfile", NULL, IMMUTABLE_CONFIG, ALLOW_EMPTY_STRING, server.acl_filename, "", NULL, NULL),
+diff --git a/src/eval.c b/src/eval.c
+index a562335..f39ccc9 100644
+--- a/src/eval.c
++++ b/src/eval.c
+@@ -261,6 +261,8 @@ void scriptingInit(int setup) {
+     /* Recursively lock all tables that can be reached from the global table */
+     luaSetTableProtectionRecursively(lua);
+     lua_pop(lua, 1);
++    /* Set metatables of basic types (string, number, nil etc.) readonly. */
++    luaSetTableProtectionForBasicTypes(lua);
+ 
+     lctx.lua = lua;
+ }
+diff --git a/src/function_lua.c b/src/function_lua.c
+index aedadb0..9450437 100644
+--- a/src/function_lua.c
++++ b/src/function_lua.c
+@@ -490,6 +490,8 @@ int luaEngineInitEngine() {
+     lua_enablereadonlytable(lua_engine_ctx->lua, -1, 1); /* protect the new global table */
+     lua_replace(lua_engine_ctx->lua, LUA_GLOBALSINDEX); /* set new global table as the new globals */
+ 
++    /* Set metatables of basic types (string, number, nil etc.) readonly. */
++    luaSetTableProtectionForBasicTypes(lua_engine_ctx->lua);
+ 
+     engine *lua_engine = zmalloc(sizeof(*lua_engine));
+     *lua_engine = (engine) {
+diff --git a/src/script_lua.c b/src/script_lua.c
+index 33ed2aa..25a798f 100644
+--- a/src/script_lua.c
++++ b/src/script_lua.c
+@@ -65,7 +65,6 @@ static char *redis_api_allow_list[] = {
+ static char *lua_builtins_allow_list[] = {
+     "xpcall",
+     "tostring",
+-    "getfenv",
+     "setmetatable",
+     "next",
+     "assert",
+@@ -86,15 +85,16 @@ static char *lua_builtins_allow_list[] = {
+     "loadstring",
+     "ipairs",
+     "_VERSION",
+-    "setfenv",
+     "load",
+     "error",
+     NULL,
+ };
+ 
+-/* Lua builtins which are not documented on the Lua documentation */
+-static char *lua_builtins_not_documented_allow_list[] = {
++/* Lua builtins which are deprecated for sandboxing concerns */
++static char *lua_builtins_deprecated[] = {
+     "newproxy",
++    "setfenv",
++    "getfenv",
+     NULL,
+ };
+ 
+@@ -116,7 +116,6 @@ static char **allow_lists[] = {
+     libraries_allow_list,
+     redis_api_allow_list,
+     lua_builtins_allow_list,
+-    lua_builtins_not_documented_allow_list,
+     lua_builtins_removed_after_initialization_allow_list,
+     NULL,
+ };
+@@ -1323,7 +1322,22 @@ static int luaNewIndexAllowList(lua_State *lua) {
+             break;
+         }
+     }
+-    if (!*allow_l) {
++
++    int allowed = (*allow_l != NULL);
++    /* If not explicitly allowed, check if it's a deprecated function. If so,
++     * allow it only if 'lua_enable_deprecated_api' config is enabled. */
++    int deprecated = 0;
++    if (!allowed) {
++        char **c = lua_builtins_deprecated;
++        for (; *c; ++c) {
++            if (strcmp(*c, variable_name) == 0) {
++                deprecated = 1;
++                allowed = server.lua_enable_deprecated_api ? 1 : 0;
++                break;
++            }
++        }
++    }
++    if (!allowed) {
+         /* Search the value on the back list, if its there we know that it was removed
+          * on purpose and there is no need to print a warning. */
+         char **c = deny_list;
+@@ -1332,7 +1346,7 @@ static int luaNewIndexAllowList(lua_State *lua) {
+                 break;
+             }
+         }
+-        if (!*c) {
++        if (!*c && !deprecated) {
+             serverLog(LL_WARNING, "A key '%s' was added to Lua globals which is not on the globals allow list nor listed on the deny list.", variable_name);
+         }
+     } else {
+@@ -1384,6 +1398,37 @@ void luaSetTableProtectionRecursively(lua_State *lua) {
+     }
+ }
+ 
++/* Set the readonly flag on the metatable of basic types (string, nil etc.) */
++void luaSetTableProtectionForBasicTypes(lua_State *lua) {
++    static const int types[] = {
++        LUA_TSTRING,
++        LUA_TNUMBER,
++        LUA_TBOOLEAN,
++        LUA_TNIL,
++        LUA_TFUNCTION,
++        LUA_TTHREAD,
++        LUA_TLIGHTUSERDATA
++    };
++
++    for (size_t i = 0; i < sizeof(types) / sizeof(types[0]); i++) {
++        /* Push a dummy value of the type to get its metatable */
++        switch (types[i]) {
++            case LUA_TSTRING: lua_pushstring(lua, ""); break;
++            case LUA_TNUMBER: lua_pushnumber(lua, 0); break;
++            case LUA_TBOOLEAN: lua_pushboolean(lua, 0); break;
++            case LUA_TNIL: lua_pushnil(lua); break;
++            case LUA_TFUNCTION: lua_pushcfunction(lua, NULL); break;
++            case LUA_TTHREAD: lua_newthread(lua); break;
++            case LUA_TLIGHTUSERDATA: lua_pushlightuserdata(lua, (void*)lua); break;
++        }
++        if (lua_getmetatable(lua, -1)) {
++            luaSetTableProtectionRecursively(lua);
++            lua_pop(lua, 1); /* pop metatable */
++        }
++        lua_pop(lua, 1); /* pop dummy value */
++    }
++}
++
+ void luaRegisterVersion(lua_State* lua) {
+     lua_pushstring(lua,"REDIS_VERSION_NUM");
+     lua_pushnumber(lua,REDIS_VERSION_NUM);
+diff --git a/src/script_lua.h b/src/script_lua.h
+index 4c2b348..d8a3688 100644
+--- a/src/script_lua.h
++++ b/src/script_lua.h
+@@ -71,6 +71,7 @@ void luaRegisterGlobalProtectionFunction(lua_State *lua);
+ void luaSetErrorMetatable(lua_State *lua);
+ void luaSetAllowListProtection(lua_State *lua);
+ void luaSetTableProtectionRecursively(lua_State *lua);
++void luaSetTableProtectionForBasicTypes(lua_State *lua);
+ void luaRegisterLogFunction(lua_State* lua);
+ void luaRegisterVersion(lua_State* lua);
+ void luaPushErrorBuff(lua_State *lua, sds err_buff);
+diff --git a/src/server.h b/src/server.h
+index 82e4db9..952135f 100644
+--- a/src/server.h
++++ b/src/server.h
+@@ -1900,6 +1900,7 @@ struct redisServer {
+     mstime_t busy_reply_threshold;  /* Script / module timeout in milliseconds */
+     int pre_command_oom_state;         /* OOM before command (script?) was started */
+     int script_disable_deny_script;    /* Allow running commands marked "no-script" inside a script. */
++    int lua_enable_deprecated_api;     /* Config to enable deprecated api */
+     /* Lazy free */
+     int lazyfree_lazy_eviction;
+     int lazyfree_lazy_expire;
+diff --git a/tests/unit/scripting.tcl b/tests/unit/scripting.tcl
+index d2fd6da..58f2028 100644
+--- a/tests/unit/scripting.tcl
++++ b/tests/unit/scripting.tcl
+@@ -1021,6 +1021,27 @@ start_server {tags {"scripting"}} {
+         set _ $e
+     } {*Attempt to modify a readonly table*}
+ 
++    test "Try trick readonly table on basic types metatable" {
++        # Run the following scripts for basic types. Either getmetatable()
++        # should return nil or the metatable must be readonly.
++        set scripts {
++            {getmetatable(nil).__index = function() return 1 end}
++            {getmetatable('').__index = function() return 1 end}
++            {getmetatable(123.222).__index = function() return 1 end}
++            {getmetatable(true).__index = function() return 1 end}
++            {getmetatable(function() return 1 end).__index = function() return 1 end}
++            {getmetatable(coroutine.create(function() return 1 end)).__index = function() return 1 end}
++        }
++
++        foreach code $scripts {
++            catch {run_script $code 0} e
++            assert {
++                [string match "*attempt to index a nil value script*" $e] ||
++                [string match "*Attempt to modify a readonly table*" $e]
++            }
++        }
++    }
++
+     test "Test loadfile are not available" {
+         catch {
+             run_script {
+@@ -1049,6 +1070,55 @@ start_server {tags {"scripting"}} {
+     } {*Script attempted to access nonexistent global variable 'print'*}
+ }
+ 
++# Start a new server to test lua-enable-deprecated-api config
++foreach enabled {no yes} {
++start_server [subst {tags {"scripting external:skip"} overrides {lua-enable-deprecated-api $enabled}}] {
++    test "Test setfenv availability lua-enable-deprecated-api=$enabled" {
++        catch {
++            run_script {
++                local f = function() return 1 end
++                setfenv(f, {})
++                return 0
++            } 0
++        } e
++        if {$enabled} {
++            assert_equal $e 0
++        } else {
++            assert_match {*Script attempted to access nonexistent global variable 'setfenv'*} $e
++        }
++    }
++
++    test "Test getfenv availability lua-enable-deprecated-api=$enabled" {
++        catch {
++            run_script {
++                local f = function() return 1 end
++                getfenv(f)
++                return 0
++            } 0
++        } e
++        if {$enabled} {
++            assert_equal $e 0
++        } else {
++            assert_match {*Script attempted to access nonexistent global variable 'getfenv'*} $e
++        }
++    }
++
++    test "Test newproxy availability lua-enable-deprecated-api=$enabled" {
++        catch {
++            run_script {
++                getmetatable(newproxy(true)).__gc = function() return 1 end
++                return 0
++            } 0
++        } e
++        if {$enabled} {
++            assert_equal $e 0
++        } else {
++            assert_match {*Script attempted to access nonexistent global variable 'newproxy'*} $e
++        }
++    }
++}
++}
++
+ # Start a new server since the last test in this stanza will kill the
+ # instance at all.
+ start_server {tags {"scripting"}} {
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.13.bb b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
index e3a302e582..be4e90564d 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.13.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://CVE-2025-32023.patch \
            file://CVE-2025-48367.patch \
            file://CVE-2025-46817.patch \
+           file://CVE-2025-46818.patch \
            "
 SRC_URI[sha256sum] = "97065774d5fb8388eb0d8913458decfcb167d356e40d31dd01cd30c1cc391673"
 
-- 
2.25.1


