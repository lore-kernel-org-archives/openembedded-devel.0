Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC11E75436
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:14:20 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.117305.1766567651911460820
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:14:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EJMTklJy;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567654; x=1798103654;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d8oUI0gqD/tvRZv4ebpj6XsBeHOzph7wA+caCkEFX7Y=;
  b=EJMTklJyXc0lzBJVF2VEKO+uViC9XTLccMIgPyRR3fXji/LNrA9op+MC
   JqO30AT53xN7mzGoHiUahrGcNOoH+Qs4narOu3lrCNBxaimLyYsmXB5pV
   YcG4LtXLSKCOJ5gzPgAiF+bzUQajggb83hWZ8qCluYQOmWpHnMBMTtZyC
   ib0cpc1D1RFdHo1fPjJJEShRsu41JBV56Le+I6XGS5wc8PMEs59P0UtiW
   TgM5lTrOpLqH5MPEc+du6mVjZ/e5UaJ+ZhK+BDS0givGg0e8YurARtNig
   mGqhCISAIYLwrLSmJOiq5/D6CA8XVE6RnQiQXoZzw5QpteBcJWyeeuHdi
   g==;
X-CSE-ConnectionGUID: xEkbNTU0Q/GRpGO9OJ4rzQ==
X-CSE-MsgGUID: n/UU00LESQeXT0leXHzZqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="202625828"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="202625828"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:14:14 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 4F7231C1C72C
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:14 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 020BD140123D
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 355DB2000763;
	Wed, 24 Dec 2025 09:14:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 11/28] nbdkit: upgrade 1.45.15 -> 1.46.0
Date: Wed, 24 Dec 2025 17:12:47 +0800
Message-ID: <20251224091304.974-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122861

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.45.15.bb => nbdkit_1.46.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.45.15.bb => nbdkit_1.46.0.bb} (96%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.45.15.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.46.0.bb
similarity index 96%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.45.15.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.46.0.bb
index 8d820ee636..48df99cc9b 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.45.15.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.46.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=master;tag=v${PV} \
            file://0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch \
            "
-SRCREV = "d50245af5b76f71c0659d981aeefc5fdc1de621d"
+SRCREV = "8c660cbf507ce6008483ae21c186444aa3dc0f11"
 
 
 DEPENDS = "curl xz e2fsprogs zlib"
-- 
2.43.0


