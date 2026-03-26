Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0844E106F30C
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 09:09:11 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43246.1774516141190797753
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 02:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VAYlQGub;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774516141; x=1806052141;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VJ/AXH7oW1HW+w5gQaBKtp+HaxQOiZepCiSEOAIvBbI=;
  b=VAYlQGubx6FPBZYzu8JVDd0x6Hk8eWYLdXnvzjJNl6d36fsY68CaXfSl
   Zxa2yh3G+BvpTL45OC4+pDQFW69HwoU3JaNuFuMY7x6O6ocjloMVrG13K
   tEo31BE6neKCPC2L88xl6e4A2hBx1T50+RujQhGhrOgu95czJmiTgpFPm
   PlcoYhEAz2PcbgVPjLHXCVQhSnemFQKUyer9dRqOQYohffEVTgsMOIpQn
   QodUcnN9f3Ac7g6nc+SWlLthJpnyQjlJU9FpSzvsXulXjNBT575zPIIcL
   LjJdWwtZCIR0+u1HBiw+4XAwK+7z2bTuaNWhzYfYWJBjAyVRhQ1PHH11z
   w==;
X-CSE-ConnectionGUID: sPQ3ZyL2SoyszMbKCiJk0g==
X-CSE-MsgGUID: /AeucUDoQcipsUELfi/YEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="222167129"
X-IronPort-AV: E=Sophos;i="6.23,141,1770562800"; 
   d="scan'208";a="222167129"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 18:08:59 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 8A5195C1C
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 09:08:59 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3C4F31C135E7
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 09:08:59 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 06E461017307
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 09:08:56 +0000 (UTC)
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] openct: Fix openct.service waring
Date: Thu, 26 Mar 2026 17:08:49 +0800
Message-ID: <20260326090850.6525-1-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 09:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125639

Fix following system unsafe waring

/usr/lib/systemd/system/openct.service:10: Unit uses KillMode=none. This is unsafe, as it disables systemd's process lifecycle management for the service. Please update the service to use a safer KillMode=, such as 'mixed' or 'control-group'. Support for KillMode=none is deprecated and will eventually be removed.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-support/openct/openct/openct.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/openct/openct/openct.service b/meta-oe/recipes-support/openct/openct/openct.service
index c9ec497fa5..57de8c0a88 100644
--- a/meta-oe/recipes-support/openct/openct/openct.service
+++ b/meta-oe/recipes-support/openct/openct/openct.service
@@ -7,7 +7,7 @@ EnvironmentFile=-/etc/sysconfig/openct
 ExecStart=/usr/sbin/openct-control $OPENCT_OPTIONS init 
 ExecStop=/usr/sbin/openct-control $OPENCT_OPTIONS shutdown
 RemainAfterExit=yes
-KillMode=none
+KillMode=mixed
 
 [Install]
 WantedBy=multi-user.target
-- 
2.43.0


