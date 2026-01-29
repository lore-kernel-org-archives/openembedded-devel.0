Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA77D358E6
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 09:05:45 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11201.1769677540037546852
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jan 2026 01:05:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=g5/VMysy;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769677540; x=1801213540;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ppReyGTSFKTmFqLXwedjZ1wh4CCS/pHgGqkW8g1mmu4=;
  b=g5/VMysyHhowpVCXu38boOeKS/z5V5rNnQpyi5RmiGK9FvQPFIBGSzj0
   +MrX7QZyIQHHoMlknHkV5rgwBdGnZegXVFgt6KorDYKVg2w6iBlT+gTAJ
   MHHiZ/RZrJ+43yNDtnDRaUP5s0jev5YkD2mI1wkG9TU5KgzfeFmCJNOe6
   82PzDrSHcrmM8xhTlpOPLGv2Wqsod+Enm0ltVcqSEcxydPDKXFEeU8cj/
   UDUq+U/8BV/YvwsJ4Ur+xSK0lBv+z7FLFUEzzBAtIZHUVHdUA8K6vvIP+
   pcKjfmndcZjg5WX29w3NDkoHAU5eAcdqqVCWSakbAMQuh3CtpIYv+Ovxy
   g==;
X-CSE-ConnectionGUID: yVgr1et5Q/G6PEWg2X6Guw==
X-CSE-MsgGUID: FYJb2qimQUmW/1mMIETjsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="228358706"
X-IronPort-AV: E=Sophos;i="6.21,260,1763391600"; 
   d="scan'208";a="228358706"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 18:05:38 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 2577AC00554
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 09:05:38 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id CFDE1181AA60
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 09:05:37 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 7857818076F5
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 09:05:35 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] multipath-tools: upgrade 0.12.1 -> 0.12.2
Date: Thu, 29 Jan 2026 17:05:25 +0800
Message-ID: <20260129090525.9368-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 09:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123984

1. Changelog
  https://github.com/opensvc/multipath-tools/releases/tag/0.12.2

2. Update 0004-RH-use-rpm-optflags-if-present.patch for 0.12.2

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../0004-RH-use-rpm-optflags-if-present.patch | 21 +++++++++++--------
 ...ls_0.12.1.bb => multipath-tools_0.12.2.bb} |  2 +-
 2 files changed, 13 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-support/multipath-tools/{multipath-tools_0.12.1.bb => multipath-tools_0.12.2.bb} (98%)

diff --git a/meta-oe/recipes-support/multipath-tools/files/0004-RH-use-rpm-optflags-if-present.patch b/meta-oe/recipes-support/multipath-tools/files/0004-RH-use-rpm-optflags-if-present.patch
index 8fad8d5645..1e8b69abf7 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0004-RH-use-rpm-optflags-if-present.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0004-RH-use-rpm-optflags-if-present.patch
@@ -1,6 +1,6 @@
-From c34eca043178e60ff04dc88953a71b36ce9dc1b0 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 26 Nov 2018 09:19:17 +0800
+From 5544371deb70e091e86d07f2755396b8a49729d7 Mon Sep 17 00:00:00 2001
+From: Liu Yiding <liuyd.fnst@fujitsu.com>
+Date: Wed, 28 Jan 2026 09:56:19 +0000
 Subject: [PATCH] RH: use rpm optflags if present
 
 Use the passed in optflags when compiling as an RPM, and keep the
@@ -22,19 +22,22 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 
 Rebase to 0.12.1
 Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+
+Rebase to 0.12.2
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
 ---
  Makefile.inc | 12 ++++++++++--
  1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.inc b/Makefile.inc
-index d04a3175..eb339251 100644
+index 7ca96e58..8e168dc8 100644
 --- a/Makefile.inc
 +++ b/Makefile.inc
-@@ -102,7 +102,15 @@ SYSTEMD_LIBDEPS := $(if $(SYSTEMD),$(if $(shell test $(SYSTEMD) -gt 209 && echo
+@@ -108,7 +108,15 @@ SYSTEMD_LIBDEPS := $(if $(SYSTEMD),$(if $(shell test $(SYSTEMD) -gt 209 && echo
  MODPROBE_UNIT := $(shell test "0$(SYSTEMD)" -lt 245 2>/dev/null || \
  			echo "modprobe@dm_multipath.service")
  
--OPTFLAGS	:= -O2 -g $(STACKPROT) --param=ssp-buffer-size=4
+-OPTFLAGS	:= $(OPT) -g $(STACKPROT) --param=ssp-buffer-size=4
 +ifndef RPM_OPT_FLAGS
 +       OPTFLAGS        := -O2 -g $(STACKPROT) --param=ssp-buffer-size=4
 +else
@@ -47,13 +50,13 @@ index d04a3175..eb339251 100644
  
  # Set WARN_ONLY=1 to avoid compilation erroring out due to warnings. Useful during development.
  WARN_ONLY       :=
-@@ -121,7 +129,7 @@ CPPFLAGS	:= $(FORTIFY_OPT) $(CPPFLAGS) $(D_URCU_VERSION) \
+@@ -127,7 +135,7 @@ CPPFLAGS	:= $(FORTIFY_OPT) $(CPPFLAGS) $(D_URCU_VERSION) $(D_CMOCKA_VERSION) \
  		   -DABSTRACT_SOCKET=\"$(abstract_socket)\" -DPATHNAME_SOCKET=\"$(pathname_socket)\" \
  		   -DWSTRINGOP_TRUNCATION=$(if $(WSTRINGOP_TRUNCATION),1,0) \
  		   -MMD -MP
 -CFLAGS		:= -std=$(C_STD) $(CFLAGS) $(OPTFLAGS) $(WARNFLAGS) -pipe \
-+CFLAGS          := -std=$(C_STD) $(CFLAGS) $(OPTFLAGS) -pipe \
- 		   -fexceptions
++CFLAGS         := -std=$(C_STD) $(CFLAGS) $(OPTFLAGS) -pipe \
+ 		   -fexceptions -fno-strict-aliasing $(if $(ASAN),-fsanitize=address)
  BIN_CFLAGS	:= -fPIE -DPIE
  LIB_CFLAGS	:= -fPIC
 -- 
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.12.1.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.12.2.bb
similarity index 98%
rename from meta-oe/recipes-support/multipath-tools/multipath-tools_0.12.1.bb
rename to meta-oe/recipes-support/multipath-tools/multipath-tools_0.12.2.bb
index 20d9b6a1b5..bfb75718f2 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.12.1.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.12.2.bb
@@ -49,7 +49,7 @@ SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=https;branch=st
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ec28527f3d544b51ceb0e1907d0bf3f"
 
-SRCREV = "a1f7f3d5b4972c39e8950c722a04c21a9e030a31"
+SRCREV = "5bd1163d187520b958d78b85c7b239561dc86192"
 
 
 inherit systemd pkgconfig
-- 
2.43.0


