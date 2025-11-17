Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC35CEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 07:51:21 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4644.1763365877680298593
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Nov 2025 23:51:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sm5XSwmN;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763365877; x=1794901877;
  h=from:to:subject:date:message-id;
  bh=j+65wRRm56aO/IT5H+D0kbM4tEeQpFxJyhu6RJ0AboE=;
  b=sm5XSwmN5bflKNPOkt3fMLi9LM2fndZ7kbwexlMhQdDTc9Ybcy1n37rQ
   Is+CBBwO2oPC5Khxqefytr9sW/L3KLF80tjB82Fjj2g97sLhq7TcwSgfU
   EbNKkpp7vdJd5gk3hcgksTcCJ0gvpPqm6LfPOyq34T8KUVkWCGWw5Mit9
   rsZLZFs9tqYdb3a43RIWXq7hNCbA3ZUb8JPALhFc7ELmFaUAKarLvkZiU
   ulCy2wpkd7wmxzI1wsvUOGoqvBfdISnXRIhxA4HhS+nsx7wWzzTLgreiC
   YBY3MnGGMuZgVnMtJk2kv88xhe5kOV7i5GeRFaJP24ayAoEDck4k5NrrW
   A==;
X-CSE-ConnectionGUID: DHd3bzBWS6mlkJAB55sg3w==
X-CSE-MsgGUID: FPaaZ72TR8+ZZ/a1U6W6RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="198441387"
X-IronPort-AV: E=Sophos;i="6.19,311,1754924400"; 
   d="scan'208";a="198441387"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 16:51:15 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id E2EE78204F5
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 07:51:15 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id A5F70180024A
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 07:51:15 +0000 (UTC)
Received: from zhengrq-VirtualBox.fnst-internet.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id E380A1000580
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 07:51:13 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] nspr: upgrade 4.37 -> 4.38
Date: Mon, 17 Nov 2025 15:51:06 +0800
Message-Id: <20251117075106.2656-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 07:51:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121758

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-oe/recipes-support/nspr/{nspr_4.37.bb => nspr_4.38.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nspr/{nspr_4.37.bb => nspr_4.38.bb} (98%)

diff --git a/meta-oe/recipes-support/nspr/nspr_4.37.bb b/meta-oe/recipes-support/nspr/nspr_4.38.bb
similarity index 98%
rename from meta-oe/recipes-support/nspr/nspr_4.37.bb
rename to meta-oe/recipes-support/nspr/nspr_4.38.bb
index 1f7c11a145..b0c03bfc1d 100644
--- a/meta-oe/recipes-support/nspr/nspr_4.37.bb
+++ b/meta-oe/recipes-support/nspr/nspr_4.38.bb
@@ -23,7 +23,7 @@ CACHED_CONFIGUREVARS:append:libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-SRC_URI[sha256sum] = "5f9344ed0e31855bd38f88b33c9d9ab94f70ce547ef3213e488d1520f61840fa"
+SRC_URI[sha256sum] = "72ee73ffcc6ef5e706965f855ecf470ec3986c3e188e12a8a8006e76f6b31a6f"
 
 CVE_PRODUCT = "netscape_portable_runtime"
 
-- 
2.43.0


