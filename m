Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94A5CDE007
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:28 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7019.1782378140713937855
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Uay1jfo8;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378140; x=1813914140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sYZclKjiezZlCmpZPp/RHaIp3HP44IeOsWECBxLk2gw=;
  b=Uay1jfo8oeZ/liTp5E4MI6OE6EF2r4SaEYcIXryh0YD0buV+ZK8GDx7f
   59otGujljkt/1ug1QbEWzmSE3BUUn7pu+W17cU8VJZwDokY/lFtNKmTde
   c1XiMMJXv/dwf2yK+DUIyFpvirn2hwICwbeZf0XE6keYlwhyiVdml9KR2
   9HnxG4ovRJKkwIQ2R1jB5enYwe9/BbekQzwIQJTG/t+uF1bM1qvJW4xN2
   bkAfWc9JaimPAjou7rts++fxiaDAjDWl9ZlpnIqzDcpCAVKdzt2w9XKei
   bI6i0gpveJFcr3LtFZuAmcIKky7XarcRliBR8yhx8aQ7TT4FbiyTiUawh
   A==;
X-CSE-ConnectionGUID: i30AzqXERQWpeF4JSQeQwA==
X-CSE-MsgGUID: NF2oOouUTIK8depFHscEzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="233265741"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="233265741"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:19 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 18AD5406C4C
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:19 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id B8BBF10CF1D9
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id D17F81017329;
	Thu, 25 Jun 2026 09:02:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/47] python3-py7zr: upgrade 1.1.2 -> 1.1.3
Date: Thu, 25 Jun 2026 17:01:10 +0800
Message-ID: <20260625090127.1563-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127762

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-py7zr_1.1.2.bb => python3-py7zr_1.1.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-py7zr_1.1.2.bb => python3-py7zr_1.1.3.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-py7zr_1.1.2.bb b/meta-python/recipes-devtools/python/python3-py7zr_1.1.3.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-py7zr_1.1.2.bb
rename to meta-python/recipes-devtools/python/python3-py7zr_1.1.3.bb
index b4c6c1672b..865e314f0a 100644
--- a/meta-python/recipes-devtools/python/python3-py7zr_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-py7zr_1.1.3.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPL-2.1-or-later"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "2aee212c5516ddcbeb76874dc3ece38b4566fc003f51600032c723cfea89ac56"
+SRC_URI[sha256sum] = "8d51894abb38355bf14881088bb97f01fe4cb5b14ebe22f66d6297668c7e1a74"
 
 CVE_PRODUCT = "py7zr"
 
-- 
2.43.0


