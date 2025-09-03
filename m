Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3377FCA1014
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.7939.1756890232276940491
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JSNRF1Ge;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890238; x=1788426238;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lQAn6qGkAzPXo2+vXcFoiW9mmW/C5N1ZGQTqNb5U9yM=;
  b=JSNRF1GehwxYCD9QAVXlHR2cyebm2gELvZ3yCZA8CwYW9fjZGIUJTB8Y
   JDIpuav/MgL++SIZrH1fJCypXok9Sdfl8QXNT64afPsRIfO7t86yqq58l
   XgQJd+jvkabsc+gUb92/34ZYZRC/vVln2UxgRDrG/49JUJgr5BlyG5RM8
   dFRyaitMye8yk5RAbEbYdu39QYnxji4I5/GPz1RUoakmIV9FGaPMcVNoS
   4TkclTeUYW35KYj5kSrWsXcCv0JERzrun/nEZRt7c2UNb4kR8oc7ksp5J
   Vn4LETEHPUCcXl0ILHBgFnhSsfilRGFoQ1bqfR2flkhg+M2HqqDPF1ZEK
   w==;
X-CSE-ConnectionGUID: UkC9a1hsQqmUxP6XH/vOQw==
X-CSE-MsgGUID: PIG9ch2IQ9G++J1eYXrB7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="199987487"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="199987487"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:58 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 121981C00095
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:58 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id BEE941150720
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:57 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 980571003105
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B589D1A0073;
	Wed,  3 Sep 2025 17:03:52 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 48/56] python3-scikit-build-core: upgrade 0.11.5 -> 0.11.6
Date: Wed,  3 Sep 2025 17:03:09 +0800
Message-ID: <20250903090317.2002-48-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119244

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...build-core_0.11.5.bb => python3-scikit-build-core_0.11.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-scikit-build-core_0.11.5.bb => python3-scikit-build-core_0.11.6.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.5.bb b/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.6.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.5.bb
rename to meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.6.bb
index fd175feebf..73cbf2a3f9 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.5.bb
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.6.bb
@@ -10,6 +10,6 @@ DEPENDS = "python3-hatch-vcs-native"
 inherit pypi python_hatchling
 
 SRC_URI += "file://0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch"
-SRC_URI[sha256sum] = "8f0a1edb86cb087876f3c699d2a2682012efd8867b390ed37355f13949d0628e"
+SRC_URI[sha256sum] = "5982ccd839735be99cfd3b92a8847c6c196692f476c215da84b79d2ad12f9f1b"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


