Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7A4CCD19A
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 10:10:52 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.4599.1760609443591950778
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 03:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HYfPaKE9;
 spf=pass (domain: mvista.com, ip: 209.85.214.180, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2907948c1d2so5868535ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 03:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1760609442; x=1761214242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zVbTalNGl9SmRf1qRmjQkgPhrjgWd3Ta0bM2epJxkQ=;
        b=HYfPaKE9DPCcbM+ubowHJPCdfF0HwE1hXaM2+EnuoyhCcdHczZCo3VxszRM/QJrsG0
         4Pjd1TqUPW5pnAGu1ajOrtURaR4wC+kWTWv0cxVj+aVutotbOTm0eBRir+l+XRMBLoxa
         jWqIOo69ynwm1HOWbHho7UQiqvjM7h+IO+aac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760609442; x=1761214242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zVbTalNGl9SmRf1qRmjQkgPhrjgWd3Ta0bM2epJxkQ=;
        b=PsTpOmEEPchgN2dW6eMJdKsgPy+hzrKvfDV3IHAc8tpr7RE6dPYxZV5H/Rr/H6CcGZ
         abIgYWSbRjoS1QhKFpoknw1gXGmsCVmxU44GPe6q/v0YfrkEh0R8L2VOyHbmJhTJbqhK
         fTXHYvRB+IKizgWzW7uZi4vD9fM38mZe33mfarXnOQMAHHQxnphGZu3MOdbCZoL64eCJ
         EUgEB0nxbuBitPqfhl2udbbDjRqYAe10QDkCl2kXdlUyimQghCAWyxGN9ZJ9kZWV6S0a
         js8JPOAe0adexYuKoJvQ5mSKyNTN+GudfZh1cAQGu4pzdAf+03wl6hBaxkLFj4vDhxt3
         gVBg==
X-Gm-Message-State: AOJu0YxCj2FWry8iqzY5EKIcDq+vwBMVsIZECu8Oum06qHXkwD8vXUuQ
	pYla4+eB2ew0LOwD8JN8ZlwGsuFpUVQi9jYnUlbGlPgq8EePp59HPt+goZ1cXhDkXGjx4NfGwqI
	CYLmvbSQ=
X-Gm-Gg: ASbGncuE6SfgF/Re3t3b7IrTvZoVWiC+CwBjuaMsuh9wnxzwiGe+kHl+9triSSWQTve
	H30tCPxEFtv+p6nFH4vlJVaa/jehd7q9K9a4SAC4M8HRQhzLuCIT33CtU8ogUggB18KWuQloS7h
	B0fnhGPUjtHE5n+9X/CHjSD+0VzAGiWAfFIixmWUuRV/ph8AQgaWlpDz+LuI9RpSdD5+oWdD6vY
	lNvldkcVWzr52qaddRKX5Ic0YTX7e3NC/PW6YEQElihHasluTCopqoh5Ry8GskBrI5Q/Ju9hcQp
	SOvfZWev+CotGujvdQ/oZTl4fnBPWfT69FA8Bj+oOs575mSrryLyIthePxw/sqHkJfv6Zk5nNHx
	tO9zWDaTkHYK3M9vv0hfKnON904ANpazCLKlmwf2Gpe8LEeCesSP3I1iroi0RwFHyBMBRFyUVNa
	O41oDCVRVhG72KUz3E5562wHh9HA==
X-Google-Smtp-Source: AGHT+IEVq0CRUsMJHgVs17+pdbWFkJkz/CE0GUu78XNjtXX6dac9d8i9gzs1IFSJHTUe/QOkWHLzTw==
X-Received: by 2002:a17:902:d50f:b0:278:9051:8ea9 with SMTP id d9443c01a7336-290272dc4a7mr439383985ad.40.1760609442448;
        Thu, 16 Oct 2025 03:10:42 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:8fcc:1614:2a1b:7928:3155:7a64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7cebbsm24617685ad.64.2025.10.16.03.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 03:10:41 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH 6/7] redis: Fix CVE-2025-46819
Date: Thu, 16 Oct 2025 15:40:19 +0530
Message-Id: <20251016101020.279084-6-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251016101020.279084-1-vanusuri@mvista.com>
References: <20251016101020.279084-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 10:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120734

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/redis/redis/commit/2802b52b554cb9f0f249a24474c9fba94e933dbb

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../redis/redis-7.0.13/CVE-2025-46819.patch   | 161 ++++++++++++++++++
 .../recipes-extended/redis/redis_7.0.13.bb    |   1 +
 2 files changed, 162 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46819.patch

diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46819.patch b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46819.patch
new file mode 100644
index 0000000000..8f30cce7df
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-46819.patch
@@ -0,0 +1,161 @@
+From 2802b52b554cb9f0f249a24474c9fba94e933dbb Mon Sep 17 00:00:00 2001
+From: Ozan Tezcan <ozantezcan@gmail.com>
+Date: Mon, 23 Jun 2025 12:11:31 +0300
+Subject: [PATCH] LUA out-of-bound read (CVE-2025-46819)
+
+Upstream-Status: Backport [https://github.com/redis/redis/commit/2802b52b554cb9f0f249a24474c9fba94e933dbb]
+CVE: CVE-2025-46819
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ deps/lua/src/llex.c      | 34 ++++++++++++++++++-----------
+ tests/unit/scripting.tcl | 47 ++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 68 insertions(+), 13 deletions(-)
+
+diff --git a/deps/lua/src/llex.c b/deps/lua/src/llex.c
+index 88c6790..efad709 100644
+--- a/deps/lua/src/llex.c
++++ b/deps/lua/src/llex.c
+@@ -138,6 +138,7 @@ static void inclinenumber (LexState *ls) {
+ 
+ 
+ void luaX_setinput (lua_State *L, LexState *ls, ZIO *z, TString *source) {
++  ls->t.token = 0;
+   ls->decpoint = '.';
+   ls->L = L;
+   ls->lookahead.token = TK_EOS;  /* no look-ahead token */
+@@ -206,9 +207,13 @@ static void read_numeral (LexState *ls, SemInfo *seminfo) {
+     trydecpoint(ls, seminfo); /* try to update decimal point separator */
+ }
+ 
+-
+-static int skip_sep (LexState *ls) {
+-  int count = 0;
++/*
++** reads a sequence '[=*[' or ']=*]', leaving the last bracket.
++** If a sequence is well-formed, return its number of '='s + 2; otherwise,
++** return 1 if there is no '='s or 0 otherwise (an unfinished '[==...').
++*/
++static size_t skip_sep (LexState *ls) {
++  size_t count = 0;
+   int s = ls->current;
+   lua_assert(s == '[' || s == ']');
+   save_and_next(ls);
+@@ -216,11 +221,13 @@ static int skip_sep (LexState *ls) {
+     save_and_next(ls);
+     count++;
+   }
+-  return (ls->current == s) ? count : (-count) - 1;
++   return (ls->current == s) ? count + 2
++          : (count == 0) ? 1
++          : 0;
+ }
+ 
+ 
+-static void read_long_string (LexState *ls, SemInfo *seminfo, int sep) {
++static void read_long_string (LexState *ls, SemInfo *seminfo, size_t sep) {
+   int cont = 0;
+   (void)(cont);  /* avoid warnings when `cont' is not used */
+   save_and_next(ls);  /* skip 2nd `[' */
+@@ -270,8 +277,8 @@ static void read_long_string (LexState *ls, SemInfo *seminfo, int sep) {
+     }
+   } endloop:
+   if (seminfo)
+-    seminfo->ts = luaX_newstring(ls, luaZ_buffer(ls->buff) + (2 + sep),
+-                                     luaZ_bufflen(ls->buff) - 2*(2 + sep));
++    seminfo->ts = luaX_newstring(ls, luaZ_buffer(ls->buff) + sep,
++                                     luaZ_bufflen(ls->buff) - 2 * sep);
+ }
+ 
+ 
+@@ -346,9 +353,9 @@ static int llex (LexState *ls, SemInfo *seminfo) {
+         /* else is a comment */
+         next(ls);
+         if (ls->current == '[') {
+-          int sep = skip_sep(ls);
++          size_t sep = skip_sep(ls);
+           luaZ_resetbuffer(ls->buff);  /* `skip_sep' may dirty the buffer */
+-          if (sep >= 0) {
++          if (sep >= 2) {
+             read_long_string(ls, NULL, sep);  /* long comment */
+             luaZ_resetbuffer(ls->buff);
+             continue;
+@@ -360,13 +367,14 @@ static int llex (LexState *ls, SemInfo *seminfo) {
+         continue;
+       }
+       case '[': {
+-        int sep = skip_sep(ls);
+-        if (sep >= 0) {
++        size_t sep = skip_sep(ls);
++        if (sep >= 2) {
+           read_long_string(ls, seminfo, sep);
+           return TK_STRING;
+         }
+-        else if (sep == -1) return '[';
+-        else luaX_lexerror(ls, "invalid long string delimiter", TK_STRING);
++        else if (sep == 0)  /* '[=...' missing second bracket */
++          luaX_lexerror(ls, "invalid long string delimiter", TK_STRING);
++        return '[';
+       }
+       case '=': {
+         next(ls);
+diff --git a/tests/unit/scripting.tcl b/tests/unit/scripting.tcl
+index 58f2028..2ff0d44 100644
+--- a/tests/unit/scripting.tcl
++++ b/tests/unit/scripting.tcl
+@@ -1070,6 +1070,53 @@ start_server {tags {"scripting"}} {
+     } {*Script attempted to access nonexistent global variable 'print'*}
+ }
+ 
++# start a new server to test the large-memory tests
++start_server {tags {"scripting external:skip large-memory"}} {
++
++    test {EVAL - JSON string encoding a string larger than 2GB} {
++        run_script {
++            local s = string.rep("a", 1024 * 1024 * 1024)
++            return #cjson.encode(s..s..s)
++        } 0
++    } {3221225474} ;# length includes two double quotes at both ends
++
++    test {EVAL - Test long escape sequences for strings} {
++        run_script {
++            -- Generate 1gb '==...==' separator
++            local s = string.rep('=', 1024 * 1024)
++            local t = {} for i=1,1024 do t[i] = s end
++            local sep = table.concat(t)
++            collectgarbage('collect')
++
++            local code = table.concat({'return [',sep,'[x]',sep,']'})
++            collectgarbage('collect')
++
++            -- Load the code and run it. Script will return the string length.
++            -- Escape sequence: [=....=[ to ]=...=] will be ignored
++            -- Actual string is a single character: 'x'. Script will return 1
++            local func = loadstring(code)
++            return #func()
++        } 0
++    } {1}
++
++    test {EVAL - Lua can parse string with too many new lines} {
++        # Create a long string consisting only of newline characters. When Lua
++        # fails to parse a string, it typically includes a snippet like
++        # "... near ..." in the error message to indicate the last recognizable
++        # token. In this test, since the input contains only newlines, there
++        # should be no identifiable token, so the error message should contain
++        # only the actual error, without a near clause.
++
++        run_script {
++           local s = string.rep('\n', 1024 * 1024)
++           local t = {} for i=1,2048 do t[#t+1] = s end
++           local lines = table.concat(t)
++           local fn, err = loadstring(lines)
++           return err
++        } 0
++    } {*chunk has too many lines}
++}
++
+ # Start a new server to test lua-enable-deprecated-api config
+ foreach enabled {no yes} {
+ start_server [subst {tags {"scripting external:skip"} overrides {lua-enable-deprecated-api $enabled}}] {
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.13.bb b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
index be4e90564d..295dc0e429 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.13.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://CVE-2025-48367.patch \
            file://CVE-2025-46817.patch \
            file://CVE-2025-46818.patch \
+           file://CVE-2025-46819.patch \
            "
 SRC_URI[sha256sum] = "97065774d5fb8388eb0d8913458decfcb167d356e40d31dd01cd30c1cc391673"
 
-- 
2.25.1


