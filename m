Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 606DCCAC5A2
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.15426.1758015730002344236
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CQemEkIZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015730; x=1789551730;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BZ5Fhpuvzj94xvu9CW+xsHytp9uVqAMkHmmKJJPUYh8=;
  b=CQemEkIZ2CeNjWQJo2o5JRnGIorp2mFWxIMNbxXK+SH2GPe80sVdwkWF
   xaYTjGtdl84tqElxsXp7HnOS3s2UYW9MQr5jnRY9/4VKsMuMBLk7ARKv7
   ayoxP6DwVXZwFhF/KKIX6jfR9pQas6eTLd5Fb0Vj5RkeG0Kx7t+yWbTzN
   DHUNYVD2l4zdVj37av3/UYbqmbIpamVccGe1nCuqnF2xnz7rwwNF8mWrN
   flQgVwv/RnJBiaz9spixRuXQ0OBbfb5qmv0+I+dRWcV43O2BuFhleJV9f
   cfCq//rRNcS5xFt4TlWKXbakSXP+kwmivC8cDmHg1dRS2Pv7tibsKK8OS
   A==;
X-CSE-ConnectionGUID: 2lymv1LKRYe1zcQn1wKiaw==
X-CSE-MsgGUID: BgwStMrOTEGSvusb2zoHkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="213031804"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="213031804"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:08 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 4D5CA1002B8A
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:08 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0723618000CD
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:08 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 5574A18076D1;
	Tue, 16 Sep 2025 09:42:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D17781A009B;
	Tue, 16 Sep 2025 17:42:02 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/42] python3-httplib2: upgrade 0.30.0 -> 0.31.0
Date: Tue, 16 Sep 2025 17:41:33 +0800
Message-ID: <20250916094152.1479-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119446

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-httplib2_0.30.0.bb => python3-httplib2_0.31.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httplib2_0.30.0.bb => python3-httplib2_0.31.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.30.0.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.31.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-httplib2_0.30.0.bb
rename to meta-python/recipes-devtools/python/python3-httplib2_0.31.0.bb
index 17e4a745ad..9cde7acd3a 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.30.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.31.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56e5e931172b6164b62dc7c4aba6c8cf"
 
-SRC_URI[sha256sum] = "d5b23c11fcf8e57e00ff91b7008656af0f6242c8886fd97065c97509e4e548c5"
+SRC_URI[sha256sum] = "ac7ab497c50975147d4f7b1ade44becc7df2f8954d42b38b3d69c515f531135c"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


