Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DAF103E314
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:16 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18754.1773312788625548896
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fivYqWoF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312788; x=1804848788;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sMeoQzbzZPKJXw4aSUF/Q006CcoA37ZgFXgex4wCnAw=;
  b=fivYqWoFl5rdyDGsdIV0q8C/atdSbYM6/hiyXJw3egVBY4y2RVHfjTTw
   PDEKouTgWlelLmIx3uP4Typlxbelx7Qse4E4nYugkQNijbKI3f8F0sRK6
   z6C8s0JARIyPUh404n1cKO3XeW6KUPNsT5Pcn32ocpOALsO6yk8B848jp
   auPyeNsktcjzpmA5bCFmkROZ73xDxjo7QBC+Kuo8bAf6FyZ6xqgrPkWr+
   gZJMvZ5TENPHMGJPuBUu4viGhlNX7OKdVKpGTwYLbF3rWBDLYewN3LB8a
   gPymS6Lr0CerbXDcqY9U7fNmFdae+Miqve7hbZP5XlS/qfUvso5nEmuEe
   Q==;
X-CSE-ConnectionGUID: oBJ74RDeRHaTYrVo2IAQmA==
X-CSE-MsgGUID: 9M2LwqhATYW4sBy9gqKA8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="232989785"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="232989785"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:07 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 1F6248241EB
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:07 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id C7EA7180A33B
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id C047318005B4;
	Thu, 12 Mar 2026 10:53:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 19/64] libtorrent: upgrade 0.16.6 -> 0.16.7
Date: Thu, 12 Mar 2026 18:51:35 +0800
Message-ID: <20260312105220.1856-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125119

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtorrent/{libtorrent_0.16.6.bb => libtorrent_0.16.7.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libtorrent/{libtorrent_0.16.6.bb => libtorrent_0.16.7.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.6.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.7.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.6.bb
rename to meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.7.bb
index 63f2bfccaa..315df3f854 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.6.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.7.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 DEPENDS = "zlib curl libsigc++-2.0 openssl cppunit"
 
 SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "ecb3b6bb6ecb38c19da2d6bb899a23638cb7fa04"
+SRCREV = "336c16c017309a694b9e0b420c9063d016bd83ee"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


