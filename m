Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE78CFD31C
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 09:29:27 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12780.1763976559960426155
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Nov 2025 01:29:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Df6M2SAn;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso36915245e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 01:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1763976558; x=1764581358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WTcMUtiFA6ZuoVI+q5LJ3h9tOS/Qo2i96YefrmsQ964=;
        b=Df6M2SAnLwloJ87f00bsVtmv+0lwsSa6LZGUfg/bU9Dx5T+ZTQN1qgpcBmx2W1dZeU
         AsbRby3DLPK3Jme29gbnkWEzznj44e8yOIcEiA1Eb15sHI32CFpyIt6gjYCjfUIDK6Y8
         eHlW7jlyh1yRiuvy0PlMiQ3CT3zueGSOTvh8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763976558; x=1764581358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTcMUtiFA6ZuoVI+q5LJ3h9tOS/Qo2i96YefrmsQ964=;
        b=r7qnA4xFyWT+gIpD42+eGtBkacoybkXkW5n/yDmO/AgEqN+9YDGdzAWIQENtx6aFvy
         a4EuNHLFRlTib2zt/wC9glDAgO5Y2F5Bhd9LnLMbdVKRHEc8tYGfHvXBGGy7gfokihew
         Cn1lvXMPVvXGhyMuQXszdmd9BM5IvBNbZCX3NSuc5rXL/mxSxrl6Qs14JdCcb9QT5b93
         qi0jaSsjXqbULLY9d7quVN0qMa1a9Vnjmxo3m6BDw6vnSGL+1HfSHaz5vvTohdq2IhTD
         mm0eHZloelrMJdyAQHTHkUMaHM53uy9M0+02X+K9T9987XVBMVF513I34k1+ONttNWDH
         X8Fg==
X-Gm-Message-State: AOJu0YxXpIlo83s4AdaJ2YD4Os8p9GDW2ePxYRlEx52Un3MkdslUa6R+
	Kec69zclqnQSivcf76KmV5e4r/paDeMwoHHniSa7ShucxeSjk9p0xlqYDbTDBPwhRKowZRPXoXq
	7Alu0
X-Gm-Gg: ASbGncuAS43nbMqq12I0zTLbaK9SnlrlyxZR+cStOtVIJmVm5hRcyKZxf+7qIvkQZN/
	tnX/UVAAT3NaKdEDh9FvpCiGfPxBVavZEo7FKHzANfygZ6KKyKP4O+nt1teUip5q5dsGlMk65DS
	DLYX8U58I7tOBEABRo4zgk6M6gFvSXgHsagnnJsx39FHQAx0ZDu4azgwYw2ZohveI+cMce7+8lz
	RwMe2gyw4d2cwAtvLHlylbst2Yl8r2NKfoInsR40aYVRBBLX66/iX+amKs142EQPR79tgia428r
	hv/cWmgbfRhj4DSQLYQbtO6+/786kb8lNhbHBc2T+ubdX1TZcW8xSg+V1OxafPVVkf8WgmNbNNz
	7yQtf0MJhKrSbpFzMnDA8XS0PgBmluOxqFuhC9uNNI97lBMi8BY0TdnPQCjQZAJ9DrNIQ+lbIAj
	6FYCXS5bbF/aFB+t6mOIZXnAsC
X-Google-Smtp-Source: AGHT+IEZWWFnZda2O4COByGPfknIzRwmeZAtCEV7/k0LBglvfDiZMfP2X0KD7v7rfLUjXezyu3okGQ==
X-Received: by 2002:a05:600c:3b07:b0:471:c72:c7f8 with SMTP id 5b1f17b1804b1-477c01d4b3dmr80806365e9.21.1763976557432;
        Mon, 24 Nov 2025 01:29:17 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf355933sm191008255e9.2.2025.11.24.01.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:29:16 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] valkey: Upgrade 8.1.4 -> 9.0.0
Date: Mon, 24 Nov 2025 11:29:03 +0200
Message-ID: <20251124092909.3234487-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 09:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122005

Upgrade to release 9.0.0:

- HSETEX with FXX should not create an object if it does not exist
- Fix crash when aborting a slot migration while child snapshot is
  active
- Fix double MOVED reply on unblock at failover
- Fix memory leak with CLIENT LIST/KILL duplicate filters
- Fix incorrect accounting after completed atomic slot migration
- Fix Lua VM crash after FUNCTION FLUSH ASYNC + FUNCTION LOAD
- Fix invalid memory address caused by hashtable shrinking during
  safe iteration

Replace dependency hiredis with libvalkey.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../hiredis-use-default-CC-if-it-is-set.patch | 43 -------------------
 .../{valkey_8.1.4.bb => valkey_9.0.0.bb}      |  7 ++-
 2 files changed, 3 insertions(+), 47 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/valkey/valkey/hiredis-use-default-CC-if-it-is-set.patch
 rename meta-oe/recipes-extended/valkey/{valkey_8.1.4.bb => valkey_9.0.0.bb} (91%)

diff --git a/meta-oe/recipes-extended/valkey/valkey/hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/valkey/valkey/hiredis-use-default-CC-if-it-is-set.patch
deleted file mode 100644
index ffb365f371..0000000000
--- a/meta-oe/recipes-extended/valkey/valkey/hiredis-use-default-CC-if-it-is-set.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From a5bcf56630df520040076dd14c3c54fef0785ceb Mon Sep 17 00:00:00 2001
-From: Venture Research <tech@ventureresearch.com>
-Date: Fri, 8 Feb 2013 17:39:52 -0600
-Subject: [PATCH] hiredis: use default CC if it is set
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Instead of trying to automagically figure out CC, which breaks with OE
-as CC has spaces in it, just skip it if one was already passed in.
-
-Signed-off-by: Venture Research <tech@ventureresearch.com>
-
-Update to work with 4.0.8
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-
-Reworked for 6.0.4
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
-
-Reworked for 8.0.0
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
-
-Reworked for 8.1.0
-Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
-
-Upstream-Status: Inappropriate [OE-specifc]
----
- deps/hiredis/Makefile | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/deps/hiredis/Makefile b/deps/hiredis/Makefile
-index 4a3de1f6e..49bb525cd 100644
---- a/deps/hiredis/Makefile
-+++ b/deps/hiredis/Makefile
-@@ -36,8 +36,6 @@ endef
- export REDIS_TEST_CONFIG
- 
- # Fallback to gcc when $CC is not in $PATH.
--CC:=$(shell sh -c 'type $${CC%% *} >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
--CXX:=$(shell sh -c 'type $${CXX%% *} >/dev/null 2>/dev/null && echo $(CXX) || echo g++')
- OPTIMIZATION?=-O3
- WARNINGS=-Wall -Wextra -Werror -Wstrict-prototypes -Wwrite-strings -Wno-missing-field-initializers
- DEBUG_FLAGS?= -g -ggdb
diff --git a/meta-oe/recipes-extended/valkey/valkey_8.1.4.bb b/meta-oe/recipes-extended/valkey/valkey_9.0.0.bb
similarity index 91%
rename from meta-oe/recipes-extended/valkey/valkey_8.1.4.bb
rename to meta-oe/recipes-extended/valkey/valkey_9.0.0.bb
index 9947a9299c..82b08d7a82 100644
--- a/meta-oe/recipes-extended/valkey/valkey_8.1.4.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_9.0.0.bb
@@ -7,17 +7,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=08b9159809d809e8aaa340a8387e693e"
 DEPENDS = "readline lua ncurses"
 
 SRC_URI = " \
-	git://github.com/valkey-io/valkey.git;branch=8.1;protocol=https \
+	git://github.com/valkey-io/valkey.git;branch=9.0;protocol=https \
         file://valkey.conf \
 	file://init-valkey-server \
 	file://valkey.service \
-	file://hiredis-use-default-CC-if-it-is-set.patch \
 	file://lua-update-Makefile-to-use-environment-build-setting.patch \
 	file://oe-use-libc-malloc.patch \
 	file://0001-src-Do-not-reset-FINAL_LIBS.patch \
 	file://GNU_SOURCE-7.patch \
 "
-SRCREV = "5f4bae3ea10174a7c872cc099c953b0e91afa93a"
+SRCREV = "5018b12b0de2d2322a1bbf6b041c43740587c0f2"
 
 RPROVIDES:${PN} = "virtual-redis"
 
@@ -41,7 +40,7 @@ PACKAGECONFIG[systemd] = "USE_SYSTEMD=yes,USE_SYSTEMD=no,systemd"
 EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS}"
 
 do_compile() {
-    oe_runmake -C deps hiredis lua linenoise
+    oe_runmake -C deps libvalkey lua linenoise
     oe_runmake
 }
 
-- 
2.47.3


