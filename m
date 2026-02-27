Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F357FD7F88
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:30 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92470.1772187323491339922
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:15:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Z7U62Vt6;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187323; x=1803723323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tt9MQ1oqvwhJG5Tf3S7tIWhmDQmttltj8ORYkiT/N/4=;
  b=Z7U62Vt6uX23cZfOI1MLzwGTZCL6dmLyKIQbf8cyXZIsDAhpU/GIjg2S
   rJOvplALeXFSafuAZHgd0fCoN7yP/ukjCQDpGCpdBr1FgX4TU669+ZJgR
   7KMe8Bv0FF6w376sJMPEd8dZNggp+B4bPONruGfSDHMNHhzJfM8M2eHwh
   BEg89/krDyzQ5DsKV3j+FEmSYy+vt2QA777uHpttjUCnbD2+wOOPOQMDF
   Ma39iqAYb78T7q7OkO7q11HV9ctn46D011X2iFTa5pfSPDZk0QB1tAix2
   yp1M2x14mB1eVMQ5N/m2PWZ4P5pT5Lo52MeSuEbzRkOU9QVnP6sZsYEiM
   w==;
X-CSE-ConnectionGUID: /aDv6LTRRP2y/NmUXXLQAA==
X-CSE-MsgGUID: iYk8qTTaR2uR86EJDzL2Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="218740630"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="218740630"
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 171707A7F
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:22 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id BF2581C00121
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id E8C6E18005BF;
	Fri, 27 Feb 2026 10:15:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 39/52] ser2net: upgrade 4.6.6 -> 4.6.7
Date: Fri, 27 Feb 2026 18:13:14 +0800
Message-ID: <20260227101327.1432-39-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124739

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ser2net/{ser2net_4.6.6.bb => ser2net_4.6.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.6.6.bb => ser2net_4.6.7.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.6.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.7.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.6.6.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.6.7.bb
index 56ade35bc7..db442e41dc 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.6.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.7.bb
@@ -11,7 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz \
     file://ser2net.service \
 "
 
-SRC_URI[sha256sum] = "a468073c7bf8166c78c61d30bba487916dc4088e98f96e190b37ea8100a94fd4"
+SRC_URI[sha256sum] = "6b921bc7efb1b9a8a78268d63332701902cc1c8dbac51842d46ede6ffb5fa2a4"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.43.0


