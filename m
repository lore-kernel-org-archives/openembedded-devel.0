Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F9CCD4F54
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:48:52 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16932.1779875328565226714
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OfJ22dXI;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875329; x=1811411329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pnZaHtSMDZHFbPINpXVWOhth4Zc13a77mVZF2pq9VzA=;
  b=OfJ22dXISPNH7yaV1jJd4Se4/HfgOL13Tfwa44TWdnSnq+kVCDM8rn0p
   eFJtLfoEsdjwETk8Pfo87kqdwtplztU0fCcyINMcqDtAhG1si7wXDEvqd
   FH/Uk3aEVVStPB2C8EDdU2pb87fTw0+K0ZM/+ZUfAMlaz7pBqgI76BjXo
   e98SwL5yAM9AAK4Mzvk+bPlkRVRRGGwXz+xgTayqBOC0eM1GHXnnzQDfy
   lXlsF3jeGZxlmLxXUrA8xT8+0EEW0B1bHsQT+P1FbVF2P//HxdqbS2Oys
   v3KARszw22N+X7Ydc4eculc+HLOHjJeyRqfp30bDN8aOiHDxrgyRW9nVQ
   Q==;
X-CSE-ConnectionGUID: qc37ZyjxRme3cNkblm/INw==
X-CSE-MsgGUID: qIkQBiKnTCyuiUvoJ/lkMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="229391880"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="229391880"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:48:47 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0520FADA4
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:47 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id A75B31C135FF
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id BD09082A2CC;
	Wed, 27 May 2026 09:48:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 17/56] nbdkit: upgrade 1.47.8 -> 1.47.9
Date: Wed, 27 May 2026 17:47:26 +0800
Message-ID: <20260527094805.2039-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127224

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.47.8.bb => nbdkit_1.47.9.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.47.8.bb => nbdkit_1.47.9.bb} (96%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.47.8.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.47.9.bb
similarity index 96%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.47.8.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.47.9.bb
index e0fee3fdf0..5c6c0a2e64 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.47.8.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.47.9.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=master;tag=v${PV} \
            file://0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch \
            "
-SRCREV = "83f13d978d9959bd3e92c54af9980a8d3ceed768"
+SRCREV = "714956cc9901c752598a214ae72fc69a897cd3b9"
 
 
 DEPENDS = "curl xz e2fsprogs zlib"
-- 
2.43.0


