Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED10C87FCA
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 04:00:40 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.32329.1753070435226428129
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Jul 2025 21:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fuxBbNw6;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74b52bf417cso2468838b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Jul 2025 21:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753070434; x=1753675234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5sU9OA/N4un6j7xiEanENv2qHVIO5ybpKkLjFCeVYE=;
        b=fuxBbNw64ChYJL3+8eY4aEjAiLgi7qSQHBu5lEICShGjERzHAPnOrrhYpXWrrtXAkD
         X3YxAWeBRy0FEBgIpdXgrSrVF+CH9XAFn45N88TyJU2s+0s9yBFQGnuKDa5eGW5FmdY2
         09s2DSY9aCXm8NzgYNa/9sSi/hbdH0FKh3PmtAUHiEh4a91/UpV3heCGbU2Oej53NS20
         zJ23bGaoWS4OYX9L6MkoZKuBkCtk+oiRF5Z3tgzlMa3H7Wv7UMXDcdi8tEYBts9XCJIg
         uBs2ma6b62e3oeuEfvWahrwUluGceVmeff3/Zlx4pv8uas8Lp6hTApI3bmq08kTpb8EG
         7CLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753070434; x=1753675234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5sU9OA/N4un6j7xiEanENv2qHVIO5ybpKkLjFCeVYE=;
        b=mPwtZgujHZJ76go8EThFAX4FcyrUooFqghcC9Mg9S7IjzUIghq1Y6PWbFPwX+7D2E2
         1EWqYkmWxUN38ulymeVleo6s3km62UjFzXn+jpWOunjOAENVe0nY4L9n5U8yszH+qeNa
         3xcsxnx7U0+h74O6E52WDD8gLXb2JUmeBW9IQcLBfay89HtKnmYLbhNKHoblu9MxfOOp
         Y5QBnkgUPeB0kpzx7hSSWn+r/DGNHkyzFYhdJ/+I9eShyR3nqRLb9kuiWoZQwEae2ANm
         ZgrLd1v6+WmpHCXIGNCDdlOU5CytwPv3nbe+pEVsklRr3sdH30KIaFsyG5Fv/vwuC1fK
         GNkg==
X-Gm-Message-State: AOJu0YwuMhRHppHSvQ1tNU2Id8NgOHuwDyu2gZU4so3nSIRKACjxrApy
	4LFqJRi+vRxPKDprS7JV6RWCgG9Ug4oEu/H4WDOcHprL6VozUTQfXKmvnE/gmZf8hWI=
X-Gm-Gg: ASbGncu4Wrr08r/zeqgxDV36xjzxaRSMKoc1P0eURyF+Xr5CQ4nSlQ4yUeirvScNMeu
	QYhIAAtVTOnpKLRsE6Ps9Rb3OnY3dduyWsKtI3g8pBNFz1j2IKuW6sAqjgnUZ/1O3PdgNP4Cvac
	lArznPibpAKsavgnbuM9rvS3ltzEzU3ELsu8uWJx9wW2b3FA3ZLMyvKPFzLc+gcYVLGxaiHL7Qy
	pY5+9l2+0rVpaqUcNwto3mvZ91JkQYcHRcHVT4+ZF/toQ0AGCU1FGdin1I2d5ZzSGmBLGoaBGCx
	+QONX89OxRaKsnYXN/4VWfKRZ2eNk21fcQv1E+ulHDRo3hvEPU3WlJ11Cg15276xvkJ03r9OnrL
	Hzv+8EojCxHLmPw==
X-Google-Smtp-Source: AGHT+IGJz90gcTLAEkYJrQjVZMGlT/DOK/UfeBoM8K603+anbrNGT4F4BGmlB3qux1zCKlBzk3FNRg==
X-Received: by 2002:a05:6a00:1945:b0:748:ed51:1300 with SMTP id d2e1a72fcca58-75722869e2dmr25401260b3a.9.1753070433927;
        Sun, 20 Jul 2025 21:00:33 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b985])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c89d5e73sm4812987b3a.59.2025.07.20.21.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 21:00:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/7] libhugetlbfs: Do not add LDFLAGS to compiler
Date: Sun, 20 Jul 2025 21:00:25 -0700
Message-ID: <20250721040030.641212-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721040030.641212-1-raj.khem@gmail.com>
References: <20250721040030.641212-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 04:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118645

Add LDFLAGS in makefile for linking the helper libraries instead

when linking with LLD it ends up with errors
i686-yoe-linux-clang: warning: -Wl,-O1: 'linker' input unused [-Wunused-command-line-argument]
i686-yoe-linux-clang: warning: -Wl,--hash-style=gnu: 'linker' input unused [-Wunused-command-line-argument]
i686-yoe-linux-clang: warning: -Wl,--as-needed: 'linker' input unused [-Wunused-command-line-argument]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...s-to-linker-commandline-for-libheaps.patch | 33 +++++++++++++++++++
 .../libhugetlbfs/libhugetlbfs_2.24.bb         |  3 +-
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0014-tests-Add-ldflags-to-linker-commandline-for-libheaps.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0014-tests-Add-ldflags-to-linker-commandline-for-libheaps.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0014-tests-Add-ldflags-to-linker-commandline-for-libheaps.patch
new file mode 100644
index 0000000000..94a88647ea
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0014-tests-Add-ldflags-to-linker-commandline-for-libheaps.patch
@@ -0,0 +1,33 @@
+From 834662425936ae222789f4823d10a1371b951ae1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 20 Jul 2025 14:19:59 -0700
+Subject: [PATCH] tests: Add ldflags to linker commandline for libheapshrink.so
+
+This fixes build QA errors
+ERROR: libhugetlbfs-1_2.24-r0 do_package_qa: QA Issue: File /usr/lib/libhugetlbfs/tests/obj64/libheapshrink.so in package libhugetlbfs-tests doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/Makefile.in b/tests/Makefile.in
+index d33a228..042af8d 100644
+--- a/tests/Makefile.in
++++ b/tests/Makefile.in
+@@ -140,12 +140,12 @@ obj64/%-pic.o: %.c
+ obj32/libheapshrink.so: obj32/heapshrink-helper-pic.o
+ 	@$(VECHO) LD32 "(shared)" $@
+ 	@mkdir -p obj32
+-	$(CC32) -Wl,-soname,$(notdir $@) -shared -o $@ $^
++	$(CC32) -Wl,-soname,$(notdir $@) -shared $(LDFLAGS) -o $@ $^
+ 
+ obj64/libheapshrink.so: obj64/heapshrink-helper-pic.o
+ 	@$(VECHO) LD64 "(shared)" $@
+ 	@mkdir -p obj64
+-	$(CC64) -Wl,-soname,$(notdir $@) -shared -o $@ $^
++	$(CC64) -Wl,-soname,$(notdir $@) -shared $(LDFLAGS) -o $@ $^
+ 
+ $(LIB_TESTS:%=obj32/%): %: %.o obj32/testutils.o obj32/libtestutils.o
+ 	@$(VECHO) LD32 "(lib test)" $@
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
index e688d6ede2..a43ddf0d53 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
@@ -24,6 +24,7 @@ SRC_URI = " \
     file://0011-include-limits.h-for-PATH_MAX.patch \
     file://0012-huge_page_setup_helper-use-python3-interpreter.patch \
     file://0013-elflink.c-include-libgen.h-for-basename.patch \
+    file://0014-tests-Add-ldflags-to-linker-commandline-for-libheaps.patch \
 "
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
@@ -42,8 +43,6 @@ CFLAGS += "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -g0
 
 export HUGETLB_LDSCRIPT_PATH = "${S}/ldscripts"
 
-TARGET_CC_ARCH += "${LDFLAGS}"
-
 LDFLAGS += "-B${S}"
 
 inherit autotools-brokensep

