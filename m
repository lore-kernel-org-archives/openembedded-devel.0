Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70EA3D1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:56:40 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4125.1765274190145905779
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qMu5mYq+;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274190; x=1796810190;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SLBcm1i4XwIEuDZTcBEkXBZkogvv+RMzFLlrW1Ev7wE=;
  b=qMu5mYq+J4GfLweDsHitRvpqvlQLD1Ehfu1JjFhbwed9vfyjxIXA5YJS
   eP9ZJ+q+DpWk6u4nteFVU1s+Ra8F6OjM3ktRns/hNlWgyweH1ltv0QKaU
   R+7YWrDYiQLWysQoANYTXaoLb7wV/Q4Xkt909SmU/ZwQ9Kxdg83v8AtJv
   7bYybTL3R4q8L5aIZbbjspCsCdUaFZYyWyjAdiyuI5uXrrH+SokZcEQCY
   9l/VBcskkunZxoEVxLjnExGRJBe67n6BvN0hAHv68/sCz5xe/bGfgJVMw
   H7JZTGXMqrI8lVQ5BMLvI7/ISTiRPAdIYYzgbzzywEuGJqV6fdTVBjT76
   g==;
X-CSE-ConnectionGUID: w31fS9JySvSwvwq6rxqaew==
X-CSE-MsgGUID: 1FwgpNRMSDagX/G83+4N0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="200953770"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="200953770"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:28 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id B2B38100036C
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:28 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 5A9C01C0014D
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id F2D9D20002B2;
	Tue,  9 Dec 2025 09:56:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/38] libtorrent: upgrade 0.16.2 -> 0.16.5
Date: Tue,  9 Dec 2025 17:55:24 +0800
Message-ID: <20251209095552.690-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122414

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtorrent/{libtorrent_0.16.2.bb => libtorrent_0.16.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libtorrent/{libtorrent_0.16.2.bb => libtorrent_0.16.5.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.2.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.5.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.2.bb
rename to meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.5.bb
index 916a70a07b..66fe13df99 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.2.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.5.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 DEPENDS = "zlib curl libsigc++-2.0 openssl cppunit"
 
 SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "bd9c66338d9d33b92db9939abb3e0c5d0dace511"
+SRCREV = "034b026a0a8ef1d4037620862034bb44cec14f25"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


