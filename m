Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32BD1EA3C42
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:34:21 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.129140.1775730856827881685
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CyBMnqpV;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730857; x=1807266857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qlr36qxGzJmPRpNX5de40hkXAhyQC0PHzJ2cuM1hVPs=;
  b=CyBMnqpV1iCRQZ45DwYy04tL0YqI24vG0LoqOwUGEAihrBmUbzIdZLqI
   7ZzCZs8KKjSi4VecGeYr7f95lshMOdY9gvr20N8LVMAGFOnObw6/aNsmi
   YGSOJ9DnJxQcTooBuT2shjsCeZlFyHyAgimbuQ5KbeagWyxvO6BPK0xOG
   OSDK1xD7z3zZuR6PJqRl7pQNERmaHiKM5Onh+vUDBRMnjrm4QE1SqYmd/
   gTqVWFTH5TFN2EW6OtwajVb1VkDRMDKDOEPjcV4yWVazeL/bUo3Eb/Lcy
   OF938bPYDRPlZ4zWW6gYbp31u4jKwPQlfzqjoS3K7J3eOr24a689TH2dL
   g==;
X-CSE-ConnectionGUID: 5o5fEcK2REmxl0R+Abv2mQ==
X-CSE-MsgGUID: Xg/JwRMkSeqI96t9mjwohA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="215398750"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="215398750"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:34:15 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5F3621C06200
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:15 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 1616E14003A9
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 98460404333;
	Thu,  9 Apr 2026 10:34:12 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/37] python3-regex: upgrade 2026.3.32 -> 2026.4.4
Date: Thu,  9 Apr 2026 18:32:13 +0800
Message-ID: <20260409103223.1574-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126176

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2026.3.32.bb => python3-regex_2026.4.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2026.3.32.bb => python3-regex_2026.4.4.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2026.3.32.bb b/meta-python/recipes-devtools/python/python3-regex_2026.4.4.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2026.3.32.bb
rename to meta-python/recipes-devtools/python/python3-regex_2026.4.4.bb
index a2091df806..3d4d7a3e99 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2026.3.32.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2026.4.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "f1574566457161678297a116fa5d1556c5a4159d64c5ff7c760e7c564bf66f16"
+SRC_URI[sha256sum] = "e08270659717f6973523ce3afbafa53515c4dc5dcad637dc215b6fd50f689423"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.43.0


