Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EACCD583B
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:29:34 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3093.1767781767654934721
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:29:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KcBlcP/8;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781767; x=1799317767;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/QZWbjp5h9uhsl/jTXqAZnwCV3N+HSvuZ5/K1H80M14=;
  b=KcBlcP/8txLtNL5lp7lBbO+1fUnKcZ+Jof0PEtbkByzHXBtmkwwjK3z1
   Nn0M275jpF5OkXQqmTTbc2+TWRkNs8FzAVS2iR5z7nbEU1f04l3gPSbc+
   JkRILYkf8PrVzxwtItBi16SZHLJp5Mo7zuU+qb77KsqTXyN22g97AUauD
   bbhUZal4Alfkq+8QeP7dslO6ZMPMehXP/Y8dWIgCEN2szLzb1Vd2qN5y+
   Rctbd7DR0rGB3jBJvNKJcOIYwTRWyi6dzbBk+gkC3861iCA+rmLPfkG1y
   5pLJ5boJijoJqmxRqjptbl2oGPc1lCtg0V73mByWxCEbo0Co3+uFB+EmP
   A==;
X-CSE-ConnectionGUID: WqvpDzGMSna5ydkxKtnicQ==
X-CSE-MsgGUID: qw8opqEUSki0SMsIUN9FKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="225696265"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="225696265"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:29:26 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 2E285820711
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:26 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D9E49896E2E
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 0654C8214C7;
	Wed,  7 Jan 2026 10:29:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 12/24] nbdkit: upgrade 1.46.0 -> 1.47.1
Date: Wed,  7 Jan 2026 18:28:43 +0800
Message-ID: <20260107102855.228-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107102855.228-1-wangmy@fujitsu.com>
References: <20260107102855.228-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123210

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.46.0.bb => nbdkit_1.47.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.46.0.bb => nbdkit_1.47.1.bb} (96%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.46.0.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.47.1.bb
similarity index 96%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.46.0.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.47.1.bb
index 48df99cc9b..61390ebde6 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.46.0.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.47.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=master;tag=v${PV} \
            file://0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch \
            "
-SRCREV = "8c660cbf507ce6008483ae21c186444aa3dc0f11"
+SRCREV = "1f9447313193723a626ba39e7b54d1c7c1a1ffd8"
 
 
 DEPENDS = "curl xz e2fsprogs zlib"
-- 
2.43.0


