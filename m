Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66FAFE7543A
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:14:20 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.117307.1766567657669203651
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:14:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=e7uCFUPb;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567658; x=1798103658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B89y+ks4CG/P1RZ1Xi3sFEP9S/LSA/11evKcdCzIbcw=;
  b=e7uCFUPb6RNsFxlOlsuHXrTTfMfQKCYsFYYZEe6g8alkSpbd93fgwaop
   9lyM9Q+plcaU0fRfwReOsV/4IbPKS6BGeiO9B/Bcp+2QUKwFZxdPNHdHz
   699A3piDYPKExZarYhD5cT4ZoB6j1dduBRzoDckeAnl0yFE5mfqXduLTG
   K3hZx4Bun2HYj4JLqtUUHBDMgsyO8ElmJxvgh/taXu7mfGP8/lIB8prWm
   ZByvU+4ZDn4J9hTl1uyxl+Q5FrPL9RIUs95kyGz1yDCfd6W6nfMprnw8l
   qtMew0tWxxh1e5ZRBJ3Y++7l4AIpfIKY+8MoMIKK3R71EWPhqFaR0pWr5
   w==;
X-CSE-ConnectionGUID: MfHx/QJVSfe/+LIYuXv2RA==
X-CSE-MsgGUID: 65f0b+XtRtKIKJG6SwP4Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="227738292"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="227738292"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:14:16 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 40BFD674A
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:16 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E30B31C000C0
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 3E07920000D9;
	Wed, 24 Dec 2025 09:14:12 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/28] python3-apt: upgrade 3.0.0 -> 3.1.0
Date: Wed, 24 Dec 2025 17:12:48 +0800
Message-ID: <20251224091304.974-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122862

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-apt_3.0.0.bb => python3-apt_3.1.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-apt_3.0.0.bb => python3-apt_3.1.0.bb} (92%)

diff --git a/meta-oe/recipes-devtools/python/python3-apt_3.0.0.bb b/meta-oe/recipes-devtools/python/python3-apt_3.1.0.bb
similarity index 92%
rename from meta-oe/recipes-devtools/python/python3-apt_3.0.0.bb
rename to meta-oe/recipes-devtools/python/python3-apt_3.1.0.bb
index 561a1c619a..09c4dfbf67 100644
--- a/meta-oe/recipes-devtools/python/python3-apt_3.0.0.bb
+++ b/meta-oe/recipes-devtools/python/python3-apt_3.1.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://debian/copyright;md5=4ed7b6862ca422678b17e7d4ed592285"
 
 SRC_URI = "git://salsa.debian.org/apt-team/python-apt.git;protocol=https;branch=main"
-SRCREV = "626bf176c1844b63973d39bcceb0202ad36da797"
+SRCREV = "d44043b6df5cb010f3496fc31033c0b6e1f4f021"
 
 # this is env var is used by setup.py - if not present, it
 # tries to run dpkg to get this info
-- 
2.43.0


