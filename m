Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2C6CD6E46
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:54 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16812.1779875384823622732
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ItcYt5UW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875386; x=1811411386;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MVqNf6LxzZuWUn6VW4vAThSYYHwOgJs2xhi1yzJ+rQo=;
  b=ItcYt5UWPrqBEqNsG5AiNd0zZAYILBDrVyTIEEojDNzgCNcCqtZNUEN/
   NZU7gEZv9qQzxiAqEiEa3x+7gIAjXUF5jD9uUw+8obiSB1Y9kF/8hVKT8
   shZ9nD6lW4Zu92cjMdr90UpSgXcIj+of78htZ+o/3O90BYhXlngT+2tZ2
   vwapFByDJmeZ3snJfb3I+2f7clIB7SOwZwtx9+5SV69IvGC/A4KkS4fpa
   Bca2k+1iAYnsNoswsdyFA50if3roDOSenihxec7I3gFTo1jwuE+dI8duH
   ivAYWYq+tWQU+9+enAlVxuftn+Okfb1n9t+H3R8bT7SCGj2A7/P/x6Ot7
   w==;
X-CSE-ConnectionGUID: q6+oZkEbTD+iB1kghZ/opg==
X-CSE-MsgGUID: VKzL/0TtTLeSNp1MO6mk2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="242050159"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="242050159"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:44 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 52F7E1000143
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:43 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 095DB18915F8
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 1ED3B82A2CE;
	Wed, 27 May 2026 09:49:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 52/56] rtorrent: upgrade 0.16.11 -> 0.16.12
Date: Wed, 27 May 2026 17:48:01 +0800
Message-ID: <20260527094805.2039-52-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127259

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rtorrent/{rtorrent_0.16.11.bb => rtorrent_0.16.12.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/rtorrent/{rtorrent_0.16.11.bb => rtorrent_0.16.12.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.11.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.12.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.11.bb
rename to meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.12.bb
index 559c29036c..135f7b1665 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.11.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.12.bb
@@ -7,7 +7,7 @@ DEPENDS = "autoconf-archive libsigc++-2.0 curl cppunit libtool libtorrent ncurse
 
 SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "2700b3141f966d8533a6153491e1c76b3cf5c2b9"
+SRCREV = "088bf40bdfe0ba23bab22c17f3bcc89a9b1a97de"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


