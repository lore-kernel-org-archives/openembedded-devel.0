Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B15C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:29:18 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9710.1788344953591368606
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=h2X5MmSu;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344960; x=1819880960;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0Yb8dZqMYBR7asaA3rd4hOrOgYsrGLuwyhhYYCfTNBI=;
  b=h2X5MmSunTinOZ4IjOEtw6tojQXtphUJDPe5daHRwOqoScmjZ/SpKgdX
   3eo0nGlhZ4yc0xDpcOd9kGAJSUjlH/Zf+xFrgEmihWVlSduDkm5vbHgRC
   0ZVlOopNDnz7qqChq8MXR9vkGMSRhzl3fApmXuo3ZlvV47tTSjVhF/rq4
   NXYz0LEPgySWtYQMfIJ+gh7x8zYFepEAJktj3HlAOjbSceh+Ag4liv7x8
   PjqfORiBmagiGUvTtEhj06rUP036nEyrTiKKQJfciXkM09BKK6Xd34daw
   7KwLDPACsUj3r4sFoikWB6xjTAokdSzqPVzw7o8nxRM23HRDox4qK5aFS
   w==;
X-CSE-ConnectionGUID: wnfKssV0RQq1/sfRJM1OUw==
X-CSE-MsgGUID: qK+Bq902Q6Koj4ohIbS9Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="232471196"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="232471196"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:20 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D0AD48203FB
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:15 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 870ED1800261
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 876CC200076B;
	Wed,  2 Sep 2026 10:29:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/34] libtorrent: upgrade 0.16.20 -> 0.16.21
Date: Wed,  2 Sep 2026 18:28:32 +0800
Message-ID: <20260902102900.1296-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129665

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtorrent/{libtorrent_0.16.20.bb => libtorrent_0.16.21.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libtorrent/{libtorrent_0.16.20.bb => libtorrent_0.16.21.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.20.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.21.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.20.bb
rename to meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.21.bb
index 4a4d1cf919..06998ba989 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.20.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.21.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 DEPENDS = "zlib curl libsigc++-2.0 openssl cppunit"
 
 SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "ea68bf287e36a13fa0c13c965dee6c3d40e3d242"
+SRCREV = "306fbbf008183dcfd55fae0a83fff95302c64987"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


