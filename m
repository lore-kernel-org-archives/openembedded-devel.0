Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A77D11700
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:51:59 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4286.1764669111694648950
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:51:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CWYXPyLy;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669112; x=1796205112;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3IRN4p3JQLqrk7xfTViQteIybsZ4D5l10raWUErCf7E=;
  b=CWYXPyLyq8uV7PHXfwqTpz2RnlMcxIC9wlMoyWOgJ00ClekmUAo0TzMW
   mrti1gvfxxN5POC6XCoWqGOhy8uhd9VbiaszGXVPbySSUPFpsVzxVMvtI
   Anm9wLhonEDKkGivXhB5hLOgE/2iUAaKK74OPGb0VCbBG2ZAl3BphoXEA
   cP4oiNvraPHpVoW9Ulx/yym3KoO8oex6Og371c9XbjVXxoVseUc64zHgU
   cafDdK6RolZlhC3RaAyIsg3F4oSimPcK+ZhMeEwDZmuBNmaZD/bgYsNXN
   dfSYynsR/Zd0lxVRf6IzowILfzCKmGJj8q039J0yxt6dhnOXG+5zjFzal
   w==;
X-CSE-ConnectionGUID: Fn1UWdmtTKKHJZ1RWZza0Q==
X-CSE-MsgGUID: G5bTq/wZSxext6qg9HTjHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="200027972"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="200027972"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:51:51 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id C1B5A42A316
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:51:51 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 796FA180199E
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:51:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 12246101A432;
	Tue,  2 Dec 2025 09:51:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/25] parallel: upgrade 20251022 -> 20251122
Date: Tue,  2 Dec 2025 17:51:13 +0800
Message-ID: <20251202095132.652-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122239

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../parallel/{parallel_20251022.bb => parallel_20251122.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20251022.bb => parallel_20251122.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20251022.bb b/meta-oe/recipes-extended/parallel/parallel_20251122.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20251022.bb
rename to meta-oe/recipes-extended/parallel/parallel_20251122.bb
index 9fa1b6052d..c2775472d7 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20251022.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20251122.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "474326d59688d2fc078cf89a7b0b4a11cc9684229b3fa0158fe8bc03f1b69ee1"
+SRC_URI[sha256sum] = "368d1982cfd9dbebb8cd0e444de6199559df94ac2dd1edf95f74350f0af1e84d"
 
 inherit autotools bash-completion
 
-- 
2.43.0


