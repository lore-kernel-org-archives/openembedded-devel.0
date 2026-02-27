Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8253AFD7F84
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:40 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92757.1772187332391460657
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:15:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ds6dv68Z;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187332; x=1803723332;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vHj44Wy1cI+UI7RThaSc5AKax8BBX7PzRl6rlWRxmDY=;
  b=Ds6dv68Z2Ebm6muu0SLA9GOMuZ9dt7fSzXRtwZ3a76Zjq1SxKOZXlU8x
   b6NQ62Lao61ULcDtbaXjoKI43bAsowci94yjI7B0zfR9FBaiLvOwDXZOa
   s8y/i7vgMT0miewWvLjHJhWaisl2Rrsv/C4tu9AgHYJTD7EPZtHr1W6PQ
   q2EsRzdzYSLhR4a4oStTcHUo7oUgiNRlM+HJZ/Igm4dhU7FjgSo2posqc
   nHKqLiKOJKffQFVa2xmlBuMqvr9t+ddrCuxDKjsyV9r0G0SwXXVU2+qI/
   ckr6bP5FPPiUuS5udQbujCtGtqz1Xy7QUvQEciJMyM+2kiIjEfGfmfp2l
   A==;
X-CSE-ConnectionGUID: 1RLceOaLSdK4LRqqwYWTSQ==
X-CSE-MsgGUID: sbBsUOCrQf6UNIa+zgE4bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="210131650"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="210131650"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.fujitsu.com (Postfix) with ESMTPS id C5D851C1C706
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:30 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 7C284180ABD6
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8F190180059F;
	Fri, 27 Feb 2026 10:15:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 43/52] tftpy: upgrade 0.8.6 -> 0.8.7
Date: Fri, 27 Feb 2026 18:13:18 +0800
Message-ID: <20260227101327.1432-43-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124743

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/python/{tftpy_0.8.6.bb => tftpy_0.8.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{tftpy_0.8.6.bb => tftpy_0.8.7.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/tftpy_0.8.6.bb b/meta-python/recipes-devtools/python/tftpy_0.8.7.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/tftpy_0.8.6.bb
rename to meta-python/recipes-devtools/python/tftpy_0.8.7.bb
index 74889c2841..7bb1ebeb57 100644
--- a/meta-python/recipes-devtools/python/tftpy_0.8.6.bb
+++ b/meta-python/recipes-devtools/python/tftpy_0.8.7.bb
@@ -8,6 +8,6 @@ HOMEPAGE = "https://github.com/msoulier/tftpy"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=22770e72ae03c61f5bcc4e333b61368d"
 
-SRC_URI[sha256sum] = "f616f6a43a36d481c266573608597b9dd3c7c63818415d72aa04f1d1795480ea"
+SRC_URI[sha256sum] = "e8a5aa092dab2e1cbb9b94392036827b808dc37eb6cf1b1ab33c81957b3f5fe2"
 
 inherit pypi python_setuptools_build_meta
-- 
2.43.0


