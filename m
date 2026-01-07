Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37772CD5838
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:29:24 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3062.1767781763531993087
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:29:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UE+d/dvo;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781762; x=1799317762;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oSmhy9Xa6KuuHfKPotNGVhv/nivpxus5cg9KVZf9ULM=;
  b=UE+d/dvoFwsyf4GbWyFlk0Fj3R3/dEs6XiIwQP2iTJfhHfiClwJrP3eG
   TiHFVkFy5cgaMCazlRI5qT5LJaDXKNiWyPTbibjxnedPEkvKYySj37uno
   W98cZIJZLP9BaEbGAx45ggeE+TchfjIp7Fk0EZfA1UQJI97RmJofE7ike
   /UeDJCLFGRz6e49gmAuCgp1cAEMveoIA0YdKtBDGtjSSP1J7ma8ceJZUs
   CJsP9n9bUyq0wFrFJOeUvKwEx5SWVUOk1+VL2pq1LQyEgL2XgLsnWd6cf
   jYwebNYgjX1Vas0PtJx5BU1nVzhWCfy9LIQxmZp8hadFDP4DxdcsHtLEJ
   A==;
X-CSE-ConnectionGUID: LHUqoUBhTwG2/F+Q37daug==
X-CSE-MsgGUID: aRB06T0QRhGJ/xtqhDgrjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="203905544"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="203905544"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:29:20 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id CA644100035B
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:21 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 7ECF41C0CAFE
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id B6803829F3C;
	Wed,  7 Jan 2026 10:29:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/24] libtorrent: upgrade 0.16.5 -> 0.16.6
Date: Wed,  7 Jan 2026 18:28:41 +0800
Message-ID: <20260107102855.228-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107102855.228-1-wangmy@fujitsu.com>
References: <20260107102855.228-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123208

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtorrent/{libtorrent_0.16.5.bb => libtorrent_0.16.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libtorrent/{libtorrent_0.16.5.bb => libtorrent_0.16.6.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.5.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.6.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.5.bb
rename to meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.6.bb
index 66fe13df99..63f2bfccaa 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.5.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 DEPENDS = "zlib curl libsigc++-2.0 openssl cppunit"
 
 SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "034b026a0a8ef1d4037620862034bb44cec14f25"
+SRCREV = "ecb3b6bb6ecb38c19da2d6bb899a23638cb7fa04"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


