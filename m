Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1426EC4450B
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:29:51 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9438.1768994985041757592
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:29:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cq2IM+Ky;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768994990; x=1800530990;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bfY5rN0wnGmfuMOH3S3asB1jrF7FhRN7s9uUw+jfd5s=;
  b=cq2IM+KymcxErF11vQmos4uyzcDEwiZCjvnyFdCyfMTX682+oRWrR3AQ
   G3ypCxcW6+SOKEj+s0heoXa/2Ah+CySWxaKIAXjMeMvNlOw8lcQhRSm+y
   d0GqVjrcw2vVvaFxMZ71nY6XqJnpwHCTCUjXqYFue/1C1eSFdyMSSnhZ4
   sWfWD0o15FtOV3oMJSH9+3NlbLc8N/CkU1U44YDPuxztCzwqFt7kZ+O6z
   dmSPoWDGf+11RlLo645/KW7FF9c5aBF2x2nHsWlXgrfANH0vFd2I6PzTD
   f2JoVG/PaqnhzX2rT49GA/vQgXVp16nB8H8k2P4YXZ1T0rm4j3O48KtAA
   A==;
X-CSE-ConnectionGUID: tKMfWNshQKemA1JH6otoCA==
X-CSE-MsgGUID: oHXDXmujQqORx3+Bs8/ZCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="205542087"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="205542087"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:29:49 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 9DC381000343
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:49 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 4E0DB1C0CAD5
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id AE4511404866;
	Wed, 21 Jan 2026 11:29:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/30] python3-httplib2: upgrade 0.31.0 -> 0.31.1
Date: Wed, 21 Jan 2026 19:28:59 +0800
Message-ID: <20260121112921.857-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123699

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-httplib2_0.31.0.bb => python3-httplib2_0.31.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httplib2_0.31.0.bb => python3-httplib2_0.31.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.31.0.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.31.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-httplib2_0.31.0.bb
rename to meta-python/recipes-devtools/python/python3-httplib2_0.31.1.bb
index 39f3459320..e851ac292c 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.31.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.31.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56e5e931172b6164b62dc7c4aba6c8cf"
 
-SRC_URI[sha256sum] = "ac7ab497c50975147d4f7b1ade44becc7df2f8954d42b38b3d69c515f531135c"
+SRC_URI[sha256sum] = "21591655ac54953624c6ab8d587c71675e379e31e2cfe3147c83c11e9ef41f92"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


