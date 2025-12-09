Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE59FD3B7F4
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:56:50 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4134.1765274204700998149
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=d/mNjPah;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274205; x=1796810205;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CIbjiFoPRa+4NKm+B8YJicOcb45DVgIixq6qkn2R0EQ=;
  b=d/mNjPahANpe/ggyFOT1X/GPZJ2BIiMRaT5Yr+m51OedMgNtyxLryUz6
   5rYkCAJXnf2QZlbvdLwYIIIvP663/Mgr+hT1C2Rf6acTFPM+2jmvpoRPM
   Yhp7A+kftjhyeQXlSrFte9fAZDKQuCfqo0mbe98RGTyCib9p7v+u2QhVm
   oWY9XeUwwYFJXEphyMF7ijehWY7kNwzoz/xWZf6J7T8N1QpJb0XHl0i4c
   va9jsHz98gNnsDKqP9Pja8eoIhfnKcN7PZ1afVWnh43nRoXUkJsr0lP22
   bukgZq2cHm7S3qL2o73IUjgiGA/XUuAsu8sivQbcdW/USYoZ6qNuwDhQD
   w==;
X-CSE-ConnectionGUID: xNDdqVTvQAm4xmDu/BBXcg==
X-CSE-MsgGUID: METOxW8WQbi3oMBrJ5KzJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="209421552"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="209421552"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:43 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 3D6F41C1C73A
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:43 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id E487BC00406
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 5F30620002B9;
	Tue,  9 Dec 2025 09:56:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/38] python3-cmd2: upgrade 2.7.0 -> 3.0.0
Date: Tue,  9 Dec 2025 17:55:33 +0800
Message-ID: <20251209095552.690-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122423

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmd2_2.7.0.bb => python3-cmd2_3.0.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_2.7.0.bb => python3-cmd2_3.0.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_2.7.0.bb b/meta-python/recipes-devtools/python/python3-cmd2_3.0.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cmd2_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_3.0.0.bb
index 10733f79d0..5f3ac7e98e 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_3.0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26efe44f9946f43292f90070d9d5590c"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "81d8135b46210e1d03a5a810baf859069a62214788ceeec3588f44eed86fbeeb"
+SRC_URI[sha256sum] = "f6fab21d2b344a3ab9fe174a6286c9fb4f43a185ad1dfacd13ef017a26a2c333"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.43.0


