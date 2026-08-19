Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B01AC5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:11 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3267.1787132158702910781
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eugXNgPg;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132161; x=1818668161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0IIE5eDo58bwaWU2IwZgZMW/dTaeh/PMg+5xUP9Q/Ac=;
  b=eugXNgPgmzV2EI4lofX6XRQwy4xQrL+hpANtip4B0WhwRxsgV5r9qIAb
   zgmmcI1IomFt86yUTV17g+05hIQOhnBtJiDjnf6RmKR1+OoJhjLDARLi9
   OIpw9u1mIShklwGMZMksUwiSbw4kIj5WjKB/09E/dSQ4u2layQw8UDNPh
   wK37TcGYaffA3jZsOJ3ygTjlOXz9WzJzjWpIX9wAEO1oX2Er9G1sWKors
   Gzz5H2uj+6UO7j5Tm3ou4fKB1zXXnNmFZS7n7nsuazQincVFoq3kQ7gxU
   RMHiMrm96lai9szDUhe+CPlNFf99jmFIsTAQPoJAyUUk25qneT+5FMz5y
   w==;
X-CSE-ConnectionGUID: VjCutHagQ5iWa/QNgnygXg==
X-CSE-MsgGUID: G3iyN02YSFSEqp6WNWWGfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="251882207"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="251882207"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:00 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 66222C0040D
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:00 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 2051083CC96
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 289D81801C0A;
	Wed, 19 Aug 2026 09:35:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/70] python3-cmd2: upgrade 4.1.2 -> 4.2.0
Date: Wed, 19 Aug 2026 17:34:27 +0800
Message-ID: <20260819093514.1101-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129293

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmd2_4.1.2.bb => python3-cmd2_4.2.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_4.1.2.bb => python3-cmd2_4.2.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_4.1.2.bb b/meta-python/recipes-devtools/python/python3-cmd2_4.2.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cmd2_4.1.2.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_4.2.0.bb
index f8f06a6bd6..4ee14823d8 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_4.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_4.2.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f2a861642858e0858af9dd4e4716bae0"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "07e62b40235ae4af1c5730fb6b3a4708456b57b9ff79acf02808ac584263290a"
+SRC_URI[sha256sum] = "0546543c1ba3c6090ecec33f1373c59627e417b14419629a48176115946fd329"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.43.0


