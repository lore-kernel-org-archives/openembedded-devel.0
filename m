Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08754C4450E
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:30:31 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9453.1768995024785986830
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s2BVW+N3;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768995025; x=1800531025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rYPC4MKymDnRS+NDTa/PnYEATBvJlaiGMxNINsHgE2c=;
  b=s2BVW+N3XKuHFXYxDZ2Fuo0nPHbKRaI54YEDbCdLAO3y/lGduLDePqIZ
   Cm9NcRZ+yVeV+EREYWta70jNe9h2zap5DBEyxIHsoV0fYsKF8G2LIusaJ
   eX6UGmfjQXnsV8IRpiz4NRi3zH5+I7nrEOQXz9h25GVmi+2GQO0Tp/D62
   J5BJpspV3rstS30EyzEpicfCL9BkneNHoFckx540ab+xZa2rTsgy+Z7dk
   uosqL9P2FpnWTU8B6M2llEXCKDn29GjEv/iUeXaiJTLRNtHP73dx4hcU+
   72BApNEEXOK5UpAnAypNE0u3n0r4gwtS9az+vxuBbVQoy2WLAJakDhBWT
   g==;
X-CSE-ConnectionGUID: iSMyig0MQYSym6YFKzrXRA==
X-CSE-MsgGUID: 80iAN40WSEmFRvMRF7M8EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="205395145"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="205395145"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:30:23 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 41B881C1C738
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:30:23 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id F144DC06BD4
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:30:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 75B4B1401D61;
	Wed, 21 Jan 2026 11:30:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/30] python3-regex: upgrade 2025.11.3 -> 2026.1.15
Date: Wed, 21 Jan 2026 19:29:05 +0800
Message-ID: <20260121112921.857-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:30:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123705

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2025.11.3.bb => python3-regex_2026.1.15.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2025.11.3.bb => python3-regex_2026.1.15.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2025.11.3.bb b/meta-python/recipes-devtools/python/python3-regex_2026.1.15.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2025.11.3.bb
rename to meta-python/recipes-devtools/python/python3-regex_2026.1.15.bb
index 8e30bdaacf..9a623122ac 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2025.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2026.1.15.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "1fedc720f9bb2494ce31a58a1631f9c82df6a09b49c19517ea5cc280b4541e01"
+SRC_URI[sha256sum] = "164759aa25575cbc0651bef59a0b18353e54300d79ace8084c818ad8ac72b7d5"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.43.0


