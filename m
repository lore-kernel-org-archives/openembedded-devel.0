Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E78CCD190
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:20:18 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.11100.1760433612351998957
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hbUBqJyE;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433613; x=1791969613;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nxVy6y4P8bxEBG6ktZi5ijKU3dJQzMjWLcJh6T/5Ex8=;
  b=hbUBqJyEIMkjb8WigumNdPjoipqz2BdT4iDEMuT6LXf0pvlU85fjH5i4
   4Th8tNAIoLSPRXQzuxv0kRL+abS/+2tu9YR+ONb9HiL8SnooQosJmm2WH
   0xcjY8TD7rHGhMc9fYx9MFza0+0gLdWlt0IHelNUycM9xDhl0j1F48j9T
   muzm4gwcgSTyeJP2JMYH36z1Y2ipTetLaovSmxwY2e5j+6K7gGwy7lOQz
   /GCH9wjHYXipywV2Tr3t3gsjrU1tDg+Upejs/mGWS0o0izOSota0z/O/2
   X4ZiqT/D7LM/R+6DlQGk/9U5z8gyJOkvBY3M4iMJhwz6jvIcx+vUX1B7W
   w==;
X-CSE-ConnectionGUID: osm2qGkyQ4ida+5bvlpE4Q==
X-CSE-MsgGUID: I5Y9xo+ETLSlf1v57SAOZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="219477006"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="219477006"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:20:11 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id D8D13820711
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:10 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 9266118000C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 1540F101BB77;
	Tue, 14 Oct 2025 09:20:07 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/44] python3-frozenlist: upgrade 1.7.0 -> 1.8.0
Date: Tue, 14 Oct 2025 17:19:04 +0800
Message-ID: <20251014091927.493-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120578

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- The :file:'reusable-cibuildwheel.yml' workflow has been refactored to be more
  generic and :file:'ci-cd.yml' now holds all the configuration toggles
- When building wheels, the source distribution is now passed directly to the cibuildwheel invocation
- Builds and tests have been added to ci-cd.yml for arm64 Windows wheels
- Started building wheels for CPython 3.14
- Removed --config-settings=pure-python=false from :file:'requirements/dev.txt'.
  Developers on CPython still get accelerated builds by default. To explicitly
  build a pure Python wheel, use pip install -e . --config-settings=pure-python=true

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-frozenlist_1.7.0.bb => python3-frozenlist_1.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-frozenlist_1.7.0.bb => python3-frozenlist_1.8.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.8.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
rename to meta-python/recipes-devtools/python/python3-frozenlist_1.8.0.bb
index d832494c82..cf2ed455bf 100644
--- a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/frozenlist"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf056e8e7a0a5477451af18b7b5aa98c"
 
-SRC_URI[sha256sum] = "2e310d81923c2437ea8670467121cc3e9b0f76d3043cc1d2331d56c7fb7a3a8f"
+SRC_URI[sha256sum] = "3ede829ed8d842f6cd48fc7081d7a41001a56f1f38603f9d49bf3020d59a31ad"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.43.0


