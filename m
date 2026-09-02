Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044E8C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:29:29 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9722.1788344963491590276
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ShjFvvEX;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344964; x=1819880964;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SrvcK1n+45KD0A0K1exXoALslIppfcIUjuNA87HcuL8=;
  b=ShjFvvEX50Ivc19EIh2MGwZmoE1HWY6sxCky29R3siS37cRygU8UMsSs
   NsTr/L/33Of5CGOjBmoV3ibuYBjZFzHnyJfFcIW68vDD0+7sWtyH3jhUA
   +fZ9l7bV5QLWJUoK8zgRBILRO6JLWdtv3n2M1gHdhI5hZeK1APsDJJX+f
   BVACezQxvmxn+1X7T93tF0f+rAKZcUPoY2Z3cgbIREYfTvDDJeBYbWz1q
   Ew+0lUfECP4bZSwAvJ9f2qAvsTVbP3AqHWtWqekZ15tLG+UOd0we+SXHy
   7aLEFFjc/TnzsnK/nU/oIs75HjxcxjHvmjJ/Zep9UvB79KPzvOMvr4z6h
   w==;
X-CSE-ConnectionGUID: k1WKVWKzRq+BaSXdxecz8g==
X-CSE-MsgGUID: Xyf6rpZgQOyeBjnlg0ut+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="241545545"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="241545545"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:23 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B737D42A309
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:23 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 692B3C00D43
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 818BC2000224;
	Wed,  2 Sep 2026 10:29:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/34] python3-ansi2html: upgrade 1.9.2 -> 1.9.3
Date: Wed,  2 Sep 2026 18:28:36 +0800
Message-ID: <20260902102900.1296-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:29:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129669

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ansi2html_1.9.2.bb => python3-ansi2html_1.9.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ansi2html_1.9.2.bb => python3-ansi2html_1.9.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-ansi2html_1.9.2.bb b/meta-python/recipes-devtools/python/python3-ansi2html_1.9.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-ansi2html_1.9.2.bb
rename to meta-python/recipes-devtools/python/python3-ansi2html_1.9.3.bb
index cb9234b904..1a89683ac3 100644
--- a/meta-python/recipes-devtools/python/python3-ansi2html_1.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ansi2html_1.9.3.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPL-3.0-or-later"
 
 PYPI_PACKAGE = "ansi2html"
 
-SRC_URI[sha256sum] = "3453bf87535d37b827b05245faaa756dbab4ec3d69925e352b6319c3c955c0a5"
+SRC_URI[sha256sum] = "190b3fc65f0545fec6442527f8f55131949410fe97c15ac42a441f1e96726f57"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


