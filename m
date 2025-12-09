Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E6AD3B7FB
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:56:40 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4128.1765274195090261184
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GcqYyesu;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274195; x=1796810195;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qIdS2WWJzM18gTeLx7epJaginYvDV/7wVv8/GGJ8b1Y=;
  b=GcqYyesuXoGHca4DwBu8fvbIdyayojmgax1FMC3gRRHYr+nAeY/kpSkf
   kcG+cSp07na57wbBE52t+YrPe6cjnV8WYhmJEh+dcggS+ZWrnF1UBGz72
   aZF4CLZRg5bcC+gZCAY/aB/vb04koIeEj3xLecd4DLfyXxJOERL6gc6g1
   7qtv/4VpK4MOp+oQLMUzPxeWyQ9Jf02IzEhpFnjZCSlh7MwEoXjlWDp/y
   vT9+cNv1U8ixq6Ny/HKHEKFu4/30rF0kmvRa4IqOEsAe3IrPp1hZZUSZO
   Rxegv4q6wImlllyChxY3KSgNrl3krbfIMnb6qzfjwul4G8p7KcomqZmqX
   g==;
X-CSE-ConnectionGUID: +gVDQMVBR/exgGeiOBD73A==
X-CSE-MsgGUID: 5YRVWGcnRhy1pjloE0rVRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="225876888"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="225876888"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:34 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 974FC1002BA3
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:33 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 4B6BA140061D
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id C7EA520002B2;
	Tue,  9 Dec 2025 09:56:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 13/38] nftables: upgrade 1.1.5 -> 1.1.6
Date: Tue,  9 Dec 2025 17:55:27 +0800
Message-ID: <20251209095552.690-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122417

From: Wang Mingyu <wangmy@fujitsu.com>

0001-fix-typo-in-test-script.patch
removed since it's included in 1.1.6

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-fix-typo-in-test-script.patch        | 35 -------------------
 .../{nftables_1.1.5.bb => nftables_1.1.6.bb}  |  5 ++-
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta-networking/recipes-filter/nftables/nftables/0001-fix-typo-in-test-script.patch
 rename meta-networking/recipes-filter/nftables/{nftables_1.1.5.bb => nftables_1.1.6.bb} (96%)

diff --git a/meta-networking/recipes-filter/nftables/nftables/0001-fix-typo-in-test-script.patch b/meta-networking/recipes-filter/nftables/nftables/0001-fix-typo-in-test-script.patch
deleted file mode 100644
index c0d1e33b5e..0000000000
--- a/meta-networking/recipes-filter/nftables/nftables/0001-fix-typo-in-test-script.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 956e7d89865b497f889483c90bc7fed9bec4e030 Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Sun, 26 Oct 2025 18:55:06 +0100
-Subject: [oe] [meta-networking] [PATCH 1/2] fix typo in test script
-
-While executing the test suite from tests/shell/testcases folder, a lot of errors
-are displayed:
-
-tests/shell/testcases/maps/vmap_timeout: line 48: [: : integer expected
-
-Looking at the script, a non-existing variable (expires) is tested instead of
-the existing one (expire).
-
-This change corrects this.
-
-Upstream-Status: Submitted [https://lore.kernel.org/netfilter-devel/20251026204107.2438565-1-skandigraun@gmail.com/T/#u]
-
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- tests/shell/testcases/maps/vmap_timeout | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/shell/testcases/maps/vmap_timeout b/tests/shell/testcases/maps/vmap_timeout
-index 8ac7e8e7..55d1c1b9 100755
---- a/tests/shell/testcases/maps/vmap_timeout
-+++ b/tests/shell/testcases/maps/vmap_timeout
-@@ -45,7 +45,7 @@ for i in $(seq 1 100) ; do
- 		expire=$((RANDOM%utimeout))
- 
- 		expire_str=""
--		if [ "$expires" -gt 0 ]; then
-+		if [ "$expire" -gt 0 ]; then
- 			expire_str="expires ${expire}s"
- 		fi
- 
diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.5.bb b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
similarity index 96%
rename from meta-networking/recipes-filter/nftables/nftables_1.1.5.bb
rename to meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
index 5ae9fc609d..282c73b4fa 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.1.5.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
@@ -12,10 +12,9 @@ DEPENDS = "libmnl libnftnl bison-native \
            ${@bb.utils.contains('PACKAGECONFIG', 'mini-gmp', '', 'gmp', d)}"
 
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
-           file://0001-fix-typo-in-test-script.patch \
            file://run-ptest \
-          "
-SRC_URI[sha256sum] = "1daf10f322e14fd90a017538aaf2c034d7cc1eb1cc418ded47445d714ea168d4"
+           "
+SRC_URI[sha256sum] = "372931bda8556b310636a2f9020adc710f9bab66f47efe0ce90bff800ac2530c"
 
 inherit autotools manpages pkgconfig ptest
 
-- 
2.43.0


