Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C65B6C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:30 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5787.1785218847284870318
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BZK4HDtB;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218850; x=1816754850;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=xD92fMeSeQwjerGvVRybYrj3nzT7CUZ+hUop5jYU8nw=;
  b=BZK4HDtBDWYKxP9H+DVwf2+KbttqVBOshYrrAyonY0yZKW3dgH6oaCM7
   bDer9ugIojXkZS08/0rMP4fF599qp8nE6twrIBMewIZ+/rdYjWbAZdbzk
   3r1P9XBkUt4ScTUrZJxy93OcMqjCHu+55d3cyc+vObhRQNBdhXTmGQ9jQ
   5ofym06KV1yU8E/yNRg3m8p8FXVwAvDJKdwZPGGX5F9PUETi3TGLvJeJQ
   1D3hOxANtM1IE7e4h8dfpQSsjiybPQ6KFBAUVJ8r/ST1YBm1wfpuQLQFD
   pleqiAkJaqK3BKV86wZSj/+c6YAlO1l+jhdJc+p0lu4tBpB2PVFHntCZM
   w==;
X-CSE-ConnectionGUID: TV0h+lRKR3G93VmH+1B/ng==
X-CSE-MsgGUID: h28yhUYnR/G3bHCWW+GATw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="248766250"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="248766250"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:07:30 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 9D80A82040C
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:29 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 5696083D952
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:29 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id ADF6B10005F0
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:27 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] tesseract: upgrade 5.5.2 -> 5.5.3
Date: Tue, 28 Jul 2026 14:06:44 +0800
Message-ID: <20260728060645.819-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128501

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tesseract/{tesseract_5.5.2.bb => tesseract_5.5.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/tesseract/{tesseract_5.5.2.bb => tesseract_5.5.3.bb} (91%)

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
similarity index 91%
rename from meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
rename to meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
index 46b789cbc4..0d9b178dc9 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.3.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://github.com/tesseract-ocr/tesseract/issues"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "6e1d56a847e697de07b38619356550e5cf4e8633"
+SRCREV = "db0ec62f81b0737fbbe184d8fea40af5738f8eef"
 SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https;tag=${PV}"
 
 
-- 
2.43.0


