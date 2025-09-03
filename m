Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A76EACAC585
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.8059.1756890229088344278
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=W+UkHo79;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890235; x=1788426235;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yuRcuciBOxlKqs0M4PiL9nK6sycOUVJKbWVeE1qHxxc=;
  b=W+UkHo79JODLVe02AB2y79MwMQVx3/KRXrmTjY7w1mXdSRbXTMEA5eQ2
   a53Uz57t42J/dDfd3w4F2n0RJK30DjZE/7PDYt+McH2M7BDznfcvTmsRU
   hKuJEOSe/b0+RFR0Ekg0nI10iIza9Ey2gDU8imuEBP/kgBB7kzPzKzA4q
   C+10Ri650WieSe6sfzQixGgU66QoHO4lCX5tC0QO/eVb+dnLfVDaL7NxJ
   4/r04CIQLQS3D2PM8fjWcsQBRlPs2IsdXroGwCXGxfn8MG1dOWR8ohG7w
   TGTbG5ksQW4e9TDlWlqSYYgYXAoCbsLfGMqxkWFxf5kRwcKWEI1CfaJ8t
   A==;
X-CSE-ConnectionGUID: sZ0AXoCdQ8WeASocZBwd1A==
X-CSE-MsgGUID: tzddIHeNR7u0QYYGg7ex9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="211549696"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="211549696"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:54 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 7DF541C1C71F
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:53 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 39319146879D
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:53 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 0F9C9823088
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 12BA61A0086;
	Wed,  3 Sep 2025 17:03:48 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/56] python3-joblib: upgrade 1.5.1 -> 1.5.2
Date: Wed,  3 Sep 2025 17:02:57 +0800
Message-ID: <20250903090317.2002-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119232

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-joblib_1.5.1.bb => python3-joblib_1.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-joblib_1.5.1.bb => python3-joblib_1.5.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-joblib_1.5.1.bb b/meta-python/recipes-devtools/python/python3-joblib_1.5.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-joblib_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-joblib_1.5.2.bb
index a678f881b8..cfb8357653 100644
--- a/meta-python/recipes-devtools/python/python3-joblib_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-joblib_1.5.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2e481820abf0a70a18011a30153df066"
 
 inherit python_setuptools_build_meta pypi
 
-SRC_URI[sha256sum] = "f4f86e351f39fe3d0d32a9f2c3d8af1ee4cec285aafcb27003dda5205576b444"
+SRC_URI[sha256sum] = "3faa5c39054b2f03ca547da9b2f52fde67c06240c31853f306aea97f13647b55"
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
-- 
2.43.0


