Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C769CCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 10:10:52 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.4463.1760609445891368381
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 03:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=blU9bLhJ;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-290c2b6a6c2so427965ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 03:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1760609445; x=1761214245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMs5m0e/1SZwP7FXRBi9jc4sjk7t+0w7s/MYoRsRMI8=;
        b=blU9bLhJI+eLK0WrhdmhVoOmHGo9PjdEeqo3d+l/2B/ZMuuA7xIIRfm1AARmv5XUs+
         GRnFzxPZT/IJu1zw4/8YAsLghPv+Cb46ZTQpcNyAAMkKQ5zdaPbtpXMgT9jQ9qhecMMk
         7ZvO+5nACL7qcpaRwr2Js1zP1VkuXr2yyeCIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760609445; x=1761214245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMs5m0e/1SZwP7FXRBi9jc4sjk7t+0w7s/MYoRsRMI8=;
        b=IPezdkYXZpZ2ujpsqu/gWhy8dl843IMaQbGnFssnmEZrGLwS0rie5hnTQM4JV55cYY
         0/P0AxDSR2KhXroS2XMDoscIyqbtz3qFksUm1aUddCIG8HJAA3CaFwhsSuEGBY034cN4
         mNe4KYRzWzVPJ9a1MEo/Nxdbk4AT2wvxZp+7uw37sgRtXgBr0fi547jatfmHdIGR05Dp
         2Vd6xqpGvUc9GZWSW2xzPt/BggWDvXF6qtpmLN51N6Iyb2jsF1XT07sahNiijgH4EAnO
         xAA3jDb3jDLk1g7/7ZaKJtnmDFZsKyonGp1dXd7loWRWH6gbQHCuc0HJ7CjBPA1bMHKD
         kfEA==
X-Gm-Message-State: AOJu0YwXvxu0nh76ULL93ZGUP7t8JIVGQ47xZs1ojLiMdheelhqQG0+F
	h4Cf5nyHp64oVwUyQlAs4IMgV7M9SJvtrssLYiPWcsyAn8stM3LH9B/+51y+RsSmJ3ASyqL0hwR
	UXoVzwDI=
X-Gm-Gg: ASbGncthA6aZTxbomP1q0ni5KtW5Kz6HeSs6kbfB1Kd1tMM5sE4kYVN6oJwWHSa96OS
	NRKnkxeY1ngTmx+XIAUIl8r3lBcRTJ67kWsmDpIPZtSMKvP2OgqiOBlxLp/KjcUnuTlw9q9KM1j
	j2qUhp/xc2D2wzkXnfXv7n/XomNxn/O9Yo4NtNWJsaO+YAqnRqRtIbeNuEIKqNGQTmbVlk8LrZv
	6M+3W1uFd6TMF/cWVJ6SBSlcnPPN6EoPJ+mHgYRq/AzxCH6PzoSUePIKqdYKFOaq0/Hlrx4p3Xz
	f7ZEZ8Cs02AEyzDWF39BY/H6yzoAKsAqWzzhShWvXov18lJ3eTAlGDjQH2giP3iustBybMj4IKS
	StlUj59A97NAwHAesz0jknCUlDpvbs6u9H7pAu8wE4FjUIpWUFVTJ/GHV7J2Rm9xQ0t9QIxMe0p
	ckckm9qWPoFPZVqsY=
X-Google-Smtp-Source: AGHT+IGrLQoIy3pseJhK916sJA+PGwMRS3dUM59LM0DYStrZSWFGArY5PTtk6aBAKUBsc+JHdNXj+Q==
X-Received: by 2002:a17:902:f609:b0:282:2c52:5094 with SMTP id d9443c01a7336-290272c31d0mr411453515ad.37.1760609444746;
        Thu, 16 Oct 2025 03:10:44 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:8fcc:1614:2a1b:7928:3155:7a64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7cebbsm24617685ad.64.2025.10.16.03.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 03:10:44 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH 7/7] redis: Fix CVE-2025-49844
Date: Thu, 16 Oct 2025 15:40:20 +0530
Message-Id: <20251016101020.279084-7-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251016101020.279084-1-vanusuri@mvista.com>
References: <20251016101020.279084-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 10:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120735

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/redis/redis/commit/db884a49bfbbccd7a0463ddc6aa486b52f28386f

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../redis/redis-7.0.13/CVE-2025-49844.patch   | 35 +++++++++++++++++++
 .../recipes-extended/redis/redis_7.0.13.bb    |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-49844.patch

diff --git a/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-49844.patch b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-49844.patch
new file mode 100644
index 0000000000..0a5fa12b77
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-7.0.13/CVE-2025-49844.patch
@@ -0,0 +1,35 @@
+From db884a49bfbbccd7a0463ddc6aa486b52f28386f Mon Sep 17 00:00:00 2001
+From: Mincho Paskalev <minchopaskal@gmail.com>
+Date: Mon, 23 Jun 2025 11:41:37 +0300
+Subject: [PATCH] Lua script may lead to remote code execution (CVE-2025-49844)
+
+Upstream-Status: Backport [https://github.com/redis/redis/commit/db884a49bfbbccd7a0463ddc6aa486b52f28386f]
+CVE: CVE-2025-49844
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.13.bb b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
index 295dc0e429..c3d98694d5 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.13.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.13.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://CVE-2025-46817.patch \
            file://CVE-2025-46818.patch \
            file://CVE-2025-46819.patch \
+           file://CVE-2025-49844.patch \
            "
 SRC_URI[sha256sum] = "97065774d5fb8388eb0d8913458decfcb167d356e40d31dd01cd30c1cc391673"
 
-- 
2.25.1


