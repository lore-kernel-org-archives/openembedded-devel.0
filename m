Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E1D0CAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.15419.1758015722736300041
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KEm9cfEr;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015723; x=1789551723;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xT3CvCErPcDWp9VQDmAXy4M3nS8Rw+kMcVMu7St5p4Q=;
  b=KEm9cfErWgHowDMj/WutMpJnjQBB01nVjS7Ieqlmsuyc15a227eyeAUQ
   uWmZdZfBepg4UyMv3fI5E7Yf8SziGT5FO3oDHw9GyA16xWr9LN/WYFoIc
   rEvY/H/cntNQekNbsVB7BtIrseN/PQMvtTWYJScD1rKfUbkptBg1vcY+z
   IsYqkN5kuHSoXv40xrC1B5JZayfIoY6ReHmVjIeUv6bYGp73Qck6ZsF2p
   wfCnxs76DZljxTMvHgxvduOOr3t/y962bftpFi1thi5a6SVnCDvyLjkNV
   Qp0+MCQrnZgZI6C7pD86p8Q0oE9qe8oAO2ASwDC2To9dYbqEqMxgKVMsq
   A==;
X-CSE-ConnectionGUID: VfVCsSPLSS2hHt5akDQ22w==
X-CSE-MsgGUID: 6MvQGriKQi6y3TkTrf6s7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="201479421"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="201479421"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:02 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id E81CF42A310
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:01 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 9BEDE1C0011D
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:01 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 0C5EA18076D1;
	Tue, 16 Sep 2025 09:42:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7C4EE1A0069;
	Tue, 16 Sep 2025 17:41:56 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/42] feh: upgrade 3.11.1 -> 3.11.2
Date: Tue, 16 Sep 2025 17:41:15 +0800
Message-ID: <20250916094152.1479-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119427

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/feh/{feh_3.11.1.bb => feh_3.11.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/feh/{feh_3.11.1.bb => feh_3.11.2.bb} (88%)

diff --git a/meta-oe/recipes-graphics/feh/feh_3.11.1.bb b/meta-oe/recipes-graphics/feh/feh_3.11.2.bb
similarity index 88%
rename from meta-oe/recipes-graphics/feh/feh_3.11.1.bb
rename to meta-oe/recipes-graphics/feh/feh_3.11.2.bb
index 1a269624a7..57c30c3475 100644
--- a/meta-oe/recipes-graphics/feh/feh_3.11.1.bb
+++ b/meta-oe/recipes-graphics/feh/feh_3.11.2.bb
@@ -9,7 +9,7 @@ DEPENDS = "\
 "
 
 SRC_URI = "https://feh.finalrewind.org/feh-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "43d8e6742ec273ef3084bde82c5ead5a074348d9bfce28f1b0f8504623ca9b74"
+SRC_URI[sha256sum] = "020f8bce84c709333dcc6ec5fff36313782e0b50662754947c6585d922a7a7b2"
 
 inherit mime-xdg features_check
 # depends on virtual/libx11
-- 
2.43.0


