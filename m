Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E18CCFD37B
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:17:38 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13251.1764062250515191233
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:17:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZXklvPd8;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764062251; x=1795598251;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9drP0GiJGccmvfzbFwum82MnApP2ufbV5XGJH0SYB58=;
  b=ZXklvPd80l7tWU42ykkGLB81ABoHW4mpyPVDVMrcvx9u/qr70e9+TArh
   /2n6b/1mHc/xwFYNUaW9R7F3fUUEa3ljgZJizrGoxfqYCe8WOOaPs/UbT
   D++HxgJxjppmt6ZR89LknJZugI51i+p7lVqZ1hRdVYN9bAfgVlLblHFPk
   rxsNjUDm9Aum9JGXq6O9d1pgA7qAKtsNle/VP40LXGB47Uv0M7qR252K7
   Va9VpStG/DQXMd6H/YcQRd/69BHUf+DwIfKIdnEc8cPP5KR54yFlt8DCw
   MBdxXih9UKxjFGKx+IiAiZmTIFO/GRahcCw7oHNFQqJt2eBGy6z7zgYGM
   Q==;
X-CSE-ConnectionGUID: r6ePrs1sRRWtQFmnaNhvpQ==
X-CSE-MsgGUID: xxw7lwmpQ5SI2It14qtl7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="224150060"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="224150060"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:17:29 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id EB2F61C1C700
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:28 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A2A168D29E5
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 3312C101A420;
	Tue, 25 Nov 2025 09:17:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/26] python3-rich-argparse: upgrade 1.7.1 -> 1.7.2
Date: Tue, 25 Nov 2025 17:17:09 +0800
Message-ID: <20251125091714.1420-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251125091714.1420-1-wangmy@fujitsu.com>
References: <20251125091714.1420-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122047

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix colors overlapping with Python 3.14.0+ which enabled colors by default in the help formatter.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-rich-argparse_1.7.1.bb => python3-rich-argparse_1.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rich-argparse_1.7.1.bb => python3-rich-argparse_1.7.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-rich-argparse_1.7.1.bb b/meta-python/recipes-devtools/python/python3-rich-argparse_1.7.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-rich-argparse_1.7.1.bb
rename to meta-python/recipes-devtools/python/python3-rich-argparse_1.7.2.bb
index 8228a509a3..1d0d6ecba5 100644
--- a/meta-python/recipes-devtools/python/python3-rich-argparse_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-rich-argparse_1.7.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=06f5c372171ce02f7e6a18f5f57f0b69"
 PYPI_PACKAGE = "rich_argparse"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "d7a493cde94043e41ea68fb43a74405fa178de981bf7b800f7a3bd02ac5c27be"
+SRC_URI[sha256sum] = "64fd2e948fc96e8a1a06e0e72c111c2ce7f3af74126d75c0f5f63926e7289cd1"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


