Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8BEFD7F69
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:14:30 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92734.1772187267440372079
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:14:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=M2AYtdY9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187268; x=1803723268;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ymWeWh2C9520ZC2M3e83tZznNTRBFewS++hMhusPv9o=;
  b=M2AYtdY9uYaG6qVh0eEpdxpy8/+nxfjTr8n1PZHr0GqTBuBzuATvhHg7
   XQTqUCPQLzVC+f5i/G4Mo0A1eb6XFRTLK8aJLzhNoWOUndb95LnG2mw3u
   XNzQcqCzMb+Qbm8ZEwNdh6WE49ptHqFTpO84+lMrun9EOtIz3PQpunTMx
   igzU9p68CqaAw3zOnbSg6Ql5o2RlYKIfJr83nmUthwjM9yGSD0M5x2kCT
   T716IYixzkYzN1MpWO9PN/tiS8jWENDJEc+rINxgCCP1D3QnjqXIgDhiY
   qJffeICWbIu66lJ31h9ZnSHOTpxOlRnsTYT3QTF2Ij9hWXonE1Ko6h7l5
   w==;
X-CSE-ConnectionGUID: t5ScXjIST8WyKOoE2wQigA==
X-CSE-MsgGUID: Ophnl7LXQveDHeCkQ0QCnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="230730644"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="230730644"
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.fujitsu.com (Postfix) with ESMTPS id CCC3B1C1C706
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:25 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 83398C06BE8
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8B4A618005A1;
	Fri, 27 Feb 2026 10:14:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/52] python3-moteus: upgrade 0.3.98 -> 0.3.99
Date: Fri, 27 Feb 2026 18:12:54 +0800
Message-ID: <20260227101327.1432-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124719

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-moteus_0.3.98.bb => python3-moteus_0.3.99.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.98.bb => python3-moteus_0.3.99.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.98.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.99.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.98.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.99.bb
index 412ee536f5..3de7f6a0ec 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.98.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.99.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ef6c628bf64d56e30aac1f8e314f74b1bbd9875e5ec21ecd3c2ce9436f7e3644"
+SRC_URI[sha256sum] = "30d3cafa6b23692536102f52d9a7d919f2775fa75bdee087f98782c7e3c88805"
 
 S = "${UNPACKDIR}/moteus-${PV}"
 
-- 
2.43.0


