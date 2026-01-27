Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11421D2D8C9
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:44:18 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6878.1769507048952374438
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:44:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=B6u23PVV;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769507048; x=1801043048;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ydk4cyl9Z8ZbNT4KNy5AMb/R9ty+vTNM1qKlrmjUMD8=;
  b=B6u23PVVMV5rlMW/OyfOhSJ1lGsfbyWyrtqHFeUglyGXCaDdCDDZLsbI
   hrLNy3QGu73ccm5GGsi6A8Nw9hLL9CSYshsddAl9EJiys1ItD2lm992eI
   n4ko8Rrut0ZVZHQiwYC7MbyVCPXAWYpeFw9rlteZlpSg40KJV+YH33gq8
   uinSmkpr6Og7cdInSQHWQC8J/QsXlSsNd+CXT6Ju+HAdVuLdbMdFpt23o
   TCXqB8CIWjFPmXzwLedOy+RRucix3BrWx2g8Gf5+Dq2orKXrKYn+AkWKA
   jDGNKQQBSdxlz1lSnJAOLgPHA95Tg6EeOv4C6eZZXVj29G9XNCQ+w2WZB
   g==;
X-CSE-ConnectionGUID: rpUi5zJSRU27nZbmsQqqeA==
X-CSE-MsgGUID: on4uChd2QwOqN2upoq9Ifg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="215205753"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="215205753"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:44:07 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 215FE82071F
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:07 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id CE21D1809C2D
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 3D8DE20000EC;
	Tue, 27 Jan 2026 09:44:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/25] python3-bandit: upgrade 1.9.2 -> 1.9.3
Date: Tue, 27 Jan 2026 17:43:25 +0800
Message-ID: <20260127094339.1081-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260127094339.1081-1-wangmy@fujitsu.com>
References: <20260127094339.1081-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123920

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-bandit_1.9.2.bb => python3-bandit_1.9.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.9.2.bb => python3-bandit_1.9.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.9.2.bb b/meta-python/recipes-devtools/python/python3-bandit_1.9.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-bandit_1.9.2.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.9.3.bb
index 55f911bd3f..18387a6e74 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.9.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Security oriented static analyser for python code."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "32410415cd93bf9c8b91972159d5cf1e7f063a9146d70345641cd3877de348ce"
+SRC_URI[sha256sum] = "ade4b9b7786f89ef6fc7344a52b34558caec5da74cb90373aed01de88472f774"
 
 DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
 
-- 
2.43.0


