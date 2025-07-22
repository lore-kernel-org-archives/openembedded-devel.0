Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E15DC83F1A
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 03:13:20 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.4289.1753153991495450583
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 20:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mVrpWVjA;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753153993; x=1784689993;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IUP1uM1sRbvKhCTsnBIa4M/kXXlp6mZYUp/tESx2cBk=;
  b=mVrpWVjAynghvQ2MPYhwpw4LDCcLczgRQa1cqPZNuf9PC/Nyn/jwMg/+
   T/EC1PFny47YjRM7I70RbIoyDT0z1cgvwJr4pgX0H9qVLtJz5doKnBmTw
   Pfo7w0T2NBPVjv4CV3+ycYr4dDUY+4efMaEVrT+TPPWXDjGqpLYivPuUy
   J5NOipROlbY0JLFCfDAru/2pZbQ9nd2SlyYAOk76HU1SZtWFXrge9ai1U
   zK1JAeDTYOG/JGJDrETosQVa2UxahGeTjXYMqRXI/vGrCO7++scDdvQXZ
   FpmIE3rgjvi4snbc8Cp+oSd+E4Hq32eki8eEdUH+xASPjq+IR9h9VlnzW
   g==;
X-CSE-ConnectionGUID: Wi69K130R+G4X4QFzUh0wA==
X-CSE-MsgGUID: YvvYq4c9SMCAqCNbvMTfrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="210239156"
X-IronPort-AV: E=Sophos;i="6.16,330,1744038000"; 
   d="scan'208";a="210239156"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 12:13:11 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 09B281002B97
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:10 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 768568D65DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:09 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 88CD91A0074;
	Tue, 22 Jul 2025 11:13:06 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-networking] [PATCH 19/21] chrony: upgrade 4.6.1 -> 4.7
Date: Tue, 22 Jul 2025 11:12:27 +0800
Message-ID: <20250722031245.884-19-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
References: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118683

Changelog:
==========
- Add opencommands directive to select remote monitoring commands
- Add interval option to driftfile directive
- Add waitsynced and waitunsynced options to local directive
- Add sanity checks for integer values in configuration
- Add support for systemd Type=notify service
- Add RTC refclock driver
- Allow PHC refclock to be specified with network interface name
- Don’t require multiple refclock samples per poll to simplify filter configuration
- Keep refclock reachable when dropping samples with large delay
- Improve quantile-based filtering to adapt faster to larger delay
- Improve logging of selection failures
- Detect clock interference from other processes
- Try to reopen message log (-l option) on cyclelogs command
- Fix sourcedir reloading to not multiply sources
- Fix tracking offset after failed clock step
- Drop support for NTS with Nettle < 3.6 and GnuTLS < 3.6.14
- Drop support for building without POSIX threads

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../chrony/chrony/arm_eabi.patch                | 17 ++++++++---------
 .../chrony/{chrony_4.6.1.bb => chrony_4.7.bb}   |  2 +-
 2 files changed, 9 insertions(+), 10 deletions(-)
 rename meta-networking/recipes-support/chrony/{chrony_4.6.1.bb => chrony_4.7.bb} (98%)

diff --git a/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
index b9bb374e53..07bb044c6d 100644
--- a/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
+++ b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
@@ -1,4 +1,4 @@
-From 71c44c214c0ab8dc8e9675e5e862f2e342fcb271 Mon Sep 17 00:00:00 2001
+From 7df907871b87772072abc94aeff2b7ba770e8f44 Mon Sep 17 00:00:00 2001
 From: Joe Slater <jslater@windriver.com>
 Date: Thu, 9 Mar 2017 10:58:06 -0800
 Subject: [PATCH] chrony: fix build failure for arma9
@@ -22,16 +22,15 @@ Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
 Refreshed for 4.0
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  sys_linux.c | 15 +++++++++------
  1 file changed, 9 insertions(+), 6 deletions(-)
 
 diff --git a/sys_linux.c b/sys_linux.c
-index 6849637..10f9a57 100644
+index 8373e25..47b4459 100644
 --- a/sys_linux.c
 +++ b/sys_linux.c
-@@ -485,7 +485,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+@@ -490,7 +490,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
  #endif
      SCMP_SYS(gettimeofday),
      SCMP_SYS(settimeofday),
@@ -39,7 +38,7 @@ index 6849637..10f9a57 100644
  
      /* Process */
      SCMP_SYS(clone),
-@@ -495,7 +494,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+@@ -500,7 +499,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
      SCMP_SYS(exit),
      SCMP_SYS(exit_group),
      SCMP_SYS(getpid),
@@ -47,7 +46,7 @@ index 6849637..10f9a57 100644
      SCMP_SYS(getuid),
      SCMP_SYS(getuid32),
  #ifdef __NR_membarrier
-@@ -515,7 +513,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+@@ -520,7 +518,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
      /* Memory */
      SCMP_SYS(brk),
      SCMP_SYS(madvise),
@@ -55,7 +54,7 @@ index 6849637..10f9a57 100644
      SCMP_SYS(mmap2),
      SCMP_SYS(mprotect),
      SCMP_SYS(mremap),
-@@ -575,8 +572,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+@@ -580,8 +577,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
      SCMP_SYS(sendmsg),
      SCMP_SYS(sendto),
      SCMP_SYS(shutdown),
@@ -64,7 +63,7 @@ index 6849637..10f9a57 100644
  
      /* General I/O */
      SCMP_SYS(_newselect),
-@@ -600,7 +595,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+@@ -605,7 +600,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
  #ifdef __NR_futex_time64
      SCMP_SYS(futex_time64),
  #endif
@@ -72,7 +71,7 @@ index 6849637..10f9a57 100644
      SCMP_SYS(set_robust_list),
      SCMP_SYS(write),
      SCMP_SYS(writev),
-@@ -609,6 +603,15 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+@@ -614,6 +608,15 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
      SCMP_SYS(getrandom),
      SCMP_SYS(sysinfo),
      SCMP_SYS(uname),
diff --git a/meta-networking/recipes-support/chrony/chrony_4.6.1.bb b/meta-networking/recipes-support/chrony/chrony_4.7.bb
similarity index 98%
rename from meta-networking/recipes-support/chrony/chrony_4.6.1.bb
rename to meta-networking/recipes-support/chrony/chrony_4.7.bb
index 5ac3e6d37e..0af542869e 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.6.1.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.7.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://chrony-project.org/releases/chrony-${PV}.tar.gz \
 SRC_URI:append:libc-musl = " \
     file://0001-Fix-compilation-with-musl.patch \
 "
-SRC_URI[sha256sum] = "571ff73fbf0ae3097f0604eca2e00b1d8bb2e91affe1a3494785ff21d6199c5c"
+SRC_URI[sha256sum] = "c0de41a8c051e5d32b101b5f7014b98ca978b18e592f30ce6840b6d4602d947b"
 
 DEPENDS = "pps-tools"
 
-- 
2.43.0


