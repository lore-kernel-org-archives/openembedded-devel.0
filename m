Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBB7C87FCC
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 23:29:45 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.49377.1753918173711608602
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 16:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RS7M+8T9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753918175; x=1785454175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2jycWG8Vbf+Ul9UYSMerLElh7d93Sx6vn6SBlGpWPL8=;
  b=RS7M+8T9lpgAVFyirnB9IhqwNKp42J0YKVCOcSEwV3WKvfXIMxWSrCiF
   AMmTlRbAMVFVIcxvkaUOb36C6Ek2TFqxl7fVPkQYFGBmuw4ZPCg64yM97
   IywumeQBJ/F31siubKgsy5//TGng8bko2dhA8pLr0cJQb5gcwkdRO1WCs
   b0VUOJ4RjSdz+mQj5QIF6uRtNKpGOOUKIvA8dsk0+J+AVCDETuwS+4Z0Q
   BKWYKR6GL/aoWL0p1KFg3ULMjKXPW1xeXwZuFWxkSpC4EoxmNIM+kpaRY
   f3nxljVkTM2jXALs/85IOl2lm24g1Map2YQakVtLXp29Xb9clCsPwf88h
   A==;
X-CSE-ConnectionGUID: CT32bc8rQAmbhKnnsZVkIg==
X-CSE-MsgGUID: n31TnDC5StCW4BnBcKj5yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="207978901"
X-IronPort-AV: E=Sophos;i="6.16,353,1744038000"; 
   d="scan'208";a="207978901"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 08:29:34 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 2F4541002B8F
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:35 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 907B514003E7
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E84931A0071;
	Thu, 31 Jul 2025 07:29:30 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 38/40] uftrace: upgrade 0.18 -> 0.18.1
Date: Thu, 31 Jul 2025 07:29:21 +0800
Message-ID: <20250730232923.522-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730232923.522-1-wangmy@fujitsu.com>
References: <20250730232923.522-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118806

From: Wang Mingyu <wangmy@fujitsu.com>

0001-build-Fix-a-build-error-on-i386.patch
removed since it's included in 0.18.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...0001-build-Fix-a-build-error-on-i386.patch | 26 -------------------
 .../{uftrace_0.18.bb => uftrace_0.18.1.bb}    |  5 ++--
 2 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/uftrace/uftrace/0001-build-Fix-a-build-error-on-i386.patch
 rename meta-oe/recipes-devtools/uftrace/{uftrace_0.18.bb => uftrace_0.18.1.bb} (91%)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace/0001-build-Fix-a-build-error-on-i386.patch b/meta-oe/recipes-devtools/uftrace/uftrace/0001-build-Fix-a-build-error-on-i386.patch
deleted file mode 100644
index c6bc8473b9..0000000000
--- a/meta-oe/recipes-devtools/uftrace/uftrace/0001-build-Fix-a-build-error-on-i386.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From ea53a7f42c1c5da688ef79e53731dcc3810a1256 Mon Sep 17 00:00:00 2001
-From: Namhyung Kim <namhyung@gmail.com>
-Date: Sun, 6 Jul 2025 15:13:30 -0700
-Subject: [PATCH] build: Fix a build error on i386
-
-It happened to have common.S as well as common.c, so it picked the .S
-before .c for the uftrace-arch.a.  And it caused undefined symbols.
-
-  /usr/bin/ld: libmcount/symbol.op: in function `load_dynsymtab':
-  utils/symbol.c:722:(.text+0x2b19): undefined reference to `uftrace_arch_ops'
-  libmcount/symbol.op: in function `load_elf_dynsymtab':
-  utils/symbol.c:586:(.text+0x184a): undefined reference to `uftrace_arch_ops'
-
-Fixed: #2010
-
-Upstream-Status: Backport [https://github.com/namhyung/uftrace/commit/ea53a7f42c1c5da688ef79e53731dcc3810a1256]
-Signed-off-by: Namhyung Kim <namhyung@gmail.com>
----
- arch/i386/{common.S => thunk.S} | 0
- 1 file changed, 0 insertions(+), 0 deletions(-)
- rename arch/i386/{common.S => thunk.S} (100%)
-
-diff --git a/arch/i386/common.S b/arch/i386/thunk.S
-similarity index 100%
-rename from arch/i386/common.S
-rename to arch/i386/thunk.S
diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.18.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.18.1.bb
similarity index 91%
rename from meta-oe/recipes-devtools/uftrace/uftrace_0.18.bb
rename to meta-oe/recipes-devtools/uftrace/uftrace_0.18.1.bb
index 7ba2dcadc9..3725825e0e 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.18.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.18.1.bb
@@ -8,11 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "elfutils"
 DEPENDS:append:libc-musl = " argp-standalone"
 
-SRCREV = "8ccd4f627569b0af122c8d1df98dc6813ab97a40"
+SRCREV = "6d006b71ac32e28b7829cc21ccc7bb9c10add964"
 SRC_URI = "git://github.com/namhyung/${BPN};branch=master;protocol=https;tag=v${PV} \
            file://0001-include-libgen.h-for-basename.patch \
-           file://0001-build-Fix-a-build-error-on-i386.patch \
-          "
+           "
 
 LDFLAGS:append:libc-musl = " -largp"
 
-- 
2.43.0


