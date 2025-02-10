Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9254C021A9
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:01:56 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.46622.1739178112983859191
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KqGTabKI;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178114; x=1770714114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=d6I/d7B/XawNrpUt75HafFAPyKaXH6kFCKqRY3j5xrg=;
  b=KqGTabKIzUZx+GGNalD3kKgTzrLk1vInP32uajA6APSWBFYy8Fj+NKj/
   DkWUGJ+fcBjTWb5uMrW16ZtDRujs1aI6Xk4qxhnbf/R1matC2ePLeF6kE
   aJF/laDC9YLL6aJlgm6x9FpWw/DvIYChRjcVDG559dhlFfxCxSyR1J3Y5
   H8jYChF9oqWEedhjAkyFHmUhsd6fKCTneIDoTkgvoSEh5Jvg+/Cz0VbqH
   tnRRG0TQFAkpYK0znpdbOw4myl9ULT4OoBxx5N01lOfLcmjabULOBXFts
   f7Bb6ygjTKh/Ea1CdIZgtefCmD2DPGAFptb7EKXbcuRlddrvP9xC/1WPM
   A==;
X-CSE-ConnectionGUID: dlHYyI6xQ6qne6p2VMZKbg==
X-CSE-MsgGUID: RBoddEC6QYGwFeJMqF8U6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="168346349"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="168346349"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:53 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 12234D4F41
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C8525CFA59
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:50 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6BFD41A006C;
	Mon, 10 Feb 2025 17:01:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 14/66] libzip: upgrade 1.11.2 -> 1.11.3
Date: Mon, 10 Feb 2025 17:00:43 +0800
Message-Id: <1739178095-26432-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115340

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Report read error for corrupted encrypted file data.
* Avoid unnecessary seeks when writing archive.
* Don't hardcode '_Nullable' support in 'zip.h' to allow it to be used with different compilers.
* Improve check for GetSecurityInformation availability on Windows.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libzip/{libzip_1.11.2.bb => libzip_1.11.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libzip/{libzip_1.11.2.bb => libzip_1.11.3.bb} (91%)

diff --git a/meta-oe/recipes-extended/libzip/libzip_1.11.2.bb b/meta-oe/recipes-extended/libzip/libzip_1.11.3.bb
similarity index 91%
rename from meta-oe/recipes-extended/libzip/libzip_1.11.2.bb
rename to meta-oe/recipes-extended/libzip/libzip_1.11.3.bb
index 527be364cb..2d26ea59b5 100644
--- a/meta-oe/recipes-extended/libzip/libzip_1.11.2.bb
+++ b/meta-oe/recipes-extended/libzip/libzip_1.11.3.bb
@@ -21,6 +21,6 @@ inherit cmake
 
 SRC_URI = "https://libzip.org/download/libzip-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "5d471308cef4c4752bbcf973d9cd37ba4cb53739116c30349d4764ba1410dfc1"
+SRC_URI[sha256sum] = "9509d878ba788271c8b5abca9cfde1720f075335686237b7e9a9e7210fe67c1b"
 
 BBCLASSEXTEND += "native"
-- 
2.43.0


