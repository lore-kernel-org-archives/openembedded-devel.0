Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4B8109E537
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:33 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45649.1774526247615862658
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VVX13lgT;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526248; x=1806062248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a4EzIdW4+/oVHqacMlYYM1KDV0qSDX7VBWTbwcFfoS8=;
  b=VVX13lgTiyyHVYOGKDKKQFJodSU3WcG0+ybrtCM6QfFCFekWCOU8YcMU
   i24Y+eTVfc5r5ZXooC2xjjnW+4LZF05cal2536PhpGPjHzTQrGgjENDjJ
   qmanJf7aBIMBp+eTFq/dPMyiCQD9ocBwTMKYIHsC7DkARbnZe4YszcBSO
   GWpUWadNqoWdd8p03Qlr8I7yNNIOLQqjlZA92d20+FGrbet/e3UFkSLKB
   k7wUOuvLRTkXWLomK6ImUKmneatYWqwHYgnMfFftN52Oftg3uqoxr+a+o
   bu54v1p7aJsxVWowB0AwK3bCWcwrRKJXcc5l99OFN4rb7EYzHOg0RcqNT
   Q==;
X-CSE-ConnectionGUID: oksx3pl/QS+9Ti+DIUt3SA==
X-CSE-MsgGUID: WFdpyCiCQRqWOefz9JvYJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="234669373"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="234669373"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:26 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1C3C55C14
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:26 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C3AB1C00D64
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 43C1D180714B;
	Thu, 26 Mar 2026 11:57:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/63] python3-bitstring: upgrade 4.3.1 -> 4.4.0
Date: Thu, 26 Mar 2026 19:55:58 +0800
Message-ID: <20260326115634.1199-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125683

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitstring_4.3.1.bb => python3-bitstring_4.4.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitstring_4.3.1.bb => python3-bitstring_4.4.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstring_4.3.1.bb b/meta-python/recipes-devtools/python/python3-bitstring_4.4.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-bitstring_4.3.1.bb
rename to meta-python/recipes-devtools/python/python3-bitstring_4.4.0.bb
index 31b4330c21..cec183f302 100644
--- a/meta-python/recipes-devtools/python/python3-bitstring_4.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstring_4.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/scott-griffiths/bitstring"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=963a24c175e658fbf16a764135121ffa"
 
-SRC_URI[sha256sum] = "a08bc09d3857216d4c0f412a1611056f1cc2b64fd254fb1e8a0afba7cfa1a95a"
+SRC_URI[sha256sum] = "e682ac522bb63e041d16cbc9d0ca86a4f00194db16d0847c7efe066f836b2e37"
 
 inherit pypi python_poetry_core
 
-- 
2.43.0


