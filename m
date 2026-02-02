Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67149E7314B
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 09:05:36 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48687.1770023130768087030
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 01:05:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=S4qxaVb+;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770023129; x=1801559129;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zztP/AQQPHQjfX8k6bY1LXmeB5LdyYbkxDBnJMVPgII=;
  b=S4qxaVb+U30U0oQF02c06xyVPP2SlAPpPBilk1BnUYAtRdPVOw59hOJA
   HNdhyJkyyMD2Q2v3OufNHoURcB2A+h4dphnedEfRwBs3v0ebhObfRyYJ+
   dh3Ls6nKZG0bEWDyphzAx9a9V9p7p18c8BDpgQf/x3HLzjuOO3tldIgoK
   VZBM2Yyo/4PJK0Ta3+7tbbxkXx8xVfMHNddwRMvd9upaKGiSIOJrDHRlh
   GSNzwNc5EQvgacvyUzlikazH9Pt2o8vMXwKtiPueGctNH0hr9y4fRLvPS
   KCuP03ix/dd5A3rqX8lZnbpM9OWAqpVSXIzrkhvkoqH5HA/RFQiwsmC1W
   Q==;
X-CSE-ConnectionGUID: P7BUVP8ZRjG6PMmce70DOA==
X-CSE-MsgGUID: SACeJDXTSLq+4/6IcZ07dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="228131756"
X-IronPort-AV: E=Sophos;i="6.21,268,1763391600"; 
   d="scan'208";a="228131756"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 18:05:27 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id E54DC1C0009A
	for <openembedded-devel@lists.openembedded.org>; Mon,  2 Feb 2026 09:05:28 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 99CF81003BC4
	for <openembedded-devel@lists.openembedded.org>; Mon,  2 Feb 2026 09:05:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 0D0661401871;
	Mon,  2 Feb 2026 09:05:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 2/3] cryptsetup: upgrade 2.8.3 -> 2.8.4
Date: Mon,  2 Feb 2026 17:04:08 +0800
Message-ID: <20260202090409.1251-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260202090409.1251-1-wangmy@fujitsu.com>
References: <20260202090409.1251-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 09:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124056

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cryptsetup/{cryptsetup_2.8.3.bb => cryptsetup_2.8.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.8.3.bb => cryptsetup_2.8.4.bb} (98%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.3.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.4.bb
similarity index 98%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.3.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.4.bb
index 44bf66c1ed..34755fc3ad 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.3.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.4.bb
@@ -24,7 +24,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "4a8a23b8b9d1a3250452e40acead4421a03e45a38954ad0595634f4266aa800f"
+SRC_URI[sha256sum] = "443e46f8964c9acc780f455afbb8e23aa0e8ed7ec504cfc59e04f406fa1e8a83"
 
 inherit autotools gettext pkgconfig
 
-- 
2.43.0


