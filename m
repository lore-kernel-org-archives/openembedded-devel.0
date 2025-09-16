Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A60CAC5A6
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.15426.1758015730002344236
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O/1P2W3Z;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015731; x=1789551731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T/w4RD1xs8mlluREMtTfs1LHX3tDu+G3QoNrMqJRZkI=;
  b=O/1P2W3Ztd3+ZP62lKB8ZNyRXEMm0kKvvlSmAvfnxP9e1leLfLX73Thg
   g20QvBcaA6Pu4vVsRkNTtEqAGdFc5QbD93LTT1e08AHFGeuq3yggAIYmQ
   rWeAS9eadp2lFmwDvLVBvr0Uhre0owQncM2WGosv4+huHU78bytZlCGSc
   71NbXsu0mVP83wa+yMAvlfIsndS1JyyU0eIMXF7lfDhnM427C/NiocUzu
   RL+cbIq2bn2+RHx/8idprB5IoStHk/vZadXCU40QZI6ITRNSC7FHJ7X2E
   mSMh6hDBrxCCnbRj9gp54kLoBquEFnTtJsrBrAXmYxwMV9q0hSgYj5q0R
   Q==;
X-CSE-ConnectionGUID: K12iXIWBRcGm39co9YXzww==
X-CSE-MsgGUID: WrwhIpsITkC75gyqRj0UMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="213031805"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="213031805"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:09 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id A7F001C1C701
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:08 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 62AF314003AA
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:08 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id AB9901806DAE;
	Tue, 16 Sep 2025 09:42:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 33CFC1A0096;
	Tue, 16 Sep 2025 17:42:03 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/42] python3-icecream: upgrade 2.1.7 -> 2.1.8
Date: Tue, 16 Sep 2025 17:41:34 +0800
Message-ID: <20250916094152.1479-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119448

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-icecream_2.1.7.bb => python3-icecream_2.1.8.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-icecream_2.1.7.bb => python3-icecream_2.1.8.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-icecream_2.1.7.bb b/meta-python/recipes-devtools/python/python3-icecream_2.1.8.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-icecream_2.1.7.bb
rename to meta-python/recipes-devtools/python/python3-icecream_2.1.8.bb
index 99aaff7e7d..71ad6ab98c 100644
--- a/meta-python/recipes-devtools/python/python3-icecream_2.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-icecream_2.1.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gruns/icecream"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eca5ce1610d64ed40920efdce85ff8d1"
 
-SRC_URI[sha256sum] = "936df053e65ff3c7a219fa79311b32bdae19aad83dd2e23d153ab8864b78acd9"
+SRC_URI[sha256sum] = "37269bbc62b02f0d85bfaf3a0eb4df272c967fad059f7ddcdaee5303ea2b2a62"
 
 inherit pypi setuptools3
 
-- 
2.43.0


