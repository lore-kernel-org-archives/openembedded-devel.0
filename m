Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B2F8D6CFCD
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 05:23:35 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61523.1769145806490162569
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 21:23:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nvoByIi3;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769145805; x=1800681805;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J89t6UB83TC4mEBI72Zlfcwk8WjokroWlwA8gFi4dXo=;
  b=nvoByIi35P2tFK7iM1ZxKvRjDESzCQsUenGnwt3L32b56Rbdmr8JaSRa
   i1EQjLsmfhI9+8xr2kMTiUZsaFSDFA8sBg2QRyle4aRqdZqAwDpg01PTg
   oV145crB40u/M+s6B/ggbgqLc2xC+vBCldk36KUOsvJaa1efw16JGp52B
   39EoAhdhLmroKIjFPMAY1KnRbUD9IYmExK6Kyg4lEpGA8lCN/NRX67Vuj
   RY/E1tujzR3XtbwPKoK9AiPJGZHyghajnPTzIYgsM5BmoloTqVB8D30CW
   Oe+n3wqsngMnjtYNsMhWgNJyt+JuFFdHL7XV3EJGJm6irvuZ/XZPsM9El
   A==;
X-CSE-ConnectionGUID: 93QrFB8ISyOdR34Rl6+diQ==
X-CSE-MsgGUID: 2xnFBOW/TWSDrskHzm7TQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="205778396"
X-IronPort-AV: E=Sophos;i="6.21,247,1763391600"; 
   d="scan'208";a="205778396"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 14:23:23 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id E471D100036C
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 05:23:24 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 93E021804162
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 05:23:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 18F142005D3E;
	Fri, 23 Jan 2026 05:23:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] pahole: upgrade 1.29 -> 1.31
Date: Fri, 23 Jan 2026 13:23:12 +0800
Message-ID: <20260123052312.958-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260123052312.958-1-wangmy@fujitsu.com>
References: <20260123052312.958-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 05:23:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123762

From: Wang Mingyu <wangmy@fujitsu.com>

0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
revemoed since it's included in 1.31

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...r-Fix-elf_functions-cleanup-on-error.patch | 54 -------------------
 .../pahole/{pahole_1.29.bb => pahole_1.31.bb} |  6 +--
 2 files changed, 3 insertions(+), 57 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
 rename meta-oe/recipes-devtools/pahole/{pahole_1.29.bb => pahole_1.31.bb} (87%)

diff --git a/meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch b/meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
deleted file mode 100644
index dad5a9646a..0000000000
--- a/meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 6fa2b7de3e647e64c5d693aea7f3bacbfa964f53 Mon Sep 17 00:00:00 2001
-From: Ihor Solodari <ihor.solodrai@linux.dev>
-Date: Wed, 20 Aug 2025 09:00:03 +0100
-Subject: [PATCH] btf_encoder: Fix elf_functions cleanup on error
-
-When elf_functions__new() errors out and jumps to
-elf_functions__delete(), pahole segfaults on attempt to list_del() the
-elf_functions instance from a list, to which it was never added.
-
-Fix this by moving list_del() call out of elf_functions__delete().
-Remove from the list only on normal cleanup in
-elf_functions_list__clear().
-
-v1:
-https://lore.kernel.org/dwarves/979a1ac4-21d3-4384-8ce4-d10f41887088@linux.dev/
-
-Closes:
-https://lore.kernel.org/dwarves/24bcc853-533c-42ab-bc37-0c13e0baa217@windriver.com/
-Reported-by: Changqing Li <changqing.li@windriver.com>
-Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
-Reviewed-by: Arnaldo Carvalho de Melo <acme@redhat.com>
-Link: https://lore.kernel.org/dwarves/acef4a0e-7d3b-4e05-b3ca-1007580f2754@linux.dev/
-Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/devel/pahole/pahole.git/commit/?h=next&id=fe6738f4b46b63dcdc5b15b252a014b3eaba16a4]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- btf_encoder.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/btf_encoder.c b/btf_encoder.c
-index 511c1ea..2f8c6bb 100644
---- a/btf_encoder.c
-+++ b/btf_encoder.c
-@@ -162,7 +162,6 @@ static inline void elf_functions__delete(struct elf_functions *funcs)
- 		free(funcs->entries[i].alias);
- 	free(funcs->entries);
- 	elf_symtab__delete(funcs->symtab);
--	list_del(&funcs->node);
- 	free(funcs);
- }
- 
-@@ -204,6 +203,7 @@ static inline void elf_functions_list__clear(struct list_head *elf_functions_lis
- 
- 	list_for_each_safe(pos, tmp, elf_functions_list) {
- 		funcs = list_entry(pos, struct elf_functions, node);
-+		list_del(&funcs->node);
- 		elf_functions__delete(funcs);
- 	}
- }
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.29.bb b/meta-oe/recipes-devtools/pahole/pahole_1.31.bb
similarity index 87%
rename from meta-oe/recipes-devtools/pahole/pahole_1.29.bb
rename to meta-oe/recipes-devtools/pahole/pahole_1.31.bb
index 4f2737767b..62f053b6aa 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.31.bb
@@ -9,10 +9,10 @@ DEPENDS = "elfutils zlib libbpf"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"
 
-SRCREV = "b9cc7963051b2099795129450f9b70c81950d02f"
-SRC_URI = "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=master \
+SRCREV = "1f2805b6eef104df3125143c949b391f6122e5b9"
+SRC_URI = "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=master;tag=v${PV} \
            file://0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch \
-           file://0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch"
+           "
 
 
 inherit cmake pkgconfig
-- 
2.43.0


