Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A1ACFD364
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:28:18 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13385.1764062896014712000
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:28:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kCo4camA;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso4351573f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 01:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764062894; x=1764667694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x2Thw/KlnnFKezR+QVQOt7irBV9tvFhMh6+URzStA8M=;
        b=kCo4camAyTDShDIcO7/avnFvvJb6zNHXGyHqeKDv1h/qwXWyR9Fp5m6NAnjw7CHQdY
         XgvPxlOnsW5iTSE3dF6+5cDD190CO4Hlu3/azZvkoWlNWtfSttCUZBFdI4Pm8g0G/VRc
         6LK7bBUU5ogT71ZCULSZJUc8i59rBJQnB6Jhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764062894; x=1764667694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x2Thw/KlnnFKezR+QVQOt7irBV9tvFhMh6+URzStA8M=;
        b=gGu0J/LLzTb1jCX6zDhxrO2/Tw1DAyfWc7YC4c3LGrM3V40lLWdz03yKjUDaM9cTdH
         VHoP5ZLhi84O57XK66K+SPs9o4lkBaU3VBbrPEtuvYig4b4WTWIFqpVjogK/3LUWCQ7V
         SUdZ3sL3r4XNw4jFYlQd348Cuqn+b2rhizppFQN2XNhLMkomlkP5T9XDnt53p4wC3Y0Y
         6vOHwnYLNpnvDclXEsy1icSrXK1BpbruGstmsVtse7u2htgdFy631qZ2RhRmfswfun2G
         e+P3jM3qsXoaihGI5dqKd3h80AEJ5fT90HWuQbzrSJ1juiBq473aisg3ZpcJyO4teyEE
         0ybA==
X-Gm-Message-State: AOJu0YwT9Zzj7DXBUNGIHuQ9OuN0rLeGxz36nrsdXPVIUV1ZyX4/Nn2j
	XVNZj2EiLy0tT0U1SgtYxHN4vQTQ6KHM2E1euMR1MvsTnuXShnTqQbmP6vbkVi3QiSJ98KQbacU
	Nk5i6
X-Gm-Gg: ASbGnct+y2VgNJTjRRG23nboxwENXdKa2eVPceH2K8hKVm52uILNrOxbBPz4shjColF
	bVT2yZXQe2siKt/U9D8kzFperbMhWHh6y1HAQ3J5QKIajKqjbWFce7Tjb6iOUS9VZvsJxl6yyZn
	kY74kHL+eENU4qdWWw8MXQcxdNtfl9famL7RkbXe9JeGrMgu41kBwkktKbhBWxkidyNVesIwmh3
	4aDuuDV9q6zqGI9wNNHTXWeTuc5VlTh/QJ17XP2OXBPfJvLI+HLfJs37w6XqD/eHqUBzXCCbyY7
	ANirndPxAYqBSHMMTaPpzsESbJZDE1eCIppGH/oWwLqvSR53fUP0t62goDVMPjiwlpREhEVALS/
	OZaBcO6J/aiKCLi870Frmz3cxbinWgm13X3VZeYmLo1TcCMJsmPTw7YIDpMW4sq826m6LbjlvTv
	brT3HwSTG0X3FvqdHHs4IWxKYr
X-Google-Smtp-Source: AGHT+IGMFEcUD6VvxVwtgvgnQwCwWm0/SppyrlVAJWzPQkVOI2UO9ZIoALv6kvwbHCmYFw47v+QM/A==
X-Received: by 2002:a05:6000:22c9:b0:42b:3ad7:fdd4 with SMTP id ffacd0b85a97d-42cc1ac9c55mr14600641f8f.3.1764062893628;
        Tue, 25 Nov 2025 01:28:13 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34ffesm33877616f8f.10.2025.11.25.01.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 01:28:13 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCHv2] valkey: Upgrade 8.1.4 -> 9.0.0
Date: Tue, 25 Nov 2025 11:28:08 +0200
Message-ID: <20251125092810.2710458-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:28:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122051

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
 ...ig.h-Enable-HAVE_ARM_NEON-on-AArch64.patch | 31 +++++++++++++
 .../hiredis-use-default-CC-if-it-is-set.patch | 43 -------------------
 .../{valkey_8.1.4.bb => valkey_9.0.0.bb}      |  8 ++--
 3 files changed, 35 insertions(+), 47 deletions(-)
 create mode 100644 meta-oe/recipes-extended/valkey/valkey/0001-src-config.h-Enable-HAVE_ARM_NEON-on-AArch64.patch
 delete mode 100644 meta-oe/recipes-extended/valkey/valkey/hiredis-use-default-CC-if-it-is-set.patch
 rename meta-oe/recipes-extended/valkey/{valkey_8.1.4.bb => valkey_9.0.0.bb} (91%)

diff --git a/meta-oe/recipes-extended/valkey/valkey/0001-src-config.h-Enable-HAVE_ARM_NEON-on-AArch64.patch b/meta-oe/recipes-extended/valkey/valkey/0001-src-config.h-Enable-HAVE_ARM_NEON-on-AArch64.patch
new file mode 100644
index 0000000000..464fa60ee5
--- /dev/null
+++ b/meta-oe/recipes-extended/valkey/valkey/0001-src-config.h-Enable-HAVE_ARM_NEON-on-AArch64.patch
@@ -0,0 +1,31 @@
+From b15bcea48132bb8e8c1c2a4a05860cd5b73db5fd Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Tue, 25 Nov 2025 08:56:49 +0000
+Subject: [PATCH] src/config.h: Enable HAVE_ARM_NEON on AArch64
+
+Only enable HAVE_ARM_NEON on AArch64 because it supports vaddvq and
+all needed compiler intrinsics.
+
+Upstream-Status: Submitted [https://github.com/valkey-io/valkey/pull/2873]
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ src/config.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/config.h b/src/config.h
+index de0c24dcc..0c6b111a9 100644
+--- a/src/config.h
++++ b/src/config.h
+@@ -392,7 +392,7 @@ void setcpuaffinity(const char *cpulist);
+ #endif
+ 
+ /* Check if we can compile ARM SIMD code */
+-#if defined(__ARM_NEON) || defined(__ARM_NEON__)
++#if defined(__aarch64__) && (defined(__ARM_NEON) || defined(__ARM_NEON__))
+ #define HAVE_ARM_NEON 1
+ #else
+ #define HAVE_ARM_NEON 0
+-- 
+2.47.3
+
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
index 9947a9299c..77f2551261 100644
--- a/meta-oe/recipes-extended/valkey/valkey_8.1.4.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_9.0.0.bb
@@ -7,17 +7,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=08b9159809d809e8aaa340a8387e693e"
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
+	file://0001-src-config.h-Enable-HAVE_ARM_NEON-on-AArch64.patch \
 "
-SRCREV = "5f4bae3ea10174a7c872cc099c953b0e91afa93a"
+SRCREV = "5018b12b0de2d2322a1bbf6b041c43740587c0f2"
 
 RPROVIDES:${PN} = "virtual-redis"
 
@@ -41,7 +41,7 @@ PACKAGECONFIG[systemd] = "USE_SYSTEMD=yes,USE_SYSTEMD=no,systemd"
 EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS}"
 
 do_compile() {
-    oe_runmake -C deps hiredis lua linenoise
+    oe_runmake -C deps libvalkey lua linenoise
     oe_runmake
 }
 
-- 
2.47.3


