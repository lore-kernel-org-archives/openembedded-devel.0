Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F1DCD6E45
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:48:52 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16782.1779875318920009370
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=T4n+/i/s;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875323; x=1811411323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BRhs7wtCd7n46ZTFHTEBN8PRSI8waxvx1mXCIlnOAgM=;
  b=T4n+/i/syVnXziLaG90zHAdlTPB2dgEgSFNsISvyKnLTWiCOB/HGmJVI
   drXaVwU9Xn98LgyUkFenvMZCyK2L+v5Uq+uhl1bbRw9Hz/IzmyQx6e/qs
   OWI4Xc2rACpkwJP1wlLICa5C8blGXBA16f6MyCN20EBkVc7Afs7ie31SZ
   Z9BYRJ9T3SOXdXcbToGj3onyfqS5EUZORxMLno7LAUAql+Q1zJMDYGXcW
   5OF2o2Wa0MxDIvDgJD3bylV0eIkaiGVNpnUjjl6NQBKFBs5iFctPgdaJ0
   5Wwzl7aJO+irWewa7my/qG1B0FWeaMRuR5nhdlXTLBIWMEb7pTBpZRbdG
   A==;
X-CSE-ConnectionGUID: uGU1qoqtSU6oajl3nfnwcA==
X-CSE-MsgGUID: QDwLMqk/TzSVEi9IHpb4gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="241969806"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="241969806"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:48:43 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2BE9E1002BB9
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:42 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id D6D0314003C3
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id D4BF382A2C9;
	Wed, 27 May 2026 09:48:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 14/56] libtorrent: upgrade 0.16.11 -> 0.16.12
Date: Wed, 27 May 2026 17:47:23 +0800
Message-ID: <20260527094805.2039-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127221

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtorrent/{libtorrent_0.16.11.bb => libtorrent_0.16.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libtorrent/{libtorrent_0.16.11.bb => libtorrent_0.16.12.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.11.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.12.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.11.bb
rename to meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.12.bb
index b04b7f1310..c9b5275a69 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.11.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_0.16.12.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 DEPENDS = "zlib curl libsigc++-2.0 openssl cppunit"
 
 SRC_URI = "git://github.com/rakshasa/libtorrent;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "dafcba711114af2274a45ca55a7bcd4abdf5ca9a"
+SRCREV = "27463ee72d83295444262d503130fb0f8cc227e0"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


