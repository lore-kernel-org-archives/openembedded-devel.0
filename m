Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4951C83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 22:42:59 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.35529.1752705771358228778
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jul 2025 15:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X9394q2p;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-74b54cead6cso302660b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 15:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752705770; x=1753310570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zNk1UxSuXiva/6Thr9W5RRfy4gvtbrEJz0kmGo1ZGRM=;
        b=X9394q2ptGli8YPc2e1neBBoJPGGOnivO4vvpmY8k9cdnn8G2K+Zt98TxbvRQzo7U/
         Zcqy3WJfw1rs4FYC3nkI3N4Ha0b+kNcr6TRLzHdjY6MxbrUtBZVtPvbBsTTjSBon29wA
         uLr8AOiKEWdDyFGCzHLb9gk2+8Q+53y5t/UVet08UxuCN3RBXHXO2Sw3llvVMg1fYZ+B
         0iH/YB4J/Q+Wqwf0HMtFe5YzrJd1/3Cjx68NdcRXrLn7VicG8K3ck0+AppMx1+2ShTNY
         U+D3lM2MTpd1+6KG9IjJJ4ycjfI/RDxlb3TCAYT4aOsFT/oUF4W6BOulKq0KwnJSj9c7
         FrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752705770; x=1753310570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zNk1UxSuXiva/6Thr9W5RRfy4gvtbrEJz0kmGo1ZGRM=;
        b=DAww85UOQHdvpbH2Sd8HQStFaDXsbqvII8M+LHTT5+TWE3H9iM1f6UguiAlsrcPuYr
         sWeSomm12hnkWLh95KZ4ybLDtuh43DO2zNcogpR0JKLH7SI79Mpwed4twy0St5/5w1yO
         ofc3Lou3j0kcYkTOm6mKRQnPyiVdTjdi6EwSmAAGG6qlXStOuwWqTDuZU+UNBd03ySar
         7vPu051pLrOYwFBxazmM4GRJil8n/kNnnB5aGM4ZbW6IuNqzTKsapINwxZ7ncV0wibOu
         tE3DexkYfQWvA8oKJJ0GPHStop4ScC+yevBo1RHiuNUP7t5iwHdYsINiny970ErLczwx
         k8uA==
X-Gm-Message-State: AOJu0Yw5WXiKRGpDR4dbk7Ic5mT8FcVQq85+ovFunQ5x6mHT/LbLmcfZ
	2Hx1/jmXqKz5duZgl98iBKtSQ4pi0iraMkO48Xlmyv4SFBmnRBgyiNCX2qjjX43vr7c=
X-Gm-Gg: ASbGncujAqVDOCN3Z94t8nLmfdLr+iWEAniY7cGVUaxBSIxJhho+b12lU/8+7O8Am9I
	YGGNCJ+BJ19PUAosUP8XcyLARrAyTxgSDmrG1G1q3S+IYFfgpHwxqoxa447ttqr1rDvNGSkaQRO
	6SV1AdHw2bbad1bJkHR1W9DuiqZfsOTN9ZNr6bX73hapoJrnJglufzLQTVv9g1uJl6At/fA5/PQ
	KfKx68ekQs+JCvuteSrwg2MqotN20MCtCMbV8TkFjtL2eggz2X7oQC782RXHTnw7342UaRtloeG
	uKJlXAunsMWCTicgktnWiBajnmYZjjB2VT6UL3sSN09ywWrYPA+BOkTUrSDE90E1ZEK/XbnLCWp
	Nk66F47iI6mvARA==
X-Google-Smtp-Source: AGHT+IEvvNjudxnPAPzs8mDxnkAP32h8ErE3WBelmnDfLCN2R88CNotht8BUeLQoYYQVb+7UtCFPtw==
X-Received: by 2002:a05:6a21:62c2:b0:233:b2f8:70c with SMTP id adf61e73a8af0-2381245772emr6036870637.19.1752705770299;
        Wed, 16 Jul 2025 15:42:50 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::64ce])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e063besm14705265b3a.45.2025.07.16.15.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 15:42:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] uftrace: Fix build failure on x86
Date: Wed, 16 Jul 2025 15:42:47 -0700
Message-ID: <20250716224247.2288484-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 22:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118601

Do not inherit autotools bbclass, the configure script is hand-written
and not a autoconf generated one.

Backport a fix to build on 32bit x86
Fixes
| i686-yoe-linux-ld.lld: error: undefined symbol: uftrace_arch_ops
| >>> referenced by symbol.c:586 (utils/symbol.c:586)
| >>>               /mnt/b/yoe/master/build/tmp/work/core2-32-yoe-linux/uftrace/0.18/sources/uftrace-0.18/libmcount/symbol.op:(load_elf_dynsymtab)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-build-Fix-a-build-error-on-i386.patch | 26 +++++++++++++++++++
 .../recipes-devtools/uftrace/uftrace_0.18.bb  | 23 +++++++++++-----
 2 files changed, 43 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0001-build-Fix-a-build-error-on-i386.patch

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace/0001-build-Fix-a-build-error-on-i386.patch b/meta-oe/recipes-devtools/uftrace/uftrace/0001-build-Fix-a-build-error-on-i386.patch
new file mode 100644
index 0000000000..c6bc8473b9
--- /dev/null
+++ b/meta-oe/recipes-devtools/uftrace/uftrace/0001-build-Fix-a-build-error-on-i386.patch
@@ -0,0 +1,26 @@
+From ea53a7f42c1c5da688ef79e53731dcc3810a1256 Mon Sep 17 00:00:00 2001
+From: Namhyung Kim <namhyung@gmail.com>
+Date: Sun, 6 Jul 2025 15:13:30 -0700
+Subject: [PATCH] build: Fix a build error on i386
+
+It happened to have common.S as well as common.c, so it picked the .S
+before .c for the uftrace-arch.a.  And it caused undefined symbols.
+
+  /usr/bin/ld: libmcount/symbol.op: in function `load_dynsymtab':
+  utils/symbol.c:722:(.text+0x2b19): undefined reference to `uftrace_arch_ops'
+  libmcount/symbol.op: in function `load_elf_dynsymtab':
+  utils/symbol.c:586:(.text+0x184a): undefined reference to `uftrace_arch_ops'
+
+Fixed: #2010
+
+Upstream-Status: Backport [https://github.com/namhyung/uftrace/commit/ea53a7f42c1c5da688ef79e53731dcc3810a1256]
+Signed-off-by: Namhyung Kim <namhyung@gmail.com>
+---
+ arch/i386/{common.S => thunk.S} | 0
+ 1 file changed, 0 insertions(+), 0 deletions(-)
+ rename arch/i386/{common.S => thunk.S} (100%)
+
+diff --git a/arch/i386/common.S b/arch/i386/thunk.S
+similarity index 100%
+rename from arch/i386/common.S
+rename to arch/i386/thunk.S
diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.18.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.18.bb
index f82dc17071..7ba2dcadc9 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.18.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.18.bb
@@ -8,11 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "elfutils"
 DEPENDS:append:libc-musl = " argp-standalone"
 
-inherit autotools
-
 SRCREV = "8ccd4f627569b0af122c8d1df98dc6813ab97a40"
 SRC_URI = "git://github.com/namhyung/${BPN};branch=master;protocol=https;tag=v${PV} \
-           file://0001-include-libgen.h-for-basename.patch"
+           file://0001-include-libgen.h-for-basename.patch \
+           file://0001-build-Fix-a-build-error-on-i386.patch \
+          "
 
 LDFLAGS:append:libc-musl = " -largp"
 
@@ -26,11 +26,22 @@ def set_target_arch(d):
     else:
         return arch
 
-EXTRA_UFTRACE_OECONF = "ARCH=${@set_target_arch(d)} \
-                        with_elfutils=/use/libelf/from/sysroot"
 
 do_configure() {
-    ${S}/configure ${EXTRA_UFTRACE_OECONF}
+    ${S}/configure --prefix=${prefix} \
+    --objdir=${B} \
+    --cflags='${CFLAGS}' \
+    --ldflags='${LDFLAGS}' \
+    --arch='${@set_target_arch(d)}' \
+    --with-elfutils=${STAGING_EXECPREFIXDIR}
+}
+
+do_compile() {
+    oe_runmake V=1
+}
+
+do_install() {
+    oe_runmake DESTDIR=${D}
 }
 
 FILES_SOLIBSDEV = ""

