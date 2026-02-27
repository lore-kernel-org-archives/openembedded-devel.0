Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2868FD7F8D
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:40 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92757.1772187332391460657
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:15:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DpAwTUrf;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187333; x=1803723333;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AwQafBWBLhY9Ik9P3RRMmbD6/x1GD08DJv5NtJYzFTw=;
  b=DpAwTUrf0CjYc8IaY9Rqf7kQuZomtNfXnfbup9h7A7iorDiqY1C7TgB0
   d0X5zCqfcPVK8MiKHGFKXWiT8F1Ll3O6OTnBmd6Am2lvG2SejywsLgRSA
   L9tHlTCxpKRnCV2I6gVmMDOuGb9OEJAmaCdnjBf+ftsfcdSshK8VSt3nx
   Ud4qRNN4ejPoulxn1EkyuYu5eiHQLKyvNc/ujIwkBK0nMZQN5vp0ltukE
   8f/slTmjRfzziTfgizlOjsW2q6rDKPOxuOpKDTZqevQAuj6SNb07z7m3v
   qgEznWOvCB7CHXg7+eUrDKSTptSj2b6suOVMwqa/tM/NfyKha3wfzrkGh
   g==;
X-CSE-ConnectionGUID: QnxG/NDBQAuKnl/znE18rg==
X-CSE-MsgGUID: eczk6057S5ywcywFOacRxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="210131652"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="210131652"
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.fujitsu.com (Postfix) with ESMTPS id EE2E78203D5
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:32 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id A4DCF1400138
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id BBBA518005CE;
	Fri, 27 Feb 2026 10:15:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 44/52] thingsboard-gateway: upgrade 3.8.0 -> 3.8.2
Date: Fri, 27 Feb 2026 18:13:19 +0800
Message-ID: <20260227101327.1432-44-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124744

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hingsboard-gateway_3.8.0.bb => thingsboard-gateway_3.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/{thingsboard-gateway_3.8.0.bb => thingsboard-gateway_3.8.2.bb} (98%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.2.bb
similarity index 98%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.0.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.2.bb
index 3398ad9361..1b619120f3 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.8.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://thingsboard.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRCREV = "4215a302c649f8fe3739814e365b0d6af722b66b"
+SRCREV = "d3d58c848a53403e5468e1a55ff03c44e7c70a39"
 PYPI_SRC_URI = "git://github.com/thingsboard/${BPN};protocol=https;branch=master;tag=${PV}"
 PYPI_PACKAGE = "thingsboard-gateway"
 
-- 
2.43.0


