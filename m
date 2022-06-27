Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F58BCCA480
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 06:59:46 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.38741.1656313182162622397
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jun 2022 23:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vj25osVC;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656313180; i=@fujitsu.com;
	bh=vcGi/G3xQKYWe2S1mdBo7Gv6ovqCyp/tPQcAIxw0RvQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vj25osVCTZqLkkAHNchfLEQiWAjCL2ydrog7LjwKs+qK8nlogGXbUyASi1Rjs9mSl
	 3qUMwbaq0rhTOcP0USuLmYptvBeOYEcoGXEiAxIuLgqCY+BQcLORUFNCLAoZ+wWBGc
	 iiBBhNN228Y9jTqY1C1u4DtJ2EGMtfeOC9vUo8CEaqMPFt02N2NbGUG9o60gWTYLOQ
	 fxzYgzJqqsZD54GBflQW+EvXTCDswkLjo+5XcHvGzeE+KS3baxPnXP3kbjxg6yb9bb
	 x1xasIADxgfO1TrEPg3Z0oUWRf11OdLeRv11UtjptvCWgxA4l2cayPhb+AnDKzhcSB
	 4fS/TBlK8bF4w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGIsWRWlGSWpSXmKPExsViZ8OxWTcmdGe
  Swe4tLBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8azSVPYCjqUK86fV2xgvCjbxcjFISTwgFHi
  785GdgjnMpPElNZZLBDOHkaJL+e6mLsYOTnYBNQkpt+6wQpiiwjoSyydvQcsziygIvHidw87i
  C0s4Cjx8+d1xi5GDg4WAVWJI73cIGFeASeJOT+OgpVLCChITHn4HszmFHCWeDHxKTtIuRBQza
  6HRhDlghInZz5hgZguIXHwxQuoVkWJ2ZebWSDsCokZM7axQdhqElfPbWKewCg4C0n7LCTtCxi
  ZVjFaJRVlpmeU5CZm5ugaGhjoGhqa6prqGhkb6yVW6SbqpZbqlqcWl+ga6iWWF+ulFhfrFVfm
  Juek6OWllmxiBAZwSjHryx2M0/t+6h1ilORgUhLlPaW2M0mILyk/pTIjsTgjvqg0J7X4EKMMB
  4eSBK9VCFBOsCg1PbUiLTMHGE0waQkOHiUR3jZvoDRvcUFibnFmOkTqFKM9x9UrV/Yyc0yd/W
  8/M8dyMDnza9sBZiGWvPy8VClx3t1BQG0CIG0ZpXlwQ2HRf4lRVkqYl5GBgUGIpyC1KDezBFX
  +FaM4B6OSMC8byG08mXklcLtfAZ3FBHSW38QdIGeVJCKkpBqYZolGdF7xau6ZOon1ob5fwgXd
  zBvrr2plTuhkcpujIxnDp5TzplBx9YTGg2tm2b97Kp6YrxLu0H5Jjafe5Ul0v3jtrIObvvYf7
  eh2vMFavy3wMXum550nG4OktUrZri769Xxb4cprhd4dU5SPzbj4/+NFf+XEBZ4h4QI+u2L2dN
  v+5WCrCLun6s00b2v1190BcxefbHkuyLni2CrRmqNnz7/evrTFLzveR1aUNULl7SKzcFeO9z6
  HZ0y4w3da5rms46IPTmZzG50+CUzzm7N/u8O1qxr3hbRnNkybc0jD35V1jo32zxUL9194Zqqa
  YaiovugI98y3a9SDNLQlo05fddU6vOXh/lqN+/16m+7WKbEUZyQaajEXFScCAPKnKMN5AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-585.messagelabs.com!1656313179!142865!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32074 invoked from network); 27 Jun 2022 06:59:40 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-12.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jun 2022 06:59:40 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 9A0667B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 07:59:39 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 8C33775
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 07:59:39 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 27 Jun 2022 07:59:38 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] gperftools: upgrade 2.9.1 -> 2.10
Date: Mon, 27 Jun 2022 14:59:18 +0800
Message-ID: <1656313160-23805-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656313160-23805-1-git-send-email-wangmy@fujitsu.com>
References: <1656313160-23805-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jun 2022 06:59:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97592

ppc-musl.patch
refreshed for new version.

Changelog:
==========
* Matt T. Proud contributed documentation fix to call Go programming language
  by it's true name instead of golang.
* Robert Scott contributed debugallocator feature to use readable (PROT_READ)
  fence pages. This is activated by TCMALLOC_PAGE_FENCE_READABLE environment veriable.
* User stdpain contributed fix for cmake detection of libunwind.
* Natale Patriciello contributed fix for OSX Monterey support.
* Volodymyr Nikolaichuk contributed support for returning memory back to OS by
  using mmap with MAP_FIXED and PROT_NONE. It is off by default and enabled by
  preprocessor define: FREE_MMAP_PROT_NONE. This should help OSes that don't
  support Linux-style madvise MADV_DONTNEED or BSD-style MADV_FREE.
* Jingyun Hua has contributed basic support for LoongArch.
* Github issue #1338 of failing to build on some recent musl versions has been fixed.
* Github issue #1321 of failing to ship cmake bits with .tar.gz archive has been fixed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gperftools/gperftools/ppc-musl.patch      | 19 +++++++++++++++++--
 ...gperftools_2.9.1.bb => gperftools_2.10.bb} |  2 +-
 2 files changed, 18 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/gperftools/{gperftools_2.9.1.bb => gperftools_2.10.bb} (97%)

diff --git a/meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch b/meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch
index 4cf182ad6..d06b6af22 100644
--- a/meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch
+++ b/meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch
@@ -1,10 +1,21 @@
-Compatibility fixes for musl.
+From 328805fd16930deefda400a77e9c2c5d17d04d29 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 13 Mar 2021 00:42:25 -0800
+Subject: [PATCH] Compatibility fixes for musl.
 
+---
+ m4/pc_from_ucontext.m4             | 4 +++-
+ src/getpc.h                        | 3 +++
+ src/stacktrace_powerpc-linux-inl.h | 8 ++++++--
+ 3 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/m4/pc_from_ucontext.m4 b/m4/pc_from_ucontext.m4
+index 7f09dd7..5f4ee8c 100644
 --- a/m4/pc_from_ucontext.m4
 +++ b/m4/pc_from_ucontext.m4
 @@ -34,6 +34,7 @@ AC_DEFUN([AC_PC_FROM_UCONTEXT],
+    pc_fields="$pc_fields uc_mcontext.gregs[[R15]]"     # Linux (arm old [untested])
     pc_fields="$pc_fields uc_mcontext.arm_pc"           # Linux (arm arch 5)
-    pc_fields="$pc_fields uc_mcontext.cr0_hi"           # Linux (e2k)
     pc_fields="$pc_fields uc_mcontext.gp_regs[[PT_NIP]]"  # Suse SLES 11 (ppc64)
 +   pc_fields="$pc_fields uc_mcontext.gregs[[PT_NIP]]"
     pc_fields="$pc_fields uc_mcontext.mc_eip"           # FreeBSD (i386)
@@ -20,6 +31,8 @@ Compatibility fixes for musl.
                          [ucontext_t u; return u.$pc_field == 0;],
                          AC_DEFINE_UNQUOTED(PC_FROM_UCONTEXT, $pc_field,
                                             How to access the PC from a struct ucontext)
+diff --git a/src/getpc.h b/src/getpc.h
+index 9605363..cd8ccfa 100644
 --- a/src/getpc.h
 +++ b/src/getpc.h
 @@ -68,6 +68,9 @@
@@ -32,6 +45,8 @@ Compatibility fixes for musl.
  
  // Take the example where function Foo() calls function Bar().  For
  // many architectures, Bar() is responsible for setting up and tearing
+diff --git a/src/stacktrace_powerpc-linux-inl.h b/src/stacktrace_powerpc-linux-inl.h
+index a301a46..efca426 100644
 --- a/src/stacktrace_powerpc-linux-inl.h
 +++ b/src/stacktrace_powerpc-linux-inl.h
 @@ -186,7 +186,7 @@ static int GET_STACK_TRACE_OR_FRAMES {
diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.9.1.bb b/meta-oe/recipes-support/gperftools/gperftools_2.10.bb
similarity index 97%
rename from meta-oe/recipes-support/gperftools/gperftools_2.9.1.bb
rename to meta-oe/recipes-support/gperftools/gperftools_2.10.bb
index d056622b2..602a7e263 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.9.1.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.10.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRCREV = "f7c6fb6c8e99d6b1b725e5994373bcd19ffdf8fd"
+SRCREV = "bf8b714bf5075d0a6f2f28504b43095e2b1e11c5"
 SRC_URI = "git://github.com/gperftools/gperftools;branch=master;protocol=https \
            file://0001-Support-Atomic-ops-on-clang.patch \
            file://0001-fix-build-with-musl-libc.patch \
-- 
2.25.1


