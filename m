Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E471C369A7
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.43040.1744017451850111462
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G2nUrWC4;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017452; x=1775553452;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tM9PwYLvKWrUnz4ORx88beTWnywBMB1Z446qleUW+1I=;
  b=G2nUrWC40JsG6gAhlBTSeAjwjxRLZicm/zxRuUbv2WyycRYiyyOqvUqr
   jarazC14Mwy14czbLvXl6yXeYOG3kFwPcY138wr53enkFH9F/Gia64EFm
   HR6h/kqqraKbHaIMGYpV+O6cSXWye0h7OqAmwCCMjJGg7/qFfyIRavcqT
   Cnf2blUUINewt/3+tjJWJmOfFqn5nIWdoigmrit0p4dgYC3UOT9mCljdz
   CBPdMKCPq6MM/DhNN7yGO/W/r3xYMWLwYh6xHEONUqpWVpeFojpB2emuQ
   R99NTm23tbIFAHw0DUvsyAEPS9kjzpLFMijsmY3J+BlULMiorKGzgkMIS
   g==;
X-CSE-ConnectionGUID: 69lf0DGZRseUgVFKubgKIQ==
X-CSE-MsgGUID: qazYsc0QR1SncoNAVMrk+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="183010660"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="183010660"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:29 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F9DBDF0D
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 306F1D507E
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A52361A009A;
	Mon,  7 Apr 2025 17:17:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/30] python3-pydantic-core: upgrade 2.33.0 -> 2.33.1
Date: Mon,  7 Apr 2025 17:17:01 +0800
Message-Id: <1744017431-22217-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116648

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-pydantic-core_2.33.0.bb => python3-pydantic-core_2.33.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.33.0.bb => python3-pydantic-core_2.33.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.33.0.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.33.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pydantic-core_2.33.0.bb
rename to meta-python/recipes-devtools/python/python3-pydantic-core_2.33.1.bb
index 11bcbd259c..687158815a 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.33.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.33.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ab599c188b4a314d2856b3a55030c75c"
 
 require ${BPN}-crates.inc
 
-SRC_URI[sha256sum] = "40eb8af662ba409c3cbf4a8150ad32ae73514cd7cb1f1a2113af39763dd616b3"
+SRC_URI[sha256sum] = "bcc9c6fdb0ced789245b02b7d6603e17d1563064ddcfc36f046b61c0c05dd9df"
 
 DEPENDS = "python3-maturin-native python3-typing-extensions"
 
-- 
2.43.0


