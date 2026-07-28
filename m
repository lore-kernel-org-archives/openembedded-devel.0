Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8585EC54F52
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:20 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5632.1785218827523995408
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PnrNUmSz;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218835; x=1816754835;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=vxg8NDAUyl1T/+OgO8Rf9nj5AdRzhQlDxxe2HmOpPHI=;
  b=PnrNUmSzLhoBsrPpHfgoa8PyUrPh3OBDfCqXGJhvNvlh/OyN+wuhO5d2
   4C8vylYOINKeN/qGd8eI9XT0WpuBdLt4GZbpNtr1gRRG3h0dxMqsQAn5w
   VgkA+raLldUqwntrqAmGNQw3R1OE/S9ifHTc7krYKItRKToavecY8wWpD
   l0lhLQ5YSZHhaq5M0cOthIfH09GZZEFUtFlEeoyxhEBT9gqF//Ph7sdSG
   35u6xexijY5ycZVtkriu6rRD8IASyI+bRcHNFfv+iXKgwVU4dFjj9fy5z
   ABdYhcpBiEUEho4rWjJr1xPCK0q6S+Rkr6aVnVAmKqVjDHao8ScNfJgNT
   A==;
X-CSE-ConnectionGUID: Wi561W9tTVefTUFF0vQmQw==
X-CSE-MsgGUID: t8znerdAQtWqHxLHNWdWDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="246995077"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="246995077"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:07:15 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 186888204EA
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:15 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id BCABF18591F2
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:14 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 20FC610005EF
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:12 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-prompt-toolkit: upgrade 3.0.52 -> 3.0.53
Date: Tue, 28 Jul 2026 14:06:33 +0800
Message-ID: <20260728060645.819-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128490

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...rompt-toolkit_3.0.52.bb => python3-prompt-toolkit_3.0.53.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.52.bb => python3-prompt-toolkit_3.0.53.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.52.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.53.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.52.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.53.bb
index ca4c7eeb06..6bbc6413b2 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.52.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.53.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[sha256sum] = "28cde192929c8e7321de85de1ddbe736f1375148b02f2e17edd840042b1be855"
+SRC_URI[sha256sum] = "9ec8a0ad96d5c56148b3f914aa79c1564c3fde5d2e6b876e7bc327e353cf8fa6"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


