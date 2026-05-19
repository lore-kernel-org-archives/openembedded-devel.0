Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6DECD4F57
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:40:23 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19318.1779190814834330189
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OeC12kkV;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190815; x=1810726815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BuGf0pAe5UCp+hYeTa7Z4r1ChOD67Dr7disPus9wSI0=;
  b=OeC12kkVONbQ9z1tZ+LBEChCVnTSYwhVQ0TVD31ISnqKrJMyxSlnu0I3
   tu+MajWrb5RfS3OzdFQapODW2srWG7sgHq9NP3wbQGTrLNjkI3KP1Pemw
   n+Vq5aHhhBjysKpSaJQY6PqtpUHle6hJk099tkOBxocRNgz0Xm5BHC7DV
   iubW+wpblTyWlEffvwWFvTbT0978MVCMsRc8rkBL+bl5WHtPxabPV00ht
   MdgtAkTqy33MebIazPp7EgoLXvo00F+F5Ql6BroQ/O/2rS0nJ3pk1inln
   uZsl5IueK/5nCMyjBDstVQUo9hiSPROZfQ8fwbCg8KF05fs6CmjzV/FLm
   w==;
X-CSE-ConnectionGUID: F0FnNGp3StWaJkYFrHs9ww==
X-CSE-MsgGUID: PHG/D+CzTFWEJTrtJdhHTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="239231284"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="239231284"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:40:13 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4CFD942A31A
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:13 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id E3B4B1804164
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 6B9AF405ECF;
	Tue, 19 May 2026 11:40:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/38] python3-mdit-py-plugins: upgrade 0.6.0 -> 0.6.1
Date: Tue, 19 May 2026 19:39:02 +0800
Message-ID: <20260519113921.655-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127081

From: Wang Mingyu <wangmy@fujitsu.com>

FIX: Nested field lists incorrectly nesting inside parent containers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...dit-py-plugins_0.6.0.bb => python3-mdit-py-plugins_0.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mdit-py-plugins_0.6.0.bb => python3-mdit-py-plugins_0.6.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.6.0.bb b/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.6.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.6.1.bb
index 779f618311..28a55725a8 100644
--- a/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mdit-py-plugins_0.6.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/executablebooks/mdit-py-plugins"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a38a1697260a7ad7bf29f44b362db1fc"
 
-SRC_URI[sha256sum] = "2436f14a7295837ac9228a36feeabda867c4abc488c8d019ad5c0bda88eee040"
+SRC_URI[sha256sum] = "a2bca0f039f39dbd35fb74ae1b5f998608c437463371f0ff7f49a19a17a114d0"
 
 inherit pypi python_flit_core
 
-- 
2.43.0


