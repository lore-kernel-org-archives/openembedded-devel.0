Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3988DCA1015
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.7942.1756890237538199410
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GD7S1RO+;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890238; x=1788426238;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lvXcaJ+88RHxqjM7VkKnmTbb03DHbfZHvE+6myarh4M=;
  b=GD7S1RO+ilYRF4Twe2bg94bftKc9dffFsr2PNV6xeJLQjpMWa/sqjl1n
   HeBdH7DDJOQ0CAEOz2eNNX0znT/xMxCnNvxUdMQ2gu8HxpcHc6qjpDD2A
   RSc8XzTMiE5Lhfjc+ojh1aztYN+QiNBGVrxtiyvUFgSofOa+VeYFv+1Kq
   mMiatMbIeuoUgR5RFgMljJXei6WGwO45NtgxD8oeGjBvGVQyZjzlBooL5
   kUzUuavH0eUhydQkOgfudBJI6/iZsiBrZw8H5ClR3B0W/0M4aMHety2vU
   0VCxGM8tnCAtQstQLqKddbRJ4KXhgZ/aYVq8UBGEfS/p/PH2KWPOtODUF
   w==;
X-CSE-ConnectionGUID: y+tLxNZXTbqlf9LtnBdd5Q==
X-CSE-MsgGUID: abM/X/ShQEyHpE6wB2K4Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="198903385"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="198903385"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:57 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 8137FC00354
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:57 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 36F39C5B46F
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:57 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 40660140769A
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5D98D1A0071;
	Wed,  3 Sep 2025 17:03:52 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 47/56] python3-regex: upgrade 2025.7.34 -> 2025.8.29
Date: Wed,  3 Sep 2025 17:03:08 +0800
Message-ID: <20250903090317.2002-47-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119243

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2025.7.34.bb => python3-regex_2025.8.29.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2025.7.34.bb => python3-regex_2025.8.29.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2025.7.34.bb b/meta-python/recipes-devtools/python/python3-regex_2025.8.29.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2025.7.34.bb
rename to meta-python/recipes-devtools/python/python3-regex_2025.8.29.bb
index 94063b31cd..c3e9002267 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2025.7.34.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2025.8.29.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "9ead9765217afd04a86822dfcd4ed2747dfe426e887da413b15ff0ac2457e21a"
+SRC_URI[sha256sum] = "731ddb27a0900fa227dfba976b4efccec8c1c6fba147829bb52e71d49e91a5d7"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.43.0


