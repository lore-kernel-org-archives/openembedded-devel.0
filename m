Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98265C44501
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:45:41 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4721.1783503938447349956
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=D1PL+KDp;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503938; x=1815039938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E8CoarAvqyjxYjck15cZJ7Kt5CsBN7x4YViBFSEPIp8=;
  b=D1PL+KDp9f/oqEWINwldgsJ59QRcLTe1nCVZWrgYu5HYJ924yo6J7kts
   pRm9E4gwoYOKr5ijIOJ+PLIBPGkkQdErbHgDvKUqavcFXQSKnXMR6C6dh
   HKobhKL2Wc9XppLGLG/V4ouTvKJvp9/qMdIBNAqBrqdq2c4KS55fmKUuc
   8swWk95hHbepJ3/MEassoTII9IE5l7uE9sQxpGOpwt+iUeIglvJNT2w+R
   rkcRpbSe4cufRdoo2girJrx80Kvw+ulcEZM8RzXGjMS0zQCBlXfBeSL6w
   YNJ/9W1c1Y0KHO1OyklYJMZwsSk8a4bFXDSEHPipMC+tpX5Y59K7Ysvct
   A==;
X-CSE-ConnectionGUID: oOa3RE+KRIuudhj8p1B9Og==
X-CSE-MsgGUID: md37qOq5Ry+TRCdSzS4M8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="234112702"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="234112702"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:36 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D2ACC1002812
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:36 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 8C45618594A0
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id BE9D51801131;
	Wed,  8 Jul 2026 09:45:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/37] python3-aiohappyeyeballs: upgrade 2.6.2 -> 2.7.1
Date: Wed,  8 Jul 2026 17:44:24 +0800
Message-ID: <20260708094508.2060-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:45:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128085

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Use defaultdict to help with performance
- Simplify _interleave_addrinfos family grouping
- Collapse collect-then-remove pattern in utils helpers
- Merge identical except blocks in _connect_sock cleanup
- Add python 3.14 support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...happyeyeballs_2.6.2.bb => python3-aiohappyeyeballs_2.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohappyeyeballs_2.6.2.bb => python3-aiohappyeyeballs_2.7.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.6.2.bb b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.7.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.6.2.bb
rename to meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.7.1.bb
index 05edac0c5b..918c11f96b 100644
--- a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.7.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohappyeyeballs"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 
-SRC_URI[sha256sum] = "e202810ee718bd01fc6ef49e8ea53d023d5cb6b581076d7925aa499fa55dbe64"
+SRC_URI[sha256sum] = "065665c041c42a5938ed220bdcd7230f22527fbec085e1853d2402c8a3615d9d"
 
 inherit pypi python_poetry_core
 
-- 
2.43.0


