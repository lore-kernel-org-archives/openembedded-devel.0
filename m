Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9E7E7543A
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:14:30 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.117707.1766567659889721754
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:14:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GKgicVLB;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567659; x=1798103659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ccfAFCh6saqsOYWBjVsEYn2vLp4lQx6auUD/bPKuYfs=;
  b=GKgicVLBME6kbUMzPX0yJE5c9NPpWzIW39vkEr4NdJbQQQE5Lmhp8V8T
   rRAZj24UNA+xtEFVZ+0a5rwY4m8gxbrpQ6pm4gMd0AG3Wdm4SUBu7hOPK
   IwStkJMch+wVKAWlSRJO74l/DLKwe1jbW0hWUlY6RYc1ScmMNhK0lK9iu
   bBmxg2aNsLKmMUbzF/76h3Fz+2M8YRYtCqJXbFmZYyGN719dDPZJ4Ju4/
   XMHTVjMK1u2Db9sEb0bGMQOGe1c3cPLtMu5pzVS64jq20MvWPOhoy07yh
   ON7WVY4RTIqBmNTQ+9Fx6JqKoP8RTEzOqw97I8evdx8Y7ohFt9MXbBELv
   Q==;
X-CSE-ConnectionGUID: lrueQ+R+Scqr4Ldb57Gp8A==
X-CSE-MsgGUID: iNIJYXxGQoerUzvM6rfqyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="224409924"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="224409924"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:14:18 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 601208204C5
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:18 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 1787E8D29C0
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 41F3E200076A;
	Wed, 24 Dec 2025 09:14:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/28] python3-cachetools: upgrade 6.2.3 -> 6.2.4
Date: Wed, 24 Dec 2025 17:12:49 +0800
Message-ID: <20251224091304.974-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122863

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Fix license information displayed on PyPI be using an updated version of twine for uploading.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-cachetools_6.2.3.bb => python3-cachetools_6.2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_6.2.3.bb => python3-cachetools_6.2.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_6.2.3.bb b/meta-python/recipes-devtools/python/python3-cachetools_6.2.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-cachetools_6.2.3.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_6.2.4.bb
index dc66db6536..51a9f29ff5 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_6.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_6.2.4.bb
@@ -14,6 +14,6 @@ RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-SRC_URI[sha256sum] = "64e0a4ddf275041dd01f5b873efa87c91ea49022b844b8c5d1ad3407c0f42f1f"
+SRC_URI[sha256sum] = "82c5c05585e70b6ba2d3ae09ea60b79548872185d2f24ae1f2709d37299fd607"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


