Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECFFCA0FF1
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 09:00:20 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.4684.1755766819926677313
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 02:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VFjxU0sH;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755766820; x=1787302820;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LL4lxDwNPgQU6OWbGYhsoC1ZXch50EpzTk/3nrPumG0=;
  b=VFjxU0sHrPBpsdc3aP5RgMRH0QY9wT4d4BYxgW0Ok4h3KlHxHEFUvPNA
   UGIU18FLhw3QFMiGrGxBswj+31RkAUz5LnrZAsfuGy8YnJZkZWDxJyWnw
   K3X/TpNvp3RUXPDgZgBxIQ0c9dL0b5dfJm10O94kPBc7qUSG72rc84LlD
   +eR4H1UPbXfQ8+IZ6pTpeXigqGDahSD20wpV71fWzjduiN9DJrS3t6odO
   6n1x+ZLb/Rv2v99Qo03JQXl7h+gMvOzQTkOc/tF/hKGuMr0agQ1oKbUUm
   8aSwnShabFmz+N71g/pFPBnL4ozGCzQvPJG3duNGqh07H6JXr6ZtFXmUe
   Q==;
X-CSE-ConnectionGUID: zi+JWm1aQd+GcXFnJ21awA==
X-CSE-MsgGUID: KE0C1G+bSvygEYIe6tAhqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="209487510"
X-IronPort-AV: E=Sophos;i="6.17,306,1747666800"; 
   d="scan'208";a="209487510"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 18:00:19 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 694A51C1C720
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:18 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 23190140B054
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:18 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id D1958826FE6
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EB5461A0069;
	Thu, 21 Aug 2025 17:00:11 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/21] python3-yamlloader: upgrade 1.5.1 -> 1.5.2
Date: Thu, 21 Aug 2025 16:59:53 +0800
Message-ID: <20250821085954.2056-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250821085954.2056-1-wangmy@fujitsu.com>
References: <20250821085954.2056-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119070

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 deps: add PyYaml module as runtime requirement

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-yamlloader_1.5.1.bb => python3-yamlloader_1.5.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yamlloader_1.5.1.bb => python3-yamlloader_1.5.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-yamlloader_1.5.1.bb b/meta-python/recipes-devtools/python/python3-yamlloader_1.5.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-yamlloader_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-yamlloader_1.5.2.bb
index 11d7cf96fb..48fadb476e 100644
--- a/meta-python/recipes-devtools/python/python3-yamlloader_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-yamlloader_1.5.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/Phynix/yamlloader"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6831ef36faa29329bce2420c5356f97e"
 
-SRC_URI[sha256sum] = "8dece19b050acb1c6a8ca14aa30793388f9be154f734b826541f9a1828d41cec"
+SRC_URI[sha256sum] = "c10ac1321a626b1ca8b09d3f3afe9855b818391c59992a76b65e4a2d95eac41b"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


