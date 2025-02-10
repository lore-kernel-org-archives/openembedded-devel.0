Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C260EC021B6
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.46625.1739178119825938406
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Q9PNlIDc;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178120; x=1770714120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IFaqAj29jNp9qfL4kTD8oTfc/TCRvfC7O8JIFphtQEQ=;
  b=Q9PNlIDcGPBOHGOxX/m9wnXwghBy/86BzUCDbQWG65vo1nLE/lUVRaTk
   OKeUpaREXhVCEezVYe3R977hYFRvzufXsdUqktZbq2lTWwTxV8bvrKdu6
   EvNtyh4EP9XPrkNxckqXW/Zl22SYqD/StSct1ZVWIxlMXzmw+MvdMBpP/
   sThb1MCL+V7LRNvb1XTl1aOLwgAENnuDa/Tuk/GKt3g4ItdVC8rek4Zoh
   HK/MV0kS7iogybBMnB3FXKEmm2iMzgE38BRjQMW+5HOm7tgdI43v4x5vb
   2lXxMpJhoITEBqEkKgfwj55gnn2qbGtBT4QGm1NDsjR05SU3wOfZjzzNp
   g==;
X-CSE-ConnectionGUID: okRKtldmQEe6/d4SOtBioA==
X-CSE-MsgGUID: JnnyfzM+QwuEtSOClPq2tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="177845823"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="177845823"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:57 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 776FCD6EA5
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3FF48D9695
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:55 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 064D51A006C;
	Mon, 10 Feb 2025 17:01:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/66] python3-beautifulsoup4: upgrade 4.12.3 -> 4.13.3
Date: Mon, 10 Feb 2025 17:00:55 +0800
Message-Id: <1739178095-26432-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115353

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...eautifulsoup4_4.12.3.bb => python3-beautifulsoup4_4.13.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-beautifulsoup4_4.12.3.bb => python3-beautifulsoup4_4.13.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.3.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.3.bb
rename to meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.3.bb
index d08017d003..a36c22e6f1 100644
--- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.3.bb
+++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=96e0034f7c9443910c486773aa1ed9ac"
 
-SRC_URI[sha256sum] = "74e3d1928edc070d21748185c46e3fb33490f22f52a3addee9aee0f4f7781051"
+SRC_URI[sha256sum] = "1bd32405dacc920b42b83ba01644747ed77456a65760e285fbc47633ceddaf8b"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


