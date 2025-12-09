Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B79D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 07:02:29 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2026.1765263745740875196
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 23:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tNvkh85J;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765263745; x=1796799745;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MK4ji0VH/GP6Q1hlStBWHAmG7DVNeVUWTIARovP7KGg=;
  b=tNvkh85Jr8xrcwFTt8Z2jd8Top9qkEH2eftWsL9D0pT6b4axg7bjxbP6
   8gNF7VFNacbbSZP6ix8r5hUfQvp0E0hGhKsNLQOkOyVMHk0Swu+8PCfnq
   v0BYvzLPUAjSZHfJReKV7AbzwQ1PYQPSeJUN91XE1ywwna6JaeciqdRPI
   CzBtdTYGvXjBOMS5ek98Va1vO0qrFMNcAjpGbzp8iQ6MwYPbxwPoMPQOs
   +aeX7rQ2ERPPTdyTWRVP4gN+RdtZ4NG7qgjXZf0vhsM1dS69r+xgMu3Or
   4h+StIYodqcya7SUbk0V1n2X1W9cz8piO2awb+Zjw/x4ZCRB5LUBRN7pg
   g==;
X-CSE-ConnectionGUID: kHr5ZxQPT7yj7W4fn2GoOw==
X-CSE-MsgGUID: Bk0PJ+4iR0CkMXT1nNDh4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="209929817"
X-IronPort-AV: E=Sophos;i="6.20,260,1758553200"; 
   d="scan'208";a="209929817"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 16:02:24 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 2E35AC00346
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 07:02:24 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id DA931C000AB
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 07:02:23 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id BBF3A100061E
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 07:02:21 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 2/3] multipath-tools: upgrade 0.11.3 -> 0.12.1
Date: Tue,  9 Dec 2025 15:02:15 +0800
Message-ID: <20251209070215.22468-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 07:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122400

Update 0004-RH-use-rpm-optflags-if-present.patch for 0.12.1.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../0004-RH-use-rpm-optflags-if-present.patch | 24 ++++++++++++-------
 ...ls_0.11.3.bb => multipath-tools_0.12.1.bb} |  4 ++--
 2 files changed, 17 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-support/multipath-tools/{multipath-tools_0.11.3.bb => multipath-tools_0.12.1.bb} (98%)

diff --git a/meta-oe/recipes-support/multipath-tools/files/0004-RH-use-rpm-optflags-if-present.patch b/meta-oe/recipes-support/multipath-tools/files/0004-RH-use-rpm-optflags-if-present.patch
index 5f65ceaa29..8fad8d5645 100644
--- a/meta-oe/recipes-support/multipath-tools/files/0004-RH-use-rpm-optflags-if-present.patch
+++ b/meta-oe/recipes-support/multipath-tools/files/0004-RH-use-rpm-optflags-if-present.patch
@@ -19,23 +19,26 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
 Rebase to 0.10.0
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+Rebase to 0.12.1
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
 ---
  Makefile.inc | 12 ++++++++++--
  1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.inc b/Makefile.inc
-index 596e68c0..42766867 100644
+index d04a3175..eb339251 100644
 --- a/Makefile.inc
 +++ b/Makefile.inc
-@@ -99,7 +99,15 @@ SYSTEMD_LIBDEPS := $(if $(SYSTEMD),$(if $(shell test $(SYSTEMD) -gt 209 && echo
+@@ -102,7 +102,15 @@ SYSTEMD_LIBDEPS := $(if $(SYSTEMD),$(if $(shell test $(SYSTEMD) -gt 209 && echo
  MODPROBE_UNIT := $(shell test "0$(SYSTEMD)" -lt 245 2>/dev/null || \
  			echo "modprobe@dm_multipath.service")
  
 -OPTFLAGS	:= -O2 -g $(STACKPROT) --param=ssp-buffer-size=4
 +ifndef RPM_OPT_FLAGS
-+	OPTFLAGS	:= -O2 -g $(STACKPROT) --param=ssp-buffer-size=4
++       OPTFLAGS        := -O2 -g $(STACKPROT) --param=ssp-buffer-size=4
 +else
-+	OPTFLAGS = $(RPM_OPT_FLAGS)
++       OPTFLAGS = $(RPM_OPT_FLAGS)
 +endif
 +OPTFLAGS       += -Wextra -Wstrict-prototypes -Wformat=0 -Werror=implicit-int \
 +                  -Werror=implicit-function-declaration -Wno-sign-compare \
@@ -44,12 +47,15 @@ index 596e68c0..42766867 100644
  
  # Set WARN_ONLY=1 to avoid compilation erroring out due to warnings. Useful during development.
  WARN_ONLY       :=
-@@ -115,7 +123,7 @@ CPPFLAGS	:= $(FORTIFY_OPT) $(CPPFLAGS) $(D_URCU_VERSION) \
- 		   -DRUNTIME_DIR=\"$(runtimedir)\" -DCONFIG_DIR=\"$(TGTDIR)$(configdir)\" \
- 		   -DDEFAULT_CONFIGFILE=\"$(TGTDIR)$(configfile)\" -DSTATE_DIR=\"$(TGTDIR)$(statedir)\" \
- 		   -DEXTRAVERSION=\"$(EXTRAVERSION)\" -MMD -MP
+@@ -121,7 +129,7 @@ CPPFLAGS	:= $(FORTIFY_OPT) $(CPPFLAGS) $(D_URCU_VERSION) \
+ 		   -DABSTRACT_SOCKET=\"$(abstract_socket)\" -DPATHNAME_SOCKET=\"$(pathname_socket)\" \
+ 		   -DWSTRINGOP_TRUNCATION=$(if $(WSTRINGOP_TRUNCATION),1,0) \
+ 		   -MMD -MP
 -CFLAGS		:= -std=$(C_STD) $(CFLAGS) $(OPTFLAGS) $(WARNFLAGS) -pipe \
-+CFLAGS		:= -std=$(C_STD) $(CFLAGS) $(OPTFLAGS) -pipe \
++CFLAGS          := -std=$(C_STD) $(CFLAGS) $(OPTFLAGS) -pipe \
  		   -fexceptions
  BIN_CFLAGS	:= -fPIE -DPIE
  LIB_CFLAGS	:= -fPIC
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.3.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.12.1.bb
similarity index 98%
rename from meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.3.bb
rename to meta-oe/recipes-support/multipath-tools/multipath-tools_0.12.1.bb
index 8e26d4c2a8..20d9b6a1b5 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.3.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.12.1.bb
@@ -29,7 +29,7 @@ DEPENDS = "libdevmapper \
 
 LICENSE = "GPL-2.0-only"
 
-SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=https;branch=stable-0.11.y \
+SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=https;branch=stable-0.12.y \
            file://multipathd.oe \
            file://multipath.conf.example \
            file://0001-RH-fixup-udev-rules-for-redhat.patch \
@@ -49,7 +49,7 @@ SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=https;branch=st
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ec28527f3d544b51ceb0e1907d0bf3f"
 
-SRCREV = "7a84cc602ea0884ae0c767e6c89592059012db04"
+SRCREV = "a1f7f3d5b4972c39e8950c722a04c21a9e030a31"
 
 
 inherit systemd pkgconfig
-- 
2.43.0


