Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D472FC44507
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:29:50 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9489.1768994980421940619
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:29:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LLv1ugZs;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768994981; x=1800530981;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0UoKF7a7ohcBoHIsiBZmnBMIFOAUG4PNndXuX6Bv+NI=;
  b=LLv1ugZsQrMvZfQwGgpyacHgleyICgOAjCJTN4obEgRk/tV4XAXnBR8X
   3JFTJUWDbmsxLBMdNZGGFpL1+Ir+gZ9m8MTu5zjB/DszzmUwMOBhqrXWJ
   GXHY9nVSxQncHFykAiOFLUl1PZqcKWLWO5izTQlstIT4U6dAllEpCZXxG
   l/9R+Nsas4jYwxyNL0H5W+6O0h0yO78rWF1GGVrQlhssAe63sDZ7gZu0G
   ZKVPSu6qfY97w5rsp+JqH4wAjjeqTevaxzgN0ib5lOykbGBura5kmGKvF
   AwT0WUdF/8x2oQQGYZMfos1SrqoZ5cDvQ8zMvFp3PW+axHWdkHxUIDC6O
   A==;
X-CSE-ConnectionGUID: MM7bD1iOQaqulevCAeT8eQ==
X-CSE-MsgGUID: HhIilDHmQjWvPeu7xmsHsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="226586155"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="226586155"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:29:39 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id BFA474075C5
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:38 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 73023C012BA
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id C9FBF140486D;
	Wed, 21 Jan 2026 11:29:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/30] pahole: upgrade 1.29 -> 1.31
Date: Wed, 21 Jan 2026 19:28:55 +0800
Message-ID: <20260121112921.857-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123695

From: Wang Mingyu <wangmy@fujitsu.com>

0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
revemoed since it's included in 1.31

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...r-Fix-elf_functions-cleanup-on-error.patch | 54 -------------------
 .../pahole/{pahole_1.29.bb => pahole_1.31.bb} |  4 +-
 2 files changed, 2 insertions(+), 56 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
 rename meta-oe/recipes-devtools/pahole/{pahole_1.29.bb => pahole_1.31.bb} (88%)

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
similarity index 88%
rename from meta-oe/recipes-devtools/pahole/pahole_1.29.bb
rename to meta-oe/recipes-devtools/pahole/pahole_1.31.bb
index 4f2737767b..ea4237c4aa 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.31.bb
@@ -9,10 +9,10 @@ DEPENDS = "elfutils zlib libbpf"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"
 
-SRCREV = "b9cc7963051b2099795129450f9b70c81950d02f"
+SRCREV = "1f2805b6eef104df3125143c949b391f6122e5b9"
 SRC_URI = "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=master \
            file://0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch \
-           file://0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch"
+           "
 
 
 inherit cmake pkgconfig
-- 
2.43.0


