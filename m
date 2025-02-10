Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF6E8C021B7
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.46623.1739178114780922744
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=a2JEVaVw;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178119; x=1770714119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=SLsPecOr9rcqQxWhk3XRn0usrk5PHTd9w93xmFAFwXY=;
  b=a2JEVaVwwjX01lKByD4DyDotNBDZyBHO4lLKh7rfrpxVSRTJP9j1jQrM
   LgC2dOK6nJCKVDOL3HkE0+THsBYX0Rhx4Dh6GwLtgAo7wSdAX3N4+1sDs
   tUPK4jEvf6ZCRyqFPLc4Eo8Rtys7tGkyufBTWJ7Kv9bevYbwNYEvC8dV0
   rf2DHTXu3Xas9p8ZU76PspOzbETMm9l49D3eu4w3RN36Q1JpilObJ008J
   yjoOGpRKyJiP0xz1aQOHfV31YJEjjEph+I93VHmJW6B1JtW/9Mi8GuF0n
   STqWpDBRdt8USo6euOwE16HS8skHYFlw9lsyJdSNNgIV+2A7IJdwcnav9
   Q==;
X-CSE-ConnectionGUID: lRpZFRLIRZWJ1uUJtwsGyA==
X-CSE-MsgGUID: NbpWR95GTRqVHQn1Jsxtsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="192032038"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="192032038"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:57 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 08251DC6A0
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C65EAD4C33
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:54 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6967D1A006C;
	Mon, 10 Feb 2025 17:01:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/66] python3-aiohttp: upgrade 3.11.11 -> 3.11.12
Date: Mon, 10 Feb 2025 17:00:53 +0800
Message-Id: <1739178095-26432-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115350

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/aio-libs/aiohttp/releases/tag/v3.11.12

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-aiohttp_3.11.11.bb => python3-aiohttp_3.11.12.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.11.11.bb => python3-aiohttp_3.11.12.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.11.11.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.11.12.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.11.11.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.11.12.bb
index 3d4cb75e6a..07cffcfb02 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.11.11.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.11.12.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "bb49c7f1e6ebf3821a42d81d494f538107610c3a705987f53068546b0e90303e"
+SRC_URI[sha256sum] = "7603ca26d75b1b86160ce1bbe2787a0b706e592af5b2504e12caa88a217767b0"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
-- 
2.43.0


