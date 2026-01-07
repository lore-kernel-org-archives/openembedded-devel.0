Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69385CD5841
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:29:44 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3065.1767781776063674253
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:29:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VP9Uv0SI;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781776; x=1799317776;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S9u9C7RJ4uhSNwMNfEnrYHmhZxgwO/6SgZXm6HT3E70=;
  b=VP9Uv0SI3yp+cPlYktyoWiOTObwSZ/Q6gUXFq95p2ciGbaauzo3eZot6
   /4gr3SiVOB4t5nSneF8ecGrwaLdwIlThPIZ87PqNfNhL2V9y6za7bcfbv
   bMt+SB8P20XnLZaNmcVJv5uMLRqBK4j5XS5e/ieYFr3AGOg7qvJ1HJO/g
   nHJXh2FyXubE4o3fsN6ZzYiKOa7hiR7xsO8AyFLYB0oZl/CgFJMnuubzC
   cl9gPrerIUSIUYdbbmJMcWp7i30hn6kKB+dQC2//FVr7DGbxeFm9zlhCj
   YvhMb2ns2gHf4c2TIT52fKBOFifh7Y/H3qjMUB8DSu1HwVEaXAW+smGAj
   A==;
X-CSE-ConnectionGUID: A0hQ+xdPRuqBJEDkCHUxMQ==
X-CSE-MsgGUID: YJfHiI6FT/OMq3y1dxOcdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="213659033"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="213659033"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:29:34 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 945CCC0182A
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:34 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 4D3B71401270
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6A38082173E;
	Wed,  7 Jan 2026 10:29:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/24] python3-moteus: upgrade 0.3.96 -> 0.3.97
Date: Wed,  7 Jan 2026 18:28:47 +0800
Message-ID: <20260107102855.228-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107102855.228-1-wangmy@fujitsu.com>
References: <20260107102855.228-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123214

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-moteus_0.3.96.bb => python3-moteus_0.3.97.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.96.bb => python3-moteus_0.3.97.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.96.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.97.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.96.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.97.bb
index 99d36791e1..313619a5b2 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.96.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.97.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b30d63a38bfc834e0bf8154d2f8cead81fbeaee38f14fff0ef2a40f620ed11eb"
+SRC_URI[sha256sum] = "59f6f185390822c41f993c56027e4be338be87d40435acb0e10df1d68d662e69"
 
 S = "${UNPACKDIR}/moteus-${PV}"
 
-- 
2.43.0


