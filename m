Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D0FFEE4DD
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 09:02:18 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.115986.1772269332225638998
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Feb 2026 01:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=prL2iPf6;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772269332; x=1803805332;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=C4num1m7YzamaXUMWPrf3BS+dIfidj8dPj2GUm7Jf/Y=;
  b=prL2iPf6pY7ZS3yvFHjScxE7ZByG0asQcWOinknELyHaA7ozndzD5klN
   qg8q9HeFyYWkYlWAU0NyEF1hB1C2NZ9QgLckUMJ+G5bcwSd6GVRyly8K1
   f2vrtBuPu26FAP3KrhEAhJPPlaX+VGtgm0NV35HLQUq9tEUguw74lkh8s
   ITECOKdlbJCOgbZ9u9bq0hcgIKQ71XsnuoGXTE/N1PqDTxTNB4cD/Nk7A
   NEfpim10puWLBVMRJHz+Tb9wV+TMeVBcESITcMlWKWD4clMna05qJm4K3
   kLuNmRIrPywn6SYLmxi04XZyYfKcND3P6ydwnqQACq33SrKWhNDufBbGB
   w==;
X-CSE-ConnectionGUID: t1wBz+rMQOqLGp4V69x3uw==
X-CSE-MsgGUID: ciUJ2xHgTZeDfALJJMLtHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="230812032"
X-IronPort-AV: E=Sophos;i="6.21,315,1763391600"; 
   d="scan'208";a="230812032"
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.fujitsu.com (Postfix) with ESMTPS id 6D69D8200B4
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:10 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 24D65C060B4
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:10 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id C579E101C936
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:07 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-uvicorn: upgrade 0.40.0 -> 0.41.0
Date: Sat, 28 Feb 2026 17:01:59 +0800
Message-ID: <20260228090204.3587-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260228090204.3587-1-liuyd.fnst@fujitsu.com>
References: <20260228090204.3587-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124771

1.Changelog:
  https://github.com/Kludex/uvicorn/releases/tag/0.41.0

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../{python3-uvicorn_0.40.0.bb => python3-uvicorn_0.41.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-uvicorn_0.40.0.bb => python3-uvicorn_0.41.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-uvicorn_0.40.0.bb b/meta-python/recipes-devtools/python/python3-uvicorn_0.41.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-uvicorn_0.40.0.bb
rename to meta-python/recipes-devtools/python/python3-uvicorn_0.41.0.bb
index 227202b8cc..4d12f87c80 100644
--- a/meta-python/recipes-devtools/python/python3-uvicorn_0.40.0.bb
+++ b/meta-python/recipes-devtools/python/python3-uvicorn_0.41.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5c778842f66a649636561c423c0eec2e"
 RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
 
-SRC_URI[sha256sum] = "839676675e87e73694518b5574fd0f24c9d97b46bea16df7b8c05ea1a51071ea"
+SRC_URI[sha256sum] = "09d11cf7008da33113824ee5a1c6422d89fbc2ff476540d69a34c87fab8b571a"
 
 SRC_URI += "file://0001-ptest-disable-failing-tests.patch"
 
-- 
2.43.0


