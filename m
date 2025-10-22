Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DF4CCD1A5
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:22:59 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.4820.1761099770140278199
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:22:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s+oinGga;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099772; x=1792635772;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=60/IbNfljQ9/+E/WXR0kknYbUXL44KZPBqZi1mJ7WhU=;
  b=s+oinGga3t0lHaWh9gFGT2lLtQAxOJJDeseeQRt6l5B7A+xUXLRFOaET
   CgWCWxlbavMHjgmXagUjQ741z12PfNGzSmvXHzxeKcqz87en3Ht3AyYvC
   Y93TBVExXUUMnlpmhOcCsmUQIoxEjNcC6Rvq+WfZVB2YcT6wK+OXl9Bgm
   PBb4HJQV3D1JHGkALm4AI/wqfsTZaS9oeYlaeKMWCHBjKuZ0qeftmwCyc
   GE8mwigfG29DFUK+1KSgIlTkwJx2YqtIBniZ2etYEDcE6TjzvBZJ1NNiL
   8iPd43F5Wyu4c+dLLjXM255IzCD5Zyi5LMbdb4jn/K0FAnqN0Cuzz2zqJ
   g==;
X-CSE-ConnectionGUID: CCwUhxM4RWeCEQC9H8QMqw==
X-CSE-MsgGUID: iToK1ebsSZC1lKiKIRXLSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="195536262"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="195536262"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:22:52 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id AD0113FD9
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:52 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 6339E1800D7B
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id BF91282C0DE;
	Wed, 22 Oct 2025 02:22:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 10/29] nbdkit: upgrade 1.45.9 -> 1.45.10
Date: Wed, 22 Oct 2025 10:22:06 +0800
Message-ID: <20251022022227.226-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120857

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.45.9.bb => nbdkit_1.45.10.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.45.9.bb => nbdkit_1.45.10.bb} (96%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.45.9.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.45.10.bb
similarity index 96%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.45.9.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.45.10.bb
index fa850e1a28..fb961ecd4b 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.45.9.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.45.10.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=master;tag=v${PV} \
            file://0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch \
            "
-SRCREV = "2e2f933abf4e19842db0fdba2ac4030baea57686"
+SRCREV = "a0f3989aadd2cd473517423422d2fa20def22c95"
 
 
 DEPENDS = "curl xz e2fsprogs zlib"
-- 
2.43.0


