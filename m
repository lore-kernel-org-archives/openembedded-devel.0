Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 736A2EA3C30
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:33:50 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128825.1775730823814704168
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kad9jswy;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730822; x=1807266822;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t1GhSHHwoP/XJf6tAfYzVg1OXsIe26hMYYYOvH875iM=;
  b=kad9jswyawHfzxDuI+zJToTtccpd00wsYAl9h7ABKoxxl14kLWPa3f14
   w/40PUwZcuvrlAusbhWROmA4Ah9i84YDRZA1wjNvW/lXV7Z97Wv+tQpAS
   poKjvhqVhvEoHs5CilEyQ+90LYQKs13YAhE5iKqbSCalFaYe3sNTb97e8
   KEmmRvccrvIZl2PvpqJa13lsg4b+MBAaHz/KolmU3ARxFPZes4tu2ZXT3
   VwQRgWyxZIiQz1JG+lgIdIO+RbLi+9W5+FPEeD1h8lQmNG1KIsbT8mAyZ
   vWjvKpdD88pzLKRNfShfigF+8bvqBsAKgd8fz0OS0u8uLIa68CJbemjie
   A==;
X-CSE-ConnectionGUID: xjImviBkRQyEOkX4qQxirQ==
X-CSE-MsgGUID: A+P9mWfQSmW0k2vdCYvSpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="235843767"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="235843767"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:33:40 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 4096582070B
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:42 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id EB0991800252
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 749704046AC;
	Thu,  9 Apr 2026 10:33:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/37] libtorrent: upgrade 0.16.8 -> 0.16.9
Date: Thu,  9 Apr 2026 18:31:58 +0800
Message-ID: <20260409103223.1574-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126161

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtorrent/{libtorrent_0.16.8.bb => libtorrent_0.16.9.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libtorrent/{libtorrent_0.16.8.bb => libtorrent_0.16.9.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.8.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.9.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.8.bb
rename to meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.9.bb
index 1e9d9d74f1..63c8a0bb7d 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.8.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.9.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 DEPENDS = "zlib curl libsigc++-2.0 openssl cppunit"
 
 SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "1534b1563f464fd1636c0b55e1591b72f7d8ab6b"
+SRCREV = "e88d4e7854abacd3036a0dec11927c1276c1e6b2"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


