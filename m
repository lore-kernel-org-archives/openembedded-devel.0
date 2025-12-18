Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25052D6ACC7
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:04:33 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37583.1766048662544602151
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:04:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oJ3SNxJU;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048663; x=1797584663;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4mVMZHRvDko5WzVenIr70hBpegdv+d+WM4SsSKVrR1s=;
  b=oJ3SNxJUQBkfopd7UdnznJoYzO/txxV25p/oNgI3VRbdgPtNFq6/LM0Q
   0R3X8xzF4xHWK2fmefbdM572o5YhZe/o/+xnSJn6SZh+4kwPZ8wcO8dZz
   Pk7J7dQIUNUIOdF+ciXq7HLdEScRs+9nmYeR7/vOBqKX2dElN/M6SBiqJ
   kkEnNjUWxmQkRCvK2Kblp8ukbcjcgL9WE1PxHXd14rkvkvat6mSdrpYDA
   q85N1AedLIoFo9XJ1rOshFaaG1t8g2Z7Ae2Mo5YXSuhUoeElr/dRA4NGk
   F+58WaTbHDKAXl/dJVE1KI7eqi1JcJ2Mmg0XUS5uakhaFsIjqnAoLlPVZ
   w==;
X-CSE-ConnectionGUID: fqhAk09kT3GeGZFU1Put/A==
X-CSE-MsgGUID: iCp3VK9PS1iyN4fsLx0jqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="223120211"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="223120211"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:04:21 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 7DA3FC020EE
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:20 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 35A028D9FCD
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id A9526101E531;
	Thu, 18 Dec 2025 09:04:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/20] python3-tornado: upgrade 6.5.2 -> 6.5.3
Date: Thu, 18 Dec 2025 17:03:42 +0800
Message-ID: <20251218090346.735-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090346.735-1-wangmy@fujitsu.com>
References: <20251218090346.735-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122750

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-tornado_6.5.2.bb => python3-tornado_6.5.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.5.2.bb => python3-tornado_6.5.3.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.2.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.3.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.5.2.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.5.3.bb
index f915dd5658..fedd2700a7 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "ab53c8f9a0fa351e2c0741284e06c7a45da86afb544133201c5cc8578eb076a0"
+SRC_URI[sha256sum] = "16abdeb0211796ffc73765bc0a20119712d68afeeaf93d1a3f2edf6b3aee8d5a"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


