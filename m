Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47B6D11700
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:52:09 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4294.1764669123322025919
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:52:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VxUPttLG;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669122; x=1796205122;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4QRYAHYUMe6EdyYTTqZFuYjy6uMRAjy8w2J8929SHj8=;
  b=VxUPttLGlJhAix6h5FB4DuaL6YCsQlYQehe8bvX+7ZstKj5753iRGuK6
   6+1eXUrwt8OdpbyvBTKlUgWAN/svoNRbQBHRBqr37s2yDWX0oCJC8lD6s
   +3RydVrOtR80bO+YULKgXjxu/8WL/AeusI8A/nknPNB/MFy1fNj8hL5uL
   rUcsg5GJ+k2igw5Ucg4CyVfHBtIVfaZKLL0QROMwM6FViahOPrjyLE0zY
   WMNcjMrQY8eSBOdH9vLiuciJTnkv/U3zQdn/t70LibTMPwfkQQeJBl/pf
   eL/ZOlnbR1YoGxtBPWJM+U/F0ZP5xkCoD87k+9lwnGg4RmkecR/2td++L
   A==;
X-CSE-ConnectionGUID: gu+Y6j8wSeenXRqICaR6jA==
X-CSE-MsgGUID: 2zhNspWgQeO/NeBtvNZfUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="221179397"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="221179397"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:52:00 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 808161C1C715
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:01 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 30AFA8D29FE
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id B314A101A432;
	Tue,  2 Dec 2025 09:51:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/25] python3-beautifulsoup4: upgrade 4.14.2 -> 4.14.3
Date: Tue,  2 Dec 2025 17:51:18 +0800
Message-ID: <20251202095132.652-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122244

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* When using one of the lxml tree builders, you can pass in
  huge_tree=True to disable lxml's security restrictions and process
  files that include huge text nodes.
* The html.parser tree builder processes numeric character entities
  using the algorithm described in the HTML spec.
* Added a general test of the html.parser tree builder's ability to
  turn any parsing exception from html.parser into a
  ParserRejectedMarkup exception.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...eautifulsoup4_4.14.2.bb => python3-beautifulsoup4_4.14.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-beautifulsoup4_4.14.2.bb => python3-beautifulsoup4_4.14.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.14.2.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.14.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-beautifulsoup4_4.14.2.bb
rename to meta-python/recipes-devtools/python/python3-beautifulsoup4_4.14.3.bb
index d1222fe05b..bd9725e2de 100644
--- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.14.2.bb
+++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.14.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=96e0034f7c9443910c486773aa1ed9ac"
 
-SRC_URI[sha256sum] = "2a98ab9f944a11acee9cc848508ec28d9228abfd522ef0fad6a02a72e0ded69e"
+SRC_URI[sha256sum] = "6292b1c5186d356bba669ef9f7f051757099565ad9ada5dd630bd9de5fa7fb86"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


