Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D930CCF9F2
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:15:42 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.27241.1761696940399131483
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:15:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dus9spBk;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696941; x=1793232941;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fzO2gmnRteuaRIRyEocxYdJqdLR3weGqZ5m4rVglhos=;
  b=dus9spBkpuwcvuSzjnkg6zL9nqf3iOwLY/UwidfbzJSFbR2MnEPBJfLK
   tsPC8qPlthH+Yb3AqO18ViBifC8G0nVH1/gGd13O9tpqkpqHVXjPiDGqt
   rH3fL4QNXzQvHapQKRms16w2cdWUaXrv1ZvJxXymFGklHBq9wFtvxFtIR
   IwxGl4gmDVF5hLEI4E4yp9s7geB2OW4JQmtbL9MLRj1A0raqaOEeY07c0
   V5eiqpaBefrSe5OcWAcpoU1+a2pvl4OUsXyMgsEIo8DIvZM7M5PBaSiop
   Ew8jyCKtCt5cpYNwSgOx+9hDMQkLGHLKwsPFygwsyLf8GxWnCUQrzggs/
   w==;
X-CSE-ConnectionGUID: MP+nq56xTIK/rqDRcXqDEA==
X-CSE-MsgGUID: WAezY+THSfi+6BfNbarOMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="221094214"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="221094214"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:15:39 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 79668820404
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:38 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 2F5D11400359
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 7BB9B826FD1;
	Wed, 29 Oct 2025 00:15:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 12/32] nbdkit: upgrade 1.45.10 -> 1.45.12
Date: Wed, 29 Oct 2025 08:14:45 +0800
Message-ID: <20251029001505.528-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121118

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.45.10.bb => nbdkit_1.45.12.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.45.10.bb => nbdkit_1.45.12.bb} (96%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.45.10.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.45.12.bb
similarity index 96%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.45.10.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.45.12.bb
index fb961ecd4b..23a7281536 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.45.10.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.45.12.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=master;tag=v${PV} \
            file://0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch \
            "
-SRCREV = "a0f3989aadd2cd473517423422d2fa20def22c95"
+SRCREV = "77182705215dc6f319cfa8eb3500861fbbb9d271"
 
 
 DEPENDS = "curl xz e2fsprogs zlib"
-- 
2.43.0


