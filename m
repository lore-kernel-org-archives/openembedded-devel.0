Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E70ECC636D7
	for <webhook@archiver.kernel.org>; Sat, 18 Feb 2023 10:26:20 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.9576.1676715976172974727
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Feb 2023 02:26:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cFhci4UD;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676715974; i=@fujitsu.com;
	bh=B9K83ytvGo9tNQGjxECoDmH8AGdICNTKldYKcf4yOIo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=cFhci4UDe89iiJArJCEOE8II/GT+RWw9y5hsPG00XzJ8jxEkBBptSu4bN7cukPuYZ
	 xABPnF4uK06DohK5SCpG+iZNHqHT8h4Ztsy/j2hGYG3RcPBIpCZZBb1sga08lRKpOG
	 cFMNStBLLXlioT7GayH8CYM55V1S0168aC/Bx+ehWlALz5h+N5mNshbENLOJVcq5f5
	 QR6ta82Nf6f9vBZjxJPHyG7C8Jlw6ISeySL9KFJmvykIBRCV7IKzuAcSrpev+uBFfV
	 WPvsbnhnrH+dkEOV8mJ+08YzaEE3gTzbUzqUEe1wgZRMX8BmKqrium+GhRDP766xNw
	 gy2LXnJ5YnrxA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8OxWffo8g/
  JBuvvmllcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBk79pgXfNWouHnzBlMD43+VLkYuDiGBB4wS
  Czr+MEE4V5gknjW9Ze9i5ARy9jJK7GivALHZBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48bsHr
  F5YwF5i1qL/LCA2i4CqxKsbR8FsXgEniWuff7GC2BICChJTHr4H6+UUcJa4snAVM8QuJ4lT+/
  dA1QtKnJz5hAVivoTEwRcvmCF6FSVmX25mgbArJVo//IKy1SSuntvEPIFRcBaS9llI2hcwMq1
  iNC1OLSpLLdI10ksqykzPKMlNzMzRS6zSTdRLLdUtTy0uAcoklhfrpRYX6xVX5ibnpOjlpZZs
  YgQGbkqxav8OxrW9f/UOMUpyMCmJ8n7e9j5ZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRv3dwPy
  UKCRanpqRVpmTnAKIJJS3DwKInwVs4GSvMWFyTmFmemQ6ROMRpzXL1yZS8zx6Z9XQeYhVjy8v
  NSpcR5uYHxKSQAUppRmgc3CBbdlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ865ZBjSFJzO
  vBG7fK6BTmIBOWcD8FuSUkkSElFQD07In1XKtqh5syZyR76YUsb6YfPR/6/THM/7bbXzG0ewl
  KiF5Vym2teeiinHpEcHdXlMCSr+fXf4lhFfwTNbN7TY1Jzd+kra8e1tEolDimZniUyfuBQ0Lt
  9uXfvn04symP5Lsj5Mz3iz59OJitPUuZffbNff7Nz+0u8dwwVS5yOGCzX6W2Fdn8y2dKz5xXd
  T+5xV5y/AfS822E7K8d2o4WuZyzyyeFX7Yvq1p2iculxMKUXzJf21iHm9lFTR+yB16nrml1iD
  RwSf/w5u92uHMtXlc17LZvofd9DGdcrpZ/ca8aeZCLx/q9j0puLj05APxO5sMF7qe9j1vE63F
  XfqkZTu/7rZVpjZLxf2zzhxxVmIpzkg01GIuKk4EAESzkcNpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-571.messagelabs.com!1676715973!737416!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25340 invoked from network); 18 Feb 2023 10:26:13 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Feb 2023 10:26:13 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 9B9AE7C
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 10:26:13 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 8FD4573
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 10:26:13 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 18 Feb 2023 10:26:12 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] netplan: upgrade 0.104 -> 0.106
Date: Sat, 18 Feb 2023 18:25:46 +0800
Message-ID: <1676715946-32075-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676715946-32075-1-git-send-email-wangmy@fujitsu.com>
References: <1676715946-32075-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 10:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101142

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Makefile-do-not-use-Werror.patch
refreshed for new version.

0001-Makefile-fix-parallel-build-failure.patch
removed since it's included in new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Makefile-do-not-use-Werror.patch     |  6 +--
 ...-Makefile-fix-parallel-build-failure.patch | 44 -------------------
 .../{netplan_0.104.bb => netplan_0.106.bb}    |  5 +--
 3 files changed, 5 insertions(+), 50 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-Makefile-fix-parallel-build-failure.patch
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/{netplan_0.104.bb => netplan_0.106.bb} (95%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
index 613858f6f..b8c48d540 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-Makefile-do-not-use-Werror.patch
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index 0368e41..53d6a9d 100644
+index 97973ce..78273ff 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -8,7 +8,6 @@ BUILDFLAGS = \
@@ -20,7 +20,7 @@ index 0368e41..53d6a9d 100644
 -	-Werror \
  	$(NULL)
  
- SRCS = \
+ TESTFLAGS =	\
 -- 
-2.25.1
+2.34.1
 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-Makefile-fix-parallel-build-failure.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-Makefile-fix-parallel-build-failure.patch
deleted file mode 100644
index 2149ee30c..000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-Makefile-fix-parallel-build-failure.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 2e84550b47b475d830622f41576992a1d45d6af0 Mon Sep 17 00:00:00 2001
-From: Zhao Yi <38274519+yizhao1@users.noreply.github.com>
-Date: Tue, 15 Mar 2022 19:28:26 +0800
-Subject: [PATCH] Makefile: fix parallel build failure (#267)
-
-* Makefile: fix parallel build failure
-
-Add src/_features.h as dependency for dbus.o to fix the parallel build
-failure:
-src/dbus.c:17:10: fatal error: _features.h: No such file or directory
-
-Upstream-Status: Backport
-[https://github.com/canonical/netplan/commit/2e84550b47b475d830622f41576992a1d45d6af0]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 0368e41..8ac7432 100644
---- a/Makefile
-+++ b/Makefile
-@@ -52,7 +52,7 @@ NOSETESTS3 ?= $(shell command -v nosetests-3 || command -v nosetests3 || echo tr
- 
- default: netplan/_features.py generate netplan-dbus dbus/io.netplan.Netplan.service doc/netplan.html doc/netplan.5 doc/netplan-generate.8 doc/netplan-apply.8 doc/netplan-try.8 doc/netplan-dbus.8 doc/netplan-get.8 doc/netplan-set.8
- 
--%.o: src/%.c
-+%.o: src/%.c src/_features.h
- 	$(CC) $(BUILDFLAGS) $(CFLAGS) $(LDFLAGS) -c $^ `pkg-config --cflags --libs glib-2.0 gio-2.0 yaml-0.1 uuid`
- 
- libnetplan.so.$(NETPLAN_SOVER): $(SRCS) abicompat.lds
-@@ -62,7 +62,7 @@ libnetplan.so.$(NETPLAN_SOVER): $(SRCS) abicompat.lds
- generate: libnetplan.so.$(NETPLAN_SOVER) generate.o
- 	$(CC) $(BUILDFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $(filter-out $<,$^) -L. -lnetplan `pkg-config --cflags --libs glib-2.0 gio-2.0 yaml-0.1 uuid`
- 
--netplan-dbus: libnetplan.so.$(NETPLAN_SOVER) src/_features.h dbus.o
-+netplan-dbus: libnetplan.so.$(NETPLAN_SOVER) dbus.o
- 	$(CC) $(BUILDFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $(filter-out $<,$(patsubst %.h,,$^)) -L. -lnetplan `pkg-config --cflags --libs libsystemd glib-2.0 gio-2.0 yaml-0.1 uuid`
- 
- src/_features.h: src/[^_]*.[hc]
--- 
-2.25.1
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.104.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.106.bb
similarity index 95%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.104.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.106.bb
index ea944fa9d..b7fe7ae3e 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.104.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_0.106.bb
@@ -11,12 +11,11 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 S = "${WORKDIR}/git"
-SRCREV = "3e522b7255310bdecca6c781137741dfc4abc021"
-PV = "0.104"
+SRCREV = "15ce044d1df27b5057556d84d0d14beef8dd4e4d"
+PV = "0.106"
 
 SRC_URI = "git://github.com/CanonicalLtd/netplan.git;branch=main;protocol=https \
            file://0001-Makefile-do-not-use-Werror.patch \
-           file://0001-Makefile-fix-parallel-build-failure.patch \
            "
 
 SRC_URI:append:libc-musl = " file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch"
-- 
2.34.1


