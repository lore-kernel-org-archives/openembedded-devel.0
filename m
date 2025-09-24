Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBC6CAC5BB
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:55 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.8318.1758704442458090056
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dGgKDq1+;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704447; x=1790240447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ejcsb/gFW2U6RQ/VLrOtQmnVv6xQYpJFB5Uj4NMLW3Q=;
  b=dGgKDq1+xn17XJcb3CtKP8ezdA+SdFb/WzPtbYXVw7NB/kODy+Kz+NnJ
   hjsGIv3hpHrSMwRgLc03jQzgtwQnHYaX72UT9/vYSa7cdhBdLd1+kTQBN
   zG2LTFxA9ycWJ855JjsKfLZXrdFKOEtR/VxLPr+UpWeAqLgCTcg8h0niE
   PeJNsJxNPtkaXKduCgBugR+XNXBl1KwjvM8ZR3rr/0wjaGIzRGYmLVPwO
   c7pap6diAG5RRnB0FgJIrslhUI5S/wlpdmor2c6XomRKhNw1O8dt/Gha0
   xUmmW84+zGexOIH2EObX5ekk2BM5WdjbrWmoZH8SNz7McD+i86fyhT7c9
   g==;
X-CSE-ConnectionGUID: DPrxXPEsRJyKDLgxNw7eMQ==
X-CSE-MsgGUID: RKmTeQTAT+a7m13s17PbZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="217279691"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="217279691"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:46 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id C6B64820701
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:45 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 81697140060A
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:45 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id DF51D200108D;
	Wed, 24 Sep 2025 09:00:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D7AAE1A0073;
	Wed, 24 Sep 2025 17:00:40 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/29] python3-inline-snapshot: upgrade 0.28.0 -> 0.29.0
Date: Wed, 24 Sep 2025 17:00:24 +0800
Message-ID: <20250924090029.1786-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119787

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.28.0.bb => python3-inline-snapshot_0.29.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.28.0.bb => python3-inline-snapshot_0.29.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.28.0.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.29.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.28.0.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.29.0.bb
index 89b3757d7b..c26f55111f 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.28.0.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.29.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "6904bfc383240b6bea64de2f5d2992f04109b13def19395bdd13fb0ebcf5cf20"
+SRC_URI[sha256sum] = "8bac016fc8ff4638a6cdebca96d7042fecde471f0574d360de11f552ba77d6b5"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


