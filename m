Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B1EC61DC7
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:09:53 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7655.1787731792268761596
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mIE13G5I;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787731792; x=1819267792;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tViVsy+AnH74y+an2emgiN15uKeRovHavZOVSuynIjk=;
  b=mIE13G5I2nqBJowxfs1l5Kn73Mtt73qLfi9WffHIdON3V/QiDW0Zh3lg
   PPBi2gq76wfcdIsno6woyOpRxaf6K6JcKYCQtQR5HH9GjzYO4V9FyHoVY
   fNrCYzCLU3nUw2xJfXx60+ZoeCHl+O1Fw4Vy5zbRkYh9bTIcHyg+kW943
   UNNP4e3XRxtwI0F/vk6o7CGEvoPiDC6E5cbwC0Uhqz6NmRZDGssbPS1T2
   J3k7AvJVHy4D27ri2HxX0aVLUNP6bQDohW6yUWQN0nbiRjr9cGLe9FWxK
   5aA+B92TiKsuGF+e37nfCLHanP/GSo8oZtwwIWOThy79jwhF3YXo1M496
   Q==;
X-CSE-ConnectionGUID: M0MstjWaSNGl+N5elihtnA==
X-CSE-MsgGUID: eooSPxwzQC6rqdir3Nq1KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="238886773"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="238886773"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:09:50 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B87D23D14
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:50 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 6C8671024ABC
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 7A92D14000B3;
	Wed, 26 Aug 2026 08:09:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/23] python3-faker: upgrade 40.36.0 -> 40.37.0
Date: Wed, 26 Aug 2026 16:09:15 +0800
Message-ID: <20260826080926.989-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826080926.989-1-wangmy@fujitsu.com>
References: <20260826080926.989-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129504

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-faker_40.36.0.bb => python3-faker_40.37.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-faker_40.36.0.bb => python3-faker_40.37.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-faker_40.36.0.bb b/meta-python/recipes-devtools/python/python3-faker_40.37.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-faker_40.36.0.bb
rename to meta-python/recipes-devtools/python/python3-faker_40.37.0.bb
index f0d0207a23..60c999900b 100644
--- a/meta-python/recipes-devtools/python/python3-faker_40.36.0.bb
+++ b/meta-python/recipes-devtools/python/python3-faker_40.37.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/joke2k/faker"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=53360c4126f7d03b63cb79b0dab9e9e1"
 
-SRC_URI[sha256sum] = "754048c76c03afa7de83eee8f4bcee3cf668cbb7d995f54a4e9678db7f110308"
+SRC_URI[sha256sum] = "a92dff7f310e61fb544c61720e15edb2e7448bc33d15a321a99e9ab7b94abf54"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.43.0


