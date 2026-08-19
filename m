Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58868C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:11 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3293.1787132165596992174
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O5B8xSQF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132169; x=1818668169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2auVbEjp5ZdFOnQ91Dln9WKplf4TcNYJjKpTeNgO9pg=;
  b=O5B8xSQFbQ1n2f8AbV/C3Om5EYygjqOsuOhSoM87gEQlPUmj1M5L+jvf
   p6jlf52hOPefXcYoPkU/V8GVziVUOTiPEbINde4rYa/fg5JOuVvqcKYX4
   KBugzjsaxCJGuXwazOq43Eb5vuRfboFHwqWMcLz4IxmE9B+P5tm1Ih6KX
   DnUS8vi+x7nkWPpv5AE5QhpF3VnV/DKeVBBr2Me6sTVagQi3fYN6VUmWM
   9psQv3buw2BfwfjhjQNK5e4oS0Zjcgt+FRWsFVjkZ5q/RJ9BSB84IwNuO
   mCbTy1VVnVn5Zvvz+m+Hl1JUncdOgDHOGq+1MCyb63NtnucgRcwvAHx2H
   Q==;
X-CSE-ConnectionGUID: 8WiqZaCISrq7ZbDtFHNJzg==
X-CSE-MsgGUID: PMlDojB4RxetyyYqecL9OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="251862600"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="251862600"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:07 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id DE5088200BB
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:03 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 99AC4148AD36
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id AB1BE1801C0A;
	Wed, 19 Aug 2026 09:36:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/70] python3-cyclonedx-python-lib: upgrade 11.11.0 -> 11.12.0
Date: Wed, 19 Aug 2026 17:34:29 +0800
Message-ID: <20260819093514.1101-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129295

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n-lib_11.11.0.bb => python3-cyclonedx-python-lib_11.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cyclonedx-python-lib_11.11.0.bb => python3-cyclonedx-python-lib_11.12.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.11.0.bb b/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.12.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.11.0.bb
rename to meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.12.0.bb
index 192fb14d7a..f7a6706e7c 100644
--- a/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cyclonedx-python-lib_11.12.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/CycloneDX/cyclonedx-python-lib/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "4b3194db72b613717f2912447e67ab618c75ff7dcac6c4af3c0e9e1ac617c102"
+SRC_URI[sha256sum] = "16767c4039de90c04e9f03348f8f0ed4b8ff842eaa7eefcad3a95685f970dacf"
 
 inherit pypi python_poetry_core
 
-- 
2.43.0


