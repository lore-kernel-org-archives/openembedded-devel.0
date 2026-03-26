Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 308BF10A1E9B
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:23 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46414.1774526236314084507
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hcN58To7;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526236; x=1806062236;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Rv1sp7xSI2rERrOSW2BnIBjxCm89BD1PEh0q3cr9bDU=;
  b=hcN58To7jpU8F1qwKDiOgoNpGnSJcrSU/2e3XWEx97oc98/6cbOe2mQ/
   /Y1pxCKxkMqBswB0asUeca8Xq1iSHpG9BySiswUsdrtlC98BZLPsnzOl9
   NzL9a0wlnhJuupD5s4lO6XVUXE7dBk05+wJQRW96UMC+1J94Ehq47uOK+
   qyAiqpNdWDq/zGBj8ZvZXSB2XS+VWblCgif38eydWnYOQ58yNnylLbHC/
   uH+Q//5716np1U+QNsLFE3q/yQCDKQW5X+Dr1/In8Dx0tP5uR0TDsPIcS
   OT/7BZ7fezQZ5TwaU31HMo9YhLqOkR6TcYPp8AlxePFbxt9v/vmKrP0tF
   A==;
X-CSE-ConnectionGUID: j/rZnEDtTB+ZmKkZw7AUWg==
X-CSE-MsgGUID: FdncoT36RI6Gq2ZId9Pm9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="234153995"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="234153995"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:15 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id ED844100037B
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:14 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 9090118009EA
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 0D5A21807148;
	Thu, 26 Mar 2026 11:57:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 21/63] libtorrent: upgrade 0.16.7 -> 0.16.8
Date: Thu, 26 Mar 2026 19:55:51 +0800
Message-ID: <20260326115634.1199-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125676

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtorrent/{libtorrent_0.16.7.bb => libtorrent_0.16.8.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libtorrent/{libtorrent_0.16.7.bb => libtorrent_0.16.8.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.7.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.8.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.7.bb
rename to meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.8.bb
index 315df3f854..1e9d9d74f1 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.7.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.8.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 DEPENDS = "zlib curl libsigc++-2.0 openssl cppunit"
 
 SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "336c16c017309a694b9e0b420c9063d016bd83ee"
+SRCREV = "1534b1563f464fd1636c0b55e1591b72f7d8ab6b"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


