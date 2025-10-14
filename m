Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BADCCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 19:08:38 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.4470.1760468912148240606
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 12:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZPq0BBkE;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e3cdc1a6aso1857885e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 12:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760468910; x=1761073710; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U0UAQKG2uLpQXuepd96iAM2ZEv3xpQsnkgS/k1B7AkI=;
        b=ZPq0BBkEzXjiH0LOKs2UaqN0chZKL+p/D3O20pkVqwp03ZqMCQARcNc7MGpwMP+PX7
         TkCo6ev7ujCnorhQNI/Ya2pA2RFqlyjgf6b1Gn4ZVAbomDWcAo4a8FOQnpd/9xTi+WiG
         X/VKp3jdz96B01cAPtPCM5wrvxYIs/DnzT9JVky37zd71oxJWoW3OctjqcbjyLQlUElI
         wFN855oGkLzmeNRvmp486iN1s4bua4qHjQWlPkcvw/HNA9fBv/pNdLxuikeA27LTSyit
         byHlMGD5hK0Y1SS92KZodwj08FfEqHvh0DclBwgGKjBQGfJJTZ8G9H8lFENkcmugGepU
         u9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760468910; x=1761073710;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U0UAQKG2uLpQXuepd96iAM2ZEv3xpQsnkgS/k1B7AkI=;
        b=jiCVeP+jw7qBV9roBrEzcg9E5HCpRxCLSGIq+L58RQM2b0y0veodmLIWtQ7EGD49bM
         MJnpw0elenIKED01jTVOficpS9a9uCrLnqswW2PnmcK9uJwbHYZLVHCoNhUaHMIZjvst
         i4WzllmxcbMtqRpVLrnodN8ttpGXUWWGc8My4GeqrSwzVTD2taUxqY6vnp2gskZw8Y4B
         l08q3cRKuej/0z09/xVDYySyTXz4O1GG6qQkG5K9XY9xsfqUJooYh8uiMmixC8CVLGiu
         mK8DOVVBVxSvCS14yh69cqdcXF8jr+EBIfBkLEm4clTWvamxbMd/gbDP1esquAjTd/At
         kXRg==
X-Forwarded-Encrypted: i=1; AJvYcCUN89QJJOeydYMa2iuwIyOHbl1Fkt5EsmAlLkWXn2kBThPq6aLqEVM9EHS7K8bIEmFFlz2PES3QYLxon3/19UoVkr4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwT1nWc/liRhO41WdBlPERiNqXRT9WV6gSNC73cc0nkT9Oa5BW7
	XhJPMYYT6eyhP/kS89X1eQh5PziRlqlEX0ET1H93mOkmIkZNzgh9nKnL
X-Gm-Gg: ASbGncvdOKzcWckGOgsXg1GVEHsqoHJg65M7zRnbxEPyHyWYwMeqhGp+QwhTVxEIYAC
	TPl9jDpD59l1PzIr2XFKBhdsXFqBsptiPrNwPZ31A0wQsRW+TCfYBvumJiqAA9jbl7Qhxa+gUSm
	xxoVl+1tTwlvpIn+ohk96EPMsk4knPDv6tazzp+M7OqdGD3+q7plcht9yhOc53kTrhnBM+ZCXE5
	En5L4KXRzZDxleljKcsRVUBXGyi9RyXB5xGkXa3dehVS6z72TNSTeIw7D7vnKtANQmmXldi+Jcc
	RlPdQTokoUWSVZF8mt8tATg+QoehZesZ5fVDjbyZRyC4u9Q/3vY6SQmhhrdOe+8DEkXe59f1kHY
	XDTXH9WfIrNVOwfvuPa8sfe+8jgd1TthiDLB5CGe5+OqE560YopIktLgNgogV
X-Google-Smtp-Source: AGHT+IEDaEsFU3tdVEe5EBovg2RM8bdviwZNof9iCPRZWvrUXmjXDgjZWmycTY6KhflXYSUl0Z0tLg==
X-Received: by 2002:a05:600c:5486:b0:45f:29eb:2148 with SMTP id 5b1f17b1804b1-46fa9e98810mr179261045e9.7.1760468910335;
        Tue, 14 Oct 2025 12:08:30 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb49c3e54sm257401225e9.15.2025.10.14.12.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 12:08:29 -0700 (PDT)
Message-ID: <d06ce7f9-f73f-46c3-aff2-ad372b04820a@gmail.com>
Date: Tue, 14 Oct 2025 21:08:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] redis: patch CVE-2025-49844
To: jakubszczudlo40@gmail.com, openembedded-devel@lists.openembedded.org
References: <20251013154405.2796929-1-jakubszczudlo40@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251013154405.2796929-1-jakubszczudlo40@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 19:08:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120622

This CVE supposed to be fixed in both versions of the redis recipes:
the current recipes are using versions 6.2.20 and 7.2.11 respectively,
both of which contain these commits already.

On 10/13/25 17:44, Jakub Szczudlo via lists.openembedded.org wrote:
> Patch backported from redis repository:
> https://github.com/redis/redis/commit/db884a49bfbbccd7a0463ddc6aa486b52f28386f
> https://github.com/redis/redis/commit/5785f3e6e5aa13a9f0e5e1576b398eb4f7d3bb13
>
> Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
> ---
>  .../redis/redis-7.2.8/CVE-2025-49844.patch    | 36 +++++++++++++++++++
>  .../redis/redis/CVE-2025-49844.patch          | 35 ++++++++++++++++++
>  .../recipes-extended/redis/redis_6.2.14.bb    |  1 +
>  meta-oe/recipes-extended/redis/redis_7.2.8.bb |  1 +
>  4 files changed, 73 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/redis/redis-7.2.8/CVE-2025-49844.patch
>  create mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2025-49844.patch
>
> diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/CVE-2025-49844.patch b/meta-oe/recipes-extended/redis/redis-7.2.8/CVE-2025-49844.patch
> new file mode 100644
> index 0000000000..2f3be11711
> --- /dev/null
> +++ b/meta-oe/recipes-extended/redis/redis-7.2.8/CVE-2025-49844.patch
> @@ -0,0 +1,36 @@
> +From d5728cb5795c966c5b5b1e0f0ac576a7e69af539 Mon Sep 17 00:00:00 2001
> +From: Mincho Paskalev <minchopaskal@gmail.com>
> +Date: Mon, 23 Jun 2025 11:41:37 +0300
> +Subject: [PATCH] Lua script may lead to remote code execution (CVE-2025-49844)
> +
> +
> +Upstream-Status: Backport [https://github.com/redis/redis/commit/db884a49bfbbccd7a0463ddc6aa486b52f28386f]
> +CVE: CVE-2025-49844
> +Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
> +---
> + deps/lua/src/lparser.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/deps/lua/src/lparser.c b/deps/lua/src/lparser.c
> +index dda7488dcad..ee7d90c90d7 100644
> +--- a/deps/lua/src/lparser.c
> ++++ b/deps/lua/src/lparser.c
> +@@ -384,13 +384,17 @@ Proto *luaY_parser (lua_State *L, ZIO *z, Mbuffer *buff, const char *name) {
> +   struct LexState lexstate;
> +   struct FuncState funcstate;
> +   lexstate.buff = buff;
> +-  luaX_setinput(L, &lexstate, z, luaS_new(L, name));
> ++  TString *tname = luaS_new(L, name);
> ++  setsvalue2s(L, L->top, tname);
> ++  incr_top(L);
> ++  luaX_setinput(L, &lexstate, z, tname);
> +   open_func(&lexstate, &funcstate);
> +   funcstate.f->is_vararg = VARARG_ISVARARG;  /* main func. is always vararg */
> +   luaX_next(&lexstate);  /* read first token */
> +   chunk(&lexstate);
> +   check(&lexstate, TK_EOS);
> +   close_func(&lexstate);
> ++  --L->top;
> +   lua_assert(funcstate.prev == NULL);
> +   lua_assert(funcstate.f->nups == 0);
> +   lua_assert(lexstate.fs == NULL);
> diff --git a/meta-oe/recipes-extended/redis/redis/CVE-2025-49844.patch b/meta-oe/recipes-extended/redis/redis/CVE-2025-49844.patch
> new file mode 100644
> index 0000000000..68974b3d3b
> --- /dev/null
> +++ b/meta-oe/recipes-extended/redis/redis/CVE-2025-49844.patch
> @@ -0,0 +1,35 @@
> +From d5728cb5795c966c5b5b1e0f0ac576a7e69af539 Mon Sep 17 00:00:00 2001
> +From: Mincho Paskalev <minchopaskal@gmail.com>
> +Date: Mon, 23 Jun 2025 11:41:37 +0300
> +Subject: [PATCH] Lua script may lead to remote code execution (CVE-2025-49844)
> +
> +Upstream-Status: Backport [https://github.com/redis/redis/commit/5785f3e6e5aa13a9f0e5e1576b398eb4f7d3bb13]
> +CVE: CVE-2025-49844
> +Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
> +---
> + deps/lua/src/lparser.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/deps/lua/src/lparser.c b/deps/lua/src/lparser.c
> +index dda7488dcad..ee7d90c90d7 100644
> +--- a/deps/lua/src/lparser.c
> ++++ b/deps/lua/src/lparser.c
> +@@ -384,13 +384,17 @@ Proto *luaY_parser (lua_State *L, ZIO *z, Mbuffer *buff, const char *name) {
> +   struct LexState lexstate;
> +   struct FuncState funcstate;
> +   lexstate.buff = buff;
> +-  luaX_setinput(L, &lexstate, z, luaS_new(L, name));
> ++  TString *tname = luaS_new(L, name);
> ++  setsvalue2s(L, L->top, tname);
> ++  incr_top(L);
> ++  luaX_setinput(L, &lexstate, z, tname);
> +   open_func(&lexstate, &funcstate);
> +   funcstate.f->is_vararg = VARARG_ISVARARG;  /* main func. is always vararg */
> +   luaX_next(&lexstate);  /* read first token */
> +   chunk(&lexstate);
> +   check(&lexstate, TK_EOS);
> +   close_func(&lexstate);
> ++  --L->top;
> +   lua_assert(funcstate.prev == NULL);
> +   lua_assert(funcstate.f->nups == 0);
> +   lua_assert(lexstate.fs == NULL);
> diff --git a/meta-oe/recipes-extended/redis/redis_6.2.14.bb b/meta-oe/recipes-extended/redis/redis_6.2.14.bb
> index fa430ce402..7383a83842 100644
> --- a/meta-oe/recipes-extended/redis/redis_6.2.14.bb
> +++ b/meta-oe/recipes-extended/redis/redis_6.2.14.bb
> @@ -16,6 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
>             file://0001-src-Do-not-reset-FINAL_LIBS.patch \
>             file://GNU_SOURCE.patch \
>             file://0006-Define-correct-gregs-for-RISCV32.patch \
> +           file://CVE-2025-49844.patch \
>             "
>  SRC_URI[sha256sum] = "34e74856cbd66fdb3a684fb349d93961d8c7aa668b06f81fd93ff267d09bc277"
>  
> diff --git a/meta-oe/recipes-extended/redis/redis_7.2.8.bb b/meta-oe/recipes-extended/redis/redis_7.2.8.bb
> index a1739b4f30..6b5509f542 100644
> --- a/meta-oe/recipes-extended/redis/redis_7.2.8.bb
> +++ b/meta-oe/recipes-extended/redis/redis_7.2.8.bb
> @@ -17,6 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
>             file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
>             file://0006-Define-correct-gregs-for-RISCV32.patch \
>             file://CVE-2025-32023.patch \
> +           file://CVE-2025-49844.patch \
>            "
>  
>  SRC_URI[sha256sum] = "6be4fdfcdb2e5ac91454438246d00842d2671f792673390e742dfcaf1bf01574"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120541): https://lists.openembedded.org/g/openembedded-devel/message/120541
> Mute This Topic: https://lists.openembedded.org/mt/115736666/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


